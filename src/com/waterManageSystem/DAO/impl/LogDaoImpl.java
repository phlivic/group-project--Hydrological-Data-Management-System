package com.waterManageSystem.DAO.impl;

import com.waterManageSystem.Bean.Log;
import com.waterManageSystem.DAO.LogDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class LogDaoImpl implements LogDao {
    @Override
    public List<Log> findAllLogs() throws Exception {
        Connection conn = BaseDao.getConnection();
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        String sql = "SELECT * FROM RZGL"; // USR为日志表名
        ResultSet rs = stmt.executeQuery(sql);

        List<Log> logs = new ArrayList<>();
        while (rs.next()) {
            Log log = new Log();
            log.setUserID(rs.getString("UCODE"));
            log.setUserName(rs.getString("FRGRDNM"));
            log.setLoginTime(new java.util.Date(rs.getTimestamp("INTM").getTime()));
            if(rs.getTimestamp("OUTTM")!=null)
            {
                log.setLogoutTime(new java.util.Date(rs.getTimestamp("OUTTM").getTime()));
            }
            log.setLogID(rs.getString("UID"));
            log.setNote(rs.getString("NT"));
            logs.add(log);
        }
        BaseDao.closeAll(conn, stmt, rs);
        return logs;
    }

    @Override
    public boolean addLog(Log log) throws Exception {
        System.out.println(log);
        Connection conn = BaseDao.getConnection();
        String sql = "INSERT INTO RZGL VALUES (?, ?, ?, ?, ?, ?)"; // RZGL为日志表名

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, log.getUserID());
        ps.setString(2, log.getUserName());
        ps.setTimestamp(3, new java.sql.Timestamp(log.getLoginTime().getTime()));
        if(log.getLogoutTime()!=null)
        {
            ps.setTimestamp(4, new java.sql.Timestamp(log.getLogoutTime().getTime()));
        }
        else{
            ps.setTimestamp(4,null);
        }
        ps.setString(5, log.getLogID());
        ps.setString(6,log.getNote());

        int rows = ps.executeUpdate();
        BaseDao.closeAll(conn, ps);
        if(rows<=0){
            return false;
        }
        return true;
    }

    @Override
    public Log getCurrentLogByUserID(String userID) throws Exception {
        Connection conn = BaseDao.getConnection();
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        String sql = "SELECT * FROM RZGL where UCODE ='"+userID+"'";
        ResultSet rs = stmt.executeQuery(sql);
        Log log = null;

        // 找到登录时间最大的日期
        long maxDateTime = -1;
        while(rs.next())
        {
            if(log==null)
            {
                log=new Log();
            }
            java.sql.Timestamp date = rs.getTimestamp("INTM");
            if(date.getTime() > maxDateTime)
            {
                maxDateTime=date.getTime();
                log.setUserID(rs.getString("UCODE"));
                log.setUserName(rs.getString("FRGRDNM"));
                log.setLoginTime(new java.util.Date(date.getTime()));
                if(rs.getTimestamp("OUTTM")!=null)
                {
                    log.setLogoutTime(new java.util.Date(rs.getTimestamp("OUTTM").getTime()));
                }
                else
                {
                    log.setLogoutTime(null);
                }
                log.setLogID(rs.getString("UID"));
                log.setNote(rs.getString("NT"));
            }
        }
        return log;
    }

    @Override
    public boolean updateLog(Log log) throws Exception {
        Connection conn = BaseDao.getConnection();
        String sql = "UPDATE RZGL SET UCODE = ?, FRGRDNM = ?,INTM = ?, OUTTM = ?, NT = ? WHERE UID = ?"; // 注意对应关系
        PreparedStatement ps = conn.prepareStatement(sql);

        ps.setString(1,log.getUserID());
        ps.setString(2,log.getUserName());
        ps.setTimestamp(3,new java.sql.Timestamp(log.getLoginTime().getTime()));
        ps.setTimestamp(4,new java.sql.Timestamp(log.getLogoutTime().getTime()));
        System.out.println(new java.sql.Timestamp(log.getLogoutTime().getTime()));
        ps.setString(5,log.getNote());
        ps.setString(6,log.getLogID());

        int rows = ps.executeUpdate(); // 执行SQL语句，并返回受影响的行数
        BaseDao.closeAll(conn,ps);
        if (rows < 0) {
            return false;
        }
        return true;
    }

    @Override
    public boolean deleteLog(String logID) throws Exception {
        Connection conn = BaseDao.getConnection();
        String sql = "DELETE FROM RZGL WHERE UID = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1,logID);

        int rows = ps.executeUpdate(); // 执行SQL语句，并返回受影响的行数
        BaseDao.closeAll(conn, ps);
        if (rows <= 0) {
            return false;
        }
        return true;
    }
}
