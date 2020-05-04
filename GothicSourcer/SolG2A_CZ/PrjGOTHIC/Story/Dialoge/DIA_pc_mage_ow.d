
instance DIA_MILTENOW_EXIT(C_INFO)
{
	npc = pc_mage_ow;
	nr = 999;
	condition = dia_miltenow_exit_condition;
	information = dia_miltenow_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_miltenow_exit_condition()
{
	return TRUE;
};

func void dia_miltenow_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MILTENOW_HELLO(C_INFO)
{
	npc = pc_mage_ow;
	nr = TRUE;
	condition = dia_miltenow_hello_condition;
	information = dia_miltenow_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_miltenow_hello_condition()
{
	return TRUE;
};

func void dia_miltenow_hello_info()
{
	AI_Output(self,other,"DIA_MiltenOW_Hello_03_00");	//Pod�vejme, kdo se vr�til! N� hrdina od bari�ry!
	Info_ClearChoices(dia_miltenow_hello);
	Info_AddChoice(dia_miltenow_hello,"R�d t� vid�m, Miltene.",dia_miltenow_hello_yes);
	Info_AddChoice(dia_miltenow_hello,"M�l bych je zn�t?",dia_miltenow_hello_no);
};

func void b_milten_gorndiegolester()
{
	AI_Output(self,other,"DIA_MiltenOW_Hello_NO_03_02");	//Vzpom�n� si na Gorna, Diega a Lestera?
};

func void dia_miltenow_hello_yes()
{
	AI_Output(other,self,"DIA_MiltenOW_Hello_YES_15_00");	//R�d t� vid�m, Miltene. Po��d chv�li tady a chv�li tam?
	AI_Output(self,other,"DIA_MiltenOW_Hello_YES_03_01");	//Po��d. Co padla bari�ra, vstoupil jsem do kl�tera ohniv�ch m�g�.
	AI_Output(self,other,"DIA_MiltenOW_Hello_YES_03_02");	//Ale jakmile se uk�zalo, �e sem cht�j� p�ij�t paladinov�, p�i�ly k duhu moje zku�enosti a znalost okol�.
	AI_Output(self,other,"DIA_MiltenOW_Hello_YES_03_03");	//Rozhodli se tedy, �e m� pov��� svat�m posl�n�m poskytnout t�to v�prav� magickou podporu.
	b_milten_gorndiegolester();
	Info_ClearChoices(dia_miltenow_hello);
	Info_AddChoice(dia_miltenow_hello,"Samoz�ejm�, �e si kluky pamatuju.",dia_miltenow_hello_friends);
	Info_AddChoice(dia_miltenow_hello,"Ta jm�na mi v�n� nic ne��kaj�.",dia_miltenow_hello_forget);
};

func void dia_miltenow_hello_no()
{
	AI_Output(other,self,"DIA_MiltenOW_Hello_NO_15_00");	//M�l bych je zn�t?
	AI_Output(self,other,"DIA_MiltenOW_Hello_NO_03_01");	//Asi toho m� za sebou dost, co?
	b_milten_gorndiegolester();
	Info_ClearChoices(dia_miltenow_hello);
	Info_AddChoice(dia_miltenow_hello,"Samoz�ejm�, �e si kluky pamatuju.",dia_miltenow_hello_friends);
	Info_AddChoice(dia_miltenow_hello,"Ta jm�na mi v�n� nic ne��kaj�.",dia_miltenow_hello_forget);
};

func void dia_miltenow_hello_friends()
{
	AI_Output(other,self,"DIA_MiltenOW_Hello_Friends_15_00");	//Samoz�ejm�, �e si kluky pamatuju.
	AI_Output(self,other,"DIA_MiltenOW_Hello_Friends_03_01");	//No, Gorn a Diego se daleko nedostali. Sebrali je paladinov� tady v �dol�.
	AI_Output(self,other,"DIA_MiltenOW_Hello_Friends_03_02");	//Ale Lester zmizel - v�bec netu��m, kde by se tak mohl fl�kat.
	if(Npc_KnowsInfo(other,dia_lester_hello))
	{
		AI_Output(other,self,"DIA_MiltenOW_Hello_Friends_15_03");	//S Lesterem jsem se setkal - je te� s Xardasem.
		AI_Output(self,other,"DIA_MiltenOW_Hello_Friends_03_04");	//Aspo� jedna dobr� zpr�va.
	};
	AI_Output(self,other,"DIA_MiltenOW_Hello_Friends_03_05");	//No, j� ��dn� dobr� zpr�vy nem�m.
	KNOWS_DIEGO = TRUE;
	Info_ClearChoices(dia_miltenow_hello);
};

func void dia_miltenow_hello_forget()
{
	AI_Output(other,self,"DIA_MiltenOW_Hello_Forget_15_00");	//Ta jm�na mi v�n� nic ne��kaj�.
	AI_Output(self,other,"DIA_MiltenOW_Hello_Forget_03_01");	//Hodn� jsi toho zapomn�l, co? No, nechme minulost odpo��vat v pokoji a v�nujme se tomu, co m�me p�ed sebou.
	AI_Output(self,other,"DIA_MiltenOW_Hello_Forget_03_02");	//I kdy� nem�m nic p��jemn�ho, co bych mohl nahl�sit.
	Info_ClearChoices(dia_miltenow_hello);
};


instance DIA_MILTENOW_BERICHT(C_INFO)
{
	npc = pc_mage_ow;
	nr = 3;
	condition = dia_miltenow_bericht_condition;
	information = dia_miltenow_bericht_info;
	permanent = FALSE;
	description = "A co bys r�d nahl�sil?";
};


func int dia_miltenow_bericht_condition()
{
	if(Npc_KnowsInfo(other,dia_miltenow_hello))
	{
		return TRUE;
	};
};

func void dia_miltenow_bericht_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Bericht_15_00");	//A co bys r�d nahl�sil?
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_01");	//P�i�li sem paladinov� a cht�j� odv�zt magickou rudu.
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_02");	//Ale kdy� si vezmu v�echny ty draky a sk�ety, netu��m, jak cht�j� paladinov� rudu dostat a pak se taky dostat pry�.
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_03");	//Ne, u Innose - c�t�m p��tomnost n��eho temn�ho... roste tu n�jak� zlo. Vych�z� to z tohohle �dol�.
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_04");	//Za zlikvidov�n� Sp��e jsme zaplatili vysokou cenu. P�d bari�ry poznamenal i tohle m�sto.
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_05");	//Budeme m�t opravdu velk� �t�st�, kdy� to p�e�ijeme.
};


instance DIA_MILTENOW_ERZ(C_INFO)
{
	npc = pc_mage_ow;
	nr = 4;
	condition = dia_miltenow_erz_condition;
	information = dia_miltenow_erz_info;
	permanent = FALSE;
	description = "Kolik rudy jste zat�m nashrom�dili?";
};


func int dia_miltenow_erz_condition()
{
	if(Npc_KnowsInfo(other,dia_miltenow_bericht))
	{
		return TRUE;
	};
};

func void dia_miltenow_erz_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Erz_15_00");	//Kolik rudy jste zat�m nashrom�dili?
	AI_Output(self,other,"DIA_MiltenOW_Erz_03_01");	//Kolik rudy...? Ani jedinou bednu! U� p�ed n�jakou dobou jsme ztratili kontakt s kop��i.
	AI_Output(self,other,"DIA_MiltenOW_Erz_03_02");	//V�bec by m� nep�ekvapilo, kdyby byli d�vno mrtv�. A ke v�emu na n�s �to�� draci a oblehli n�s sk�eti!
	AI_Output(self,other,"DIA_MiltenOW_Erz_03_03");	//Cel� tahle expedice je naprost� katastrofa.
};


