
instance DIA_RICHTER_EXIT(C_INFO)
{
	npc = vlk_402_richter;
	nr = 999;
	condition = dia_richter_exit_condition;
	information = dia_richter_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_richter_exit_condition()
{
	return TRUE;
};

func void dia_richter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RICHTER_HELLO(C_INFO)
{
	npc = vlk_402_richter;
	nr = 4;
	condition = dia_richter_hello_condition;
	information = dia_richter_hello_info;
	permanent = FALSE;
	description = "Co tady d�l�?";
};


func int dia_richter_hello_condition()
{
	if(MIS_LEE_JUDGERICHTER == 0)
	{
		return TRUE;
	};
};

func void dia_richter_hello_info()
{
	AI_Output(other,self,"DIA_Richter_Hello_15_00");	//Co tady d�l�?
	AI_Output(self,other,"DIA_Richter_Hello_10_01");	//Pro� m� obt�uje�? Kdo vlastn� jsi?
	AI_Output(other,self,"DIA_Richter_Hello_15_02");	//J�, ehm...
	AI_Output(self,other,"DIA_Richter_Hello_10_03");	//�ekni, nezn�me se odn�kud?
	Info_ClearChoices(dia_richter_hello);
	Info_AddChoice(dia_richter_hello,"Co si pamatuju, tak ne.",dia_richter_hello_dontthinkso);
	Info_AddChoice(dia_richter_hello,"Mo�n� ano.",dia_richter_hello_maybe);
};

func void dia_richter_hello_dontthinkso()
{
	AI_Output(other,self,"DIA_Richter_Hello_DontThinkSo_15_00");	//Co si pamatuju, tak ne.
	AI_Output(self,other,"DIA_Richter_Hello_DontThinkSo_10_01");	//To je zvl�tn�. P��sahal bych, �e u� jsme se n�kde vid�li.
	AI_Output(self,other,"DIA_Richter_Hello_DontThinkSo_10_02");	//Nevad�, v�ak jsi jen uboh� �up�k. V�ichni vypad�te stejn�.
};

func void dia_richter_hello_maybe()
{
	AI_Output(other,self,"DIA_Richter_Hello_MayBe_15_00");	//Mo�n� ano.
	AI_Output(self,other,"DIA_Richter_Hello_MayBe_10_01");	//Cht�lo by to trochu uctiv�j�� t�n! S k�m si v�bec mysl�, �e mluv�?
	AI_Output(self,other,"DIA_Richter_Hello_MayBe_10_02");	//To nejmen��, co m��e� ud�lat, je mluvit se mnou odpov�daj�c�m t�nem.
	AI_Output(self,other,"DIA_Richter_Hello_MayBe_10_03");	//A te� mi ztra� z o��!
	AI_StopProcessInfos(self);
};


instance DIA_RICHTER_PERM(C_INFO)
{
	npc = vlk_402_richter;
	nr = 800;
	condition = dia_richter_perm_condition;
	information = dia_richter_perm_info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int dia_richter_perm_condition()
{
	if((Npc_KnowsInfo(other,dia_richter_hello) || (MIS_LEE_JUDGERICHTER == LOG_RUNNING)) && (SCISTRICHTERSLAKAI == FALSE))
	{
		return TRUE;
	};
};

func void dia_richter_perm_info()
{
	AI_Output(other,self,"DIA_Richter_Perm_15_00");	//Jak se vede?
	if((MIS_LEE_JUDGERICHTER == LOG_RUNNING) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		AI_Output(self,other,"DIA_Richter_Perm_10_01");	//Rad�ji bys m�l vypadnout, ty mizernej �old�ku, ne� zavol�m str�e.
		AI_Output(other,self,"DIA_Richter_Perm_15_02");	//Kl�dek. Nep�i�el jsem t� okr�st. Hled�m pr�ci.
		AI_Output(self,other,"DIA_Richter_Perm_10_03");	//�. Tak ty pro m� chce� pracovat. Tak to je samoz�ejm� jin�.
		AI_Output(self,other,"DIA_Richter_Perm_10_04");	//Ale m� to jeden h��ek. Nev�m, jestli ti mohu v��it. Bude� mi muset nejprve prok�zat svou loajalitu.
		SCISTRICHTERSLAKAI = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Richter_Perm_10_05");	//Ne�ekl jsem snad jasn�, �e s tebou nechci nic m�t?
		AI_Output(other,self,"DIA_Richter_Perm_15_06");	//Ne, ne tolika slovy.
		AI_Output(self,other,"DIA_Richter_Perm_10_07");	//Tak to samoz�ejm� douf�m, �e ti to do�lo te�.
	};
};


instance DIA_RICHTER_RICHTERSLAKAI(C_INFO)
{
	npc = vlk_402_richter;
	nr = 2;
	condition = dia_richter_richterslakai_condition;
	information = dia_richter_richterslakai_info;
	description = "Otestuj si m�.";
};


func int dia_richter_richterslakai_condition()
{
	if((Npc_KnowsInfo(other,dia_richter_hello) || (MIS_LEE_JUDGERICHTER != 0)) && (SCISTRICHTERSLAKAI == TRUE))
	{
		return TRUE;
	};
};

func void dia_richter_richterslakai_info()
{
	AI_Output(other,self,"DIA_Richter_RichtersLakai_15_00");	//Otestuj si m�.
	AI_Output(self,other,"DIA_Richter_RichtersLakai_10_01");	//Mmh. Dobr�. Poslouchej. P�ines mi od ohniv�ch m�g� posv�tn� kladivo. Ukr�vaj� ho n�kde v podzem� sv�ho kl�tera.
	AI_Output(self,other,"DIA_Richter_RichtersLakai_10_02");	//Jestli to dok�e� splnit, mo�n� budu uva�ovat o tom, �e bych si t� najal jako sv�ho osobn�ho str�ce.
	Info_ClearChoices(dia_richter_richterslakai);
	Info_AddChoice(dia_richter_richterslakai,"To m�m jako okr�st m�gy? Nejsi trochu mimo?",dia_richter_richterslakai_nein);
	Info_AddChoice(dia_richter_richterslakai,"Dobr�.",dia_richter_richterslakai_ja);
	b_logentry(TOPIC_RICHTERLAKAI,"Soudce mi nev���. Mus�m mu prok�zat svou loajalitu - ukr�st ze sklepen� kl�tera ohniv�ch m�g� posv�tn� kladivo a p�in�st mu je.");
	MIS_RICHTER_BRINGHOLYHAMMER = LOG_RUNNING;
};

func void dia_richter_richterslakai_nein()
{
	AI_Output(other,self,"DIA_Richter_RichtersLakai_nein_15_00");	//To m�m jako okr�st m�gy? Nejsi trochu mimo?
	AI_Output(self,other,"DIA_Richter_RichtersLakai_nein_10_01");	//V tom p��pad� t�hni do pekel a p�esta� pl�tvat m�m �asem.
	AI_StopProcessInfos(self);
};

func void dia_richter_richterslakai_ja()
{
	AI_Output(other,self,"DIA_Richter_RichtersLakai_ja_15_00");	//Dobr�.
	AI_Output(self,other,"DIA_Richter_RichtersLakai_ja_10_01");	//Fajn. Ale pamatuj - jestli t� chyt�, nikdy jsem o tob� nesly�el.
	AI_StopProcessInfos(self);
};


instance DIA_RICHTER_KILLMORGAHARD(C_INFO)
{
	npc = vlk_402_richter;
	nr = 2;
	condition = dia_richter_killmorgahard_condition;
	information = dia_richter_killmorgahard_info;
	description = "Tady je posv�tn� kladivo m�g�.";
};


func int dia_richter_killmorgahard_condition()
{
	if(Npc_HasItems(other,holy_hammer_mis) && (MIS_RICHTER_BRINGHOLYHAMMER == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_richter_killmorgahard_info()
{
	AI_Output(other,self,"DIA_Richter_KillMorgahard_15_00");	//Tady je posv�tn� kladivo m�g�.
	b_giveinvitems(other,self,holy_hammer_mis,1);
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_01");	//Jsem opravdu p�ekvapen. Ty to mysl� v�n�, co? Tady je tv� odm�na.
	CreateInvItems(self,itmi_gold,300);
	b_giveinvitems(self,other,itmi_gold,300);
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_02");	//Fajn. Kdy� se to m� takhle, tak to m�m pro tebe je�t� dal�� �kol.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_03");	//P�ed n�kolika dny uteklo ze zdej��ho v�zen� p�r trestanc�.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_04");	//Ti zkurvysyni se schovali v hor�ch. N�kde sm�rem ke Xardasov� nov� v�i.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_05");	//Jejich v�dce se jmenuje Morgahard. Chci, abys ho zabil.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_06");	//Posp� si, ne� n�m proklouzne.
	Wld_InsertNpc(bdt_1030_morgahard,"REICH");
	Wld_InsertNpc(bdt_1031_fluechtling,"REICH");
	Wld_InsertNpc(bdt_1032_fluechtling,"REICH");
	Wld_InsertNpc(bdt_1033_fluechtling,"REICH");
	Wld_InsertNpc(bdt_1034_fluechtling,"REICH");
	Wld_InsertNpc(bdt_1035_fluechtling,"REICH");
	b_initnpcglobals();
	b_giveplayerxp(XP_BRINGHOLYHAMMER);
	MIS_RICHTER_BRINGHOLYHAMMER = LOG_SUCCESS;
	b_logentry(TOPIC_RICHTERLAKAI,"N�kte�� v�zni unikli spravedlnosti. J� je m�m dostihnout a zab�t jejich velitele Morgaharda. Nejsp� se ukr�vaj� v hor�ch, kdesi sm�rem ke Xardasov� nov� v�i.");
	MIS_RICHTER_KILLMORGAHARD = LOG_RUNNING;
	AI_StopProcessInfos(self);
};


instance DIA_RICHTER_KILLEDMORGAHARD(C_INFO)
{
	npc = vlk_402_richter;
	nr = 2;
	condition = dia_richter_killedmorgahard_condition;
	information = dia_richter_killedmorgahard_info;
	description = "Morgahard je mrtv�.";
};


func int dia_richter_killedmorgahard_condition()
{
	if(Npc_IsDead(morgahard) && (MIS_RICHTER_KILLMORGAHARD == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_richter_killedmorgahard_info()
{
	AI_Output(other,self,"DIA_Richter_KilledMorgahard_15_00");	//Morgahard je mrtv�.
	AI_Output(self,other,"DIA_Richter_KilledMorgahard_10_01");	//�. Jsi dobrej chlap. Tady je tv� odm�na.
	CreateInvItems(self,itmi_gold,400);
	b_giveinvitems(self,other,itmi_gold,400);
	b_giveplayerxp(XP_KILLMORGAHARD);
	b_logentry(TOPIC_RICHTERLAKAI,"Soudce byl zpr�vou o Morgahardov� smrti o�ividn� nad�en. No, nechme ho b�t. Nesm�m odbo�ovat od posl�n�, kter�m m� pov��il Lee.");
	MIS_RICHTER_KILLMORGAHARD = LOG_SUCCESS;
};


instance DIA_RICHTER_KILLEDMORGAHARDPERM(C_INFO)
{
	npc = vlk_402_richter;
	nr = 2;
	condition = dia_richter_killedmorgahardperm_condition;
	information = dia_richter_killedmorgahardperm_info;
	permanent = TRUE;
	description = "M��u pro tebe je�t� n�co ud�lat?";
};


func int dia_richter_killedmorgahardperm_condition()
{
	if((MIS_RICHTER_KILLMORGAHARD == LOG_SUCCESS) && (MIS_RICHTERSPERMISSIONFORSHIP == 0))
	{
		return TRUE;
	};
};

func void dia_richter_killedmorgahardperm_info()
{
	AI_Output(other,self,"DIA_Richter_KilledMorgahardPERM_15_00");	//M��u pro tebe je�t� n�co ud�lat?
	AI_Output(self,other,"DIA_Richter_KilledMorgahardPERM_10_01");	//Te� zrovna ne. Mo�n� pozd�ji.
};


instance DIA_RICHTER_PERMISSIONFORSHIP(C_INFO)
{
	npc = vlk_402_richter;
	nr = 2;
	condition = dia_richter_permissionforship_condition;
	information = dia_richter_permissionforship_info;
	description = "Dej mi p�semn� pov��en� pro paladinskou lo�.";
};


func int dia_richter_permissionforship_condition()
{
	if(MIS_RICHTERSPERMISSIONFORSHIP == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_richter_permissionforship_info()
{
	AI_Output(other,self,"DIA_Richter_PermissionForShip_15_00");	//Dej mi p�semn� pov��en� pro paladinskou lo�.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_01");	//(sm�ch) Ty ses musel zbl�znit. Co to po mn� chce�?
	AI_Output(other,self,"DIA_Richter_PermissionForShip_15_02");	//Sly�el jsi dob�e. Dej mi to p�semn� opr�vn�n�, nebo t� pr�sknu domobran�.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_03");	//(vr��) Nenech�m se vyd�rat! Ne od tebe! Nech�m t� se�rat vlk�m, ty mizernej �mejde.
	AI_Output(other,self,"DIA_Richter_PermissionForShip_15_04");	//Morgahard napadl m�stodr��c�ho tv�m jm�nem. M�m dokument, kter� to dokazuje.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_05");	//(vr��) Arrh.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_06");	//Toho bude� litovat. Nikdo m� nebude vyd�rat, ani� by z toho vyv�z se zdravou k���.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_07");	//Tady je to tv� opr�vn�n�. A te� vypadni. Vy��d�m si to s tebou pozd�ji.
	CreateInvItems(self,itwr_forgedshipletter_mis,1);
	b_giveinvitems(self,other,itwr_forgedshipletter_mis,1);
	b_logentry(TOPIC_SHIP,"S plnou moc� v kapse mohu z�skat lo�, ne� bys �ekl �vec. Jsem zv�dav�, co tomu �ekne Lee.");
	MIS_RICHTERSPERMISSIONFORSHIP = LOG_SUCCESS;
	b_giveplayerxp(XP_RICHTERSPERMISSIONFORSHIP);
};


instance DIA_RICHTER_PERM2(C_INFO)
{
	npc = vlk_402_richter;
	nr = 2;
	condition = dia_richter_perm2_condition;
	information = dia_richter_perm2_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_richter_perm2_condition()
{
	if((MIS_RICHTERSPERMISSIONFORSHIP == LOG_SUCCESS) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_richter_perm2_info()
{
	AI_Output(self,other,"DIA_Richter_perm2_10_00");	//Ztra� se mi z o��.
	AI_StopProcessInfos(self);
};


instance DIA_RICHTER_PICKPOCKET(C_INFO)
{
	npc = vlk_402_richter;
	nr = 900;
	condition = dia_richter_pickpocket_condition;
	information = dia_richter_pickpocket_info;
	permanent = TRUE;
	description = "(Tenhle kl�� lze snadno ukr�st)";
};


func int dia_richter_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_richter) >= 1) && (other.attribute[ATR_DEXTERITY] >= (30 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_richter_pickpocket_info()
{
	Info_ClearChoices(dia_richter_pickpocket);
	Info_AddChoice(dia_richter_pickpocket,DIALOG_BACK,dia_richter_pickpocket_back);
	Info_AddChoice(dia_richter_pickpocket,DIALOG_PICKPOCKET,dia_richter_pickpocket_doit);
};

func void dia_richter_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		b_giveinvitems(self,other,itke_richter,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_richter_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_richter_pickpocket_back()
{
	Info_ClearChoices(dia_richter_pickpocket);
};

