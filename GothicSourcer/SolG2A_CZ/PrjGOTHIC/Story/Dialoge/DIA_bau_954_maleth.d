
instance DIA_MALETH_EXIT(C_INFO)
{
	npc = bau_954_maleth;
	nr = 999;
	condition = dia_maleth_exit_condition;
	information = dia_maleth_exit_info;
	permanent = TRUE;
	description = "Mus�m j�t!";
};


func int dia_maleth_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_maleth_exit_info()
{
	AI_StopProcessInfos(self);
	if(MALETH_ERSTERWOLF == FALSE)
	{
		Wld_InsertNpc(ywolf,"NW_FARM1_PATH_CITY_SHEEP_06");
		MALETH_ERSTERWOLF = TRUE;
	};
};


instance DIA_MALETH_HALLO(C_INFO)
{
	npc = bau_954_maleth;
	nr = 1;
	condition = dia_maleth_hallo_condition;
	information = dia_maleth_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_maleth_hallo_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_maleth_hallo_info()
{
	AI_Output(self,other,"DIA_Maleth_Hallo_08_00");	//Hej, cizin�e!
	if(hero.guild == GIL_NONE)
	{
		if(Npc_GetDistToWP(self,"NW_FARM1_PATH_CITY_SHEEP_09") < 500)
		{
			AI_Output(self,other,"DIA_Maleth_Hallo_08_01");	//Vid�l jsem t� p�ich�zet z hor.
		};
		AI_Output(self,other,"DIA_Maleth_Hallo_08_02");	//M��e� b�t r�d, �es nep�i�el p�ed t�emi t�dny.
		AI_Output(self,other,"DIA_Maleth_Hallo_08_03");	//Zatkli bychom t� jako uprchl�ho trestance. A ud�lali bychom s tebou kr�tk� proces!
		if(Npc_HasEquippedArmor(other) == FALSE)
		{
			AI_Output(self,other,"DIA_Maleth_Hallo_08_04");	//Vypad� �pln� vy�erpan�.
		}
		else
		{
			AI_Output(self,other,"DIA_Maleth_Hallo_08_05");	//Kdy� jsi p�i�el, vypadal jsi, �e vypust� du�i.
			AI_Output(self,other,"DIA_Maleth_Hallo_08_06");	//Fajn, te� u� vypad� skoro jako �lov�k!
		};
	};
	AI_Output(self,other,"DIA_Maleth_Hallo_08_07");	//(ned�v��iv�) Co tady chce�?
};


instance DIA_MALETH_BANDITS(C_INFO)
{
	npc = bau_954_maleth;
	nr = 1;
	condition = dia_maleth_bandits_condition;
	information = dia_maleth_bandits_info;
	permanent = FALSE;
	description = "V hor�ch m� p�epadli bandit�.";
};


func int dia_maleth_bandits_condition()
{
	if((KAPITEL < 3) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_maleth_bandits_info()
{
	AI_Output(other,self,"DIA_Maleth_BANDITS_15_00");	//V hor�ch m� p�epadli bandit�.
	AI_Output(self,other,"DIA_Maleth_BANDITS_08_01");	//Ti zatracen� mizerov�! Mo�n� to budou ti, kte�� mi minulou noc ukradli jednu z ovc�!
	AI_Output(self,other,"DIA_Maleth_BANDITS_08_02");	//M�ls obrovsk� �t�st�. V�t�ina lid� se odtamtud nedostala �iv�.
};


instance DIA_MALETH_BANDITSDEAD(C_INFO)
{
	npc = bau_954_maleth;
	nr = 1;
	condition = dia_maleth_banditsdead_condition;
	information = dia_maleth_banditsdead_info;
	permanent = FALSE;
	description = "Ti bandit� u� v�m nebudou d�lat ��dn� probl�my ...";
};


func int dia_maleth_banditsdead_condition()
{
	if((Npc_IsDead(ambusher_1013) || (BDT_1013_AWAY == TRUE)) && Npc_IsDead(ambusher_1014) && Npc_IsDead(ambusher_1015) && Npc_KnowsInfo(other,dia_maleth_bandits))
	{
		return TRUE;
	};
};

func void dia_maleth_banditsdead_info()
{
	AI_Output(other,self,"DIA_Maleth_BanditsDEAD_15_00");	//Ti bandit� u� v�m nebudou d�lat ��dn� probl�my.
	AI_Output(self,other,"DIA_Maleth_BanditsDEAD_08_01");	//Pro�? Jsou mrtv�?
	AI_Output(other,self,"DIA_Maleth_BanditsDEAD_15_02");	//Vyt�hli zbra� na �patn�ho chlapa.
	AI_Output(self,other,"DIA_Maleth_BanditsDEAD_08_03");	//D�ky Innosovi! Tady - nen� to sice moc, ale chci, aby sis to vzal!
	b_giveinvitems(self,other,itfo_wine,3);
	MIS_MALETH_BANDITS = LOG_SUCCESS;
	b_giveplayerxp(XP_MALETHKILLBANDITS);
	AI_Output(self,other,"DIA_Maleth_BanditsDEAD_08_04");	//�eknu o tom ostatn�m!
};


instance DIA_MALETH_BANDITSALIVE(C_INFO)
{
	npc = bau_954_maleth;
	nr = 1;
	condition = dia_maleth_banditsalive_condition;
	information = dia_maleth_banditsalive_info;
	permanent = FALSE;
	description = "V�m, kde maj� bandit� skr��.";
};


func int dia_maleth_banditsalive_condition()
{
	var C_NPC b13;
	var C_NPC b14;
	var C_NPC b15;
	b13 = Hlp_GetNpc(bdt_1013_bandit_l);
	b14 = Hlp_GetNpc(bdt_1014_bandit_l);
	b15 = Hlp_GetNpc(bdt_1015_bandit_l);
	if((!Npc_IsDead(b13) || !Npc_IsDead(b14) || !Npc_IsDead(b15)) && Npc_KnowsInfo(other,dia_maleth_bandits) && (MIS_MALETH_BANDITS != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_maleth_banditsalive_info()
{
	AI_Output(other,self,"DIA_Maleth_BanditsALIVE_15_00");	//V�m, kde maj� bandit� skr��.
	AI_Output(self,other,"DIA_Maleth_BanditsALIVE_08_01");	//Chce� na n� j�t? Tak z toho m� vynech! Je to moc nebezpe�n�!
	AI_Output(self,other,"DIA_Maleth_BanditsALIVE_08_02");	//A krom� toho, mus�m d�vat pozor na ovce!
	AI_Output(self,other,"DIA_Maleth_BanditsALIVE_08_03");	//Ale jestli si mysl�, �e n� t� l�zy m��e� zbavit, bude ti cel� farma vd��n�.
	MIS_MALETH_BANDITS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_MALETH,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MALETH,LOG_RUNNING);
	b_logentry(TOPIC_MALETH,"Jestli se mi poda�� pob�t bandity na cest� z Xardasovy v�e na Lobart�v statek, jeho obyvatel� mi budou velmi vd��n�.");
};


instance DIA_MALETH_TOTHECITY(C_INFO)
{
	npc = bau_954_maleth;
	nr = 2;
	condition = dia_maleth_tothecity_condition;
	information = dia_maleth_tothecity_info;
	permanent = FALSE;
	description = "Jsem na cest� do m�sta.";
};


func int dia_maleth_tothecity_condition()
{
	if(Npc_KnowsInfo(other,dia_maleth_hallo) && (KAPITEL < 3) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_maleth_tothecity_info()
{
	AI_Output(other,self,"DIA_Maleth_ToTheCity_15_00");	//Jsem na cest� do m�sta.
	if(Npc_HasEquippedArmor(other) == FALSE)
	{
		AI_Output(self,other,"DIA_Maleth_ToTheCity_08_01");	//Asi bude� muset podplatit str�e, aby ses dostal, kam chce�.
		AI_Output(self,other,"DIA_Maleth_ToTheCity_08_02");	//A taky mus� v�d�t, co cht�j� sly�et.
	}
	else
	{
		AI_Output(self,other,"DIA_Maleth_ToTheCity_08_03");	//M��ou t� pustit dovnit� - kdy� jim �ekne�, co cht�j sly�et.
	};
	AI_Output(other,self,"DIA_Maleth_ToTheCity_15_04");	//A to jako?
	AI_Output(self,other,"DIA_Maleth_ToTheCity_08_05");	//Fajn, nap��klad, �e jsi z Lobartovy farmy a pot�ebuje� j�t za m�stsk�m kov��em.
	Log_CreateTopic(TOPIC_CITY,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CITY,LOG_RUNNING);
	b_logentry(TOPIC_CITY,"Kdy� str��m u m�stsk�ch bran �eknu, �e p�ich�z�m z Lobartova statku a �e m�m nam��eno ke kov��i, pust� m� dovnit�.");
	if(Npc_HasEquippedArmor(other) == FALSE)
	{
		AI_Output(self,other,"DIA_Maleth_ToTheCity_08_06");	//Ale asi ti to nebude moc platn�. Nevypad� jako farm��.
		b_logentry(TOPIC_CITY,"Samoz�ejm� �e nap�ed mus�m vypadat taky jako sedl�k. ");
	};
	AI_Output(other,self,"DIA_Maleth_ToTheCity_15_07");	//Aha.
};


instance DIA_MALETH_EQUIPMENT(C_INFO)
{
	npc = bau_954_maleth;
	nr = 3;
	condition = dia_maleth_equipment_condition;
	information = dia_maleth_equipment_info;
	permanent = FALSE;
	description = "Pot�ebuju lep�� vybaven�!";
};


func int dia_maleth_equipment_condition()
{
	if(Npc_KnowsInfo(other,dia_maleth_hallo) && (KAPITEL < 3) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_maleth_equipment_info()
{
	AI_Output(other,self,"DIA_Maleth_Equipment_15_00");	//Pot�ebuju lep�� vybaven�!
	AI_Output(self,other,"DIA_Maleth_Equipment_08_01");	//To ch�pu. Ale �eknu ti rovnou: Nem�me nic, co bychom mohli postr�dat!
	if(!Npc_IsDead(lobart))
	{
		AI_Output(self,other,"DIA_Maleth_Equipment_08_02");	//Pokud m��e� zaplatit za to, co chce�, Lobart ti n�co prod�.
		AI_Output(self,other,"DIA_Maleth_Equipment_08_03");	//Jinak se ho tak� m��e� zeptat, jestli by pro tebe nem�l n�jakou pr�ci.
	};
};


instance DIA_MALETH_LOBART(C_INFO)
{
	npc = bau_954_maleth;
	nr = 3;
	condition = dia_maleth_lobart_condition;
	information = dia_maleth_lobart_info;
	permanent = FALSE;
	description = "Kde m��u naj�t Lobarta?";
};


func int dia_maleth_lobart_condition()
{
	if(Npc_KnowsInfo(other,dia_maleth_equipment) && !Npc_IsDead(lobart) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_maleth_lobart_info()
{
	AI_Output(other,self,"DIA_Maleth_LOBART_15_00");	//Kde m��u naj�t Lobarta?
	AI_Output(self,other,"DIA_Maleth_LOBART_08_01");	//No, na farm� p�ece! Pat�� mu to tady!
	AI_Output(self,other,"DIA_Maleth_LOBART_08_02");	//A nezkou�ej si s n�m n�co za��nat! U� hodn� tul�k� od n�j dostalo nakl�da�ku a pak let�li z farmy.
};


instance DIA_MALETH_KAP3_EXIT(C_INFO)
{
	npc = bau_954_maleth;
	nr = 999;
	condition = dia_maleth_kap3_exit_condition;
	information = dia_maleth_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_maleth_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_maleth_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MALETH_PROBLEME(C_INFO)
{
	npc = bau_954_maleth;
	nr = 30;
	condition = dia_maleth_probleme_condition;
	information = dia_maleth_probleme_info;
	description = "N�jak� zm�ny posledn� dobou?";
};


func int dia_maleth_probleme_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_maleth_probleme_info()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_15_00");	//N�jak� zm�ny posledn� dobou?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_08_01");	//Sejdi dol� po cest� k m�stu a uvid�.
	AI_Output(self,other,"DIA_Maleth_PROBLEME_08_02");	//A� se potk� s �ernokab�tn�ky, pak uvid�, co je nov�ho.
	Info_ClearChoices(dia_maleth_probleme);
	Info_AddChoice(dia_maleth_probleme,DIALOG_BACK,dia_maleth_probleme_back);
	Info_AddChoice(dia_maleth_probleme,"Jak se maj� ovce?",dia_maleth_probleme_schafe);
	Info_AddChoice(dia_maleth_probleme,"U� t� ty �ern� k�p� nav�t�vily?",dia_maleth_probleme_beidir);
};

func void dia_maleth_probleme_beidir()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_beidir_15_00");	//U� t� ty �ern� k�p� nav�t�vily?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_beidir_08_01");	//Jo. Z�staly tu n�kolik dn�. Jestli to chce� v�d�t, tak p�i�ly rovnou z pekel.
};

func void dia_maleth_probleme_schafe()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_15_00");	//Jak se maj� ovce?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_08_01");	//(vztekle) Jako by t� to v�bec zaj�malo. M� jin� probl�my.
	Info_AddChoice(dia_maleth_probleme,"Probl�my? Co ty o tom v�?",dia_maleth_probleme_schafe_probleme);
};

func void dia_maleth_probleme_schafe_probleme()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_probleme_15_00");	//Probl�my? Co ty o tom v�?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_08_01");	//(stroze) Pat�� k m�stsk�m str��m, ne? Tak s t�ma bastardama v �ern�ch k�p�ch n�co ud�lej.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_08_02");	//(vztekle) Vy zatracen� �old�ci mysl�te jen na jedinou v�c: jak z ostatn�ch dostat co nejv�c pen�z do vlastn� kapsy.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_08_03");	//V� vzne�en� p�n kl�tera by m�l s t�mi postavami v k�p�ch n�co d�lat.
	};
	Info_ClearChoices(dia_maleth_probleme);
	Info_AddChoice(dia_maleth_probleme,DIALOG_BACK,dia_maleth_probleme_back);
	Info_AddChoice(dia_maleth_probleme,"Hej, d�vej si bacha na pusu, k�mo.",dia_maleth_probleme_schafe_probleme_drohen);
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		Info_AddChoice(dia_maleth_probleme,"Co m� za probl�m?",dia_maleth_probleme_schafe_probleme_geldher_auftrag);
	};
};

func void dia_maleth_probleme_schafe_probleme_geldher_auftrag()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_15_00");	//Co m� za probl�m?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_01");	//Ur�it� za to m��e ta �ern� p�lenka, co mi Vino p�ed n�kolika t�dny podstr�il.
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_02");	//Nem��u si na nic vzpomenout, chlape. Jenom v�m, �e se mi ztratila moje vych�zkov� h�l.
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_15_03");	//A to je to, kv�li �emu d�l� takovej krav�l?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_04");	//Tob� se to �ekne, tvoje nebyla.
	Log_CreateTopic(TOPIC_MALETHSGEHSTOCK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MALETHSGEHSTOCK,LOG_RUNNING);
	b_logentry(TOPIC_MALETHSGEHSTOCK,"Maleth se n�kde o�ral jak d�lo a ztratil p�itom vych�zkovou h�l. Jak ho zn�m, nikdy se z Lobartova statku moc nevzd�lil. Proto by se ta h�l m�la v�let n�kde pobl�.");
	Info_ClearChoices(dia_maleth_probleme);
};

