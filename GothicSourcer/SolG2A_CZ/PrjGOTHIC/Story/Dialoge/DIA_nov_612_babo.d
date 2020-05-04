
instance DIA_BABO_KAP1_EXIT(C_INFO)
{
	npc = nov_612_babo;
	nr = 999;
	condition = dia_babo_kap1_exit_condition;
	information = dia_babo_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_babo_kap1_exit_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_babo_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BABO_HELLO(C_INFO)
{
	npc = nov_612_babo;
	nr = 2;
	condition = dia_babo_hello_condition;
	information = dia_babo_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_babo_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_babo_hello_info()
{
	AI_Output(self,other,"DIA_Babo_Hello_03_00");	//(ost�chav�) Ahoj, ty jsi tady tak� nov�, co?
	AI_Output(other,self,"DIA_Babo_Hello_15_01");	//Ano. Jak dlouho tady jsi?
	AI_Output(self,other,"DIA_Babo_Hello_03_02");	//Zat�m tady jsem �ty�i t�dny. Dostal jsi u� bojovou ty�?
	AI_Output(other,self,"DIA_Babo_Hello_15_03");	//Zat�m ne.
	AI_Output(self,other,"DIA_Babo_Hello_03_04");	//Tak si vezmi tuhle. Ka�d� novic dostane vlastn� ty� - je symbolem toho, �e je schopen se s�m ubr�nit. Um� bojovat?
	AI_Output(other,self,"DIA_Babo_Hello_15_05");	//No, u� jsem jednu nebo dv� zbran� v ruce dr�el.
	AI_Output(self,other,"DIA_Babo_Hello_03_06");	//Kdybys cht�l, m��u t� n�co nau�it. M�l bych ale jednu prosbu...
	b_giveinvitems(self,other,itmw_1h_nov_mace,1);
	AI_EquipBestMeleeWeapon(self);
};


instance DIA_BABO_ANLIEGEN(C_INFO)
{
	npc = nov_612_babo;
	nr = 2;
	condition = dia_babo_anliegen_condition;
	information = dia_babo_anliegen_info;
	permanent = FALSE;
	description = "Co bys pot�eboval?";
};


func int dia_babo_anliegen_condition()
{
	if((other.guild == GIL_NOV) && Npc_KnowsInfo(other,dia_babo_hello))
	{
		return TRUE;
	};
};

func void dia_babo_anliegen_info()
{
	AI_Output(other,self,"DIA_Babo_Anliegen_15_00");	//Co bys pot�eboval?
	AI_Output(self,other,"DIA_Babo_Anliegen_03_01");	//No, jeden z paladin�, Sergio, je moment�ln� tady v kl�te�e.
	AI_Output(self,other,"DIA_Babo_Anliegen_03_02");	//Kdyby se ti poda�ilo ho p�emluvit, aby si se mnou p�rkr�t zacvi�il, n�co bych t� nau�il.
	AI_Output(other,self,"DIA_Babo_Anliegen_15_03");	//Uvid�m, co s t�m p�jde d�lat.
	Log_CreateTopic(TOPIC_BABOTRAIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BABOTRAIN,LOG_RUNNING);
	b_logentry(TOPIC_BABOTRAIN,"Jestli se mi poda�� p�esv�d�it paladina Sergia, aby Baba trochu pocvi�il v boji, nau�� m� bojovat obouru�n�mi zbran�mi.");
};


instance DIA_BABO_SERGIO(C_INFO)
{
	npc = nov_612_babo;
	nr = 2;
	condition = dia_babo_sergio_condition;
	information = dia_babo_sergio_info;
	permanent = FALSE;
	description = "Mluvil jsem se Sergiem...";
};


func int dia_babo_sergio_condition()
{
	if(Npc_KnowsInfo(other,dia_sergio_babo) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_babo_sergio_info()
{
	AI_Output(other,self,"DIA_Babo_Sergio_15_00");	//Mluvil jsem se Sergiem. Bude t� tr�novat dv� hodiny ka�d� r�no, od p�ti hodin.
	AI_Output(self,other,"DIA_Babo_Sergio_03_01");	//D�ky! Je to pro m� obrovsk� �est!
	AI_Output(self,other,"DIA_Babo_Sergio_03_02");	//Kdybys cht�l, uk�u ti tak� n�jak� bojov� finty.
	BABO_TEACHPLAYER = TRUE;
	BABO_TRAINING = TRUE;
	b_giveplayerxp(XP_AMBIENT * 2);
	Log_CreateTopic(TOPIC_KLOSTERTEACHER,LOG_NOTE);
	b_logentry(TOPIC_KLOSTERTEACHER,"Babo m� m��e vycvi�it v obouru�n�m boji.");
};


instance DIA_BABO_TEACH(C_INFO)
{
	npc = nov_612_babo;
	nr = 100;
	condition = dia_babo_teach_condition;
	information = dia_babo_teach_info;
	permanent = TRUE;
	description = "Jsem p�ipraven na v�cvik.";
};


var int dia_babo_teach_permanent;
var int babo_labercount;

func int dia_babo_teach_condition()
{
	if(((BABO_TEACHPLAYER == TRUE) && (DIA_BABO_TEACH_PERMANENT == FALSE)) || (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};


var int babo_merk2h;

func void dia_babo_teach_info()
{
	BABO_MERK2H = other.hitchance[NPC_TALENT_2H];
	AI_Output(other,self,"DIA_Babo_Teach_15_00");	//Jsem p�ipraven na v�cvik.
	Info_ClearChoices(dia_babo_teach);
	Info_AddChoice(dia_babo_teach,DIALOG_BACK,dia_babo_teach_back);
	Info_AddChoice(dia_babo_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_babo_teach_2h_1);
	Info_AddChoice(dia_babo_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_babo_teach_2h_5);
};

func void dia_babo_teach_back()
{
	if(other.hitchance[NPC_TALENT_2H] >= 75)
	{
		AI_Output(self,other,"DIA_DIA_Babo_Teach_Back_03_00");	//U� ses nau�il o boji s obouru�n�mi zbran�mi v�echno, co zn�m.
		DIA_BABO_TEACH_PERMANENT = TRUE;
	};
	Info_ClearChoices(dia_babo_teach);
};

func void dia_babo_teach_2h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,75);
	if(other.hitchance[NPC_TALENT_2H] > BABO_MERK2H)
	{
		if(BABO_LABERCOUNT == 0)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_03_00");	//Bojuj za Innose. Innos je n� �ivot - a tv� v�ra ti bude d�vat s�lu.
		};
		if(BABO_LABERCOUNT == 1)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_03_01");	//Innos�v slu�ebn�k nikdy sv�ho protivn�ka neprovokuje - p�ekvap� ho!
		};
		if(BABO_LABERCOUNT == 2)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_03_02");	//A� jde� kamkoliv, m�j svou ty� st�le po ruce.
		};
		if(BABO_LABERCOUNT == 3)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_03_03");	//Innos�v slu�ebn�k je v�dycky p�ipraven� k boji. Pokud ti nem��e poslou�it magie, je tvoj� nejv�t�� obranou pr�v� h�l.
		};
		BABO_LABERCOUNT = BABO_LABERCOUNT + 1;
		if(BABO_LABERCOUNT >= 3)
		{
			BABO_LABERCOUNT = 0;
		};
	};
	Info_ClearChoices(dia_babo_teach);
	Info_AddChoice(dia_babo_teach,DIALOG_BACK,dia_babo_teach_back);
	Info_AddChoice(dia_babo_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_babo_teach_2h_1);
	Info_AddChoice(dia_babo_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_babo_teach_2h_5);
};

