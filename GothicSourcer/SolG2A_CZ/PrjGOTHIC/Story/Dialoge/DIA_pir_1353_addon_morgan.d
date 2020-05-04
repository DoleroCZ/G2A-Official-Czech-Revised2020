
var int morgan_perm_counter;

instance DIA_ADDON_MORGAN_EXIT(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 999;
	condition = dia_addon_morgan_exit_condition;
	information = dia_addon_morgan_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_morgan_exit_condition()
{
	return TRUE;
};

func int dia_addon_morgan_exit_info()
{
	if(GREGISBACK == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Morgan_Perm_15_00");	//Nebudu t� d�le ru�it.
		if(MORGAN_PERM_COUNTER == 0)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_Perm_07_01");	//(z�v�) Bezvadn� n�pad.
			MORGAN_PERM_COUNTER = 1;
		}
		else if(MORGAN_PERM_COUNTER == 1)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_Perm_07_02");	//(ospale) Tak tedy dobrou noc.
			MORGAN_PERM_COUNTER = 2;
		}
		else if(MORGAN_PERM_COUNTER == 2)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_Perm_07_03");	//(unaven�) Nic, rad�i to ud�l�m.
			MORGAN_PERM_COUNTER = 3;
		}
		else if(MORGAN_PERM_COUNTER == 3)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_Perm_07_04");	//Vzbu� m�, jestli se n�co p�ihod�.
			MORGAN_PERM_COUNTER = 0;
		};
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MORGAN_PICKPOCKET(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 900;
	condition = dia_addon_morgan_pickpocket_condition;
	information = dia_addon_morgan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_addon_morgan_pickpocket_condition()
{
	return c_beklauen(20,43);
};

func void dia_addon_morgan_pickpocket_info()
{
	Info_ClearChoices(dia_addon_morgan_pickpocket);
	Info_AddChoice(dia_addon_morgan_pickpocket,DIALOG_BACK,dia_addon_morgan_pickpocket_back);
	Info_AddChoice(dia_addon_morgan_pickpocket,DIALOG_PICKPOCKET,dia_addon_morgan_pickpocket_doit);
};

func void dia_addon_morgan_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_morgan_pickpocket);
};

func void dia_addon_morgan_pickpocket_back()
{
	Info_ClearChoices(dia_addon_morgan_pickpocket);
};


instance DIA_ADDON_MORGAN_ANHEUERN(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 1;
	condition = dia_addon_morgan_anheuern_condition;
	information = dia_addon_morgan_anheuern_info;
	important = TRUE;
};


func int dia_addon_morgan_anheuern_condition()
{
	if(Npc_IsInState(self,zs_talk) && (GREGISBACK == TRUE))
	{
		return TRUE;
	};
};

func int dia_addon_morgan_anheuern_info()
{
	AI_Output(self,other,"DIA_Addon_Morgan_Anheuern_07_00");	//Skv�le! Te� m� Greg poslal �ezat kl�dy!
	if(MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Anheuern_07_01");	//(sarkasticky) U�ij si pob�jen� monster!
	};
};


