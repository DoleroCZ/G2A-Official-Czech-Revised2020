
instance DIA_ADDON_FARIM_EXIT(C_INFO)
{
	npc = vlk_4301_addon_farim;
	nr = 999;
	condition = dia_addon_farim_exit_condition;
	information = dia_addon_farim_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_farim_exit_condition()
{
	return TRUE;
};

func void dia_addon_farim_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_FARIM_PICKPOCKET(C_INFO)
{
	npc = vlk_4301_addon_farim;
	nr = 900;
	condition = dia_addon_farim_pickpocket_condition;
	information = dia_addon_farim_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_addon_farim_pickpocket_condition()
{
	return c_beklauen(20,11);
};

func void dia_addon_farim_pickpocket_info()
{
	Info_ClearChoices(dia_addon_farim_pickpocket);
	Info_AddChoice(dia_addon_farim_pickpocket,DIALOG_BACK,dia_addon_farim_pickpocket_back);
	Info_AddChoice(dia_addon_farim_pickpocket,DIALOG_PICKPOCKET,dia_addon_farim_pickpocket_doit);
};

func void dia_addon_farim_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_farim_pickpocket);
};

func void dia_addon_farim_pickpocket_back()
{
	Info_ClearChoices(dia_addon_farim_pickpocket);
};


instance DIA_ADDON_FARIM_HALLO(C_INFO)
{
	npc = vlk_4301_addon_farim;
	nr = 5;
	condition = dia_addon_farim_hallo_condition;
	information = dia_addon_farim_hallo_info;
	description = "Ty jsi rybáø?";
};


func int dia_addon_farim_hallo_condition()
{
	return TRUE;
};

func void dia_addon_farim_hallo_info()
{
	AI_Output(other,self,"DIA_Addon_Farim_Hallo_15_00");	//Ty jsi rybáø?
	AI_Output(self,other,"DIA_Addon_Farim_Hallo_11_01");	//(cynicky) Jak si to uhodl?
	AI_Output(self,other,"DIA_Addon_Farim_Hallo_11_02");	//Nemùžeš mì prostì nechat na pokoji?
	if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Addon_Farim_Landstreicher_Add_11_02");	//Nevykládej si to špatnì, ale já nemám domobranu moc v lásce.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Farim_Landstreicher_Add_11_03");	//Nevykládej si to špatnì, ale v poslední dobì mám špatnou náladu. Problémy s domobranou ...
	};
};


instance DIA_ADDON_FARIM_MILIZPROBS(C_INFO)
{
	npc = vlk_4301_addon_farim;
	nr = 5;
	condition = dia_addon_farim_milizprobs_condition;
	information = dia_addon_farim_milizprobs_info;
	description = "Problémy s domobranou?";
};


func int dia_addon_farim_milizprobs_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_farim_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_farim_milizprobs_info()
{
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_15_00");	//Problémy s domobranou?
	if(((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_01");	//Ti šmejdi sem prostì normálnì pøišli a vzali si, co chtìli.
	};
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_02");	//Minulý týden mi vzali celý úlovek. 'Je to pro dobrou vìc', øíkali.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_03");	//Vím, že se teï všichni musíme starat sami o sebe, ještì když farmáøi pøestali obchodovat.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_04");	//Nìkdy musím chodit spávat s prázdným žaludkem. Nezajímá je to. Seberou mi všechny ryby a já nemùžu nic dìlat.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_05");	//A pokud to tak pùjde dál, nebudu mít, co jíst.
	Info_ClearChoices(dia_addon_farim_milizprobs);
	Info_AddChoice(dia_addon_farim_milizprobs,"Dej mi všechny tvé ryby.",dia_addon_farim_milizprobs_klauen);
	Info_AddChoice(dia_addon_farim_milizprobs,"Možná bych ti mohl pomoci.",dia_addon_farim_milizprobs_helfen);
	Info_AddChoice(dia_addon_farim_milizprobs,"Mluvil jsi o tom s paladiny?",dia_addon_farim_milizprobs_paladine);
};

func void dia_addon_farim_milizprobs_paladine()
{
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_paladine_15_00");	//Mluvil jsi o tom s paladiny?
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_paladine_11_01");	//(smìje se) To si dìláš srandu? Myslíš, že je zajímá, že nìjaký chudák jako já má problém s domobranou?
};


var int farim_pissedoff;

func void dia_addon_farim_milizprobs_klauen()
{
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_klauen_15_00");	//Dej mi všechny tvé ryby.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_klauen_11_01");	//(naštvanì) Vìdìl jsem to. Další z tìch parchantù.
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_klauen_11_02");	//Ale myslím, že jdeš pozdì. Tvoji kámoši mi všechno vzali už vèera.
	};
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_klauen_11_04");	//Øekl bych, že bys mìl radši odejít.
	FARIM_PISSEDOFF = TRUE;
	Info_ClearChoices(dia_addon_farim_milizprobs);
};

