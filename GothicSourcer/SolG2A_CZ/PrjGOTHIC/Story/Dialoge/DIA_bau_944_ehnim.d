
instance DIA_EHNIM_EXIT(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 999;
	condition = dia_ehnim_exit_condition;
	information = dia_ehnim_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ehnim_exit_condition()
{
	return TRUE;
};

func void dia_ehnim_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_EHNIM_HALLO(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 3;
	condition = dia_ehnim_hallo_condition;
	information = dia_ehnim_hallo_info;
	description = "Kdo jsi?";
};


func int dia_ehnim_hallo_condition()
{
	return TRUE;
};

func void dia_ehnim_hallo_info()
{
	AI_Output(other,self,"DIA_Ehnim_HALLO_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Ehnim_HALLO_12_01");	//Jmenuju se Ehnim. Jsem jedním z námezdních rolníkù.
	if(Hlp_IsValidNpc(egill) && !c_npcisdown(egill))
	{
		AI_Output(self,other,"DIA_Ehnim_HALLO_12_02");	//A támhleten prcek je mùj bratr Egill.
	};
	AI_Output(self,other,"DIA_Ehnim_HALLO_12_03");	//U tady na farmì pracuju pro Akila nìkolik let.
};


instance DIA_EHNIM_FELDARBEIT(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 4;
	condition = dia_ehnim_feldarbeit_condition;
	information = dia_ehnim_feldarbeit_info;
	description = "Jak jdou polní práce?";
};


func int dia_ehnim_feldarbeit_condition()
{
	if(Npc_KnowsInfo(other,dia_ehnim_hallo))
	{
		return TRUE;
	};
};

func void dia_ehnim_feldarbeit_info()
{
	AI_Output(other,self,"DIA_Ehnim_FELDARBEIT_15_00");	//Jak jdou polní práce?
	AI_Output(self,other,"DIA_Ehnim_FELDARBEIT_12_01");	//Chceš pomoct? Támhle je další motyka. Vezmi si ji a vyraz na pole.
	AI_Output(self,other,"DIA_Ehnim_FELDARBEIT_12_02");	//Mìl by ses jen mít na pozoru pøed polními škùdci. Utrhnou ti ruku, ani nemrkneš.
};


instance DIA_EHNIM_FELDRAEUBER(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 5;
	condition = dia_ehnim_feldraeuber_condition;
	information = dia_ehnim_feldraeuber_info;
	description = "Proè s tìmi škùdci nìco neudìláte?";
};


func int dia_ehnim_feldraeuber_condition()
{
	if(Npc_KnowsInfo(other,dia_ehnim_feldarbeit))
	{
		return TRUE;
	};
};

func void dia_ehnim_feldraeuber_info()
{
	AI_Output(other,self,"DIA_Ehnim_FELDRAEUBER_15_00");	//Proè s tìmi škùdci nìco neudìláte?
	AI_Output(self,other,"DIA_Ehnim_FELDRAEUBER_12_01");	//Zabil u jsem jich víc, ne dokáu spoèítat. Jedinej problém je, e zase pøijdou další.
};


instance DIA_EHNIM_STREIT1(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 6;
	condition = dia_ehnim_streit1_condition;
	information = dia_ehnim_streit1_info;
	description = "Tvùj bratr mi øíkal to samé.";
};


func int dia_ehnim_streit1_condition()
{
	if(Npc_KnowsInfo(other,dia_egill_feldraeuber) && Npc_KnowsInfo(other,dia_ehnim_feldraeuber) && (Npc_KnowsInfo(other,dia_egill_streit2) == FALSE) && (Hlp_IsValidNpc(egill) && !c_npcisdown(egill)))
	{
		return TRUE;
	};
};

func void dia_ehnim_streit1_info()
{
	AI_Output(other,self,"DIA_Ehnim_STREIT1_15_00");	//Tvùj bratr mi øíkal to samé.
	AI_Output(self,other,"DIA_Ehnim_STREIT1_12_01");	//Co? Ten sralbotka? Vdycky se vytratí hned, jak se ty bestie objeví na našem pozemku.
	AI_Output(self,other,"DIA_Ehnim_STREIT1_12_02");	//Nemìl by øíkat takovı nesmysly.
};


instance DIA_EHNIM_STREIT3(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 7;
	condition = dia_ehnim_streit3_condition;
	information = dia_ehnim_streit3_info;
	description = "Tvùj bratr si myslí, e se akorát vytahuješ.";
};


func int dia_ehnim_streit3_condition()
{
	if(Npc_KnowsInfo(other,dia_egill_streit2) && (Hlp_IsValidNpc(egill) && !c_npcisdown(egill)))
	{
		return TRUE;
	};
};

func void dia_ehnim_streit3_info()
{
	AI_Output(other,self,"DIA_Ehnim_STREIT3_15_00");	//Tvùj bratr si myslí, e se akorát vytahuješ.
	AI_Output(self,other,"DIA_Ehnim_STREIT3_12_01");	//Co? To má vánì odvahu tohle øíct?
	AI_Output(self,other,"DIA_Ehnim_STREIT3_12_02");	//Radìj by si mìl dávat pozor, ne mu uštìdøím poøádnou lekci.
	AI_Output(self,other,"DIA_Ehnim_STREIT3_12_03");	//Tak mu to bì øíct.
	AI_StopProcessInfos(self);
};


instance DIA_EHNIM_STREIT5(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 8;
	condition = dia_ehnim_streit5_condition;
	information = dia_ehnim_streit5_info;
	permanent = TRUE;
	description = "Mám dojem, e byste se mìli oba trochu zklidnit.";
};


var int dia_ehnim_streit5_noperm;

func int dia_ehnim_streit5_condition()
{
	if(Npc_KnowsInfo(other,dia_egill_streit4) && (Hlp_IsValidNpc(egill) && !c_npcisdown(egill)) && (DIA_EHNIM_STREIT5_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_ehnim_streit5_info()
{
	AI_Output(other,self,"DIA_Ehnim_STREIT5_15_00");	//Mám dojem, e byste se mìli oba trochu zklidnit.
	AI_Output(self,other,"DIA_Ehnim_STREIT5_12_01");	//Ten bastard to ještì nevzdal, co?
	AI_Output(self,other,"DIA_Ehnim_STREIT5_12_02");	//Já ho roztrhnu. Øekni mu to.
	Info_ClearChoices(dia_ehnim_streit5);
	Info_AddChoice(dia_ehnim_streit5,"Dìlej si, co chceš. Odcházím.",dia_ehnim_streit5_gehen);
	Info_AddChoice(dia_ehnim_streit5,"Proè mu to neøekneš sám?",dia_ehnim_streit5_attack);
};

func void dia_ehnim_streit5_attack()
{
	AI_Output(other,self,"DIA_Ehnim_STREIT5_Attack_15_00");	//Proè mu to neøekneš sám?
	AI_Output(self,other,"DIA_Ehnim_STREIT5_Attack_12_01");	//To pøesnì udìlám.
	AI_StopProcessInfos(self);
	DIA_EHNIM_STREIT5_NOPERM = TRUE;
	other.aivar[AIV_INVINCIBLE] = FALSE;
	b_attack(self,egill,AR_NONE,0);
	b_giveplayerxp(XP_EGILLEHNIMSTREIT);
};

func void dia_ehnim_streit5_gehen()
{
	AI_Output(other,self,"DIA_Ehnim_STREIT5_gehen_15_00");	//Dìlej si, co chceš. Odcházím.
	AI_Output(self,other,"DIA_Ehnim_STREIT5_gehen_12_01");	//Jo, jen se rychle ztra.
	AI_StopProcessInfos(self);
};


instance DIA_EHNIM_PERMKAP1(C_INFO)
{
	npc = bau_944_ehnim;
	condition = dia_ehnim_permkap1_condition;
	information = dia_ehnim_permkap1_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_ehnim_permkap1_condition()
{
	if((DIA_EHNIM_STREIT5_NOPERM == TRUE) && Npc_IsInState(self,zs_talk) && ((KAPITEL < 3) || (hero.guild == GIL_KDF)))
	{
		return TRUE;
	};
};

func void dia_ehnim_permkap1_info()
{
	AI_Output(self,other,"DIA_Ehnim_PERMKAP1_12_00");	//Chceš dìlat další problémy? Mám dojem, e bude lepší, kdy se hned ztratíš.
	AI_StopProcessInfos(self);
};


instance DIA_EHNIM_MOLERATFETT(C_INFO)
{
	npc = bau_944_ehnim;
	condition = dia_ehnim_moleratfett_condition;
	information = dia_ehnim_moleratfett_info;
	important = TRUE;
};


func int dia_ehnim_moleratfett_condition()
{
	if((DIA_EHNIM_STREIT5_NOPERM == TRUE) && (KAPITEL >= 3) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_ehnim_moleratfett_info()
{
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_12_00");	//Ty jsi tu JEŠTÌ.
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_15_01");	//Vypadá to tak. Poøád vytoèenej?
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_12_02");	//Nic se nedìje, zapomeò na to. Øekni, byl jsi poslední dobou na Lobartovì farmì?
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_15_03");	//Moná. Proè?
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_12_04");	//Ó, nic dùleitıho. Jen jsem chtìl mluvit s Vinem o jeho palírnì.
	Info_ClearChoices(dia_ehnim_moleratfett);
	Info_AddChoice(dia_ehnim_moleratfett,"Právì teï nemám èas.",dia_ehnim_moleratfett_nein);
	Info_AddChoice(dia_ehnim_moleratfett,"Palírna? Jaká palírna?",dia_ehnim_moleratfett_was);
	if(Npc_IsDead(vino))
	{
		Info_AddChoice(dia_ehnim_moleratfett,"Vino je mrtvı.",dia_ehnim_moleratfett_tot);
	};
};

func void dia_ehnim_moleratfett_tot()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_tot_15_00");	//Vino je mrtvı.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_tot_12_01");	//Proboha. No nic. Tak to se nedá nic dìlat.
};

func void dia_ehnim_moleratfett_was()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_15_00");	//Palírna? Jaká palírna?
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_12_01");	//Ó. Asi jsem to nemìl øíkat. Vino byl na to své malé tajemství vdycky hodnì citlivı.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_12_02");	//Ale teï jsem si to nechal vyklouznout. Tam vzadu v lese si Vino zaøídil tajnou palírnu.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_12_03");	//Nedávno mì ádal o nìco, èím by mohl promazat padací møí.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_12_04");	//V poslední dobì hodnì pršelo a zaèala ho zlobit rez. Teï je naviják zaseknutı a nikdo u se tam nedostane. To jsme v pìknı bryndì.
	Log_CreateTopic(TOPIC_FOUNDVINOSKELLEREI,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FOUNDVINOSKELLEREI,LOG_RUNNING);
	b_logentry(TOPIC_FOUNDVINOSKELLEREI,"Podle Ehnima se Vino stále ukrıvá v lesích poblí Akilova statku. Ale mechanismus dveøí je zadøenı a dokud jej nenamau krysokrtím sádlem, dovnitø se nedostanu.");
	Info_AddChoice(dia_ehnim_moleratfett,"A? Máš nìjakı mazivo?",dia_ehnim_moleratfett_was_fett);
};

func void dia_ehnim_moleratfett_was_fett()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_Fett_15_00");	//A? Máš nìjakı mazivo?
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_12_01");	//Jo, jasnì. Nejlepší, co se tu dá sehnat. Krysokrtí sádlo. Pøíšerná vìc, to ti povím. Taky se pouívá na promazání lodních dìl.
	Info_AddChoice(dia_ehnim_moleratfett,"Prodej mi ten tuk.",dia_ehnim_moleratfett_was_fett_habenwill);
};


var int ehnim_moleratfettoffer;

func void dia_ehnim_moleratfett_was_fett_habenwill()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_15_00");	//Prodej mi ten tuk.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_12_01");	//To nebude levnı, kámo. V tomhle kraji to je zatracenì vzácná vìc.
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_15_02");	//Kolik?
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_12_03");	//Mmh. 100 zlatıch?
	EHNIM_MOLERATFETTOFFER = 100;
	Info_ClearChoices(dia_ehnim_moleratfett);
	Info_AddChoice(dia_ehnim_moleratfett,"To je pøíliš.",dia_ehnim_moleratfett_was_fett_habenwill_zuviel);
	Info_AddChoice(dia_ehnim_moleratfett,"Dohodnuto.",dia_ehnim_moleratfett_was_fett_habenwill_ja);
};

