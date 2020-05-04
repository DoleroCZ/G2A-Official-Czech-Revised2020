
instance DIA_HARAD_EXIT(C_INFO)
{
	npc = vlk_412_harad;
	nr = 999;
	condition = dia_harad_exit_condition;
	information = dia_harad_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_harad_exit_condition()
{
	return TRUE;
};

func void dia_harad_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HARAD_HALLO(C_INFO)
{
	npc = vlk_412_harad;
	nr = 2;
	condition = dia_harad_hallo_condition;
	information = dia_harad_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_harad_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_harad_hallo_info()
{
	AI_Output(self,other,"DIA_Harad_Hallo_12_00");	//(nevrle) Co chceš?
};


instance DIA_HARAD_ARBEIT(C_INFO)
{
	npc = vlk_412_harad;
	nr = 1;
	condition = dia_harad_arbeit_condition;
	information = dia_harad_arbeit_info;
	permanent = FALSE;
	description = "Hledám práci!";
};


func int dia_harad_arbeit_condition()
{
	return TRUE;
};

func void dia_harad_arbeit_info()
{
	AI_Output(other,self,"DIA_Harad_Arbeit_15_00");	//Hledám práci!
	AI_Output(self,other,"DIA_Harad_Arbeit_12_01");	//Hm - hodil by se mi novı uèedník.
	AI_Output(self,other,"DIA_Harad_Arbeit_12_02");	//Brian brzy dokonèí své uèení a potom opustí mìsto.
	AI_Output(self,other,"DIA_Harad_Arbeit_12_03");	//Umíš nìco?
	AI_Output(other,self,"DIA_Harad_Arbeit_15_04");	//Jestli máš na mysli kováøství...
	AI_Output(self,other,"DIA_Harad_Arbeit_12_05");	//Ne, to jsem zrovna nemyslel.
	AI_Output(self,other,"DIA_Harad_Arbeit_12_06");	//Døív nebo pozdìji skøeti celé tohle mìsto obklíèí a pak budou nìco platní pouze ti, kteøí je dokáí ubránit.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Harad_Arbeit_12_07");	//A já si do uèení nevezmu ádného budiknièemu, kterı pøi první známce potíí uteèe z mìsta se enami a ostatními poseroutky, místo aby zùstal tady a bránil pevnost.
	};
	Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
	b_logentry(TOPIC_LEHRLING,"Pokud se mi podaøí pøesvìdèit Harada, e nejsem ádnı budiknièemu, pøijme mì za svého uènì.");
};


instance DIA_HARAD_TAUGENICHTS(C_INFO)
{
	npc = vlk_412_harad;
	nr = 1;
	condition = dia_harad_taugenichts_condition;
	information = dia_harad_taugenichts_info;
	permanent = FALSE;
	description = "Já nejsem ádnı budiknièemu!";
};


func int dia_harad_taugenichts_condition()
{
	if(Npc_KnowsInfo(other,dia_harad_arbeit))
	{
		return TRUE;
	};
};

func void dia_harad_taugenichts_info()
{
	AI_Output(other,self,"DIA_Harad_Taugenichts_15_00");	//Já nejsem ádnı budiknièemu!
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_01");	//To jsou silná slova! Mùeš to ale podloit i nìjakımi skutky?
	AI_Output(other,self,"DIA_Harad_Taugenichts_15_02");	//A to jakımi?
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_03");	//Pøines mi nìjakou skøetí zbraò.
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_04");	//Skøeti u byli zpozorováni pøímo u mìsta, take s trochou štìstí nebudeš hledat dlouho.
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_05");	//Jestli se ti povede nìjakého skolit, pak tì pøijmu do uèení.
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_06");	//Pokud s tím tedy budou souhlasit i ostatní mistøi.
	MIS_HARAD_ORC = LOG_RUNNING;
	Log_CreateTopic(TOPIC_HARADORK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HARADORK,LOG_RUNNING);
	b_logentry(TOPIC_HARADORK,"Za mìstem se usadil skøet, kterého mám na prosbu kováøe Harada zabít. Jako dùkaz mu postaèí jakákoliv skøetí zbraò.");
};


instance DIA_HARAD_ORCRUNNING(C_INFO)
{
	npc = vlk_412_harad;
	nr = 1;
	condition = dia_harad_orcrunning_condition;
	information = dia_harad_orcrunning_info;
	permanent = FALSE;
	description = "Promluvme si ještì o té skøetí vìci...";
};


func int dia_harad_orcrunning_condition()
{
	if((MIS_HARAD_ORC == LOG_RUNNING) && (HARAD_HAKONMISSION == FALSE))
	{
		return TRUE;
	};
};

func void dia_harad_orcrunning_info()
{
	AI_Output(other,self,"DIA_Harad_OrcRunning_15_00");	//Promluvme si ještì o té skøetí vìci...
	AI_Output(self,other,"DIA_Harad_OrcRunning_12_01");	//(stroze) Co?
	Info_ClearChoices(dia_harad_orcrunning);
	Info_AddChoice(dia_harad_orcrunning,"Tvùj skøet u je teï mrtvı!",dia_harad_orcrunning_done);
	Info_AddChoice(dia_harad_orcrunning,"Skøet je zatracenì tuhı protivník...",dia_harad_orcrunning_toohard);
};

func void dia_harad_orcrunning_toohard()
{
	AI_Output(other,self,"DIA_Harad_OrcRunning_TooHard_15_00");	//Ale skøet je zatracenì tuhı protivník.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_01");	//Hm - jak tak na tebe koukám, moná máš pravdu. Jsi fakt docela vyle, ale to se mùe zmìnit.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_02");	//Stejnì mi musíš dokázat, e se nebojíš bojovat.
	AI_Output(other,self,"DIA_Harad_OrcRunning_TooHard_15_03");	//Take by to mohlo bıt nìco menšího?
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_04");	//Hm - (pøemıšlí) Hakon, co na trišti obchoduje se zbranìmi, se mi svìøil, e ho pøed pár dny pøepadli banditi.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_05");	//Prı se potulují nìkde za jiní branou.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_06");	//Ti zbabìlí lupièi nejspíš moc rozumu nepobrali.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_07");	//Tak je všechny pochytej - a do posledního! Tak mi dokáeš, e nám tady ve mìstì snad pøece jen budeš nìco platnı.
	HARAD_HAKONMISSION = TRUE;
	Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
	if(MIS_HAKONBANDITS != LOG_RUNNING)
	{
		b_logentry(TOPIC_LEHRLING,"Harad mi øekl, e nìjací bandité okradli za mìstem kupce Hakona. Jestli se mi je podaøí dostihnout, pøesvìdèím ho, e za nìco stojím. Mìl bych si tedy promluvit s Hakonem - snad bude spíš vìdìt, kde se ti bandité potloukají.");
	}
	else
	{
		b_logentry(TOPIC_LEHRLING,"Harad mi øekl, e nìjací bandité okradli za mìstem kupce Hakona. Jestli se mi je podaøí dostihnout, pøesvìdèím ho, e za nìco stojím.");
	};
	Info_ClearChoices(dia_harad_orcrunning);
};

