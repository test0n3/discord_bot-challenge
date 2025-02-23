package com.alura_alumni.reto01.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1")
public class MessageController {

  @GetMapping("/messages")
  public String getMessages() {
    return "Hello, world!";
  }
}