instance DIA_MILTENOW_WO(C_INFO)
{
	npc = pc_mage_ow;
	nr = 5;
	condition = dia_miltenow_wo_condition;
	information = dia_miltenow_wo_info;
	permanent = FALSE;
	description = "Kde jsou te� Gorn a Diego?";
};


func int dia_miltenow_wo_condition()
{
	if(Npc_KnowsInfo(other,dia_miltenow_hello) && (KNOWS_DIEGO == TRUE))
	{
		return TRUE;
	};
};

func void dia_miltenow_wo_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Wo_Forget_15_00");	//Kde jsou te� Gorn a Diego?
	AI_Output(self,other,"DIA_MiltenOW_Wo_Forget_03_01");	//Inu, Gorn sed� tady v �al��i - br�nil se zat�en�.
	AI_Output(self,other,"DIA_MiltenOW_Wo_Forget_03_02");	//Diega p�i�adili ke skupin� kop��� - kdy� tak se zeptej paladina Parcivala, ten d�val ty skupiny dohromady.
	KNOWSABOUTGORN = TRUE;
	SEARCHFORDIEGO = LOG_RUNNING;
};


instance DIA_MILTENOW_GORN(C_INFO)
{
	npc = pc_mage_ow;
	nr = 5;
	condition = dia_miltenow_gorn_condition;
	information = dia_miltenow_gorn_info;
	permanent = FALSE;
	description = "Poj�me osvobodit Gorna!";
};


