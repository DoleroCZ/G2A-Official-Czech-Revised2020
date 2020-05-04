
instance DIA_PC_THIEF_DI_EXIT(C_INFO)
{
	npc = pc_thief_di;
	nr = 999;
	condition = dia_pc_thief_di_exit_condition;
	information = dia_pc_thief_di_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pc_thief_di_exit_condition()
{
	return TRUE;
};

func void dia_pc_thief_di_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PC_THIEF_DI_HALLO(C_INFO)
{
	npc = pc_thief_di;
	nr = 5;
	condition = dia_pc_thief_di_hallo_condition;
	information = dia_pc_thief_di_hallo_info;
	description = "Tak jsme tady.";
};


func int dia_pc_thief_di_hallo_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_pc_thief_di_hallo_info()
{
	AI_Output(other,self,"DIA_PC_Thief_DI_Hallo_15_00");	//Tak jsme tady.
	AI_Output(self,other,"DIA_PC_Thief_DI_Hallo_11_01");	//Ten ostrov nen� od Khorinisu tak daleko, jak jsem si myslel.
	AI_Output(self,other,"DIA_PC_Thief_DI_Hallo_11_02");	//To jsem nev�d�l. Te� se mi ale samoz�ejm� p�r v�c� vyjasnilo.
	AI_Output(self,other,"DIA_PC_Thief_DI_Hallo_11_03");	//Po��d mi vrtalo hlavou, jak je mo�n�, �e maj� sk�eti tak dobr� p��sun z�sob.
	AI_Output(self,other,"DIA_PC_Thief_DI_Hallo_11_04");	//S pomoc� t�hle z�kladny to je hra�ka.
	AI_Output(self,other,"DIA_PC_Thief_DI_Hallo_11_05");	//B�hem cesty do srdce tohoto ostrova nejsp� naraz� na jednu dv� pasti.
	AI_Output(self,other,"DIA_PC_Thief_DI_Hallo_11_06");	//Pokud by ses n�kde zasekl, p�ij� ke mn�. Mo�n� by se ti mohly hodit moje zku�enosti.
};


instance DIA_PC_THIEF_DI_RAT(C_INFO)
{
	npc = pc_thief_di;
	nr = 5;
	condition = dia_pc_thief_di_rat_condition;
	information = dia_pc_thief_di_rat_info;
	permanent = TRUE;
	description = "Pot�ebuji tvou pomoc.";
};


func int dia_pc_thief_di_rat_condition()
{
	if((Npc_IsDead(undeaddragon) == FALSE) && Npc_KnowsInfo(other,dia_pc_thief_di_hallo))
	{
		return TRUE;
	};
};


var int dia_pc_thief_di_rat_onetime;
var int dia_pc_thief_di_rat_onetime2;

func void dia_pc_thief_di_rat_info()
{
	AI_Output(other,self,"DIA_PC_Thief_DI_RAT_15_00");	//Pot�ebuji tvou pomoc.
	if(Npc_IsDead(orkelite_antipaladinorkoberst_di) && (EVT_ORKOBERST_SWITCH_FOUND == FALSE))
	{
		AI_Output(other,self,"DIA_PC_Thief_DI_RAT_15_01");	//Tam naho�e m� sv�j hlavn� stan sk�et� plukovn�k. Nem��u se dostat dovnit� ostrova.
		AI_Output(self,other,"DIA_PC_Thief_DI_RAT_11_02");	//Sk�eti jsou chytr� stvo�en�. �asto jsou nepr�vem podce�ov�ni. �ekl bych, �e maj� n�jak� tajn� pr�chod. Prohledej zdi, snad najde� n�jak� skryt� sp�na�.
		AI_Output(self,other,"DIA_PC_Thief_DI_RAT_11_03");	//Ale nezapome�, �e aby takov�to tajn� sp�na�e fungovaly, mus� je �asto pou��vat v p�esn� ur�en�m po�ad�.
	}
	else if(Npc_IsDead(firedragonisland) && (EVT_DIBRIDGE_OPENED == FALSE))
	{
		AI_Output(other,self,"DIA_PC_Thief_DI_RAT_15_04");	//Bojoval jsem s drakem a te� m�m p�ed sebou propast s padac�m mostem. Ten most je ale zvednut� a j� se nemohu dostat na druhou stranu.
		AI_Output(self,other,"DIA_PC_Thief_DI_RAT_11_05");	//Hmm. Zkou�el jsi u� n�jakou st�elnou zbra�? Mo�n� by �lo jeho mechanismus spustit dob�e m��enou ranou.
	}
	else if(Npc_IsDead(skeleton_lord_archol) && (Npc_KnowsInfo(other,dia_schwarzmagier_hello) == FALSE))
	{
		AI_Output(other,self,"DIA_PC_Thief_DI_RAT_15_06");	//Stoj�m proti hord� nemrtv�ch a jejich slo�it�m pastem.
		AI_Output(self,other,"DIA_PC_Thief_DI_RAT_11_07");	//Je mi l�to, ale s nemrtv�mi nem�m ��dn� zku�enosti. S t�m si bude� muset poradit s�m.
	}
	else
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_RAT_11_08");	//Vra� se ke mn�, a� bude� m�t probl�m, na jeho� �e�en� budou moje zku�enosti sta�it.
		if((ORKSTURMDI == TRUE) && (DIA_PC_THIEF_DI_RAT_ONETIME2 == FALSE))
		{
			AI_Output(self,other,"DIA_PC_Thief_DI_RAT_11_09");	//Je�t� jedna v�c. Byl bych r�d, kdybys k lodi nep�ivedl v�echny p��ery, je� se tu po okol� potuluj�. Douf�m, �e tenhle sk�et� n�jezd byl posledn�, kter� jsem musel odr�et!
			b_giveplayerxp(XP_AMBIENT);
			DIA_PC_THIEF_DI_RAT_ONETIME2 = TRUE;
		};
	};
};


