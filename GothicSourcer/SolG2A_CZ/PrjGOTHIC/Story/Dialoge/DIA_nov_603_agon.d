
instance DIA_AGON_EXIT(C_INFO)
{
	npc = nov_603_agon;
	nr = 999;
	condition = dia_agon_exit_condition;
	information = dia_agon_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_agon_exit_condition()
{
	return TRUE;
};

func void dia_agon_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_AGON_HELLO(C_INFO)
{
	npc = nov_603_agon;
	nr = 2;
	condition = dia_agon_hello_condition;
	information = dia_agon_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_agon_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_SCHNITZELJAGD == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_agon_hello_info()
{
	AI_Output(self,other,"DIA_Agon_Hello_07_00");	//(opovržlivì) Co chceš?
};


instance DIA_AGON_WURST(C_INFO)
{
	npc = nov_603_agon;
	nr = 2;
	condition = dia_agon_wurst_condition;
	information = dia_agon_wurst_info;
	permanent = FALSE;
	description = "Tumáš, mám tu pro tebe skopovou klobásu.";
};


func int dia_agon_wurst_condition()
{
	if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void dia_agon_wurst_info()
{
	var string novizetext;
	var string novizeleft;
	AI_Output(other,self,"DIA_Agon_Wurst_15_00");	//Tumáš, mám tu pro tebe skopovou klobásu.
	AI_Output(self,other,"DIA_Agon_Wurst_07_01");	//Ovèí klobása, ovèí sýr... ovèí mléko... už mi to všechno leze krkem.
	AI_Output(other,self,"DIA_Agon_Wurst_15_02");	//Tak chceš tu klobásu, nebo ne?
	AI_Output(self,other,"DIA_Agon_Wurst_07_03");	//Ale no tak ho sem dej!
	b_giveinvitems(other,self,itfo_schafswurst,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,itfo_sausage);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,2);
};


instance DIA_AGON_NEW(C_INFO)
{
	npc = nov_603_agon;
	nr = 1;
	condition = dia_agon_new_condition;
	information = dia_agon_new_info;
	permanent = FALSE;
	description = "Jsem tady nový.";
};


func int dia_agon_new_condition()
{
	if((MIS_SCHNITZELJAGD == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_agon_new_info()
{
	AI_Output(other,self,"DIA_Agon_New_15_00");	//Jsem tady nový.
	AI_Output(self,other,"DIA_Agon_New_07_01");	//To vidím.
	AI_Output(self,other,"DIA_Agon_New_07_02");	//Jestli zatím nemáš co na práci, promluv si s Parlanem. On už ti nìjakou dá.
};


instance DIA_AGON_YOUANDBABO(C_INFO)
{
	npc = nov_603_agon;
	nr = 1;
	condition = dia_agon_youandbabo_condition;
	information = dia_agon_youandbabo_info;
	permanent = FALSE;
	description = "Co se stalo mezi tebou a Babem?";
};


func int dia_agon_youandbabo_condition()
{
	if(Npc_KnowsInfo(other,dia_opolos_monastery) && (MIS_SCHNITZELJAGD == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_agon_youandbabo_info()
{
	AI_Output(other,self,"DIA_Agon_YouAndBabo_15_00");	//Co se stalo mezi tebou a Babem?
	AI_Output(self,other,"DIA_Agon_YouAndBabo_07_01");	//Nemìl bys vìøit všemu, co uslyšíš.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_07_02");	//(neústupnì) Øeknìme si jedno: pùjdu svou vlastní cestou. Tou, kterou mi pøedurèil Innos.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_07_03");	//Nedovolím nikomu stát mi v cestì, a urèitì ne tomu jelimánkovi Babovi.
	Info_ClearChoices(dia_agon_youandbabo);
	Info_AddChoice(dia_agon_youandbabo,"Nemìli bychom my novicové držet pohromadì?",dia_agon_youandbabo_alltogether);
	Info_AddChoice(dia_agon_youandbabo,"Innos sám ví, jakou cestou bychom se mìli vydat.",dia_agon_youandbabo_innosway);
	Info_AddChoice(dia_agon_youandbabo,"Vycházíme spolu docela dobøe.",dia_agon_youandbabo_understand);
};

func void dia_agon_youandbabo_alltogether()
{
	AI_Output(other,self,"DIA_Agon_YouAndBabo_AllTogether_15_00");	//Nemìli bychom my novicové držet pohromadì?
	AI_Output(self,other,"DIA_Agon_YouAndBabo_AllTogether_07_01");	//Vy ostatní si držte pohromadì, jak chcete.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_AllTogether_07_02");	//Ale prosím, neplýtvej mým èasem. (chladnì) A nestav se mi do cesty.
	Info_ClearChoices(dia_agon_youandbabo);
};

func void dia_agon_youandbabo_innosway()
{
	AI_Output(other,self,"DIA_Agon_YouAndBabo_InnosWay_15_00");	//Innos sám ví, jakou cestou bychom se mìli vydat.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_InnosWay_07_01");	//Moje rodina vždycky stála vysoko v Innosovì pøízni a na tom se nic nezmìní.
	Info_ClearChoices(dia_agon_youandbabo);
};

func void dia_agon_youandbabo_understand()
{
	AI_Output(other,self,"DIA_Agon_YouAndBabo_Understand_15_00");	//Vycházíme spolu docela dobøe.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_Understand_07_01");	//To doufám. Až budu mágem, mùžu za tebe ztratit slùvko.
	Info_ClearChoices(dia_agon_youandbabo);
};


instance DIA_AGON_GETHERB(C_INFO)
{
	npc = nov_603_agon;
	nr = 1;
	condition = dia_agon_getherb_condition;
	information = dia_agon_getherb_info;
	permanent = TRUE;
	description = "Co tady pìstujete?";
};


func int dia_agon_getherb_condition()
{
	if(MIS_SCHNITZELJAGD == FALSE)
	{
		return TRUE;
	};
};

func void dia_agon_getherb_info()
{
	AI_Output(other,self,"DIA_Agon_GetHerb_15_00");	//Co tady pìstujete?
	AI_Output(self,other,"DIA_Agon_GetHerb_07_01");	//Snažíme se vypìstovat léèivé byliny, aby mohl mistr Neoras vaøit lektvary.
};


instance DIA_AGON_GOLEMDEAD(C_INFO)
{
	npc = nov_603_agon;
	nr = 1;
	condition = dia_agon_golemdead_condition;
	information = dia_agon_golemdead_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_agon_golemdead_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && Npc_IsDead(magic_golem))
	{
		return TRUE;
	};
};

func void dia_agon_golemdead_info()
{
	AI_Output(self,other,"DIA_Agon_GolemDead_07_00");	//(vítìznì) Jdeš pozdì!
	AI_Output(self,other,"DIA_Agon_GolemDead_07_01");	//Byl jsem tady první! Vyhrál jsem!
	Info_ClearChoices(dia_agon_golemdead);
	Info_AddChoice(dia_agon_golemdead,"(výhrùžnì) Jenom pokud se odsud dostaneš živý.",dia_agon_golemdead_noway);
	Info_AddChoice(dia_agon_golemdead,"Drž hubu!",dia_agon_golemdead_shutup);
	Info_AddChoice(dia_agon_golemdead,"Gratuluji, vážnì sis to zasloužil.",dia_agon_golemdead_congrat);
};

func void dia_agon_golemdead_noway()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_NoWay_15_00");	//(výhrùžnì) Jenom pokud se odsud dostaneš živý.
	AI_Output(self,other,"DIA_Agon_GolemDead_NoWay_07_01");	//Chceš mì zabít? To se ti nikdy nepovede.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_agon_golemdead_shutup()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_ShutUp_15_00");	//Drž hubu!
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_07_01");	//(výsmìšnì) Nemáš nárok, prohrál jsi! Pøiznej si to.
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_07_02");	//Jenom mnì bylo osudem urèeno stát se mágem.
	Info_ClearChoices(dia_agon_golemdead);
	Info_AddChoice(dia_agon_golemdead,"Osud ti urèil leda políbit mi zadek. Truhla je moje.",dia_agon_golemdead_shutup_mychest);
	Info_AddChoice(dia_agon_golemdead,"Vyhrál jsi.",dia_agon_golemdead_shutup_youwin);
};

func void dia_agon_golemdead_shutup_mychest()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_ShutUp_MyChest_15_00");	//Osud ti urèil leda políbit mi zadek. Truhla je moje.
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_MyChest_07_01");	//(rozzlobenì) Ne, to teda ne, to tì spíš zabiju.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_agon_golemdead_shutup_youwin()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_ShutUp_YouWin_15_00");	//Vyhrál jsi.
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_YouWin_07_01");	//(zbìsile) Ne, mì neošálíš. Snažíš se mì zbavit.
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_YouWin_07_02");	//To nedopustím!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_agon_golemdead_congrat()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_Congrat_15_00");	//Gratuluji, vážnì sis to zasloužil.
	AI_Output(self,other,"DIA_Agon_GolemDead_Congrat_07_01");	//(nedùvìøivì) Co to má znamenat? Co máš za lubem?
	AI_Output(other,self,"DIA_Agon_GolemDead_Congrat_15_02");	//O èem to mluvíš?
	AI_Output(self,other,"DIA_Agon_GolemDead_Congrat_07_03");	//(nervóznì) Chceš mì zabít a nechat si všechnu slávu pro sebe!
	AI_Output(self,other,"DIA_Agon_GolemDead_Congrat_07_04");	//To se ti nikdy nepodaøí!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_AGON_GOLEMLIVES(C_INFO)
{
	npc = nov_603_agon;
	nr = 1;
	condition = dia_agon_golemlives_condition;
	information = dia_agon_golemlives_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_agon_golemlives_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (Npc_IsDead(magic_golem) == FALSE))
	{
		return TRUE;
	};
};

func void dia_agon_golemlives_info()
{
	AI_Output(self,other,"DIA_Agon_GolemLives_07_00");	//(pøekvapenì) Našel jsi ten úkryt pøede mnou. To nejde...
	AI_Output(self,other,"DIA_Agon_GolemLives_07_01");	//(odhodlanì) Tak to nemùže zùstat! To nedovolím.
	AI_Output(self,other,"DIA_Agon_GolemLives_07_02");	//Dokonce nikdy nenajdou tvou mrtvolu.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,0);
};


instance DIA_AGON_PERM(C_INFO)
{
	npc = nov_603_agon;
	nr = 2;
	condition = dia_agon_perm_condition;
	information = dia_agon_perm_info;
	permanent = TRUE;
	description = "Tak jak to jde?";
};


func int dia_agon_perm_condition()
{
	if((KAPITEL >= 3) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_agon_perm_info()
{
	AI_Output(other,self,"DIA_Agon_Perm_15_00");	//Tak jak to jde?
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Agon_Perm_07_01");	//Ach - díky za tvùj zájem, sire paladine. Práce se mi líbí a jsem si jist, že brzy budu vybrán mezi mágy.
	}
	else
	{
		AI_Output(self,other,"DIA_Agon_Perm_07_02");	//(arogantnì) Tady v Innosovì klášteøe jsi jenom hostem. Mìl by ses tedy podle toho chovat a nerušit mì v mé práci. Pøeji hezký den.
	};
};


instance DIA_AGON_PICKPOCKET(C_INFO)
{
	npc = nov_603_agon;
	nr = 900;
	condition = dia_agon_pickpocket_condition;
	information = dia_agon_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_agon_pickpocket_condition()
{
	return c_beklauen(23,12);
};

func void dia_agon_pickpocket_info()
{
	Info_ClearChoices(dia_agon_pickpocket);
	Info_AddChoice(dia_agon_pickpocket,DIALOG_BACK,dia_agon_pickpocket_back);
	Info_AddChoice(dia_agon_pickpocket,DIALOG_PICKPOCKET,dia_agon_pickpocket_doit);
};

func void dia_agon_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_agon_pickpocket);
};

func void dia_agon_pickpocket_back()
{
	Info_ClearChoices(dia_agon_pickpocket);
};

