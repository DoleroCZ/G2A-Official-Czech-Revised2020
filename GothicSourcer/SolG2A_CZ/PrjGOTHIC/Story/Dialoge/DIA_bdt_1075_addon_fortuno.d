
instance DIA_ADDON_FORTUNO_EXIT(C_INFO)
{
	npc = bdt_1075_addon_fortuno;
	nr = 999;
	condition = dia_addon_fortuno_exit_condition;
	information = dia_addon_fortuno_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_fortuno_exit_condition()
{
	return TRUE;
};

func void dia_addon_fortuno_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_FORTUNO_PICKPOCKET(C_INFO)
{
	npc = bdt_1075_addon_fortuno;
	nr = 900;
	condition = dia_addon_fortuno_pickpocket_condition;
	information = dia_addon_fortuno_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_addon_fortuno_pickpocket_condition()
{
	return c_beklauen(10,25);
};

func void dia_addon_fortuno_pickpocket_info()
{
	Info_ClearChoices(dia_addon_fortuno_pickpocket);
	Info_AddChoice(dia_addon_fortuno_pickpocket,DIALOG_BACK,dia_addon_fortuno_pickpocket_back);
	Info_AddChoice(dia_addon_fortuno_pickpocket,DIALOG_PICKPOCKET,dia_addon_fortuno_pickpocket_doit);
};

func void dia_addon_fortuno_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_fortuno_pickpocket);
};

func void dia_addon_fortuno_pickpocket_back()
{
	Info_ClearChoices(dia_addon_fortuno_pickpocket);
};


