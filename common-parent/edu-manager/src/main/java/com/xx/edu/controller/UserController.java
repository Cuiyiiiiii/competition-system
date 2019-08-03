package com.xx.edu.controller;

import com.xx.edu.model.*;
import com.xx.edu.service.impl.UserServiceImpl;
import net.sf.json.JSONArray;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.apache.ibatis.io.Resources;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Controller
@RequestMapping("user")
public class UserController {

    @Autowired
    private UserServiceImpl userService;


    //==============page jumps====================
    @RequestMapping("competition_page")
    public String competition_page(HttpServletRequest request, HttpServletResponse response, Model model){
        User currentUser = (User) request.getSession().getAttribute("currentUser");
        model.addAttribute("currentUser",currentUser);

        List<Match> activeMatch = userService.findActiveMatch();
        List<Match> finishedMatch = userService.findFinishedMatch();
        List<Match> photographyMatch = userService.findMatchByCategoryID(1);
        List<Match> dataMatch = userService.findMatchByCategoryID(2);

        model.addAttribute("activeMatch",activeMatch);
        model.addAttribute("finishedMatch",finishedMatch);
        model.addAttribute("photographyMatch",photographyMatch);
        model.addAttribute("dataMatch",dataMatch);

        return "/User/CompetitionsPage";
    }

    @RequestMapping("introduction_page")
    public String introduction_page(){
        return "/User/IntroductionPage";
    }

    @RequestMapping("signUp_page")
    public String signUp_page(){
        return "/User/SignUpPage";
    }

    @RequestMapping("signIn_page")
    public String signIn_page(){
        return "/User/SignInPage";
    }

    @RequestMapping("matchDetails_page")
    public String matchDetails_page(HttpServletRequest request, HttpServletResponse response, Model model){
        User currentUser = (User) request.getSession().getAttribute("currentUser");
        model.addAttribute("currentUser",currentUser);

        int matchID = Integer.parseInt(request.getParameter("matchID"));
        Match match = userService.findMatchByID(matchID);
        model.addAttribute("match",match);

        boolean isCompetitor = false;
        List<Competitor> competitors = userService.findCompetitorsByMatchID(matchID);
        if(currentUser != null){
            for (Competitor competitor:competitors) {
                if (competitor.getUserID() == currentUser.getUserID()){
                    isCompetitor = true;
                }
            }
        }
        model.addAttribute("isCompetitor",isCompetitor);

        if(currentUser != null)
        {
            List<Competitor> competitorList = userService.findCompetitorByUserID(currentUser.getUserID());
            for (Competitor competitor:competitorList){
                if(competitor.getMatchID() == matchID){
                    int groupID = competitor.getGroupID();
                    Work work = userService.findWorkByGroupID(groupID);
                    model.addAttribute("work",work);
                    break;
                }
            }
        }

        return "/User/MatchDetailsPage";
    }

    @RequestMapping("userBaseInfo_page")
    public String userBaseInfo_page(){
        return "/User/UserBaseInfoPage";
    }

    @RequestMapping("matchRelease_page")
    public String matchRelease_page(HttpServletRequest request, HttpServletResponse response, Model model){
        User currentUser = (User) request.getSession().getAttribute("currentUser");
        model.addAttribute("currentUser",currentUser);

        List<MatchCategory> matchCategoryList = userService.getAllMatchCategories();
        model.addAttribute("matchCategoryList",matchCategoryList);

        return "/User/MatchReleasePage";
    }

    @RequestMapping("application_page")
    public String application_page(HttpServletRequest request,HttpServletResponse response,Model model){
        User currentUser = (User) request.getSession().getAttribute("currentUser");
        model.addAttribute("currentUser",currentUser);

        int matchID = Integer.parseInt(request.getParameter("matchID"));
        Match match = userService.findMatchByID(matchID);
        model.addAttribute("match",match);


        return "/User/ApplicationPage";
    }

    @RequestMapping("userChangePassword_page")
    public String userChangePassword_page(){
        return "/User/UserChangePasswordPage";
    }

    @RequestMapping("userReleaseList_page")
    public String userReleaseList_page(HttpServletRequest request,HttpServletResponse response,Model model){
        User currentUser = (User) request.getSession().getAttribute("currentUser");
        model.addAttribute("currentUser",currentUser);

        List<Match> matchList = userService.getMatchByUserID(currentUser.getUserID());

        model.addAttribute("matchList",matchList);

        return "/User/UserReleaseListPage";
    }