func void dia_harad_orcrunning_done()
{
	AI_Output(other,self,"DIA_Harad_OrcRunning_Done_15_00");	//Jako by ten skøet byl u teï mrtvı!
	AI_Output(self,other,"DIA_Harad_OrcRunning_Done_12_01");	//Dobøe! Tak teï pøestaò plıtvat dechem a koukej, a za tebe mluví èiny!
	Info_ClearChoices(dia_harad_orcrunning);
};


instance DIA_HARAD_ORCSUCCESS(C_INFO)
{
	npc = vlk_412_harad;
	nr = 1;
	condition = dia_harad_orcsuccess_condition;
	information = dia_harad_orcsuccess_info;
	permanent = FALSE;
	description = "Získal jsem tu skøetí zbraò, jak jsi chtìl.";
};


func int dia_harad_orcsuccess_condition()
{
	if(MIS_HARAD_ORC == LOG_RUNNING)
	{
		if((Npc_HasItems(other,itmw_2h_orcaxe_01) > 0) || (Npc_HasItems(other,itmw_2h_orcaxe_02) > 0) || (Npc_HasItems(other,itmw_2h_orcaxe_03) > 0) || (Npc_HasItems(other,itmw_2h_orcaxe_04) > 0) || (Npc_HasItems(other,itmw_2h_orcsword_01) > 0))
		{
			return TRUE;
		};
	};
};

func void dia_harad_orcsuccess_info()
{
	AI_Output(other,self,"DIA_Harad_OrcSuccess_15_00");	//Získal jsem tu skøetí zbraò, jak jsi chtìl.
	AI_Output(self,other,"DIA_Harad_OrcSuccess_12_01");	//Uka...
	if(Npc_HasItems(other,itmw_2h_orcaxe_01) > 0)
	{
		b_giveinvitems(other,self,itmw_2h_orcaxe_01,1);
	}
	else if(Npc_HasItems(other,itmw_2h_orcaxe_02) > 0)
	{
		b_giveinvitems(other,self,itmw_2h_orcaxe_02,1);
	}
	else if(Npc_HasItems(other,itmw_2h_orcaxe_03) > 0)
	{
		b_giveinvitems(other,self,itmw_2h_orcaxe_03,1);
	}
	else if(Npc_HasItems(other,itmw_2h_orcaxe_04) > 0)
	{
		b_giveinvitems(other,self,itmw_2h_orcaxe_04,1);
	}
	else
	{
		b_giveinvitems(other,self,itmw_2h_orcsword_01,1);
	};
	if(HARAD_HAKONMISSION == TRUE)
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_02");	//Tak tys to PØECE dokázal! Tos tedy fakt dobrı!
	};
	AI_Output(self,other,"DIA_Harad_OrcSuccess_12_03");	//Takovou zbraò u jsem nemìl v ruce, ani nepamatuju - naposledy, kdy jsem slouil jako voják ve skøetí válce.
	AI_Output(self,other,"DIA_Harad_OrcSuccess_12_04");	//To byly krušné èasy, to ti povím.
	if(PLAYER_ISAPPRENTICE == APP_HARAD)
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_05");	//Já vìdìl, e udìlám dobøe, kdy tì pøijmu do uèení. Skvìlá práce!
	}
	else if(PLAYER_ISAPPRENTICE == APP_NONE)
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_06");	//Nevìøil jsem, e to zvládneš. Je to obdivuhodné.
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_07");	//Škoda e ses rozhodl pro jinou dráhu.
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_08");	//Opravdu bych tu pro tebe našel uplatnìní.
	};
	MIS_HARAD_ORC = LOG_SUCCESS;
	b_giveplayerxp(XP_HARAD_ORC);
	b_logentry(TOPIC_LEHRLING,"Harad mì pøijme jako svého uèedníka, pokud s tím budou souhlasit i ostatní mistøi.");
};


var int harad_startguild;

instance DIA_HARAD_LEHRLING(C_INFO)
{
	npc = vlk_412_harad;
	nr = 1;
	condition = dia_harad_lehrling_condition;
	information = dia_harad_lehrling_info;
	permanent = TRUE;
	description = "Kdy mùu jako tvùj uèedník zaèít?";
};


