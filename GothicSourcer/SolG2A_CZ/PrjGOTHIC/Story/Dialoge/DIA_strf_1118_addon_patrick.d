
instance DIA_ADDON_PATRICK_EXIT(C_INFO)
{
	npc = strf_1118_addon_patrick;
	nr = 999;
	condition = dia_addon_patrick_exit_condition;
	information = dia_addon_patrick_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_patrick_exit_condition()
{
	return TRUE;
};

func void dia_addon_patrick_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_PATRICK_HI(C_INFO)
{
	npc = strf_1118_addon_patrick;
	nr = 2;
	condition = dia_addon_patrick_hi_condition;
	information = dia_addon_patrick_hi_info;
	permanent = FALSE;
	description = "Jsem zde na rozkaz mágù Vody a všechny vás osvobodím.";
};


func int dia_addon_patrick_hi_condition()
{
	return TRUE;
};

func void dia_addon_patrick_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_15_00");	//Jsem zde na rozkaz mágù Vody a všechny vás osvobodím.
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_07_01");	//(podezøívavì) Opravdu? Proè bych ti mìl vìøit?
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_15_02");	//Tak chcete odsud vypadnout nebo ne?
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_07_03");	//Samozøejmì, že chci - ale ...
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_15_04");	//Vatras mì poslal. Jesli se vám to nezdá dobré, pak mùžete hnít v této díøe, o což se postarám.
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_07_05");	//(rychle) V poøádku, vìøím ti.
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_15_06");	//(zaraženì) Opravdu? Bylo to jednodušší, než jsem oèekával. OK, vše, co nyní potøebujeme, je plán.
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_07_07");	//Pokusit se o útìk je pøíliš riskantní. William to zkoušel a koupil si farmu.
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_07_08");	//Vìzni jsou farmáøi a dìlníci - vìøí mi, ale nebudou riskovat nebezpeèí.
	Info_ClearChoices(dia_addon_patrick_hi);
	Info_AddChoice(dia_addon_patrick_hi,"Oèekáváte mne, abych dostal pro vás od Ravena milost?",dia_addon_patrick_hi_raven);
	Info_AddChoice(dia_addon_patrick_hi,"To musím zabít všechny bandity, abyste si pohli?",dia_addon_patrick_hi_kill);
};

func void b_say_patrick_plan()
{
	AI_Output(self,other,"DIA_Addon_Patrick_Plan_07_00");	//Ale to není plán.
	AI_Output(self,other,"DIA_Addon_Patrick_Plan_07_01");	//Jen nás ujisti, že stráže na nás nezaútoèí, a my pùjdeme odsud pryè.
	AI_Output(other,self,"DIA_Addon_Patrick_Plan_15_02");	//Dobrá, postarám se o to. Øekni ostatním, aby se pøipravili.
	b_logentry(TOPIC_ADDON_SKLAVEN,"Otroci se nepokusí o útìk. Musím najít zpùsob, aby odešli bez námitek.");
};

func void dia_addon_patrick_hi_raven()
{
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_Raven_15_00");	//Oèekáváte ode mne, že pro vás dostanu od Ravena milost?
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_Raven_07_01");	//(usmìvavì) To by nebylo tak špatné.
	b_say_patrick_plan();
	Info_ClearChoices(dia_addon_patrick_hi);
};

func void dia_addon_patrick_hi_kill()
{
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_Kill_15_00");	//To musím zabít všechny bandity, aby jste se pohli?
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_Kill_07_01");	//(pøekvapenì) To by bylo šílenství!
	b_say_patrick_plan();
	Info_ClearChoices(dia_addon_patrick_hi);
};


instance DIA_ADDON_PATRICK_READY(C_INFO)
{
	npc = strf_1118_addon_patrick;
	nr = 2;
	condition = dia_addon_patrick_ready_condition;
	information = dia_addon_patrick_ready_info;
	permanent = FALSE;
	description = "Vše v pohodì, mùžete jít.";
};


