
instance DIA_JERGAN_EXIT(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 999;
	condition = dia_jergan_exit_condition;
	information = dia_jergan_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jergan_exit_condition()
{
	return TRUE;
};

func void dia_jergan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JERGAN_HALLO(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 2;
	condition = dia_jergan_hallo_condition;
	information = dia_jergan_hallo_info;
	permanent = FALSE;
	description = "Co tady pohledáváš?";
};


func int dia_jergan_hallo_condition()
{
	return TRUE;
};

func void dia_jergan_hallo_info()
{
	AI_Output(other,self,"DIA_Jergan_Hallo_15_00");	//Co tady pohledáváš?
	AI_Output(self,other,"DIA_Jergan_Hallo_13_01");	//Pøicházím z hradu. Poslali mì, abych našel ty pohøešované a zkontroloval tuhle oblast.
};


instance DIA_JERGAN_VERMISSTE(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 2;
	condition = dia_jergan_vermisste_condition;
	information = dia_jergan_vermisste_info;
	permanent = FALSE;
	description = "Pohøešované?";
};


func int dia_jergan_vermisste_condition()
{
	if(Npc_KnowsInfo(other,dia_jergan_hallo))
	{
		return TRUE;
	};
};

func void dia_jergan_vermisste_info()
{
	AI_Output(other,self,"DIA_Jergan_Vermisste_15_00");	//Pohøešované?
	AI_Output(self,other,"DIA_Jergan_Vermisste_13_01");	//Nìkterým se podaøilo uniknout, když zaútoèili draci. Vìtšina z nich to nestihla - a není divu!
	AI_Output(self,other,"DIA_Jergan_Vermisste_13_02");	//Ale pokud nìkdo pøežil, vezmu ho s sebou zpátky.
};


instance DIA_JERGAN_BURG(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 3;
	condition = dia_jergan_burg_condition;
	information = dia_jergan_burg_info;
	permanent = FALSE;
	description = "Mùžeš mi pomoct dostat se do hradu?";
};


func int dia_jergan_burg_condition()
{
	if(Npc_KnowsInfo(other,dia_jergan_hallo) && (Npc_GetDistToWP(self,"OW_STAND_JERGAN") <= 1000))
	{
		return TRUE;
	};
};

func void dia_jergan_burg_info()
{
	AI_Output(other,self,"DIA_Jergan_Burg_15_00");	//Mùžeš mi pomoct dostat se do hradu?
	AI_Output(self,other,"DIA_Jergan_Burg_13_01");	//Jasnì, ale musíš mi prokázat laskavost.
	AI_Output(self,other,"DIA_Jergan_Burg_13_02");	//Jestli se ti podaøí dostat se do hradu, promluv si s paladinem Oricem. Vyøiï mu, že jeho bratr to tady v prùsmyku koupil.
	Log_CreateTopic(TOPIC_ORICBRUDER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ORICBRUDER,LOG_RUNNING);
	b_logentry(TOPIC_ORICBRUDER,"Až se dostanu do hradu, musím Oricovi vyøídit, že jeho bratr se zøítil z prùsmyku.");
};


instance DIA_JERGAN_GEGEND(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 9;
	condition = dia_jergan_gegend_condition;
	information = dia_jergan_gegend_info;
	permanent = TRUE;
	description = "Co bych mìl vìdìt o této oblasti?";
};


func int dia_jergan_gegend_condition()
{
	if(Npc_KnowsInfo(other,dia_jergan_hallo))
	{
		return TRUE;
	};
};


var int jergan_tell;

func void dia_jergan_gegend_info()
{
	if(JERGAN_TELL == FALSE)
	{
		AI_Output(other,self,"DIA_Jergan_Gegend_15_00");	//Co bych mìl vìdìt o této oblasti?
		AI_Output(self,other,"DIA_Jergan_Gegend_13_01");	//Jestli chceš žít, vra se, odkud jsi pøišel.
		AI_Output(self,other,"DIA_Jergan_Gegend_13_02");	//Zelenokožci obléhají hrad už týdny - a nìkde se tu ukrývají draci.
	};
	AI_Output(self,other,"DIA_Jergan_Gegend_13_03");	//Celé Hornické údolí se hemží skøety - a máš namíøeno kamkoliv, nebude to procházka rùžovou zahradou.
	JERGAN_TELL = TRUE;
};


instance DIA_JERGAN_HILFE(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 3;
	condition = dia_jergan_hilfe_condition;
	information = dia_jergan_hilfe_info;
	permanent = FALSE;
	description = "Jak se dostanu do hradu?";
};


func int dia_jergan_hilfe_condition()
{
	if(Npc_KnowsInfo(other,dia_jergan_burg) && (Npc_GetDistToWP(self,"OW_STAND_JERGAN") <= 1000))
	{
		return TRUE;
	};
};

func void dia_jergan_hilfe_info()
{
	AI_Output(other,self,"DIA_Jergan_Hilfe_15_00");	//Jak se dostanu do hradu?
	AI_Output(self,other,"DIA_Jergan_Hilfe_13_01");	//Na pøímou cestu rovnou zapomeò. Ale pokud obejdeš hrad, možná se tam dostaneš zezadu.
	AI_Output(self,other,"DIA_Jergan_Hilfe_13_02");	//Mìl bys zùstat mimo cestu a využít øeku. Nejlepší bude, když poplaveš po proudu. Odtud by to mìlo být snazší.
	AI_Output(self,other,"DIA_Jergan_Hilfe_13_03");	//Skøeti pøed hradem postavili beranidlo. Mùžeš se dostat dovnitø tímto zpùsobem - pøiplížíš se k tìm bastardùm, jak jen to bude možné, a potom budeš upalovat, co to jen pùjde.
	AI_Output(self,other,"DIA_Jergan_Hilfe_13_04");	//Pokud budeš dostateènì rychlý, mìl bys to zvládnout.
};


instance DIA_JERGAN_MINE(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 3;
	condition = dia_jergan_mine_condition;
	information = dia_jergan_mine_info;
	permanent = FALSE;
	description = "Co tady dìláš?";
};


func int dia_jergan_mine_condition()
{
	if(Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000)
	{
		return TRUE;
	};
};

func void dia_jergan_mine_info()
{
	AI_Output(other,self,"DIA_Jergan_Mine_15_00");	//Co tady dìláš?
	AI_Output(self,other,"DIA_Jergan_Mine_13_01");	//Jsem zvìd. Toulám se po kraji. Ale všichni ti chòapavci mi to ztìžují.
	AI_Output(self,other,"DIA_Jergan_Mine_13_02");	//Je vhodná doba k získání nìjakých trofejí - za pøedpokladu, že víš, co dìláš.
};


instance DIA_JERGAN_CLAW(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 3;
	condition = dia_jergan_claw_condition;
	information = dia_jergan_claw_info;
	permanent = FALSE;
	description = "Nauèíš mì, jak na to?";
};


func int dia_jergan_claw_condition()
{
	if((Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000) && Npc_KnowsInfo(other,dia_jergan_mine) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE))
	{
		return TRUE;
	};
};

