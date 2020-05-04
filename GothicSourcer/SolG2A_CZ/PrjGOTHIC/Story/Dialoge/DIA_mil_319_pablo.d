
instance DIA_PABLO_EXIT(C_INFO)
{
	npc = mil_319_pablo;
	nr = 999;
	condition = dia_pablo_exit_condition;
	information = dia_pablo_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pablo_exit_condition()
{
	return TRUE;
};

func void dia_pablo_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PABLO_PICKPOCKET(C_INFO)
{
	npc = mil_319_pablo;
	nr = 900;
	condition = dia_pablo_pickpocket_condition;
	information = dia_pablo_pickpocket_info;
	permanent = TRUE;
	description = "(Tento kl�� by ukradlo i mal� d�t�.)";
};


func int dia_pablo_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_city_tower_01) >= 1) && (other.attribute[ATR_DEXTERITY] >= (20 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_pablo_pickpocket_info()
{
	Info_ClearChoices(dia_pablo_pickpocket);
	Info_AddChoice(dia_pablo_pickpocket,DIALOG_BACK,dia_pablo_pickpocket_back);
	Info_AddChoice(dia_pablo_pickpocket,DIALOG_PICKPOCKET,dia_pablo_pickpocket_doit);
};

func void dia_pablo_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 20)
	{
		b_giveinvitems(self,other,itke_city_tower_01,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_pablo_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_pablo_pickpocket_back()
{
	Info_ClearChoices(dia_pablo_pickpocket);
};


var int pablo_belogen;

instance DIA_PABLO_WANTED(C_INFO)
{
	npc = mil_319_pablo;
	nr = 1;
	condition = dia_pablo_wanted_condition;
	information = dia_pablo_wanted_info;
	important = TRUE;
};


func int dia_pablo_wanted_condition()
{
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_pablo_wanted_info()
{
	AI_Output(self,other,"DIA_Pablo_WANTED_12_00");	//Hej, po�kej - jsi mi n�jak� pov�dom�.
	AI_Output(other,self,"DIA_Pablo_WANTED_15_01");	//Co chce�?
	AI_Output(self,other,"DIA_Pablo_WANTED_12_02");	//Tv�j obli�ej jsem u� n�kde vid�l... ano - u� v�m!
	b_usefakescroll();
	AI_Output(self,other,"DIA_Pablo_WANTED_12_03");	//Tady - tenhle obr�zek u sebe m�la skupina bandit�, kterou jsme sbalili p�ed p�r dny. Vypad� v�n� jako ty.
	b_giveinvitems(self,other,itwr_poster_mis,1);
	AI_Output(self,other,"DIA_Pablo_WANTED_12_04");	//Zd� se, �e t� ti chlap�ci hledali.
	Info_ClearChoices(dia_pablo_wanted);
	Info_AddChoice(dia_pablo_wanted,"Ne, musel ses spl�st.",dia_pablo_wanted_nothing);
	Info_AddChoice(dia_pablo_wanted,"Bo��nku, n�co takov�ho by m� samotn�ho nikdy nenapadlo.",dia_pablo_wanted_irony);
};

func void dia_pablo_wanted_nothing()
{
	AI_Output(other,self,"DIA_Pablo_WANTED_NOTHING_15_00");	//Ne, to se ur�it� pletete. To musel b�t n�kdo jin�.
	AI_Output(self,other,"DIA_Pablo_WANTED_NOTHING_12_01");	//Jak mysl�, cizin�e.
	AI_Output(self,other,"DIA_Pablo_Add_12_00");	//Ale jestli se nakonec uk�e, �es na tom obr�zku p�ece jenom byl TY - a pokud bude� m�t n�jak� pot�e - sna� se je netahat s sebou do m�sta. U� takhle to tady nen� ��dn� med.
	AI_Output(self,other,"DIA_Pablo_WANTED_NOTHING_12_03");	//A cizinci, kte�� s sebou p�in�ej� pot�e, tady moc dlouho v�t�inou nez�stanou - douf�m, �e jsem se vyj�d�il jasn�.
	PABLO_BELOGEN = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_pablo_wanted_irony()
{
	AI_Output(other,self,"DIA_Pablo_WANTED_IRONY_15_00");	//Bo��nku, n�co takov�ho by m� samotn�ho nikdy nenapadlo.
	AI_Output(self,other,"DIA_Pablo_WANTED_IRONY_12_01");	//V�n� legrace... co od tebe ti chlap�ci cht�li?
	AI_Output(other,self,"DIA_Pablo_Add_15_01");	//Zeptejte se jich sami. M�te je p�ece v bezpe�� pod z�mkem, ne?
	AI_Output(self,other,"DIA_Pablo_WANTED_IRONY_12_03");	//Ne - jsou mrtv�.
	AI_Output(other,self,"DIA_Pablo_WANTED_IRONY_15_04");	//Tak m�m dojem, �e se to u� nikdy nedozv�me.
	AI_Output(self,other,"DIA_Pablo_Add_12_02");	//V p��pad�, �e bys m�l n�jak� probl�my, promluv si s lordem Andrem. Mo�n� by byl schopn� ti pomoci. Najde� ho v kas�rn�ch.
	AI_StopProcessInfos(self);
};


instance DIA_PABLO_BANDITEN(C_INFO)
{
	npc = mil_319_pablo;
	nr = 3;
	condition = dia_pablo_banditen_condition;
	information = dia_pablo_banditen_info;
	permanent = FALSE;
	description = "Co v� o banditech?";
};


func int dia_pablo_banditen_condition()
{
	return TRUE;
};

func void dia_pablo_banditen_info()
{
	AI_Output(other,self,"DIA_Pablo_Add_15_03");	//Co v� o banditech?
	AI_Output(self,other,"DIA_Pablo_Add_12_04");	//V�ichni poch�zej� z t� zatracen� t�a�sk� kolonie. Je mezi nimi ale n�kolik skupinek odpadl�k�.
	AI_Output(self,other,"DIA_Pablo_Add_12_05");	//N�kte�� se za�ili v hor�ch a dal�� se spojili s Onarem, velkostatk��em.
	AI_Output(self,other,"DIA_Pablo_Add_12_06");	//Nejv�c pot�� ale zp�sobuj� bandit�, kte�� se zdr�uj� mimo m�sto.
	AI_Output(self,other,"DIA_Pablo_Add_12_07");	//To kv�li nim se te� ��dn� obchodn�k neodv�� vyrazit za m�stsk� br�ny.
};


instance DIA_PABLO_HAKONBANDITS(C_INFO)
{
	npc = mil_319_pablo;
	nr = 3;
	condition = dia_pablo_hakonbandits_condition;
	information = dia_pablo_hakonbandits_info;
	permanent = FALSE;
	description = "Nev� n�co o banditech, kte�� okradli obchodn�ka Hakona?";
};


func int dia_pablo_hakonbandits_condition()
{
	if(Npc_KnowsInfo(other,dia_hakon_miliz) && Npc_KnowsInfo(other,dia_pablo_banditen))
	{
		return TRUE;
	};
};

func void dia_pablo_hakonbandits_info()
{
	AI_Output(other,self,"DIA_Pablo_Add_15_20");	//Nev� n�co o banditech, kte�� okradli obchodn�ka Hakona?
	AI_Output(self,other,"DIA_Pablo_Add_12_21");	//Jo TOHLE. Ani mi to nep�ipom�nej.
	AI_Output(self,other,"DIA_Pablo_Add_12_22");	//Co v�me, tak maj� na sv�dom� u� p�knou ��dku �tok� na r�zn� kupce.
	AI_Output(self,other,"DIA_Pablo_Banditen_12_01");	//Ty krysy zalezly do sv�ch d�r a neodva�uj� se ani vystr�it nos.
	AI_Output(self,other,"DIA_Pablo_Banditen_12_02");	//Kdysi se n�m je poda�ilo vystopovat a sledovat. V lese za m�stem jsme ale museli s pron�sledov�n�m p�estat.
	AI_Output(self,other,"DIA_Pablo_Banditen_12_03");	//Kolem se potuluje spousta �elem, je to moc nebezpe�n�.
	b_logentry(TOPIC_HAKONBANDITEN,"Bandit�, kte�� okradli Hakona, se skr�vaj� kdesi v les�ch pobl� m�sta.");
	if(PABLO_ANDREMELDEN == FALSE)
	{
		AI_Output(self,other,"DIA_Pablo_Add_12_23");	//Ale je tady je�t� jedna v�c...
		AI_Output(self,other,"DIA_Pablo_Banditen_12_04");	//V Khorinisu se objevila ��st uloupen�ho zbo��.
		AI_Output(other,self,"DIA_Pablo_Banditen_15_05");	//To znamen�, �e v�d�, jak lup propa�ovat do m�sta a pak ho tady prodat...
		AI_Output(self,other,"DIA_Pablo_Banditen_12_06");	//Jo, m�me podez�en�, �e maj� tady n�kde ve m�st� p�ekupn�ka. Zat�m se n�m ale toho chl�pka nepoda�ilo chytit.
		AI_Output(self,other,"DIA_Pablo_Banditen_12_07");	//Pokud by se ti poda�ilo na n�co p�ij�t, tak m�j na pam�ti, �e lord Andre vypsal na toho pa�er�ka odm�nu.
		b_logentry(TOPIC_HAKONBANDITEN,"Bandit� maj� ve m�st� nejsp� n�jakou spojku. Lord Andre nechal na tohoto jejich spojence vypsat odm�nu.");
	};
};


instance DIA_PABLO_MYBANDITS(C_INFO)
{
	npc = mil_319_pablo;
	nr = 4;
	condition = dia_pablo_mybandits_condition;
	information = dia_pablo_mybandits_info;
	permanent = FALSE;
	description = "Odkud byli ti bandit�, kte�� m�li ten m�j obr�zek?";
};


func int dia_pablo_mybandits_condition()
{
	if(Npc_KnowsInfo(other,dia_pablo_banditen) && Npc_KnowsInfo(other,dia_pablo_wanted))
	{
		return TRUE;
	};
};

func void dia_pablo_mybandits_info()
{
	AI_Output(other,self,"DIA_Pablo_Add_15_08");	//Odkud byli ti bandit�, kte�� m�li ten m�j obr�zek?
	if(PABLO_BELOGEN == TRUE)
	{
		AI_Output(self,other,"DIA_Pablo_Add_12_09");	//AH�! Tak�e to nakonec BYL tv�j obli�ej. Pro� jsi to nep�iznal hned, co?
		AI_Output(self,other,"DIA_Pablo_Add_12_10");	//(nal�hav�) Pro� po tob� jdou?
		AI_Output(other,self,"DIA_Pablo_Add_15_11");	//J� nev�m - v�n�!
		AI_Output(self,other,"DIA_Pablo_Add_12_12");	//Jasn�, jasn�. Ch�pu. N�co ti �eknu. Kdybych si myslel, �e jsi s t�mi bandity jedna ruka, u� bys p�kn� bru�el v chl�dku. Kapi�to?
		AI_Output(self,other,"DIA_Pablo_Add_12_13");	//I tak bych to ale asi m�l nahl�sit lordu Andremu...
		PABLO_ANDREMELDEN = TRUE;
		AI_Output(self,other,"DIA_Pablo_Add_12_14");	//Ale co se t��e t� tv� ot�zky...
	};
	AI_Output(self,other,"DIA_Pablo_Add_12_15");	//Sebrali jsme je pobl� statk��ova s�dla.
	AI_Output(self,other,"DIA_Pablo_Add_12_16");	//Rozhodn� ale nevypadaj� jako Onarovi lid�.
	AI_Output(self,other,"DIA_Pablo_Add_12_17");	//�ekl bych, �e to byla ��st men�� skupinky, kter� se ukr�v� v hor�ch pobl� Onarovy farmy.
	AI_Output(self,other,"DIA_Pablo_Add_12_18");	//Jestli bys ale m�l v pl�nu se tam vydat, mus�m t� varovat. Tihle hrdlo�ezov� provedou s ka�d�m kr�tk� proces!
	AI_Output(other,self,"DIA_Pablo_Add_15_19");	//Budu to m�t na pam�ti.
};


instance DIA_PABLO_PERM(C_INFO)
{
	npc = mil_319_pablo;
	nr = 1;
	condition = dia_pablo_perm_condition;
	information = dia_pablo_perm_info;
	permanent = TRUE;
	description = "Jak to vypad�?";
};


func int dia_pablo_perm_condition()
{
	return TRUE;
};

func void dia_pablo_perm_info()
{
	AI_Output(other,self,"DIA_Pablo_Perm_15_00");	//Jak to vypad�?
	if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET != LOG_SUCCESS)
		{
			if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
			{
				AI_Output(self,other,"DIA_Pablo_Perm_12_01");	//V�dycky jsem ��kal, �e se t�m �old�k�m ned� v��it.
				AI_Output(self,other,"DIA_Pablo_Perm_12_02");	//Je na �ase, abychom t�m ne��d�m u�t�d�ili lekci. Tohle nevymyslel Bennet s�m o sob�.
			}
			else if(hero.guild == GIL_KDF)
			{
				AI_Output(self,other,"DIA_Pablo_Perm_12_03");	//Jsem hluboce ot�esen vra�dou ctihodn�ho paladina Lothara.
				AI_Output(self,other,"DIA_Pablo_Perm_12_04");	//Ale v���m, �e c�rkev vin�ky spravedliv� potrest�.
			}
			else
			{
				AI_Output(self,other,"DIA_Pablo_Perm_12_05");	//Co �e se tady potuluje� po okol�? Jestli m� v pl�nu osvobodit sv�ho �old�ck�ho p��tel��ka, tak na to rovnou zapome�.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Pablo_Perm_12_06");	//To je k pl��i. Te� se n�s sna�� po�tvat proti sob� navz�jem.
			AI_Output(self,other,"DIA_Pablo_Perm_12_07");	//Jestli jste nedok�zali naj�t prav�ho vraha, sk�eti nebudou muset ani hnout prstem.
		};
	}
	else if(KAPITEL == 5)
	{
		AI_Output(self,other,"DIA_Pablo_Perm_12_08");	//D�l� mi starosti, co se stane, kdy� te� paladinov� odejdou.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Pablo_Perm_12_09");	//Na n�s se m��e� spolehnout. Pou�ijeme v�echny dostupn� prost�edky, aby tohle m�sto nezab�edlo do bahna bezpr�v�.
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Pablo_Perm_12_10");	//M�j se na pozoru. Dareb�ky jako ty nespou�t�me jen tak z o��.
	}
	else
	{
		AI_Output(self,other,"DIA_Pablo_Perm_12_11");	//Te� je docela klid. Probl�my n�m d�laj� jen bandit� za okrajem m�sta.
	};
};

