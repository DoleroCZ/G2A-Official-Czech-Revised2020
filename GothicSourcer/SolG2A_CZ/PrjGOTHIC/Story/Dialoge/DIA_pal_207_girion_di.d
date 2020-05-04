
instance DIA_GIRION_DI_XIT(C_INFO)
{
	npc = pal_207_girion_di;
	nr = 999;
	condition = dia_girion_di_exit_condition;
	information = dia_girion_di_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_girion_di_exit_condition()
{
	return TRUE;
};

func void dia_girion_di_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GIRION_DI_HALLO(C_INFO)
{
	npc = pal_207_girion_di;
	nr = 2;
	condition = dia_girion_di_hallo_condition;
	information = dia_girion_di_hallo_info;
	permanent = TRUE;
	description = "Je v�echno v po��dku?";
};


func int dia_girion_di_hallo_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_girion_di_hallo_info()
{
	AI_Output(other,self,"DIA_Girion_DI_Hallo_15_00");	//Je v�echno v po��dku?
	if(ORKSTURMDI == TRUE)
	{
		AI_Output(self,other,"DIA_Girion_DI_Hallo_08_01");	//Sk�eti jsou opravdu state�n�, �e se vydali proti mn�.
		AI_Output(self,other,"DIA_Girion_DI_Hallo_08_02");	//Jeden by �ekl, �e maj� dost rozumu na to, aby se postavili paladinovi z kr�lovsk� str�e.
	}
	else if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Girion_DI_Hallo_08_03");	//Tak� bych �ekl. Zabere ti tv�j �kol tady na �tesu hodn� �asu?
	}
	else
	{
		AI_Output(self,other,"DIA_Girion_DI_Hallo_08_04");	//Nechovej se ke mn� jako k idiotovi. Ud�lej co mus� a p�edej mi velen� lodi.
	};
};


instance DIA_GIRION_DI_TEACH(C_INFO)
{
	npc = pal_207_girion_di;
	nr = 5;
	condition = dia_girion_di_teach_condition;
	information = dia_girion_di_teach_info;
	permanent = TRUE;
	description = "U� m�, pak se odsud dostaneme rychleji.";
};


func int dia_girion_di_teach_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_girion_di_teach_info()
{
	AI_Output(other,self,"DIA_Girion_DI_Teach_15_00");	//U� m�, pak se odsud dostaneme rychleji.
	AI_Output(self,other,"DIA_Girion_DI_Teach_08_01");	//Zd� se, �e nem�m na v�b�r.
	Info_ClearChoices(dia_girion_di_teach);
	Info_AddChoice(dia_girion_di_teach,DIALOG_BACK,dia_girion_di_teach_back);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_girion_di_teach_crossbow_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_girion_di_teach_crossbow_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_girion_di_teach_2h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_girion_di_teach_2h_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_girion_di_teach_1h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_girion_di_teach_1h_5);
};

func void dia_girion_di_teach_crossbow_1()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,1,90))
	{
		AI_Output(self,other,"DIA_Girion_DI_Teach_CROSSBOW_1_08_00");	//Nikdy moc nezvedej lokty. Bude� pak m�t tuhou mu�ku a z�konit� zkrout� zbra�.
	};
	Info_ClearChoices(dia_girion_di_teach);
	Info_AddChoice(dia_girion_di_teach,DIALOG_BACK,dia_girion_di_teach_back);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_girion_di_teach_crossbow_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_girion_di_teach_crossbow_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_girion_di_teach_2h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_girion_di_teach_2h_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_girion_di_teach_1h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_girion_di_teach_1h_5);
};

func void dia_girion_di_teach_crossbow_5()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,5,90))
	{
		AI_Output(self,other,"DIA_Girion_DI_Teach_CROSSBOW_5_08_00");	//P�ed v�st�elem si v�dycky uvolni levou ruku. Bude se ti pak l�pe m��it.
	};
	Info_ClearChoices(dia_girion_di_teach);
	Info_AddChoice(dia_girion_di_teach,DIALOG_BACK,dia_girion_di_teach_back);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_girion_di_teach_crossbow_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_girion_di_teach_crossbow_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_girion_di_teach_2h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_girion_di_teach_2h_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_girion_di_teach_1h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_girion_di_teach_1h_5);
};