    @RequestMapping("userParticipateList_page")
    public String userParticipateList_page(HttpServletRequest request,HttpServletResponse response,Model model){
        User currentUser = (User) request.getSession().getAttribute("currentUser");

        List<Competitor> competitorList = userService.findCompetitorByUserID(currentUser.getUserID());

        List<Match> matchList = new ArrayList<Match>();
        for (Competitor competitor:competitorList){
            Match match = userService.findMatchByID(competitor.getMatchID());
            matchList.add(match);
        }
        model.addAttribute("matchList",matchList);

        return "/User/UserParticipateListPage";
    }

    @RequestMapping("userJudgeList_page")
    public String userJudgeList_page(HttpServletRequest request,HttpServletResponse response,Model model){
        User currentUser = (User) request.getSession().getAttribute("currentUser");

        List<Match> matchList = userService.getAllMatchs();
        List<Match> IJudgeMatchList = new ArrayList<Match>();
        for(Match match:matchList){
            String[] judges_arr = match.getJudges().split(",");
            for(String judge:judges_arr){
                if(judge.equals(currentUser.getUserName())){
                    IJudgeMatchList.add(match);
                }
            }
        }
        model.addAttribute("IJudgeMatchList",IJudgeMatchList);

        return "/User/UserJudgeListPage";
    }

    @RequestMapping("userJudgeDetails_page")
    public String userJudgeDetails_page(HttpServletRequest request,HttpServletResponse response,Model model){
        int matchID = Integer.parseInt(request.getParameter("matchID"));
        Match match = userService.findMatchByID(matchID);
        model.addAttribute("match",match);

        List<Work> works = userService.getWorksByMatchID(matchID);
        model.addAttribute("works",works);

        return "/User/UserJudgeDetailsPage";
    }

    @RequestMapping("addJudges_page")
    public String addJudges_page(HttpServletRequest request,HttpServletResponse response,Model model) throws UnsupportedEncodingException {
        User currentUser = (User) request.getSession().getAttribute("currentUser");
        model.addAttribute("currentUser",currentUser);
        int matchID = Integer.parseInt(request.getParameter("matchID"));
//        Match match = userService.findMatchByName(matchName);

//        int matchID = match.getMatchID();
        model.addAttribute("matchID",matchID);
        return "/User/AddJudgesPage";
    }

    //===============================================


    //=================logical processing====================
    @RequestMapping("login")
    public String login(HttpServletRequest request,HttpServletResponse response,Model model) throws IOException {
        PrintWriter out = response.getWriter();

        //获取前端账号和密码
        int userID = Integer.parseInt(request.getParameter("userID"));
        String password = request.getParameter("password");

        //从数据库调取该账号
        User user = userService.findById(userID);

        //进行身份验证
        if(user != null){//该账号存在
            if(user.getPassword().equals(password)){
                //存Session
                if(!user.getUserName().equals("admin")){
                    user.setIdentity("user");
                }else {
                    user.setIdentity("admin");
                }
                model.addAttribute("currentUser",user);
                request.getSession().setAttribute("currentUser",user);
                return "/User/IntroductionPage";
            }else {
                out.write("<script language='javascript'>");
                out.write("alert('密码错误！');");
                out.write("history.back(-1)");
                out.write("</script>");
            }
        }else{//该账号不存在
            out.write("<script language='javascript'>");
            out.write("alert('账户不存在！');");
            out.write("history.back(-1)");
            out.write("</script>");
        }

        return "/User/IntroductionPage";
    }

    @RequestMapping("logout")
    public String logout(HttpServletRequest request,HttpServletResponse response){
        request.getSession().invalidate();
        return "/User/IntroductionPage";
    }

    @RequestMapping("register")
    public void register(HttpServletRequest request,HttpServletResponse response,Model model) throws IOException {
        PrintWriter out = response.getWriter();

        //从前端获取注册信息
        int randomUserID = Integer.parseInt(generateUserId(8));
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String grade = request.getParameter("grade");
        String major = request.getParameter("major");
        String profilePhoto = "defaultProfilePhoto.png";

        User newUser = new User();
        newUser.setUserID(randomUserID);
        newUser.setUserName(userName);
        newUser.setPassword(password);
        newUser.setGrade(grade);
        newUser.setMajor(major);
        newUser.setProfilePhoto(profilePhoto);

        userService.insert(newUser);

        //返回注册的账号
        out.write("<script language='javascript'>");
        out.write("alert(\"账号:" + randomUserID + "\");");
        out.write("window.location.href='signIn_page'");
        out.write("</script>");
    }