func void dia_babo_teach_2h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,75);
	if(other.hitchance[NPC_TALENT_2H] > BABO_MERK2H)
	{
		if(BABO_LABERCOUNT == 0)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_00");	//Innos�v slu�ebn�k nebojuje jenom ty��, ale tak� sv�m srdcem.
		};
		if(BABO_LABERCOUNT == 1)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_01");	//V�dycky mus� m�t v pam�ti m�sto, kam se m��e� v p��pad� pot�eby st�hnout.
		};
		if(BABO_LABERCOUNT == 2)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_02");	//Nezapome�, �e dob�e bojuje� v p��pad�, kdy sv�ho protivn�ka ovl�d� a ned�v� mu �anci, aby se ovl�dal s�m.
		};
		if(BABO_LABERCOUNT == 3)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_03");	//Prohraje� pouze v p��pad�, kdy� se vzd�.
		};
		BABO_LABERCOUNT = BABO_LABERCOUNT + 1;
		if(BABO_LABERCOUNT >= 3)
		{
			BABO_LABERCOUNT = 0;
		};
	};
	Info_ClearChoices(dia_babo_teach);
	Info_AddChoice(dia_babo_teach,DIALOG_BACK,dia_babo_teach_back);
	Info_AddChoice(dia_babo_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_babo_teach_2h_1);
	Info_AddChoice(dia_babo_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_babo_teach_2h_5);
};


instance DIA_BABO_WURST(C_INFO)
{
	npc = nov_612_babo;
	nr = 2;
	condition = dia_babo_wurst_condition;
	information = dia_babo_wurst_info;
	permanent = FALSE;
	description = "Tady m� klob�su.";
};


func int dia_babo_wurst_condition()
{
	if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void dia_babo_wurst_info()
{
	var string novizetext;
	var string novizeleft;
	AI_Output(other,self,"DIA_Babo_Wurst_15_00");	//Tady m� klob�su.
	AI_Output(self,other,"DIA_Babo_Wurst_03_01");	//Ach, skopov� klob�ska, v�born�! Chutnaj� v�n� v�born� - hele, dej mi je�t� jednu!
	AI_Output(other,self,"DIA_Babo_Wurst_15_02");	//Pak mi jich u� ale nezbude dost pro ostatn�.
	AI_Output(self,other,"DIA_Babo_Wurst_03_03");	//U� jsi dostal stejn� o jednu v�c, ne� si zaslou��. Konkr�tn� o tu, kterou jsem ti pr�v� dal. A co je klob�sa mezi p��teli?
	AI_Output(self,other,"DIA_Babo_Wurst_03_04");	//No tak, d�m ti za n� svitek s kouzlem 'Ohniv� ��p'.
	b_giveinvitems(other,self,itfo_schafswurst,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,itfo_sausage);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,2);
	Info_ClearChoices(dia_babo_wurst);
	Info_AddChoice(dia_babo_wurst,"No dob�e, tak si je�t� vezmi.",dia_babo_wurst_ja);
	Info_AddChoice(dia_babo_wurst,"Ne, to by prost� ne�lo.",dia_babo_wurst_nein);
};

