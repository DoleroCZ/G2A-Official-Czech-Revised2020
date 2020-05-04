
instance DIA_HARAD_EXIT(C_INFO)
{
	npc = vlk_412_harad;
	nr = 999;
	condition = dia_harad_exit_condition;
	information = dia_harad_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_harad_exit_condition()
{
	return TRUE;
};

func void dia_harad_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HARAD_HALLO(C_INFO)
{
	npc = vlk_412_harad;
	nr = 2;
	condition = dia_harad_hallo_condition;
	information = dia_harad_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_harad_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_harad_hallo_info()
{
	AI_Output(self,other,"DIA_Harad_Hallo_12_00");	//(nevrle) Co chce�?
};


instance DIA_HARAD_ARBEIT(C_INFO)
{
	npc = vlk_412_harad;
	nr = 1;
	condition = dia_harad_arbeit_condition;
	information = dia_harad_arbeit_info;
	permanent = FALSE;
	description = "Hled�m pr�ci!";
};


func int dia_harad_arbeit_condition()
{
	return TRUE;
};

func void dia_harad_arbeit_info()
{
	AI_Output(other,self,"DIA_Harad_Arbeit_15_00");	//Hled�m pr�ci!
	AI_Output(self,other,"DIA_Harad_Arbeit_12_01");	//Hm - hodil by se mi nov� u�edn�k.
	AI_Output(self,other,"DIA_Harad_Arbeit_12_02");	//Brian brzy dokon�� sv� u�en� a potom opust� m�sto.
	AI_Output(self,other,"DIA_Harad_Arbeit_12_03");	//Um� n�co?
	AI_Output(other,self,"DIA_Harad_Arbeit_15_04");	//Jestli m� na mysli kov��stv�...
	AI_Output(self,other,"DIA_Harad_Arbeit_12_05");	//Ne, to jsem zrovna nemyslel.
	AI_Output(self,other,"DIA_Harad_Arbeit_12_06");	//D��v nebo pozd�ji sk�eti cel� tohle m�sto obkl��� a pak budou n�co platn� pouze ti, kte�� je dok�� ubr�nit.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Harad_Arbeit_12_07");	//A j� si do u�en� nevezmu ��dn�ho budi�kni�emu, kter� p�i prvn� zn�mce pot�� ute�e z m�sta se �enami a ostatn�mi poseroutky, m�sto aby z�stal tady a br�nil pevnost.
	};
	Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
	b_logentry(TOPIC_LEHRLING,"Pokud se mi poda�� p�esv�d�it Harada, �e nejsem ��dn� budi�kni�emu, p�ijme m� za sv�ho u�n�.");
};


instance DIA_HARAD_TAUGENICHTS(C_INFO)
{
	npc = vlk_412_harad;
	nr = 1;
	condition = dia_harad_taugenichts_condition;
	information = dia_harad_taugenichts_info;
	permanent = FALSE;
	description = "J� nejsem ��dn� budi�kni�emu!";
};


func int dia_harad_taugenichts_condition()
{
	if(Npc_KnowsInfo(other,dia_harad_arbeit))
	{
		return TRUE;
	};
};

func void dia_harad_taugenichts_info()
{
	AI_Output(other,self,"DIA_Harad_Taugenichts_15_00");	//J� nejsem ��dn� budi�kni�emu!
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_01");	//To jsou siln� slova! M��e� to ale podlo�it i n�jak�mi skutky?
	AI_Output(other,self,"DIA_Harad_Taugenichts_15_02");	//A to jak�mi?
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_03");	//P�ines mi n�jakou sk�et� zbra�.
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_04");	//Sk�eti u� byli zpozorov�ni p��mo u m�sta, tak�e s trochou �t�st� nebude� hledat dlouho.
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_05");	//Jestli se ti povede n�jak�ho skolit, pak t� p�ijmu do u�en�.
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_06");	//Pokud s t�m tedy budou souhlasit i ostatn� mist�i.
	MIS_HARAD_ORC = LOG_RUNNING;
	Log_CreateTopic(TOPIC_HARADORK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HARADORK,LOG_RUNNING);
	b_logentry(TOPIC_HARADORK,"Za m�stem se usadil sk�et, kter�ho m�m na prosbu kov��e Harada zab�t. Jako d�kaz mu posta�� jak�koliv sk�et� zbra�.");
};


instance DIA_HARAD_ORCRUNNING(C_INFO)
{
	npc = vlk_412_harad;
	nr = 1;
	condition = dia_harad_orcrunning_condition;
	information = dia_harad_orcrunning_info;
	permanent = FALSE;
	description = "Promluvme si je�t� o t� sk�et� v�ci...";
};


func int dia_harad_orcrunning_condition()
{
	if((MIS_HARAD_ORC == LOG_RUNNING) && (HARAD_HAKONMISSION == FALSE))
	{
		return TRUE;
	};
};

func void dia_harad_orcrunning_info()
{
	AI_Output(other,self,"DIA_Harad_OrcRunning_15_00");	//Promluvme si je�t� o t� sk�et� v�ci...
	AI_Output(self,other,"DIA_Harad_OrcRunning_12_01");	//(stroze) Co?
	Info_ClearChoices(dia_harad_orcrunning);
	Info_AddChoice(dia_harad_orcrunning,"Tv�j sk�et u� je te� mrtv�!",dia_harad_orcrunning_done);
	Info_AddChoice(dia_harad_orcrunning,"Sk�et je zatracen� tuh� protivn�k...",dia_harad_orcrunning_toohard);
};

func void dia_harad_orcrunning_toohard()
{
	AI_Output(other,self,"DIA_Harad_OrcRunning_TooHard_15_00");	//Ale sk�et je zatracen� tuh� protivn�k.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_01");	//Hm - jak tak na tebe kouk�m, mo�n� m� pravdu. Jsi fakt docela vy�le, ale to se m��e zm�nit.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_02");	//Stejn� mi mus� dok�zat, �e se neboj� bojovat.
	AI_Output(other,self,"DIA_Harad_OrcRunning_TooHard_15_03");	//Tak�e by to mohlo b�t n�co men��ho?
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_04");	//Hm - (p�em��l�) Hakon, co na tr�i�ti obchoduje se zbran�mi, se mi sv��il, �e ho p�ed p�r dny p�epadli banditi.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_05");	//Pr� se potuluj� n�kde za ji�n� branou.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_06");	//Ti zbab�l� lupi�i nejsp� moc rozumu nepobrali.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_07");	//Tak je v�echny pochytej - a� do posledn�ho! Tak mi dok�e�, �e n�m tady ve m�st� snad p�ece jen bude� n�co platn�.
	HARAD_HAKONMISSION = TRUE;
	Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
	if(MIS_HAKONBANDITS != LOG_RUNNING)
	{
		b_logentry(TOPIC_LEHRLING,"Harad mi �ekl, �e n�jac� bandit� okradli za m�stem kupce Hakona. Jestli se mi je poda�� dostihnout, p�esv�d��m ho, �e za n�co stoj�m. M�l bych si tedy promluvit s Hakonem - snad bude sp� v�d�t, kde se ti bandit� potloukaj�.");
	}
	else
	{
		b_logentry(TOPIC_LEHRLING,"Harad mi �ekl, �e n�jac� bandit� okradli za m�stem kupce Hakona. Jestli se mi je poda�� dostihnout, p�esv�d��m ho, �e za n�co stoj�m.");
	};
	Info_ClearChoices(dia_harad_orcrunning);
};

