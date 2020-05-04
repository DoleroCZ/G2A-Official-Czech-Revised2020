
instance DIA_RUKHAR_EXIT(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 999;
	condition = dia_rukhar_exit_condition;
	information = dia_rukhar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rukhar_exit_condition()
{
	return TRUE;
};

func void dia_rukhar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RUKHAR_HALLO(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 4;
	condition = dia_rukhar_hallo_condition;
	information = dia_rukhar_hallo_info;
	description = "Je tady dobrÈ pivo?";
};


func int dia_rukhar_hallo_condition()
{
	return TRUE;
};

func void dia_rukhar_hallo_info()
{
	AI_Output(other,self,"DIA_Rukhar_HALLO_15_00");	//Je tady dobrÈ pivo?
	AI_Output(self,other,"DIA_Rukhar_HALLO_12_01");	//NenÌ to zrovna excelentnÌ, ale v tÏchhle temnejch Ëasech si nem˘ûeö moc vybÌrat.
};


instance DIA_RUKHAR_WASMACHSTDU(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 5;
	condition = dia_rukhar_wasmachstdu_condition;
	information = dia_rukhar_wasmachstdu_info;
	description = "Co tady dÏl·ö?";
};


func int dia_rukhar_wasmachstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_rukhar_hallo))
	{
		return TRUE;
	};
};

func void dia_rukhar_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Rukhar_WASMACHSTDU_15_00");	//Co tady dÏl·ö?
	AI_Output(self,other,"DIA_Rukhar_WASMACHSTDU_12_01");	//Aû do minulÈho t˝dne jsem d¯el jak mezek na polÌch velkostatk·¯e.
	AI_Output(self,other,"DIA_Rukhar_WASMACHSTDU_12_02");	//Jednoho dne uû jsem toho prostÏ mÏl dost, a tak jsem odtamtud vypadnul.
	AI_Output(self,other,"DIA_Rukhar_WASMACHSTDU_12_03");	//TeÔ jsem sv˝m vlastnÌm p·nem. Vöechno, co vlastnÌm, je tady v tÈ truhle. A to je taky vöe, co pot¯ebuju.
	AI_Output(self,other,"DIA_Rukhar_WASMACHSTDU_12_04");	//MÏl bys z·jem o menöÌ soutÏû?
	Log_CreateTopic(TOPIC_WETTSAUFEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WETTSAUFEN,LOG_RUNNING);
	b_logentry(TOPIC_WETTSAUFEN,"V tÈ hospodÏ se uzavÌrajÌ s·zky.");
};


instance DIA_RUKHAR_WETTKAMPF(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 3;
	condition = dia_rukhar_wettkampf_condition;
	information = dia_rukhar_wettkampf_info;
	description = "A jak· soutÏû by to mÏla b˝t?";
};


func int dia_rukhar_wettkampf_condition()
{
	if(Npc_KnowsInfo(other,dia_rukhar_wasmachstdu))
	{
		return TRUE;
	};
};

func void dia_rukhar_wettkampf_info()
{
	AI_Output(other,self,"DIA_Rukhar_WETTKAMPF_15_00");	//A jak· soutÏû by to mÏla b˝t?
	AI_Output(self,other,"DIA_Rukhar_WETTKAMPF_12_01");	//ÿÌk·m tomu DO DNA.
	AI_Output(self,other,"DIA_Rukhar_WETTKAMPF_12_02");	//Pravidla jsou docela jednoduch·.
	AI_Output(self,other,"DIA_Rukhar_WETTKAMPF_12_03");	//Budeme se st¯Ìdat v objedn·v·nÌ korbel˘ toho nejlepöÌho piva, co m˘ûe ten chlap nabÌdnout.
	AI_Output(self,other,"DIA_Rukhar_WETTKAMPF_12_04");	//Kaûd˝ korbel musÌö do sebe hodit na ex. NesmÌ po nÏm zbejt na stole ani mokrej krouûek.
	AI_Output(self,other,"DIA_Rukhar_WETTKAMPF_12_05");	//Kdo vydrûÌ nejd˝l, vyhr·v·. Poraûen˝ platÌ ˙tratu a s·zku. Tak co, jdeö do toho?
	AI_Output(other,self,"DIA_Rukhar_WETTKAMPF_15_06");	//Moûn· jindy, aû nebudu mÌt tak naspÏch.
};


