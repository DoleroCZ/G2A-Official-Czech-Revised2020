
instance DIA_HAKON_EXIT(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 999;
	condition = dia_hakon_exit_condition;
	information = dia_hakon_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hakon_exit_condition()
{
	return TRUE;
};

func void dia_hakon_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HAKON_SPERRE(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 2;
	condition = dia_hakon_sperre_condition;
	information = dia_hakon_sperre_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_hakon_sperre_condition()
{
	if((CANTHAR_SPERRE == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_hakon_sperre_info()
{
	AI_Output(self,other,"DIA_Hakon_Sperre_12_00");	//Ztra� se, ty krimin�ln�ku! Canthar mi �ekl, jakej mizernej bastard se�!
	AI_StopProcessInfos(self);
};


instance DIA_HAKON_HALLO(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 3;
	condition = dia_hakon_hallo_condition;
	information = dia_hakon_hallo_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_hakon_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (CANTHAR_SPERRE == FALSE))
	{
		return TRUE;
	};
};

func void dia_hakon_hallo_info()
{
	AI_Output(self,other,"DIA_Hakon_Add_12_00");	//Jsem Hakon, prodava� zbran�.
	AI_Output(self,other,"DIA_Hakon_Add_12_01");	//V tyhle dny by m�l m�t ka�d� mu� u sebe zbra�. Zvl᚝, kdy� se vyd� za hradby.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Hakon prod�v� na tr�i�ti zbran�.");
};


instance DIA_HAKON_TRADE(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 99;
	condition = dia_hakon_trade_condition;
	information = dia_hakon_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Uka� mi sv� zbo��.";
};


func int dia_hakon_trade_condition()
{
	return TRUE;
};

func void dia_hakon_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Hakon_Trade_15_00");	//Uka� mi sv� zbo��.
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Hakon_Trade_12_01");	//Je pro m� velkou ct�, kdy� se o m� zbo�� zaj�m� p�edstavitel svat� c�rkve.
	};
};


instance DIA_ADDON_HAKON_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 5;
	condition = dia_addon_hakon_missingpeople_condition;
	information = dia_addon_hakon_missingpeople_info;
	description = "Nev� n�hodou n�co o ztracen�ch obyvatel�ch Khorinisu?";
};


func int dia_addon_hakon_missingpeople_condition()
{
	if(SC_HEAREDABOUTMISSINGPEOPLE == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_hakon_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Hakon_MissingPeople_15_00");	//Nev� n�hodou n�co o ztracen�ch obyvatel�ch Khorinisu?
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_01");	//Vid�l jsem mnoho lid� proch�zet v�chodn� branou.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_02");	//N�kter� z nich jsem v �ivot� nevid�l. A mnoho z nich se nikdy nevr�tilo.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_03");	//Ale, n�co opravdu divn�ho se asi d�je.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_04");	//Tamhle byl n�jak� t�pek. Mysl�m, �e se jmenoval Joe. Po��d se vychloubal, �e bude brzy prach��.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_05");	//Vyzv�dal, jak se m� dostat do jedn� z m�stsk�ch v��, kam si domobrana ukl�d� zbran�.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_06");	//Potom jsem ho u� nikdy nevid�l. Chodil jsem okolo n�j ka�d� den, dokud se neztratil.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_07");	//Byl jsem udiven, kdy� ho domobrana zatkla a ptala se n�s na n�j.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_08");	//Lord Andre nev�d�l, o �em jsem mluvil a necht�l o tom chl�pkovi u� sly�et.
	Log_CreateTopic(TOPIC_ADDON_JOE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_JOE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_JOE,"Hakon, obchodn�k v Khorinisu, v�dal chl�pka jm�nem Joe, ne� se ztratil. Joe se cht�l dostat do jedn� z m�stsk�ch v��, kde si domobrana skladovala zbran�.");
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_HAKON_OUTOFTOWN(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 2;
	condition = dia_hakon_outoftown_condition;
	information = dia_hakon_outoftown_info;
	permanent = FALSE;
	description = "�ekni mi n�co o okol� m�sta.";
};


func int dia_hakon_outoftown_condition()
{
	return TRUE;
};

func void dia_hakon_outoftown_info()
{
	AI_Output(other,self,"DIA_Hakon_Add_15_02");	//�ekni mi n�co o okol� m�sta.
	AI_Output(self,other,"DIA_Hakon_Add_12_03");	//Je to tam ��m d�l nebezpe�n�j��.
	AI_Output(self,other,"DIA_Hakon_Add_12_04");	//Jednak kv�li bandit�m, a taky kv�li divok� zv��i.
	AI_Output(self,other,"DIA_Hakon_Add_12_05");	//Vypad� to, jako by ani zv��ata v t�chhle zatracen�ch �asech nem�la ��m zahnat hlad.
	AI_Output(self,other,"DIA_Hakon_Add_12_06");	//Odva�uj� se k m�stu st�le bl�.
};


instance DIA_HAKON_PALADINE(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 3;
	condition = dia_hakon_paladine_condition;
	information = dia_hakon_paladine_info;
	permanent = FALSE;
	description = "V� n�co o paladinech?";
};


func int dia_hakon_paladine_condition()
{
	return TRUE;
};

func void dia_hakon_paladine_info()
{
	AI_Output(other,self,"DIA_Hakon_Add_15_07");	//V� n�co o paladinech?
	AI_Output(self,other,"DIA_Hakon_Add_12_08");	//Ano! Ti chlapi mi ma�� moje obchody!
	AI_Output(self,other,"DIA_Hakon_Add_12_09");	//V�echno, co si p�i nejlep�� v�li m��e� v tomhle m�st� koupit, je kr�tk� me�.
	AI_Output(self,other,"DIA_Hakon_Add_12_10");	//Seberou v�echno, co je del�� ne� stopu a p�l.
	AI_Output(self,other,"DIA_Hakon_Add_12_11");	//(j�zliv�) A na opl�tku se te� m��u v hotelu v�let zdarma - ha!
};


instance DIA_HAKON_WOWAFFEN(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 4;
	condition = dia_hakon_wowaffen_condition;
	information = dia_hakon_wowaffen_info;
	permanent = FALSE;
	description = "Odkud bere� sv� zbran�?";
};


func int dia_hakon_wowaffen_condition()
{
	if(Npc_KnowsInfo(other,dia_hakon_paladine))
	{
		return TRUE;
	};
};

func void dia_hakon_wowaffen_info()
{
	AI_Output(other,self,"DIA_Hakon_Add_15_12");	//Odkud bere� sv� zbran�?
	if(Npc_KnowsInfo(other,dia_hakon_haradbandits))
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_13");	//Odnikud! A� dote� byl m�m dodavatelem Harad.
	}
	else
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_14");	//A� dote� byl m�m dodavatelem kov�� Harad.
	};
	AI_Output(self,other,"DIA_Hakon_Add_12_15");	//Ned�l� te� na ni�em jin�m ne� na zak�zce pro paladiny.
	AI_Output(self,other,"DIA_Hakon_Add_12_16");	//Pracuje pro ty chl�pky dnem i noc� jako magor bez n�roku na odm�nu. M� dojem, �e to jeho povinnost.
	AI_Output(self,other,"DIA_Hakon_Add_12_17");	//V�echno, co ti m��u nab�dnout, jsou zbytky m�ch z�sob.
};


