
instance DIA_MILTENNW_EXIT(C_INFO)
{
	npc = pc_mage_nw;
	nr = 999;
	condition = dia_miltennw_exit_condition;
	information = dia_miltennw_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_miltennw_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_miltennw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MILTENNW_KAP3_EXIT(C_INFO)
{
	npc = pc_mage_nw;
	nr = 999;
	condition = dia_miltennw_kap3_exit_condition;
	information = dia_miltennw_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_miltennw_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_miltennw_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MILTENNW_KAP3_HELLO(C_INFO)
{
	npc = pc_mage_nw;
	nr = 31;
	condition = dia_miltennw_kap3_hello_condition;
	information = dia_miltennw_kap3_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_miltennw_kap3_hello_condition()
{
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_miltennw_kap3_hello_info()
{
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_00");	//(nev���cn�) Nejde mi to na rozum. Opravdu jsi paladin?
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_01");	//Evidentn�.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_02");	//(euforicky) Pokud je mezi paladiny n�kdo jako ty, m�li by se m�t Beliarovi poh�nci rad�i na pozoru.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_03");	//Jestli jsi porazil Sp��e, nem�lo by ti p�r sk�et� d�lat sebemen�� pot�e.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_04");	//Ve h�e nejsou jenom sk�eti.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_05");	//To v�m, ale i tak je dobr� t� m�t na sv� stran�.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_06");	//No dobr�.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_07");	//Co d�l� tady v kl�te�e? Nech m� h�dat. Chce� se u�it um�n� magie.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_08");	//Mo�n�.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_09");	//V�d�l jsem to - b� si promluvit s Mardukem, on je zodpov�dn� za v�s paladiny. Najde� ho p�ed kapl�.
	};
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_10");	//Vid�m, �e ty �e�i m�ly pravdu.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_11");	//Jak� �e�i?
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_12");	//�e ses spol�il s t�mi drakobijci.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_13");	//No, nikdy jsi nebyl dobr� materi�l pro c�rkev. A� je to ale jak chce, bojuje� za na�i v�c a to je to, co se po��t�.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_14");	//Je to v�e?
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_15");	//M�m samoz�ejm� radost, a vypad� tak, �e se t� mus� ka�d� sk�et hned leknout.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_16");	//Ve h�e nejsou jenom sk�eti.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_17");	//To v�m, ale i tak s nimi jsou probl�my. Jsi velmi d�le�it�.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_18");	//Porazil jsi Sp��e. Mo�n� jednoho dne budeme v�ichni pot�ebovat pomoc.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_19");	//No dobr�.
	};
};


instance DIA_MILTENNW_MONASTERY(C_INFO)
{
	npc = pc_mage_nw;
	nr = 35;
	condition = dia_miltennw_monastery_condition;
	information = dia_miltennw_monastery_info;
	permanent = FALSE;
	description = "Jak ses dostal do kl�tera tak rychle?";
};


func int dia_miltennw_monastery_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_miltennw_monastery_info()
{
	AI_Output(other,self,"DIA_MiltenNW_Monastery_15_00");	//Jak ses dostal do kl�tera tak rychle?
	AI_Output(self,other,"DIA_MiltenNW_Monastery_03_01");	//Co je to za ot�zku? Propl�il jsem se pr�smykem a nam��il si to rovnou do kl�tera.
	AI_Output(self,other,"DIA_MiltenNW_Monastery_03_02");	//P�izn�v�m, �e nebylo v�dycky snadn� proklouznout mezi t�mi v�emi p��erami, kter� se zabydluj� na t�hle stran� �dol�, ale p�ece jenom jsem m�l m�� probl�m�, ne� jsem �ekal.
};


instance DIA_MILTENNW_FOURFRIENDS(C_INFO)
{
	npc = pc_mage_nw;
	nr = 35;
	condition = dia_miltennw_fourfriends_condition;
	information = dia_miltennw_fourfriends_info;
	permanent = FALSE;
	description = "V�, kde jsou ostatn�?";
};


