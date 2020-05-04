
func void b_kommmit()
{
	AI_Output(other,self,"DIA_AkilsSchaf_KommMit_15_00");	//Poj� za mnou!
};

func void b_biff_verarschen()
{
	AI_Output(self,other,"DIA_Biff_ARBEITEN_lebenlassen_07_01");	//Nem�m zapot�eb�, aby si ze m� n�kdo d�lal bl�zny.
};

func void b_biffsanteil_berechnung()
{
	var int momentankohle;
	var int ueberschusskohle;
	momentankohle = Npc_HasItems(hero,itmi_gold);
	ueberschusskohle = momentankohle - DJG_BIFF_SCGOLD;
	BIFFSANTEIL = ueberschusskohle / 2;
};

func void b_biffsanteil_printscreen()
{
	var string biffsanteiltext_teil;
	var string biffsanteiltext;
	var string anteil;
	anteil = IntToString(BIFFSANTEIL);
	biffsanteiltext_teil = ConcatStrings(PRINT_BIFFSANTEIL,anteil);
	biffsanteiltext = ConcatStrings(biffsanteiltext_teil,PRINT_BIFFGOLD);
	AI_PrintScreen(biffsanteiltext,-1,45,FONT_SCREENSMALL,4);
};

func void b_biff_setrefusetalk()
{
	if(DJG_BIFF_HALBEHALBE == TRUE)
	{
		Npc_SetRefuseTalk(biff,1000);
	}
	else
	{
		Npc_SetRefuseTalk(biff,600);
	};
};


