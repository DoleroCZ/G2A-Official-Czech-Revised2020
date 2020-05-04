
instance DIA_LANDSTREICHER_EXIT(C_INFO)
{
	npc = bdt_1050_landstreicher;
	nr = 999;
	condition = dia_landstreicher_exit_condition;
	information = dia_landstreicher_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_landstreicher_exit_condition()
{
	return TRUE;
};

func void dia_landstreicher_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LANDSTREICHER_HALLO(C_INFO)
{
	npc = bdt_1050_landstreicher;
	nr = 5;
	condition = dia_landstreicher_hallo_condition;
	information = dia_landstreicher_hallo_info;
	important = TRUE;
};


func int dia_landstreicher_hallo_condition()
{
	return TRUE;
};

func void dia_landstreicher_hallo_info()
{
	AI_Output(self,other,"DIA_Landstreicher_HALLO_09_00");	//Co se to tady dìje?
	AI_Output(other,self,"DIA_Landstreicher_HALLO_15_01");	//Co myslíš?
	AI_Output(self,other,"DIA_Landstreicher_HALLO_09_02");	//Už jsi druhej, co tudy pádí, jako by ho pobodaly krvavý mouchy.
	Info_ClearChoices(dia_landstreicher_hallo);
	Info_AddChoice(dia_landstreicher_hallo,"Už musím jít.",dia_landstreicher_hallo_weg);
	Info_AddChoice(dia_landstreicher_hallo,"Kam šel ten druhý?",dia_landstreicher_hallo_wo);
	Info_AddChoice(dia_landstreicher_hallo,"Kdo byl ten druhej chlápek?",dia_landstreicher_hallo_wer);
};

func void dia_landstreicher_hallo_wo()
{
	AI_Output(other,self,"DIA_Landstreicher_HALLO_wo_15_00");	//Kam šel ten druhý?
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wo_09_01");	//Metelil to dál po cestì jak namydlenej blesk.
};

func void dia_landstreicher_hallo_wer()
{
	AI_Output(other,self,"DIA_Landstreicher_HALLO_wer_15_00");	//Kdo byl ten druhej chlápek?
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_09_01");	//Vypadal jako jeden z tìch chytrolínskejch novicù z kláštera.
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_09_02");	//Øíkej si, co chceš, ale nìkterý z tìch klukù to nemaj v hlavì v poøádku.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_09_03");	//Staèí se podívat na ty jejich pøiblblý hábity. Nechtìl bych, aby mì v tom nìkdo chytil v noci na ulici. (smích)
		Info_AddChoice(dia_landstreicher_hallo,"Sei vorsichtig, was du sagst.",dia_landstreicher_hallo_wer_vorsicht);
	};
};

func void dia_landstreicher_hallo_wer_vorsicht()
{
	AI_Output(other,self,"DIA_Landstreicher_HALLO_wer_vorsicht_15_00");	//Dávej si pozor na jazyk. Sám jsem taky býval novicem v tom klášteøe.
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_vorsicht_09_01");	//(smích) Ty ubohá sviòko. To vysvìtluje pár vìcí.
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_vorsicht_09_02");	//Hele klídek. Hleï si svýho. Máš svých starostí dost, tak se nenech rušit.
	Info_AddChoice(dia_landstreicher_hallo,"Nìkdo by tì mìl nauèit slušnýmu chování.",dia_landstreicher_hallo_wer_vorsicht_manieren);
};

func void dia_landstreicher_hallo_wer_vorsicht_manieren()
{
	AI_Output(other,self,"DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_15_00");	//Nìkdo by tì mìl nauèit slušnýmu chování.
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_09_01");	//No tak se netvaø tak dotèenì. Fajn, když tak toužíš po boji, máš ho mít.
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_09_02");	//Tak mi ukaž, co v tobì je, novici.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_landstreicher_hallo_weg()
{
	AI_Output(other,self,"DIA_Landstreicher_HALLO_weg_15_00");	//Už musím jít.
	AI_Output(self,other,"DIA_Landstreicher_HALLO_weg_09_01");	//Hej. Žádný problém.
	AI_StopProcessInfos(self);
};


instance DIA_LANDSTREICHER_WASMACHSTDU(C_INFO)
{
	npc = bdt_1050_landstreicher;
	nr = 6;
	condition = dia_landstreicher_wasmachstdu_condition;
	information = dia_landstreicher_wasmachstdu_info;
	permanent = TRUE;
	description = "Co tady dìláš?";
};


func int dia_landstreicher_wasmachstdu_condition()
{
	return TRUE;
};

func void dia_landstreicher_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Landstreicher_WASMACHSTDU_15_00");	//Co tady dìláš?
	if(Npc_KnowsInfo(other,dia_landstreicher_hallo))
	{
		AI_Output(self,other,"DIA_Landstreicher_WASMACHSTDU_09_01");	//Máš nìjak moc otázek na takovýho náfuku.
	};
	AI_Output(self,other,"DIA_Landstreicher_WASMACHSTDU_09_02");	//Vzpomeò si na tu skøetí jeskyni, co jsme spolu prolezli, a já ti øeknu to tajemství.
	AI_Output(self,other,"DIA_Landstreicher_WASMACHSTDU_09_03");	//Jinak se starej sám o sebe.
	AI_StopProcessInfos(self);
};

