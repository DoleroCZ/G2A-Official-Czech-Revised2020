
instance DIA_GODAR_EXIT(C_INFO)
{
	npc = djg_711_godar;
	nr = 999;
	condition = dia_godar_exit_condition;
	information = dia_godar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_godar_exit_condition()
{
	return TRUE;
};

func void dia_godar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GODAR_HELLO(C_INFO)
{
	npc = djg_711_godar;
	nr = 4;
	condition = dia_godar_hello_condition;
	information = dia_godar_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_godar_hello_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_godar_hello_info()
{
	AI_Output(self,other,"DIA_Godar_Hello_13_00");	//He? Co?
};


instance DIA_GODAR_COMEFROM(C_INFO)
{
	npc = djg_711_godar;
	nr = 4;
	condition = dia_godar_comefrom_condition;
	information = dia_godar_comefrom_info;
	permanent = FALSE;
	description = "Odkud jsi pøišel?";
};


func int dia_godar_comefrom_condition()
{
	return TRUE;
};

func void dia_godar_comefrom_info()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_15_00");	//Odkud jsi pøišel?
	AI_Output(self,other,"DIA_Godar_ComeFrom_13_01");	//Pøišli jsme z... eh, z mìsta.
	Info_ClearChoices(dia_godar_comefrom);
	Info_AddChoice(dia_godar_comefrom,"Jste banditi!",dia_godar_comefrom_bandits);
	Info_AddChoice(dia_godar_comefrom,"Proè jsme se pøedtím ve mìstì nikdy nevidìli?",dia_godar_comefrom_notcity);
	Info_AddChoice(dia_godar_comefrom,"Vážnì.",dia_godar_comefrom_understand);
};

func void dia_godar_comefrom_bandits()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_Bandits_15_00");	//Jste banditi!
	AI_Output(self,other,"DIA_Godar_ComeFrom_Bandits_13_01");	//Opatrnì! Bereš si pøíliš velké sousto!
	Info_ClearChoices(dia_godar_comefrom);
	Info_AddChoice(dia_godar_comefrom,"Klídek. Nechci vás prásknout.",dia_godar_comefrom_bandits_keepcalm);
	Info_AddChoice(dia_godar_comefrom,"Mì nevydìsíš.",dia_godar_comefrom_bandits_nofear);
};

func void dia_godar_comefrom_bandits_keepcalm()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_Bandits_KeepCalm_15_00");	//Klídek. Nechci vás prásknout.
	AI_Output(self,other,"DIA_Godar_ComeFrom_Bandits_KeepCalm_13_01");	//V to doufám. Ve tvém vlastním zájmu. Jinak jsi mrtvý!
	Info_ClearChoices(dia_godar_comefrom);
};

func void dia_godar_comefrom_bandits_nofear()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_Bandits_NoFear_15_00");	//Mì nevydìsíš.
	AI_Output(self,other,"DIA_Godar_ComeFrom_Bandits_NoFear_13_01");	//Uvidíme.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_godar_comefrom_notcity()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_NotCity_15_00");	//Nikdy jsem tì ve mìstì nevidìl.
	AI_Output(self,other,"DIA_Godar_ComeFrom_NotCity_13_01");	//Nemùžu vystát lidi, co strkaj nos do vìcí, do kterejch jim nic není, jasný?
	Info_ClearChoices(dia_godar_comefrom);
	Info_AddChoice(dia_godar_comefrom,"Houby.",dia_godar_comefrom_notcity_cutthroat);
	Info_AddChoice(dia_godar_comefrom,"Já vím, pøišel jsi z mìsta.",dia_godar_comefrom_notcity_forget);
};

func void dia_godar_comefrom_notcity_forget()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_NotCity_Forget_15_00");	//Já vím, pøišel jsi z mìsta.
	AI_Output(self,other,"DIA_Godar_ComeFrom_NotCity_Forget_13_01");	//Pøesnì tak.
	Info_ClearChoices(dia_godar_comefrom);
};

