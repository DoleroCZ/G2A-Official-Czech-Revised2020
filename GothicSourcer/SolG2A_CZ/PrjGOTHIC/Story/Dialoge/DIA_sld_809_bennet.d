
instance DIA_BENNET_EXIT(C_INFO)
{
	npc = sld_809_bennet;
	nr = 999;
	condition = dia_bennet_exit_condition;
	information = dia_bennet_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bennet_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_bennet_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENNET_HALLO(C_INFO)
{
	npc = sld_809_bennet;
	nr = 1;
	condition = dia_bennet_hallo_condition;
	information = dia_bennet_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_bennet_hallo_condition()
{
	if((KAPITEL < 3) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_bennet_hallo_info()
{
	AI_Output(self,other,"DIA_Bennet_HALLO_06_00");	//Neprod�v�m ��dn� zbran�. Khaled je prod�v�. Je v dom� s Onarem.
	Log_CreateTopic(TOPIC_SOLDIERTRADER,LOG_NOTE);
	b_logentry(TOPIC_SOLDIERTRADER,"Khaled prod�v� zbran�.");
};


instance DIA_BENNET_TRADE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 700;
	condition = dia_bennet_trade_condition;
	information = dia_bennet_trade_info;
	permanent = TRUE;
	description = "M��e� mi prodat n�jak� v�ci na kov�n�?";
	trade = TRUE;
};


func int dia_bennet_trade_condition()
{
	if((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_bennet_trade_info()
{
	var int mcbolzenamount;
	var int mcarrowamount;
	AI_Output(other,self,"DIA_Bennet_TRADE_15_00");	//M��e� mi prodat n�jak� v�ci na kov�n�?
	b_givetradeinv(self);
	Npc_RemoveInvItems(self,itrw_bolt,Npc_HasItems(self,itrw_bolt));
	mcbolzenamount = KAPITEL * 50;
	CreateInvItems(self,itrw_bolt,mcbolzenamount);
	Npc_RemoveInvItems(self,itrw_arrow,Npc_HasItems(self,itrw_arrow));
	mcarrowamount = KAPITEL * 50;
	CreateInvItems(self,itrw_arrow,mcarrowamount);
	AI_Output(self,other,"DIA_Bennet_TRADE_06_01");	//Co pot�ebuje�?
	if(BENNETLOG == FALSE)
	{
		Log_CreateTopic(TOPIC_SOLDIERTRADER,LOG_NOTE);
		b_logentry(TOPIC_SOLDIERTRADER,"Bennet prod�v� kov��sk� n��in�.");
		BENNETLOG = TRUE;
	};
};


instance DIA_BENNET_WHICHWEAPONS(C_INFO)
{
	npc = sld_809_bennet;
	nr = 2;
	condition = dia_bennet_whichweapons_condition;
	information = dia_bennet_whichweapons_info;
	permanent = FALSE;
	description = "Jak� zbran� vyr�b�?";
};


func int dia_bennet_whichweapons_condition()
{
	if(((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)) && (MIS_BENNET_BRINGORE == FALSE))
	{
		return TRUE;
	};
};

func void dia_bennet_whichweapons_info()
{
	AI_Output(other,self,"DIA_Bennet_WhichWeapons_15_00");	//Jak� zbran� vyr�b�?
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_01");	//V tuhle chv�li oby�ejn� me�e, nic jin�ho.
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_02");	//Ale kdybych m�l trochu magick� rudy, mohl bych ukovat zbran�, kter� jsou mnohem lep�� ne� v�echny srovnateln� zbran� vyroben� z norm�ln� star� oceli.
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_03");	//Nev� n�hodou, kde bych tady v okol� n�jakou na�el? (sm�je se) M�m na mysli krom� Hornick�ho �dol� samoz�ejm�.
	AI_Output(other,self,"DIA_Bennet_WhichWeapons_15_04");	//Ne.
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_05");	//Samoz�ejm� ne.
};


instance DIA_BENNET_BAUORSLD(C_INFO)
{
	npc = sld_809_bennet;
	nr = 3;
	condition = dia_bennet_bauorsld_condition;
	information = dia_bennet_bauorsld_info;
	permanent = FALSE;
	description = "Jsi s farm��ema, nebo �old�kama?";
};


func int dia_bennet_bauorsld_condition()
{
	return TRUE;
};

func void dia_bennet_bauorsld_info()
{
	AI_Output(other,self,"DIA_Bennet_BauOrSld_15_00");	//Jsi s farm��ema, nebo �old�kama?
	AI_Output(self,other,"DIA_Bennet_BauOrSld_06_01");	//Ty si ze m� utahuje�, �e jo?
	AI_Output(other,self,"DIA_Bennet_BauOrSld_15_02");	//Byl jsem jenom zv�dav�.
	AI_Output(self,other,"DIA_Bennet_BauOrSld_06_03");	//U� jsi n�kdy vid�l farm��e kovat zbran�?
	AI_Output(other,self,"DIA_Bennet_BauOrSld_15_04");	//Ne.
	AI_Output(self,other,"DIA_Bennet_BauOrSld_06_05");	//Tak pro� mi d�v� tak hloup� ot�zky?
};


instance DIA_BENNET_WANNAJOIN(C_INFO)
{
	npc = sld_809_bennet;
	nr = 4;
	condition = dia_bennet_wannajoin_condition;
	information = dia_bennet_wannajoin_info;
	permanent = TRUE;
	description = "Chci se p�idat k �oldn���m!";
};


func int dia_bennet_wannajoin_condition()
{
	if(Npc_KnowsInfo(other,dia_bennet_bauorsld) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_bennet_wannajoin_info()
{
	AI_Output(other,self,"DIA_Bennet_WannaJoin_15_00");	//Chci se p�idat k �oldn���m!
	AI_Output(self,other,"DIA_Bennet_WannaJoin_06_01");	//P�esta� �vanit, b� za Torlofem a nech ho, a� ti d� test.
	if((MIS_TORLOF_HOLPACHTVONSEKOB == LOG_SUCCESS) || (MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_SUCCESS))
	{
		AI_Output(other,self,"DIA_Bennet_WannaJoin_15_02");	//Pro�el jsem zkou�kou.
		AI_Output(self,other,"DIA_Bennet_WannaJoin_06_03");	//Dob�e, tak to pro tebe budu hlasovat.
	};
};


instance DIA_BENNET_WANNASMITH(C_INFO)
{
	npc = sld_809_bennet;
	nr = 5;
	condition = dia_bennet_wannasmith_condition;
	information = dia_bennet_wannasmith_info;
	permanent = TRUE;
	description = "M��e� m� nau�it, jak ukovat me�?";
};


func int dia_bennet_wannasmith_condition()
{
	if((PLAYER_TALENT_SMITH[WEAPON_COMMON] == FALSE) && (BENNET_TEACHCOMMON == FALSE) && ((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_bennet_wannasmith_info()
{
	AI_Output(other,self,"DIA_Bennet_WannaSmith_15_00");	//M��e� m� nau�it, jak ukovat me�?
	AI_Output(self,other,"DIA_Bennet_WannaSmith_06_01");	//Jasn�.
	AI_Output(self,other,"DIA_Bennet_WannaSmith_06_02");	//To t� bude n�co st�t. �ekn�me 30 zlat�ch.
	Info_ClearChoices(dia_bennet_wannasmith);
	Info_AddChoice(dia_bennet_wannasmith,"Mo�n� pozd�ji.",dia_bennet_wannasmith_later);
	Info_AddChoice(dia_bennet_wannasmith,"Dob�e. Tady m� 30 zlatek.",dia_bennet_wannasmith_pay);
};

func void dia_bennet_wannasmith_pay()
{
	AI_Output(other,self,"DIA_Bennet_WannaSmith_Pay_15_00");	//Dob�e. Tady m� 30 zlatek.
	if(b_giveinvitems(other,self,itmi_gold,30))
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmith_Pay_06_01");	//A to byla taky zatracen� dobr� cena! M��eme za��t jakmile bude� p�ipraven.
		BENNET_TEACHCOMMON = TRUE;
		Log_CreateTopic(TOPIC_SOLDIERTEACHER,LOG_NOTE);
		b_logentry(TOPIC_SOLDIERTEACHER,"Bennet nau�� kov��sk�mu um�n�.");
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmith_Pay_06_02");	//P�esta� se chovat jako naivka. ��k�m 30 a ani o minci m��.
	};
	Info_ClearChoices(dia_bennet_wannasmith);
};

func void dia_bennet_wannasmith_later()
{
	AI_Output(other,self,"DIA_Bennet_WannaSmith_Later_15_00");	//Mo�n� pozd�ji.
	Info_ClearChoices(dia_bennet_wannasmith);
};


instance DIA_BENNET_TEACHCOMMON(C_INFO)
{
	npc = sld_809_bennet;
	nr = 6;
	condition = dia_bennet_teachcommon_condition;
	information = dia_bennet_teachcommon_info;
	permanent = TRUE;
	description = b_buildlearnstring("Nau�it se kov��stv�",b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_COMMON));
};


func int dia_bennet_teachcommon_condition()
{
	if((PLAYER_TALENT_SMITH[WEAPON_COMMON] == FALSE) && (BENNET_TEACHCOMMON == TRUE) && ((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_bennet_teachcommon_info()
{
	AI_Output(other,self,"DIA_Bennet_TeachCOMMON_15_00");	//Nau� mne ukovat me�!
	if(b_teachplayertalentsmith(self,other,WEAPON_COMMON))
	{
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_01");	//Je to celkem jednoduch�: Vezmi kus surov�ho �eleza a dr� ho v ohni do doby, ne� se neroz�hav�.
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_02");	//Pak ho polo� na kovadlinu a roztepej �epel do pot�ebn�ho tvaru.
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_03");	//Hlavn� mus� d�vat pozor, aby �epel p��li� nevychladla. Na opracov�n� zbran� m� v�dycky jenom p�r minut �asu.
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_04");	//Na zbytek p�ijde� s�m - je to jenom ot�zka praxe.
	};
};


instance DIA_BENNET_WANNASMITHORE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 7;
	condition = dia_bennet_wannasmithore_condition;
	information = dia_bennet_wannasmithore_info;
	permanent = TRUE;
	description = "Nau� mne kovat zbran� z magick� rudy!";
};


func int dia_bennet_wannasmithore_condition()
{
	if((BENNET_TEACHSMITH == FALSE) && ((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_bennet_wannasmithore_info()
{
	AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_00");	//Nau� mne kovat zbran� z magick� rudy!
	if(PLAYER_TALENT_SMITH[WEAPON_COMMON] == FALSE)
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_01");	//Ale ty nezn� v�bec ani z�klady.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_02");	//Nejd��ve se mus� nau�it ukovat oby�ejn� me�. Pak uvid�me.
	}
	else if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_03");	//Proto�e nejsi jedn�m z n�s, tak bych byl v h�ji, kdybych ti vyzradil tajemstv� zbran� z magick� rudy.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_04");	//Pouze velmi m�lo kov�ren tohle v�echno um�, a j� v���m, �e to nedok�� dokonce ani kov��i ve m�st�.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_05");	//A to je taky dob�e. Jinak by v�ichni ty m�stsk� ochlastov� ve str�i nosili magick� me�e.
		if(other.guild == GIL_MIL)
		{
			AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_06");	//Nic proti tob�. (k�en� se) Vypad� b�t v pohod�.
		};
	}
	else if(MIS_BENNET_BRINGORE != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_07");	//Kdybych m�l magickou rudu, dokonce i j� bych to tak ud�lal.
		AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_08");	//Ale, no t��k - jsem s �old�kama, a um�m kovat - co jin�ho chce�?
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_09");	//M��e� mi tedy potom ��ct, jak m�m ukovat zbra� z magick� rudy bez pou�it� magick� rudy?
		AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_10");	//Noooo...
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_11");	//To jsem si myslel. Pot�ebuju nejm�n� 5 hroudek t�to rudy - nebo na to rovnou zapome�.
		if(MIS_BENNET_BRINGORE == FALSE)
		{
			MIS_BENNET_BRINGORE = LOG_RUNNING;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_12");	//Skv�le, p�inesl jsi mi rudu a tak� v�, jak ukovat norm�ln� me�.
		AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_13");	//No, tak tedy pov�dej.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_14");	//Nejd�le�it�j�� v�c je: Nez�le�� na tom, zdali je tv� cel� zbra� vyroben� z magick� rudy, nebo jestli m� pokrytou jen oby�ejnou ocelovou �epel vrstvou rudy. Povrch je to, na �em z�le��.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_15");	//A proto�e je ten mizernej materi�l tak drahej, popadni ocelovej prut a pou�ij p�r hrud rudy.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_16");	//P�irozen� z toho nevznikne nic jin�ho, ne� �e to jenom pokryje hotov� me� magickou rudou. Bude� muset ukovat ten me� od za��tku.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_17");	//V�echno ostatn� z�vis� na zbrani, kterou chce� vyrobit.
		BENNET_TEACHSMITH = TRUE;
	};
};


instance DIA_BENNET_WHEREORE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_whereore_condition;
	information = dia_bennet_whereore_info;
	permanent = FALSE;
	description = "Kde m��u naj�t magickou rudu?";
};


func int dia_bennet_whereore_condition()
{
	if((MIS_BENNET_BRINGORE == LOG_RUNNING) && ((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_bennet_whereore_info()
{
	AI_Output(other,self,"DIA_Bennet_WhereOre_15_00");	//Kde m��u naj�t magickou rudu?
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_01");	//No, kdybych tohle jenom v�d�l. N�jak� ur�it� bude v t�a�sk� kolonii.
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_02");	//Ale mo�n� bude� m�t �t�st� a najde� tady v okol� p�r zbytk�.
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_03");	//Mysl�m, �e v hor�ch ji�n� odsud jsou n�jak� doly. Mo�n�, �e bys tam m�l v�t�� �t�st�.
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_04");	//Ale d�vej bacha, sly�el jsem, �e se to tam hem�� banditama.
};


instance DIA_BENNET_BRINGORE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 9;
	condition = dia_bennet_bringore_condition;
	information = dia_bennet_bringore_info;
	permanent = FALSE;
	description = "Tady m� t�ch p�t kousk� rudy.";
};


func int dia_bennet_bringore_condition()
{
	if((MIS_BENNET_BRINGORE == LOG_RUNNING) && (Npc_HasItems(other,itmi_nugget) >= 5))
	{
		return TRUE;
	};
};

func void dia_bennet_bringore_info()
{
	AI_Output(other,self,"DIA_Bennet_BringOre_15_00");	//Tady m� t�ch p�t kousk� rudy.
	AI_Output(self,other,"DIA_Bennet_BringOre_06_01");	//(sm�je se) Uka�!
	b_giveinvitems(other,self,itmi_nugget,5);
	AI_Output(self,other,"DIA_Bennet_BringOre_06_02");	//Skute�n�! Tohle m� fakt srazilo k zemi!
	AI_Output(self,other,"DIA_Bennet_BringOre_06_03");	//Dv� si nech. Bude� je pot�ebovat, abys mohl ukovat svoj� vlastn� zbra�.
	b_giveinvitems(self,other,itmi_nugget,2);
	MIS_BENNET_BRINGORE = LOG_SUCCESS;
};


var int bennet_kap2smith;
var int bennet_kap3smith;
var int bennet_kap4smith;
var int bennet_kap5smith;

func void b_saybennetlater()
{
	AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_04");	//Ne, je�t� ne. Vra� se pozd�ji.
};


instance DIA_BENNET_TEACHSMITH(C_INFO)
{
	npc = sld_809_bennet;
	nr = 30;
	condition = dia_bennet_teachsmith_condition;
	information = dia_bennet_teachsmith_info;
	permanent = TRUE;
	description = "Chci v�d�t v�c o kut� zbran� z magick� rudy.";
};


func int dia_bennet_teachsmith_condition()
{
	if((BENNET_TEACHSMITH == TRUE) && ((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_bennet_teachsmith_info()
{
	AI_Output(other,self,"DIA_Bennet_TeachSmith_15_00");	//Chci v�d�t v�c o kut� zbran� z magick� rudy.
	if(KAPITEL == 1)
	{
		b_saybennetlater();
	}
	else if((KAPITEL == 2) && (BENNET_KAP2SMITH == FALSE))
	{
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_01");	//Mohu t� nau�it, jak kovat me�e z magick� rudy nebo dokonce obouru�n� zbran�.
		BENNET_KAP2SMITH = TRUE;
	}
	else if((KAPITEL == 3) && (MIS_READYFORCHAPTER4 == FALSE) && (BENNET_KAP3SMITH == FALSE))
	{
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_02");	//Zdokonalil jsem svoj� techniku. Nyn� t� mohu nau�it, jak vytvo�it s pomoc� rudy t�k� me�e nebo t�k� obouru�n� me�e.
		BENNET_KAP3SMITH = TRUE;
	}
	else if((MIS_READYFORCHAPTER4 == TRUE) && (KAPITEL < 5) && (BENNET_KAP4SMITH == FALSE))
	{
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_03");	//Mysl�m, �e jsem se tentokr�t p�ekonal. Vytvo�il jsem dv� bojov� �epele. To je ta nejlep�� v�c, jakou jsem dote� vid�l.
		BENNET_KAP4SMITH = TRUE;
	}
	else if((KAPITEL >= 5) && (BENNET_KAP5SMITH == FALSE))
	{
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_04");	//Posly�. Mysl�m, �e jsem pr�v� dostal dokonal� n�pad. Zbran� z magick� rudy, pot��sn�n� dra�� krv�. A j� p�esn� v�m, jak na to p�jdu!
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_05");	//(zub� se) Chce� to v�d�t?
		BENNET_KAP5SMITH = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_06");	//Jak� druh zbran� bys cht�l vyrobit?
	};
	Info_ClearChoices(dia_bennet_teachsmith);
	Info_AddChoice(dia_bennet_teachsmith,DIALOG_BACK,dia_bennet_teachsmith_back);
	if((PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_01] == FALSE) && (KAPITEL >= 2))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_1H_SPECIAL_01,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_1H_SPECIAL_01)),dia_bennet_teachsmith_1hspecial1);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_01] == FALSE) && (KAPITEL >= 2))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_2H_SPECIAL_01,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_2H_SPECIAL_01)),dia_bennet_teachsmith_2hspecial1);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_02] == FALSE) && (KAPITEL >= 3))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_1H_SPECIAL_02,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_1H_SPECIAL_02)),dia_bennet_teachsmith_1hspecial2);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_02] == FALSE) && (KAPITEL >= 3))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_2H_SPECIAL_02,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_2H_SPECIAL_02)),dia_bennet_teachsmith_2hspecial2);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_03] == FALSE) && (KAPITEL >= 4))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_1H_SPECIAL_03,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_1H_SPECIAL_03)),dia_bennet_teachsmith_1hspecial3);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_03] == FALSE) && (KAPITEL >= 4))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_2H_SPECIAL_03,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_2H_SPECIAL_03)),dia_bennet_teachsmith_2hspecial3);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_04] == FALSE) && (KAPITEL >= 5))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_1H_SPECIAL_04,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_1H_SPECIAL_04)),dia_bennet_teachsmith_1hspecial4);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_04] == FALSE) && (KAPITEL >= 5))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_2H_SPECIAL_04,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_2H_SPECIAL_04)),dia_bennet_teachsmith_2hspecial4);
	};
};

