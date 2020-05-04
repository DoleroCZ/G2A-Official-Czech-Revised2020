
var int urshak_sucked;

instance DIA_URSHAK_EXIT(C_INFO)
{
	npc = none_110_urshak;
	nr = 999;
	condition = dia_urshak_exit_condition;
	information = dia_urshak_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_urshak_exit_condition()
{
	return TRUE;
};

func void dia_urshak_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_URSHAK_HALLO(C_INFO)
{
	npc = none_110_urshak;
	nr = 5;
	condition = dia_urshak_hallo_condition;
	information = dia_urshak_hallo_info;
	important = TRUE;
};


func int dia_urshak_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_hallo_info()
{
	AI_Output(self,other,"DIA_Urshak_HALLO_18_00");	//(agresivnì) KHROTOK JABARTH!!!
	AI_Output(self,other,"DIA_Urshak_HALLO_18_01");	//Poèkej! Já tì znát. Ty pøítel èlovìk s mìkký hlas.
	AI_Output(self,other,"DIA_Urshak_HALLO_18_02");	//Pøítel zabít zlý démon KRUSHAK.
	b_giveplayerxp(XP_URSHAKFOUND);
	Log_CreateTopic(TOPIC_URSHAK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_URSHAK,LOG_RUNNING);
	b_logentry(TOPIC_URSHAK,"Našel jsem svého starého skøetího pøítele Ur-Shaka.");
	Info_ClearChoices(dia_urshak_hallo);
	Info_AddChoice(dia_urshak_hallo,"Co tady dìláš?",dia_urshak_hallo_freund);
	Info_AddChoice(dia_urshak_hallo,"Mluvící skøet?",dia_urshak_hallo_wer);
};

func void dia_urshak_hallo_wer()
{
	AI_Output(other,self,"DIA_Urshak_HALLO_wer_15_00");	//Mluvící skøet?
	AI_Output(self,other,"DIA_Urshak_HALLO_wer_18_01");	//Ty zapomenout na Ur-Shak? To dìlat smutek.
	AI_Output(self,other,"DIA_Urshak_HALLO_wer_18_02");	//Ur-Shak pomoct pøítel mnoho dní pøed tím, než ULU-MULU umožnit jít do moje vesnice. Skøeti si vážit pøátel a pøítel nezemøít rukou skøeta.
	AI_Output(self,other,"DIA_Urshak_HALLO_wer_18_03");	//Pøítel pak jí do podzemní skøetí chrám a zahnat zlý démon. Pøed mnoho dnù. Ty nepamatovat?
};

func void dia_urshak_hallo_freund()
{
	AI_Output(other,self,"DIA_Urshak_HALLO_freund_15_00");	//To sis teda vybral èas k setkání. Málem jsem tì zabil. Co tady dìláš?
	AI_Output(self,other,"DIA_Urshak_HALLO_freund_18_01");	//Ur-Shak dávat pozor na zemi a vidìt, co se stát zemi a jeho lidem.
	Info_ClearChoices(dia_urshak_hallo);
};


instance DIA_URSHAK_WASMACHENORKS(C_INFO)
{
	npc = none_110_urshak;
	nr = 6;
	condition = dia_urshak_wasmachenorks_condition;
	information = dia_urshak_wasmachenorks_info;
	description = "Proè skøeti napadli lidi?";
};


func int dia_urshak_wasmachenorks_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hallo) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_wasmachenorks_info()
{
	AI_Output(other,self,"DIA_Urshak_WASMACHENORKS_15_00");	//Proè skøeti napadli lidi?
	AI_Output(self,other,"DIA_Urshak_WASMACHENORKS_18_01");	//Ur-Shak vždycky øíkat skøetímu lidu, lidé ne zlí a mnoho dobrých pøátel mezi nima.
	AI_Output(self,other,"DIA_Urshak_WASMACHENORKS_18_02");	//Ale šaman neposlouchat Ur-Shak. Ur-Shak poøád u svého lidu v nemilost.
	AI_Output(self,other,"DIA_Urshak_WASMACHENORKS_18_03");	//Tak Ur-Shak ne slyšet moc o velký plán proti lidem.
	b_logentry(TOPIC_URSHAK,"Ještì stále nepøimìl svùj lid, aby mu naslouchal. Poøád zùstává vyhnancem.");
};


instance DIA_URSHAK_SOVIELE(C_INFO)
{
	npc = none_110_urshak;
	nr = 7;
	condition = dia_urshak_soviele_condition;
	information = dia_urshak_soviele_info;
	description = "Jak to, že je vás tu najednou tolik?";
};