func void dia_addon_farim_milizprobs_helfen()
{
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_helfen_15_00");	//Možná bych ti mohl pomoci.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_helfen_11_02");	//Nevím. Musel bys znát nìkoho z domobrany, kdo se zná s paladiny ...
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_helfen_11_03");	//Paladinové moje ryby jen stìží vykoupí.
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_helfen_15_04");	//Uvidím, co se dá dìlat.
	Info_ClearChoices(dia_addon_farim_milizprobs);
	Log_CreateTopic(TOPIC_ADDON_FARIMSFISH,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_FARIMSFISH,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_FARIMSFISH,"Rybáø Farim má problémy s domobranou. Berou mu pøíliš mnoho ryb. Musím najít nìkoho z domobrany, kdo má kontakt na paladiny a kdo mu pomùže.");
	MIS_ADDON_FARIM_PALADINFISCH = LOG_RUNNING;
};


instance DIA_ADDON_FARIM_MARTINHELPS(C_INFO)
{
	npc = vlk_4301_addon_farim;
	nr = 5;
	condition = dia_addon_farim_martinhelps_condition;
	information = dia_addon_farim_martinhelps_info;
	description = "Mám øešení tvého problému.";
};


func int dia_addon_farim_martinhelps_condition()
{
	if((MIS_ADDON_FARIM_PALADINFISCH == LOG_RUNNING) && (MARTIN_KNOWSFARIM == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_farim_martinhelps_info()
{
	AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_00");	//Mám øešení tvého problému.
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_01");	//Fakt? A jaké?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_02");	//Trošku jsem to tady omrknul.
		AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_03");	//A znám nìkoho, kdo by mohl pomoci.
	};
	AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_04");	//Martin, dùstojník paladinù, si vyslechne tvùj problém s domobranou.
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_05");	//A myslíš, že mùže zajistit, aby mì domobrana už neotravovala?
	AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_06");	//Pøesnì tak.
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_07");	//Paráda. Díky. Nemùžu ti toho moc dát. Ale poèkej ...
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_08");	//Našel jsem tenhle zvláštní modrý kámen na ostrovì blízko khorinisu.
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_09");	//Nemyslím, že je to nìjak cenné, ale nìkdo jako ty, by to mohl využít.
	b_giveinvitems(self,other,itmi_aquamarine,1);
	MIS_ADDON_FARIM_PALADINFISCH = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_FARIM_PALADINFISCH);
};


instance DIA_ADDON_FARIM_LANDSTREICHER(C_INFO)
{
	npc = vlk_4301_addon_farim;
	nr = 5;
	condition = dia_addon_farim_landstreicher_condition;
	information = dia_addon_farim_landstreicher_info;
	description = "Mùžeš mi øíct nìco o chybìjících lidech?";
};


