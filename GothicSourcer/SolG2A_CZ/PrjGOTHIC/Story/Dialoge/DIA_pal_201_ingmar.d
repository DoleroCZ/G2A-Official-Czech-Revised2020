
instance DIA_INGMAR_EXIT(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 999;
	condition = dia_ingmar_exit_condition;
	information = dia_ingmar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ingmar_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_ingmar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_INGMAR_HALLO(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 2;
	condition = dia_ingmar_hallo_condition;
	information = dia_ingmar_hallo_info;
	permanent = TRUE;
	important = TRUE;
};


var int dia_ingmar_hallo_permanent;

func int dia_ingmar_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (DIA_INGMAR_HALLO_PERMANENT == FALSE) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_ingmar_hallo_info()
{
	if((ENTEROW_KAPITEL2 == FALSE) && (lordhagen.aivar[AIV_TALKEDTOPLAYER] == TRUE))
	{
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_00");	//Podle zpr�v, kter� jsem dostal, je Hornick� �dol� dost nebezpe�n� m�sto.
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_01");	//Ne� odejde�, po��dn� se vybav.
	}
	else if((MIS_OLDWORLD == LOG_SUCCESS) && (lordhagen.aivar[AIV_TALKEDTOPLAYER] == TRUE))
	{
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_02");	//Situace v Hornick�m �dol� je v�n�. Ale p�iprav�me n�jak� pl�n, jak odtamtud dostat na�e chlapce i s rudou.
		DIA_INGMAR_HALLO_PERMANENT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_03");	//Myslel jsem, �e sis p�i�el promluvit s lordem Hagenem. M�l bys j�t d�l a popov�dat si s n�m.
	};
};


instance DIA_INGMAR_KRIEG(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 99;
	condition = dia_ingmar_krieg_condition;
	information = dia_ingmar_krieg_info;
	permanent = FALSE;
	description = "Jak� je situace na kontinentu?";
};


func int dia_ingmar_krieg_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_ingmar_krieg_info()
{
	AI_Output(other,self,"DIA_Ingmar_Krieg_15_00");	//Jak� je situace na kontinentu?
	AI_Output(self,other,"DIA_Ingmar_Krieg_06_01");	//V�lka je�t� nen� vyhran�, i kdy� kr�lovsk� s�ly u� �enou sk�ety zp�t.
	AI_Output(self,other,"DIA_Ingmar_Krieg_06_02");	//Na mnoh�ch m�stech se ale shroma��uj� men�� tlupy sk�et� a sna�� se na�� arm�du rozt��tit.
	AI_Output(self,other,"DIA_Ingmar_Krieg_06_03");	//Bojuj� beze cti a bez v�ry - mus�me tedy zv�t�zit.
};


instance DIA_INGMAR_CANTEACH(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 100;
	condition = dia_ingmar_canteach_condition;
	information = dia_ingmar_canteach_info;
	permanent = TRUE;
	description = "M��e� m� n�co nau�it?";
};


func int dia_ingmar_canteach_condition()
{
	if(INGMAR_TEACHSTR == FALSE)
	{
		return TRUE;
	};
};

func void dia_ingmar_canteach_info()
{
	AI_Output(other,self,"DIA_Ingmar_CanTeach_15_00");	//M��e� m� n�co nau�it?
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Ingmar_CanTeach_06_01");	//M��u t� nau�it, jak si pos�lit pa�e, abys mohl pou��vat zbran� efektivn�ji.
		INGMAR_TEACHSTR = TRUE;
		b_logentry(TOPIC_CITYTEACHER,"Paladin Ingmar mi m��e pomoci zv��it s�lu.");
	}
	else
	{
		AI_Output(self,other,"DIA_Ingmar_CanTeach_06_02");	//U��m pouze �leny na�eho ��du.
	};
};


instance DIA_INGMAR_TEACH(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 6;
	condition = dia_ingmar_teach_condition;
	information = dia_ingmar_teach_info;
	permanent = TRUE;
	description = "Cht�l bych se st�t siln�j��m.";
};


func int dia_ingmar_teach_condition()
{
	if(INGMAR_TEACHSTR == TRUE)
	{
		return TRUE;
	};
};

func void dia_ingmar_teach_info()
{
	AI_Output(other,self,"DIA_Ingmar_Teach_15_00");	//Cht�l bych se st�t siln�j��m.
	Info_ClearChoices(dia_ingmar_teach);
	Info_AddChoice(dia_ingmar_teach,DIALOG_BACK,dia_ingmar_teach_back);
	Info_AddChoice(dia_ingmar_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_ingmar_teach_1);
	Info_AddChoice(dia_ingmar_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_ingmar_teach_5);
};