func void dia_jergan_claw_info()
{
	AI_Output(other,self,"DIA_Jergan_Claw_15_00");	//Nauèíš mì, jak na to?
	AI_Output(self,other,"DIA_Jergan_Claw_13_01");	//Mùžu ti ukázat, jak z jejich mrtvol vytrhnout drápy.
};


instance DIA_JERGAN_TEACH(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 9;
	condition = dia_jergan_teach_condition;
	information = dia_jergan_teach_info;
	permanent = TRUE;
	description = "(Nauèit se vyjímat drápy.)";
};


func int dia_jergan_teach_condition()
{
	if((Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000) && Npc_KnowsInfo(other,dia_jergan_claw) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE))
	{
		return TRUE;
	};
};

func void dia_jergan_teach_info()
{
	AI_Output(other,self,"DIA_Jergan_Teach_15_00");	//Ukaž mi, jak vytrhnout drápy.
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_CLAWS))
	{
		AI_Output(self,other,"DIA_Jergan_Teach_13_01");	//Dùležité je odstranit drápy škubnutím. Pøíliš neváhej a nerýpej èepelí.
		AI_Output(self,other,"DIA_Jergan_Teach_13_02");	//Tímto zpùsobem nevytrhneš drápy jenom chòapavcùm, ale také ještìrùm a stínovým šelmám.
	};
};