func void dia_babo_wurst_ja()
{
	AI_Output(other,self,"DIA_Babo_Wurst_JA_15_00");	//No dob�e, tak si je�t� vezmi.
	AI_Output(self,other,"DIA_Babo_Wurst_JA_03_01");	//Bezva. Tady je ten svitek.
	b_giveinvitems(other,self,itfo_schafswurst,1);
	b_giveinvitems(self,other,itsc_firebolt,1);
	Info_ClearChoices(dia_babo_wurst);
};

func void dia_babo_wurst_nein()
{
	AI_Output(other,self,"DIA_Babo_Wurst_NEIN_15_00");	//Ne, to by prost� ne�lo.
	AI_Output(self,other,"DIA_Babo_Wurst_NEIN_03_01");	//Chlape, �e ty jsi jeden z t�ch, co berou v�echno moc zodpov�dn�?
	Info_ClearChoices(dia_babo_wurst);
};


instance DIA_BABO_YOUANDAGON(C_INFO)
{
	npc = nov_612_babo;
	nr = 3;
	condition = dia_babo_youandagon_condition;
	information = dia_babo_youandagon_info;
	permanent = FALSE;
	description = "Co se stalo mezi tebou a Agonem?";
};


func int dia_babo_youandagon_condition()
{
	if(Npc_KnowsInfo(other,dia_opolos_monastery) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_babo_youandagon_info()
{
	AI_Output(other,self,"DIA_Babo_YouAndAgon_15_00");	//Co se stalo mezi tebou a Agonem?
	AI_Output(self,other,"DIA_Babo_YouAndAgon_03_01");	//Ale to v�, tro�ku jsme se poh�dali o tom, jak se starat o ohniv� kop�ivy.
	AI_Output(self,other,"DIA_Babo_YouAndAgon_03_02");	//Agon je zal�val tak moc, �e jim jednoho dne uhnily ko�eny.
	AI_Output(self,other,"DIA_Babo_YouAndAgon_03_03");	//A kdy� se to stalo, tak to pak shodil na m�.
	AI_Output(self,other,"DIA_Babo_YouAndAgon_03_04");	//Od t� doby m� nenechaj� d�lat nic jin�ho, ne� jen zametat dv�r.
};


instance DIA_BABO_WHYDIDAGON(C_INFO)
{
	npc = nov_612_babo;
	nr = 4;
	condition = dia_babo_whydidagon_condition;
	information = dia_babo_whydidagon_info;
	permanent = FALSE;
	description = "Pro� to Agon ud�lal?";
};


func int dia_babo_whydidagon_condition()
{
	if(Npc_KnowsInfo(other,dia_babo_youandagon) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_babo_whydidagon_info()
{
	AI_Output(other,self,"DIA_Babo_WhyDidAgon_15_00");	//Pro� to Agon ud�lal?
	AI_Output(self,other,"DIA_Babo_WhyDidAgon_03_01");	//Na to se ho bude� muset zeptat s�m. Mysl�m, �e nesnese pomy�len� na to, �e by mohl b�t n�kdo lep�� ne� on.
};


instance DIA_BABO_PLANTLORE(C_INFO)
{
	npc = nov_612_babo;
	nr = 5;
	condition = dia_babo_plantlore_condition;
	information = dia_babo_plantlore_info;
	permanent = FALSE;
	description = "Zd� se, �e se v rostlin�ch docela vyzn�.";
};


func int dia_babo_plantlore_condition()
{
	if(Npc_KnowsInfo(other,dia_babo_youandagon) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_babo_plantlore_info()
{
	AI_Output(other,self,"DIA_Babo_PlantLore_15_00");	//Zd� se, �e se v rostlin�ch docela vyzn�.
	AI_Output(self,other,"DIA_Babo_PlantLore_03_01");	//M�j d�de�ek m�l bylinkovou zahr�dku a tam jsem se p�r v�c� nau�il.
	AI_Output(self,other,"DIA_Babo_PlantLore_03_02");	//V�n� bych byl r�d, kdybych mohl znovu pracovat v zahrad�.
	MIS_HELPBABO = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BABOGAERTNER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BABOGAERTNER,LOG_RUNNING);
	b_logentry(TOPIC_BABOGAERTNER,"Babo by rad�i pracoval v bylink��sk� zahrad�, ne� aby zametal dv�r.");
};


instance DIA_BABO_FEGEN(C_INFO)
{
	npc = nov_612_babo;
	nr = 2;
	condition = dia_babo_fegen_condition;
	information = dia_babo_fegen_info;
	permanent = FALSE;
	description = "M�m za �kol zametat v komnat�ch novic�.";
};


func int dia_babo_fegen_condition()
{
	if(MIS_PARLANFEGEN == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_babo_fegen_info()
{
	AI_Output(other,self,"DIA_Babo_Fegen_15_00");	//M�m za �kol zametat v komnat�ch novic�.
	AI_Output(self,other,"DIA_Babo_Fegen_03_01");	//Tak to ti toho nalo�ili docela dost. V� co? J� ti pom��u. S�m bys to nikdy nedod�lal.
	AI_Output(self,other,"DIA_Babo_Fegen_03_02");	//Stra�n� nutn� ale pot�ebuji svitek s kouzlem 'V�trn� p�st'. V�, m�l jsem �t�st� a p�e�etl jsem si o n�m knihu.
	AI_Output(self,other,"DIA_Babo_Fegen_03_03");	//Te� si pochopiteln� chci to kouzlo vyzkou�et. P�ines mi tedy ten svitek a j� ti pomohu.
	b_logentry(TOPIC_PARLANFEGEN,"Babo mi pom��e zam�st komnaty novic�, kdy� mu p�inesu svitek v�trn� p�sti.");
};


instance DIA_BABO_WINDFAUST(C_INFO)
{
	npc = nov_612_babo;
	nr = 3;
	condition = dia_babo_windfaust_condition;
	information = dia_babo_windfaust_info;
	permanent = TRUE;
	description = "Co se toho svitku t��e...";
};


var int dia_babo_windfaust_permanent;

func int dia_babo_windfaust_condition()
{
	if((MIS_PARLANFEGEN == LOG_RUNNING) && Npc_KnowsInfo(other,dia_babo_fegen) && (DIA_BABO_WINDFAUST_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_babo_windfaust_info()
{
	AI_Output(other,self,"DIA_Babo_Windfaust_15_00");	//Co se toho svitku t��e...
	AI_Output(self,other,"DIA_Babo_Windfaust_03_01");	//M� pro m� to kouzlo V�trn� p�st?
	if(b_giveinvitems(other,self,itsc_windfist,1))
	{
		AI_Output(other,self,"DIA_Babo_Windfaust_15_02");	//Tady je ten svitek s kouzlem, jak jsi cht�l.
		AI_Output(self,other,"DIA_Babo_Windfaust_03_03");	//To je skv�l�. Te� ti pom��u s t�m zamet�n�m.
		NOV_HELFER = NOV_HELFER + 1;
		DIA_BABO_WINDFAUST_PERMANENT = TRUE;
		b_giveplayerxp(XP_FEGER);
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FEGEN");
		b_logentry(TOPIC_PARLANFEGEN,"Babo mi nyn� pom��e zam�st cely novic�.");
	}
	else
	{
		AI_Output(other,self,"DIA_Babo_Windfaust_15_04");	//Ne, zat�m ne.
		AI_Output(self,other,"DIA_Babo_Windfaust_03_05");	//V tom p��pad� po�k�m, a� se ti jej poda�� sehnat.
	};
	AI_StopProcessInfos(self);
};


instance DIA_BABO_LIFE(C_INFO)
{
	npc = nov_612_babo;
	nr = 10;
	condition = dia_babo_life_condition;
	information = dia_babo_life_info;
	permanent = TRUE;
	description = "Jak jde �ivot tady v kl�te�e?";
};


func int dia_babo_life_condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_babo_life_info()
{
	AI_Output(other,self,"DIA_Babo_Life_15_00");	//Jak jde �ivot tady v kl�te�e?
	AI_Output(self,other,"DIA_Babo_Life_03_01");	//Nerad bych, aby to vypadalo, �e si st�uju, ale nikdy m� nenapadlo, �e to tady bude tak p��sn�. Kdy� se nedr�� pravidel, �ek� t� trest.
	AI_Output(self,other,"DIA_Babo_Life_03_02");	//Samoz�ejm�, �e spousta novic� chce v knihovn� studovat Innosovu moudrost, aby byli p�ipraveni pro p��pad, �e by byli vybr�ni.
	AI_Output(self,other,"DIA_Babo_Life_03_03");	//J� si ale mysl�m, �e nejlep�� p��pravou ke zkou�ce magie je plnit zadan� �koly.
	if(Npc_KnowsInfo(other,dia_igaranz_choosen) == FALSE)
	{
		AI_Output(other,self,"DIA_Babo_Life_15_04");	//Co je to vlastn� kolem toho Vyvolen�ho a zkou�ky?
		AI_Output(self,other,"DIA_Babo_Life_03_05");	//Promluv si s bratrem Igarazem. Ten o tom v� hodn�.
	};
};


instance DIA_BABO_HOWISIT(C_INFO)
{
	npc = nov_612_babo;
	nr = 1;
	condition = dia_babo_howisit_condition;
	information = dia_babo_howisit_info;
	permanent = TRUE;
	description = "Jak se m�?";
};


func int dia_babo_howisit_condition()
{
	if((hero.guild == GIL_KDF) && (KAPITEL < 3))
	{
		return TRUE;
	};
};


var int babo_xpgiven;

func void dia_babo_howisit_info()
{
	AI_Output(other,self,"DIA_Babo_HowIsIt_15_00");	//Jak se m�?
	if(MIS_HELPBABO == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Babo_HowIsIt_03_01");	//(skromn�) D�kuji m�g�m za sv�j �d�l.
		AI_Output(self,other,"DIA_Babo_HowIsIt_03_02");	//Jsem r�d, �e mohou pracovat v zahrad�, a douf�m, �e jsou se mnou m�gov� spokojeni, mist�e.
		if(BABO_XPGIVEN == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			BABO_XPGIVEN = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Babo_HowIsIt_03_03");	//(pod�en�) D.. d.. dob�e, mist�e.
		AI_Output(self,other,"DIA_Babo_HowIsIt_03_04");	//... pracuji ze v�ech sil a sna��m se nezklamat m�gy.
	};
	AI_StopProcessInfos(self);
};


instance DIA_BABO_KAP2_EXIT(C_INFO)
{
	npc = nov_612_babo;
	nr = 999;
	condition = dia_babo_kap2_exit_condition;
	information = dia_babo_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_babo_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_babo_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BABO_KAP3_EXIT(C_INFO)
{
	npc = nov_612_babo;
	nr = 999;
	condition = dia_babo_kap3_exit_condition;
	information = dia_babo_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_babo_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_babo_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BABO_KAP3_HELLO(C_INFO)
{
	npc = nov_612_babo;
	nr = 31;
	condition = dia_babo_kap3_hello_condition;
	information = dia_babo_kap3_hello_info;
	permanent = FALSE;
	description = "Co tady d�l�?";
};


func int dia_babo_kap3_hello_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_babo_kap3_hello_info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Hello_15_00");	//Co tady d�l�?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Babo_Kap3_Hello_03_01");	//(rozpa�it�) Sna��m se splnit �koly, kter� my byly zad�ny ku prosp�chu kl�tera.
	}
	else
	{
		AI_Output(self,other,"DIA_Babo_Kap3_Hello_03_02");	//Nesm�m s tebou mluvit. Na rozhovory s cizinci zde nen� nahl�eno s pochopen�m.
	};
};


instance DIA_BABO_KAP3_KEEPTHEFAITH(C_INFO)
{
	npc = nov_612_babo;
	nr = 31;
	condition = dia_babo_kap3_keepthefaith_condition;
	information = dia_babo_kap3_keepthefaith_info;
	permanent = FALSE;
	description = "Nikdy nesm� ztratit v�ru.";
};


func int dia_babo_kap3_keepthefaith_condition()
{
	if((KAPITEL >= 3) && Npc_KnowsInfo(other,dia_babo_kap3_hello) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_babo_kap3_keepthefaith_info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_KeepTheFaith_15_00");	//Nikdy nesm� ztratit v�ru.
	AI_Output(self,other,"DIA_Babo_Kap3_KeepTheFaith_03_01");	//(zasko�en) Ne,... tedy, j� bych nikdy nic takov�ho neud�lal. V�n�!
	AI_Output(other,self,"DIA_Babo_Kap3_KeepTheFaith_15_02");	//My v�ichni �asto stoj�me p�ed obt�n�mi zkou�kami.
	AI_Output(self,other,"DIA_Babo_Kap3_KeepTheFaith_03_03");	//Ano, mist�e. Budu si to v�dycky pamatovat. D�kuji ti.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_BABO_KAP3_UNHAPPY(C_INFO)
{
	npc = nov_612_babo;
	nr = 31;
	condition = dia_babo_kap3_unhappy_condition;
	information = dia_babo_kap3_unhappy_info;
	permanent = FALSE;
	description = "To nezn� zrovna dvakr�t ��astn�.";
};


func int dia_babo_kap3_unhappy_condition()
{
	if((KAPITEL >= 3) && (hero.guild != GIL_KDF) && Npc_KnowsInfo(other,dia_babo_kap3_hello))
	{
		return TRUE;
	};
};

func void dia_babo_kap3_unhappy_info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_15_00");	//To nezn� zrovna dvakr�t ��astn�.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_03_01");	//(zasko�en) No... tedy, v�echno je v naprost�m po��dku, v�n�.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_03_02");	//Jen... Ne, nechci si st�ovat.
	Info_ClearChoices(dia_babo_kap3_unhappy);
	Info_AddChoice(dia_babo_kap3_unhappy,"Tak p�esta� skuhrat.",dia_babo_kap3_unhappy_lament);
	Info_AddChoice(dia_babo_kap3_unhappy,"Ale no tak, mn� to ��ct m��e�.",dia_babo_kap3_unhappy_tellme);
};

func void dia_babo_kap3_unhappy_lament()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Lament_15_00");	//Tak p�esta� skuhrat.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Lament_03_01");	//(s obavami) J�... j�... pros�m, ne��kej to m�g�m.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Lament_03_02");	//Nechci, aby m� znovu potrestali.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Lament_15_03");	//Budu o tom p�em��let.
	Info_ClearChoices(dia_babo_kap3_unhappy);
};

func void dia_babo_kap3_unhappy_tellme()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_TellMe_15_00");	//Ale no tak, mn� to ��ct m��e�.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_01");	//A v�n� to m�g�m ne�ekne�?
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_TellMe_15_02");	//Vypad�m snad na to?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_03");	//Dobr�. M�m probl�m s jedn�m z novic�. Vyhro�uje mi.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_TellMe_15_04");	//No tak u� to kone�n� vysyp.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_05");	//Igaraz, to je ten novic, na�el moje soukrom� z�pisky.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_06");	//Pr� kdy� neud�l�m to, co chce, tak je p�ed� m�g�m.
	MIS_BABOSDOCS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BABOSDOCS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BABOSDOCS,LOG_RUNNING);
	b_logentry(TOPIC_BABOSDOCS,"Igaraz vyd�r� novice Baba kv�li n�jak�m dokument�m.");
	Info_ClearChoices(dia_babo_kap3_unhappy);
	Info_AddChoice(dia_babo_kap3_unhappy,"Mysl�m, �e to je na m� tro�ku moc osobn�.",dia_babo_kap3_unhappy_privat);
	Info_AddChoice(dia_babo_kap3_unhappy,"Co jsi pro n�j m�l ud�lat?",dia_babo_kap3_unhappy_shoulddo);
	Info_AddChoice(dia_babo_kap3_unhappy,"Co to je za dokumenty?",dia_babo_kap3_unhappy_documents);
	Info_AddChoice(dia_babo_kap3_unhappy,"Mo�n� bych ti mohl pomoci.",dia_babo_kap3_unhappy_canhelpyou);
};

func void dia_babo_kap3_unhappy_privat()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Privat_15_00");	//Mysl�m, �e to je na m� tro�ku moc osobn�.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Privat_03_01");	//Rozum�m, nechce� ��dn� pot�e. Asi si s t�m budu muset poradit s�m.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Privat_15_02");	//N�jak to ur�it� zvl�dne�.
	Info_ClearChoices(dia_babo_kap3_unhappy);
};

func void dia_babo_kap3_unhappy_shoulddo()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_ShouldDo_15_00");	//Co jsi pro n�j m�l ud�lat?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_ShouldDo_03_01");	//Nechce se mi o tom mluvit. Ka�dop�dn� by to asi Innose nepot�ilo.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_ShouldDo_03_02");	//Ani se mi nechce p�em��let nad t�m, co by se stalo, kdyby to vy�lo na povrch.
};

