
instance DIA_RAMIREZ_EXIT(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 999;
	condition = dia_ramirez_exit_condition;
	information = dia_ramirez_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ramirez_exit_condition()
{
	return TRUE;
};

func void dia_ramirez_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RAMIREZ_PICKPOCKET(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 900;
	condition = dia_ramirez_pickpocket_condition;
	information = dia_ramirez_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_ramirez_pickpocket_condition()
{
	return c_beklauen(90,300);
};

func void dia_ramirez_pickpocket_info()
{
	Info_ClearChoices(dia_ramirez_pickpocket);
	Info_AddChoice(dia_ramirez_pickpocket,DIALOG_BACK,dia_ramirez_pickpocket_back);
	Info_AddChoice(dia_ramirez_pickpocket,DIALOG_PICKPOCKET,dia_ramirez_pickpocket_doit);
};

func void dia_ramirez_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_ramirez_pickpocket);
};

func void dia_ramirez_pickpocket_back()
{
	Info_ClearChoices(dia_ramirez_pickpocket);
};


instance DIA_RAMIREZ_ZEICHEN(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 2;
	condition = dia_ramirez_zeichen_condition;
	information = dia_ramirez_zeichen_info;
	permanent = FALSE;
	description = "(P�edv�st zlod�jsk� sign�l.)";
};


func int dia_ramirez_zeichen_condition()
{
	if(KNOWS_SECRETSIGN == TRUE)
	{
		return TRUE;
	};
};

func void dia_ramirez_zeichen_info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ramirez_Zeichen_14_00");	//Fajn, fajn, zn� sign�l. (z�v�) Docela m� to p�ekvapuje.
};


instance DIA_RAMIREZ_HALLO(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 2;
	condition = dia_ramirez_hallo_condition;
	information = dia_ramirez_hallo_info;
	permanent = TRUE;
	important = TRUE;
};


var int dia_ramirez_hallo_permanent;