instance DIA_RUKHAR_HOLERANDOLPH(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 3;
	condition = dia_rukhar_holerandolph_condition;
	information = dia_rukhar_holerandolph_info;
	description = "A m˘ûu si tedy vsadit na nÏkoho jinÈho?";
};


func int dia_rukhar_holerandolph_condition()
{
	if(Npc_KnowsInfo(other,dia_rukhar_wettkampf))
	{
		return TRUE;
	};
};

func void dia_rukhar_holerandolph_info()
{
	AI_Output(other,self,"DIA_Rukhar_HOLERANDOLPH_15_00");	//M˘ûu si taky vsadit na nÏkoho jinÈho?
	AI_Output(self,other,"DIA_Rukhar_HOLERANDOLPH_12_01");	//Samoz¯ejmÏ. Kdyû dok·ûeö sehnat nÏkoho, kdo bude mÌt odvahu se mi postavit, pak se se mnou m˘ûeö vsadit.
	AI_Output(self,other,"DIA_Rukhar_HOLERANDOLPH_12_02");	//Vöichni d·vajÌ stejn˝ vklad. VÌtÏz bere vöechno. V˝öka s·zky z·leûÌ jen na tvÈ penÏûence.
	AI_Output(self,other,"DIA_Rukhar_HOLERANDOLPH_12_03");	//DohoÔ mi nÏkoho, kdo bude mÌt dost odvahy si to se mnou rozdat, a m˘ûeö se vsadit.
	b_logentry(TOPIC_WETTSAUFEN,"Rukhar tÈ svÈ h¯e ¯Ìk· NA EX! Ne, dÌky, ale to mÏ nezajÌm·. Radöi najdu nÏkoho jinÈho, z koho m˘ûe dÏlat kaöpara.");
};


instance DIA_RUKHAR_RANDOLPHWILL(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 3;
	condition = dia_rukhar_randolphwill_condition;
	information = dia_rukhar_randolphwill_info;
	permanent = TRUE;
	description = "M·m nÏkoho, kdo by chtÏl s tebou soupe¯it.";
};


var int dia_rukhar_randolphwill_noperm;

func int dia_rukhar_randolphwill_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_gegenwen) && Npc_KnowsInfo(other,dia_rukhar_holerandolph) && (DIA_RUKHAR_RANDOLPHWILL_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_rukhar_randolphwill_info()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_15_00");	//M·m nÏkoho, kdo by chtÏl s tebou soupe¯it.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_12_01");	//Kdo by to mohl b˝t?
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_15_02");	//Randolph.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_12_03");	//Ho ho. Chvastoun Randolph? Dobr·. ProË ne.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_12_04");	//Poöli mi sem toho straöpytla a j· za¯ÌdÌm zbytek.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_12_05");	//Sebere se aû tak za dva dny. Kdo vÌ? T¯eba budeö mÌt ötÏstÌ a on se pak jeötÏ nÏkdy postavÌ.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_12_06");	//Jak· je tvoje s·zka?
	Info_ClearChoices(dia_rukhar_randolphwill);
	Info_AddChoice(dia_rukhar_randolphwill,"Nic takovÈho.",dia_rukhar_randolphwill_nix);
	Info_AddChoice(dia_rukhar_randolphwill,"100 zlat˝ch",dia_rukhar_randolphwill_100);
	Info_AddChoice(dia_rukhar_randolphwill,"50 zlat˝ch",dia_rukhar_randolphwill_50);
	Info_AddChoice(dia_rukhar_randolphwill,"20 zlat˝ch",dia_rukhar_randolphwill_20);
	Info_AddChoice(dia_rukhar_randolphwill,"10 zlat˝ch",dia_rukhar_randolphwill_10);
};

func void dia_rukhar_randolphwill_annehmen()
{
	Info_ClearChoices(dia_rukhar_randolphwill);
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_annehmen_12_00");	//Vezmu si tvou s·zku a bude u mÏ aû do konce soutÏûe, dobr·?
	DIA_RUKHAR_RANDOLPHWILL_NOPERM = TRUE;
};

func void dia_rukhar_randolphwill_mehr()
{
	Info_ClearChoices(dia_rukhar_randolphwill);
	Info_AddChoice(dia_rukhar_randolphwill,"Nic takovÈho.",dia_rukhar_randolphwill_nix);
	Info_AddChoice(dia_rukhar_randolphwill,"100 zlat˝ch",dia_rukhar_randolphwill_100);
	Info_AddChoice(dia_rukhar_randolphwill,"50 zlat˝ch",dia_rukhar_randolphwill_50);
	Info_AddChoice(dia_rukhar_randolphwill,"20 zlat˝ch",dia_rukhar_randolphwill_20);
	Info_AddChoice(dia_rukhar_randolphwill,"10 zlat˝ch",dia_rukhar_randolphwill_10);
};

