
https://blog.csdn.net/a97654/article/details/125299483

问题：
因为spring加载静态方法比IOC早，所以不能直接使用@Value注解读取yml配置，读取结果往往是null。

解决方法：
1、使用@Value注解读取yml配置。
2、设置静态成员变量用来接收@Value注入的值。
3、使用@PostConstruct注解用于静态变量赋值。

@Service
public class TencentInterfaceAdapter {
@Value("${ocr.expDateValue:长期}")
private String expDateValue;
@Value("${ocr.expDateMapping:29991231}")
private String expDateMapping;

    private static String recExpDateValue;
    private static String recExpDateMapping;

    @PostConstruct
    public void setExpDate() {
        recExpDateValue = this.expDateValue;
        recExpDateMapping = this.expDateMapping;
    }

    public static String testDemo() {
        return recExpDateValue + recExpDateMapping;
    }

}