instance DIA_DIEGO_DI_TRADE(C_INFO)
{
	npc = pc_thief_di;
	nr = 12;
	condition = dia_diego_di_trade_condition;
	information = dia_diego_di_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Pot�ebuju doplnit v�zbroj.";
};


func int dia_diego_di_trade_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_diego_di_trade_info()
{
	var int mcbolzenamount;
	var int mcarrowamount;
	AI_Output(other,self,"DIA_Diego_DI_TRADE_15_00");	//Pot�ebuju doplnit v�zbroj.
	b_givetradeinv(self);
	Npc_RemoveInvItems(self,itrw_bolt,Npc_HasItems(self,itrw_bolt));
	mcbolzenamount = KAPITEL * 50;
	CreateInvItems(self,itrw_bolt,mcbolzenamount);
	Npc_RemoveInvItems(self,itrw_arrow,Npc_HasItems(self,itrw_arrow));
	mcarrowamount = KAPITEL * 50;
	CreateInvItems(self,itrw_arrow,mcarrowamount);
	AI_Output(self,other,"DIA_Diego_DI_TRADE_11_01");	//Mo�n� bych ti mohl pomoct.
};


instance DIA_PC_THIEF_DI_TRAINING_TALENTE(C_INFO)
{
	npc = pc_thief_di;
	nr = 10;
	condition = dia_pc_thief_di_training_talente_condition;
	information = dia_pc_thief_di_training_talente_info;
	permanent = TRUE;
	description = "Tr�nuj m�.";
};


func int dia_pc_thief_di_training_talente_condition()
{
	if((Npc_IsDead(undeaddragon) == FALSE) && Npc_KnowsInfo(other,dia_pc_thief_di_hallo))
	{
		return TRUE;
	};
};

func void dia_pc_thief_di_training_talente_info()
{
	AI_Output(other,self,"DIA_PC_Thief_DI_Training_15_00");	//Tr�nuj m�.
	AI_Output(self,other,"DIA_PC_Thief_DI_Training_11_01");	//Co pot�ebuje�?
	Info_ClearChoices(dia_pc_thief_di_training_talente);
	Info_AddChoice(dia_pc_thief_di_training_talente,DIALOG_BACK,dia_pc_thief_di_training_talente_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice(dia_pc_thief_di_training_talente,"P��en� z�mk�",dia_pc_thief_di_training_talente_picklock);
	};
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_pc_thief_di_training_dex_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_pc_thief_di_training_dex_5);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_pc_thief_di_training_combat_bow_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_pc_thief_di_training_combat_bow_5);
};

