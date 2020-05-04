
instance DIA_NOV_3_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_nov_3_exit_condition;
	information = dia_nov_3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_nov_3_exit_condition()
{
	return TRUE;
};

func void dia_nov_3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NOV_3_FEGEN(C_INFO)
{
	nr = 2;
	condition = dia_nov_3_fegen_condition;
	information = dia_nov_3_fegen_info;
	permanent = TRUE;
	description = "Pot�ebuju pomoci zam�st pokoje novic�.";
};


var int feger1_permanent;
var int feger2_permanent;

func int dia_nov_3_fegen_condition()
{
	if((KAPITEL == 1) && (MIS_KLOSTERARBEIT == LOG_RUNNING) && (NOV_HELFER < 4))
	{
		return TRUE;
	};
};

func void dia_nov_3_fegen_info()
{
	AI_Output(other,self,"DIA_NOV_3_Fegen_15_00");	//Pot�ebuju pomoci zam�st pokoje novic�.
	if(Hlp_GetInstanceID(feger1) == Hlp_GetInstanceID(self))
	{
		if((NOV_HELFER < 1) && (FEGER1_PERMANENT == FALSE))
		{
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_01");	//Nikdo ti nechce jen tak pomoct, co? Pom��u ti jen v p��pad�, �e se ti poda�� p�esv�d�it je�t� n�koho dal��ho, aby do toho �el taky.
			b_logentry(TOPIC_PARLANFEGEN,"Novic, kter� ukl�z� sklep, mi nab�dl pomocnou ruku, pokud n�kter�ho z jeho bratr� p�esv�d��m, aby mu pomohl zam�st komnaty.");
		}
		else if((NOV_HELFER >= 1) && (FEGER1_PERMANENT == FALSE))
		{
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_02");	//To jsem s�m, kdo ti pom�h�?
			AI_Output(other,self,"DIA_NOV_3_Fegen_15_03");	//Ne, u� se mi poda�ilo z�skat n�koho dal��ho.
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_04");	//Tak to jsem pro.
			NOV_HELFER = NOV_HELFER + 1;
			FEGER1_PERMANENT = TRUE;
			b_giveplayerxp(XP_FEGER);
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"FEGEN");
			b_logentry(TOPIC_PARLANFEGEN,"Novic ze sklepa mi nyn� pom��e uklidit komnaty.");
		}
		else if(FEGER1_PERMANENT == TRUE)
		{
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_05");	//Hej, brat�e - j� u� ti p�ece pom�h�m. Nemus� m� p�emlouvat.
		};
	};
	if(Hlp_GetInstanceID(feger2) == Hlp_GetInstanceID(self))
	{
		if(FEGER2_PERMANENT == FALSE)
		{
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_08");	//Jasn�, �e ti pom��u. My novicov� mus�me dr�et p�i sob�. Ruka ruku myje.
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_09");	//Pot�ebuju 50 zlat�ch, proto�e jsem st�le je�t� nezaplatil Parlanovi.
			b_logentry(TOPIC_PARLANFEGEN,"Novic p�ed kostelem mi pom��e, pokud mu zaplat�m pades�t zla��k�.");
			Info_ClearChoices(dia_nov_3_fegen);
			Info_AddChoice(dia_nov_3_fegen,"Mo�n� pozd�ji ...",dia_nov_3_fegen_nein);
			if(Npc_HasItems(other,itmi_gold) >= 50)
			{
				Info_AddChoice(dia_nov_3_fegen,"Dobr�. Zaplat�m.",dia_nov_3_fegen_ja);
			};
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_06");	//V�ak u� jsem ti to sl�bil. Tys pomohl mn�, j� pom��u tob�.
		};
	};
	if((Hlp_GetInstanceID(feger1) != Hlp_GetInstanceID(self)) && (Hlp_GetInstanceID(feger2) != Hlp_GetInstanceID(self)))
	{
		AI_Output(self,other,"DIA_NOV_3_Fegen_03_07");	//Zapome� na to - nem�m na takov� v�ci �as. Pod�vej se po n�kom jin�m, kdo by ti mohl pomoct.
	};
};

