package com.house.kh.homeBoard.model.vo;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
 
import lombok.Data;
 
@Entity
@Data
public class Article {
    
    @Id
    @GeneratedValue
    int id;
    String subject;
    
    @Column(length = 100000000)
    String content;
    
    Date regDate;
}