func void dia_pc_thief_di_training_dex_1()
{
	if(b_teachattributepoints(self,other,ATR_DEXTERITY,1,T_MAX))
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_Training_DEX_1_11_00");	//�ivot pro tebe bude mnohem jednodu���, kdy� se bude� dr�et mimo st�eleck� �hel.
	};
	Info_ClearChoices(dia_pc_thief_di_training_talente);
	Info_AddChoice(dia_pc_thief_di_training_talente,DIALOG_BACK,dia_pc_thief_di_training_talente_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice(dia_pc_thief_di_training_talente,"P��en� z�mk�",dia_pc_thief_di_training_talente_picklock);
	};
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_pc_thief_di_training_dex_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_pc_thief_di_training_dex_5);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_pc_thief_di_training_combat_bow_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_pc_thief_di_training_combat_bow_5);
};

func void dia_pc_thief_di_training_dex_5()
{
	if(b_teachattributepoints(self,other,ATR_DEXTERITY,5,T_MAX))
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_Training_DEX_5_11_00");	//Kdy� se pohybuje�, sna� se b�t mr�tn� jako ko�ka. Zbytek p�jde s�m.
	};
	Info_ClearChoices(dia_pc_thief_di_training_talente);
	Info_AddChoice(dia_pc_thief_di_training_talente,DIALOG_BACK,dia_pc_thief_di_training_talente_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice(dia_pc_thief_di_training_talente,"P��en� z�mk�",dia_pc_thief_di_training_talente_picklock);
	};
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_pc_thief_di_training_dex_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_pc_thief_di_training_dex_5);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_pc_thief_di_training_combat_bow_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_pc_thief_di_training_combat_bow_5);
};

func void dia_pc_thief_di_training_combat_bow_1()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,1,100))
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_Training_Combat_BOW_1_11_00");	//Jestli chce� b�t opravdu dobr�, hodn� tr�nuj nane�isto.
	};
	Info_ClearChoices(dia_pc_thief_di_training_talente);
	Info_AddChoice(dia_pc_thief_di_training_talente,DIALOG_BACK,dia_pc_thief_di_training_talente_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice(dia_pc_thief_di_training_talente,"P��en� z�mk�",dia_pc_thief_di_training_talente_picklock);
	};
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_pc_thief_di_training_dex_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_pc_thief_di_training_dex_5);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_pc_thief_di_training_combat_bow_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_pc_thief_di_training_combat_bow_5);
};

func void dia_pc_thief_di_training_combat_bow_5()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,5,100))
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_Training_Combat_BOW_5_11_00");	//P�i m��en� pomalu vydechni, aby se ti net��sla ruka.
	};
	Info_ClearChoices(dia_pc_thief_di_training_talente);
	Info_AddChoice(dia_pc_thief_di_training_talente,DIALOG_BACK,dia_pc_thief_di_training_talente_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice(dia_pc_thief_di_training_talente,"P��en� z�mk�",dia_pc_thief_di_training_talente_picklock);
	};
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_pc_thief_di_training_dex_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_pc_thief_di_training_dex_5);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_pc_thief_di_training_combat_bow_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_pc_thief_di_training_combat_bow_5);
};

func void dia_pc_thief_di_training_talente_picklock()
{
	if(b_teachthieftalent(self,other,NPC_TALENT_PICKLOCK))
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_Training_PICKLOCK_11_00");	//U� bylo na �ase. Je s podivem, �e ses dosud tuto schopnost nenau�il.
	};
	Info_ClearChoices(dia_pc_thief_di_training_talente);
	Info_AddChoice(dia_pc_thief_di_training_talente,DIALOG_BACK,dia_pc_thief_di_training_talente_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice(dia_pc_thief_di_training_talente,"P��en� z�mk�",dia_pc_thief_di_training_talente_picklock);
	};
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_pc_thief_di_training_dex_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_pc_thief_di_training_dex_5);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_pc_thief_di_training_combat_bow_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_pc_thief_di_training_combat_bow_5);
};