func void dia_bennet_teachsmith_back()
{
	Info_ClearChoices(dia_bennet_teachsmith);
};

func void dia_bennet_teachsmith_1hspecial1()
{
	b_teachplayertalentsmith(self,other,WEAPON_1H_SPECIAL_01);
};

func void dia_bennet_teachsmith_2hspecial1()
{
	b_teachplayertalentsmith(self,other,WEAPON_2H_SPECIAL_01);
};

func void dia_bennet_teachsmith_1hspecial2()
{
	b_teachplayertalentsmith(self,other,WEAPON_1H_SPECIAL_02);
};

func void dia_bennet_teachsmith_2hspecial2()
{
	b_teachplayertalentsmith(self,other,WEAPON_2H_SPECIAL_02);
};

func void dia_bennet_teachsmith_1hspecial3()
{
	b_teachplayertalentsmith(self,other,WEAPON_1H_SPECIAL_03);
};

func void dia_bennet_teachsmith_2hspecial3()
{
	b_teachplayertalentsmith(self,other,WEAPON_2H_SPECIAL_03);
};

func void dia_bennet_teachsmith_1hspecial4()
{
	b_teachplayertalentsmith(self,other,WEAPON_1H_SPECIAL_04);
};

func void dia_bennet_teachsmith_2hspecial4()
{
	b_teachplayertalentsmith(self,other,WEAPON_2H_SPECIAL_04);
};


