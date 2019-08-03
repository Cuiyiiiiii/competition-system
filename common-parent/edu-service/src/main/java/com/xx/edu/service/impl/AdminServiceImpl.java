package com.xx.edu.service.impl;

import com.xx.edu.model.Match;
import com.xx.edu.service.IAdminService;
import com.xx.edu.service.base.BaseServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("AdminService")
@Transactional
public class AdminServiceImpl extends BaseServiceImpl<Match> implements IAdminService {
    @Override
    public void insert(Match match) {

    }

    @Override
    public void deleteById(Integer id) {

    }

    @Override
    public void deleteByUUId(String id) {

    }

    @Override
    public void update(Match match) {
        adminMapper.update(match);
    }

    @Override
    public Match findById(Integer id) {
        return adminMapper.findById(id);
    }

    @Override
    public Match findByUUId(String id) {
        return null;
    }

    @Override
    public List<Match> getUnderReviewMatchs() {
        return adminMapper.getUnderReviewMatchs();
    }

    @Override
    public List<Match> getOnTheMarchMatchs() {
        return adminMapper.getOnTheMarchMatchs();
    }

    @Override
    public List<Match> getFinishedMatchs() {
        return adminMapper.getFinishedMatchs();
    }
}
