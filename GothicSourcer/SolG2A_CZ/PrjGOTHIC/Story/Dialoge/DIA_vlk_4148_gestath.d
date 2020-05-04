
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
		AI_Output(self,other,"DIA_Gestath_EXIT_09_00");	//(�se�n�) P�kn� zbroj!
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
	AI_Output(self,other,"DIA_Gestath_HALLO_09_01");	//(�se�n�) M� kur�, �e jsi sem p�i�el. Nezabloudil jsi n�hodou?
	GESTATH_TEACHANIMALTROPHY = TRUE;
	Info_ClearChoices(dia_gestath_hallo);
	Info_AddChoice(dia_gestath_hallo,"Co je tady k vid�n�?",dia_gestath_hallo_waszusehen);
	Info_AddChoice(dia_gestath_hallo,"Co tady d�l�?",dia_gestath_hallo_was);
};

func void dia_gestath_hallo_plate()
{
	AI_Output(other,self,"DIA_Gestath_HALLO_plate_15_00");	//Ta zbroj, co m� na sob�, je par�dn�.
	AI_Output(self,other,"DIA_Gestath_HALLO_plate_09_01");	//To teda jo, a taky t�ko k sehn�n�. Je ud�lan� z krun��� d�ln�ch �erv� - vyrobil mi ji jist� Wolf.
	AI_Output(self,other,"DIA_Gestath_HALLO_plate_09_02");	//D��v jsem b�val v t�hle kolonii v�zn�m. Dal jsem mu p�r krun��� d�ln�ch �erv� a za p�r dn� u� svou pr�ci dokon�il. Ten chlap je skv�l�.
	WOLF_PRODUCECRAWLERARMOR = TRUE;
	Info_AddChoice(dia_gestath_hallo,DIALOG_BACK,dia_gestath_hallo_back);
	Info_AddChoice(dia_gestath_hallo,"Kde je ten Wolf te�?",dia_gestath_hallo_plate_wowolf);
};

func void dia_gestath_hallo_plate_wowolf()
{
	AI_Output(other,self,"DIA_Gestath_HALLO_plate_woWolf_15_00");	//Kde je ten Wolf te�?
	AI_Output(self,other,"DIA_Gestath_HALLO_plate_woWolf_09_01");	//U� jsem ho n�jakou dobu nevid�l. Tenkr�t byl �old�kem tady v kolonii.
	AI_Output(self,other,"DIA_Gestath_HALLO_plate_woWolf_09_02");	//Po��t�m, �e se tu n�kde potuluje s ostatn�mi.
};

func void dia_gestath_hallo_was()
{
	AI_Output(other,self,"DIA_Gestath_HALLO_was_15_00");	//Co tady d�l�?
	AI_Output(self,other,"DIA_Gestath_HALLO_was_09_01");	//Chci si n�co vyd�lat.
	AI_Output(other,self,"DIA_Gestath_HALLO_was_15_02");	//Tady, uprost�ed pustiny?
	AI_Output(self,other,"DIA_Gestath_HALLO_was_09_03");	//Jsem lovec. Specializuji se na to, co se lov� jen t�ko.
	AI_Output(self,other,"DIA_Gestath_HALLO_was_09_04");	//Ohniv� je�t��i, d�ln� �ervi, dra�� ch�apavci - prost� v�echno, co nikdo jin� nelov�. To v�dycky dob�e vyn��.
	Info_AddChoice(dia_gestath_hallo,"Ta zbroj, co m� na sob�, je par�dn�.",dia_gestath_hallo_plate);
};