func int dia_miltenow_gorn_condition()
{
	if((KNOWSABOUTGORN == TRUE) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_gorn_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Gorn_15_00");	//Poj�me osvobodit Gorna!
	AI_Output(self,other,"DIA_MiltenOW_Gorn_03_01");	//No, je tady jeden mal� probl�m - Gorn je usv�d�en� v�ze�.
	AI_Output(self,other,"DIA_MiltenOW_Gorn_03_02");	//Ale kdy� budeme m�t �t�st�, poda�� se n�m domluvit se s Garondem a vykoupit ho.
	AI_Output(other,self,"DIA_MiltenOW_Gorn_15_03");	//Ano, mo�n�...
	AI_Output(self,other,"DIA_MiltenOW_Gorn_03_04");	//Udr�uj m� v obraze.
	Log_CreateTopic(TOPIC_RESCUEGORN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESCUEGORN,LOG_RUNNING);
	b_logentry(TOPIC_RESCUEGORN,"Velitel Garond nechal Gorna zav��t. Snad tak trochu nalet�l, a tak bychom mu m�li pomoci z nesn�z�.");
};


instance DIA_MILTENOW_PREIS(C_INFO)
{
	npc = pc_mage_ow;
	nr = 5;
	condition = dia_miltenow_preis_condition;
	information = dia_miltenow_preis_info;
	permanent = FALSE;
	description = "Garond chce za Gorna 1000 zlat�ch.";
};


func int dia_miltenow_preis_condition()
{
	if((MIS_RESCUEGORN == LOG_RUNNING) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_preis_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Preis_15_00");	//Garond chce za Gorna 1000 zlat�ch.
	AI_Output(self,other,"DIA_MiltenOW_Preis_03_01");	//Hezk� sumi�ka. M��u p�isp�t 250 zlat�mi.
	b_giveinvitems(self,other,itmi_gold,250);
	b_logentry(TOPIC_RESCUEGORN,"Milten mi dal 250 zla��k�, abych zaplatil za Gornovo propu�t�n�.");
};


instance DIA_MILTENOW_MEHR(C_INFO)
{
	npc = pc_mage_ow;
	nr = 5;
	condition = dia_miltenow_mehr_condition;
	information = dia_miltenow_mehr_info;
	permanent = FALSE;
	description = "Pokud m�m Gorna vykoupit, budu pot�ebovat v�c zlata.";
};


func int dia_miltenow_mehr_condition()
{
	if((MIS_RESCUEGORN == LOG_RUNNING) && (KAPITEL == 2) && (Npc_HasItems(other,itmi_gold) < 1000) && Npc_KnowsInfo(other,dia_miltenow_preis))
	{
		return TRUE;
	};
};

func void dia_miltenow_mehr_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Mehr_15_00");	//Pokud m�m Gorna vykoupit, budu pot�ebovat v�c zlata.
	AI_Output(self,other,"DIA_MiltenOW_Mehr_03_01");	//V�c zlata... hm. Diego o takov�ch v�cech v� dost - ale ten tady nen�.
	AI_Output(self,other,"DIA_MiltenOW_Mehr_03_02");	//Mo�n� si Gorn s�m schoval n�jak� zlato na hor�� �asy - m�li bychom se na to pod�vat.
	AI_Output(self,other,"DIA_MiltenOW_Mehr_03_03");	//Nap�u mu vzkaz. Zkus mu ho n�jak propa�ovat do �al��e.
	b_giveinvitems(self,other,itwr_letterforgorn_mis,1);
	b_logentry(TOPIC_RESCUEGORN,"Milten mi p�edal zpr�vu pro Gorna. Kdy� mu ji n�jak propa�uji do v�zen�, m��e n�m prozradit, jestli nem� n�kde ulit� n�jak� zlato.");
};


instance DIA_MILTENOW_EQUIPMENT(C_INFO)
{
	npc = pc_mage_ow;
	nr = 5;
	condition = dia_miltenow_equipment_condition;
	information = dia_miltenow_equipment_info;
	permanent = FALSE;
	description = "Mohl bys mi d�t n�jakou v�bavu?";
};


func int dia_miltenow_equipment_condition()
{
	if(Npc_KnowsInfo(other,dia_garond_equipment) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_miltenow_equipment_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Equipmentt_15_00");	//Mohl bys mi d�t n�jakou v�bavu? Garond m� po��dal, jestli bych se nevypravil do dol�.
	AI_Output(self,other,"DIA_MiltenOW_Equipment_03_01");	//A kde bych to tak asi m�l sehnat? Jedin�, co ti m��u d�t, je cenn� runov� k�men.
	b_giveinvitems(self,other,itmi_runeblank,1);
};


instance DIA_MILTENOW_VERSTECK(C_INFO)
{
	npc = pc_mage_ow;
	nr = 1;
	condition = dia_miltenow_versteck_condition;
	information = dia_miltenow_versteck_info;
	permanent = FALSE;
	important = FALSE;
	description = "M�m odpov�� od Gorna... ";
};


func int dia_miltenow_versteck_condition()
{
	if((GORNSTREASURE == TRUE) && (Npc_HasItems(other,itmi_gornstreasure_mis) <= 0) && (GORNS_BEUTEL == FALSE) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_versteck_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Versteck_15_00");	//M�m odpov�� od Gorna. ��k�, �e zlato je u ji�n� br�ny.
	AI_Output(self,other,"DIA_MiltenOW_Versteck_03_01");	//(trpce) Cht�l jsi ��ct u b�val� ji�n� br�ny. Ten drak z n� ud�lal hromadu suti.
	AI_Output(other,self,"DIA_MiltenOW_Versteck_15_02");	//Jak se tam dostanu?
	AI_Output(self,other,"DIA_MiltenOW_Versteck_03_03");	//Je to pobl� sk�et�ho beranidla. Ji�n� br�na byla napravo od n�j.
	AI_Output(self,other,"DIA_MiltenOW_Versteck_03_04");	//Nebude to nijak snadn� - bu� opatrn� a posp� si.
	b_logentry(TOPIC_RESCUEGORN,"B�val� ji�n� br�na le�� p��mo naproti sk�et�m z�taras�m. Gornovo zlato by m�lo b�t n�kde tam.");
};


instance DIA_MILTENOW_FREI(C_INFO)
{
	npc = pc_mage_ow;
	nr = 5;
	condition = dia_miltenow_frei_condition;
	information = dia_miltenow_frei_info;
	permanent = FALSE;
	description = "Osvobodil jsem Gorna.";
};


func int dia_miltenow_frei_condition()
{
	if((MIS_RESCUEGORN == LOG_SUCCESS) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_frei_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Frei_15_00");	//Osvobodil jsem Gorna.
	AI_Output(self,other,"DIA_MiltenOW_Frei_03_01");	//Dob�e. M�li bychom si promyslet, co bude d�l.
};


instance DIA_MILTENOW_LEHREN(C_INFO)
{
	npc = pc_mage_ow;
	nr = 9;
	condition = dia_miltenow_lehren_condition;
	information = dia_miltenow_lehren_info;
	permanent = FALSE;
	description = "M��e� m� n��emu nau�it?";
};


func int dia_miltenow_lehren_condition()
{
	if((other.guild == GIL_KDF) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_lehren_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Lehren_15_00");	//M��e� m� n��emu nau�it?
	AI_Output(self,other,"DIA_MiltenOW_Lehren_03_01");	//Mohu t� nau�it trochu magie z Druh�ho magick�ho kruhu, p��padn� ti tak� mohu pomoci zv��it magick� s�ly.
	AI_Output(self,other,"DIA_MiltenOW_Lehren_03_02");	//Jestli jsi p�ipraven� na zv��en� magick� s�ly, mohu t� za��t u�it.
};


instance DIA_MILTENOW_TEACHCIRCLE2(C_INFO)
{
	npc = pc_mage_ow;
	nr = 91;
	condition = dia_miltenow_teachcircle2_condition;
	information = dia_miltenow_teachcircle2_info;
	permanent = TRUE;
	description = "Nau� m� Druh� magick� kruh!";
};


func int dia_miltenow_teachcircle2_condition()
{
	if((other.guild == GIL_KDF) && Npc_KnowsInfo(other,dia_miltenow_lehren) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) < 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_teachcircle2_info()
{
	AI_Output(other,self,"DIA_Milten_Add_15_00");	//Nau� m� Druh� magick� kruh!
	AI_Output(self,other,"DIA_Milten_Add_03_01");	//V�t�inou to je privilegium vyhrazen� u�itel�m na�eho ��du.
	AI_Output(self,other,"DIA_Milten_Add_03_02");	//Ale mysl�m, �e v tomto p��pad� m��eme ud�lat v�jimku.
	if(b_teachmagiccircle(self,other,2))
	{
		AI_Output(self,other,"DIA_Milten_Add_03_03");	//Nev�m, jestli si pamatuju ta ofici�ln� slova spr�vn�...
		AI_Output(self,other,"DIA_Milten_Add_03_04");	//Vstup nyn� do Druh�ho kruhu. Ehm... Uk�e ti sm�r - cestu v�ak budou tvo�it skutky tv� - nebo tak n�jak to bylo...
		AI_Output(self,other,"DIA_Milten_Add_03_05");	//Mysl�m, �e v�, co to m� znamenat...
	};
};


instance DIA_MILTENOW_TEACH(C_INFO)
{
	npc = pc_mage_ow;
	nr = 90;
	condition = dia_miltenow_teach_condition;
	information = dia_miltenow_teach_info;
	permanent = TRUE;
	description = "Chci se nau�it n�jak� nov� kouzla.";
};


func int dia_miltenow_teach_condition()
{
	if((other.guild == GIL_KDF) && Npc_KnowsInfo(other,dia_miltenow_lehren) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_teach_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Teach_15_00");	//Chci se nau�it n�jak� nov� kouzla.
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_ClearChoices(dia_miltenow_teach);
		Info_AddChoice(dia_miltenow_teach,DIALOG_BACK,dia_miltenow_teach_back);
		if(PLAYER_TALENT_RUNES[SPL_WINDFIST] == FALSE)
		{
			Info_AddChoice(dia_miltenow_teach,b_buildlearnstring(NAME_SPL_WINDFIST,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_WINDFIST)),dia_miltenow_teach_windfist);
		};
		if(PLAYER_TALENT_RUNES[SPL_INSTANTFIREBALL] == FALSE)
		{
			Info_AddChoice(dia_miltenow_teach,b_buildlearnstring(NAME_SPL_INSTANTFIREBALL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_INSTANTFIREBALL)),dia_miltenow_teach_feuerball);
		};
		if(PLAYER_TALENT_RUNES[SPL_ICEBOLT] == FALSE)
		{
			Info_AddChoice(dia_miltenow_teach,b_buildlearnstring(NAME_SPL_ICEBOLT,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ICEBOLT)),dia_miltenow_teach_eispfeil);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenOW_Teach_03_01");	//Je�t� jsi nevstoupil do Druh�ho magick�ho kruhu. Nem��u t� nic nau�it.
	};
};

func void dia_miltenow_teach_back()
{
	Info_ClearChoices(dia_miltenow_teach);
};

func void dia_miltenow_teach_windfist()
{
	b_teachplayertalentrunes(self,other,SPL_WINDFIST);
};

func void dia_miltenow_teach_feuerball()
{
	b_teachplayertalentrunes(self,other,SPL_INSTANTFIREBALL);
};

func void dia_miltenow_teach_eispfeil()
{
	b_teachplayertalentrunes(self,other,SPL_ICEBOLT);
};


instance DIA_MILTENOW_MANA(C_INFO)
{
	npc = pc_mage_ow;
	nr = 100;
	condition = dia_miltenow_mana_condition;
	information = dia_miltenow_mana_info;
	permanent = TRUE;
	description = "Cht�l bych pos�lit svoji magickou moc.";
};


func int dia_miltenow_mana_condition()
{
	if((other.guild == GIL_KDF) && Npc_KnowsInfo(other,dia_miltenow_lehren) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_mana_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Mana_15_00");	//Cht�l bych pos�lit svoji magickou moc.
	Info_ClearChoices(dia_miltenow_mana);
	Info_AddChoice(dia_miltenow_mana,DIALOG_BACK,dia_miltenow_mana_back);
	Info_AddChoice(dia_miltenow_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_miltenow_mana_1);
	Info_AddChoice(dia_miltenow_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_miltenow_mana_5);
};

func void dia_miltenow_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output(self,other,"DIA_MiltenOW_Mana_03_00");	//Tvoje magick� s�la je velik�. P��li� velk� na to, abych ti ji mohl pomoci je�t� zv��it.
	};
	Info_ClearChoices(dia_miltenow_mana);
};

func void dia_miltenow_mana_1()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,1,T_MED);
	Info_ClearChoices(dia_miltenow_mana);
	Info_AddChoice(dia_miltenow_mana,DIALOG_BACK,dia_miltenow_mana_back);
	Info_AddChoice(dia_miltenow_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_miltenow_mana_1);
	Info_AddChoice(dia_miltenow_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_miltenow_mana_5);
};

func void dia_miltenow_mana_5()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,5,T_MED);
	Info_ClearChoices(dia_miltenow_mana);
	Info_AddChoice(dia_miltenow_mana,DIALOG_BACK,dia_miltenow_mana_back);
	Info_AddChoice(dia_miltenow_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_miltenow_mana_1);
	Info_AddChoice(dia_miltenow_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_miltenow_mana_5);
};