func void dia_ingmar_teach_back()
{
	if(other.attribute[ATR_STRENGTH] >= T_MAX)
	{
		AI_Output(self,other,"DIA_Ingmar_Teach_06_00");	//U� jsi siln� jako trol. Nen� nic, co bych t� mohl nau�it.
	};
	Info_ClearChoices(dia_ingmar_teach);
};

func void dia_ingmar_teach_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_MAX);
	Info_ClearChoices(dia_ingmar_teach);
	Info_AddChoice(dia_ingmar_teach,DIALOG_BACK,dia_ingmar_teach_back);
	Info_AddChoice(dia_ingmar_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_ingmar_teach_1);
	Info_AddChoice(dia_ingmar_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_ingmar_teach_5);
};

func void dia_ingmar_teach_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_MAX);
	Info_ClearChoices(dia_ingmar_teach);
	Info_AddChoice(dia_ingmar_teach,DIALOG_BACK,dia_ingmar_teach_back);
	Info_AddChoice(dia_ingmar_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_ingmar_teach_1);
	Info_AddChoice(dia_ingmar_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_ingmar_teach_5);
};


instance DIA_INGMAR_KAP3_EXIT(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 999;
	condition = dia_ingmar_kap3_exit_condition;
	information = dia_ingmar_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ingmar_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_ingmar_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_INGMAR_KAP4_EXIT(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 999;
	condition = dia_ingmar_kap4_exit_condition;
	information = dia_ingmar_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ingmar_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_ingmar_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_INGMAR_ORKELITE(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 40;
	condition = dia_ingmar_orkelite_condition;
	information = dia_ingmar_orkelite_info;
	description = "Sk�eti pl�nuj� hlavn� ofenz�vu.";
};


func int dia_ingmar_orkelite_condition()
{
	if(((TALKEDTO_ANTIPALADIN == TRUE) || Npc_HasItems(other,itri_orcelitering) || (HAGEN_SAWORCRING == TRUE)) && (hero.guild == GIL_PAL))
	{
		return TRUE;
	};
};

func void dia_ingmar_orkelite_info()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_15_00");	//Sk�eti pl�nuj� hlavn� ofenz�vu.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_06_01");	//V�n�. Tak to je velice zaj�mav�. A na z�klad� �eho se tak domn�v�?
	if(TALKEDTO_ANTIPALADIN == TRUE)
	{
		AI_Output(other,self,"DIA_Ingmar_ORKELITE_15_02");	//Mluvil jsem s nimi.
	};
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_15_03");	//Po kraji se potuluj� jejich velitel�.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_06_04");	//Hmm. To nezn� jako typick� sk�et� strategie.
	Info_ClearChoices(dia_ingmar_orkelite);
	Info_AddChoice(dia_ingmar_orkelite,"Rad�ji bys m�l p�ij�t na n�co, jak se jich zbavit.",dia_ingmar_orkelite_loswerden);
	Info_AddChoice(dia_ingmar_orkelite,"Co ud�l�me?",dia_ingmar_orkelite_wastun);
	Info_AddChoice(dia_ingmar_orkelite,"Co to znamen�?",dia_ingmar_orkelite_wieso);
	Log_CreateTopic(TOPIC_ORCELITE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ORCELITE,LOG_RUNNING);
	b_logentry(TOPIC_ORCELITE,"Ingmar se velmi zaj�m� o p��b�h sk�et�ch elitn�ch v�le�n�k�.");
	MIS_KILLORKOBERST = LOG_RUNNING;
};

func void dia_ingmar_orkelite_loswerden()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_loswerden_15_00");	//Rad�ji bys m�l p�ij�t na n�co, jak se jich zbavit.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_loswerden_06_01");	//M�lo by sta�it, kdybychom m�li v�c informac�. Po�lu n�koho, aby prozkoumal okol�.
	Info_ClearChoices(dia_ingmar_orkelite);
};

func void dia_ingmar_orkelite_wieso()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_wieso_15_00");	//Co to znamen�?
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_01");	//Pokud to, co ��k�, je pravda, tak n�s cht�j� oslabit zevnit� t�m, �e na n�s budou �to�it jejich nejlep�� v�le�n�ci.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_02");	//Obvykle jeden takov� velitel vede skupinu sk�et�ch bojovn�k�. M�lokdy jich vid� dva nebo v�c pohromad�.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_03");	//D�laj� to z n�jak�ho d�vodu. Jejich v�dci tvo�� j�dro �to�n� strategie a v�t�inou jsou obklopeni sk�et�mi v�le�n�ky.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_04");	//Je tedy velice t�k� se k n�komu z nich dostat, ani� by bylo nutn� si prosekat cestu alespo� t�iceti nep��teli.
	b_logentry(TOPIC_ORCELITE,"Ingmar se zm�nil o hlavn�m sk�et�m vojev�dci.");
};