instance DIA_BIFF_EXIT(C_INFO)
{
	npc = djg_713_biff;
	nr = 999;
	condition = dia_biff_exit_condition;
	information = dia_biff_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_biff_exit_condition()
{
	return TRUE;
};

func void dia_biff_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BIFF_HALLO(C_INFO)
{
	npc = djg_713_biff;
	nr = 5;
	condition = dia_biff_hallo_condition;
	information = dia_biff_hallo_info;
	description = "Co tady d�l�?";
};


func int dia_biff_hallo_condition()
{
	return TRUE;
};

func void dia_biff_hallo_info()
{
	AI_Output(other,self,"DIA_Biff_HALLO_15_00");	//Co tady d�l�?
	AI_Output(self,other,"DIA_Biff_HALLO_07_01");	//To je ta nejblb�j�� ot�zka, jakou jsem kdy sly�el. Co asi tak mysl�?
	Info_AddChoice(dia_biff_hallo,"Z tak p�iblbl�ho v�razu, jakej m� ty, se ned� nic poznat. Proto jsem se taky musel zeptat.",dia_biff_hallo_spott);
	Info_AddChoice(dia_biff_hallo,"Tak o tom nem�m ani tucha.",dia_biff_hallo_keineahnung);
	Info_AddChoice(dia_biff_hallo,"To nic.",dia_biff_hallo_doof);
};

func void dia_biff_hallo_doof()
{
	AI_Output(other,self,"DIA_Biff_HALLO_doof_15_00");	//To nic.
	Info_ClearChoices(dia_biff_hallo);
};

func void dia_biff_hallo_spott()
{
	AI_Output(other,self,"DIA_Biff_HALLO_spott_15_00");	//Z tak p�iblbl�ho v�razu, jakej m� ty, se ned� nic poznat. Proto jsem se taky musel zeptat.
	AI_Output(self,other,"DIA_Biff_HALLO_spott_07_01");	//Na m�j vkus m� n�jak moc velkou hubu. Je na�ase, aby ti ji n�kdo zav�el.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
	DJG_BIFFPARTY_NOMORE = DJG_BIFFPARTY_NOMORE + 1;
};

func void dia_biff_hallo_keineahnung()
{
	AI_Output(other,self,"DIA_Biff_HALLO_keineAhnung_15_00");	//Tak o tom nem�m ani tucha.
	AI_Output(self,other,"DIA_Biff_HALLO_keineAhnung_07_01");	//�ek�m, co se tu nakonec semele.
	Info_AddChoice(dia_biff_hallo,"Co �ek�, �e se stane?",dia_biff_hallo_keineahnung_was);
};

func void dia_biff_hallo_keineahnung_was()
{
	AI_Output(other,self,"DIA_Biff_HALLO_keineAhnung_was_15_00");	//Co �ek�, �e se stane?
	AI_Output(self,other,"DIA_Biff_HALLO_keineAhnung_was_07_01");	//Hele chlape, ty sis v�n� nebyl dvakr�t, kdy� Innos rozd�val rozum. Kdybych to v�d�l, na nic bych ne�ekal.
	Info_AddChoice(dia_biff_hallo,"Tak co se chyst�?",dia_biff_hallo_keineahnung_was_was2);
};

func void dia_biff_hallo_keineahnung_was_was2()
{
	AI_Output(other,self,"DIA_Biff_HALLO_keineAhnung_was_was2_15_00");	//Tak co se chyst�?
	AI_Output(self,other,"DIA_Biff_HALLO_keineAhnung_was_was2_07_01");	//U� mi leze� na nervy. Hele, nestar�m se o to, co se stane. A� do t� chv�le, kdy se to stane.
	Info_AddChoice(dia_biff_hallo,"Tak pro� n�co ned�l�?",dia_biff_hallo_keineahnung_was_was2_was3);
};

func void dia_biff_hallo_keineahnung_was_was2_was3()
{
	AI_Output(other,self,"DIA_Biff_HALLO_keineAhnung_was_was2_was3_15_00");	//Tak pro� n�co ned�l�?
	AI_Output(self,other,"DIA_Biff_HALLO_keineAhnung_was_was2_was3_07_01");	//Jestli mi okam�it� nep�estane� d�vat ty p�iblbl� ot�zky, tak ti tu tvoj� nevym�chanou hubu rychle zav�u.
	Info_AddChoice(dia_biff_hallo,"Kdy� tu bude� jen tak �ekat, nikdy se nic nestane!",dia_biff_hallo_keineahnung_was_was2_was3_was4);
};

func void dia_biff_hallo_keineahnung_was_was2_was3_was4()
{
	AI_Output(other,self,"DIA_Biff_HALLO_keineAhnung_was_was2_was3_was4_15_00");	//Kdy� tu bude� jen tak �ekat, nikdy se nic nestane!
	AI_Output(self,other,"DIA_Biff_HALLO_keineAhnung_was_was2_was3_was4_07_01");	//Jo, tak to je!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
	DJG_BIFFPARTY_NOMORE = DJG_BIFFPARTY_NOMORE + 1;
};


instance DIA_BIFF_WASHIERIMTAL(C_INFO)
{
	npc = djg_713_biff;
	nr = 7;
	condition = dia_biff_washierimtal_condition;
	information = dia_biff_washierimtal_info;
	description = "Co douf�, �e tu najde�?";
};


func int dia_biff_washierimtal_condition()
{
	if(Npc_KnowsInfo(other,dia_biff_hallo))
	{
		return TRUE;
	};
};

func void dia_biff_washierimtal_info()
{
	AI_Output(other,self,"DIA_Biff_WASHIERIMTAL_15_00");	//Co douf�, �e tu najde�?
	AI_Output(self,other,"DIA_Biff_WASHIERIMTAL_07_01");	//Sl�vu a zlato. Co v�c? A� se vypo��d�m s t�mi draky, budu se topit v pen�z�ch.
	AI_Output(self,other,"DIA_Biff_WASHIERIMTAL_07_02");	//A douf�m, �e budu m�t dost na to, abych si mohl do konce �ivota u��vat po v�ech hospod�ch a nev�stinc�ch v zemi.
	Info_AddChoice(dia_biff_washierimtal,"Fajn, tak ti p�eju hodn� �t�st�.",dia_biff_washierimtal_vielglueck);
	Info_AddChoice(dia_biff_washierimtal,"Bu� tak, nebo bude� mrtvej!",dia_biff_washierimtal_ihrtot);
};

func void dia_biff_washierimtal_ihrtot()
{
	AI_Output(other,self,"DIA_Biff_WASHIERIMTAL_ihrtot_15_00");	//Bu� tak, nebo bude� mrtvej!
	AI_Output(self,other,"DIA_Biff_WASHIERIMTAL_ihrtot_07_01");	//A co? To k tomu pat��. Kdy� chce� bejt bohatej, mus� trochu riskovat.
	Info_ClearChoices(dia_biff_washierimtal);
};

func void dia_biff_washierimtal_vielglueck()
{
	AI_Output(other,self,"DIA_Biff_WASHIERIMTAL_vielglueck_15_00");	//Fajn, tak ti p�eju hodn� �t�st�.
	AI_Output(self,other,"DIA_Biff_WASHIERIMTAL_vielglueck_07_01");	//Nepot�ebuju ��dn� �t�st�. Sta�� mi moje sekera.
	Info_ClearChoices(dia_biff_washierimtal);
};


instance DIA_BIFF_ARBEITEN(C_INFO)
{
	npc = djg_713_biff;
	nr = 8;
	condition = dia_biff_arbeiten_condition;
	information = dia_biff_arbeiten_info;
	permanent = TRUE;
	description = "Jak by se ti l�bilo pracovat pro m�?";
};


func int dia_biff_arbeiten_condition()
{
	if((DJG_BIFFPARTY == FALSE) && Npc_KnowsInfo(other,dia_biff_hallo) && (DJG_BIFF_STAY == FALSE))
	{
		return TRUE;
	};
};

func void dia_biff_arbeiten_info()
{
	AI_Output(other,self,"DIA_Biff_ARBEITEN_15_00");	//Jak by se ti l�bilo pracovat pro m�?
	b_logentry(TOPIC_DRAGONHUNTER,"Drakobijce Biff je �oldn�� t�lem i du��. Kdy� mu zaplat�m, bojovat po m�m boku.");
	if(DJG_BIFFPARTY_NOMORE >= 6)
	{
		AI_Output(self,other,"DIA_Biff_ARBEITEN_07_01");	//U� jsme to jednou zkusili. Moc to nefungovalo. D�ky, nem�m z�jem.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Biff_ARBEITEN_07_02");	//Mmh. Pro� ne? Co z toho budu m�t?
	};
	Info_ClearChoices(dia_biff_arbeiten);
	Info_AddChoice(dia_biff_arbeiten,"Bude� r�d, kdy� t� nech�m na�ivu.",dia_biff_arbeiten_lebenlassen);
	Info_AddChoice(dia_biff_arbeiten,"D�m ti p�lku ko�isti.",dia_biff_arbeiten_halbehalbe);
	Info_AddChoice(dia_biff_arbeiten,"D�m ti 100 zlat�ch.",dia_biff_arbeiten_100);
};

func void dia_biff_arbeiten_100()
{
	AI_Output(other,self,"DIA_Biff_ARBEITEN_100_15_00");	//D�m ti 100 zlat�ch.
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(self,other,"DIA_Biff_ARBEITEN_100_07_01");	//Tak dobr�. Mimochodem, to je jen pro za��tek. Jdeme. P�jdu za tebou.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Follow");
		b_biff_setrefusetalk();
		self.aivar[AIV_PARTYMEMBER] = TRUE;
		DJG_BIFFPARTY = TRUE;
	}
	else
	{
		b_biff_verarschen();
		AI_StopProcessInfos(self);
		DJG_BIFFPARTY_NOMORE = DJG_BIFFPARTY_NOMORE + 1;
	};
};

