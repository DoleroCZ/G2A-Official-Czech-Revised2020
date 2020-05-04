
instance DIA_HALVOR_EXIT(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 999;
	condition = dia_halvor_exit_condition;
	information = dia_halvor_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_halvor_exit_condition()
{
	return TRUE;
};

func void dia_halvor_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HALVOR_PICKPOCKET(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 900;
	condition = dia_halvor_pickpocket_condition;
	information = dia_halvor_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_halvor_pickpocket_condition()
{
	return c_beklauen(78,150);
};

func void dia_halvor_pickpocket_info()
{
	Info_ClearChoices(dia_halvor_pickpocket);
	Info_AddChoice(dia_halvor_pickpocket,DIALOG_BACK,dia_halvor_pickpocket_back);
	Info_AddChoice(dia_halvor_pickpocket,DIALOG_PICKPOCKET,dia_halvor_pickpocket_doit);
};

func void dia_halvor_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_halvor_pickpocket);
};

func void dia_halvor_pickpocket_back()
{
	Info_ClearChoices(dia_halvor_pickpocket);
};


instance DIA_HALVOR_HALLO(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 2;
	condition = dia_halvor_hallo_condition;
	information = dia_halvor_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_halvor_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && Wld_IsTime(5,0,20,0))
	{
		return TRUE;
	};
};

func void dia_halvor_hallo_info()
{
	AI_Output(self,other,"DIA_Halvor_Hallo_06_00");	//Hej, nepot�ebuje� n�jak� ryby? Vyber si tady, �erstv�, p��mo z mo�sk�ch hlubin!
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Halvor prod�v� v p��stavu ryby.");
};


instance DIA_HALVOR_TRADE(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 2;
	condition = dia_halvor_trade_condition;
	information = dia_halvor_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Uka� mi sv� ryby.";
};


func int dia_halvor_trade_condition()
{
	if(Npc_KnowsInfo(hero,dia_halvor_hallo) && Wld_IsTime(5,0,20,0) && (HALVOR_AUSGELIEFERT == FALSE))
	{
		return TRUE;
	};
};

func void dia_halvor_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Halvor_TRADE_15_00");	//Uka� mi sv� ryby.
};


instance DIA_HALVOR_NIGHT(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 2;
	condition = dia_halvor_night_condition;
	information = dia_halvor_night_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_halvor_night_condition()
{
	if(Wld_IsTime(20,0,0,0) && Npc_IsInState(self,zs_talk) && (HALVOR_AUSGELIEFERT == FALSE))
	{
		return TRUE;
	};
};

func void dia_halvor_night_info()
{
	AI_Output(self,other,"DIA_Halvor_Night_06_00");	//Hej, jestli m� z�jem o m� ryby, p�ij� do m�ho st�nku z�tra, dobr�?
};


instance DIA_ADDON_HALVOR_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 5;
	condition = dia_addon_halvor_missingpeople_condition;
	information = dia_addon_halvor_missingpeople_info;
	description = "�ekl bys mi n�co o ztracen�ch lidech, tedy pokud o tom n�co v�?";
};