func void dia_ehnim_moleratfett_was_fett_habenwill_ja()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_15_00");	//Dohodnuto.
	if(b_giveinvitems(other,self,itmi_gold,EHNIM_MOLERATFETTOFFER))
	{
		AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_01");	//Dobrá. Tady to máš.
		if(Npc_HasItems(self,itmi_moleratlubric_mis))
		{
			b_giveinvitems(self,other,itmi_moleratlubric_mis,1);
			if(Npc_IsDead(vino) == FALSE)
			{
				AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_02");	//(pro sebe) Zatracenì. Vino mì zabije.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_03");	//Sakra, kam jsme se to dostali? To je zatracenì mrzutá vìc. Tak fajn, promiò. Jak se zdá, u to nemám. Vem si svı prachy zpátky.
			b_giveinvitems(self,other,itmi_gold,EHNIM_MOLERATFETTOFFER);
			if(Npc_IsDead(egill) == FALSE)
			{
				AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_04");	//Vsadím se, e to mùj brácha udìlá znovu. Ten bastard.
				AI_StopProcessInfos(self);
				other.aivar[AIV_INVINCIBLE] = FALSE;
				b_attack(self,egill,AR_NONE,0);
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_05");	//No to je bezvadnı. Nejdøív chceš udìlat velkej kšeft a pak nemáš dost prachù. Ztra se.
	};
	AI_StopProcessInfos(self);
};

func void dia_ehnim_moleratfett_was_fett_habenwill_zuviel()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_15_00");	//To je pøíliš.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_12_01");	//Fajn, fajn. Tak teda 70 zlatıch. Ale to je moje poslední nabídka.
	EHNIM_MOLERATFETTOFFER = 70;
	Info_ClearChoices(dia_ehnim_moleratfett);
	Info_AddChoice(dia_ehnim_moleratfett,"To je ještì poøád moc.",dia_ehnim_moleratfett_was_fett_habenwill_zuviel_immernoch);
	Info_AddChoice(dia_ehnim_moleratfett,"Dohodnuto.",dia_ehnim_moleratfett_was_fett_habenwill_ja);
};

