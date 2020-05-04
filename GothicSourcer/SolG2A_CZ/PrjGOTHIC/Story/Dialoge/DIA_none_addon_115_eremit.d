
instance DIA_ADDON_EREMIT_EXIT(C_INFO)
{
	npc = none_addon_115_eremit;
	nr = 999;
	condition = dia_addon_eremit_exit_condition;
	information = dia_addon_eremit_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_eremit_exit_condition()
{
	return TRUE;
};

func void dia_addon_eremit_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_EREMIT_HELLO(C_INFO)
{
	npc = none_addon_115_eremit;
	nr = 1;
	condition = dia_addon_eremit_hello_condition;
	information = dia_addon_eremit_hello_info;
	important = TRUE;
};


func int dia_addon_eremit_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_eremit_hello_info()
{
	AI_Output(other,self,"DIA_Addon_Eremit_Add_15_00");	//(Pøekvapenì) Co tady dìláš?
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_00");	//Co tu dìlám?! A na kterého èerta jsi tu prosím tì ty?
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_01");	//Šel jsem co do nejodlehlejší èásti ostrova, abych mìl klid.
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_02");	//Obèanská válka, útoèící banditi, hordy skøetù skoro na prahu ...
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_03");	//To není pro mì. Nikdy víc. Vypadl jsem z toho šílenství.
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_04");	//Tam je taky pár skøetù, ale ti jsou daleko a není jich tolik.
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_05");	//A ostatní lidé sem - díky Innosovi - nechodí. (mrzutì) Dodnes.
};


instance DIA_ADDON_EREMIT_SEEKTAFELN(C_INFO)
{
	npc = none_addon_115_eremit;
	nr = 2;
	condition = dia_addon_eremit_seektafeln_condition;
	information = dia_addon_eremit_seektafeln_info;
	description = "Hledám kamenné desky. Nenašels náhodou nìjaké?";
};


func int dia_addon_eremit_seektafeln_condition()
{
	return TRUE;
};

func void dia_addon_eremit_seektafeln_info()
{
	AI_Output(other,self,"DIA_Addon_Eremit_Add_15_02");	//Hledám kamenné desky. Nenašels náhodou nìjaké?
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_06");	//No jo ... Ale nechám si je!
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_07");	//Jsou tu jedinou vìcí, kterou mám, tak je ètu.
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_08");	//Zatím všemu nerozumím, ale nekteré jsem už dešifroval.
};


var int eremit_teach_once;

instance DIA_ADDON_EREMIT_TEACH(C_INFO)
{
	npc = none_addon_115_eremit;
	nr = 3;
	condition = dia_addon_eremit_teach_condition;
	information = dia_addon_eremit_teach_info;
	permanent = TRUE;
	description = "O kamenných deskách ...";
};


func int dia_addon_eremit_teach_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_eremit_seektafeln) && (EREMIT_TEACH_ONCE == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_eremit_teach_info()
{
	AI_Output(other,self,"DIA_Addon_Eremit_Add_15_03");	//O kamenných deskách ...
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_25");	//Mohl bych tì nìco o tom nauèit?
	if(MIS_EREMIT_KLAMOTTEN != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_26");	//(rychle) Ale ty mé desky nedostaneš! Budeš si muset sehnat vlastní.
	};
	Info_ClearChoices(dia_addon_eremit_teach);
	Info_AddChoice(dia_addon_eremit_teach,DIALOG_BACK,dia_addon_eremit_teach_no);
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	{
		Info_AddChoice(dia_addon_eremit_teach,b_buildlearnstring(NAME_ADDON_LEARNLANGUAGE_1,b_getlearncosttalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_1)),dia_addon_eremit_teach_yes);
	}
	else if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE))
	{
		Info_AddChoice(dia_addon_eremit_teach,b_buildlearnstring(NAME_ADDON_LEARNLANGUAGE_2,b_getlearncosttalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_2)),dia_addon_eremit_teach_yes);
	}
	else if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE))
	{
		Info_AddChoice(dia_addon_eremit_teach,b_buildlearnstring(NAME_ADDON_LEARNLANGUAGE_3,b_getlearncosttalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_3)),dia_addon_eremit_teach_yes);
	};
};

func void b_addon_eremit_teachlanguage()
{
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_27");	//Je to docela jednoduché, sleduj. 'G' je 'O',  'T' je 'H' , 'I' je 'C'.
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_28");	//Jak to jednou udìláš, zbytek tì napadne sám ...
	EREMIT_TEACH_ONCE = TRUE;
};

