
instance DIA_UDAR_EXIT(C_INFO)
{
	npc = pal_268_udar;
	nr = 999;
	condition = dia_udar_exit_condition;
	information = dia_udar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_udar_exit_condition()
{
	if(KAPITEL < 4)
	{
		return TRUE;
	};
};

func void dia_udar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_UDAR_HELLO(C_INFO)
{
	npc = pal_268_udar;
	nr = 2;
	condition = dia_udar_hello_condition;
	information = dia_udar_hello_info;
	important = TRUE;
};


func int dia_udar_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_udar_hello_info()
{
	AI_Output(self,other,"DIA_Udar_Hello_09_00");	//Kdy� jsi ve�el, m�l jsi zatracen� �t�st�. M�lem jsem t� zast�elil.
	AI_Output(other,self,"DIA_Udar_Hello_15_01");	//V tom p��pad� bych asi m�l b�t r�d, �e m� tak skv�l� zrak.
	AI_Output(self,other,"DIA_Udar_Hello_09_02");	//�et�i si dech. Jestli n�co chce�, promluv si se Sengrathem.
	AI_StopProcessInfos(self);
};


instance DIA_UDAR_YOUAREBEST(C_INFO)
{
	npc = pal_268_udar;
	nr = 3;
	condition = dia_udar_youarebest_condition;
	information = dia_udar_youarebest_info;
	permanent = FALSE;
	description = "Sly�el jsem, �e jsi NEJLEP�� st�elec z ku�e �iroko daleko.";
};


func int dia_udar_youarebest_condition()
{
	if(Npc_KnowsInfo(other,dia_keroloth_udar))
	{
		return 1;
	};
};

func void dia_udar_youarebest_info()
{
	AI_Output(other,self,"DIA_Udar_YouAreBest_15_00");	//Sly�el jsem, �e jsi NEJLEP�� st�elec z ku�e �iroko daleko.
	AI_Output(self,other,"DIA_Udar_YouAreBest_09_01");	//Pokud se to ��k�, tak to asi bude pravda. Co chce�?
};


instance DIA_UDAR_TEACHME(C_INFO)
{
	npc = pal_268_udar;
	nr = 3;
	condition = dia_udar_teachme_condition;
	information = dia_udar_teachme_info;
	permanent = FALSE;
	description = "Nau� m�, jak spr�vn� st��let z ku�e.";
};


func int dia_udar_teachme_condition()
{
	if(Npc_KnowsInfo(other,dia_udar_youarebest) && (UDAR_TEACHPLAYER != TRUE))
	{
		return 1;
	};
};

func void dia_udar_teachme_info()
{
	AI_Output(other,self,"DIA_Udar_Teacher_15_00");	//Nau� m�, jak spr�vn� st��let z ku�e.
	AI_Output(self,other,"DIA_Udar_Teacher_09_01");	//Zmiz! Kolem hradu pob�h� spousta ter��. Cvi� se na nich.
};


instance DIA_UDAR_IMGOOD(C_INFO)
{
	npc = pal_268_udar;
	nr = 3;
	condition = dia_udar_imgood_condition;
	information = dia_udar_imgood_info;
	permanent = FALSE;
	description = "Jsem nejlep��.";
};


func int dia_udar_imgood_condition()
{
	if(Npc_KnowsInfo(other,dia_udar_youarebest))
	{
		return 1;
	};
};

func void dia_udar_imgood_info()
{
	AI_Output(other,self,"DIA_Udar_ImGood_15_00");	//Jsem nejlep��.
	AI_Output(self,other,"DIA_Udar_ImGood_09_01");	//(sm�je se) To teda jo!
	AI_Output(self,other,"DIA_Udar_ImGood_09_02");	//No, pokud se chce� u�it, pom��u ti.
	UDAR_TEACHPLAYER = TRUE;
	b_logentry(TOPIC_TEACHER_OC,"Udar mi vysv�tl�, jak zach�zet s ku��.");
};


instance DIA_UDAR_TEACH(C_INFO)
{
	npc = pal_268_udar;
	nr = 3;
	condition = dia_udar_teach_condition;
	information = dia_udar_teach_info;
	permanent = TRUE;
	description = "Chci se u�it od tebe.";
};


func int dia_udar_teach_condition()
{
	if(UDAR_TEACHPLAYER == TRUE)
	{
		return 1;
	};
};

func void dia_udar_teach_info()
{
	AI_Output(other,self,"DIA_Udar_Teach_15_00");	//Chci se u�it od tebe.
	AI_Output(self,other,"DIA_Udar_Teach_09_01");	//Dobr�, tak spus�!
	Info_ClearChoices(dia_udar_teach);
	Info_AddChoice(dia_udar_teach,DIALOG_BACK,dia_udar_teach_back);
	Info_AddChoice(dia_udar_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_udar_teach_crossbow_1);
	Info_AddChoice(dia_udar_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_udar_teach_crossbow_5);
};

func void dia_udar_teach_back()
{
	Info_ClearChoices(dia_udar_teach);
};

func void b_udar_teachnomore1()
{
	AI_Output(self,other,"B_Udar_TeachNoMore1_09_00");	//Z�klady u� um� - na v�c nem�me �as.
};

func void b_udar_teachnomore2()
{
	AI_Output(self,other,"B_Udar_TeachNoMore2_09_00");	//Jestli se chce� nau�it se svou zbran� zach�zet l�pe, m�l by sis naj�t skute�n�ho u�itele.
};

func void dia_udar_teach_crossbow_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,1,60);
	if(other.hitchance[NPC_TALENT_CROSSBOW] >= 60)
	{
		b_udar_teachnomore1();
		if(Npc_GetTalentSkill(other,NPC_TALENT_CROSSBOW) == 1)
		{
			b_udar_teachnomore2();
		};
	};
	Info_AddChoice(dia_udar_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_udar_teach_crossbow_1);
};

