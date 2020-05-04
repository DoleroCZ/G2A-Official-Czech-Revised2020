
instance DIA_MIL_6_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_mil_6_exit_condition;
	information = dia_mil_6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_mil_6_exit_condition()
{
	return TRUE;
};

func void dia_mil_6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIL_6_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_mil_6_join_condition;
	information = dia_mil_6_join_info;
	permanent = TRUE;
	description = "Co musím udìlat, aby mì vzali do domobrany?";
};


func int dia_mil_6_join_condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_mil_6_join_info()
{
	AI_Output(other,self,"DIA_MIL_6_JOIN_15_00");	//Co musím udìlat, aby mì vzali do domobrany?
	AI_Output(self,other,"DIA_MIL_6_JOIN_06_01");	//Zajdi za lordem Andrem a promluv si s ním. Od chvíle, kdy do mìsta dorazili paladinové, velí celé domobranì on.
	if(c_npcisinquarter(self) != Q_KASERNE)
	{
		AI_Output(self,other,"DIA_MIL_6_JOIN_06_02");	//Najdeš ho v kasárnách. Je tam vlastnì poøád.
	};
};


instance DIA_ADDON_MIL_6_MISSINGPEOPLE(C_INFO)
{
	nr = 2;
	condition = dia_addon_mil_6_missingpeople_condition;
	information = dia_addon_mil_6_missingpeople_info;
	permanent = TRUE;
	description = "Slyšel jsem, že nìkteøí obyvatelé zmizeli.";
};


func int dia_addon_mil_6_missingpeople_condition()
{
	if((KAPITEL == 1) && (SC_HEAREDABOUTMISSINGPEOPLE == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_mil_6_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_MIL_6_MissingPeople_15_00");	//Slyšel jsem, že nìkteøí obyvatelé zmizeli.
	AI_Output(self,other,"DIA_Addon_MIL_6_MissingPeople_06_01");	//Vskutku - v posledních dnech jsme zaznamenali mizení lidí celkem èasto.
	AI_Output(self,other,"DIA_Addon_MIL_6_MissingPeople_06_02");	//Nemùžu ti to vysvìtlit tak, jak bych chtìl.
	AI_Output(self,other,"DIA_Addon_MIL_6_MissingPeople_06_03");	//Nicménì nemùžeme udìlat víc než mít oèi otevøené a stát na stráži.
};


instance DIA_MIL_6_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_mil_6_people_condition;
	information = dia_mil_6_people_info;
	permanent = TRUE;
	description = "Øekni mi nìco o tìch paladinech.";
};


func int dia_mil_6_people_condition()
{
	if(hero.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void dia_mil_6_people_info()
{
	AI_Output(other,self,"DIA_MIL_6_PEOPLE_15_00");	//Øekni mi nìco o tìch paladinech.
	AI_Output(self,other,"DIA_MIL_6_PEOPLE_06_01");	//Jakmile pøijeli do Khorinisu, obsadili horní èást mìsta.
	AI_Output(self,other,"DIA_MIL_6_PEOPLE_06_02");	//Nikoho dalšího už tam nechtìjí pouštìt. Samozøejmì kromì obèanù mìsta a domobrany.
	AI_Output(self,other,"DIA_MIL_6_PEOPLE_06_03");	//Také tu je nìkolik paladinù, kteøí hlídají jejich loï dole v pøístavu. Ale ti mají do ukecanosti hodnì daleko.
};


instance DIA_MIL_6_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_mil_6_location_condition;
	information = dia_mil_6_location_info;
	permanent = TRUE;
	description = "Co bych mìl vìdìt o tomhle mìstì?";
};


func int dia_mil_6_location_condition()
{
	return TRUE;
};

func void dia_mil_6_location_info()
{
	AI_Output(other,self,"DIA_MIL_6_LOCATION_15_00");	//Co bych mìl vìdìt o tomhle mìstì?
	AI_Output(self,other,"DIA_MIL_6_LOCATION_06_01");	//Paladinové pøevzali kontrolu nad celým mìstem. Zodpovídají se jim i všichni èlenové domobrany.
	AI_Output(self,other,"DIA_MIL_6_LOCATION_06_02");	//Lord Andre je velitel domobrany - a zároveò zastává i funkci soudce.
	AI_Output(self,other,"DIA_MIL_6_LOCATION_06_03");	//Pokud by ses snad nìkdy dostal do konfliktu se zákonem, budeš se muset ospravedlnit pøímo pøed ním.
	AI_Output(self,other,"DIA_MIL_6_LOCATION_06_04");	//Ale ke èlenùm vojska je docela shovívavý. Obvykle to vyøeší nìjaká pokuta.
};


instance DIA_MIL_6_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_mil_6_standard_condition;
	information = dia_mil_6_standard_info;
	permanent = TRUE;
	description = "Co je nového?";
};


func int dia_mil_6_standard_condition()
{
	return TRUE;
};

func void dia_mil_6_standard_info()
{
	AI_Output(other,self,"DIA_MIL_6_STANDARD_15_00");	//Co je nového?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_01");	//Do mìsta se poslední dobou stahuje víc a víc lùzy.
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_02");	//Loupeže se pomalu stávají bìžnou záležitostí a lord Andre to pøièítá na vrub nìjaké vìtší skupiny.
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_03");	//Není to tak dlouho, co jsme vyèistili celou pøístavní ètvr, ale nenašli jsme ani jedinou ukradenou vìc.
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_04");	//Vypadá to, že teï máme problém s lupièi více ménì pod kontrolou. Pøepady se dotýkaly úplnì všech, ale nedávno to ustalo.
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_05");	//Od té doby, co se lùza stahuje do mìsta, to jde od desíti k pìti. Minulou noc jsem v horní èásti mìsta sledoval muže v èerné róbì.
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_06");	//Jsem si jist, že nemìl za lubem nic dobrého. Ale když jsem za ním šel kolem domu místodržícího, prostì zmizel. Pochybná existence, která...
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_07");	//Øíká se, že lord Hagen najal žoldnéøe na boj proti drakùm. Mnì to docela vyhovuje, nechtìl bych s tìma potvorama bojovat sám osobnì.
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_08");	//Povídá se, že se ty draky podaøilo porazit! Lord Hagen shromažïuje svoje muže, aby Hornické údolí zbavili i všech ostatních nestvùr.
	};
};

func void b_assignambientinfos_mil_6(var C_NPC slf)
{
	dia_mil_6_exit.npc = Hlp_GetInstanceID(slf);
	dia_mil_6_join.npc = Hlp_GetInstanceID(slf);
	dia_mil_6_people.npc = Hlp_GetInstanceID(slf);
	dia_mil_6_location.npc = Hlp_GetInstanceID(slf);
	dia_mil_6_standard.npc = Hlp_GetInstanceID(slf);
};

