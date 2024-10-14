package com.waterManageSystem.DAO.impl;

import com.waterManageSystem.Bean.Dictionary.*;
import com.waterManageSystem.DAO.DictionaryDao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DictionaryDaoImpl implements DictionaryDao {
    @Override
    public List<DIC_Base> getDicByName(String dicName) throws Exception {

        List<DIC_Base> dicList = new ArrayList<>();
        Connection conn = BaseDao.getConnection();
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

        // 1: 表名
        if (dicName.equals("AWSCD")) {
            String sql = "SELECT * FROM AWSCD";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                DIC_AWSCD dic = new DIC_AWSCD();
                dic.setWID(rs.getString("WID"));
                dic.setBSHN(rs.getString("BSHN"));
                dic.setBSHNCD(rs.getString("BSHNCD"));
                dic.setHN(rs.getString("HN"));
                dicList.add(dic);
            }
            rs.close();

        }
        // 2:
        else if (dicName.equals("CZCLFS")) {
            String sql = "SELECT * FROM CZCLFS";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                DIC_CZCLFS dic = new DIC_CZCLFS();
                dic.setSTCD(rs.getString("STCD"));
                dic.setLDJDDD(rs.getString("LDJDDD"));
                dic.setLDSY(rs.getString("LDSY"));
                dic.setLDLCDX(rs.getString("LDLCDX"));
                dic.setCCJD(rs.getString("CCJD"));
                dic.setCCFJD(rs.getString("CCFJD"));
                dic.setQC(rs.getString("QC"));
                dic.setSGJZW(rs.getString("SGJZW"));
                dic.setADCP(rs.getString("ADCP"));

                dicList.add(dic);
            }
            rs.close();
        }
        // 3:
        else if (dicName.equals("CZCYXM_SWEI")) {
            String sql = "SELECT * FROM CZCYXM_SWEI";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                DIC_CZCYXM_SWEI dic = new DIC_CZCYXM_SWEI();
                dic.setSTCD(rs.getString("STCD"));
                dic.setSWEI(rs.getString("SWEI"));
                dic.setCW(rs.getString("CW"));
                dic.setJS(rs.getString("JS"));
                dic.setZF(rs.getString("ZF"));
                dic.setBJ(rs.getString("BJ"));
                dic.setSZ(rs.getString("SZ"));
                dic.setSWEN(rs.getString("SWEN"));
                dic.setBQ(rs.getString("BQ"));
                dic.setFZQX(rs.getString("FZQX"));
                dic.setDXS(rs.getString("DXS"));
                dic.setSQ(rs.getString("SQ"));
                dic.setSWDC(rs.getString("SWDC"));

                dicList.add(dic);
            }
            rs.close();
        }
        // 4:
        else if (dicName.equals("CZCYXM_SWEN")) {
            String sql = "SELECT * FROM CZCYXM_SWEN";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                DIC_CZCYXM_SWEN dic = new DIC_CZCYXM_SWEN();
                dic.setSTCD(rs.getString("STCD"));
                dic.setCW(rs.getString("CW"));
                dic.setJS(rs.getString("JS"));
                dic.setZF(rs.getString("ZF"));
                dic.setBJ(rs.getString("BJ"));
                dic.setSZ(rs.getString("SZ"));
                dic.setXYZ(rs.getString("XYZ"));
                dic.setTYZ(rs.getString("TYZ"));
                dic.setHCZ(rs.getString("HCZ"));
                dic.setKF(rs.getString("KF"));
                dic.setSW(rs.getString("SW"));
                dic.setBQ(rs.getString("BQ"));
                dic.setFZQX(rs.getString("FZQX"));
                dic.setDXS(rs.getString("DXS"));
                dic.setSQ(rs.getString("SQ"));
                dic.setSWDC(rs.getString("SWDC"));

                dicList.add(dic);
            }
            rs.close();
        }
        // 5:
        else if (dicName.equals("CZCYXM_YL")) {
            String sql = "SELECT * FROM CZCYXM_YL";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                DIC_CZCYXM_YL dic = new DIC_CZCYXM_YL();
                dic.setSTCD(rs.getString("STCD"));
                dic.setJS(rs.getString("JS"));
                dic.setZF(rs.getString("ZF"));
                dic.setJSSZ(rs.getString("JSSZ"));
                dic.setFZQX(rs.getString("FZQX"));
                dic.setSQ(rs.getString("SQ"));

                dicList.add(dic);
            }
            rs.close();
        }
        // 6:
        else if (dicName.equals("CZDLWZ")) {
            String sql = "SELECT * FROM CZDLWZ";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                DIC_CZDLWZ dic = new DIC_CZDLWZ();
                dic.setSTCD(rs.getString("STCD"));
                dic.setSADR_S(rs.getString("SADR_S"));
                dic.setSADR_Q(rs.getString("SADR_Q"));
                dic.setSADR_X(rs.getString("SADR_X"));
                dic.setSADR_Z(rs.getString("SADR_Z"));
                dic.setSADR_JD(rs.getString("SADR_JD"));
                if (rs.getBigDecimal("LGTD_D") != null) {
                    dic.setLGTD_D(rs.getBigDecimal("LGTD_D").toString());
                }
                if (rs.getBigDecimal("LGTD_F") != null) {
                    dic.setLGTD_F(rs.getBigDecimal("LGTD_F").toString());
                }
                if (rs.getBigDecimal("LGTD_M") != null) {
                    dic.setLGTD_M(rs.getBigDecimal("LGTD_M").toString());
                }
                if (rs.getBigDecimal("LTTD_D") != null) {
                    dic.setLTTD_D(rs.getBigDecimal("LTTD_D").toString());
                }
                if (rs.getBigDecimal("LTTD_F") != null) {
                    dic.setLTTD_F(rs.getBigDecimal("LTTD_F").toString());
                }
                if (rs.getBigDecimal("LTTD_M") != null) {
                    dic.setLTTD_M(rs.getBigDecimal("LTTD_M").toString());
                }
                if (rs.getBigDecimal("DTNEL") != null) {
                    dic.setDTNEL(rs.getBigDecimal("DTNEL").toString());
                }
                dic.setBASICALPLANE(rs.getString("BASICALPLANE"));
                if (rs.getBigDecimal("BPXZZ") != null) {
                    dic.setBPXZZ(rs.getBigDecimal("BPXZZ").toString());
                }

                dicList.add(dic);
            }
            rs.close();
        }
        // 7:
        else if (dicName.equals("CZDW")) {
            String sql = "SELECT * FROM CZDW";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                DIC_CZDW dic = new DIC_CZDW();
                dic.setSTCD(rs.getString("STCD"));
                dic.setJSDW(rs.getString("JSDW"));
                dic.setGLDW(rs.getString("GLDW"));
                dic.setKCD(rs.getString("KCD"));
                dic.setXZQDM(rs.getString("XZQDM"));

                dicList.add(dic);
            }
            rs.close();
        }
        // 8:
        else if (dicName.equals("CZDW_YL")) {
            String sql = "SELECT * FROM CZDW_YL";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                DIC_CZDW_YL dic = new DIC_CZDW_YL();
                dic.setSTCD(rs.getString("STCD"));
                dic.setGLDW(rs.getString("GLDW"));

                dicList.add(dic);
            }
            rs.close();
        }
        // 9:
        else if (dicName.equals("CZGC")) {
            String sql = "SELECT * FROM CZGC";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                DIC_CZGC dic = new DIC_CZGC();
                dic.setSTCD(rs.getString("STCD"));
                dic.setFDS(rs.getString("FDS"));
                dic.setHXS(rs.getString("HXS"));
                dic.setYLQ(rs.getString("YLQ"));

                dicList.add(dic);
            }
            rs.close();
        }
        // 10:
        else if (dicName.equals("CZGLFS_SWEI")) {
            String sql = "SELECT * FROM CZGLFS_SWEI";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                DIC_CZGLFS_SWEI dic = new DIC_CZGLFS_SWEI();
                dic.setSTCD(rs.getString("STCD"));
                dic.setCNZC(rs.getString("CNZC"));
                dic.setXQZC(rs.getString("XQZC"));
                dic.setXC(rs.getString("XC"));
                dic.setWT(rs.getString("WT"));

                dicList.add(dic);
            }
            rs.close();
        }
        // 11:
        else if (dicName.equals("CZGLFS_SWEN")) {
            String sql = "SELECT * FROM CZGLFS_SWEN";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                DIC_CZGLFS_SWEN dic = new DIC_CZGLFS_SWEN();
                dic.setSTCD(rs.getString("STCD"));
                dic.setCNZC(rs.getString("CNZC"));
                dic.setXQZC(rs.getString("XQZC"));
                dic.setXC(rs.getString("XC"));
                dic.setWT(rs.getString("WT"));
                dic.setZDJH(rs.getString("ZDJH"));

                dicList.add(dic);
            }
            rs.close();
        }
        // 12:
        else if (dicName.equals("CZGLFS_YL")) {
            String sql = "SELECT * FROM CZGLFS_YL";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                DIC_CZGLFS_YL dic = new DIC_CZGLFS_YL();
                dic.setSTCD(rs.getString("STCD"));
                dic.setWT(rs.getString("WT"));

                dicList.add(dic);
            }
            rs.close();
        }
        // 13:
        else if (dicName.equals("CZSWGC")) {
            String sql = "SELECT * FROM CZSWGC";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                DIC_CZSWGC dic = new DIC_CZSWGC();
                dic.setSTCD(rs.getString("STCD"));
                dic.setFZ(rs.getString("FZ"));
                dic.setCSB(rs.getString("CSB"));
                dic.setYLS(rs.getString("YLS"));
                dic.setDZSC(rs.getString("DZSC"));
                dic.setSC(rs.getString("SC"));
                dic.setQT(rs.getString("QT"));

                dicList.add(dic);
            }
            rs.close();
        }
        // 14:
        else if (dicName.equals("CZSWTZ_SWEI")) {
            String sql = "SELECT * FROM CZSWTZ_SWEI";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                DIC_CZSWTZ_SWEI dic = new DIC_CZSWTZ_SWEI();
                dic.setSTCD(rs.getString("STCD"));
                dic.setZGSW(rs.getString("ZGSW"));
                dic.setZDLLSJ(rs.getString("ZDLLSJ"));
                dic.setZDSW(rs.getString("ZDSW"));
                dic.setZDSWSJ(rs.getString("ZDSWSJ"));
                dic.setSCHG(rs.getString("SCHG"));
                dic.setPJTS(rs.getString("PJTS"));

                dicList.add(dic);
            }
            rs.close();
        }
        // 15:
        else if (dicName.equals("CZSWTZ_SWEN")) {
            String sql = "SELECT * FROM CZSWTZ_SWEN";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                DIC_CZSWTZ_SWEN dic = new DIC_CZSWTZ_SWEN();
                dic.setSTCD(rs.getString("STCD"));
                dic.setDNPJJLL(rs.getString("DNPJJLL"));
                dic.setZDLL(rs.getString("ZDLL"));
                dic.setZDLLSJ(rs.getString("ZDLLSJ"));
                dic.setZXLL(rs.getString("ZXLL"));
                dic.setZXLLSJ(rs.getString("ZXLLSJ"));

                dicList.add(dic);
            }
            rs.close();
        }
        // 16:
        else if (dicName.equals("CZSYXM")) {
            String sql = "SELECT * FROM CZSYXM";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                DIC_CZSYXM dic = new DIC_CZSYXM();
                dic.setSTCD(rs.getString("STCD"));
                dic.setJL(rs.getString("JL"));
                dic.setZF(rs.getString("ZF"));
                dic.setCYFF(rs.getString("CYFF"));
                dic.setDXS(rs.getString("DXS"));
                dic.setQT(rs.getString("QT"));
                dic.setJJBSWZ(rs.getString("JJBSWZ"));

                dicList.add(dic);
            }
            rs.close();
        }
        // 17:
        else if (dicName.equals("CZXGXX_SWEI")) {
            String sql = "SELECT * FROM CZXGXX_SWEI";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                DIC_CZXGXX_SWEI dic = new DIC_CZXGXX_SWEI();
                dic.setSTCD(rs.getString("STCD"));
                dic.setSZRQY(Integer.toString(rs.getInt("SZRQY")));
                dic.setSZRQM(Integer.toString(rs.getInt("SZRQM")));
                dic.setZLGL_JBZ(Integer.toString(rs.getInt("ZLGL_JBZ")));
                dic.setZLGL_ZXHL(Integer.toString(rs.getInt("ZLGL_ZXHL")));
                dic.setZLGL_SHZH(Integer.toString(rs.getInt("ZLGL_SHZH")));
                dic.setZLGL_QT(Integer.toString(rs.getInt("ZLGL_QT")));
                dic.setCZSX_HDZ(Integer.toString(rs.getInt("CZSX_HDZ")));
                dic.setCZSX_SKZ(Integer.toString(rs.getInt("CZSX_SKZ")));
                dic.setCZSX_HPZ(Integer.toString(rs.getInt("CZSX_HPZ")));
                dic.setCZSX_CWZ(Integer.toString(rs.getInt("CZSX_CWZ")));
                dic.setCZSX_QDZ(Integer.toString(rs.getInt("CZSX_QDZ")));
                dic.setCZSX_QTZ(Integer.toString(rs.getInt("CZSX_QTZ")));
                dic.setPBSQ(rs.getString("PBSQ"));

                dicList.add(dic);
            }
            rs.close();
        }
        // 18:
        else if (dicName.equals("CZXGXX_SWEN")) {
            String sql = "SELECT * FROM CZXGXX_SWEN";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                DIC_CZXGXX_SWEN dic = new DIC_CZXGXX_SWEN();
                dic.setSTCD(rs.getString("STCD"));
                dic.setSZRQY(Integer.toString(rs.getInt("SZRQY")));
                dic.setSZRQM(Integer.toString(rs.getInt("SZRQM")));
                dic.setZLGL_GJZYZ(Integer.toString(rs.getInt("ZLGL_GJZYZ")));
                dic.setZLGL_SJZYZ(Integer.toString(rs.getInt("ZLGL_SJZYZ")));
                dic.setZLGL_YBZ(Integer.toString(rs.getInt("ZLGL_YBZ")));
                dic.setZLGL_ZXHL(Integer.toString(rs.getInt("ZLGL_ZXHL")));
                dic.setZLGL_SHZH(Integer.toString(rs.getInt("ZLGL_SHZH")));
                dic.setZLGL_QT(Integer.toString(rs.getInt("ZLGL_QT")));
                dic.setZLGL_SYZ(Integer.toString(rs.getInt("ZLGL_SYZ")));
                dic.setZLGL_FZZ(Integer.toString(rs.getInt("ZLGL_FZZ")));
                dic.setCZSX_HDZ(Integer.toString(rs.getInt("CZSX_HDZ")));
                dic.setCZSX_SKZ(Integer.toString(rs.getInt("CZSX_SKZ")));
                dic.setCZSX_HPZ(Integer.toString(rs.getInt("CZSX_HPZ")));
                dic.setCZSX_CLLZ(Integer.toString(rs.getInt("CZSX_CLLZ")));
                dic.setCZSX_QDZ(Integer.toString(rs.getInt("CZSX_QDZ")));
                dic.setCZFL_DHKZZ(Integer.toString(rs.getInt("CZFL_DHKZZ")));
                dic.setCZFL_QYDBZ(Integer.toString(rs.getInt("CZFL_QYDBZ")));
                dic.setCZFL_XHZ(Integer.toString(rs.getInt("CZFL_XHZ")));
                dic.setPBSQ(rs.getString("PBSQ"));
                dicList.add(dic);
            }
            rs.close();
        }
        // 19:
        else if (dicName.equals("CZXGXX_YL")) {
            String sql = "SELECT * FROM CZXGXX_YL";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                DIC_CZXGXX_YL dic = new DIC_CZXGXX_YL();
                dic.setSTCD(rs.getString("STCD"));
                dic.setSZRQY(Integer.toString(rs.getInt("SZRQY")));
                dic.setSZRQM(Integer.toString(rs.getInt("SZRQM")));
                dic.setZLGL_JBZ(Integer.toString(rs.getInt("ZLGL_JBZ")));
                dic.setZLGL_ZXHL(Integer.toString(rs.getInt("ZLGL_ZXHL")));
                dic.setZLGL_SHZH(Integer.toString(rs.getInt("ZLGL_SHZH")));
                dic.setZLGL_QT(Integer.toString(rs.getInt("ZLGL_QT")));
                dic.setPBSQ(rs.getString("PBSQ"));
                dicList.add(dic);
            }
            rs.close();
        }
        // 20:
        else if(dicName.equals("CZXXH"))
        {
            String sql = "SELECT * FROM CZXXH";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()){
                DIC_CZXXH dic = new DIC_CZXXH();
                dic.setSTCD(rs.getString("STCD"));
                dic.setSTNM(rs.getString("STNM"));
                dic.setBSHNNM(rs.getString("BSHNNM"));
                dic.setHNNM(rs.getString("HNNM"));
                dic.setHL(rs.getString("HL"));
                if(rs.getBigDecimal("DRAR")!=null)
                {
                    dic.setDRAR(rs.getBigDecimal("DRAR").toString());
                }
                dic.setNT(rs.getString("NT"));
                dicList.add(dic);
            }
            rs.close();
        }
        // 21:
        else if(dicName.equals("CZXXJL"))
        {
            String sql = "SELECT * FROM CZXXJL";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()){
                DIC_CZXXJL dic = new DIC_CZXXJL();
                dic.setSTCD(Integer.toString(rs.getInt("STCD")));
                dic.setZXJC(rs.getString("ZXJC"));
                dic.setRGGD(rs.getString("RGGD"));
                dicList.add(dic);
            }
            rs.close();
        }
        // 22:
        else if(dicName.equals("CZXXJL_SWEI"))
        {
            String sql = "SELECT * FROM CZXXJL_SWEI";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()){
                DIC_CZXXJL_SWEI dic = new DIC_CZXXJL_SWEI();
                dic.setSTCD(Integer.toString(rs.getInt("STCD")));
                dic.setZDCB(rs.getString("ZDCB"));
                dic.setPTZJ(rs.getString("PTZJ"));
                dic.setGTCC(rs.getString("GTCC"));
                dic.setRGGD(rs.getString("RGGD"));
                dicList.add(dic);
            }
            rs.close();
        }
        // 23:
        else if(dicName.equals("CZXXJL_YL"))
        {
            String sql = "SELECT * FROM CZXXJL_YL";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()){
                DIC_CZXXJL_YL dic = new DIC_CZXXJL_YL();
                dic.setSTCD(Integer.toString(rs.getInt("STCD")));
                dic.setZDCB(rs.getString("ZDCB"));
                dic.setPTZJ(rs.getString("PTZJ"));
                dic.setGTCC(rs.getString("GTCC"));
                dic.setRGGD(rs.getString("RGGD"));

                dicList.add(dic);
            }
            rs.close();
        }
        // 24:
        else if(dicName.equals("EvaporateStation"))
        {
            String sql = "SELECT * FROM EvaporateStation";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()){
                DIC_EvaporateStation dic = new DIC_EvaporateStation();
                dic.setSTNM(rs.getString("STNM"));
                dic.setSTCD(rs.getString("STCD"));
                dic.setBSHNCD(rs.getString("BSHNCD"));
                dic.setSETDATEY(rs.getString("SETDATEY"));
                dic.setSETDATEM(rs.getString("SETDATEM"));
                dic.setSLPRV(rs.getString("SLPRV"));
                dic.setSLCT(rs.getString("SLCT"));
                dic.setSLCO(rs.getString("SLCO"));
                dic.setSLTO(rs.getString("SLTO"));
                dic.setSLST(rs.getString("SLST"));
                dic.setAGUN(rs.getString("AGUN"));
                if(rs.getBigDecimal("LGTDD")!=null)
                {
                    dic.setLGTDD(rs.getBigDecimal("LGTDD").toString());
                }
                if(rs.getBigDecimal("LGTDM")!=null)
                {
                    dic.setLGTDM(rs.getBigDecimal("LGTDM").toString());
                }
                if(rs.getBigDecimal("LGTDS")!=null)
                {
                    dic.setLGTDS(rs.getBigDecimal("LGTDS").toString());
                }
                if(rs.getBigDecimal("LTTDD")!=null)
                {
                    dic.setLTTDD(rs.getBigDecimal("LTTDD").toString());
                }
                if(rs.getBigDecimal("LTTDM")!=null)
                {
                    dic.setLTTDM(rs.getBigDecimal("LTTDM").toString());
                }
                if(rs.getBigDecimal("LTTDS")!=null)
                {
                    dic.setLTTDS(rs.getBigDecimal("LTTDS").toString());
                }
                if(rs.getBigDecimal("MYAE")!=null)
                {
                    dic.setMYAE(rs.getBigDecimal("MYAE").toString());
                }
                dic.setEETP(rs.getString("EETP"));
                dic.setTSMD(rs.getString("TSMD"));
                dic.setCHK(rs.getString("CHK"));
                dic.setNT(rs.getString("NT"));

                dicList.add(dic);
            }
            rs.close();
        }
        // 25:
        else if(dicName.equals("EvolutionList"))
        {
            String sql = "SELECT * FROM EvolutionList";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()){
                DIC_EvolutionList dic = new DIC_EvolutionList();
                dic.setSTCD(rs.getString("STCD"));
                dic.setAPAR(rs.getString("APAR"));
                dic.setSWITCHDATEY(rs.getString("SWITCHDATEY"));
                dic.setSWITCHDATEM(rs.getString("SWITCHDATEM"));

                dic.setSSC(Integer.toString(rs.getInt("SSC")));
                dic.setSSR(Integer.toString(rs.getInt("SSR")));
                dic.setSSDT(Integer.toString(rs.getInt("SSDT")));
                dic.setSSRT(Integer.toString(rs.getInt("SSRT")));
                dic.setRP(Integer.toString(rs.getInt("RP")));
                dic.setRI(Integer.toString(rs.getInt("RI")));
                dic.setRO(Integer.toString(rs.getInt("RO")));
                dic.setSMB(Integer.toString(rs.getInt("SMB")));
                dic.setSMS(Integer.toString(rs.getInt("SMS")));
                dic.setSMR(Integer.toString(rs.getInt("SMR")));
                dic.setSAR(Integer.toString(rs.getInt("SAR")));
                dic.setSAA(Integer.toString(rs.getInt("SAA")));
                dic.setSAW(Integer.toString(rs.getInt("SAW")));
                dic.setSAL(Integer.toString(rs.getInt("SAL")));
                dic.setSAT(Integer.toString(rs.getInt("SAT")));

                dic.setSLPRV(rs.getString("SLPRV"));
                dic.setSLCT(rs.getString("SLCT"));
                dic.setSLCO(rs.getString("SLCO"));
                dic.setSLTO(rs.getString("SLTO"));
                dic.setSLST(rs.getString("SLST"));

                if(rs.getBigDecimal("LGTDD")!=null)
                {
                    dic.setLGTDD(rs.getBigDecimal("LGTDD").toString());
                }
                if(rs.getBigDecimal("LGTDM")!=null)
                {
                    dic.setLGTDM(rs.getBigDecimal("LGTDM").toString());
                }
                if(rs.getBigDecimal("LGTDS")!=null)
                {
                    dic.setLGTDS(rs.getBigDecimal("LGTDS").toString());
                }
                if(rs.getBigDecimal("LTTDD")!=null)
                {
                    dic.setLTTDD(rs.getBigDecimal("LTTDD").toString());
                }
                if(rs.getBigDecimal("LTTDM")!=null)
                {
                    dic.setLTTDM(rs.getBigDecimal("LTTDM").toString());
                }
                if(rs.getBigDecimal("LTTDS")!=null)
                {
                    dic.setLTTDS(rs.getBigDecimal("LTTDS").toString());
                }

                dic.setAGUN(rs.getString("AGUN"));
                dic.setNT(rs.getString("NT"));

                dicList.add(dic);
            }
            rs.close();
        }
        // 26:
        else if(dicName.equals("EvolutionSET"))
        {
            String sql = "SELECT * FROM EvolutionSET";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()){
                DIC_EvolutionSET dic = new DIC_EvolutionSET();
                dic.setSTNM(rs.getString("STNM"));
                dic.setSTCD(rs.getString("STCD"));
                dic.setBSHNCD(rs.getString("BSHNCD"));
                dic.setWID(rs.getString("WID"));
                dic.setRVNM(rs.getString("RVNM"));

                if(rs.getBigDecimal("DRAR")!=null)
                {
                    dic.setDRAR(rs.getBigDecimal("DRAR").toString());
                }

                dic.setSETDATEY(rs.getString("SETDATEY"));
                dic.setSETDATEM(rs.getString("SETDATEM"));
                dic.setAPAR(rs.getString("APAR"));

                dic.setSSC(Integer.toString(rs.getInt("SSC")));
                dic.setSSR(Integer.toString(rs.getInt("SSR")));
                dic.setSSDT(Integer.toString(rs.getInt("SSDT")));
                dic.setSSRT(Integer.toString(rs.getInt("SSRT")));
                dic.setRP(Integer.toString(rs.getInt("RP")));
                dic.setRI(Integer.toString(rs.getInt("RI")));
                dic.setRO(Integer.toString(rs.getInt("RO")));
                dic.setSMB(Integer.toString(rs.getInt("SMB")));
                dic.setSMS(Integer.toString(rs.getInt("SMS")));
                dic.setSMR(Integer.toString(rs.getInt("SMR")));
                dic.setSAR(Integer.toString(rs.getInt("SAR")));
                dic.setSAA(Integer.toString(rs.getInt("SAA")));
                dic.setSAW(Integer.toString(rs.getInt("SAW")));
                dic.setSAL(Integer.toString(rs.getInt("SAL")));
                dic.setSAT(Integer.toString(rs.getInt("SAT")));

                dic.setAGUN(rs.getString("AGUN"));
                dic.setNT(rs.getString("NT"));

                dicList.add(dic);
            }
            rs.close();
        }
        // 27:
        else if(dicName.equals("MoistureStation"))
        {
            String sql = "SELECT * FROM MoistureStation";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()){
                DIC_MoistureStation dic = new DIC_MoistureStation();
                dic.setSTNM(rs.getString("STNM"));
                dic.setSTCD(rs.getString("STCD"));
                dic.setBSHNCD(rs.getString("BSHNCD"));
                dic.setSETDATEY(rs.getString("SETDATEY"));
                dic.setSETDATEM(rs.getString("SETDATEM"));
                dic.setSLPRV(rs.getString("SLPRV"));
                dic.setSLCT(rs.getString("SLCT"));
                dic.setSLCO(rs.getString("SLCO"));
                dic.setSLTO(rs.getString("SLTO"));
                dic.setSLST(rs.getString("SLST"));

                if(rs.getBigDecimal("LGTDD")!=null)
                {
                    dic.setLGTDD(rs.getBigDecimal("LGTDD").toString());
                }
                if(rs.getBigDecimal("LGTDM")!=null)
                {
                    dic.setLGTDM(rs.getBigDecimal("LGTDM").toString());
                }
                if(rs.getBigDecimal("LGTDS")!=null)
                {
                    dic.setLGTDS(rs.getBigDecimal("LGTDS").toString());
                }
                if(rs.getBigDecimal("LTTDD")!=null)
                {
                    dic.setLTTDD(rs.getBigDecimal("LTTDD").toString());
                }
                if(rs.getBigDecimal("LTTDM")!=null)
                {
                    dic.setLTTDM(rs.getBigDecimal("LTTDM").toString());
                }
                if(rs.getBigDecimal("LTTDS")!=null)
                {
                    dic.setLTTDS(rs.getBigDecimal("LTTDS").toString());
                }

                dic.setAGUN(rs.getString("AGUN"));
                dic.setNT(rs.getString("NT"));
                dic.setTSMD(rs.getString("TSMD"));

                dicList.add(dic);
            }
            rs.close();
        }
        // 28:
        else if(dicName.equals("StationBasics"))
        {
            String sql = "SELECT * FROM StationBasics";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()){
                DIC_StationBasics dic = new DIC_StationBasics();
                dic.setIID(rs.getString("IID"));
                dic.setSTNM(rs.getString("STNM"));
                dic.setADAGNM(rs.getString("ADAGNM"));
                dic.setLOC(rs.getString("LOC"));
                dic.setWSST(rs.getString("WSST"));
                dic.setRVNM(rs.getString("RVNM"));
                dicList.add(dic);
            }
            rs.close();
        }
        // 29:
        else if(dicName.equals("StationSID"))
        {
            String sql = "SELECT * FROM StationSID";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()){
                DIC_StationSID dic = new DIC_StationSID();
                dic.setSID(rs.getString("SID"));
                dic.setIID(rs.getString("IID"));
                dicList.add(dic);
            }
            rs.close();
        }
        // 30:
        else if(dicName.equals("TZZ"))
        {
            String sql = "SELECT * FROM TZZ";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()){
                DIC_TZZ dic = new DIC_TZZ();
                dic.setSTCD(rs.getString("STCD"));

                if(rs.getBigDecimal("QKGD")!=null)
                {
                    dic.setQKGD(rs.getBigDecimal("QKGD").toString());
                }
                if(rs.getBigDecimal("DNPJJYL")!=null)
                {
                    dic.setDNPJJYL(rs.getBigDecimal("DNPJJYL").toString());
                }
                if(rs.getBigDecimal("ZDJYL")!=null)
                {
                    dic.setZDJYL(rs.getBigDecimal("ZDJYL").toString());
                }

                dic.setCXNF(Integer.toString(rs.getInt("CXNF")));
                dicList.add(dic);
            }
            rs.close();
        }
        // 31:
        else if(dicName.equals("WQST"))
        {
            String sql = "SELECT * FROM WQST";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()){
                DIC_WQST dic = new DIC_WQST();
                dic.setSTNM(rs.getString("STNM"));
                dic.setSTCD(rs.getString("STCD"));
                dic.setCSNM(rs.getString("CSNM"));
                dic.setBSHNCD(rs.getString("BSHNCD"));
                dic.setWID(rs.getString("WID"));
                dic.setRVNM(rs.getString("RVNM"));
                dic.setSETDATEY(rs.getString("SETDATEY"));
                dic.setSETDATEM(rs.getString("SETDATEM"));
                dic.setWFCSNM1(rs.getString("WFCSNM1"));
                dic.setWFCSNM2(rs.getString("WFCSNM2"));
                dic.setSLPRV(rs.getString("SLPRV"));
                dic.setSLCT(rs.getString("SLCT"));
                dic.setSLCO(rs.getString("SLCO"));
                dic.setSLTO(rs.getString("SLTO"));
                dic.setSLST(rs.getString("SLST"));

                if(rs.getBigDecimal("LGTDD")!=null)
                {
                    dic.setLGTDD(rs.getBigDecimal("LGTDD").toString());
                }
                if(rs.getBigDecimal("LGTDM")!=null)
                {
                    dic.setLGTDM(rs.getBigDecimal("LGTDM").toString());
                }
                if(rs.getBigDecimal("LGTDS")!=null)
                {
                    dic.setLGTDS(rs.getBigDecimal("LGTDS").toString());
                }
                if(rs.getBigDecimal("LTTDD")!=null)
                {
                    dic.setLTTDD(rs.getBigDecimal("LTTDD").toString());
                }
                if(rs.getBigDecimal("LTTDM")!=null)
                {
                    dic.setLTTDM(rs.getBigDecimal("LTTDM").toString());
                }
                if(rs.getBigDecimal("LTTDS")!=null)
                {
                    dic.setLTTDS(rs.getBigDecimal("LTTDS").toString());
                }

                dic.setAGUN(rs.getString("AGUN"));
                dic.setADBDSC(rs.getString("ADBDSC"));

                dic.setANSO(Integer.toString(rs.getInt("ANSO")));
                dic.setANSS(Integer.toString(rs.getInt("ANSS")));

                dic.setNT(rs.getString("NT"));

                dicList.add(dic);
            }
            rs.close();
        }
        stmt.close();
        conn.close();
        return dicList;
    }

    @Override
    public boolean updateDicByName(String dicName, DIC_Base dic) throws Exception {
        return false;
    }
}
