
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
	AI_Output(self,other,"DIA_Alwin_Sheep_12_01");	//Ke mnÏ pat¯Ì jenom ta, kter· nese jmÈno Lucy (usmÏje se) - a to je moje ûena.
	AI_Output(self,other,"DIA_Alwin_Sheep_12_02");	//Ovce jsou majetkem domobrany - hned, jak je zÌskajÌ od farm·¯˘, p¯ivedou je ke mnÏ.
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
	AI_Output(self,other,"DIA_Alwin_Fellan_12_00");	//Hochu, to öÌlenÈ ml·cenÌ kladivem mÏ p¯ivede do hrobu.
	AI_Output(other,self,"DIA_Alwin_Fellan_15_01");	//O Ëem to mluvÌö?
	AI_Output(self,other,"DIA_Alwin_Fellan_12_02");	//Copak neslyöÌö ty r·ny? Kdo asi tak m˘ûe v p¯ÌstavnÌ Ëtvrti od r·na do veËera buöit kladivem?
	AI_Output(self,other,"DIA_Alwin_Fellan_12_03");	//MyslÌm toho cvoka Fellana. Kaûd˝ den si do tÈ svÈ chatrËe bere kladivo.
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
	AI_Output(self,other,"DIA_Alwin_FellanRunning_12_01");	//Ty mi chceö pomoct? A co z toho budeö mÌt?
	AI_Output(other,self,"DIA_Alwin_FellanRunning_15_02");	//To mi povÏz ty.
	AI_Output(self,other,"DIA_Alwin_FellanRunning_12_03");	//Aha, tak je to! No dob¯e - kdyû to jeho buöenÌ nÏjak umlËÌö, zaplatÌm ti 25 zlaù·k˘.
	AI_Output(self,other,"DIA_Alwin_FellanRunning_12_04");	//Ale upozorÚuju tÏ, ûe s nÌm rozumnou domluvou nic nesvedeö - je to tot·lnÌ magor. Jedin· vÏc, kter· by mu pomohla, je p·r dob¯e mÌ¯en˝ch facek!
	MIS_ATTACKFELLAN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ALWIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ALWIN,LOG_RUNNING);
	b_logentry(TOPIC_ALWIN,"Alwin mÏ poû·dal, zda bych nep¯imÏl Fellana, aby p¯estal buöit kladivem. ZabÌt ho ale nebude zrovna to nejlepöÌ ¯eöenÌ.");
	Info_ClearChoices(dia_alwin_fellanrunning);
	Info_AddChoice(dia_alwin_fellanrunning,"UvidÌm, co se d· dÏlat...",dia_alwin_fellanrunning_ok);
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		Info_AddChoice(dia_alwin_fellanrunning,"Kdyû ho zml·tÌm, budu z toho mÌt jenom opletaËky s domobranou...",dia_alwin_fellanrunning_problems);
	};
};

func void dia_alwin_fellanrunning_ok()
{
	AI_Output(other,self,"DIA_Alwin_FellanRunning_Ok_15_00");	//UvidÌm, co se d· dÏlat.
	AI_Output(self,other,"DIA_Alwin_FellanRunning_Ok_12_01");	//Jen si to rozmysli a pamatuj si, ûe jsem ti slÌbil 25 zlaù·k˘.
	Info_ClearChoices(dia_alwin_fellanrunning);
};

func void dia_alwin_fellanrunning_problems()
{
	AI_Output(other,self,"DIA_Alwin_FellanRunning_Problems_15_00");	//Kdyû ho zml·tÌm, budu z toho mÌt jenom opletaËky s domobranou.
	AI_Output(self,other,"DIA_Alwin_Add_12_00");	//Tady v p¯Ìstavu se nÏjak· ta rvaËka tak tragicky nebere.
	AI_Output(self,other,"DIA_Alwin_Add_12_01");	//Ale jestli tu nÏkde nÏco ölohneö nebo mi ö·hneö na ovce, budeö v pÏknÈm pr˘övihu.
};


instance DIA_ALWIN_FELLANSUCCESS(C_INFO)
{
	npc = vlk_424_alwin;
	nr = 4;
	condition = dia_alwin_fellansuccess_condition;
	information = dia_alwin_fellansuccess_info;
	permanent = FALSE;
	description = "Fellan uû kladivem tlouci nebude.";
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
	AI_Output(other,self,"DIA_Alwin_FellanSuccess_15_00");	//Fellan uû kladivem tlouci nebude.
	AI_Output(self,other,"DIA_Alwin_FellanSuccess_12_01");	//SlyöÌö to? Ticho - û·dnÈ r·ny. KoneËnÏ. Myslel jsem, ûe ten chlap nikdy nezmlkne.
	if(Npc_IsDead(fellan) == FALSE)
	{
		AI_Output(self,other,"DIA_Alwin_FellanSuccess_12_02");	//Prok·zals mi velkou laskavost. VÌö co? D·m ti cel˝ch 30 zlaù·k˘.
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
	description = "A jak se da¯Ì ovcÌm?";
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
	AI_Output(other,self,"DIA_Alwin_Endlos_15_00");	//A jak se da¯Ì ovcÌm?
	if((MIS_ATTACKFELLAN != LOG_SUCCESS) && (Npc_IsDead(fellan) == FALSE))
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_01");	//Z toho Fellanova ml·cenÌ uû pomalu öÌlÌ. JeötÏ p·r dnÌ a budou ˙plnÏ naörot.
	}
	else if(KAPITEL <= 2)
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_02");	//Ovce se jen cpou a jsou ËÌm d·l tÌm tlustöÌ. StejnÏ jako moje ûena. HAHAHA (hlasitÏ se smÏje).
	}
	else if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET != LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Alwin_Endlos_12_03");	//Moûn· bych mÏl jednu z nich klepnout - jako poslednÌ veËe¯i!
			AI_Output(other,self,"DIA_Alwin_Endlos_15_04");	//Jako co?
			AI_Output(self,other,"DIA_Alwin_Endlos_12_05");	//Pro jednoho ûold·ka, kter˝ zabil paladina. Samoz¯ejmÏ ho za to popravÌ.
			AI_Output(self,other,"DIA_Alwin_Endlos_12_06");	//Jen se musÌm rozhodnout, kter· z nich p˘jde na popravËÌ öpalek.
		}
		else
		{
			AI_Output(self,other,"DIA_Alwin_Endlos_12_07");	//Lucy m· opravdu ötÏstÌ, ûe je jeötÏ naûivu.
			AI_Output(other,self,"DIA_Alwin_Endlos_15_08");	//Myslel jsem, ûe jsi ¯Ìkal, ûe Lucy je tv· ûena.
			AI_Output(self,other,"DIA_Alwin_Endlos_12_09");	//Spr·vnÏ, ale jedna z ovcÌ se taky jmenuje Lucy. Pr·vÏ ona mÏla b˝t poslednÌm jÌdlem pro Benneta.
			AI_Output(self,other,"DIA_Alwin_Endlos_12_10");	//Ale nakonec se to vöechno vy¯eöilo a Lucy m˘ûe b˝t r·da.
		};
	}
	else if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_11");	//»asem je ale pozorov·nÌ pasoucÌch se ovcÌ docela nuda.
	}
	else
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_12");	//Tak se s nimi louËÌm. Lord Hagen rozk·zal, ûe vöechny ovce poslouûÌ jako z·soby pro jeho arm·du.
		AI_Output(self,other,"DIA_Alwin_Endlos_12_13");	//Ale aspoÚ budu mÌt vÌc Ëasu na svou ûenu.
	};
};

