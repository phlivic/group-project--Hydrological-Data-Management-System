package com.waterManageSystem.Service.impl;

import com.waterManageSystem.Bean.Dictionary.DIC_Base;
import com.waterManageSystem.DAO.DictionaryDao;
import com.waterManageSystem.DAO.impl.DictionaryDaoImpl;
import com.waterManageSystem.Service.DictionaryService;

import java.util.List;

public class DictionaryServiceImpl implements DictionaryService {
    @Override
    public List<DIC_Base> getDicByName(String dicName) throws Exception {
        DictionaryDao dictionaryDao = new DictionaryDaoImpl();
        return dictionaryDao.getDicByName(dicName);
    }
}
