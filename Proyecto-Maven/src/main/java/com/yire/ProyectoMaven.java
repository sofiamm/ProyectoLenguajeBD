package com.yire;

//import com.SAD.service.FilesStorageService;
import javax.annotation.Resource;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;

@SpringBootApplication
public class ProyectoMaven {

    public static void main(String[] args) {
        SpringApplication.run(ProyectoMaven.class, args);
    }

    public void run(String... arg) throws Exception {
//        storageService.deleteAll();
//        storageService.init();
    }
}
