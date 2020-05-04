
instance DIA_GESTATH_EXIT(C_INFO)
{
	npc = vlk_4148_gestath;
	nr = 999;
	condition = dia_gestath_exit_condition;
	information = dia_gestath_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gestath_exit_condition()
{
	return TRUE;
};

func void dia_gestath_exit_info()
{
	var C_ITEM heroarmor;
	heroarmor = Npc_GetEquippedArmor(other);
	if(Hlp_IsItem(heroarmor,itar_djg_crawler) == TRUE)
	{
		AI_Output(self,other,"DIA_Gestath_EXIT_09_00");	//(úseènì) Pìkná zbroj!
	};
	AI_StopProcessInfos(self);
};


instance DIA_GESTATH_HALLO(C_INFO)
{
	npc = vlk_4148_gestath;
	nr = 3;
	condition = dia_gestath_hallo_condition;
	information = dia_gestath_hallo_info;
	description = "Jak se vede?";
};


func int dia_gestath_hallo_condition()
{
	return TRUE;
};

func void dia_gestath_hallo_info()
{
	AI_Output(other,self,"DIA_Gestath_HALLO_15_00");	//Jak se vede?
	AI_Output(self,other,"DIA_Gestath_HALLO_09_01");	//(úseènì) Máš kuráž, že jsi sem pøišel. Nezabloudil jsi náhodou?
	GESTATH_TEACHANIMALTROPHY = TRUE;
	Info_ClearChoices(dia_gestath_hallo);
	Info_AddChoice(dia_gestath_hallo,"Co je tady k vidìní?",dia_gestath_hallo_waszusehen);
	Info_AddChoice(dia_gestath_hallo,"Co tady dìláš?",dia_gestath_hallo_was);
};

func void dia_gestath_hallo_plate()
{
	AI_Output(other,self,"DIA_Gestath_HALLO_plate_15_00");	//Ta zbroj, co máš na sobì, je parádní.
	AI_Output(self,other,"DIA_Gestath_HALLO_plate_09_01");	//To teda jo, a taky tìžko k sehnání. Je udìlaná z krunýøù dùlních èervù - vyrobil mi ji jistý Wolf.
	AI_Output(self,other,"DIA_Gestath_HALLO_plate_09_02");	//Døív jsem býval v téhle kolonii vìznìm. Dal jsem mu pár krunýøù dùlních èervù a za pár dní už svou práci dokonèil. Ten chlap je skvìlý.
	WOLF_PRODUCECRAWLERARMOR = TRUE;
	Info_AddChoice(dia_gestath_hallo,DIALOG_BACK,dia_gestath_hallo_back);
	Info_AddChoice(dia_gestath_hallo,"Kde je ten Wolf teï?",dia_gestath_hallo_plate_wowolf);
};

func void dia_gestath_hallo_plate_wowolf()
{
	AI_Output(other,self,"DIA_Gestath_HALLO_plate_woWolf_15_00");	//Kde je ten Wolf teï?
	AI_Output(self,other,"DIA_Gestath_HALLO_plate_woWolf_09_01");	//Už jsem ho nìjakou dobu nevidìl. Tenkrát byl žoldákem tady v kolonii.
	AI_Output(self,other,"DIA_Gestath_HALLO_plate_woWolf_09_02");	//Poèítám, že se tu nìkde potuluje s ostatními.
};

func void dia_gestath_hallo_was()
{
	AI_Output(other,self,"DIA_Gestath_HALLO_was_15_00");	//Co tady dìláš?
	AI_Output(self,other,"DIA_Gestath_HALLO_was_09_01");	//Chci si nìco vydìlat.
	AI_Output(other,self,"DIA_Gestath_HALLO_was_15_02");	//Tady, uprostøed pustiny?
	AI_Output(self,other,"DIA_Gestath_HALLO_was_09_03");	//Jsem lovec. Specializuji se na to, co se loví jen tìžko.
	AI_Output(self,other,"DIA_Gestath_HALLO_was_09_04");	//Ohnivý ještìøi, dùlní èervi, draèí chòapavci - prostì všechno, co nikdo jiný neloví. To vždycky dobøe vynáší.
	Info_AddChoice(dia_gestath_hallo,"Ta zbroj, co máš na sobì, je parádní.",dia_gestath_hallo_plate);
};

func void dia_gestath_hallo_waszusehen()
{
	AI_Output(other,self,"DIA_Gestath_HALLO_waszusehen_15_00");	//Co je tady k vidìní?
	AI_Output(self,other,"DIA_Gestath_HALLO_waszusehen_09_01");	//Hromada ještìrù, skøetù a bùhvíèeho ještì. A to jsem ještì nebyl moc daleko na pláni.
	AI_Output(self,other,"DIA_Gestath_HALLO_waszusehen_09_02");	//A tobì bych to taky neradil. To, co tam žije, opravdu nevypadá moc pøátelsky.
};

func void dia_gestath_hallo_back()
{
	Info_ClearChoices(dia_gestath_hallo);
};


instance DIA_GESTATH_DRACHEN(C_INFO)
{
	npc = vlk_4148_gestath;
	nr = 3;
	condition = dia_gestath_drachen_condition;
	information = dia_gestath_drachen_info;
	permanent = TRUE;
	description = "Dokážeš taky vyvrhnout draka?";
};


var int gestath_dragontrophy;

func int dia_gestath_drachen_condition()
{
	if((GESTATH_DRAGONTROPHY == FALSE) && (GESTATH_TEACHANIMALTROPHY == TRUE))
	{
		return TRUE;
	};
};

func void dia_gestath_drachen_info()
{
	AI_Output(other,self,"DIA_Gestath_Drachen_15_00");	//Dokážeš taky vyvrhnout draka?
	if(KAPITEL < 4)
	{
		AI_Output(self,other,"DIA_Gestath_Drachen_09_01");	//(usmìje se) Zeptej se mì pozdìji, až budeš na nìco takového pøipravený, jo?
	}
	else
	{
		AI_Output(self,other,"DIA_Gestath_Drachen_09_02");	//Jasnì, proè ne?
		GESTATH_DRAGONTROPHY = TRUE;
	};
};


instance DIA_GESTATH_TEACHHUNTING(C_INFO)
{
	npc = vlk_4148_gestath;
	nr = 12;
	condition = dia_gestath_teachhunting_condition;
	information = dia_gestath_teachhunting_info;
	permanent = TRUE;
	description = "Vysvìtli mi, jak vyvrhnout zvíøata.";
};


func int dia_gestath_teachhunting_condition()
{
	if(GESTATH_TEACHANIMALTROPHY == TRUE)
	{
		return TRUE;
	};
};


var int dia_gestath_teachhunting_onetime;

func void dia_gestath_teachhunting_info()
{
	AI_Output(other,self,"DIA_Gestath_TEACHHUNTING_15_00");	//Vysvìtli mi, jak vyvrhnout zvíøata.
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FIRETONGUE] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CRAWLERPLATE] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_MANDIBLES] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRGSNAPPERHORN] == FALSE) || ((GESTATH_DRAGONTROPHY == TRUE) && ((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONSCALE] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONBLOOD] == FALSE))))
	{
		if(DIA_GESTATH_TEACHHUNTING_ONETIME == FALSE)
		{
			AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_09_01");	//Proè ne? Myslím, že už toho umím dost.
			DIA_GESTATH_TEACHHUNTING_ONETIME = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_09_02");	//Co bys rád vìdìl?
		};
		Info_AddChoice(dia_gestath_teachhunting,DIALOG_BACK,dia_gestath_teachhunting_back);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FIRETONGUE] == FALSE)
		{
			Info_AddChoice(dia_gestath_teachhunting,b_buildlearnstring("Ohnivý jazyk",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_FIRETONGUE)),dia_gestath_teachhunting_firetongue);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CRAWLERPLATE] == FALSE)
		{
			Info_AddChoice(dia_gestath_teachhunting,b_buildlearnstring("Oddìlení èervích krunýøù",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CRAWLERPLATE)),dia_gestath_teachhunting_crawlerplate);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_MANDIBLES] == FALSE)
		{
			Info_AddChoice(dia_gestath_teachhunting,b_buildlearnstring("Vyjmutí kusadel",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_MANDIBLES)),dia_gestath_teachhunting_mandibles);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRGSNAPPERHORN] == FALSE)
		{
			Info_AddChoice(dia_gestath_teachhunting,b_buildlearnstring("Roh draèího chòapavce",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DRGSNAPPERHORN)),dia_gestath_teachhunting_drgsnapperhorn);
		};
		if(GESTATH_DRAGONTROPHY == TRUE)
		{
			if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONSCALE] == FALSE)
			{
				Info_AddChoice(dia_gestath_teachhunting,b_buildlearnstring("Vyjmutí draèích šupin",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DRAGONSCALE)),dia_gestath_teachhunting_dragonscale);
			};
			if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONBLOOD] == FALSE)
			{
				Info_AddChoice(dia_gestath_teachhunting,b_buildlearnstring("Získání draèí krve",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DRAGONBLOOD)),dia_gestath_teachhunting_dragonblood);
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_09_03");	//V téhle chvíli nevím, co bych tì ještì nauèil.
	};
};

