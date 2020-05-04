
instance DIA_ALWIN_EXIT(C_INFO)
{
	npc = vlk_424_alwin;
	nr = 999;
	condition = dia_alwin_exit_condition;
	information = dia_alwin_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_alwin_exit_condition()
{
	return TRUE;
};

func void dia_alwin_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ALWIN_PICKPOCKET(C_INFO)
{
	npc = vlk_424_alwin;
	nr = 900;
	condition = dia_alwin_pickpocket_condition;
	information = dia_alwin_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_alwin_pickpocket_condition()
{
	return c_beklauen(20,10);
};

func void dia_alwin_pickpocket_info()
{
	Info_ClearChoices(dia_alwin_pickpocket);
	Info_AddChoice(dia_alwin_pickpocket,DIALOG_BACK,dia_alwin_pickpocket_back);
	Info_AddChoice(dia_alwin_pickpocket,DIALOG_PICKPOCKET,dia_alwin_pickpocket_doit);
};

func void dia_alwin_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_alwin_pickpocket);
};

func void dia_alwin_pickpocket_back()
{
	Info_ClearChoices(dia_alwin_pickpocket);
};


instance DIA_ALWIN_SHEEP(C_INFO)
{
	npc = vlk_424_alwin;
	nr = 3;
	condition = dia_alwin_sheep_condition;
	information = dia_alwin_sheep_info;
	permanent = FALSE;
	description = "Tohle jsou tvoje ovce?";
};


func int dia_alwin_sheep_condition()
{
	return TRUE;
};

func void dia_alwin_sheep_info()
{
	AI_Output(other,self,"DIA_Alwin_Sheep_15_00");	//Tohle jsou tvoje ovce?
	AI_Output(self,other,"DIA_Alwin_Sheep_12_01");	//Ke mn� pat�� jenom ta, kter� nese jm�no Lucy (usm�je se) - a to je moje �ena.
	AI_Output(self,other,"DIA_Alwin_Sheep_12_02");	//Ovce jsou majetkem domobrany - hned, jak je z�skaj� od farm���, p�ivedou je ke mn�.
};


instance DIA_ALWIN_FELLAN(C_INFO)
{
	npc = vlk_424_alwin;
	nr = 2;
	condition = dia_alwin_fellan_condition;
	information = dia_alwin_fellan_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_alwin_fellan_condition()
{
	if(Npc_IsInState(self,zs_talk) && (Npc_IsDead(fellan) == FALSE))
	{
		return TRUE;
	};
};

func void dia_alwin_fellan_info()
{
	AI_Output(self,other,"DIA_Alwin_Fellan_12_00");	//Hochu, to ��len� ml�cen� kladivem m� p�ivede do hrobu.
	AI_Output(other,self,"DIA_Alwin_Fellan_15_01");	//O �em to mluv�?
	AI_Output(self,other,"DIA_Alwin_Fellan_12_02");	//Copak nesly�� ty r�ny? Kdo asi tak m��e v p��stavn� �tvrti od r�na do ve�era bu�it kladivem?
	AI_Output(self,other,"DIA_Alwin_Fellan_12_03");	//Mysl�m toho cvoka Fellana. Ka�d� den si do t� sv� chatr�e bere kladivo.
};


instance DIA_ALWIN_FELLANRUNNING(C_INFO)
{
	npc = vlk_424_alwin;
	nr = 2;
	condition = dia_alwin_fellanrunning_condition;
	information = dia_alwin_fellanrunning_info;
	permanent = FALSE;
	description = "Mohl bych se o Fellana postarat.";
};


func int dia_alwin_fellanrunning_condition()
{
	if(Npc_IsInState(self,zs_talk) && (Npc_IsDead(fellan) == FALSE))
	{
		return TRUE;
	};
};

func void dia_alwin_fellanrunning_info()
{
	AI_Output(other,self,"DIA_Alwin_FellanRunning_15_00");	//Mohl bych se o Fellana postarat.
	AI_Output(self,other,"DIA_Alwin_FellanRunning_12_01");	//Ty mi chce� pomoct? A co z toho bude� m�t?
	AI_Output(other,self,"DIA_Alwin_FellanRunning_15_02");	//To mi pov�z ty.
	AI_Output(self,other,"DIA_Alwin_FellanRunning_12_03");	//Aha, tak je to! No dob�e - kdy� to jeho bu�en� n�jak uml��, zaplat�m ti 25 zla��k�.
	AI_Output(self,other,"DIA_Alwin_FellanRunning_12_04");	//Ale upozor�uju t�, �e s n�m rozumnou domluvou nic nesvede� - je to tot�ln� magor. Jedin� v�c, kter� by mu pomohla, je p�r dob�e m��en�ch facek!
	MIS_ATTACKFELLAN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ALWIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ALWIN,LOG_RUNNING);
	b_logentry(TOPIC_ALWIN,"Alwin m� po��dal, zda bych nep�im�l Fellana, aby p�estal bu�it kladivem. Zab�t ho ale nebude zrovna to nejlep�� �e�en�.");
	Info_ClearChoices(dia_alwin_fellanrunning);
	Info_AddChoice(dia_alwin_fellanrunning,"Uvid�m, co se d� d�lat...",dia_alwin_fellanrunning_ok);
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		Info_AddChoice(dia_alwin_fellanrunning,"Kdy� ho zml�t�m, budu z toho m�t jenom opleta�ky s domobranou...",dia_alwin_fellanrunning_problems);
	};
};