func int dia_urshak_soviele_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hallo) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_soviele_info()
{
	AI_Output(other,self,"DIA_Urshak_SOVIELE_15_00");	//Jak to, že je vás tu najednou tolik?
	AI_Output(self,other,"DIA_Urshak_SOVIELE_18_01");	//Skøeti pøijít z hor, ale další pøiplout na lodích a postavit velká palisáda.
};


instance DIA_URSHAK_ZAUN(C_INFO)
{
	npc = none_110_urshak;
	nr = 8;
	condition = dia_urshak_zaun_condition;
	information = dia_urshak_zaun_info;
	description = "Co je ukryto za tou dlouhou zdí na východì?";
};


func int dia_urshak_zaun_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hallo) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_zaun_info()
{
	AI_Output(other,self,"DIA_Urshak_ZAUN_15_00");	//Co je ukryto za tou dlouhou zdí na východì?
	AI_Output(self,other,"DIA_Urshak_ZAUN_18_01");	//Skøeti vždycky, když válka, stavìt velká palisáda a tábor.
	AI_Output(self,other,"DIA_Urshak_ZAUN_18_02");	//Palisáda dobrá pro válka. Ukrývá síla vojska a chrání skøety.
};


instance DIA_URSHAK_WASHASTDUVOR(C_INFO)
{
	npc = none_110_urshak;
	nr = 9;
	condition = dia_urshak_washastduvor_condition;
	information = dia_urshak_washastduvor_info;
	description = "Co budeš dìlat teï?";
};


func int dia_urshak_washastduvor_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hallo) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_washastduvor_info()
{
	AI_Output(other,self,"DIA_Urshak_WASHASTDUVOR_15_00");	//Co budeš dìlat teï?
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_18_01");	//Ur-Shak èekat, až skøetí zvìd vzít Ur-Shak k Hosh-Pak.
	AI_Output(other,self,"DIA_Urshak_WASHASTDUVOR_15_02");	//Kdo je Hosh-Pak?
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_18_03");	//Moc mocný šaman. Mít velký vliv na váleèníky a dìlat pro skøety velké plány.
	b_logentry(TOPIC_URSHAK,"Ur-Shak má v plánu setkat se se skøetím šamanem Hosh-Pakem a pøesvìdèit ho, aby ho pøijal do rady mezi ostatní šamany.");
	Info_ClearChoices(dia_urshak_washastduvor);
	Info_AddChoice(dia_urshak_washastduvor,DIALOG_BACK,dia_urshak_washastduvor_weiter);
	Info_AddChoice(dia_urshak_washastduvor,"Kde najdu toho Hosh-Paka?",dia_urshak_washastduvor_);
	Info_AddChoice(dia_urshak_washastduvor,"Tak proè teda za ním nejdeš?",dia_urshak_washastduvor_hoshpak);
};

func void dia_urshak_washastduvor_hoshpak()
{
	AI_Output(other,self,"DIA_Urshak_WASHASTDUVOR_hoshpak_15_00");	//Tak proè teda za ním nejdeš?
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_hoshpak_18_01");	//Ur-Shak zkoušet znovu a znovu získat èest a staré místo v šamaní rada.
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_hoshpak_18_02");	//Ale až do teï, Hosh-Pak neposlouchat Ur-Shak. Skøeti zabít Ur-Shak, když jeho vidìt bez zvìd. Ur-Shak muset mluvit s Hosh-Pak.
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_hoshpak_18_03");	//Možná dneska štìstí.
};

func void dia_urshak_washastduvor_()
{
	AI_Output(other,self,"DIA_Urshak_WASHASTDUVOR_Urshak_15_00");	//Kde najdu toho Hosh-Paka?
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_Urshak_18_01");	//Utáboøit se, kde vidìt skøetí bojovníky pøes les u velká sopka. Hosh-Pak tak moct ovládat váleèníky.
};

func void dia_urshak_washastduvor_weiter()
{
	Info_ClearChoices(dia_urshak_washastduvor);
};


instance DIA_URSHAK_HOSHPAKDEAD(C_INFO)
{
	npc = none_110_urshak;
	nr = 9;
	condition = dia_urshak_hoshpakdead_condition;
	information = dia_urshak_hoshpakdead_info;
	description = "Hosh-Pak je mrtvý.";
};


