package com.xx.edu.controller;

import com.xx.edu.model.Match;
import com.xx.edu.service.impl.AdminServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;

@Controller
@RequestMapping("admin")
public class AdminController {

    @Autowired
    private AdminServiceImpl adminService;

    @RequestMapping("administrator_page")
    public String administrator_page()
    {
        return "/Administrator/AdministratorPage";
    }


    @RequestMapping("chart_pie_page")
    public String chart_pie_page()
    {
        return "/Administrator/chart_pie";
    }

    @RequestMapping("under_review_page")
    public String under_review_page(HttpServletRequest request, HttpServletResponse response, Model model)
    {
        List<Match> underReviewMatchs = adminService.getUnderReviewMatchs();
        model.addAttribute("underReviewMatchs",underReviewMatchs);

        return "/Administrator/under_review";
    }

    @RequestMapping("on_the_march_page")
    public String on_the_march_page(HttpServletRequest request, HttpServletResponse response, Model model)
    {
        List<Match> onTheMarchMatchs = adminService.getOnTheMarchMatchs();
        model.addAttribute("onTheMarchMatchs",onTheMarchMatchs);

        return "/Administrator/on_the_march";
    }

    @RequestMapping("finished_page")
    public String finished_page(HttpServletRequest request, HttpServletResponse response, Model model)
    {
        List<Match> finishedMatchs = adminService.getFinishedMatchs();
        model.addAttribute("finishedMatchs",finishedMatchs);

        return "/Administrator/finished";
    }

    @RequestMapping("check")
    public String check(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
        int matchID = Integer.parseInt(request.getParameter("matchID"));
        String result = request.getParameter("result");

        Match match =  adminService.findById(matchID);

        if(result.equals("通过"))
        {
            match.setStatus("进行中");
        }
        else {
            match.setStatus("不通过");
        }
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        match.setReleaseTime(df.format(new java.util.Date()));
        adminService.update(match);

        return "/Administrator/under_review";
    }

    @RequestMapping("end")
    public String end(HttpServletRequest request,HttpServletResponse response,Model model){
        int matchID = Integer.parseInt(request.getParameter("matchID"));

        Match match = adminService.findById(matchID);
        match.setStatus("已结束");
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        match.setEndTime(df.format(new java.util.Date()));

        adminService.update(match);

        return "/Administrator/on_the_march";

    }
}