instance DIA_MILTENOW_PERM(C_INFO)
{
	npc = pc_mage_ow;
	nr = 101;
	condition = dia_miltenow_perm_condition;
	information = dia_miltenow_perm_info;
	permanent = TRUE;
	description = "Co tady m� za �kol?";
};


func int dia_miltenow_perm_condition()
{
	if((KAPITEL == 2) && (Npc_KnowsInfo(other,dia_miltenow_frei) == FALSE))
	{
		return TRUE;
	};
};

func void dia_miltenow_perm_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Perm_15_00");	//Co tady m� za �kol?
	AI_Output(self,other,"DIA_MiltenOW_Perm_03_01");	//P�vodn� jsem m�l prov�d�t rozbor magick� rudy. Zat�m jsme j� ale moc nedostali.
	AI_Output(self,other,"DIA_MiltenOW_Perm_03_02");	//Te� se soust�e�uji na studium alchymie.
};


instance DIA_MILTENOW_PLAN(C_INFO)
{
	npc = pc_mage_ow;
	nr = 101;
	condition = dia_miltenow_plan_condition;
	information = dia_miltenow_plan_info;
	permanent = TRUE;
	description = "Co m� v pl�nu?";
};


func int dia_miltenow_plan_condition()
{
	if((KAPITEL == 2) && Npc_KnowsInfo(other,dia_miltenow_frei))
	{
		return TRUE;
	};
};

