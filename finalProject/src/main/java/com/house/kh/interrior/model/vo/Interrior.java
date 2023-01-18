package com.house.kh.interrior.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Interrior {
	
    private int interNo;
    private int selNo;
    private String selBusName;
    private String interTitle;
    private String interContent;
    private String interMainimgOri;
    private String interMainimgChange;
    private String interImgOri;
    private String interImgChange;
    private Date interDate;
    private int interCount;
    private int interLike;
    private String interHome;
    private String interFamily;
    
	
}
