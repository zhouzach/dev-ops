
< parent > 标签
    在 parent 标签中我们指定了 geekbang-coupon 项目的“父级依赖”为 spring-boot-starter-parent，
    这样一来，spring-boot-starter-parent 里定义的 Spring Boot 组件版本信息就会被自动带到子模块中。
    这种做法也是大多数 Spring Boot 项目的通用做法，不仅降低了依赖项管理的成本，也不需要担心各个组件间的兼容性问题。

< packaging > 标签maven 的打包类型有三种：jar、war 和 pom。当我们指定 packaging 类型为 pom 时，意味着当前模块是一个“boss”，它只用关注顶层战略，即定义依赖项版本和整合子模块，不包含具体的业务实现。

< dependencymanagement > 标签这个标签的作用和 < parent > 标签类似，两者都是将版本信息向下传递。dependencymanagement 是 boss 们定义顶层战略的地方，
我们可以在这里定义各个依赖项的版本，当子项目需要引入这些依赖项的时候，只用指定 groupId 和 artifactId 即可，不用管 version 里该写哪个版本。


    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>2.4.2</version>
    </parent>
    <groupId>com.geekbang</groupId>
    <artifactId>geekbang-coupon</artifactId>
    <packaging>pom</packaging>
    <version>1.0-SNAPSHOT</version>
    <modules>
        <module>coupon-template-serv</module>
        <module>coupon-calculation-serv</module>
        <module>coupon-customer-serv</module>
        <module>middleware</module>
    </modules>
    <dependencyManagement>
        <dependencies>
            <dependency>
                <groupId>org.apache.commons</groupId>
                <artifactId>commons-lang3</artifactId>
                <version>3.0</version>
            </dependency>
            <!-- 省略部分依赖项 -->
        </dependencies>
    </dependencyManagement>