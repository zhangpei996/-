package com.school.alipay;

import org.springframework.stereotype.Component;

public class AlipayConfig {
    // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
    public static String app_id = "2016101700709401";

    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCHnTjwoJuX4hn2iH/QzN129qLU2bLkoVAyVvLTUDSRMbvbkPHg/ue0CNjQZV2wQVk8BtlrRHxg3LfCgNqxt/bGAeW8Yu0hC2mqgj9Tn4RHXi+1jNPHkOU92wwKafIg30/ZRRfHhFrHaWHrqBEE6mS1jqL4n/U9CxS1dK2eJ/zS1EXHnah+j90+s1B+nQKO2Ygwpgh0bFVYJZUGUL2H+Y2fqQ8ATFGTTAY12fFa/rtR9yjEFzy1BK0NFdbq0CunzePT/o2NCY3qTEZoz1dnKu6jJfGiNnvdO3YC/gwS2PTkwrazjxOZweWjTcXzQCjSWdTUSuNq+3AmD52NyK4F+sTXAgMBAAECggEAOcwFB3C7v1iKjiqQptGZFWl57lM1zgD+J+YsqWjGbpcOpD47CBQ7ddxLY03ARy0itdWJdhEDHVkULB40lod78dm/KrHStEGj8BqAmMgkXTJEDREO9T/Io7smf421ttLVuhibUNoUwmYkaIYBcuHeuA4pYOLzZufBFLC8ieoq80MIaWUUnzTri3UL2fc40H/rA1KumXkYscz79mAg8+a3f7lbnuacRb1lNAZWqLKjxy90u6vvMEY5RE4TNf3bAChheMs3PR5QvRwdi+8n8pvY/X3KmqrXsPqXUQf18iY2rvBp0bEJdFYiWp6CSWLNgs6peK6xvyWhBM8540ytSaXq0QKBgQDmeQzypykWbqMd8nJM8SChj+zN9QDGuvH6QlxYGz9ONd4i1CQPYrzVP1va1QdWIz/0x4IsbJd+L4ZOr5jppIkKK4wjTzBOC2lm/RVdQ3uuAVongS71B9tut8btsZcFSnFrd5m/1fljKaOFWNwc4JYKlub0VzncaZIRvcWWoS+LnwKBgQCWon919v1irUQNfdTXJVYs2eswpxKYg4Eu232eQmU3WlBEdfk/VgWEhTY72pQ63gMC3iykmvnSY/WocCVLLZdqesTsCh9592xnQupc0RQMbCvJnI6hlszPeHZqWex6mGkGgsDmR7bjKe1MZmT5KwBcouMQVwufiZChoXJKUre7yQKBgQDZB1CsB8FnQFQWVUJRNhd2TGPAJmDOwyguc+MljLL2YT+HKKG0Y1RSs1E6JrS75oHJbT4luzSFPReKbUzfZ3Mswok6js18EL72nohJxMxotRlCbiHb18RI5IJNPphqAQoBGyULQuGPAZzcaysLfmmMG0HtAV6ZMki8sCmqiKqPHQKBgBVznL066EjGLfvR4J6m9Ye7nO+3y0Em8R2wKkqAYBOq6+Vj+5PWd0CxC9EoRpW/iiQ9aZQjcdJRY+mR1u3G11pVk3ed1W+0GZ72+5MuPzGpse6rOfCvHgmpuQtaNQAcdlB0DG5+5f+ht+Z6aoTFZ+7JT5bDHqegmpU5/aGx9/JpAoGBAM94qtzD/4uACaYn3ggcqOauA6YIjp34tGfkT1Sq7POWS9OXBqRzACSmz1RgKE+Jktr0J3mlhDHaVtrF7yKty/c5YgOdmAJJhTsEAtsZgUU9o8X/Lu/D+XbpuPPjawfYLR9eRmIivD5V65xH0Mry865xPIgOrzhjybsicyPMDY+Z";

    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA3Zys98mU+62eJhrBg1+NYfXW5jVELRx33Z+1KxOuebk+WBBlMyHBI8kTcLhDPkVkA8ewXyG/D7pG+tUL93FQsMRNIsg/9VwQmRLhhRe0+sIDlj/ZjhilajdvT676AFaGOf83Gj2ehZGxfZKblbWvtaA6DTxD2kaocN6NxO6kSFnXO/8sqI4VywE3W0dTsoPgkY7bluKhfuqzBd3+fJjm4dhlNMRkBAmgI2E9y4EruMvayoYnavSNseB5bNiKK6cJyPT/Lmon9YNcrSB7eRwRdudXUZ1YzNe+QQGkCAnRf2nGYjedkDlFEz5X6NMfveGdEhW43tXL5Sgff2eV1ylhRQIDAQAB";

    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = " http://qrdfr7.natappfree.cc/web/test002";

    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String return_url = "http://localhost:8989/web/test001";

    // 签名方式
    public static String sign_type = "RSA2";

    // 字符编码格式
    public static String charset = "utf-8";

    // 支付宝网关
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

    // 支付宝网关
    public static String log_path = "C:\\";
}