func void dia_ingmar_orkelite_wastun()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_wasTun_15_00");	//Co ud�l�me?
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_01");	//Kdy� jich je tolik jako te�, jedn� se v�t�inou o n�jezdnou patrolu, kterou vede ten nejv��e postaven� z nich.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_02");	//Nejv��e postaven� vojev�dce si za��d� hlavn� stan v n�jak� jeskyni, odkud vys�l� sv� vojsko do boje.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_03");	//Pokud by se n�m poda�ilo tohoto velitele zne�kodnit, z�skali bychom tak nezanedbatelnou v�hodu.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_04");	//Sk�et� velitel se v�t�inou pohybuje v bl�zkosti sv�ch nep��tel. Asi by bylo dobr� hledat jeho jeskyni n�kde nedaleko m�sta.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_05");	//N�kolik sk�et� bylo spat�eno pobl� Lobartovy farmy. Asi by bylo moudr� za��t s p�tr�n�m tam.
	b_logentry(TOPIC_ORCELITE,"Podle Ingmara bych m�l sk�et�ho plukovn�ka hledat v jeskyni kdesi u Lobartova statku. M�m ho naj�t a zni�it.");
	Info_ClearChoices(dia_ingmar_orkelite);
};


instance DIA_INGMAR_HAUPTQUARTIER(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 41;
	condition = dia_ingmar_hauptquartier_condition;
	information = dia_ingmar_hauptquartier_info;
	permanent = FALSE;
	description = "Na�el jsem hlavn� stan sk�et�. Jejich vojev�dce padl.";
};


func int dia_ingmar_hauptquartier_condition()
{
	if(Npc_IsDead(orkelite_antipaladinorkoberst) && Npc_KnowsInfo(other,dia_ingmar_orkelite))
	{
		return TRUE;
	};
};

func void dia_ingmar_hauptquartier_info()
{
	AI_Output(other,self,"DIA_Ingmar_HAUPTQUARTIER_15_00");	//Na�el jsem hlavn� stan sk�et�. Jejich vojev�dce padl.
	AI_Output(self,other,"DIA_Ingmar_HAUPTQUARTIER_06_01");	//To je vynikaj�c� zpr�va. Sk�eti tak nebudou m�t n�jak� �as na �tok ani pomy�len�.
	AI_Output(self,other,"DIA_Ingmar_HAUPTQUARTIER_06_02");	//To nen� �patn�. Kdybychom m�li v�c ryt��� jako jsi ty, byla by nadch�zej�c� bitva p�edem rozhodnuta.
	AI_Output(self,other,"DIA_Ingmar_HAUPTQUARTIER_06_03");	//Vezmi si tohle zlato a kup si za n�j n�jakou po��dnou v�bavu.
	b_giveplayerxp(XP_KILLEDORKOBERST);
	CreateInvItems(self,itmi_gold,300);
	b_giveinvitems(self,other,itmi_gold,300);
	MIS_KILLORKOBERST = LOG_SUCCESS;
};


instance DIA_INGMAR_KAP5_EXIT(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 999;
	condition = dia_ingmar_kap5_exit_condition;
	information = dia_ingmar_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ingmar_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_ingmar_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_INGMAR_KAP6_EXIT(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 999;
	condition = dia_ingmar_kap6_exit_condition;
	information = dia_ingmar_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ingmar_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_ingmar_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_INGMAR_PICKPOCKET(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 900;
	condition = dia_ingmar_pickpocket_condition;
	information = dia_ingmar_pickpocket_info;
	permanent = TRUE;
	description = "(Tento svitek je t�m�� nemo�n� ukr�st.)";
};


func int dia_ingmar_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (other.attribute[ATR_DEXTERITY] >= (105 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_ingmar_pickpocket_info()
{
	Info_ClearChoices(dia_ingmar_pickpocket);
	Info_AddChoice(dia_ingmar_pickpocket,DIALOG_BACK,dia_ingmar_pickpocket_back);
	Info_AddChoice(dia_ingmar_pickpocket,DIALOG_PICKPOCKET,dia_ingmar_pickpocket_doit);
};

func void dia_ingmar_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 105)
	{
		b_giveinvitems(self,other,itwr_manowar,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_ingmar_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_ingmar_pickpocket_back()
{
	Info_ClearChoices(dia_ingmar_pickpocket);
};

