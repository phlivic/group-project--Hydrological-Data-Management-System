package com.waterManageSystem.Service;

import com.waterManageSystem.Bean.Operate;

import java.util.List;

public interface OperateService {
    // 查询所有操作
    public List<Operate> findAllOperates() throws Exception;

    // 添加操作
    public boolean addOperates(Operate operates) throws Exception;

    // 删除操作
    public boolean deleteOperates(Operate operates) throws Exception;
}