func int dia_addon_patrick_ready_condition()
{
	if(((READY_TOGO == TRUE) && Npc_KnowsInfo(other,dia_addon_patrick_hi)) || (Npc_IsDead(prisonguard) && Npc_IsDead(bloodwyn) && Npc_KnowsInfo(other,dia_addon_thorus_answer)) || (Npc_IsDead(thorus) && Npc_IsDead(bloodwyn) && Npc_IsDead(prisonguard)))
	{
		return TRUE;
	};
};

func void dia_addon_patrick_ready_info()
{
	AI_Output(other,self,"DIA_Addon_Patrick_ready_15_00");	//Vše v pohodì, mùžete jít.
	AI_Output(self,other,"DIA_Addon_Patrick_ready_07_01");	//Dobøe, znám jeskyni v bažinách. Shromáždíme se tam, ale co budeme dìlat pak?
	AI_Output(other,self,"DIA_Addon_Patrick_ready_15_02");	//Dejte se moèálem pøímo k jihozápadu. Mágové Vody si tam v ruinách založili tábor.
	AI_Output(other,self,"DIA_Addon_Patrick_ready_15_03");	//Ukážou vám cestu z tohohle údolí.
	AI_Output(self,other,"DIA_Addon_Patrick_ready_07_04");	//Dìkuji ti, dìkuji ti moc. (formálnì) Jsme ti hluboce zavázáni ...
	AI_Output(other,self,"DIA_Addon_Patrick_ready_15_05");	//Nechte to tak!
	SKLAVEN_FLUCHT = TRUE;
	b_giveplayerxp(XP_ADDON_FLUCHT);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FLUCHT");
	b_startotherroutine(telbor,"FLUCHT");
	b_startotherroutine(tonak,"FLUCHT");
	b_startotherroutine(pardos,"FLUCHT");
	b_startotherroutine(monty,"FLUCHT");
	b_startotherroutine(buddler_1,"WORK");
	b_startotherroutine(buddler_2,"WORK");
	b_startotherroutine(buddler_3,"WORK");
	b_removenpc(strf_1128_addon_sklave);
	b_removenpc(strf_1129_addon_sklave);
	b_removenpc(strf_1130_addon_sklave);
	b_removenpc(strf_1136_addon_sklave);
	b_removenpc(strf_1137_addon_sklave);
	b_removenpc(strf_1138_addon_sklave);
	b_removenpc(strf_1139_addon_sklave);
	b_removenpc(strf_1140_addon_sklave);
};


instance DIA_ADDON_PATRICK_KILLER(C_INFO)
{
	npc = strf_1118_addon_patrick;
	nr = 2;
	condition = dia_addon_patrick_killer_condition;
	information = dia_addon_patrick_killer_info;
	permanent = FALSE;
	description = "Stráže jsou vyøízeny, mùžete jít.";
};


func int dia_addon_patrick_killer_condition()
{
	if(Npc_IsDead(prisonguard) && (READY_TOGO == FALSE) && Npc_KnowsInfo(other,dia_addon_patrick_hi))
	{
		return TRUE;
	};
};

func void dia_addon_patrick_killer_info()
{
	AI_Output(other,self,"DIA_Addon_Patrick_Killer_15_00");	//Stráže jsou vyøízeny, mùžete jít.
	AI_Output(self,other,"DIA_Addon_Patrick_Killer_07_01");	//A co se stane, když opustíme dùl? Ostatní stráže nás zabijí, kdekoliv si stoupneme. Nikdy. Pøíliš riskantní.
};


instance DIA_ADDON_PATRICK_HOEHLE(C_INFO)
{
	npc = strf_1118_addon_patrick;
	nr = 2;
	condition = dia_addon_patrick_hoehle_condition;
	information = dia_addon_patrick_hoehle_info;
	permanent = TRUE;
	description = "Nechcete odejít???";
};


func int dia_addon_patrick_hoehle_condition()
{
	if(Npc_GetDistToWP(self,"ADW_BL_HOEHLE_04") <= 1000)
	{
		return TRUE;
	};
};

func void dia_addon_patrick_hoehle_info()
{
	AI_Output(other,self,"DIA_Addon_Patrick_Hoehle_15_00");	//Nechcete odejít???
	AI_Output(self,other,"DIA_Addon_Patrick_Hoehle_07_01");	//Samozøejmì, že chceme. Pouze èekáme na vhodou pøíležitost.
};

