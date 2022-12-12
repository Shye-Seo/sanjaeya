package com.service.unix.aws;

import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.SdkClientException;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.amazonaws.services.s3.model.DeleteObjectsRequest;
import com.amazonaws.services.s3.model.DeleteObjectsRequest.KeyVersion;
import com.amazonaws.services.s3.model.DeleteObjectsResult;
import com.amazonaws.services.s3.model.GetObjectRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.S3Object;
import com.amazonaws.services.s3.model.S3ObjectInputStream;
import com.amazonaws.util.IOUtils;
import com.service.unix.boardService.BoardService;

import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
public class AwsS3Service {

	@Value("AKIASM4TE7FUPG22NRSE")
    private String accessKey;

    @Value("fp2R9Ux9x+tTSx5A7i+nGfHbqCAN8C+r5N5aJt8X")
    private String secretKey;

    @Value("sanjaeya")
    private String bucket;

    @Value("ap-northeast-2")
    private String region;
    
    @Value("board-files")
    private String boardFolder;
    
    @Value("library-files")
    private String libraryFolder;

    private final AmazonS3 s3Client;
    
    @Autowired
    BoardService service;
    
    @PostConstruct
    public AmazonS3Client amazonS3Client() {
        BasicAWSCredentials awsCreds = new BasicAWSCredentials(accessKey, secretKey);
        return (AmazonS3Client) AmazonS3ClientBuilder.standard()
                .withRegion(region)
                .withCredentials(new AWSStaticCredentialsProvider(awsCreds))
                .build();
    }

    public List<String> upload_board(List<MultipartFile> multipartFile) {
    	Calendar cal = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmm");
        String time = dateFormat.format(cal.getTime());
        
        List<String> fileNameList = new ArrayList<>();

        // forEach 구문을 통해 multipartFile로 넘어온 파일들 하나씩 fileNameList에 추가
        for (MultipartFile file : multipartFile) {
            String fileName = time + "-" +file.getOriginalFilename();
            System.out.println("-----------");
            System.out.println("파일명 : " + file.getOriginalFilename());
            
            ObjectMetadata objectMetadata = new ObjectMetadata();
            objectMetadata.setContentLength(file.getSize());
            objectMetadata.setContentType(file.getContentType());

            try(InputStream inputStream = file.getInputStream()) {
                s3Client.putObject(new PutObjectRequest(bucket+"/"+boardFolder, fileName, inputStream, objectMetadata)
                        .withCannedAcl(CannedAccessControlList.PublicRead));
                fileNameList.add(s3Client.getUrl(bucket, fileName).toString());
            } catch(IOException e) {
                throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, "파일 업로드에 실패했습니다.");
            }
            
            fileNameList.add(fileName);
        }
        return fileNameList;
    }
    
    public List<String> upload_library(List<MultipartFile> multipartFile) {
    	Calendar cal = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmm");
        String time = dateFormat.format(cal.getTime());
        
        List<String> fileNameList = new ArrayList<>();

        // forEach 구문을 통해 multipartFile로 넘어온 파일들 하나씩 fileNameList에 추가
        for (MultipartFile file : multipartFile) {
            String fileName = time + "-" +file.getOriginalFilename();
            System.out.println("-----------");
            System.out.println("파일명 : " + file.getOriginalFilename());
            
            ObjectMetadata objectMetadata = new ObjectMetadata();
            objectMetadata.setContentLength(file.getSize());
            objectMetadata.setContentType(file.getContentType());

            try(InputStream inputStream = file.getInputStream()) {
                s3Client.putObject(new PutObjectRequest(bucket+"/"+libraryFolder, fileName, inputStream, objectMetadata)
                        .withCannedAcl(CannedAccessControlList.PublicRead));
                fileNameList.add(s3Client.getUrl(bucket, fileName).toString());
            } catch(IOException e) {
                throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, "파일 업로드에 실패했습니다.");
            }
            
            fileNameList.add(fileName);
        }
        return fileNameList;
    }
    
    public ResponseEntity<byte[]> getObject_board(String storedFileName) throws IOException {
        S3Object o = s3Client.getObject(new GetObjectRequest(bucket+"/"+boardFolder, storedFileName));
        S3ObjectInputStream objectInputStream = ((S3Object) o).getObjectContent();
        byte[] bytes = IOUtils.toByteArray(objectInputStream);
 
        String fileName = URLEncoder.encode(storedFileName, "UTF-8").replaceAll("\\+", "%20").replaceAll("\\[", "%5B").replaceAll("\\]", "%5D");
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        httpHeaders.setContentLength(bytes.length);
        httpHeaders.setContentDispositionFormData("attachment", fileName);
 
        return new ResponseEntity<>(bytes, httpHeaders, HttpStatus.OK);
    }
    
    public ResponseEntity<byte[]> getObject_library(String storedFileName) throws IOException {
        S3Object o = s3Client.getObject(new GetObjectRequest(bucket+"/"+libraryFolder, storedFileName));
        S3ObjectInputStream objectInputStream = ((S3Object) o).getObjectContent();
        byte[] bytes = IOUtils.toByteArray(objectInputStream);
        String fileName = URLEncoder.encode(storedFileName, "UTF-8").replaceAll("\\+", "%20").replaceAll("\\[", "%5B").replaceAll("\\]", "%5D");
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        httpHeaders.setContentLength(bytes.length);
        httpHeaders.setContentDispositionFormData("attachment", fileName);
 
        return new ResponseEntity<>(bytes, httpHeaders, HttpStatus.OK);
    }
    
    public void delete_s3Board(String fileName) {
    	s3Client.deleteObject(new DeleteObjectRequest(bucket+"/"+boardFolder, fileName));
    }
    
    public void delete_s3Library(String fileName) {
    	s3Client.deleteObject(new DeleteObjectRequest(bucket+"/"+libraryFolder, fileName));
    }
}