func int dia_miltennw_fourfriends_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_miltennw_fourfriends_info()
{
	AI_Output(other,self,"DIA_MiltenNW_FourFriends_15_00");	//V�, kde jsou ostatn�?
	if(Npc_IsDead(pc_fighter_nw_vor_djg) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_01");	//Zd� se, �e Gorn se vypo��dal s pobytem v Garondov� v�zen� docela dob�e.
		if(MIS_RESCUEGORN != LOG_SUCCESS)
		{
			AI_Output(other,self,"DIA_MiltenNW_FourFriends_15_02");	//Jak se dostal ven?
			AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_03");	//Musel jsem Garondovi trochu zalhat, abych ho p�esv�d�il, �e m� obvin�n� st�hnout.
			AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_04");	//Ale bude to jen mezi n�mi, rozum�no?
		};
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_05");	//Ka�dop�dn� cht�l j�t za Leem a pod�vat se, co se d�je na farm�.
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_06");	//Po tom blivajzu, co dost�val ve v�zen�, se ur�it� cpe ze v�ech sil. To bude pro z�soby �oldn��� t�k� zkou�ka.
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_07");	//Gorn to nep�e�il.
	};
	if(Npc_IsDead(pc_thief_nw) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_08");	//Diego mumlal n�co o z��tov�n�. Netu��m, co m�l na mysli.
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_09");	//Ale �ekl bych, �e je ve m�st�. Zn� ho - v�dycky se n�co najde.
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_10");	//Diego to koupil - zd� se, �e ho bari�ra p�ece jenom dostala.
	};
};


instance DIA_MILTENNW_KAP3_ENTRY(C_INFO)
{
	npc = pc_mage_nw;
	nr = 32;
	condition = dia_miltennw_kap3_entry_condition;
	information = dia_miltennw_kap3_entry_info;
	permanent = TRUE;
	description = "Pot�ebuji se dostat do kl�tera. Je to d�le�it�!";
};


func int dia_miltennw_kap3_entry_condition()
{
	if((KAPITEL == 3) && (hero.guild != GIL_KDF) && (MILTENNW_GIVESMONASTERYKEY == FALSE))
	{
		return TRUE;
	};
};

func void dia_miltennw_kap3_entry_info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Entry_15_00");	//Pot�ebuji se dostat do kl�tera. Je to d�le�it�!
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_03_01");	//Ano, jist�. Tady je kl��.
		CreateInvItems(self,itke_innos_mis,1);
		b_giveinvitems(self,other,itke_innos_mis,1);
		MILTENNW_GIVESMONASTERYKEY = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_03_02");	//Nem��u t� do kl�tera vpustit. M�l bych probl�my p�ed Nejvy��� radou.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_03_03");	//Bez povolen� m�ch nad��zen�ch nesm�m do kl�tera nikoho vpou�t�t.
		Info_ClearChoices(dia_miltennw_kap3_entry);
		Info_AddChoice(dia_miltennw_kap3_entry,DIALOG_BACK,dia_miltennw_kap3_entry_back);
		Info_AddChoice(dia_miltennw_kap3_entry,"Je to d�le�it�!",dia_miltennw_kap3_entry_important);
		if(Npc_HasItems(other,itwr_permissiontowearinnoseye_mis) >= 1)
		{
			Info_AddChoice(dia_miltennw_kap3_entry,"P�in��m dopis od lorda Hagena.",dia_miltennw_kap3_entry_permit);
		};
	};
};

func void dia_miltennw_kap3_entry_back()
{
	Info_ClearChoices(dia_miltennw_kap3_entry);
};

func void dia_miltennw_kap3_entry_important()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Entry_Important_15_00");	//Je to d�le�it�!
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_Important_03_01");	//To nep�jde. Pyrokar by mi utrhl hlavu.
	Info_ClearChoices(dia_miltennw_kap3_entry);
};