func int dia_addon_halvor_missingpeople_condition()
{
	if((SC_HEAREDABOUTMISSINGPEOPLE == TRUE) && (MISSINGPEOPLERETURNEDHOME == FALSE) && (HALVOR_AUSGELIEFERT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_halvor_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Halvor_MissingPeople_15_00");	//�ekl bys mi n�co o ztracen�ch lidech, tedy pokud o tom n�co v�?
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_06_01");	//Ztracen� lid�? Chlape, tohle je p��stavi�t�. Jak asi v�, n�kdo se tu ob�as ztrat�.
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_06_02");	//Mo�e se s nik�m nepatl�. Je to tak, bu� je n�jakej ten �tes nebo mo�sk� obluda a hned je koho hledat.
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_06_03");	//Ale ztratil se tak� kapit�n, kter� naj�mal pos�dku do velk� lodi kotv�c� tady v Khorinisu.
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_06_04");	//A kdy� u� nebyli dobrovoln�ci vyplul, po chv�li se n�co stalo a po lodi ani vidu ani slechu.
	Info_ClearChoices(dia_addon_halvor_missingpeople);
	Info_AddChoice(dia_addon_halvor_missingpeople,DIALOG_BACK,dia_addon_halvor_missingpeople_back);
	Info_AddChoice(dia_addon_halvor_missingpeople,"Jak� lo� to byla?",dia_addon_halvor_missingpeople_schiff);
	Info_AddChoice(dia_addon_halvor_missingpeople,"V� n�co o lidech, kte�� zmizeli?",dia_addon_halvor_missingpeople_wer);
	Info_AddChoice(dia_addon_halvor_missingpeople,"A TY postr�d� n�koho?",dia_addon_halvor_missingpeople_you);
};

func void dia_addon_halvor_missingpeople_back()
{
	Info_ClearChoices(dia_addon_halvor_missingpeople);
};

func void dia_addon_halvor_missingpeople_wer()
{
	AI_Output(other,self,"DIA_Addon_Halvor_MissingPeople_wer_15_00");	//V� n�co o lidech, kte�� zmizeli?
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_wer_06_01");	//Nic moc. Zkus se zeptat ryb���.
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Halvorovi nen� moc do �e�i, proto m� poslal k ryb���m.");
};

func void dia_addon_halvor_missingpeople_schiff()
{
	AI_Output(other,self,"DIA_Addon_Halvor_MissingPeople_schiff_15_00");	//Jak� lo� to byla?
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_schiff_06_01");	//Dobr� ot�zka. Dlouho tu ��dn� lod� nebyly.
};

func void dia_addon_halvor_missingpeople_you()
{
	AI_Output(other,self,"DIA_Addon_Halvor_MissingPeople_you_15_00");	//A TY postr�d� n�koho?
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_you_06_01");	//J�? Ne.
};


instance DIA_HALVOR_MESSAGE(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 2;
	condition = dia_halvor_message_condition;
	information = dia_halvor_message_info;
	permanent = FALSE;
	description = "M�m dojem, �e tenhle kousek pap�ru pat�� tob�.";
	trade = FALSE;
};


func int dia_halvor_message_condition()
{
	if(KNOWS_HALVOR == TRUE)
	{
		return TRUE;
	};
};

func void dia_halvor_message_info()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_15_00");	//M�m dojem, �e tenhle kousek pap�ru pat�� tob�.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_06_01");	//Co...? Uka�, pod�v�m se.
	b_usefakescroll();
	AI_Output(self,other,"DIA_Halvor_MESSAGE_06_02");	//(pot� se) Ehm... Dobr�, nikomu o tom ani muk - ehm... poslouchej. Mus�m se zbavit zbo��, co jsem z�skal od bandit�.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_06_03");	//(usp�chan�) Ale nen� ��dn� d�vod j�t p��mo za domobranou, jasn�? Jsem si jist, �e se n�jak dohodneme, co?
	Info_ClearChoices(dia_halvor_message);
	Info_AddChoice(dia_halvor_message,"Tak to mi ud�lej nab�dku.",dia_halvor_message_offer);
	Info_AddChoice(dia_halvor_message,"Vypad� to, �e pat�� do basy.",dia_halvor_message_prison);
};

func void dia_halvor_message_offer()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_OFFER_15_00");	//Tak to mi ud�lej nab�dku.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_OFFER_06_01");	//Dobr�. N�co ti pov�m. Prod�v�m v�c ne� jen ryby.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_OFFER_06_03");	//Kdy� mi d� ten sm�n� kousek pap�ru a, ehm... zapomene� na tu v�c, m��eme se st�t obchodn�mi partnery.
	Info_ClearChoices(dia_halvor_message);
	Info_AddChoice(dia_halvor_message,"Dobr�, ujedn�no.",dia_halvor_message_okay);
	Info_AddChoice(dia_halvor_message,"Vypad� to, �e pat�� do basy.",dia_halvor_message_prison);
	Info_AddChoice(dia_halvor_message,"V�n�? Co by to tak mohlo b�t za zbo��?",dia_halvor_message_deal);
};