func void dia_harad_orcrunning_done()
{
	AI_Output(other,self,"DIA_Harad_OrcRunning_Done_15_00");	//Jako by ten sk�et byl u� te� mrtv�!
	AI_Output(self,other,"DIA_Harad_OrcRunning_Done_12_01");	//Dob�e! Tak te� p�esta� pl�tvat dechem a koukej, a� za tebe mluv� �iny!
	Info_ClearChoices(dia_harad_orcrunning);
};


instance DIA_HARAD_ORCSUCCESS(C_INFO)
{
	npc = vlk_412_harad;
	nr = 1;
	condition = dia_harad_orcsuccess_condition;
	information = dia_harad_orcsuccess_info;
	permanent = FALSE;
	description = "Z�skal jsem tu sk�et� zbra�, jak jsi cht�l.";
};


func int dia_harad_orcsuccess_condition()
{
	if(MIS_HARAD_ORC == LOG_RUNNING)
	{
		if((Npc_HasItems(other,itmw_2h_orcaxe_01) > 0) || (Npc_HasItems(other,itmw_2h_orcaxe_02) > 0) || (Npc_HasItems(other,itmw_2h_orcaxe_03) > 0) || (Npc_HasItems(other,itmw_2h_orcaxe_04) > 0) || (Npc_HasItems(other,itmw_2h_orcsword_01) > 0))
		{
			return TRUE;
		};
	};
};

func void dia_harad_orcsuccess_info()
{
	AI_Output(other,self,"DIA_Harad_OrcSuccess_15_00");	//Z�skal jsem tu sk�et� zbra�, jak jsi cht�l.
	AI_Output(self,other,"DIA_Harad_OrcSuccess_12_01");	//Uka�...
	if(Npc_HasItems(other,itmw_2h_orcaxe_01) > 0)
	{
		b_giveinvitems(other,self,itmw_2h_orcaxe_01,1);
	}
	else if(Npc_HasItems(other,itmw_2h_orcaxe_02) > 0)
	{
		b_giveinvitems(other,self,itmw_2h_orcaxe_02,1);
	}
	else if(Npc_HasItems(other,itmw_2h_orcaxe_03) > 0)
	{
		b_giveinvitems(other,self,itmw_2h_orcaxe_03,1);
	}
	else if(Npc_HasItems(other,itmw_2h_orcaxe_04) > 0)
	{
		b_giveinvitems(other,self,itmw_2h_orcaxe_04,1);
	}
	else
	{
		b_giveinvitems(other,self,itmw_2h_orcsword_01,1);
	};
	if(HARAD_HAKONMISSION == TRUE)
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_02");	//Tak tys to P�ECE dok�zal! Tos tedy fakt dobr�!
	};
	AI_Output(self,other,"DIA_Harad_OrcSuccess_12_03");	//Takovou zbra� u� jsem nem�l v ruce, ani nepamatuju - naposledy, kdy� jsem slou�il jako voj�k ve sk�et� v�lce.
	AI_Output(self,other,"DIA_Harad_OrcSuccess_12_04");	//To byly kru�n� �asy, to ti pov�m.
	if(PLAYER_ISAPPRENTICE == APP_HARAD)
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_05");	//J� v�d�l, �e ud�l�m dob�e, kdy� t� p�ijmu do u�en�. Skv�l� pr�ce!
	}
	else if(PLAYER_ISAPPRENTICE == APP_NONE)
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_06");	//Nev��il jsem, �e to zvl�dne�. Je to obdivuhodn�.
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_07");	//�koda �e ses rozhodl pro jinou dr�hu.
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_08");	//Opravdu bych tu pro tebe na�el uplatn�n�.
	};
	MIS_HARAD_ORC = LOG_SUCCESS;
	b_giveplayerxp(XP_HARAD_ORC);
	b_logentry(TOPIC_LEHRLING,"Harad m� p�ijme jako sv�ho u�edn�ka, pokud s t�m budou souhlasit i ostatn� mist�i.");
};


var int harad_startguild;

instance DIA_HARAD_LEHRLING(C_INFO)
{
	npc = vlk_412_harad;
	nr = 1;
	condition = dia_harad_lehrling_condition;
	information = dia_harad_lehrling_info;
	permanent = TRUE;
	description = "Kdy m��u jako tv�j u�edn�k za��t?";
};


