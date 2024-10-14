package com.waterManageSystem.Service;

import com.waterManageSystem.Bean.Log;

import java.util.List;

public interface LogService {
    // 查询所有日志信息
    public List<Log> findAllLogs() throws Exception;

    // 添加日志
    public boolean addLog(Log log) throws Exception;

    // 删除日志
    public boolean deleteLog(String logID) throws Exception;
}