func void dia_biff_arbeiten_halbehalbe()
{
	AI_Output(other,self,"DIA_Biff_ARBEITEN_HalbeHalbe_15_00");	//D�m ti p�lku ko�isti.
	AI_Output(self,other,"DIA_Biff_ARBEITEN_HalbeHalbe_07_01");	//To zn� dob�e. Ale varuju t�, nepokou�ej se m� podv�st, jinak toho bude� litovat.
	AI_Output(self,other,"DIA_Biff_ARBEITEN_HalbeHalbe_07_02");	//A je�t� jedna v�c, nezaj�maj� m� ��dn� zbran� ani dal�� kr�my, co tady najde�. Chci jen zlato, jasn�?
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Follow");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	DJG_BIFFPARTY = TRUE;
	DJG_BIFF_HALBEHALBE = TRUE;
	b_biff_setrefusetalk();
	if(DJG_BIFF_HALBEHALBE_AGAIN == FALSE)
	{
		DJG_BIFF_SCGOLD = Npc_HasItems(hero,itmi_gold);
		DJG_BIFF_HALBEHALBE_AGAIN = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Biff_ARBEITEN_HalbeHalbe_07_03");	//Ale co to ��k�m. Tohle v�echno u� jsi v�d�l.
	};
};

func void dia_biff_arbeiten_lebenlassen()
{
	AI_Output(other,self,"DIA_Biff_ARBEITEN_lebenlassen_15_00");	//Bude� r�d, kdy� t� nech�m na�ivu.
	b_biff_verarschen();
	AI_StopProcessInfos(self);
	DJG_BIFFPARTY_NOMORE = DJG_BIFFPARTY_NOMORE + 1;
};


instance DIA_BIFF_GELDEINTREIBEN(C_INFO)
{
	npc = djg_713_biff;
	nr = 9;
	condition = dia_biff_geldeintreiben_condition;
	information = dia_biff_geldeintreiben_info;
	important = TRUE;
	permanent = TRUE;
};