    @RequestMapping("update")
    public void update(HttpServletRequest request,HttpServletResponse response,Model model) throws Exception {
        User editUser = (User)request.getSession().getAttribute("currentUser");

        if (ServletFileUpload.isMultipartContent(request)) {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload servletFileUpload = new ServletFileUpload(factory);
            List<FileItem> items = servletFileUpload.parseRequest(request);

            //遍历取出字段
            for (FileItem item : items) {
                String itemName = item.getFieldName();
                if (item.isFormField()) {
                    switch (itemName) {
                        case "userName":
                            editUser.setUserName(item.getString("utf-8"));
                            break;
                        case "grade":
                            editUser.setGrade(item.getString("utf-8"));
                            break;
                        case "major":
                            editUser.setMajor(item.getString("utf-8"));
                            break;
                        default:
                            break;
                    }
                } else {
                    String fileName = item.getName();
                    if (!fileName.equals("")) {
                        String path = "D:\\Workspaces\\Java Workspace\\competition system\\profilePhotos";
                        File file = new File(path,fileName);
                        item.write(file);
                        editUser.setProfilePhoto(fileName);
                    }
                }
            }
            userService.update(editUser);
        }

        //刷新当前页面
        response.sendRedirect("userBaseInfo_page");
    }

    @RequestMapping("changePassword")
    public void changePassword(HttpServletRequest request,HttpServletResponse response,Model model) throws IOException {
        PrintWriter out = response.getWriter();

        User currentUser = (User) request.getSession().getAttribute("currentUser");

        //从前端获取新信息
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String alignNewPassword = request.getParameter("alignNewPassword");

        if (currentUser.getPassword().equals(oldPassword)) {
            if (!newPassword.equals(alignNewPassword)) {
                System.out.println("password is not align.");
                out.write("<script language='javascript'>");
                out.write("alert('密码不匹配');");
                out.write("history.back(-1)");
                out.write("</script>");
            } else {
                //修改密码，更新数据库
                currentUser.setPassword(newPassword);
                userService.update(currentUser);
                out.write("<script language='javascript'>");
                out.write("alert('修改成功！');");
                out.write("history.back(-1)");
                out.write("</script>");
            }
        } else {
            out.write("<script language='javascript'>");
            out.write("alert('原密码错误！');");
            out.write("history.back(-1)");
            out.write("</script>");
        }
    }

    @RequestMapping("releaseMatch")
    public void releaseMatch(HttpServletRequest request,HttpServletResponse response,Model model) throws Exception {
        PrintWriter out = response.getWriter();

        User currentUser = (User) request.getSession().getAttribute("currentUser");

        //从前端获取注册信息
        String matchName = request.getParameter("txt_match_name");
        String overview = request.getParameter("textarea_match_description");
        String arrangement = request.getParameter("textarea_match_arrangement");
        String prize = request.getParameter("textarea_match_prize");
        int organizer = currentUser.getUserID();
        String categoryID = request.getParameter("category");

        Match newMatch = new Match();

        newMatch.setParticipant("全体在校学生");
        newMatch.setMatchName(matchName);
        newMatch.setOverview(overview);
        newMatch.setArrangement(arrangement);
        newMatch.setPrize(prize);
        newMatch.setOrganizer(organizer);
        newMatch.setCategoryID(Integer.parseInt(categoryID));
        newMatch.setStatus("待审核");
        newMatch.setPicture("default.jpg");
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        newMatch.setApplyTime(df.format(new java.util.Date()));

        userService.insertMatch(newMatch);

        int matchID =  userService.findMatchByName(matchName).getMatchID();

        response.sendRedirect("addJudges_page?matchID=" + matchID );
    }

    @RequestMapping("addJudge")
    public void addJudge(HttpServletRequest request,HttpServletResponse response,Model model) throws UnsupportedEncodingException {
        int matchID = Integer.parseInt(request.getParameter("matchID"));
        String judges = request.getParameter("judges");
        judges = judges.substring(9);

        Match match = userService.findMatchByID(matchID);
        match.setJudges(judges);
        userService.updateMatch(match);
    }

    @RequestMapping("searchUser")
    public void searchUser(HttpServletRequest request,HttpServletResponse response,Model model) throws IOException {
        String userName = request.getParameter("userName");

        List<User> userList = userService.getUserListByUserName(userName);

        for(User user:userList){
            System.out.println(user.getUserName());
        }

        JSONArray jsonArray = JSONArray.fromObject(userList);
        String jsonStr = jsonArray.toString();
        response.getWriter().println(jsonStr);
    }

