package com.waterManageSystem.Service;

import com.waterManageSystem.Bean.Dictionary.DIC_Base;

import java.util.List;

public interface DictionaryService {
    public List<DIC_Base> getDicByName(String dicName) throws Exception;
}
