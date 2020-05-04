
instance DIA_GORNDJG_EXIT(C_INFO)
{
	npc = pc_fighter_djg;
	nr = 999;
	condition = dia_gorndjg_exit_condition;
	information = dia_gorndjg_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gorndjg_exit_condition()
{
	return TRUE;
};

func void dia_gorndjg_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORNDJG_STARTCAMP(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_startcamp_condition;
	information = dia_gorndjg_startcamp_info;
	description = "Vid�m, �e ses p�idal k drakobijc�m.";
};


func int dia_gorndjg_startcamp_condition()
{
	if(Npc_GetDistToWP(self,"OW_DJG_STARTCAMP_01") < 1000)
	{
		return TRUE;
	};
};

func void dia_gorndjg_startcamp_info()
{
	AI_Output(other,self,"DIA_GornDJG_STARTCAMP_15_00");	//Vid�m, �e ses p�idal k drakobijc�m.
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_12_01");	//�el jsem se Sylviem do Hornick�ho �dol�, proto�e se tady vyzn�m ze v�ech nejl�pe a cht�l jsem si ud�lat p�esnou p�edstavu o zdej�� situaci.
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_12_02");	//Jedno ti pov�m. N�co se tu chyst�. Je�t� nikdy jsem nevid�l tolik sk�et� na jednom m�st�.
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_12_03");	//Nedivil bych se, kdyby touhle dobou Garond a v�ichni paladini z hradu u� neutekli nebo nebyli rozsekan� na kousky.
	Info_AddChoice(dia_gorndjg_startcamp,"Uvid�me se.",dia_gorndjg_startcamp_by);
	Info_AddChoice(dia_gorndjg_startcamp,"Co chce� d�lat?",dia_gorndjg_startcamp_wohin);
};

func void dia_gorndjg_startcamp_wohin()
{
	AI_Output(other,self,"DIA_GornDJG_STARTCAMP_Wohin_15_00");	//Co chce� d�lat?
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_Wohin_12_01");	//Nejd��v p�jdu tady s chlapci do Hornick�ho �dol� a pak vyraz�m.
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_Wohin_12_02");	//Rozhodn� mus�m zjistit, co maj� sk�eti za lubem.
};

func void dia_gorndjg_startcamp_by()
{
	AI_Output(other,self,"DIA_GornDJG_STARTCAMP_By_15_00");	//Uvid�me se.
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_By_12_01");	//D�vej na sebe pozor.
	AI_StopProcessInfos(self);
};


instance DIA_GORNDJG_HALLO(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_hallo_condition;
	information = dia_gorndjg_hallo_info;
	description = "Tak�e tady ses za�il!";
};


func int dia_gorndjg_hallo_condition()
{
	if(Npc_GetDistToWP(self,"OW_DJG_ROCKCAMP_01") < 1500)
	{
		return TRUE;
	};
};

func void dia_gorndjg_hallo_info()
{
	AI_Output(other,self,"DIA_GornDJG_HALLO_15_00");	//Tak�e tady ses za�il!
	AI_Output(self,other,"DIA_GornDJG_HALLO_12_01");	//Nen� tak snadn� se zab�t, co?
};


instance DIA_GORNDJG_WHATSUP(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_whatsup_condition;
	information = dia_gorndjg_whatsup_info;
	description = "U� jsi n�co chytil?";
};


func int dia_gorndjg_whatsup_condition()
{
	if(Npc_KnowsInfo(other,dia_gorndjg_hallo))
	{
		return TRUE;
	};
};

func void dia_gorndjg_whatsup_info()
{
	AI_Output(other,self,"DIA_GornDJG_WHATSUP_15_00");	//U� jsi n�co chytil?
	AI_Output(self,other,"DIA_GornDJG_WHATSUP_12_01");	//Po��d �ek�m. �ekl bych, �e tam v t�ch skaln�ch trosk�ch n�co je. V noci se tam sv�t� a jsou dokonce sly�et n�jak� sk�eky.
	Info_ClearChoices(dia_gorndjg_whatsup);
	Info_AddChoice(dia_gorndjg_whatsup,"Mo�n� to je Lester?",dia_gorndjg_whatsup_lester);
	Info_AddChoice(dia_gorndjg_whatsup,"Drak?",dia_gorndjg_whatsup_a_dragon);
	b_logentry(TOPIC_DRAGONHUNTER,"Gorn sitzt am Fu�e der Hochebene zur alten Felsenfestung. Von dort aus hat er sowohl die Hochebene als auch die Orkbarriere im Blickfeld.");
};

func void dia_gorndjg_whatsup_lester()
{
	AI_Output(other,self,"DIA_GornDJG_WHATSUP_Lester_15_00");	//Mo�n� to je Lester, kter� se vr�til do sv�ch rozvalin?
	AI_Output(self,other,"DIA_GornDJG_WHATSUP_Lester_12_01");	//To t�ko. Co v�m, Lester tu u� ne�ije.
};

func void dia_gorndjg_whatsup_a_dragon()
{
	AI_Output(other,self,"DIA_GornDJG_WHATSUP_A_Dragon_15_00");	//Drak?
	AI_Output(self,other,"DIA_GornDJG_WHATSUP_A_Dragon_12_01");	//Dost mo�n�. Ta planina je st�e�en� jako n�jak� mizern� kr�lovsk� pokladnice. Ale je to bohu�el jedin� cesta k pevnosti.
	AI_Output(self,other,"DIA_GornDJG_WHATSUP_A_Dragon_12_02");	//Jako by nesta�ilo, �e jsou draci dost nep��jemn� sami o sob�. Vypad� to, �e maj� v z�loze je�t� p�r dal��ch p��er.
	GORNDJG_WHATMONSTERS = TRUE;
	b_logentry(TOPIC_DRAGONHUNTER,"Podle Gorna se ve star� kamenn� pevnosti usadil drak.");
	Info_ClearChoices(dia_gorndjg_whatsup);
};


instance DIA_GORNDJG_WHATMONSTERS(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_whatmonsters_condition;
	information = dia_gorndjg_whatmonsters_info;
	description = "Jak� p��ery to jsou?";
};


func int dia_gorndjg_whatmonsters_condition()
{
	if(GORNDJG_WHATMONSTERS == TRUE)
	{
		return TRUE;
	};
};

func void dia_gorndjg_whatmonsters_info()
{
	AI_Output(other,self,"DIA_GornDJG_WHATMONSTERS_15_00");	//Jak� p��ery to jsou?
	AI_Output(self,other,"DIA_GornDJG_WHATMONSTERS_12_01");	//Nev�m to �pln� p�esn�, ale chod� vzp��men� a maj� �upinatou k��i. Pohybuj� se po skal�ch jako ch�apavci, kte�� vyc�tili ob�.
	AI_Output(self,other,"DIA_GornDJG_WHATMONSTERS_12_02");	//Tady dole je sly��m fun�t a sup�t. �ekl bych, �e zabrali �pln� celou planinu.
};


instance DIA_GORNDJG_WAHTABOUTORCS(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_wahtaboutorcs_condition;
	information = dia_gorndjg_wahtaboutorcs_info;
	description = "A co sk�eti?";
};


func int dia_gorndjg_wahtaboutorcs_condition()
{
	if(Npc_KnowsInfo(other,dia_gorndjg_hallo))
	{
		return TRUE;
	};
};

func void dia_gorndjg_wahtaboutorcs_info()
{
	AI_Output(other,self,"DIA_GornDJG_WAHTABOUTORCS_15_00");	//A co sk�eti?
	AI_Output(self,other,"DIA_GornDJG_WAHTABOUTORCS_12_01");	//Chv�li jsem je sledoval. Za tou ohradou dole se mus� n�co ukr�vat. M�m podez�en�, �e se jich tam shrom�dil u� p�kn� z�stup.
	AI_Output(other,self,"DIA_GornDJG_WAHTABOUTORCS_15_02");	//T�m chce� ��ct, �e jich tam je V�C ne� tady?
	AI_Output(self,other,"DIA_GornDJG_WAHTABOUTORCS_12_03");	//Nep�ekvapilo by m�, kdyby jednoho dne tu palis�du strhli a zaplavili celou zemi. V�bec se mi to nechce l�bit.
	AI_Output(self,other,"DIA_GornDJG_WAHTABOUTORCS_12_04");	//Pokud se to stane, budu se muset vr�tit a varovat Leeho. Stejn� se chce z ostrova zdekovat. Pak bude nejvy��� �as.
};


instance DIA_GORNDJG_HELPKILLDRACONIANS(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_helpkilldraconians_condition;
	information = dia_gorndjg_helpkilldraconians_info;
	description = "M��e� mi pomoci dostat se do pevnosti?";
};


func int dia_gorndjg_helpkilldraconians_condition()
{
	if(Npc_KnowsInfo(other,dia_gorndjg_whatmonsters) && Npc_KnowsInfo(other,dia_gorndjg_wahtaboutorcs) && (Npc_IsDead(rockdragon) == FALSE))
	{
		return TRUE;
	};
};

func void dia_gorndjg_helpkilldraconians_info()
{
	AI_Output(other,self,"DIA_GornDJG_HELPKILLDRACONIANS_15_00");	//M��e� mi pomoci dostat se do pevnosti?
	AI_Output(self,other,"DIA_GornDJG_HELPKILLDRACONIANS_12_01");	//To v�n� nev�m. Boj�m se, �e sk�eti za�to�� p�esn� ve chv�li, kdy je pust�m z o��.
	AI_Output(other,self,"DIA_GornDJG_HELPKILLDRACONIANS_15_02");	//To je paranoidn�!
	AI_Output(self,other,"DIA_GornDJG_HELPKILLDRACONIANS_12_03");	//Nem��u si pomoci. V�, nikdy bych si neodpustil, kdybych p�i�el pozd�. Na druhou stranu...
	AI_Output(self,other,"DIA_GornDJG_HELPKILLDRACONIANS_12_04");	//V�dy� je to jedno! Pro� jinak bych tady byl? Za�to�me na planinu a prosekejme si cestu do pevnosti.
	AI_Output(self,other,"DIA_GornDJG_HELPKILLDRACONIANS_12_05");	//Tro�ka pohybu n�m neu�kod�. Krom� toho bych se docela r�d pod�val na ty bestie v�c zbl�zka.
	AI_Output(self,other,"DIA_GornDJG_HELPKILLDRACONIANS_12_06");	//Dej mi v�d�t, a� bude� p�ipraven!
	b_logentry(TOPIC_DRAGONHUNTER,"Gorn mi chce pomoci proniknout do kamenn� pevnosti na planin�.");
};


instance DIA_GORNDJG_LOSGEHTS(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_losgehts_condition;
	information = dia_gorndjg_losgehts_info;
	description = "Za�to�me!";
};


func int dia_gorndjg_losgehts_condition()
{
	if(Npc_KnowsInfo(other,dia_gorndjg_helpkilldraconians))
	{
		return TRUE;
	};
};

func void dia_gorndjg_losgehts_info()
{
	AI_Output(other,self,"DIA_GornDJG_LOSGEHTS_15_00");	//Za�to�me!
	AI_Output(self,other,"DIA_GornDJG_LOSGEHTS_12_01");	//Jako za star�ch �as�, co? Ale jedno ti �eknu: tohle je moje bitva. Tentokr�t jdu vep�edu j�!
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"RunToRockRuinBridge");
};


