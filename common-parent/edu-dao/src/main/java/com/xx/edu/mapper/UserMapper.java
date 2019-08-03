package com.xx.edu.mapper;

import com.xx.edu.mapper.base.IBaseMapper;
import com.xx.edu.model.*;

import java.util.List;


public interface UserMapper extends IBaseMapper<User> {
    public List<User> getUserListByUserName(String userName);
    public void insertMatch(Match match);
    public List<MatchCategory> getAllMatchCategories();
    public Match findMatchByName(String matchName);
    public Match findMatchByID(int matchID);
    public void updateMatch(Match match);
    public List<Match> getMatchByUserID(int userID);
    public List<Match> findActiveMatch();
    public List<Match> findFinishedMatch();
    public List<Match> findMatchByCategoryID(int categoryID);
    public void insertGroup(Group group);
    public void insertCompetitor(Competitor competitor);
    public List<Group> findGroupByLeader(String leader);
    public User findUserByName(String userName);
    public List<Competitor> findCompetitorsByMatchID(int matchID);
    public void submitWork(Work work);
    public List<Competitor> findCompetitorByUserID(int userID);
    public Work findWorkByGroupID(int groupID);
    public List<Match> getAllMatchs();
    public List<Work> getWorksByMatchID(int matchID);
    public Work findWorkByID(int workID);
    public void mark(Work work);
}