func void dia_rukhar_randolphwill_nix()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_nix_15_00");	//Nic takovÈho.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_nix_12_01");	//Tak to m˘ûem na celou vÏc zapomenout.
	AI_StopProcessInfos(self);
};

func void dia_rukhar_randolphwill_10()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_10_15_00");	//10 zlat˝ch
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_10_12_01");	//Hele, tohle nem˘ûeö myslet v·ûnÏ. O nÏco vÌc zlata tÏ snad nezabije.
	RUKHAR_EINSATZ = 10;
	RUKHAR_GEWINN = 20;
	Info_ClearChoices(dia_rukhar_randolphwill);
	Info_AddChoice(dia_rukhar_randolphwill,"(Zvolit jinou s·zku.)",dia_rukhar_randolphwill_mehr);
	Info_AddChoice(dia_rukhar_randolphwill,"(P¯ijmout s·zku.)",dia_rukhar_randolphwill_annehmen);
};

func void dia_rukhar_randolphwill_20()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_20_15_00");	//20
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_20_12_01");	//Kdyû uû se chceö vs·zet, tak to laskavÏ dÏlej po¯·dnÏ.
	RUKHAR_EINSATZ = 20;
	RUKHAR_GEWINN = 40;
	Info_ClearChoices(dia_rukhar_randolphwill);
	Info_AddChoice(dia_rukhar_randolphwill,"(Zvolit jinou s·zku.)",dia_rukhar_randolphwill_mehr);
	Info_AddChoice(dia_rukhar_randolphwill,"(P¯ijmout s·zku.)",dia_rukhar_randolphwill_annehmen);
};

func void dia_rukhar_randolphwill_50()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_50_15_00");	//50
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_50_12_01");	//Nedrû se tak p¯i zdi. Trochu odvahy.
	RUKHAR_EINSATZ = 50;
	RUKHAR_GEWINN = 100;
	Info_ClearChoices(dia_rukhar_randolphwill);
	Info_AddChoice(dia_rukhar_randolphwill,"(Zvolit jinou s·zku.)",dia_rukhar_randolphwill_mehr);
	Info_AddChoice(dia_rukhar_randolphwill,"(P¯ijmout s·zku.)",dia_rukhar_randolphwill_annehmen);
};

func void dia_rukhar_randolphwill_100()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_100_15_00");	//100
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_100_12_01");	//To jsem chtÏl slyöet.
	RUKHAR_EINSATZ = 100;
	RUKHAR_GEWINN = 200;
	Info_ClearChoices(dia_rukhar_randolphwill);
	Info_AddChoice(dia_rukhar_randolphwill,"(Zvolit jinou s·zku.)",dia_rukhar_randolphwill_mehr);
	Info_AddChoice(dia_rukhar_randolphwill,"(P¯ijmout s·zku.)",dia_rukhar_randolphwill_annehmen);
};


instance DIA_RUKHAR_ICHSEHEDICH(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 3;
	condition = dia_rukhar_ichsehedich_condition;
	information = dia_rukhar_ichsehedich_info;
	permanent = TRUE;
	description = "Tady je m˘j vklad.";
};


var int dia_rukhar_ichsehedich_noperm;

func int dia_rukhar_ichsehedich_condition()
{
	if((DIA_RUKHAR_ICHSEHEDICH_NOPERM == FALSE) && (DIA_RUKHAR_RANDOLPHWILL_NOPERM == TRUE) && (RUKHAR_EINSATZ != 0))
	{
		return TRUE;
	};
};

func void dia_rukhar_ichsehedich_info()
{
	AI_Output(other,self,"DIA_Rukhar_ICHSEHEDICH_15_00");	//Tady je m˘j vklad.
	if(b_giveinvitems(other,self,itmi_gold,RUKHAR_EINSATZ))
	{
		AI_Output(self,other,"DIA_Rukhar_ICHSEHEDICH_12_01");	//Dobr·. Moc tady Randolpha nezdrûuj, slyöÌö?
		DIA_RUKHAR_ICHSEHEDICH_NOPERM = TRUE;
		MIS_RUKHAR_WETTKAMPF = LOG_RUNNING;
		b_giveplayerxp(XP_AMBIENT);
	}
	else
	{
		AI_Output(self,other,"DIA_Rukhar_ICHSEHEDICH_12_02");	//To je sranda. Vraù se, aû budeö mÌt dost penÏz.
	};
	AI_StopProcessInfos(self);
};