instance DIA_ADDON_MORGAN_HELLO(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 1;
	condition = dia_addon_morgan_hello_condition;
	information = dia_addon_morgan_hello_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_morgan_hello_condition()
{
	if((MIS_ALLIGATORJACK_BRINGMEAT == FALSE) && Npc_IsInState(self,zs_talk) && (Npc_IsDead(alligatorjack) == FALSE) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_morgan_hello_info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Hello_15_00");	//Hej ty!
	AI_Output(self,other,"DIA_Addon_Morgan_Hello_07_01");	//(ospale) Huh? Co chce�?
	AI_Output(self,other,"DIA_Addon_Morgan_Hello_07_02");	//(ospale) Je Alligator Jack u� zp�tky?
	AI_Output(self,other,"DIA_Addon_Morgan_Hello_07_03");	//(ospale) Ne? Dobr�, asi se vr�t� pozd�ji. Dobrou noc.
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MORGAN_MEAT(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 2;
	condition = dia_addon_morgan_meat_condition;
	information = dia_addon_morgan_meat_info;
	description = "P�inesl jsem z�silku masa.";
};


func int dia_addon_morgan_meat_condition()
{
	if((MIS_ALLIGATORJACK_BRINGMEAT == LOG_RUNNING) && (Npc_HasItems(other,itfomuttonraw) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_morgan_meat_info()
{
	var int givenmeat;
	AI_Output(other,self,"DIA_Addon_Morgan_Meat_15_00");	//P�inesl jsem z�silku masa.
	if(GREGISBACK == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Meat_07_01");	//(Vzbuzen�) Uah. Nejd��v pot�ebuju dou�ek na probuzen�.
		CreateInvItems(self,itfo_booze,3);
		b_useitem(self,itfo_booze);
		AI_Output(self,other,"DIA_Addon_Morgan_Meat_07_02");	//Ahh, to je lep��. Dobr�, znova. Co chce�?
		AI_Output(other,self,"DIA_Addon_Morgan_Meat_15_03");	//P�inesl jsem ti tuhle z�silku masa. Od Alligatora Jacka.
	};
	AI_Output(self,other,"DIA_Addon_Morgan_Meat_07_04");	//U� si vzpom�n�m. Ano, p�esn�, maso. Dej mi to!
	givenmeat = Npc_HasItems(other,itfomuttonraw);
	if(givenmeat > 10)
	{
		givenmeat = 10;
	};
	b_giveinvitems(other,self,itfomuttonraw,givenmeat);
	if(givenmeat < 10)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Meat_07_05");	//Co, to je v�e? Se�vejkal si v�echno ostatn�? Ahh, nevad� ...
	};
	b_logentry(TOPIC_ADDON_BRINGMEAT,"Dal jsem Moranovi maso.");
	MIS_ALLIGATORJACK_BRINGMEAT = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_ALLIGATORJACK_BRINGMEAT);
};


instance DIA_ADDON_MORGAN_JOB(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 3;
	condition = dia_addon_morgan_job_condition;
	information = dia_addon_morgan_job_info;
	description = "Co tady d�l�?";
};


func int dia_addon_morgan_job_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_morgan_meat))
	{
		return TRUE;
	};
};

func void dia_addon_morgan_job_info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Job_15_01");	//Co tady d�l�?
	AI_Output(self,other,"DIA_Addon_Morgan_Job_07_01");	//Greg mi dal velen� jedn� hrani�n� skupiny.
	AI_Output(self,other,"DIA_Addon_Morgan_Job_07_02");	//Jsem zodpov�dn� za proviant v t�bo�e - Alligator Jack se o to pro m� star�.
	AI_Output(self,other,"DIA_Addon_Morgan_Job_07_03");	//Jsem tak� zodpov�dn� za potvory, kter� jsou p��li� bl�zko t�bora.
	AI_Output(self,other,"DIA_Addon_Morgan_Job_07_04");	//M� chlapci se o to staraj� za m�.
	if(GREGISBACK == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Job_07_05");	//�ekl jsem jim, nechci tady vid�t jedinou potvoru (z�v�) Kdy� se Greg vr�t�.
	};
};


instance DIA_ADDON_MORGAN_SLEEP(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 4;
	condition = dia_addon_morgan_sleep_condition;
	information = dia_addon_morgan_sleep_info;
	description = "D�l� te� n�co?";
};


func int dia_addon_morgan_sleep_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_morgan_job))
	{
		return TRUE;
	};
};

func void dia_addon_morgan_sleep_info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Sleep_15_00");	//D�l� te� n�co?
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_01");	//Hej, koukej!
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_02");	//M�m nejd�le�it�j�� �kol ze v�ech.
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_03");	//Star�m se o tr�nov�n� na�ich lid�.
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_04");	//D�l�m z nich nejlep�� a nejv�ce ob�van� pir�ty, kte�� kdy k�i�ovaly tyhle vody.
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_05");	//Nen� nic, co by chlapy donutilo, aby se vr�tili ke sv� pr�ci.
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_06");	//Dostali za to p�kn� v��ek se zlatem.
};


instance DIA_ADDON_MORGAN_JOINMORGAN(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 5;
	condition = dia_addon_morgan_joinmorgan_condition;
	information = dia_addon_morgan_joinmorgan_info;
	description = "Chci se p�ipojit k tv� skupin�.";
};


