Use master;
GO

CREATE Database StationInfo;
GO

Use StationInfo;
GO

CREATE TABLE USR(
	UCODE CHAR(8) PRIMARY KEY,--用户编码
	UNAME VARCHAR(50) NOT NULL,--用户名
	UPWD VARCHAR(50) NOT NULL CHECK (LEN(UPWD) >= 6),--用户密码
	ROLECD CHAR(1) FOREIGN KEY REFERENCES ROLE_INFO(ROLECD) ,--角色编码
	AGCD CHAR(60) NOT NULL,--所属单位编码
	NT VARCHAR(200)--备注
);
GO

CREATE TABLE ROLE_INFO(
	ROLECD CHAR(1) PRIMARY KEY,--角色编码
	ROLENM VARCHAR(50) NOT NULL,--角色名称
	NT VARCHAR(200)--备注
);
GO

CREATE TABLE StationBasics(
	IID CHAR(8) PRIMARY KEY,--编码
	STNM VARCHAR(60) NOT NULL,--站名
	ADAGNM VARCHAR(50),--管理机构
	LOC CHAR(50) NOT NULL,--坐标
	WSST VARCHAR(50) NOT NULL,--流域水系
	RVNM VARCHAR(50)--河流名称
);
GO

CREATE TABLE StationSID(
	SID CHAR(32) PRIMARY KEY,--测站编码
	IID CHAR(8) FOREIGN KEY REFERENCES StationBasics(IID)--编码
);
GO



CREATE TABLE MoistureStation(
	STNM VARCHAR(60) NOT NULL,
	STCD CHAR(8) PRIMARY KEY,
	BSHNCD VARCHAR(1) NOT NULL,--    
	SETDATEY VARCHAR(32),--设站日期
	SETDATEM VARCHAR(32),
	SLPRV VARCHAR(32),--    ? ?  ?
	SLCT VARCHAR(32),
	SLCO VARCHAR(32),
	SLTO VARCHAR(32),
	SLST VARCHAR(32),
	AGUN VARCHAR(60),--      λ
	LGTDD DECIMAL(5,2),--东经
	LGTDM DECIMAL(5,2),
	LGTDS DECIMAL(5,2),
	LTTDD DECIMAL(5,2),--北纬
	LTTDM DECIMAL(5,2),
	LTTDS DECIMAL(5,2),
	TSMD VARCHAR(32) CHECK (TSMD IN('自动','人工')),
	NT VARCHAR(200),--  ?
);

CREATE TABLE EvolutionSET(
	STNM VARCHAR(60) ,--测站名称
	STCD CHAR(8),--测站编码
	BSHNCD VARCHAR(1) ,--流域
	WID CHAR(2) ,--水系
	RVNM VARCHAR(50) ,--河流
	DRAR DECIMAL(10,2) ,--集水面积
	SETDATEY VARCHAR(32),--设站日期
	SETDATEM VARCHAR(32),
	APAR VARCHAR(200) NOT NULL,--批准机关
	SSC SMALLINT,--变更情况
	SSR SMALLINT,
	SSDT SMALLINT,
	SSRT SMALLINT,
	RP SMALLINT,--变更原因
	RI SMALLINT,
	RO SMALLINT,
	SMB SMALLINT,--站类管理
	SMS SMALLINT,
	SMR SMALLINT,
	SAR SMALLINT,--测站属性
	SAA SMALLINT,
	SAW SMALLINT,
	SAL SMALLINT,
	SAT SMALLINT,
	AGUN VARCHAR(60),--管理单位
	NT VARCHAR(200),--备注
	PRIMARY KEY(STCD)
);
GO

CREATE TABLE EvolutionList(
	STCD CHAR(8) FOREIGN KEY REFERENCES EvolutionSET(STCD),--测站编码
	SWITCHDATEY VARCHAR(32),--变更日期
	SWITCHDATEM VARCHAR(32),
	APAR VARCHAR(200) NOT NULL,--批准机关
	SSC SMALLINT,--变更情况
	SSR SMALLINT,
	SSDT SMALLINT,
	SSRT SMALLINT,
	RP SMALLINT,--变更原因
	RI SMALLINT,
	RO SMALLINT,
	SMB SMALLINT,--站类管理
	SMS SMALLINT,
	SMR SMALLINT,
	SAR SMALLINT,--测站属性
	SAA SMALLINT,
	SAW SMALLINT,
	SAL SMALLINT,
	SAT SMALLINT,
	SLPRV VARCHAR(32),--分离的测站地址
	SLCT VARCHAR(32),
	SLCO VARCHAR(32),
	SLTO VARCHAR(32),
	SLST VARCHAR(32),
	LGTDD DECIMAL(5,2),--东经
	LGTDM DECIMAL(5,2),
	LGTDS DECIMAL(5,2),
	LTTDD DECIMAL(5,2),--北纬
	LTTDM DECIMAL(5,2),
	LTTDS DECIMAL(5,2),
	AGUN VARCHAR(60),--管理单位
	NT VARCHAR(200),--备注
	PRIMARY KEY(STCD,SWITCHDATEY)
);
GO