    @RequestMapping("teamUp")
    public void teamUp(HttpServletRequest request,HttpServletResponse response,Model model) throws IOException {
        int matchID = Integer.parseInt(request.getParameter("matchID"));

        String leader = request.getParameter("leader");
        String teammates = request.getParameter("teammates").substring(9);

        Group group = new Group();
        group.setLeader(leader);
        group.setUserList(teammates);
        group.setMatchID(matchID);

        userService.insertGroup(group);

        Group theGroup = new Group();
        List<Group> groupList = userService.findGroupByLeader(leader);
        for(Group aGroup:groupList){
            if(aGroup.getMatchID() == matchID){
                theGroup = aGroup;
                break;
            }
        }

        Competitor leader_competitor = new Competitor();
        leader_competitor.setUserID(userService.findUserByName(leader).getUserID());
        leader_competitor.setMatchID(matchID);
        leader_competitor.setGroupID(theGroup.getGroupID());
        userService.insertCompetitor(leader_competitor);

        String[] teammates_arr = teammates.split(",");
        for (String teammate:teammates_arr) {
            Competitor competitor = new Competitor();
            competitor.setGroupID(theGroup.getGroupID());
            competitor.setMatchID(matchID);
            competitor.setUserID(userService.findUserByName(teammate).getUserID());
            userService.insertCompetitor(competitor);
        }

        response.sendRedirect("competition_page");
    }

    @RequestMapping("submitWork")
    public void submitWork(HttpServletRequest request,HttpServletResponse response,Model model) throws Exception {
        User currentUser = (User) request.getSession().getAttribute("currentUser");
        Work work = new Work();

//        work.setGroupID(userService.findCompetitorByUserID(currentUser.getUserID()).getGroupID());

        if (ServletFileUpload.isMultipartContent(request)) {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload servletFileUpload = new ServletFileUpload(factory);
            List<FileItem> items = servletFileUpload.parseRequest(request);

            //遍历取出字段
            for (FileItem item : items) {
                String itemName = item.getFieldName();
                if (item.isFormField()) {
                    switch (itemName) {
                        case "message":
                            work.setMessage(item.getString("utf-8"));
                            break;
                        case "matchID":
                            work.setMatchID(Integer.parseInt(item.getString("utf-8")));
                            break;
                    }
                } else {
                    String fileName = item.getName();
                    if (!fileName.equals("")) {
                        String path = "D:\\Workspaces\\Java Workspace\\competition system\\works";
                        File file = new File(path,fileName);
                        item.write(file);
                        work.setContent(fileName);
                    }
                }
            }

            List<Competitor> competitorList = userService.findCompetitorByUserID(currentUser.getUserID());
            for (Competitor competitor:competitorList){
                if(competitor.getMatchID() == work.getMatchID()){
                    work.setGroupID(competitor.getGroupID());
                    break;
                }
            }

            userService.submitWork(work);
        }
        PrintWriter out = response.getWriter();
        out.write("<script language='javascript'>");
        out.write("history.back(-1)");
        out.write("</script>");
}

    @RequestMapping("download")
    public void download(HttpServletRequest request,HttpServletResponse response,Model model) throws IOException {
        String filename = request.getParameter("filename");
        response.setHeader("content-Type","application/octet-stream");
        response.setHeader("content-Disposition","attachment;filename=" + filename);

        InputStream in = new FileInputStream("D:\\Workspaces\\Java Workspace\\competition system\\works\\"+filename);

        ServletOutputStream out = response.getOutputStream();
        byte[] bs = new byte[10];
        int len = -1;
        while ((len=in.read(bs)) != -1){
            out.write(bs,0,len);
        }
        out.close();
        in.close();
    }

    @RequestMapping("mark")
    public void mark(HttpServletRequest request,HttpServletResponse response,Model model) throws IOException {
        int workID = Integer.parseInt(request.getParameter("workID").trim());
        int score = Integer.parseInt(request.getParameter("score").trim());

        Work work = userService.findWorkByID(workID);

        work.setScore(score);
        userService.mark(work);

        PrintWriter out = response.getWriter();

    }

    //===================functional function=========================
    private static String generateUserId(int count) {
        StringBuffer sb = new StringBuffer();
        String str = "0123456789";
        Random r = new Random();
        for (int i = 0; i < count; i++) {
            int num = r.nextInt(str.length());
            sb.append(str.charAt(num));
            str = str.replace((str.charAt(num) + ""), "");
        }
        return sb.toString();
    }
}