func void dia_miltennw_kap3_entry_permit()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Entry_Permit_15_00");	//P�in��m dopis od lorda Hagena.
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_Permit_03_01");	//Uka� mi ho.
	b_giveinvitems(other,self,itwr_permissiontowearinnoseye_mis,1);
	b_usefakescroll();
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_Permit_03_02");	//(v�hav�) Dobr�. Tady je kl�� od kl�tera. Pyrokar je v kostele.
	CreateInvItems(self,itke_innos_mis,1);
	b_giveinvitems(self,other,itke_innos_mis,1);
	b_giveinvitems(self,other,itwr_permissiontowearinnoseye_mis,1);
	MILTENNW_GIVESMONASTERYKEY = TRUE;
	Info_ClearChoices(dia_miltennw_kap3_entry);
};


instance DIA_MILTENNW_KAP3_NOVIZENCHASE(C_INFO)
{
	npc = pc_mage_nw;
	nr = 31;
	condition = dia_miltennw_kap3_novizenchase_condition;
	information = dia_miltennw_kap3_novizenchase_info;
	permanent = FALSE;
	description = "Nev�, kde je Pedro?";
};


func int dia_miltennw_kap3_novizenchase_condition()
{
	if((KAPITEL == 3) && (MIS_NOVIZENCHASE == LOG_RUNNING) && (MIS_SCKNOWSINNOSEYEISBROKEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_miltennw_kap3_novizenchase_info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_NovizenChase_15_00");	//Nev�, kde je Pedro?
	AI_Output(self,other,"DIA_MiltenNW_KAP3_NovizenChase_03_01");	//Mysl�, �e bych tady jen tak st�l, kdybych v�d�l, kde se ten odpadl�k schov�v�?
	AI_Output(self,other,"DIA_MiltenNW_KAP3_NovizenChase_03_02");	//Mus� zaplatit za sv� �iny. Douf�m, �e se n�m poda�� dostat Oko zp�tky.
	AI_Output(self,other,"DIA_MiltenNW_KAP3_NovizenChase_03_03");	//Mus� n�m pomoci. Najdi ho a p�ines zp�t Innosovo oko.
};


instance DIA_MILTENNW_KAP3_PERM(C_INFO)
{
	npc = pc_mage_nw;
	nr = 39;
	condition = dia_miltennw_kap3_perm_condition;
	information = dia_miltennw_kap3_perm_info;
	permanent = FALSE;
	description = "Nev� n�co o t�ch postav�ch v k�p�ch?";
};


func int dia_miltennw_kap3_perm_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_miltennw_kap3_perm_info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Perm_15_00");	//Nev� n�co o t�ch postav�ch v k�p�ch?
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Perm_03_01");	//Ne, ale nem�m z t�ch chlap�k� dobr� pocit.
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Perm_03_02");	//Pokud na n� naraz�, bu� opatrn�.
};


instance DIA_MILTENNW_KAP4_EXIT(C_INFO)
{
	npc = pc_mage_nw;
	nr = 999;
	condition = dia_miltennw_kap4_exit_condition;
	information = dia_miltennw_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_miltennw_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_miltennw_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MILTENNW_KAP4_PERM(C_INFO)
{
	npc = pc_mage_nw;
	nr = 49;
	condition = dia_miltennw_kap4_perm_condition;
	information = dia_miltennw_kap4_perm_info;
	permanent = TRUE;
	description = "Co je nov�ho?";
};


func int dia_miltennw_kap4_perm_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_miltennw_kap4_perm_info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP4_PERM_15_00");	//Co je nov�ho?
	AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_01");	//Na to bych se m�l zeptat j�. M�me tady dost starost�.
	AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_02");	//Nejvy��� rada se sna�� zjistit, co nep��tel ud�l� p��t�.
	AI_Output(other,self,"DIA_MiltenNW_KAP4_PERM_15_03");	//N�co dal��ho?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_04");	//V posledn� dob� jsou �toky sk�et� �ast�j��, dokonce i mimo Hornick� �dol�.
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_05");	//V�bec se mi to nechce l�bit - mysl�m, �e u� nem�me moc �asu.
	}
	else if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_06");	//Jeden farm�� ��kal, �e pobl� jeho farmy se objevila n�jak� �upinat� stvo�en�.
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_07");	//Nev�m, jak� to d�v� dohromady smysl, ale m�m pocit, �e nep��tel n�co chyst�.
	}
	else if(MIS_FINDTHEOBESESSED == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_08");	//Dost�v�me ��m d�l t�m v�c zpr�v o posedl�ch lidech. Nep��tel je siln�, siln�j��, ne� jsme �ekali.
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_09");	//Ne, situace je st�le v�n�. Jedin� co m��eme d�lat, je v��it v Innose.
	};
};


