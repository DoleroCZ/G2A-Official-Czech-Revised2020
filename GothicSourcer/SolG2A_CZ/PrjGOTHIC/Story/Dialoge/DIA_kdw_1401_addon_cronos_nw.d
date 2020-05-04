
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
	description = "Mohu t� vyru�it?";
};


func int dia_addon_cronos_hallo_condition()
{
	return TRUE;
};

func void dia_addon_cronos_hallo_info()
{
	AI_Output(other,self,"DIA_Addon_Cronos_Hallo_15_00");	//Mohu t� vyru�it?
	AI_Output(self,other,"DIA_Addon_Cronos_Hallo_04_01");	//To jsi TY? Nemyslel jsem, �e t� je�t� n�kdy uv�d�m.
	AI_Output(self,other,"DIA_Addon_Cronos_Hallo_04_02");	//M� odvahu tu zase ukazovat sv�j ksicht. Byly �asy, kdy jsme t� cht�li st�hnout z k��e.
	AI_Output(self,other,"DIA_Addon_Cronos_Hallo_04_03");	//M��e� b�t r�d, p�r t�dn� a ka�d� cht�l, aby byl zase klid.
};


instance DIA_ADDON_CRONOS_WASMACHSTDU(C_INFO)
{
	npc = kdw_1401_addon_cronos_nw;
	nr = 5;
	condition = dia_addon_cronos_wasmachstdu_condition;
	information = dia_addon_cronos_wasmachstdu_info;
	description = "Co to d�l�?";
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
	AI_Output(other,self,"DIA_Addon_Cronos_WasMachstdu_15_00");	//Co to d�l�?
	AI_Output(self,other,"DIA_Addon_Cronos_WasMachstdu_04_01");	//(zmaten�) M�m �kolem je zjistit v�ce o str�c�ch chr�mu.
	AI_Output(self,other,"DIA_Addon_Cronos_WasMachstdu_04_02");	//Maj� kamenit� t�lo, to d�v� smysl. Tyhle kamenn� str�ci maj� nezn�m�, d� se ��ct v�jime�n� schopnosti.
	AI_Output(self,other,"DIA_Addon_Cronos_WasMachstdu_04_03");	//Jednu chv�li nehnut� stoj� a ani se nestihne� nadechnout a u� se ��t� na tebe a ni�� v�e, co jim p�ijde do cesty, jsou n���m posedl�.
	AI_Output(self,other,"DIA_Addon_Cronos_WasMachstdu_04_04");	//Nep�i�el jsem je�t� na jejich ��d�c� s�lu, ale jedno je jist�. Jsou magick�ho p�vodu.
};


instance DIA_ADDON_CRONOS_WAECHTER(C_INFO)
{
	npc = kdw_1401_addon_cronos_nw;
	nr = 5;
	condition = dia_addon_cronos_waechter_condition;
	information = dia_addon_cronos_waechter_info;
	description = "Pov�dej mi o kamenn�ch str�c�ch.";
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
	AI_Output(other,self,"DIA_Addon_Cronos_Waechter_15_00");	//Pov�dej mi o kamenn�ch str�c�ch.
	AI_Output(self,other,"DIA_Addon_Cronos_Waechter_04_01");	//Ne�eknu ti mnoho. Nane�t�st� jsme je zni�ili. Nyn� jsou ne�kodn�.
	AI_Output(self,other,"DIA_Addon_Cronos_Waechter_04_02");	//Sotva jsme sem p�i�li a u� jsme od nich dost�vali.
	AI_Output(self,other,"DIA_Addon_Cronos_Waechter_04_03");	//��d� je prazvla�tn� s�la, ale to nen� d�le�it�. M�m strach, �e na druh� stran� port�lu na n�s �ek� je�t� n�co hor��ho.
	AI_Output(self,other,"DIA_Addon_Cronos_Waechter_04_04");	//Tohle mus� b�t cesta k jejich ��d�c� s�le, ale pozor vypadaj� jako oby�ejn� sochy - ned�-li si pozor, m��ou ti p�kn� zatopit.
};


instance DIA_ADDON_CRONOS_NW_TRADE(C_INFO)
{
	npc = kdw_1401_addon_cronos_nw;
	nr = 5;
	condition = dia_addon_cronos_nw_trade_condition;
	information = dia_addon_cronos_nw_trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = "Nem�l bys pro m� n�jak� vybaven�?";
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
	AI_Output(other,self,"DIA_Addon_Cronos_NW_Trade_15_00");	//Nem�l bys pro m� n�jak� vybaven�?
	if(DIA_ADDON_CRONOS_NW_TRADE_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cronos_NW_Trade_04_01");	//Pro� ne? Kdy� si to dob�e zapamatuji, n�co �asem obstar�m.
		DIA_ADDON_CRONOS_NW_TRADE_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Cronos_NW_Trade_04_02");	//Tak co bys r�d?
	Log_CreateTopic(TOPIC_OUTTRADER,LOG_NOTE);
	b_logentry(TOPIC_OUTTRADER,LOGTEXT_ADDON_CRONOSTRADE);
};