func void dia_girion_di_teach_1h_1()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,90))
	{
		AI_Output(self,other,"DIA_Girion_DI_Teach_1H_1_08_00");	//Ost�� mus� let�t v�trem jako r�kos pov�t��m.
	};
	Info_ClearChoices(dia_girion_di_teach);
	Info_AddChoice(dia_girion_di_teach,DIALOG_BACK,dia_girion_di_teach_back);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_girion_di_teach_crossbow_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_girion_di_teach_crossbow_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_girion_di_teach_2h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_girion_di_teach_2h_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_girion_di_teach_1h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_girion_di_teach_1h_5);
};

func void dia_girion_di_teach_1h_5()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,90))
	{
		AI_Output(self,other,"DIA_Girion_DI_Teach_1H_5_08_00");	//Svou s�lu pou��vej s rozmyslem. Kdy� se bezhlav� rozb�hne� proti nep��teli, moc �sp�chu nesklid�.
	};
	Info_ClearChoices(dia_girion_di_teach);
	Info_AddChoice(dia_girion_di_teach,DIALOG_BACK,dia_girion_di_teach_back);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_girion_di_teach_crossbow_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_girion_di_teach_crossbow_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_girion_di_teach_2h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_girion_di_teach_2h_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_girion_di_teach_1h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_girion_di_teach_1h_5);
};

func void dia_girion_di_teach_2h_1()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,90))
	{
		AI_Output(self,other,"DIA_DIA_Girion_DI_Teach_2H_1_08_00");	//Nem�j p��li� pevn� sev�en�, abys mohl p�esn� trefit.
	};
	Info_ClearChoices(dia_girion_di_teach);
	Info_AddChoice(dia_girion_di_teach,DIALOG_BACK,dia_girion_di_teach_back);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_girion_di_teach_crossbow_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_girion_di_teach_crossbow_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_girion_di_teach_2h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_girion_di_teach_2h_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_girion_di_teach_1h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_girion_di_teach_1h_5);
};

func void dia_girion_di_teach_2h_5()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,90))
	{
		AI_Output(self,other,"DIA_Girion_DI_Teach_2H_5_08_00");	//Nezapome� se br�nit. Nejlep�� obranou je vyh�bat se protivn�kov�m ran�m.
	};
	Info_ClearChoices(dia_girion_di_teach);
	Info_AddChoice(dia_girion_di_teach,DIALOG_BACK,dia_girion_di_teach_back);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_girion_di_teach_crossbow_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_girion_di_teach_crossbow_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_girion_di_teach_2h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_girion_di_teach_2h_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_girion_di_teach_1h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_girion_di_teach_1h_5);
};

func void dia_girion_di_teach_back()
{
	Info_ClearChoices(dia_girion_di_teach);
};


instance DIA_GIRION_DI_ORCELITERING(C_INFO)
{
	npc = pal_207_girion_di;
	nr = 99;
	condition = dia_girion_di_orcelitering_condition;
	information = dia_girion_di_orcelitering_info;
	permanent = TRUE;
	description = "M�m prsten sk�et�ho v�dce.";
};


func int dia_girion_di_orcelitering_condition()
{
	if(Npc_HasItems(other,itri_orcelitering))
	{
		return TRUE;
	};
};


var int dia_girion_di_orcelitering_onetime;

