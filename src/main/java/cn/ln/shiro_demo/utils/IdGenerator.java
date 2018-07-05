package cn.ln.shiro_demo.utils;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class IdGenerator {

    private static IdGenerator instance = new IdGenerator();
    private DateFormat df = new SimpleDateFormat("yyyyMMddHHmmssSSS");

    private SnowflakeIdWorker snowflakeIdWorker = new SnowflakeIdWorker(1,1);

    public static IdGenerator getInstance() {
        return instance;
    }

    public String generateId() {
        long[] id = snowflakeIdWorker.nextId();
        StringBuffer buffer = new StringBuffer(30);
        buffer.append(df.format(id[0]));
        buffer.append(String.valueOf(id[1]));
        return buffer.toString();
    }

}
