
instance DIA_BODO_EXIT(C_INFO)
{
	npc = bau_903_bodo;
	nr = 999;
	condition = dia_bodo_exit_condition;
	information = dia_bodo_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bodo_exit_condition()
{
	return TRUE;
};

func void dia_bodo_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BODO_HALLO(C_INFO)
{
	npc = bau_903_bodo;
	nr = 1;
	condition = dia_bodo_hallo_condition;
	information = dia_bodo_hallo_info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int dia_bodo_hallo_condition()
{
	return TRUE;
};

func void dia_bodo_hallo_info()
{
	AI_Output(other,self,"DIA_Bodo_Hallo_15_00");	//Jak se vede?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_01");	//Domobrana nás vydírala dost dlouho. Teï, kdy jsou oldnéøi na naší stranì, se tu u nedovolí víckrát objevit.
		AI_Output(self,other,"DIA_Bodo_Hallo_12_02");	//Král si myslí, e mùe jednoduše odjet s èímkoli. Ale my u mu nic nedáme.
	};
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_03");	//Fajn. Kdy uvidíš nìkoho z domobrany, nandej mu to i za mì, jo?
	};
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_04");	//Fajn. Innos s tebou.
	};
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_05");	//Královi vojáci nejsou na téhle farmì vítáni.
		AI_Output(self,other,"DIA_Bodo_Hallo_12_06");	//RI tak s tebou tady moná bude mluvit dost lidí, ale urèitì si tu neudìláš pøátele.
	};
};


instance DIA_BODO_BAUERNAUFSTAND(C_INFO)
{
	npc = bau_903_bodo;
	nr = 2;
	condition = dia_bodo_bauernaufstand_condition;
	information = dia_bodo_bauernaufstand_info;
	permanent = FALSE;
	description = "Ve mìstì se mluví o rolnické vzpouøe!";
};


func int dia_bodo_bauernaufstand_condition()
{
	return TRUE;
};

func void dia_bodo_bauernaufstand_info()
{
	AI_Output(other,self,"DIA_Bodo_Bauernaufstand_15_00");	//Ve mìstì se mluví o rolnické vzpouøe!
	AI_Output(self,other,"DIA_Bodo_Bauernaufstand_12_01");	//To je nesmysl. Jenom se snaíme bránit vısledky naší tvrdé døiny.
	AI_Output(self,other,"DIA_Bodo_Bauernaufstand_12_02");	//Válka vdycky nejvíc doléhá na bedra rolníkù. A Onar u nehodlá jen dál stát a koukat, jak nás ty královské pijavice vysávají.
};


instance DIA_BODO_BETT(C_INFO)
{
	npc = bau_903_bodo;
	nr = 3;
	condition = dia_bodo_bett_condition;
	information = dia_bodo_bett_info;
	permanent = FALSE;
	description = "Mùu si tady nìkde odpoèinout?";
};


func int dia_bodo_bett_condition()
{
	return TRUE;
};

func void dia_bodo_bett_info()
{
	AI_Output(other,self,"DIA_Bodo_Bett_15_00");	//Mùu si tady nìkde odpoèinout?
	AI_Output(self,other,"DIA_Bodo_Bett_12_01");	//Jestli hledáš místo na spaní, zajdi si do stodoly. Ale ani omylem si nelehni na oldáckou postel.
	AI_Output(self,other,"DIA_Bodo_Bett_12_02");	//Onar zajistil, aby nechali nás, farmáøe na pokoji. Ale s cizinci, co nepatøí na farmu, si oldáci mohou dìlat, co se jim zlíbí.
};


instance DIA_BODO_CIPHER(C_INFO)
{
	npc = bau_903_bodo;
	nr = 4;
	condition = dia_bodo_cipher_condition;
	information = dia_bodo_cipher_info;
	permanent = FALSE;
	description = "Cipher mi øekl, e mu nìkdo ukradl balík trávy z bain.";
};