func int dia_harad_lehrling_condition()
{
	if(Npc_KnowsInfo(other,dia_harad_arbeit) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_harad_lehrling_info()
{
	var int stimmen;
	stimmen = 0;
	AI_Output(other,self,"DIA_Harad_LEHRLING_15_00");	//Kdy m��u jako tv�j u�edn�k za��t?
	if((MIS_HARAD_ORC == LOG_SUCCESS) || ((MIS_HAKONBANDITS == LOG_SUCCESS) && (HARAD_HAKONMISSION == TRUE)))
	{
		if(MIS_HARAD_ORC == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_01");	//Chlap, kter� dok�e skolit sk�eta, se n�m opravdu hod�.
			if(MIS_HAKONBANDITS == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_02");	//Krom toho se mi Hakon pochlubil, jak state�n� ses vypo��dal s bandity. To t� �lecht�!
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_03");	//Sice jsi nezabil ��dn�ho sk�eta, ale Hakon se chlubil, jak skv�le ses vypo��dal s bandity. To t� �lecht�!
		};
		AI_Output(self,other,"DIA_Harad_LEHRLING_12_04");	//Co se m� t��e, m��e� za��t t�eba hned.
		stimmen = stimmen + 1;
		AI_Output(self,other,"DIA_Harad_LEHRLING_12_05");	//A co se t��e ostatn�ch mistr�...
		if(thorben.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(MIS_THORBEN_GETBLESSINGS == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_06");	//Thorben ti dal sv� po�ehn�n�.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_07");	//Star� dobr� Thorben by byl r�d, kdyby sis nap�ed vyprosil bo�� po�ehn�n�. Mysl�m, �e to je dobr� n�pad.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_08");	//Thorben pr� s tebou je�t� nikdy nemluvil.
		};
		if(bosper.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_09");	//Bosper se mi to sna�il vymluvit - chce t� toti� za u�edn�ka s�m.
			if((MIS_BOSPER_BOGEN == LOG_SUCCESS) || (MIS_BOSPER_WOLFFURS == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_10");	//M�l jsem s n�m na tohle t�ma kr�tkou, ale ostrou diskusi.
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_11");	//Nakonec souhlasil.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_12");	//Po��dal m�, zda bych mu nedovolil, aby ti mohl svou profesi aspo� p�edstavit.
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_13");	//Tak�e si to omrkni - potom se m��e� v�dycky rozhodnout. Tedy leda �e bys necht�l jeho hlas, samoz�ejm�.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_14");	//A Bosper t� zat�m v�bec nezn�.
		};
		if(constantino.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(b_getgreatestpetzcrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_15");	//Constantinovi je jako v�dycky v�ecko jedno. Co se jeho t��e, tak pr� m��e� za��t, u koho chce�.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_16");	//Constantino tvrd�, �es tady ve m�st� sp�chal n�jak� zlo�in - je to pravda?
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_17");	//Jestli jo, tak bys to m�l j�t okam�it� napravit!
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_18");	//Constantino o tob� je�t� nikdy nesly�el.
		};
		if(matteo.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(MIS_MATTEO_GOLD == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_19");	//A Matteo hl�s�, �es mu vr�til jeho zlato. Zd� se mi, �e jsi opravdu �estn� mu�.
				stimmen = stimmen + 1;
			}
			else if(MIS_MATTEO_GOLD == LOG_RUNNING)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_20");	//A Matteo hl�s�, �e mu je�t� po��d n�co dlu��. Nev�m, co mezi sebou m�te, ale m�l bys to d�t rychle do po��dku.
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_21");	//A Matteo pr� s tebou na tohle t�ma je�t� v�bec nemluvil.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_22");	//A Matteo t� pr� ve sv�m kr�mku je�t� nevid�l.
		};
		if(stimmen >= 4)
		{
			if(stimmen == 5)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_23");	//To znamen�, �es z�skal doporu�en� ode v�ech mistr�!
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_24");	//To znamen�, �es z�skal doporu�en� od �ty� mistr�. Co� pro p�ijet� do u�en� sta��.
			};
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_25");	//Chce� tedy vstoupit do u�en� ke mn�?
			Info_ClearChoices(dia_harad_lehrling);
			Info_AddChoice(dia_harad_lehrling,"Dob�e - rozmysl�m si to.",dia_harad_lehrling_later);
			Info_AddChoice(dia_harad_lehrling,"Jdu do toho!",dia_harad_lehrling_ok);
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_26");	//Pot�ebuje� doporu�en� alespo� od �ty� mistr�, jinak t� nikdo v doln� ��sti m�sta do u�en� nep�ijme.
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_27");	//M�l by sis proto promluvit se v�emi, kter� jsi je�t� nep�esv�d�il.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_LEHRLING_12_28");	//Dokud mi nedok�e�, �e nejsi �pln� budi�kni�emu, nem� �anci.
	};
};

func void dia_harad_lehrling_ok()
{
	AI_Output(other,self,"DIA_Harad_LEHRLING_OK_15_00");	//Jdu do toho!
	AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_01");	//V�born�! A te� t� nau��m, jak vykovat p�kn� me�.
	if(PLAYER_TALENT_SMITH[WEAPON_COMMON] == TRUE)
	{
		AI_Output(other,self,"DIA_Harad_LEHRLING_OK_15_02");	//To u� um�m!
		AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_03");	//No tak t�m l�p!
	};
	if(other.attribute[ATR_STRENGTH] < (T_MED - 30))
	{
		AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_04");	//Krom toho bys m�l taky trochu posilovat. V�dy� se mi �pln� ztr�c� p�ed o�ima!
	};
	PLAYER_ISAPPRENTICE = APP_HARAD;
	Npc_ExchangeRoutine(lothar,"START");
	HARAD_STARTGUILD = other.guild;
	HARAD_LEHRLING_DAY = Wld_GetDay();
	Wld_AssignRoomToGuild("schmied",GIL_NONE);
	MIS_APPRENTICE = LOG_SUCCESS;
	b_logentry(TOPIC_BONUS,"Harad m� p�ijal za u�edn�ka. Nyn� m�m p��stup i do horn� �tvrti.");
	b_logentry(TOPIC_BONUS,"Harad za dobrou cenu odkoup� zbran�, kter� vykov�m.");
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_giveplayerxp(XP_LEHRLING);
	b_logentry(TOPIC_CITYTEACHER,"Harad m� vyu�� kov��sk�mu um�n� a tak� se s jeho pomoc� mohu st�t siln�j��m.");
	Info_ClearChoices(dia_harad_lehrling);
};

func void dia_harad_lehrling_later()
{
	AI_Output(other,self,"DIA_Harad_LEHRLING_Later_15_00");	//Dob�e - rozmysl�m si to.
	if(!Npc_IsDead(brian))
	{
		AI_Output(self,other,"DIA_Harad_LEHRLING_Later_12_01");	//��dn� sp�ch, Brian tu je�t� n�jakou dobu z�stane.
	};
	Info_ClearChoices(dia_harad_lehrling);
};


instance DIA_HARAD_ZUSTIMMUNG(C_INFO)
{
	npc = vlk_412_harad;
	nr = 2;
	condition = dia_harad_zustimmung_condition;
	information = dia_harad_zustimmung_info;
	permanent = TRUE;
	description = "Mohu se zapsat do u�en� k n�kter�mu z ostatn�ch mistr�?";
};


func int dia_harad_zustimmung_condition()
{
	if((PLAYER_ISAPPRENTICE == APP_NONE) && Npc_KnowsInfo(other,dia_harad_arbeit))
	{
		return TRUE;
	};
};


var int dia_harad_zustimmung_permanent;

func void dia_harad_zustimmung_info()
{
	AI_Output(other,self,"DIA_Harad_Zustimmung_15_00");	//Mohu se zapsat do u�en� k n�kter�mu z ostatn�ch mistr�?
	if((MIS_HARAD_ORC == LOG_SUCCESS) || ((MIS_HAKONBANDITS == LOG_SUCCESS) && (HARAD_HAKONMISSION == TRUE)))
	{
		AI_Output(self,other,"DIA_Harad_Zustimmung_12_01");	//Jsi dobr� �lov�k.
		if(MIS_HAKONBANDITS == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Harad_Zustimmung_12_02");	//Hakon mi l��il, jak ses vypo��dal s bandity.
		};
		AI_Output(self,other,"DIA_Harad_Zustimmung_12_03");	//D�m ti sv� doporu�en�.
		if(DIA_HARAD_ZUSTIMMUNG_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_ZUSTIMMUNG);
			DIA_HARAD_ZUSTIMMUNG_PERMANENT = TRUE;
		};
		b_logentry(TOPIC_LEHRLING,"Harad m� doporu��, pokud se budu cht�t st�t u�edn�kem n�kde jinde.");
		if(!Npc_IsDead(brian))
		{
			AI_Output(self,other,"DIA_Harad_Zustimmung_12_04");	//Brian tu je�t� n�jakou dobu pobude. A �asem jist� najdu jin�ho sil�ka, kter� ho zastoup�.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_Zustimmung_12_05");	//Ostatn� mist�i ti sv� svolen� klidn� d�t mohou, ale j� t� nedoporu��m, dokud m� nep�esv�d��, �e nejsi jenom neschopn� jelito!
	};
};


var int harad_milkommentar;
var int harad_palkommentar;
var int harad_innoskommentar;

instance DIA_HARAD_ALSLEHRLING(C_INFO)
{
	npc = vlk_412_harad;
	nr = 1;
	condition = dia_harad_alslehrling_condition;
	information = dia_harad_alslehrling_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_harad_alslehrling_condition()
{
	if((PLAYER_ISAPPRENTICE == APP_HARAD) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_harad_alslehrling_info()
{
	if((other.guild == GIL_MIL) && (HARAD_STARTGUILD != GIL_MIL) && (HARAD_MILKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_00");	//Tak�e tys vstoupil do �ad domobrany? Jsem na tebe hrd�!
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_01");	//B�hem slu�by v arm�d� nejsp� nebude� moci z�rove� plnit sv� u�ednick� povinnosti. Ani to od tebe ne�ek�m.
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_02");	//Ale kdy� bude� n�co pot�ebovat, klidn� p�ij�.
		HARAD_MILKOMMENTAR = TRUE;
	}
	else if((other.guild == GIL_PAL) && (HARAD_STARTGUILD != GIL_PAL) && (HARAD_PALKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_03");	//Kouk�m, �e ses dok�zal dostat mezi paladiny!
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_04");	//Jsem r�d, �e jsem t� p�ijal do u�en�. I kdy� jsi za kovadlinou zrovna moc �asu nestr�vil.
		HARAD_PALKOMMENTAR = TRUE;
	}
	else if(((other.guild == GIL_NOV) || (other.guild == GIL_KDF)) && (HARAD_STARTGUILD != GIL_NOV) && (HARAD_STARTGUILD != GIL_KDF) && (HARAD_INNOSKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_05");	//Tak�e tys vstoupil do kl�tera. J� osobn� bych byl rad�i, kdybys z�stal ve m�st�. Pot�ebujeme ka�d�ho mu�e.
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_06");	//Ale kdy� t� Innos povolal, asi to tak m� b�t.
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_07");	//Kdy� bude� n�co pot�ebovat, jsem ti v�dycky k dispozici.
		HARAD_INNOSKOMMENTAR = TRUE;
	}
	else if((HARAD_LEHRLING_DAY <= (Wld_GetDay() - 4)) && (HARAD_MILKOMMENTAR == FALSE) && (HARAD_PALKOMMENTAR == FALSE) && (HARAD_INNOSKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_08");	//U� ses tu hezkou dobu neuk�zal. Kdepak ses toulal, co?
		HARAD_LEHRLING_DAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_09");	//Tak t� tu m�me zas.
		HARAD_LEHRLING_DAY = Wld_GetDay();
	};
};


instance DIA_HARAD_WAFFEN(C_INFO)
{
	npc = vlk_412_harad;
	nr = 3;
	condition = dia_harad_waffen_condition;
	information = dia_harad_waffen_info;
	permanent = FALSE;
	description = "Prod�v� tak� zbran�?";
};


func int dia_harad_waffen_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_harad_waffen_info()
{
	AI_Output(other,self,"DIA_Harad_Waffen_15_00");	//Prod�v� tak� zbran�?
	AI_Output(self,other,"DIA_Harad_Waffen_12_01");	//Na to zapome�. V�echno, co vyrob�m, si berou paladinov� nebo domobrana.
	AI_Output(self,other,"DIA_Harad_Add_12_00");	//Od lorda Hagena jsem dostal zak�zku na 100 me�� - chce s nimi vybavit m�stskou str�.
};


instance DIA_HARAD_AUFGABEN(C_INFO)
{
	npc = vlk_412_harad;
	nr = 1;
	condition = dia_harad_aufgaben_condition;
	information = dia_harad_aufgaben_info;
	permanent = FALSE;
	description = "Jak� m�m jako u�edn�k povinnosti?";
};


func int dia_harad_aufgaben_condition()
{
	if(PLAYER_ISAPPRENTICE == APP_HARAD)
	{
		return TRUE;
	};
};

func void dia_harad_aufgaben_info()
{
	AI_Output(other,self,"DIA_Harad_Aufgaben_15_00");	//Jak� m�m jako u�edn�k povinnosti?
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_01");	//Celkem t�i.
	AI_Output(other,self,"DIA_Harad_Aufgaben_15_02");	//Kovat, kovat a kovat.
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_03");	//Nejsi tak hloup�, jak vypad�. Za ka�d� me� ti zaplat�m - tak�e kdy� se bude� fl�kat, ��dn� pen�zky se neposypou. Jak prost�.
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_05");	//Krom toho t� m��u nau�it, jak vyrobit prost� me�.
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_06");	//Magick� me�e mohou vyr�b�t pouze zku�en� kov��i - a k tomu m� je�t� hodn� daleko.
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_07");	//Jestli pot�ebuje� nocleh, m��e� se ulo�it n�kde v m�m dom�. U� je ti v�echno jasn�?
};


instance DIA_HARAD_SELLBLADES(C_INFO)
{
	npc = vlk_412_harad;
	nr = 200;
	condition = dia_harad_sellblades_condition;
	information = dia_harad_sellblades_info;
	permanent = TRUE;
	description = "Cht�l bych prodat zbran�, co jsem vykoval.";
};


func int dia_harad_sellblades_condition()
{
	if(PLAYER_ISAPPRENTICE == APP_HARAD)
	{
		return TRUE;
	};
};

func void dia_harad_sellblades_info()
{
	var C_ITEM equipweap;
	var int anzahl_common;
	var int anzahl_schwert1;
	var int anzahl_schwert4;
	var int anzahl_rubinklinge;
	var int anzahl_elbastardo;
	var int gesamt;
	var string concattext;
	var int lohn;
	AI_Output(other,self,"DIA_Harad_SellBlades_15_00");	//Cht�l bych prodat zbran�, co jsem vykoval.
	equipweap = Npc_GetEquippedMeleeWeapon(other);
	anzahl_common = Npc_HasItems(other,itmw_1h_common_01);
	if(Hlp_IsItem(equipweap,itmw_1h_common_01) == TRUE)
	{
		anzahl_common = anzahl_common - 1;
	};
	anzahl_schwert1 = Npc_HasItems(other,itmw_schwert1);
	if(Hlp_IsItem(equipweap,itmw_schwert1) == TRUE)
	{
		anzahl_schwert1 = anzahl_schwert1 - 1;
	};
	anzahl_schwert4 = Npc_HasItems(other,itmw_schwert4);
	if(Hlp_IsItem(equipweap,itmw_schwert4) == TRUE)
	{
		anzahl_schwert4 = anzahl_schwert4 - 1;
	};
	anzahl_rubinklinge = Npc_HasItems(other,itmw_rubinklinge);
	if(Hlp_IsItem(equipweap,itmw_rubinklinge) == TRUE)
	{
		anzahl_rubinklinge = anzahl_rubinklinge - 1;
	};
	anzahl_elbastardo = Npc_HasItems(other,itmw_elbastardo);
	if(Hlp_IsItem(equipweap,itmw_elbastardo) == TRUE)
	{
		anzahl_elbastardo = anzahl_elbastardo - 1;
	};
	gesamt = anzahl_common + anzahl_schwert1 + anzahl_schwert4 + anzahl_rubinklinge + anzahl_elbastardo;
	if(gesamt == 0)
	{
		if((Hlp_IsItem(equipweap,itmw_1h_common_01) == TRUE) || (Hlp_IsItem(equipweap,itmw_schwert1) == TRUE) || (Hlp_IsItem(equipweap,itmw_schwert4) == TRUE) || (Hlp_IsItem(equipweap,itmw_rubinklinge) == TRUE) || (Hlp_IsItem(equipweap,itmw_elbastardo) == TRUE))
		{
			AI_Output(self,other,"DIA_Harad_SellBlades_12_01");	//Jedinou, kterou bych mohl p�ijmout, m� zrovna p�ipnutou u pasu, a tu si rad�i nechej.
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_SellBlades_12_04");	//Tak n�jak� vykovej! P�ij�m�m pouze prost� me�e.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_SellBlades_12_02");	//Prima - dej to sem.
		Npc_RemoveInvItems(other,itmw_1h_common_01,anzahl_common);
		Npc_RemoveInvItems(other,itmw_schwert1,anzahl_schwert1);
		Npc_RemoveInvItems(other,itmw_schwert4,anzahl_schwert4);
		Npc_RemoveInvItems(other,itmw_rubinklinge,anzahl_rubinklinge);
		Npc_RemoveInvItems(other,itmw_elbastardo,anzahl_elbastardo);
		concattext = ConcatStrings(IntToString(gesamt),PRINT_ITEMSGEGEBEN);
		AI_PrintScreen(concattext,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
		AI_Output(self,other,"DIA_Harad_SellBlades_12_03");	//Tak, a tady m� v�platu.
		lohn = (anzahl_common * VALUE_COMMON1) + (anzahl_schwert1 * VALUE_SCHWERT1) + (anzahl_schwert4 * VALUE_SCHWERT4) + (anzahl_rubinklinge * VALUE_RUBINKLINGE) + (anzahl_elbastardo * VALUE_ELBASTARDO);
		lohn = lohn / 3;
		b_giveinvitems(self,other,itmi_gold,lohn);
	};
};

func void b_harad_teachsmith()
{
	AI_Output(self,other,"DIA_Harad_TeachCommon_12_01");	//Je to docela snadn�, hochu. Sta�� m�t kousek surov� oceli a podr�et ji v ohni, dokud nez�erven�.
	AI_Output(self,other,"DIA_Harad_TeachCommon_12_02");	//Pak �epel na kovadlin� n�le�it� vyklepe�.
};

func void b_haradsmithchoices()
{
	Info_ClearChoices(dia_harad_teachsmith);
	Info_AddChoice(dia_harad_teachsmith,DIALOG_BACK,dia_harad_teachsmith_back);
	if((PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_04] == FALSE) && (PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_03] == TRUE))
	{
		Info_AddChoice(dia_harad_teachsmith,b_buildlearnstring(NAME_ADDON_HARAD_04,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_1H_HARAD_04)),dia_harad_teachsmith_harad04);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_03] == FALSE) && (PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_02] == TRUE))
	{
		Info_AddChoice(dia_harad_teachsmith,b_buildlearnstring(NAME_ADDON_HARAD_03,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_1H_HARAD_03)),dia_harad_teachsmith_harad03);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_02] == FALSE) && (PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_01] == TRUE))
	{
		Info_AddChoice(dia_harad_teachsmith,b_buildlearnstring(NAME_ADDON_HARAD_02,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_1H_HARAD_02)),dia_harad_teachsmith_harad02);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_01] == FALSE) && (PLAYER_TALENT_SMITH[WEAPON_COMMON] == TRUE))
	{
		Info_AddChoice(dia_harad_teachsmith,b_buildlearnstring(NAME_ADDON_HARAD_01,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_1H_HARAD_01)),dia_harad_teachsmith_harad01);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_COMMON] == FALSE)
	{
		Info_AddChoice(dia_harad_teachsmith,b_buildlearnstring("Nau� m� kov�n�",b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_COMMON)),dia_harad_teachsmith_common);
	};
};


