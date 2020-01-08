https://juejin.im/post/5b8d2a5551882542ba1ddcf8

Minor GC 是俗称，新生代(新生代分为一个 Eden区和两个Survivor区)的垃圾收集叫做 Minor GC。
当发生 Minor GC时，Eden 区和 from 指向的 Survivor 区中的存活对象会被复制(此处采用标记 - 复制算法)到 to 指向的 Survivor区中，
然后交换 from 和 to指针，以保证下一次 Minor GC时，to 指向的 Survivor区还是空的。

Survivor区对象晋升位老年代对象的条件

Java虚拟机会记录 Survivor区中的对象一共被来回复制了几次。如果一个对象被复制的次数为 15 (对应虚拟机参数 -XX:+MaxTenuringThreshold),
那么该对象将被晋升为至老年代，(至于为什么是 15次，原因是 HotSpot会在对象头的中的标记字段里记录年龄，分配到的空间只有4位，所以最多只能记录到15)。
另外，如果单个 Survivor 区已经被占用了 50% (对应虚拟机参数: -XX:TargetSurvivorRatio)，那么较高复制次数的对象也会被晋升至老年代。

当Survivor区的部分对象晋升到老年代后，老年代的占用量通常会升高。
注意：
在Minor GC过程中，Survivor 可能不足以容纳Eden和另一个Survivor中的存活对象。如果Survivor中的存活对象溢出，多余的对象将被移到老年代，
这称为过早提升(Premature Promotion)，这会导致老年代中短期存活对象的增长，可能会引发严重的性能问题。再进一步说，在Minor GC过程中，
如果老年代满了而无法容纳更多的对象，Minor GC 之后通常就会进行Full GC,这将导致遍历整个Java堆，这称为提升失败(Promotion Failure)。

