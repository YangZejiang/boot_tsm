package com.yzj.common.utils;

import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import com.aliyun.oss.model.CopyObjectResult;
import com.aliyun.oss.model.PutObjectRequest;
import org.springframework.web.multipart.MultipartFile;

import javax.mail.Multipart;
import java.io.File;
import java.io.IOException;

public class AliyunOSSClientUtil {

    // Endpoint以杭州为例，其它Region请按实际情况填写。
    String endpoint = "http://oss-cn-shanghai.aliyuncs.com";
    // 阿里云主账号AccessKey拥有所有API的访问权限，风险很高。强烈建议您创建并使用RAM账号进行API访问或日常运维，请登录 https://ram.console.aliyun.com 创建RAM账号。
    String accessKeyId = "";
    String accessKeySecret = "";
    String bucketName = "";
    String PREFIX = "boot_tsm/covers/";

    public String uploadFile(String fileName, MultipartFile file) throws IOException {
        // 创建OSSClient实例。
        OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);

        // 创建PutObjectRequest对象。
        PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, PREFIX + fileName, file.getInputStream());

        // 如果需要上传时设置存储类型与访问权限，请参考以下示例代码。
        // ObjectMetadata metadata = new ObjectMetadata();
        // metadata.setHeader(OSSHeaders.OSS_STORAGE_CLASS, StorageClass.Standard.toString());
        // metadata.setObjectAcl(CannedAccessControlList.Private);
        // putObjectRequest.setMetadata(metadata);

        // 上传文件。
        ossClient.putObject(putObjectRequest);
        System.out.println("文件上传成功！");
        // 关闭OSSClient。
        ossClient.shutdown();
        String url = "https://yangzejiang.oss-cn-shanghai.aliyuncs.com/" + PREFIX + fileName;
        return url;
    }

    public String copyFile(String oldFileName, String newFileName) {
        String sourceBucketName = "yangzejiang";
        String sourceObjectName = PREFIX + oldFileName;
        String destinationBucketName = "yangzejiang";
        String destinationObjectName = PREFIX + newFileName;

        // 创建OSSClient实例。
        OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);
        // 拷贝文件。
        CopyObjectResult result = ossClient.copyObject(sourceBucketName, sourceObjectName, destinationBucketName, destinationObjectName);
        System.out.println("ETag: " + result.getETag() + " LastModified: " + result.getLastModified());

        // 关闭OSSClient。
        ossClient.shutdown();
        String url = "https://yangzejiang.oss-cn-shanghai.aliyuncs.com/" + PREFIX + newFileName;
        return url;
    }
}
