/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package store.models;

/**
 *
 * @author lakho
 */
public class CategoryDTO {
    private int categoryID;
    private String name;

    public CategoryDTO() {
    }

    public CategoryDTO(int categoryID, String name) {
        this.categoryID = categoryID;
        this.name = name;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "CaterogyDTO{" + "categoryID=" + categoryID + ", name=" + name + '}';
    }
    
}