func void dia_halvor_message_prison()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_PRISON_15_00");	//Vypad� to, �e pat�� do basy.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_PRISON_06_01");	//Ne, po�kej, to nem��e� ud�lat! V�dy� p�ece nejsem, v�dy� v�... nic jin�ho ne� mal� ryba.
	AI_Output(other,self,"DIA_Halvor_MESSAGE_PRISON_15_02");	//To sis m�l rozmyslet d��v. Te� m�m v �myslu t� nahl�sit lordu Andremu.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_PRISON_06_03");	//Toho bude� litovat.
	BETRAYAL_HALVOR = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_halvor_message_deal()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_DEAL_15_00");	//V�n�? Co by to tak mohlo b�t za zbo��?
	AI_Output(self,other,"DIA_Halvor_MESSAGE_DEAL_06_01");	//Dobr�, m��u ti nab�dnout docela zvl�tn� ryby, v�ak v�. Ne jenom ty oby�ejn�, co se jed�.
	AI_Output(other,self,"DIA_Halvor_MESSAGE_DEAL_15_02");	//M� na mysli takov�, ve kter�ch jsou ukryt� tv� tajn� zpr�vy?
	AI_Output(self,other,"DIA_Halvor_MESSAGE_DEAL_06_03");	//Jo, trefils. M�m p�r takov�ch... rybek.
};

func void dia_halvor_message_okay()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_Okay_15_00");	//Dobr�, dohodnuto. Nech�me si to mal� tajemstv� pro sebe.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_Okay_06_01");	//D�ky. Zase se zastav, a� bude� pobl�. Ur�it� pro tebe budu m�t n�co zaj�mav�ho.
	b_giveinvitems(other,self,itwr_halvormessage,1);
	Npc_RemoveInvItems(self,itwr_halvormessage,1);
	HALVOR_DEAL = TRUE;
	DIEBESGILDE_OKAY = DIEBESGILDE_OKAY + 1;
	CreateInvItems(self,itse_erzfisch,1);
	CreateInvItems(self,itse_goldfisch,1);
	CreateInvItems(self,itse_ringfisch,1);
	CreateInvItems(self,itse_lockpickfisch,1);
	Info_ClearChoices(dia_halvor_message);
};


instance DIA_HALVOR_ZEICHEN(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 2;
	condition = dia_halvor_zeichen_condition;
	information = dia_halvor_zeichen_info;
	permanent = FALSE;
	description = "(P�edv�st zlod�jsk� sign�l.)";
};


func int dia_halvor_zeichen_condition()
{
	if((KNOWS_SECRETSIGN == TRUE) && (BETRAYAL_HALVOR == FALSE))
	{
		return TRUE;
	};
};

func void dia_halvor_zeichen_info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Halvor_Zeichen_06_00");	//V�m. Nep�i�el jsi jen nakupovat ryby.
	AI_Output(self,other,"DIA_Halvor_Zeichen_06_01");	//(potichu) Ud�l�m ti nab�dku. Jestli m� n�jak� st��brn� t�cy nebo poh�ry, vezmu si je od tebe za dobrou cenu.
	CreateInvItems(self,itke_lockpick,20);
	Log_CreateTopic(TOPIC_DIEBESGILDE,LOG_NOTE);
	b_logentry(TOPIC_DIEBESGILDE,"Halvor nakupuje st��brn� tal��e a kalichy za daleko lep�� cenu ne� ostatn� obchodn�ci.");
};