CREATE TABLE WQST(
	STNM VARCHAR(60),
	STCD CHAR(8) PRIMARY KEY,
	CSNM VARCHAR(200),--断面名称
	BSHNCD VARCHAR(1),--流域代码
	WID CHAR(2) ,--水系代码
	RVNM VARCHAR(50) ,--河流
	SETDATEY VARCHAR(32),--设站日期
	SETDATEM VARCHAR(32),
	WFCSNM1 VARCHAR(200),--一级水功能区名称
	WFCSNM2 VARCHAR(200),--二级水功能区名称
	SLPRV VARCHAR(32),--分离的测站地址
	SLCT VARCHAR(32),
	SLCO VARCHAR(32),
	SLTO VARCHAR(32),
	SLST VARCHAR(32),
	LGTDD DECIMAL(5,2),--东经
	LGTDM DECIMAL(5,2),
	LGTDS DECIMAL(5,2),
	LTTDD DECIMAL(5,2),--北纬
	LTTDM DECIMAL(5,2),
	LTTDS DECIMAL(5,2),
	AGUN VARCHAR(60),--管理单位
	ADBDSC VARCHAR(1) DEFAULT NULL CHECK (ADBDSC IN('0','1')),--是否行政区界断面
	ANSO SMALLINT,
	ANSS SMALLINT,
	NT VARCHAR(200),--备注
);
GO

CREATE TABLE EvaporateStation(
	STNM VARCHAR(60) NOT NULL,
	STCD CHAR(8) PRIMARY KEY,
	BSHNCD VARCHAR(1),--流域代码
	SETDATEY VARCHAR(32),--设站日期
	SETDATEM VARCHAR(32),
	SLPRV VARCHAR(32),--分离的测站地址
	SLCT VARCHAR(32),
	SLCO VARCHAR(32),
	SLTO VARCHAR(32),
	SLST VARCHAR(32),
	AGUN VARCHAR(60),--管理单位
	LGTDD DECIMAL(5,2),--东经
	LGTDM DECIMAL(5,2),
	LGTDS DECIMAL(5,2),
	LTTDD DECIMAL(5,2),--北纬
	LTTDM DECIMAL(5,2),
	LTTDS DECIMAL(5,2),
	MYAE DECIMAL(7,2),--多年平均蒸发量（mm）
	EETP VARCHAR(200),--蒸发器型号
	TSMD VARCHAR(32) CHECK (TSMD IN('自动','人工')),
	CHK VARCHAR(32) DEFAULT NULL CHECK (CHK IN('驻测','巡测','委托')),--测验方式
	NT VARCHAR(200),--备注
);
GO

CREATE TABLE AWSCD(
	WID CHAR(2) PRIMARY KEY,--水系代码
	BSHN VARCHAR(32) NOT NULL,--流域
	BSHNCD VARCHAR(1) NOT NULL,--流域代码
	HN VARCHAR(32) NOT NULL--水系
);
GO

CREATE TABLE RZGL(
	UCODE CHAR(1) NOT NULL,--用户编码
	FRGRDNM VARCHAR(20) NOT NULL,--用户名
	INTM DATETIME DEFAULT CURRENT_TIMESTAMP,--登录时间
	OUTTM DATETIME DEFAULT NULL,--退出时间
	UID VARCHAR(36) PRIMARY KEY,--编号
	NT VARCHAR(200),--备注
);
GO

--表1
CREATE TABLE CZXXH(--测站信息化
	STNM VARCHAR(60),--测站名称
	STCD CHAR(8) PRIMARY KEY,--测站编码
	BSHNNM CHAR(1),--测站流域
	HNNM VARCHAR(32),--水系名称
	HL VARCHAR(32),--河流
	DRAR DECIMAL(10,2),--集水面积
	NT VARCHAR(200),--备注
);

