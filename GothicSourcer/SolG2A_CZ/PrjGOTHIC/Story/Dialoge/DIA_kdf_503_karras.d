
instance DIA_KARRAS_KAP1_EXIT(C_INFO)
{
	npc = kdf_503_karras;
	nr = 999;
	condition = dia_karras_kap1_exit_condition;
	information = dia_karras_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_karras_kap1_exit_condition()
{
	if(KAPITEL <= 1)
	{
		return TRUE;
	};
};

func void dia_karras_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_HELLO(C_INFO)
{
	npc = kdf_503_karras;
	nr = 1;
	condition = dia_karras_hello_condition;
	information = dia_karras_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_karras_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_NOVIZENCHASE != LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_karras_hello_info()
{
	if(hero.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Karras_Hello_10_00");	//Co pro tebe mohu ud�lat, novici?
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Karras_Hello_10_01");	//Co pro tebe mohu ud�lat, brat�e?
	}
	else if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Karras_Hello_10_02");	//Do t�chto komnat zav�taj� ctihodn� Innosovi v�le�n�ci jen z��dka.
		AI_Output(self,other,"DIA_Karras_Hello_10_03");	//Co pro tebe mohu ud�lat?
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_Hello_10_04");	//(ned�v��iv�) Co tady d�l�?
	};
};


instance DIA_KARRAS_MISSION(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_mission_condition;
	information = dia_karras_mission_info;
	permanent = FALSE;
	description = "P�i�el jsem si p�e��st n�jak� svat� texty.";
};


func int dia_karras_mission_condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_karras_mission_info()
{
	AI_Output(other,self,"DIA_Karras_Mission_15_00");	//P�i�el jsem si p�e��st n�jak� svat� texty.
	AI_Output(self,other,"DIA_Karras_Mission_10_01");	//Rozum�m. Jestli se ti poda�� naj�t mezi n�ro�n�m studiem n�jak� voln� �as, stav se za mnou.
	AI_Output(self,other,"DIA_Karras_Mission_10_02");	//Je tady je�t� jedna z�le�itost, ke kter� bych pot�eboval diskr�tn�ho novice.
};


instance DIA_KARRAS_AUFGABE(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_aufgabe_condition;
	information = dia_karras_aufgabe_info;
	permanent = FALSE;
	description = "M� pro m� n�jak� �kol?";
};


func int dia_karras_aufgabe_condition()
{
	if(Npc_KnowsInfo(other,dia_karras_mission))
	{
		return TRUE;
	};
};

func void dia_karras_aufgabe_info()
{
	AI_Output(other,self,"DIA_Karras_Aufgabe_15_00");	//M� pro m� n�jak� �kol?
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_01");	//Ano. T�k� se to toho bl�zniv�ho Ignaze. �ije v Khorinisu a experimentuje s r�zn�mi lektvary a l��iv�mi odvary. Ale tak� s kouzly a magi�.
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_02");	//A to m� tr�p�. Pt�m se s�m sebe, jestli se jeho magie neprotiv� Innosovi.
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_03");	//Abych se mohl p�esv�d�it, pot�ebuji n�jak� jeho kouzeln� svitky.
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_04");	//Chci, abys �el do m�sta a z�skal pro m� t�i jeho magick� svitky.
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_05");	//Ale nikomu ani muk - je to jasn�?
	AI_Output(other,self,"DIA_Karras_Aufgabe_15_06");	//Jasn�.
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_07");	//Tady m� 150 zlat�ch. To by m�lo pokr�t tv� v�daje.
	MIS_KARRASVERGESSEN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_KARRASCHARM,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KARRASCHARM,LOG_RUNNING);
	b_logentry(TOPIC_KARRASCHARM,"Mistr Karras m� poslal do m�sta, kde mu m�m obstarat t�i svitky s kouzly, kter� vyr�b� a prod�v� Ignaz.");
	b_giveinvitems(self,other,itmi_gold,150);
};


instance DIA_KARRAS_SUCCESS(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_success_condition;
	information = dia_karras_success_info;
	permanent = FALSE;
	description = "Tady jsou ty magick� svitky, kter� jsi cht�l.";
};


func int dia_karras_success_condition()
{
	if((MIS_KARRASVERGESSEN == LOG_RUNNING) && (Npc_HasItems(other,itsc_charm) >= 3))
	{
		return TRUE;
	};
};

