package com.waterManageSystem.DAO;

import com.waterManageSystem.Bean.Dictionary.DIC_Base;

import java.util.List;

public interface DictionaryDao {
    public List<DIC_Base> getDicByName(String dicName) throws Exception;

    public boolean updateDicByName(String dicName, DIC_Base dic) throws Exception;

}
