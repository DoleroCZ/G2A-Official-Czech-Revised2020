
instance DIA_GIRION_EXIT(C_INFO)
{
	npc = pal_207_girion;
	nr = 999;
	condition = dia_girion_exit_condition;
	information = dia_girion_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_girion_exit_condition()
{
	return TRUE;
};

func void dia_girion_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GIRION_HALLO(C_INFO)
{
	npc = pal_207_girion;
	nr = 2;
	condition = dia_girion_hallo_condition;
	information = dia_girion_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_girion_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_SHIPISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_girion_hallo_info()
{
	AI_Output(self,other,"DIA_Girion_Hallo_08_00");	//Jsem Girion, mistr boje s obouru�n�mi zbran�mi a kr�lovsk� paladin. Pro� m� ru��?
};


instance DIA_GIRION_CANTEACH(C_INFO)
{
	npc = pal_207_girion;
	nr = 5;
	condition = dia_girion_canteach_condition;
	information = dia_girion_canteach_info;
	permanent = TRUE;
	description = "M��e� m� u�it?";
};


func int dia_girion_canteach_condition()
{
	if(GIRION_TEACH2H == FALSE)
	{
		return TRUE;
	};
};

func void dia_girion_canteach_info()
{
	AI_Output(other,self,"DIA_Girion_CanTeach_15_00");	//M��e� m� u�it?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Girion_CanTeach_08_01");	//Dob�e �in�, �e se chce� zlep�it v nejvzne�en�j��m zp�sobu veden� boje. Tak se na Innosova v�le�n�ka slu�� a pat��.
		AI_Output(self,other,"DIA_Girion_CanTeach_08_02");	//Budu t� u�it. P�ij� ke mn�, a� bude� p�ipraven.
		GIRION_TEACH2H = TRUE;
		b_logentry(TOPIC_CITYTEACHER,"Paladin Girion m� vycvi�� v pou��v�n� obouru�n�ch zbran�.");
	}
	else
	{
		AI_Output(self,other,"DIA_Girion_CanTeach_08_03");	//Pokud se chce� n�co nau�it, mus� se obr�tit na u�itele odjinud ne� z na�eho ��du.
		AI_Output(self,other,"DIA_Girion_CanTeach_08_04");	//Jsem v�le�n�k, ne u�itel.
	};
};


instance DIA_GIRION_TEACH(C_INFO)
{
	npc = pal_207_girion;
	nr = 100;
	condition = dia_girion_teach_condition;
	information = dia_girion_teach_info;
	permanent = TRUE;
	description = "Jsem p�ipraven k v�cviku.";
};


var int dia_girion_teach_permanent;

func int dia_girion_teach_condition()
{
	if((GIRION_TEACH2H == TRUE) && (DIA_GIRION_TEACH_PERMANENT == FALSE))
	{
		return TRUE;
	};
};


var int girion_merk2h;

func void dia_girion_teach_info()
{
	GIRION_MERK2H = other.hitchance[NPC_TALENT_2H];
	AI_Output(other,self,"DIA_Girion_Teach_15_00");	//Jsem p�ipraven k v�cviku.
	Info_ClearChoices(dia_girion_teach);
	Info_AddChoice(dia_girion_teach,DIALOG_BACK,dia_girion_teach_back);
	Info_AddChoice(dia_girion_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_girion_teach_2h_1);
	Info_AddChoice(dia_girion_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_girion_teach_2h_5);
};

func void dia_girion_teach_back()
{
	if(other.hitchance[NPC_TALENT_2H] >= 90)
	{
		AI_Output(self,other,"DIA_DIA_Girion_Teach_08_00");	//Tv� v�uka samoz�ejm� neskon�ila, ale j� u� ti nem��u uk�zat nic, co bys neznal.
		AI_Output(self,other,"DIA_DIA_Girion_Teach_08_01");	//Pokud chce� je�t� zv��it sv�j talent se zbran�mi, bude� muset vyhledat skute�n�ho mistra me�e.
		AI_Output(other,self,"DIA_DIA_Girion_Teach_15_02");	//Kde bych takov�ho �lov�ka mohl naj�t?
		AI_Output(self,other,"DIA_DIA_Girion_Teach_08_03");	//Lord Hagen je mistr me�e. Ur�it� t� n�co nau��.
		DIA_GIRION_TEACH_PERMANENT = TRUE;
	};
	Info_ClearChoices(dia_girion_teach);
};

func void dia_girion_teach_2h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,90);
	if(other.hitchance[NPC_TALENT_2H] > GIRION_MERK2H)
	{
		if(GIRION_LABERCOUNT == 0)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_1_08_00");	//Bojuj �estn�. Boj je n� �ivot - a co by byl �ivot beze cti?
		};
		if(GIRION_LABERCOUNT == 1)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_1_08_01");	//V boji bu� obez�etn� a rychl�. P�ekvap sv�ho protivn�ka.
		};
		if(GIRION_LABERCOUNT == 2)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_1_08_02");	//Nikdy necho� do boje nep�ipraven. Nikdy nev�, jestli n�hodou nen� posledn�.
		};
		if(GIRION_LABERCOUNT == 3)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_1_08_03");	//Paladin je v�dy p�ipraven na boj. Ale nikdy se nepou�t� do bitvy, kterou nem��e vyhr�t.
		};
		GIRION_LABERCOUNT = GIRION_LABERCOUNT + 1;
		if(GIRION_LABERCOUNT >= 3)
		{
			GIRION_LABERCOUNT = 0;
		};
	};
	Info_ClearChoices(dia_girion_teach);
	Info_AddChoice(dia_girion_teach,DIALOG_BACK,dia_girion_teach_back);
	Info_AddChoice(dia_girion_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_girion_teach_2h_1);
	Info_AddChoice(dia_girion_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_girion_teach_2h_5);
};