instance DIA_HALVOR_HEHLEREI(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 2;
	condition = dia_halvor_hehlerei_condition;
	information = dia_halvor_hehlerei_info;
	permanent = TRUE;
	description = "(Prodat star� tall��e a kalichy.)";
};


func int dia_halvor_hehlerei_condition()
{
	if(Npc_KnowsInfo(other,dia_halvor_zeichen) && (BETRAYAL_HALVOR == FALSE))
	{
		return TRUE;
	};
};

func void dia_halvor_hehlerei_info()
{
	HALVOR_SCORE = 0;
	if(HALVOR_DAY != Wld_GetDay())
	{
		if((Npc_HasItems(other,itmi_silverplate) >= 1) || (Npc_HasItems(other,itmi_silvercup) >= 1))
		{
			HALVOR_SCORE = (Npc_HasItems(other,itmi_silverplate) * (VALUE_SILVERPLATE / 2)) + (Npc_HasItems(other,itmi_silvercup) * (VALUE_SILVERCUP / 2));
			if(HALVOR_SCORE <= 1000)
			{
				AI_Output(self,other,"DIA_Halvor_Zeichen_06_05");	//Za v�echno, co m�, ti d�m...
				b_say_gold(self,other,HALVOR_SCORE);
				Info_ClearChoices(dia_halvor_hehlerei);
				Info_AddChoice(dia_halvor_hehlerei,"Dobr�, prod�no.",dia_halvor_hehlerei_annehmen);
				Info_AddChoice(dia_halvor_hehlerei,"Budu o tom p�em��let.",dia_halvor_hehlerei_ablehnen);
			}
			else
			{
				AI_Output(self,other,"DIA_Halvor_Zeichen_06_06");	//P�inesl jsi moc zbo��. Nem��u ti d�t tolik zlata nejednou.
				Info_ClearChoices(dia_halvor_hehlerei);
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Halvor_Zeichen_06_02");	//Vra� se, a� bude� m�t n�jak� st��brn� podnosy nebo poh�ry.
			Info_ClearChoices(dia_halvor_hehlerei);
		};
	}
	else if(Wld_GetDay() == 0)
	{
		AI_Output(self,other,"DIA_Halvor_Zeichen_06_03");	//M��e� se toho st��bra zbavit z�tra. Dneska je moc brzo.
	}
	else
	{
		AI_Output(self,other,"DIA_Halvor_Zeichen_06_04");	//Promi�, dneska u� ��dn� obchody. Vra� se z�tra, dobr�?
	};
};

func void dia_halvor_hehlerei_annehmen()
{
	var int amount;
	var string concattext;
	amount = Npc_HasItems(other,itmi_silverplate) + Npc_HasItems(other,itmi_silvercup);
	concattext = ConcatStrings(IntToString(amount),PRINT_ITEMSGEGEBEN);
	AI_PrintScreen(concattext,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
	Npc_RemoveInvItems(other,itmi_silvercup,Npc_HasItems(other,itmi_silvercup));
	Npc_RemoveInvItems(other,itmi_silverplate,Npc_HasItems(other,itmi_silverplate));
	b_giveinvitems(self,other,itmi_gold,HALVOR_SCORE);
	AI_Output(other,self,"DIA_Halvor_Zeichen_Annehmen_15_00");	//Dobr�, prod�no.
	AI_Output(self,other,"DIA_Halvor_Zeichen_Annehmen_06_01");	//Ud�lali jsme dneska dobrej k�eft. Lep�� to bude nejd��v z�tra, jinak by n�kdo mohl dostat podez�en�, v�ak v�.
	HALVOR_DAY = Wld_GetDay();
	Info_ClearChoices(dia_halvor_hehlerei);
};

func void dia_halvor_hehlerei_ablehnen()
{
	Info_ClearChoices(dia_halvor_hehlerei);
};


instance DIA_HALVOR_CREW(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 51;
	condition = dia_halvor_crew_condition;
	information = dia_halvor_crew_info;
	permanent = FALSE;
	description = "Sh�n�m pos�dku.";
};


func int dia_halvor_crew_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (HALVOR_AUSGELIEFERT == FALSE))
	{
		return TRUE;
	};
};

