
instance DIA_ADDON_CRONOS_EXIT(C_INFO)
{
	npc = kdw_1401_addon_cronos_nw;
	nr = 999;
	condition = dia_addon_cronos_exit_condition;
	information = dia_addon_cronos_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_cronos_exit_condition()
{
	return TRUE;
};

func void dia_addon_cronos_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_CRONOS_HALLO(C_INFO)
{
	npc = kdw_1401_addon_cronos_nw;
	nr = 5;
	condition = dia_addon_cronos_hallo_condition;
	information = dia_addon_cronos_hallo_info;
	description = "Mohu tì vyrušit?";
};


func int dia_addon_cronos_hallo_condition()
{
	return TRUE;
};

func void dia_addon_cronos_hallo_info()
{
	AI_Output(other,self,"DIA_Addon_Cronos_Hallo_15_00");	//Mohu tì vyrušit?
	AI_Output(self,other,"DIA_Addon_Cronos_Hallo_04_01");	//To jsi TY? Nemyslel jsem, že tì ještì nìkdy uvídím.
	AI_Output(self,other,"DIA_Addon_Cronos_Hallo_04_02");	//Máš odvahu tu zase ukazovat svùj ksicht. Byly èasy, kdy jsme tì chtìli stáhnout z kùže.
	AI_Output(self,other,"DIA_Addon_Cronos_Hallo_04_03");	//Mùžeš být rád, pár týdnù a každý chtìl, aby byl zase klid.
};


instance DIA_ADDON_CRONOS_WASMACHSTDU(C_INFO)
{
	npc = kdw_1401_addon_cronos_nw;
	nr = 5;
	condition = dia_addon_cronos_wasmachstdu_condition;
	information = dia_addon_cronos_wasmachstdu_info;
	description = "Co to dìláš?";
};


func int dia_addon_cronos_wasmachstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cronos_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_cronos_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Addon_Cronos_WasMachstdu_15_00");	//Co to dìláš?
	AI_Output(self,other,"DIA_Addon_Cronos_WasMachstdu_04_01");	//(zmatenì) Mým úkolem je zjistit více o strážcích chrámu.
	AI_Output(self,other,"DIA_Addon_Cronos_WasMachstdu_04_02");	//Mají kamenité tìlo, to dává smysl. Tyhle kamenní strážci mají neznámé, dá se øíct výjimeèné schopnosti.
	AI_Output(self,other,"DIA_Addon_Cronos_WasMachstdu_04_03");	//Jednu chvíli nehnutì stojí a ani se nestihneš nadechnout a už se øítí na tebe a nièí vše, co jim pøijde do cesty, jsou nìèím posedlí.
	AI_Output(self,other,"DIA_Addon_Cronos_WasMachstdu_04_04");	//Nepøišel jsem ještì na jejich øídící sílu, ale jedno je jisté. Jsou magického pùvodu.
};


instance DIA_ADDON_CRONOS_WAECHTER(C_INFO)
{
	npc = kdw_1401_addon_cronos_nw;
	nr = 5;
	condition = dia_addon_cronos_waechter_condition;
	information = dia_addon_cronos_waechter_info;
	description = "Povídej mi o kamenných strážcích.";
};


func int dia_addon_cronos_waechter_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cronos_wasmachstdu))
	{
		return TRUE;
	};
};

func void dia_addon_cronos_waechter_info()
{
	AI_Output(other,self,"DIA_Addon_Cronos_Waechter_15_00");	//Povídej mi o kamenných strážcích.
	AI_Output(self,other,"DIA_Addon_Cronos_Waechter_04_01");	//Neøeknu ti mnoho. Naneštìstí jsme je znièili. Nyní jsou neškodní.
	AI_Output(self,other,"DIA_Addon_Cronos_Waechter_04_02");	//Sotva jsme sem pøišli a už jsme od nich dostávali.
	AI_Output(self,other,"DIA_Addon_Cronos_Waechter_04_03");	//Øídí je prazvlaštní síla, ale to není dùležité. Mám strach, že na druhé stranì portálu na nás èeká ještì nìco horšího.
	AI_Output(self,other,"DIA_Addon_Cronos_Waechter_04_04");	//Tohle musí být cesta k jejich øídící síle, ale pozor vypadají jako obyèejné sochy - nedáš-li si pozor, mùžou ti pìknì zatopit.
};


instance DIA_ADDON_CRONOS_NW_TRADE(C_INFO)
{
	npc = kdw_1401_addon_cronos_nw;
	nr = 5;
	condition = dia_addon_cronos_nw_trade_condition;
	information = dia_addon_cronos_nw_trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = "Nemìl bys pro mì nìjaký vybavení?";
};


func int dia_addon_cronos_nw_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cronos_wasmachstdu))
	{
		return TRUE;
	};
};


var int dia_addon_cronos_nw_trade_onetime;

func void dia_addon_cronos_nw_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Addon_Cronos_NW_Trade_15_00");	//Nemìl bys pro mì nìjaký vybavení?
	if(DIA_ADDON_CRONOS_NW_TRADE_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cronos_NW_Trade_04_01");	//Proè ne? Když si to dobøe zapamatuji, nìco èasem obstarám.
		DIA_ADDON_CRONOS_NW_TRADE_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Cronos_NW_Trade_04_02");	//Tak co bys rád?
	Log_CreateTopic(TOPIC_OUTTRADER,LOG_NOTE);
	b_logentry(TOPIC_OUTTRADER,LOGTEXT_ADDON_CRONOSTRADE);
};