func int dia_ramirez_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (DIA_RAMIREZ_HALLO_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_ramirez_hallo_info()
{
	if((self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (JOIN_THIEFS == FALSE))
	{
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_00");	//Ztratil ses? Nemyslim si, �e tohle je to prav� m�sto pro tebe.
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_01");	//Jestli se ti tady n�co stane, nikdo z n�s ti pomoct nep�jde. Tak�e si d�vej bacha. (�irok� �sm�v)
	};
	if(JOIN_THIEFS == TRUE)
	{
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_02");	//Tak jsi tady. Dobr�, tak ti p�eju hodn� �t�st� - ale bu� opatrn�, a� u� d�l� cokoli.
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_03");	//A je�t� jedna v�c - je mi jedno, kdo jsi tam naho�e a s k�m pracuje�.
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_04");	//Tady dole jsi jen jedn�m z n�s. Zlod�j. Nic v�c, nic m��.
		DIA_RAMIREZ_HALLO_PERMANENT = TRUE;
	};
	DG_GEFUNDEN = TRUE;
};


instance DIA_RAMIREZ_BEUTE(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 3;
	condition = dia_ramirez_beute_condition;
	information = dia_ramirez_beute_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_ramirez_beute_condition()
{
	if((Mob_HasItems("THIEF_CHEST_01",itmi_gold) < 50) || (Mob_HasItems("THIEF_CHEST_02",itmi_gold) < 100) || (Mob_HasItems("THIEF_CHEST_02",itmi_silvercup) == FALSE) || (Mob_HasItems("THIEF_CHEST_03",itmi_gold) < 75))
	{
		return TRUE;
	};
};

func void dia_ramirez_beute_info()
{
	AI_Output(self,other,"DIA_Ramirez_Beute_14_00");	//Poslouchej, to nem��e� myslet v�n�, �e ne? Hrabe� se v na�em zlatu - to se n�s pokou�� okr�st?
	AI_Output(other,self,"DIA_Ramirez_Beute_15_01");	//Ne��kej, �e za tu d�inu je jen t�chhle p�r minc�.
	AI_Output(other,self,"DIA_Ramirez_Beute_15_02");	//Mysl�m, tahle hrom�dka tady - to je CEL� ko�ist? To je v�echno, co m� zlod�jsk� cech Khorinisu k dispozici?
	AI_Output(self,other,"DIA_Ramirez_Beute_14_03");	//Kdo ��kal, �e tady dole m�me na�i ko�ist?
	AI_Output(other,self,"DIA_Ramirez_Beute_15_04");	//Stejn� tomu nem��u uv��it. Tak kde jste schovali ty poklady?
	AI_Output(self,other,"DIA_Ramirez_Beute_14_05");	//Na velmi bezpe�n� m�sto.
	AI_Output(other,self,"DIA_Ramirez_Beute_15_06");	//Aha.
	AI_Output(self,other,"DIA_Ramirez_Beute_14_07");	//Dobr�, m��e� si to zlato nechat. Ale budu na tebe d�vat pozor. Tak to nep�ep�skni.
};


instance DIA_RAMIREZ_BEZAHLEN(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 9;
	condition = dia_ramirez_bezahlen_condition;
	information = dia_ramirez_bezahlen_info;
	permanent = TRUE;
	description = "M��e� m� n��emu nau�it?";
};


var int dia_ramirez_bezahlen_permanent;

func int dia_ramirez_bezahlen_condition()
{
	if((JOIN_THIEFS == TRUE) && (DIA_RAMIREZ_BEZAHLEN_PERMANENT == FALSE) && Npc_KnowsInfo(other,dia_cassia_lernen))
	{
		return TRUE;
	};
};

func void dia_ramirez_bezahlen_info()
{
	if(MIS_THIEFGUILD_SUCKED == FALSE)
	{
		RAMIREZ_COST = 150;
	}
	else
	{
		RAMIREZ_COST = 300;
	};
	AI_Output(other,self,"DIA_Ramirez_Bezahlen_15_00");	//M��e� m� n��emu nau�it?
	if(Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == TRUE)
	{
		AI_Output(self,other,"DIA_Ramirez_Bezahlen_14_01");	//Nem��u t� nau�it nic. O p��en� z�mk� u� v� v�echno.
		if(other.attribute[ATR_DEXTERITY] < T_MAX)
		{
			AI_Output(self,other,"DIA_Ramirez_Add_14_00");	//Te� u� jen pot�ebuje� zdokonalit svou obratnost.
		};
		DIA_RAMIREZ_BEZAHLEN_PERMANENT = TRUE;
		Info_ClearChoices(dia_ramirez_bezahlen);
	}
	else
	{
		AI_Output(self,other,"DIA_Ramirez_Bezahlen_14_02");	//M��u ti uk�zat, jak p��it z�mky. Bude t� to st�t jen...
		b_say_gold(self,other,RAMIREZ_COST);
		Info_ClearChoices(dia_ramirez_bezahlen);
		Info_AddChoice(dia_ramirez_bezahlen,"Mo�n� pozd�ji ... (ZP�T)",dia_ramirez_bezahlen_spaeter);
		Info_AddChoice(dia_ramirez_bezahlen,"OK, zaplat�m ...",dia_ramirez_bezahlen_okay);
	};
};

func void dia_ramirez_bezahlen_spaeter()
{
	Info_ClearChoices(dia_ramirez_bezahlen);
};

func void dia_ramirez_bezahlen_okay()
{
	AI_Output(other,self,"DIA_Ramirez_Bezahlen_Okay_15_00");	//Dobr�, zaplat�m.
	if(b_giveinvitems(other,self,itmi_gold,RAMIREZ_COST))
	{
		AI_Output(other,self,"DIA_Ramirez_Bezahlen_Okay_15_01");	//... Tady je zlato.
		AI_Output(self,other,"DIA_Ramirez_Bezahlen_Okay_14_02");	//V�born�. Jsem ti k slu�b�m.
		RAMIREZ_TEACHPLAYER = TRUE;
		DIA_RAMIREZ_BEZAHLEN_PERMANENT = TRUE;
		Info_ClearChoices(dia_ramirez_bezahlen);
	}
	else
	{
		AI_Output(self,other,"DIA_Ramirez_Bezahlen_Okay_14_03");	//Nejd��v si se�e� zlato a pak se vra�.
		Info_ClearChoices(dia_ramirez_bezahlen);
	};
};


instance DIA_RAMIREZ_TEACH(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 99;
	condition = dia_ramirez_teach_condition;
	information = dia_ramirez_teach_info;
	permanent = TRUE;
	description = "Uka� mi, jak se p��� z�mky!";
};


func int dia_ramirez_teach_condition()
{
	if((RAMIREZ_TEACHPLAYER == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == FALSE))
	{
		return TRUE;
	};
};

func void dia_ramirez_teach_info()
{
	AI_Output(other,self,"DIA_Ramirez_Teach_15_00");	//Uka� mi, jak se p��� z�mky!
	if(RAMIREZ_ZWEIMAL == FALSE)
	{
		AI_Output(self,other,"DIA_Ramirez_Teach_14_06");	//P��en� z�mku je zlod�jsk� um�n�.
		AI_Output(self,other,"DIA_Ramirez_Teach_14_01");	//Pot�ebuje� spoustu citu a intuice. A hromadu �perh�k�.
		AI_Output(self,other,"DIA_Ramirez_Teach_14_02");	//Nicm�n�, n�kter� truhly maj� speci�ln� z�mky, kter� lze odemknout jen za pomoci odpov�daj�c�ho kl��e.
		RAMIREZ_ZWEIMAL = TRUE;
	};
	if(b_teachthieftalent(self,other,NPC_TALENT_PICKLOCK))
	{
		AI_Output(self,other,"DIA_Ramirez_Teach_14_03");	//Tak�e si klekne� p�ed z�mek a �perh�kem ot��� napravo a nalevo.
		AI_Output(self,other,"DIA_Ramirez_Teach_14_04");	//Kdy� j�m oto�� moc rychle nebo moc siln�, zlom� se.
		AI_Output(self,other,"DIA_Ramirez_Teach_14_05");	//Ale ��m zku�en�j�� bude�, t�m pro tebe bude snaz�� s nimi zach�zet.
	};
};


instance DIA_RAMIREZ_VIERTEL(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 8;
	condition = dia_ramirez_viertel_condition;
	information = dia_ramirez_viertel_info;
	permanent = FALSE;
	description = "Kde to p��en� z�mk� stoj� za n�mahu?";
};


func int dia_ramirez_viertel_condition()
{
	if(KNOWS_SECRETSIGN == TRUE)
	{
		return TRUE;
	};
};

func void dia_ramirez_viertel_info()
{
	AI_Output(other,self,"DIA_Ramirez_Viertel_15_00");	//Kde to p��en� z�mk� stoj� za n�mahu?
	AI_Output(self,other,"DIA_Ramirez_Viertel_14_01");	//V horn� �tvrti, samoz�ejm�.
	AI_Output(self,other,"DIA_Ramirez_Viertel_14_02");	//Ale jestli se tam bude� cht�t k n�komu vloupat, po�kej si na noc, a� v�ichni usnou - teda krom� str��.
	AI_Output(self,other,"DIA_Ramirez_Viertel_14_03");	//Hl�dkuj� tam celou noc. Jednoho z nich zn�m - jmenuje se Wambo. On je jedinej, koho zaj�m� zlato.
	AI_Output(self,other,"DIA_Ramirez_Viertel_14_04");	//Je drahej, ale kdy� mu jednou zaplat�, u� se o to nemus� d�l starat.
};


instance DIA_RAMIREZ_SEXTANT(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 2;
	condition = dia_ramirez_sextant_condition;
	information = dia_ramirez_sextant_info;
	permanent = FALSE;
	description = "M� pro m� pr�ci?";
};


func int dia_ramirez_sextant_condition()
{
	if((KNOWS_SECRETSIGN == TRUE) && (MIS_CASSIARING == LOG_SUCCESS) && (KAPITEL >= 2))
	{
		return TRUE;
	};
};

func void dia_ramirez_sextant_info()
{
	AI_Output(other,self,"DIA_Ramirez_Sextant_15_00");	//M� pro m� pr�ci?
	AI_Output(self,other,"DIA_Ramirez_Sextant_14_01");	//Hmm... je tu jedna v�ci�ka, kterou bych r�d m�l. Ale zat�m jsem ji nena�el.
	AI_Output(other,self,"DIA_Ramirez_Sextant_15_02");	//Co to je?
	AI_Output(self,other,"DIA_Ramirez_Sextant_14_03");	//�hlom�r. P�ines mi �hlom�r - d�m ti za n�j dobrou cenu.
	Log_CreateTopic(TOPIC_RAMIREZSEXTANT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RAMIREZSEXTANT,LOG_RUNNING);
	b_logentry(TOPIC_RAMIREZSEXTANT,"Ramirez m� po��dal, abych mu p�inesl �hlom�r.");
	MIS_RAMIREZSEXTANT = LOG_RUNNING;
};


instance DIA_RAMIREZ_SUCCESS(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 2;
	condition = dia_ramirez_success_condition;
	information = dia_ramirez_success_info;
	permanent = FALSE;
	description = "M�m pro tebe ten �hlom�r.";
};


func int dia_ramirez_success_condition()
{
	if(Npc_KnowsInfo(other,dia_ramirez_sextant) && (Npc_HasItems(other,itmi_sextant) > 0))
	{
		return TRUE;
	};
};

func void dia_ramirez_success_info()
{
	AI_Output(other,self,"DIA_Ramirez_Success_15_00");	//M�m pro tebe ten �hlom�r.
	b_giveinvitems(other,self,itmi_sextant,1);
	AI_Output(self,other,"DIA_Ramirez_Success_14_01");	//To nen� mo�n�. V�n� se ti povedlo n�jak� naj�t.
	AI_Output(self,other,"DIA_Ramirez_Success_14_02");	//Tady, ty pen�ze si v�n� zaslou��.
	b_giveinvitems(self,other,itmi_gold,VALUE_SEXTANT / 2);
	RAMIREZ_SEXTANT = TRUE;
	MIS_RAMIREZSEXTANT = LOG_SUCCESS;
	b_giveplayerxp(XP_RAMIREZSEXTANT);
};

