
instance DIA_LESTER_EXIT(C_INFO)
{
	npc = pc_psionic;
	nr = 999;
	condition = dia_lester_exit_condition;
	information = dia_lester_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lester_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_lester_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LESTER_HELLO(C_INFO)
{
	npc = pc_psionic;
	nr = 1;
	condition = dia_lester_hello_condition;
	information = dia_lester_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lester_hello_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_lester_hello_info()
{
	if(c_bodystatecontains(self,BS_SIT))
	{
		AI_Standup(self);
		b_turntonpc(self,other);
	};
	AI_Output(self,other,"DIA_Lester_Hello_13_00");	//Jsi to TY? - Opravdu! Chlape, ani netu��, jak r�d t� vid�m!
	Info_ClearChoices(dia_lester_hello);
	Info_AddChoice(dia_lester_hello,"M�l bych t� zn�t?",dia_lester_hello_youknowme);
	Info_AddChoice(dia_lester_hello,"Lestere! Jak ses sem dostal?",dia_lester_hello_lester);
};

func void dia_lester_hello_lester()
{
	Info_ClearChoices(dia_lester_hello);
	AI_Output(other,self,"DIA_Lester_Hello_Lester_15_00");	//Lestere! Jak ses sem dostal?
	AI_Output(self,other,"DIA_Lester_Hello_Lester_13_01");	//Byl to ��len� �t�k. Kdy� bari�ra vybuchla, chv�li jsem se naprosto zmaten� toulal po okol�.
	AI_Output(self,other,"DIA_Lester_Hello_Lester_13_02");	//Pak jsem se cel� dny sna�il probojovat skrz tyhle lesy, a� jsem kone�n� na�el tohle �dol�.
	AI_Output(self,other,"DIA_Lester_Hello_Lester_13_03");	//Diego, Milten a Gorn jsou po��d v Hornick�m �dol�. Aspo� si to mysl�m.
};

func void dia_lester_hello_youknowme()
{
	Info_ClearChoices(dia_lester_hello);
	AI_Output(other,self,"DIA_Lester_Hello_YouKnowMe_15_00");	//M�l bych t� zn�t?
	AI_Output(self,other,"DIA_Lester_Hello_YouKnowMe_13_01");	//Hal�? Je n�kdo doma? Riskoval jsem vlastn� k��i, abys mohl dostat ten divn� k�men.
	AI_Output(self,other,"DIA_Lester_Hello_YouKnowMe_13_02");	//N�co mi dlu��. TENTOKR�T by sis to m�l pamatovat.
	AI_Output(self,other,"DIA_Lester_Hello_YouKnowMe_13_03");	//Pamatuje� je�t� na Diega, Miltena a Gorna?
	Info_AddChoice(dia_lester_hello,"Diego, Milten a KDO?",dia_lester_hello_whofourfriends);
	Info_AddChoice(dia_lester_hello,"Jasn�. Co je s nimi?",dia_lester_hello_knowfourfriends);
};

func void dia_lester_hello_knowfourfriends()
{
	Info_ClearChoices(dia_lester_hello);
	AI_Output(other,self,"DIA_Lester_Hello_KnowFourFriends_15_00");	//Jasn�. Co je s nimi?
	AI_Output(self,other,"DIA_Lester_Hello_KnowFourFriends_13_01");	//Pokud v�m, tak zni�en� bari�ry m�li p�e��t.
	AI_Output(self,other,"DIA_Lester_Hello_KnowFourFriends_13_02");	//Nem�m pon�t�, kde jdou te� - v�ichni t�i je�t� nejsp� d�ep� n�kde v Hornick�m �dol�.
	AI_Output(self,other,"DIA_Lester_Hello_KnowFourFriends_13_03");	//Kdybys na n� n�hodou narazil, dej mi v�d�t.
};

func void dia_lester_hello_whofourfriends()
{
	Info_ClearChoices(dia_lester_hello);
	AI_Output(other,self,"DIA_Lester_Hello_WhoFourFriends_15_00");	//Diego, Milten a KDO?
	AI_Output(self,other,"DIA_Lester_Hello_WhoFourFriends_13_01");	//Nesna� se mi namluvit, �e si na to nepamatuje�. Ty ohniskov� kameny - ten trol - ta ohromn� kupa rudy vodn�ch m�g�?
	AI_Output(other,self,"DIA_Lester_Hello_WhoFourFriends_15_02");	//Nejsem si jist...
	AI_Output(self,other,"DIA_Lester_Hello_WhoFourFriends_13_03");	//To p�ijde. I mn� chv�li trvalo, ne� jsem si to v�echno v hlav� srovnal.
};


instance DIA_LESTER_WHATHAPPENED(C_INFO)
{
	npc = pc_psionic;
	nr = 1;
	condition = dia_lester_whathappened_condition;
	information = dia_lester_whathappened_info;
	permanent = FALSE;
	description = "Co se stalo?";
};


func int dia_lester_whathappened_condition()
{
	if(Npc_KnowsInfo(other,dia_lester_hello) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lester_whathappened_info()
{
	AI_Output(other,self,"DIA_Lester_WhatHappened_15_00");	//Co se stalo?
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_01");	//Co byl Sp�� pora�en, cel� Bratrstvo ztratilo hlavu.
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_02");	//Bez v�dce byli jako pr�zdn� sko��pky.
	AI_Output(other,self,"DIA_Lester_WhatHappened_15_03");	//A ty? Co bylo s tebou?
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_04");	//J� na tom byl �pln� stejn�. M�l jsem no�n� m�ry a dokonce halucinace. Ale jakmile jsem za�al v�ce m�n� p�em��let zase norm�ln�, utekl jsem.
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_05");	//Jednou se mi zd�lo, �e vid�m obrovsk� �ern� st�n, jak vyrazil na skupinu uprchl�k� a sp�lil je na prach.
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_06");	//V tu chv�li jsem si v�n� myslel, �e m� p�i�el zab�t drak.
	AI_Output(other,self,"DIA_Lester_WhatHappened_15_07");	//Vid�l jsi je�t� n�co?
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_08");	//Ne - vzal jsem nohy na ramena a utekl!
};


instance DIA_LESTER_MINECOLONY(C_INFO)
{
	npc = pc_psionic;
	nr = 2;
	condition = dia_lester_minecolony_condition;
	information = dia_lester_minecolony_info;
	permanent = FALSE;
	description = "Jak dlouho se u� ukr�v� v tomhle �dol�?";
};


func int dia_lester_minecolony_condition()
{
	if(Npc_KnowsInfo(other,dia_lester_hello) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lester_minecolony_info()
{
	AI_Output(other,self,"DIA_Lester_ReturnToColony_15_00");	//Jak dlouho se u� ukr�v� v tomhle �dol�?
	AI_Output(self,other,"DIA_Lester_ReturnToColony_13_01");	//P�esn� to nev�m. Mo�n� t�den. Ale napad� m� je�t� jedna v�c:
	AI_Output(self,other,"DIA_Lester_ReturnToColony_13_02");	//Kdy� jsem sem jednoho ve�era p�i�el, pod�val jsem se na vrcholek hory - bylo tam jenom p�r strom�.
	AI_Output(self,other,"DIA_Lester_ReturnToColony_13_03");	//A kdy� jsem se tam pod�val druh� den r�no, st�la tam v�. P��sahal bych, �e tam p�edt�m nebyla. Od t� doby jsem z �dol� nevyt�hl paty.
	AI_Output(other,self,"DIA_Lester_ReturnToColony_15_04");	//Mysl� Xardasovu v�? V�d�l jsem, �e je mocn�, ale vytvo�it v� jenom tak...
	AI_Output(self,other,"DIA_Lester_ReturnToColony_13_05");	//Nekromant Xardas? To on �ije v t� v�i? Nev�m, jestli se mi to dvakr�t zamlouv�.
	AI_Output(other,self,"DIA_Lester_ReturnToColony_15_06");	//Uklidni se, byl to pr�v� on, kdo m� zachr�nil ze Sp��ova chr�mu. Je na na�� stran�.
};


instance DIA_LESTER_SEND_XARDAS(C_INFO)
{
	npc = pc_psionic;
	nr = 4;
	condition = dia_lester_send_xardas_condition;
	information = dia_lester_send_xardas_info;
	permanent = FALSE;
	description = "Mus� ��ct Xardasovi o tom st�nu, mohlo by to b�t d�le�it�.";
};


func int dia_lester_send_xardas_condition()
{
	if(Npc_KnowsInfo(other,dia_lester_whathappened) && Npc_KnowsInfo(other,dia_lester_minecolony) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lester_send_xardas_info()
{
	AI_Output(other,self,"DIA_Lester_SEND_XARDAS_15_00");	//Mus� ��ct Xardasovi o tom st�nu, mohlo by to b�t d�le�it�.
	AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_01");	//Ty si nemysl�, �e to byl jen v�plod moj� p�edstavivosti? To jako �e to doopravdy byl...
	AI_Output(other,self,"DIA_Lester_SEND_XARDAS_15_02");	//... drak. Ano.
	AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_03");	//Zase se do toho pou�t� po hlav�, �e?
	AI_Output(other,self,"DIA_Lester_SEND_XARDAS_15_04");	//Ne�ekl bych, �e po hlav�... je�t� ne.
	AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_05");	//(povzdychne si) No dobr�, kdy� je to tak d�le�it�, tak za n�m p�jdu - ale je�t� ne.
	AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_06");	//Te� si chci odpo�inout. Je�t� po��d jsem �pln� vy�erpan� z toho �t�ku z trestaneck� kolonie.
	AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_07");	//�ekl bych, �e m� velk� pl�ny. Uvid�me se pozd�ji u Xardase.
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_LESTER_STADT(C_INFO)
{
	npc = pc_psionic;
	nr = 1;
	condition = dia_addon_lester_stadt_condition;
	information = dia_addon_lester_stadt_info;
	description = "Jsem na cest� do Khorinisu! Co o tom m�st� v�?";
};


func int dia_addon_lester_stadt_condition()
{
	if(Npc_KnowsInfo(other,dia_lester_hello) && (MIL_310_SCHONMALREINGELASSEN == FALSE) && (MIL_333_SCHONMALREINGELASSEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_lester_stadt_info()
{
	AI_Output(other,self,"DIA_Addon_Lester_STADT_15_00");	//Jsem na cest� do Khorinisu! Co o tom m�st� v�?
	AI_Output(self,other,"DIA_Addon_Lester_STADT_13_01");	//Khorinis? Hm, je to p��stav. Nic zvl�tn�ho.
	AI_Output(self,other,"DIA_Addon_Lester_STADT_13_02");	//Pro� se pt�?
	AI_Output(other,self,"DIA_Addon_Lester_STADT_15_03");	//Pot�ebuju si promluvit s paladiny, kte�� by m�li b�t ve m�st�.
	AI_Output(self,other,"DIA_Addon_Lester_STADT_13_04");	//(sm�je se) To mysl� v�n�? I kdyby ses u� dostal do m�sta, tak k paladin�m nikdy.
};


instance DIA_ADDON_LESTER_VORSCHLAG(C_INFO)
{
	npc = pc_psionic;
	nr = 1;
	condition = dia_addon_lester_vorschlag_condition;
	information = dia_addon_lester_vorschlag_info;
	description = "M� n�jak� n�vrh, jak bych se mohl dostat do m�sta?";
};


func int dia_addon_lester_vorschlag_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lester_stadt) && (MIL_310_SCHONMALREINGELASSEN == FALSE) && (MIL_333_SCHONMALREINGELASSEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_lester_vorschlag_info()
{
	AI_Output(other,self,"DIA_Addon_Lester_Vorschlag_15_00");	//M� n�jak� n�vrh, jak bych se mohl dostat do m�sta?
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_01");	//Vlastn� ano. Ned�vno jsem pracoval pro star�ho alchymistu Constantina.
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_02");	//M� ve m�st� ur�it� vliv a na��dil str��m, aby pustili lidi, kte�� mu nesou vz�cn� byliny.
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_03");	//Ve skute�nosti to v�ak nen� tak slo�it�. Jednodu�e nasb�r� hrst bylin, kter� tu rostou v�ude kolem. A pak jednodu�e p�edst�r�, �e d�l� pro Constantina. M�li by t� pustit.
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_04");	//Nicm�n�, ujisti se, �e m� v�echny druhy stejn�. Ne jenom n�hodn� sebran�. Str�e nejsou p��li� byst�� a nev� skoro nic o alchymii.
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_05");	//Tak�e, trs, kter� obsahuje rostliny pouze jednoho druhy by je m�l zm�st.
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_06");	//H�dal bych, �e 10 bude sta�it.
	AI_Output(other,self,"DIA_Addon_Lester_Vorschlag_15_07");	//D�ky za radu.
	Log_CreateTopic(TOPIC_ADDON_PICKFORCONSTANTINO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_PICKFORCONSTANTINO,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_PICKFORCONSTANTINO,"Lester si mysl�, �e bych se mohl dostat do m�sta, kdy� str��m u br�ny uk�u 10 rostlin stejn�ho druhu. Jen mus�m p�edst�rat, �e je nesu pro alchymistu Constantina.");
	MIS_ADDON_LESTER_PICKFORCONSTANTINO = LOG_RUNNING;
};


instance DIA_ADDON_LESTER_PASSAGEPLANTSSUCCESS(C_INFO)
{
	npc = pc_psionic;
	nr = 5;
	condition = dia_addon_lester_passageplantssuccess_condition;
	information = dia_addon_lester_passageplantssuccess_info;
	description = "Ten 'trik' s rostlinami fungoval. Pro�el jsem kolem str��.";
};


func int dia_addon_lester_passageplantssuccess_condition()
{
	if(MIS_ADDON_LESTER_PICKFORCONSTANTINO == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_addon_lester_passageplantssuccess_info()
{
	AI_Output(other,self,"DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_15_00");	//Ten 'trik' s rostlinami fungoval. Pro�el jsem kolem str��.
	AI_Output(self,other,"DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_13_01");	//Jak ��k�m. V�, �e poslouchat moje rady se vyplat�, k�mo.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_LESTER_PERM(C_INFO)
{
	npc = pc_psionic;
	nr = 99;
	condition = dia_lester_perm_condition;
	information = dia_lester_perm_info;
	permanent = TRUE;
	description = "Co v� o tomhle m�st�?";
};


func int dia_lester_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_lester_hello) && (KAPITEL < 3) && (Npc_GetDistToWP(self,"NW_XARDAS_TOWER_LESTER") <= 2000))
	{
		return TRUE;
	};
};

func void dia_lester_perm_info()
{
	AI_Output(other,self,"DIA_Lester_Perm_15_00");	//Co v� o tomhle m�st�?
	AI_Output(self,other,"DIA_Lester_Perm_13_01");	//Kdy� p�jde� tudy dol�, dojde� na farmu. O kousek d�l u� za��n� m�sto.
	AI_Output(self,other,"DIA_Lester_Perm_13_02");	//Ale bu� opatrn�. Nepotuluj� se tam jen vlci a krysy, ale tak� goblini a banditi!
};


instance DIA_LESTER_SLEEP(C_INFO)
{
	npc = pc_psionic;
	nr = 99;
	condition = dia_lester_sleep_condition;
	information = dia_lester_sleep_info;
	permanent = TRUE;
	description = "Je�t� po��d jsi unaven�?";
};


func int dia_lester_sleep_condition()
{
	if((KAPITEL < 3) && (Npc_GetDistToWP(self,"NW_XARDAS_TOWER_IN1_31") <= 500))
	{
		return TRUE;
	};
};

func void dia_lester_sleep_info()
{
	AI_Output(other,self,"DIA_Lester_Sleep_15_00");	//Je�t� po��d jsi unaven�?
	AI_Output(self,other,"DIA_Lester_Sleep_13_01");	//A jak. (z�vne si) �ekl jsem Xardasovi v�echno. Te� se na chvilku prosp�m. Tak den...
	AI_Output(self,other,"DIA_Lester_Sleep_13_02");	//... dva... mo�n� d�le.
	AI_StopProcessInfos(self);
};


instance DIA_LESTER_KAP3_EXIT(C_INFO)
{
	npc = pc_psionic;
	nr = 999;
	condition = dia_lester_kap3_exit_condition;
	information = dia_lester_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lester_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_lester_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LESTER_BACKINTOWN(C_INFO)
{
	npc = pc_psionic;
	nr = 2;
	condition = dia_lester_backintown_condition;
	information = dia_lester_backintown_info;
	important = TRUE;
};


func int dia_lester_backintown_condition()
{
	if((Npc_GetDistToWP(self,"LEVELCHANGE") <= 500) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_lester_backintown_info()
{
	AI_Output(self,other,"DIA_Lester_BACKINTOWN_13_00");	//Hej, kone�n� ses vr�til! Mus� j�t okam�it� za Xardasem, m�me probl�m.
	AI_Output(other,self,"DIA_Lester_BACKINTOWN_15_01");	//Tak tomu naprosto v���m.
	AI_Output(self,other,"DIA_Lester_BACKINTOWN_13_02");	//Co jsi ode�el, propuklo naprost� peklo.
	AI_Output(self,other,"DIA_Lester_BACKINTOWN_13_03");	//Promluv si s Xardasem, �ek� na tebe!
	AI_Output(self,other,"DIA_Lester_BACKINTOWN_13_04");	//Xardas mi pro tebe dal tuhle runu. S jej� pomoc� se k n�mu dostane� rychleji. Setk�me se tam.
	CreateInvItems(self,itru_teleportxardas,1);
	b_giveinvitems(self,other,itru_teleportxardas,1);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_LESTER_PERM3(C_INFO)
{
	npc = pc_psionic;
	nr = 900;
	condition = dia_lester_perm3_condition;
	information = dia_lester_perm3_info;
	permanent = TRUE;
	description = "Nevypad� zrovna nad�en�.";
};


func int dia_lester_perm3_condition()
{
	if((KAPITEL >= 3) && (LESTER_ISONBOARD != LOG_SUCCESS))
	{
		return TRUE;
	};
};


var int dia_lester_perm3_onetime;

func void dia_lester_perm3_info()
{
	AI_Output(other,self,"DIA_Lester_PERM3_15_00");	//Nevypad� zrovna nad�en�.
	if(hero.guild == GIL_KDF)
	{
		if(DIA_LESTER_PERM3_ONETIME == FALSE)
		{
			AI_Output(self,other,"DIA_Lester_PERM3_13_01");	//Taky moc nad�en� nejsem, chlape. Jsem �pln� vy��zen� a po��d m� bol� hlava.
			AI_Output(self,other,"DIA_Lester_PERM3_13_02");	//Poka�d�, kdy� se objev� ty �ern� k�p�, tak se to zhor��.
			if(SC_KNOWSMADPSI == TRUE)
			{
				AI_Output(other,self,"DIA_Lester_PERM3_15_03");	//A j� ti m��u p�esn� ��ct, pro� to tak je.
				AI_Output(self,other,"DIA_Lester_PERM3_13_04");	//Jo? Mysl�m, �e to ani nechci v�d�t.
				AI_Output(other,self,"DIA_Lester_PERM3_15_05");	//Ty �ern� k�p� - neboli P�tra�i, jak jim ��k�me my m�gov� - b�vali p��vr�enci mocn�ho arcid�mona. Ne��k� ti to nic?
				AI_Output(self,other,"DIA_Lester_PERM3_13_06");	//Hmm. Ne. Leda �e by ses mi sna�il nazna�it, �e...
				AI_Output(other,self,"DIA_Lester_PERM3_15_07");	//Ano, p�esn�. Ti P�tra�i byli p��vr�enci Sp��e. Odpadlick� sekta pomatenc� z t�bora v ba�in�ch.
				AI_Output(other,self,"DIA_Lester_PERM3_15_08");	//Je to tv�j b�val� lid, Lestere. B�val� Bratrstvo Sp��e. Te� z nich jsou pouz� bezdu�� p�isluhova�i zla.
				AI_Output(self,other,"DIA_Lester_PERM3_13_09");	//Tu�il jsem to, ale doufal jsem, �e to nen� pravda. Chce� ��ct, �e se vr�til? Sp�� je zp�tky mezi n�mi?
				AI_Output(other,self,"DIA_Lester_PERM3_15_10");	//Dobr� ot�zka. Jsem si jist� jenom t�m, �e mus�m P�tra�e zastavit d��v, ne� budou p��li� mocn�.
				AI_Output(self,other,"DIA_Lester_PERM3_13_11");	//Nel�b� se mi to, ale asi m� pravdu. Je mi l�to, ale tohle v�echno mi za��n� l�zt na mozek.
				b_logentry(TOPIC_DEMENTOREN,"M� podez�en� se potvrdila. Dokonce ani Lester u� nepochybuje, �e P�tra�i pat�� ke Sp��ov�m p�isluhova��m ze star�ho t�bora v ba�in�ch.");
				b_giveplayerxp(XP_LESTER_KNOWSMADPSI);
				DIA_LESTER_PERM3_ONETIME = TRUE;
			};
		};
	}
	else if(LESTER_ISONBOARD == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lester_PERM3_13_12");	//Bolest hlavy jen tak neustoup�, ale doufejme, �e si jinak s t�m probl�mem dok�eme brzy poradit.
		AI_Output(self,other,"DIA_Lester_PERM3_13_13");	//A� tak nebo tak.
	}
	else if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Lester_PERM3_13_14");	//Ta bolest hlavy za��n� b�t nesnesiteln�. A te� na m� je�t� po��d �to�� ti je�t�rani. Mus�m se s�m sebe pt�t, odkud se berou.
	}
	else
	{
		AI_Output(self,other,"DIA_Lester_PERM3_13_15");	//Ta bolest hlavy nechce p�ej�t. N�co se chyst�.
	};
	AI_Output(self,other,"DIA_Lester_PERM3_13_16");	//(povzdechne si) Mysl�m, �e si budu muset odpo�inout.
};


instance DIA_LESTER_KAP4_EXIT(C_INFO)
{
	npc = pc_psionic;
	nr = 999;
	condition = dia_lester_kap4_exit_condition;
	information = dia_lester_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lester_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_lester_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LESTER_KAP5_EXIT(C_INFO)
{
	npc = pc_psionic;
	nr = 999;
	condition = dia_lester_kap5_exit_condition;
	information = dia_lester_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lester_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_lester_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LESTER_XARDASWEG(C_INFO)
{
	npc = pc_psionic;
	nr = 2;
	condition = dia_lester_xardasweg_condition;
	information = dia_lester_xardasweg_info;
	description = "Kde je Xardas?";
};


func int dia_lester_xardasweg_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_lester_xardasweg_info()
{
	AI_Output(other,self,"DIA_Lester_XARDASWEG_15_00");	//Kde je Xardas?
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_01");	//Je pry� a ve sv� v�i nechal ta d�monick� stvo�en�.
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_02");	//Mysl�m, �e nechce, aby po jeho v�i v jeho nep��tomnosti n�kdo sl�dil.
	AI_Output(other,self,"DIA_Lester_XARDASWEG_15_03");	//Kam �el?
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_04");	//To ne��kal. Jenom m� po��dal, abych ti p�edal tenhle dopis.
	CreateInvItems(self,itwr_xardaslettertoopenbook_mis,1);
	b_giveinvitems(self,other,itwr_xardaslettertoopenbook_mis,1);
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_05");	//P�e�etl jsem si ho. Omlouv�m se. Byl jsem zv�dav�.
	AI_Output(other,self,"DIA_Lester_XARDASWEG_15_06");	//A?
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_07");	//Nem�m pon�t�, nerozum�l jsem ani slovu, chlape. Ale jedno mi je jasn�: jen tak ho neuvid�me.
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_08");	//Asi mu za�ala ho�et zem� za patama, a tak se vydal do kopc�.
	b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"Xardas zmizel. Lester mi pouze p�edal dopis, kter� mi m�g zanechal.");
};


instance DIA_LESTER_KNOWWHEREENEMY(C_INFO)
{
	npc = pc_psionic;
	nr = 2;
	condition = dia_lester_knowwhereenemy_condition;
	information = dia_lester_knowwhereenemy_info;
	permanent = TRUE;
	description = "Zjistil jsem, kde se ukr�v� nep��tel.";
};


func int dia_lester_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (LESTER_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_lester_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_15_00");	//Zjistil jsem, kde se ukr�v� nep��tel.
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_01");	//Neptej se m� pro�, ale m�m pocit, �e bych m�l j�t s tebou.
	AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_15_02");	//Co t�m mysl�?
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_03");	//Nedok�u to vysv�tlit, ale je mi jasn�, �e odpov�� se dozv�m, jen kdy� p�jdu s tebou.
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_15_04");	//Je mi l�to, ale lo� u� je pln�.
		AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_05");	//Mo�n� je, mo�n� je m�j osud bezv�znamn� v porovn�n� s v�cmi, kter� jsou p�ed n�mi.
		AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_06");	//S�m mus� v�d�t, co bys m�l ud�lat. Postav se zlu - se mnou si hlavu nel�mej.
		AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_07");	//Nejsem nijak d�le�it�.
	}
	else
	{
		Info_ClearChoices(dia_lester_knowwhereenemy);
		Info_AddChoice(dia_lester_knowwhereenemy,"Nemohu t� vz�t s sebou.",dia_lester_knowwhereenemy_no);
		Info_AddChoice(dia_lester_knowwhereenemy,"Tak poj� se mnou a najdi sv� odpov�di!",dia_lester_knowwhereenemy_yes);
	};
};

func void dia_lester_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_Yes_15_00");	//Tak poj� se mnou a najdi sv� odpov�di!
	AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_Yes_15_01");	//Setk�me se v p��stavu. P�ijdu tam, jakmile budu p�ipraven.
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_Yes_13_02");	//Posp� si, za��n� n�s tla�it �as.
	self.flags = NPC_FLAG_IMMORTAL;
	LESTER_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(dia_lester_knowwhereenemy);
};

func void dia_lester_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_No_15_00");	//Nemohu t� vz�t s sebou.
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_No_13_01");	//Rozum�m. Stejn� bych ti asi nebyl ��dnou v�raznou oporou.
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_No_13_02");	//A� u� si vezme� s sebou kohokoliv, ujisti se, �e mu m��e� v��it.
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_No_13_03");	//A d�vej na sebe pozor.
	LESTER_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_lester_knowwhereenemy);
};


instance DIA_LESTER_LEAVEMYSHIP(C_INFO)
{
	npc = pc_psionic;
	nr = 4;
	condition = dia_lester_leavemyship_condition;
	information = dia_lester_leavemyship_info;
	permanent = TRUE;
	description = "Nakonec pro tebe p�ece jenom nem�m m�sto.";
};


func int dia_lester_leavemyship_condition()
{
	if((LESTER_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_lester_leavemyship_info()
{
	AI_Output(other,self,"DIA_Lester_LeaveMyShip_15_00");	//Nakonec pro tebe p�ece jenom nem�m m�sto.
	AI_Output(self,other,"DIA_Lester_LeaveMyShip_13_01");	//Rozum�m ti. B�t ve tv� situaci, asi bych ud�lal to sam�.
	AI_Output(self,other,"DIA_Lester_LeaveMyShip_13_02");	//Kdybys m� pot�eboval, pomohu ti. V�, kde m� hledat.
	LESTER_ISONBOARD = LOG_OBSOLETE;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_LESTER_STILLNEEDYOU(C_INFO)
{
	npc = pc_psionic;
	nr = 4;
	condition = dia_lester_stillneedyou_condition;
	information = dia_lester_stillneedyou_info;
	permanent = TRUE;
	description = "Pot�ebuji p��tele, kter� by mi pomohl.";
};


func int dia_lester_stillneedyou_condition()
{
	if(((LESTER_ISONBOARD == LOG_OBSOLETE) || (LESTER_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_lester_stillneedyou_info()
{
	AI_Output(other,self,"DIA_Lester_StillNeedYou_15_00");	//Pot�ebuji p��tele, kter� by mi pomohl.
	if(LESTER_ISONBOARD == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Lester_StillNeedYou_13_01");	//V�d�l jsem to! Projdeme t�m bok po boku, stejn� jako p�edt�m.
		AI_Output(self,other,"DIA_Lester_StillNeedYou_13_02");	//Zlo by se m�lo m�t na pozoru. Za��n�me mu �lapat na paty.
		self.flags = NPC_FLAG_IMMORTAL;
		LESTER_ISONBOARD = LOG_SUCCESS;
		CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
		if(MIS_READYFORCHAPTER6 == TRUE)
		{
			Npc_ExchangeRoutine(self,"SHIP");
		}
		else
		{
			Npc_ExchangeRoutine(self,"WAITFORSHIP");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Lester_StillNeedYou_13_03");	//Nakonec bude p�ece jenom asi lep��, kdy� tady z�stanu. Hodn� �t�st�.
		AI_StopProcessInfos(self);
	};
};


instance DIA_LESTER_KAP6_EXIT(C_INFO)
{
	npc = pc_psionic;
	nr = 999;
	condition = dia_lester_kap6_exit_condition;
	information = dia_lester_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lester_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_lester_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PC_PSIONIC_PICKPOCKET(C_INFO)
{
	npc = pc_psionic;
	nr = 900;
	condition = dia_pc_psionic_pickpocket_condition;
	information = dia_pc_psionic_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_pc_psionic_pickpocket_condition()
{
	return c_beklauen(76,20);
};

func void dia_pc_psionic_pickpocket_info()
{
	Info_ClearChoices(dia_pc_psionic_pickpocket);
	Info_AddChoice(dia_pc_psionic_pickpocket,DIALOG_BACK,dia_pc_psionic_pickpocket_back);
	Info_AddChoice(dia_pc_psionic_pickpocket,DIALOG_PICKPOCKET,dia_pc_psionic_pickpocket_doit);
};

func void dia_pc_psionic_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_pc_psionic_pickpocket);
};

func void dia_pc_psionic_pickpocket_back()
{
	Info_ClearChoices(dia_pc_psionic_pickpocket);
};

