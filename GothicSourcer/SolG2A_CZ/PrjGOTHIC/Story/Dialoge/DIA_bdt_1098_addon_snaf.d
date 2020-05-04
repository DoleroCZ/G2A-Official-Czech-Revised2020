
instance DIA_ADDON_SNAF_EXIT(C_INFO)
{
	npc = bdt_1098_addon_snaf;
	nr = 999;
	condition = dia_addon_snaf_exit_condition;
	information = dia_addon_snaf_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_snaf_exit_condition()
{
	return TRUE;
};

func void dia_addon_snaf_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SNAF_PICKPOCKET(C_INFO)
{
	npc = bdt_1098_addon_snaf;
	nr = 900;
	condition = dia_addon_snaf_pickpocket_condition;
	information = dia_addon_snaf_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_addon_snaf_pickpocket_condition()
{
	return c_beklauen(49,56);
};

func void dia_addon_snaf_pickpocket_info()
{
	Info_ClearChoices(dia_addon_snaf_pickpocket);
	Info_AddChoice(dia_addon_snaf_pickpocket,DIALOG_BACK,dia_addon_snaf_pickpocket_back);
	Info_AddChoice(dia_addon_snaf_pickpocket,DIALOG_PICKPOCKET,dia_addon_snaf_pickpocket_doit);
};

func void dia_addon_snaf_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_snaf_pickpocket);
};

func void dia_addon_snaf_pickpocket_back()
{
	Info_ClearChoices(dia_addon_snaf_pickpocket);
};


instance DIA_ADDON_SNAF_HI(C_INFO)
{
	npc = bdt_1098_addon_snaf;
	nr = 1;
	condition = dia_addon_snaf_hi_condition;
	information = dia_addon_snaf_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_snaf_hi_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_snaf_hi_info()
{
	AI_Output(self,other,"DIA_Addon_Snaf_Hi_01_00");	//Chceš dostat najíst nebo po hubì? Co chceš?
};


instance DIA_ADDON_SNAF_COOK(C_INFO)
{
	npc = bdt_1098_addon_snaf;
	nr = 2;
	condition = dia_addon_snaf_cook_condition;
	information = dia_addon_snaf_cook_info;
	permanent = FALSE;
	description = "Co chutnýho máš?";
};


func int dia_addon_snaf_cook_condition()
{
	return TRUE;
};

func void dia_addon_snaf_cook_info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Cook_15_00");	//Co chutnýho máš?
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_01_01");	//Chci vyzkoušet novej recept - 'Ohnivé maso øiznuté silnou omáèkou'.
	Info_ClearChoices(dia_addon_snaf_cook);
	Info_AddChoice(dia_addon_snaf_cook,"Ohnivé maso?",dia_addon_snaf_cook_feuer);
	Info_AddChoice(dia_addon_snaf_cook,"Kladivová omáèka?",dia_addon_snaf_cook_hammer);
};

func void dia_addon_snaf_cook_feuer()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Cook_FEUER_15_00");	//Ohnivé maso?
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_FEUER_01_01");	//Køupavé lehce peèené maso, smícháno s ohnivým býlím.
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_FEUER_01_02");	//Neboj se - Ingredience už mám.
};

func void dia_addon_snaf_cook_hammer()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Cook_HAMMER_15_00");	//Kladivová omáèka?
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_HAMMER_01_01");	//Omáèka z fakt tvrdýho destilátu. Dostal jsem ten recept od chlápka jménem Lou.
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_HAMMER_01_02");	//Obstarej si pøísady a propašuj likér do laboratoøe nahoøe, potom udìlej omáèku. Co myslíš?
	Info_AddChoice(dia_addon_snaf_cook,"Nemám na to èas.",dia_addon_snaf_cook_no);
	Info_AddChoice(dia_addon_snaf_cook,"Dobøe, udìlám to.",dia_addon_snaf_cook_yes);
};