instance DIA_GORNDJG_BISHIERHIN(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_bishierhin_condition;
	information = dia_gorndjg_bishierhin_info;
	important = TRUE;
};


func int dia_gorndjg_bishierhin_condition()
{
	if(Npc_GetDistToWP(self,"LOCATION_19_01") < 1000)
	{
		return TRUE;
	};
};

func void dia_gorndjg_bishierhin_info()
{
	AI_Output(self,other,"DIA_GornDJG_BISHIERHIN_12_00");	//Byla to hra�ka. Tak, p��teli, o zbytek se u� bude� muset postarat ty. Po��dn� jim zatop! J� se vr�t�m a budu zase d�vat pozor na sk�ety.
	AI_Output(other,self,"DIA_GornDJG_BISHIERHIN_15_01");	//��dn� probl�m. Je�t� se uvid�me!
	AI_Output(self,other,"DIA_GornDJG_BISHIERHIN_12_02");	//To douf�m!
	b_logentry(TOPIC_DRAGONHUNTER,"Gorn se vr�til zp�t na sv� pozorovac� stanovi�t�. Chce i nad�le sledovat sk�ety.");
	b_giveplayerxp(XP_GORNDJGPLATEAUCLEAR);
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_GORNDJG_DRAGONDEAD(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_dragondead_condition;
	information = dia_gorndjg_dragondead_info;
	description = "Drak ze skal je mrtv�!";
};


func int dia_gorndjg_dragondead_condition()
{
	if(Npc_KnowsInfo(other,dia_gorndjg_whatsup) && (Npc_GetDistToWP(self,"OW_DJG_ROCKCAMP_01") < 1000) && (Npc_IsDead(rockdragon) == TRUE))
	{
		return TRUE;
	};
};

func void dia_gorndjg_dragondead_info()
{
	AI_Output(other,self,"DIA_GornDJG_DRAGONDEAD_15_00");	//Drak ze skal je mrtv�!
	AI_Output(self,other,"DIA_GornDJG_DRAGONDEAD_12_01");	//Nesly��m ��dn� dal�� sk�eky! Byl jsi v t� skaln� pevnosti?
	AI_Output(other,self,"DIA_GornDJG_DRAGONDEAD_15_02");	//Ano!
	AI_Output(self,other,"DIA_GornDJG_DRAGONDEAD_12_03");	//Ha ha! To jsem si domyslel. Kdekoliv se objev�, nez�stane k�men na kameni.
	AI_Output(other,self,"DIA_GornDJG_DRAGONDEAD_15_04");	//Co bude� d�lat d�l?
	AI_Output(self,other,"DIA_GornDJG_DRAGONDEAD_12_05");	//Je�t� chv�li tu z�stanu a pak se vr�t�m k Leeovi. Mo�n� se tam zase setk�me!
	AI_Output(self,other,"DIA_GornDJG_DRAGONDEAD_12_06");	//Cel� tahle krajina mi za��n� l�zt na nervy. U� je na �ase, abychom odsud vypadli.
	AI_Output(other,self,"DIA_GornDJG_DRAGONDEAD_15_07");	//Uvid�me se pozd�ji!
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_FIGHTER_DJG_PICKPOCKET(C_INFO)
{
	npc = pc_fighter_djg;
	nr = 900;
	condition = dia_fighter_djg_pickpocket_condition;
	information = dia_fighter_djg_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_fighter_djg_pickpocket_condition()
{
	return c_beklauen(10,35);
};

func void dia_fighter_djg_pickpocket_info()
{
	Info_ClearChoices(dia_fighter_djg_pickpocket);
	Info_AddChoice(dia_fighter_djg_pickpocket,DIALOG_BACK,dia_fighter_djg_pickpocket_back);
	Info_AddChoice(dia_fighter_djg_pickpocket,DIALOG_PICKPOCKET,dia_fighter_djg_pickpocket_doit);
};

func void dia_fighter_djg_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_fighter_djg_pickpocket);
};

func void dia_fighter_djg_pickpocket_back()
{
	Info_ClearChoices(dia_fighter_djg_pickpocket);
};