func void dia_maleth_probleme_schafe_probleme_drohen()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_probleme_drohen_15_00");	//Hej, d�vej si bacha na pusu, k�mo.
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_drohen_08_01");	//Jedin�, co dovede�, jsou �e�i. Nejl�p ud�l�, kdy� p�jde� pry�.
};

func void dia_maleth_probleme_back()
{
	Info_ClearChoices(dia_maleth_probleme);
};


instance DIA_MALETH_GEHSTOCK(C_INFO)
{
	npc = bau_954_maleth;
	nr = 33;
	condition = dia_maleth_gehstock_condition;
	information = dia_maleth_gehstock_info;
	description = "M�m dojem, �e tahle h�l pat�� tob�.";
};


func int dia_maleth_gehstock_condition()
{
	if(Npc_HasItems(other,itmw_malethsgehstock_mis) && Npc_KnowsInfo(other,dia_maleth_probleme))
	{
		return TRUE;
	};
};

func void dia_maleth_gehstock_info()
{
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_15_00");	//M�m dojem, �e tahle h�l pat�� tob�.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_08_01");	//To je ohromn�. J�...
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_15_02");	//Tak moment. Nejd��v za ni zapla�.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_08_03");	//Ale... Moc toho nem�m.
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_15_04");	//V tom p��pad� na ni zapome�.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_08_05");	//SDObr�. A co tohle? V�era jsem tu vid�l b�et n�jak� bandity s n�kolika m�ci zlata.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_08_06");	//Kdy� ti �eknu, kam schovali svou ko�ist, vr�t� mi za to moji h�l?
	TOPIC_END_MALETHSGEHSTOCK = TRUE;
	b_giveplayerxp(XP_FOUNDMALETHSGEHSTOCK);
	Info_ClearChoices(dia_maleth_gehstock);
	Info_AddChoice(dia_maleth_gehstock,"Promi�, ale to m� nezaj�m�. Chci zlato. ",dia_maleth_gehstock_gold);
	Info_AddChoice(dia_maleth_gehstock,"Dobr�.",dia_maleth_gehstock_ok);
};

