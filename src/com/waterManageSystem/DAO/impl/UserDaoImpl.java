package com.waterManageSystem.DAO.impl;

import com.sun.xml.internal.ws.api.model.wsdl.WSDLOutput;
import com.waterManageSystem.Bean.User;
import com.waterManageSystem.DAO.UserDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserDaoImpl implements UserDao {

    @Override
    public List<User> findAllUsers() throws Exception {
        Connection conn = BaseDao.getConnection();
        Statement stmt= conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        String sql = "SELECT * FROM USR"; // USR为用户表名
        ResultSet rs = stmt.executeQuery(sql);
        List<User> users = new ArrayList<>();
        while(rs.next())
        {
            User user = new User();
            user.setUserID(rs.getString("UCODE")); // 注意对应数据表列名
            user.setUserName(rs.getString("UNAME"));
            user.setPassword(rs.getString("UPWD"));
            user.setAffiliation(rs.getString("AG"));
            user.setNote(rs.getString("NT"));

            String roleCode = rs.getString("ROLECD");
            Statement stmt1= conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            String sql1 = "SELECT ROLENM FROM ROLE_INFO WHERE ROLECD='" + roleCode + "'";
            ResultSet rs1 = stmt1.executeQuery(sql1);
            if(rs1.first())
            {
                user.setUserRole(rs1.getString("ROLENM"));
            }
            rs1.close();
            stmt1.close();
            users.add(user);
        }
        BaseDao.closeAll(conn, stmt, rs);
        return users;
    }

    @Override
    public User login(User user) throws Exception {
        Connection conn = BaseDao.getConnection();
        String name = user.getUserName();
        String sql = "SELECT * FROM USR where UNAME = '" + name + "'";
        Statement stmt= conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = stmt.executeQuery(sql);
        if(!rs.first()){
            return null;
        }else {
            String realPassword = rs.getString("UPWD");
            if(!realPassword.equals(user.getPassword()))
            {
                return null;
            }
            user.setUserID(rs.getString("UCODE")); // 注意对应关系
            user.setAffiliation(rs.getString("AG"));
            user.setNote(rs.getString("NT"));

            String roleCode = rs.getString("ROLECD");
            String sql1 = "SELECT ROLENM FROM ROLE_INFO WHERE ROLECD='" + roleCode + "'";
            ResultSet rs1 = stmt.executeQuery(sql1);

            if(rs1.first())
            {
                user.setUserRole(rs1.getString("ROLENM"));

            }
            rs1.close();
        }
        BaseDao.closeAll(conn, stmt, rs);
        return user;
    }

    @Override
    public boolean addUser(User user) throws Exception {
        Connection conn = BaseDao.getConnection();
        String sql = "INSERT INTO USR VALUES (?, ?, ?, ?, ?, ?)"; // USR为用户表名
        PreparedStatement ps = conn.prepareStatement(sql);
        Statement stmt= conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        // 注意对应位置关系
        ps.setString(1, user.getUserID());
        ps.setString(2,user.getUserName());
        ps.setString(3,user.getPassword());

        String userRole = user.getUserRole();
        //System.out.println("userRole:"+userRole);
        String sql1 = "SELECT ROLECD FROM ROLE_INFO WHERE ROLENM='" + userRole + "'";
        ResultSet rs1 = stmt.executeQuery(sql1);
        if(rs1.first())
        {
            ps.setString(4,rs1.getString("ROLECD"));

        }
        rs1.close();

        switch (user.getAffiliation())
        {
            case "sc1":
                ps.setString(5,"河海大学本部");
                break;
            case "sc2":
                ps.setString(5,"河海大学江宁校区");
                break;
            case "sc3":
                ps.setString(5,"河海大学常州校区");
                break;
        }

        ps.setString(6,user.getNote());

        int rows = ps.executeUpdate();
        BaseDao.closeAll(conn, ps);
        if(rows<=0){
            return false;
        }
        return true;
    }

    @Override
    public boolean updateUser(User user) throws Exception {
        Connection conn = BaseDao.getConnection();
        String sql = "UPDATE USR SET UNAME = ?, UPWD = ?,ROLECD = ?, AG = ?, NT = ? WHERE UCODE = ?"; // 注意对应关系
        PreparedStatement ps = conn.prepareStatement(sql);
        String userRole = user.getUserRole();
        ps.setString(1,user.getUserName());
        ps.setString(2,user.getPassword());
        ps.setString(4,user.getAffiliation());
        ps.setString(5,user.getNote());
        ps.setString(6, user.getUserID());

        String sql1 = "SELECT ROLECD FROM ROLE_INFO WHERE ROLENM='" + userRole + "'";
        Statement stmt1= conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        ResultSet rs1 = stmt1.executeQuery(sql1);
        if(rs1.first())
        {
            ps.setString(3,rs1.getString("ROLECD"));

        }
        rs1.close();
        int rows = ps.executeUpdate(); // 执行SQL语句，并返回受影响的行数
        BaseDao.closeAll(conn,ps);
        if (rows < 0) {
            return false;
        }
        return true;
    }

    @Override
    public boolean deleteUser(String userID) throws Exception {

        Connection conn = BaseDao.getConnection();
        String sql = "DELETE FROM USR WHERE UCODE = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1,userID);
        int rows = ps.executeUpdate(); // 执行SQL语句，并返回受影响的行数
        BaseDao.closeAll(conn, ps);
        if (rows <= 0) {
            return false;
        }
        return true;
    }
}
