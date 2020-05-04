
instance DIA_DRAGON_ICE_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_dragon_ice_exit_condition;
	information = dia_dragon_ice_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dragon_ice_exit_condition()
{
	if(DRAGONTALK_EXIT_FREE == TRUE)
	{
		return TRUE;
	};
};

func void dia_dragon_ice_exit_info()
{
	Npc_RemoveInvItems(other,itmi_innoseye_mis,1);
	CreateInvItems(other,itmi_innoseye_discharged_mis,1);
	AI_Output(self,other,"DIA_Dragon_Ice_Exit_20_00");	//Síla Oka vyhasla a tvùj èas vypršel.
	AI_StopProcessInfos(self);
	DRAGONTALK_EXIT_FREE = FALSE;
	self.flags = 0;
	if(DJG_BIFF_STAY == TRUE)
	{
		b_startotherroutine(biff,"Follow");
		DJG_BIFF_STAY = FALSE;
	};
	Wld_InsertNpc(draconian,"FP_ROAM_OW_ICEREGION_29_02");
	Wld_InsertNpc(draconian,"FP_ROAM_OW_ICEREGION_30_01");
	Wld_InsertNpc(draconian,"FP_ROAM_OW_BLOODFLY_05_01");
	Wld_InsertNpc(draconian,"FP_ROAM_OW_BLOODFLY_05_01");
};


instance DIA_DRAGON_ICE_HELLO(C_INFO)
{
	nr = 1;
	condition = dia_dragon_ice_hello_condition;
	information = dia_dragon_ice_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dragon_ice_hello_condition()
{
	if(Npc_HasItems(other,itmi_innoseye_mis) >= 1)
	{
		return 1;
	};
};

func void dia_dragon_ice_hello_info()
{
	AI_Output(self,other,"DIA_Dragon_Ice_Hello_20_00");	//Proè rušíš mùj odpoèinek? To se musím vìènì zahrabávat na stále vzdálenìjších místech jen proto, aby mì taková protivná havì jako ty nechala na pokoji?
	if(MIS_KILLEDDRAGONS == 0)
	{
		AI_Output(other,self,"DIA_Dragon_Ice_Hello_15_01");	//Mluvící drak. Poehnáno buï Innosovo oko.
	};
	AI_Output(self,other,"DIA_Dragon_Ice_Hello_20_02");	//Vy lidé jste podivná stvoøení. I kdy vás smete ledovı vichr smrti, vdycky se najde nìkdo, kdo povstane z popela a myslí si o sobì, e je mu dáno bıt hrdinou.
	AI_Output(self,other,"DIA_Dragon_Ice_Hello_20_03");	//Ale to brzo skonèí. Osobnì dohlédnu na to, aby nikdo z vás u nikdy z nièeho nepovstal.
	AI_Output(other,self,"DIA_Dragon_Ice_Hello_15_04");	//Ticho. S mocí posvátného Oka, je mi byla propùjèena, si mùu dovolit zeptat se tì na pár vìcí.
	AI_Output(self,other,"DIA_Dragon_Ice_Hello_20_05");	//Ha ha ha. Jen se ptej. Tvé vìdomosti ti nebudou k nièemu.
};


instance DIA_DRAGON_ICE_WERBISTDU(C_INFO)
{
	nr = 5;
	condition = dia_dragon_ice_werbistdu_condition;
	information = dia_dragon_ice_werbistdu_info;
	description = "Kdo jsi?";
};


func int dia_dragon_ice_werbistdu_condition()
{
	if(Npc_KnowsInfo(other,dia_dragon_ice_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_ice_werbistdu_info()
{
	AI_Output(other,self,"DIA_Dragon_Ice_WERBISTDU_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Dragon_Ice_WERBISTDU_20_01");	//Jsem Finkregh. Pán ledu a snìhu, stráce shromádìní a konec koncù i tvá smrt.
};


instance DIA_DRAGON_ICE_BELIAR(C_INFO)
{
	nr = 6;
	condition = dia_dragon_ice_beliar_condition;
	information = dia_dragon_ice_beliar_info;
	description = "Jakému bohu slouíš?";
};


func int dia_dragon_ice_beliar_condition()
{
	if(Npc_KnowsInfo(other,dia_dragon_ice_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_ice_beliar_info()
{
	AI_Output(other,self,"DIA_Dragon_Ice_BELIAR_15_00");	//Jakému bohu slouíš?
	AI_Output(other,self,"DIA_Dragon_Ice_BELIAR_15_01");	//Kterej zpropadenej bùh mohl kdy dovolit takovı ohavnı potvoøe jako ty chodit po téhle zemi?
	AI_Output(self,other,"DIA_Dragon_Ice_BELIAR_20_02");	//Neobtìuj se porozumìt smyslu našeho Shromádìní, malı hrdino.
	AI_Output(self,other,"DIA_Dragon_Ice_BELIAR_20_03");	//Beliar nám nejen dovolil, abychom tu byli - on nás dokonce vede.
	AI_Output(self,other,"DIA_Dragon_Ice_BELIAR_20_04");	//Podníceni jeho svatımi slovy si neodpoèineme do té doby, ne se jeho vùle promìní v skutky.
};

func void b_assigndragontalk_ice(var C_NPC slf)
{
	dia_dragon_ice_exit.npc = Hlp_GetInstanceID(slf);
	dia_dragon_ice_hello.npc = Hlp_GetInstanceID(slf);
	dia_dragon_ice_werbistdu.npc = Hlp_GetInstanceID(slf);
	dia_dragon_ice_beliar.npc = Hlp_GetInstanceID(slf);
	b_assigndragontalk_main(slf);
};

