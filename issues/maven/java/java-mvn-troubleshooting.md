

**  Failed to execute goal org.apache.maven.plugins:maven-compiler-plugin:3.1:compile (default-compile) on project java-starter: Compilation failure: Compilation failure: 
   [ERROR] 不再支持源选项 5。请使用 7 或更高版本。
   [ERROR] 不再支持目标选项 5。请使用 7 或更高版本。**
   
    <properties>
           <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
           <maven.compiler.source>1.8</maven.compiler.source>
           <maven.compiler.target>1.8</maven.compiler.target>
     </properties>