func void dia_godar_comefrom_notcity_cutthroat()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_NotCity_CutThroat_15_00");	//Houby.
	AI_Output(self,other,"DIA_Godar_ComeFrom_NotCity_CutThroat_13_01");	//Tak to bych to mìl do tebe nahustit.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_godar_comefrom_understand()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_Understand_15_00");	//Jasnì. Tak teda z mìsta.
	AI_Output(self,other,"DIA_Godar_ComeFrom_Understand_13_01");	//Hele! On rozumí!
	AI_Output(self,other,"DIA_Godar_ComeFrom_Understand_13_02");	//Tady, lokni si!
	CreateInvItems(self,itfo_beer,1);
	b_giveinvitems(self,other,itfo_beer,1);
	b_useitem(other,itfo_beer);
	Info_ClearChoices(dia_godar_comefrom);
};


instance DIA_GODAR_PLAN(C_INFO)
{
	npc = djg_711_godar;
	nr = 5;
	condition = dia_godar_plan_condition;
	information = dia_godar_plan_info;
	permanent = FALSE;
	description = "Co tady dìláš?";
};


func int dia_godar_plan_condition()
{
	return TRUE;
};

func void dia_godar_plan_info()
{
	AI_Output(other,self,"DIA_Godar_Plan_15_00");	//Co tady dìláš?
	AI_Output(self,other,"DIA_Godar_Plan_13_01");	//Zaslechli jsme o lovu drakù. Tak jsme si sbalili saky paky a pøišli sem.
	AI_Output(self,other,"DIA_Godar_Plan_13_02");	//Ale abych byl upøímný, o dracích nevím ani prd. Chci jen získat trochu zlata.
	AI_Output(self,other,"DIA_Godar_Plan_13_03");	//Draci mají zlato, nebo ne?
	AI_Output(other,self,"DIA_Godar_Plan_15_04");	//Samozøejmì.
};


instance DIA_GODAR_DRAGONLORE(C_INFO)
{
	npc = djg_711_godar;
	nr = 5;
	condition = dia_godar_dragonlore_condition;
	information = dia_godar_dragonlore_info;
	permanent = FALSE;
	description = "Co víš o tìch dracích?";
};


func int dia_godar_dragonlore_condition()
{
	if(Npc_KnowsInfo(other,dia_godar_plan))
	{
		return TRUE;
	};
};

func void dia_godar_dragonlore_info()
{
	AI_Output(other,self,"DIA_Godar_DragonLore_15_00");	//Co víš o tìch dracích?
	AI_Output(self,other,"DIA_Godar_DragonLore_13_01");	//Slyšel jsem jen pohádky pro dìti.
	AI_Output(self,other,"DIA_Godar_DragonLore_13_02");	//Znáš to, panny, zlato, ohnivý dech a takový vìci.
};


instance DIA_GODAR_DESTINATION(C_INFO)
{
	npc = djg_711_godar;
	nr = 5;
	condition = dia_godar_destination_condition;
	information = dia_godar_destination_info;
	permanent = FALSE;
	description = "Kam se chystáte vyrazit?";
};


func int dia_godar_destination_condition()
{
	if(Npc_KnowsInfo(other,dia_godar_plan))
	{
		return TRUE;
	};
};

func void dia_godar_destination_info()
{
	AI_Output(other,self,"DIA_Godar_Destination_15_00");	//Kam se chystáte vyrazit?
	AI_Output(self,other,"DIA_Godar_Destination_13_01");	//To netuším. Ještì jsme se nerozhodli.
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
		AI_Output(other,self,"DIA_Godar_Destination_15_02");	//Mìli byste zajít na hrad.
		AI_Output(self,other,"DIA_Godar_Destination_13_03");	//Tam mì nikdo nedostane ani párem koní. Ne k paladinùm.
		AI_Output(self,other,"DIA_Godar_Destination_13_04");	//Nemám v úmyslu vrátit se do vìzení. Už jsem tam jednou byl a docela mi to staèí.
	};
};


instance DIA_GODAR_ORKS(C_INFO)
{
	npc = djg_711_godar;
	nr = 5;
	condition = dia_godar_orks_condition;
	information = dia_godar_orks_info;
	permanent = FALSE;
	description = "A co skøeti?";
};


func int dia_godar_orks_condition()
{
	if(Npc_KnowsInfo(other,dia_godar_destination))
	{
		return TRUE;
	};
};

