
instance DIA_CORNELIUS_EXIT(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 999;
	condition = dia_cornelius_exit_condition;
	information = dia_cornelius_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_cornelius_exit_condition()
{
	return TRUE;
};

func void dia_cornelius_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CORNELIUS_SEEMURDER(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 4;
	condition = dia_cornelius_seemurder_condition;
	information = dia_cornelius_seemurder_info;
	permanent = FALSE;
	description = "Vidìl jsi Lotharovu vraždu, co?";
};


func int dia_cornelius_seemurder_condition()
{
	if(RECUEBENNET_KNOWSCORNELIUS == TRUE)
	{
		return TRUE;
	};
};

func void dia_cornelius_seemurder_info()
{
	AI_Output(other,self,"DIA_Cornelius_SeeMurder_15_00");	//Vidìl jsi Lotharovu vraždu, co?
	AI_Output(self,other,"DIA_Cornelius_SeeMurder_13_01");	//(nervóznì) Nebudu odpovídat na žádné otázky týkající se probíhajího vyšetøování.
	AI_Output(self,other,"DIA_Cornelius_SeeMurder_13_02");	//Lord Hagen už má zaznamenáno vše, co vím.
};


instance DIA_CORNELIUS_WHATYOUSEE(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 5;
	condition = dia_cornelius_whatyousee_condition;
	information = dia_cornelius_whatyousee_info;
	permanent = FALSE;
	description = "Cos to øíkal?";
};


func int dia_cornelius_whatyousee_condition()
{
	if(Npc_KnowsInfo(other,dia_cornelius_seemurder))
	{
		return TRUE;
	};
};

func void dia_cornelius_whatyousee_info()
{
	AI_Output(other,self,"DIA_Cornelius_WhatYouSee_15_00");	//Cos to øíkal?
	AI_Output(self,other,"DIA_Cornelius_WhatYouSee_13_01");	//(horeènatì) Opravdu teï nemám èas.
	AI_Output(self,other,"DIA_Cornelius_WhatYouSee_13_02");	//(horeènatì) Musíš jít, úøad se právì zavírá.
	b_logentry(TOPIC_RESCUEBENNET,"Cornelius se se mnou odmítá bavit.");
	AI_StopProcessInfos(self);
};


instance DIA_CORNELIUS_ENOUGH(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 6;
	condition = dia_cornelius_enough_condition;
	information = dia_cornelius_enough_info;
	permanent = FALSE;
	description = "Dost už toho! Co jsi vidìl?";
};


func int dia_cornelius_enough_condition()
{
	if(Npc_KnowsInfo(other,dia_cornelius_whatyousee))
	{
		return TRUE;
	};
};

func void dia_cornelius_enough_info()
{
	AI_Output(other,self,"DIA_Cornelius_Enough_15_00");	//Dost už toho! Co jsi vidìl?
	AI_Output(self,other,"DIA_Cornelius_Enough_13_01");	//(nervóznì) Já... vidìl jsem, jak ten žoldák zezadu srazil toho paladina.
	AI_Output(self,other,"DIA_Cornelius_Enough_13_02");	//(nervóznì) A pak si vzal jeho meè a proklál mu jím hruï.
	AI_Output(other,self,"DIA_Cornelius_Enough_15_03");	//Jsi si naprosto jistý?
	AI_Output(self,other,"DIA_Cornelius_Enough_13_04");	//(vydìšenì) Ano, samozøejmì. Vidìl jsem to na vlastní oèi.
	AI_Output(self,other,"DIA_Cornelius_Enough_13_05");	//(vydìšenì) Ale teï už vážnì nemám èas, èeká na mì halda papírování.
	AI_StopProcessInfos(self);
};


instance DIA_CORNELIUS_DONTBELIEVEYOU(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 4;
	condition = dia_cornelius_dontbelieveyou_condition;
	information = dia_cornelius_dontbelieveyou_info;
	permanent = TRUE;
	description = "Nevìøím ti.";
};


func int dia_cornelius_dontbelieveyou_condition()
{
	if(Npc_KnowsInfo(other,dia_cornelius_enough) && (CORNELIUS_TELLTRUTH != TRUE))
	{
		return TRUE;
	};
};

func void dia_cornelius_dontbelieveyou_info()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_15_00");	//Nevìøím ti.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_13_01");	//(s falešnou dùvìrností) A co, co s tím budeš dìlat?
	Info_ClearChoices(dia_cornelius_dontbelieveyou);
	Info_AddChoice(dia_cornelius_dontbelieveyou,"Co chceš?",dia_cornelius_dontbelieveyou_whatyouwant);
	Info_AddChoice(dia_cornelius_dontbelieveyou,"Svýho života si dost ceníš, co?",dia_cornelius_dontbelieveyou_wantsurvive);
	if(hero.guild == GIL_KDF)
	{
		Info_AddChoice(dia_cornelius_dontbelieveyou,"Mùžou ti zaøídit pøíjemný rozhovor v kláštìøe.",dia_cornelius_dontbelieveyou_monastery);
	};
	if(hero.guild == GIL_SLD)
	{
		Info_AddChoice(dia_cornelius_dontbelieveyou,"Mùžu žoldákùm øíct, kde bydlíš.",dia_cornelius_dontbelieveyou_knowyourhome);
	};
	if(hero.guild == GIL_MIL)
	{
		Info_AddChoice(dia_cornelius_dontbelieveyou,"Køivá pøísaha ti zajistí útulnou kobku - na dlouhou dobu!",dia_cornelius_dontbelieveyou_perjury);
	};
};