instance DIA_ADDON_FORTUNO_HI(C_INFO)
{
	npc = bdt_1075_addon_fortuno;
	nr = 2;
	condition = dia_addon_fortuno_hi_condition;
	information = dia_addon_fortuno_hi_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_fortuno_hi_condition()
{
	if(Npc_IsInState(self,zs_talk) && (FORTUNO_GEHEILT_01 == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_fortuno_hi_info()
{
	if(FORTUNO_EINMAL == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Fortuno_Hi_13_00");	//(vystra�en�) �ern� mrak nad domem ... ON p�ich�z� ...
		AI_Output(self,other,"DIA_Addon_Fortuno_Hi_13_01");	//S krv� ... p�ivol�v� ho ... ON m� sleduje ... on m� sleduje ... oh ne, ztra� se, vypadni ...
		AI_Output(other,self,"DIA_Addon_Fortuno_Hi_15_02");	//Jsi v po��dku?
		FORTUNO_EINMAL = TRUE;
		Log_CreateTopic(TOPIC_ADDON_FORTUNO,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_FORTUNO,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_FORTUNO,"Fortuno je mimo. Pot�ebuje 'Zelen�ho Novice'.");
	};
	AI_Output(self,other,"DIA_Addon_Fortuno_Hi_13_03");	//Zelen� ... zelen� novic ... nem��u ho naj�t ...
	Info_ClearChoices(dia_addon_fortuno_hi);
	Info_AddChoice(dia_addon_fortuno_hi,"Vr�t�m se pozd�ji...(konec)",dia_addon_fortuno_hi_back);
	Info_AddChoice(dia_addon_fortuno_hi,"M��u ti pomoci?",dia_addon_fortuno_hi_hilfe);
	if(Npc_HasItems(other,itmi_joint) >= 1)
	{
		Info_AddChoice(dia_addon_fortuno_hi,"Tady, vezmi si tohle st�blo.",dia_addon_fortuno_hi_joint);
	};
	if(Npc_HasItems(other,itmi_addon_joint_01) >= 1)
	{
		Info_AddChoice(dia_addon_fortuno_hi,"Ok, zkus tohle - 'Zelen� Novic'.",dia_addon_fortuno_hi_green);
	};
};

func void dia_addon_fortuno_hi_back()
{
	Info_ClearChoices(dia_addon_fortuno_hi);
	AI_StopProcessInfos(self);
};

func void dia_addon_fortuno_hi_hilfe()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Hi_HILFE_15_00");	//M��u ti pomoci?
	AI_Output(self,other,"DIA_Addon_Fortuno_Hi_HILFE_13_01");	//zelen� ... zelen� novic pom�h� novic�m ...
};

func void dia_addon_fortuno_hi_joint()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Hi_JOINT_15_00");	//Tady, vezmi si tohle st�blo.
	if(b_giveinvitems(other,self,itmi_joint,1))
	{
		AI_UseItem(self,itmi_joint);
	};
	AI_Output(self,other,"DIA_Addon_Fortuno_Hi_JOINT_13_01");	//Nen� zelen�, nen� siln�, nen� zelen�, nen� siln� ...
};

func void dia_addon_fortuno_hi_green()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Hi_GREEN_15_00");	//Ok, zkus tohle - 'Zelen� Novic'.
	if(b_giveinvitems(other,self,itmi_addon_joint_01,1))
	{
		AI_UseItem(self,itmi_addon_joint_01);
	};
	AI_Output(self,other,"DIA_Addon_Fortuno_Hi_GREEN_13_01");	//(vyl��en�) AAAHHH ...
	AI_Output(self,other,"DIA_Addon_Fortuno_Hi_GREEN_13_02");	//Moje my�lenky ... kdo ... jsem ... Fortuno ... co ... co se d�je?
	Info_ClearChoices(dia_addon_fortuno_hi);
	FORTUNO_GEHEILT_01 = TRUE;
	b_giveplayerxp(XP_ADDON_FORTUNO_01);
	b_logentry(TOPIC_ADDON_FORTUNO,"'Zelen� Novic' obnovil Fortunovy smysly.");
};


instance DIA_ADDON_FORTUNO_WER(C_INFO)
{
	npc = bdt_1075_addon_fortuno;
	nr = 2;
	condition = dia_addon_fortuno_wer_condition;
	information = dia_addon_fortuno_wer_info;
	permanent = FALSE;
	description = "Ok, te� mi �ekni, co s tebou je.";
};


func int dia_addon_fortuno_wer_condition()
{
	if(FORTUNO_GEHEILT_01 == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_fortuno_wer_info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_wer_15_00");	//Ok, te� mi �ekni, co s tebou je.
	AI_Output(self,other,"DIA_Addon_Fortuno_wer_13_01");	//Jednou jsem byl �lenem Bratrstva Sp��e. Na cest� zp�t bylo je�t� v�e v po��dku.
	AI_Output(self,other,"DIA_Addon_Fortuno_wer_13_02");	//Jist�, v�ichni jsme byli p�esv�d�en� krimin�ln�ci, ale �ivot byl pro n�s novice celkem dobr� ...
	AI_Output(other,self,"DIA_Addon_Fortuno_wer_15_03");	//Hej, j� jsem byl tak� v�ze� d�ln� kolonie. �ekni mi n�co, co je�t� nev�m.
	AI_Output(self,other,"DIA_Addon_Fortuno_wer_13_04");	//J� ... nic si nepamatuju. Temnota zast�ela moji mysl ...
	AI_Output(other,self,"DIA_Addon_Fortuno_wer_15_05");	//No tak. Zkus se soust�edit. Co se stalo? Jak m��e� znovu z�skat v�dom�?
	AI_Output(self,other,"DIA_Addon_Fortuno_wer_13_06");	//Raven ... pamatuju si jenom na Ravena a ... temn� pokoje.
	AI_Output(other,self,"DIA_Addon_Fortuno_wer_15_07");	//Co je s Ravenem? Co ti ud�lal?
	AI_Output(self,other,"DIA_Addon_Fortuno_wer_13_08");	//(vzdych�) Omlouv�m se. Vypad� to, jako by byla moje mysl uv�zn�na ... S�m tomu nerozum�m ...
};


instance DIA_ADDON_FORTUNO_FREE(C_INFO)
{
	npc = bdt_1075_addon_fortuno;
	nr = 5;
	condition = dia_addon_fortuno_free_condition;
	information = dia_addon_fortuno_free_info;
	permanent = FALSE;
	description = "Mus� existovat cesta jak ti vr�tit vzpom�nky.";
};


func int dia_addon_fortuno_free_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_fortuno_wer))
	{
		return TRUE;
	};
};

func void dia_addon_fortuno_free_info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_FREE_15_00");	//Mus� existovat cesta jak ti vr�tit vzpom�nky.
	AI_Output(self,other,"DIA_Addon_Fortuno_FREE_13_01");	//Hmm ... jo, mo�n� by to �lo.
	AI_Output(self,other,"DIA_Addon_Fortuno_FREE_13_02");	//Guru znali v�echno mo�n� o manipulaci s mysl�.
	AI_Output(other,self,"DIA_Addon_Fortuno_FREE_15_03");	//A TY o tom n�co v�?
	AI_Output(self,other,"DIA_Addon_Fortuno_FREE_13_04");	//Ne, boj�m se, �e tyto znalosti u� jsou pry� ...
	AI_Output(other,self,"DIA_Addon_Fortuno_FREE_15_05");	//Kruci. Jestli je tady cesta jak ti pomoci, najdu ji.
	Wld_InsertNpc(bloodfly,"ADW_PATH_TO_BL_09");
	Wld_InsertNpc(bloodfly,"ADW_PATH_TO_BL_10");
	Wld_InsertNpc(bloodfly,"ADW_PATH_TO_BL_10");
	Wld_InsertNpc(bloodfly,"ADW_PATH_TO_LOCH_01");
	Wld_InsertNpc(bloodfly,"ADW_PATH_TO_LOCH_01");
	b_logentry(TOPIC_ADDON_FORTUNO,"Fortuno u� je du�evn� v po��dku, st�le si ale nic nepamatuje.");
};


