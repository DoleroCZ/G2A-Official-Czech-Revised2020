
instance DIA_ADDON_CRIMSON_EXIT(C_INFO)
{
	npc = bdt_1095_addon_crimson;
	nr = 999;
	condition = dia_addon_crimson_exit_condition;
	information = dia_addon_crimson_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_crimson_exit_condition()
{
	return TRUE;
};

func void dia_addon_crimson_exit_info()
{
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_CRIMSON_PICKPOCKET(C_INFO)
{
	npc = bdt_1095_addon_crimson;
	nr = 900;
	condition = dia_addon_crimson_pickpocket_condition;
	information = dia_addon_crimson_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_addon_crimson_pickpocket_condition()
{
	return c_beklauen(66,66);
};

func void dia_addon_crimson_pickpocket_info()
{
	Info_ClearChoices(dia_addon_crimson_pickpocket);
	Info_AddChoice(dia_addon_crimson_pickpocket,DIALOG_BACK,dia_addon_crimson_pickpocket_back);
	Info_AddChoice(dia_addon_crimson_pickpocket,DIALOG_PICKPOCKET,dia_addon_crimson_pickpocket_doit);
};

func void dia_addon_crimson_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_crimson_pickpocket);
};

func void dia_addon_crimson_pickpocket_back()
{
	Info_ClearChoices(dia_addon_crimson_pickpocket);
};


instance DIA_ADDON_CRIMSON_HI(C_INFO)
{
	npc = bdt_1095_addon_crimson;
	nr = 2;
	condition = dia_addon_crimson_hi_condition;
	information = dia_addon_crimson_hi_info;
	permanent = FALSE;
	description = "Co to d�l�? Tav� zlato?";
};


func int dia_addon_crimson_hi_condition()
{
	return TRUE;
};

func void dia_addon_crimson_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Crimson_Hi_15_00");	//Co to d�l�? Tav� zlato?
	AI_Output(self,other,"DIA_Addon_Crimson_Hi_10_01");	//Ne, va��m zeleninu - samoz�ejm�, �e tady tav�m zlato a d�l�m z n�j mince.
	AI_Output(self,other,"DIA_Addon_Crimson_Hi_10_02");	//Zkus si p�edstavit kr�sn� ve�er, kdy� p�ide Raven a vm��kne mi do ruky zn�mku za d�l�n� minc�.
	AI_Output(self,other,"DIA_Addon_Crimson_Hi_10_03");	//Z jednoho zlat�ho nugetu ud�l�m kopu minc� - m� pr�ce je dobr�, nikdo nepozn� rozd�l.
};


instance DIA_ADDON_CRIMSON_HOW(C_INFO)
{
	npc = bdt_1095_addon_crimson;
	nr = 2;
	condition = dia_addon_crimson_how_condition;
	information = dia_addon_crimson_how_info;
	permanent = FALSE;
	description = "Kolik minc� mi d� za nuget?";
};


func int dia_addon_crimson_how_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_crimson_hi))
	{
		return TRUE;
	};
};

func void dia_addon_crimson_how_info()
{
	AI_Output(other,self,"DIA_Addon_Crimson_How_15_00");	//Kolik minc� mi d� za nuget?
	AI_Output(self,other,"DIA_Addon_Crimson_How_10_01");	//Nev�m to jist�, ale v� co, ud�l�m ti p��telskou cenu, d�m ti ...
	b_say_gold(self,other,10);
};


instance DIA_ADDON_CRIMSON_FEILSCH(C_INFO)
{
	npc = bdt_1095_addon_crimson;
	nr = 2;
	condition = dia_addon_crimson_feilsch_condition;
	information = dia_addon_crimson_feilsch_info;
	permanent = FALSE;
	description = "Chci v�c zlat�ch!";
};


func int dia_addon_crimson_feilsch_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_crimson_how))
	{
		return TRUE;
	};
};

func void dia_addon_crimson_feilsch_info()
{
	AI_Output(other,self,"DIA_Addon_Crimson_Feilsch_15_00");	//Chci v�c zlat�ch!
	AI_Output(self,other,"DIA_Addon_Crimson_Feilsch_10_01");	//Hmm ... ne. To je norm�ln� cena, jakou dostane ka�d�.
	AI_Output(other,self,"DIA_Addon_Crimson_Feilsch_15_02");	//Mysl�m, �e toto je cena pro p��tele.
	AI_Output(self,other,"DIA_Addon_Crimson_Feilsch_10_03");	//To je, tady jsme v�ichni p��tel�.
};


instance DIA_ADDON_CRIMSON_GOLD(C_INFO)
{
	npc = bdt_1095_addon_crimson;
	nr = 99;
	condition = dia_addon_crimson_gold_condition;
	information = dia_addon_crimson_gold_info;
	permanent = TRUE;
	description = "Obchodujme ...";
};


func int dia_addon_crimson_gold_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_crimson_how))
	{
		return TRUE;
	};
};

