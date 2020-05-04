
instance DIA_ULTHAR_EXIT(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 999;
	condition = dia_ulthar_exit_condition;
	information = dia_ulthar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ulthar_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_ulthar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_GREET(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 2;
	condition = dia_ulthar_greet_condition;
	information = dia_ulthar_greet_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_ulthar_greet_condition()
{
	if(Npc_IsInState(self,zs_talk) && !Npc_KnowsInfo(hero,dia_pyrokar_fire) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_ulthar_greet_info()
{
	AI_Output(self,other,"DIA_Ulthar_GREET_05_00");	//Hleïme, pøed Nejvyšší radou stojí nový novic. Innos tì doprovázej, synu.
	AI_Output(other,self,"DIA_Ulthar_GREET_15_01");	//Co je pøesnì úkolem Nejvyšší rady?
	AI_Output(self,other,"DIA_Ulthar_GREET_05_02");	//Naší povinností je hlásat vùli Innosovu. Jsme to tedy my, kdo oznaèuje novice vyvolené ke Zkoušce magie.
	AI_Output(self,other,"DIA_Ulthar_GREET_05_03");	//Aèkoliv žijeme v ústraní, sledujeme svìtské záležitosti, nebo církev Innosova pøedstavuje nejvyšší pozemský zákon.
	AI_Output(other,self,"DIA_Ulthar_GREET_15_04");	//Ach, takže vás zajímá, co se dìje ve svìtì.
	AI_Output(other,self,"DIA_Ulthar_GREET_15_05");	//Co si tedy myslíte o tìch dracích, co se usadili v Hornickém údolí, a o jejich armádì, která roste den za dnem?
	AI_Output(self,other,"DIA_Ulthar_GREET_05_06");	//Chápu, že jsi rozèílený, ale než se rozhodneme nìco podniknout, musíme vše dùkladnì zvážit.
	AI_Output(self,other,"DIA_Ulthar_GREET_05_07");	//Kdybychom se teï nechali unést, nièeho bychom nedocílili. Takže splò to, co máš pøikázáno - a my probereme, co je zapotøebí udìlat.
};


instance DIA_ULTHAR_MAGETEST(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 2;
	condition = dia_ulthar_magetest_condition;
	information = dia_ulthar_magetest_info;
	description = "Povìz mi o Zkoušce magie.";
};


func int dia_ulthar_magetest_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulthar_greet))
	{
		return TRUE;
	};
};

func void dia_ulthar_magetest_info()
{
	AI_Output(other,self,"DIA_Ulthar_MAGETEST_15_00");	//Povìz mi o Zkoušce magie.
	AI_Output(self,other,"DIA_Ulthar_MAGETEST_05_01");	//Je to šance pro vybrané novice vstoupit do spoleèenstva mágù. Zkoušku ovšem mùže splnit jen jeden.
	AI_Output(self,other,"DIA_Ulthar_MAGETEST_05_02");	//Novice si ke zkoušce vybírá sám Innos.
};


instance DIA_ULTHAR_WHEN(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 3;
	condition = dia_ulthar_when_condition;
	information = dia_ulthar_when_info;
	permanent = TRUE;
	description = "Kdy bude ta zkouška probíhat?";
};


func int dia_ulthar_when_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulthar_magetest) && (KNOWS_FIRE_CONTEST == FALSE))
	{
		return TRUE;
	};
};

func void dia_ulthar_when_info()
{
	AI_Output(other,self,"DIA_Ulthar_WHEN_15_00");	//Kdy bude ta zkouška probíhat?
	AI_Output(self,other,"DIA_Ulthar_WHEN_05_01");	//Jakmile se dozvíme Innosovu vùli. Zpravíme o ní vybrané novice a podrobíme je zkoušce.
};


instance DIA_ULTHAR_TEST(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 10;
	condition = dia_ulthar_test_condition;
	information = dia_ulthar_test_info;
	permanent = FALSE;
	description = "Jsem pøipraven podrobit se tvé zkoušce, Mistøe.";
};


func int dia_ulthar_test_condition()
{
	if(Npc_KnowsInfo(hero,dia_pyrokar_fire))
	{
		return TRUE;
	};
};

