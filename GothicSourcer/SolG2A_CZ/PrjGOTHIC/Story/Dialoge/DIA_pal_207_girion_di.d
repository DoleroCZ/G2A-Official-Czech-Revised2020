
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
	description = "Je vöechno v po¯·dku?";
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
	AI_Output(other,self,"DIA_Girion_DI_Hallo_15_00");	//Je vöechno v po¯·dku?
	if(ORKSTURMDI == TRUE)
	{
		AI_Output(self,other,"DIA_Girion_DI_Hallo_08_01");	//Sk¯eti jsou opravdu stateËnÌ, ûe se vydali proti mnÏ.
		AI_Output(self,other,"DIA_Girion_DI_Hallo_08_02");	//Jeden by ¯ekl, ûe majÌ dost rozumu na to, aby se postavili paladinovi z kr·lovskÈ str·ûe.
	}
	else if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Girion_DI_Hallo_08_03");	//TakÈ bych ¯ekl. Zabere ti tv˘j ˙kol tady na ˙tesu hodnÏ Ëasu?
	}
	else
	{
		AI_Output(self,other,"DIA_Girion_DI_Hallo_08_04");	//Nechovej se ke mnÏ jako k idiotovi. UdÏlej co musÌö a p¯edej mi velenÌ lodi.
	};
};


instance DIA_GIRION_DI_TEACH(C_INFO)
{
	npc = pal_207_girion_di;
	nr = 5;
	condition = dia_girion_di_teach_condition;
	information = dia_girion_di_teach_info;
	permanent = TRUE;
	description = "UË mÏ, pak se odsud dostaneme rychleji.";
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
	AI_Output(other,self,"DIA_Girion_DI_Teach_15_00");	//UË mÏ, pak se odsud dostaneme rychleji.
	AI_Output(self,other,"DIA_Girion_DI_Teach_08_01");	//Zd· se, ûe nem·m na v˝bÏr.
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
		AI_Output(self,other,"DIA_Girion_DI_Teach_CROSSBOW_1_08_00");	//Nikdy moc nezvedej lokty. Budeö pak mÌt tuhou muöku a z·konitÏ zkroutÌö zbraÚ.
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
		AI_Output(self,other,"DIA_Girion_DI_Teach_CROSSBOW_5_08_00");	//P¯ed v˝st¯elem si vûdycky uvolni levou ruku. Bude se ti pak lÈpe mÌ¯it.
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
		AI_Output(self,other,"DIA_Girion_DI_Teach_1H_1_08_00");	//Ost¯Ì musÌ letÏt vÏtrem jako r·kos povÏt¯Ìm.
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
		AI_Output(self,other,"DIA_Girion_DI_Teach_1H_5_08_00");	//Svou sÌlu pouûÌvej s rozmyslem. Kdyû se bezhlavÏ rozbÏhneö proti nep¯Ìteli, moc ˙spÏchu nesklidÌö.
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
		AI_Output(self,other,"DIA_DIA_Girion_DI_Teach_2H_1_08_00");	//NemÏj p¯Ìliö pevnÈ sev¯enÌ, abys mohl p¯esnÏ trefit.
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
		AI_Output(self,other,"DIA_Girion_DI_Teach_2H_5_08_00");	//NezapomeÚ se br·nit. NejlepöÌ obranou je vyh˝bat se protivnÌkov˝m ran·m.
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
	description = "M·m prsten sk¯etÌho v˘dce.";
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
	AI_Output(other,self,"DIA_Girion_DI_OrcEliteRing_15_00");	//M·m prsten sk¯etÌho v˘dce.
	if(DIA_GIRION_DI_ORCELITERING_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Girion_DI_OrcEliteRing_08_01");	//MyslÌm, ûe by s tÌm mohl lord Hagen nÏco udÏlat.
		DIA_GIRION_DI_ORCELITERING_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_Girion_DI_OrcEliteRing_08_02");	//Dej mi ho. Donesu ho lordu Hagenovi.
	Info_ClearChoices(dia_girion_di_orcelitering);
	Info_AddChoice(dia_girion_di_orcelitering,"Radöi si ho nech·m.",dia_girion_di_orcelitering_behalten);
	Info_AddChoice(dia_girion_di_orcelitering,"Na, vem si tenhle.",dia_girion_di_orcelitering_geben);
};

func void dia_girion_di_orcelitering_geben()
{
	AI_Output(other,self,"DIA_Girion_DI_OrcEliteRing_geben_15_00");	//Na, vem si tenhle.
	AI_Output(self,other,"DIA_Girion_DI_OrcEliteRing_geben_08_01");	//DÌky. StejnÏ si nemyslÌm, ûe by ti mohl k nÏËemu b˝t.
	Info_ClearChoices(dia_girion_di_orcelitering);
	b_giveinvitems(other,self,itri_orcelitering,1);
	b_giveplayerxp(XP_AMBIENT);
};

func void dia_girion_di_orcelitering_behalten()
{
	AI_Output(other,self,"DIA_Girion_DI_OrcEliteRing_behalten_15_00");	//Radöi si ho nech·m.
	AI_Output(self,other,"DIA_Girion_DI_OrcEliteRing_behalten_08_01");	//Jak myslÌö. StejnÏ ti k niËemu nebude.
	Info_ClearChoices(dia_girion_di_orcelitering);
};


instance DIA_GIRION_DI_UNDEADDRAGONDEAD(C_INFO)
{
	npc = pal_207_girion_di;
	nr = 2;
	condition = dia_girion_di_undeaddragondead_condition;
	information = dia_girion_di_undeaddragondead_info;
	permanent = TRUE;
	description = "TeÔ m˘ûeme koneËnÏ vyrazit.";
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
	AI_Output(other,self,"DIA_Girion_DI_UndeadDragonDead_15_00");	//TeÔ m˘ûeme koneËnÏ vyrazit.
	AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_01");	//Bylo na Ëase. Uû jsem si myslel, ûe tady na tomhle ˙tesu zplesnivÌm.
	if(DIA_GIRION_DI_UNDEADDRAGONDEAD_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_02");	//TeÔ mi okamûitÏ tu loÔ p¯edej.
		AI_Output(other,self,"DIA_Girion_DI_UndeadDragonDead_15_03");	//JeötÏ nejsme v Khorinisu. A up¯ÌmnÏ ¯eËeno, zp·tky do Khorinisu se mi moc nechce.
		AI_Output(other,self,"DIA_Girion_DI_UndeadDragonDead_15_04");	//Uû jsem tam byl dost dlouho.
		AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_05");	//Myslel jsem si to. Ale teÔ nenÌ ani spr·vn˝ Ëas, ani spr·vnÈ mÌsto, abychom si nÏco takovÈho vyjasÚovali. Probereme to, aû budeme zp·tky na lodi.
		AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_06");	//No a co. StejnÏ jsem r·d, ûe tÏ m·m zp·tky na palubÏ v jednom kuse.
		if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_07");	//Jsi skuteËn˝ Innos˘v v·leËnÌk. Uû o tom nem·m û·dn˝ch pochyb. Jsem r·d, ûe tÏ m·me na svÈ stranÏ.
		}
		else
		{
			AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_08");	//I kdyû jsi lump, zachoval ses nakonec spr·vnÏ.
		};
		DIA_GIRION_DI_UNDEADDRAGONDEAD_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_09");	//Dobr·. TeÔ jdi za kapit·nem, aù n·s odsud vyvede.
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

