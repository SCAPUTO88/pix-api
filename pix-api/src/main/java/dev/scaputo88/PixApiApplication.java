package dev.scaputo88;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = "dev.scaputo88.pix")
public class PixApiApplication {

    public static void main(String[] args) {
        SpringApplication.run(PixApiApplication.class, args);
    }
}