func void dia_miltenow_plan_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Plan_15_00");	//Co m� v pl�nu?
	AI_Output(self,other,"DIA_MiltenOW_Plan_03_01");	//Vr�t�m se. Chv�li je�t� po�k�m, ale te�, kdy� je Gorn na svobod�, m��u vyrazit spole�n� s n�m.
	AI_Output(self,other,"DIA_MiltenOW_Plan_03_02");	//Je naprosto nezbytn�, aby se Pyrokar dozv�d�l, jak to tady vypad�.
	AI_Output(other,self,"DIA_MiltenOW_Plan_15_03");	//Kdy� mysl�.
	AI_Output(self,other,"DIA_MiltenOW_Plan_03_04");	//Douf�m, �e lord Hagen rozpozn�, co za hrozbu vych�z� z tohoto �dol�. Lep�� si nep�edstavovat, co by se stalo, kdyby sk�eti p�e�li p�es pr�smyk.
	AI_Output(other,self,"DIA_MiltenOW_Plan_15_05");	//No, v tom p��pad� ti p�eju bezpe�nou cestu.
};


instance DIA_MILTENOW_PICKPOCKET(C_INFO)
{
	npc = pc_mage_ow;
	nr = 888;
	condition = dia_miltenow_pickpocket_condition;
	information = dia_miltenow_pickpocket_info;
	permanent = TRUE;
	description = "(Ukr�st tenhle lektvar bude dosti obt�n�.)";
};


func int dia_miltenow_pickpocket_condition()
{
	if((self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == TRUE) && (other.attribute[ATR_DEXTERITY] >= (80 - THEFTDIFF)))
	{
		return 1;
	};
};

func void dia_miltenow_pickpocket_info()
{
	Info_ClearChoices(dia_miltenow_pickpocket);
	Info_AddChoice(dia_miltenow_pickpocket,DIALOG_BACK,dia_miltenow_pickpocket_back);
	Info_AddChoice(dia_miltenow_pickpocket,DIALOG_PICKPOCKET,dia_miltenow_pickpocket_doit);
};

func void dia_miltenow_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 80)
	{
		CreateInvItems(self,itpo_perm_mana,1);
		b_giveinvitems(self,other,itpo_perm_mana,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_miltenow_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_miltenow_pickpocket_back()
{
	Info_ClearChoices(dia_miltenow_pickpocket);
};