func void dia_godar_orks_info()
{
	AI_Output(other,self,"DIA_Godar_Orks_15_00");	//A co skøeti?
	AI_Output(self,other,"DIA_Godar_Orks_13_01");	//Obléhají celý hrad. Nenechali jedinou skulinu.
	AI_Output(self,other,"DIA_Godar_Orks_13_02");	//Pokoušet se tam proplížit je naprostý nesmysl. Ani nemysli na to, že by ses tam prosekal, jinak jsi mrtvý muž.
	AI_Output(self,other,"DIA_Godar_Orks_13_03");	//Nikomu se ještì nepodaøilo tamtudy projít.
	AI_Output(other,self,"DIA_Godar_Orks_15_04");	//Vážnì.
};


instance DIA_GODAR_PRISON(C_INFO)
{
	npc = djg_711_godar;
	nr = 5;
	condition = dia_godar_prison_condition;
	information = dia_godar_prison_info;
	permanent = FALSE;
	description = "Za co jsi sedìl?";
};


func int dia_godar_prison_condition()
{
	if(Npc_KnowsInfo(other,dia_godar_destination) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)))
	{
		return TRUE;
	};
};

func void dia_godar_prison_info()
{
	AI_Output(other,self,"DIA_Godar_Prison_15_00");	//Za co jsi sedìl?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Godar_Prison_13_01");	//Vypadám snad, že bych se ti to chystal vyklopit, co?
		AI_Output(self,other,"DIA_Godar_Prison_13_02");	//Vy mágové jste s paladiny ve spojení. Ne ne, pøíteli. Zapomeò na to.
	}
	else
	{
		AI_Output(self,other,"DIA_Godar_Prison_13_03");	//Ty svinì mì zabásli za pytlaèení. Kvùli dvìma zavšivenejm zajícùm!
		AI_Output(self,other,"DIA_Godar_Prison_13_04");	//Napaøili mi za to 10 let.
		AI_Output(other,self,"DIA_Godar_Prison_15_05");	//A to bylo všechno?
		AI_Output(self,other,"DIA_Godar_Prison_13_06");	//No, taky jsem se samozøejmì bránil.
		AI_Output(other,self,"DIA_Godar_Prison_15_07");	//A?
		AI_Output(self,other,"DIA_Godar_Prison_13_08");	//Nemohl jsem nic dìlat, ten chlápek zakopnul a zlomil si vaz. Vážnì!
		Info_ClearChoices(dia_godar_prison);
		Info_AddChoice(dia_godar_prison,"To zní povìdomì.",dia_godar_prison_court);
		Info_AddChoice(dia_godar_prison,"Nemìl ses nechat chytit.",dia_godar_prison_pissoff);
	};
};

func void dia_godar_prison_court()
{
	AI_Output(other,self,"DIA_Godar_Prison_Court_15_00");	//To zní povìdomì.
	AI_Output(self,other,"DIA_Godar_Prison_Court_13_01");	//Víš, co myslím. Ty bohatý bastardi nemají ani tucha, jak tu s náma zacházeli.
	AI_Output(self,other,"DIA_Godar_Prison_Court_13_02");	//Vùbec je to nezajímalo.
	Info_ClearChoices(dia_godar_prison);
	GODARLIKESYOU = TRUE;
};

func void dia_godar_prison_pissoff()
{
	AI_Output(other,self,"DIA_Godar_Prison_Pissoff_15_00");	//Nemìl ses nechat chytit.
	AI_Output(self,other,"DIA_Godar_Prison_Pissoff_13_01");	//(vztekle) Vsadím se, žes nikdy nebyl zavøenej, co?
	AI_Output(self,other,"DIA_Godar_Prison_Pissoff_13_02");	//Tak to bych ti mìl ukázat, co se mùže tvýmu tìlu ve vìzení stát.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_GODAR_HUNTING(C_INFO)
{
	npc = djg_711_godar;
	nr = 5;
	condition = dia_godar_hunting_condition;
	information = dia_godar_hunting_info;
	permanent = FALSE;
	description = "Mùžeš mì nauèit nìco o lovu?";
};


func int dia_godar_hunting_condition()
{
	if(Npc_KnowsInfo(other,dia_godar_prison) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF)))
	{
		return TRUE;
	};
};

