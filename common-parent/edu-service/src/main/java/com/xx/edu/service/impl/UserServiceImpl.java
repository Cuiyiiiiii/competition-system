package com.xx.edu.service.impl;

import com.xx.edu.model.*;
import com.xx.edu.service.IUserService;
import com.xx.edu.service.base.BaseServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("UserService")
@Transactional
public class UserServiceImpl extends BaseServiceImpl<User> implements IUserService {

    @Override
    public void insert(User user) {
        userMapper.insert(user);
    }

    @Override
    public void deleteById(Integer id) {

    }

    @Override
    public void deleteByUUId(String id) {

    }

    @Override
    public void update(User user) {
        userMapper.update(user);
    }

    @Override
    public User findById(Integer id) {
        return userMapper.findById(id);
    }

    @Override
    public User findByUUId(String id) {
        return null;
    }

    @Override
    public List<User> getUserListByUserName(String userName) {
        return userMapper.getUserListByUserName(userName);
    }

    @Override
    public void insertMatch(Match match) {
        userMapper.insertMatch(match);
    }

    @Override
    public List<MatchCategory> getAllMatchCategories() {
        return userMapper.getAllMatchCategories();
    }

    @Override
    public Match findMatchByName(String matchName) {
        return userMapper.findMatchByName(matchName);
    }

    @Override
    public Match findMatchByID(int matchID) {
        return userMapper.findMatchByID(matchID);
    }

    @Override
    public void updateMatch(Match match) {
        userMapper.updateMatch(match);
    }

    @Override
    public List<Match> getMatchByUserID(int userID) {
        return userMapper.getMatchByUserID(userID);
    }

    @Override
    public List<Match> findActiveMatch() {
        return userMapper.findActiveMatch();
    }

    @Override
    public List<Match> findFinishedMatch() {
        return userMapper.findFinishedMatch();
    }

    @Override
    public List<Match> findMatchByCategoryID(int categoryID) {
        return userMapper.findMatchByCategoryID(categoryID);
    }

    @Override
    public void insertGroup(Group group) {
        userMapper.insertGroup(group);
    }

    @Override
    public void insertCompetitor(Competitor competitor) {
        userMapper.insertCompetitor(competitor);
    }

    @Override
    public List<Group> findGroupByLeader(String leader) {
        return userMapper.findGroupByLeader(leader);
    }

    @Override
    public User findUserByName(String userName) {
        return userMapper.findUserByName(userName);
    }

    @Override
    public List<Competitor> findCompetitorsByMatchID(int matchID) {
        return userMapper.findCompetitorsByMatchID(matchID);
    }

    @Override
    public void submitWork(Work work) {
        userMapper.submitWork(work);
    }

    @Override
    public List<Competitor> findCompetitorByUserID(int userID) {
        return userMapper.findCompetitorByUserID(userID);
    }

    @Override
    public Work findWorkByGroupID(int groupID) {
        return userMapper.findWorkByGroupID(groupID);
    }

    @Override
    public List<Match> getAllMatchs() {
        return userMapper.getAllMatchs();
    }

    @Override
    public List<Work> getWorksByMatchID(int matchID) {
        return userMapper.getWorksByMatchID(matchID);
    }

    @Override
    public Work findWorkByID(int workID) {
        return userMapper.findWorkByID(workID);
    }

    @Override
    public void mark(Work work) {
        userMapper.mark(work);
    }
}