func void dia_udar_teach_crossbow_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,5,60);
	if(other.hitchance[NPC_TALENT_CROSSBOW] >= 60)
	{
		b_udar_teachnomore1();
		if(Npc_GetTalentSkill(other,NPC_TALENT_CROSSBOW) == 1)
		{
			b_udar_teachnomore2();
		};
	};
	Info_AddChoice(dia_udar_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_udar_teach_crossbow_5);
};


instance DIA_UDAR_PERM(C_INFO)
{
	npc = pal_268_udar;
	nr = 11;
	condition = dia_udar_perm_condition;
	information = dia_udar_perm_info;
	permanent = FALSE;
	description = "Jak to jde tady na hrad�?";
};


func int dia_udar_perm_condition()
{
	if(KAPITEL <= 3)
	{
		return TRUE;
	};
};

func void dia_udar_perm_info()
{
	AI_Output(other,self,"DIA_Udar_Perm_15_00");	//Jak to jde tady na hrad�?
	AI_Output(self,other,"DIA_Udar_Perm_09_01");	//P�r chlapc� tr�nuje, ale v z�sad� �ek�me, a� se n�co stane.
	AI_Output(self,other,"DIA_Udar_Perm_09_02");	//Tahle nejistota n�s ub�j�. To maj� sk�eti p�esn� v pl�nu. �ekaj�, a� n�m prasknou nervy.
};


instance DIA_UDAR_RING(C_INFO)
{
	npc = pal_268_udar;
	nr = 11;
	condition = dia_udar_ring_condition;
	information = dia_udar_ring_info;
	permanent = FALSE;
	description = "P�in��m ti Tengron�v prsten...";
};


func int dia_udar_ring_condition()
{
	if(Npc_HasItems(other,itri_tengron) >= 1)
	{
		return TRUE;
	};
};