func int dia_addon_farim_landstreicher_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_farim_hallo) && (MIS_ADDON_VATRAS_WHEREAREMISSINGPEOPLE == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_farim_landstreicher_info()
{
	AI_Output(other,self,"DIA_Addon_Farim_Landstreicher_15_01");	//Mùžeš mi øíct nìco o chybìjících lidech?
	AI_Output(self,other,"DIA_Addon_Farim_Landstreicher_11_02");	//Mùj kamarád Wiliam se zapletl s podezøelými lidmi. A co se mu stalo?
	AI_Output(self,other,"DIA_Addon_Farim_Landstreicher_11_03");	//Jednoho dne pøestal pracovat a od té doby jsem o nìm neslyšel.
	SCKNOWSFARIMASWILLIAMSFRIEND = TRUE;
};


instance DIA_ADDON_FARIM_WILLIAM(C_INFO)
{
	npc = vlk_4301_addon_farim;
	nr = 5;
	condition = dia_addon_farim_william_condition;
	information = dia_addon_farim_william_info;
	description = "Tvùj kamarád William zmizel?";
};


func int dia_addon_farim_william_condition()
{
	if((SCKNOWSFARIMASWILLIAMSFRIEND == TRUE) && Npc_KnowsInfo(other,dia_addon_farim_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_farim_william_info()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_15_00");	//Tvùj kamarád William zmizel?
	AI_Output(self,other,"DIA_Addon_Farim_William_11_01");	//Asi jo. Mohl z nìho být rybáø, ale to by na sobì musel pracovat, ale to on ne - je trochu náladový.
	AI_Output(self,other,"DIA_Addon_Farim_William_11_02");	//Nikdy se nemìl zaplést s tìmi chlápky.
	Log_CreateTopic(TOPIC_ADDON_MISSINGPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MISSINGPEOPLE,LOG_RUNNING);
	Log_AddEntry(TOPIC_ADDON_MISSINGPEOPLE,LOGTEXT_ADDON_WILLIAMMISSING);
	Info_ClearChoices(dia_addon_farim_william);
	Info_AddChoice(dia_addon_farim_william,"O kom pøesnì mluvíš?",dia_addon_farim_william_typen);
	Info_AddChoice(dia_addon_farim_william,"Jsem si jistý, že se znovu objeví.",dia_addon_farim_william_auftauchen);
	Info_AddChoice(dia_addon_farim_william,"Co s ním bylo pak?",dia_addon_farim_william_wasgemacht);
	Info_AddChoice(dia_addon_farim_william,"Kdy jsi je vidìl naposled?",dia_addon_farim_william_wannweg);
};

func void dia_addon_farim_william_wasgemacht()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_WasGemacht_15_00");	//Co s ním bylo pak?
	AI_Output(self,other,"DIA_Addon_Farim_William_WasGemacht_11_01");	//William a ti hrdloøezové se zapletli do nìjaké špinavé práce.
	AI_Output(self,other,"DIA_Addon_Farim_William_WasGemacht_11_02");	//Myslím, že ho to mìlo pøivést na jejich stranu.
};

func void dia_addon_farim_william_typen()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_typen_15_00");	//O kom pøesnì mluvíš?
	AI_Output(self,other,"DIA_Addon_Farim_William_typen_11_01");	//Nevím kdo jsou ani co dìlají v Khorinisu.
	AI_Output(self,other,"DIA_Addon_Farim_William_typen_11_02");	//Vím jen, kde se setkali s Wiliamem.
	AI_Output(self,other,"DIA_Addon_Farim_William_typen_11_03");	//Jen co jsem Wiliama poprvé vidìl, øekl jsem si, že je to rozený rybáø.
	Info_AddChoice(dia_addon_farim_william,"Kde se pøesnì setkali?",dia_addon_farim_william_wo);
};

func void dia_addon_farim_william_wo()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_Wo_15_00");	//Kde se pøesnì setkali?
	AI_Output(self,other,"DIA_Addon_Farim_William_Wo_11_01");	//Na druhé stranì pøístavu na severu, je tam zátoka.
	AI_Output(self,other,"DIA_Addon_Farim_William_Wo_11_02");	//Dá se tam dostat jen lodí nabo plaváním.
	AI_Output(self,other,"DIA_Addon_Farim_William_Wo_11_03");	//Je tam pláž a malý rybáøský tábor. Tam jsem je vidìl.
	self.flags = 0;
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Rybáø Farim postrádá svého kamaráda Williama. Farim øíká, že William se setkával s nìjakými hrdloøezy v zátoce na severu pøístavu.");
	Info_AddChoice(dia_addon_farim_william,"Myslím, že jsem slyšel dost.",dia_addon_farim_william_tschau);
};