instance DIA_MILTENNW_KAP5_EXIT(C_INFO)
{
	npc = pc_mage_nw;
	nr = 999;
	condition = dia_miltennw_kap5_exit_condition;
	information = dia_miltennw_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_miltennw_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_miltennw_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MILTENNW_ALLDRAGONSDEAD(C_INFO)
{
	npc = pc_mage_nw;
	nr = 900;
	condition = dia_miltennw_alldragonsdead_condition;
	information = dia_miltennw_alldragonsdead_info;
	permanent = FALSE;
	description = "Pobil jsem v�echny draky.";
};


func int dia_miltennw_alldragonsdead_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_miltennw_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_MiltenNW_AllDragonsDead_15_00");	//Pobil jsem v�echny draky.
	AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_01");	//V�n�? Tak�e nad�je p�ece jenom je�t� �ije. Te� u� zb�v� jen useknout Zlu hlavu.
	AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_02");	//Pokud jsi to v�n� dok�zal, mohli bychom v�lku vyhr�t.
	AI_Output(other,self,"DIA_MiltenNW_AllDragonsDead_15_03");	//Kdo, j�?
	AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_04");	//Samoz�ejm�, �e ty. Kdo jin�?
	if(MILTENNW_ISONBOARD == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_05");	//M�li bychom brzy vyrazit, d��v ne� bude pozd�.
	};
};


instance DIA_MILTENNW_SCWASINLIB(C_INFO)
{
	npc = pc_mage_nw;
	nr = 3;
	condition = dia_miltennw_scwasinlib_condition;
	information = dia_miltennw_scwasinlib_info;
	important = TRUE;
};


func int dia_miltennw_scwasinlib_condition()
{
	if(MIS_SCKNOWSWAYTOIRDORATH == TRUE)
	{
		return TRUE;
	};
};

func void dia_miltennw_scwasinlib_info()
{
	AI_Output(self,other,"DIA_MiltenNW_SCWasInLib_03_00");	//Hej, sly�el jsem, �e jsi str�vil dlouh� �as v kl�tern�ch sklepech. Co jsi zjistil?
};


instance DIA_MILTENNW_KNOWWHEREENEMY(C_INFO)
{
	npc = pc_mage_nw;
	nr = 55;
	condition = dia_miltennw_knowwhereenemy_condition;
	information = dia_miltennw_knowwhereenemy_info;
	permanent = TRUE;
	description = "V�m, kde se nep��tel ukr�v�. Je to mal� ostr�vek nedaleko odsud.";
};


func int dia_miltennw_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (MILTENNW_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};


var int sctoldmiltenheknowwhereenemy;