func void dia_addon_snaf_cook_no()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Cook_HAMMER_NO_15_00");	//Na to nemám èas.
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_HAMMER_NO_01_01");	//Dobøe, zapomeò na to.
	MIS_SNAFHAMMER = LOG_OBSOLETE;
	Info_ClearChoices(dia_addon_snaf_cook);
};

func void dia_addon_snaf_cook_yes()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Cook_HAMMER_YES_15_00");	//Dobøe, udìlám to.
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_HAMMER_YES_01_01");	//Vypadá to dobøe. Tady máš recept.
	b_giveinvitems(self,other,itwr_addon_lou_rezept,1);
	MIS_SNAFHAMMER = LOG_RUNNING;
	Info_ClearChoices(dia_addon_snaf_cook);
	Log_CreateTopic(TOPIC_ADDON_HAMMER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_HAMMER,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_HAMMER,"Snaf potøebuje destilát pro jeho omáèku. Dal mi recept na kladivový destilát, pøipravovaný na alchymistickém stole.");
};


var int snaf_tip_kosten;

instance DIA_ADDON_SNAF_BOOZE(C_INFO)
{
	npc = bdt_1098_addon_snaf;
	nr = 3;
	condition = dia_addon_snaf_booze_condition;
	information = dia_addon_snaf_booze_info;
	permanent = FALSE;
	description = "Udìlal jsem ten destilát.";
};


func int dia_addon_snaf_booze_condition()
{
	if((Npc_HasItems(other,itfo_addon_loushammer) >= 1) && (MIS_SNAFHAMMER == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_snaf_booze_info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Booze_15_00");	//Udìlal jsem ten destilát.
	b_giveinvitems(other,self,itfo_addon_loushammer,1);
	AI_Output(self,other,"DIA_Addon_Snaf_Booze_01_01");	//Skvìle, teï to dokonèím.
	AI_Output(self,other,"DIA_Addon_Snaf_Booze_01_02");	//Teï mùžeš jednu porci ochutnat. Zesílí ti to paže.
	AI_Output(self,other,"DIA_Addon_Snaf_Booze_01_03");	//Poèkej, až budeš pøístì nìco potøebovat ... všechny informace jsou zdarma.
	SNAF_TIP_KOSTEN = 0;
	b_giveinvitems(self,other,itfo_addon_firestew,1);
	MIS_SNAFHAMMER = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_LOUSHAMMER);
};


instance DIA_ADDON_SNAF_ATTENTAT(C_INFO)
{
	npc = bdt_1098_addon_snaf;
	nr = 4;
	condition = dia_addon_snaf_attentat_condition;
	information = dia_addon_snaf_attentat_info;
	permanent = FALSE;
	description = "Co víš o té vraždì?";
};


func int dia_addon_snaf_attentat_condition()
{
	if(MIS_JUDAS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_snaf_attentat_info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Attentat_15_00");	//Co víš o té vraždì?
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_01_01");	//Estebanùv pøípad?
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_01_02");	//Víš odkud vítr vane. Barman pozoruje všechno, ale k nikomu se nepøídává ...
	Info_ClearChoices(dia_addon_snaf_attentat);
	Info_AddChoice(dia_addon_snaf_attentat,"Tak mi aspoò øekni, kde seženu infromace",dia_addon_snaf_attentat_gowhere);
	Info_AddChoice(dia_addon_snaf_attentat,"Kdybys byl já, co bys udìlal?",dia_addon_snaf_attentat_youbeingme);
	Info_AddChoice(dia_addon_snaf_attentat,"Takže nìco víš?",dia_addon_snaf_attentat_something);
};

func void dia_addon_snaf_attentat_something()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Attentat_Something_15_00");	//Takže nìco víš?
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_Something_01_01");	//TO jsem neøekl.
};

func void dia_addon_snaf_attentat_gowhere()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Attentat_GoWhere_15_00");	//Tak mi aspoò øekni, kde získat informace.
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_GoWhere_01_01");	//Mùj bože! To by bylo stejný! Zapomeò na to.
};