instance DIA_HAKON_HARADBANDITS(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 5;
	condition = dia_hakon_haradbandits_condition;
	information = dia_hakon_haradbandits_info;
	permanent = FALSE;
	description = "Harad mi �ekl o �toku bandit�.";
};


func int dia_hakon_haradbandits_condition()
{
	if(HARAD_HAKONMISSION == TRUE)
	{
		return TRUE;
	};
};

func void dia_hakon_haradbandits_info()
{
	AI_Output(other,self,"DIA_Hakon_Add_15_18");	//Harad mi �ekl o �toku bandit�.
	AI_Output(self,other,"DIA_Hakon_Add_12_19");	//Hm? A?
	AI_Output(other,self,"DIA_Hakon_Add_15_20");	//D� mi souhlas pro p�ijet� do u�en�, kdy� se vypo��d�m s t�mi bandity.
	AI_Output(self,other,"DIA_Hakon_Add_12_21");	//(sm�ch) Star� dobr� Harad. To asi bude zp�sob, jak�m se mi cht�l omluvit za to, �e pro m� nem��e d�lat ��dn� zbran�.
};


instance DIA_HAKON_BANDITEN(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 6;
	condition = dia_hakon_banditen_condition;
	information = dia_hakon_banditen_info;
	permanent = FALSE;
	description = "Co v� o banditech?";
};


func int dia_hakon_banditen_condition()
{
	if(Npc_KnowsInfo(hero,dia_hakon_haradbandits) || Npc_KnowsInfo(hero,dia_hakon_outoftown))
	{
		return TRUE;
	};
};