instance DIA_BENNET_KAP3_EXIT(C_INFO)
{
	npc = sld_809_bennet;
	nr = 999;
	condition = dia_bennet_kap3_exit_condition;
	information = dia_bennet_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bennet_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_bennet_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENNET_WHYPRISON(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_whyprison_condition;
	information = dia_bennet_whyprison_info;
	permanent = FALSE;
	description = "Za co ses dostal do lochu?";
};


func int dia_bennet_whyprison_condition()
{
	if((KAPITEL == 3) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_bennet_whyprison_info()
{
	AI_Output(other,self,"DIA_Bennet_WhyPrison_15_00");	//Za co ses dostal do lochu?
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_01");	//Ty svin� m� hodily do t�hle d�ry. Pr� jsem zavra�dil paladina.
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_02");	//Ale j� jsem to neud�lal, oni se to jenom pokou�� na m� hodit.
	AI_Output(other,self,"DIA_Bennet_WhyPrison_15_03");	//Pro� by to d�lali?
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_04");	//Jak to m�m v�d�t? M�l bys mne odtud dostat.
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_05");	//Promluv s lordem Hagenem, probourej ze�, je to jedno - prost� n�co ud�lej!
	MIS_RESCUEBENNET = LOG_RUNNING;
	Log_CreateTopic(TOPIC_RESCUEBENNET,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESCUEBENNET,LOG_RUNNING);
	b_logentry(TOPIC_RESCUEBENNET,"Bennet je v p�kn� brynd� a te� by ud�lal cokoliv, jen aby se dostal z basy.");
};


instance DIA_BENNET_WHATHAPPENED(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_whathappened_condition;
	information = dia_bennet_whathappened_info;
	permanent = FALSE;
	description = "Co se stalo?";
};


func int dia_bennet_whathappened_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bennet_whyprison))
	{
		return TRUE;
	};
};

