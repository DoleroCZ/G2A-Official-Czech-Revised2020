
instance DIA_ADDON_FRANCIS_EXIT(C_INFO)
{
	npc = pir_1350_addon_francis;
	nr = 999;
	condition = dia_addon_francis_exit_condition;
	information = dia_addon_francis_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_francis_exit_condition()
{
	if(GREGISBACK == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_francis_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_FRANCIS_FIRST(C_INFO)
{
	npc = pir_1350_addon_francis;
	nr = 1;
	condition = dia_addon_francis_first_condition;
	information = dia_addon_francis_first_info;
	permanent = FALSE;
	description = "To je tv· chatrË?";
};


func int dia_addon_francis_first_condition()
{
	if((KNOWS_GREGSHUT == FALSE) && (FRANCIS_AUSGESCHISSEN == FALSE) && Npc_HasItems(self,itke_greg_addon_mis))
	{
		return TRUE;
	};
};

func void dia_addon_francis_first_info()
{
	AI_Output(other,self,"DIA_Addon_Francis_GregsHut_15_00");	//To je tv· chatrË?
	AI_Output(self,other,"DIA_Addon_Francis_GregsHut_13_01");	//Ne, pat¯Ì Gregovi.
	KNOWS_GREGSHUT = TRUE;
};


instance DIA_ADDON_FRANCIS_LETMEIN(C_INFO)
{
	npc = pir_1350_addon_francis;
	nr = 2;
	condition = dia_addon_francis_letmein_condition;
	information = dia_addon_francis_letmein_info;
	permanent = FALSE;
	description = "MusÌm se dostat dovnit¯ do Gregovy chatrËe.";
};


func int dia_addon_francis_letmein_condition()
{
	if((Npc_KnowsInfo(other,dia_addon_francis_first) || (KNOWS_GREGSHUT == TRUE)) && (FRANCIS_AUSGESCHISSEN == FALSE) && Npc_HasItems(self,itke_greg_addon_mis))
	{
		return TRUE;
	};
};

func void dia_addon_francis_letmein_info()
{
	AI_Output(other,self,"DIA_Addon_Francis_LetMeIn_15_00");	//MusÌm se dostat dovnit¯ do Gregovy chatrËe.
	AI_Output(self,other,"DIA_Addon_Francis_LetMeIn_13_01");	//Nikdy!
	AI_Output(self,other,"DIA_Addon_Francis_LetMeIn_13_02");	//Greg tu nenÌ. Zamkl jsem dve¯e a ujistil se, ûe nikdo nedostane n·pad se tam vloupat.
	AI_Output(self,other,"DIA_Addon_Francis_LetMeIn_13_03");	//OdjeÔ nebo nedopadneö dob¯e.
};


instance DIA_ADDON_FRANCIS_ABOUTGREG(C_INFO)
{
	npc = pir_1350_addon_francis;
	nr = 3;
	condition = dia_addon_francis_aboutgreg_condition;
	information = dia_addon_francis_aboutgreg_info;
	permanent = FALSE;
	description = "Greg je tv˘j öÈf?";
};


func int dia_addon_francis_aboutgreg_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_francis_letmein) && (FRANCIS_AUSGESCHISSEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_francis_aboutgreg_info()
{
	AI_Output(other,self,"DIA_Addon_Francis_AboutGreg_15_00");	//Greg je tv˘j öÈf?
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_01");	//NynÌ tu nenÌ, ale zn·m ho!
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_02");	//Kaûd˝ n·mo¯nÌk, jak ¯Ìk·m, kaûd˝ suchozemec na tomto ostrovÏ zn· straönÈho kapit·na Grega!
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_03");	//(nad¯azenÏ) SvÏ¯il mi zde velenÌ!
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_04");	//Jsem zodpovÏdn˝ za tento t·bor, kter˝ mi byl svÏ¯en!
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_05");	//NÏkte¯Ì hoöi si myslÌ, ûe si mohou dÏlat, co chtÏjÌ, kdyû tu kapit·n Greg nenÌ.
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_06");	//Ale budou velice p¯ekvapeni, aû se Greg vr·tÌ.
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_07");	//ÿeknu mu vöe, co se zde stalo, slyöÌö?
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_08");	//A taky vÏci, jako kdo chce vstoupit do jeho chatrËe.
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_09");	//Tak radöi vypadni, jestli je ti ûivot mil˝.
};


var int francis_bezahlt;

instance DIA_ADDON_FRANCIS_KEY(C_INFO)
{
	npc = pir_1350_addon_francis;
	nr = 4;
	condition = dia_addon_francis_key_condition;
	information = dia_addon_francis_key_info;
	permanent = TRUE;
	description = "Dej mi klÌË od Gregovy chatrËe!";
};


func int dia_addon_francis_key_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_francis_letmein) && Npc_HasItems(self,itke_greg_addon_mis))
	{
		return TRUE;
	};
};

