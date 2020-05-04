
instance DIA_CIPHER_EXIT(C_INFO)
{
	npc = sld_803_cipher;
	nr = 999;
	condition = dia_cipher_exit_condition;
	information = dia_cipher_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_cipher_exit_condition()
{
	return TRUE;
};

func void dia_cipher_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CIPHER_HELLO(C_INFO)
{
	npc = sld_803_cipher;
	nr = 1;
	condition = dia_cipher_hello_condition;
	information = dia_cipher_hello_info;
	permanent = FALSE;
	description = "Jak se vede?";
};


func int dia_cipher_hello_condition()
{
	return TRUE;
};

func void dia_cipher_hello_info()
{
	AI_Output(other,self,"DIA_Cipher_Hello_15_00");	//Jak se vede?
	AI_Output(self,other,"DIA_Cipher_Hello_07_01");	//Hej, neznám tì odnìkud?
	AI_Output(other,self,"DIA_Cipher_Hello_15_02");	//Je to možné...
	AI_Output(self,other,"DIA_Cipher_Hello_07_03");	//Pokoušel jsem se v kolonii obchodovat s trávou z bažin, vzpomínáš?
};


instance DIA_CIPHER_TRADEWHAT(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_tradewhat_condition;
	information = dia_cipher_tradewhat_info;
	permanent = FALSE;
	description = "A s èímpak obchoduješ teï?";
};


func int dia_cipher_tradewhat_condition()
{
	if(Npc_KnowsInfo(other,dia_cipher_hello))
	{
		return TRUE;
	};
};

func void dia_cipher_tradewhat_info()
{
	AI_Output(other,self,"DIA_Cipher_TradeWhat_15_00");	//A s èímpak obchoduješ teï?
	AI_Output(self,other,"DIA_Cipher_TradeWhat_07_01");	//Ach, neptej se mì.
	AI_Output(self,other,"DIA_Cipher_TradeWhat_07_02");	//Pøinesl jsem si s sebou z hornické kolonie celý pytlík téhle trávy.
	AI_Output(self,other,"DIA_Cipher_TradeWhat_07_03");	//Hodnì žoldákù dostane tu a tam chu si trochu zakouøit. Vydìlal jsem si takhle bokem trochu penìz.
	AI_Output(self,other,"DIA_Cipher_TradeWhat_07_04");	//Ale nìjaký bastard mi ukradl z truhly všechnu trávu!
	Log_CreateTopic(TOPIC_CIPHERPAKET,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CIPHERPAKET,LOG_RUNNING);
	b_logentry(TOPIC_CIPHERPAKET,"Žoldnéøi Cipherovi se ztratil balík trávy z bažin.");
	if(!Npc_IsDead(bodo))
	{
		AI_Output(self,other,"DIA_Cipher_TradeWhat_07_05");	//Jsem si docela jistej, že to byl Bodo. Obývá stejnou místnost jako já a vždycky se na mì køení jako nìjakej idiot.
		b_logentry(TOPIC_CIPHERPAKET,"Domnívá se, že zlodìjem je Bodo.");
	};
	MIS_CIPHER_PAKET = LOG_RUNNING;
};


instance DIA_CIPHER_DOWITHTHIEF(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_dowiththief_condition;
	information = dia_cipher_dowiththief_info;
	permanent = FALSE;
	description = "Co tedy chceš s tím zlodìjem udìlat?";
};


func int dia_cipher_dowiththief_condition()
{
	if(Npc_KnowsInfo(other,dia_cipher_tradewhat))
	{
		return TRUE;
	};
};

func void dia_cipher_dowiththief_info()
{
	AI_Output(other,self,"DIA_Cipher_DoWithThief_15_00");	//Co tedy chceš s tím zlodìjem udìlat?
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_01");	//Jednou ho urèitì nachytám, jak bude kouøit mojí trávu.
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_02");	//A pak si najdu nìjaké odlehlé místo a dám mu takovou lekci, na kterou do smrti nezapomene.
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_03");	//Kdybych ho napadnul tady uprostøed dvora, ostatní farmáøi by si toho všimli a já bych si to odskákal.
	AI_Output(other,self,"DIA_Cipher_DoWithThief_15_04");	//Jak to?
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_05");	//To je jednoduché. Nemùžeme zmlátit farmáøe, jinak bychom Leeovi zaplatili pokutu. Takhle to chce Onar.
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_06");	//A èím více svìdkù u toho je, tím více poprasku kolem toho bude. A to by se nám prodražilo.
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_07");	//Takže tu vìc vyøídím hezky nenápadnì.
};


instance DIA_CIPHER_WANNAJOIN(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_wannajoin_condition;
	information = dia_cipher_wannajoin_info;
	permanent = FALSE;
	description = "Chci se pøidat k Leeovým lidem!";
};


func int dia_cipher_wannajoin_condition()
{
	if(Npc_KnowsInfo(other,dia_cipher_hello) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_cipher_wannajoin_info()
{
	AI_Output(other,self,"DIA_Cipher_WannaJoin_15_00");	//Chci se pøidat k Leeovým lidem!
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_01");	//Leeovým lidem?! Jestli Lee bude pokraèovat tímhle zpùsobem, tak už brzy jeho nebudou!
	AI_Output(other,self,"DIA_Cipher_WannaJoin_15_02");	//Proè?
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_03");	//Lee byl vždycky kliïas. To byl v kolonii taky.
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_04");	//Ale poslední dobou to už pøehání. Chce si sem prostì jen tak sednout a èekat, dokud paladinové nezemøou hladem.
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_05");	//Sylvio si myslí, že bychom mìli trochu vyèistit malé farmy a okolí mìsta.
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_06");	//Myslím, že by se mìl co nejdøíve úplnì zmìnit.
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_07");	//V týhle chvíli tu vìtšina z nás sedí s rukama v klínì - i tak se chceš k nám poøád pøidat?
};


instance DIA_CIPHER_YESJOIN(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_yesjoin_condition;
	information = dia_cipher_yesjoin_info;
	permanent = FALSE;
	description = "Chci se stát jedním z vás a je mi jedno jak!";
};


func int dia_cipher_yesjoin_condition()
{
	if(Npc_KnowsInfo(other,dia_cipher_wannajoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_cipher_yesjoin_info()
{
	AI_Output(other,self,"DIA_Cipher_YesJoin_15_00");	//Chci se stát jedním z vás a je mi jedno jak!
	AI_Output(self,other,"DIA_Cipher_YesJoin_07_01");	//Už víš, že musíme nechat o každém novém rekrutovi hlasovat?
	AI_Output(other,self,"DIA_Cipher_YesJoin_15_02");	//Na co narážíš?
	AI_Output(self,other,"DIA_Cipher_YesJoin_07_03");	//No, už jsem hodnì dlouho nic nekouøil. Pøines mi trochu trávy z bažin a dostaneš mùj hlas.
	AI_Output(self,other,"DIA_Cipher_YesJoin_07_04");	//Jistì se ti podaøí nìjakou splašit.
	MIS_CIPHER_BRINGWEED = LOG_RUNNING;
	Log_CreateTopic(TOPIC_CIPHERHERB,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CIPHERHERB,LOG_RUNNING);
	b_logentry(TOPIC_CIPHERHERB,"Cipher se za mì zaruèí, pokud mu pøinesu nìjakou trávu z bažin.");
};


instance DIA_CIPHER_JOINTS(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_joints_condition;
	information = dia_cipher_joints_info;
	permanent = TRUE;
	description = "Co se týèe trávy z bažin...";
};


func int dia_cipher_joints_condition()
{
	if(MIS_CIPHER_BRINGWEED == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_cipher_joints_info()
{
	AI_Output(other,self,"DIA_Cipher_Joints_15_00");	//Co se týèe trávy z bažin...
	if(MIS_CIPHER_PAKET == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Cipher_Joints_07_01");	//Pøinesl jsi mi zpátky mùj balíèek trávy! Teï bude všechno v poøádku.
		if(other.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Cipher_Joints_07_02");	//Samozøejmì budu hlasovat pro tebe.
			b_logentry(TOPIC_SLDRESPEKT,"Když se budu chtít pøidat k žoldnéøùm, Cipher se za mì pøimluví.");
		};
		MIS_CIPHER_BRINGWEED = LOG_OBSOLETE;
	}
	else
	{
		Info_ClearChoices(dia_cipher_joints);
		Info_AddChoice(dia_cipher_joints,"Uvidím, co se dá dìlat...",dia_cipher_joints_running);
		if(Npc_HasItems(other,itmi_joint) > 0)
		{
			Info_AddChoice(dia_cipher_joints,"Tady máš pár stébel...",dia_cipher_joints_success);
		};
	};
};

func void dia_cipher_joints_running()
{
	AI_Output(other,self,"DIA_Cipher_Joints_Running_15_00");	//Uvidím, co se dá dìlat...
	Info_ClearChoices(dia_cipher_joints);
};

func void dia_cipher_joints_success()
{
	AI_Output(other,self,"DIA_Cipher_Joints_Success_15_00");	//Tady máš pár stébel.
	if(b_giveinvitems(other,self,itmi_joint,10))
	{
		AI_Output(self,other,"DIA_Cipher_Joints_Success_07_01");	//Ach! Ty jsi mùj èlovìk!
		if(other.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Cipher_Joints_Success_07_02");	//Máš mùj hlas.
		};
		MIS_CIPHER_BRINGWEED = LOG_SUCCESS;
		b_logentry(TOPIC_SLDRESPEKT,"Když se budu chtít pøidat k žoldnéøùm, Cipher se za mì pøimluví.");
		b_giveplayerxp(XP_CIPHERWEED);
	}
	else
	{
		AI_Output(self,other,"DIA_Cipher_Joints_Success_07_03");	//To je všechno? Tohle vykouøím na jeden zátah!
		AI_Output(self,other,"DIA_Cipher_Joints_Success_07_04");	//To je nejménì na deset špekù.
		if(other.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Cipher_Joints_Success_07_05");	//V každém pøípadì máš mùj hlas, aby ses k nám pøidal.
		};
	};
	Info_ClearChoices(dia_cipher_joints);
};


instance DIA_CIPHER_TRADE(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_trade_condition;
	information = dia_cipher_trade_info;
	permanent = TRUE;
	description = "Ukaž mi své zboží.";
	trade = TRUE;
};


func int dia_cipher_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_cipher_tradewhat))
	{
		return TRUE;
	};
};

func void dia_cipher_trade_info()
{
	AI_Output(other,self,"DIA_Cipher_TRADE_15_00");	//Ukaž mi své zboží.
	if(Npc_HasItems(self,itmi_joint) > 0)
	{
		AI_Output(self,other,"DIA_Cipher_TRADE_07_01");	//Jistì. Jak je libo.
	}
	else
	{
		AI_Output(self,other,"DIA_Cipher_TRADE_07_02");	//V téhle chvíli nemám žádnou trávu. Nechceš nìco jiného?
	};
};


instance DIA_CIPHER_DARDIEB(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_dardieb_condition;
	information = dia_cipher_dardieb_info;
	permanent = FALSE;
	description = "Vím, kdo ti sebral tvojí trávu.";
};


func int dia_cipher_dardieb_condition()
{
	if(((DAR_DIEB == TRUE) || (DAR_VERDACHT == TRUE)) && !Npc_IsDead(dar))
	{
		return TRUE;
	};
};

func void dia_cipher_dardieb_info()
{
	AI_Output(other,self,"DIA_Cipher_DarDieb_15_00");	//Vím, kdo ti sebral tvojí trávu.
	AI_Output(self,other,"DIA_Cipher_DarDieb_07_01");	//Kdo? Byl to Bodo?
	AI_Output(other,self,"DIA_Cipher_DarDieb_15_02");	//Ne - udìlal to jeden z žoldákù. Jmenuje se Dar.
	AI_Output(self,other,"DIA_Cipher_DarDieb_07_03");	//Ten parchant - kde je?
	AI_Output(other,self,"DIA_Cipher_DarDieb_15_04");	//Tím, že ho najdeš, si nepomùžeš. Už nemá ten balíèek u sebe. Prodal ho v Khorinisu.
	AI_Output(self,other,"DIA_Cipher_DarDieb_07_05");	//KDE JE!?!
	AI_Output(other,self,"DIA_Cipher_DarDieb_15_06");	//Za tou budovou s kuchyní, na rohu.
	AI_Output(self,other,"DIA_Cipher_DarDieb_07_07");	//JÁ SI TO S NÍM VYØÍDÍM!
	AI_StopProcessInfos(self);
	other.aivar[AIV_INVINCIBLE] = FALSE;
	b_attack(self,dar,AR_NONE,0);
};


instance DIA_CIPHER_DARLOST(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_darlost_condition;
	information = dia_cipher_darlost_info;
	permanent = FALSE;
	description = "Skuteènì jsi dal Darovi co proto. Cítíš se teï líp?";
};


func int dia_cipher_darlost_condition()
{
	if(DAR_LOSTAGAINSTCIPHER == TRUE)
	{
		return TRUE;
	};
};

func void dia_cipher_darlost_info()
{
	AI_Output(other,self,"DIA_Cipher_DarLOST_15_00");	//Skuteènì jsi dal Darovi co proto. Cítíš se teï líp?
	AI_Output(self,other,"DIA_Cipher_DarLOST_07_01");	//(povzdech) Joo, cítím se fajn.
	AI_Output(other,self,"DIA_Cipher_DarLOST_15_02");	//Pøedpokládám, že ale ON ne...
	AI_Output(self,other,"DIA_Cipher_DarLOST_07_03");	//Ten malej žebrák se nemá co štrachat v mojí truhle!
	b_giveplayerxp(XP_AMBIENT * 2);
};


instance DIA_CIPHER_KRAUTPAKET(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_krautpaket_condition;
	information = dia_cipher_krautpaket_info;
	permanent = FALSE;
	description = "Není tenhle balíèek trávy náhodou tvùj?";
};


func int dia_cipher_krautpaket_condition()
{
	if((Npc_HasItems(other,itmi_herbpaket) > 0) && (MIS_CIPHER_PAKET == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_cipher_krautpaket_info()
{
	AI_Output(other,self,"DIA_Cipher_KrautPaket_15_00");	//Není tenhle balíèek trávy náhodou tvùj?
	b_giveinvitems(other,self,itmi_herbpaket,1);
	AI_Output(self,other,"DIA_Cipher_KrautPaket_07_01");	//No, jasnì! Kde jsi ho sebral?
	AI_Output(other,self,"DIA_Cipher_KrautPaket_15_02");	//To je dlouhý pøíbìh...
	AI_Output(self,other,"DIA_Cipher_KrautPaket_07_03");	//To nevadí, opravdu jsi slušnej chlapík.
	AI_Output(self,other,"DIA_Cipher_KrautPaket_07_04");	//Tady, vezmi si tohle jako odmìnu. Užij si to!
	b_giveinvitems(self,other,itmi_gold,200);
	b_giveinvitems(self,other,itmi_joint,10);
	b_giveplayerxp(XP_CIPHER_KRAUTPAKET);
	AI_Output(self,other,"DIA_Cipher_KrautPaket_07_05");	//Teï mì nech trochu pracovat...
	CreateInvItems(self,itmi_joint,40);
	Npc_RemoveInvItems(self,itmi_herbpaket,1);
	MIS_CIPHER_PAKET = LOG_SUCCESS;
	b_giveplayerxp(XP_CIPHERPAKET);
};


instance DIA_CIPHERSLD_PICKPOCKET(C_INFO)
{
	npc = sld_803_cipher;
	nr = 900;
	condition = dia_ciphersld_pickpocket_condition;
	information = dia_ciphersld_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_ciphersld_pickpocket_condition()
{
	return c_beklauen(65,65);
};

func void dia_ciphersld_pickpocket_info()
{
	Info_ClearChoices(dia_ciphersld_pickpocket);
	Info_AddChoice(dia_ciphersld_pickpocket,DIALOG_BACK,dia_ciphersld_pickpocket_back);
	Info_AddChoice(dia_ciphersld_pickpocket,DIALOG_PICKPOCKET,dia_ciphersld_pickpocket_doit);
};

func void dia_ciphersld_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_cipher_pickpocket);
};

func void dia_ciphersld_pickpocket_back()
{
	Info_ClearChoices(dia_cipher_pickpocket);
};