func void dia_bennet_whathappened_info()
{
	AI_Output(other,self,"DIA_Bennet_WhatHappened_15_00");	//Co se stalo?
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_01");	//�el jsem do centra s Hodgesem nakoupit n�jak� z�soby pro na�e chlapce.
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_02");	//Najednou jsme usly�eli hlasit� v�k�ik a zvuk, jako by n�kdo b�el.
	AI_Output(other,self,"DIA_Bennet_WhatHappened_15_03");	//Jdi p��mo k v�ci.
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_04");	//V�d�li jsme najednou, �e se n�co stalo a �e n�s chyt�, kdy� n�s tam n�kdo uvid�.
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_05");	//B�eli jsme jak o �ivot. Potom, t�sn� p�edt�m, ne� jsme dob�hli k m�stsk� br�n�, jsem zakopnul a vyvrknul jsem si kotn�k.
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_06");	//Zbytek je u� jednoduchej. Najednou u mne byla domobrana a ta m� uvrhla rovnou do t�hle d�ry.
};


instance DIA_BENNET_VICTIM(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_victim_condition;
	information = dia_bennet_victim_info;
	permanent = FALSE;
	description = "Kdo byl zavra�d�n?";
};


func int dia_bennet_victim_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bennet_whyprison))
	{
		return TRUE;
	};
};

func void dia_bennet_victim_info()
{
	AI_Output(other,self,"DIA_Bennet_Victim_15_00");	//Kdo byl zavra�d�n?
	AI_Output(self,other,"DIA_Bennet_Victim_06_01");	//Nem�m pon�t� - jeden z paladin�, v�bec je nezn�m.
	AI_Output(other,self,"DIA_Bennet_Victim_15_02");	//Jak se jmenoval?
	AI_Output(self,other,"DIA_Bennet_Victim_06_03");	//N�jak� Lothar, mysl�m. No, nev�m, opravdu si nejsem jistej.
	AI_Output(self,other,"DIA_Bennet_Victim_06_04");	//Rad�i by ses m�l zeptat lorda Hagena, on zn� v�echny detaily.
	b_logentry(TOPIC_RESCUEBENNET,"Lothar, jeden z paladin�, byl zavra�d�n. Bli��� informaci by mi mohl podat Lord Hagen, kter� vede cel� vy�et�ov�n�.");
};


instance DIA_BENNET_EVIDENCE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_evidence_condition;
	information = dia_bennet_evidence_info;
	permanent = FALSE;
	description = "Maj� proti tob� n�jak� d�kaz?";
};


func int dia_bennet_evidence_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bennet_whyprison))
	{
		return TRUE;
	};
};

func void dia_bennet_evidence_info()
{
	AI_Output(other,self,"DIA_Bennet_Evidence_15_00");	//Maj� proti tob� n�jak� d�kaz?
	AI_Output(self,other,"DIA_Bennet_Evidence_06_01");	//��kaj�, �e maj� n�jak�ho sv�dka, kter� mne poznal.
	AI_Output(other,self,"DIA_Bennet_Evidence_15_02");	//Nev� n�hodou, kdo je ten sv�dek?
	AI_Output(self,other,"DIA_Bennet_Evidence_06_03");	//Ne. V�echno, co v�m, je, �e je to lh��.
	b_logentry(TOPIC_RESCUEBENNET,"Jeden sv�dek tvrd�, �e Benneta vid�l. Mus�m ho naj�t a zjistit, jak to bylo doopravdy.");
	RESCUEBENNET_KNOWSWITNESS = TRUE;
};


instance DIA_BENNET_INVESTIGATION(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_investigation_condition;
	information = dia_bennet_investigation_info;
	permanent = FALSE;
	description = "Kdo vede vy�et�ov�n�?";
};


func int dia_bennet_investigation_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bennet_evidence))
	{
		return TRUE;
	};
};

func void dia_bennet_investigation_info()
{
	AI_Output(other,self,"DIA_Bennet_Investigation_15_00");	//Kdo vede vy�et�ov�n�?
	AI_Output(self,other,"DIA_Bennet_Investigation_06_01");	//S�m lord Hagen. A proto�e ob�t� byl jeden z paladin�, spad� tenhle p��pad pod v�le�n� soud.
	AI_Output(other,self,"DIA_Bennet_Investigation_15_02");	//Co to znamen�?
	AI_Output(self,other,"DIA_Bennet_Investigation_06_03");	//To je jednoduch� uhodnout. Pokud se odtud nedostanu, bez okolk� m� pov�s�.
	AI_Output(self,other,"DIA_Bennet_Investigation_06_04");	//Mus� mi pomoct, nebo tady bude v�lka. Lee to nenech� b�t jen tak.
	AI_Output(self,other,"DIA_Bennet_Investigation_06_05");	//M��e� si d�t dohromady s�m, co to znamen�.
};