func void dia_udar_ring_info()
{
	AI_Output(other,self,"DIA_Udar_Ring_15_00");	//P�in��m ti Tengron�v prsten. M�l by t� chr�nit. A� se Tengron vr�t�, bude ho cht�t zp�tky.
	AI_Output(self,other,"DIA_Udar_Ring_09_01");	//Co�e? V�, co to je za prsten? Dostal ho jako odm�nu za svou odvahu v boji.
	AI_Output(self,other,"DIA_Udar_Ring_09_02");	//��k�, �e ho bude cht�t zp�tky? Pokud to je v�le Innosova, stane se tak. Pokud to je v�le Innosova...
	b_giveinvitems(other,self,itri_tengron,1);
	TENGRONRING = TRUE;
	b_giveplayerxp(XP_TENGRONRING);
};


instance DIA_UDAR_KAP4_EXIT(C_INFO)
{
	npc = pal_268_udar;
	nr = 999;
	condition = dia_udar_kap4_exit_condition;
	information = dia_udar_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_udar_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_udar_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_UDAR_KAP4WIEDERDA(C_INFO)
{
	npc = pal_268_udar;
	nr = 40;
	condition = dia_udar_kap4wiederda_condition;
	information = dia_udar_kap4wiederda_info;
	important = TRUE;
};


func int dia_udar_kap4wiederda_condition()
{
	if(KAPITEL >= 4)
	{
		return TRUE;
	};
};

func void dia_udar_kap4wiederda_info()
{
	AI_Output(self,other,"DIA_Udar_Kap4WiederDa_09_00");	//Je dob�e, �e jsi p�i�el. Brzy tady propukne peklo.
	if(hero.guild != GIL_DJG)
	{
		AI_Output(other,self,"DIA_Udar_Kap4WiederDa_15_01");	//Co se stalo?
		AI_Output(self,other,"DIA_Udar_Kap4WiederDa_09_02");	//Po hrad� se poflakuj� drakobijci a chv�staj� se, �e dok�� vy�e�it na�e probl�my s draky.
		AI_Output(self,other,"DIA_Udar_Kap4WiederDa_09_03");	//Ale n�co ti pov�m - vypadaj�, jako by nedok�zali zne�kodnit ani nemocn�ho star�ho slep��e.
	};
	AI_Output(self,other,"DIA_Udar_Kap4WiederDa_09_04");	//Spousta z n�s si za��n� d�lat starosti a u� moc nev���me, �e se odsud dostaneme se zdravou k���.
};


instance DIA_UDAR_SENGRATH(C_INFO)
{
	npc = pal_268_udar;
	nr = 41;
	condition = dia_udar_sengrath_condition;
	information = dia_udar_sengrath_info;
	description = "Nebyli jste tady na hl�dce dva?";
};


func int dia_udar_sengrath_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_udar_kap4wiederda) && (SENGRATH_MISSING == TRUE))
	{
		return TRUE;
	};
};

func void dia_udar_sengrath_info()
{
	AI_Output(other,self,"DIA_Udar_Sengrath_15_00");	//Nebyli jste tady na hl�dce dva?
	AI_Output(self,other,"DIA_Udar_Sengrath_09_01");	//B�valo. Sengrath st�l tady na hradb�ch a najednou z ni�eho nic usnul.
	AI_Output(self,other,"DIA_Udar_Sengrath_09_02");	//Kdy� se to stalo, jeho dobr� samost��l spadnul dol�.
	AI_Output(self,other,"DIA_Udar_Sengrath_09_03");	//Vid�li jsme, jak ho sk�eti popadli a zmizeli s n�m ve tm�.
	AI_Output(self,other,"DIA_Udar_Sengrath_09_04");	//Sengrath se hned probudil a vyb�hl do noci sm�rem ke sk�et� palis�d�. Od t� chv�le jsme ho nevid�li.
	AI_Output(self,other,"DIA_Udar_Sengrath_09_05");	//Innos st�j p�i n�s!
	Log_CreateTopic(TOPIC_SENGRATH_MISSING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SENGRATH_MISSING,LOG_RUNNING);
	b_logentry(TOPIC_SENGRATH_MISSING,"Udar, str�n� z hradu, postr�d� sv�ho druha Sengratha. Naposledy ho vid�l pozd� v noci, kdy� m��il ke sk�et�mu opevn�n� a vracel se pro svou ku�i.");
};