instance DIA_HARAD_TEACHSMITH(C_INFO)
{
	npc = vlk_412_harad;
	nr = 50;
	condition = dia_harad_teachsmith_condition;
	information = dia_harad_teachsmith_info;
	permanent = TRUE;
	description = "Nau� m� vykovat prost� me�!";
};


func int dia_harad_teachsmith_condition()
{
	if(PLAYER_ISAPPRENTICE == APP_HARAD)
	{
		if((PLAYER_TALENT_SMITH[WEAPON_COMMON] == FALSE) || (PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_01] == FALSE) || (PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_02] == FALSE) || (PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_03] == FALSE) || (PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_04] == FALSE))
		{
			return TRUE;
		};
	};
};

func void dia_harad_teachsmith_info()
{
	AI_Output(other,self,"DIA_Harad_TeachCommon_15_00");	//Nau� m� vykovat prost� me�!
	b_haradsmithchoices();
};

func void dia_harad_teachsmith_back()
{
	Info_ClearChoices(dia_harad_teachsmith);
};

func void dia_harad_teachsmith_common()
{
	if(b_teachplayertalentsmith(self,other,WEAPON_COMMON))
	{
		b_harad_teachsmith();
		AI_Output(self,other,"DIA_Harad_TeachCommon_12_03");	//Napoprv� to asi nebude ��dn� z�zrak, ale v�echno ostatn� se �asem taky nau��.
	};
	b_haradsmithchoices();
};

