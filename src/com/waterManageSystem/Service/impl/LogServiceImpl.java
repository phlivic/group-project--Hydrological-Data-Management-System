package com.waterManageSystem.Service.impl;

import com.waterManageSystem.Bean.Log;
import com.waterManageSystem.DAO.impl.LogDaoImpl;
import com.waterManageSystem.Service.LogService;

import java.util.List;

public class LogServiceImpl implements LogService {
    @Override
    public List<Log> findAllLogs() throws Exception {
        LogDaoImpl logDao = new LogDaoImpl();
        return logDao.findAllLogs();
    }

    @Override
    public boolean addLog(Log log) throws Exception {
        LogDaoImpl logDao = new LogDaoImpl();
        return logDao.addLog(log);
    }

    @Override
    public boolean deleteLog(String logID) throws Exception {
        LogDaoImpl logDao = new LogDaoImpl();
        return logDao.deleteLog(logID);
    }
}