func int dia_harad_lehrling_condition()
{
	if(Npc_KnowsInfo(other,dia_harad_arbeit) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_harad_lehrling_info()
{
	var int stimmen;
	stimmen = 0;
	AI_Output(other,self,"DIA_Harad_LEHRLING_15_00");	//Kdy mùu jako tvùj uèedník zaèít?
	if((MIS_HARAD_ORC == LOG_SUCCESS) || ((MIS_HAKONBANDITS == LOG_SUCCESS) && (HARAD_HAKONMISSION == TRUE)))
	{
		if(MIS_HARAD_ORC == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_01");	//Chlap, kterı dokáe skolit skøeta, se nám opravdu hodí.
			if(MIS_HAKONBANDITS == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_02");	//Krom toho se mi Hakon pochlubil, jak stateènì ses vypoøádal s bandity. To tì šlechtí!
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_03");	//Sice jsi nezabil ádného skøeta, ale Hakon se chlubil, jak skvìle ses vypoøádal s bandity. To tì šlechtí!
		};
		AI_Output(self,other,"DIA_Harad_LEHRLING_12_04");	//Co se mì tıèe, mùeš zaèít tøeba hned.
		stimmen = stimmen + 1;
		AI_Output(self,other,"DIA_Harad_LEHRLING_12_05");	//A co se tıèe ostatních mistrù...
		if(thorben.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(MIS_THORBEN_GETBLESSINGS == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_06");	//Thorben ti dal své poehnání.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_07");	//Starı dobrı Thorben by byl rád, kdyby sis napøed vyprosil boí poehnání. Myslím, e to je dobrı nápad.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_08");	//Thorben prı s tebou ještì nikdy nemluvil.
		};
		if(bosper.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_09");	//Bosper se mi to snail vymluvit - chce tì toti za uèedníka sám.
			if((MIS_BOSPER_BOGEN == LOG_SUCCESS) || (MIS_BOSPER_WOLFFURS == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_10");	//Mìl jsem s ním na tohle téma krátkou, ale ostrou diskusi.
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_11");	//Nakonec souhlasil.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_12");	//Poádal mì, zda bych mu nedovolil, aby ti mohl svou profesi aspoò pøedstavit.
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_13");	//Take si to omrkni - potom se mùeš vdycky rozhodnout. Tedy leda e bys nechtìl jeho hlas, samozøejmì.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_14");	//A Bosper tì zatím vùbec nezná.
		};
		if(constantino.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(b_getgreatestpetzcrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_15");	//Constantinovi je jako vdycky všecko jedno. Co se jeho tıèe, tak prı mùeš zaèít, u koho chceš.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_16");	//Constantino tvrdí, es tady ve mìstì spáchal nìjakı zloèin - je to pravda?
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_17");	//Jestli jo, tak bys to mìl jít okamitì napravit!
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_18");	//Constantino o tobì ještì nikdy neslyšel.
		};
		if(matteo.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(MIS_MATTEO_GOLD == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_19");	//A Matteo hlásí, es mu vrátil jeho zlato. Zdá se mi, e jsi opravdu èestnı mu.
				stimmen = stimmen + 1;
			}
			else if(MIS_MATTEO_GOLD == LOG_RUNNING)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_20");	//A Matteo hlásí, e mu ještì poøád nìco dluíš. Nevím, co mezi sebou máte, ale mìl bys to dát rychle do poøádku.
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_21");	//A Matteo prı s tebou na tohle téma ještì vùbec nemluvil.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_22");	//A Matteo tì prı ve svém krámku ještì nevidìl.
		};
		if(stimmen >= 4)
		{
			if(stimmen == 5)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_23");	//To znamená, es získal doporuèení ode všech mistrù!
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_24");	//To znamená, es získal doporuèení od ètyø mistrù. Co pro pøijetí do uèení staèí.
			};
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_25");	//Chceš tedy vstoupit do uèení ke mnì?
			Info_ClearChoices(dia_harad_lehrling);
			Info_AddChoice(dia_harad_lehrling,"Dobøe - rozmyslím si to.",dia_harad_lehrling_later);
			Info_AddChoice(dia_harad_lehrling,"Jdu do toho!",dia_harad_lehrling_ok);
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_26");	//Potøebuješ doporuèení alespoò od ètyø mistrù, jinak tì nikdo v dolní èásti mìsta do uèení nepøijme.
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_27");	//Mìl by sis proto promluvit se všemi, které jsi ještì nepøesvìdèil.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_LEHRLING_12_28");	//Dokud mi nedokáeš, e nejsi úplnı budiknièemu, nemáš šanci.
	};
};

func void dia_harad_lehrling_ok()
{
	AI_Output(other,self,"DIA_Harad_LEHRLING_OK_15_00");	//Jdu do toho!
	AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_01");	//Vıbornì! A teï tì nauèím, jak vykovat pìknı meè.
	if(PLAYER_TALENT_SMITH[WEAPON_COMMON] == TRUE)
	{
		AI_Output(other,self,"DIA_Harad_LEHRLING_OK_15_02");	//To u umím!
		AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_03");	//No tak tím líp!
	};
	if(other.attribute[ATR_STRENGTH] < (T_MED - 30))
	{
		AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_04");	//Krom toho bys mìl taky trochu posilovat. Vdy se mi úplnì ztrácíš pøed oèima!
	};
	PLAYER_ISAPPRENTICE = APP_HARAD;
	Npc_ExchangeRoutine(lothar,"START");
	HARAD_STARTGUILD = other.guild;
	HARAD_LEHRLING_DAY = Wld_GetDay();
	Wld_AssignRoomToGuild("schmied",GIL_NONE);
	MIS_APPRENTICE = LOG_SUCCESS;
	b_logentry(TOPIC_BONUS,"Harad mì pøijal za uèedníka. Nyní mám pøístup i do horní ètvrti.");
	b_logentry(TOPIC_BONUS,"Harad za dobrou cenu odkoupí zbranì, které vykovám.");
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_giveplayerxp(XP_LEHRLING);
	b_logentry(TOPIC_CITYTEACHER,"Harad mì vyuèí kováøskému umìní a také se s jeho pomocí mohu stát silnìjším.");
	Info_ClearChoices(dia_harad_lehrling);
};

func void dia_harad_lehrling_later()
{
	AI_Output(other,self,"DIA_Harad_LEHRLING_Later_15_00");	//Dobøe - rozmyslím si to.
	if(!Npc_IsDead(brian))
	{
		AI_Output(self,other,"DIA_Harad_LEHRLING_Later_12_01");	//ádnı spìch, Brian tu ještì nìjakou dobu zùstane.
	};
	Info_ClearChoices(dia_harad_lehrling);
};


instance DIA_HARAD_ZUSTIMMUNG(C_INFO)
{
	npc = vlk_412_harad;
	nr = 2;
	condition = dia_harad_zustimmung_condition;
	information = dia_harad_zustimmung_info;
	permanent = TRUE;
	description = "Mohu se zapsat do uèení k nìkterému z ostatních mistrù?";
};


func int dia_harad_zustimmung_condition()
{
	if((PLAYER_ISAPPRENTICE == APP_NONE) && Npc_KnowsInfo(other,dia_harad_arbeit))
	{
		return TRUE;
	};
};


var int dia_harad_zustimmung_permanent;

func void dia_harad_zustimmung_info()
{
	AI_Output(other,self,"DIA_Harad_Zustimmung_15_00");	//Mohu se zapsat do uèení k nìkterému z ostatních mistrù?
	if((MIS_HARAD_ORC == LOG_SUCCESS) || ((MIS_HAKONBANDITS == LOG_SUCCESS) && (HARAD_HAKONMISSION == TRUE)))
	{
		AI_Output(self,other,"DIA_Harad_Zustimmung_12_01");	//Jsi dobrı èlovìk.
		if(MIS_HAKONBANDITS == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Harad_Zustimmung_12_02");	//Hakon mi líèil, jak ses vypoøádal s bandity.
		};
		AI_Output(self,other,"DIA_Harad_Zustimmung_12_03");	//Dám ti své doporuèení.
		if(DIA_HARAD_ZUSTIMMUNG_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_ZUSTIMMUNG);
			DIA_HARAD_ZUSTIMMUNG_PERMANENT = TRUE;
		};
		b_logentry(TOPIC_LEHRLING,"Harad mì doporuèí, pokud se budu chtít stát uèedníkem nìkde jinde.");
		if(!Npc_IsDead(brian))
		{
			AI_Output(self,other,"DIA_Harad_Zustimmung_12_04");	//Brian tu ještì nìjakou dobu pobude. A èasem jistì najdu jiného siláka, kterı ho zastoupí.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_Zustimmung_12_05");	//Ostatní mistøi ti své svolení klidnì dát mohou, ale já tì nedoporuèím, dokud mì nepøesvìdèíš, e nejsi jenom neschopné jelito!
	};
};


var int harad_milkommentar;
var int harad_palkommentar;
var int harad_innoskommentar;

instance DIA_HARAD_ALSLEHRLING(C_INFO)
{
	npc = vlk_412_harad;
	nr = 1;
	condition = dia_harad_alslehrling_condition;
	information = dia_harad_alslehrling_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_harad_alslehrling_condition()
{
	if((PLAYER_ISAPPRENTICE == APP_HARAD) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_harad_alslehrling_info()
{
	if((other.guild == GIL_MIL) && (HARAD_STARTGUILD != GIL_MIL) && (HARAD_MILKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_00");	//Take tys vstoupil do øad domobrany? Jsem na tebe hrdı!
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_01");	//Bìhem sluby v armádì nejspíš nebudeš moci zároveò plnit své uèednické povinnosti. Ani to od tebe neèekám.
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_02");	//Ale kdy budeš nìco potøebovat, klidnì pøijï.
		HARAD_MILKOMMENTAR = TRUE;
	}
	else if((other.guild == GIL_PAL) && (HARAD_STARTGUILD != GIL_PAL) && (HARAD_PALKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_03");	//Koukám, e ses dokázal dostat mezi paladiny!
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_04");	//Jsem rád, e jsem tì pøijal do uèení. I kdy jsi za kovadlinou zrovna moc èasu nestrávil.
		HARAD_PALKOMMENTAR = TRUE;
	}
	else if(((other.guild == GIL_NOV) || (other.guild == GIL_KDF)) && (HARAD_STARTGUILD != GIL_NOV) && (HARAD_STARTGUILD != GIL_KDF) && (HARAD_INNOSKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_05");	//Take tys vstoupil do kláštera. Já osobnì bych byl radši, kdybys zùstal ve mìstì. Potøebujeme kadého mue.
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_06");	//Ale kdy tì Innos povolal, asi to tak má bıt.
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_07");	//Kdy budeš nìco potøebovat, jsem ti vdycky k dispozici.
		HARAD_INNOSKOMMENTAR = TRUE;
	}
	else if((HARAD_LEHRLING_DAY <= (Wld_GetDay() - 4)) && (HARAD_MILKOMMENTAR == FALSE) && (HARAD_PALKOMMENTAR == FALSE) && (HARAD_INNOSKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_08");	//U ses tu hezkou dobu neukázal. Kdepak ses toulal, co?
		HARAD_LEHRLING_DAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_09");	//Tak tì tu máme zas.
		HARAD_LEHRLING_DAY = Wld_GetDay();
	};
};


instance DIA_HARAD_WAFFEN(C_INFO)
{
	npc = vlk_412_harad;
	nr = 3;
	condition = dia_harad_waffen_condition;
	information = dia_harad_waffen_info;
	permanent = FALSE;
	description = "Prodáváš také zbranì?";
};


func int dia_harad_waffen_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_harad_waffen_info()
{
	AI_Output(other,self,"DIA_Harad_Waffen_15_00");	//Prodáváš také zbranì?
	AI_Output(self,other,"DIA_Harad_Waffen_12_01");	//Na to zapomeò. Všechno, co vyrobím, si berou paladinové nebo domobrana.
	AI_Output(self,other,"DIA_Harad_Add_12_00");	//Od lorda Hagena jsem dostal zakázku na 100 meèù - chce s nimi vybavit mìstskou strá.
};


instance DIA_HARAD_AUFGABEN(C_INFO)
{
	npc = vlk_412_harad;
	nr = 1;
	condition = dia_harad_aufgaben_condition;
	information = dia_harad_aufgaben_info;
	permanent = FALSE;
	description = "Jaké mám jako uèedník povinnosti?";
};


func int dia_harad_aufgaben_condition()
{
	if(PLAYER_ISAPPRENTICE == APP_HARAD)
	{
		return TRUE;
	};
};

func void dia_harad_aufgaben_info()
{
	AI_Output(other,self,"DIA_Harad_Aufgaben_15_00");	//Jaké mám jako uèedník povinnosti?
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_01");	//Celkem tøi.
	AI_Output(other,self,"DIA_Harad_Aufgaben_15_02");	//Kovat, kovat a kovat.
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_03");	//Nejsi tak hloupı, jak vypadáš. Za kadı meè ti zaplatím - take kdy se budeš flákat, ádné penízky se neposypou. Jak prosté.
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_05");	//Krom toho tì mùu nauèit, jak vyrobit prostı meè.
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_06");	//Magické meèe mohou vyrábìt pouze zkušení kováøi - a k tomu máš ještì hodnì daleko.
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_07");	//Jestli potøebuješ nocleh, mùeš se uloit nìkde v mém domì. U je ti všechno jasné?
};


instance DIA_HARAD_SELLBLADES(C_INFO)
{
	npc = vlk_412_harad;
	nr = 200;
	condition = dia_harad_sellblades_condition;
	information = dia_harad_sellblades_info;
	permanent = TRUE;
	description = "Chtìl bych prodat zbranì, co jsem vykoval.";
};


func int dia_harad_sellblades_condition()
{
	if(PLAYER_ISAPPRENTICE == APP_HARAD)
	{
		return TRUE;
	};
};

func void dia_harad_sellblades_info()
{
	var C_ITEM equipweap;
	var int anzahl_common;
	var int anzahl_schwert1;
	var int anzahl_schwert4;
	var int anzahl_rubinklinge;
	var int anzahl_elbastardo;
	var int gesamt;
	var string concattext;
	var int lohn;
	AI_Output(other,self,"DIA_Harad_SellBlades_15_00");	//Chtìl bych prodat zbranì, co jsem vykoval.
	equipweap = Npc_GetEquippedMeleeWeapon(other);
	anzahl_common = Npc_HasItems(other,itmw_1h_common_01);
	if(Hlp_IsItem(equipweap,itmw_1h_common_01) == TRUE)
	{
		anzahl_common = anzahl_common - 1;
	};
	anzahl_schwert1 = Npc_HasItems(other,itmw_schwert1);
	if(Hlp_IsItem(equipweap,itmw_schwert1) == TRUE)
	{
		anzahl_schwert1 = anzahl_schwert1 - 1;
	};
	anzahl_schwert4 = Npc_HasItems(other,itmw_schwert4);
	if(Hlp_IsItem(equipweap,itmw_schwert4) == TRUE)
	{
		anzahl_schwert4 = anzahl_schwert4 - 1;
	};
	anzahl_rubinklinge = Npc_HasItems(other,itmw_rubinklinge);
	if(Hlp_IsItem(equipweap,itmw_rubinklinge) == TRUE)
	{
		anzahl_rubinklinge = anzahl_rubinklinge - 1;
	};
	anzahl_elbastardo = Npc_HasItems(other,itmw_elbastardo);
	if(Hlp_IsItem(equipweap,itmw_elbastardo) == TRUE)
	{
		anzahl_elbastardo = anzahl_elbastardo - 1;
	};
	gesamt = anzahl_common + anzahl_schwert1 + anzahl_schwert4 + anzahl_rubinklinge + anzahl_elbastardo;
	if(gesamt == 0)
	{
		if((Hlp_IsItem(equipweap,itmw_1h_common_01) == TRUE) || (Hlp_IsItem(equipweap,itmw_schwert1) == TRUE) || (Hlp_IsItem(equipweap,itmw_schwert4) == TRUE) || (Hlp_IsItem(equipweap,itmw_rubinklinge) == TRUE) || (Hlp_IsItem(equipweap,itmw_elbastardo) == TRUE))
		{
			AI_Output(self,other,"DIA_Harad_SellBlades_12_01");	//Jedinou, kterou bych mohl pøijmout, máš zrovna pøipnutou u pasu, a tu si radši nechej.
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_SellBlades_12_04");	//Tak nìjaké vykovej! Pøijímám pouze prosté meèe.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_SellBlades_12_02");	//Prima - dej to sem.
		Npc_RemoveInvItems(other,itmw_1h_common_01,anzahl_common);
		Npc_RemoveInvItems(other,itmw_schwert1,anzahl_schwert1);
		Npc_RemoveInvItems(other,itmw_schwert4,anzahl_schwert4);
		Npc_RemoveInvItems(other,itmw_rubinklinge,anzahl_rubinklinge);
		Npc_RemoveInvItems(other,itmw_elbastardo,anzahl_elbastardo);
		concattext = ConcatStrings(IntToString(gesamt),PRINT_ITEMSGEGEBEN);
		AI_PrintScreen(concattext,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
		AI_Output(self,other,"DIA_Harad_SellBlades_12_03");	//Tak, a tady máš vıplatu.
		lohn = (anzahl_common * VALUE_COMMON1) + (anzahl_schwert1 * VALUE_SCHWERT1) + (anzahl_schwert4 * VALUE_SCHWERT4) + (anzahl_rubinklinge * VALUE_RUBINKLINGE) + (anzahl_elbastardo * VALUE_ELBASTARDO);
		lohn = lohn / 3;
		b_giveinvitems(self,other,itmi_gold,lohn);
	};
};

func void b_harad_teachsmith()
{
	AI_Output(self,other,"DIA_Harad_TeachCommon_12_01");	//Je to docela snadné, hochu. Staèí mít kousek surové oceli a podret ji v ohni, dokud nezèervená.
	AI_Output(self,other,"DIA_Harad_TeachCommon_12_02");	//Pak èepel na kovadlinì náleitì vyklepeš.
};

func void b_haradsmithchoices()
{
	Info_ClearChoices(dia_harad_teachsmith);
	Info_AddChoice(dia_harad_teachsmith,DIALOG_BACK,dia_harad_teachsmith_back);
	if((PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_04] == FALSE) && (PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_03] == TRUE))
	{
		Info_AddChoice(dia_harad_teachsmith,b_buildlearnstring(NAME_ADDON_HARAD_04,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_1H_HARAD_04)),dia_harad_teachsmith_harad04);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_03] == FALSE) && (PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_02] == TRUE))
	{
		Info_AddChoice(dia_harad_teachsmith,b_buildlearnstring(NAME_ADDON_HARAD_03,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_1H_HARAD_03)),dia_harad_teachsmith_harad03);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_02] == FALSE) && (PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_01] == TRUE))
	{
		Info_AddChoice(dia_harad_teachsmith,b_buildlearnstring(NAME_ADDON_HARAD_02,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_1H_HARAD_02)),dia_harad_teachsmith_harad02);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_01] == FALSE) && (PLAYER_TALENT_SMITH[WEAPON_COMMON] == TRUE))
	{
		Info_AddChoice(dia_harad_teachsmith,b_buildlearnstring(NAME_ADDON_HARAD_01,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_1H_HARAD_01)),dia_harad_teachsmith_harad01);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_COMMON] == FALSE)
	{
		Info_AddChoice(dia_harad_teachsmith,b_buildlearnstring("Nauè mì kování",b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_COMMON)),dia_harad_teachsmith_common);
	};
};