func int dia_addon_morgan_joinmorgan_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_morgan_sleep) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_morgan_joinmorgan_info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_JoinMorgan_15_00");	//Chci se p�ipojit k tv� skupin�.
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_01");	//(sm�je se) Moje Skupina? Moje skupina se povaluje okolo na pl�i.
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_03");	//Chlapy nezvednou ani prst dokud se kapit�n nevr�t�. M��u ti nasl�bovat hodn�.
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_04");	//Ale jestli n�m chce� uk�zat, co jsi vlastn� za�, postar� se o pl� na severu.
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_05");	//Je pln� ��havc� a kdo v� �eho je�t�.
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_06");	//Odstra� je s�m a z�sk� respekt (z�v�) od chlapc� ...
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_07");	//V�tej v m� skupin�. Ha! Jsem zp�t na leh�tkov� slu�b� ...
	Log_CreateTopic(TOPIC_ADDON_MORGANBEACH,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MORGANBEACH,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MORGANBEACH,"Te�, kdy� jsem v Morganov� skupin�, chce abych vy�istil severn� pl� od potvor.");
	MIS_ADDON_MORGANLURKER = LOG_RUNNING;
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MORGAN_LURKERPLATT(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 6;
	condition = dia_addon_morgan_lurkerplatt_condition;
	information = dia_addon_morgan_lurkerplatt_info;
	permanent = TRUE;
	description = "Severn� pl� je ��st�.";
};


