package com.waterManageSystem.Bean;

public class Operate {
    // 用户名
    private String userName;
    // 修改时间
    private String updateTime;
    // 修改区域
    private String tableName;
    // 修改前
    private String oldID;
    // 修改后
    private String newID;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public String getOldID() {
        return oldID;
    }

    public void setOldID(String oldID) {
        this.oldID = oldID;
    }

    public String getNewID() {
        return newID;
    }

    public void setNewID(String newID) {
        this.newID = newID;
    }

    @Override
    public String toString() {
        return "Operate{" +
                "userName='" + userName + '\'' +
                ", updateTime='" + updateTime + '\'' +
                ", tableName='" + tableName + '\'' +
                ", oldID='" + oldID + '\'' +
                ", newID='" + newID + '\'' +
                '}';
    }
}