func void dia_cornelius_dontbelieveyou_whatyouwant()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_WhatYouWant_15_00");	//Co chceš?
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WhatYouWant_13_01");	//(arogantnì) Nikdy jsi nemìl tolik penìz, abys mi mohl zaplatit.
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_WhatYouWant_15_02");	//Kolik?
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WhatYouWant_13_03");	//2000 zlatých. Jo, to by mohlo staèit k tomu, abych si to rozmyslel.
	b_logentry(TOPIC_RESCUEBENNET,"Za 2000 zlaákù je se mnou Cornelius ochoten mluvit.");
	CORNELIUS_PAYFORPROOF = TRUE;
	Info_ClearChoices(dia_cornelius_dontbelieveyou);
};

func void dia_cornelius_dontbelieveyou_wantsurvive()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_WantSurvive_15_00");	//Svýho života si dost ceníš, co?
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WantSurvive_13_01");	//(vydìšenì) Když mì napadneš, povìsí tì.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WantSurvive_13_02");	//Mám mocné pøátele. Takže se na mì neopovažuj vztáhnout ruku.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WantSurvive_13_03");	//A teï odsud vypadni! Nebo zavolám stráže!
	AI_StopProcessInfos(self);
};

func void dia_cornelius_dontbelieveyou_monastery()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_Monastery_15_00");	//Mùžou ti zaøídit pøíjemný rozhovor v klášteøe.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_Monastery_13_01");	//(bílý jak stìna) Co tím myslíš?
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_Monastery_15_02");	//Fajn, známe zpùsob, jak dostat pravdu na svìtlo. Bolestivý zpùsob.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_Monastery_13_03");	//Ne, prosím, ne. Øeknu ti všechno, co chceš.
	CORNELIUS_TELLTRUTH = TRUE;
	Info_ClearChoices(dia_cornelius_dontbelieveyou);
};

func void dia_cornelius_dontbelieveyou_knowyourhome()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KnowYourHome_15_00");	//Mùžu žoldákùm øíct, kde bydlíš.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_KnowYourHome_13_01");	//(bílý jak stìna) Co to má znamenat?
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KnowYourHome_15_02");	//Vsadím se, že by za seznámení s tebou dali život. Vùbec z toho nemají radost.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_KnowYourHome_13_03");	//To nemùžeš. Zabijí mì.
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KnowYourHome_15_04");	//S nejvìtší pravdìpodobností.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_KnowYourHome_13_05");	//Øeknu ti, co budeš chtít, ale nesmíš to udìlat.
	CORNELIUS_TELLTRUTH = TRUE;
	Info_ClearChoices(dia_cornelius_dontbelieveyou);
};

func void dia_cornelius_dontbelieveyou_perjury()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_Perjury_15_00");	//Køivá pøísaha ti zajistí útulnou kobku - na dlouhou dobu!
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_Perjury_13_01");	//Snažíš se mi vyhrožovat? Mnì, tajemníkovi místodržícího?
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_Perjury_13_02");	//Jestli okamžitì nevypadneš, budu se dívat na to, jak tì degradují.
	CORNELIUS_THREATENBYMILSC = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_CORNELIUS_PAYCORNELIUS(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 4;
	condition = dia_cornelius_paycornelius_condition;
	information = dia_cornelius_paycornelius_info;
	permanent = TRUE;
	description = "Tady je zlato.";
};