func int dia_addon_morgan_lurkerplatt_condition()
{
	if(Npc_IsDead(beachlurker1) && Npc_IsDead(beachlurker2) && Npc_IsDead(beachlurker3) && Npc_IsDead(beachwaran1) && Npc_IsDead(beachwaran2) && (MIS_ADDON_MORGANLURKER == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_morgan_lurkerplatt_info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_LurkerPlatt_15_00");	//Severn� pl� je ��st�.
	AI_Output(self,other,"DIA_Addon_Morgan_LurkerPlatt_07_01");	//A co jeskyn�. �el jsi tam taky?
	if(Npc_IsDead(beachshadowbeast1))
	{
		AI_Output(other,self,"DIA_Addon_Morgan_LurkerPlatt_15_02");	//Jasn�.
		AI_Output(self,other,"DIA_Addon_Morgan_LurkerPlatt_07_03");	//T��da. Jsi dobr� chlap.
		AI_Output(self,other,"DIA_Addon_Morgan_LurkerPlatt_07_04");	//Tady je tvoje odm�na.
		CreateInvItems(self,itmi_gold,150);
		b_giveinvitems(self,other,itmi_gold,150);
		b_logentry(TOPIC_ADDON_MORGANBEACH,"Pl� je vy�i�t�na. V�ichni tvorov� jsou mrtv�.");
		MIS_ADDON_MORGANLURKER = LOG_SUCCESS;
		b_giveplayerxp(XP_ADDON_MORGAN_LURKERPLATT);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Morgan_LurkerPlatt_15_05");	//Au ...
		AI_Output(self,other,"DIA_Addon_Morgan_LurkerPlatt_07_06");	//To je ��st pr�ce. P�ij� zp�t, a� se postar� i o to.
		b_logentry(TOPIC_ADDON_MORGANBEACH,"Morgan tak� chce, abych se postaral o jeskyni.");
		AI_StopProcessInfos(self);
	};
};


instance DIA_ADDON_MORGAN_AUFTRAG2(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 99;
	condition = dia_addon_morgan_auftrag2_condition;
	information = dia_addon_morgan_auftrag2_info;
	permanent = TRUE;
	description = "Je tady n�co, co m��u ud�lat?";
};


func int dia_addon_morgan_auftrag2_condition()
{
	if(MIS_ADDON_MORGANLURKER == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_addon_morgan_auftrag2_info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Auftrag2_15_00");	//Je tady n�co, co m��u ud�lat?
	if(GREGISBACK == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Auftrag2_07_01");	//Te� zrovna ne.
		AI_Output(self,other,"DIA_Addon_Morgan_Auftrag2_07_02");	//Zajisti si l��ko a dej si p�knou l�hev rumu!
		CreateInvItems(self,itfo_booze,3);
		b_useitem(self,itfo_booze);
		AI_Output(self,other,"DIA_Addon_Morgan_Auftrag2_07_03");	//Aaah. To je dobr� v�c.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Auftrag2_07_04");	//Nejl�pe, kdy� se na to zept� kapit�na.
	};
	AI_StopProcessInfos(self);
};


var int morgan_angusstory;

instance DIA_ADDON_MORGAN_FOUNDTHEM(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 7;
	condition = dia_addon_morgan_foundthem_condition;
	information = dia_addon_morgan_foundthem_info;
	permanent = TRUE;
	description = "O Agnusovi a Hankovi ...";
};


func int dia_addon_morgan_foundthem_condition()
{
	if((MIS_ADDON_MORGAN_SEEKTRAITOR != LOG_SUCCESS) && Npc_KnowsInfo(other,dia_addon_skip_angushank))
	{
		return TRUE;
	};
};

func void dia_addon_morgan_foundthem_info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_15_00");	//O Agnusovi a Hankovi ...
	if(MORGAN_ANGUSSTORY == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_01");	//Neza��nej s T�M p��b�hem.
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_02");	//Pravd�podobn� byli zabiti bandity.
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_03");	//A Agnus m�l u sebe m�j prsten.
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_04");	//Dob�e, vlastn� to byl JEHO prsten. Vyhr�l ho v kostk�ch.
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_05");	//Ale cht�l jsem ho vyhr�t nazp�t, ale te� je PRY�!
		MORGAN_ANGUSSTORY = TRUE;
	};
	Info_ClearChoices(dia_addon_morgan_foundthem);
	if(Npc_HasItems(other,itri_addon_morgansring_mission) > 0)
	{
		Info_AddChoice(dia_addon_morgan_foundthem,"Na�el jsem je.",dia_addon_morgan_foundthem_now);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_06");	//Jestli najde� m�j prsten, p�ines mi ho. Nebude to za nic, slibuju!
	};
};

func void dia_addon_morgan_foundthem_now()
{
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_15_01");	//Na�el jsem je.
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_07");	//M�m ti zaplatit ka�d� slovo? Kde jsou?
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_15_03");	//Jsou mrtv�.
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_08");	//Prsten. Kde je prsten?
	Info_ClearChoices(dia_addon_morgan_foundthem);
	Info_AddChoice(dia_addon_morgan_foundthem,"Tady to je.",dia_addon_morgan_foundthem_givering);
	Info_AddChoice(dia_addon_morgan_foundthem,"Nem�li to u sebe.",dia_addon_morgan_foundthem_noring);
};

func void dia_addon_morgan_foundthem_noring()
{
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_15_00");	//Nem�li to u sebe.
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_07_01");	//(zd�en�) Co? Jdi zp�t a pod�vej se znova. Musej� ho m�t.
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_07_02");	//Je to mal� prsten s mnoha ornamenty.
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_07_03");	//MUS͊ ho naj�t. MUS͊!
	Info_ClearChoices(dia_addon_morgan_foundthem);
};

func void dia_addon_morgan_foundthem_givering()
{
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_GiveRing_15_00");	//Tady je.
	b_giveinvitems(other,self,itri_addon_morgansring_mission,1);
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_GiveRing_07_01");	//(��astn� jak bl�zen) Ano, to je ono. Hodn� chlapec!
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_GiveRing_07_02");	//Tady, vem si tuhle kamennou desku. Vypad� jak star� odpad, ale Garett ti za ni dob�e zaplat�.
	MIS_ADDON_MORGAN_SEEKTRAITOR = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_MORGANSRING);
	Info_ClearChoices(dia_addon_morgan_foundthem);
	b_giveinvitems(self,other,itwr_stoneplatecommon_addon,1);
};


instance DIA_ADDON_MORGAN_FRANCIS(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 5;
	condition = dia_addon_morgan_francis_condition;
	information = dia_addon_morgan_francis_info;
	description = "Co si mysl� o Francisovi?";
};


func int dia_addon_morgan_francis_condition()
{
	if(FRANCIS_AUSGESCHISSEN == FALSE)
	{
		if(Npc_KnowsInfo(other,dia_addon_skip_gregshut) || (francis.aivar[AIV_TALKEDTOPLAYER] == TRUE))
		{
			return TRUE;
		};
	};
};

func void dia_addon_morgan_francis_info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Francis_15_00");	//Co si mysl� o Francisovi?
	AI_Output(self,other,"DIA_Addon_Morgan_Francis_07_01");	//Nestar�m se, (nebezpe�n�) tak dlouho dokud m� nech� na pokoji!
	AI_Output(other,self,"DIA_Addon_Morgan_Francis_15_02");	//Nen� tady ��fem?
	AI_Output(self,other,"DIA_Addon_Morgan_Francis_07_03");	//(drsn� se sm�je) On si MYSL�, �e je tady ��fem.
	AI_Output(self,other,"DIA_Addon_Morgan_Francis_07_04");	//(radostn�) Ale jen co se Greg vr�t�, bude Francis  znovu a velmi piln�  �ezat kl�dy.
};