instance DIA_HARAD_TEACHSMITH(C_INFO)
{
	npc = vlk_412_harad;
	nr = 50;
	condition = dia_harad_teachsmith_condition;
	information = dia_harad_teachsmith_info;
	permanent = TRUE;
	description = "Nauè mì vykovat prostı meè!";
};


func int dia_harad_teachsmith_condition()
{
	if(PLAYER_ISAPPRENTICE == APP_HARAD)
	{
		if((PLAYER_TALENT_SMITH[WEAPON_COMMON] == FALSE) || (PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_01] == FALSE) || (PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_02] == FALSE) || (PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_03] == FALSE) || (PLAYER_TALENT_SMITH[WEAPON_1H_HARAD_04] == FALSE))
		{
			return TRUE;
		};
	};
};

func void dia_harad_teachsmith_info()
{
	AI_Output(other,self,"DIA_Harad_TeachCommon_15_00");	//Nauè mì vykovat prostı meè!
	b_haradsmithchoices();
};

func void dia_harad_teachsmith_back()
{
	Info_ClearChoices(dia_harad_teachsmith);
};

func void dia_harad_teachsmith_common()
{
	if(b_teachplayertalentsmith(self,other,WEAPON_COMMON))
	{
		b_harad_teachsmith();
		AI_Output(self,other,"DIA_Harad_TeachCommon_12_03");	//Napoprvé to asi nebude ádnı zázrak, ale všechno ostatní se èasem taky nauèíš.
	};
	b_haradsmithchoices();
};

