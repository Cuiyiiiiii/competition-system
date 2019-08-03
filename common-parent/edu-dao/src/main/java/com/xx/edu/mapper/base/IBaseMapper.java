package com.xx.edu.mapper.base;


public interface IBaseMapper<T> {

    public void insert(T t);
    public void deleteById(Integer id);
    public void deleteByUUId(String id);
    public void update(T t);
    public T findById(Integer id);
    public T findByUUId(String id);
}