instance DIA_UDAR_SENGRATHGEFUNDEN(C_INFO)
{
	npc = pal_268_udar;
	nr = 42;
	condition = dia_udar_sengrathgefunden_condition;
	information = dia_udar_sengrathgefunden_info;
	description = "Na�el jsem Sengratha.";
};


func int dia_udar_sengrathgefunden_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_udar_sengrath) && Npc_HasItems(other,itrw_sengrathsarmbrust_mis))
	{
		return TRUE;
	};
};

func void dia_udar_sengrathgefunden_info()
{
	AI_Output(other,self,"DIA_Udar_SENGRATHGEFUNDEN_15_00");	//Na�el jsem Sengratha.
	AI_Output(self,other,"DIA_Udar_SENGRATHGEFUNDEN_09_01");	//V�n�? Kde je?
	AI_Output(other,self,"DIA_Udar_SENGRATHGEFUNDEN_15_02");	//Je mrtv�. Tady je jeho ku�e. M�l ji u sebe.
	AI_Output(self,other,"DIA_Udar_SENGRATHGEFUNDEN_09_03");	//Nejsp� se mu ji poda�ilo z�skat zp�t, ale sk�eti ho nakonec p�ece jenom dostali.
	AI_Output(self,other,"DIA_Udar_SENGRATHGEFUNDEN_09_04");	//Zatracen� bl�zen. V�d�l jsem to. V�ichni tady pochc�peme.
	TOPIC_END_SENGRATH_MISSING = TRUE;
	b_giveplayerxp(XP_SENGRATHFOUND);
};


instance DIA_UDAR_BADFEELING(C_INFO)
{
	npc = pal_268_udar;
	nr = 50;
	condition = dia_udar_badfeeling_condition;
	information = dia_udar_badfeeling_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_udar_badfeeling_condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && Npc_IsInState(self,zs_talk) && Npc_KnowsInfo(other,dia_udar_sengrathgefunden) && (KAPITEL >= 4))
	{
		return TRUE;
	};
};

func void dia_udar_badfeeling_info()
{
	if(MIS_OCGATEOPEN == TRUE)
	{
		AI_Output(self,other,"DIA_Udar_BADFEELING_09_00");	//Je�t� jeden takov� �tok a budeme �r�t hl�nu.
	}
	else if(MIS_ALLDRAGONSDEAD == TRUE)
	{
		AI_Output(self,other,"DIA_Udar_BADFEELING_09_01");	//Sk�eti maj� dost starost�. N�co je hrozn� vyd�silo. C�t�m to.
	}
	else
	{
		AI_Output(self,other,"DIA_Udar_BADFEELING_09_02");	//Nem�m z toho v�bec dobr� pocit.
	};
	Npc_SetRefuseTalk(self,30);
};


instance DIA_UDAR_KAP5_EXIT(C_INFO)
{
	npc = pal_268_udar;
	nr = 999;
	condition = dia_udar_kap5_exit_condition;
	information = dia_udar_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_udar_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_udar_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_UDAR_KAP6_EXIT(C_INFO)
{
	npc = pal_268_udar;
	nr = 999;
	condition = dia_udar_kap6_exit_condition;
	information = dia_udar_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_udar_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_udar_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_UDAR_PICKPOCKET(C_INFO)
{
	npc = pal_268_udar;
	nr = 900;
	condition = dia_udar_pickpocket_condition;
	information = dia_udar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_udar_pickpocket_condition()
{
	return c_beklauen(20,15);
};

func void dia_udar_pickpocket_info()
{
	Info_ClearChoices(dia_udar_pickpocket);
	Info_AddChoice(dia_udar_pickpocket,DIALOG_BACK,dia_udar_pickpocket_back);
	Info_AddChoice(dia_udar_pickpocket,DIALOG_PICKPOCKET,dia_udar_pickpocket_doit);
};

func void dia_udar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_udar_pickpocket);
};

func void dia_udar_pickpocket_back()
{
	Info_ClearChoices(dia_udar_pickpocket);
};