func void dia_gestath_hallo_waszusehen()
{
	AI_Output(other,self,"DIA_Gestath_HALLO_waszusehen_15_00");	//Co je tady k vid�n�?
	AI_Output(self,other,"DIA_Gestath_HALLO_waszusehen_09_01");	//Hromada je�t�r�, sk�et� a b�hv��eho je�t�. A to jsem je�t� nebyl moc daleko na pl�ni.
	AI_Output(self,other,"DIA_Gestath_HALLO_waszusehen_09_02");	//A tob� bych to taky neradil. To, co tam �ije, opravdu nevypad� moc p��telsky.
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
	description = "Dok�e� taky vyvrhnout draka?";
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
	AI_Output(other,self,"DIA_Gestath_Drachen_15_00");	//Dok�e� taky vyvrhnout draka?
	if(KAPITEL < 4)
	{
		AI_Output(self,other,"DIA_Gestath_Drachen_09_01");	//(usm�je se) Zeptej se m� pozd�ji, a� bude� na n�co takov�ho p�ipraven�, jo?
	}
	else
	{
		AI_Output(self,other,"DIA_Gestath_Drachen_09_02");	//Jasn�, pro� ne?
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
	description = "Vysv�tli mi, jak vyvrhnout zv��ata.";
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
	AI_Output(other,self,"DIA_Gestath_TEACHHUNTING_15_00");	//Vysv�tli mi, jak vyvrhnout zv��ata.
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FIRETONGUE] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CRAWLERPLATE] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_MANDIBLES] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRGSNAPPERHORN] == FALSE) || ((GESTATH_DRAGONTROPHY == TRUE) && ((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONSCALE] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONBLOOD] == FALSE))))
	{
		if(DIA_GESTATH_TEACHHUNTING_ONETIME == FALSE)
		{
			AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_09_01");	//Pro� ne? Mysl�m, �e u� toho um�m dost.
			DIA_GESTATH_TEACHHUNTING_ONETIME = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_09_02");	//Co bys r�d v�d�l?
		};
		Info_AddChoice(dia_gestath_teachhunting,DIALOG_BACK,dia_gestath_teachhunting_back);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FIRETONGUE] == FALSE)
		{
			Info_AddChoice(dia_gestath_teachhunting,b_buildlearnstring("Ohniv� jazyk",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_FIRETONGUE)),dia_gestath_teachhunting_firetongue);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CRAWLERPLATE] == FALSE)
		{
			Info_AddChoice(dia_gestath_teachhunting,b_buildlearnstring("Odd�len� �erv�ch krun���",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CRAWLERPLATE)),dia_gestath_teachhunting_crawlerplate);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_MANDIBLES] == FALSE)
		{
			Info_AddChoice(dia_gestath_teachhunting,b_buildlearnstring("Vyjmut� kusadel",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_MANDIBLES)),dia_gestath_teachhunting_mandibles);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRGSNAPPERHORN] == FALSE)
		{
			Info_AddChoice(dia_gestath_teachhunting,b_buildlearnstring("Roh dra��ho ch�apavce",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DRGSNAPPERHORN)),dia_gestath_teachhunting_drgsnapperhorn);
		};
		if(GESTATH_DRAGONTROPHY == TRUE)
		{
			if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONSCALE] == FALSE)
			{
				Info_AddChoice(dia_gestath_teachhunting,b_buildlearnstring("Vyjmut� dra��ch �upin",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DRAGONSCALE)),dia_gestath_teachhunting_dragonscale);
			};
			if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONBLOOD] == FALSE)
			{
				Info_AddChoice(dia_gestath_teachhunting,b_buildlearnstring("Z�sk�n� dra�� krve",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DRAGONBLOOD)),dia_gestath_teachhunting_dragonblood);
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_09_03");	//V t�hle chv�li nev�m, co bych t� je�t� nau�il.
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
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_FireTongue_09_00");	//Ohniv� je�t�rce lze vy��znout jazyk jedin�m tahem no�e, kdy� jej p�itom druhou rukou opatrn� p�idr�uje�.
	};
	Info_ClearChoices(dia_gestath_teachhunting);
};

func void dia_gestath_teachhunting_crawlerplate()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_CRAWLERPLATE))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_CrawlerPlate_09_00");	//�erv� krun��e mus� odd�lovat dostate�n� siln�m no�em.
	};
	Info_ClearChoices(dia_gestath_teachhunting);
};

func void dia_gestath_teachhunting_mandibles()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_MANDIBLES))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_Mandibles_09_00");	//Kusadla jsou v lebk�ch poln�ch �k�dc� a d�ln�ch �erv� vrostl� pom�rn� hluboko. Proto si s nimi mus� chv�li pohr�t, ne� se ti poda�� je dostat ven.
	};
	Info_ClearChoices(dia_gestath_teachhunting);
};

func void dia_gestath_teachhunting_drgsnapperhorn()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_DRGSNAPPERHORN))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_DrgSnapperHorn_09_00");	//Nejlep�� m�sto, kde za��t s vyj�m�n�m rohu dra��ho ch�apavce, je st�ed �ela. P�itom mus� pou��vat dost masivn� n��.
	};
	Info_ClearChoices(dia_gestath_teachhunting);
};

func void dia_gestath_teachhunting_dragonscale()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_DRAGONSCALE))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_DragonScale_09_00");	//Dra�� �upiny lze vyjmout velmi t�ko, ale ve chv�li, kdy u� si za�ne� myslet, �e to nezvl�dne�, z�istajasna z dra��ho h�betu kone�n� odpadnou.
	};
	Info_ClearChoices(dia_gestath_teachhunting);
};

func void dia_gestath_teachhunting_dragonblood()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_DRAGONBLOOD))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_DragonBlood_09_00");	//Chce�-li z�skat krev, zam�� se na drakovo b�icho. Najdi m�kk� m�sto a pak je probodni ostr�m no�em.
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