func int dia_urshak_hoshpakdead_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_washastduvor) && Npc_IsDead(hosh_pak) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_hoshpakdead_info()
{
	AI_Output(other,self,"DIA_Urshak_HOSHPAKDEAD_15_00");	//Hosh-Pak je mrtvý.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_01");	//Hosh-Pak mrtvý? RUSHTASOK!
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_02");	//Mé srdce tìžké jako kámen. Ur-Shak nikdy nezapomenout velký skøet, co udìlat Ur-Shak šaman.
	AI_Output(other,self,"DIA_Urshak_HOSHPAKDEAD_15_03");	//Rozumím, byl tvým uèitelem.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_04");	//Ur-Shak teï muset zbavit zármutku, muset dát Hosh-Pak poslední obøad. Ur-Shak muset jít.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_05");	//Pøítel radìj hned projít prùsmyk. Tady moc nebezpeèný.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_06");	//Ur-Shak øíct, když pøítel èlovìk umøít.
	b_logentry(TOPIC_URSHAK,"Hosh-Pak je mrtev. Mùj skøetí pøítel nyní míøí k jeho stanu a oplakává smrt svého mentora. Mìl bych ho nechat jít.");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,20);
	Npc_ExchangeRoutine(self,"Start");
	Wld_InsertNpc(orcwarrior_rest,"FP_CAMPFIRE_HOSHPAK_01");
	Wld_InsertNpc(orcwarrior_rest,"FP_CAMPFIRE_HOSHPAK_02");
};


instance DIA_URSHAK_GEH(C_INFO)
{
	npc = none_110_urshak;
	condition = dia_urshak_geh_condition;
	information = dia_urshak_geh_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_urshak_geh_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hoshpakdead) && ((Npc_GetDistToWP(self,"OW_HOSHPAK_04") < 1000) == FALSE) && (Npc_RefuseTalk(self) == FALSE) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_geh_info()
{
	AI_Output(self,other,"DIA_Urshak_GEH_18_00");	//Pøítel radìj hned projít prùsmyk.
	Npc_SetRefuseTalk(self,10);
	AI_StopProcessInfos(self);
};


instance DIA_URSHAK_HOSHPAKRACHE(C_INFO)
{
	npc = none_110_urshak;
	condition = dia_urshak_hoshpakrache_condition;
	information = dia_urshak_hoshpakrache_info;
	important = TRUE;
};


func int dia_urshak_hoshpakrache_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hoshpakdead) && (Npc_GetDistToWP(self,"OW_HOSHPAK_04") <= 1000) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_hoshpakrache_info()
{
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_00");	//(agresivnì) KHROTOK ! Já zjistil, že ty tady, když Hosh-Pak mrtvý. Ty udìlal velká chyba, cizinec.
	AI_Output(other,self,"DIA_Urshak_HOSHPAKRACHE_15_01");	//Já vìdìt, ty budeš tady. Ty hrál na mì habaïùra.
	AI_Output(other,self,"DIA_Urshak_HOSHPAKRACHE_15_02");	//Tvá pozice být víc, než ty rád pøipustit. Teï ty nebýt nic, jen nástroj zla.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_03");	//Cizinec má pravda. Ur-Shaka teï naplòovat jen nenávist a chu po pomsta.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_04");	//Ur-Shak vidí velká chyba, že vìøit cizinci. Ur-Shak litovat, že nazývat èlovìka pøítel a pomáhat mu, ne zabíjet.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_05");	//Cizinec nakonec opustit údolí a projít prùsmyk. Ur-Shak nezabít cizinec teï. Èest šamana Ur-Shak velet nezabíjet.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_06");	//Pøíštì my potkat, my nepøátelé. Bude líp ty teï odejít.
	AI_StopProcessInfos(self);
	URSHAK_SUCKED = TRUE;
	b_logentry(TOPIC_URSHAK,"Ur-Shak byl pøijat zpátky do rady skøetích šamanù a ocitl se tedy na stranì nepøítele. Radši bych se mu mìl vyhýbat, dokud se mi nepodaøí tu záležitost se skøety nìjak urovnat. To by ho mìlo uklidnit.");
	b_giveplayerxp(XP_URSHAKBECOMESSHAMAN);
};


instance DIA_URSHAK_KEINEWAHL(C_INFO)
{
	npc = none_110_urshak;
	condition = dia_urshak_keinewahl_condition;
	information = dia_urshak_keinewahl_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_urshak_keinewahl_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hoshpakrache) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_urshak_keinewahl_info()
{
	AI_Output(self,other,"DIA_Urshak_KEINEWAHL_18_00");	//Ty jít. Já nemluvit s cizinci.
	AI_StopProcessInfos(self);
	URSHAK_SUCKED = TRUE;
};