func void dia_babo_kap3_unhappy_documents()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Documents_15_00");	//Co to je za dokumenty?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Documents_03_01");	//(nejist�) Do toho nikomu nic nen�. Je to jen moje v�c.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Documents_15_02");	//No tak, �ekni mi to.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Documents_03_03");	//Jsou to, ehm... naprosto norm�ln� dokumenty. Nic zvl�tn�ho.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Documents_15_04");	//Dobr�, u� se nebudu pt�t.
};

func void dia_babo_kap3_unhappy_canhelpyou()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_00");	//Mo�n� bych ti mohl pomoci.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_01");	//Ud�lal bys to pro m�?
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_02");	//No, p�ijde na to.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_03");	//(kvapn�) Samoz�ejm�, �e bych ti za to zaplatil.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_04");	//Kolik?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_05");	//Pochopiteln� nem�m moc pen�z, ale mohl bych ti d�t svitek s kouzlem. Je to l��iv� kouzlo.
	Info_ClearChoices(dia_babo_kap3_unhappy);
	Info_AddChoice(dia_babo_kap3_unhappy,"Rad�i se do toho nebudu m�chat.",dia_babo_kap3_unhappy_no);
	Info_AddChoice(dia_babo_kap3_unhappy,"Uvid�m, co se d� d�lat.",dia_babo_kap3_unhappy_yes);
};

