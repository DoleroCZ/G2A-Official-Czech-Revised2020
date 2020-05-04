
instance DIA_CORNELIUS_EXIT(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 999;
	condition = dia_cornelius_exit_condition;
	information = dia_cornelius_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_cornelius_exit_condition()
{
	return TRUE;
};

func void dia_cornelius_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CORNELIUS_SEEMURDER(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 4;
	condition = dia_cornelius_seemurder_condition;
	information = dia_cornelius_seemurder_info;
	permanent = FALSE;
	description = "Vid�l jsi Lotharovu vra�du, co?";
};


func int dia_cornelius_seemurder_condition()
{
	if(RECUEBENNET_KNOWSCORNELIUS == TRUE)
	{
		return TRUE;
	};
};

func void dia_cornelius_seemurder_info()
{
	AI_Output(other,self,"DIA_Cornelius_SeeMurder_15_00");	//Vid�l jsi Lotharovu vra�du, co?
	AI_Output(self,other,"DIA_Cornelius_SeeMurder_13_01");	//(nerv�zn�) Nebudu odpov�dat na ��dn� ot�zky t�kaj�c� se prob�haj�ho vy�et�ov�n�.
	AI_Output(self,other,"DIA_Cornelius_SeeMurder_13_02");	//Lord Hagen u� m� zaznamen�no v�e, co v�m.
};


instance DIA_CORNELIUS_WHATYOUSEE(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 5;
	condition = dia_cornelius_whatyousee_condition;
	information = dia_cornelius_whatyousee_info;
	permanent = FALSE;
	description = "Cos to ��kal?";
};


func int dia_cornelius_whatyousee_condition()
{
	if(Npc_KnowsInfo(other,dia_cornelius_seemurder))
	{
		return TRUE;
	};
};

func void dia_cornelius_whatyousee_info()
{
	AI_Output(other,self,"DIA_Cornelius_WhatYouSee_15_00");	//Cos to ��kal?
	AI_Output(self,other,"DIA_Cornelius_WhatYouSee_13_01");	//(hore�nat�) Opravdu te� nem�m �as.
	AI_Output(self,other,"DIA_Cornelius_WhatYouSee_13_02");	//(hore�nat�) Mus� j�t, ��ad se pr�v� zav�r�.
	b_logentry(TOPIC_RESCUEBENNET,"Cornelius se se mnou odm�t� bavit.");
	AI_StopProcessInfos(self);
};


instance DIA_CORNELIUS_ENOUGH(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 6;
	condition = dia_cornelius_enough_condition;
	information = dia_cornelius_enough_info;
	permanent = FALSE;
	description = "Dost u� toho! Co jsi vid�l?";
};


func int dia_cornelius_enough_condition()
{
	if(Npc_KnowsInfo(other,dia_cornelius_whatyousee))
	{
		return TRUE;
	};
};

func void dia_cornelius_enough_info()
{
	AI_Output(other,self,"DIA_Cornelius_Enough_15_00");	//Dost u� toho! Co jsi vid�l?
	AI_Output(self,other,"DIA_Cornelius_Enough_13_01");	//(nerv�zn�) J�... vid�l jsem, jak ten �old�k zezadu srazil toho paladina.
	AI_Output(self,other,"DIA_Cornelius_Enough_13_02");	//(nerv�zn�) A pak si vzal jeho me� a prokl�l mu j�m hru�.
	AI_Output(other,self,"DIA_Cornelius_Enough_15_03");	//Jsi si naprosto jist�?
	AI_Output(self,other,"DIA_Cornelius_Enough_13_04");	//(vyd�en�) Ano, samoz�ejm�. Vid�l jsem to na vlastn� o�i.
	AI_Output(self,other,"DIA_Cornelius_Enough_13_05");	//(vyd�en�) Ale te� u� v�n� nem�m �as, �ek� na m� halda pap�rov�n�.
	AI_StopProcessInfos(self);
};


instance DIA_CORNELIUS_DONTBELIEVEYOU(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 4;
	condition = dia_cornelius_dontbelieveyou_condition;
	information = dia_cornelius_dontbelieveyou_info;
	permanent = TRUE;
	description = "Nev���m ti.";
};


func int dia_cornelius_dontbelieveyou_condition()
{
	if(Npc_KnowsInfo(other,dia_cornelius_enough) && (CORNELIUS_TELLTRUTH != TRUE))
	{
		return TRUE;
	};
};

func void dia_cornelius_dontbelieveyou_info()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_15_00");	//Nev���m ti.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_13_01");	//(s fale�nou d�v�rnost�) A co, co s t�m bude� d�lat?
	Info_ClearChoices(dia_cornelius_dontbelieveyou);
	Info_AddChoice(dia_cornelius_dontbelieveyou,"Co chce�?",dia_cornelius_dontbelieveyou_whatyouwant);
	Info_AddChoice(dia_cornelius_dontbelieveyou,"Sv�ho �ivota si dost cen�, co?",dia_cornelius_dontbelieveyou_wantsurvive);
	if(hero.guild == GIL_KDF)
	{
		Info_AddChoice(dia_cornelius_dontbelieveyou,"M��ou ti za��dit p��jemn� rozhovor v kl�t��e.",dia_cornelius_dontbelieveyou_monastery);
	};
	if(hero.guild == GIL_SLD)
	{
		Info_AddChoice(dia_cornelius_dontbelieveyou,"M��u �old�k�m ��ct, kde bydl�.",dia_cornelius_dontbelieveyou_knowyourhome);
	};
	if(hero.guild == GIL_MIL)
	{
		Info_AddChoice(dia_cornelius_dontbelieveyou,"K�iv� p��saha ti zajist� �tulnou kobku - na dlouhou dobu!",dia_cornelius_dontbelieveyou_perjury);
	};
};