func void dia_maleth_gehstock_ok()
{
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_ok_15_00");	//Dobr�.
	b_giveinvitems(other,self,itmw_malethsgehstock_mis,1);
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_ok_08_01");	//Fajn. Jdi odsud na z�pad k tamtomu kousku lesa. Najde� tam str�.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_ok_08_02");	//V t� jeskyni ur�it� n�co bude.
	b_logentry(TOPIC_MALETHSGEHSTOCK,"Maleth mi vypr�v�l, �e v les�ch z�padn� od Lobartova statku se nach�z� t�bor bandit�.");
	CreateInvItems(bdt_1024_malethsbandit,itmi_malethsbanditgold,1);
	Info_ClearChoices(dia_maleth_gehstock);
	AI_StopProcessInfos(self);
};

func void dia_maleth_gehstock_gold()
{
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_gold_15_00");	//Promi�, ale to m� nezaj�m�. Chci zlato.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_gold_08_01");	//Tady je v�echno, co m�m. M�lo by to sta�it.
	CreateInvItems(self,itmi_gold,35);
	b_giveinvitems(self,other,itmi_gold,35);
	b_giveinvitems(other,self,itmw_malethsgehstock_mis,1);
	Info_ClearChoices(dia_maleth_gehstock);
};


instance DIA_MALETH_PERM3(C_INFO)
{
	npc = bau_954_maleth;
	nr = 33;
	condition = dia_maleth_perm3_condition;
	information = dia_maleth_perm3_info;
	permanent = TRUE;
	description = "Nenech se v�bec ru�it.";
};