instance DIA_BENNET_THANKYOU(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_thankyou_condition;
	information = dia_bennet_thankyou_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_bennet_thankyou_condition()
{
	if(MIS_RESCUEBENNET == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_bennet_thankyou_info()
{
	if(hero.guild == GIL_SLD)
	{
		other.guild = GIL_DJG;
		Npc_SetTrueGuild(other,GIL_DJG);
	};
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_00");	//Chlape, u� jsem si myslel, �e m� v�n� pov�s�!
	AI_Output(other,self,"DIA_Bennet_ThankYou_15_01");	//No, nakonec to dob�e dopadlo.
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_02");	//To mi pov�dej. M�l jsi vid�t ksicht toho voj�ka, kdy� m� musel pustit ven!
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_03");	//(sm�je se) Byl tak vystra�enej, �e si skoro nad�lal do kalhot.
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_04");	//Co� mi p�ipom�n�, �e pro tebe n�co m�m.
	AI_Output(other,self,"DIA_Bennet_ThankYou_15_05");	//Co mysl�?
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_06");	//(k�en� se) D�re�ek.
};


instance DIA_BENNET_PRESENT(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_present_condition;
	information = dia_bennet_present_info;
	permanent = FALSE;
	description = "Jak� d�re�ek?";
};


func int dia_bennet_present_condition()
{
	if(Npc_KnowsInfo(other,dia_bennet_thankyou))
	{
		return TRUE;
	};
};

func void dia_bennet_present_info()
{
	AI_Output(other,self,"DIA_Bennet_Present_15_00");	//Jak� d�re�ek?
	AI_Output(self,other,"DIA_Bennet_Present_06_01");	//Sly�eli jsme o drac�ch, kte�� by m�li pr� bejt v �dol�.
	AI_Output(other,self,"DIA_Bennet_Present_15_02");	//Oni tam skute�n� jsou!
	AI_Output(self,other,"DIA_Bennet_Present_06_03");	//Dob�e, j� ti v���m.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Bennet_Present_06_04");	//V ka�d�m p��pad� se p�r chlapc� rozhodlo j�t do �dol�.
		AI_Output(self,other,"DIA_Bennet_Present_06_05");	//(zub� se) Maj� v pl�nu to tam trochu uklidit.
		AI_Output(other,self,"DIA_Bennet_Present_15_06");	//A co to m� co d�lat se mnou?
		AI_Output(self,other,"DIA_Bennet_Present_06_07");	//(py�n�) Vytvo�il jsem nov� typ brn�n�. Brn�n� drakobijc�!
		AI_Output(self,other,"DIA_Bennet_Present_06_08");	//Je robustn�j�� a leh�� ne� norm�ln� brn�n�.
		AI_Output(self,other,"DIA_Bennet_Present_06_09");	//A proto�e jsi m� zachr�nil, chci, abys dostal prvn� kus. Je to dar!
		CreateInvItems(self,itar_djg_l,1);
		b_giveinvitems(self,other,itar_djg_l,1);
		AI_Output(self,other,"DIA_Bennet_Present_06_10");	//Myslel jsem, �e by se ti to mohlo hodit. Bude� pot�ebovat to spr�vn� vybaven�, ne� p�jde� tam dol� do �dol�.
		AI_Output(self,other,"DIA_Bennet_Present_06_11");	//Tak� m� zaj�maj� dra�� �upiny. Opravdov� dra�� �upiny. Slu�n� ti za n� zaplat�m.
		AI_Output(other,self,"DIA_Bennet_Present_15_12");	//Kolik dostanu za jednu �upinu?
		b_say_gold(self,other,VALUE_DRAGONSCALE);
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_Present_06_13");	//Krom� toho jsem si myslel, �e by sis asi necht�l nechat ten dra�� hon uj�t.
		AI_Output(other,self,"DIA_Bennet_Present_15_14");	//A?
		AI_Output(self,other,"DIA_Bennet_Present_06_15");	//Tady, vezmi si tenhle amulet. Mysl�m, �e ho bude� pot�ebovat v�c ne� j�.
		CreateInvItems(self,itam_hp_01,1);
		b_giveinvitems(self,other,itam_hp_01,1);
	};
};


var int bennet_dragonscale_counter;
var int show_djg_armor_m;

instance DIA_BENNET_DRAGONSCALE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_dragonscale_condition;
	information = dia_bennet_dragonscale_info;
	permanent = TRUE;
	description = "M�m pro tebe p�r dra��ch �upin.";
};


func int dia_bennet_dragonscale_condition()
{
	if((Npc_HasItems(other,itat_dragonscale) > 0) && (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_bennet_dragonscale_info()
{
	AI_Output(other,self,"DIA_Bennet_DragonScale_15_00");	//M�m pro tebe p�r dra��ch �upin.
	AI_Output(self,other,"DIA_Bennet_DragonScale_06_01");	//Opravdov� dra�� �upiny!
	AI_Output(self,other,"DIA_Bennet_DragonScale_06_02");	//Tady je tv� zlato!
	BENNET_DRAGONSCALE_COUNTER = BENNET_DRAGONSCALE_COUNTER + Npc_HasItems(other,itat_dragonscale);
	b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_dragonscale) * VALUE_DRAGONSCALE);
	b_giveinvitems(other,self,itat_dragonscale,Npc_HasItems(other,itat_dragonscale));
	if((BENNET_DRAGONSCALE_COUNTER >= 20) && (SHOW_DJG_ARMOR_M == FALSE))
	{
		AI_Output(self,other,"DIA_Bennet_DragonScale_06_03");	//Dob�e, to by sta�ilo. Mohl bych ti prodat nov�, vylep�en� brn�n�, pokud bys m�l z�jem.
		SHOW_DJG_ARMOR_M = TRUE;
	};
};


var int bennet_dia_bennet_djg_armor_m_permanent;

instance DIA_BENNET_DJG_ARMOR_M(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_djg_armor_m_condition;
	information = dia_bennet_djg_armor_m_info;
	permanent = TRUE;
	description = "St�edn� t�k� drakobijeck� zbroj. Ochrana: zbran� 120, ��py 120. (12000 zla��k�).";
};


func int dia_bennet_djg_armor_m_condition()
{
	if((BENNET_DIA_BENNET_DJG_ARMOR_M_PERMANENT == FALSE) && (hero.guild == GIL_DJG) && (SHOW_DJG_ARMOR_M == TRUE))
	{
		return TRUE;
	};
};

func void dia_bennet_djg_armor_m_info()
{
	AI_Output(other,self,"DIA_Bennet_DJG_ARMOR_M_15_00");	//Chci si koupit nov� brn�n�.
	if(Npc_HasItems(other,itmi_gold) >= 12000)
	{
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_M_06_01");	//Velmi dob�e. Bude se ti to l�bit.
		AI_Output(other,self,"DIA_Bennet_DJG_ARMOR_M_15_02");	//Za tu cenu by opravdu m�lo.
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_M_06_03");	//Zjist�, �e to brn�n� stoj� za ka�dej ten zla��k.
		b_giveinvitems(other,self,itmi_gold,12000);
		CreateInvItems(self,itar_djg_m,1);
		b_giveinvitems(self,other,itar_djg_m,1);
		BENNET_DIA_BENNET_DJG_ARMOR_M_PERMANENT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_M_06_04");	//Nem� dost zlata.
	};
};


instance DIA_BENNET_BETTERARMOR(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_betterarmor_condition;
	information = dia_bennet_betterarmor_info;
	permanent = FALSE;
	description = "V�m, jak brn�n� je�t� v�c vylep�it.";
};


func int dia_bennet_betterarmor_condition()
{
	if((PLAYERGETSFINALDJGARMOR == TRUE) && (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_bennet_betterarmor_info()
{
	AI_Output(other,self,"DIA_Bennet_BetterArmor_15_00");	//V�m, jak brn�n� je�t� v�c vylep�it.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_01");	//(usm�v� se) Tak mi to �ekni.
	AI_Output(other,self,"DIA_Bennet_BetterArmor_15_02");	//Mohl bys pokr�t dra�� �upiny magickou rudou.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_03");	//(sm�je se) Tohle m� u� taky napadlo. A m� pravdu.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_04");	//M� nejnov�j�� brn�n� p�ed�� v�echno, co jsi doposud vid�l. Je te� lehk� a masivn�.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_05");	//Je PERFEKTN�.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_06");	//M��e� ho koupit, jestli chce�. Ned�v�m tuhle nab�dku jen tak n�komu a nav�c cena zahrnuje pouze v�robn� n�klady.
};


var int bennet_dia_bennet_djg_armor_h_permanent;

instance DIA_BENNET_DJG_ARMOR_H(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_djg_armor_h_condition;
	information = dia_bennet_djg_armor_h_info;
	permanent = TRUE;
	description = "T�k� drakobijeck� zbroj. Ochrana: zbran� 150, ��py 150. (20000 zla��k�).";
};


func int dia_bennet_djg_armor_h_condition()
{
	if((BENNET_DIA_BENNET_DJG_ARMOR_H_PERMANENT == FALSE) && (hero.guild == GIL_DJG) && Npc_KnowsInfo(other,dia_bennet_betterarmor))
	{
		return TRUE;
	};
};

func void dia_bennet_djg_armor_h_info()
{
	AI_Output(other,self,"DIA_Bennet_DJG_ARMOR_H_15_00");	//Dej mi to brn�n�.
	if(Npc_HasItems(other,itmi_gold) >= 20000)
	{
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_H_06_01");	//Tohle je nejlep�� brn�n�, jak� jsem kdy vyrobil.
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_H_06_02");	//Opravdov� skvost.
		b_giveinvitems(other,self,itmi_gold,20000);
		CreateInvItems(self,itar_djg_h,1);
		b_giveinvitems(self,other,itar_djg_h,1);
		BENNET_DIA_BENNET_DJG_ARMOR_H_PERMANENT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_H_06_03");	//Nem� dost zlata.
	};
};


instance DIA_BENNET_REPAIRNECKLACE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_repairnecklace_condition;
	information = dia_bennet_repairnecklace_info;
	permanent = FALSE;
	description = "Um� opravit i klenoty?";
};


func int dia_bennet_repairnecklace_condition()
{
	if((MIS_BENNET_INNOSEYEREPAIREDSETTING != LOG_SUCCESS) && (Npc_HasItems(other,itmi_innoseye_broken_mis) || (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE)))
	{
		return TRUE;
	};
};

func void dia_bennet_repairnecklace_info()
{
	AI_Output(other,self,"DIA_Bennet_RepairNecklace_15_00");	//Um� opravit i klenoty?
	AI_Output(self,other,"DIA_Bennet_RepairNecklace_06_01");	//Z�le�� na tom, jak�. Nejd��v mi uka�, co m� na mysli.
	if(MIS_RESCUEBENNET != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bennet_RepairNecklace_06_02");	//Taky se odsud mus�m nejd��v dostat.
		AI_Output(self,other,"DIA_Bennet_RepairNecklace_06_03");	//P�edt�m ti tu v�c z�ejm� neoprav�m.
	};
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
};


instance DIA_BENNET_SHOWINNOSEYE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_showinnoseye_condition;
	information = dia_bennet_showinnoseye_info;
	permanent = FALSE;
	description = "M��e� se pod�vat na tenhle amulet?";
};


func int dia_bennet_showinnoseye_condition()
{
	if(Npc_HasItems(other,itmi_innoseye_broken_mis) && (MIS_BENNET_INNOSEYEREPAIREDSETTING != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_bennet_showinnoseye_info()
{
	AI_Output(other,self,"DIA_Bennet_ShowInnosEye_15_00");	//M��e� se pod�vat na tenhle amulet?
	AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_01");	//Jasn�, uka� mi ho.
	AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_02");	//Hmm, to je skute�n� n�dhern� pr�ce. Oprava bude z�hul. Ale mysl�m si, �e jsem schopnej to opravit.
	AI_Output(other,self,"DIA_Bennet_ShowInnosEye_15_03");	//Jak dlouho ti to potrv�?
	if(MIS_RESCUEBENNET != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_04");	//No, te� jsem se zaseknul tady. Nebo tu snad vid� n�kde d�lnu?
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_05");	//Kdybych byl ve sv� kov�rn�, byl bych schopnej to v�echno ud�lat za jeden den. Ale samoz�ejm� se mus�m nejd��v dostat ven.
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_06");	//Pokud mi ho tu nech�, bude hotovej do doby, ne� se sem z�tra vr�t�.
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_07");	//A dokonce ti to ani nebudu ��tovat. V�dy� jsi m� dostal ven z lochu.
	};
	b_logentry(TOPIC_INNOSEYE,"Bennet je ten prav� kov��, kter� mi oprav� ten amulet.");
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
};


instance DIA_BENNET_GIVEINNOSEYE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_giveinnoseye_condition;
	information = dia_bennet_giveinnoseye_info;
	permanent = FALSE;
	description = "Tady je ten amulet, oprav mi ho, pros�m.";
};


func int dia_bennet_giveinnoseye_condition()
{
	if((Npc_HasItems(other,itmi_innoseye_broken_mis) >= 1) && (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE) && (MIS_RESCUEBENNET == LOG_SUCCESS) && (MIS_BENNET_INNOSEYEREPAIREDSETTING != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_bennet_giveinnoseye_info()
{
	AI_Output(other,self,"DIA_Bennet_GiveInnosEye_15_00");	//Tady je ten amulet, oprav mi ho, pros�m.
	AI_Output(self,other,"DIA_Bennet_GiveInnosEye_06_01");	//Dob�e. Budu to m�t opraven� do z�t�ka.
	AI_Output(self,other,"DIA_Bennet_GiveInnosEye_06_02");	//M��e� potom ke mn� p�ij�t a dostat ho.
	Npc_RemoveInvItems(other,itmi_innoseye_broken_mis,1);
	AI_PrintScreen(PRINT_INNOSEYEGIVEN,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
	BENNET_REPAIRDAY = Wld_GetDay();
};


instance DIA_BENNET_GETINNOSEYE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_getinnoseye_condition;
	information = dia_bennet_getinnoseye_info;
	permanent = TRUE;
	description = "Je amulet hotov�?";
};


func int dia_bennet_getinnoseye_condition()
{
	if(Npc_KnowsInfo(other,dia_bennet_giveinnoseye) && (MIS_BENNET_INNOSEYEREPAIREDSETTING != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_bennet_getinnoseye_info()
{
	AI_Output(other,self,"DIA_Bennet_GetInnosEye_15_00");	//Je amulet hotov�?
	if(BENNET_REPAIRDAY < Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_01");	//Ano, tady.
		TEXT_INNOSEYE_SETTING = TEXT_INNOSEYE_SETTING_REPAIRED;
		CreateInvItems(other,itmi_innoseye_broken_mis,1);
		AI_PrintScreen(PRINT_INNOSEYEGET,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_02");	//Musel jsem tam zasadit nov� k�men.
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_03");	//Pracoval jsem na n�m celou noc a te� vypad� jako nov�.
		b_logentry(TOPIC_INNOSEYE,"Amulet je op�t cel�, Bennet odvedl skv�lou pr�ci.");
		MIS_BENNET_INNOSEYEREPAIREDSETTING = LOG_SUCCESS;
		b_giveplayerxp(XP_INNOSEYEISREPAIRED);
	}
	else
	{
		b_saybennetlater();
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_05");	//Pokud m� bude� zdr�ovat, bude to trvat d�le.
		AI_StopProcessInfos(self);
	};
};


instance DIA_BENNET_KAP4_EXIT(C_INFO)
{
	npc = sld_809_bennet;
	nr = 999;
	condition = dia_bennet_kap4_exit_condition;
	information = dia_bennet_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bennet_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_bennet_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENNET_DRACHENEIER(C_INFO)
{
	npc = sld_809_bennet;
	nr = 5;
	condition = dia_bennet_dracheneier_condition;
	information = dia_bennet_dracheneier_info;
	permanent = TRUE;
	description = "Je n�co, co m��e� ud�lat s dra��mi vejci?";
};


func int dia_bennet_dracheneier_condition()
{
	if((KAPITEL >= 4) && (BENNETSDRAGONEGGOFFER == 0) && (Npc_HasItems(other,itat_dragonegg_mis) >= 1) && (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};


var int bennetsdragoneggoffer;
var int dracheneier_angebotenxp_onetime;

func void dia_bennet_dracheneier_info()
{
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_15_00");	//Je n�co, co m��e� ud�lat s dra��mi vejci?
	if(DRACHENEIER_ANGEBOTENXP_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_01");	//Dra��mi vejci? Jak jsi k nim krucin�l p�i�el?
		AI_Output(other,self,"DIA_Bennet_DRACHENEIER_15_02");	//Vzal jsem je je�t�ran�m.
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_03");	//Uka� mi ho.
	};
	Npc_RemoveInvItems(other,itat_dragonegg_mis,1);
	AI_PrintScreen(PRINT_ITEMGEGEBEN,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
	if(DRACHENEIER_ANGEBOTENXP_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_04");	//Mmh. Velmi �ikovn� materi�l. Ide�ln� k dokon�en� brn�n�. Teda pokud se mi je poda�� rozlousknout.
		AI_Output(other,self,"DIA_Bennet_DRACHENEIER_15_05");	//Tak�e co bude? Chce� je?
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_06");	//Jasn�! Dej je sem.
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_07");	//Jak dlouho tu bude� s tou v�c� m�vat? Chce�, abych to koupil, nebo ne?
	};
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_08");	//Zaplat�m ti, hmm, �ekn�me, 300 zlat�ch za ka�d� dra�� vejce, kter� mi p�inese�.
	Info_ClearChoices(dia_bennet_dracheneier);
	Info_AddChoice(dia_bennet_dracheneier,"Tak si nech svoje zlato. Mysl�m, �e si to nech�m.",dia_bennet_dracheneier_nein);
	Info_AddChoice(dia_bennet_dracheneier,"Toto jsou dra�� vejce, ne bezcenn� slepi�� vejce.",dia_bennet_dracheneier_mehr);
	Info_AddChoice(dia_bennet_dracheneier,"Dohodnuto.",dia_bennet_dracheneier_ok);
	if(DRACHENEIER_ANGEBOTENXP_ONETIME == FALSE)
	{
		b_logentry(TOPIC_DRACHENEIER,"Bennet je ochoten mi dob�e zaplatit za v�echna dra�� vejce, kter� naleznu.");
		b_giveplayerxp(XP_DJG_BRINGDRAGONEGG);
		DRACHENEIER_ANGEBOTENXP_ONETIME = TRUE;
	};
};

func void dia_bennet_dracheneier_ok()
{
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_ok_15_00");	//Dohodnuto.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_01");	//Dob�e.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_02");	//Tak tyhle v�ci�ky nos d�l, pokud je bude� schopen dostat.
	if(BENNETSDRAGONEGGOFFER != 350)
	{
		BENNETSDRAGONEGGOFFER = 300;
	};
	CreateInvItems(self,itmi_gold,BENNETSDRAGONEGGOFFER);
	b_giveinvitems(self,other,itmi_gold,BENNETSDRAGONEGGOFFER);
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_03");	//Ehm. ��k�, �e jsi je vzal je�t�ran�m?
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_ok_15_04");	//Spr�vn�.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_05");	//Z toho, co jsem sly�el, tak v�t�ina je�t�ran� bydl� v jeskyn�ch.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_06");	//Nep�ekvapilo by m�, kdybys na�el v�c t�chhle v�c� v jeskyn�ch tady v okol�.
	b_logentry(TOPIC_DRACHENEIER,"Bennet si mysl�, �e bych se po vejc�ch m�l pod�vat v khorinissk�ch jeskyn�ch, kde by m�li je�t�rani p�eb�vat.");
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_07");	//Tady. Vem si tuhle mapu. Ta ti pom��e naj�t ty jeskyn�.
	CreateInvItems(self,itwr_map_caves_mis,1);
	b_giveinvitems(self,other,itwr_map_caves_mis,1);
	b_logentry(TOPIC_DRACHENEIER,"Dal mi mapu jeskyn�, kter� by mi m�la pomoci.");
	if(1 == 2)
	{
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_08");	//Nejd��v ale mus� z�skat mapu jeskyn� od zem�pisce ve m�st�. Byla by to �koda, kdybys je nemohl naj�t v�echny.
		b_logentry(TOPIC_DRACHENEIER,"M�l bych si u m�stn�ho kartografa obstarat mapu jeskyn�, aby mi ��dn� vejce neuniklo.");
	};
	Info_ClearChoices(dia_bennet_dracheneier);
};

func void dia_bennet_dracheneier_mehr()
{
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_mehr_15_00");	//Tohle jsou dra�� vejce, ne bezcenn� slepi�� vaj��ka.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_mehr_06_01");	//(podr�d�n�) Dob�e. Tak 350. Ale v�c ti za n� u� d�t nem��u - pak by se mi to nevyplatilo.
	BENNETSDRAGONEGGOFFER = 350;
};

func void dia_bennet_dracheneier_nein()
{
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_nein_15_00");	//Tak si nech svoje zlato. Mysl�m, �e si to nech�m.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_nein_06_01");	//Dej mi v�d�t, a� si to rozmysl�.
	CreateInvItems(other,itat_dragonegg_mis,1);
	AI_PrintScreen(PRINT_ITEMERHALTEN,-1,YPOS_ITEMTAKEN,FONT_SCREENSMALL,2);
	BENNETSDRAGONEGGOFFER = 0;
	Info_ClearChoices(dia_bennet_dracheneier);
};


instance DIA_BENNET_EIERBRINGEN(C_INFO)
{
	npc = sld_809_bennet;
	nr = 5;
	condition = dia_bennet_eierbringen_condition;
	information = dia_bennet_eierbringen_info;
	permanent = TRUE;
	description = "Zaj�maj� t� je�t� dal�� dra�� vejce?";
};


func int dia_bennet_eierbringen_condition()
{
	if((BENNETSDRAGONEGGOFFER > 0) && (KAPITEL >= 4) && (Npc_HasItems(other,itat_dragonegg_mis) >= 1) && (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};


var int dragoneggcounter;

func void dia_bennet_eierbringen_info()
{
	var int dragoneggcount;
	var int xp_djg_bringdragoneggs;
	var int dragonegggeld;
	var string concattext;
	AI_Output(other,self,"DIA_Bennet_EierBringen_15_00");	//Zaj�maj� t� je�t� dal�� dra�� vejce?
	AI_Output(self,other,"DIA_Bennet_EierBringen_06_01");	//Jist�!
	dragoneggcount = Npc_HasItems(other,itat_dragonegg_mis);
	if(dragoneggcount == 1)
	{
		AI_Output(other,self,"DIA_Bennet_EierBringen_15_02");	//Tady. M�m dal��.
		b_giveplayerxp(XP_DJG_BRINGDRAGONEGG);
		Npc_RemoveInvItems(other,itat_dragonegg_mis,1);
		AI_PrintScreen(PRINT_ITEMGEGEBEN,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
		DRAGONEGGCOUNTER = DRAGONEGGCOUNTER + 1;
	}
	else
	{
		AI_Output(other,self,"DIA_Bennet_EierBringen_15_03");	//M�m tady je�t� n�jak�.
		Npc_RemoveInvItems(other,itat_dragonegg_mis,dragoneggcount);
		concattext = ConcatStrings(IntToString(dragoneggcount),PRINT_ITEMSGEGEBEN);
		AI_PrintScreen(concattext,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
		xp_djg_bringdragoneggs = dragoneggcount * XP_DJG_BRINGDRAGONEGG;
		DRAGONEGGCOUNTER = DRAGONEGGCOUNTER + dragoneggcount;
		b_giveplayerxp(xp_djg_bringdragoneggs);
	};
	if(DRAGONEGGCOUNTER <= 7)
	{
		AI_Output(self,other,"DIA_Bennet_EierBringen_06_04");	//Skv�le. Dej to sem. D�val ses po nich v�ude? Jist� mus� n�kde b�t je�t� n�jak�.
	}
	else if(DRAGONEGGCOUNTER <= 11)
	{
		AI_Output(self,other,"DIA_Bennet_EierBringen_06_05");	//Kdy tyhle v�ci�ky v�bec po��d nach�z�? Vsad�m se, �e u� jich tady moc nebude.
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_EierBringen_06_06");	//Nemysl�m si, �e te� n�jak� dal�� najde�. A j� u� jich m�m tolik, �e ani nev�m, co s nimi budu d�lat.
		TOPIC_END_DRACHENEIER = TRUE;
	};
	AI_Output(self,other,"DIA_Bennet_EierBringen_06_07");	//Jo, spr�vn�. Tady m� pen�ze.
	dragonegggeld = dragoneggcount * BENNETSDRAGONEGGOFFER;
	CreateInvItems(self,itmi_gold,dragonegggeld);
	b_giveinvitems(self,other,itmi_gold,dragonegggeld);
};


instance DIA_BENNET_KAP5_EXIT(C_INFO)
{
	npc = sld_809_bennet;
	nr = 999;
	condition = dia_bennet_kap5_exit_condition;
	information = dia_bennet_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bennet_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_bennet_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENNET_KNOWWHEREENEMY(C_INFO)
{
	npc = sld_809_bennet;
	nr = 55;
	condition = dia_bennet_knowwhereenemy_condition;
	information = dia_bennet_knowwhereenemy_info;
	permanent = TRUE;
	description = "Pot�ebuju se dostat na ostrov. Kov�� by se mi mohl hodit.";
};


func int dia_bennet_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (BENNET_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_bennet_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_15_00");	//Pot�ebuju se dostat na ostrov. Kov�� by se mi mohl hodit.
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_06_01");	//A to si myslel jako mne?
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_15_02");	//Jo. Co na to ��k�? V ka�d�m p��pad� by t� to dostalo odtud pry�.
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_06_03");	//Je to lep�� ne� Onarova farma. Chlap�e, dokonce i peklo nem��e b�t tak �patn�. Po��tej se mnou.
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"Bennet by mohl odej�t klidn� hned te�. Jeho kov��sk�mu um�n� se hned tak n�kdo nevyrovn� a j� se od n�j mohu lecos p�iu�it.");
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_15_04");	//M� pos�dka je v tuto chv�li ji� kompletn�.
		AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_06_05");	//Pak tedy jednoho z nich po�li zase pry�.
	}
	else
	{
		Info_ClearChoices(dia_bennet_knowwhereenemy);
		Info_AddChoice(dia_bennet_knowwhereenemy,"D�m ti v�as v�d�t a� t� budu pot�ebovat.",dia_bennet_knowwhereenemy_no);
		Info_AddChoice(dia_bennet_knowwhereenemy,"Tak bu� tedy m�m kov��em. Sejdeme se v p��stavu!",dia_bennet_knowwhereenemy_yes);
	};
};

func void dia_bennet_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_Yes_15_00");	//Tak tedy bu� m�m kov��em. Uvid�me se v p��stavu.
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_Yes_06_01");	//Dob�e. Uvid�me se pozd�ji.
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	self.flags = NPC_FLAG_IMMORTAL;
	BENNET_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(dia_bennet_knowwhereenemy);
};

func void dia_bennet_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_No_15_00");	//D�m ti v�as v�d�t, a� t� budu pot�ebovat.
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_No_06_01");	//Fajn. Budu tady.
	BENNET_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_bennet_knowwhereenemy);
};


instance DIA_BENNET_LEAVEMYSHIP(C_INFO)
{
	npc = sld_809_bennet;
	nr = 55;
	condition = dia_bennet_leavemyship_condition;
	information = dia_bennet_leavemyship_info;
	permanent = TRUE;
	description = "Budu si muset naj�t jin�ho kov��e.";
};


func int dia_bennet_leavemyship_condition()
{
	if((BENNET_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_bennet_leavemyship_info()
{
	AI_Output(other,self,"DIA_Bennet_LeaveMyShip_15_00");	//Budu si muset naj�t jin�ho kov��e.
	AI_Output(self,other,"DIA_Bennet_LeaveMyShip_06_01");	//Jednou je to takhle a za chv�li zase jinak. Dej si to v hlav� dohromady, jo? A a� bude� v�d�t, co vlastn� chce�, dej mi potom v�d�t.
	BENNET_ISONBOARD = LOG_OBSOLETE;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_BENNET_STILLNEEDYOU(C_INFO)
{
	npc = sld_809_bennet;
	nr = 55;
	condition = dia_bennet_stillneedyou_condition;
	information = dia_bennet_stillneedyou_info;
	permanent = TRUE;
	description = "Poj� zp�tky. Nem��u naj�t jin�ho kov��e.";
};


func int dia_bennet_stillneedyou_condition()
{
	if(((BENNET_ISONBOARD == LOG_OBSOLETE) || (BENNET_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_bennet_stillneedyou_info()
{
	AI_Output(other,self,"DIA_Bennet_StillNeedYou_15_00");	//Poj� zp�tky. Nem��u naj�t jin�ho kov��e.
	AI_Output(self,other,"DIA_Bennet_StillNeedYou_06_01");	//(na�tvan�) Spr�vn�! Jsem tu jenom j�, tak nikoho nehledej. Uvid�me se pozd�ji v doc�ch.
	self.flags = NPC_FLAG_IMMORTAL;
	BENNET_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	AI_StopProcessInfos(self);
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};


instance DIA_BENNET_PICKPOCKET(C_INFO)
{
	npc = sld_809_bennet;
	nr = 900;
	condition = dia_bennet_pickpocket_condition;
	information = dia_bennet_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_bennet_pickpocket_condition()
{
	return c_beklauen(35,45);
};

func void dia_bennet_pickpocket_info()
{
	Info_ClearChoices(dia_bennet_pickpocket);
	Info_AddChoice(dia_bennet_pickpocket,DIALOG_BACK,dia_bennet_pickpocket_back);
	Info_AddChoice(dia_bennet_pickpocket,DIALOG_PICKPOCKET,dia_bennet_pickpocket_doit);
};

func void dia_bennet_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_bennet_pickpocket);
};

func void dia_bennet_pickpocket_back()
{
	Info_ClearChoices(dia_bennet_pickpocket);
};

