
instance DIA_GEROLD_EXIT(C_INFO)
{
	npc = pal_261_gerold;
	nr = 999;
	condition = dia_gerold_exit_condition;
	information = dia_gerold_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gerold_exit_condition()
{
	if(KAPITEL < 4)
	{
		return TRUE;
	};
};

func void dia_gerold_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GEROLD_HALLO(C_INFO)
{
	npc = pal_261_gerold;
	nr = 2;
	condition = dia_gerold_hallo_condition;
	information = dia_gerold_hallo_info;
	permanent = FALSE;
	description = "Co to hl�d�?";
};


func int dia_gerold_hallo_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_gerold_hallo_info()
{
	AI_Output(other,self,"DIA_Gerold_Hallo_15_00");	//Co to hl�d�?
	AI_Output(self,other,"DIA_Gerold_Hallo_12_01");	//V�zn�.
	AI_Output(other,self,"DIA_Gerold_Hallo_15_02");	//A kdo to je?
	AI_Output(self,other,"DIA_Gerold_Hallo_12_03");	//P�r trestanc� a �oldn�� jm�nem Gorn. Tuh� chlap�k - je siln� jako b�k.
	AI_Output(self,other,"DIA_Gerold_Hallo_12_04");	//Pot�ebovali jsme �ty�i chlapy, abychom ho mohli d�t pod z�mek.
};


instance DIA_GEROLD_JAIL(C_INFO)
{
	npc = pal_261_gerold;
	nr = 2;
	condition = dia_gerold_jail_condition;
	information = dia_gerold_jail_info;
	permanent = FALSE;
	description = "Pust� m� do v�zen�?";
};


func int dia_gerold_jail_condition()
{
	if((KAPITEL == 2) && Npc_KnowsInfo(other,dia_gerold_hallo) && (GAROND_KERKERAUF == FALSE))
	{
		return TRUE;
	};
};

func void dia_gerold_jail_info()
{
	AI_Output(other,self,"DIA_Gerold_Jail_15_00");	//Pust� m� do v�zen�?
	AI_Output(self,other,"DIA_Gerold_Jail_12_01");	//Ne. NIKDO do v�zen� nesm�. To plat� pro KA�D�HO. Pro tebe, pro Miltena a pro v�echny ostatn�.
	AI_Output(self,other,"DIA_Gerold_Jail_12_02");	//Tohle nen� ��dn� hospoda, kam bys mohl vch�zet a vych�zet podle libosti. Pamatuj si to.
	KNOWSABOUTGORN = TRUE;
};


instance DIA_GEROLD_AUSNAHME(C_INFO)
{
	npc = pal_261_gerold;
	nr = 2;
	condition = dia_gerold_ausnahme_condition;
	information = dia_gerold_ausnahme_info;
	permanent = FALSE;
	description = "Nem��e� pro m� ud�lat v�jimku?";
};


func int dia_gerold_ausnahme_condition()
{
	if(Npc_KnowsInfo(other,dia_gerold_jail) && (KAPITEL == 2) && (GAROND_KERKERAUF == FALSE))
	{
		return TRUE;
	};
};

func void dia_gerold_ausnahme_info()
{
	AI_Output(other,self,"DIA_Gerold_Ausnahme_15_00");	//Nem��e� pro m� ud�lat v�jimku?
	AI_Output(self,other,"DIA_Gerold_Ausnahme_12_01");	//Ne.
};


instance DIA_GEROLD_GOLD(C_INFO)
{
	npc = pal_261_gerold;
	nr = 2;
	condition = dia_gerold_gold_condition;
	information = dia_gerold_gold_info;
	permanent = FALSE;
	description = "A co kdy� ti dob�e zaplat�m?";
};


func int dia_gerold_gold_condition()
{
	if(Npc_KnowsInfo(other,dia_gerold_ausnahme) && (KAPITEL == 2) && (GAROND_KERKERAUF == FALSE))
	{
		return TRUE;
	};
};

func void dia_gerold_gold_info()
{
	AI_Output(other,self,"DIA_Gerold_Gold_15_00");	//A co kdy� ti dob�e zaplat�m?
	AI_Output(self,other,"DIA_Gerold_Gold_12_01");	//... hm...
	AI_Output(self,other,"DIA_Gerold_Gold_12_02");	//Ne.
};


instance DIA_GEROLD_DEAL(C_INFO)
{
	npc = pal_261_gerold;
	nr = 2;
	condition = dia_gerold_deal_condition;
	information = dia_gerold_deal_info;
	permanent = FALSE;
	description = "M�m tady vzkaz pro jednoho z v�z��. M��e� mu ho p�edat?";
};


func int dia_gerold_deal_condition()
{
	if((MIS_RESCUEGORN == LOG_RUNNING) && (Npc_HasItems(other,itwr_letterforgorn_mis) >= 1) && (KAPITEL == 2) && (GAROND_KERKERAUF == FALSE))
	{
		return TRUE;
	};
};

func void dia_gerold_deal_info()
{
	AI_Output(other,self,"DIA_Gerold_Deal_15_00");	//M�m tady vzkaz pro jednoho z v�z��. M��e� mu ho p�edat?
	AI_Output(self,other,"DIA_Gerold_Deal_12_01");	//Hm... v z�sad� nevid�m jedin� d�vod, pro� ne. Pro koho je ten vzkaz?
	AI_Output(other,self,"DIA_Gerold_Deal_15_02");	//Pro Gorna.
	AI_Output(self,other,"DIA_Gerold_Deal_12_03");	//Velice d�le�it� v�ze�. Nemysl�m, �e by s t�m Garond souhlasil. Ale pokud to je pro tebe tak podstatn�, jsem si jist, �e se n�jak dohodneme.
	AI_Output(other,self,"DIA_Gerold_Deal_15_04");	//Co chce�?
	AI_Output(self,other,"DIA_Gerold_Deal_12_05");	//Na�e p��d�ly j�dla se v�razn� sn�ily. R�d bych se pro zm�nu jednou po��dn� najedl.
	AI_Output(self,other,"DIA_Gerold_Deal_12_06");	//P�ines mi n�jakou slu�nou klob�sku a �erstv� kraj�c chleba - a trochu sladk�ho medu.
	AI_Output(self,other,"DIA_Gerold_Deal_12_07");	//A k tomu je�t� l�hev v�na... Jo, to by m�lo sta�it. Ur�it� se ti to poda��. Vra� se, a� to bude� m�t.
	b_logentry(TOPIC_RESCUEGORN,"Pokud Geroldovi p�inesu klob�su, chl�b, v�no a med, p�ed� Gornovi zpr�vu.");
};


instance DIA_GEROLD_STUFF(C_INFO)
{
	npc = pal_261_gerold;
	nr = 2;
	condition = dia_gerold_stuff_condition;
	information = dia_gerold_stuff_info;
	permanent = TRUE;
	description = "N�co pro tebe m�m...";
};


var int dia_gerold_stuff_permanent;

func int dia_gerold_stuff_condition()
{
	if((Npc_HasItems(other,itwr_letterforgorn_mis) >= 1) && Npc_KnowsInfo(other,dia_gerold_deal) && (KAPITEL == 2) && (DIA_GEROLD_STUFF_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_gerold_stuff_info()
{
	AI_Output(other,self,"DIA_Gerold_Stuff_15_00");	//N�co pro tebe m�m. J�dlo, kter� jsi cht�l.
	if((Npc_HasItems(other,itfo_honey) >= 1) && (Npc_HasItems(other,itfo_bread) >= 1) && (Npc_HasItems(other,itfo_wine) >= 1) && (Npc_HasItems(other,itfo_sausage) >= 1))
	{
		AI_PrintScreen("Honig gegeben",-1,34,FONT_SCREENSMALL,2);
		AI_PrintScreen("Brot gegeben",-1,37,FONT_SCREENSMALL,2);
		AI_PrintScreen("Wein gegeben",-1,40,FONT_SCREENSMALL,2);
		AI_PrintScreen("Wurst gegeben",-1,43,FONT_SCREENSMALL,2);
		Npc_RemoveInvItems(other,itfo_honey,1);
		Npc_RemoveInvItems(other,itfo_bread,1);
		Npc_RemoveInvItems(other,itfo_wine,1);
		Npc_RemoveInvItems(other,itfo_sausage,1);
		AI_Output(self,other,"DIA_Gerold_Stuff_12_01");	//Dobr�, dej mi ten dlabanec. M� ten vzkaz?
		AI_Output(other,self,"DIA_Gerold_Stuff_15_02");	//Ano, tady. Nezapome�, je to pro Gorna.
		AI_Output(self,other,"DIA_Gerold_Stuff_12_03");	//Vra� se z�tra, tou dobou u� bude ten vzkaz m�t.
		b_giveinvitems(other,self,itwr_letterforgorn_mis,1);
		DAYCONTACTGORN = Wld_GetDay();
		DIA_GEROLD_STUFF_PERMANENT = TRUE;
		b_logentry(TOPIC_RESCUEGORN,"Gerold dostal, co cht�l, a te� p�ed� zpr�vu p��slu�n�mu adres�tovi.");
	}
	else
	{
		AI_Output(self,other,"DIA_Gerold_Stuff_12_04");	//Vra� se, a� bude� m�t v�ci, kter� jsem cht�l.
	};
};


instance DIA_GEROLD_ANTWORT(C_INFO)
{
	npc = pal_261_gerold;
	nr = 2;
	condition = dia_gerold_antwort_condition;
	information = dia_gerold_antwort_info;
	permanent = TRUE;
	description = "Dostal Gorn ten vzkaz?";
};


var int dia_gerold_antwort_permanent;

func int dia_gerold_antwort_condition()
{
	if((DIA_GEROLD_STUFF_PERMANENT == TRUE) && (KAPITEL == 2) && (DIA_GEROLD_ANTWORT_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_gerold_antwort_info()
{
	AI_Output(other,self,"DIA_Gerold_Antwort_15_00");	//Dostal Gorn ten vzkaz?
	if(DAYCONTACTGORN < Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Gerold_Antwort_12_01");	//Ano, a m�m ti od n�j vy��dit tohle:
		AI_Output(other,self,"DIA_Gerold_Antwort_15_02");	//A?
		AI_Output(self,other,"DIA_Gerold_Antwort_12_03");	//Je to u ji�n� br�ny.
		AI_Output(other,self,"DIA_Gerold_Antwort_15_04");	//��kal je�t� n�co?
		AI_Output(self,other,"DIA_Gerold_Antwort_12_05");	//Ne. Netu��m, co to m�lo znamenat. Ty to v�?
		AI_Output(other,self,"DIA_Gerold_Antwort_15_06");	//Mo�n�. Ale rad�i bys o tom nem�l moc p�em��let.
		AI_Output(self,other,"DIA_Gerold_Antwort_12_07");	//Ano, to asi bude lep��.
		GORNSTREASURE = TRUE;
		DIA_GEROLD_ANTWORT_PERMANENT = TRUE;
		b_logentry(TOPIC_RESCUEGORN,"Gorn tvrd�, �e jeho zlato najdu u ji�n� br�ny.");
	}
	else
	{
		AI_Output(self,other,"DIA_Gerold_GornsAnswer_12_08");	//Ne, je�t� ne. Vra� se pozd�ji.
	};
	AI_StopProcessInfos(self);
};


instance DIA_GEROLD_SETGORNFREE(C_INFO)
{
	npc = pal_261_gerold;
	nr = 2;
	condition = dia_gerold_setgornfree_condition;
	information = dia_gerold_setgornfree_info;
	permanent = FALSE;
	description = "Propus� Gorna na svobodu. Je to rozkaz od velitele Garonda.";
};


func int dia_gerold_setgornfree_condition()
{
	if((GAROND_KERKERAUF == TRUE) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_gerold_setgornfree_info()
{
	AI_Output(other,self,"DIA_Gerold_SetGornFree_15_00");	//Propus� Gorna na svobodu. Je to rozkaz od velitele Garonda.
	AI_Output(self,other,"DIA_Gerold_SetGornFree_12_01");	//U� o tom v�m. Tady m� kl��, m��e� dovnit�.
	CreateInvItems(self,itke_prisonkey_mis,1);
	b_giveinvitems(self,other,itke_prisonkey_mis,1);
	b_logentry(TOPIC_RESCUEGORN,"Gerold mi sv��il kl�� od v�znice.");
};


instance DIA_GEROLD_PERM(C_INFO)
{
	npc = pal_261_gerold;
	nr = 900;
	condition = dia_gerold_perm_condition;
	information = dia_gerold_perm_info;
	permanent = TRUE;
	description = "To nikdy nesp�?";
};


func int dia_gerold_perm_condition()
{
	if((KAPITEL < 4) && Npc_KnowsInfo(other,dia_gerold_gold))
	{
		return TRUE;
	};
};

func void dia_gerold_perm_info()
{
	AI_Output(other,self,"DIA_Gerold_Perm_15_00");	//To nikdy nesp�?
	AI_Output(self,other,"DIA_Gerold_Perm_12_01");	//Ne. Innos s�m mi dal s�lu, abych nikdy nepot�eboval odpo�inek.
};


instance DIA_GEROLD_KAP4_EXIT(C_INFO)
{
	npc = pal_261_gerold;
	nr = 999;
	condition = dia_gerold_kap4_exit_condition;
	information = dia_gerold_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gerold_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_gerold_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GEROLD_KAP4_ALLESRUHIG(C_INFO)
{
	npc = pal_261_gerold;
	nr = 30;
	condition = dia_gerold_kap4_allesruhig_condition;
	information = dia_gerold_kap4_allesruhig_info;
	description = "V�echno v po��dku?";
};


func int dia_gerold_kap4_allesruhig_condition()
{
	if(KAPITEL >= 4)
	{
		return TRUE;
	};
};

func void dia_gerold_kap4_allesruhig_info()
{
	AI_Output(other,self,"DIA_Gerold_KAP4_ALLESRUHIG_15_00");	//V�echno v po��dku?
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_12_01");	//V po��dku, ano.
	AI_Output(other,self,"DIA_Gerold_KAP4_ALLESRUHIG_15_02");	//Ale?
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_12_03");	//Pupek mi drhne o p�te�, chlape. Garond zase zmen�il p��d�ly j�dla.
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_12_04");	//Jestli nedostanu do ch�t�nu n�jak� slu�n� dlabanec, zahryznu se do t� Garondovy tlust�... zadku.
	Info_ClearChoices(dia_gerold_kap4_allesruhig);
	Info_AddChoice(dia_gerold_kap4_allesruhig,"To nen� m�j probl�m.",dia_gerold_kap4_allesruhig_nein);
	Info_AddChoice(dia_gerold_kap4_allesruhig,"Mo�n� bych ti mohl n�co d�t.",dia_gerold_kap4_allesruhig_geben);
};

func void dia_gerold_kap4_allesruhig_geben()
{
	AI_Output(other,self,"DIA_Gerold_KAP4_ALLESRUHIG_geben_15_00");	//Mo�n� bych ti mohl n�co d�t.
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_01");	//Zbl�znil ses? Tady v ��dn�m p��pad�. Kdyby to vid�li ostatn�, budu m�t hned tunu nov�ch p��tel, jestli ch�pe�, co t�m chci ��ct.
	if(Wld_IsTime(23,10,8,0) == FALSE)
	{
		AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_02");	//A� p�jdou v�ichni sp�t, najde� m� v m�gov� svatyni.
	}
	else
	{
		AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_03");	//Rychle, poj� za mnou do m�govy svatyn�, ne� se ostatn� vyhrabou. Nechce se mi �ekat do z�t�ka.
	};
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_04");	//V tuhle dobu tam stejn� nikdo neb�v�. Po�k�m tam na tebe.
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_05");	//Ale neukazuj se tam se such�m chlebem a syrovou flaksou masa, jasn�?
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Food");
	Log_CreateTopic(TOPIC_GEROLDGIVEFOOD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GEROLDGIVEFOOD,LOG_RUNNING);
	b_logentry(TOPIC_GEROLDGIVEFOOD,"Garond op�t omezil p��d�ly potravin. Rad�i bych m�l Geroldovi d�t n�co k j�dlu, nebo z hladu vyvede n�jakou hroznou pitomost. ");
	MIS_GEROLDGIVEFOOD = LOG_RUNNING;
};

func void dia_gerold_kap4_allesruhig_nein()
{
	AI_Output(other,self,"DIA_Gerold_KAP4_ALLESRUHIG_Nein_15_00");	//To nen� m�j probl�m.
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_Nein_12_01");	//M��e� mluvit. Tob� Garond ur�it� p��d�l nesn��.
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_Nein_12_02");	//I kdy� by to neuznal, m� strachy sta�en� zadek a v tob� vid� jedinou sp�su.
	AI_StopProcessInfos(self);
};


var int gerold_foodcounter;

instance DIA_GEROLD_FOOD(C_INFO)
{
	npc = pal_261_gerold;
	nr = 31;
	condition = dia_gerold_food_condition;
	information = dia_gerold_food_info;
	important = TRUE;
};


func int dia_gerold_food_condition()
{
	if((Npc_GetDistToWP(self,"OC_MAGE_IN") < 500) && (KAPITEL >= 4))
	{
		return TRUE;
	};
};

func void dia_gerold_morefood()
{
	Info_ClearChoices(dia_gerold_food);
	if(GEROLD_FOODCOUNTER > 8)
	{
		AI_Output(self,other,"DIA_Gerold_MoreFood_12_00");	//To sta��. To sta��. S t�m na chv�li vysta��m.
		AI_Output(self,other,"DIA_Gerold_MoreFood_12_01");	//Tady m� pen�ze. Tady si za n� stejn� nic nekoup�m, tak�e si je klidn� vezmi.
		AI_Output(self,other,"DIA_Gerold_MoreFood_12_02");	//U� bych asi m�l j�t, ne� si n�s n�kdo v�imne.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Start");
		MIS_GEROLDGIVEFOOD = LOG_SUCCESS;
		b_giveplayerxp(XP_GEROLDGIVEFOOD);
		CreateInvItems(self,itmi_gold,450);
		b_giveinvitems(self,other,itmi_gold,450);
	}
	else
	{
		if(GEROLD_FOODCOUNTER == 0)
		{
			Info_AddChoice(dia_gerold_food,"Te� moment�ln� nic nem�m.",dia_gerold_food_nichts);
		}
		else
		{
			Info_AddChoice(dia_gerold_food,"To je v�echno, co m�m.",dia_gerold_food_kaese_nichtmehr);
			if(GEROLD_FOODCOUNTER < 5)
			{
				AI_Output(self,other,"DIA_Gerold_MoreFood_12_03");	//Jasan. Dej to sem. M� je�t� dal��?
			}
			else
			{
				AI_Output(self,other,"DIA_Gerold_MoreFood_12_04");	//Jo. V�c, v�c!
			};
		};
		if(Npc_HasItems(other,itfo_fishsoup) || Npc_HasItems(other,itfo_stew))
		{
			Info_AddChoice(dia_gerold_food,"(D�t mu pol�vku.)",dia_gerold_food_suppe);
		};
		if(Npc_HasItems(other,itfomutton))
		{
			Info_AddChoice(dia_gerold_food,"(D�t mu maso.)",dia_gerold_food_fleisch);
		};
		if(Npc_HasItems(other,itfo_bacon))
		{
			Info_AddChoice(dia_gerold_food,"(D�t mu �unku.)",dia_gerold_food_schinken);
		};
		if(Npc_HasItems(other,itfo_cheese))
		{
			Info_AddChoice(dia_gerold_food,"(D�t mu s�r.)",dia_gerold_food_kaese);
		};
		if(Npc_HasItems(other,itfo_sausage))
		{
			Info_AddChoice(dia_gerold_food,"(D�t mu klob�su.)",dia_gerold_food_wurst);
		};
		GEROLD_FOODCOUNTER = GEROLD_FOODCOUNTER + 1;
	};
};

func void dia_gerold_food_info()
{
	AI_Output(self,other,"DIA_Gerold_FOOD_12_00");	//Tady m�. Tak�e co? M� pro m� n�co k j�dlu?
	dia_gerold_morefood();
};

func void dia_gerold_food_nichts()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_nichts_15_00");	//Te� moment�ln� nic nem�m.
	AI_Output(self,other,"DIA_Gerold_FOOD_nichts_12_01");	//Nejd��v kolem toho d�l� takov� humbuk a nakonec m� chce� podv�st?
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
	Npc_ExchangeRoutine(self,"Start");
	MIS_GEROLDGIVEFOOD = LOG_FAILED;
	b_giveplayerxp(XP_AMBIENT);
};

func void dia_gerold_food_kaese_nichtmehr()
{
	var int xp_geroldgivefoodlow;
	var int teiler;
	AI_Output(other,self,"DIA_Gerold_FOOD_kaese_nichtmehr_15_00");	//To je v�echno, co m�m.
	AI_Output(self,other,"DIA_Gerold_FOOD_kaese_nichtmehr_12_01");	//A tomu m�m v��it? No dobr�, lep�� n�co ne� nic. Tady m� p�r zla��k�.
	CreateInvItems(self,itmi_gold,50);
	b_giveinvitems(self,other,itmi_gold,50);
	AI_Output(self,other,"DIA_Gerold_FOOD_kaese_nichtmehr_12_02");	//No. M�l bych se vr�tit na svoje m�sto.
	AI_StopProcessInfos(self);
	if(GEROLD_FOODCOUNTER < 4)
	{
		teiler = 3;
	}
	else
	{
		teiler = 2;
	};
	xp_geroldgivefoodlow = XP_GEROLDGIVEFOOD / teiler;
	Npc_ExchangeRoutine(self,"Start");
	MIS_GEROLDGIVEFOOD = LOG_OBSOLETE;
	b_giveplayerxp(xp_geroldgivefoodlow);
};

func void dia_gerold_food_kaese()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_kaese_15_00");	//Co takhle p�kn� �pal�k s�ra?
	b_giveinvitems(other,self,itfo_cheese,1);
	dia_gerold_morefood();
};

func void dia_gerold_food_wurst()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_Wurst_15_00");	//Kus klob�sy?
	b_giveinvitems(other,self,itfo_sausage,1);
	dia_gerold_morefood();
};

func void dia_gerold_food_schinken()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_schinken_15_00");	//M��u ti d�t tuhle �unku.
	b_giveinvitems(other,self,itfo_bacon,1);
	dia_gerold_morefood();
};

func void dia_gerold_food_fleisch()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_fleisch_15_00");	//Fl�k masa?
	b_giveinvitems(other,self,itfomutton,1);
	dia_gerold_morefood();
};

func void dia_gerold_food_suppe()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_Suppe_15_00");	//Dobr� pol�vka by se �ikla, ne?
	if(b_giveinvitems(other,self,itfo_fishsoup,1))
	{
	}
	else
	{
		b_giveinvitems(other,self,itfo_stew,1);
	};
	dia_gerold_morefood();
};


instance DIA_GEROLD_PERM4(C_INFO)
{
	npc = pal_261_gerold;
	nr = 41;
	condition = dia_gerold_perm4_condition;
	information = dia_gerold_perm4_info;
	permanent = TRUE;
	description = "Je�t� m� hlad?";
};


func int dia_gerold_perm4_condition()
{
	if(Npc_KnowsInfo(other,dia_gerold_kap4_allesruhig))
	{
		return TRUE;
	};
};

func void dia_gerold_perm4_info()
{
	AI_Output(other,self,"DIA_Gerold_PERM4_15_00");	//Je�t� m� hlad?
	if(MIS_OCGATEOPEN == TRUE)
	{
		AI_Output(self,other,"DIA_Gerold_PERM4_12_01");	//Pokud sk�eti znovu za�to��, nepom��e mi ani pln� b�icho.
	}
	else if(MIS_GEROLDGIVEFOOD == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Gerold_PERM4_12_02");	//To si d�l� srandu. U� jsem pln�. Je�t� jednou d�kuju.
	}
	else if(MIS_GEROLDGIVEFOOD == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Gerold_PERM4_12_03");	//Hm. Ale i tak ti d�kuju.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Gerold_PERM4_12_04");	//Je to v po��dku, mist�e.
	}
	else
	{
		AI_Output(self,other,"DIA_Gerold_PERM4_12_05");	//Zmiz!
	};
	AI_StopProcessInfos(self);
};


instance DIA_GEROLD_KAP5_EXIT(C_INFO)
{
	npc = pal_261_gerold;
	nr = 999;
	condition = dia_gerold_kap5_exit_condition;
	information = dia_gerold_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gerold_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_gerold_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GEROLD_KAP6_EXIT(C_INFO)
{
	npc = pal_261_gerold;
	nr = 999;
	condition = dia_gerold_kap6_exit_condition;
	information = dia_gerold_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gerold_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_gerold_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GEROLD_PICKPOCKET(C_INFO)
{
	npc = pal_261_gerold;
	nr = 900;
	condition = dia_gerold_pickpocket_condition;
	information = dia_gerold_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_gerold_pickpocket_condition()
{
	return c_beklauen(71,170);
};

func void dia_gerold_pickpocket_info()
{
	Info_ClearChoices(dia_gerold_pickpocket);
	Info_AddChoice(dia_gerold_pickpocket,DIALOG_BACK,dia_gerold_pickpocket_back);
	Info_AddChoice(dia_gerold_pickpocket,DIALOG_PICKPOCKET,dia_gerold_pickpocket_doit);
};

func void dia_gerold_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_gerold_pickpocket);
};

func void dia_gerold_pickpocket_back()
{
	Info_ClearChoices(dia_gerold_pickpocket);
};