func int dia_maleth_perm3_condition()
{
	if(Npc_KnowsInfo(other,dia_maleth_probleme) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};

func void dia_maleth_perm3_info()
{
	AI_Output(other,self,"DIA_Maleth_PERM3_15_00");	//Nenech se v�bec ru�it.
	AI_Output(self,other,"DIA_Maleth_PERM3_08_01");	//(roz�ilen�) Zmizni.
	AI_StopProcessInfos(self);
};


instance DIA_MALETH_KAP4_EXIT(C_INFO)
{
	npc = bau_954_maleth;
	nr = 999;
	condition = dia_maleth_kap4_exit_condition;
	information = dia_maleth_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_maleth_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_maleth_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MALETH_KAP5_EXIT(C_INFO)
{
	npc = bau_954_maleth;
	nr = 999;
	condition = dia_maleth_kap5_exit_condition;
	information = dia_maleth_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_maleth_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_maleth_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MALETH_KAP6_EXIT(C_INFO)
{
	npc = bau_954_maleth;
	nr = 999;
	condition = dia_maleth_kap6_exit_condition;
	information = dia_maleth_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_maleth_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_maleth_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MALETH_PICKPOCKET(C_INFO)
{
	npc = bau_954_maleth;
	nr = 900;
	condition = dia_maleth_pickpocket_condition;
	information = dia_maleth_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_maleth_pickpocket_condition()
{
	return c_beklauen(10,10);
};

func void dia_maleth_pickpocket_info()
{
	Info_ClearChoices(dia_maleth_pickpocket);
	Info_AddChoice(dia_maleth_pickpocket,DIALOG_BACK,dia_maleth_pickpocket_back);
	Info_AddChoice(dia_maleth_pickpocket,DIALOG_PICKPOCKET,dia_maleth_pickpocket_doit);
};

func void dia_maleth_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_maleth_pickpocket);
};

func void dia_maleth_pickpocket_back()
{
	Info_ClearChoices(dia_maleth_pickpocket);
};

