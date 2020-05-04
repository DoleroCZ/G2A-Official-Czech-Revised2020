
instance DIA_WULFGAR_EXIT(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 999;
	condition = dia_wulfgar_exit_condition;
	information = dia_wulfgar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_wulfgar_exit_condition()
{
	return TRUE;
};

func void dia_wulfgar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_WULFGAR_HALLO(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 1;
	condition = dia_wulfgar_hallo_condition;
	information = dia_wulfgar_hallo_info;
	permanent = FALSE;
	description = "Jak jde slu�ba?";
};


func int dia_wulfgar_hallo_condition()
{
	return TRUE;
};

func void dia_wulfgar_hallo_info()
{
	AI_Output(other,self,"DIA_Wulfgar_Hallo_15_00");	//Jak jde slu�ba?
	AI_Output(self,other,"DIA_Wulfgar_Hallo_04_01");	//(pohrdav�) Tihle ho�i m�chaj� me�i jako n�jac� farm��i.
	AI_Output(self,other,"DIA_Wulfgar_Hallo_04_02");	//(rozhodn�) Ale a� s nimi skon��m, ka�d� z nich bude tvrd�, pevn� parchant.
};


instance DIA_WULFGAR_WANNAJOIN(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 2;
	condition = dia_wulfgar_wannajoin_condition;
	information = dia_wulfgar_wannajoin_info;
	permanent = FALSE;
	description = "Chci se p�idat k domobran�!";
};


func int dia_wulfgar_wannajoin_condition()
{
	if(Npc_KnowsInfo(other,dia_wulfgar_hallo) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_wulfgar_wannajoin_info()
{
	AI_Output(other,self,"DIA_Wulfgar_WannaJoin_15_00");	//Chci se p�idat k domobran�!
	AI_Output(self,other,"DIA_Wulfgar_WannaJoin_04_01");	//No a? Jsi ob�anem m�sta?
	if(PLAYER_ISAPPRENTICE == APP_NONE)
	{
		AI_Output(other,self,"DIA_Wulfgar_WannaJoin_15_02");	//Ne.
		AI_Output(self,other,"DIA_Wulfgar_WannaJoin_04_03");	//V tom p��pad� t� lord Andre nep�ijme.
		AI_Output(self,other,"DIA_Wulfgar_WannaJoin_04_04");	//Samoz�ejm�, �e si s n�m m��e� promluvit - ale ne�ekl bych, �e u tebe u�in� v�jimku.
	}
	else
	{
		AI_Output(other,self,"DIA_Wulfgar_WannaJoin_15_05");	//Ano.
		AI_Output(self,other,"DIA_Wulfgar_WannaJoin_04_06");	//V tom p��pad� si promluv s lordem Andrem. On rozhoduje, koho p�ijmout a koho ne.
	};
};


instance DIA_WULFGAR_ABOUTMILIZ(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 3;
	condition = dia_wulfgar_aboutmiliz_condition;
	information = dia_wulfgar_aboutmiliz_info;
	permanent = FALSE;
	description = "Jak to vypad� v domobran�?";
};


func int dia_wulfgar_aboutmiliz_condition()
{
	if(Npc_KnowsInfo(other,dia_wulfgar_hallo) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_wulfgar_aboutmiliz_info()
{
	AI_Output(other,self,"DIA_Wulfgar_AboutMiliz_15_00");	//Jak to vypad� v domobran�?
	AI_Output(self,other,"DIA_Wulfgar_AboutMiliz_04_01");	//Na��m velitelem je te� lord Andre.
	AI_Output(self,other,"DIA_Wulfgar_AboutMiliz_04_02");	//Domobrana se d��v zodpov�dala m�stodr��c�mu. (sm�je se) Ten nem�l pon�t�, co tady d�l�me.
	AI_Output(self,other,"DIA_Wulfgar_AboutMiliz_04_03");	//Ale lord Andre dob�e v�, co d�l�. O chlapy se star� v�n� dob�e.
	AI_Output(self,other,"DIA_Wulfgar_AboutMiliz_04_04");	//Ka�d�, kdo tady za��n�, dostane slu�nou zbroj a dobrou zbra�.
	AI_Output(self,other,"DIA_Wulfgar_AboutMiliz_04_05");	//A kdy� odv�d� dobrou pr�ci, dostane� n�co nav�c. Za ka�d�ho lapen�ho krimin�ln�ka dostane� odm�nu.
};


instance DIA_WULFGAR_CANYOUTRAIN(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 4;
	condition = dia_wulfgar_canyoutrain_condition;
	information = dia_wulfgar_canyoutrain_info;
	permanent = FALSE;
	description = "M��e� u�it v boji s me�em i m�?";
};


func int dia_wulfgar_canyoutrain_condition()
{
	if(Npc_KnowsInfo(other,dia_wulfgar_hallo) && (other.guild != GIL_MIL))
	{
		return TRUE;
	};
};

func void dia_wulfgar_canyoutrain_info()
{
	AI_Output(other,self,"DIA_Wulfgar_CanYouTrain_15_00");	//M��e� u�it v boji s me�em i m�?
	AI_Output(self,other,"DIA_Wulfgar_CanYouTrain_04_01");	//Lord Andre mi p�ik�zal, abych cvi�il ka�d�ho, kdo by mohl b�t schopen br�nit m�sto.
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Wulfgar_CanYouTrain_04_02");	//To ov�em neplat� pro �old�ky. Zmiz.
	}
	else
	{
		AI_Output(self,other,"DIA_Wulfgar_CanYouTrain_04_03");	//To ov�em plat� jen pro bojov� v�cvik. V�echny ostatn� druhy v�cviku jsou vyhrazeny domobran�.
		AI_Output(self,other,"DIA_Wulfgar_CanYouTrain_04_04");	//Um� aspo� trochu ovl�dat zbra�?
		AI_Output(other,self,"DIA_Wulfgar_CanYouTrain_15_05");	//�ekl bych, �e ano.
		AI_Output(self,other,"DIA_Wulfgar_CanYouTrain_04_06");	//(povzdychne si) Dobr� - m��eme za��t, a� se na to bude� c�tit.
		Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
		b_logentry(TOPIC_CITYTEACHER,"Wulfgar, �len m�stsk� gardy, m� m��e vycvi�it v jednoru�n�m i obouru�n�m boji.");
		WULFGAR_TEACH1H = TRUE;
	};
};


instance DIA_WULFGAR_ADVANTAGE(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 5;
	condition = dia_wulfgar_advantage_condition;
	information = dia_wulfgar_advantage_info;
	permanent = FALSE;
	description = "Jak� jsou v�hody jednoru�n�ch a obouru�n�ch zbran�?";
};


func int dia_wulfgar_advantage_condition()
{
	if((WULFGAR_TEACH1H == TRUE) || (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_wulfgar_advantage_info()
{
	AI_Output(other,self,"DIA_Wulfgar_Advantage_15_00");	//Jak� jsou v�hody jednoru�n�ch a obouru�n�ch zbran�?
	AI_Output(self,other,"DIA_Wulfgar_Advantage_04_01");	//Je to prost�. S jednoru�n� zbran� jsi rychlej��. To m��e b�t v bitv� pom�rn� zna�n� v�hoda.
	AI_Output(self,other,"DIA_Wulfgar_Advantage_04_02");	//Obouru�n� zbran� jsou t�kop�dn�j��. Mus� bojovat obez�etn� - p�i z�sahu v�ak zp�sob� mnohem v�t�� zran�n�.
};


instance DIA_WULFGAR_HOWTOBEGIN(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 6;
	condition = dia_wulfgar_howtobegin_condition;
	information = dia_wulfgar_howtobegin_info;
	permanent = FALSE;
	description = "U �eho m�m za��t? U jednoru�n�ch, nebo obouru�n�ch zbran�?";
};


func int dia_wulfgar_howtobegin_condition()
{
	if((WULFGAR_TEACH1H == TRUE) || (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_wulfgar_howtobegin_info()
{
	AI_Output(other,self,"DIA_Wulfgar_HowToBegin_15_00");	//U �eho m�m za��t? U jednoru�n�ch, nebo obouru�n�ch zbran�?
	AI_Output(self,other,"DIA_Wulfgar_HowToBegin_04_01");	//To je jen a pouze na tob�.
	AI_Output(self,other,"DIA_Wulfgar_HowToBegin_04_02");	//Pokud se zam��� jen na jeden typ zbran�, bude� se z�rove� u�it i ten druh�.
	AI_Output(self,other,"DIA_Wulfgar_HowToBegin_04_03");	//Jestli�e jsi nap��klad dobr� v boji s jednoru�n�mi me�i, ale jsi st�le za��te�n�k v boji s obouru�n�mi zbran�mi...
	AI_Output(self,other,"DIA_Wulfgar_HowToBegin_04_04");	//... tv� dovednosti s obouru�n�mi zbran�mi se zv���, i kdy� tr�nuje� s jednoru�n� zbran�.
	AI_Output(self,other,"DIA_Wulfgar_HowToBegin_04_05");	//V takov�m p��pad� je v�cvik n�ro�n�j��, ne� kdy� se u�� s ob�ma typy zbran�.
	AI_Output(self,other,"DIA_Wulfgar_HowToBegin_04_06");	//Za�n�me a brzy s�m zjist�, o �em to mluv�m.
};


instance DIA_WULFGAR_TEACH(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 7;
	condition = dia_wulfgar_teach_condition;
	information = dia_wulfgar_teach_info;
	permanent = TRUE;
	description = "Za�n�me s v�cvikem.";
};


func int dia_wulfgar_teach_condition()
{
	if((WULFGAR_TEACH1H == TRUE) || (other.guild == GIL_MIL))
	{
		return TRUE;
	};
};

func void dia_wulfgar_teach_info()
{
	AI_Output(other,self,"DIA_Wulfgar_Teach_15_00");	//Za�n�me s v�cvikem.
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Wulfgar_Add_04_00");	//�old�ky necvi��m!
	}
	else
	{
		if(other.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Wulfgar_Add_04_01");	//Jist�, ctihodnosti.
		};
		Info_ClearChoices(dia_wulfgar_teach);
		Info_AddChoice(dia_wulfgar_teach,DIALOG_BACK,dia_wulfgar_teach_back);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_wulfgar_teach_2h_1);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_wulfgar_teach_2h_5);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_wulfgar_teach_1h_1);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_wulfgar_teach_1h_5);
	};
};

func void dia_wulfgar_teach_back()
{
	Info_ClearChoices(dia_wulfgar_teach);
};

func void dia_wulfgar_teach_1h_1()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,75))
	{
		Info_ClearChoices(dia_wulfgar_teach);
		Info_AddChoice(dia_wulfgar_teach,DIALOG_BACK,dia_wulfgar_teach_back);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_wulfgar_teach_2h_1);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_wulfgar_teach_2h_5);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_wulfgar_teach_1h_1);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_wulfgar_teach_1h_5);
	};
};