func void dia_addon_farim_william_wannweg()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_WannWeg_15_00");	//Kdy jsi je vidìl naposled?
	AI_Output(self,other,"DIA_Addon_Farim_William_WannWeg_11_01");	//Pøed nìkolika dny.
	Info_AddChoice(dia_addon_farim_william,"Nešel jenom nìkam dál rybaøit?",dia_addon_farim_william_fischen);
};

func void dia_addon_farim_william_fischen()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_Fischen_15_00");	//Nešel jenom nìkam dál rybaøit?
	AI_Output(self,other,"DIA_Addon_Farim_William_Fischen_11_01");	//To ne. Jeho loï zùstala v pøístavu.
};

func void dia_addon_farim_william_auftauchen()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_auftauchen_15_00");	//Jsem si jistý, že se znovu objeví.
	AI_Output(self,other,"DIA_Addon_Farim_William_auftauchen_11_01");	//To si nemyslím. Už je pryè pøíliš dlouho.
	AI_Output(self,other,"DIA_Addon_Farim_William_auftauchen_11_02");	//Bojím se, že jednoho dne z moøe vylovím jeho mrtvolu.
};

func void dia_addon_farim_william_tschau()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_Tschau_15_00");	//Myslím, že jsem slyšel dost.
	AI_Output(self,other,"DIA_Addon_Farim_William_Tschau_11_01");	//Nedìlej si s tím starosti. Nemyslím si, že bys ho našel.
	Info_ClearChoices(dia_addon_farim_william);
};


instance DIA_ADDON_FARIM_PERM(C_INFO)
{
	npc = vlk_4301_addon_farim;
	nr = 99;
	condition = dia_addon_farim_perm_condition;
	information = dia_addon_farim_perm_info;
	permanent = TRUE;
	description = "Takže, jak jdou obchody?";
};


func int dia_addon_farim_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_farim_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_farim_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Farim_Perm_15_00");	//Takže, jak jdou obchody?
	if(FARIM_PISSEDOFF == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Farim_Perm_11_01");	//Ah. Nedìlej, že tì to zajímá.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Farim_Perm_11_02");	//Už jsem zažil lepší èasy. Pøíliš málo pro život a pøíliš mnoho pro smrt.
	};
};


instance DIA_ADDON_FARIM_WILLIAMREPORT(C_INFO)
{
	npc = vlk_4301_addon_farim;
	nr = 1;
	condition = dia_addon_farim_williamreport_condition;
	information = dia_addon_farim_williamreport_info;
	important = TRUE;
};


func int dia_addon_farim_williamreport_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_farim_william))
	{
		if((Npc_HasItems(other,itwr_addon_william_01) > 0) || (SATURAS_ABOUTWILLIAM == TRUE))
		{
			return TRUE;
		};
	};
};

func void dia_addon_farim_williamreport_info()
{
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_01");	//Jsi zpìt!
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_02");	//Slyšel jsi nìco o Wiliamovi?
	AI_Output(other,self,"DIA_Addon_Farim_Add_15_02");	//Je mrtvý.
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_03");	//(vzdychne) Ano, to jsem èekal.
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_04");	//Díky, že jsi mi to pøišl øíct.
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_05");	//Pùjdu do hospody a za jeho podíl na posledním úlovku se napiju - on by to tak chtìl ...
};