func void dia_ulthar_test_info()
{
	AI_Output(other,self,"DIA_Ulthar_TEST_15_00");	//Jsem pøipraven podrobit se tvé zkoušce, Mistøe.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_01");	//Nepøekvapuje mì, že znáš ten starý zákon.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_02");	//Ale pochybuji, že si uvìdomuješ, jakému riziku se vystavuješ. Mìj na pamìti, že nedoèkavý duch Zkouškou ohnì neprojde.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_03");	//Je to už strašnì dávno, kdy nìkdo tuto zkoušku podstupoval. A je jen jediný èlovìk, který ji pøežil a úspìšnì složil.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_04");	//Tehdy to byl mladý ambiciózní novic, teï už dlouhou dobu zastává vysoký úøad v Nejvyšší radì - mluvím o Serpentesovi.
	AI_Output(other,self,"DIA_Ulthar_TEST_15_05");	//Nebude to dlouho trvat a už nebude jediným, kdo tu zkoušku složil.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_06");	//V tom pøípadì tì už nenechám dlouho èekat. Poslouchej znìní mé zkoušky:
	AI_Output(self,other,"DIA_Ulthar_TEST_05_07");	//Vytvoø runu ohnivého šípu. To je vše - nech je ti Innos nápomocen.
	MIS_RUNE = LOG_RUNNING;
	Log_CreateTopic(TOPIC_RUNE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RUNE,LOG_RUNNING);
	b_logentry(TOPIC_RUNE,"Ulthar mi zadal svùj úkol - musím vytvoøit runu ohnivého šípu.");
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_RUNNING(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 10;
	condition = dia_ulthar_running_condition;
	information = dia_ulthar_running_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_ulthar_running_condition()
{
	if((MIS_RUNE == LOG_RUNNING) && Npc_IsInState(self,zs_talk) && (Npc_HasItems(other,itru_firebolt) == 0))
	{
		return TRUE;
	};
};

func void dia_ulthar_running_info()
{
	AI_Output(self,other,"DIA_Ulthar_RUNNING_05_00");	//Svùj úkol znáš. Vìnuj se mu.
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_SUCCESS(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 2;
	condition = dia_ulthar_success_condition;
	information = dia_ulthar_success_info;
	permanent = FALSE;
	description = "Vytvoøil jsem tu runu!";
};


func int dia_ulthar_success_condition()
{
	if((MIS_RUNE == LOG_RUNNING) && (Npc_HasItems(hero,itru_firebolt) >= 1))
	{
		return TRUE;
	};
};

func void dia_ulthar_success_info()
{
	AI_Output(other,self,"DIA_Ulthar_SUCCESS_15_00");	//I have created the rune!
	AI_Output(self,other,"DIA_Ulthar_SUCCESS_05_01");	//Well done, novice. You shall keep this, your first rune.
	AI_Output(self,other,"DIA_Ulthar_SUCCESS_05_02");	//Až se dostaneš do prvního Kruhu ohnì, budeš ji moci používat.
	AI_Output(self,other,"DIA_Ulthar_SUCCESS_05_03");	//Splnil jsi svou zkoušku k mé spokojenosti.
	if((MIS_GOLEM == LOG_RUNNING) && (Npc_IsDead(magic_golem) == FALSE))
	{
		AI_Output(self,other,"DIA_Ulthar_SUCCESS_05_04");	//Ale ještì poøád pøed sebou máš nebezpeèný úkol, který pro tebe nachystal Serpentes!
	};
	MIS_RUNE = LOG_SUCCESS;
	b_giveplayerxp(XP_RUNE);
};


instance DIA_ULTHAR_KAP3_EXIT(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 999;
	condition = dia_ulthar_kap3_exit_condition;
	information = dia_ulthar_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ulthar_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_ulthar_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_PERMABKAP3(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 99;
	condition = dia_ulthar_permabkap3_condition;
	information = dia_ulthar_permabkap3_info;
	permanent = TRUE;
	description = "Co je nového?";
};


func int dia_ulthar_permabkap3_condition()
{
	if((KAPITEL >= 3) || Npc_KnowsInfo(other,dia_ulthar_success))
	{
		return TRUE;
	};
};

func void dia_ulthar_permabkap3_info()
{
	AI_Output(other,self,"DIA_Ulthar_PermAbKap3_15_00");	//Co je nového?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Ulthar_PermAbKap3_05_01");	//Momentálnì nic. Bìž a splò své úkoly. Ještì toho máš dost na práci.
	}
	else
	{
		AI_Output(self,other,"DIA_Ulthar_PermAbKap3_05_02");	//Ne. Nic, co bys už sám nevìdìl, bratøe.
	};
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_SCHREINEVERGIFTET(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 30;
	condition = dia_ulthar_schreinevergiftet_condition;
	information = dia_ulthar_schreinevergiftet_info;
	important = TRUE;
};


func int dia_ulthar_schreinevergiftet_condition()
{
	if(PEDRO_TRAITOR == TRUE)
	{
		return TRUE;
	};
};

func void dia_ulthar_schreinevergiftet_info()
{
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_00");	//Ještì jedna vìc. Nepøítel znesvìtil nìkteré ze svatyò podél cest, které byly zasvìcené Innosovi. Pøišly o své magické požehnání.
		AI_Output(other,self,"DIA_Ulthar_SCHREINEVERGIFTET_15_01");	//Chápu. A dál?
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_02");	//Je na tobì, abys ty svatynì oèistil, aby se situace ještì nezhoršovala.
		CreateInvItems(self,itmi_ultharsholywater_mis,1);
		b_giveinvitems(self,other,itmi_ultharsholywater_mis,1);
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_03");	//Vezmi si tuto svìcenou vodu a pokrop s ní základy svatynì.
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_04");	//S pomocí svatých slov oèišování získá svatynì opìt svou starou moc.
		if(Npc_HasItems(other,itwr_map_shrine_mis) == FALSE)
		{
			if(Npc_HasItems(gorax,itwr_map_shrine_mis) && (Npc_IsDead(gorax) == FALSE))
			{
				AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_05");	//Gorax ti prodá mapu, na které jsou vyznaèené naše svatynì.
			}
			else
			{
				AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_06");	//Tady máš mapu. Jsou na ní vyznaèené svatynì.
				CreateInvItems(self,itwr_map_shrine_mis,1);
				b_giveinvitems(self,other,itwr_map_shrine_mis,1);
			};
		};
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_07");	//Teï bìž a splò svùj úkol.
		MIS_ULTHAR_HEILESCHREINE_PAL = LOG_RUNNING;
		Log_CreateTopic(TOPIC_ULTHAR_HEILESCHREINE_PAL,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ULTHAR_HEILESCHREINE_PAL,LOG_RUNNING);
		b_logentry(TOPIC_ULTHAR_HEILESCHREINE_PAL,"Ulthar mi nakázal, abych jeho svìcenou vodou oèistil všechny svatynì, které nepøítel poskvrnil.");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_08");	//Ještì jedna drobnost. Drž se dál od svatyní stojících podél cest. Slyšeli jsme, že nìkteré z nich byly znesvìceny.
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_09");	//Nikdo netuší, jakou moc teï mohou mít.
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_10");	//Vyøešit tento problém není tvoje starost. Postarají se o to paladinové.
		AI_StopProcessInfos(self);
	};
};


instance DIA_ULTHAR_SCHREINEGEHEILT(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 30;
	condition = dia_ulthar_schreinegeheilt_condition;
	information = dia_ulthar_schreinegeheilt_info;
	description = "Oèistil jsem všechny svatynì.";
};


func int dia_ulthar_schreinegeheilt_condition()
{
	if(MIS_ULTHAR_HEILESCHREINE_PAL == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_ulthar_schreinegeheilt_info()
{
	AI_Output(other,self,"DIA_Ulthar_SchreineGeheilt_15_00");	//Oèistil jsem všechny svatynì.
	AI_Output(self,other,"DIA_Ulthar_SchreineGeheilt_05_01");	//Výbornì, mùj synu. Jsem na tebe hrdý. Nech tì Innos stále doprovází.
	AI_Output(self,other,"DIA_Ulthar_SchreineGeheilt_05_02");	//Vezmi si tento Amulet síly, mohl by se ti v bitvách proti nepøíteli hodit.
	CreateInvItems(self,itam_dex_strg_01,1);
	b_giveinvitems(self,other,itam_dex_strg_01,1);
	b_giveplayerxp(XP_ULTHAR_SCHREINEGEREINIGT);
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_KAP4_EXIT(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 999;
	condition = dia_ulthar_kap4_exit_condition;
	information = dia_ulthar_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ulthar_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_ulthar_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_SCHREINEGEHEILTNOPAL(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 30;
	condition = dia_ulthar_schreinegeheiltnopal_condition;
	information = dia_ulthar_schreinegeheiltnopal_info;
	important = TRUE;
};


func int dia_ulthar_schreinegeheiltnopal_condition()
{
	if(((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_KDF)) && (KAPITEL >= 4))
	{
		return TRUE;
	};
};

func void dia_ulthar_schreinegeheiltnopal_info()
{
	AI_Output(self,other,"DIA_Ulthar_SchreineGeheiltNoPAL_05_00");	//Dobré zprávy. Svatynì podél cest byly oèištìny. Innosova síla pomohla paladinùm smést tenhle problém ze zemského povrchu.
	AI_Output(self,other,"DIA_Ulthar_SchreineGeheiltNoPAL_05_01");	//Opìt mùžeš Innosovi obìtovat bez obav a bez výhrad.
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_KAP5_EXIT(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 999;
	condition = dia_ulthar_kap5_exit_condition;
	information = dia_ulthar_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ulthar_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_ulthar_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_KAP6_EXIT(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 999;
	condition = dia_ulthar_kap6_exit_condition;
	information = dia_ulthar_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ulthar_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_ulthar_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_PICKPOCKET(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 900;
	condition = dia_ulthar_pickpocket_condition;
	information = dia_ulthar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_ulthar_pickpocket_condition()
{
	return c_beklauen(74,320);
};

func void dia_ulthar_pickpocket_info()
{
	Info_ClearChoices(dia_ulthar_pickpocket);
	Info_AddChoice(dia_ulthar_pickpocket,DIALOG_BACK,dia_ulthar_pickpocket_back);
	Info_AddChoice(dia_ulthar_pickpocket,DIALOG_PICKPOCKET,dia_ulthar_pickpocket_doit);
};

func void dia_ulthar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_ulthar_pickpocket);
};

func void dia_ulthar_pickpocket_back()
{
	Info_ClearChoices(dia_ulthar_pickpocket);
};