instance DIA_ADDON_MORGAN_TRAIN(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 5;
	condition = dia_addon_morgan_train_condition;
	information = dia_addon_morgan_train_info;
	description = "M��e� m� taky tr�novat?";
};


func int dia_addon_morgan_train_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_morgan_sleep))
	{
		return TRUE;
	};
};

func void dia_addon_morgan_train_info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_TRAIN_15_00");	//M��e� m� taky tr�novat?
	AI_Output(self,other,"DIA_Addon_Morgan_TRAIN_07_01");	//Jasn�, m��u ti uk�zat, jak bojovat s jednoru�n�mi zbran�mi.
	Log_CreateTopic(TOPIC_ADDON_PIR_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_PIR_TEACHER,LOG_TEXT_ADDON_MORGANTEACH);
	MORGAN_ADDON_TEACHPLAYER = TRUE;
};


var int morgan_merke1h;
var int morgan_labercount;

instance DIA_ADDON_MORGAN_TEACH(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 99;
	condition = dia_addon_morgan_teach_condition;
	information = dia_addon_morgan_teach_info;
	permanent = TRUE;
	description = "Tr�nuj m�!";
};


func int dia_addon_morgan_teach_condition()
{
	if(MORGAN_ADDON_TEACHPLAYER == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_morgan_teach_info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Teach_15_00");	//Tr�nuj m�!
	MORGAN_MERKE1H = other.hitchance[NPC_TALENT_1H];
	Info_ClearChoices(dia_addon_morgan_teach);
	Info_AddChoice(dia_addon_morgan_teach,DIALOG_BACK,dia_addon_morgan_teach_back);
	Info_AddChoice(dia_addon_morgan_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_addon_morgan_teach_1h_1);
	Info_AddChoice(dia_addon_morgan_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,1) * 5),dia_addon_morgan_teach_1h_5);
};

func void dia_addon_morgan_teach_back()
{
	if(other.hitchance[NPC_TALENT_1H] > MORGAN_MERKE1H)
	{
		if(MORGAN_LABERCOUNT == 0)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_CommentFightSkill_07_00");	//M�j jednu v�c na pam�ti. V�echna �e� o sl�v� je ztr�ta �asu. Bu� ty zabije� jeho, nebo on zabije tebe.
			MORGAN_LABERCOUNT = 1;
		}
		else if(MORGAN_LABERCOUNT == 1)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_CommentFightSkill_07_01");	//V budoucnu se bude� muset nau�it, jak do sv�ch �der� d�t v�ce s�ly.
			MORGAN_LABERCOUNT = 2;
		}
		else if(MORGAN_LABERCOUNT == 2)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_CommentFightSkill_07_02");	//Hahaha, nakonec jsi se nau�il, jak dr�et me�.
			MORGAN_LABERCOUNT = 0;
		};
	}
	else if(other.hitchance[NPC_TALENT_1H] >= 75)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Teach_Back_07_00");	//Jestli bude� cht�t b�t lep��, bude� si muset naj�t n�koho jin�ho.
	};
	Info_ClearChoices(dia_addon_morgan_teach);
};

func void dia_addon_morgan_teach_1h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,75);
	Info_ClearChoices(dia_addon_morgan_teach);
	Info_AddChoice(dia_addon_morgan_teach,DIALOG_BACK,dia_addon_morgan_teach_back);
	Info_AddChoice(dia_addon_morgan_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_addon_morgan_teach_1h_1);
	Info_AddChoice(dia_addon_morgan_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,1) * 5),dia_addon_morgan_teach_1h_5);
};

func void dia_addon_morgan_teach_1h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,75);
	Info_ClearChoices(dia_addon_morgan_teach);
	Info_AddChoice(dia_addon_morgan_teach,DIALOG_BACK,dia_addon_morgan_teach_back);
	Info_AddChoice(dia_addon_morgan_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_addon_morgan_teach_1h_1);
	Info_AddChoice(dia_addon_morgan_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,1) * 5),dia_addon_morgan_teach_1h_5);
};

