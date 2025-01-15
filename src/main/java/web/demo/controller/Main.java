package web.demo.controller;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class Main {

  @RequestMapping("/")
  public String home() {
    return "Hello Docker World";
  }

} 