instance DIA_ADDON_FORTUNO_HERB(C_INFO)
{
	npc = bdt_1075_addon_fortuno;
	nr = 99;
	condition = dia_addon_fortuno_herb_condition;
	information = dia_addon_fortuno_herb_info;
	permanent = FALSE;
	description = "Pot�ebuje� dal�� st�bla?";
};


func int dia_addon_fortuno_herb_condition()
{
	if(FORTUNO_GEHEILT_01 == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_fortuno_herb_info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Herb_15_00");	//Pot�ebuje� dal�� st�bla?
	AI_Output(self,other,"DIA_Addon_Fortuno_Herb_13_01");	//No jooo. Vezmu si v�echny, co m�.
	AI_Output(self,other,"DIA_Addon_Fortuno_Herb_13_02");	//Dokonce zaplat�m v�ce ne� Fisk.
};

func void b_fortuno_infomanager()
{
	Info_ClearChoices(dia_addon_fortuno_trade);
	Info_AddChoice(dia_addon_fortuno_trade,DIALOG_BACK,dia_addon_fortuno_trade_back);
	if(Npc_HasItems(other,itpl_swampherb) >= 1)
	{
		Info_AddChoice(dia_addon_fortuno_trade,"(P�edat v�echny st�bla)",dia_addon_fortuno_trade_all);
		Info_AddChoice(dia_addon_fortuno_trade,"(P�edat jedno st�blo)",dia_addon_fortuno_trade_1);
	};
};


instance DIA_ADDON_FORTUNO_TRADE(C_INFO)
{
	npc = bdt_1075_addon_fortuno;
	nr = 100;
	condition = dia_addon_fortuno_trade_condition;
	information = dia_addon_fortuno_trade_info;
	permanent = TRUE;
	description = "M�m pro tebe n�jak� st�bla ...";
};


func int dia_addon_fortuno_trade_condition()
{
	if((Npc_HasItems(other,itpl_swampherb) >= 1) && Npc_KnowsInfo(other,dia_addon_fortuno_herb))
	{
		return TRUE;
	};
};

func void dia_addon_fortuno_trade_info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Trade_15_00");	//M�m pro tebe n�jak� st�bla ...
	b_fortuno_infomanager();
};

func void dia_addon_fortuno_trade_back()
{
	Info_ClearChoices(dia_addon_fortuno_trade);
};

func void dia_addon_fortuno_trade_all()
{
	var int amount;
	amount = Npc_HasItems(other,itpl_swampherb);
	if(b_giveinvitems(other,self,itpl_swampherb,amount))
	{
		Npc_RemoveInvItems(self,itpl_swampherb,Npc_HasItems(self,itpl_swampherb));
	};
	b_giveinvitems(self,other,itmi_gold,amount * VALUE_SWAMPHERB);
	b_giveplayerxp(amount * 10);
	b_fortuno_infomanager();
};

func void dia_addon_fortuno_trade_1()
{
	if(b_giveinvitems(other,self,itpl_swampherb,1))
	{
		Npc_RemoveInvItems(self,itpl_swampherb,Npc_HasItems(self,itpl_swampherb));
	};
	b_giveinvitems(self,other,itmi_gold,VALUE_SWAMPHERB);
	b_giveplayerxp(10);
	b_fortuno_infomanager();
};


instance DIA_ADDON_FORTUNO_TRANK(C_INFO)
{
	npc = bdt_1075_addon_fortuno;
	nr = 3;
	condition = dia_addon_fortuno_trank_condition;
	information = dia_addon_fortuno_trank_info;
	permanent = FALSE;
	description = "M�m pro tebe tenhle lektvar ...";
};


func int dia_addon_fortuno_trank_condition()
{
	if((FORTUNO_GEHEILT_01 == TRUE) && Npc_KnowsInfo(other,dia_addon_fortuno_free) && ((Npc_HasItems(other,itpo_addon_geist_01) >= 1) || (Npc_HasItems(other,itpo_addon_geist_02) >= 1)))
	{
		return TRUE;
	};
};

