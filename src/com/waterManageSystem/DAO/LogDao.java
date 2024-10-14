package com.waterManageSystem.DAO;

import com.waterManageSystem.Bean.Log;

import java.util.List;

public interface LogDao {
    // 查询所有日志信息
    public List<Log> findAllLogs() throws Exception;

    // 添加日志
    public boolean addLog(Log log) throws Exception;

    public Log getCurrentLogByUserID(String userID) throws Exception;

    // 修改日志
    public boolean updateLog(Log log) throws Exception;

    // 删除日志
    public boolean deleteLog(String logID) throws Exception;
}
