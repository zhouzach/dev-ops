
Caused by: org.apache.calcite.plan.RelOptPlanner$CannotPlanException: There are not enough rules to produce a node with desired properties: convention=BATCH_PHYSICAL, FlinkRelDistributionTraitDef=any, sort=[].

改成流模式
EnvironmentSettings.newInstance().useBlinkPlanner().inStreamingMode().build()