/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Items;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author yixxie
 */
@Entity
@Table(name = "Recommended")
@IdClass(RecommendedKey.class)
public class RecommendedList implements Serializable {
    
    @Id
    private String isbn;
    @Id
    private String userName;
    @Temporal(TemporalType.TIMESTAMP)
    private Date recommendedTime;
    private String checkOutType; //email or automatic
    private String email;
    private String status;//approved, dismiss or wait. default is wait

    public String getIsbn(){
        return isbn;
    }
    public void setIsbn(String isbn){
        this.isbn=isbn;
    }
    public String getUserName(){
        return userName;
    }
    public void setUserName(String userName){
        this.userName=userName;
    }
     public Date getRecommendedTime(){
        return recommendedTime;
    }
    public void setRecommendedTime(Date recommendedTime){
        this.recommendedTime=recommendedTime;
    }
    public String getCheckOutType(){
        return checkOutType;
    }
    public void setCheckOutType(String checkOutType){
        this.checkOutType=checkOutType;
    }
    public String getEmail(){
        return email;
    }
    public void setEmail(String email){
        this.email=email;
    }
    public String getStatus(){
        return status;
    }
    public void setStatus(String status){
        this.status=status;
    }
    
}