var int biff_labert_geldeintreiben;

func int dia_biff_geldeintreiben_condition()
{
	if((DJG_BIFF_SCGOLD < (Npc_HasItems(hero,itmi_gold) - 1)) && (Npc_GetBodyState(hero) != BS_INVENTORY) && (Npc_GetBodyState(hero) != BS_MOBINTERACT_INTERRUPT) && ((Npc_GetBodyState(hero) != BS_STAND) || (BIFF_LABERT_GELDEINTREIBEN == TRUE)) && ((Npc_GetBodyState(hero) != BS_ITEMINTERACT) || (BIFF_LABERT_GELDEINTREIBEN == TRUE)) && (DJG_BIFF_HALBEHALBE == TRUE) && (DJG_BIFFPARTY == TRUE) && (DJG_BIFF_STAY == FALSE))
	{
		BIFF_LABERT_GELDEINTREIBEN = TRUE;
		return TRUE;
	};
};

func void dia_biff_geldeintreiben_info()
{
	AI_Output(self,other,"DIA_Biff_GELDEINTREIBEN_07_00");	//Po�kej chvilku! Ne��kals, �e p�lka ko�isti pat�� mn�? Dej to sem!
	b_biffsanteil_berechnung();
	b_biffsanteil_printscreen();
	Info_ClearChoices(dia_biff_geldeintreiben);
	Info_AddChoice(dia_biff_geldeintreiben,"To si nem��u dovolit.",dia_biff_geldeintreiben_zuteuer);
	Info_AddChoice(dia_biff_geldeintreiben,"Tady je tv�j pod�l.",dia_biff_geldeintreiben_geben);
};

func void dia_biff_geldeintreiben_geben()
{
	AI_Output(other,self,"DIA_Biff_GELDEINTREIBEN_geben_15_00");	//Tady je tv�j pod�l.
	AI_Output(self,other,"DIA_Biff_GELDEINTREIBEN_geben_07_01");	//Dobr�. Tak jdeme.
	AI_StopProcessInfos(self);
	b_giveinvitems(other,self,itmi_gold,BIFFSANTEIL);
	b_biff_setrefusetalk();
	BIFF_LABERT_GELDEINTREIBEN = FALSE;
	DJG_BIFF_SCGOLD = Npc_HasItems(hero,itmi_gold);
};

func void dia_biff_geldeintreiben_zuteuer()
{
	AI_Output(other,self,"DIA_Biff_GELDEINTREIBEN_zuTeuer_15_00");	//To si nem��u dovolit.
	AI_Output(self,other,"DIA_Biff_GELDEINTREIBEN_zuTeuer_07_01");	//P�esta� do m� hu�et. Dohodli jsme se na polovin�.
	Info_ClearChoices(dia_biff_geldeintreiben);
	Info_AddChoice(dia_biff_geldeintreiben,"Te� se mus�me rozd�lit, je mi l�to.",dia_biff_geldeintreiben_zuteuer_trennen);
	Info_AddChoice(dia_biff_geldeintreiben,"Tady je tv�j pod�l.",dia_biff_geldeintreiben_geben);
};

func void dia_biff_geldeintreiben_zuteuer_trennen()
{
	AI_Output(other,self,"DIA_Biff_GELDEINTREIBEN_zuTeuer_trennen_15_00");	//Te� se mus�me rozd�lit, je mi l�to.
	AI_Output(self,other,"DIA_Biff_GELDEINTREIBEN_zuTeuer_trennen_07_01");	//Kdy� to ��k�. Tak to si prost� vezmu sv�j pod�l.
	BIFF_LABERT_GELDEINTREIBEN = FALSE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	b_attack(self,other,AR_NONE,1);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	DJG_BIFFPARTY = FALSE;
	DJG_BIFF_HALBEHALBE = FALSE;
	DJG_BIFFPARTY_NOMORE = DJG_BIFFPARTY_NOMORE + 1;
};