func void dia_harad_teachsmith_harad01()
{
	if(b_teachplayertalentsmith(self,other,WEAPON_1H_HARAD_01))
	{
		b_harad_teachsmith();
	};
	b_haradsmithchoices();
};

func void dia_harad_teachsmith_harad02()
{
	if(b_teachplayertalentsmith(self,other,WEAPON_1H_HARAD_02))
	{
		b_harad_teachsmith();
	};
	b_haradsmithchoices();
};

func void dia_harad_teachsmith_harad03()
{
	if(b_teachplayertalentsmith(self,other,WEAPON_1H_HARAD_03))
	{
		b_harad_teachsmith();
	};
	b_haradsmithchoices();
};

func void dia_harad_teachsmith_harad04()
{
	if(b_teachplayertalentsmith(self,other,WEAPON_1H_HARAD_04))
	{
		b_harad_teachsmith();
	};
	b_haradsmithchoices();
};


var int harad_merke_str;

instance DIA_HARAD_TEACHSTR(C_INFO)
{
	npc = vlk_412_harad;
	nr = 100;
	condition = dia_harad_teachstr_condition;
	information = dia_harad_teachstr_info;
	permanent = 1;
	description = "Chci se st�t siln�j��m!";
};


func int dia_harad_teachstr_condition()
{
	if(PLAYER_ISAPPRENTICE == APP_HARAD)
	{
		return TRUE;
	};
};

