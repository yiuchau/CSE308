/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Items;

/**
 *
 * @author yiulin
 */
public abstract class Item {
    
    public enum Type {
        Ebook, AudioBook, Movie
    }
    
    Type type;
    Long itemId;
    double averageRating;
    int totalCopies;
    int availableCopies;
       
}