func void dia_harad_teachsmith_harad01()
{
	if(b_teachplayertalentsmith(self,other,WEAPON_1H_HARAD_01))
	{
		b_harad_teachsmith();
	};
	b_haradsmithchoices();
};

func void dia_harad_teachsmith_harad02()
{
	if(b_teachplayertalentsmith(self,other,WEAPON_1H_HARAD_02))
	{
		b_harad_teachsmith();
	};
	b_haradsmithchoices();
};

func void dia_harad_teachsmith_harad03()
{
	if(b_teachplayertalentsmith(self,other,WEAPON_1H_HARAD_03))
	{
		b_harad_teachsmith();
	};
	b_haradsmithchoices();
};

func void dia_harad_teachsmith_harad04()
{
	if(b_teachplayertalentsmith(self,other,WEAPON_1H_HARAD_04))
	{
		b_harad_teachsmith();
	};
	b_haradsmithchoices();
};


var int harad_merke_str;

instance DIA_HARAD_TEACHSTR(C_INFO)
{
	npc = vlk_412_harad;
	nr = 100;
	condition = dia_harad_teachstr_condition;
	information = dia_harad_teachstr_info;
	permanent = 1;
	description = "Chci se stát silnìjším!";
};


func int dia_harad_teachstr_condition()
{
	if(PLAYER_ISAPPRENTICE == APP_HARAD)
	{
		return TRUE;
	};
};