func void dia_babo_kap3_unhappy_no()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_No_15_00");	//Rad�i se do toho nebudu m�chat.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_No_03_01");	//V tom p��pad� nem�m na v�b�r, pojedu v tom d�l.
	Info_ClearChoices(dia_babo_kap3_unhappy);
};

func void dia_babo_kap3_unhappy_yes()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Yes_15_00");	//Uvid�m, co se d� d�lat.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Yes_03_01");	//(��astn�) V�n�, ur�it� to p�jde. Mus�!
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Yes_03_02");	//Tak�e je vlastn� zapot�eb� jenom zjistit, kde ty v�ci Igaraz m�. Pak u� mu je n�jak sebere� a v�echno bude v po��dku.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Yes_15_03");	//Uklidni se. Klidn� pracuj d�l. O zbytek se postar�m s�m.
	Info_ClearChoices(dia_babo_kap3_unhappy);
};


instance DIA_BABO_KAP3_HAVEYOURDOCS(C_INFO)
{
	npc = nov_612_babo;
	nr = 31;
	condition = dia_babo_kap3_haveyourdocs_condition;
	information = dia_babo_kap3_haveyourdocs_info;
	permanent = FALSE;
	description = "M�m ty tvoje dokumenty.";
};


func int dia_babo_kap3_haveyourdocs_condition()
{
	if(((MIS_BABOSDOCS == LOG_RUNNING) && (Npc_HasItems(other,itwr_babosdocs_mis) >= 1)) || ((Npc_HasItems(other,itwr_babospinup_mis) >= 1) && (Npc_HasItems(other,itwr_babosletter_mis) >= 1)))
	{
		return TRUE;
	};
};

