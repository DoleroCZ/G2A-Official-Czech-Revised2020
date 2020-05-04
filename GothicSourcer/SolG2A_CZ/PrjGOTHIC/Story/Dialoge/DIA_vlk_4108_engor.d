
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
	AI_Output(self,other,"DIA_Engor_HALLO_13_00");	//Ah, ty jsi ten chlapík, kterı pøeil cestu prùsmykem.
	AI_Output(other,self,"DIA_Engor_HALLO_15_01");	//Ano.
	AI_Output(self,other,"DIA_Engor_HALLO_13_02");	//Vıbornì. Já jsem Engor - mám na starosti zásobování.
	AI_Output(self,other,"DIA_Engor_HALLO_13_03");	//Jen si nemysli, e ti dám nìco zadarmo!
	AI_Output(self,other,"DIA_Engor_HALLO_13_04");	//Ale pokud máš po kapsách zlato, jsem vdy ochoten uzavøít obchod.
	Log_CreateTopic(TOPIC_TRADER_OC,LOG_NOTE);
	b_logentry(TOPIC_TRADER_OC,"Engor se stará o zásobování hradu a bokem taky trochu obchoduje.");
};


instance DIA_ENGOR_HANDELN(C_INFO)
{
	npc = vlk_4108_engor;
	nr = 10;
	condition = dia_engor_handeln_condition;
	information = dia_engor_handeln_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Uka mi své zboí.";
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
	AI_Output(other,self,"DIA_Engor_HANDELN_15_00");	//Uka mi své zboí.
};


instance DIA_ENGOR_ABOUTPARLAF(C_INFO)
{
	npc = vlk_4108_engor;
	nr = 2;
	condition = dia_engor_aboutparlaf_condition;
	information = dia_engor_aboutparlaf_info;
	description = "Ty jsi jedinı, kterı vydává potraviny, nemılím-li se.";
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
	AI_Output(other,self,"DIA_Engor_ABOUTPARLAF_15_00");	//Ty jsi jedinı, kterı vydává potraviny, nemılím-li se.
	AI_Output(self,other,"DIA_Engor_ABOUTPARLAF_13_01");	//To je pravda. Proè? Mám tì teï taky nakrmit?
	AI_Output(self,other,"DIA_Engor_ABOUTPARLAF_13_02");	//Pokud nìco chceš, zaplatíš za to - stejnì jako všichni ostatní.
};


instance DIA_ENGOR_RUESTUNG(C_INFO)
{
	npc = vlk_4108_engor;
	nr = 2;
	condition = dia_engor_ruestung_condition;
	information = dia_engor_ruestung_info;
	permanent = FALSE;
	description = "Máš pro mì nìco zajímavého?";
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
	AI_Output(other,self,"DIA_Engor_Ruestung_15_00");	//Máš pro mì nìco zajímavého?
	AI_Output(self,other,"DIA_Engor_Ruestung_13_01");	//Mùu ti sehnat lepší brnìní - tìké brnìní domobrany, pokud máš zájem.
	AI_Output(self,other,"DIA_Engor_Ruestung_13_02");	//Samozøejmì to není levné. Tak seeò zlato a já ti dám brnìní.
};


instance DIA_ENGOR_RSKAUFEN(C_INFO)
{
	npc = vlk_4108_engor;
	nr = 2;
	condition = dia_engor_rskaufen_condition;
	information = dia_engor_rskaufen_info;
	permanent = TRUE;
	description = "Koupit si tìkou zbroj domobrany (Obrana: zbranì 70, šípy 70 (2500 zlaákù).";
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
		AI_Output(other,self,"DIA_Engor_RSkaufen_15_00");	//Dej mi to brnìní.
		AI_Output(self,other,"DIA_Engor_RSkaufen_13_01");	//Tady ho máš, dobøe tì ochrání - je to zatracenì dobrá práce.
		b_giveinvitems(self,other,itar_mil_m,1);
		DIA_ENGOR_RSKAUFEN_PERM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Engor_RSkaufen_13_02");	//Nejdøíve seeò zlato.
	};
};