CREATE TABLE CZXGXX_SWEN(--测站相关信息水文
	STCD CHAR(8) PRIMARY KEY,--测站编码
	SZRQY INT, --设站日期年
	SZRQM INT,--设站日期月 
	--站类管理
	ZLGL_GJZYZ SMALLINT,--国家重要站
	ZLGL_SJZYZ SMALLINT,--省级重要站
	ZLGL_YBZ SMALLINT,--一般站
	ZLGL_ZXHL SMALLINT,--中小河流
	ZLGL_SHZH SMALLINT,--山洪灾害
	ZLGL_QT SMALLINT,--其他
	ZLGL_SYZ SMALLINT,--实验站
	ZLGL_FZZ SMALLINT,--辅助站

	--测站属性
	CZSX_HDZ SMALLINT,--河道站
	CZSX_SKZ SMALLINT,--水库站
	CZSX_HPZ SMALLINT,--湖泊站
	CZSX_CLLZ SMALLINT,--潮流量站
	CZSX_QDZ SMALLINT,--渠道（闸坝）站

	--测站分类
	CZFL_DHKZZ SMALLINT,--大河控制站
	CZFL_QYDBZ SMALLINT,--区域代表站
	CZFL_XHZ SMALLINT,--小河站
	PBSQ CHAR(1),--拍报水情
);

CREATE TABLE CZDLWZ(--测站地理位置
	STCD CHAR(8) PRIMARY KEY,--测站编码
	SADR_S VARCHAR(60),--测站位置省
    SADR_Q VARCHAR(60),--测站位置区
    SADR_X VARCHAR(60),--测站位置县
    SADR_Z VARCHAR(60),--测站位置镇
    SADR_JD VARCHAR(60),--测站位置街道
	LGTD_D DECIMAL(12,1),--测站经度度
    LGTD_F DECIMAL(12,1),--测站经度分
    LGTD_M DECIMAL(12,1),--测站经度秒
	LTTD_D DECIMAL(11,1),--测站纬度度
    LTTD_F DECIMAL(11,1),--测站纬度分
    LTTD_M DECIMAL(11,1),--测站纬度秒
	DTNEL DECIMAL(7,3),--测站高程
	BASICALPLANE VARCHAR(60),--基面名称
	BPXZZ DECIMAL(7,3),--基面偏移值
);

CREATE TABLE CZDW(--测站单位
	STCD CHAR(8) PRIMARY KEY,--测站编码
	JSDW VARCHAR(45),--建设单位
	GLDW VARCHAR(45),--管理单位
	KCD VARCHAR(45),--所属勘测队
	XZQDM CHAR(1) ,--是否行政区断面
)

CREATE TABLE CZSWTZ_SWEN(--测站水文特征
	STCD CHAR(8) PRIMARY KEY,--测站编码
	DNPJJLL VARCHAR(45),--多年平均径流量
	ZDLL VARCHAR(45),--最大流量
	ZDLLSJ VARCHAR(45),--最大流量时间
	ZXLL VARCHAR(45),--最小流量
	ZXLLSJ VARCHAR(45),--最小流量时间
);



CREATE TABLE CZCYXM_SWEN(--测站测验项目水文
	STCD CHAR(8) PRIMARY KEY,--测站编码
    LL CHAR(1) ,--流量
    SWEI CHAR(1) ,--水位
	CW CHAR(1) ,--潮位
	JS CHAR(1) ,--降水
	ZF CHAR(1) ,--蒸发
	BJ CHAR(1) ,--比降
	SZ CHAR(1) ,--水质
	XYZ CHAR(1) ,--悬移质
	TYZ CHAR(1) ,--推移质
	HCZ CHAR(1) ,--河床质
	KF CHAR(1) ,--颗分
	SW CHAR(1) ,--水温
	BQ CHAR(1) ,--冰情
	FZQX CHAR(1) ,--辅助气象
	DXS CHAR(1) ,--地下水
	SQ CHAR(1) ,--墒情
	SWDC CHAR(1) ,--水文调查
);


CREATE TABLE CZSYXM(--测站实验项目水文
	STCD CHAR(8) PRIMARY KEY,--测站编码
	JL CHAR(1) CHECK(JL IN ('0','1')),--径流
	ZF CHAR(1) CHECK(ZF IN ('0','1')),--蒸发
	CYFF CHAR(1) CHECK(CYFF IN ('0','1')),--测验方法
	DXS CHAR(1) CHECK(DXS IN ('0','1')),--地下水
	QT CHAR(1) CHECK(QT IN ('0','1')),--其他
	JJBSWZ CHAR(1) CHECK(JJBSWZ IN ('0','1')),--兼基本水文站
);

