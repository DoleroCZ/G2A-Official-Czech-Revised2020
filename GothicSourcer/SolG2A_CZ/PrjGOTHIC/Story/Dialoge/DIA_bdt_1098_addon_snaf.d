
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
	AI_Output(self,other,"DIA_Addon_Snaf_Hi_01_00");	//Chce� dostat naj�st nebo po hub�? Co chce�?
};


instance DIA_ADDON_SNAF_COOK(C_INFO)
{
	npc = bdt_1098_addon_snaf;
	nr = 2;
	condition = dia_addon_snaf_cook_condition;
	information = dia_addon_snaf_cook_info;
	permanent = FALSE;
	description = "Co chutn�ho m�?";
};


func int dia_addon_snaf_cook_condition()
{
	return TRUE;
};

func void dia_addon_snaf_cook_info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Cook_15_00");	//Co chutn�ho m�?
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_01_01");	//Chci vyzkou�et novej recept - 'Ohniv� maso �iznut� silnou om��kou'.
	Info_ClearChoices(dia_addon_snaf_cook);
	Info_AddChoice(dia_addon_snaf_cook,"Ohniv� maso?",dia_addon_snaf_cook_feuer);
	Info_AddChoice(dia_addon_snaf_cook,"Kladivov� om��ka?",dia_addon_snaf_cook_hammer);
};

func void dia_addon_snaf_cook_feuer()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Cook_FEUER_15_00");	//Ohniv� maso?
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_FEUER_01_01");	//K�upav� lehce pe�en� maso, sm�ch�no s ohniv�m b�l�m.
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_FEUER_01_02");	//Neboj se - Ingredience u� m�m.
};

func void dia_addon_snaf_cook_hammer()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Cook_HAMMER_15_00");	//Kladivov� om��ka?
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_HAMMER_01_01");	//Om��ka z fakt tvrd�ho destil�tu. Dostal jsem ten recept od chl�pka jm�nem Lou.
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_HAMMER_01_02");	//Obstarej si p��sady a propa�uj lik�r do laborato�e naho�e, potom ud�lej om��ku. Co mysl�?
	Info_AddChoice(dia_addon_snaf_cook,"Nem�m na to �as.",dia_addon_snaf_cook_no);
	Info_AddChoice(dia_addon_snaf_cook,"Dob�e, ud�l�m to.",dia_addon_snaf_cook_yes);
};

func void dia_addon_snaf_cook_no()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Cook_HAMMER_NO_15_00");	//Na to nem�m �as.
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_HAMMER_NO_01_01");	//Dob�e, zapome� na to.
	MIS_SNAFHAMMER = LOG_OBSOLETE;
	Info_ClearChoices(dia_addon_snaf_cook);
};

func void dia_addon_snaf_cook_yes()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Cook_HAMMER_YES_15_00");	//Dob�e, ud�l�m to.
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_HAMMER_YES_01_01");	//Vypad� to dob�e. Tady m� recept.
	b_giveinvitems(self,other,itwr_addon_lou_rezept,1);
	MIS_SNAFHAMMER = LOG_RUNNING;
	Info_ClearChoices(dia_addon_snaf_cook);
	Log_CreateTopic(TOPIC_ADDON_HAMMER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_HAMMER,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_HAMMER,"Snaf pot�ebuje destil�t pro jeho om��ku. Dal mi recept na kladivov� destil�t, p�ipravovan� na alchymistick�m stole.");
};


var int snaf_tip_kosten;

instance DIA_ADDON_SNAF_BOOZE(C_INFO)
{
	npc = bdt_1098_addon_snaf;
	nr = 3;
	condition = dia_addon_snaf_booze_condition;
	information = dia_addon_snaf_booze_info;
	permanent = FALSE;
	description = "Ud�lal jsem ten destil�t.";
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
	AI_Output(other,self,"DIA_Addon_Snaf_Booze_15_00");	//Ud�lal jsem ten destil�t.
	b_giveinvitems(other,self,itfo_addon_loushammer,1);
	AI_Output(self,other,"DIA_Addon_Snaf_Booze_01_01");	//Skv�le, te� to dokon��m.
	AI_Output(self,other,"DIA_Addon_Snaf_Booze_01_02");	//Te� m��e� jednu porci ochutnat. Zes�l� ti to pa�e.
	AI_Output(self,other,"DIA_Addon_Snaf_Booze_01_03");	//Po�kej, a� bude� p��st� n�co pot�ebovat ... v�echny informace jsou zdarma.
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
	description = "Co v� o t� vra�d�?";
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
	AI_Output(other,self,"DIA_Addon_Snaf_Attentat_15_00");	//Co v� o t� vra�d�?
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_01_01");	//Esteban�v p��pad?
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_01_02");	//V� odkud v�tr vane. Barman pozoruje v�echno, ale k nikomu se nep��d�v� ...
	Info_ClearChoices(dia_addon_snaf_attentat);
	Info_AddChoice(dia_addon_snaf_attentat,"Tak mi aspo� �ekni, kde se�enu infromace",dia_addon_snaf_attentat_gowhere);
	Info_AddChoice(dia_addon_snaf_attentat,"Kdybys byl j�, co bys ud�lal?",dia_addon_snaf_attentat_youbeingme);
	Info_AddChoice(dia_addon_snaf_attentat,"Tak�e n�co v�?",dia_addon_snaf_attentat_something);
};