func void dia_addon_eremit_teach_no()
{
	Info_ClearChoices(dia_addon_eremit_teach);
};

func void dia_addon_eremit_teach_yes()
{
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_29");	//Myslím, že už tì nic nemùžu nauèit ...
		EREMIT_TEACH_ONCE = TRUE;
	}
	else if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE)
	{
		if(b_teachplayertalentforeignlanguage(self,other,LANGUAGE_3))
		{
			b_addon_eremit_teachlanguage();
		};
	}
	else if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		if(b_teachplayertalentforeignlanguage(self,other,LANGUAGE_2))
		{
			b_addon_eremit_teachlanguage();
		};
	}
	else if(b_teachplayertalentforeignlanguage(self,other,LANGUAGE_1))
	{
		b_addon_eremit_teachlanguage();
	};
};


instance DIA_ADDON_EREMIT_KLAMOTTEN(C_INFO)
{
	npc = none_addon_115_eremit;
	nr = 4;
	condition = dia_addon_eremit_klamotten_condition;
	information = dia_addon_eremit_klamotten_info;
	permanent = TRUE;
	description = "Nìco pro tebe mám ...";
};


func int dia_addon_eremit_klamotten_condition()
{
	if(MIS_EREMIT_KLAMOTTEN == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_eremit_klamotten_info()
{
	AI_Output(other,self,"DIA_Addon_Eremit_Add_15_01");	//Nìco pro tebe mám ...
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_19");	//Opravdu? Dej mi to! Podíváme se, zda-li se to bude hodit.
	Info_ClearChoices(dia_addon_eremit_klamotten);
	Info_AddChoice(dia_addon_eremit_klamotten,DIALOG_BACK,dia_addon_eremit_klamotten_back);
	if(Npc_HasItems(other,itar_pir_l_addon) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej Lehké pirátské brnìní",dia_addon_eremit_klamotten_pir_l);
	};
	if(Npc_HasItems(other,itar_pir_m_addon) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej Støední pirátské brnìní",dia_addon_eremit_klamotten_pir_m);
	};
	if(Npc_HasItems(other,itar_pir_h_addon) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej Kapitánské brnìní",dia_addon_eremit_klamotten_pir_h);
	};
	if(Npc_HasItems(other,itar_ranger_addon) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej brnìní kruhu vody",dia_addon_eremit_klamotten_ranger);
	};
	if(Npc_HasItems(other,itar_kdw_l_addon) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej Lehké roucho mága vody",dia_addon_eremit_klamotten_kdw_l);
	};
	if(Npc_HasItems(other,itar_kdw_h) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej Tìžké roucho mága vody",dia_addon_eremit_klamotten_kdw_h);
	};
	if(Npc_HasItems(other,itar_governor) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej Guvernérovu kazajku",dia_addon_eremit_klamotten_governor);
	};
	if(Npc_HasItems(other,itar_judge) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej Soudcovu róbu",dia_addon_eremit_klamotten_judge);
	};
	if(Npc_HasItems(other,itar_smith) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej Kováøskou zástìru",dia_addon_eremit_klamotten_smith);
	};
	if(Npc_HasItems(other,itar_barkeeper) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej Hospodáøskoou zástìru",dia_addon_eremit_klamotten_barkeeper);
	};
	if(Npc_HasItems(other,itar_vlk_l) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej Mìšanský odìv I",dia_addon_eremit_klamotten_vlk_l);
	};
	if(Npc_HasItems(other,itar_vlk_m) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej Mìšanský odìv II",dia_addon_eremit_klamotten_vlk_m);
	};
	if(Npc_HasItems(other,itar_vlk_h) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej Mìšanský odìv III",dia_addon_eremit_klamotten_vlk_h);
	};
	if(Npc_HasItems(other,itar_vlkbabe_l) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej Mìšanský šat I",dia_addon_eremit_klamotten_vlkbabe_l);
	};
	if(Npc_HasItems(other,itar_vlkbabe_m) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej Mìšanský šat II",dia_addon_eremit_klamotten_vlkbabe_m);
	};
	if(Npc_HasItems(other,itar_vlkbabe_h) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej Mìšanský šat III",dia_addon_eremit_klamotten_vlkbabe_h);
	};
	if(Npc_HasItems(other,itar_pal_skel) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej Staré paladinské brnìní",dia_addon_eremit_klamotten_pal_skel);
	};
	if(Npc_HasItems(other,itar_bau_l) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej Lehký farmáøský odìv",dia_addon_eremit_klamotten_bau_l);
	};
	if(Npc_HasItems(other,itar_bau_m) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej Støední farmáøský odìv",dia_addon_eremit_klamotten_bau_m);
	};
	if(Npc_HasItems(other,itar_baubabe_l) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej Lehký farmáøský šat",dia_addon_eremit_klamotten_baubabe_l);
	};
	if(Npc_HasItems(other,itar_baubabe_m) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej Støední farmáøský šat",dia_addon_eremit_klamotten_baubabe_m);
	};
	if(Npc_HasItems(other,itar_djg_crawler) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej Zbroj z krunýøe dùlního èerva",dia_addon_eremit_klamotten_djg_crawler);
	};
	if(Npc_HasItems(other,itar_leather_l) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej Kožené brnìní",dia_addon_eremit_klamotten_leather);
	};
	if(Npc_HasItems(other,itar_xardas) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej Roucho temných umìní",dia_addon_eremit_klamotten_xardas);
	};
	if(Npc_HasItems(other,itar_lester) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej Lesterovo roucho",dia_addon_eremit_klamotten_lester);
	};
	if(Npc_HasItems(other,itar_diego) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej Diegovo brnìní",dia_addon_eremit_klamotten_diego);
	};
	if(Npc_HasItems(other,itar_corangar) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej Cor'Angarovu zbroj",dia_addon_eremit_klamotten_corangar);
	};
	if(Npc_HasItems(other,itar_prisoner) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej Kalhoty kopáèe",dia_addon_eremit_klamotten_prisoner);
	};
	if(Npc_HasItems(other,itar_dementor) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej Pátraèovo roucho",dia_addon_eremit_klamotten_dementor);
	};
};

func void b_eremit_tatsache()
{
	AI_EquipBestArmor(self);
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_20");	//Jako ulité!
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_21");	//Hmm, co bych ti mohl dát? Všechno zlato jsem dal pirátùm za vstup.
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_22");	//Mùžu ti dát nìjaké staré kamenné desky.
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_23");	//Na, ber. Já si mùžu najít další.
	b_giveinvitems(self,other,itwr_dexstoneplate3_addon,1);
	b_giveinvitems(self,other,itwr_stoneplatecommon_addon,1);
	MIS_EREMIT_KLAMOTTEN = LOG_SUCCESS;
	b_giveplayerxp(200);
	Info_ClearChoices(dia_addon_eremit_klamotten);
};

func void dia_addon_eremit_klamotten_back()
{
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_24");	//Skvìlé. První zvýšila mou nedoèkavost a pak ... (povzdechne si)
	Info_ClearChoices(dia_addon_eremit_klamotten);
};

func void dia_addon_eremit_klamotten_pir_l()
{
	b_giveinvitems(other,self,itar_pir_l_addon,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_pir_m()
{
	b_giveinvitems(other,self,itar_pir_m_addon,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_pir_h()
{
	b_giveinvitems(other,self,itar_pir_h_addon,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_thorus()
{
	b_giveinvitems(other,self,itar_thorus_addon,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_orebaron()
{
	b_giveinvitems(other,self,itar_orebaron_addon,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_bloodwyn()
{
	b_giveinvitems(other,self,itar_bloodwyn_addon,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_raven()
{
	b_giveinvitems(other,self,itar_raven_addon,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_ranger()
{
	b_giveinvitems(other,self,itar_ranger_addon,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_kdw_l()
{
	b_giveinvitems(other,self,itar_kdw_l_addon,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_kdw_h()
{
	b_giveinvitems(other,self,itar_kdw_h,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_governor()
{
	b_giveinvitems(other,self,itar_governor,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_judge()
{
	b_giveinvitems(other,self,itar_judge,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_smith()
{
	b_giveinvitems(other,self,itar_smith,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_barkeeper()
{
	b_giveinvitems(other,self,itar_barkeeper,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_vlk_l()
{
	b_giveinvitems(other,self,itar_vlk_l,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_vlk_m()
{
	b_giveinvitems(other,self,itar_vlk_m,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_vlk_h()
{
	b_giveinvitems(other,self,itar_vlk_h,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_vlkbabe_l()
{
	b_giveinvitems(other,self,itar_vlkbabe_l,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_vlkbabe_m()
{
	b_giveinvitems(other,self,itar_vlkbabe_m,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_vlkbabe_h()
{
	b_giveinvitems(other,self,itar_vlkbabe_h,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_mil_l()
{
	b_giveinvitems(other,self,itar_mil_l,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_mil_m()
{
	b_giveinvitems(other,self,itar_mil_m,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_pal_m()
{
	b_giveinvitems(other,self,itar_pal_m,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_pal_h()
{
	b_giveinvitems(other,self,itar_pal_h,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_pal_skel()
{
	b_giveinvitems(other,self,itar_pal_skel,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_bau_l()
{
	b_giveinvitems(other,self,itar_bau_l,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_bau_m()
{
	b_giveinvitems(other,self,itar_bau_m,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_baubabe_l()
{
	b_giveinvitems(other,self,itar_baubabe_l,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_baubabe_m()
{
	b_giveinvitems(other,self,itar_baubabe_m,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_sld_l()
{
	b_giveinvitems(other,self,itar_sld_l,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_sld_m()
{
	b_giveinvitems(other,self,itar_sld_m,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_sld_h()
{
	b_giveinvitems(other,self,itar_sld_h,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_djg_crawler()
{
	b_giveinvitems(other,self,itar_djg_crawler,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_djg_l()
{
	b_giveinvitems(other,self,itar_djg_l,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_djg_m()
{
	b_giveinvitems(other,self,itar_djg_m,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_djg_h()
{
	b_giveinvitems(other,self,itar_djg_h,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_nov_l()
{
	b_giveinvitems(other,self,itar_nov_l,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_kdf_l()
{
	b_giveinvitems(other,self,itar_kdf_l,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_kdf_h()
{
	b_giveinvitems(other,self,itar_kdf_h,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_leather()
{
	b_giveinvitems(other,self,itar_leather_l,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_bdt_m()
{
	b_giveinvitems(other,self,itar_bdt_m,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_bdt_h()
{
	b_giveinvitems(other,self,itar_bdt_h,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_xardas()
{
	b_giveinvitems(other,self,itar_xardas,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_lester()
{
	b_giveinvitems(other,self,itar_lester,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_diego()
{
	b_giveinvitems(other,self,itar_diego,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_corangar()
{
	b_giveinvitems(other,self,itar_corangar,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_prisoner()
{
	b_giveinvitems(other,self,itar_prisoner,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_dementor()
{
	b_giveinvitems(other,self,itar_dementor,1);
	b_eremit_tatsache();
};


instance DIA_ADDON_EREMIT_PERM(C_INFO)
{
	npc = none_addon_115_eremit;
	nr = 99;
	condition = dia_addon_eremit_perm_condition;
	information = dia_addon_eremit_perm_info;
	permanent = TRUE;
	description = "Jaké je to žít jako poustevník?";
};


func int dia_addon_eremit_perm_condition()
{
	return TRUE;
};

func void dia_addon_eremit_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Eremit_Add_15_04");	//Jaké je to žít jako poustevník?
	if(MIS_EREMIT_KLAMOTTEN == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_09");	//(pyšnì) Dìlám si vše sám. Zbranì, nástroje, chatrè, prostì vše.
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_10");	//Pøišel jsem sem a nemìl jsem nic, ale má píle ...
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_11");	//Jinak ...
		AI_Output(other,self,"DIA_Addon_Eremit_Doppelt_15_01");	//Ano?
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_12");	//Nìkdy si pøeju, abych si s sebou vzal nìjaké obleèení.
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_13");	//Nevím nic o stahování zvíøat ...
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_14");	//A noci v této èásti ostrova nejsou zrovna nejteplejší.
		MIS_EREMIT_KLAMOTTEN = LOG_RUNNING;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_15");	//Vystaèím si.
		if(MIS_EREMIT_KLAMOTTEN == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Addon_Eremit_Add_04_18");	//S tìmito šaty pøežiju zimu a pak ... uvidíme ...
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Eremit_Add_04_16");	//Je to lepší jak v Khorinisu!
			AI_Output(self,other,"DIA_Addon_Eremit_Add_04_17");	//Dokonce bez pokrývek.
		};
	};
};

