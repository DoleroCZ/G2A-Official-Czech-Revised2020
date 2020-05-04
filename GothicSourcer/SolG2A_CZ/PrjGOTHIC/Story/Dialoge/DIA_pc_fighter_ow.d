
instance DIA_GORNOW_EXIT(C_INFO)
{
	npc = pc_fighter_ow;
	nr = 999;
	condition = dia_gornow_exit_condition;
	information = dia_gornow_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gornow_exit_condition()
{
	return TRUE;
};

func void dia_gornow_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORNOW_HELLO(C_INFO)
{
	npc = pc_fighter_ow;
	nr = 2;
	condition = dia_gornow_hello_condition;
	information = dia_gornow_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gornow_hello_condition()
{
	return TRUE;
};

func void dia_gornow_hello_info()
{
	var C_NPC milten;
	milten = Hlp_GetNpc(pc_mage_ow);
	AI_Output(other,self,"DIA_GornOW_Hello_15_00");	//Konec s tím flákáním - jsi volný!
	AI_Output(self,other,"DIA_GornOW_Hello_12_01");	//Už bylo na èase, aby mì odsud nìkdo dostal.
	AI_Output(self,other,"DIA_GornOW_Hello_12_02");	//Rozhodnì jsem ale neèekal, že bys to byl ty. Jsem sakra rád, že tì vidím.
	AI_Output(other,self,"DIA_GornOW_Hello_15_03");	//(s úšklebkem) Garond øíká, že moc jíš a že už si nemùže dovolit tì vykrmovat.
	AI_Output(self,other,"DIA_GornOW_Hello_12_04");	//Když už o tom mluvíš, pár piv by se docela šiklo. Vypadnìme odsud, ta cela mì zaèíná nudit.
	if(other.guild == GIL_SLD)
	{
		AI_Output(self,other,"DIA_GornOW_Add_12_00");	//Poèkej, mám tady nìco, co by se ti mohlo hodit.
		AI_Output(self,other,"DIA_GornOW_Add_12_01");	//Našel jsem tady v cele tohle brnìní. Musel ho tu schovat nìjaký vìzeò.
		b_giveinvitems(self,other,itar_sld_m,1);
		AI_Output(self,other,"DIA_GornOW_Add_12_02");	//Na mì je moc malé, ale tobì by mohlo padnout.
		AI_Output(other,self,"DIA_GornOW_Add_15_03");	//Díky! Uvidíme se u Miltena.
	}
	else
	{
		AI_Output(other,self,"DIA_GornOW_Hello_15_05");	//Fajn, u Miltena.
	};
	AI_Output(self,other,"DIA_GornOW_Hello_12_06");	//Jasná vìc.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FREE");
	b_startotherroutine(milten,"GORNFREE");
	MIS_RESCUEGORN = LOG_SUCCESS;
	b_giveplayerxp(XP_RESCUEGORN);
};


instance DIA_GORNOW_METMILTEN(C_INFO)
{
	npc = pc_fighter_ow;
	nr = 2;
	condition = dia_gornow_metmilten_condition;
	information = dia_gornow_metmilten_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gornow_metmilten_condition()
{
	if((MIS_RESCUEGORN == LOG_SUCCESS) && (Npc_GetDistToWP(self,"OC_MAGE_LIBRARY_IN") <= 500) && Npc_IsInState(self,zs_talk) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_gornow_metmilten_info()
{
	AI_Output(self,other,"DIA_GornOW_MetMilten_12_00");	//Poslouchej - tady jsem se matlal už dost dlouho. Je na èase, abych vidìl také nìco jiného než jen tohle údolí.
	AI_Output(self,other,"DIA_GornOW_MetMilten_12_01");	//Jak ses dostal skrz prùsmyk?
	AI_Output(other,self,"DIA_GornOW_MetMilten_15_02");	//Skrz opuštìný dùl vede cesta.
	AI_Output(self,other,"DIA_GornOW_MetMilten_12_03");	//Dobrá. Poèkám na tu pravou chvíli a pak odsud vypadnu.
	if(other.guild != GIL_SLD)
	{
		AI_Output(other,self,"DIA_GornOW_MetMilten_15_04");	//A kam pùjdeme?
		AI_Output(self,other,"DIA_GornOW_MetMilten_12_05");	//Slyšel jsem, že Lee je ještì naživu. Chtìl bych se k nìmu znovu pøipojit.
	}
	else
	{
		AI_Output(other,self,"DIA_GornOW_MetMilten_15_06");	//V tom pøípadì bìž na Onarovu farmu. Lee a jeho chlapci jsou tam. Potøebuje dobré chlapy, jako jsi ty.
		AI_Output(self,other,"DIA_GornOW_MetMilten_12_07");	//To zní dobøe. Pùjdu se podívat, jak se jim vede.
	};
};


instance DIA_GORNOW_SEEYOU(C_INFO)
{
	npc = pc_fighter_ow;
	nr = 900;
	condition = dia_gornow_seeyou_condition;
	information = dia_gornow_seeyou_info;
	permanent = TRUE;
	description = "Ještì se uvidíme.";
};


func int dia_gornow_seeyou_condition()
{
	if(Npc_KnowsInfo(other,dia_gornow_metmilten) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_gornow_seeyou_info()
{
	AI_Output(other,self,"DIA_GornOW_SeeYou_15_00");	//Ještì se uvidíme.
	AI_Output(self,other,"DIA_GornOW_SeeYou_12_01");	//S tím poèítej.
	AI_StopProcessInfos(self);
};