func void dia_karras_success_info()
{
	AI_Output(other,self,"DIA_Karras_Success_15_00");	//Tady jsou ty magick� svitky, kter� jsi cht�l.
	AI_Output(self,other,"DIA_Karras_Success_10_01");	//Velmi dob�e, m�j mlad� p��teli.
	AI_Output(self,other,"DIA_Karras_Success_10_02");	//Ale te� je na �ase, aby ses v�noval sv�m studi�m.
	AI_Output(self,other,"DIA_Karras_Success_10_03");	//Za odm�nu si vezmi tenhle �arovn� svitek.
	MIS_KARRASVERGESSEN = LOG_SUCCESS;
	b_giveplayerxp(XP_KARRASCHARM);
	b_giveinvitems(other,self,itsc_charm,3);
	b_giveinvitems(self,other,itsc_sumwolf,1);
};


instance DIA_KARRAS_TRADE(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_trade_condition;
	information = dia_karras_trade_info;
	permanent = TRUE;
	description = "Uka� mi sv� zbo��.";
	trade = TRUE;
};


func int dia_karras_trade_condition()
{
	if(hero.guild != GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_karras_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Karras_Trade_15_00");	//Uka� mi sv� zbo��.
};


instance DIA_KARRAS_JOB(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_job_condition;
	information = dia_karras_job_info;
	permanent = FALSE;
	description = "Co m� p�esn� na starosti?";
};


func int dia_karras_job_condition()
{
	return TRUE;
};

func void dia_karras_job_info()
{
	AI_Output(other,self,"DIA_Karras_JOB_15_00");	//Co m� p�esn� na starosti?
	AI_Output(self,other,"DIA_Karras_JOB_10_01");	//M�m �kolem je cvi�it m�gy v um�n� sf�rick� manifestace.
	AI_Output(other,self,"DIA_Karras_JOB_15_02");	//Co to znamen�?
	AI_Output(self,other,"DIA_Karras_JOB_10_03");	//No, u��m je, jak vyvol�vat stvo�en� z jin�ch sf�r.
	AI_Output(self,other,"DIA_Karras_JOB_10_04");	//V�t�inou se tomu ��k� prost� vyvol�v�n�, i kdy� tenhle v�raz naprosto nesta�� k pops�n� um�n� stvo�en� slu�ebn�ka.
	AI_Output(self,other,"DIA_Karras_JOB_10_05");	//Nav�c m�m n�kolik zaj�mav�ch svitk� s kouzly, kter� u Goraxe nenajde�.
	if(other.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Karras_JOB_10_06");	//Ale nab�z�m je jen �len�m na�eho ��du.
	};
	Log_CreateTopic(TOPIC_KLOSTERTRADER,LOG_NOTE);
	b_logentry(TOPIC_KLOSTERTRADER,"Mistr Karras z kl�tera m� m��e z�sobit svitky s kouzly - pokud se tedy stanu m�gem ohn�.");
};


instance DIA_KARRAS_TEACH(C_INFO)
{
	npc = kdf_503_karras;
	nr = 10;
	condition = dia_karras_teach_condition;
	information = dia_karras_teach_info;
	permanent = TRUE;
	description = "R�d bych se od tebe n��emu p�iu�il (vytvo�it runy).";
};


func int dia_karras_teach_condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_karras_teach_info()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output(other,self,"DIA_Karras_TEACH_15_00");	//U� m�.
	Info_ClearChoices(dia_karras_teach);
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1) && (PLAYER_TALENT_RUNES[SPL_SUMMONGOBLINSKELETON] == FALSE))
	{
		Info_AddChoice(dia_karras_teach,b_buildlearnstring(NAME_SPL_SUMMONGOBLINSKELETON,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SUMMONGOBLINSKELETON)),dia_karras_teach_sumgobl);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_SUMMONWOLF] == FALSE))
	{
		Info_AddChoice(dia_karras_teach,b_buildlearnstring(NAME_SPL_SUMMONWOLF,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SUMMONWOLF)),dia_karras_teachsummonwolf);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_SUMMONSKELETON] == FALSE))
	{
		Info_AddChoice(dia_karras_teach,b_buildlearnstring(NAME_SPL_SUMMONSKELETON,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SUMMONSKELETON)),dia_karras_teach_summonskeleton);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4) && (PLAYER_TALENT_RUNES[SPL_SUMMONGOLEM] == FALSE))
	{
		Info_AddChoice(dia_karras_teach,b_buildlearnstring(NAME_SPL_SUMMONGOLEM,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SUMMONGOLEM)),dia_karras_teach_summongolem);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5) && (PLAYER_TALENT_RUNES[SPL_SUMMONDEMON] == FALSE))
	{
		Info_AddChoice(dia_karras_teach,b_buildlearnstring(NAME_SPL_SUMMONDEMON,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SUMMONDEMON)),dia_karras_teach_summondemon);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6) && (PLAYER_TALENT_RUNES[SPL_ARMYOFDARKNESS] == FALSE))
	{
		Info_AddChoice(dia_karras_teach,b_buildlearnstring(NAME_SPL_ARMYOFDARKNESS,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ARMYOFDARKNESS)),dia_karras_teach_armyofdarkness);
		abletolearn = abletolearn + 1;
	};
	if(abletolearn < 1)
	{
		AI_Output(self,other,"DIA_Karras_TEACH_10_01");	//V tuhle chv�li nen� nic, co by ses ode m� mohl nau�it.
	}
	else
	{
		Info_AddChoice(dia_karras_teach,DIALOG_BACK,dia_karras_teach_back);
	};
};