func void dia_addon_snaf_attentat_something()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Attentat_Something_15_00");	//Tak�e n�co v�?
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_Something_01_01");	//TO jsem ne�ekl.
};

func void dia_addon_snaf_attentat_gowhere()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Attentat_GoWhere_15_00");	//Tak mi aspo� �ekni, kde z�skat informace.
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_GoWhere_01_01");	//M�j bo�e! To by bylo stejn�! Zapome� na to.
};

func void dia_addon_snaf_attentat_youbeingme()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Attentat_YouBeingMe_15_00");	//Kdybys byl j�, co bys ud�lal?
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_YouBeingMe_01_01");	//Sna�il bych si vzpomenout, co v� o ��fovi..
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_YouBeingMe_01_02");	//Zaprv�. Byl to samoz�ejm� jeden z bandit�, to znamen�, je tady v t�bo�e.
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_YouBeingMe_01_03");	//Za druh�: Od t� doby, co je doty�n� zde v t�bo�e, t� sleduje.
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_YouBeingMe_01_04");	//Za t�et�: Bude-li p�esv�d�en�, �e jsi na Estebanov� stran�, neodkryje svou toto�nost.
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_YouBeingMe_01_05");	//Zaj�mav� ot�zka je, jak� jsou tv� �ance naj�t zam�stnavatele.
	Info_ClearChoices(dia_addon_snaf_attentat);
};


instance DIA_ADDON_SNAF_ABRECHNUNG(C_INFO)
{
	npc = bdt_1098_addon_snaf;
	nr = 5;
	condition = dia_addon_snaf_abrechnung_condition;
	information = dia_addon_snaf_abrechnung_info;
	permanent = TRUE;
	description = "Jak� jsou m� �ance naj�t ��fa?";
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
	AI_Output(other,self,"DIA_Addon_Snaf_Abrechnung_15_00");	//Jak� jsou m� �ance naj�t ��fa?
	AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_01");	//Hmmm ...
	if((SENYAN_ERPRESSUNG == LOG_RUNNING) && !Npc_IsDead(senyan))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_02");	//Velmi �patn�. N�kte�� chl�pci si v�imli, �e jsi se motal kolem Seynana.
		AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_03");	//M�l bys ses vzd�t sv�ho kontaktu, jinak nem� ��dnou �anci, n�jit ��fa vra�dy.
		if(SNAF_TIP_SENYAN == FALSE)
		{
			b_logentry(TOPIC_ADDON_SENYAN,"M�l bych ukon�it Senyanovu pr�ci. Nicm�n� bylo by nemoudr� za�to�it na n�j hlava nehlava. M�l bych s n�m naposled promluvit.");
			SNAF_TIP_SENYAN = TRUE;
		};
	}
	else if(Npc_IsDead(senyan))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_04");	//M�l bys sejmout jednoho z Estebanov�ch lid�. �lov�k kter�ho hled�, bude v��it, �e jsi na jeho stran�.
		AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_05");	//Ale jen tak svou identitu neuk�e. Mus� toho rozlousknout mnohem v�c.
	}
	else
	{
		if(FINN_PETZT == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_06");	//Vypad� to �e Finn je velmi rozru�en, pot� co jsi s n�m mluvil.
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_07");	//A v�ichni v�, �e m� bl�zko k Estebanovi.
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_08");	//To znamen�, �e jsi �ekl n�co, co necht�l sly�et.
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_09");	//�lov�k kter�ho hled�, bude velmi pobaven� ...
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_10");	//Ale riskujeme �ivot, kdy� pob��me za Estebanem - (ironicky) ale to v� s�m.
		};
		if(FINN_TELLALL == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_11");	//Vypad� to, �e bys m�l ��ct Finnovi, �e pracuje� pro Estebana.
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_12");	//Nev�m co d�l�, ale �lov�k kter�ho hled�, si bude d�vat v�t�� pozor.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_13");	//Mo�n� je v�echno.
		};
	};
	if(SNAF_RECHNUNG == FALSE)
	{
		if(SNAF_EINMAL == FALSE)
		{
			AI_Output(other,self,"DIA_Addon_Snaf_Abschied_15_14");	//D�ky.
			AI_Output(self,other,"DIA_Addon_Snaf_Abschied_01_15");	//(drsn�) Hej! Ne�eknu ti nic ne� to, co jsi v�d�l p�edt�m, ch�pe�?
			SNAF_EINMAL = TRUE;
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Snaf_Abschied_15_16");	//V�d�l jsem to ...
			AI_Output(self,other,"DIA_Addon_Snaf_Abschied_01_17");	//P�esn�.
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
	description = "Huno ��kal, �e tu n�koho potk�m ...";
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
	AI_Output(other,self,"DIA_Addon_Snaf_HOCH_15_00");	//Poslal m� Huno.
	AI_Output(self,other,"DIA_Addon_Snaf_HOCH_01_01");	//Vypad� to, �e jsi na�el sv�ho �lov�ka.
	AI_Output(self,other,"DIA_Addon_Snaf_HOCH_01_02");	//Jdi nahoru, n�kdo tam na tebe �ek�.
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
	description = "Co si lid� mysl� o Estebanovi?";
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
	AI_Output(other,self,"DIA_Addon_Snaf_People_15_00");	//Co si lid� mysl� o Estebanovi?
	AI_Output(self,other,"DIA_Addon_Snaf_People_01_01");	//Mus� to up�esnit ...
	if((KOSTEN_EINMAL == FALSE) && (MIS_SNAFHAMMER != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_01_02");	//Ka�d� informace n�co stoj�.
		AI_Output(other,self,"DIA_Addon_Snaf_People_15_03");	//Kolik?
		AI_Output(self,other,"DIA_Addon_Snaf_People_01_04");	//10 zlat�ch.
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
	AI_Output(self,other,"DIA_Addon_Snaf_NotEnough_01_00");	//Nem� dost pen�z, chlap�e!
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
		AI_Output(self,other,"DIA_Addon_Snaf_People_Paul_01_01");	//Mysl�m, �e nem� Estabana moc v l�sce. Od t� doby, co pracuje pro Huna, nem��e u� do dolu.
	}
	else
	{
		b_addon_snaf_notenough();
	};
};

func void dia_addon_snaf_people_huno()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Huno_15_00");	//Co si o Estebanovi mysl� Huno?
	AI_Output(self,other,"DIA_Addon_Snaf_People_Huno_01_01");	//�! Huno. Nev�m o n�m skoro nic.
	AI_Output(self,other,"DIA_Addon_Snaf_People_Huno_01_02");	//(�sm�v) Tahle informace je zdarma.
};

func void dia_addon_snaf_people_fisk()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Fisk_15_00");	//Co Fisk?
	if(b_giveinvitems(other,self,itmi_gold,SNAF_TIP_KOSTEN))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_Fisk_01_01");	//Fisk je Fisk. Plat� svou ��stku Estebanovi a d�l� se o jeho zbo��, kter� v�t�inou dostane od pir�t�.
		AI_Output(self,other,"DIA_Addon_Snaf_People_Fisk_01_02");	//Mysl�m, �e se o Estebana nezaj�m�.
	}
	else
	{
		b_addon_snaf_notenough();
	};
};