func void dia_addon_fortuno_trank_info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Trank_15_00");	//M�m pro tebe tenhle lektvar. M�l by ti vr�tit vzpom�nky.
	AI_Output(self,other,"DIA_Addon_Fortuno_Trank_13_01");	//Budu ti v��it ...
	if(Npc_HasItems(other,itpo_addon_geist_02) >= 1)
	{
		if(b_giveinvitems(other,self,itpo_addon_geist_02,1))
		{
			AI_UseItem(self,itpo_addon_geist_02);
		};
		b_giveplayerxp(XP_ADDON_FORTUNO_02);
	}
	else if(b_giveinvitems(other,self,itpo_addon_geist_01,1))
	{
		Log_SetTopicStatus(TOPIC_ADDON_FORTUNO,LOG_OBSOLETE);
		AI_StopProcessInfos(self);
		AI_UseItem(self,itpo_addon_geist_01);
	};
};


instance DIA_ADDON_FORTUNO_MORE(C_INFO)
{
	npc = bdt_1075_addon_fortuno;
	nr = 2;
	condition = dia_addon_fortuno_more_condition;
	information = dia_addon_fortuno_more_info;
	permanent = FALSE;
	description = "No ...?";
};


func int dia_addon_fortuno_more_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_fortuno_trank))
	{
		return TRUE;
	};
};

func void dia_addon_fortuno_more_info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_more_15_00");	//No ...?
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_01");	//A��! J� ... j� si pamatuju! Vid�m ... Adanos mi pomohl ... co m�m ud�lat!?
	AI_Output(other,self,"DIA_Addon_Fortuno_more_15_02");	//Jo, co m� ud�lat? A hlavn�, co m� Raven ud�lat?
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_03");	//Pomohl jsem mu ... nav�zat kontakt. JEMU. Cht�l hodn� lektvar� ... Va�il jsem mu je.
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_04");	//Sna�il se otev��t port�l aby se dostal do chr�mu.
	AI_Output(other,self,"DIA_Addon_Fortuno_more_15_05");	//Pro�? Co cht�l d�lat v chr�mu?
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_06");	//Mocn� artefakt ... l�i zni�� ka�d�ho kdo by ho cht�l ovl�dat. Mocn� v�le�n�k bude ten, kdo se mu podvol� ...
	AI_Output(other,self,"DIA_Addon_Fortuno_more_15_07");	//A ... ?
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_08");	//Nepoda�ilo se n�m otev��t port�l ...
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_09");	//Nicm�n�, Raven byl p�esv�d�en�, �e ho otev�e, POKUD odkryje hrobku kn�z�.
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_10");	//A to je ten d�vod, pro� sem dot�hl v�echny ty otroky. Loutky, kter� tu budou p�inuceny kopat.
	AI_Output(other,self,"DIA_Addon_Fortuno_more_15_11");	//Hrobka kn�z�?
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_12");	//Hrobka Adanosova kn�ze. Je v dole.
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_13");	//Tak� si pamatuju na n�jak� kamenn� tabulky. Raven v���, �e mu uk�ou cestu.
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_14");	//Nakonec se mu povedlo rozlu�tit n�pis a j� se pro n�ho stal p�ebyte�n�m.
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_15");	//Za�aroval m� abych v�echno zapomn�l. A ty jsi m� osvobodil.
	SC_KNOWSFORTUNOINFOS = TRUE;
	b_logentry(TOPIC_ADDON_RAVENKDW,"Raven pl�nuje z�skat n�jak� mocn� artefakt z chr�mu.");
	Log_AddEntry(TOPIC_ADDON_RAVENKDW,"Z n�jak�ho d�vodu vykopal Raven ve zlat�m dole hrob jednoho z kn�z� star� kultury.");
	Log_AddEntry(TOPIC_ADDON_RAVENKDW,"Raven v���, �e n�kter� kamenn� tabulky mu pom��ou.");
	Npc_ExchangeRoutine(self,"START");
	b_giveplayerxp(XP_ADDON_FORTUNO_03);
};


instance DIA_ADDON_FORTUNO_ATTENTAT(C_INFO)
{
	npc = bdt_1075_addon_fortuno;
	nr = 9;
	condition = dia_addon_fortuno_attentat_condition;
	information = dia_addon_fortuno_attentat_info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int dia_addon_fortuno_attentat_condition()
{
	if((MIS_JUDAS == LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_fortuno_trank))
	{
		return TRUE;
	};
};

func void dia_addon_fortuno_attentat_info()
{
	b_say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Fortuno_Attentat_13_00");	//Pokus o vra�du? Promi�, nebyl jsem ... p��tomen. Nev�m o tom nic.
};