func void dia_gestath_teachhunting_back()
{
	Info_ClearChoices(dia_gestath_teachhunting);
};

func void dia_gestath_teachhunting_firetongue()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_FIRETONGUE))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_FireTongue_09_00");	//Ohnivé ještìrce lze vyøíznout jazyk jediným tahem nože, když jej pøitom druhou rukou opatrnì pøidržuješ.
	};
	Info_ClearChoices(dia_gestath_teachhunting);
};

func void dia_gestath_teachhunting_crawlerplate()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_CRAWLERPLATE))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_CrawlerPlate_09_00");	//Èerví krunýøe musíš oddìlovat dostateènì silným nožem.
	};
	Info_ClearChoices(dia_gestath_teachhunting);
};

func void dia_gestath_teachhunting_mandibles()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_MANDIBLES))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_Mandibles_09_00");	//Kusadla jsou v lebkách polních škùdcù a dùlních èervù vrostlá pomìrnì hluboko. Proto si s nimi musíš chvíli pohrát, než se ti podaøí je dostat ven.
	};
	Info_ClearChoices(dia_gestath_teachhunting);
};

func void dia_gestath_teachhunting_drgsnapperhorn()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_DRGSNAPPERHORN))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_DrgSnapperHorn_09_00");	//Nejlepší místo, kde zaèít s vyjímáním rohu draèího chòapavce, je støed èela. Pøitom musíš používat dost masivní nùž.
	};
	Info_ClearChoices(dia_gestath_teachhunting);
};