func void dia_halvor_crew_info()
{
	AI_Output(other,self,"DIA_Halvor_Crew_15_00");	//Sh�n�m pos�dku.
	AI_Output(self,other,"DIA_Halvor_Crew_06_01");	//Ale jak se chce� odsud dostat?
	Info_ClearChoices(dia_halvor_crew);
	Info_AddChoice(dia_halvor_crew,"To je �ist� moje v�c.",dia_halvor_crew_mything);
	Info_AddChoice(dia_halvor_crew,"Hodl�m z�skat lo�.",dia_halvor_crew_stealship);
};

func void dia_halvor_crew_mything()
{
	AI_Output(other,self,"DIA_Halvor_Crew_MyThing_15_00");	//To je �ist� moje v�c.
	AI_Output(self,other,"DIA_Halvor_Crew_MyThing_06_01");	//Jak je libo. To opravdu nen� moje v�c.
	Info_ClearChoices(dia_halvor_crew);
	Info_AddChoice(dia_halvor_crew,DIALOG_BACK,dia_halvor_crew_back);
	Info_AddChoice(dia_halvor_crew,"Tak jde� do toho?",dia_halvor_crew_joinme);
	Info_AddChoice(dia_halvor_crew,"M��e� mi pomoct?",dia_halvor_crew_helpme);
};

func void dia_halvor_crew_stealship()
{
	AI_Output(other,self,"DIA_Halvor_Crew_StealShip_15_00");	//Hodl�m z�skat lo�.
	AI_Output(self,other,"DIA_Halvor_Crew_StealShip_06_01");	//Jo, jasn�. Jinak se� zdravej? Paladinov� s tebou ud�laj kr�tkej proces, a� na to p�ijdou.
	AI_Output(self,other,"DIA_Halvor_Crew_StealShip_06_02");	//Jak je libo - neriskuje� m�j �ivot.
	Info_ClearChoices(dia_halvor_crew);
	Info_AddChoice(dia_halvor_crew,DIALOG_BACK,dia_halvor_crew_back);
	Info_AddChoice(dia_halvor_crew,"Tak jde� do toho?",dia_halvor_crew_joinme);
	if(Npc_IsDead(jack) == FALSE)
	{
		Info_AddChoice(dia_halvor_crew,"M��e� mi pomoct?",dia_halvor_crew_helpme);
	};
};

func void dia_halvor_crew_joinme()
{
	AI_Output(other,self,"DIA_Halvor_Crew_JoinMe_15_00");	//Tak jde� do toho?
	AI_Output(self,other,"DIA_Halvor_Crew_JoinMe_06_01");	//Ne, m�m dojem, �e ne. M�m tady spoustu pr�ce a up��mn�, netou��m zrovna po tom, abych potkal otrok��skou gal�ru plnou sk�et�.
	AI_Output(self,other,"DIA_Halvor_Crew_JoinMe_06_02");	//Ale p�eju ti hodn� �t�st�.
};

func void dia_halvor_crew_helpme()
{
	AI_Output(other,self,"DIA_Halvor_Crew_HelpMe_15_00");	//M��e� mi pomoct?
	AI_Output(self,other,"DIA_Halvor_Crew_HelpMe_06_01");	//J� na tohle nejsem ten pravej �lov�k. Ale zajdi si promluvit s Jackem. M�l by se poflakovat n�kde tady po p��stavu. On bude v�d�t nejl�p, co na tu plavbu bude� pot�ebovat.
};

func void dia_halvor_crew_back()
{
	Info_ClearChoices(dia_halvor_crew);
};

