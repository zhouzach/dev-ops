
    val aggStream = timeStream
      .keyBy(0)
      .window(TumblingProcessingTimeWindows.of(Time.days(1), Time.hours(-8)))
      .trigger(ContinuousProcessingTimeTrigger.of(Time.seconds(1)))
      .aggregate(new AccumulativeForDayAggregate,new DayResultProcessWindowFunction())

Error:(80, 8) overloaded method value aggregate with alternatives:


https://www.coder.work/article/2845940


问题是keyBy中使用的KeySelector与ProcessWindowFunction中指定的键类型之间不匹配。您已使用Tuple2中的索引指定了键，
因此，编译器无法推断键将为字符串。在这种情况下，Flink将密钥作为元组传递。

有两种方法可以解决此问题。如果按原样保留keyBy，则需要修改ProcessWindowFunction以将Tuple用作键类型，并且如果要使用它，则必须将键强制转换为String。
类似于((Tuple1<String>)key).f0。更好的解决方案是使用更明确的键选择器，例如keyBy(t -> t.f0)，以便在编译时将键称为字符串。

法1：
class DayResultProcessWindowFunction extends ProcessWindowFunction[DayResult, WindowDayResult, Tuple, TimeWindow] {

  def process(key: Tuple, context: Context, elements: Iterable[DayResult], out: Collector[WindowDayResult]) = {
    val startWindow = context.window.getStart
    val endWindow = context.window.getEnd
    val dayResult = elements.iterator.next()
    out.collect(WindowDayResult(startWindow,endWindow,dayResult.category,dayResult.cnt))
  }
}

法2：
val aggStream = timeStream
      .keyBy(f => f.category)
      //      .window(TumblingProcessingTimeWindows.of(Time.days(1), Time.hours(-8)))
      .window(TumblingProcessingTimeWindows.of(Time.minutes(1)))
      .trigger(ContinuousProcessingTimeTrigger.of(Time.seconds(2)))
      .aggregate(new AccumulativeForDayAggregate, new DayResultProcessWindowFunction())
      .setParallelism(2)
      .name("aggregate_Stream").uid("aggregate_Stream")

