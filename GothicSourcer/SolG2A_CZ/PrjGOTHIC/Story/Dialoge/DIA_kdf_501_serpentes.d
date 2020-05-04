
instance DIA_SERPENTES_KAP1_EXIT(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 999;
	condition = dia_serpentes_kap1_exit_condition;
	information = dia_serpentes_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_serpentes_kap1_exit_condition()
{
	if(KAPITEL <= 1)
	{
		return TRUE;
	};
};

func void dia_serpentes_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_NOTALK(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 10;
	condition = dia_serpentes_notalk_condition;
	information = dia_serpentes_notalk_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_serpentes_notalk_condition()
{
	if(Npc_IsInState(self,zs_talk) && (KNOWS_FIRE_CONTEST == FALSE) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_serpentes_notalk_info()
{
	AI_Output(self,other,"DIA_Serpentes_NOTALK_10_00");	//(k�rav�) Odva�uje� se oslovit m�, novici? Vra� se ke sv� pr�ci.
	Info_ClearChoices(dia_serpentes_notalk);
	Info_AddChoice(dia_serpentes_notalk,"Zrovna jsem na odchodu. (KONEC)",dia_serpentes_notalk_exit);
	Info_AddChoice(dia_serpentes_notalk,"M�m je�t� jednu ot�zku ...",dia_serpentes_notalk_question);
};

func void dia_serpentes_notalk_question()
{
	AI_Output(other,self,"DIA_Serpentes_NOTALK_QUESTION_15_00");	//M�m je�t� jednu ot�zku.
	AI_Output(self,other,"DIA_Serpentes_NOTALK_QUESTION_10_01");	//(vztekle) Zd� se, �e to nech�pe�. J� s�m si rozhodnu, kdy s tebou budu mluvit. Kdo si mysl�, �e jsi?
	AI_Output(self,other,"DIA_Serpentes_NOTALK_QUESTION_10_02");	//A te� si b� po sv�m!
	AI_StopProcessInfos(self);
};

func void dia_serpentes_notalk_exit()
{
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_GOAWAY(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 10;
	condition = dia_serpentes_goaway_condition;
	information = dia_serpentes_goaway_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_serpentes_goaway_condition()
{
	if(Npc_KnowsInfo(hero,dia_serpentes_notalk) && Npc_IsInState(self,zs_talk) && !Npc_KnowsInfo(hero,dia_pyrokar_fire) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_serpentes_goaway_info()
{
	AI_Output(self,other,"DIA_Serpentes_GOAWAY_10_00");	//Tvoje p��tomnost dokazuje nejen nedostatek �cty, ale tak� tvou hloupost, novici!
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_YOURSTORY(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 24;
	condition = dia_serpentes_yourstory_condition;
	information = dia_serpentes_yourstory_info;
	permanent = FALSE;
	description = "Sly�el jsem, �e jsi slo�il Zkou�ku ohn�.";
};


func int dia_serpentes_yourstory_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulthar_test) && (other.guild == GIL_NOV) && (Npc_KnowsInfo(hero,dia_pyrokar_magican) == FALSE) && (MIS_GOLEM != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_serpentes_yourstory_info()
{
	AI_Output(other,self,"DIA_Serpentes_YOURSTORY_15_00");	//Sly�el jsem, �e jsi slo�il Zkou�ku ohn�.
	AI_Output(self,other,"DIA_Serpentes_YOURSTORY_10_01");	//(samolib�) To ti p�i v�� skromnosti mohu ��ct. Kdokoliv jin�, kdo se o to pokou�el, zem�el.
	AI_Output(self,other,"DIA_Serpentes_YOURSTORY_10_02");	//(blahosklonn�) V�n� bys nem�l tu zkou�ku podstupovat. Tv�j duch je slab�. Lep�� bude, kdy� bude� slou�it n�kolik let v kl�te�e, t�eba bude� b�hem n�kolika let vyvolen.
	AI_Output(other,self,"DIA_Serpentes_YOURSTORY_15_03");	//J� tu zkou�ku slo��m.
	AI_Output(self,other,"DIA_Serpentes_YOURSTORY_10_04");	//Pokud to je v�le Innosova, tak ano. Ale jestli ne - pak sel�e�.
};


instance DIA_SERPENTES_TEST(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 10;
	condition = dia_serpentes_test_condition;
	information = dia_serpentes_test_info;
	permanent = FALSE;
	description = "Jsem p�ipraven podrobit se tv� zkou�ce, Mist�e.";
};


func int dia_serpentes_test_condition()
{
	if(Npc_KnowsInfo(hero,dia_pyrokar_fire) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_serpentes_test_info()
{
	AI_Output(other,self,"DIA_Serpentes_TEST_15_00");	//Jsem p�ipraven podrobit se tv� zkou�ce, Mist�e.
	AI_Output(self,other,"DIA_Serpentes_TEST_10_01");	//Tak�e chce� tu zkou�ku podstoupit. O n�co takov�ho m��e ��dat jen odv�n� novic. Odvaha v�ak nen� v�e, co je zapot�eb�.
	AI_Output(self,other,"DIA_Serpentes_TEST_10_02");	//Jsi dost chytr� na to, abys tu zkou�ku slo�il? Jsi dost siln�, aby ses postavil nebezpe��m, je� na tebe �ekaj�?
	AI_Output(self,other,"DIA_Serpentes_TEST_10_03");	//Jestli ne, zaplat� za to �ivotem.
	AI_Output(self,other,"DIA_Serpentes_TEST_10_04");	//A nyn� poslouchej zn�n� zkou�ky: Na M�st� Kamen� hledej toho, kdo nebyl nikdy zrozen - najde� toho, kdo byl kdysi p�ivol�n.
	AI_Output(self,other,"DIA_Serpentes_TEST_10_05");	//P�emo� toho, koho p�emoci nelze - utkej se s �ivouc� sk�lou, bojuj s neum�raj�c�m kamenem - a zni� jej.
	Wld_InsertNpc(magicgolem,"FP_MAGICGOLEM");
	MAGIC_GOLEM = Hlp_GetNpc(magicgolem);
	MIS_GOLEM = LOG_RUNNING;
	Log_CreateTopic(TOPIC_GOLEM,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GOLEM,LOG_RUNNING);
	b_logentry(TOPIC_GOLEM,"Serpentes m� podrobil zkou�ce. M�m naj�t 'toho, kdo byl kdysi vyvol�n', o�ivl� k�men, a p�emoci jej.");
};


instance DIA_SERPENTES_NOIDEA(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 10;
	condition = dia_serpentes_noidea_condition;
	information = dia_serpentes_noidea_info;
	permanent = FALSE;
	description = "Co to m��e b�t za bytost?";
};


func int dia_serpentes_noidea_condition()
{
	if((MIS_GOLEM == LOG_RUNNING) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_serpentes_noidea_info()
{
	AI_Output(other,self,"DIA_Serpentes_NOIDEA_15_00");	//�ivouc� sk�la? Co to m��e b�t za stvo�en�?
	AI_Output(self,other,"DIA_Serpentes_NOIDEA_10_01");	//�ekl jsem ti v�e. (v�sm�n�) Nebo se ti zd� ta zkou�ka p��li� obt�n�?
	AI_Output(self,other,"DIA_Serpentes_NOIDEA_10_02");	//Nyn� pozn�, co to obn�� podstoupit Zkou�ku ohn� - na ��dn� dal�� tv� ot�zky u� nebudu odpov�dat.
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_NOHELP(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 10;
	condition = dia_serpentes_nohelp_condition;
	information = dia_serpentes_nohelp_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_serpentes_nohelp_condition()
{
	if(Npc_KnowsInfo(hero,dia_serpentes_noidea) && (Npc_IsDead(magic_golem) == FALSE) && (MIS_GOLEM == LOG_RUNNING) && Npc_IsInState(self,zs_talk) && (other.guild == GIL_NOV) && ((Npc_KnowsInfo(other,dia_ulthar_test) == FALSE) || Npc_KnowsInfo(other,dia_serpentes_yourstory)))
	{
		return TRUE;
	};
};

func void dia_serpentes_nohelp_info()
{
	AI_Output(self,other,"DIA_Serpentes_NOHELP_10_00");	//(opovr�liv�) B� a spl� sv�j �kol, novici!
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_SUCCESS(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 3;
	condition = dia_serpentes_success_condition;
	information = dia_serpentes_success_info;
	permanent = FALSE;
	description = "Porazil jsem toho golema.";
};


func int dia_serpentes_success_condition()
{
	if(Npc_IsDead(magicgolem) && (MIS_GOLEM == LOG_RUNNING) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_serpentes_success_info()
{
	var C_NPC garwig;
	garwig = Hlp_GetNpc(nov_608_garwig);
	AI_Output(other,self,"DIA_Serpentes_SUCCESS_15_00");	//Porazil jsem toho golema.
	AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_01");	//Co�e? V�n� jsi to dok�zal? Ale bez Innosova kladiva bys golema nemohl nikdy p�emoci.
	if(Npc_IsDead(garwig))
	{
		AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_02");	//(triumf�ln�) Ale te� ses s�m prozradil! Byls to ty, kdo zabil Garwiga!
		AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_03");	//�EK� T� TREST ZA VRA�DU INNOSOVA SLU�EBN�KA!!!
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_HUMANMURDEREDHUMAN,0);
	}
	else
	{
		AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_04");	//(l�tostiv�) Ale mus�m uznat, �e �kol, kter� jsem ti zadal, jsi splnil.
	};
	if(Npc_HasItems(other,holy_hammer_mis) >= 1)
	{
		AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_05");	//M�l jsem to kladivo vz�t s�m.
		Npc_RemoveInvItems(other,holy_hammer_mis,1);
		Wld_InsertItem(holy_hammer_mis,"FP_HAMMER");
	};
	MIS_GOLEM = LOG_SUCCESS;
	b_giveplayerxp(XP_GOLEM);
};


instance DIA_SERPENTES_PERM(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 99;
	condition = dia_serpentes_perm_condition;
	information = dia_serpentes_perm_info;
	permanent = TRUE;
	description = "Chce� mi ��ct je�t� n�co?";
};


func int dia_serpentes_perm_condition()
{
	if((KAPITEL >= 3) || Npc_KnowsInfo(other,dia_serpentes_success))
	{
		return TRUE;
	};
};

func void dia_serpentes_perm_info()
{
	AI_Output(other,self,"DIA_Serpentes_PERM_15_00");	//Chce� mi ��ct je�t� n�co?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Serpentes_PERM_10_01");	//Ne. Te� ne, brat�e.
	}
	else
	{
		AI_Output(self,other,"DIA_Serpentes_PERM_10_02");	//Odchod. V�, co mus� ud�lat.
	};
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_KAP2_EXIT(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 999;
	condition = dia_serpentes_kap2_exit_condition;
	information = dia_serpentes_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_serpentes_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_serpentes_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_KAP3_EXIT(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 999;
	condition = dia_serpentes_kap3_exit_condition;
	information = dia_serpentes_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_serpentes_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_serpentes_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_MINENANTEILE(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 30;
	condition = dia_serpentes_minenanteile_condition;
	information = dia_serpentes_minenanteile_info;
	important = TRUE;
};


func int dia_serpentes_minenanteile_condition()
{
	if((PEDRO_TRAITOR == TRUE) && ((hero.guild == GIL_KDF) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};

func void dia_serpentes_minenanteile_info()
{
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_00");	//Ne tak rychle. M�m pro tebe je�t� jeden �kol.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Serpentes_MinenAnteile_15_01");	//(s povzdychem) A to?
		AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_02");	//Te�, kdy� jsi �lenem Bratrstva ohn�, mus� splnit sv� povinnosti souvisej�c� s t�m, kdy� se stane� jedn�m z n�s.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_03");	//C�rkev nezaj�maj� jen v�ci kolem magie - jak s�m v�, je to tak� nejvy��� autorita v oblastech pr�va.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_04");	//Posledn� p��pad p�ed n�mi otev�r� bezednou propast a jednou prov�dy se s n�m mus�me vypo��dat.
		Info_ClearChoices(dia_serpentes_minenanteile);
		Info_AddChoice(dia_serpentes_minenanteile,"U� takhle m�m dost sv�ch starost�. Najdi si n�koho jin�ho.",dia_serpentes_minenanteile_nein);
		Info_AddChoice(dia_serpentes_minenanteile,"O co jde?",dia_serpentes_minenanteile_was);
		Info_AddChoice(dia_serpentes_minenanteile,"Nen� to snad z�le�itost domobrany?",dia_serpentes_minenanteile_miliz);
	}
	else
	{
		AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_05");	//N�jemn� �old�k tv�ho kalibru by n�m v tom mohl pomoci.
		Info_ClearChoices(dia_serpentes_minenanteile);
		Info_AddChoice(dia_serpentes_minenanteile,"U� takhle m�m dost sv�ch starost�. Najdi si n�koho jin�ho.",dia_serpentes_minenanteile_nein);
		Info_AddChoice(dia_serpentes_minenanteile,"Koho m�m zab�t?",dia_serpentes_minenanteile_killsld);
	};
};

func void dia_serpentes_minenanteile_miliz()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_miliz_15_00");	//Nen� to snad z�le�itost domobrany?
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_miliz_10_01");	//Domobrana je zodpov�dn� jen za m�sto. Tahle z�le�itost m� ov�em dalekos�hl� d�sledky.
};

func void dia_serpentes_minenanteile_nein()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_nein_15_00");	//U� takhle m�m dost sv�ch starost�. Najdi si n�koho jin�ho.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_nein_10_01");	//(rozzloben�) To je ur�ka. Nikdy se nedostane� do vy���ch magick�ch kruh�, pokud nejsi ochoten vykonat slu�bu pro svoje Bratrstvo.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_nein_10_02");	//Ukl�d�m ti d�tku. Douf�m, �e se to u� v�ckr�t nestane - jinak by to s tebou �patn� dopadlo.
	AI_StopProcessInfos(self);
};

func void dia_serpentes_minenanteile_was()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_was_15_00");	//O co jde?
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_01");	//Ve m�st� je n�kdo, kdo prodal fale�n� pod�ly na rudn� doly v b�val� trestaneck� kolonii.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_02");	//Ty pap�ry jsou zcela bezcenn� a nemaj� ��dn� v�znam, v�n�. P�esto by mohly mezi lidem vyvolat pot�e, co� si nyn� nem��eme dovolit.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_03");	//Ten �vindl�� nejsp� oslovil v�echny v�znamn� obchodn�ky ve m�st� a okol� a dokonce se mu evidentn� poda�ilo n�kter�m z nich ��st t�ch fale�n�ch pod�lov�ch list� prodat.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_04");	//Najdi toho padoucha a p�ive� jej p�ed tribun�l. V takov�chto t�k�ch �asech nem��eme trp�t takov�hle podvodn�ky a mrcho�routy.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_05");	//Mus�me ho exempl�rn� potrestat, abychom odradili ostatn� podobn� zlot�ilce.
	Info_AddChoice(dia_serpentes_minenanteile,"Zkus�m tu z�le�itost n�jak vy��dit.",dia_serpentes_minenanteile_was_ja);
};

func void dia_serpentes_minenanteile_was_ja()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_was_ja_15_00");	//Zkus�m tu z�le�itost n�jak vy��dit.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_ja_10_01");	//Je�t� jedna v�c. A� bude� ty obchodn�ky nav�t�vovat, nedej najevo, �e se p�d� po t�ch pod�lov�ch listech.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_ja_10_02");	//�ekl bych, �e je budou cht�t prodat d�l a rozhodn� by ti je nenab�zeli, pokud jim dojde, �e jedn� z rozkazu c�rkve, rozum�?
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_was_ja_15_03");	//Ano.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_ja_10_04");	//Tak vzh�ru do pr�ce. P�eji ti brzk� �sp�ch, brat�e.
	Info_ClearChoices(dia_serpentes_minenanteile);
	MIS_SERPENTES_MINENANTEIL_KDF = LOG_RUNNING;
	if(Npc_IsDead(salandril) == FALSE)
	{
		CreateInvItems(salandril,itwr_minenanteil_mis,2);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 2;
	};
	if(Npc_IsDead(vlk_416_matteo) == FALSE)
	{
		CreateInvItems(vlk_416_matteo,itwr_minenanteil_mis,1);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 1;
	};
	if(Npc_IsDead(vlk_413_bosper) == FALSE)
	{
		CreateInvItems(vlk_413_bosper,itwr_minenanteil_mis,1);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 1;
	};
	if(Npc_IsDead(vlk_409_zuris) == FALSE)
	{
		CreateInvItems(vlk_409_zuris,itwr_minenanteil_mis,1);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 1;
	};
	if(Npc_IsDead(bau_911_elena) == FALSE)
	{
		CreateInvItems(bau_911_elena,itwr_minenanteil_mis,2);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 2;
	};
	if(Npc_IsDead(bau_970_orlan) == FALSE)
	{
		CreateInvItems(bau_970_orlan,itwr_minenanteil_mis,1);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 1;
	};
	if(Npc_IsDead(vlk_407_hakon) == FALSE)
	{
		CreateInvItems(vlk_407_hakon,itwr_minenanteil_mis,1);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 1;
	};
	if(Npc_IsDead(bau_936_rosi) == FALSE)
	{
		CreateInvItems(bau_936_rosi,itwr_minenanteil_mis,1);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 1;
	};
	if(Npc_IsDead(vlk_468_canthar) == FALSE)
	{
		CreateInvItems(vlk_468_canthar,itwr_minenanteil_mis,3);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 3;
	};
	SALANDRILVERTEILTEMINENANTEIL = SALANDRILMINENANTEIL_MAINCOUNTER;
	Log_CreateTopic(TOPIC_MINENANTEILE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MINENANTEILE,LOG_RUNNING);
	b_logentry(TOPIC_MINENANTEILE,"N�jak� tunel�� tu obchodn�k�m prod�v� ileg�ln� akcie rudn�ch dol� a vyd�l�v� na tom po��dn� bal�k. Mus�m zjistit, kdo za t�m v�z� a Serpentovi pak mus�m v�echny ty pad�lky odevzdat.");
};

func void dia_serpentes_minenanteile_killsld()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_Kill_15_00");	//Koho m�m zab�t?
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_Kill_10_01");	//Innosi, slituj se. Nikoho, samoz�ejm�. Tahle z�le�itost vy�aduje tro�ku jemn�j�� jedn�n�, ty neomalen� hulv�te.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_Kill_10_02");	//Salandril, alchymista z horn�ho konce m�sta, se provinil v�n�m zlo�inem a mus� za n�j b�t potrest�n.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_Kill_10_03");	//Odm�tl v�ak p�ij�t do kl�tera, kde m�l stanout p�ed soudem. P�ive� ho sem.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_Kill_10_04");	//Jak to ud�l�, to u� je na tob�. Samoz�ejm�, �e za to dostane� odpov�daj�c� odm�nu.
	Info_AddChoice(dia_serpentes_minenanteile,"Nen� to snad z�le�itost domobrany?",dia_serpentes_minenanteile_miliz);
	Info_AddChoice(dia_serpentes_minenanteile,"��dn� probl�m. Postar�m se o to.",dia_serpentes_minenanteile_was_jasld);
};


var int mis_serpentes_bringsalandril_sld;

func void dia_serpentes_minenanteile_was_jasld()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_was_jaSLD_15_00");	//��dn� probl�m. Postar�m se o to.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_jaSLD_10_01");	//Dobr�. O�ek�v�me, �e to b�hem n�kolika dn� za��d�.
	MIS_SERPENTES_BRINGSALANDRIL_SLD = LOG_RUNNING;
	Info_ClearChoices(dia_serpentes_minenanteile);
	Log_CreateTopic(TOPIC_MINENANTEILE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MINENANTEILE,LOG_RUNNING);
	b_logentry(TOPIC_MINENANTEILE,"Mus�m p�ed soud do kl�tera p�iv�st Salandrila, alchymistu z horn� khorinissk� �tvrti. Nemus� m� zaj�mat, co vlastn� sp�chal, hlavn� kdy� za to dostanu zaplaceno.");
};


instance DIA_SERPENTES_MINENANTEILEBRINGEN(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 2;
	condition = dia_serpentes_minenanteilebringen_condition;
	information = dia_serpentes_minenanteilebringen_info;
	permanent = TRUE;
	description = "Co se t��e t�ch pad�lan�ch d�ln�ch akci�...";
};


func int dia_serpentes_minenanteilebringen_condition()
{
	if((MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING) && Npc_HasItems(other,itwr_minenanteil_mis) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};


var int serpentesminenanteilcounter;

func void dia_serpentes_minenanteilebringen_info()
{
	var int serpentesminenanteilcount;
	var int xp_bringserpentesminenanteils;
	var int serpentesminenanteiloffer;
	var int serpentesminenanteilgeld;
	var string minenanteiltext;
	var string minenanteilleft;
	serpentesminenanteilcount = Npc_HasItems(other,itwr_minenanteil_mis);
	serpentesminenanteiloffer = 200;
	if(serpentesminenanteilcount == 1)
	{
		AI_Output(other,self,"DIA_Serpentes_MinenAnteileBringen_15_00");	//Poda�ilo se mi z�skat ty pod�lov� listy.
		b_giveplayerxp(XP_BRINGSERPENTESMINENANTEIL);
		b_giveinvitems(other,self,itwr_minenanteil_mis,1);
		SERPENTESMINENANTEILCOUNTER = SERPENTESMINENANTEILCOUNTER + 1;
	}
	else
	{
		AI_Output(other,self,"DIA_Serpentes_MinenAnteileBringen_15_01");	//Poda�ilo se mi z�skat n�kolik pod�lov�ch list�.
		b_giveinvitems(other,self,itwr_minenanteil_mis,serpentesminenanteilcount);
		xp_bringserpentesminenanteils = serpentesminenanteilcount * XP_BRINGSERPENTESMINENANTEIL;
		SERPENTESMINENANTEILCOUNTER = SERPENTESMINENANTEILCOUNTER + serpentesminenanteilcount;
		b_giveplayerxp(xp_bringserpentesminenanteils);
	};
	SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER - serpentesminenanteilcount;
	minenanteilleft = IntToString(SALANDRILMINENANTEIL_MAINCOUNTER);
	minenanteiltext = ConcatStrings(minenanteilleft,PRINT_NUMBERLEFT);
	AI_PrintScreen(minenanteiltext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,2);
	if(SERPENTESMINENANTEILCOUNTER < SALANDRILVERTEILTEMINENANTEIL)
	{
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_02");	//Velmi dob�e. Mus� st�hnout z ob�hu �pln� v�echny. Je to pro na�e lidi jako jed. P�ines mi je v�echny.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_03");	//D�m ti v�e pot�ebn�.
	}
	else if(SERPENTESMINENANTEILCOUNTER == SALANDRILVERTEILTEMINENANTEIL)
	{
		AI_Output(other,self,"DIA_Serpentes_MinenAnteileBringen_15_04");	//Mysl�m, �e by to m�ly b�t v�echny.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_05");	//Dobr� pr�ce. Zaslou�� si svou odm�nu.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_06");	//Vezmi si tenhle ochrann� amulet. Pom��e ti na cest�ch, na n� se je�t� bude� muset vypravit.
		CreateInvItems(self,itam_prot_mage_01,1);
		b_giveinvitems(self,other,itam_prot_mage_01,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_07");	//Je tohle opravdu posledn�?
	};
	serpentesminenanteilgeld = serpentesminenanteilcount * serpentesminenanteiloffer;
	CreateInvItems(self,itmi_gold,serpentesminenanteilgeld);
	b_giveinvitems(self,other,itmi_gold,serpentesminenanteilgeld);
};


instance DIA_SERPENTES_GOTSALANDRIL(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 32;
	condition = dia_serpentes_gotsalandril_condition;
	information = dia_serpentes_gotsalandril_info;
	description = "V�m, kdo vypustil ty pod�lov� listy do ob�hu.";
};


func int dia_serpentes_gotsalandril_condition()
{
	if((SC_KNOWSPROSPEKTORSALANDRIL == TRUE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_serpentes_gotsalandril_info()
{
	AI_Output(other,self,"DIA_Serpentes_GOTSalandril_15_00");	//V�m, kdo vypustil ty pod�lov� listy do ob�hu. Byl to Salandril, alchymista z horn� ��sti m�sta.
	AI_Output(self,other,"DIA_Serpentes_GOTSalandril_10_01");	//Tak jej p�ive� sem. Mus�me s n�m probrat p�r v�c�.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_SERPENTES_SALANDRILHERE(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 33;
	condition = dia_serpentes_salandrilhere_condition;
	information = dia_serpentes_salandrilhere_info;
	description = "Salandril je tady, v kl�te�e.";
};


func int dia_serpentes_salandrilhere_condition()
{
	if(Npc_GetDistToWP(salandril,"ALTAR") < 10000)
	{
		if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			return TRUE;
		}
		else if(Npc_KnowsInfo(other,dia_serpentes_gotsalandril) && (hero.guild == GIL_KDF))
		{
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
};

func void dia_serpentes_salandrilhere_info()
{
	AI_Output(other,self,"DIA_Serpentes_SalandrilHERE_15_00");	//Salandril je tady, v kl�te�e.
	AI_Output(self,other,"DIA_Serpentes_SalandrilHERE_10_01");	//Dobr� pr�ce. Vy��d�me to s n�m pozd�ji.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Serpentes_SalandrilHERE_10_02");	//Tady je tvoje odm�na. A nikomu ani slovo, rozum�?
		CreateInvItems(self,itmi_gold,400);
		b_giveinvitems(self,other,itmi_gold,400);
	};
	TOPIC_END_MINENANTEILE = TRUE;
	b_giveplayerxp(XP_SALANDRILINKLOSTER);
};


instance DIA_SERPENTES_SALANDRILDEAD(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 33;
	condition = dia_serpentes_salandrildead_condition;
	information = dia_serpentes_salandrildead_info;
	description = "Salandril je mrtv�.";
};


func int dia_serpentes_salandrildead_condition()
{
	if((Npc_KnowsInfo(other,dia_serpentes_gotsalandril) || (((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && (MIS_SERPENTES_BRINGSALANDRIL_SLD == LOG_RUNNING))) && Npc_IsDead(salandril))
	{
		return TRUE;
	};
};

func void dia_serpentes_salandrildead_info()
{
	AI_Output(other,self,"DIA_Serpentes_SalandrilDEAD_15_00");	//Salandril je mrtv�.
	AI_Output(self,other,"DIA_Serpentes_SalandrilDEAD_10_01");	//Inu, v tom p��pad� z�stane jeho skutek nepotrest�n. Nech� se Innos slituje nad jeho ubohou du��.
	TOPIC_END_MINENANTEILE = TRUE;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_SERPENTES_KAP4_EXIT(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 999;
	condition = dia_serpentes_kap4_exit_condition;
	information = dia_serpentes_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_serpentes_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_serpentes_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_KAP5_EXIT(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 999;
	condition = dia_serpentes_kap5_exit_condition;
	information = dia_serpentes_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_serpentes_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_serpentes_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_PICKPOCKET(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 900;
	condition = dia_serpentes_pickpocket_condition;
	information = dia_serpentes_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_serpentes_pickpocket_condition()
{
	return c_beklauen(86,380);
};

func void dia_serpentes_pickpocket_info()
{
	Info_ClearChoices(dia_serpentes_pickpocket);
	Info_AddChoice(dia_serpentes_pickpocket,DIALOG_BACK,dia_serpentes_pickpocket_back);
	Info_AddChoice(dia_serpentes_pickpocket,DIALOG_PICKPOCKET,dia_serpentes_pickpocket_doit);
};

func void dia_serpentes_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_serpentes_pickpocket);
};

func void dia_serpentes_pickpocket_back()
{
	Info_ClearChoices(dia_serpentes_pickpocket);
};