func void dia_harad_teachstr_info()
{
	AI_Output(other,self,"DIA_Harad_TeachSTR_15_00");	//Chci se st�t siln�j��m!
	HARAD_MERKE_STR = other.attribute[ATR_STRENGTH];
	Info_ClearChoices(dia_harad_teachstr);
	Info_AddChoice(dia_harad_teachstr,DIALOG_BACK,dia_harad_teachstr_back);
	Info_AddChoice(dia_harad_teachstr,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_harad_teachstr_1);
	Info_AddChoice(dia_harad_teachstr,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_harad_teachstr_5);
};

func void dia_harad_teachstr_back()
{
	if(HARAD_MERKE_STR < other.attribute[ATR_STRENGTH])
	{
		AI_Output(self,other,"DIA_Harad_TeachSTR_BACK_12_01");	//U� jsi zase o n�co svalnat�j��.
	};
	if(other.attribute[ATR_STRENGTH] < T_MED)
	{
		AI_Output(self,other,"DIA_Harad_TeachSTR_BACK_12_02");	//Vra� se, a� se bude� cht�t dozv�d�t v�c.
	};
	Info_ClearChoices(dia_harad_teachstr);
};

func void dia_harad_teachstr_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_MED);
	Info_ClearChoices(dia_harad_teachstr);
	Info_AddChoice(dia_harad_teachstr,DIALOG_BACK,dia_harad_teachstr_back);
	Info_AddChoice(dia_harad_teachstr,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_harad_teachstr_1);
	Info_AddChoice(dia_harad_teachstr,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_harad_teachstr_5);
};