func void dia_gestath_teachhunting_dragonscale()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_DRAGONSCALE))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_DragonScale_09_00");	//Draèí šupiny lze vyjmout velmi tìžko, ale ve chvíli, kdy už si zaèneš myslet, že to nezvládneš, zèistajasna z draèího høbetu koneènì odpadnou.
	};
	Info_ClearChoices(dia_gestath_teachhunting);
};

func void dia_gestath_teachhunting_dragonblood()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_DRAGONBLOOD))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_DragonBlood_09_00");	//Chceš-li získat krev, zamìø se na drakovo bøicho. Najdi mìkké místo a pak je probodni ostrým nožem.
	};
	Info_ClearChoices(dia_gestath_teachhunting);
};


instance DIA_GESTATH_PICKPOCKET(C_INFO)
{
	npc = vlk_4148_gestath;
	nr = 900;
	condition = dia_gestath_pickpocket_condition;
	information = dia_gestath_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_gestath_pickpocket_condition()
{
	return c_beklauen(81,350);
};

func void dia_gestath_pickpocket_info()
{
	Info_ClearChoices(dia_gestath_pickpocket);
	Info_AddChoice(dia_gestath_pickpocket,DIALOG_BACK,dia_gestath_pickpocket_back);
	Info_AddChoice(dia_gestath_pickpocket,DIALOG_PICKPOCKET,dia_gestath_pickpocket_doit);
};

func void dia_gestath_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_gestath_pickpocket);
};

func void dia_gestath_pickpocket_back()
{
	Info_ClearChoices(dia_gestath_pickpocket);
};