func void dia_hakon_banditen_info()
{
	AI_Output(other,self,"DIA_Hakon_Banditen_15_00");	//Co v� o banditech?
	AI_Output(self,other,"DIA_Hakon_Banditen_12_01");	//Co o nich v�m? Cestou do m�sta m� oloupili!
	AI_Output(self,other,"DIA_Hakon_Banditen_12_02");	//A nejsem jedin�. To se jen tak nezm�n�.
	AI_Output(self,other,"DIA_Hakon_Banditen_12_03");	//Domobrana se je sna�� vysl�dit, ale n�jak se to neda��.
	MIS_HAKONBANDITS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_HAKONBANDITEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HAKONBANDITEN,LOG_RUNNING);
	b_logentry(TOPIC_HAKONBANDITEN,"Hakona, obchodn�ka se zbran�mi, okradli za m�stem bandit�.");
};


instance DIA_HAKON_WIEVIEL(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 6;
	condition = dia_hakon_wieviel_condition;
	information = dia_hakon_wieviel_info;
	permanent = FALSE;
	description = "M��u se o to postarat.";
};


func int dia_hakon_wieviel_condition()
{
	if(MIS_HAKONBANDITS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_hakon_wieviel_info()
{
	AI_Output(other,self,"DIA_Hakon_Banditen_Ehre_15_00");	//M��u se o to postarat.
	AI_Output(self,other,"DIA_Hakon_Banditen_Kohle_12_01");	//Co, TY se chce� pustit do bandit�? To jako ty s�m? Ty jsi asi dost dobr� bojovn�k, co?
	AI_Output(other,self,"DIA_Hakon_Banditen_Kohle_15_00");	//Jak moc ti na tom z�le��?
	if(Npc_KnowsInfo(other,dia_hakon_haradbandits))
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_25");	//(potuteln�) Chce� se dostat k Haradov�m bibl�m, co?
		AI_Output(self,other,"DIA_Hakon_Add_12_26");	//Nemysl�m, �e bych ti za to m�l platit.
	}
	else
	{
		AI_Output(self,other,"DIA_Hakon_Banditen_Ehre_12_01");	//Je to p�kn� nebezpe�n�.
		AI_Output(self,other,"DIA_Hakon_Banditen_Kohle_12_02");	//No, mn� to nevad�. Jestli ty bandity p�em��e�, d�m ti 100 zla��k�.
		MIS_HAKONBANDITSPAY = TRUE;
	};
	Info_ClearChoices(dia_hakon_banditen);
};


instance DIA_HAKON_MILIZ(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 4;
	condition = dia_hakon_miliz_condition;
	information = dia_hakon_miliz_info;
	permanent = FALSE;
	description = "Nem� pon�t�, kdo z domobrany se p�tr�n� ��astnil?";
};


func int dia_hakon_miliz_condition()
{
	if(MIS_HAKONBANDITS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_hakon_miliz_info()
{
	AI_Output(other,self,"DIA_Hakon_Miliz_15_00");	//Nem� pon�t�, kdo z domobrany se p�tr�n� ��astnil?
	AI_Output(self,other,"DIA_Hakon_Miliz_12_01");	//Jo, ten chlap�k se jmenoval Pablo. Spolu s p�r ostatn�mi po banditech p�trali, ale nikoho nena�li.
	AI_Output(other,self,"DIA_Hakon_Miliz_15_02");	//A nev�, kde bych toho Pabla na�el?
	AI_Output(self,other,"DIA_Hakon_Miliz_12_03");	//Je na str�i ve m�st�. Bu� ho potk� v chr�mov� uli�ce, nebo v doln� �tvrti.
	b_logentry(TOPIC_HAKONBANDITEN,"Ne�sp�n�ho p�tr�n� po banditech se ��astnil i Pablo, p��slu�n�k m�stsk� gardy.");
};


instance DIA_HAKON_WO(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 5;
	condition = dia_hakon_wo_condition;
	information = dia_hakon_wo_info;
	permanent = FALSE;
	description = "Kde t� p�epadli?";
};


func int dia_hakon_wo_condition()
{
	if(MIS_HAKONBANDITS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_hakon_wo_info()
{
	AI_Output(other,self,"DIA_Hakon_Wo_15_00");	//Kde t� p�epadli?
	AI_Output(self,other,"DIA_Hakon_Wo_12_01");	//U Akilova statku. Kdy� odsud vyjde� m�stskou branou a pak se d� cestou doprava, nem��e� to minout.
	AI_Output(self,other,"DIA_Hakon_Wo_12_02");	//Za chv�li naraz� na p�r schod� - a pr�v� odtamtud se na m� ti bastardi vy��tili. Vsad�m se, �e n�kde v t�ch les�ch maj� doup�.
};


instance DIA_HAKON_SUCCESS(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 2;
	condition = dia_hakon_success_condition;
	information = dia_hakon_success_info;
	permanent = FALSE;
	description = "U� jsem ty bandity vy��dil.";
};


func int dia_hakon_success_condition()
{
	if((MIS_HAKONBANDITS == LOG_RUNNING) && Npc_IsDead(bandit_1) && Npc_IsDead(bandit_2) && Npc_IsDead(bandit_3))
	{
		return TRUE;
	};
};

func void dia_hakon_success_info()
{
	AI_Output(other,self,"DIA_Hakon_Success_15_00");	//U� jsem ty bandity vy��dil.
	AI_Output(self,other,"DIA_Hakon_Add_12_27");	//Opravdu? To by mohl ��ct ka�d�. M� n�jak� d�kaz?
	AI_Output(other,self,"DIA_Hakon_Add_15_28");	//(povzdech) To se tam m�m vr�tit a usekat jim hlavy, nebo co?
	AI_Output(self,other,"DIA_Hakon_Add_12_29");	//(rychle) Ne - to snad ani nebude nutn�. V���m ti.
	AI_Output(self,other,"DIA_Hakon_Success_12_01");	//Prok�zal jsi m�stsk�m obchodn�k�m nesm�rnou slu�bu.
	if(Npc_KnowsInfo(other,dia_hakon_haradbandits))
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_30");	//Harad bude spokojen� - aspo� mysl�m.
	};
	if(MIS_HAKONBANDITSPAY == TRUE)
	{
		AI_Output(self,other,"DIA_Hakon_Success_12_02");	//A tady m� sl�benou odm�nu.
		b_giveinvitems(self,other,itmi_gold,100);
	};
	MIS_HAKONBANDITS = LOG_SUCCESS;
	b_giveplayerxp(XP_HAKON_BANDITS);
};


instance DIA_HAKON_MINENANTEIL(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 3;
	condition = dia_hakon_minenanteil_condition;
	information = dia_hakon_minenanteil_info;
	permanent = FALSE;
	description = "Kde jsi sehnal ty d�ln� akcie, kter� prod�v�?";
};


func int dia_hakon_minenanteil_condition()
{
	if((hero.guild == GIL_KDF) && (MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_hakon_minenanteil_info()
{
	AI_Output(other,self,"DIA_Hakon_Minenanteil_15_00");	//Kde jsi sehnal ty d�ln� akcie, kter� prod�v�?
	AI_Output(self,other,"DIA_Hakon_Minenanteil_12_01");	//Je mi l�to, ale to ti nem��u prozradit. Je to moc nebezpe�n�.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_HAKON_PICKPOCKET(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 900;
	condition = dia_hakon_pickpocket_condition;
	information = dia_hakon_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_hakon_pickpocket_condition()
{
	return c_beklauen(45,65);
};

func void dia_hakon_pickpocket_info()
{
	Info_ClearChoices(dia_hakon_pickpocket);
	Info_AddChoice(dia_hakon_pickpocket,DIALOG_BACK,dia_hakon_pickpocket_back);
	Info_AddChoice(dia_hakon_pickpocket,DIALOG_PICKPOCKET,dia_hakon_pickpocket_doit);
};

func void dia_hakon_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_hakon_pickpocket);
};

func void dia_hakon_pickpocket_back()
{
	Info_ClearChoices(dia_hakon_pickpocket);
};


instance DIA_HAKON_KAPITEL2(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 5;
	condition = dia_hakon_kapitel2_condition;
	information = dia_hakon_kapitel2_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hakon_kapitel2_condition()
{
	if((KAPITEL >= 2) && (CANTHAR_SPERRE == FALSE) && (self.aivar[AIV_TALKEDTOPLAYER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_hakon_kapitel2_info()
{
	AI_Output(self,other,"DIA_Hakon_Add_12_22");	//U� zase TY!
	AI_Output(self,other,"DIA_Hakon_Add_12_23");	//Harad kone�n� skon�il s tou zatrachtilou mis� pro paladiny.
	AI_Output(self,other,"DIA_Hakon_Add_12_24");	//To zna��, �e ti te� m��u nab�dnout nov� zbran�. M� z�jem?
};