func void dia_harad_teachstr_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_MED);
	Info_ClearChoices(dia_harad_teachstr);
	Info_AddChoice(dia_harad_teachstr,DIALOG_BACK,dia_harad_teachstr_back);
	Info_AddChoice(dia_harad_teachstr,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_harad_teachstr_1);
	Info_AddChoice(dia_harad_teachstr,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_harad_teachstr_5);
};


instance DIA_HARAD_IMMERNOCH(C_INFO)
{
	npc = vlk_412_harad;
	nr = 3;
	condition = dia_harad_immernoch_condition;
	information = dia_harad_immernoch_info;
	permanent = FALSE;
	description = "Je�t� po��d pracuje� pro paladiny?";
};


func int dia_harad_immernoch_condition()
{
	if(KAPITEL >= 2)
	{
		return TRUE;
	};
};

func void dia_harad_immernoch_info()
{
	AI_Output(other,self,"DIA_Harad_Add_15_01");	//Je�t� po��d pracuje� pro paladiny?
	AI_Output(self,other,"DIA_Harad_Add_12_02");	//Se slu�bou u lorda Hagena jsem u� skon�il.
	AI_Output(self,other,"DIA_Harad_Add_12_03");	//Te� pro n�j vyr�b�m me�e z magick� rudy - ale tentokr�t mi za n� plat�.
	AI_Output(self,other,"DIA_Harad_Add_12_04");	//Ale aspo� te� sem tam m��u bokem vyrobit p�r zbran�, kter� poskytnu kupc�m na tr�i�ti.
	AI_Output(self,other,"DIA_Harad_Add_12_05");	//Tak�e jestli hled� dobr� me�, m�l bys to zkusit u nich.
};


instance DIA_HARAD_ABOUTERZKLINGEN(C_INFO)
{
	npc = vlk_412_harad;
	nr = 3;
	condition = dia_harad_abouterzklingen_condition;
	information = dia_harad_abouterzklingen_info;
	permanent = FALSE;
	description = "Prozra� mi n�co bli���ho o b�itech z magick� rudy!";
};


func int dia_harad_abouterzklingen_condition()
{
	if(Npc_KnowsInfo(other,dia_harad_immernoch))
	{
		return TRUE;
	};
};

func void dia_harad_abouterzklingen_info()
{
	AI_Output(other,self,"DIA_Harad_Add_15_06");	//Prozra� mi n�co bli���ho o b�itech z magick� rudy!
	AI_Output(self,other,"DIA_Harad_Waffen_12_02");	//Proces v�roby magick�ch b�it� je velmi slo�it� a drah�, ale v�sledkem je �epel, kter� se velmi dob�e ovl�d� a je prakticky nezni�iteln�.
	AI_Output(self,other,"DIA_Harad_Waffen_12_03");	//Me� je ur�it� velmi kvalitn�, ale jeho skute�n� moc se projev� teprve v rukou paladina.
	AI_Output(self,other,"DIA_Harad_Waffen_12_04");	//Paladinsk� me� je zasv�cen� Innosovi. V�sledkem je, �e takto o�arovan� zbra� je neskute�n� ��inn�!
};


instance DIA_HARAD_ERZKLINGEN(C_INFO)
{
	npc = vlk_412_harad;
	nr = 3;
	condition = dia_harad_erzklingen_condition;
	information = dia_harad_erzklingen_info;
	permanent = TRUE;
	description = "Chci si koupit me� z magick� rudy.";
};


func int dia_harad_erzklingen_condition()
{
	if((OREBLADEBOUGHT == FALSE) && Npc_KnowsInfo(other,dia_harad_abouterzklingen))
	{
		return TRUE;
	};
};


var int orebladebought;

func void dia_harad_erzklingen_info()
{
	AI_Output(other,self,"DIA_Harad_Erzklingen_15_00");	//Chci si koupit me� z magick� rudy.
	if(hero.guild != GIL_PAL)
	{
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_01");	//Magick� b�ity prod�v�m pouze paladin�m, a to v�dy pouze jeden kus.
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_02");	//Jako paladinov� m��ete b�t r�di, �e m��ete t��mat tak skv�l� zbran�.
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_03");	//Dle rozkazu lorda Hagena ti mohu prodat pouze jedinou magickou zbra�.
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_04");	//Tak�e co ti mohu nab�dnout?
		Info_ClearChoices(dia_harad_erzklingen);
		Info_AddChoice(dia_harad_erzklingen,DIALOG_BACK,dia_harad_erzklingen_back);
		Info_AddChoice(dia_harad_erzklingen,"Obouru�n� me� (2000 zla��k�)",dia_harad_erzklingen_2h);
		Info_AddChoice(dia_harad_erzklingen,"Jednoru�n� me� (2000 zla��k�)",dia_harad_erzklingen_1h);
	};
};

func void dia_harad_erzklingen_back()
{
	Info_ClearChoices(dia_harad_erzklingen);
};

