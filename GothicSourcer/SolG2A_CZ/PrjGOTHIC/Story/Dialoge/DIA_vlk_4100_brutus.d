
instance DIA_BRUTUS_EXIT(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 999;
	condition = dia_brutus_exit_condition;
	information = dia_brutus_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_brutus_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_brutus_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_BRUTUS_AFTER_FIGHT(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 1;
	condition = dia_brutus_after_fight_condition;
	information = dia_brutus_after_fight_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_brutus_after_fight_condition()
{
	if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_NONE) && (self.aivar[AIV_LASTFIGHTCOMMENT] == FALSE) && Npc_IsInState(self,zs_talk) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_after_fight_info()
{
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(other,self,"DIA_Brutus_AFTER_FIGHT_15_00");	//Tak co, m� je�t� po��d v�echny zuby?
		AI_Output(self,other,"DIA_Brutus_AFTER_FIGHT_06_01");	//Chlape, ty jsi p�kn� po��zek! Necht�l bych se s tebou utkat, to teda ne.
	}
	else if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON)
	{
		AI_Output(other,self,"DIA_Brutus_AFTER_FIGHT_15_02");	//Mysl�m, �e bys mi zlomil v�echny �ebra, ne-li n�co hor��ho.
		AI_Output(self,other,"DIA_Brutus_AFTER_FIGHT_06_03");	//A j� t� taky neml�til plnou silou. No nevad�, m�m r�d chlapy, kter� n�jak� ta r�na hned tak neskl�t�.
		if(BRUTUS_EINMALIG == FALSE)
		{
			AI_Output(self,other,"DIA_Brutus_AFTER_FIGHT_06_04");	//Tenhle lektvar t� zase postav� na nohy a s �trobami d�l� hotov� z�zraky!
			CreateInvItems(self,itpo_health_01,1);
			b_giveinvitems(self,hero,itpo_health_01,1);
			BRUTUS_EINMALIG = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Brutus_AFTER_FIGHT_06_05");	//Nem�m nic proti dobr�mu boji, ale kdy� se za�nu b�t, tak taky v�m, kdy skon�it.
	};
	self.aivar[AIV_LASTFIGHTCOMMENT] = TRUE;
};


instance DIA_BRUTUS_PRISONER(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 2;
	condition = dia_brutus_prisoner_condition;
	information = dia_brutus_prisoner_info;
	description = "Co tu m� na pr�ci?";
};


func int dia_brutus_prisoner_condition()
{
	if((KAPITEL < 3) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_prisoner_info()
{
	AI_Output(other,self,"DIA_Brutus_PRISONER_15_00");	//Co tu m� na pr�ci?
	AI_Output(self,other,"DIA_Brutus_PRISONER_06_01");	//Co m�m na pr�ci? Cvi��m tyhle ho�any. U��m je, jak z�skat ocelov� svaly.
	AI_Output(self,other,"DIA_Brutus_PRISONER_06_02");	//Taky se star�m o v�zn�, jsem pro ty bastardy n�co jako zatracen� p��sn� otec!
	AI_Output(self,other,"DIA_Brutus_PRISONER_06_03");	//Ale opravdov� um�n� je p�im�t je k hovoru. A v�� mi - j� rozv�u jazyk �pln� ka�d�mu.
	AI_Output(other,self,"DIA_Brutus_PRISONER_15_04");	//To zn� d�siv� hezky.
	AI_Output(self,other,"DIA_Brutus_PRISONER_06_05");	//Ale ti zable�en� zabedn�nci, kter� jsme te� zab�sli, n�m toho moc ne�eknou - ani nemaj� co.
	if(MIS_RESCUEGORN != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Brutus_PRISONER_06_06");	//A tak se nebudu moci vypo��dat s t�m Gornem.
		KNOWSABOUTGORN = TRUE;
	};
};


instance DIA_BRUTUS_PERM(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 90;
	condition = dia_brutus_perm_condition;
	information = dia_brutus_perm_info;
	permanent = TRUE;
	description = "N�co nov�ho?";
};


func int dia_brutus_perm_condition()
{
	if(Npc_KnowsInfo(hero,dia_brutus_prisoner) && (KAPITEL < 3) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_perm_info()
{
	AI_Output(other,self,"DIA_Brutus_PERM_15_00");	//N�co nov�ho?
	AI_Output(self,other,"DIA_Brutus_PERM_06_01");	//V�ecko vypad� klidn�. ��dn� nov� v�zni - nikomu nem��u pom�hat hledat spr�vn� slova - je to prost� zl�.
	b_npcclearobsessionbydmt(self);
};


instance DIA_BRUTUS_KASSE(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 2;
	condition = dia_brutus_kasse_condition;
	information = dia_brutus_kasse_info;
	permanent = FALSE;
	description = "Mohl bys m� cvi�it?";
};


func int dia_brutus_kasse_condition()
{
	if(Npc_KnowsInfo(hero,dia_brutus_prisoner) && (KAPITEL < 3) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_kasse_info()
{
	AI_Output(other,self,"DIA_Brutus_Kasse_15_00");	//Mohl bys m� cvi�it?
	AI_Output(self,other,"DIA_Brutus_Kasse_06_01");	//Jasn� - m��u ti pomoci zv��it s�lu, ale zadarmo ani ku�e nehrabe.
	AI_Output(other,self,"DIA_Brutus_Kasse_15_02");	//Kolik chce�?
	AI_Output(self,other,"DIA_Brutus_Kasse_06_03");	//Hmm, tys pob�hal kolem toho hradu, �e jo? Tak ti navrhnu tohle.
	AI_Output(self,other,"DIA_Brutus_Kasse_06_04");	//M�j asistent Den se p�i posledn�m �toku �pln� vypa�il - prost� nevydr�el.
	AI_Output(self,other,"DIA_Brutus_Kasse_06_05");	//Ale neode�el s pr�zdnou. Odnesl si i obsah na�� pokladnice.
	AI_Output(other,self,"DIA_Brutus_Kasse_15_06");	//Jak� pokladnice?
	AI_Output(self,other,"DIA_Brutus_Kasse_06_07");	//V t�hle truhlici jsme schov�vali zbo��, kter� jsme �asem, ehm, vybrali.
	AI_Output(self,other,"DIA_Brutus_Kasse_06_08");	//Byla to p�kn� zaokrouhlen� sumi�ka - 200 zla��k�, a to nepo��t�m je�t� vz�cn� klenoty.
	AI_Output(self,other,"DIA_Brutus_Kasse_06_09");	//Jestli mi vr�t� to zlato, bude� si moci nechat ty klenoty a je�t� k tomu t� budu cvi�it.
	Log_CreateTopic(TOPICBRUTUSKASSE,LOG_MISSION);
	Log_SetTopicStatus(TOPICBRUTUSKASSE,LOG_RUNNING);
	b_logentry(TOPICBRUTUSKASSE,"Brut�v partner Den se ztratil i s 200 zla��k� a n�jak�mi klenoty. Kdy� Brutovi p�inesu aspo� ty dv� stovky, pom��e mi zv��it s�lu.");
};


instance DIA_BRUTUS_DEN(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 2;
	condition = dia_brutus_den_condition;
	information = dia_brutus_den_info;
	permanent = FALSE;
	description = "Nev�, kam Den m��il?";
};


func int dia_brutus_den_condition()
{
	if(Npc_KnowsInfo(hero,dia_brutus_kasse) && (KAPITEL < 3) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_den_info()
{
	AI_Output(other,self,"DIA_Brutus_Den_15_00");	//Nev�, kam Den m��il?
	AI_Output(self,other,"DIA_Brutus_Den_06_01");	//Nejsp� co nejd�l odsud. Mo�n� se pokusil proj�t pr�smykem.
	AI_Output(other,self,"DIA_Brutus_Den_15_02");	//D�ky, fakt jsi mi moc pomohl.
	AI_Output(self,other,"DIA_Brutus_Den_06_03");	//No co m��u ��ct? Nem�m ani potuchy, kam mohl j�t.
	b_logentry(TOPICBRUTUSKASSE,"Den se sna�il proj�t pr�smykem.");
};


instance DIA_BRUTUS_GOLD(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 2;
	condition = dia_brutus_gold_condition;
	information = dia_brutus_gold_info;
	permanent = TRUE;
	description = "N�co tu pro tebe m�m (p�edat 200 zla��k�).";
};


func int dia_brutus_gold_condition()
{
	if(Npc_KnowsInfo(hero,dia_brutus_kasse) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE) && (BRUTUS_TEACHSTR == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_gold_info()
{
	AI_Output(other,self,"DIA_Brutus_Gold_15_00");	//N�co tu pro tebe m�m.
	if(b_giveinvitems(other,self,itmi_gold,200))
	{
		AI_Output(self,other,"DIA_Brutus_Gold_06_01");	//V�born�. Nyn� t� m��u vycvi�it, jestli tedy chce�.
		BRUTUS_TEACHSTR = TRUE;
		Log_CreateTopic(TOPIC_TEACHER_OC,LOG_NOTE);
		b_logentry(TOPIC_TEACHER_OC,"S pomoc� Bruta se mohu st�t siln�j��m.");
		b_giveplayerxp(XP_AMBIENT);
	}
	else
	{
		AI_Output(self,other,"DIA_Brutus_Gold_06_02");	//Posly�, prost� mi p�ines 200 zla��k�. Nezaj�m� m�, kde si je opat�� - zla��k jako zla��k.
	};
};


instance DIA_BRUTUS_TEACH(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 7;
	condition = dia_brutus_teach_condition;
	information = dia_brutus_teach_info;
	permanent = TRUE;
	description = "Cht�l bych se st�t siln�j��m.";
};


func int dia_brutus_teach_condition()
{
	if((BRUTUS_TEACHSTR == TRUE) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_teach_info()
{
	AI_Output(other,self,"DIA_Brutus_Teach_15_00");	//Cht�l bych se st�t siln�j��m.
	Info_ClearChoices(dia_brutus_teach);
	Info_AddChoice(dia_brutus_teach,DIALOG_BACK,dia_brutus_teach_back);
	Info_AddChoice(dia_brutus_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_brutus_teach_str_1);
	Info_AddChoice(dia_brutus_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_brutus_teach_str_5);
};

func void dia_brutus_teach_back()
{
	Info_ClearChoices(dia_brutus_teach);
};

func void dia_brutus_teach_str_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_MED);
	Info_ClearChoices(dia_brutus_teach);
	Info_AddChoice(dia_brutus_teach,DIALOG_BACK,dia_brutus_teach_back);
	Info_AddChoice(dia_brutus_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_brutus_teach_str_1);
	Info_AddChoice(dia_brutus_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_brutus_teach_str_5);
};

func void dia_brutus_teach_str_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_MED);
	Info_ClearChoices(dia_brutus_teach);
	Info_AddChoice(dia_brutus_teach,DIALOG_BACK,dia_brutus_teach_back);
	Info_AddChoice(dia_brutus_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_brutus_teach_str_1);
	Info_AddChoice(dia_brutus_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_brutus_teach_str_5);
};


instance DIA_BRUTUS_KAP3_EXIT(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 999;
	condition = dia_brutus_kap3_exit_condition;
	information = dia_brutus_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_brutus_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_brutus_kap3_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_BRUTUS_DUSCHONWIEDER(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 30;
	condition = dia_brutus_duschonwieder_condition;
	information = dia_brutus_duschonwieder_info;
	permanent = TRUE;
	description = "Mu�il jsi dneska n�koho?";
};


func int dia_brutus_duschonwieder_condition()
{
	if((KAPITEL == 3) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_duschonwieder_info()
{
	AI_Output(other,self,"DIA_Brutus_DUSCHONWIEDER_15_00");	//Mu�il jsi dneska n�koho?
	AI_Output(self,other,"DIA_Brutus_DUSCHONWIEDER_06_01");	//Copak nevid�, �e m�m pr�ci? Vra� se pozd�ji.
	b_npcclearobsessionbydmt(self);
};


instance DIA_BRUTUS_KAP4_EXIT(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 999;
	condition = dia_brutus_kap4_exit_condition;
	information = dia_brutus_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_brutus_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_brutus_kap4_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_BRUTUS_WARUMNICHTARBBEIT(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 40;
	condition = dia_brutus_warumnichtarbbeit_condition;
	information = dia_brutus_warumnichtarbbeit_info;
	description = "Jak to, �e nejsi v pr�ci?";
};


func int dia_brutus_warumnichtarbbeit_condition()
{
	if((KAPITEL >= 4) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE) && (MIS_OCGATEOPEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_warumnichtarbbeit_info()
{
	AI_Output(other,self,"DIA_Brutus_WARUMNICHTARBBEIT_15_00");	//Jak to, �e nejsi v pr�ci?
	AI_Output(self,other,"DIA_Brutus_WARUMNICHTARBBEIT_06_01");	//(�zkostn�) To je ale nechutn�!
	AI_Output(self,other,"DIA_Brutus_WARUMNICHTARBBEIT_06_02");	//Vid�ls, jak to u m� vypad�? Ty hnusn� �rav� �t�nice jsou �pln� v�ude!
	AI_Output(self,other,"DIA_Brutus_WARUMNICHTARBBEIT_06_03");	//Nem�m ani �ajna, kdo tam co d�lal, ale j� se tam ur�it� nevr�t�m, dokud tam bude ten hnusn� hmyz.
	AI_Output(self,other,"DIA_Brutus_WARUMNICHTARBBEIT_06_04");	//J� ty potvory prost� nesn��m. A p�esta� se tak blb� k�enit.
	Log_CreateTopic(TOPIC_BRUTUSMEATBUGS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BRUTUSMEATBUGS,LOG_RUNNING);
	b_logentry(TOPIC_BRUTUSMEATBUGS,"Hradn� mu�itel Brutus se mi sv��il, �e mu ne�kodn� �rav� �t�nice v mu��rn� nah�n�j� hus� k��i. Je to prost� drs��k ka�d�m coulem.");
};


instance DIA_BRUTUS_MEATBUGSWEG(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 31;
	condition = dia_brutus_meatbugsweg_condition;
	information = dia_brutus_meatbugsweg_info;
	description = "U� je po �t�nic�ch. M��e� se vr�tit a le�tit v�echny ty pale�nice a ostatn� mu��c� n�stroje.";
};


func int dia_brutus_meatbugsweg_condition()
{
	if(Npc_KnowsInfo(other,dia_brutus_warumnichtarbbeit) && Npc_IsDead(meatbug_brutus1) && Npc_IsDead(meatbug_brutus2) && Npc_IsDead(meatbug_brutus3) && Npc_IsDead(meatbug_brutus4) && (KAPITEL >= 4) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE) && (MIS_OCGATEOPEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_meatbugsweg_info()
{
	AI_Output(other,self,"DIA_Brutus_MEATBUGSWEG_15_00");	//U� je po �t�nic�ch. M��e� se vr�tit a le�tit v�echny ty pale�nice a ostatn� mu��c� n�stroje.
	AI_Output(self,other,"DIA_Brutus_MEATBUGSWEG_06_01");	//V� opravdu jist�, �e tam ani jedna z t�ch potvor nezbyla?
	AI_Output(other,self,"DIA_Brutus_MEATBUGSWEG_15_02");	//Naprosto jist�.
	AI_Output(self,other,"DIA_Brutus_MEATBUGSWEG_06_03");	//No tak tedy dob�e. Tum�, za odm�nu si vezmi tohle zlato.
	AI_Output(other,self,"DIA_Brutus_MEATBUGSWEG_15_04");	//U�, jenom m� tu nerozbre�.
	TOPIC_END_BRUTUSMEATBUGS = TRUE;
	b_giveplayerxp(XP_BRUTUSMEATBUGS);
	b_npcclearobsessionbydmt(self);
	CreateInvItems(self,itmi_gold,150);
	b_giveinvitems(self,other,itmi_gold,150);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_BRUTUS_PERM4(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 32;
	condition = dia_brutus_perm4_condition;
	information = dia_brutus_perm4_info;
	permanent = TRUE;
	description = "Jsi v po��dku?";
};


func int dia_brutus_perm4_condition()
{
	if((Npc_KnowsInfo(other,dia_brutus_meatbugsweg) || (MIS_OCGATEOPEN == TRUE)) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_perm4_info()
{
	if((MIS_OCGATEOPEN == TRUE) || ((hero.guild == GIL_KDF) && (KAPITEL >= 5)))
	{
		b_npcobsessedbydmt(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Brutus_PERM4_15_00");	//Jsi v po��dku?
		AI_Output(self,other,"DIA_Brutus_PERM4_06_01");	//(znepokojen�) A v� ur�it�, �e u� tam ��dn� �rav� �t�nice nejsou?
		AI_Output(other,self,"DIA_Brutus_PERM4_15_02");	//Ehm, pod�vej, jednu m� p��mo za sebou!
		AI_Output(self,other,"DIA_Brutus_PERM4_06_03");	//(je��) Co�e?
		b_npcclearobsessionbydmt(self);
		Npc_SetTarget(self,other);
		self.aivar[AIV_INVINCIBLE] = FALSE;
		other.aivar[AIV_INVINCIBLE] = FALSE;
		AI_StartState(self,zs_flee,0,"");
	};
};


instance DIA_BRUTUS_BESSEN(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 55;
	condition = dia_brutus_bessen_condition;
	information = dia_brutus_bessen_info;
	permanent = TRUE;
	description = "Ty jsi posedl�!";
};


func int dia_brutus_bessen_condition()
{
	if((NPCOBSESSEDBYDMT_BRUTUS == TRUE) && (NPCOBSESSEDBYDMT == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_bessen_info()
{
	AI_Output(other,self,"DIA_Brutus_BESSEN_15_00");	//Ty jsi posedl�!
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
	{
		AI_Output(other,self,"DIA_Brutus_BESSEN_15_01");	//B� do kl�tera, a� t� tam vyl���.
		AI_Output(self,other,"DIA_Brutus_BESSEN_06_02");	//Mn� u� nen� pomoci, b� pry�!
		b_npcclearobsessionbydmt(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Brutus_BESSEN_15_03");	//N�kdo ti mus� z hlavy vypudit ty d�mony.
		AI_Output(self,other,"DIA_Brutus_BESSEN_06_04");	//(k�i��) NE!
		b_npcclearobsessionbydmt(self);
		Npc_SetTarget(self,other);
		self.aivar[AIV_INVINCIBLE] = FALSE;
		other.aivar[AIV_INVINCIBLE] = FALSE;
		AI_StartState(self,zs_flee,0,"");
	};
};


instance DIA_BRUTUS_KAP5_EXIT(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 999;
	condition = dia_brutus_kap5_exit_condition;
	information = dia_brutus_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_brutus_kap5_exit_condition()
{
	if(KAPITEL >= 5)
	{
		return TRUE;
	};
};

func void dia_brutus_kap5_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_BRUTUS_PICKPOCKET(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 900;
	condition = dia_brutus_pickpocket_condition;
	information = dia_brutus_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_brutus_pickpocket_condition()
{
	return c_beklauen(14,35);
};

func void dia_brutus_pickpocket_info()
{
	Info_ClearChoices(dia_brutus_pickpocket);
	Info_AddChoice(dia_brutus_pickpocket,DIALOG_BACK,dia_brutus_pickpocket_back);
	Info_AddChoice(dia_brutus_pickpocket,DIALOG_PICKPOCKET,dia_brutus_pickpocket_doit);
};

func void dia_brutus_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_brutus_pickpocket);
};

func void dia_brutus_pickpocket_back()
{
	Info_ClearChoices(dia_brutus_pickpocket);
};