func void dia_girion_teach_2h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,90);
	if(other.hitchance[NPC_TALENT_2H] > GIRION_MERK2H)
	{
		if(GIRION_LABERCOUNT == 0)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_5_08_00");	//Paladin nebojuje pouze me�em, ale tak� vlastn� mysl�.
		};
		if(GIRION_LABERCOUNT == 1)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_5_08_01");	//V�dycky mus� m�t v pam�ti m�sto, kam se m��e� v p��pad� pot�eby st�hnout.
		};
		if(GIRION_LABERCOUNT == 2)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_5_08_02");	//Nezapome�, �e dob�e bojuje� v p��pad�, kdy sv�ho protivn�ka ovl�d� a ned�v� mu �anci, aby se ovl�dal s�m.
		};
		if(GIRION_LABERCOUNT == 3)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_5_08_03");	//Prohraje� pouze v p��pad�, kdy� se vzd�.
		};
		GIRION_LABERCOUNT = GIRION_LABERCOUNT + 1;
		if(GIRION_LABERCOUNT >= 3)
		{
			GIRION_LABERCOUNT = 0;
		};
	};
	Info_ClearChoices(dia_girion_teach);
	Info_AddChoice(dia_girion_teach,DIALOG_BACK,dia_girion_teach_back);
	Info_AddChoice(dia_girion_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_girion_teach_2h_1);
	Info_AddChoice(dia_girion_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_girion_teach_2h_5);
};


instance DIA_GIRION_CATCHPLAYERSTOLENSHIP(C_INFO)
{
	npc = pal_207_girion;
	nr = 5;
	condition = dia_girion_catchplayerstolenship_condition;
	information = dia_girion_catchplayerstolenship_info;
	important = TRUE;
};


func int dia_girion_catchplayerstolenship_condition()
{
	if((KAPITEL >= 5) && (MIS_SHIPISFREE == TRUE) && (Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_25") < 1000))
	{
		return TRUE;
	};
};

func void dia_girion_catchplayerstolenship_info()
{
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_08_00");	//Hej! M��e� mi laskav� ��ct, co to tady d�l�?
	Info_ClearChoices(dia_girion_catchplayerstolenship);
	Info_AddChoice(dia_girion_catchplayerstolenship,"Nev�m, o �em to mluv�.",dia_girion_catchplayerstolenship_no);
	Info_AddChoice(dia_girion_catchplayerstolenship,"Jdi mi z cesty, nebo t� budu muset zab�t.",dia_girion_catchplayerstolenship_weg);
	Info_AddChoice(dia_girion_catchplayerstolenship,"Pot�ebuju tu lo�. Tak si ji vezmu.",dia_girion_catchplayerstolenship_ship);
};

func void dia_girion_catchplayerstolenship_no()
{
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_no_15_00");	//Nev�m, o �em to mluv�.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_no_08_01");	//Mluv�m o tom, co jsi to provedl s lodn� str��. Smrd� mi to na sto hon�.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_no_08_02");	//I kdy� jsi m�g, stejn� ti nev���m.
	};
};


