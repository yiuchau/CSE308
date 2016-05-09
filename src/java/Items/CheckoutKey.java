/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Items;

import java.io.Serializable;
import javax.persistence.Embeddable;
import javax.persistence.Id;

/**
 *
 * @author yixxie
 */
public class CheckoutKey {
    @Id
    private String isbn;
    @Id
    private String userName;
    public CheckoutKey(){
    }
    public CheckoutKey(String isbn,String userName){
        this.isbn=isbn;
        this.userName=userName;
    }
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
    @Override
    public boolean equals(Object obj) {
    if (obj == this)
      return true;
    if (!(obj instanceof CheckoutKey))
      return false;
    CheckoutKey pk = (CheckoutKey) obj;
    if (!isbn.equals(pk.isbn))
      return false;
    if (!userName.equals(pk.userName))
      return false;
    return true;
  }

    @Override
  public int hashCode() {
    return userName.hashCode() + Integer.parseInt(isbn) ;
  }
}