func void dia_miltennw_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_15_00");	//V�m, kde se nep��tel ukr�v�. Je to mal� ostr�vek nedaleko odsud.
	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_01");	//To je na�e velk� �ance. Mus�me okam�it� vyrazit a zni�it zlo jednou prov�dy.
	SCTOLDMILTENHEKNOWWHEREENEMY = TRUE;
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	if(Npc_IsDead(diegonw) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_02");	//Mluvil jsi o tom s Diegem? Mysl�m, �e by cht�l jet s tebou.
		b_logentry(TOPIC_CREW,"Diego mi m��e velmi pomoci - nikdy dlouho nepobyl na jednom m�st�.");
	};
	if(Npc_IsDead(gornnw_nach_djg) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_03");	//A co Gorn? Promluv si s n�m. Sly�el jsem, �e se vr�til z Hornick�ho �dol�.
		b_logentry(TOPIC_CREW,"Gorn by mi jist� byl tak� zdatn�m pomocn�kem. Nikdy neu�kod�, m�-li po boku zdatn�ho bojovn�ka. Snad by m� mohl trochu vycvi�it.");
	};
	if(Npc_IsDead(lester) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_04");	//A nezapome� na Lestera. Pokud ho nevyt�hne� z toho jeho �dol�, tak tam shnije.
		b_logentry(TOPIC_CREW,"Jestli Lestera nevezmu s sebou, nejsp� se z tohoto �dol� nikdy nedostane.");
	};
	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_05");	//Zn�m tak� svou vlastn� roli, kterou bych m�l hr�t. A� budeme �elit nep��teli, m��u ti pos�lit magickou energii a pom�hat ti p�i vytv��en� run. Kdy za�neme?
	b_logentry(TOPIC_CREW,"P�jde-li Milten se mnou, m��e m� nau�it, jak vyr�b�t runy a zv��it si z�soby many.");
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_15_06");	//Ne tak rychle, u� m�m dost lid�.
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_07");	//V�, �e bych s tebou �el. Pokud si to rozmysl�, budu tady na tebe �ekat.
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_08");	//Hodn� �t�st�, a a� nad tebou Innos dr�� ochrannou ruku.
	}
	else
	{
		Info_ClearChoices(dia_miltennw_knowwhereenemy);
		Info_AddChoice(dia_miltennw_knowwhereenemy,"V tuhle chv�li pro tebe nem�m vyu�it�.",dia_miltennw_knowwhereenemy_no);
		Info_AddChoice(dia_miltennw_knowwhereenemy,"V�tej na palub�!",dia_miltennw_knowwhereenemy_yes);
	};
};

func void dia_miltennw_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_Yes_15_00");	//V�tej na palub�!
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_Yes_15_01");	//Setk�me se v p��stavu. Po�kej tam na m�.
	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_Yes_03_02");	//Dobr�. Budu tam, a� bude� p�ipraven.
	self.flags = NPC_FLAG_IMMORTAL;
	MILTENNW_ISONBOARD = LOG_SUCCESS;
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(dia_miltennw_knowwhereenemy);
};

func void dia_miltennw_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_No_15_00");	//V tuhle chv�li pro tebe nem�m vyu�it�.
	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_No_03_01");	//V�, �e bych to s tebou t�hl a� do konce. Pokud si to rozmysl�, budu tady na tebe �ekat.
	MILTENNW_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_miltennw_knowwhereenemy);
};


instance DIA_MILTENNW_WHERECAPTAIN(C_INFO)
{
	npc = pc_mage_nw;
	nr = 3;
	condition = dia_miltennw_wherecaptain_condition;
	information = dia_miltennw_wherecaptain_info;
	description = "Kde bych m�l hledat kapit�na?";
};


func int dia_miltennw_wherecaptain_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (SCTOLDMILTENHEKNOWWHEREENEMY == TRUE) && (SCGOTCAPTAIN == FALSE))
	{
		return TRUE;
	};
};

