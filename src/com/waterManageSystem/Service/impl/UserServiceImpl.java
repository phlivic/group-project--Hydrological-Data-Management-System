package com.waterManageSystem.Service.impl;

import com.waterManageSystem.Bean.Log;
import com.waterManageSystem.Bean.User;
import com.waterManageSystem.DAO.LogDao;
import com.waterManageSystem.DAO.UserDao;
import com.waterManageSystem.DAO.impl.LogDaoImpl;
import com.waterManageSystem.DAO.impl.UserDaoImpl;
import com.waterManageSystem.Service.UserService;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

public class UserServiceImpl implements UserService {
    @Override
    public List<User> findAllUsers() throws Exception {
        try {
            UserDaoImpl udi = new UserDaoImpl();
            return udi.findAllUsers();
        }catch (SQLException e){
            System.out.println("Sql查找所有用户异常"+e.getMessage());
            return null;
        }
    }

    @Override
    public User login(User user) throws Exception {
        try {
            UserDao userDao = new UserDaoImpl();
            User loginUser = userDao.login(user);
            System.out.println(loginUser);
            // 生成登录日志
            if(loginUser!=null)
            {
                Log log = new Log();
                log.setUserID(loginUser.getUserID());
                log.setUserName(loginUser.getUserName());
                log.setLoginTime(new Date());
                log.setLogID(Long.toString(new Date().getTime()));
                LogDao logDao = new LogDaoImpl();
                logDao.addLog(log);
            }
            return loginUser;
        }catch (SQLException e){
            System.out.println("Sql获取登录用户异常"+e.getMessage());
            return null;
        }
    }

    @Override
    public boolean logout(String userID) throws Exception {
        LogDao logDao = new LogDaoImpl();
        Log curLog = logDao.getCurrentLogByUserID(userID);
        if(curLog!=null)
        {
            if(curLog.getLogoutTime()==null)
            {
                curLog.setLogoutTime(new Date());
                return logDao.updateLog(curLog);
            }
        }
        return false;
    }

    @Override
    public boolean addUser(User user) throws Exception {
        try {
            UserDaoImpl udi = new UserDaoImpl();
            return udi.addUser(user);
        }catch (SQLException e){
            System.out.println("Sql增加用户异常"+e.getMessage());
            return false;
        }
    }

    @Override
    public boolean updateUser(User user) throws Exception {
        try {
            UserDaoImpl userDao = new UserDaoImpl();
            return userDao.updateUser(user);
        }catch (SQLException e){
            System.out.println("Sql修改用户异常"+e.getMessage());
            return false;
        }
    }

    @Override
    public boolean deleteUser(String userID) throws Exception {
        try {
            UserDaoImpl udi = new UserDaoImpl();
            return udi.deleteUser(userID);
        }catch (SQLException e){
            System.out.println("Sql删除用户异常"+e.getMessage());
            return false;
        }
    }
}
