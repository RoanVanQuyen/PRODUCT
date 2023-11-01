package dataBase;

import java.lang.reflect.Array;
import java.util.ArrayList;

public interface DAOinterface <T>{

    public ArrayList<T> select() ;
    public T selectById(T t) ;
    public void insert(T t);
    public void insertAll(ArrayList<T> t) ;
    public void delete(T t) ;
    public void update(T t) ;
}