func void dia_nov_3_fegen_nein()
{
	AI_Output(other,self,"DIA_NOV_3_Fegen_Nein_15_00");	//Mo�n� pozd�ji. Pr�v� te� si to nem��u dovolit.
	Info_ClearChoices(dia_nov_3_fegen);
};

func void dia_nov_3_fegen_ja()
{
	AI_Output(other,self,"DIA_NOV_3_Fegen_Ja_15_00");	//Dobr�. Zaplat�m.
	AI_Output(self,other,"DIA_NOV_3_Fegen_Ja_03_01");	//Fajn, v tom p��pad� m��u za��t.
	b_giveinvitems(other,self,itmi_gold,50);
	NOV_HELFER = NOV_HELFER + 1;
	b_giveplayerxp(XP_FEGER);
	FEGER2_PERMANENT = TRUE;
	Info_ClearChoices(dia_nov_3_fegen);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FEGEN");
	b_logentry(TOPIC_PARLANFEGEN,"Novic p�ed kostelem mi nyn� pom��e s �klidem komnat.");
};


instance DIA_NOV_3_WURST(C_INFO)
{
	nr = 3;
	condition = dia_nov_3_wurst_condition;
	information = dia_nov_3_wurst_info;
	permanent = TRUE;
	description = "Nedal by sis klob�su?";
};


func int dia_nov_3_wurst_condition()
{
	if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void dia_nov_3_wurst_info()
{
	var string novizetext;
	var string novizeleft;
	AI_Output(other,self,"DIA_NOV_3_Wurst_15_00");	//Nedal by sis klob�su?
	AI_Output(self,other,"DIA_NOV_3_Wurst_03_01");	//Jasn�, dej to sem. Takov� klob�sa nen� v�bec k zahozen�.
	b_giveinvitems(other,self,itfo_schafswurst,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,itfo_sausage);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,2);
};


instance DIA_NOV_3_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_nov_3_join_condition;
	information = dia_nov_3_join_info;
	permanent = TRUE;
	description = "Chci se st�t m�gem!";
};