func void dia_babo_kap3_haveyourdocs_info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_15_00");	//M�m ty tvoje dokumenty.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_03_01");	//V�n�? D�ky, zachr�nil jsi m�. Ani nev�m, jak bych se ti odvd��il.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_15_02");	//Jasn�, jasn�, u� se uklidni.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_03_03");	//(nerv�zn�) Jsou v�n� moje? Jsi si jist�? Uka� mi je.
	Info_ClearChoices(dia_babo_kap3_haveyourdocs);
	Info_AddChoice(dia_babo_kap3_haveyourdocs,"Je�t� si je chv�li ponech�m.",dia_babo_kap3_haveyourdocs_keepthem);
	if(BABOSDOCSOPEN == TRUE)
	{
		Info_AddChoice(dia_babo_kap3_haveyourdocs,"Odvozeno od hol�ch fakt� - cena vzrostla.",dia_babo_kap3_haveyourdocs_iwantmore);
	};
	Info_AddChoice(dia_babo_kap3_haveyourdocs,"Tady to m�.",dia_babo_kap3_haveyourdocs_heretheyare);
};

func void dia_babo_kap3_haveyourdocs_keepthem()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_15_00");	//Je�t� si je chv�li ponech�m.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_03_01");	//(ohromen�) Co�e!? Co to m� znamenat? Co chce� d�lat?
	Info_ClearChoices(dia_babo_kap3_haveyourdocs);
	Info_AddChoice(dia_babo_kap3_haveyourdocs,"D�l�m si srandu.",dia_babo_kap3_haveyourdocs_keepthem_justjoke);
	Info_AddChoice(dia_babo_kap3_haveyourdocs,"To je �ist� moje v�c.",dia_babo_kap3_haveyourdocs_keepthem_myconcern);
	if(IGARAZ_ISPARTNER == LOG_SUCCESS)
	{
		Info_AddChoice(dia_babo_kap3_haveyourdocs,"Igaraz a j� jsme partne�i.",dia_babo_kap3_haveyourdocs_keepthem_partner);
	};
};

