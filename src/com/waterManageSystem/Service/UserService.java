package com.waterManageSystem.Service;

import com.waterManageSystem.Bean.User;

import java.util.List;

public interface UserService {
    // 查询所有用户信息
    public List<User> findAllUsers() throws Exception;

    // 用户登录
    public User login(User user) throws Exception;

    // 用户登出
    public boolean logout(String userID) throws Exception;

    // 增加用户
    public boolean addUser(User user) throws Exception;

    // 修改用户
    public boolean updateUser(User user) throws Exception;

    // 删除用户
    public boolean deleteUser(String userID) throws Exception;
}
