package com.xx.edu.mapper;

import com.xx.edu.mapper.base.IBaseMapper;
import com.xx.edu.model.Match;

import java.util.List;

public interface AdminMapper extends IBaseMapper<Match> {
    public List<Match> getUnderReviewMatchs();
    public List<Match> getOnTheMarchMatchs();
    public List<Match> getFinishedMatchs();
}