func void dia_harad_teachstr_info()
{
	AI_Output(other,self,"DIA_Harad_TeachSTR_15_00");	//Chci se stát silnìjším!
	HARAD_MERKE_STR = other.attribute[ATR_STRENGTH];
	Info_ClearChoices(dia_harad_teachstr);
	Info_AddChoice(dia_harad_teachstr,DIALOG_BACK,dia_harad_teachstr_back);
	Info_AddChoice(dia_harad_teachstr,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_harad_teachstr_1);
	Info_AddChoice(dia_harad_teachstr,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_harad_teachstr_5);
};

func void dia_harad_teachstr_back()
{
	if(HARAD_MERKE_STR < other.attribute[ATR_STRENGTH])
	{
		AI_Output(self,other,"DIA_Harad_TeachSTR_BACK_12_01");	//U jsi zase o nìco svalnatìjší.
	};
	if(other.attribute[ATR_STRENGTH] < T_MED)
	{
		AI_Output(self,other,"DIA_Harad_TeachSTR_BACK_12_02");	//Vra se, a se budeš chtít dozvìdìt víc.
	};
	Info_ClearChoices(dia_harad_teachstr);
};

func void dia_harad_teachstr_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_MED);
	Info_ClearChoices(dia_harad_teachstr);
	Info_AddChoice(dia_harad_teachstr,DIALOG_BACK,dia_harad_teachstr_back);
	Info_AddChoice(dia_harad_teachstr,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_harad_teachstr_1);
	Info_AddChoice(dia_harad_teachstr,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_harad_teachstr_5);
};

