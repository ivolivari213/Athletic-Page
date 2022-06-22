package com.example.project3;
import java.io.Serializable;

public class Select implements Serializable{

    private int opcion;
    private String name;
    public int getOption(){
        return opcion;
    }

    public void setOption(int newoption){
        opcion = newoption;
    }

    public Select (int op){
        opcion=op;
    }

    public Select (String newname){
        this.name = newname;
    }

    public void setName(String newname){
        this.name = newname;
    }

    public String getName(){
        return name;
    }


    public Select (String newname,int op){
        this.name = newname;
        this.opcion = op;
    }

}
