package com.xx.edu.service;

import com.xx.edu.model.Match;
import com.xx.edu.service.base.IBaseService;

import java.util.List;

public interface IAdminService extends IBaseService<Match> {
    public List<Match> getUnderReviewMatchs();
    public List<Match> getOnTheMarchMatchs();
    public List<Match> getFinishedMatchs();
}