func void dia_addon_crimson_gold_info()
{
	AI_Output(other,self,"DIA_Addon_Crimson_Gold_15_00");	//Obchodujme ...
	Info_ClearChoices(dia_addon_crimson_gold);
	Info_AddChoice(dia_addon_crimson_gold,DIALOG_BACK,dia_addon_crimson_gold_back);
	if(Npc_HasItems(other,itmi_goldnugget_addon) >= 1)
	{
		Info_AddChoice(dia_addon_crimson_gold,"Vym�n v�echny zlat� nugety",dia_addon_crimson_gold_alle);
		Info_AddChoice(dia_addon_crimson_gold,"Vym�n 1 zlat� nuget",dia_addon_crimson_gold_1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Crimson_Gold_10_01");	//Ale ty nem� ��dn� nugety
	};
};

func void dia_addon_crimson_gold_back()
{
	Info_ClearChoices(dia_addon_crimson_gold);
};

func void dia_addon_crimson_gold_alle()
{
	var int currentnuggets;
	currentnuggets = Npc_HasItems(other,itmi_goldnugget_addon);
	b_giveinvitems(other,self,itmi_goldnugget_addon,currentnuggets);
	b_giveinvitems(self,other,itmi_gold,currentnuggets * 10);
	Info_ClearChoices(dia_addon_crimson_gold);
	Info_AddChoice(dia_addon_crimson_gold,DIALOG_BACK,dia_addon_crimson_gold_back);
	if(Npc_HasItems(other,itmi_goldnugget_addon) >= 1)
	{
		Info_AddChoice(dia_addon_crimson_gold,"Vym�n v�echny zlat� nugety",dia_addon_crimson_gold_alle);
		Info_AddChoice(dia_addon_crimson_gold,"Vym�n 1 zlat� nuget",dia_addon_crimson_gold_1);
	};
};

func void dia_addon_crimson_gold_1()
{
	b_giveinvitems(other,self,itmi_goldnugget_addon,1);
	b_giveinvitems(self,other,itmi_gold,10);
	Info_ClearChoices(dia_addon_crimson_gold);
	Info_AddChoice(dia_addon_crimson_gold,DIALOG_BACK,dia_addon_crimson_gold_back);
	if(Npc_HasItems(other,itmi_goldnugget_addon) >= 1)
	{
		Info_AddChoice(dia_addon_crimson_gold,"Vym�n v�echny zlat� nugety",dia_addon_crimson_gold_alle);
		Info_AddChoice(dia_addon_crimson_gold,"Vym�n 1 zlat� nuget",dia_addon_crimson_gold_1);
	};
};

func void b_say_crimsonbeliar()
{
	AI_Output(self,other,"DIA_Addon_Crimson_FATAGN_LOS_10_00");	//(prosebn�) KHARDIMON FATAGN SCHATAR FATAGN BELIAR.
};


instance DIA_ADDON_CRIMSON_RAVEN(C_INFO)
{
	npc = bdt_1095_addon_crimson;
	nr = 9;
	condition = dia_addon_crimson_raven_condition;
	information = dia_addon_crimson_raven_info;
	permanent = FALSE;
	description = "Co v� o Ravenovi?";
};


func int dia_addon_crimson_raven_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_crimson_how))
	{
		return TRUE;
	};
};

func void dia_addon_crimson_raven_info()
{
	AI_Output(other,self,"DIA_Addon_Crimson_Raven_15_00");	//Co v� o Ravenovi?
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_01");	//Nebude� tomu v��it. Byl jsem tam. Vid�l jsem, co d�lal v hrobce!
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_02");	//(b�zliv�) Mumlal a ��kal jak�si divn� slova. Znovu a znovu ...
	b_say_crimsonbeliar();
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_03");	//(hlasit�) A potom jsem uvid�l oslepuj�c� sv�tlo a sly�el ten stra�n� v�k�ik.
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_04");	//M�j bo�e, ten zvuk. Bylo to, jako by se hroutil sv�t.
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_05");	//Raven s t�m mluvil, rozpr�v�li - Raven a TEN zvuk!
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_06");	//Nevzpom�n�m si, o �em spolu mluvili - vzpom�n�m si pouze, �e jsem se nemohl je�t� dlouho pohnout.
};


instance DIA_ADDON_CRIMSON_FATAGN(C_INFO)
{
	npc = bdt_1095_addon_crimson;
	nr = 98;
	condition = dia_addon_crimson_fatagn_condition;
	information = dia_addon_crimson_fatagn_info;
	permanent = TRUE;
	description = "M��e� mi zopakovat Ravenova slova j�t� jednou?";
};


func int dia_addon_crimson_fatagn_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_crimson_raven) && (CRIMSON_SAYBELIAR < 4))
	{
		return TRUE;
	};
};

func void dia_addon_crimson_fatagn_info()
{
	CRIMSON_SAYBELIAR = CRIMSON_SAYBELIAR + 1;
	AI_Output(other,self,"DIA_Addon_Crimson_FATAGN_15_00");	//M��e� mi zopakovat Ravenova slova j�t� jednou?
	if(CRIMSON_SAYBELIAR <= 3)
	{
		AI_Output(self,other,"DIA_Addon_Crimson_FATAGN_10_01");	//Jist�, m��u.
		Info_ClearChoices(dia_addon_crimson_fatagn);
		Info_AddChoice(dia_addon_crimson_fatagn,"Ano?",dia_addon_crimson_fatagn_los);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Crimson_FATAGN_10_02");	//Mysl�m �e bude l�pe, kdy� toho nech�me ...
	};
};

func void dia_addon_crimson_fatagn_los()
{
	Snd_Play("Mystery_09");
	b_say_crimsonbeliar();
	if(CRIMSON_SAYBELIAR == 3)
	{
		Wld_PlayEffect("FX_EARTHQUAKE",self,self,0,0,0,FALSE);
		Wld_PlayEffect("DEMENTOR_FX",self,self,0,0,0,FALSE);
	};
	Info_ClearChoices(dia_addon_crimson_fatagn);
};