func void dia_girion_di_orcelitering_info()
{
	AI_Output(other,self,"DIA_Girion_DI_OrcEliteRing_15_00");	//M�m prsten sk�et�ho v�dce.
	if(DIA_GIRION_DI_ORCELITERING_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Girion_DI_OrcEliteRing_08_01");	//Mysl�m, �e by s t�m mohl lord Hagen n�co ud�lat.
		DIA_GIRION_DI_ORCELITERING_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_Girion_DI_OrcEliteRing_08_02");	//Dej mi ho. Donesu ho lordu Hagenovi.
	Info_ClearChoices(dia_girion_di_orcelitering);
	Info_AddChoice(dia_girion_di_orcelitering,"Rad�i si ho nech�m.",dia_girion_di_orcelitering_behalten);
	Info_AddChoice(dia_girion_di_orcelitering,"Na, vem si tenhle.",dia_girion_di_orcelitering_geben);
};

func void dia_girion_di_orcelitering_geben()
{
	AI_Output(other,self,"DIA_Girion_DI_OrcEliteRing_geben_15_00");	//Na, vem si tenhle.
	AI_Output(self,other,"DIA_Girion_DI_OrcEliteRing_geben_08_01");	//D�ky. Stejn� si nemysl�m, �e by ti mohl k n��emu b�t.
	Info_ClearChoices(dia_girion_di_orcelitering);
	b_giveinvitems(other,self,itri_orcelitering,1);
	b_giveplayerxp(XP_AMBIENT);
};

func void dia_girion_di_orcelitering_behalten()
{
	AI_Output(other,self,"DIA_Girion_DI_OrcEliteRing_behalten_15_00");	//Rad�i si ho nech�m.
	AI_Output(self,other,"DIA_Girion_DI_OrcEliteRing_behalten_08_01");	//Jak mysl�. Stejn� ti k ni�emu nebude.
	Info_ClearChoices(dia_girion_di_orcelitering);
};


instance DIA_GIRION_DI_UNDEADDRAGONDEAD(C_INFO)
{
	npc = pal_207_girion_di;
	nr = 2;
	condition = dia_girion_di_undeaddragondead_condition;
	information = dia_girion_di_undeaddragondead_info;
	permanent = TRUE;
	description = "Te� m��eme kone�n� vyrazit.";
};


func int dia_girion_di_undeaddragondead_condition()
{
	if(Npc_IsDead(undeaddragon))
	{
		return TRUE;
	};
};


var int dia_girion_di_undeaddragondead_onetime;

func void dia_girion_di_undeaddragondead_info()
{
	AI_Output(other,self,"DIA_Girion_DI_UndeadDragonDead_15_00");	//Te� m��eme kone�n� vyrazit.
	AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_01");	//Bylo na �ase. U� jsem si myslel, �e tady na tomhle �tesu zplesniv�m.
	if(DIA_GIRION_DI_UNDEADDRAGONDEAD_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_02");	//Te� mi okam�it� tu lo� p�edej.
		AI_Output(other,self,"DIA_Girion_DI_UndeadDragonDead_15_03");	//Je�t� nejsme v Khorinisu. A up��mn� �e�eno, zp�tky do Khorinisu se mi moc nechce.
		AI_Output(other,self,"DIA_Girion_DI_UndeadDragonDead_15_04");	//U� jsem tam byl dost dlouho.
		AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_05");	//Myslel jsem si to. Ale te� nen� ani spr�vn� �as, ani spr�vn� m�sto, abychom si n�co takov�ho vyjas�ovali. Probereme to, a� budeme zp�tky na lodi.
		AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_06");	//No a co. Stejn� jsem r�d, �e t� m�m zp�tky na palub� v jednom kuse.
		if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_07");	//Jsi skute�n� Innos�v v�le�n�k. U� o tom nem�m ��dn�ch pochyb. Jsem r�d, �e t� m�me na sv� stran�.
		}
		else
		{
			AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_08");	//I kdy� jsi lump, zachoval ses nakonec spr�vn�.
		};
		DIA_GIRION_DI_UNDEADDRAGONDEAD_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_09");	//Dobr�. Te� jdi za kapit�nem, a� n�s odsud vyvede.
	AI_StopProcessInfos(self);
};


instance DIA_GIRION_DI_PICKPOCKET(C_INFO)
{
	npc = pal_207_girion_di;
	nr = 900;
	condition = dia_girion_di_pickpocket_condition;
	information = dia_girion_di_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_girion_di_pickpocket_condition()
{
	return c_beklauen(71,260);
};

func void dia_girion_di_pickpocket_info()
{
	Info_ClearChoices(dia_girion_di_pickpocket);
	Info_AddChoice(dia_girion_di_pickpocket,DIALOG_BACK,dia_girion_di_pickpocket_back);
	Info_AddChoice(dia_girion_di_pickpocket,DIALOG_PICKPOCKET,dia_girion_di_pickpocket_doit);
};

func void dia_girion_di_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_girion_di_pickpocket);
};

func void dia_girion_di_pickpocket_back()
{
	Info_ClearChoices(dia_girion_di_pickpocket);
};

