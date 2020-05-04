
instance DIA_ADDON_MIGUEL_EXIT(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 999;
	condition = dia_addon_miguel_exit_condition;
	information = dia_addon_miguel_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_miguel_exit_condition()
{
	return TRUE;
};

func void dia_addon_miguel_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MIGUEL_PICKPOCKET(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 900;
	condition = dia_addon_miguel_pickpocket_condition;
	information = dia_addon_miguel_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_addon_miguel_pickpocket_condition()
{
	return c_beklauen(40,48);
};

func void dia_addon_miguel_pickpocket_info()
{
	Info_ClearChoices(dia_addon_miguel_pickpocket);
	Info_AddChoice(dia_addon_miguel_pickpocket,DIALOG_BACK,dia_addon_miguel_pickpocket_back);
	Info_AddChoice(dia_addon_miguel_pickpocket,DIALOG_PICKPOCKET,dia_addon_miguel_pickpocket_doit);
};

func void dia_addon_miguel_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_miguel_pickpocket);
};

func void dia_addon_miguel_pickpocket_back()
{
	Info_ClearChoices(dia_addon_miguel_pickpocket);
};


instance DIA_ADDON_MIGUEL_HI(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 1;
	condition = dia_addon_miguel_hi_condition;
	information = dia_addon_miguel_hi_info;
	permanent = FALSE;
	description = "Co tu dìláš?";
};


func int dia_addon_miguel_hi_condition()
{
	return TRUE;
};

func void dia_addon_miguel_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Hi_15_00");	//Co tu dìláš?
	if(Wld_IsTime(6,0,22,0))
	{
		AI_Output(other,self,"DIA_Addon_Miguel_Hi_15_01");	//Hledáš nìco?
		AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_02");	//Rostliny - hledám rostliny.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_03");	//Obvykle hledám rostliny.
	};
	AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_04");	//Vìtšina z vìcí, které zde rostou, mohou bıt k nìèemu uiteèné.
	AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_05");	//Mnoho rostlin má léèivı efekt a tráva z bain se dá kouøit.
	AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_06");	//Pracoval jsem pro alchymistu pøedtím, ne mì hodili za bariéru.
};


instance DIA_ADDON_MIGUEL_STORY(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 2;
	condition = dia_addon_miguel_story_condition;
	information = dia_addon_miguel_story_info;
	permanent = FALSE;
	description = "Èím ses provinil?";
};


func int dia_addon_miguel_story_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_miguel_hi))
	{
		return TRUE;
	};
};

func void dia_addon_miguel_story_info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Story_15_00");	//Èím ses provinil?
	AI_Output(self,other,"DIA_Addon_Miguel_Story_11_01");	//Experimentoval jsem s lektvary, které mohou ovlivòovat a manipulovat s myslí.
	AI_Output(self,other,"DIA_Addon_Miguel_Story_11_02");	//Ignaz, mùj mistr, vypil jednou jeden z mıch experimentù místo jeho veèerního vína.
	AI_Output(self,other,"DIA_Addon_Miguel_Story_11_03");	//Dobøe, to ho poznamenalo ... trochu nerozumnı èin. A od té doby je jeho mysl trochu ... Jakoby zamlená.
	AI_Output(self,other,"DIA_Addon_Miguel_Story_11_04");	//Mágové jsou zodpovìdní za to, e mì hodili do vìzìòské kolonie. Prı za vızkum "zakázanıch vìdomostí".
};


instance DIA_ADDON_MIGUEL_LAGER(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 3;
	condition = dia_addon_miguel_lager_condition;
	information = dia_addon_miguel_lager_info;
	permanent = FALSE;
	description = "Co mi mùeš øíci o táboøe?";
};


func int dia_addon_miguel_lager_condition()
{
	return TRUE;
};

func void dia_addon_miguel_lager_info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Lager_15_00");	//Co mi mùeš øíci o táboøe?
	AI_Output(self,other,"DIA_Addon_Miguel_Lager_11_01");	//Ne mnoho. Nikdy jsem tam nebyl.
	AI_Output(self,other,"DIA_Addon_Miguel_Lager_11_02");	//Pouze Ravenovi lidé jsou zde od zaèátku. Všichni ostatní pøišli pozdìji nebo stále èekají na najmutí novıch dìlníkù. Jako já.
};


instance DIA_ADDON_MIGUEL_WHEREFROM(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 4;
	condition = dia_addon_miguel_wherefrom_condition;
	information = dia_addon_miguel_wherefrom_info;
	permanent = FALSE;
	description = "Odkud jsi?";
};


func int dia_addon_miguel_wherefrom_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_miguel_hi) || Npc_KnowsInfo(other,dia_addon_miguel_lager))
	{
		return TRUE;
	};
};

func void dia_addon_miguel_wherefrom_info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_WhereFrom_15_00");	//Jak jsi se sem dostal?
	AI_Output(self,other,"DIA_Addon_Miguel_WhereFrom_11_01");	//Dobøe, hádám, e stejnì jako ty. Pøes moøe s piráty.
	AI_Output(self,other,"DIA_Addon_Miguel_WhereFrom_11_02");	//Údolí je kompletnì oddìleno od zbytku ostrova. Mùeš ho pouze dosáhnout ze strany od moøe.
	AI_Output(other,self,"DIA_Addon_Miguel_WhereFrom_15_03");	//(vìdomì) Pøesnì.
};