func void dia_cornelius_dontbelieveyou_whatyouwant()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_WhatYouWant_15_00");	//Co chce�?
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WhatYouWant_13_01");	//(arogantn�) Nikdy jsi nem�l tolik pen�z, abys mi mohl zaplatit.
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_WhatYouWant_15_02");	//Kolik?
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WhatYouWant_13_03");	//2000 zlat�ch. Jo, to by mohlo sta�it k tomu, abych si to rozmyslel.
	b_logentry(TOPIC_RESCUEBENNET,"Za 2000 zla��k� je se mnou Cornelius ochoten mluvit.");
	CORNELIUS_PAYFORPROOF = TRUE;
	Info_ClearChoices(dia_cornelius_dontbelieveyou);
};

func void dia_cornelius_dontbelieveyou_wantsurvive()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_WantSurvive_15_00");	//Sv�ho �ivota si dost cen�, co?
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WantSurvive_13_01");	//(vyd�en�) Kdy� m� napadne�, pov�s� t�.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WantSurvive_13_02");	//M�m mocn� p��tele. Tak�e se na m� neopova�uj vzt�hnout ruku.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WantSurvive_13_03");	//A te� odsud vypadni! Nebo zavol�m str�e!
	AI_StopProcessInfos(self);
};

func void dia_cornelius_dontbelieveyou_monastery()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_Monastery_15_00");	//M��ou ti za��dit p��jemn� rozhovor v kl�te�e.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_Monastery_13_01");	//(b�l� jak st�na) Co t�m mysl�?
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_Monastery_15_02");	//Fajn, zn�me zp�sob, jak dostat pravdu na sv�tlo. Bolestiv� zp�sob.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_Monastery_13_03");	//Ne, pros�m, ne. �eknu ti v�echno, co chce�.
	CORNELIUS_TELLTRUTH = TRUE;
	Info_ClearChoices(dia_cornelius_dontbelieveyou);
};

func void dia_cornelius_dontbelieveyou_knowyourhome()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KnowYourHome_15_00");	//M��u �old�k�m ��ct, kde bydl�.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_KnowYourHome_13_01");	//(b�l� jak st�na) Co to m� znamenat?
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KnowYourHome_15_02");	//Vsad�m se, �e by za sezn�men� s tebou dali �ivot. V�bec z toho nemaj� radost.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_KnowYourHome_13_03");	//To nem��e�. Zabij� m�.
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KnowYourHome_15_04");	//S nejv�t�� pravd�podobnost�.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_KnowYourHome_13_05");	//�eknu ti, co bude� cht�t, ale nesm� to ud�lat.
	CORNELIUS_TELLTRUTH = TRUE;
	Info_ClearChoices(dia_cornelius_dontbelieveyou);
};

func void dia_cornelius_dontbelieveyou_perjury()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_Perjury_15_00");	//K�iv� p��saha ti zajist� �tulnou kobku - na dlouhou dobu!
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_Perjury_13_01");	//Sna�� se mi vyhro�ovat? Mn�, tajemn�kovi m�stodr��c�ho?
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_Perjury_13_02");	//Jestli okam�it� nevypadne�, budu se d�vat na to, jak t� degraduj�.
	CORNELIUS_THREATENBYMILSC = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_CORNELIUS_PAYCORNELIUS(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 4;
	condition = dia_cornelius_paycornelius_condition;
	information = dia_cornelius_paycornelius_info;
	permanent = TRUE;
	description = "Tady je zlato.";
};