func void dia_miltennw_wherecaptain_info()
{
	AI_Output(other,self,"DIA_MiltenNW_WhereCaptain_15_00");	//Kde bych m�l hledat kapit�na?
	AI_Output(self,other,"DIA_MiltenNW_WhereCaptain_03_01");	//Zeptej se Jorgena. Je to konec konc� n�mo�n�k. M�l by b�t je�t� po��d v kl�te�e.
	AI_Output(self,other,"DIA_MiltenNW_WhereCaptain_03_02");	//Ale jestli ti nebude schopen pomoci, bude� muset hledat n�koho, kdo by ti ��dil lo�, na farm�ch nebo ve m�st�.
	AI_Output(self,other,"DIA_MiltenNW_WhereCaptain_03_03");	//Nejlep�� asi bude promluvit si s Leem nebo j�t do p��stavu v Khorinisu. Nic lep��ho m� te� nenapad�.
	Log_CreateTopic(TOPIC_CAPTAIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CAPTAIN,LOG_RUNNING);
	b_logentry(TOPIC_CAPTAIN,"Snad by se mi mohlo poda�it najmout kapit�na - Jorgena. M�l by se je�t� zdr�ovat v kl�te�e. Krom� n�ho bych m�l na statc�ch �i ve m�st� natrefit i na jin� kandid�ty na tuto funkci. Snad bych si mohl promluvit s Leem nebo se poptat po p��stavu.");
};


instance DIA_MILTENNW_LEAVEMYSHIP(C_INFO)
{
	npc = pc_mage_nw;
	nr = 55;
	condition = dia_miltennw_leavemyship_condition;
	information = dia_miltennw_leavemyship_info;
	permanent = TRUE;
	description = "Nakonec t� p�ece jenom nem��u vz�t s sebou.";
};