func int dia_cornelius_paycornelius_condition()
{
	if((CORNELIUS_PAYFORPROOF == TRUE) && (Npc_HasItems(other,itmi_gold) >= 2000))
	{
		return TRUE;
	};
};

func void dia_cornelius_paycornelius_info()
{
	AI_Output(other,self,"DIA_Cornelius_PayCornelius_15_00");	//Tady je zlato.
	b_giveinvitems(other,self,itmi_gold,2000);
	AI_Output(self,other,"DIA_Cornelius_PayCornelius_13_01");	//Radìji se ani nebudu ptát, kdes k tomu pøišel.
	AI_Output(self,other,"DIA_Cornelius_PayCornelius_13_02");	//Abych byl upøímný, tak mì to ani nezajímá.
	AI_Output(self,other,"DIA_Cornelius_PayCornelius_13_03");	//Ale jsme partneøi.
	CORNELIUS_TELLTRUTH = TRUE;
};


instance DIA_CORNELIUS_REALSTORY(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 4;
	condition = dia_cornelius_realstory_condition;
	information = dia_cornelius_realstory_info;
	permanent = TRUE;
	description = "Tak co se doopravdy stalo?";
};


func int dia_cornelius_realstory_condition()
{
	if(CORNELIUS_TELLTRUTH == TRUE)
	{
		return TRUE;
	};
};

func void dia_cornelius_realstory_info()
{
	AI_Output(other,self,"DIA_Cornelius_RealStory_15_00");	//Tak co se doopravdy stalo?
	AI_Output(self,other,"DIA_Cornelius_RealStory_13_01");	//Nevím, co se stalo. Dostal jsem nìjaké zlato za to, že obviním toho žoldáka.
	AI_Output(self,other,"DIA_Cornelius_RealStory_13_02");	//V takových èasech jako teï se každý stará jen sám o sebe. Potøeboval jsem peníze.
	AI_Output(other,self,"DIA_Cornelius_RealStory_15_03");	//Kdo ti zaplatil?
	AI_Output(self,other,"DIA_Cornelius_RealStory_13_04");	//To neøeknu. Zabije mì, když ho prásknu.
	AI_Output(other,self,"DIA_Cornelius_RealStory_15_05");	//Jsi pøipraven tohle øíct také lordu Hagenovi?
	AI_Output(self,other,"DIA_Cornelius_RealStory_13_06");	//Nejsem blázen. Nemùžu zùstat ve mìstì.
	if(Npc_HasItems(self,itwr_corneliustagebuch_mis) >= 1)
	{
		AI_Output(self,other,"DIA_Cornelius_RealStory_13_07");	//Dám ti svùj deník, to by jako dùkaz mohlo staèit.
		b_giveinvitems(self,other,itwr_corneliustagebuch_mis,1);
	};
	b_logentry(TOPIC_RESCUEBENNET,"Cornelius lhal - podplatili ho, aby Benneta dostal do basy. Kdo mu ale ty peníze dal, to mi neprozradil. Je celý podìlaný strachy.");
	CORNELIUSFLEE = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FLEE");
};


instance DIA_CORNELIUS_FLEEING(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 1;
	condition = dia_cornelius_fleeing_condition;
	information = dia_cornelius_fleeing_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_cornelius_fleeing_condition()
{
	if((CORNELIUSFLEE == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_cornelius_fleeing_info()
{
	b_say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};


instance DIA_CORNELIUS_PICKPOCKET(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 900;
	condition = dia_cornelius_pickpocket_condition;
	information = dia_cornelius_pickpocket_info;
	permanent = TRUE;
	description = "(Krádež téhle knihy by byla dosti riskantní.)";
};


func int dia_cornelius_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (RECUEBENNET_KNOWSCORNELIUS == TRUE) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itwr_corneliustagebuch_mis) >= 1) && (other.attribute[ATR_DEXTERITY] >= (60 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_cornelius_pickpocket_info()
{
	Info_ClearChoices(dia_cornelius_pickpocket);
	Info_AddChoice(dia_cornelius_pickpocket,DIALOG_BACK,dia_cornelius_pickpocket_back);
	Info_AddChoice(dia_cornelius_pickpocket,DIALOG_PICKPOCKET,dia_cornelius_pickpocket_doit);
};

func void dia_cornelius_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 60)
	{
		b_giveinvitems(self,other,itwr_corneliustagebuch_mis,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_cornelius_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_cornelius_pickpocket_back()
{
	Info_ClearChoices(dia_cornelius_pickpocket);
};