func void dia_addon_snaf_attentat_youbeingme()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Attentat_YouBeingMe_15_00");	//Kdybys byl já, co bys udìlal?
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_YouBeingMe_01_01");	//Snažil bych si vzpomenout, co víš o šéfovi..
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_YouBeingMe_01_02");	//Zaprvé. Byl to samozøejmì jeden z banditù, to znamená, je tady v táboøe.
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_YouBeingMe_01_03");	//Za druhé: Od té doby, co je dotyèný zde v táboøe, tì sleduje.
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_YouBeingMe_01_04");	//Za tøetí: Bude-li pøesvìdèený, že jsi na Estebanovì stranì, neodkryje svou totožnost.
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_YouBeingMe_01_05");	//Zajímavá otázka je, jaké jsou tvé šance najít zamìstnavatele.
	Info_ClearChoices(dia_addon_snaf_attentat);
};


instance DIA_ADDON_SNAF_ABRECHNUNG(C_INFO)
{
	npc = bdt_1098_addon_snaf;
	nr = 5;
	condition = dia_addon_snaf_abrechnung_condition;
	information = dia_addon_snaf_abrechnung_info;
	permanent = TRUE;
	description = "Jaké jsou mé šance najít šéfa?";
};


func int dia_addon_snaf_abrechnung_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_snaf_attentat) && (MIS_JUDAS == LOG_RUNNING) && (HUNO_ZUSNAF == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_snaf_abrechnung_info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Abrechnung_15_00");	//Jaké jsou mé šance najít šéfa?
	AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_01");	//Hmmm ...
	if((SENYAN_ERPRESSUNG == LOG_RUNNING) && !Npc_IsDead(senyan))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_02");	//Velmi špatný. Nìkteøí chlápci si všimli, že jsi se motal kolem Seynana.
		AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_03");	//Mìl bys ses vzdát svýho kontaktu, jinak nemáš žádnou šanci, nájit šéfa vraždy.
		if(SNAF_TIP_SENYAN == FALSE)
		{
			b_logentry(TOPIC_ADDON_SENYAN,"Mìl bych ukonèit Senyanovu práci. Nicménì bylo by nemoudré zaútoèit na nìj hlava nehlava. Mìl bych s ním naposled promluvit.");
			SNAF_TIP_SENYAN = TRUE;
		};
	}
	else if(Npc_IsDead(senyan))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_04");	//Mìl bys sejmout jednoho z Estebanových lidí. Èlovìk kterého hledáš, bude vìøit, že jsi na jeho stranì.
		AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_05");	//Ale jen tak svou identitu neukáže. Musíš toho rozlousknout mnohem víc.
	}
	else
	{
		if(FINN_PETZT == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_06");	//Vypadá to že Finn je velmi rozrušen, poté co jsi s ním mluvil.
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_07");	//A všichni ví, že má blízko k Estebanovi.
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_08");	//To znamená, že jsi øekl nìco, co nechtìl slyšet.
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_09");	//Èlovìk kterého hledáš, bude velmi pobavený ...
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_10");	//Ale riskujeme život, když pobìžíme za Estebanem - (ironicky) ale to víš sám.
		};
		if(FINN_TELLALL == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_11");	//Vypadá to, že bys mìl øíct Finnovi, že pracuješ pro Estebana.
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_12");	//Nevím co dìláš, ale èlovìk kterého hledáš, si bude dávat vìtší pozor.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_13");	//Možný je všechno.
		};
	};
	if(SNAF_RECHNUNG == FALSE)
	{
		if(SNAF_EINMAL == FALSE)
		{
			AI_Output(other,self,"DIA_Addon_Snaf_Abschied_15_14");	//Díky.
			AI_Output(self,other,"DIA_Addon_Snaf_Abschied_01_15");	//(drsnì) Hej! Neøeknu ti nic než to, co jsi vìdìl pøedtím, chápeš?
			SNAF_EINMAL = TRUE;
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Snaf_Abschied_15_16");	//Vìdìl jsem to ...
			AI_Output(self,other,"DIA_Addon_Snaf_Abschied_01_17");	//Pøesnì.
		};
	};
};