func int dia_miltennw_leavemyship_condition()
{
	if((MILTENNW_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_miltennw_leavemyship_info()
{
	AI_Output(other,self,"DIA_MiltenNW_LeaveMyShip_15_00");	//Nakonec t� p�ece jenom nem��u vz�t s sebou.
	AI_Output(self,other,"DIA_MiltenNW_LeaveMyShip_03_01");	//S�m mus� nejl�p v�d�t, koho bude� pot�ebovat. Pokud si to rozmysl�, budu na tebe �ekat v kl�te�e.
	MILTENNW_ISONBOARD = LOG_OBSOLETE;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_MILTENNW_STILLNEEDYOU(C_INFO)
{
	npc = pc_mage_nw;
	nr = 55;
	condition = dia_miltennw_stillneedyou_condition;
	information = dia_miltennw_stillneedyou_info;
	permanent = TRUE;
	description = "Pot�ebuji t�.";
};


func int dia_miltennw_stillneedyou_condition()
{
	if(((MILTENNW_ISONBOARD == LOG_OBSOLETE) || (MILTENNW_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_miltennw_stillneedyou_info()
{
	AI_Output(other,self,"DIA_MiltenNW_StillNeedYou_15_00");	//Pot�ebuji t�.
	AI_Output(self,other,"DIA_MiltenNW_StillNeedYou_03_01");	//Bude mi ct�. Poj�me, nem�me �asu nazbyt.
	AI_Output(self,other,"DIA_MiltenNW_StillNeedYou_03_02");	//Jdu do p��stavu. Potk�me se tam.
	self.flags = NPC_FLAG_IMMORTAL;
	MILTENNW_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	AI_StopProcessInfos(self);
};


instance DIA_MILTENNW_TEACH(C_INFO)
{
	npc = pc_mage_nw;
	nr = 90;
	condition = dia_miltennw_teach_condition;
	information = dia_miltennw_teach_info;
	permanent = TRUE;
	description = "Chci se nau�it n�jak� nov� kouzla.";
};


func int dia_miltennw_teach_condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_miltennw_teach_info()
{
	AI_Output(other,self,"DIA_MiltenNW_Teach_15_00");	//Chci se nau�it n�jak� nov� kouzla.
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_ClearChoices(dia_miltennw_teach);
		Info_AddChoice(dia_miltennw_teach,DIALOG_BACK,dia_miltennw_teach_back);
		if(PLAYER_TALENT_RUNES[SPL_WINDFIST] == FALSE)
		{
			Info_AddChoice(dia_miltennw_teach,b_buildlearnstring(NAME_SPL_WINDFIST,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_WINDFIST)),dia_miltennw_teach_windfist);
		};
		if(PLAYER_TALENT_RUNES[SPL_INSTANTFIREBALL] == FALSE)
		{
			Info_AddChoice(dia_miltennw_teach,b_buildlearnstring(NAME_SPL_INSTANTFIREBALL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_INSTANTFIREBALL)),dia_miltennw_teach_feuerball);
		};
		if(PLAYER_TALENT_RUNES[SPL_ICEBOLT] == FALSE)
		{
			Info_AddChoice(dia_miltennw_teach,b_buildlearnstring(NAME_SPL_ICEBOLT,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ICEBOLT)),dia_miltennw_teach_eispfeil);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_Teach_03_01");	//Je�t� jsi nepostoupil do druh�ho Magick�ho kruhu. Nen� nic, co bych t� mohl nau�it.
	};
};

func void dia_miltennw_teach_back()
{
	Info_ClearChoices(dia_miltennw_teach);
};

func void dia_miltennw_teach_windfist()
{
	b_teachplayertalentrunes(self,other,SPL_WINDFIST);
};

func void dia_miltennw_teach_feuerball()
{
	b_teachplayertalentrunes(self,other,SPL_INSTANTFIREBALL);
};

func void dia_miltennw_teach_eispfeil()
{
	b_teachplayertalentrunes(self,other,SPL_ICEBOLT);
};


instance DIA_MILTENNW_MANA(C_INFO)
{
	npc = pc_mage_nw;
	nr = 100;
	condition = dia_miltennw_mana_condition;
	information = dia_miltennw_mana_info;
	permanent = TRUE;
	description = "Cht�l bych pos�lit svoji magickou moc.";
};


func int dia_miltennw_mana_condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_miltennw_mana_info()
{
	AI_Output(other,self,"DIA_MiltenNW_Mana_15_00");	//Cht�l bych pos�lit svoji magickou moc.
	Info_ClearChoices(dia_miltennw_mana);
	Info_AddChoice(dia_miltennw_mana,DIALOG_BACK,dia_miltennw_mana_back);
	Info_AddChoice(dia_miltennw_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_miltennw_mana_1);
	Info_AddChoice(dia_miltennw_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_miltennw_mana_5);
};

func void dia_miltennw_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output(self,other,"DIA_MiltenNW_Mana_03_00");	//Tvoje magick� s�ly jsou velk�. Moc velk� na to, abych ti je pomohl je�t� zv��it.
	};
	Info_ClearChoices(dia_miltennw_mana);
};

func void dia_miltennw_mana_1()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,1,T_MED);
	Info_ClearChoices(dia_miltennw_mana);
	Info_AddChoice(dia_miltennw_mana,DIALOG_BACK,dia_miltennw_mana_back);
	Info_AddChoice(dia_miltennw_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_miltennw_mana_1);
	Info_AddChoice(dia_miltennw_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_miltennw_mana_5);
};

func void dia_miltennw_mana_5()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,5,T_MED);
	Info_ClearChoices(dia_miltennw_mana);
	Info_AddChoice(dia_miltennw_mana,DIALOG_BACK,dia_miltennw_mana_back);
	Info_AddChoice(dia_miltennw_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_miltennw_mana_1);
	Info_AddChoice(dia_miltennw_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_miltennw_mana_5);
};


instance DIA_MAGE_NW_PICKPOCKET(C_INFO)
{
	npc = pc_mage_nw;
	nr = 900;
	condition = dia_mage_nw_pickpocket_condition;
	information = dia_mage_nw_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_mage_nw_pickpocket_condition()
{
	return c_beklauen(56,75);
};

func void dia_mage_nw_pickpocket_info()
{
	Info_ClearChoices(dia_mage_nw_pickpocket);
	Info_AddChoice(dia_mage_nw_pickpocket,DIALOG_BACK,dia_mage_nw_pickpocket_back);
	Info_AddChoice(dia_mage_nw_pickpocket,DIALOG_PICKPOCKET,dia_mage_nw_pickpocket_doit);
};

func void dia_mage_nw_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_mage_nw_pickpocket);
};

func void dia_mage_nw_pickpocket_back()
{
	Info_ClearChoices(dia_mage_nw_pickpocket);
};

