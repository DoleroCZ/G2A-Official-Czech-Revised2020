
instance DIA_JORGEN_KAP3_EXIT(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 999;
	condition = dia_jorgen_kap3_exit_condition;
	information = dia_jorgen_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jorgen_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_jorgen_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JORGEN_PICKPOCKET(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 900;
	condition = dia_jorgen_pickpocket_condition;
	information = dia_jorgen_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_jorgen_pickpocket_condition()
{
	return c_beklauen(59,70);
};

func void dia_jorgen_pickpocket_info()
{
	Info_ClearChoices(dia_jorgen_pickpocket);
	Info_AddChoice(dia_jorgen_pickpocket,DIALOG_BACK,dia_jorgen_pickpocket_back);
	Info_AddChoice(dia_jorgen_pickpocket,DIALOG_PICKPOCKET,dia_jorgen_pickpocket_doit);
};

func void dia_jorgen_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_jorgen_pickpocket);
};

func void dia_jorgen_pickpocket_back()
{
	Info_ClearChoices(dia_jorgen_pickpocket);
};


instance DIA_JORGEN_HALLO(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 4;
	condition = dia_jorgen_hallo_condition;
	information = dia_jorgen_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jorgen_hallo_condition()
{
	if((KAPITEL == 3) && (MIS_SCKNOWSINNOSEYEISBROKEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_jorgen_hallo_info()
{
	AI_Output(self,other,"DIA_Jorgen_Hallo_07_00");	//Hej, ty!
	if((hero.guild == GIL_NOV) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Jorgen_Hallo_07_01");	//Vidím, e patøíš ke klášteru mágù.
		AI_Output(other,self,"DIA_Jorgen_Hallo_15_02");	//Ano, proè?
		AI_Output(self,other,"DIA_Jorgen_Hallo_07_03");	//Neuivili byste tam ještì jednoho dìlníka?
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_Hallo_07_04");	//Hej, ty, u jsi byl nìkdy v klášteøe?
		AI_Output(other,self,"DIA_Jorgen_Hallo_15_05");	//Moná, proè?
		AI_Output(self,other,"DIA_Jorgen_Hallo_07_06");	//A ještì poøád najímají nové lidi?
	};
	AI_Output(self,other,"DIA_Jorgen_Hallo_07_07");	//Nevìdìl jsem, kam jinam se obrátit.
};


instance DIA_JORGEN_NOVICE(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 6;
	condition = dia_jorgen_novice_condition;
	information = dia_jorgen_novice_info;
	permanent = FALSE;
	description = "Neprošel tudy nìjakı novic?";
};


func int dia_jorgen_novice_condition()
{
	if((MIS_NOVIZENCHASE == LOG_RUNNING) && (KAPITEL == 3) && (MIS_SCKNOWSINNOSEYEISBROKEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_jorgen_novice_info()
{
	AI_Output(other,self,"DIA_Jorgen_Novice_15_00");	//Neprošel tudy nìjakı novic?
	AI_Output(self,other,"DIA_Jorgen_Novice_07_01");	//No jasnì, tamhletudy.
	AI_PointAt(self,"NW_TROLLAREA_NOVCHASE_01");
	AI_Output(self,other,"DIA_Jorgen_Novice_07_02");	//Támhle z toho mostu skoèil do vody a plaval, jako by mìl v patách raloka.
	AI_StopPointAt(self);
};


instance DIA_JORGEN_MILTEN(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 5;
	condition = dia_jorgen_milten_condition;
	information = dia_jorgen_milten_info;
	permanent = FALSE;
	description = "Jestli míøíš do kláštera, mìl by sis promluvit s Miltenem...";
};


func int dia_jorgen_milten_condition()
{
	if((KAPITEL == 3) && (MIS_SCKNOWSINNOSEYEISBROKEN == FALSE) && (MIS_OLDWORLD == LOG_SUCCESS) && (miltennw.aivar[AIV_TALKEDTOPLAYER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_jorgen_milten_info()
{
	AI_Output(other,self,"DIA_Jorgen_Milten_15_00");	//Jestli míøíš do kláštera, mìl by sis promluvit s Miltenem, ten ti urèitì dokáe pomoci.
	AI_Output(self,other,"DIA_Jorgen_Milten_07_01");	//Co myslíš, pustí mì vùbec dovnitø?
	AI_Output(other,self,"DIA_Jorgen_Milten_15_02");	//Snad. Ale jak se tak na tebe dívám, jen tìko si tì dovedu pøedstavit v rouše novicù.
	AI_Output(self,other,"DIA_Jorgen_Milten_07_03");	//Dost tìch nesmyslù - jasnì e roucho novicù. To je pøesnì to, po èem baím, i kdy potom budu muset ohlodávat kùru ze stromù.
};


instance DIA_JORGEN_HOME(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 7;
	condition = dia_jorgen_home_condition;
	information = dia_jorgen_home_info;
	description = "Odkud jsi pøišel?";
};


func int dia_jorgen_home_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_jorgen_home_info()
{
	AI_Output(other,self,"DIA_Jorgen_Home_15_00");	//Odkud jsi pøišel?
	AI_Output(self,other,"DIA_Jorgen_Home_07_01");	//Bıval jsem kapitánem velrybáøské lodi, chlapèe. Moøe je mım domovem.
	AI_Output(self,other,"DIA_Jorgen_Home_07_02");	//Pøed pár mìsíci ale moji loï, starou dobrou Magdalenu, potopili piráti. A tak jsem tu zkejsnul.
	AI_Output(self,other,"DIA_Jorgen_Home_07_03");	//Vdycky jsem se chtìl vrátit zpátky na moøe, ale od té doby, co tu trèím, nevyplul z tohohle prokletého pøístavu ani jeden škuner.
	AI_Output(self,other,"DIA_Jorgen_Home_07_04");	//Jediná loï, která v Khorinisu kotví, je ta zatracená váleèná královská galéra - a tam nikoho dalšího nepøijmou.
	AI_Output(self,other,"DIA_Jorgen_Home_07_05");	//Tak co ještì mùu dìlat? U jsem zkoušel všechno - ve mìstì pro mì ádná práce není.
};


instance DIA_JORGEN_BECAREFULL(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 8;
	condition = dia_jorgen_becarefull_condition;
	information = dia_jorgen_becarefull_info;
	permanent = TRUE;
	description = "Udìlals dobøe, e jsi nikam nešel.";
};


func int dia_jorgen_becarefull_condition()
{
	if((KAPITEL == 3) && Npc_KnowsInfo(other,dia_jorgen_home))
	{
		return TRUE;
	};
};

func void dia_jorgen_becarefull_info()
{
	AI_Output(other,self,"DIA_Jorgen_BeCarefull_15_00");	//Udìlals dobøe, e jsi nikam nešel.
	AI_Output(self,other,"DIA_Jorgen_BeCarefull_07_01");	//ádné strachy. U jsem si všimnul, e v posledních dvou dnech je okolní divoèina zpropadenì nebezpeèná.
};


instance DIA_JORGEN_KAP4_EXIT(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 999;
	condition = dia_jorgen_kap4_exit_condition;
	information = dia_jorgen_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jorgen_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_jorgen_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JORGEN_NEUHIER(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 41;
	condition = dia_jorgen_neuhier_condition;
	information = dia_jorgen_neuhier_info;
	description = "Jak to v klášteøe jde?";
};


func int dia_jorgen_neuhier_condition()
{
	if(KAPITEL >= 4)
	{
		return TRUE;
	};
};

func void dia_jorgen_neuhier_info()
{
	AI_Output(other,self,"DIA_Jorgen_NEUHIER_15_00");	//Jak to v klášteøe jde?
	AI_Output(self,other,"DIA_Jorgen_NEUHIER_07_01");	//Pomalu tu z toho všeho blázním!
	if(Npc_KnowsInfo(other,dia_jorgen_milten))
	{
		AI_Output(self,other,"DIA_Jorgen_NEUHIER_07_02");	//Ale i tak ti dìkuju za pomoc. S Miltenovım pøispìním jsem tu opravdu získal místo.
		b_giveplayerxp(XP_AMBIENT);
	};
	if(hero.guild != GIL_KDF)
	{
		AI_Output(self,other,"DIA_Jorgen_NEUHIER_07_03");	//Akorát se mezi tìmi sebemrskaèskımi lidumily cítím jako blbec.
	};
	AI_Output(self,other,"DIA_Jorgen_NEUHIER_07_04");	//No, ale tìlu se nedá porouèet. Ne umøít hlady ve mìstì, radši budu dìlat, co mi novicové nakáou.
};


instance DIA_JORGEN_PERM4(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 400;
	condition = dia_jorgen_perm4_condition;
	information = dia_jorgen_perm4_info;
	permanent = TRUE;
	description = "Myslím, e se to poddá.";
};


func int dia_jorgen_perm4_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_jorgen_home) && Npc_KnowsInfo(other,dia_jorgen_neuhier) && (JORGENISCAPTAIN == FALSE))
	{
		return TRUE;
	};
};


var int dia_jorgen_perm4_onetime;

func void dia_jorgen_perm4_info()
{
	AI_Output(other,self,"DIA_Jorgen_PERM4_15_00");	//Myslím, e se to poddá.
	if((DIA_JORGEN_PERM4_ONETIME == FALSE) && (hero.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Jorgen_PERM4_07_01");	//Jenom si pøedstav - mám jim vyplít zahradu. Kdy to takhle pùjde dál, za chvíli se z toho zcvoknu.
		DIA_JORGEN_PERM4_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_Jorgen_PERM4_07_02");	//Jediné, co potøebuju, je zase stará dobrá paluba pod nohama.
};


instance DIA_JORGEN_KAP5_EXIT(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 999;
	condition = dia_jorgen_kap5_exit_condition;
	information = dia_jorgen_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jorgen_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_jorgen_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JORGEN_BEMYCAPTAIN(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 51;
	condition = dia_jorgen_bemycaptain_condition;
	information = dia_jorgen_bemycaptain_info;
	permanent = TRUE;
	description = "Moná bych ti mohl nabídnout místo kapitána.";
};


func int dia_jorgen_bemycaptain_condition()
{
	if((KAPITEL == 5) && (MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (MIS_PYROKARCLEARDEMONTOWER != LOG_SUCCESS) && Npc_KnowsInfo(other,dia_jorgen_home))
	{
		return TRUE;
	};
};


var int dia_jorgen_bemycaptain_onetime;

func void dia_jorgen_bemycaptain_info()
{
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN_15_00");	//Moná bych ti mohl nabídnout místo kapitána.
	if(DIA_JORGEN_BEMYCAPTAIN_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN_07_01");	//Nehoupeš mì, kámo? Jestli mluvíš pravdu, tak do toho urèitì jdu!
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN_07_02");	//Ehm - je tu ale menší problém. Vyjedl jsem tìm novicùm pùlku spiírny.
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN_07_03");	//Ti chlápkové jsou z toho celí nepøíèetní. Nemyslím, e by mì hlavní mág nechal takhle odejít.
		DIA_JORGEN_BEMYCAPTAIN_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN_07_04");	//Je mi líto, ale nejdøív si musím nìco vyøídit s Pyrokarem.
	Log_CreateTopic(TOPIC_CAPTAIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CAPTAIN,LOG_RUNNING);
	b_logentry(TOPIC_CAPTAIN,"Jorgen svolil, e se stane mım kapitánem, ale nejdøív za nìj musím zaplatit všechny dluhy v klášteøe.");
};


instance DIA_JORGEN_BEMYCAPTAIN2(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 52;
	condition = dia_jorgen_bemycaptain2_condition;
	information = dia_jorgen_bemycaptain2_info;
	description = "Tvùj úèet jsem u vyrovnal - jsi volnı.";
};


func int dia_jorgen_bemycaptain2_condition()
{
	if(MIS_PYROKARCLEARDEMONTOWER == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_jorgen_bemycaptain2_info()
{
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN2_15_00");	//Tvùj úèet jsem u vyrovnal - jsi volnı.
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN2_07_01");	//Opravdu? Jak jsi to zaøídil?
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN2_15_02");	//Do toho ti nic není.
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN2_07_03");	//No, vlastnì je mi to jedno. Ještì jednou ti teda miliónkrát dìkuju.
	if(SCGOTCAPTAIN == FALSE)
	{
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN2_07_04");	//A co ta tvoje nabídka? Mùu s tím poøád poèítat?
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN2_07_05");	//Skvìlé. A teï bychom odsud mìli zmizet.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"RausAusKloster");
	};
};


instance DIA_JORGEN_BEMYCAPTAIN3(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 53;
	condition = dia_jorgen_bemycaptain3_condition;
	information = dia_jorgen_bemycaptain3_info;
	description = "Buï mım kapitánem.";
};


func int dia_jorgen_bemycaptain3_condition()
{
	if(Npc_KnowsInfo(other,dia_jorgen_bemycaptain2) && (SCGOTCAPTAIN == FALSE))
	{
		return TRUE;
	};
};

func void dia_jorgen_bemycaptain3_info()
{
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN3_15_00");	//Buï mım kapitánem.
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN3_07_01");	//Je to pro mì èest, ale máš vùbec nìjakou loï a posádku?
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN3_07_02");	//Øekl bych, e budeme potøebovat aspoò pìt chlapù.
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN3_15_03");	//Dobøe, uvidím, co se dá dìlat. Zatím na mì poèkej v pøístavu.
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN3_07_04");	//Rozkaz, pane.
	AI_StopProcessInfos(self);
	SCGOTCAPTAIN = TRUE;
	JORGENISCAPTAIN = TRUE;
	Npc_ExchangeRoutine(self,"WaitForShipCaptain");
	b_giveplayerxp(XP_CAPTAIN_SUCCESS);
};


instance DIA_JORGEN_LOSFAHREN(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 59;
	condition = dia_jorgen_losfahren_condition;
	information = dia_jorgen_losfahren_info;
	permanent = TRUE;
	description = "Jsi pøipraven mì pøevézt na ostrov?";
};


func int dia_jorgen_losfahren_condition()
{
	if((JORGENISCAPTAIN == TRUE) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_jorgen_losfahren_info()
{
	AI_Output(other,self,"DIA_Jorgen_LOSFAHREN_15_00");	//Jsi pøipraven mì pøevézt na ostrov?
	if(b_captainconditions(self) == TRUE)
	{
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_01");	//Ale samozøejmì. Dej mi tu mapu.
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_02");	//Skvìlé, tak napnìme plachty, a u jsme odsud pryè!
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_03");	//Radši by sis mìl nejdøív sbalit všechna fidlátka. Z moøe se sem u nemùeme vrátit.
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_04");	//A všechno vyøídíš, tak si trochu zdøímni - v kapitánské kajutì máš pøipravenou pryènu. Dobrou noc.
		AI_StopProcessInfos(self);
		b_captaincallsallonboard(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_05");	//Potøebuješ loï, posádku aspoò pìti muù a námoøní mapu, podle které bych mohl plavbu navigovat.
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_06");	//Nemùeme odrazit, dokud neuvidím, e jsi sehnal všechno potøebné.
		AI_StopProcessInfos(self);
	};
};


instance DIA_JORGEN_PERM5_NOTCAPTAIN(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 59;
	condition = dia_jorgen_perm5_notcaptain_condition;
	information = dia_jorgen_perm5_notcaptain_info;
	permanent = TRUE;
	description = "Jak se máš?";
};


func int dia_jorgen_perm5_notcaptain_condition()
{
	if(Npc_KnowsInfo(other,dia_jorgen_bemycaptain2) && (SCGOTCAPTAIN == TRUE) && (JORGENISCAPTAIN == FALSE))
	{
		return TRUE;
	};
};


var int dia_jorgen_perm5_notcaptain_xpgiven;

func void dia_jorgen_perm5_notcaptain_info()
{
	AI_Output(other,self,"DIA_Jorgen_PERM5_NOTCAPTAIN_15_00");	//Jak se máš?
	if(Npc_GetDistToWP(self,"NW_BIGFARM_KITCHEN_OUT_06") < 1000)
	{
		AI_Output(self,other,"DIA_Jorgen_PERM5_NOTCAPTAIN_07_01");	//Fajn, tady to není a tak špatné.
		AI_Output(self,other,"DIA_Jorgen_PERM5_NOTCAPTAIN_07_02");	//Ještì poøád sice musím dìlat takové pitomosti jako tøeba pást ovce, ale poøád to nejsou ani z pùlky takoví omezenci jako ti v klášteøe.
		if(DIA_JORGEN_PERM5_NOTCAPTAIN_XPGIVEN == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			DIA_JORGEN_PERM5_NOTCAPTAIN_XPGIVEN = TRUE;
		};
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_PERM5_NOTCAPTAIN_07_03");	//Budu si muset najít novı pøíbytek. Uvidíme, kam mì vítr zavane pøíštì.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"RausAusKloster");
	};
};


instance DIA_JORGEN_KAP6_EXIT(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 999;
	condition = dia_jorgen_kap6_exit_condition;
	information = dia_jorgen_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jorgen_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_jorgen_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};