func void dia_harad_teachstr_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_MED);
	Info_ClearChoices(dia_harad_teachstr);
	Info_AddChoice(dia_harad_teachstr,DIALOG_BACK,dia_harad_teachstr_back);
	Info_AddChoice(dia_harad_teachstr,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_harad_teachstr_1);
	Info_AddChoice(dia_harad_teachstr,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_harad_teachstr_5);
};


instance DIA_HARAD_IMMERNOCH(C_INFO)
{
	npc = vlk_412_harad;
	nr = 3;
	condition = dia_harad_immernoch_condition;
	information = dia_harad_immernoch_info;
	permanent = FALSE;
	description = "Ještì poøád pracuješ pro paladiny?";
};


func int dia_harad_immernoch_condition()
{
	if(KAPITEL >= 2)
	{
		return TRUE;
	};
};

func void dia_harad_immernoch_info()
{
	AI_Output(other,self,"DIA_Harad_Add_15_01");	//Ještì poøád pracuješ pro paladiny?
	AI_Output(self,other,"DIA_Harad_Add_12_02");	//Se slubou u lorda Hagena jsem u skonèil.
	AI_Output(self,other,"DIA_Harad_Add_12_03");	//Teï pro nìj vyrábím meèe z magické rudy - ale tentokrát mi za nì platí.
	AI_Output(self,other,"DIA_Harad_Add_12_04");	//Ale aspoò teï sem tam mùu bokem vyrobit pár zbraní, které poskytnu kupcùm na trišti.
	AI_Output(self,other,"DIA_Harad_Add_12_05");	//Take jestli hledáš dobrı meè, mìl bys to zkusit u nich.
};


instance DIA_HARAD_ABOUTERZKLINGEN(C_INFO)
{
	npc = vlk_412_harad;
	nr = 3;
	condition = dia_harad_abouterzklingen_condition;
	information = dia_harad_abouterzklingen_info;
	permanent = FALSE;
	description = "Prozraï mi nìco blišího o bøitech z magické rudy!";
};


func int dia_harad_abouterzklingen_condition()
{
	if(Npc_KnowsInfo(other,dia_harad_immernoch))
	{
		return TRUE;
	};
};

func void dia_harad_abouterzklingen_info()
{
	AI_Output(other,self,"DIA_Harad_Add_15_06");	//Prozraï mi nìco blišího o bøitech z magické rudy!
	AI_Output(self,other,"DIA_Harad_Waffen_12_02");	//Proces vıroby magickıch bøitù je velmi sloitı a drahı, ale vısledkem je èepel, která se velmi dobøe ovládá a je prakticky neznièitelná.
	AI_Output(self,other,"DIA_Harad_Waffen_12_03");	//Meè je urèitì velmi kvalitní, ale jeho skuteèná moc se projeví teprve v rukou paladina.
	AI_Output(self,other,"DIA_Harad_Waffen_12_04");	//Paladinskı meè je zasvìcenı Innosovi. Vısledkem je, e takto oèarovaná zbraò je neskuteènì úèinná!
};


instance DIA_HARAD_ERZKLINGEN(C_INFO)
{
	npc = vlk_412_harad;
	nr = 3;
	condition = dia_harad_erzklingen_condition;
	information = dia_harad_erzklingen_info;
	permanent = TRUE;
	description = "Chci si koupit meè z magické rudy.";
};


func int dia_harad_erzklingen_condition()
{
	if((OREBLADEBOUGHT == FALSE) && Npc_KnowsInfo(other,dia_harad_abouterzklingen))
	{
		return TRUE;
	};
};


var int orebladebought;

func void dia_harad_erzklingen_info()
{
	AI_Output(other,self,"DIA_Harad_Erzklingen_15_00");	//Chci si koupit meè z magické rudy.
	if(hero.guild != GIL_PAL)
	{
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_01");	//Magické bøity prodávám pouze paladinùm, a to vdy pouze jeden kus.
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_02");	//Jako paladinové mùete bıt rádi, e mùete tøímat tak skvìlé zbranì.
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_03");	//Dle rozkazu lorda Hagena ti mohu prodat pouze jedinou magickou zbraò.
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_04");	//Take co ti mohu nabídnout?
		Info_ClearChoices(dia_harad_erzklingen);
		Info_AddChoice(dia_harad_erzklingen,DIALOG_BACK,dia_harad_erzklingen_back);
		Info_AddChoice(dia_harad_erzklingen,"Obouruèní meè (2000 zlaákù)",dia_harad_erzklingen_2h);
		Info_AddChoice(dia_harad_erzklingen,"Jednoruèní meè (2000 zlaákù)",dia_harad_erzklingen_1h);
	};
};

func void dia_harad_erzklingen_back()
{
	Info_ClearChoices(dia_harad_erzklingen);
};