func void dia_ehnim_moleratfett_was_fett_habenwill_zuviel_immernoch()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_immernoch_15_00");	//To je ještì poøád moc.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_immernoch_12_01");	//(naštvanì) Tak si trhni. Mìj se.
	AI_StopProcessInfos(self);
};

func void dia_ehnim_moleratfett_nein()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_nein_15_00");	//Právì teï nemám èas.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_nein_12_01");	//Nenech se zdrovat, chlape.
	AI_StopProcessInfos(self);
};


instance DIA_EHNIM_PERMKAP3(C_INFO)
{
	npc = bau_944_ehnim;
	condition = dia_ehnim_permkap3_condition;
	information = dia_ehnim_permkap3_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_ehnim_permkap3_condition()
{
	if(Npc_KnowsInfo(other,dia_ehnim_moleratfett) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_ehnim_permkap3_info()
{
	AI_Output(self,other,"DIA_Ehnim_PERMKAP3_12_00");	//Teï nemám èas.
	AI_StopProcessInfos(self);
};


instance DIA_EHNIM_PICKPOCKET(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 900;
	condition = dia_ehnim_pickpocket_condition;
	information = dia_ehnim_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_ehnim_pickpocket_condition()
{
	return c_beklauen(76,35);
};

func void dia_ehnim_pickpocket_info()
{
	Info_ClearChoices(dia_ehnim_pickpocket);
	Info_AddChoice(dia_ehnim_pickpocket,DIALOG_BACK,dia_ehnim_pickpocket_back);
	Info_AddChoice(dia_ehnim_pickpocket,DIALOG_PICKPOCKET,dia_ehnim_pickpocket_doit);
};

func void dia_ehnim_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_ehnim_pickpocket);
};

func void dia_ehnim_pickpocket_back()
{
	Info_ClearChoices(dia_ehnim_pickpocket);
};