func void dia_karras_teach_back()
{
	Info_ClearChoices(dia_karras_teach);
};

func void dia_karras_teach_sumgobl()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONGOBLINSKELETON);
};

func void dia_karras_teachsummonwolf()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONWOLF);
};

func void dia_karras_teach_summonskeleton()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONSKELETON);
};

func void dia_karras_teach_summongolem()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONGOLEM);
};

func void dia_karras_teach_summondemon()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONDEMON);
};

func void dia_karras_teach_armyofdarkness()
{
	b_teachplayertalentrunes(self,other,SPL_ARMYOFDARKNESS);
};


instance DIA_KARRAS_CIRCLE4(C_INFO)
{
	npc = kdf_503_karras;
	nr = 3;
	condition = dia_karras_circle4_condition;
	information = dia_karras_circle4_info;
	permanent = TRUE;
	description = "Cht�l bych se nau�it �tvrt� Kruh magie.";
};


func int dia_karras_circle4_condition()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3)
	{
		return TRUE;
	};
};

func void dia_karras_circle4_info()
{
	AI_Output(other,self,"DIA_Karras_CIRCLE4_15_00");	//Cht�l bych se nau�it �tvrt� Kruh magie.
	if(MIS_READYFORCHAPTER4 == TRUE)
	{
		if(b_teachmagiccircle(self,other,4))
		{
			AI_Output(self,other,"DIA_Karras_CIRCLE4_10_01");	//Dobr�. V�echna znamen� jsou spln�na. Vstup nyn� do �tvrt�ho kruhu, aby se v tob� probudila s�la nov� magie.
			AI_Output(self,other,"DIA_Karras_CIRCLE4_10_02");	//Pro�el jsi dlouhou cestou a Innos bude i nad�le osv�tlovat tvou stezku.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_CIRCLE4_10_03");	//Je�t� st�le nen� v�e hotovo.
	};
};


instance DIA_KARRAS_CIRCLE5(C_INFO)
{
	npc = kdf_503_karras;
	nr = 3;
	condition = dia_karras_circle5_condition;
	information = dia_karras_circle5_info;
	permanent = TRUE;
	description = "Cht�l bych se nau�it p�t� Kruh magie.";
};


func int dia_karras_circle5_condition()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4)
	{
		return TRUE;
	};
};

