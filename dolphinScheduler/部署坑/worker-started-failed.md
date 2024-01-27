
The last packet sent successfully to the server was 0 milliseconds ago. The driver has not received any packets from the server.
at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)
at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:62)
at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
at java.lang.reflect.Constructor.newInstance(Constructor.java:423)
at com.mysql.cj.exceptions.ExceptionFactory.createException(ExceptionFactory.java:61)
at com.mysql.cj.exceptions.ExceptionFactory.createException(ExceptionFactory.java:105)
at com.mysql.cj.exceptions.ExceptionFactory.createException(ExceptionFactory.java:151)
at com.mysql.cj.exceptions.ExceptionFactory.createCommunicationsException(ExceptionFactory.java:167)
at com.mysql.cj.protocol.a.NativeProtocol.negotiateSSLConnection(NativeProtocol.java:361)
at com.mysql.cj.protocol.a.NativeAuthenticationProvider.negotiateSSLConnection(NativeAuthenticationProvider.java:777)
at com.mysql.cj.protocol.a.NativeAuthenticationProvider.proceedHandshakeWithPluggableAuthentication(NativeAuthenticationProvider.java:486)
at com.mysql.cj.protocol.a.NativeAuthenticationProvider.connect(NativeAuthenticationProvider.java:202)
at com.mysql.cj.protocol.a.NativeProtocol.connect(NativeProtocol.java:1452)
at com.mysql.cj.NativeSession.connect(NativeSession.java:165)
at com.mysql.cj.jdbc.ConnectionImpl.connectOneTryOnly(ConnectionImpl.java:955)
at com.mysql.cj.jdbc.ConnectionImpl.createNewIO(ConnectionImpl.java:825)
... 100 common frames omitted
Caused by: javax.net.ssl.SSLHandshakeException: No appropriate protocol (protocol is disabled or cipher suites are inappropriate)
at sun.security.ssl.HandshakeContext.<init>(HandshakeContext.java:171)
at sun.security.ssl.ClientHandshakeContext.<init>(ClientHandshakeContext.java:103)
at sun.security.ssl.TransportContext.kickstart(TransportContext.java:220)
at sun.security.ssl.SSLSocketImpl.startHandshake(SSLSocketImpl.java:428)
at com.mysql.cj.protocol.ExportControlled.performTlsHandshake(ExportControlled.java:316)
at com.mysql.cj.protocol.StandardSocketFactory.performTlsHandshake(StandardSocketFactory.java:188)
at com.mysql.cj.protocol.a.NativeSocketConnection.performTlsHandshake(NativeSocketConnection.java:99)
at com.mysql.cj.protocol.a.NativeProtocol.negotiateSSLConnection(NativeProtocol.java:352)


vim worker-server/conf/application.yaml
# Override by profile

---
spring:
  config:
    activate:
     on-profile: mysql
  datasource:
    driver-class-name: com.mysql.cj.jdbc.Driver
    url: jdbc:mysql://192.168.100.16:3306/dolphinscheduler?useUnicode=true&characterEncoding=UTF-8&useSSL=false
    username: root
    password: 123456