instance DIA_ENGOR_HELP(C_INFO)
{
	npc = vlk_4108_engor;
	nr = 3;
	condition = dia_engor_help_condition;
	information = dia_engor_help_info;
	description = "Moná ti mùu pomoci v tvé práci.";
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
	AI_Output(other,self,"DIA_Engor_HELP_15_00");	//Moná ti mùu pomoci v tvé práci.
	AI_Output(self,other,"DIA_Engor_HELP_13_01");	//Hmm .. Jistì, proè ne? Potøeboval bych pomoc.
	AI_Output(other,self,"DIA_Engor_HELP_15_02");	//Tak, co je tøeba udìlat?
	AI_Output(self,other,"DIA_Engor_HELP_13_03");	//Naše zásoby jídla jsou malé. Pøedevším jsme témìø bez masa.
	AI_Output(self,other,"DIA_Engor_HELP_13_04");	//Tak pokud mùeš sehnat nìjaké maso, syrové nebo vaøené, šunku nebo klobásky, bylo by to kvitováno s velkım povdìkem. Co tomu øíkáš, pomùeš nám?
	Info_ClearChoices(dia_engor_help);
	Info_AddChoice(dia_engor_help,"Na to nemám èas.",dia_engor_help_no);
	Info_AddChoice(dia_engor_help,"Nemìj strach, nìjaké maso seenu.",dia_engor_help_yes);
};

func void dia_engor_help_no()
{
	AI_Output(other,self,"DIA_Engor_HELP_NO_15_00");	//Na to nemám èas.
	AI_Output(self,other,"DIA_Engor_HELP_NO_13_01");	//Tak proè mrháš tím mım?
	MIS_ENGOR_BRINGMEAT = LOG_OBSOLETE;
	AI_StopProcessInfos(self);
};

func void dia_engor_help_yes()
{
	AI_Output(other,self,"DIA_Engor_HELP_YES_15_00");	//Nemìj strach, nìjaké maso seenu.
	AI_Output(self,other,"DIA_Engor_HELP_YES_13_01");	//Asi dva tucty poøádnıch kusù masa by mi pomohlo nasytit nejménì sto hladovıch krkù. Vra se, a budeš mít maso. Teï se musím vrátit ke své práci.
	Log_CreateTopic(TOPIC_BRINGMEAT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BRINGMEAT,LOG_RUNNING);
	b_logentry(TOPIC_BRINGMEAT,"Engor potøebuje dva tucty porcí masa, aby mohl zásobit své mue.");
	b_logentry(TOPIC_BRINGMEAT,"Nevadí, pùjde-li o klobásy, šunku, peèené èi syrové maso. Jenom aby chlapi mìli co zakousnout.");
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
	description = "Tumáš, nìco jsem ti koupil (pøedat maso)..";
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
	AI_Output(other,self,"DIA_Engor_BRINGMEAT_15_00");	//Tady, nìco jsem ti sehnal.
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
			concatraw = ConcatStrings(concatraw,"(Dát syrové maso)");
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
			concatmutton = ConcatStrings(concatmutton,"(Dát opeèené maso)");
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
			concatbacon = ConcatStrings(concatbacon,"(dát šunku)");
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
			concatsausage = ConcatStrings(concatsausage,"(dát klobásu)");
			AI_PrintScreen(concatsausage,-1,44,FONT_SCREENSMALL,3);
			Npc_RemoveInvItems(other,itfo_sausage,Npc_HasItems(other,itfo_sausage));
		};
	};
	if(MEAT_AMOUNT > MEAT_COUNTER)
	{
		AI_Output(self,other,"DIA_Engor_BRINGMEAT_13_01");	//Pro zaèátek to není špatné, ale potøebuji toho víc.
		gesamtfleisch = IntToString(MEAT_COUNTER);
		gesamtfleisch = ConcatStrings("(dát smìs rùzného masa)",gesamtfleisch);
		AI_PrintScreen(gesamtfleisch,-1,48,FONT_SCREENSMALL,3);
	};
	if(MEAT_COUNTER >= MEAT_AMOUNT)
	{
		AI_Output(self,other,"DIA_Engor_BRINGMEAT_13_02");	//Vıbornì, pøinesl jsi dostatek masa. Nìjakou dobu to vydrí.
		AI_Output(self,other,"DIA_Engor_BRINGMEAT_13_03");	//Ale nemysli si, e ti dám nìco zadarmo!
		MIS_ENGOR_BRINGMEAT = LOG_SUCCESS;
		b_giveplayerxp(XP_BRINGMEAT);
		Log_AddEntry(TOPIC_BRINGMEAT,"Engor u dostal maso a postará se, aby si je ostatní mezi sebou spravedlivì rozdìlili.");
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
		AI_Output(self,other,"DIA_Engor_Business_13_01");	//Jen tak tak. Doufám, e drakobijci mají tolik zlata, jako kecù.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Engor_Business_13_02");	//Všiváci! Paladinové právì teï nic nekupují.
	};
	AI_Output(self,other,"DIA_Engor_Business_13_03");	//Co ty, vybral sis nìco?
};


instance DIA_ENGOR_PICKPOCKET(C_INFO)
{
	npc = vlk_4108_engor;
	nr = 900;
	condition = dia_engor_pickpocket_condition;
	information = dia_engor_pickpocket_info;
	permanent = TRUE;
	description = "(Kráde této mapy by byla riskantní.)";
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