instance DIA_ADDON_MIGUEL_ANGEFORDERT(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 4;
	condition = dia_addon_miguel_angefordert_condition;
	information = dia_addon_miguel_angefordert_info;
	permanent = FALSE;
	description = "Kdy obvykle potøebují nové pracovníky?";
};


func int dia_addon_miguel_angefordert_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_miguel_lager))
	{
		return TRUE;
	};
};

func void dia_addon_miguel_angefordert_info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Angefordert_15_00");	//Kdy obvykle potøebují nové pracovníky?
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_01");	//O, kdykoliv jim nìkdo chybí.
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_02");	//Náhradník je potøeba, kdy je nìkterı z dìlníkù zabit dùlním èervem.
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_03");	//A nìkdy se chlapi pozabíjejí také mezi sebou. Ale není to tak zlé, jak to bıvalo kdysi.
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_04");	//Raven to z nìjakého dùvodu organizuje a stará se o to, aby nikdo nepracoval v dole ve stejnou dobu.
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_05");	//Nevím, jak to pøesnì funguje. Nikdy jsem tam nebyl.
};


instance DIA_ADDON_MIGUEL_FORTUNO(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 6;
	condition = dia_addon_miguel_fortuno_condition;
	information = dia_addon_miguel_fortuno_info;
	permanent = FALSE;
	description = "O Fortunovi ...";
};


func int dia_addon_miguel_fortuno_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_fortuno_free))
	{
		return TRUE;
	};
};

func void dia_addon_miguel_fortuno_info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Fortuno_15_00");	//Fortuno se zdá "pomatenı". Hádal bych, e nìjakı lektvar by mu mohl vrátit pamì.
	AI_Output(self,other,"DIA_Addon_Miguel_Fortuno_11_01");	//Fortuno? To je jeden z Ravenovıch sluebníkù.
	AI_Output(other,self,"DIA_Addon_Miguel_Fortuno_15_02");	//Dobrá, byl. Nyní je z nìj troska. A to je Ravenova chyba.
	AI_Output(self,other,"DIA_Addon_Miguel_Fortuno_11_03");	//Raven? Nikdy jsem si o nìm moc nemyslel. Hmm, dobrá. Bohuel, nemohu namíchat lektvar zde v bainách.
	AI_Output(other,self,"DIA_Addon_Miguel_Fortuno_15_04");	//Mohl bych namíchat lektvar. V táboøe je alchymistická kolona. Pouze kdybych mìl recept ...
	AI_Output(self,other,"DIA_Addon_Miguel_Fortuno_11_05");	//Buï opatrnı. Namíchat tento lektvar je nebezpeèné.
	b_giveinvitems(self,other,itwr_addon_mcelixier_01,1);
	AI_Output(self,other,"DIA_Addon_Miguel_Fortuno_11_06");	//Tento lektvar je smrtící, pokud je nìco udìláno špatnì. A u v ingrediencích nebo v procesu.
	AI_Output(other,self,"DIA_Addon_Miguel_Fortuno_15_07");	//Budu opatrnı.
	b_logentry(TOPIC_ADDON_FORTUNO,"Miguel mi dal recept na lektvarm tak mùu pomoci Fortunovi znovu získat pamì. Mìl bych namíchat lektvar pouze pokud budu mít plné vìdomosti s všemi ingrediencemi. Jinak by mohl bıt smrtelnı.");
};


instance DIA_ADDON_MIGUEL_BRAU(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 7;
	condition = dia_addon_miguel_brau_condition;
	information = dia_addon_miguel_brau_info;
	permanent = FALSE;
	description = "Co mì dál mùeš nauèit?";
};


func int dia_addon_miguel_brau_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_miguel_story))
	{
		return TRUE;
	};
};

func void dia_addon_miguel_brau_info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_BRAU_15_00");	//Co mì dál mùeš nauèit?
	AI_Output(self,other,"DIA_Addon_Miguel_BRAU_11_01");	//Nic. Pøišel jsem zde, abych si vydìlal nìjaké peníze. Vydìlávám si prodáváním rostlin dokud mì nepustí do tábora.
	AI_Output(self,other,"DIA_Addon_Miguel_BRAU_11_02");	//Nicménì, mohu ti poskytnout nìkolik lektvarù, jestli potøebuješ.
	Log_CreateTopic(TOPIC_ADDON_BDT_TRADER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_BDT_TRADER,"U Miguela si mohu kupovat rostliny a lektvary");
};


instance DIA_ADDON_MIGUEL_TRADE(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 888;
	condition = dia_addon_miguel_trade_condition;
	information = dia_addon_miguel_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE;
};


func int dia_addon_miguel_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_miguel_brau))
	{
		return TRUE;
	};
};

func void dia_addon_miguel_trade_info()
{
	b_say(other,self,"$TRADE_1");
	b_givetradeinv(self);
};