instance DIA_RUKHAR_GELDZURUECK(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 3;
	condition = dia_rukhar_geldzurueck_condition;
	information = dia_rukhar_geldzurueck_info;
	permanent = TRUE;
	description = "Chci zp·tky svoje penÌze.";
};


func int dia_rukhar_geldzurueck_condition()
{
	if((MIS_RUKHAR_WETTKAMPF == LOG_SUCCESS) && (RUKHAR_WON_WETTKAMPF == TRUE))
	{
		return TRUE;
	};
};

func void dia_rukhar_geldzurueck_info()
{
	AI_Output(other,self,"DIA_Rukhar_GELDZURUECK_15_00");	//Chci zp·tky svoje penÌze.
	AI_Output(self,other,"DIA_Rukhar_GELDZURUECK_12_01");	//HernÌ s·zky jsou s·zkami cti, k·mo. MÏl sis to rozmyslet d¯Ìv.
	AI_StopProcessInfos(self);
};


instance DIA_RUKHAR_HAENSELN(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 3;
	condition = dia_rukhar_haenseln_condition;
	information = dia_rukhar_haenseln_info;
	permanent = TRUE;
	description = "Vypad·ö, ûe sis vzal vÏtöÌ sousto, neû dok·ûeö spolknout.";
};


func int dia_rukhar_haenseln_condition()
{
	if((MIS_RUKHAR_WETTKAMPF == LOG_SUCCESS) && (RUKHAR_WON_WETTKAMPF == FALSE))
	{
		return TRUE;
	};
};


var int dia_rukhar_haenseln_nureimalgeld;

func void dia_rukhar_haenseln_info()
{
	AI_Output(other,self,"DIA_Rukhar_HAENSELN_15_00");	//Vypad·ö, ûe sis vzal vÏtöÌ sousto, neû dok·ûeö spolknout.
	if(DIA_RUKHAR_HAENSELN_NUREIMALGELD == FALSE)
	{
		AI_Output(self,other,"DIA_Rukhar_HAENSELN_12_01");	//Tady jsou tvÈ penÌze a uû ani slovo.
		b_giveplayerxp(XP_RUKHAR_LOST);
		IntToFloat(RUKHAR_GEWINN);
		CreateInvItems(self,itmi_gold,RUKHAR_GEWINN);
		b_giveinvitems(self,other,itmi_gold,RUKHAR_GEWINN);
		DIA_RUKHAR_HAENSELN_NUREIMALGELD = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Rukhar_HAENSELN_12_02");	//JeötÏ si to s tebou vy¯ÌdÌm, na to se m˘ûeö spolehnout.
	};
	AI_StopProcessInfos(self);
};


instance DIA_RUKHAR_PERM(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 7;
	condition = dia_rukhar_perm_condition;
	information = dia_rukhar_perm_info;
	permanent = TRUE;
	description = "Stalo se jeötÏ nÏco, co by st·lo za ¯eË?";
};


func int dia_rukhar_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_rukhar_wasmachstdu))
	{
		return TRUE;
	};
};

func void dia_rukhar_perm_info()
{
	AI_Output(other,self,"DIA_Rukhar_Perm_15_00");	//Stalo se jeötÏ nÏco, co by st·lo za ¯eË?
	AI_Output(self,other,"DIA_Rukhar_Perm_12_01");	//Nic, o Ëem bych vÏdÏl. Nikdo mi nic ne¯ekl.
};


instance DIA_RUKHAR_PICKPOCKET(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 900;
	condition = dia_rukhar_pickpocket_condition;
	information = dia_rukhar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_rukhar_pickpocket_condition()
{
	return c_beklauen(26,30);
};

func void dia_rukhar_pickpocket_info()
{
	Info_ClearChoices(dia_rukhar_pickpocket);
	Info_AddChoice(dia_rukhar_pickpocket,DIALOG_BACK,dia_rukhar_pickpocket_back);
	Info_AddChoice(dia_rukhar_pickpocket,DIALOG_PICKPOCKET,dia_rukhar_pickpocket_doit);
};

func void dia_rukhar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_rukhar_pickpocket);
};

func void dia_rukhar_pickpocket_back()
{
	Info_ClearChoices(dia_rukhar_pickpocket);
};