instance DIA_BIFF_ICHBLEIBHIER(C_INFO)
{
	npc = djg_713_biff;
	nr = 6;
	condition = dia_biff_ichbleibhier_condition;
	information = dia_biff_ichbleibhier_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_biff_ichbleibhier_condition()
{
	if((Npc_GetBodyState(hero) != BS_INVENTORY) && (Npc_GetBodyState(hero) != BS_MOBINTERACT_INTERRUPT) && (DJG_BIFFPARTY == TRUE) && (DJG_BIFF_STAY == FALSE) && (((((Npc_GetDistToWP(self,"OW_SWAMPDRAGON_01") < 4000) && (Npc_IsDead(swampdragon) == FALSE) && (swampdragon.flags != 0)) || ((Npc_GetDistToWP(self,"LOCATION_19_03_PATH_RUIN8") < 2000) && (Npc_IsDead(rockdragon) == FALSE) && (rockdragon.flags != 0)) || ((Npc_GetDistToWP(self,"CASTLE_36") < 4000) && (Npc_IsDead(firedragon) == FALSE) && (firedragon.flags != 0)) || ((Npc_GetDistToWP(self,"OW_ICEDRAGON_01") < 4000) && (Npc_IsDead(icedragon) == FALSE) && (icedragon.flags != 0))) && (Npc_HasItems(hero,itmi_innoseye_mis) >= 1)) || (Npc_GetDistToWP(self,"OC_CENTER_GUARD_02") < 4500)))
	{
		return TRUE;
	};
};

func void dia_biff_ichbleibhier_info()
{
	AI_Output(self,other,"DIA_Biff_ICHBLEIBHIER_07_00");	//Tohle je v�n� nebezpe�n� oblast. B� dop�edu. Budu ti krejt z�da.
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
	if(Npc_GetDistToWP(self,"OW_SWAMPDRAGON_01") < 10000)
	{
		Npc_ExchangeRoutine(self,"Stay_Swamp");
	};
	if(Npc_GetDistToWP(self,"LOCATION_19_03_PATH_RUIN8") < 10000)
	{
		Npc_ExchangeRoutine(self,"Stay_Rock");
	};
	if(Npc_GetDistToWP(self,"CASTLE_36") < 10000)
	{
		Npc_ExchangeRoutine(self,"Stay_Fire");
	};
	if(Npc_GetDistToWP(self,"OW_ICEDRAGON_01") < 10000)
	{
		Npc_ExchangeRoutine(self,"Stay_Ice");
	};
	if(Npc_GetDistToWP(self,"OC_CENTER_GUARD_02") < 10000)
	{
		Npc_ExchangeRoutine(self,"Stay_AwayFromOC");
	};
	DJG_BIFF_STAY = TRUE;
	DJG_BIFF_SCGOLD = Npc_HasItems(hero,itmi_gold);
};


instance DIA_BIFF_STAY_AWAYFROMOC(C_INFO)
{
	npc = djg_713_biff;
	condition = dia_biff_stay_awayfromoc_condition;
	information = dia_biff_stay_awayfromoc_info;
	nr = 3;
	permanent = TRUE;
	description = "(Op�t vz�t Biffa s sebou.)";
};


func int dia_biff_stay_awayfromoc_condition()
{
	if(((Npc_GetDistToWP(self,"OW_PATH_298") < 500) || (Npc_GetDistToWP(self,"LOCATION_19_01") < 500)) && (DJG_BIFFPARTY == TRUE) && (DJG_BIFF_STAY == TRUE))
	{
		return TRUE;
	};
};

func void dia_biff_stay_awayfromoc_info()
{
	b_kommmit();
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Follow");
	DJG_BIFF_STAY = FALSE;
	DJG_BIFF_SCGOLD = Npc_HasItems(hero,itmi_gold);
};


instance DIA_BIFF_KOHLEWEGGEBEN(C_INFO)
{
	npc = djg_713_biff;
	condition = dia_biff_kohleweggeben_condition;
	information = dia_biff_kohleweggeben_info;
	nr = 10;
	important = TRUE;
	permanent = TRUE;
};


func int dia_biff_kohleweggeben_condition()
{
	if((DJG_BIFF_SCGOLD > Npc_HasItems(hero,itmi_gold)) && (DJG_BIFF_HALBEHALBE == TRUE) && (DJG_BIFFPARTY == TRUE) && (DJG_BIFF_STAY == FALSE))
	{
	};
};

func void dia_biff_kohleweggeben_info()
{
	AI_Output(self,other,"DIA_Biff_KOHLEWEGGEBEN_07_00");	//Nerozh�zej to v�echno najednou
	AI_Output(self,other,"DIA_Biff_KOHLEWEGGEBEN_07_01");	//Tak to bude lep��, kdy� ho d� mn�.
	AI_StopProcessInfos(self);
	DJG_BIFF_SCGOLD = Npc_HasItems(hero,itmi_gold);
};


instance DIA_BIFF_BIFFLOSWERDEN(C_INFO)
{
	npc = djg_713_biff;
	nr = 11;
	condition = dia_biff_biffloswerden_condition;
	information = dia_biff_biffloswerden_info;
	permanent = TRUE;
	description = "M�m dojem, �e tady by na�e spolupr�ce m�la skon�it.";
};


func int dia_biff_biffloswerden_condition()
{
	if(DJG_BIFFPARTY == TRUE)
	{
		return TRUE;
	};
};

func void dia_biff_biffloswerden_info()
{
	AI_Output(other,self,"DIA_Biff_BIFFLOSWERDEN_15_00");	//M�m dojem, �e tady by na�e spolupr�ce m�la skon�it.
	AI_Output(self,other,"DIA_Biff_BIFFLOSWERDEN_07_01");	//Jak je libo. Taky bych m�l za��t myslet na lep�� v�ci. Tak zat�m.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	DJG_BIFF_HALBEHALBE = FALSE;
	DJG_BIFFPARTY = FALSE;
	DJG_BIFFPARTY_NOMORE = DJG_BIFFPARTY_NOMORE + 1;
};


instance DIA_BIFF_MEHRGELD(C_INFO)
{
	npc = djg_713_biff;
	nr = 12;
	condition = dia_biff_mehrgeld_condition;
	information = dia_biff_mehrgeld_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_biff_mehrgeld_condition()
{
	if((DJG_BIFFPARTY == TRUE) && (Npc_RefuseTalk(self) == FALSE) && (DJG_BIFF_STAY == FALSE))
	{
		return TRUE;
	};
};


var int dia_biff_mehrgeld_info_onetime;

func void dia_biff_mehrgeld_info()
{
	AI_Output(self,other,"DIA_Biff_MEHRGELD_07_00");	//Za��n�m m�t dojem, �e bych z tebe mohl dostat v�c pen�z.
	if(DJG_BIFF_HALBEHALBE == TRUE)
	{
		AI_Output(self,other,"DIA_Biff_MEHRGELD_07_01");	//100 zlat�ch by to m�lo spravit.
		if(dia_biff_mehrgeld_info_onetime == FALSE)
		{
			AI_Output(self,other,"DIA_Biff_MEHRGELD_07_02");	//��dnej probl�m. Jasn�, �e jsem nezapomn�l, �e si m�me rozd�lit ko�ist.
			AI_Output(self,other,"DIA_Biff_MEHRGELD_07_03");	//Proto jsem t� taky tak �asto otravoval, abys mi dal v�c pen�z.
			dia_biff_mehrgeld_info_onetime = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Biff_MEHRGELD_07_04");	//Chci dal��ch 100 zlat�ch.
	};
	Info_ClearChoices(dia_biff_mehrgeld);
	Info_AddChoice(dia_biff_mehrgeld,"To si nem��u dovolit.",dia_biff_mehrgeld_zuteuer);
	Info_AddChoice(dia_biff_mehrgeld,"Dobr�. Za to mi je�t� stoj�.",dia_biff_mehrgeld_ok);
};

func void dia_biff_mehrgeld_ok()
{
	AI_Output(other,self,"DIA_Biff_MEHRGELD_ok_15_00");	//Dobr�. Za to mi je�t� stoj�.
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(self,other,"DIA_Biff_MEHRGELD_ok_07_01");	//D� se to tak ��ct. Tak jdeme.
		AI_StopProcessInfos(self);
		if(DJG_BIFF_HALBEHALBE == TRUE)
		{
			DJG_BIFF_SCGOLD = Npc_HasItems(hero,itmi_gold);
		};
		b_biff_setrefusetalk();
	}
	else
	{
		AI_Output(self,other,"DIA_Biff_MEHRGELD_ok_07_02");	//Ty mizernej b��dile, nem��e� ani zaplatit po��dn�ho ozbrojence.
		AI_Output(self,other,"DIA_Biff_MEHRGELD_ok_07_03");	//M�m dojem, �e si najdu jin�ho obchodn�ho partnera.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Start");
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		DJG_BIFF_HALBEHALBE = FALSE;
		DJG_BIFFPARTY = FALSE;
		DJG_BIFFPARTY_NOMORE = DJG_BIFFPARTY_NOMORE + 2;
	};
};

func void dia_biff_mehrgeld_zuteuer()
{
	AI_Output(other,self,"DIA_Biff_MEHRGELD_zuTeuer_15_00");	//To si nem��u dovolit.
	AI_Output(self,other,"DIA_Biff_MEHRGELD_zuTeuer_07_01");	//Tak to si te�ka d�l �lapej s�m.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	DJG_BIFFPARTY = FALSE;
	DJG_BIFFPARTY_NOMORE = DJG_BIFFPARTY_NOMORE + 2;
};


instance DIA_BIFF_HEILUNG(C_INFO)
{
	npc = djg_713_biff;
	nr = 4;
	condition = dia_biff_heilung_condition;
	information = dia_biff_heilung_info;
	permanent = TRUE;
	description = "Nepot�ebuje� n�jak� l��iv� lektvar?";
};


func int dia_biff_heilung_condition()
{
	if(DJG_BIFFPARTY == TRUE)
	{
		return TRUE;
	};
};

func void dia_biff_heilung_info()
{
	AI_Output(other,self,"DIA_Biff_HEILUNG_15_00");	//Nepot�ebuje� n�jak� l��iv� lektvar?
	AI_Output(self,other,"DIA_Biff_HEILUNG_07_01");	//Jasn�. To nem��e bejt na �kodu.
	Info_ClearChoices(dia_biff_heilung);
	Info_AddChoice(dia_biff_heilung,"D�m ti n�jak� pozd�ji.",dia_biff_heilung_spaeter);
	Info_AddChoice(dia_biff_heilung,"(Nejslab�� l��iv� lektvar.)",dia_biff_heilung_heiltranklow);
	Info_AddChoice(dia_biff_heilung,"(Nejlep�� l��iv� lektvar.)",dia_biff_heilung_heiltrank);
};

func void dia_biff_heilung_heiltrank()
{
	if(b_giveinvitems(other,self,itpo_health_03,1))
	{
		b_useitem(self,itpo_health_03);
	}
	else if(b_giveinvitems(other,self,itpo_health_02,1))
	{
		b_useitem(self,itpo_health_02);
	}
	else if(b_giveinvitems(other,self,itpo_health_01,1))
	{
		b_useitem(self,itpo_health_01);
	}
	else
	{
		AI_Output(self,other,"DIA_Biff_HEILUNG_heiltrank_07_00");	//H�d�m, �e si budu muset po�kat, dokud pro m� n�jak� nebude� m�t.
	};
	AI_StopProcessInfos(self);
};

func void dia_biff_heilung_heiltranklow()
{
	if(b_giveinvitems(other,self,itpo_health_01,1))
	{
		b_useitem(self,itpo_health_01);
	}
	else if(b_giveinvitems(other,self,itpo_health_02,1))
	{
		b_useitem(self,itpo_health_02);
	}
	else if(b_giveinvitems(other,self,itpo_health_03,1))
	{
		b_useitem(self,itpo_health_03);
	}
	else
	{
		AI_Output(self,other,"DIA_Biff_HEILUNG_heiltrankLow_07_00");	//Bohu�el, ��dn� zrovna nem�. Je�t� se tu pozd�ji pro n�jak� zastav�m.
	};
	AI_StopProcessInfos(self);
};

func void dia_biff_heilung_spaeter()
{
	AI_Output(other,self,"DIA_Biff_HEILUNG_spaeter_15_00");	//D�m ti n�jak� pozd�ji.
	AI_Output(self,other,"DIA_Biff_HEILUNG_spaeter_07_01");	//Ale nezapome�.
	AI_StopProcessInfos(self);
};


instance DIA_BIFF_DRACHENTOT(C_INFO)
{
	npc = djg_713_biff;
	nr = 5;
	condition = dia_biff_drachentot_condition;
	information = dia_biff_drachentot_info;
	description = "Tak, a je to. V�ichni draci jsou mrtv�.";
};


func int dia_biff_drachentot_condition()
{
	if(DJG_BIFFSURVIVEDLASTDRAGON == TRUE)
	{
		return TRUE;
	};
};

func void dia_biff_drachentot_info()
{
	AI_Output(other,self,"DIA_Biff_DRACHENTOT_15_00");	//Tak, a je to. V�ichni draci jsou mrtv�.
	AI_Output(self,other,"DIA_Biff_DRACHENTOT_07_01");	//Jo. A j� jsem po��d tady.
	AI_Output(self,other,"DIA_Biff_DRACHENTOT_07_02");	//Jse� si jistej, �e tohle byl posledn�?
	AI_Output(other,self,"DIA_Biff_DRACHENTOT_15_03");	//Mysl�m, �e jo.
	AI_Output(self,other,"DIA_Biff_DRACHENTOT_07_04");	//To je �patn�. Pr�v� jsem se rozeh��l.
	b_giveplayerxp(XP_BIFFSURVIVEDLASTDRAGON);
};


instance DIA_BIFF_KNOWWHEREENEMY(C_INFO)
{
	npc = djg_713_biff;
	nr = 2;
	condition = dia_biff_knowwhereenemy_condition;
	information = dia_biff_knowwhereenemy_info;
	permanent = TRUE;
	description = "Nem�l bys chu� na men�� v�let kolem sv�ta?";
};


func int dia_biff_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (BIFF_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_biff_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_15_00");	//Nem�l bys chu� na men�� v�let kolem sv�ta?
	AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_07_01");	//Co?
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_15_02");	//Zapome� na to. Stejn� u� m�m plnou lo�.
		AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_07_03");	//P�esta� si ze m� utahovat, chlape.
	}
	else
	{
		AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_15_04");	//Chyst�m se opustit Khorinis a vyrazit na ostrov, abych se tam poohl�dl po n�jak�ch nov�ch protivn�c�ch.
		Info_ClearChoices(dia_biff_knowwhereenemy);
		Info_AddChoice(dia_biff_knowwhereenemy,"Prost� jsem si myslel, �e bych se o tom m�l zm�nit.",dia_biff_knowwhereenemy_no);
		Info_AddChoice(dia_biff_knowwhereenemy,"Nechce� j�t taky?",dia_biff_knowwhereenemy_yes);
	};
};

func void dia_biff_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_Yes_15_00");	//Nechce� j�t taky?
	AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_Yes_07_01");	//Dal�� nep��tel� m� neberou. Chci...
	AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_Yes_15_02");	//Tam, kam jedeme, bude v�c zlata, ne� unese�.
	AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_Yes_07_03");	//Kdy� je to tak, tak to jsem pro. Kam jedeme?
	AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_Yes_15_04");	//Ale nejd��v t� mus�me dostat pry� z Hornick�ho �dol�.
	AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_Yes_07_05");	//��dn� probl�m. Dostanu se odsud. Potk�me se v pr�smyku.
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"Biff se ke mn� p�i vidin� nesm�rn�ho bohatstv� p�idal. Pokud mu poskytnu dost zlata, mohu s n�m po��tat.");
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	self.flags = NPC_FLAG_IMMORTAL;
	BIFF_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	BIFF_FOLLOWSTHROUGHPASS = LOG_RUNNING;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"RunsToPass");
	Info_ClearChoices(dia_biff_knowwhereenemy);
};