func void dia_addon_francis_key_info()
{
	AI_Output(other,self,"DIA_Addon_Francis_Key_15_00");	//Dej mi klÌË od Gregovy chatrËe!
	AI_Output(self,other,"DIA_Addon_Francis_Key_13_01");	//MusÌö si dÏlat legraci!
	Info_ClearChoices(dia_addon_francis_key);
	Info_AddChoice(dia_addon_francis_key,"Pop¯em˝ölÌm o tom...",dia_addon_francis_key_back);
	Info_AddChoice(dia_addon_francis_key,"D·m ti 2000 zlata!",dia_addon_francis_key_2000gold);
	Info_AddChoice(dia_addon_francis_key,"D·m ti 1000 zlata!",dia_addon_francis_key_1000gold);
};

func void dia_addon_francis_key_back()
{
	Info_ClearChoices(dia_addon_francis_key);
};

func void dia_addon_francis_key_1000gold()
{
	AI_Output(other,self,"DIA_Addon_Francis_Key_1000Gold_15_00");	//D·m ti 1000 zlata!
	AI_Output(self,other,"DIA_Addon_Francis_Key_1000Gold_13_01");	//To je trochu m·lo za zradu kapit·na, nemyslÌö?
	AI_Output(self,other,"DIA_Addon_Francis_Key_1000Gold_13_02");	//D·vej si vÌc pozor, co ¯Ìk·ö! Jinak bych ti byl nucen d·t asi po¯·dn˝ v˝prask!
};

func void dia_addon_francis_key_2000gold()
{
	AI_Output(other,self,"DIA_Addon_Francis_Key_2000Gold_15_00");	//D·m ti 2000 zlata!
	if(Npc_HasItems(other,itmi_gold) >= 2000)
	{
		AI_Output(self,other,"DIA_Addon_Francis_Key_2000Gold_13_01");	//Chlape, ty po mnÏ û·d·ö vzpouru!
		AI_Output(self,other,"DIA_Addon_Francis_Key_2000Gold_13_02");	//(k sobÏ) Ale kdyû se nad tÌm zamyslÌm ...
		AI_Output(self,other,"DIA_Addon_Francis_Key_2000Gold_13_03");	//Ah, ruku na to, nikdo na to nep¯ijde.
		AI_Output(self,other,"DIA_Addon_Francis_Key_2000Gold_13_04");	//Tu je klÌË!
		AI_Output(self,other,"DIA_Addon_Francis_Key_2000Gold_13_05");	//Ale rychle, dokud se Greg nevr·til! A ani slovo ostatnÌm, slyöÌö?!
		b_giveinvitems(other,self,itmi_gold,2000);
		b_giveinvitems(self,other,itke_greg_addon_mis,1);
		FRANCIS_BEZAHLT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_FrancisNotEnoughGold_13_05");	//(smÏje se) Ha! Ty nem·ö tolik penÏz!
	};
	Info_ClearChoices(dia_addon_francis_key);
};


instance DIA_ADDON_FRANCIS_AUFSMAUL(C_INFO)
{
	npc = pir_1350_addon_francis;
	nr = 5;
	condition = dia_addon_francis_aufsmaul_condition;
	information = dia_addon_francis_aufsmaul_info;
	permanent = TRUE;
	description = "Dob¯e, podÌv·me se, jak na tom jsi.";
};


func int dia_addon_francis_aufsmaul_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_francis_letmein) && Npc_HasItems(self,itke_greg_addon_mis))
	{
		return TRUE;
	};
};

