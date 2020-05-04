
instance DIA_ENGOR_EXIT(C_INFO)
{
	npc = vlk_4108_engor;
	nr = 999;
	condition = dia_engor_exit_condition;
	information = dia_engor_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_engor_exit_condition()
{
	return TRUE;
};

func void dia_engor_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ENGOR_HALLO(C_INFO)
{
	npc = vlk_4108_engor;
	nr = 2;
	condition = dia_engor_hallo_condition;
	information = dia_engor_hallo_info;
	important = TRUE;
};


func int dia_engor_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_engor_hallo_info()
{
	AI_Output(self,other,"DIA_Engor_HALLO_13_00");	//Ah, ty jsi ten chlap�k, kter� p�e�il cestu pr�smykem.
	AI_Output(other,self,"DIA_Engor_HALLO_15_01");	//Ano.
	AI_Output(self,other,"DIA_Engor_HALLO_13_02");	//V�born�. J� jsem Engor - m�m na starosti z�sobov�n�.
	AI_Output(self,other,"DIA_Engor_HALLO_13_03");	//Jen si nemysli, �e ti d�m n�co zadarmo!
	AI_Output(self,other,"DIA_Engor_HALLO_13_04");	//Ale pokud m� po kaps�ch zlato, jsem v�dy ochoten uzav��t obchod.
	Log_CreateTopic(TOPIC_TRADER_OC,LOG_NOTE);
	b_logentry(TOPIC_TRADER_OC,"Engor se star� o z�sobov�n� hradu a bokem taky trochu obchoduje.");
};


instance DIA_ENGOR_HANDELN(C_INFO)
{
	npc = vlk_4108_engor;
	nr = 10;
	condition = dia_engor_handeln_condition;
	information = dia_engor_handeln_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Uka� mi sv� zbo��.";
};


func int dia_engor_handeln_condition()
{
	if(Npc_KnowsInfo(hero,dia_engor_hallo))
	{
		return TRUE;
	};
};

func void dia_engor_handeln_info()
{
	var int mcbolzenamount;
	var int mcarrowamount;
	b_givetradeinv(self);
	Npc_RemoveInvItems(self,itrw_bolt,Npc_HasItems(self,itrw_bolt));
	mcbolzenamount = KAPITEL * 50;
	CreateInvItems(self,itrw_bolt,mcbolzenamount);
	Npc_RemoveInvItems(self,itrw_arrow,Npc_HasItems(self,itrw_arrow));
	mcarrowamount = KAPITEL * 50;
	CreateInvItems(self,itrw_arrow,mcarrowamount);
	AI_Output(other,self,"DIA_Engor_HANDELN_15_00");	//Uka� mi sv� zbo��.
};


instance DIA_ENGOR_ABOUTPARLAF(C_INFO)
{
	npc = vlk_4108_engor;
	nr = 2;
	condition = dia_engor_aboutparlaf_condition;
	information = dia_engor_aboutparlaf_info;
	description = "Ty jsi jedin�, kter� vyd�v� potraviny, nem�l�m-li se.";
};


func int dia_engor_aboutparlaf_condition()
{
	if(Npc_KnowsInfo(hero,dia_parlaf_engor))
	{
		return TRUE;
	};
};

func void dia_engor_aboutparlaf_info()
{
	AI_Output(other,self,"DIA_Engor_ABOUTPARLAF_15_00");	//Ty jsi jedin�, kter� vyd�v� potraviny, nem�l�m-li se.
	AI_Output(self,other,"DIA_Engor_ABOUTPARLAF_13_01");	//To je pravda. Pro�? M�m t� te� taky nakrmit?
	AI_Output(self,other,"DIA_Engor_ABOUTPARLAF_13_02");	//Pokud n�co chce�, zaplat� za to - stejn� jako v�ichni ostatn�.
};


instance DIA_ENGOR_RUESTUNG(C_INFO)
{
	npc = vlk_4108_engor;
	nr = 2;
	condition = dia_engor_ruestung_condition;
	information = dia_engor_ruestung_info;
	permanent = FALSE;
	description = "M� pro m� n�co zaj�mav�ho?";
};


func int dia_engor_ruestung_condition()
{
	if(other.guild == GIL_MIL)
	{
		return TRUE;
	};
};

func void dia_engor_ruestung_info()
{
	AI_Output(other,self,"DIA_Engor_Ruestung_15_00");	//M� pro m� n�co zaj�mav�ho?
	AI_Output(self,other,"DIA_Engor_Ruestung_13_01");	//M��u ti sehnat lep�� brn�n� - t�k� brn�n� domobrany, pokud m� z�jem.
	AI_Output(self,other,"DIA_Engor_Ruestung_13_02");	//Samoz�ejm� to nen� levn�. Tak se�e� zlato a j� ti d�m brn�n�.
};


instance DIA_ENGOR_RSKAUFEN(C_INFO)
{
	npc = vlk_4108_engor;
	nr = 2;
	condition = dia_engor_rskaufen_condition;
	information = dia_engor_rskaufen_info;
	permanent = TRUE;
	description = "Koupit si t�kou zbroj domobrany (Obrana: zbran� 70, ��py 70 (2500 zla��k�).";
};


var int dia_engor_rskaufen_perm;

func int dia_engor_rskaufen_condition()
{
	if((other.guild == GIL_MIL) && Npc_KnowsInfo(other,dia_engor_ruestung) && (DIA_ENGOR_RSKAUFEN_PERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_engor_rskaufen_info()
{
	if(b_giveinvitems(other,self,itmi_gold,2500))
	{
		AI_Output(other,self,"DIA_Engor_RSkaufen_15_00");	//Dej mi to brn�n�.
		AI_Output(self,other,"DIA_Engor_RSkaufen_13_01");	//Tady ho m�, dob�e t� ochr�n� - je to zatracen� dobr� pr�ce.
		b_giveinvitems(self,other,itar_mil_m,1);
		DIA_ENGOR_RSKAUFEN_PERM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Engor_RSkaufen_13_02");	//Nejd��ve se�e� zlato.
	};
};


instance DIA_ENGOR_HELP(C_INFO)
{
	npc = vlk_4108_engor;
	nr = 3;
	condition = dia_engor_help_condition;
	information = dia_engor_help_info;
	description = "Mo�n� ti m��u pomoci v tv� pr�ci.";
};


func int dia_engor_help_condition()
{
	if(Npc_KnowsInfo(hero,dia_engor_aboutparlaf))
	{
		return TRUE;
	};
};

func void dia_engor_help_info()
{
	AI_Output(other,self,"DIA_Engor_HELP_15_00");	//Mo�n� ti m��u pomoci v tv� pr�ci.
	AI_Output(self,other,"DIA_Engor_HELP_13_01");	//Hmm .. Jist�, pro� ne? Pot�eboval bych pomoc.
	AI_Output(other,self,"DIA_Engor_HELP_15_02");	//Tak, co je t�eba ud�lat?
	AI_Output(self,other,"DIA_Engor_HELP_13_03");	//Na�e z�soby j�dla jsou mal�. P�edev��m jsme t�m�� bez masa.
	AI_Output(self,other,"DIA_Engor_HELP_13_04");	//Tak pokud m��e� sehnat n�jak� maso, syrov� nebo va�en�, �unku nebo klob�sky, bylo by to kvitov�no s velk�m povd�kem. Co tomu ��k�, pom��e� n�m?
	Info_ClearChoices(dia_engor_help);
	Info_AddChoice(dia_engor_help,"Na to nem�m �as.",dia_engor_help_no);
	Info_AddChoice(dia_engor_help,"Nem�j strach, n�jak� maso se�enu.",dia_engor_help_yes);
};

func void dia_engor_help_no()
{
	AI_Output(other,self,"DIA_Engor_HELP_NO_15_00");	//Na to nem�m �as.
	AI_Output(self,other,"DIA_Engor_HELP_NO_13_01");	//Tak pro� mrh� t�m m�m?
	MIS_ENGOR_BRINGMEAT = LOG_OBSOLETE;
	AI_StopProcessInfos(self);
};

func void dia_engor_help_yes()
{
	AI_Output(other,self,"DIA_Engor_HELP_YES_15_00");	//Nem�j strach, n�jak� maso se�enu.
	AI_Output(self,other,"DIA_Engor_HELP_YES_13_01");	//Asi dva tucty po��dn�ch kus� masa by mi pomohlo nasytit nejm�n� sto hladov�ch krk�. Vra� se, a� bude� m�t maso. Te� se mus�m vr�tit ke sv� pr�ci.
	Log_CreateTopic(TOPIC_BRINGMEAT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BRINGMEAT,LOG_RUNNING);
	b_logentry(TOPIC_BRINGMEAT,"Engor pot�ebuje dva tucty porc� masa, aby mohl z�sobit sv� mu�e.");
	b_logentry(TOPIC_BRINGMEAT,"Nevad�, p�jde-li o klob�sy, �unku, pe�en� �i syrov� maso. Jenom aby chlapi m�li co zakousnout.");
	MIS_ENGOR_BRINGMEAT = LOG_RUNNING;
	AI_StopProcessInfos(self);
};


instance DIA_ENGOR_BRINGMEAT(C_INFO)
{
	npc = vlk_4108_engor;
	nr = 4;
	condition = dia_engor_bringmeat_condition;
	information = dia_engor_bringmeat_info;
	permanent = TRUE;
	description = "Tum�, n�co jsem ti koupil (p�edat maso)..";
};


func int dia_engor_bringmeat_condition()
{
	if((MIS_ENGOR_BRINGMEAT == LOG_RUNNING) && (MEAT_COUNTER < MEAT_AMOUNT) && ((Npc_HasItems(hero,itfo_bacon) >= 1) || (Npc_HasItems(hero,itfomuttonraw) >= 1) || (Npc_HasItems(hero,itfomutton) >= 1) || (Npc_HasItems(hero,itfo_sausage) >= 1)))
	{
		return TRUE;
	};
};

func void dia_engor_bringmeat_info()
{
	var string concatraw;
	var string concatmutton;
	var string concatbacon;
	var string concatsausage;
	var string gesamtfleisch;
	AI_Output(other,self,"DIA_Engor_BRINGMEAT_15_00");	//Tady, n�co jsem ti sehnal.
	if(Npc_HasItems(hero,itfomuttonraw) >= 1)
	{
		if((Npc_HasItems(hero,itfomuttonraw) >= MEAT_AMOUNT) && (MEAT_COUNTER < MEAT_AMOUNT))
		{
			b_giveinvitems(hero,self,itfomuttonraw,MEAT_AMOUNT - MEAT_COUNTER);
			MEAT_COUNTER = MEAT_COUNTER + (MEAT_AMOUNT - MEAT_COUNTER);
		}
		else if((Npc_HasItems(hero,itfomuttonraw) < MEAT_AMOUNT) && (MEAT_COUNTER < MEAT_AMOUNT))
		{
			MEAT_COUNTER = MEAT_COUNTER + Npc_HasItems(hero,itfomuttonraw);
			concatraw = IntToString(Npc_HasItems(other,itfomuttonraw));
			concatraw = ConcatStrings(concatraw,"(D�t syrov� maso)");
			AI_PrintScreen(concatraw,-1,35,FONT_SCREENSMALL,2);
			Npc_RemoveInvItems(other,itfomuttonraw,Npc_HasItems(other,itfomuttonraw));
		};
	};
	if(Npc_HasItems(hero,itfomutton) >= 1)
	{
		if((Npc_HasItems(hero,itfomutton) >= MEAT_AMOUNT) && (MEAT_COUNTER < MEAT_AMOUNT))
		{
			b_giveinvitems(hero,self,itfomutton,MEAT_AMOUNT - MEAT_COUNTER);
			MEAT_COUNTER = MEAT_COUNTER + (MEAT_AMOUNT - MEAT_COUNTER);
		}
		else if((Npc_HasItems(hero,itfomutton) < MEAT_AMOUNT) && (MEAT_COUNTER < MEAT_AMOUNT))
		{
			MEAT_COUNTER = MEAT_COUNTER + Npc_HasItems(hero,itfomutton);
			concatmutton = IntToString(Npc_HasItems(other,itfomutton));
			concatmutton = ConcatStrings(concatmutton,"(D�t ope�en� maso)");
			AI_PrintScreen(concatmutton,-1,38,FONT_SCREENSMALL,2);
			Npc_RemoveInvItems(other,itfomutton,Npc_HasItems(other,itfomutton));
		};
	};
	if(Npc_HasItems(hero,itfo_bacon) >= 1)
	{
		if((Npc_HasItems(hero,itfo_bacon) >= MEAT_AMOUNT) && (MEAT_COUNTER < MEAT_AMOUNT))
		{
			b_giveinvitems(hero,self,itfo_bacon,MEAT_AMOUNT - MEAT_COUNTER);
			MEAT_COUNTER = MEAT_COUNTER + (MEAT_AMOUNT - MEAT_COUNTER);
		}
		else if((Npc_HasItems(hero,itfo_bacon) < MEAT_AMOUNT) && (MEAT_COUNTER < MEAT_AMOUNT))
		{
			MEAT_COUNTER = MEAT_COUNTER + Npc_HasItems(hero,itfo_bacon);
			concatbacon = IntToString(Npc_HasItems(other,itfo_bacon));
			concatbacon = ConcatStrings(concatbacon,"(d�t �unku)");
			AI_PrintScreen(concatbacon,-1,41,FONT_SCREENSMALL,3);
			Npc_RemoveInvItems(other,itfo_bacon,Npc_HasItems(other,itfo_bacon));
		};
	};
	if(Npc_HasItems(hero,itfo_sausage) >= 1)
	{
		if((Npc_HasItems(hero,itfo_sausage) >= MEAT_AMOUNT) && (MEAT_COUNTER < MEAT_AMOUNT))
		{
			b_giveinvitems(hero,self,itfo_sausage,MEAT_AMOUNT - MEAT_COUNTER);
			MEAT_COUNTER = MEAT_COUNTER + (MEAT_AMOUNT - MEAT_COUNTER);
		}
		else if((Npc_HasItems(hero,itfo_sausage) < MEAT_AMOUNT) && (MEAT_COUNTER < MEAT_AMOUNT))
		{
			MEAT_COUNTER = MEAT_COUNTER + Npc_HasItems(hero,itfo_sausage);
			concatsausage = IntToString(Npc_HasItems(other,itfo_sausage));
			concatsausage = ConcatStrings(concatsausage,"(d�t klob�su)");
			AI_PrintScreen(concatsausage,-1,44,FONT_SCREENSMALL,3);
			Npc_RemoveInvItems(other,itfo_sausage,Npc_HasItems(other,itfo_sausage));
		};
	};
	if(MEAT_AMOUNT > MEAT_COUNTER)
	{
		AI_Output(self,other,"DIA_Engor_BRINGMEAT_13_01");	//Pro za��tek to nen� �patn�, ale pot�ebuji toho v�c.
		gesamtfleisch = IntToString(MEAT_COUNTER);
		gesamtfleisch = ConcatStrings("(d�t sm�s r�zn�ho masa)",gesamtfleisch);
		AI_PrintScreen(gesamtfleisch,-1,48,FONT_SCREENSMALL,3);
	};
	if(MEAT_COUNTER >= MEAT_AMOUNT)
	{
		AI_Output(self,other,"DIA_Engor_BRINGMEAT_13_02");	//V�born�, p�inesl jsi dostatek masa. N�jakou dobu to vydr��.
		AI_Output(self,other,"DIA_Engor_BRINGMEAT_13_03");	//Ale nemysli si, �e ti d�m n�co zadarmo!
		MIS_ENGOR_BRINGMEAT = LOG_SUCCESS;
		b_giveplayerxp(XP_BRINGMEAT);
		Log_AddEntry(TOPIC_BRINGMEAT,"Engor u� dostal maso a postar� se, aby si je ostatn� mezi sebou spravedliv� rozd�lili.");
	};
};


instance DIA_ENGOR_BUSINESS(C_INFO)
{
	npc = vlk_4108_engor;
	nr = 1;
	condition = dia_engor_business_condition;
	information = dia_engor_business_info;
	permanent = FALSE;
	description = "Jak jdou obchody?";
};


func int dia_engor_business_condition()
{
	if((KAPITEL >= 4) && (MIS_ENGOR_BRINGMEAT == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_engor_business_info()
{
	AI_Output(other,self,"DIA_Engor_Business_15_00");	//Jak jdou obchody?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Engor_Business_13_01");	//Jen tak tak. Douf�m, �e drakobijci maj� tolik zlata, jako kec�.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Engor_Business_13_02");	//V�iv�ci! Paladinov� pr�v� te� nic nekupuj�.
	};
	AI_Output(self,other,"DIA_Engor_Business_13_03");	//Co ty, vybral sis n�co?
};


instance DIA_ENGOR_PICKPOCKET(C_INFO)
{
	npc = vlk_4108_engor;
	nr = 900;
	condition = dia_engor_pickpocket_condition;
	information = dia_engor_pickpocket_info;
	permanent = TRUE;
	description = "(Kr�de� t�to mapy by byla riskantn�.)";
};


func int dia_engor_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itwr_map_oldworld) >= 1) && (other.attribute[ATR_DEXTERITY] >= (40 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_engor_pickpocket_info()
{
	Info_ClearChoices(dia_engor_pickpocket);
	Info_AddChoice(dia_engor_pickpocket,DIALOG_BACK,dia_engor_pickpocket_back);
	Info_AddChoice(dia_engor_pickpocket,DIALOG_PICKPOCKET,dia_engor_pickpocket_doit);
};

func void dia_engor_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 40)
	{
		b_giveinvitems(self,other,itwr_map_oldworld,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_giveplayerxp(XP_AMBIENT);
		Info_ClearChoices(dia_engor_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_engor_pickpocket_back()
{
	Info_ClearChoices(dia_engor_pickpocket);
};