instance DIA_ADDON_SNAF_HOCH(C_INFO)
{
	npc = bdt_1098_addon_snaf;
	nr = 6;
	condition = dia_addon_snaf_hoch_condition;
	information = dia_addon_snaf_hoch_info;
	permanent = FALSE;
	description = "Huno øíkal, že tu nìkoho potkám ...";
};


func int dia_addon_snaf_hoch_condition()
{
	if(HUNO_ZUSNAF == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_snaf_hoch_info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_HOCH_15_00");	//Poslal mì Huno.
	AI_Output(self,other,"DIA_Addon_Snaf_HOCH_01_01");	//Vypadá to, že jsi našel svýho èlovìka.
	AI_Output(self,other,"DIA_Addon_Snaf_HOCH_01_02");	//Jdi nahoru, nìkdo tam na tebe èeká.
	AI_StopProcessInfos(self);
	AI_Teleport(fisk,"BL_INN_UP_06");
	b_startotherroutine(fisk,"MEETING");
	b_giveplayerxp(XP_ADDON_AUFTRAGGEBER);
};


var int kosten_einmal;

instance DIA_ADDON_SNAF_PEOPLE(C_INFO)
{
	npc = bdt_1098_addon_snaf;
	nr = 6;
	condition = dia_addon_snaf_people_condition;
	information = dia_addon_snaf_people_info;
	permanent = TRUE;
	description = "Co si lidé myslí o Estebanovi?";
};


func int dia_addon_snaf_people_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_snaf_attentat) && !Npc_IsDead(esteban))
	{
		return TRUE;
	};
};

func void dia_addon_snaf_people_info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_15_00");	//Co si lidé myslí o Estebanovi?
	AI_Output(self,other,"DIA_Addon_Snaf_People_01_01");	//Musíš to upøesnit ...
	if((KOSTEN_EINMAL == FALSE) && (MIS_SNAFHAMMER != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_01_02");	//Každá informace nìco stojí.
		AI_Output(other,self,"DIA_Addon_Snaf_People_15_03");	//Kolik?
		AI_Output(self,other,"DIA_Addon_Snaf_People_01_04");	//10 zlatých.
		SNAF_TIP_KOSTEN = 10;
		KOSTEN_EINMAL = TRUE;
	};
	Info_ClearChoices(dia_addon_snaf_people);
	Info_AddChoice(dia_addon_snaf_people,DIALOG_BACK,dia_addon_snaf_people_back);
	Info_AddChoice(dia_addon_snaf_people,"Paul.",dia_addon_snaf_people_paul);
	Info_AddChoice(dia_addon_snaf_people,"Huno.",dia_addon_snaf_people_huno);
	Info_AddChoice(dia_addon_snaf_people,"Fisk.",dia_addon_snaf_people_fisk);
	Info_AddChoice(dia_addon_snaf_people,"Emilio.",dia_addon_snaf_people_emilio);
	if(!Npc_IsDead(senyan))
	{
		Info_AddChoice(dia_addon_snaf_people,"Senyan.",dia_addon_snaf_people_senyan);
	};
	Info_AddChoice(dia_addon_snaf_people,"Lennar.",dia_addon_snaf_people_lennar);
	Info_AddChoice(dia_addon_snaf_people,"Finn.",dia_addon_snaf_people_finn);
};

func void b_addon_snaf_notenough()
{
	AI_Output(self,other,"DIA_Addon_Snaf_NotEnough_01_00");	//Nemáš dost penìz, chlapèe!
};

func void dia_addon_snaf_people_back()
{
	Info_ClearChoices(dia_addon_snaf_people);
};

func void dia_addon_snaf_people_paul()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Paul_15_00");	//Co Paul?
	if(b_giveinvitems(other,self,itmi_gold,SNAF_TIP_KOSTEN))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_Paul_01_01");	//Myslím, že nemá Estabana moc v lásce. Od té doby, co pracuje pro Huna, nemùže už do dolu.
	}
	else
	{
		b_addon_snaf_notenough();
	};
};