func void dia_addon_francis_aufsmaul_info()
{
	AI_Output(other,self,"DIA_Addon_Francis_AufsMaul_15_00");	//Dob¯e, podÌv·me se, jak na tom jsi.
	AI_Output(self,other,"DIA_Addon_Francis_AufsMaul_13_01");	//(pronikavÏ) Co? J· jsem tady kapit·n!
	AI_Output(self,other,"DIA_Addon_Francis_AufsMaul_13_02");	//J· tÏ nauËÌm zp˘sob˘m, ty suchozemsk· kryso!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_ADDON_FRANCIS_BUCH(C_INFO)
{
	npc = pir_1350_addon_francis;
	nr = 5;
	condition = dia_addon_francis_buch_condition;
	information = dia_addon_francis_buch_info;
	permanent = TRUE;
	description = "Naöel jsem tvoje malÈ doupÏ...";
};


func int dia_addon_francis_buch_condition()
{
	if(Npc_HasItems(other,itwr_addon_francisabrechnung_mis))
	{
		return TRUE;
	};
};

func void dia_addon_francis_buch_info()
{
	AI_Output(other,self,"DIA_Addon_Francis_Key_Business_15_03");	//Naöel jsem tvoje malÈ doupÏ. Tv˘j poklad a v˝platnÌ listinu. To je tv· knÌûeËka, nebo ne?
	AI_Output(self,other,"DIA_Addon_Francis_Buch_13_01");	//Er ... Nikdy jsem tu knÌûku nevidÏl ...
	AI_Output(self,other,"DIA_Addon_Francis_Buch_13_02");	//A ... er ... a kdyby to bylo moje ...
	AI_Output(self,other,"DIA_Addon_Francis_Buch_13_03");	//A ty si skuteËnÏ myslÌö, ûe hoöi uvÏ¯Ì nÏjakÈmu zaûloutlÈmu kusu papÌru?
	AI_Output(other,self,"DIA_Addon_Francis_Key_Business_15_01");	//Ty jsi je oöidil o Ë·st jejich podÌlu!
	AI_Output(self,other,"DIA_Addon_Francis_Buch_13_04");	//Er ... PoËkej ...
	if(Npc_HasItems(self,itke_greg_addon_mis))
	{
		if(Npc_KnowsInfo(other,dia_addon_francis_letmein))
		{
			AI_Output(self,other,"DIA_Addon_Francis_Buch_13_05");	//(tiöe) NechtÏls klÌË od Gregovy chatrËe ...
		};
		AI_Output(self,other,"DIA_Addon_Francis_Buch_13_06");	//D·m ti klÌË ke GregovÏ chatrËi!
		AI_Output(self,other,"DIA_Addon_Francis_Buch_13_07");	//M˘ûeö tam vzÌt mnoho zajÌmav˝ch vÏcÌ...
		AI_Output(self,other,"DIA_Addon_Francis_Buch_13_08");	//(rozruöenÏ) Ale d·ö mi tu knihu a budeö o tom mlËet, jasnÈ?
		b_giveinvitems(other,self,itwr_addon_francisabrechnung_mis,1);
		b_giveinvitems(self,other,itke_greg_addon_mis,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Francis_Buch_13_09");	//Jen neudÏlej nic hloupÈho!
		if((FRANCIS_BEZAHLT == TRUE) && (Npc_HasItems(self,itmi_gold) >= 2000))
		{
			AI_Output(self,other,"DIA_Addon_Francis_Buch_13_10");	//Tady m·ö 2000 zlata!
			AI_Output(self,other,"DIA_Addon_Francis_Buch_13_11");	//A 500 navÌc.
			b_giveinvitems(self,other,itmi_gold,2500);
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Francis_Buch_13_12");	//Tady m·ö 500 zlata!
			b_giveinvitems(self,other,itmi_gold,500);
		};
		AI_Output(self,other,"DIA_Addon_Francis_Buch_13_13");	//(naötvanÏ) A nynÌ mÏ nech ...
		b_giveinvitems(other,self,itwr_addon_francisabrechnung_mis,1);
	};
	AI_StopProcessInfos(self);
};


instance DIA_FRANCIS_PICKPOCKET(C_INFO)
{
	npc = pir_1350_addon_francis;
	nr = 900;
	condition = dia_francis_pickpocket_condition;
	information = dia_francis_pickpocket_info;
	permanent = TRUE;
	description = "(Ukr·st tento klÌË bude jednoduchÈ.)";
};


func int dia_francis_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_greg_addon_mis) >= 1) && (other.attribute[ATR_DEXTERITY] >= (40 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_francis_pickpocket_info()
{
	Info_ClearChoices(dia_francis_pickpocket);
	Info_AddChoice(dia_francis_pickpocket,DIALOG_BACK,dia_francis_pickpocket_back);
	Info_AddChoice(dia_francis_pickpocket,DIALOG_PICKPOCKET,dia_francis_pickpocket_doit);
};

func void dia_francis_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 40)
	{
		b_giveinvitems(self,other,itke_greg_addon_mis,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_giveplayerxp(XP_AMBIENT);
		Info_ClearChoices(dia_francis_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
	Info_ClearChoices(dia_francis_pickpocket);
};

func void dia_francis_pickpocket_back()
{
	Info_ClearChoices(dia_francis_pickpocket);
};


instance DIA_FRANCIS_AUSGESCHISSEN(C_INFO)
{
	npc = pir_1350_addon_francis;
	nr = 900;
	condition = dia_francis_ausgeschissen_condition;
	information = dia_francis_ausgeschissen_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_francis_ausgeschissen_condition()
{
	if((FRANCIS_AUSGESCHISSEN == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_francis_ausgeschissen_info()
{
	if(!Npc_IsDead(greg))
	{
		AI_Output(self,other,"DIA_Addon_Francis_Ausgeschissen_13_00");	//(nahlas) Protoûe by mÏ Greg  jinak nechal k·cet stromy do posednÌho zbylÈho ke¯ÌËku!
	};
	AI_Output(self,other,"DIA_Addon_Francis_Ausgeschissen_13_01");	//Ztraù se!
	AI_StopProcessInfos(self);
};