func int dia_nov_3_join_condition()
{
	if(hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_nov_3_join_info()
{
	AI_Output(other,self,"DIA_NOV_3_JOIN_15_00");	//Chci se st�t m�gem!
	AI_Output(self,other,"DIA_NOV_3_JOIN_03_01");	//To chce ka�d� novic. Ale jen n�kolika z nich je po�ehn�no b�t Vyvolen�m a dostat �anci na p�ijet� do Kruhu ohn�.
	AI_Output(self,other,"DIA_NOV_3_JOIN_03_02");	//B�t m�gem Kruhu ohn� je tou nejvy��� poctou, jak� se ti u n�s m��e dostat.
	AI_Output(self,other,"DIA_NOV_3_JOIN_03_03");	//Bude� muset tvrd� pracovat, abys dostal svou �anci.
};


instance DIA_NOV_3_PEOPLE(C_INFO)
{
	nr = 5;
	condition = dia_nov_3_people_condition;
	information = dia_nov_3_people_info;
	permanent = TRUE;
	description = "Kdo je p�edstaven�m tohoto kl�tera?";
};


func int dia_nov_3_people_condition()
{
	return TRUE;
};

func void dia_nov_3_people_info()
{
	AI_Output(other,self,"DIA_NOV_3_PEOPLE_15_00");	//Kdo je p�edstaven�m tohoto kl�tera?
	AI_Output(self,other,"DIA_NOV_3_PEOPLE_03_01");	//My novicov� slou��me m�g�m Kruhu ohn�. Ti se zodpov�daj� Nejvy���mu shrom�d�n�, kter� sest�v� ze t�� nejmocn�j��ch �arod�j�.
	AI_Output(self,other,"DIA_NOV_3_PEOPLE_03_02");	//Ale za v�e, co se t�k� novic�, je zodpov�dn� otec Parlan. Ve�ker� sv�j �as tr�v� na n�dvo��, kde kontroluje pr�ci novic�.
};


instance DIA_NOV_3_LOCATION(C_INFO)
{
	nr = 6;
	condition = dia_nov_3_location_condition;
	information = dia_nov_3_location_info;
	permanent = TRUE;
	description = "Co mi m��e� ��ct o tomto kl�teru?";
};


func int dia_nov_3_location_condition()
{
	return TRUE;
};

func void dia_nov_3_location_info()
{
	AI_Output(other,self,"DIA_NOV_3_LOCATION_15_00");	//Co mi m��e� ��ct o tomto kl�teru?
	AI_Output(self,other,"DIA_NOV_3_LOCATION_03_01");	//Tady se star�me o to, abychom si zajistili sv� skromn� z�soby. Chov�me ovce a d�l�me v�no.
	AI_Output(self,other,"DIA_NOV_3_LOCATION_03_02");	//Tady je knihovna, ale mohou ji vyu��vat pouze m�gov� a vyvolen� novicov�.
	AI_Output(self,other,"DIA_NOV_3_LOCATION_03_03");	//My novicov� se do n� pod�v�me jen, kdy� sem pro n�co zajdeme m�g�m Kruhu ohn�.
};


instance DIA_NOV_3_STANDARD(C_INFO)
{
	nr = 10;
	condition = dia_nov_3_standard_condition;
	information = dia_nov_3_standard_info;
	permanent = TRUE;
	description = "Co je nov�ho?";
};


func int dia_nov_3_standard_condition()
{
	return TRUE;
};

func void dia_nov_3_standard_info()
{
	AI_Output(other,self,"DIA_NOV_3_STANDARD_15_00");	//Co je nov�ho?
	if(KAPITEL == 1)
	{
		if(hero.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_01");	//Ty jsi zrovna ten prav�, co by se na to m�l pt�t! O ni�em jin�m ne� o tob� novicov� nemluv�.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_02");	//Jen m�lokdy se stane, �e by se takov� nov��ek jako ty stal vyvolen�m pro Kruh ohn�.
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_03");	//�as znovu nade�el. Jeden z novic� bude brzy p�ijat do Kruhu ohn�.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_04");	//Zkou�ka za�ne u� brzy.
		};
	};
	if((KAPITEL == 2) || (KAPITEL == 3))
	{
		if((PEDRO_TRAITOR == TRUE) && (MIS_NOVIZENCHASE != LOG_SUCCESS))
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_05");	//Do na�eho ��du pronikl Beliar! Zlo mus� b�t velmi siln�, kdy� si dok�zalo naj�t spojence u� i tady.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_06");	//Pedro byl tady v kl�te�e u� cel� l�ta. Dlouh� �as, kter� str�vil venku, musel oslabit jeho v�ru, a tak snadno podlehl Beliarovu pokou�en�.
		}
		else if(MIS_NOVIZENCHASE == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_07");	//P�i�el jsi pr�v� v�as. S�m Innos by nemohl zvolit vhodn�j�� dobu pro tv�j p��chod.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_08");	//Zap�e� se do kroniky na�eho kl�tera jako mocn� zachr�nce Oka.
		}
		else if(MIS_OLDWORLD == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_09");	//Zpr�vy z Hornick�ho �dol� jsou znepokojiv�. Innos n�s t�ce zkou��.
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_10");	//��k� se, �e od paladin�, kte�� se vydali ho Hornick�ho �dol�, zat�m nedorazily ��dn� zpr�vy. Nejvy��� rada bude v�d�t, co m� b�t u�in�no.
		};
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_NOV_3_STANDARD_03_11");	//��kaj�, �e bychom draky m�li zni�it za pomoci na�eho P�na. Beliarovy zr�dy stihne Innos�v hn�v.
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_NOV_3_STANDARD_03_12");	//Jen d�ky Innosovi se n�m poda�ilo za�ehnat bezprost�edn� hrozbu. Mus�me se vr�tit na cestu na�eho P�na, proto�e pouze s jeho pomoc� se m��eme postavit zlu.
	};
};

func void b_assignambientinfos_nov_3(var C_NPC slf)
{
	dia_nov_3_exit.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_join.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_people.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_location.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_standard.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_fegen.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_wurst.npc = Hlp_GetInstanceID(slf);
};