CREATE TABLE CZGLFS_SWEN(--测站管理方式水文
	STCD CHAR(8) PRIMARY KEY,--测站编码
	CNZC CHAR(1) CHECK(CNZC IN ('0','1')),--常年驻测
	XQZC CHAR(1) CHECK(XQZC IN ('0','1')),--汛期驻测
	XC CHAR(1) CHECK(XC IN ('0','1')),-- 巡测
	WT CHAR(1) CHECK(WT IN ('0','1')),-- 委托
	ZDJH CHAR(1) CHECK(ZDJH IN ('0','1')),-- 站队结合
);


CREATE TABLE CZCLFS(-- 测站测流方式水文
	STCD CHAR(8) PRIMARY KEY,--测站编码
	LDJDDD CHAR(1) CHECK (LDJDDD IN('0','1')),--缆道机动电动
	LDSY CHAR(1) CHECK(LDSY IN('0','1')),-- 手摇
	LDLCDX CHAR(1)CHECK (LDLCDX IN('0','1')),-- 缆车或掉箱
	CCJD CHAR(1)CHECK (CCJD IN('0','1')),-- 测船机动
	CCFJD CHAR(1)CHECK (CCFJD IN('0','1')),--测船非机动
	QC CHAR(1)CHECK (QC IN('0','1')),--桥测
	SGJZW CHAR(1)CHECK (SGJZW IN('0','1')),--水工建筑物
	ADCP CHAR(1) CHECK(ADCP IN('0','1')),--ADCP
	QT CHAR(1) CHECK(QT IN('0','1')),
 );

CREATE TABLE CZXXJL(--测站信息记录方式水文
	STCD INT PRIMARY KEY,--测站编码
	ZXJC CHAR(1) ,--在线监测
	RGGD CHAR(1) ,--人工观读
);
--表1 结束

CREATE TABLE CZXGXX_SWEI(--测站相关信息水位
	STCD CHAR(8) PRIMARY KEY,--测站编码
	SZRQY INT, --设站日期年
	SZRQM INT,--设站日期月
	--站类管理

	ZLGL_JBZ SMALLINT,--基本站
	
	ZLGL_ZXHL SMALLINT,--中小河流
	ZLGL_SHZH SMALLINT,--山洪灾害
	ZLGL_QT SMALLINT,--其他

	--测站属性
	CZSX_HDZ SMALLINT,--河道站
	CZSX_SKZ SMALLINT,--水库站
	CZSX_HPZ SMALLINT,--湖泊站
	CZSX_CWZ SMALLINT,--潮流量站
	CZSX_QDZ SMALLINT,--渠道（闸坝）站
    CZSX_QTZ SMALLINT,--其他站



	PBSQ CHAR(1),--拍报水情
);


CREATE TABLE CZSWTZ_SWEI(--测站水位特征
	STCD CHAR(8) PRIMARY KEY,--测站编码
	ZGSW VARCHAR(45),--最高水位
	ZGSWSJ VARCHAR(45),--最高水位时间
	ZDSW VARCHAR(45),--最低水位
	ZDSWSJ VARCHAR(45),--最低水位时间
	SCHG VARCHAR(60),--首次河干时间
	PJTS INT ,--平均河干天数
);

CREATE TABLE CZCYXM_SWEI(--测站测验项目水位
	STCD CHAR(8) PRIMARY KEY,--测站编码
	SWEI  CHAR(1) CHECK(SWEI IN ('0','1')),--水位
	CW CHAR(1) CHECK(CW IN ('0','1')),--潮位
	JS CHAR(1) CHECK(JS IN ('0','1')),--降水
	ZF CHAR(1) CHECK(ZF IN ('0','1')),--蒸发
	BJ CHAR(1) CHECK(BJ IN ('0','1')),--比降
	SZ CHAR(1) CHECK(SZ IN ('0','1')),--水质
	SWEN CHAR(1) CHECK(SWEN IN ('0','1')),--水温
	BQ CHAR(1) CHECK(BQ IN ('0','1')),--冰情
	FZQX CHAR(1) CHECK(FZQX IN ('0','1')),--辅助气象
	DXS CHAR(1) CHECK(DXS IN ('0','1')),--地下水
	SQ CHAR(1) CHECK(SQ IN ('0','1')),--墒情
	SWDC CHAR(1) CHECK(SWDC IN ('0','1')),--水文调查
);

