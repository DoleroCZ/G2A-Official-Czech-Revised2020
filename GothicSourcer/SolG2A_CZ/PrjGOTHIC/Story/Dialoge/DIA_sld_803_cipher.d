
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
	AI_Output(self,other,"DIA_Cipher_Hello_07_01");	//Hej, nezn�m t� odn�kud?
	AI_Output(other,self,"DIA_Cipher_Hello_15_02");	//Je to mo�n�...
	AI_Output(self,other,"DIA_Cipher_Hello_07_03");	//Pokou�el jsem se v kolonii obchodovat s tr�vou z ba�in, vzpom�n�?
};


instance DIA_CIPHER_TRADEWHAT(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_tradewhat_condition;
	information = dia_cipher_tradewhat_info;
	permanent = FALSE;
	description = "A s ��mpak obchoduje� te�?";
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
	AI_Output(other,self,"DIA_Cipher_TradeWhat_15_00");	//A s ��mpak obchoduje� te�?
	AI_Output(self,other,"DIA_Cipher_TradeWhat_07_01");	//Ach, neptej se m�.
	AI_Output(self,other,"DIA_Cipher_TradeWhat_07_02");	//P�inesl jsem si s sebou z hornick� kolonie cel� pytl�k t�hle tr�vy.
	AI_Output(self,other,"DIA_Cipher_TradeWhat_07_03");	//Hodn� �old�k� dostane tu a tam chu� si trochu zakou�it. Vyd�lal jsem si takhle bokem trochu pen�z.
	AI_Output(self,other,"DIA_Cipher_TradeWhat_07_04");	//Ale n�jak� bastard mi ukradl z truhly v�echnu tr�vu!
	Log_CreateTopic(TOPIC_CIPHERPAKET,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CIPHERPAKET,LOG_RUNNING);
	b_logentry(TOPIC_CIPHERPAKET,"�oldn��i Cipherovi se ztratil bal�k tr�vy z ba�in.");
	if(!Npc_IsDead(bodo))
	{
		AI_Output(self,other,"DIA_Cipher_TradeWhat_07_05");	//Jsem si docela jistej, �e to byl Bodo. Ob�v� stejnou m�stnost jako j� a v�dycky se na m� k�en� jako n�jakej idiot.
		b_logentry(TOPIC_CIPHERPAKET,"Domn�v� se, �e zlod�jem je Bodo.");
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
	description = "Co tedy chce� s t�m zlod�jem ud�lat?";
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
	AI_Output(other,self,"DIA_Cipher_DoWithThief_15_00");	//Co tedy chce� s t�m zlod�jem ud�lat?
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_01");	//Jednou ho ur�it� nachyt�m, jak bude kou�it moj� tr�vu.
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_02");	//A pak si najdu n�jak� odlehl� m�sto a d�m mu takovou lekci, na kterou do smrti nezapomene.
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_03");	//Kdybych ho napadnul tady uprost�ed dvora, ostatn� farm��i by si toho v�imli a j� bych si to odsk�kal.
	AI_Output(other,self,"DIA_Cipher_DoWithThief_15_04");	//Jak to?
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_05");	//To je jednoduch�. Nem��eme zml�tit farm��e, jinak bychom Leeovi zaplatili pokutu. Takhle to chce Onar.
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_06");	//A ��m v�ce sv�dk� u toho je, t�m v�ce poprasku kolem toho bude. A to by se n�m prodra�ilo.
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_07");	//Tak�e tu v�c vy��d�m hezky nen�padn�.
};


instance DIA_CIPHER_WANNAJOIN(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_wannajoin_condition;
	information = dia_cipher_wannajoin_info;
	permanent = FALSE;
	description = "Chci se p�idat k Leeov�m lidem!";
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
	AI_Output(other,self,"DIA_Cipher_WannaJoin_15_00");	//Chci se p�idat k Leeov�m lidem!
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_01");	//Leeov�m lidem?! Jestli Lee bude pokra�ovat t�mhle zp�sobem, tak u� brzy jeho nebudou!
	AI_Output(other,self,"DIA_Cipher_WannaJoin_15_02");	//Pro�?
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_03");	//Lee byl v�dycky kli�as. To byl v kolonii taky.
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_04");	//Ale posledn� dobou to u� p�eh�n�. Chce si sem prost� jen tak sednout a �ekat, dokud paladinov� nezem�ou hladem.
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_05");	//Sylvio si mysl�, �e bychom m�li trochu vy�istit mal� farmy a okol� m�sta.
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_06");	//Mysl�m, �e by se m�l co nejd��ve �pln� zm�nit.
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_07");	//V t�hle chv�li tu v�t�ina z n�s sed� s rukama v kl�n� - i tak se chce� k n�m po��d p�idat?
};


instance DIA_CIPHER_YESJOIN(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_yesjoin_condition;
	information = dia_cipher_yesjoin_info;
	permanent = FALSE;
	description = "Chci se st�t jedn�m z v�s a je mi jedno jak!";
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
	AI_Output(other,self,"DIA_Cipher_YesJoin_15_00");	//Chci se st�t jedn�m z v�s a je mi jedno jak!
	AI_Output(self,other,"DIA_Cipher_YesJoin_07_01");	//U� v�, �e mus�me nechat o ka�d�m nov�m rekrutovi hlasovat?
	AI_Output(other,self,"DIA_Cipher_YesJoin_15_02");	//Na co nar��?
	AI_Output(self,other,"DIA_Cipher_YesJoin_07_03");	//No, u� jsem hodn� dlouho nic nekou�il. P�ines mi trochu tr�vy z ba�in a dostane� m�j hlas.
	AI_Output(self,other,"DIA_Cipher_YesJoin_07_04");	//Jist� se ti poda�� n�jakou spla�it.
	MIS_CIPHER_BRINGWEED = LOG_RUNNING;
	Log_CreateTopic(TOPIC_CIPHERHERB,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CIPHERHERB,LOG_RUNNING);
	b_logentry(TOPIC_CIPHERHERB,"Cipher se za m� zaru��, pokud mu p�inesu n�jakou tr�vu z ba�in.");
};


instance DIA_CIPHER_JOINTS(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_joints_condition;
	information = dia_cipher_joints_info;
	permanent = TRUE;
	description = "Co se t��e tr�vy z ba�in...";
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
	AI_Output(other,self,"DIA_Cipher_Joints_15_00");	//Co se t��e tr�vy z ba�in...
	if(MIS_CIPHER_PAKET == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Cipher_Joints_07_01");	//P�inesl jsi mi zp�tky m�j bal��ek tr�vy! Te� bude v�echno v po��dku.
		if(other.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Cipher_Joints_07_02");	//Samoz�ejm� budu hlasovat pro tebe.
			b_logentry(TOPIC_SLDRESPEKT,"Kdy� se budu cht�t p�idat k �oldn���m, Cipher se za m� p�imluv�.");
		};
		MIS_CIPHER_BRINGWEED = LOG_OBSOLETE;
	}
	else
	{
		Info_ClearChoices(dia_cipher_joints);
		Info_AddChoice(dia_cipher_joints,"Uvid�m, co se d� d�lat...",dia_cipher_joints_running);
		if(Npc_HasItems(other,itmi_joint) > 0)
		{
			Info_AddChoice(dia_cipher_joints,"Tady m� p�r st�bel...",dia_cipher_joints_success);
		};
	};
};

func void dia_cipher_joints_running()
{
	AI_Output(other,self,"DIA_Cipher_Joints_Running_15_00");	//Uvid�m, co se d� d�lat...
	Info_ClearChoices(dia_cipher_joints);
};

func void dia_cipher_joints_success()
{
	AI_Output(other,self,"DIA_Cipher_Joints_Success_15_00");	//Tady m� p�r st�bel.
	if(b_giveinvitems(other,self,itmi_joint,10))
	{
		AI_Output(self,other,"DIA_Cipher_Joints_Success_07_01");	//Ach! Ty jsi m�j �lov�k!
		if(other.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Cipher_Joints_Success_07_02");	//M� m�j hlas.
		};
		MIS_CIPHER_BRINGWEED = LOG_SUCCESS;
		b_logentry(TOPIC_SLDRESPEKT,"Kdy� se budu cht�t p�idat k �oldn���m, Cipher se za m� p�imluv�.");
		b_giveplayerxp(XP_CIPHERWEED);
	}
	else
	{
		AI_Output(self,other,"DIA_Cipher_Joints_Success_07_03");	//To je v�echno? Tohle vykou��m na jeden z�tah!
		AI_Output(self,other,"DIA_Cipher_Joints_Success_07_04");	//To je nejm�n� na deset �pek�.
		if(other.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Cipher_Joints_Success_07_05");	//V ka�d�m p��pad� m� m�j hlas, aby ses k n�m p�idal.
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
	description = "Uka� mi sv� zbo��.";
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
	AI_Output(other,self,"DIA_Cipher_TRADE_15_00");	//Uka� mi sv� zbo��.
	if(Npc_HasItems(self,itmi_joint) > 0)
	{
		AI_Output(self,other,"DIA_Cipher_TRADE_07_01");	//Jist�. Jak je libo.
	}
	else
	{
		AI_Output(self,other,"DIA_Cipher_TRADE_07_02");	//V t�hle chv�li nem�m ��dnou tr�vu. Nechce� n�co jin�ho?
	};
};


instance DIA_CIPHER_DARDIEB(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_dardieb_condition;
	information = dia_cipher_dardieb_info;
	permanent = FALSE;
	description = "V�m, kdo ti sebral tvoj� tr�vu.";
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
	AI_Output(other,self,"DIA_Cipher_DarDieb_15_00");	//V�m, kdo ti sebral tvoj� tr�vu.
	AI_Output(self,other,"DIA_Cipher_DarDieb_07_01");	//Kdo? Byl to Bodo?
	AI_Output(other,self,"DIA_Cipher_DarDieb_15_02");	//Ne - ud�lal to jeden z �old�k�. Jmenuje se Dar.
	AI_Output(self,other,"DIA_Cipher_DarDieb_07_03");	//Ten parchant - kde je?
	AI_Output(other,self,"DIA_Cipher_DarDieb_15_04");	//T�m, �e ho najde�, si nepom��e�. U� nem� ten bal��ek u sebe. Prodal ho v Khorinisu.
	AI_Output(self,other,"DIA_Cipher_DarDieb_07_05");	//KDE JE!?!
	AI_Output(other,self,"DIA_Cipher_DarDieb_15_06");	//Za tou budovou s kuchyn�, na rohu.
	AI_Output(self,other,"DIA_Cipher_DarDieb_07_07");	//J� SI TO S N�M VY��D�M!
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
	description = "Skute�n� jsi dal Darovi co proto. C�t� se te� l�p?";
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
	AI_Output(other,self,"DIA_Cipher_DarLOST_15_00");	//Skute�n� jsi dal Darovi co proto. C�t� se te� l�p?
	AI_Output(self,other,"DIA_Cipher_DarLOST_07_01");	//(povzdech) Joo, c�t�m se fajn.
	AI_Output(other,self,"DIA_Cipher_DarLOST_15_02");	//P�edpokl�d�m, �e ale ON ne...
	AI_Output(self,other,"DIA_Cipher_DarLOST_07_03");	//Ten malej �ebr�k se nem� co �trachat v moj� truhle!
	b_giveplayerxp(XP_AMBIENT * 2);
};


instance DIA_CIPHER_KRAUTPAKET(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_krautpaket_condition;
	information = dia_cipher_krautpaket_info;
	permanent = FALSE;
	description = "Nen� tenhle bal��ek tr�vy n�hodou tv�j?";
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
	AI_Output(other,self,"DIA_Cipher_KrautPaket_15_00");	//Nen� tenhle bal��ek tr�vy n�hodou tv�j?
	b_giveinvitems(other,self,itmi_herbpaket,1);
	AI_Output(self,other,"DIA_Cipher_KrautPaket_07_01");	//No, jasn�! Kde jsi ho sebral?
	AI_Output(other,self,"DIA_Cipher_KrautPaket_15_02");	//To je dlouh� p��b�h...
	AI_Output(self,other,"DIA_Cipher_KrautPaket_07_03");	//To nevad�, opravdu jsi slu�nej chlap�k.
	AI_Output(self,other,"DIA_Cipher_KrautPaket_07_04");	//Tady, vezmi si tohle jako odm�nu. U�ij si to!
	b_giveinvitems(self,other,itmi_gold,200);
	b_giveinvitems(self,other,itmi_joint,10);
	b_giveplayerxp(XP_CIPHER_KRAUTPAKET);
	AI_Output(self,other,"DIA_Cipher_KrautPaket_07_05");	//Te� m� nech trochu pracovat...
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