func int dia_bodo_cipher_condition()
{
	if((MIS_CIPHER_BRINGWEED == LOG_RUNNING) || (MIS_CIPHER_PAKET == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_bodo_cipher_info()
{
	AI_Output(other,self,"DIA_Bodo_Cipher_15_00");	//Cipher mi øekl, e mu nìkdo ukradl balík trávy z bain.
	AI_Output(self,other,"DIA_Bodo_Cipher_12_01");	//A?
	AI_Output(other,self,"DIA_Bodo_Cipher_15_02");	//Myslí si, es to byl ty, kdo mu to vzal.
	AI_Output(self,other,"DIA_Bodo_Cipher_12_03");	//Aha, tak proto na mì ten chlap vdycky tak pøiblble zírá.
	AI_Output(self,other,"DIA_Bodo_Cipher_12_04");	//Poslední dobou jsem na nìj byl obzváš milı, protoe vypadal, e slíznul poøádnou pecku.
	AI_Output(self,other,"DIA_Bodo_Cipher_12_05");	//Ale s tím já nic neudìlám. Mùu se k nìmu chovat pøátelsky, jak chci, a on se na mì stejnì šklebí, jako by mì chtìl zabít.
};


instance DIA_BODO_WEEDORELSE(C_INFO)
{
	npc = bau_903_bodo;
	nr = 5;
	condition = dia_bodo_weedorelse_condition;
	information = dia_bodo_weedorelse_info;
	permanent = FALSE;
	description = "Dej mi místo toho tu trávu!";
};


func int dia_bodo_weedorelse_condition()
{
	if((MIS_CIPHER_BRINGWEED == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bodo_cipher))
	{
		return TRUE;
	};
};

func void dia_bodo_weedorelse_info()
{
	AI_Output(other,self,"DIA_Bodo_WeedOrElse_15_00");	//Dej mi místo toho tu trávu!
	AI_Output(self,other,"DIA_Bodo_WeedOrElse_12_01");	//Hele, všechno, co mám, je tenhle špek. Vem si ho a nech mì na pokoji.
	b_giveinvitems(self,other,itmi_joint,1);
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bodo_WeedOrElse_12_02");	//Je ti jasnı, e na nás oldáci dohlíej, e jo?
		AI_Output(self,other,"DIA_Bodo_WeedOrElse_12_03");	//Tak ádnı hlouposti!
	};
};


instance DIA_BODO_WEEDPERM(C_INFO)
{
	npc = bau_903_bodo;
	nr = 6;
	condition = dia_bodo_weedperm_condition;
	information = dia_bodo_weedperm_info;
	permanent = TRUE;
	description = "Nevìøím ti ani slovo. Dej mi tu trávu!";
};


func int dia_bodo_weedperm_condition()
{
	if((MIS_CIPHER_BRINGWEED == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bodo_weedorelse))
	{
		return TRUE;
	};
};

func void dia_bodo_weedperm_info()
{
	AI_Output(other,self,"DIA_Bodo_WeedPERM_15_00");	//Nevìøím ti ani slovo. Dej mi tu trávu!
	AI_Output(self,other,"DIA_Bodo_WeedPERM_12_01");	//Nemám ji. Namouduši.
};


instance DIA_BODO_PICKPOCKET(C_INFO)
{
	npc = bau_903_bodo;
	nr = 900;
	condition = dia_bodo_pickpocket_condition;
	information = dia_bodo_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_bodo_pickpocket_condition()
{
	return c_beklauen(30,60);
};

func void dia_bodo_pickpocket_info()
{
	Info_ClearChoices(dia_bodo_pickpocket);
	Info_AddChoice(dia_bodo_pickpocket,DIALOG_BACK,dia_bodo_pickpocket_back);
	Info_AddChoice(dia_bodo_pickpocket,DIALOG_PICKPOCKET,dia_bodo_pickpocket_doit);
};

func void dia_bodo_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_bodo_pickpocket);
};

func void dia_bodo_pickpocket_back()
{
	Info_ClearChoices(dia_bodo_pickpocket);
};

