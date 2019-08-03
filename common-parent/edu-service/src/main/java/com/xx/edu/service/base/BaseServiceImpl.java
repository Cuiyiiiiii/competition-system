package com.xx.edu.service.base;

import com.xx.edu.mapper.AdminMapper;
import com.xx.edu.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;

public abstract class BaseServiceImpl<T> implements IBaseService<T> {

    //统一管理dao
    @Autowired
    protected UserMapper userMapper;

    @Autowired
    protected AdminMapper adminMapper;
}