func void dia_babo_kap3_haveyourdocs_keepthem_justjoke()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_00");	//D�l�m si srandu.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_03_01");	//(kousav�) Ha ha, sm�ju se, a� se za b�icho popad�m. Tak kde jsou?
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_02");	//Tady.
	if(Npc_HasItems(other,itwr_babosdocs_mis) >= 1)
	{
		b_giveinvitems(other,self,itwr_babosdocs_mis,1);
	}
	else
	{
		b_giveinvitems(other,self,itwr_babospinup_mis,1);
		b_giveinvitems(other,self,itwr_babosletter_mis,1);
	};
	b_usefakescroll();
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_03_03");	//Necht�l jsem t� urazit, ale jsem z toho v�eho prost� stra�n� nerv�zn�.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_04");	//To je v po��dku. Tak si u�ij ty svoje DOKUMENTY.
	MIS_BABOSDOCS = LOG_SUCCESS;
	b_giveplayerxp(XP_BABOSDOCS);
	Info_ClearChoices(dia_babo_kap3_haveyourdocs);
};

func void dia_babo_kap3_haveyourdocs_keepthem_myconcern()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_15_00");	//To je �ist� moje v�c.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_03_01");	//Ty dokumenty jsou moje. Nem� pr�vo si je nech�vat.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_15_02");	//Nashle.
	Info_ClearChoices(dia_babo_kap3_haveyourdocs);
};

func void dia_babo_kap3_haveyourdocs_keepthem_partner()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_00");	//Igaraz a j� jsme te� partne�i.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_03_01");	//(nev���cn�) Co�e? To p�ece nem��e�.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_02");	//Vypad� to, �e m��u. Nech�m si ty pap�ry a v�echno z�stane jako dosud.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_03");	//Urovn�m tu finan�n� z�le�itost s Igarazem.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_04");	//No, tak se hezky starej o rostlinky.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_03_05");	//Jsi svin�. Uboh�, hrabiv� svin�. Innos t� potrest�.
	Info_ClearChoices(dia_babo_kap3_haveyourdocs);
	Info_AddChoice(dia_babo_kap3_haveyourdocs,DIALOG_ENDE,dia_babo_kap3_haveyourdocs_end);
	Info_AddChoice(dia_babo_kap3_haveyourdocs,"Pozor na jazyk.",dia_babo_kap3_haveyourdocs_keepthem_partner_keepcalm);
	Info_AddChoice(dia_babo_kap3_haveyourdocs,"Nem� co na pr�ci?",dia_babo_kap3_haveyourdocs_keepthem_partner_nothingtodo);
};

func void dia_babo_kap3_haveyourdocs_end()
{
	AI_StopProcessInfos(self);
};

func void dia_babo_kap3_haveyourdocs_keepthem_partner_keepcalm()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm_15_00");	//Pozor na jazyk.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm_03_01");	//Jsem moc m�kk�, jako obvykle.
	AI_StopProcessInfos(self);
};

func void dia_babo_kap3_haveyourdocs_keepthem_partner_nothingtodo()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_NothingToDo_15_00");	//Nem� co na pr�ci?
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_NothingToDo_03_01");	//J� ti rozum�m, ale m��e� mi v��it - to je�t� bude m�t dohru.
	AI_StopProcessInfos(self);
};