func void dia_alwin_fellanrunning_ok()
{
	AI_Output(other,self,"DIA_Alwin_FellanRunning_Ok_15_00");	//Uvid�m, co se d� d�lat.
	AI_Output(self,other,"DIA_Alwin_FellanRunning_Ok_12_01");	//Jen si to rozmysli a pamatuj si, �e jsem ti sl�bil 25 zla��k�.
	Info_ClearChoices(dia_alwin_fellanrunning);
};

func void dia_alwin_fellanrunning_problems()
{
	AI_Output(other,self,"DIA_Alwin_FellanRunning_Problems_15_00");	//Kdy� ho zml�t�m, budu z toho m�t jenom opleta�ky s domobranou.
	AI_Output(self,other,"DIA_Alwin_Add_12_00");	//Tady v p��stavu se n�jak� ta rva�ka tak tragicky nebere.
	AI_Output(self,other,"DIA_Alwin_Add_12_01");	//Ale jestli tu n�kde n�co �lohne� nebo mi ��hne� na ovce, bude� v p�kn�m pr��vihu.
};


instance DIA_ALWIN_FELLANSUCCESS(C_INFO)
{
	npc = vlk_424_alwin;
	nr = 4;
	condition = dia_alwin_fellansuccess_condition;
	information = dia_alwin_fellansuccess_info;
	permanent = FALSE;
	description = "Fellan u� kladivem tlouci nebude.";
};


func int dia_alwin_fellansuccess_condition()
{
	if((MIS_ATTACKFELLAN == LOG_RUNNING) && ((FELLANGESCHLAGEN == TRUE) || Npc_IsDead(fellan)))
	{
		return TRUE;
	};
};

func void dia_alwin_fellansuccess_info()
{
	AI_Output(other,self,"DIA_Alwin_FellanSuccess_15_00");	//Fellan u� kladivem tlouci nebude.
	AI_Output(self,other,"DIA_Alwin_FellanSuccess_12_01");	//Sly�� to? Ticho - ��dn� r�ny. Kone�n�. Myslel jsem, �e ten chlap nikdy nezmlkne.
	if(Npc_IsDead(fellan) == FALSE)
	{
		AI_Output(self,other,"DIA_Alwin_FellanSuccess_12_02");	//Prok�zals mi velkou laskavost. V� co? D�m ti cel�ch 30 zla��k�.
		b_giveinvitems(self,other,itmi_gold,30);
		MIS_ATTACKFELLAN = LOG_SUCCESS;
		b_giveplayerxp(XP_AMBIENT);
	}
	else
	{
		MIS_ATTACKFELLAN = LOG_FAILED;
	};
};


instance DIA_ALWIN_ENDLOS(C_INFO)
{
	npc = vlk_424_alwin;
	nr = 8;
	condition = dia_alwin_endlos_condition;
	information = dia_alwin_endlos_info;
	permanent = TRUE;
	description = "A jak se da�� ovc�m?";
};


func int dia_alwin_endlos_condition()
{
	if(Npc_KnowsInfo(other,dia_alwin_sheep))
	{
		return TRUE;
	};
};

func void dia_alwin_endlos_info()
{
	AI_Output(other,self,"DIA_Alwin_Endlos_15_00");	//A jak se da�� ovc�m?
	if((MIS_ATTACKFELLAN != LOG_SUCCESS) && (Npc_IsDead(fellan) == FALSE))
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_01");	//Z toho Fellanova ml�cen� u� pomalu ��l�. Je�t� p�r dn� a budou �pln� na�rot.
	}
	else if(KAPITEL <= 2)
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_02");	//Ovce se jen cpou a jsou ��m d�l t�m tlust��. Stejn� jako moje �ena. HAHAHA (hlasit� se sm�je).
	}
	else if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET != LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Alwin_Endlos_12_03");	//Mo�n� bych m�l jednu z nich klepnout - jako posledn� ve�e�i!
			AI_Output(other,self,"DIA_Alwin_Endlos_15_04");	//Jako co?
			AI_Output(self,other,"DIA_Alwin_Endlos_12_05");	//Pro jednoho �old�ka, kter� zabil paladina. Samoz�ejm� ho za to poprav�.
			AI_Output(self,other,"DIA_Alwin_Endlos_12_06");	//Jen se mus�m rozhodnout, kter� z nich p�jde na poprav�� �palek.
		}
		else
		{
			AI_Output(self,other,"DIA_Alwin_Endlos_12_07");	//Lucy m� opravdu �t�st�, �e je je�t� na�ivu.
			AI_Output(other,self,"DIA_Alwin_Endlos_15_08");	//Myslel jsem, �e jsi ��kal, �e Lucy je tv� �ena.
			AI_Output(self,other,"DIA_Alwin_Endlos_12_09");	//Spr�vn�, ale jedna z ovc� se taky jmenuje Lucy. Pr�v� ona m�la b�t posledn�m j�dlem pro Benneta.
			AI_Output(self,other,"DIA_Alwin_Endlos_12_10");	//Ale nakonec se to v�echno vy�e�ilo a Lucy m��e b�t r�da.
		};
	}
	else if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_11");	//�asem je ale pozorov�n� pasouc�ch se ovc� docela nuda.
	}
	else
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_12");	//Tak se s nimi lou��m. Lord Hagen rozk�zal, �e v�echny ovce poslou�� jako z�soby pro jeho arm�du.
		AI_Output(self,other,"DIA_Alwin_Endlos_12_13");	//Ale aspo� budu m�t v�c �asu na svou �enu.
	};
};