func void b_harad_notenoughgold()
{
	AI_Output(self,other,"B_Harad_NotEnoughGold_12_00");	//Nemáš dost zlata.
};

func void b_harad_havefunwithyoursword()
{
	AI_Output(self,other,"B_Harad_HaveGunWithYourSword_12_00");	//Starej se o svou novou zbraò dobøe. Je cennìjší ne všechen tvùj majetek.
	OREBLADEBOUGHT = TRUE;
	Info_ClearChoices(dia_harad_erzklingen);
};

func void dia_harad_erzklingen_2h()
{
	AI_Output(other,self,"DIA_Harad_Erzklingen_2h_15_00");	//Vezmu si obouruèní meè!
	if(Npc_HasItems(other,itmi_gold) >= VALUE_BLESSED_2H_1)
	{
		b_giveinvitems(other,self,itmi_gold,VALUE_BLESSED_2H_1);
		CreateInvItems(self,itmw_2h_blessed_01,1);
		b_giveinvitems(self,other,itmw_2h_blessed_01,1);
		b_harad_havefunwithyoursword();
	}
	else
	{
		b_harad_notenoughgold();
		Info_ClearChoices(dia_harad_erzklingen);
		Info_AddChoice(dia_harad_erzklingen,DIALOG_BACK,dia_harad_erzklingen_back);
		Info_AddChoice(dia_harad_erzklingen,"Obouruèní meè (2000 zlaákù)",dia_harad_erzklingen_2h);
		Info_AddChoice(dia_harad_erzklingen,"Jednoruèní meè (2000 zlaákù)",dia_harad_erzklingen_1h);
	};
};

func void dia_harad_erzklingen_1h()
{
	AI_Output(other,self,"DIA_Harad_Erzklingen_1h_15_00");	//Vezmu si jednoruèní meè!
	if(Npc_HasItems(other,itmi_gold) >= VALUE_BLESSED_1H_1)
	{
		b_giveinvitems(other,self,itmi_gold,VALUE_BLESSED_1H_1);
		CreateInvItems(self,itmw_1h_blessed_01,1);
		b_giveinvitems(self,other,itmw_1h_blessed_01,1);
		b_harad_havefunwithyoursword();
	}
	else
	{
		b_harad_notenoughgold();
		Info_ClearChoices(dia_harad_erzklingen);
		Info_AddChoice(dia_harad_erzklingen,DIALOG_BACK,dia_harad_erzklingen_back);
		Info_AddChoice(dia_harad_erzklingen,"Obouruèní meè (2000 zlaákù)",dia_harad_erzklingen_2h);
		Info_AddChoice(dia_harad_erzklingen,"Jednoruèní meè (2000 zlaákù)",dia_harad_erzklingen_1h);
	};
};


instance DIA_HARAD_REPAIRNECKLACE(C_INFO)
{
	npc = vlk_412_harad;
	nr = 8;
	condition = dia_harad_repairnecklace_condition;
	information = dia_harad_repairnecklace_info;
	permanent = FALSE;
	description = "Umíš opravit i klenoty?";
};


func int dia_harad_repairnecklace_condition()
{
	if((MIS_BENNET_INNOSEYEREPAIREDSETTING != LOG_SUCCESS) && (Npc_HasItems(other,itmi_innoseye_broken_mis) || (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE)))
	{
		return TRUE;
	};
};

func void dia_harad_repairnecklace_info()
{
	AI_Output(other,self,"DIA_Harad_RepairNecklace_15_00");	//Umíš opravit i klenoty?
	AI_Output(self,other,"DIA_Harad_RepairNecklace_12_01");	//Jsem kováø, ne zlatník. Budeš si tady ve mìstì muset najít nìkoho jiného, kdo ti pomùe.
	AI_Output(self,other,"DIA_Harad_RepairNecklace_12_02");	//Lidi mají jednu kapsu prázdnou a druhou vysypanou - u hezkou dobu tady nikdo nezbohatnul.
	AI_Output(self,other,"DIA_Harad_RepairNecklace_12_03");	//Vìtšinou jsou rádi, e mají co do úst.
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
};


instance DIA_HARAD_GOLDSMITH(C_INFO)
{
	npc = vlk_412_harad;
	nr = 8;
	condition = dia_harad_goldsmith_condition;
	information = dia_harad_goldsmith_info;
	permanent = FALSE;
	description = "Kde bych sehnal nìjakého zlatníka?";
};


func int dia_harad_goldsmith_condition()
{
	if(Npc_KnowsInfo(other,dia_harad_repairnecklace))
	{
		return TRUE;
	};
};

func void dia_harad_goldsmith_info()
{
	AI_Output(other,self,"DIA_Harad_Goldsmith_15_00");	//Kde bych sehnal nìjakého zlatníka?
	AI_Output(self,other,"DIA_Harad_Goldsmith_12_01");	//Nìjakı dobrı kováø se prı pøidal k oldákùm na Onarovì farmì.
	AI_Output(self,other,"DIA_Harad_Goldsmith_12_02");	//Zkus se po nìm poohlédnout tam.
};


instance DIA_HARAD_PICKPOCKET(C_INFO)
{
	npc = vlk_412_harad;
	nr = 900;
	condition = dia_harad_pickpocket_condition;
	information = dia_harad_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_harad_pickpocket_condition()
{
	return c_beklauen(14,35);
};

func void dia_harad_pickpocket_info()
{
	Info_ClearChoices(dia_harad_pickpocket);
	Info_AddChoice(dia_harad_pickpocket,DIALOG_BACK,dia_harad_pickpocket_back);
	Info_AddChoice(dia_harad_pickpocket,DIALOG_PICKPOCKET,dia_harad_pickpocket_doit);
};

func void dia_harad_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_harad_pickpocket);
};

func void dia_harad_pickpocket_back()
{
	Info_ClearChoices(dia_harad_pickpocket);
};