func void dia_godar_hunting_info()
{
	AI_Output(other,self,"DIA_Godar_Hunting_15_00");	//Mùžeš mì nauèit nìco o lovu?
	if(GODARLIKESYOU == FALSE)
	{
		AI_Output(self,other,"DIA_Godar_Hunting_13_01");	//To nemyslíš vážnì, co? Zmizni!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Godar_Hunting_13_03");	//Ze zvíøat se dá získat mnohem víc než jen maso. Kožešiny a drápy mùžeš pak nìkde prodat. Dá se na tom docela vydìlat.
		AI_Output(self,other,"DIA_Godar_Hunting_13_04");	//Už se nemùžu doèkat, až si to rozdám s drakem.
		GODAR_TEACHANIMALTROPHY = TRUE;
	};
};


instance DIA_GODAR_DRAGONSTUFF(C_INFO)
{
	npc = djg_711_godar;
	nr = 5;
	condition = dia_godar_dragonstuff_condition;
	information = dia_godar_dragonstuff_info;
	permanent = TRUE;
	description = "Ukaž mi, jak vykuchat draka.";
};


var int godar_teachdragonstuff;

func int dia_godar_dragonstuff_condition()
{
	if((GODAR_TEACHANIMALTROPHY == TRUE) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)) && ((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONSCALE] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONBLOOD] == FALSE)) && (GODAR_TEACHDRAGONSTUFF == FALSE))
	{
		return TRUE;
	};
};

func void dia_godar_dragonstuff_info()
{
	AI_Output(other,self,"DIA_Godar_Dragonstuff_15_00");	//Ukaž mi, jak vykuchat draka.
	AI_Output(self,other,"DIA_Godar_Dragonstuff_13_01");	//Chceš všechny prachy pro sebe, co?
	AI_Output(self,other,"DIA_Godar_Dragonstuff_13_02");	//No dobrá, ale bude tì to stát 1000 zlatých.
	Info_ClearChoices(dia_godar_dragonstuff);
	Info_AddChoice(dia_godar_dragonstuff,"Za tolik mi to nestojí.",dia_godar_dragonstuff_nein);
	Info_AddChoice(dia_godar_dragonstuff,"To je fér.",dia_godar_dragonstuff_fair);
};

func void dia_godar_dragonstuff_fair()
{
	AI_Output(other,self,"DIA_Godar_Dragonstuff_fair_15_00");	//To je fér.
	if(b_giveinvitems(other,self,itmi_gold,1000))
	{
		GODAR_TEACHDRAGONSTUFF = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Godar_Dragonstuff_fair_13_01");	//Ne bez prachù. Nejdøív mi dej ty peníze.
	};
	Info_ClearChoices(dia_godar_dragonstuff);
};

func void dia_godar_dragonstuff_nein()
{
	AI_Output(other,self,"DIA_Godar_Dragonstuff_nein_15_00");	//Za tolik mi to nestojí.
	AI_Output(self,other,"DIA_Godar_Dragonstuff_nein_13_01");	//Jak je libo.
	Info_ClearChoices(dia_godar_dragonstuff);
};


instance DIA_GODAR_TEACH(C_INFO)
{
	npc = djg_711_godar;
	nr = 5;
	condition = dia_godar_teach_condition;
	information = dia_godar_teach_info;
	permanent = TRUE;
	description = "Ukaž mi, jak lovit.";
};


func int dia_godar_teach_condition()
{
	if((GODAR_TEACHANIMALTROPHY == TRUE) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)))
	{
		return TRUE;
	};
};

func void dia_godar_teach_info()
{
	AI_Output(other,self,"DIA_Godar_Teach_15_00");	//Ukaž mi, jak lovit.
	if((Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSTING] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWING] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONSCALE] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONBLOOD] == FALSE))
	{
		Info_AddChoice(dia_godar_teach,DIALOG_BACK,dia_godar_teach_back);
		if(Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == FALSE)
		{
			Info_AddChoice(dia_godar_teach,b_buildlearnstring("Plížení",b_getlearncosttalent(other,NPC_TALENT_SNEAK,1)),dia_godar_teach_thief_sneak);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE)
		{
			Info_AddChoice(dia_godar_teach,b_buildlearnstring("Vyjmutí zubù",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_TEETH)),dia_godar_teach_trophys_teeth);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSTING] == FALSE)
		{
			Info_AddChoice(dia_godar_teach,b_buildlearnstring("Žihadlo krvavé mouchy",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFSTING)),dia_godar_teach_trophys_bfsting);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWING] == FALSE)
		{
			Info_AddChoice(dia_godar_teach,b_buildlearnstring("Køídla krvavé mouchy",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFWING)),dia_godar_teach_trophys_bfwing);
		};
		if(GODAR_TEACHDRAGONSTUFF == TRUE)
		{
			if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONSCALE] == FALSE)
			{
				Info_AddChoice(dia_godar_teach,b_buildlearnstring("Získání draèích šupin",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DRAGONSCALE)),dia_godar_teach_trophys_dragonscale);
			};
			if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONBLOOD] == FALSE)
			{
				Info_AddChoice(dia_godar_teach,b_buildlearnstring("Získání draèí krve",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DRAGONBLOOD)),dia_godar_teach_trophys_dragonblood);
			};
		};
	}
	else
	{
		b_say(self,other,"$NOLEARNYOUREBETTER");
	};
};