func void dia_babo_kap3_haveyourdocs_iwantmore()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_15_00");	//Odvozeno od hol�ch fakt� - cena vzrostla.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_03_01");	//Nejsi o nic lep�� ne� ostatn�. Co chce�?
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_15_02");	//Co m�?
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_03_03");	//M��u ti d�t 121 zlat�ch, to je v�echno, co m�m.
	Info_ClearChoices(dia_babo_kap3_haveyourdocs);
	Info_AddChoice(dia_babo_kap3_haveyourdocs,"To nebude sta�it.",dia_babo_kap3_haveyourdocs_iwantmore_notenough);
	Info_AddChoice(dia_babo_kap3_haveyourdocs,"Pl�cneme si.",dia_babo_kap3_haveyourdocs_iwantmore_thatsenough);
};

func void dia_babo_kap3_haveyourdocs_iwantmore_notenough()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough_15_00");	//To nebude sta�it.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough_03_01");	//Ale j� v�c pen�z opravdu nem�m. Kdybych n�co takov�ho tu�il d��v, nikdy bych do kl�tera nevstoupil.
	Info_ClearChoices(dia_babo_kap3_haveyourdocs);
};

func void dia_babo_kap3_haveyourdocs_iwantmore_thatsenough()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough_15_00");	//Pl�cneme si.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough_03_01");	//Tady m� pen�ze a ten svitek.
	CreateInvItems(self,itsc_mediumheal,1);
	CreateInvItems(self,itmi_gold,121);
	b_giveinvitems(self,other,itsc_mediumheal,1);
	b_giveinvitems(self,other,itmi_gold,121);
	MIS_BABOSDOCS = LOG_SUCCESS;
	b_giveplayerxp(XP_BABOSDOCS);
	Info_ClearChoices(dia_babo_kap3_haveyourdocs);
};

func void dia_babo_kap3_haveyourdocs_heretheyare()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_15_00");	//Tady to m�.
	if(Npc_HasItems(other,itwr_babosdocs_mis) >= 1)
	{
		b_giveinvitems(other,self,itwr_babosdocs_mis,1);
	}
	else
	{
		b_giveinvitems(other,self,itwr_babospinup_mis,1);
		b_giveinvitems(other,self,itwr_babosletter_mis,1);
	};
	b_usefakescroll();
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_01");	//Jo, jsou v�echny.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_02");	//Koukal ses do nich?
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_15_03");	//Z�le�� na tom?
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_04");	//Te�, kdy� je m�m zp�tky, tak vlastn� ne.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_05");	//Douf�m, �e si te� m��u kone�n� vydechnout.
	CreateInvItems(self,itsc_mediumheal,1);
	b_giveinvitems(self,other,itsc_mediumheal,1);
	MIS_BABOSDOCS = LOG_SUCCESS;
	b_giveplayerxp(XP_BABOSDOCS);
	Info_ClearChoices(dia_babo_kap3_haveyourdocs);
};


instance DIA_BABO_KAP3_PERM(C_INFO)
{
	npc = nov_612_babo;
	nr = 39;
	condition = dia_babo_kap3_perm_condition;
	information = dia_babo_kap3_perm_info;
	permanent = TRUE;
	description = "Jsi spokojen� s t�m, co d�l�?";
};


func int dia_babo_kap3_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_babo_kap3_hello))
	{
		return TRUE;
	};
};

func void dia_babo_kap3_perm_info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Perm_15_00");	//Jsi spokojen� s t�m, co d�l�?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_01");	//(nep��li� p�esv�d�iv�) Ano, samoz�ejm�. Moje v�ra v Innosovu moudrost a moc mi d�v� s�lu.
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_02");	//(�hybn�) Nechci b�t nezdvo�il�, ale m�m toho dnes hodn� na pr�ci.
		AI_Output(other,self,"DIA_Babo_Kap3_Perm_15_03");	//Jen pokra�uj.
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_04");	//(s �levou) D�ky.
	}
	else
	{
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_05");	//Jo, jde to, ale mus�m se vr�tit do pr�ce, jinak to dneska nikdy nedod�l�m.
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_06");	//Nechci zase makat p�lku noci, jen abych splnil, co mi bylo zad�no, a nedostal se tak do pot��.
	};
	AI_StopProcessInfos(self);
};


instance DIA_BABO_KAP4_EXIT(C_INFO)
{
	npc = nov_612_babo;
	nr = 999;
	condition = dia_babo_kap4_exit_condition;
	information = dia_babo_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_babo_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_babo_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BABO_KAP5_EXIT(C_INFO)
{
	npc = nov_612_babo;
	nr = 999;
	condition = dia_babo_kap5_exit_condition;
	information = dia_babo_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_babo_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_babo_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BABO_PICKPOCKET(C_INFO)
{
	npc = nov_612_babo;
	nr = 900;
	condition = dia_babo_pickpocket_condition;
	information = dia_babo_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_babo_pickpocket_condition()
{
	return c_beklauen(17,25);
};

func void dia_babo_pickpocket_info()
{
	Info_ClearChoices(dia_babo_pickpocket);
	Info_AddChoice(dia_babo_pickpocket,DIALOG_BACK,dia_babo_pickpocket_back);
	Info_AddChoice(dia_babo_pickpocket,DIALOG_PICKPOCKET,dia_babo_pickpocket_doit);
};

func void dia_babo_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_babo_pickpocket);
};

func void dia_babo_pickpocket_back()
{
	Info_ClearChoices(dia_babo_pickpocket);
};