func void dia_biff_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_No_15_00");	//Prost� jsem si myslel, �e bych se o tom m�l zm�nit.
	AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_No_07_01");	//Dobr�, dobr�, tak hodn� �t�st�.
	BIFF_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_biff_knowwhereenemy);
};


instance DIA_BIFF_PASS(C_INFO)
{
	npc = djg_713_biff;
	nr = 55;
	condition = dia_biff_pass_condition;
	information = dia_biff_pass_info;
	permanent = TRUE;
	description = "Dostane� se p�es pr�smyk?";
};


func int dia_biff_pass_condition()
{
	if((Npc_GetDistToWP(self,"START") < 1000) && (BIFF_ISONBOARD == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_biff_pass_info()
{
	AI_Output(other,self,"DIA_Biff_Pass_15_00");	//Dostane� se p�es pr�smyk?
	AI_Output(self,other,"DIA_Biff_Pass_07_01");	//P�esta� �vanit. Pokra�uj. Chci u� to kone�n� m�t za sebou.
	AI_StopProcessInfos(self);
};


instance DIA_BIFF_PICKPOCKET(C_INFO)
{
	npc = djg_713_biff;
	nr = 900;
	condition = dia_biff_pickpocket_condition;
	information = dia_biff_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_biff_pickpocket_condition()
{
	return c_beklauen(92,320);
};

func void dia_biff_pickpocket_info()
{
	Info_ClearChoices(dia_biff_pickpocket);
	Info_AddChoice(dia_biff_pickpocket,DIALOG_BACK,dia_biff_pickpocket_back);
	Info_AddChoice(dia_biff_pickpocket,DIALOG_PICKPOCKET,dia_biff_pickpocket_doit);
};

func void dia_biff_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_biff_pickpocket);
};

func void dia_biff_pickpocket_back()
{
	Info_ClearChoices(dia_biff_pickpocket);
};