func void dia_addon_snaf_people_emilio()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Emilio_15_00");	//Emilio. Co ten si mysl� o Estebanovi?
	if(b_giveinvitems(other,self,itmi_gold,SNAF_TIP_KOSTEN))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_Emilio_01_01");	//Mysl�m, �e by nenosil kytky na Esteban�v hrob, douf�m �e v�, co t�m mysl�m.
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
		AI_Output(self,other,"DIA_Addon_Snaf_People_Senyan_01_01");	//Senyan je jeden z Estebanov�ch chl�pk�. Chv�li pro n�j pracuje.
	}
	else
	{
		b_addon_snaf_notenough();
	};
};

func void dia_addon_snaf_people_lennar()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Lennar_15_00");	//Co si Lennar mysl� o Estebanovi?
	AI_Output(self,other,"DIA_Addon_Snaf_People_Lennar_01_01");	//Pokud v�m, Lennar NEMYSL�.
};

func void dia_addon_snaf_people_finn()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Finn_15_00");	//Co Finn?
	if(b_giveinvitems(other,self,itmi_gold,SNAF_TIP_KOSTEN))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_Finn_01_01");	//Dobrej kop��. M� na zlato �uch.
		AI_Output(self,other,"DIA_Addon_Snaf_People_Finn_01_02");	//Esteban d�v� p�ednost z tohoto d�vodu jemu. Mysl�m, �e si navz�jem celkem rozumn�j�.
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
	description = "Co si mysl� o Estebanovi?";
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
	AI_Output(other,self,"DIA_Addon_Snaf_Himself_15_00");	//Co si mysl� o Estebanovi?
	AI_Output(self,other,"DIA_Addon_Snaf_Himself_01_01");	//Ten kdo o n�m mluv�, bude brzo mrtvej ...
};


instance DIA_ADDON_SNAF_PERM(C_INFO)
{
	npc = bdt_1098_addon_snaf;
	nr = 8;
	condition = dia_addon_snaf_perm_condition;
	information = dia_addon_snaf_perm_info;
	permanent = TRUE;
	description = "Jak to jde s tv�m kr�mem?";
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
	AI_Output(other,self,"DIA_Addon_Snaf_PERM_15_00");	//Jak to jde s tv�m kr�mem?
	AI_Output(self,other,"DIA_Addon_Snaf_PERM_01_01");	//Dob�e! Estebanova smrt je pro p�r lid� d�vod k oslav� ...
};