instance DIA_JERGAN_DIEGO(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 9;
	condition = dia_jergan_diego_condition;
	information = dia_jergan_diego_info;
	permanent = FALSE;
	description = "Víš, kam se podìl Diego?";
};


func int dia_jergan_diego_condition()
{
	if((Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000) && (Npc_KnowsInfo(other,dia_diegoow_hallo) == FALSE) && Npc_KnowsInfo(other,dia_parcival_diego))
	{
		return TRUE;
	};
};

func void dia_jergan_diego_info()
{
	AI_Output(other,self,"DIA_Jergan_Diego_15_00");	//Víš, kam se podìl Diego?
	AI_Output(self,other,"DIA_Jergan_Diego_13_01");	//Diego? Byl jedním ze Silvestrových kopáèù. Ale vypaøil se.
	AI_Output(self,other,"DIA_Jergan_Diego_13_02");	//Vidìl jsem ho nedaleko odtud se dvìmi rytíøi a krabicí.
	AI_Output(self,other,"DIA_Jergan_Diego_13_03");	//Vidíš tady tu starou strážní vìž? Jdi tím smìrem a potom k hradu.
	AI_Output(self,other,"DIA_Jergan_Diego_13_04");	//Cesta vede skálami vpravo. To je ta cesta, kterou šli.
};


instance DIA_JERGAN_LEADER(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 3;
	condition = dia_jergan_leader_condition;
	information = dia_jergan_leader_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jergan_leader_condition()
{
	if((Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000) && Npc_IsDead(newmine_leadsnapper) && Npc_KnowsInfo(other,dia_bilgot_knowsleadsnapper))
	{
		return TRUE;
	};
};

func void dia_jergan_leader_info()
{
	AI_Output(self,other,"DIA_Jergan_Leader_13_00");	//Tak ty jsi zabil vùdce bandy. A získal jsi z té bestie drápy?
	if(Npc_HasItems(other,itat_clawleader) >= 1)
	{
		AI_Output(other,self,"DIA_Jergan_Leader_15_01");	//Ano.
		AI_Output(self,other,"DIA_Jergan_Leader_13_02");	//Ty musí mít jistì velkou cenu. Je tu nìkolik chlapíkù, kteøí takové vìci sbírají.
		AI_Output(self,other,"DIA_Jergan_Leader_13_03");	//Pokud najdeš správného kupce, dostaneš za to kopec zlata.
	}
	else
	{
		AI_Output(other,self,"DIA_Jergan_Leader_15_04");	//Ne.
		AI_Output(self,other,"DIA_Jergan_Leader_13_05");	//Mìl bys to udìlat. Jsem si jist, že za nì dostaneš majlant.
	};
};


instance DIA_JERGAN_PICKPOCKET(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 900;
	condition = dia_jergan_pickpocket_condition;
	information = dia_jergan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_jergan_pickpocket_condition()
{
	return c_beklauen(84,110);
};

func void dia_jergan_pickpocket_info()
{
	Info_ClearChoices(dia_jergan_pickpocket);
	Info_AddChoice(dia_jergan_pickpocket,DIALOG_BACK,dia_jergan_pickpocket_back);
	Info_AddChoice(dia_jergan_pickpocket,DIALOG_PICKPOCKET,dia_jergan_pickpocket_doit);
};

func void dia_jergan_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_jergan_pickpocket);
};

func void dia_jergan_pickpocket_back()
{
	Info_ClearChoices(dia_jergan_pickpocket);
};