func void dia_wulfgar_teach_1h_5()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,75))
	{
		Info_ClearChoices(dia_wulfgar_teach);
		Info_AddChoice(dia_wulfgar_teach,DIALOG_BACK,dia_wulfgar_teach_back);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_wulfgar_teach_2h_1);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_wulfgar_teach_2h_5);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_wulfgar_teach_1h_1);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_wulfgar_teach_1h_5);
	};
};

func void dia_wulfgar_teach_2h_1()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,75))
	{
		Info_ClearChoices(dia_wulfgar_teach);
		Info_AddChoice(dia_wulfgar_teach,DIALOG_BACK,dia_wulfgar_teach_back);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_wulfgar_teach_2h_1);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_wulfgar_teach_2h_5);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_wulfgar_teach_1h_1);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_wulfgar_teach_1h_5);
	};
};

func void dia_wulfgar_teach_2h_5()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,75))
	{
		Info_ClearChoices(dia_wulfgar_teach);
		Info_AddChoice(dia_wulfgar_teach,DIALOG_BACK,dia_wulfgar_teach_back);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_wulfgar_teach_2h_1);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_wulfgar_teach_2h_5);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_wulfgar_teach_1h_1);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_wulfgar_teach_1h_5);
	};
};


instance DIA_WULFGAR_ALSMIL(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 1;
	condition = dia_wulfgar_alsmil_condition;
	information = dia_wulfgar_alsmil_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_wulfgar_alsmil_condition()
{
	if(other.guild == GIL_MIL)
	{
		return TRUE;
	};
};

func void dia_wulfgar_alsmil_info()
{
	AI_Output(self,other,"DIA_Wulfgar_AlsMil_04_00");	//Tak�e t� lord Andre p�ijal!
	AI_Output(self,other,"DIA_Wulfgar_AlsMil_04_01");	//P�edpokl�d�m, �e sem bude� chodit cvi�it pravideln�.
	AI_Output(self,other,"DIA_Wulfgar_AlsMil_04_02");	//Ruga t� bude u�it v um�n� st�elby z ku�e a Mortis ti pom��e zv��it s�lu.
	AI_Output(self,other,"DIA_Wulfgar_AlsMil_04_03");	//Ale nejd�le�it�j�� pro tebe je po��dn� se nau�it zach�zet s me�em.
	AI_Output(self,other,"DIA_Wulfgar_AlsMil_04_04");	//Je�t� z tebe ud�l�m dobr�ho bijce!
};


instance DIA_WULFGAR_BONUS(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 2;
	condition = dia_wulfgar_bonus_condition;
	information = dia_wulfgar_bonus_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_wulfgar_bonus_condition()
{
	if(Npc_IsInState(self,zs_talk) && Wld_IsTime(5,2,6,54))
	{
		return TRUE;
	};
};

func void dia_wulfgar_bonus_info()
{
	AI_Output(self,other,"DIA_Wulfgar_Bonus_04_00");	//Tak brzy a ji� na nohou? V tuhle denn� dobu tady b�v�m v�t�inou s�m. Ale kdy� u� jsi tady, m��e� se n��emu p�iu�it.
	AI_Output(self,other,"DIA_Wulfgar_Bonus_04_01");	//Tak d�vej pozor. N�kter� protivn�ky m��e� zm�st, kdy� se jejich �der�m vyhne� a pak v pravou chv�li ude��.
	AI_Output(self,other,"DIA_Wulfgar_Bonus_04_02");	//Pamatuj na to ve sv�m p��t�m boji!
	b_raisefighttalent(other,NPC_TALENT_1H,2);
};


instance DIA_WULFGAR_PICKPOCKET(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 900;
	condition = dia_wulfgar_pickpocket_condition;
	information = dia_wulfgar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_wulfgar_pickpocket_condition()
{
	return c_beklauen(58,80);
};

func void dia_wulfgar_pickpocket_info()
{
	Info_ClearChoices(dia_wulfgar_pickpocket);
	Info_AddChoice(dia_wulfgar_pickpocket,DIALOG_BACK,dia_wulfgar_pickpocket_back);
	Info_AddChoice(dia_wulfgar_pickpocket,DIALOG_PICKPOCKET,dia_wulfgar_pickpocket_doit);
};

func void dia_wulfgar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_wulfgar_pickpocket);
};

func void dia_wulfgar_pickpocket_back()
{
	Info_ClearChoices(dia_wulfgar_pickpocket);
};