func void b_harad_notenoughgold()
{
	AI_Output(self,other,"B_Harad_NotEnoughGold_12_00");	//Nem� dost zlata.
};

func void b_harad_havefunwithyoursword()
{
	AI_Output(self,other,"B_Harad_HaveGunWithYourSword_12_00");	//Starej se o svou novou zbra� dob�e. Je cenn�j�� ne� v�echen tv�j majetek.
	OREBLADEBOUGHT = TRUE;
	Info_ClearChoices(dia_harad_erzklingen);
};

func void dia_harad_erzklingen_2h()
{
	AI_Output(other,self,"DIA_Harad_Erzklingen_2h_15_00");	//Vezmu si obouru�n� me�!
	if(Npc_HasItems(other,itmi_gold) >= VALUE_BLESSED_2H_1)
	{
		b_giveinvitems(other,self,itmi_gold,VALUE_BLESSED_2H_1);
		CreateInvItems(self,itmw_2h_blessed_01,1);
		b_giveinvitems(self,other,itmw_2h_blessed_01,1);
		b_harad_havefunwithyoursword();
	}
	else
	{
		b_harad_notenoughgold();
		Info_ClearChoices(dia_harad_erzklingen);
		Info_AddChoice(dia_harad_erzklingen,DIALOG_BACK,dia_harad_erzklingen_back);
		Info_AddChoice(dia_harad_erzklingen,"Obouru�n� me� (2000 zla��k�)",dia_harad_erzklingen_2h);
		Info_AddChoice(dia_harad_erzklingen,"Jednoru�n� me� (2000 zla��k�)",dia_harad_erzklingen_1h);
	};
};

func void dia_harad_erzklingen_1h()
{
	AI_Output(other,self,"DIA_Harad_Erzklingen_1h_15_00");	//Vezmu si jednoru�n� me�!
	if(Npc_HasItems(other,itmi_gold) >= VALUE_BLESSED_1H_1)
	{
		b_giveinvitems(other,self,itmi_gold,VALUE_BLESSED_1H_1);
		CreateInvItems(self,itmw_1h_blessed_01,1);
		b_giveinvitems(self,other,itmw_1h_blessed_01,1);
		b_harad_havefunwithyoursword();
	}
	else
	{
		b_harad_notenoughgold();
		Info_ClearChoices(dia_harad_erzklingen);
		Info_AddChoice(dia_harad_erzklingen,DIALOG_BACK,dia_harad_erzklingen_back);
		Info_AddChoice(dia_harad_erzklingen,"Obouru�n� me� (2000 zla��k�)",dia_harad_erzklingen_2h);
		Info_AddChoice(dia_harad_erzklingen,"Jednoru�n� me� (2000 zla��k�)",dia_harad_erzklingen_1h);
	};
};


instance DIA_HARAD_REPAIRNECKLACE(C_INFO)
{
	npc = vlk_412_harad;
	nr = 8;
	condition = dia_harad_repairnecklace_condition;
	information = dia_harad_repairnecklace_info;
	permanent = FALSE;
	description = "Um� opravit i klenoty?";
};


func int dia_harad_repairnecklace_condition()
{
	if((MIS_BENNET_INNOSEYEREPAIREDSETTING != LOG_SUCCESS) && (Npc_HasItems(other,itmi_innoseye_broken_mis) || (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE)))
	{
		return TRUE;
	};
};

func void dia_harad_repairnecklace_info()
{
	AI_Output(other,self,"DIA_Harad_RepairNecklace_15_00");	//Um� opravit i klenoty?
	AI_Output(self,other,"DIA_Harad_RepairNecklace_12_01");	//Jsem kov��, ne zlatn�k. Bude� si tady ve m�st� muset naj�t n�koho jin�ho, kdo ti pom��e.
	AI_Output(self,other,"DIA_Harad_RepairNecklace_12_02");	//Lidi maj� jednu kapsu pr�zdnou a druhou vysypanou - u� hezkou dobu tady nikdo nezbohatnul.
	AI_Output(self,other,"DIA_Harad_RepairNecklace_12_03");	//V�t�inou jsou r�di, �e maj� co do �st.
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
};


instance DIA_HARAD_GOLDSMITH(C_INFO)
{
	npc = vlk_412_harad;
	nr = 8;
	condition = dia_harad_goldsmith_condition;
	information = dia_harad_goldsmith_info;
	permanent = FALSE;
	description = "Kde bych sehnal n�jak�ho zlatn�ka?";
};


func int dia_harad_goldsmith_condition()
{
	if(Npc_KnowsInfo(other,dia_harad_repairnecklace))
	{
		return TRUE;
	};
};

func void dia_harad_goldsmith_info()
{
	AI_Output(other,self,"DIA_Harad_Goldsmith_15_00");	//Kde bych sehnal n�jak�ho zlatn�ka?
	AI_Output(self,other,"DIA_Harad_Goldsmith_12_01");	//N�jak� dobr� kov�� se pr� p�idal k �old�k�m na Onarov� farm�.
	AI_Output(self,other,"DIA_Harad_Goldsmith_12_02");	//Zkus se po n�m poohl�dnout tam.
};


instance DIA_HARAD_PICKPOCKET(C_INFO)
{
	npc = vlk_412_harad;
	nr = 900;
	condition = dia_harad_pickpocket_condition;
	information = dia_harad_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_harad_pickpocket_condition()
{
	return c_beklauen(14,35);
};

func void dia_harad_pickpocket_info()
{
	Info_ClearChoices(dia_harad_pickpocket);
	Info_AddChoice(dia_harad_pickpocket,DIALOG_BACK,dia_harad_pickpocket_back);
	Info_AddChoice(dia_harad_pickpocket,DIALOG_PICKPOCKET,dia_harad_pickpocket_doit);
};

func void dia_harad_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_harad_pickpocket);
};

func void dia_harad_pickpocket_back()
{
	Info_ClearChoices(dia_harad_pickpocket);
};

