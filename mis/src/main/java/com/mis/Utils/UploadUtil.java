package com.mis.Utils;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;


/**
 * Created by admin on 2016/9/27.
 */
public class UploadUtil {

    private static final Logger log = LoggerFactory.getLogger(UploadUtil.class);

    private static SimpleDateFormat fullSdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
    private static SimpleDateFormat folder = new SimpleDateFormat("yyyy" + File.separator + "MM" + File.separator + "dd");

    /**
     * 返回yyyy File.separator MM File.separator dd格式的字符串
     *
     * @return
     */
    public static String getFolder() {
        return folder.format(new Date());
    }

    /**
     * 文件上传
     *
     * @param srcName
     *            原文件名
     * @param dirName
     *            目录名
     * @param input
     *            要保存的输入流
     *
     * @return 返回要保存到数据库中的路径
     */
    public static String writeFile(String srcName, String dirName, InputStream input,String picdir) throws IOException {

        log.info(srcName);

        // 取出上传的目录，此目录是tomcat的server.xml中配置的虚拟目录
        String uploadDir =picdir;//设置你上传路径

        // 取出虚拟目录的访问路径
//        String virtualDir ="E:/Project/mis/img";//设置你虚拟目录访问路径


        // 重命名文件
        if (null != srcName) {
            srcName = srcName.substring(srcName.indexOf("."));

        } else {
            srcName = ".jpg";
        }
        String filename = "";
        // 得到要上传的文件路径
        filename = uploadDir + File.separator + dirName + File.separator + fullSdf.format(new Date()) + srcName;

        // 得到将要保存到数据中的路径
        String savePath = picdir+filename.replace(uploadDir, "");
        String responPath = "img"+filename.replace(uploadDir, "");
        responPath = responPath.replace("\\", "/");
        System.out.println("123:"+savePath);
//        savePath = virtualDir + savePath.replace("\\", "/");

        File file = new File(filename);
        if (!file.getParentFile().exists()) {
            file.getParentFile().mkdirs();
        }
        FileOutputStream fos = new FileOutputStream(file);
        // 一次30kb
        byte[] readBuff = new byte[1024 * 30];
        int count = -1;
        while ((count = input.read(readBuff, 0, readBuff.length)) != -1) {
            fos.write(readBuff, 0, count);
        }
        fos.flush();
        fos.close();
        input.close();
        System.out.println(savePath);
        System.out.println(responPath);
        return responPath;
    }
}