func int dia_cornelius_paycornelius_condition()
{
	if((CORNELIUS_PAYFORPROOF == TRUE) && (Npc_HasItems(other,itmi_gold) >= 2000))
	{
		return TRUE;
	};
};

func void dia_cornelius_paycornelius_info()
{
	AI_Output(other,self,"DIA_Cornelius_PayCornelius_15_00");	//Tady je zlato.
	b_giveinvitems(other,self,itmi_gold,2000);
	AI_Output(self,other,"DIA_Cornelius_PayCornelius_13_01");	//Rad�ji se ani nebudu pt�t, kdes k tomu p�i�el.
	AI_Output(self,other,"DIA_Cornelius_PayCornelius_13_02");	//Abych byl up��mn�, tak m� to ani nezaj�m�.
	AI_Output(self,other,"DIA_Cornelius_PayCornelius_13_03");	//Ale jsme partne�i.
	CORNELIUS_TELLTRUTH = TRUE;
};


instance DIA_CORNELIUS_REALSTORY(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 4;
	condition = dia_cornelius_realstory_condition;
	information = dia_cornelius_realstory_info;
	permanent = TRUE;
	description = "Tak co se doopravdy stalo?";
};


func int dia_cornelius_realstory_condition()
{
	if(CORNELIUS_TELLTRUTH == TRUE)
	{
		return TRUE;
	};
};

func void dia_cornelius_realstory_info()
{
	AI_Output(other,self,"DIA_Cornelius_RealStory_15_00");	//Tak co se doopravdy stalo?
	AI_Output(self,other,"DIA_Cornelius_RealStory_13_01");	//Nev�m, co se stalo. Dostal jsem n�jak� zlato za to, �e obvin�m toho �old�ka.
	AI_Output(self,other,"DIA_Cornelius_RealStory_13_02");	//V takov�ch �asech jako te� se ka�d� star� jen s�m o sebe. Pot�eboval jsem pen�ze.
	AI_Output(other,self,"DIA_Cornelius_RealStory_15_03");	//Kdo ti zaplatil?
	AI_Output(self,other,"DIA_Cornelius_RealStory_13_04");	//To ne�eknu. Zabije m�, kdy� ho pr�sknu.
	AI_Output(other,self,"DIA_Cornelius_RealStory_15_05");	//Jsi p�ipraven tohle ��ct tak� lordu Hagenovi?
	AI_Output(self,other,"DIA_Cornelius_RealStory_13_06");	//Nejsem bl�zen. Nem��u z�stat ve m�st�.
	if(Npc_HasItems(self,itwr_corneliustagebuch_mis) >= 1)
	{
		AI_Output(self,other,"DIA_Cornelius_RealStory_13_07");	//D�m ti sv�j den�k, to by jako d�kaz mohlo sta�it.
		b_giveinvitems(self,other,itwr_corneliustagebuch_mis,1);
	};
	b_logentry(TOPIC_RESCUEBENNET,"Cornelius lhal - podplatili ho, aby Benneta dostal do basy. Kdo mu ale ty pen�ze dal, to mi neprozradil. Je cel� pod�lan� strachy.");
	CORNELIUSFLEE = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FLEE");
};


instance DIA_CORNELIUS_FLEEING(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 1;
	condition = dia_cornelius_fleeing_condition;
	information = dia_cornelius_fleeing_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_cornelius_fleeing_condition()
{
	if((CORNELIUSFLEE == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_cornelius_fleeing_info()
{
	b_say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};


instance DIA_CORNELIUS_PICKPOCKET(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 900;
	condition = dia_cornelius_pickpocket_condition;
	information = dia_cornelius_pickpocket_info;
	permanent = TRUE;
	description = "(Kr�de� t�hle knihy by byla dosti riskantn�.)";
};


func int dia_cornelius_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (RECUEBENNET_KNOWSCORNELIUS == TRUE) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itwr_corneliustagebuch_mis) >= 1) && (other.attribute[ATR_DEXTERITY] >= (60 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_cornelius_pickpocket_info()
{
	Info_ClearChoices(dia_cornelius_pickpocket);
	Info_AddChoice(dia_cornelius_pickpocket,DIALOG_BACK,dia_cornelius_pickpocket_back);
	Info_AddChoice(dia_cornelius_pickpocket,DIALOG_PICKPOCKET,dia_cornelius_pickpocket_doit);
};

func void dia_cornelius_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 60)
	{
		b_giveinvitems(self,other,itwr_corneliustagebuch_mis,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_cornelius_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_cornelius_pickpocket_back()
{
	Info_ClearChoices(dia_cornelius_pickpocket);
};