func void dia_pc_thief_di_training_talente_back()
{
	Info_ClearChoices(dia_pc_thief_di_training_talente);
};


instance DIA_PC_THIEF_DI_UNDEADDRAGONDEAD(C_INFO)
{
	npc = pc_thief_di;
	nr = 5;
	condition = dia_pc_thief_di_undeaddragondead_condition;
	information = dia_pc_thief_di_undeaddragondead_info;
	permanent = TRUE;
	description = "Je po v�em. Te� odsud m��eme vypadnout.";
};


func int dia_pc_thief_di_undeaddragondead_condition()
{
	if(Npc_IsDead(undeaddragon))
	{
		return TRUE;
	};
};


var int dia_pc_thief_di_undeaddragondead_onetime;

func void dia_pc_thief_di_undeaddragondead_info()
{
	AI_Output(other,self,"DIA_PC_Thief_DI_UndeadDragonDead_15_00");	//Je po v�em. Te� odsud m��eme vypadnout.
	if(Npc_GetDistToWP(self,"WP_UNDEAD_MIDDLE_01") < 4000)
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_01");	//Jen se na to pod�vej. Za cel� sv�j �ivot jsem podobnou stavbu nevid�l.
		AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_02");	//Jak ses proboha skrz tu v�c dostal?
		AI_Output(other,self,"DIA_PC_Thief_DI_UndeadDragonDead_15_03");	//�ekl bych, �e jsem m�l �t�st�.
		AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_04");	//(sm�je se) Kdy� to ��k�.
	}
	else
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_05");	//Dobr�.
	};
	if(DIA_PC_THIEF_DI_UNDEADDRAGONDEAD_ONETIME == FALSE)
	{
		AI_Output(other,self,"DIA_PC_Thief_DI_UndeadDragonDead_15_06");	//Co bude� d�lat d�l?
		AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_07");	//To je dobr� ot�zka. Ze v�eho nejd��ve se asi vr�t�m do Khorinisu.
		if((DIEBESGILDE_VERRATEN == TRUE) || (MIS_ANDRE_GUILDOFTHIEVES == LOG_SUCCESS))
		{
			AI_Output(self,other,"DIA_DiegoDI_Add_11_00");	//Zlod�jsk� cech tam u� nen�. T�m p�dem se nab�z� n�kolik zaj�mav�ch p��le�itost�.
		};
		AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_09");	//Hmm. Nebo mo�n� prost� p�evezmu Bromorovu �ivnost. V tom jsou v�dycky pen�ze. Poctiv� pen�ze.
		DIA_PC_THIEF_DI_UNDEADDRAGONDEAD_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_10");	//B� za kapit�nem, a� u� jsme pry�.
	AI_StopProcessInfos(self);
	if(LARES_ISONBOARD != LOG_SUCCESS)
	{
		Npc_ExchangeRoutine(self,"SittingShipDI");
	}
	else
	{
		Npc_ExchangeRoutine(self,"Start");
	};
};


instance DIA_THIEF_DI_PICKPOCKET(C_INFO)
{
	npc = pc_thief_di;
	nr = 900;
	condition = dia_thief_di_pickpocket_condition;
	information = dia_thief_di_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_120;
};


func int dia_thief_di_pickpocket_condition()
{
	return c_beklauen(120,600);
};

func void dia_thief_di_pickpocket_info()
{
	Info_ClearChoices(dia_thief_di_pickpocket);
	Info_AddChoice(dia_thief_di_pickpocket,DIALOG_BACK,dia_thief_di_pickpocket_back);
	Info_AddChoice(dia_thief_di_pickpocket,DIALOG_PICKPOCKET,dia_thief_di_pickpocket_doit);
};

func void dia_thief_di_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_thief_di_pickpocket);
};

func void dia_thief_di_pickpocket_back()
{
	Info_ClearChoices(dia_thief_di_pickpocket);
};