func void dia_godar_teach_back()
{
	Info_ClearChoices(dia_godar_teach);
};

func void dia_godar_teach_trophys_teeth()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_TEETH))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_Teeth_13_00");	//Nejlepší zpùsob, jak získat zuby, je za pomoci poøádného nože.
	};
	Info_ClearChoices(dia_godar_teach);
};

func void dia_godar_teach_trophys_bfsting()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_BFSTING))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_BFSting_13_00");	//Nejrychlejší zpùsob, jak získat žihadlo krvavé mouchy, je vymáèknout ho dozadu pøed tím, než ho vyøízneš.
	};
	Info_ClearChoices(dia_godar_teach);
};

func void dia_godar_teach_trophys_bfwing()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_BFWING))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_BFWing_13_00");	//Køídla krvavých much jsou velmi køehká. Takže až je budeš odøezávat, musíš být opravdu opatrný.
	};
	Info_ClearChoices(dia_godar_teach);
};

func void dia_godar_teach_thief_sneak()
{
	if(b_teachthieftalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_Sneak_13_00");	//Když se chceš plížit, nazuj si mìkké boty. Tuhá podrážka mùže nadìlat spoustu hluku.
	};
	Info_ClearChoices(dia_godar_teach);
};

func void dia_godar_teach_trophys_dragonscale()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_DRAGONSCALE))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_DragonScale_13_00");	//Abys mohl z draka dostat jeho šupiny, budeš potøebovat spoustu síly. Ale dá se to zvládnout.
	};
	Info_ClearChoices(dia_godar_teach);
};

func void dia_godar_teach_trophys_dragonblood()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_DRAGONBLOOD))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_DragonBlood_13_00");	//Najdi si na draèím bøichu mìkké místeèko. Tam rozøízni a vyextrahuj krev.
	};
	Info_ClearChoices(dia_godar_teach);
};


instance DIA_GODAR_ALLDRAGONSDEAD(C_INFO)
{
	npc = djg_711_godar;
	nr = 5;
	condition = dia_godar_alldragonsdead_condition;
	information = dia_godar_alldragonsdead_info;
	permanent = FALSE;
	description = "Zabil jsem všechny draky.";
};


func int dia_godar_alldragonsdead_condition()
{
	if(MIS_ALLDRAGONSDEAD == TRUE)
	{
		return TRUE;
	};
};

func void dia_godar_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_Godar_AllDragonsDead_15_00");	//Zabil jsem všechny draky.
	AI_Output(self,other,"DIA_Godar_AllDragonsDead_13_01");	//No a. Tady v údolí nám toho zùstalo ještì spousta.
};


instance DIA_GODAR_PICKPOCKET(C_INFO)
{
	npc = djg_711_godar;
	nr = 900;
	condition = dia_godar_pickpocket_condition;
	information = dia_godar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_godar_pickpocket_condition()
{
	return c_beklauen(16,160);
};

func void dia_godar_pickpocket_info()
{
	Info_ClearChoices(dia_godar_pickpocket);
	Info_AddChoice(dia_godar_pickpocket,DIALOG_BACK,dia_godar_pickpocket_back);
	Info_AddChoice(dia_godar_pickpocket,DIALOG_PICKPOCKET,dia_godar_pickpocket_doit);
};

func void dia_godar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_godar_pickpocket);
};

func void dia_godar_pickpocket_back()
{
	Info_ClearChoices(dia_godar_pickpocket);
};

