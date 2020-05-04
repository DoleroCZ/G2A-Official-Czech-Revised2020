
instance DIA_SLD_820_EXIT(C_INFO)
{
	npc = sld_820_soeldner;
	nr = 999;
	condition = dia_sld_820_exit_condition;
	information = dia_sld_820_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sld_820_exit_condition()
{
	return TRUE;
};

func void dia_sld_820_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SLD_820_HALT(C_INFO)
{
	npc = sld_820_soeldner;
	nr = 1;
	condition = dia_sld_820_halt_condition;
	information = dia_sld_820_halt_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sld_820_halt_condition()
{
	if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_sld_820_halt_info()
{
	AI_Output(self,other,"DIA_Sld_820_Halt_07_00");	//Kam si myslíš, e jdeš?
	AI_Output(other,self,"DIA_Sld_820_Halt_15_01");	//Dovnitø, samozøejmì.
	AI_Output(self,other,"DIA_Sld_820_Halt_07_02");	//Onar nám neplatí za to, e sem pouštíme takové otrapy jako ty!
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Sld_820_Halt_07_03");	//Nechci tu vidìt nikoho z domobrany! - To jsou jeho vlastní slova.
	};
	AI_Output(other,self,"DIA_Sld_820_Halt_15_04");	//Chci mluvit s Leem!
	AI_Output(self,other,"DIA_Sld_820_Halt_07_05");	//Co po nìm chceš?
	Info_ClearChoices(dia_sld_820_halt);
	Info_AddChoice(dia_sld_820_halt,"Já se s ním znám u hroznì dlouho.",dia_sld_820_halt_kennelee);
	if(other.guild == GIL_NONE)
	{
		Info_AddChoice(dia_sld_820_halt,"Chci se pøidat k oldnéøùm!",dia_sld_820_halt_wannajoin);
	};
};

func void b_sld_820_leeisright()
{
	AI_Output(self,other,"B_Sld_820_LeeIsRight_07_00");	//Lee je v pravém køídle. A tì ani nenapadne zabloudit nìkam jinam!
};

func void dia_sld_820_halt_wannajoin()
{
	AI_Output(other,self,"DIA_Sld_820_Halt_WannaJoin_15_00");	//Chci se pøidat k oldnéøùm!
	AI_Output(self,other,"DIA_Sld_820_Halt_WannaJoin_07_01");	//Á, další voják, kterého mùeme obìtovat! Tak pojï dál!
	b_sld_820_leeisright();
	AI_Output(self,other,"DIA_Sld_820_Halt_WannaJoin_07_02");	//Ale hlavnì nech na pokoji Onara! Nemá rád, kdy na nìj nìkdo mluví bez vyzvání. Zvláš kdy jde o nìkoho jako ty.
	AI_StopProcessInfos(self);
};

func void dia_sld_820_halt_kennelee()
{
	AI_Output(other,self,"DIA_Sld_820_Halt_KenneLee_15_00");	//Já se s ním znám u hroznì dlouho.
	AI_Output(self,other,"DIA_Sld_820_Halt_KenneLee_07_01");	//TY e jsi Leeùv kámoš? Nevìøím ti ani slovo! Ale klidnì pojï dál - jestli se na tebe nebude pamatovat, tak to poznáš hned! (smìje se)
	b_sld_820_leeisright();
	AI_StopProcessInfos(self);
};


instance DIA_SLD_820_PERM(C_INFO)
{
	npc = sld_820_soeldner;
	nr = 1;
	condition = dia_sld_820_perm_condition;
	information = dia_sld_820_perm_info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int dia_sld_820_perm_condition()
{
	return TRUE;
};

func void dia_sld_820_perm_info()
{
	AI_Output(other,self,"DIA_Sld_820_PERM_15_00");	//Jak se vede?
	AI_Output(self,other,"DIA_Sld_820_PERM_07_01");	//Bì dál, jestli chceš, ale své vásty si nech pro sebe.
	AI_StopProcessInfos(self);
};

