
instance DIA_MIKA_EXIT(C_INFO)
{
	npc = mil_337_mika;
	nr = 999;
	condition = dia_mika_exit_condition;
	information = dia_mika_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_mika_exit_condition()
{
	if(KAPITEL <= 2)
	{
		return TRUE;
	};
};

func void dia_mika_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIKA_REFUSE(C_INFO)
{
	npc = mil_337_mika;
	nr = 1;
	condition = dia_mika_refuse_condition;
	information = dia_mika_refuse_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mika_refuse_condition()
{
	if(Npc_IsInState(self,zs_talk) && (lares.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_mika_refuse_info()
{
	b_say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};


instance DIA_MIKA_WOHIN(C_INFO)
{
	npc = mil_337_mika;
	nr = 4;
	condition = dia_mika_wohin_condition;
	information = dia_mika_wohin_info;
	important = TRUE;
};


func int dia_mika_wohin_condition()
{
	if(lares.aivar[AIV_PARTYMEMBER] == FALSE)
	{
		return TRUE;
	};
};

func void dia_mika_wohin_info()
{
	AI_Output(self,other,"DIA_Mika_WOHIN_12_00");	//Hej, hej. Ne tak rychle. Bloumat tady o samotì mùže být docela nebezpeèný. Odkud jsi?
	Info_ClearChoices(dia_mika_wohin);
	Info_AddChoice(dia_mika_wohin,"Do toho ti nic není.",dia_mika_wohin_weg);
	Info_AddChoice(dia_mika_wohin,"Z jedné z farem.",dia_mika_wohin_bauern);
	Info_AddChoice(dia_mika_wohin,"Z mìsta!",dia_mika_wohin_stadt);
};

func void dia_mika_wohin_stadt()
{
	AI_Output(other,self,"DIA_Mika_WOHIN_stadt_15_00");	//Z mìsta!
	AI_Output(self,other,"DIA_Mika_WOHIN_stadt_12_01");	//Dobrá, dobrá. Tak proè se potom poflakuješ tady, daleko od bezpeèí mìstskejch hradeb?
	Info_ClearChoices(dia_mika_wohin);
};

func void dia_mika_wohin_bauern()
{
	AI_Output(other,self,"DIA_Mika_WOHIN_Bauern_15_00");	//Z jedné z farem.
	AI_Output(self,other,"DIA_Mika_WOHIN_Bauern_12_01");	//Farmáø, co? Hmm. V tom pøípadì by ses nemìl courat po tìchhle nebezpeènejch cestách o samotì. Kdo ví, kdo by tady na tebe mohl èíhat.
	Info_ClearChoices(dia_mika_wohin);
};

func void dia_mika_wohin_weg()
{
	AI_Output(other,self,"DIA_Mika_WOHIN_weg_15_00");	//Do toho ti nic není.
	AI_Output(self,other,"DIA_Mika_WOHIN_weg_12_01");	//Když myslíš. Ale až tì nìkdo sejme, tak si potom nestìžuj. Pøeju hezkej den.
	AI_StopProcessInfos(self);
};


instance DIA_MIKA_WASGEFAEHRLICH(C_INFO)
{
	npc = mil_337_mika;
	nr = 5;
	condition = dia_mika_wasgefaehrlich_condition;
	information = dia_mika_wasgefaehrlich_info;
	description = "Co je tady tak nebezpeèné?";
};


func int dia_mika_wasgefaehrlich_condition()
{
	return TRUE;
};

func void dia_mika_wasgefaehrlich_info()
{
	AI_Output(other,self,"DIA_Mika_WASGEFAEHRLICH_15_00");	//Co je tady tak nebezpeèné?
	AI_Output(self,other,"DIA_Mika_WASGEFAEHRLICH_12_01");	//Spousta vìcí.
	if(other.protection[PROT_EDGE] < itar_leather_l.protection[PROT_EDGE])
	{
		AI_Output(self,other,"DIA_Mika_WASGEFAEHRLICH_12_02");	//Za prvé jsou tady banditi. Takovou mìkkotu, jako jsi ty, klidnì zblajznou k snídani.
		AI_Output(self,other,"DIA_Mika_WASGEFAEHRLICH_12_03");	//A když tì nechytìj banditi, tak se o tebe postaraj divoký zvíøata v lese nebo žoldáci, co se potulujou tady po okolí.
		AI_Output(self,other,"DIA_Mika_WASGEFAEHRLICH_12_04");	//Takže než nìkam vyrazíš, mìl by sis sehnat nìjaký slušný brnìní.
	};
	AI_Output(self,other,"DIA_Mika_WASGEFAEHRLICH_12_05");	//Vsadím se, že budeš køièet o pomoc hned za první zatáèkou.
};


instance DIA_MIKA_WASKOSTETHILFE(C_INFO)
{
	npc = mil_337_mika;
	nr = 6;
	condition = dia_mika_waskostethilfe_condition;
	information = dia_mika_waskostethilfe_info;
	description = "Jenom pro pøípad, že bych tvou pomoc opravdu potøeboval. Kolik by mì to stálo?";
};


func int dia_mika_waskostethilfe_condition()
{
	if(Npc_KnowsInfo(other,dia_mika_wasgefaehrlich))
	{
		return TRUE;
	};
};

func void dia_mika_waskostethilfe_info()
{
	AI_Output(other,self,"DIA_Mika_WASKOSTETHILFE_15_00");	//Jenom pro pøípad, že bych tvou pomoc opravdu potøeboval. Kolik by mì to stálo?
	AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_12_01");	//Jsem prostý skromný služebník krále a v žádném pøípadì bych nechtìl oškubat bezbranného obèana království.
	AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_12_02");	//Ale, no... když to øíkáš takhle... rozhodnì bych nemìl nic proti nìjakýmu malýmu finanènímu upevnìní našich budoucích obchodních vztahù.
	AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_12_03");	//10 zlatejch by mìlo pro zaèátek staèit. Co ty na to?
	Info_ClearChoices(dia_mika_waskostethilfe);
	Info_AddChoice(dia_mika_waskostethilfe,"Budu o tom pøemýšlet.",dia_mika_waskostethilfe_nochnicht);
	Info_AddChoice(dia_mika_waskostethilfe,"Proè ne? Tady máš svých 10 zlaákù.",dia_mika_waskostethilfe_ja);
};

func void dia_mika_waskostethilfe_ja()
{
	AI_Output(other,self,"DIA_Mika_WASKOSTETHILFE_ja_15_00");	//Proè ne? Tady máš svých 10 zlaákù.
	if(b_giveinvitems(other,self,itmi_gold,10))
	{
		AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_ja_12_01");	//Výbornì. Kdybys potøeboval pomoc, víš, kde mì hledat.
		AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_ja_12_02");	//Ale chtìl bych tì poprosit o jednu malièkost. Nechoï za mnou se žádnejma prkotinama. To mì vždycky dokáže vytoèit, rozumíme si?
		MIKA_HELPS = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_ja_12_03");	//Tolik penìz nemáš. Možná by sis mìl rozmyslet, jestli opravdu mojí pomoc potøebuješ.
	};
	AI_StopProcessInfos(self);
};

func void dia_mika_waskostethilfe_nochnicht()
{
	AI_Output(other,self,"DIA_Mika_WASKOSTETHILFE_nochnicht_15_00");	//Budu o tom pøemýšlet.
	AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_nochnicht_12_01");	//Jak je libo. Pozdravuj zubatou.
	AI_StopProcessInfos(self);
};


instance DIA_MIKA_UEBERLEGT(C_INFO)
{
	npc = mil_337_mika;
	nr = 7;
	condition = dia_mika_ueberlegt_condition;
	information = dia_mika_ueberlegt_info;
	permanent = TRUE;
	description = "Rozmyslel jsem si to. Zaplatím tìch 10 zlatých.";
};


func int dia_mika_ueberlegt_condition()
{
	if(Npc_KnowsInfo(other,dia_mika_waskostethilfe) && (MIKA_HELPS == FALSE))
	{
		return TRUE;
	};
};

func void dia_mika_ueberlegt_info()
{
	AI_Output(other,self,"DIA_Mika_UEBERLEGT_15_00");	//Rozmyslel jsem si to. Zaplatím tìch 10 zlatých.
	if(b_giveinvitems(other,self,itmi_gold,10))
	{
		AI_Output(self,other,"DIA_Mika_UEBERLEGT_12_01");	//Skvìlé. Lepší pozdì než nikdy. A co teï?
		MIKA_HELPS = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Mika_UEBERLEGT_12_02");	//(rozzlobenì) Vra se, až budeš mít ty prachy.
		AI_StopProcessInfos(self);
	};
};


instance DIA_MIKA_HILFE(C_INFO)
{
	npc = mil_337_mika;
	nr = 8;
	condition = dia_mika_hilfe_condition;
	information = dia_mika_hilfe_info;
	permanent = TRUE;
	description = "Potøebuji tvou pomoc.";
};


func int dia_mika_hilfe_condition()
{
	if(MIKA_HELPS == TRUE)
	{
		return TRUE;
	};
};

func void dia_mika_hilfe_info()
{
	AI_Output(other,self,"DIA_Mika_HILFE_15_00");	//Potøebuji tvou pomoc.
	AI_Output(self,other,"DIA_Mika_HILFE_12_01");	//Jestli to je naprosto nezbytný... Co se dìje?
	Info_ClearChoices(dia_mika_hilfe);
	Info_AddChoice(dia_mika_hilfe,"Pronásledují mì bandité.",dia_mika_hilfe_schongut);
	Info_AddChoice(dia_mika_hilfe,"Zaútoèily na mì pøíšery.",dia_mika_hilfe_monster);
	if(!Npc_IsDead(alvares) && !Npc_IsDead(engardo) && ((AKILS_SLDSTILLTHERE == TRUE) || Npc_KnowsInfo(other,dia_sarah_bauern)))
	{
		Info_AddChoice(dia_mika_hilfe,"Na farmáøe Akila zaútoèili žoldáci.",dia_mika_hilfe_akil);
	};
};

func void dia_mika_hilfe_akil()
{
	AI_Output(other,self,"DIA_Mika_HILFE_Akil_15_00");	//Na farmáøe Akila zaútoèili žoldáci.
	AI_Output(self,other,"DIA_Mika_HILFE_Akil_12_01");	//(znepokojenì) Cože? Ta lùza vyrazila na Akilovu farmu? Tak to není èasu nazbyt. Pojï za mnou.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	b_giveplayerxp(XP_AMBIENT);
	b_logentry(TOPIC_AKILSSLDSTILLTHERE,"Mika chce, abych vyøešil problém se žoldnéøi na Akilovì farmì.");
	Npc_ExchangeRoutine(self,"Akil");
};

func void dia_mika_hilfe_monster()
{
	AI_Output(other,self,"DIA_Mika_HILFE_monster_15_00");	//Zaútoèily na mì pøíšery.
	AI_Output(self,other,"DIA_Mika_HILFE_monster_12_01");	//Ale já žádný pøíšery nevidím. Urèitì sis to jenom vymyslel.
	AI_StopProcessInfos(self);
};

func void dia_mika_hilfe_schongut()
{
	AI_Output(other,self,"DIA_Mika_HILFE_schongut_15_00");	//Pronásledují mì bandité.
	AI_Output(self,other,"DIA_Mika_HILFE_schongut_12_01");	//Vážnì? A kde tedy jsou? Kdyby tì pronásledovali, urèitì bych mìl vidìt alespoò jednoho, ne?
	AI_StopProcessInfos(self);
};


instance DIA_MIKA_ZACK(C_INFO)
{
	npc = mil_337_mika;
	nr = 8;
	condition = dia_mika_zack_condition;
	information = dia_mika_zack_info;
	important = TRUE;
};


func int dia_mika_zack_condition()
{
	if((Npc_GetDistToWP(self,"NW_FARM2_PATH_03") < 500) && (!Npc_IsDead(alvares) || !Npc_IsDead(engardo)))
	{
		return TRUE;
	};
};

func void dia_mika_zack_info()
{
	AI_Output(self,other,"DIA_Mika_Zack_12_00");	//Teï sleduj, jak se to dìlá.
	Info_AddChoice(dia_mika_zack,DIALOG_ENDE,dia_mika_zack_los);
};

func void dia_mika_zack_los()
{
	AI_StopProcessInfos(self);
	if(!Npc_IsDead(alvares))
	{
		alvares.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	};
	if(!Npc_IsDead(engardo))
	{
		engardo.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	};
};


instance DIA_MIKA_WIEDERNACHHAUSE(C_INFO)
{
	npc = mil_337_mika;
	nr = 9;
	condition = dia_mika_wiedernachhause_condition;
	information = dia_mika_wiedernachhause_info;
	important = TRUE;
};


func int dia_mika_wiedernachhause_condition()
{
	if((Npc_GetDistToWP(self,"NW_FARM2_PATH_03") < 10000) && Npc_IsDead(alvares) && Npc_IsDead(engardo))
	{
		return TRUE;
	};
};

func void dia_mika_wiedernachhause_info()
{
	AI_Output(self,other,"DIA_Mika_WIEDERNACHHAUSE_12_00");	//Dobrá. Tak jo. Já tedy pùjdu.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"Start");
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_MIKA_KAP3_EXIT(C_INFO)
{
	npc = mil_337_mika;
	nr = 999;
	condition = dia_mika_kap3_exit_condition;
	information = dia_mika_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_mika_kap3_exit_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_mika_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIKA_KAP3U4U5_PERM(C_INFO)
{
	npc = mil_337_mika;
	nr = 39;
	condition = dia_mika_kap3u4u5_perm_condition;
	information = dia_mika_kap3u4u5_perm_info;
	permanent = TRUE;
	description = "Všechno v poøádku?";
};


func int dia_mika_kap3u4u5_perm_condition()
{
	if((KAPITEL >= 3) && Npc_KnowsInfo(other,dia_mika_wohin) && Npc_IsDead(alvares) && Npc_IsDead(engardo))
	{
		return TRUE;
	};
};

func void dia_mika_kap3u4u5_perm_info()
{
	AI_Output(other,self,"DIA_Mika_Kap3u4u5_PERM_15_00");	//Všechno v poøádku?
	AI_Output(self,other,"DIA_Mika_Kap3u4u5_PERM_12_01");	//Ještì poøád jsi naživu. To na mì udìlalo dojem.
};


instance DIA_MIKA_PICKPOCKET(C_INFO)
{
	npc = mil_337_mika;
	nr = 900;
	condition = dia_mika_pickpocket_condition;
	information = dia_mika_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_mika_pickpocket_condition()
{
	return c_beklauen(65,75);
};

func void dia_mika_pickpocket_info()
{
	Info_ClearChoices(dia_mika_pickpocket);
	Info_AddChoice(dia_mika_pickpocket,DIALOG_BACK,dia_mika_pickpocket_back);
	Info_AddChoice(dia_mika_pickpocket,DIALOG_PICKPOCKET,dia_mika_pickpocket_doit);
};

func void dia_mika_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_mika_pickpocket);
};

func void dia_mika_pickpocket_back()
{
	Info_ClearChoices(dia_mika_pickpocket);
};