CREATE TABLE CZGLFS_SWEI(--测站管理方式水位
	STCD CHAR(8) PRIMARY KEY,--测站编码
	CNZC CHAR(1) CHECK(CNZC IN ('0','1')),--常年驻测
	XQZC CHAR(1) CHECK(XQZC IN ('0','1')),--汛期驻测
	XC CHAR(1) CHECK(XC IN ('0','1')),-- 巡测
	WT CHAR(1) CHECK(WT IN ('0','1')),-- 委托
);

CREATE TABLE CZSWGC(--测站水位观测方式
	STCD CHAR(8) PRIMARY KEY,--测站编码
	FZ  CHAR(1) CHECK(FZ IN ('0','1')),--浮子
	CSB CHAR(1) CHECK(CSB IN ('0','1')),--超声波
	YLS  CHAR(1) CHECK(YLS IN ('0','1')),--压力式
	DZSC CHAR(1) CHECK(DZSC IN ('0','1')),--电子水尺
	SC  CHAR(1) CHECK(SC IN ('0','1')),--水尺
	QT  CHAR(1) CHECK(QT IN ('0','1')),--其他
);
CREATE TABLE CZXXJL_SWEI(--测站信息记录方式水位
	STCD INT PRIMARY KEY,--测站编码
	ZDCB CHAR(1) CHECK (ZDCB IN('0','1')),--自动测报
	PTZJ CHAR(1) CHECK (PTZJ IN('0','1')),--普通自计
	GTCC CHAR(1) CHECK (GTCC IN('0','1')),-- 固态存储
	RGGD CHAR(1) CHECK(RGGD IN('0','1')),--人工观读
);
--水文
CREATE TABLE CZXGXX_YL(--测站相关信息雨量站
	STCD CHAR(8) PRIMARY KEY,--测站编码
    SZRQY INT, --设站日期年
	SZRQM INT,--设站日期月
	--站类管理

	ZLGL_JBZ SMALLINT,--基本站
	
	ZLGL_ZXHL SMALLINT,--中小河流
	ZLGL_SHZH SMALLINT,--山洪灾害
	ZLGL_QT SMALLINT,--其他
	PBSQ CHAR(1),--拍报水情
);

CREATE TABLE CZDW_YL(--测站单位雨量站
	STCD CHAR(8) PRIMARY KEY,--测站编码

	GLDW VARCHAR(45),--管理单位

);

CREATE TABLE TZZ(--特征值雨量站
	STCD CHAR(8) PRIMARY KEY,--测站编码
	QKGD DECIMAL(7,1),--器口高度
	DNPJJYL DECIMAL(9,1),--多年平均降雨量
	ZDJYL DECIMAL(9,1),--最大降雨量
	CXNF SMALLINT,--出现年份
);

CREATE TABLE CZCYXM_YL(--测站测验项目雨量
	STCD CHAR(8) PRIMARY KEY,--测站编码
	JS CHAR(1) CHECK(JS IN ('0','1')),--降水
	ZF CHAR(1) CHECK(ZF IN ('0','1')),--蒸发
	JSSZ CHAR(1) CHECK(JSSZ IN ('0','1')),--水质
	FZQX CHAR(1) CHECK(FZQX IN ('0','1')),--辅助气象
	SQ CHAR(1) CHECK(SQ IN ('0','1')),--墒情

);

CREATE TABLE CZGC(--测站观测方式雨量
	STCD CHAR(8) PRIMARY KEY,--测站编码
	FDS  CHAR(1) CHECK(FDS IN ('0','1')),--翻斗式
	HXS CHAR(1) CHECK(HXS IN ('0','1')),--虹吸式
	YLQ  CHAR(1) CHECK(YLQ IN ('0','1')),--雨量器
	
);
CREATE TABLE CZXXJL_YL(--测站信息记录方式雨量
	STCD INT PRIMARY KEY,--测站编码
	ZDCB CHAR(1) CHECK (ZDCB IN('0','1')),--自动测报
	PTZJ CHAR(1) CHECK (PTZJ IN('0','1')),--普通自计
	GTCC CHAR(1) CHECK (GTCC IN('0','1')),-- 固态存储
	RGGD CHAR(1) CHECK(RGGD IN('0','1')),--人工观读
);
CREATE TABLE CZGLFS_YL(--测站管理方式雨量
	STCD CHAR(8) PRIMARY KEY,--测站编码
	WT CHAR(1) CHECK(WT IN ('0','1')),-- 委托
);
GO