var int girion_wantstokillsc;

func void dia_girion_catchplayerstolenship_weg()
{
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_15_00");	//Jdi mi z cesty, nebo t� budu muset zab�t.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_08_01");	//Mo�n� jsi dok�zal o��lit str�e, ale brzo zjist�, �e se mnou to bude� m�t kapku t잚�, p��tel��ku.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_08_02");	//I kdy� jsi jeden z n�s, neznamen� to, �e bys m�l pr�vo kr�st kr�lovsk� majetek. Zem�i, zr�d�e.
	};
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
	GIRION_WANTSTOKILLSC = TRUE;
};

func void b_girionstayonship()
{
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_09");	//A� s t�m skon��me, zase mi tu lo� vr�t�, jasn�?
};

func void dia_girion_catchplayerstolenship_ship()
{
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_00");	//Pot�ebuju tu lo�. Tak si ji vezmu.
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_01");	//To nem��e�. Transport rudy...
	}
	else
	{
		AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_02");	//Jak se opova�uje�, ty smrdut�...
	};
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_03");	//Rudy v Hornick�m �dol� nen� dost na to, aby s n� byl kr�l spokojen�. Byl jsem tam. U� tam nen� nic, co by se mohlo hodit. Hagenova mise je fra�ka.
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_04");	//Skute�n� hrozba m� sv� ko�eny na ostrov� nedaleko odsud. Popluju tam a skoncuju s t�m.
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_05");	//Bu� se ke mn� p�ipoj�, nebo se budu bez tebe muset obej�t. Je to na tob�.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_06");	//Hmm. Zd� se, �e nem�m na v�b�r.
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_07");	//Spr�vn�.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_08");	//No dobr�. P�id�m se k tob�, ale jenom pod jednou podm�nkou.
	b_girionstayonship();
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_10");	//To nen� nic, s ��m bych nemohl ��t.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_11");	//V tom p��pad� d�lej, co mus�. Po�k�m tady na tebe.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Ship");
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	GIRION_ISONBOARD = LOG_SUCCESS;
};


instance DIA_GIRION_VERRAT(C_INFO)
{
	npc = pal_207_girion;
	nr = 2;
	condition = dia_girion_verrat_condition;
	information = dia_girion_verrat_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_girion_verrat_condition()
{
	if(GIRION_WANTSTOKILLSC == TRUE)
	{
		return TRUE;
	};
};

func void dia_girion_verrat_info()
{
	AI_Output(self,other,"DIA_Girion_Verrat_08_00");	//Zr�dce!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_GIRION_ONSHIP(C_INFO)
{
	npc = pal_207_girion;
	nr = 2;
	condition = dia_girion_onship_condition;
	information = dia_girion_onship_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_girion_onship_condition()
{
	if(Npc_IsInState(self,zs_talk) && (GIRION_ISONBOARD == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_girion_onship_info()
{
	b_girionstayonship();
	AI_StopProcessInfos(self);
};


instance DIA_GIRION_PICKPOCKET(C_INFO)
{
	npc = pal_207_girion;
	nr = 900;
	condition = dia_girion_pickpocket_condition;
	information = dia_girion_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_girion_pickpocket_condition()
{
	return c_beklauen(73,280);
};

func void dia_girion_pickpocket_info()
{
	Info_ClearChoices(dia_girion_pickpocket);
	Info_AddChoice(dia_girion_pickpocket,DIALOG_BACK,dia_girion_pickpocket_back);
	Info_AddChoice(dia_girion_pickpocket,DIALOG_PICKPOCKET,dia_girion_pickpocket_doit);
};

func void dia_girion_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_girion_pickpocket);
};

func void dia_girion_pickpocket_back()
{
	Info_ClearChoices(dia_girion_pickpocket);
};