func void dia_karras_circle5_info()
{
	AI_Output(other,self,"DIA_Karras_CIRCLE5_15_00");	//Cht�l bych se nau�it p�t� Kruh magie.
	if(KAPITEL >= 5)
	{
		if(b_teachmagiccircle(self,other,5))
		{
			AI_Output(self,other,"DIA_Karras_CIRCLE5_10_01");	//V tom p��pad� nyn� vstup do p�t�ho Kruhu magie. Bude� vl�dnout je�t� siln�j�� magi�, ne� kdykoliv p�edt�m.
			AI_Output(self,other,"DIA_Karras_CIRCLE5_10_02");	//U��vej jej� moc s rozvahou, brat�e - temnota je st�le p��li� siln� a na�i nep��tel� t�.
			AI_Output(self,other,"DIA_Karras_CIRCLE5_10_03");	//Do �est�ho a nejvy���ho Kruhu magie t� doprovodit nemohu. A� p�ijde spr�vn� �as, zasv�t� t� s�m Pyrokar.
			b_logentry(TOPIC_KLOSTERTEACHER,"Mistr Pyrokar m� zasv�t� do �est�ho kruhu magie.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_CIRCLE4_10_04");	//�as je�t� nedozr�l.
	};
};


instance DIA_KARRAS_KAP2_EXIT(C_INFO)
{
	npc = kdf_503_karras;
	nr = 999;
	condition = dia_karras_kap2_exit_condition;
	information = dia_karras_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_karras_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_karras_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_KAP3_EXIT(C_INFO)
{
	npc = kdf_503_karras;
	nr = 999;
	condition = dia_karras_kap3_exit_condition;
	information = dia_karras_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_karras_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_karras_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_CHASEPEDRO(C_INFO)
{
	npc = kdf_503_karras;
	nr = 31;
	condition = dia_karras_chasepedro_condition;
	information = dia_karras_chasepedro_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_karras_chasepedro_condition()
{
	if(Npc_IsInState(self,zs_talk) && (KAPITEL == 3) && (MIS_NOVIZENCHASE == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_karras_chasepedro_info()
{
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Karras_ChasePedro_10_00");	//Nesm� ztr�cet �as, brat�e. Mus� dohonit Pedra a vr�tit kl�teru Innosovo oko.
		AI_Output(self,other,"DIA_Karras_ChasePedro_10_01");	//Pokud nebude Oko navr�ceno, budeme v�ichni ztraceni.
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_ChasePedro_10_02");	//Co tady d�l�? Nem�l bys b�t na cest� za t�m bezp�te�n�m zr�dcem Pedrem?
		Info_ClearChoices(dia_karras_chasepedro);
		Info_AddChoice(dia_karras_chasepedro,"Pozd�ji. Nejprve si mus�m n�co za��dit..",dia_karras_chasepedro_later);
		Info_AddChoice(dia_karras_chasepedro,"Nedostane se nijak daleko.",dia_karras_chasepedro_wontescape);
	};
};

func void dia_karras_chasepedro_later()
{
	AI_Output(other,self,"DIA_Karras_ChasePedro_Later_15_00");	//Pozd�ji. Nejprve si mus�m n�co za��dit.
	AI_Output(self,other,"DIA_Karras_ChasePedro_Later_10_01");	//Uv�domuje� si v�bec, co tahle ztr�ta pro kl�ter znamen�? Innosovo oko je mocn� zbra�.
	AI_Output(self,other,"DIA_Karras_ChasePedro_Later_10_02");	//Nikdo nem��e tu�it, co s t�m amuletem nep��tel zam��l�, ale n�co rozhodn� pl�nuje a my mu to mus�me p�ekazit.
	AI_Output(self,other,"DIA_Karras_ChasePedro_Later_10_03");	//Tak�e se okam�it� vydej na cestu za t�m zlod�jem!
	AI_StopProcessInfos(self);
};

func void dia_karras_chasepedro_wontescape()
{
	AI_Output(other,self,"DIA_Karras_ChasePedro_WontEscape_15_00");	//Nedostane se nijak daleko.
	AI_Output(self,other,"DIA_Karras_ChasePedro_WontEscape_10_01");	//To douf�m, pro tvoje vlastn� dobro. Pokud by m�l uniknout jen proto, �e se tady poflakuje�, s�m t� dokopu p�ed tribun�l.
	AI_Output(other,self,"DIA_Karras_ChasePedro_WontEscape_15_02");	//Z �eho bys m� obvinil?
	AI_Output(self,other,"DIA_Karras_ChasePedro_WontEscape_10_03");	//Ze spol�ov�n� s nep��telem. Nepot�ebuje� velkou fantazii, aby sis dok�zal p�edstavit, jak� by t� za to potkal trest.
	AI_Output(self,other,"DIA_Karras_ChasePedro_WontEscape_10_04");	//Tak�e u� neztr�cej �as, proto�e tv�j dal�� osud bude z�viset na tom, za jak�ch okolnost� se p��t� setk�me.
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_NEEDINFO(C_INFO)
{
	npc = kdf_503_karras;
	nr = 31;
	condition = dia_karras_needinfo_condition;
	information = dia_karras_needinfo_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_karras_needinfo_condition()
{
	if(Npc_KnowsInfo(other,dia_karras_chasepedro) && (KAPITEL == 3) && (hero.guild != GIL_KDF) && (MIS_NOVIZENCHASE == LOG_RUNNING) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_karras_needinfo_info()
{
	AI_Output(self,other,"DIA_Karras_NeedInfo_10_00");	//V� v�echno, co pot�ebuje�. A� u� jsi na cest�!
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_INNOSEYERETRIEVED(C_INFO)
{
	npc = kdf_503_karras;
	nr = 1;
	condition = dia_karras_innoseyeretrieved_condition;
	information = dia_karras_innoseyeretrieved_info;
	permanent = FALSE;
	description = "P�inesl jsem zp�tky Innosovo oko.";
};


func int dia_karras_innoseyeretrieved_condition()
{
	if((KAPITEL == 3) && (MIS_NOVIZENCHASE == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_karras_innoseyeretrieved_info()
{
	AI_Output(other,self,"DIA_Karras_InnosEyeRetrieved_15_00");	//P�inesl jsem zp�tky Innosovo oko.
	AI_Output(self,other,"DIA_Karras_InnosEyeRetrieved_10_01");	//To mi spadl k�men ze srdce, �e se ti poda�ilo Innosovo oko nep��teli uzmout.
	AI_Output(self,other,"DIA_Karras_InnosEyeRetrieved_10_02");	//Ale nebezpe�� nebylo odvr�ceno. Zlo kuje dal�� pl�ny a pokra�uje s neb�valou agresivitou.
	AI_Output(other,self,"DIA_Karras_InnosEyeRetrieved_15_03");	//To u� mi tak� do�lo.
	AI_Output(self,other,"DIA_Karras_InnosEyeRetrieved_10_04");	//Ned�lej si ze m� �pr�ouchlata. Situace je v�n�, velice v�n�, a nem��eme v�d�t, komu je mo�n� d�v��ovat.
	AI_Output(self,other,"DIA_Karras_InnosEyeRetrieved_10_05");	//Nep��teli se u� poda�ilo uv�st v poku�en� novice Pedra a m��e se mu to poda�it u mnoh�ch dal��ch.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_KARRAS_KAP3_PERM(C_INFO)
{
	npc = kdf_503_karras;
	nr = 5;
	condition = dia_karras_kap3_perm_condition;
	information = dia_karras_kap3_perm_info;
	permanent = TRUE;
	description = "Jak pokra�uj� tv� studia?";
};


func int dia_karras_kap3_perm_condition()
{
	if((KAPITEL >= 3) && Npc_KnowsInfo(other,dia_karras_job))
	{
		return TRUE;
	};
};

func void dia_karras_kap3_perm_info()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_15_00");	//Jak pokra�uj� tv� studia?
	if((MIS_KARRASRESEARCHDMT == FALSE) && (PYROKARTOLDKARRASTORESEARCHDMT == TRUE) && (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_01");	//Poda�ilo se mi p�ij�t na n�co ohledn� P�tra��.
		AI_Output(other,self,"DIA_Karras_KAP3_Perm_15_02");	//A co to m� b�t?
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_03");	//Jsou zcela jasn� d�monick�ho p�vodu. Tedy, p�inejmen��m jsou, nebo alespo� byli pod vlivem d�mon�.
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_04");	//Kdy� na n� naraz�, bu� opatrn�.
		AI_Output(other,self,"DIA_Karras_KAP3_Perm_15_05");	//Jak nov�torsk� p��stup.
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_06");	//Je mi l�to, ale nem�m dost materi�l�, abych mohl vyvozovat p�esn�j�� stanoviska.
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_07");	//Ale kdyby se ti poda�ilo z�skat z nich n�co, co bych mohl podrobit zkoum�n�...
		MIS_KARRASRESEARCHDMT = LOG_RUNNING;
		b_logentry(TOPIC_DEMENTOREN,"Karras pot�ebuje n�co, co bylo v p��m�m kontaktu s P�tra�i. Jen tak bude moci pokra�ovat ve sv�ch v�zkumech.");
		Info_ClearChoices(dia_karras_kap3_perm);
		Info_AddChoice(dia_karras_kap3_perm,DIALOG_BACK,dia_karras_kap3_perm_back);
		Info_AddChoice(dia_karras_kap3_perm,"Uvid�m, co se d� d�lat.",dia_karras_kap3_perm_willsee);
		Info_AddChoice(dia_karras_kap3_perm,"Mohl by do toho b�t n�jak�m zp�sobem zapleten� Sp��?",dia_karras_kap3_perm_sleeper);
		Info_AddChoice(dia_karras_kap3_perm,"A jak� materi�ly bys pot�eboval?",dia_karras_kap3_perm_material);
	}
	else if(MIS_KARRASRESEARCHDMT == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_08");	//Je�t� st�le pracuji na interpretaci d�kaz� souvisej�c�ch s P�tra�i.
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_09");	//Samoz�ejm�, �e jakmile n�co zjist�m, d�m ti okam�it� v�d�t.
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_10");	//Nep��tel m� mnoho tv���. Je stra�n� obt�n� ur�it, kter� z nich p�edstavuje pro kl�ter nejv�t�� nebezpe��.
	};
};

func void dia_karras_kap3_perm_back()
{
	Info_ClearChoices(dia_karras_kap3_perm);
};

func void dia_karras_kap3_perm_sleeper()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_Sleeper_15_00");	//Mohl by do toho b�t n�jak�m zp�sobem zapleten� Sp��?
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Sleeper_10_01");	//Ten p��b�h o Sp��ovi jsem sly�el. Ale tak obecn�, �e k tomu nem�m co ��ci.
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Sleeper_10_02");	//D�mon� je bezpo�et a zapleten� do toho m��e b�t kter�koliv z nich.
};

func void dia_karras_kap3_perm_corpse()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_Corpse_15_00");	//Tak�e chce�, abych ti p�inesl mrtvolu?
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Corpse_10_01");	//Ne, copak ses zbl�znil? Nebezpe��, kter� by p�edstavovala p��tomnost d�monick�ho stvo�en� za zdmi kl�tera, by bylo p��li� velk�.
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Corpse_10_02");	//Bude sta�it, kdy� najde� n�jak� p�edm�ty, kter� jsou pro tyto tvory typick�.
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Corpse_10_03");	//Zbytky d�monick� aury, kter� je obklopuje, by m�ly pro bli��� zkoum�n� sta�it.
};

func void dia_karras_kap3_perm_material()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_Material_15_00");	//A jak� materi�ly bys pot�eboval?
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Material_10_01");	//Co j� v�m - n�jak� p�edm�ty, kter� jsou pro tato stvo�en� typick�.
	Info_AddChoice(dia_karras_kap3_perm,"Tak�e chce�, abych ti p�inesl mrtvolu?",dia_karras_kap3_perm_corpse);
};

func void dia_karras_kap3_perm_willsee()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_WillSee_15_00");	//Pokus�m se.
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_WillSee_10_01");	//To by bylo opravdu v�born�. Mezit�m se budu v�novat m�mu vlastn�mu v�zkumu.
	Info_ClearChoices(dia_karras_kap3_perm);
};


instance DIA_KARRAS_HAVEBOOK(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_havebook_condition;
	information = dia_karras_havebook_info;
	permanent = FALSE;
	description = "M�m u sebe Almanach posedl�ch. Mo�n� by se ti mohl k n��emu hodit.";
};


func int dia_karras_havebook_condition()
{
	if((MIS_KARRASRESEARCHDMT == LOG_RUNNING) && (Npc_HasItems(hero,itwr_dementorobsessionbook_mis) >= 1) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};


var int karrasgotresearchdmtbook_day;

func void dia_karras_havebook_info()
{
	AI_Output(other,self,"DIA_Karras_HaveBook_15_00");	//M�m u sebe Almanach posedl�ch. Mo�n� by se ti mohl k n��emu hodit.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_01");	//Uka� mi ho.
	Npc_RemoveInvItems(other,itwr_dementorobsessionbook_mis,1);
	AI_PrintScreen(PRINT_ITEMGEGEBEN,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
	AI_Output(self,other,"DIA_Karras_HaveBook_10_02");	//Ano, to by m�lo sta�it. Prozkoum�m tu knihu.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_03");	//Ale jedn�m si u� jsem jist�.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_04");	//P�tra�i jsou podle m� zcela zvr�cen� forma �ivota vytvo�en� Beliarem.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_05");	//Ta stvo�en� jsou ��ste�n� d�monick�ho a ��ste�n� lidsk�ho p�vodu.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_06");	//Ale po��d nedok�u p�esn� ur�it, jestli stoj�me p�ed typickou duchovn� posedlost�, nebo �ist� fyzickou mutac�.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_07");	//P�ij� pozd�ji. Pak budu ur�it� v�d�t n�co v�c.
	MIS_KARRASRESEARCHDMT = LOG_SUCCESS;
	b_logentry(TOPIC_DEMENTOREN,"Karras pro sv�j dal�� v�zkum pot�ebuje almanach posedl�ch. Vr�t�m se k n�mu pozd�ji.");
	KARRASGOTRESEARCHDMTBOOK_DAY = Wld_GetDay();
	b_giveplayerxp(XP_KARRASRESEARCHDMT);
};


instance DIA_KARRAS_RESEARCHDMTEND(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_researchdmtend_condition;
	information = dia_karras_researchdmtend_info;
	permanent = TRUE;
	description = "U� jsi p�i�el na n�co nov�ho ohledn� P�tra��?";
};


func int dia_karras_researchdmtend_condition()
{
	if((MIS_KARRASRESEARCHDMT == LOG_SUCCESS) && (hero.guild == GIL_KDF) && (SC_KNOWSMADPSI == FALSE))
	{
		return TRUE;
	};
};

func void dia_karras_researchdmtend_info()
{
	AI_Output(other,self,"DIA_Karras_ResearchDMTEnd_15_00");	//U� jsi p�i�el na n�co nov�ho ohledn� P�tra��?
	if(KARRASGOTRESEARCHDMTBOOK_DAY <= (Wld_GetDay() - 2))
	{
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_01");	//Ano. U� v�m, kdo nebo co P�tra�i skute�n� jsou za�.
		AI_Output(other,self,"DIA_Karras_ResearchDMTEnd_15_02");	//Nenap�nej m�!
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_03");	//Kdysi to b�vali lid�, jako ty nebo j�. Ud�lali osudnou chybu, kdy� zasv�tili sv�j �ivot ne�ist� magii velice mocn�ho arcid�mona.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_04");	//Pod vlivem tohoto arcid�mona a velice mocn�ch drog �ili pouze proto, aby mu slou�ili, a� se z nich staly jen pouh� st�ny sebe sama.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_05");	//Dnes nejsou nic v�c ne� n�stroje zla bez vlastn� v�le, a nikdy nep�estanou lovit n�sledovn�ky Innose.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_06");	//Mus�me b�t opatrn�. Zd� se sice, �e se zat�m vyh�baj� t�mto posv�tn�m Innosov�m s�n�m.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_07");	//Ale pokud bude jejich moc nad�le r�st, netu��m, jestli tu budeme v bezpe��.
		AI_Output(other,self,"DIA_Karras_ResearchDMTEnd_15_08");	//D�ky. To bylo v�n� povzbudiv�.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_09");	//Opravdu? To ov�em nastoluje dal�� ot�zky. Nap��klad, k�m byli p�edt�m, a jak� arcid�mon z nich ud�lal to, ��m jsou dnes?
		AI_Output(other,self,"DIA_Karras_ResearchDMTEnd_15_10");	//M�m jist� podez�en�. Cel� to zn� jako Bratrstvo Sp��e. Zn�m ty chlap�ky.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_11");	//Douf�m, �e v�, do �eho se to zapl�t�. D�vej na sebe pozor, brat�e.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_12");	//Abych nezapomn�l. Tady je tv�j almanach. U� ho nebudu pot�ebovat.
		CreateInvItems(other,itwr_dementorobsessionbook_mis,1);
		AI_PrintScreen(PRINT_ITEMERHALTEN,-1,YPOS_ITEMTAKEN,FONT_SCREENSMALL,2);
		SC_KNOWSMADPSI = TRUE;
		b_logentry(TOPIC_DEMENTOREN,"Karrasovy studie byly �sp�n�. Vypad� to, �e P�tra�i jsou n�jak spojeni se Sp��ov�m bratrstvem.");
		b_giveplayerxp(XP_SC_KNOWSMADPSI);
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_13");	//Pracuji na tom. P�ij� pozd�ji.
	};
};


instance DIA_KARRAS_PROT_BLACKEYE(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_prot_blackeye_condition;
	information = dia_karras_prot_blackeye_info;
	permanent = TRUE;
	description = "Existuje zp�sob, jak se ochr�nit p�ed ment�ln�mi �toky P�tra��?";
};


func int dia_karras_prot_blackeye_condition()
{
	if((hero.guild == GIL_KDF) && (PYROKAR_ASKKARRASABOUTDMTAMULETT == TRUE) && (MIS_KARRAS_FINDBLESSEDSTONE == FALSE) && Npc_KnowsInfo(other,dia_karras_job))
	{
		return TRUE;
	};
};

func void dia_karras_prot_blackeye_info()
{
	AI_Output(other,self,"DIA_Karras_Prot_BlackEye_15_00");	//Existuje zp�sob, jak se ochr�nit p�ed ment�ln�mi �toky P�tra��?
	if(SC_KNOWSMADPSI == TRUE)
	{
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_01");	//Jist�. Amulet s kamenem z posv�tn� p�dy by m�l m�t po�adovan� ochrann� efekt.
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_02");	//Bohu�el nem�m dostatek takov�ch kamen�.
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_03");	//Jsou z nich postaveny n�kter� ze svatyn�, kter� jsme vybudovali.
		AI_Output(other,self,"DIA_Karras_Prot_BlackEye_15_04");	//Dobr�. V�ak j� u� n�jak� n�kde spla��m.
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_05");	//Ano, ud�lej to. Ale a� t� ani nenapadne n�jak po�kodit ty svatyn�, sly��?
		b_logentry(TOPIC_DEMENTOREN,"Karras m� m��e p�ed ment�ln�mi �toky P�tra�� trochu ochr�nit. Pot�ebuje k tomu ale k�men z posv�tn� p�dy, jak� lze z�skat v n�kter�ch svatyn�ch.");
		MIS_KARRAS_FINDBLESSEDSTONE = LOG_RUNNING;
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_06");	//Nem�m tu�en�. St�le toho v�m p��li� m�lo, ne� abych znal odpov��. Zeptej se m� pozd�ji.
	};
};


instance DIA_KARRAS_KARRASBLESSEDSTONE(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_karrasblessedstone_condition;
	information = dia_karras_karrasblessedstone_info;
	description = "M�m n�kolik kamen� z posv�cen� p�dy.";
};


func int dia_karras_karrasblessedstone_condition()
{
	if((hero.guild == GIL_KDF) && Npc_HasItems(other,itmi_karrasblessedstone_mis) && (MIS_KARRAS_FINDBLESSEDSTONE == LOG_RUNNING))
	{
		return TRUE;
	};
};


var int karrasmakesblessedstone_day;

func void dia_karras_karrasblessedstone_info()
{
	AI_Output(other,self,"DIA_Karras_KarrasBlessedStone_15_00");	//M�m n�kolik kamen� z posv�cen� p�dy.
	b_giveinvitems(other,self,itmi_karrasblessedstone_mis,1);
	AI_Output(self,other,"DIA_Karras_KarrasBlessedStone_10_01");	//V�born�. Douf�m, �e v�echny svatyn� jsou st�le na sv�ch m�stech.
	AI_Output(self,other,"DIA_Karras_KarrasBlessedStone_10_02");	//Dobr�. Ud�l�m ti ochrann� amulet proti �ern�mu pohledu P�tra��.
	AI_Output(self,other,"DIA_Karras_KarrasBlessedStone_10_03");	//Dej mi trochu �asu. D�m se hned do pr�ce.
	KARRASMAKESBLESSEDSTONE_DAY = Wld_GetDay();
	MIS_KARRAS_FINDBLESSEDSTONE = LOG_SUCCESS;
	b_logentry(TOPIC_DEMENTOREN,"Karras mi dal amulet, kter� m� ochr�n� p�ed ment�ln�mi �toky P�tra��. Te� u� bude v�echno mnohem jednodu���.");
	b_giveplayerxp(XP_KARRAS_FOUNDBLESSEDSTONE);
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_ITAM_PROT_BLACKEYE_MIS(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_itam_prot_blackeye_mis_condition;
	information = dia_karras_itam_prot_blackeye_mis_info;
	permanent = TRUE;
	description = "Tak co je s t�m ochrann�m amuletem, cos mi sl�bil?";
};


var int dia_karras_itam_prot_blackeye_mis_noperm;

func int dia_karras_itam_prot_blackeye_mis_condition()
{
	if((hero.guild == GIL_KDF) && (MIS_KARRAS_FINDBLESSEDSTONE == LOG_SUCCESS) && (DIA_KARRAS_ITAM_PROT_BLACKEYE_MIS_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_karras_itam_prot_blackeye_mis_info()
{
	AI_Output(other,self,"DIA_Karras_ItAm_Prot_BlackEye_Mis_15_00");	//Tak co je s t�m ochrann�m amuletem, cos mi sl�bil?
	if(KARRASMAKESBLESSEDSTONE_DAY <= (Wld_GetDay() - 2))
	{
		AI_Output(self,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_01");	//Jsem hotov. Tady je, pod�vej. Vypad� nakonec n�dhern�.
		CreateInvItems(self,itam_prot_blackeye_mis,1);
		b_giveinvitems(self,other,itam_prot_blackeye_mis,1);
		AI_Output(self,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_02");	//Nos ho st�le u sebe a P�tra�i t� nebudou moci st�hnout do sv� du�evn� propasti.
		AI_Output(other,self,"DIA_Karras_ItAm_Prot_BlackEye_Mis_15_03");	//D�kuji.
		b_logentry(TOPIC_DEMENTOREN,"Karras mi dal amulet, kter� m� ochr�n� p�ed �ern�mi pohledy P�tra��.");
		DIA_KARRAS_ITAM_PROT_BLACKEYE_MIS_NOPERM = TRUE;
		b_giveplayerxp(XP_AMBIENT);
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_04");	//Trp�livost. Je�t� na tom pracuji.
	};
};


instance DIA_KARRAS_KAP4_EXIT(C_INFO)
{
	npc = kdf_503_karras;
	nr = 999;
	condition = dia_karras_kap4_exit_condition;
	information = dia_karras_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_karras_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_karras_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_KAP5_EXIT(C_INFO)
{
	npc = kdf_503_karras;
	nr = 999;
	condition = dia_karras_kap5_exit_condition;
	information = dia_karras_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_karras_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_karras_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_PICKPOCKET(C_INFO)
{
	npc = kdf_503_karras;
	nr = 900;
	condition = dia_karras_pickpocket_condition;
	information = dia_karras_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_karras_pickpocket_condition()
{
	return c_beklauen(49,35);
};

func void dia_karras_pickpocket_info()
{
	Info_ClearChoices(dia_karras_pickpocket);
	Info_AddChoice(dia_karras_pickpocket,DIALOG_BACK,dia_karras_pickpocket_back);
	Info_AddChoice(dia_karras_pickpocket,DIALOG_PICKPOCKET,dia_karras_pickpocket_doit);
};

func void dia_karras_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_karras_pickpocket);
};

func void dia_karras_pickpocket_back()
{
	Info_ClearChoices(dia_karras_pickpocket);
};