func void dia_addon_snaf_people_huno()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Huno_15_00");	//Co si o Estebanovi myslí Huno?
	AI_Output(self,other,"DIA_Addon_Snaf_People_Huno_01_01");	//Á! Huno. Nevím o nìm skoro nic.
	AI_Output(self,other,"DIA_Addon_Snaf_People_Huno_01_02");	//(úsmìv) Tahle informace je zdarma.
};

func void dia_addon_snaf_people_fisk()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Fisk_15_00");	//Co Fisk?
	if(b_giveinvitems(other,self,itmi_gold,SNAF_TIP_KOSTEN))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_Fisk_01_01");	//Fisk je Fisk. Platí svou èástku Estebanovi a dìlí se o jeho zboží, které vìtšinou dostane od pirátù.
		AI_Output(self,other,"DIA_Addon_Snaf_People_Fisk_01_02");	//Myslím, že se o Estebana nezajímá.
	}
	else
	{
		b_addon_snaf_notenough();
	};
};

func void dia_addon_snaf_people_emilio()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Emilio_15_00");	//Emilio. Co ten si myslí o Estebanovi?
	if(b_giveinvitems(other,self,itmi_gold,SNAF_TIP_KOSTEN))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_Emilio_01_01");	//Myslím, že by nenosil kytky na Estebanùv hrob, doufám že víš, co tím myslím.
	}
	else
	{
		b_addon_snaf_notenough();
	};
};

func void dia_addon_snaf_people_senyan()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Senyan_15_00");	//Co Senyan?
	if(b_giveinvitems(other,self,itmi_gold,SNAF_TIP_KOSTEN))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_Senyan_01_01");	//Senyan je jeden z Estebanových chlápkù. Chvíli pro nìj pracuje.
	}
	else
	{
		b_addon_snaf_notenough();
	};
};

func void dia_addon_snaf_people_lennar()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Lennar_15_00");	//Co si Lennar myslí o Estebanovi?
	AI_Output(self,other,"DIA_Addon_Snaf_People_Lennar_01_01");	//Pokud vím, Lennar NEMYSLÍ.
};

func void dia_addon_snaf_people_finn()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Finn_15_00");	//Co Finn?
	if(b_giveinvitems(other,self,itmi_gold,SNAF_TIP_KOSTEN))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_Finn_01_01");	//Dobrej kopáè. Má na zlato èuch.
		AI_Output(self,other,"DIA_Addon_Snaf_People_Finn_01_02");	//Esteban dává pøednost z tohoto dùvodu jemu. Myslím, že si navzájem celkem rozumnìjí.
	}
	else
	{
		b_addon_snaf_notenough();
	};
};


instance DIA_ADDON_SNAF_HIMSELF(C_INFO)
{
	npc = bdt_1098_addon_snaf;
	nr = 7;
	condition = dia_addon_snaf_himself_condition;
	information = dia_addon_snaf_himself_info;
	permanent = FALSE;
	description = "Co si myslíš o Estebanovi?";
};


func int dia_addon_snaf_himself_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_snaf_attentat) && !Npc_IsDead(esteban))
	{
		return TRUE;
	};
};

func void dia_addon_snaf_himself_info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Himself_15_00");	//Co si myslíš o Estebanovi?
	AI_Output(self,other,"DIA_Addon_Snaf_Himself_01_01");	//Ten kdo o nìm mluví, bude brzo mrtvej ...
};


instance DIA_ADDON_SNAF_PERM(C_INFO)
{
	npc = bdt_1098_addon_snaf;
	nr = 8;
	condition = dia_addon_snaf_perm_condition;
	information = dia_addon_snaf_perm_info;
	permanent = TRUE;
	description = "Jak to jde s tvým krámem?";
};


func int dia_addon_snaf_perm_condition()
{
	if(Npc_IsDead(esteban))
	{
		return TRUE;
	};
};

func void dia_addon_snaf_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_PERM_15_00");	//Jak to jde s tvým krámem?
	AI_Output(self,other,"DIA_Addon_Snaf_PERM_01_01");	//Dobøe! Estebanova smrt je pro pár lidí dùvod k oslavì ...
};

