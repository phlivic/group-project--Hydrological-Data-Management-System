package com.waterManageSystem.Service.impl;

import com.waterManageSystem.Bean.Operate;
import com.waterManageSystem.DAO.impl.OperateDaoImpl;
import com.waterManageSystem.Service.OperateService;

import java.util.List;

public class OperateServiceImpl implements OperateService {

    @Override
    public List<Operate> findAllOperates() throws Exception {
        OperateDaoImpl operateDao = new OperateDaoImpl();
        return operateDao.findAllOperates();
    }

    @Override
    public boolean addOperates(Operate operates) throws Exception {
        OperateDaoImpl operateDao = new OperateDaoImpl();
        return operateDao.addOperates(operates);
    }

    @Override
    public boolean deleteOperates(Operate operates) throws Exception {
        OperateDaoImpl operateDao = new OperateDaoImpl();
        return operateDao.deleteOperates(operates);
    }
}
