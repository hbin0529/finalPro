package com.house.kh.homeBoard.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class HomeBoard {
   
   private int boardNo;
   private String memId;
   private String boardMainimgOrigin;
   private String boardMainimgChange;
   private String boardTitle; 
   private String boardDate; 
   private String boardImgOrigin;
   private String boardImgChange; 
   private String boardContent; 
   private int boardCount; 
   private int boardLike; 
   private String homeOption; 
   private String homeFamilyv;
   private String status; 
   private String memEmail;
   private String memNick;
   private String memAddr; 
   private String memImg; 
   
   

}