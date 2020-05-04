
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
	AI_Output(self,other,"DIA_Landstreicher_HALLO_09_00");	//Co se to tady d�je?
	AI_Output(other,self,"DIA_Landstreicher_HALLO_15_01");	//Co mysl�?
	AI_Output(self,other,"DIA_Landstreicher_HALLO_09_02");	//U� jsi druhej, co tudy p�d�, jako by ho pobodaly krvav� mouchy.
	Info_ClearChoices(dia_landstreicher_hallo);
	Info_AddChoice(dia_landstreicher_hallo,"U� mus�m j�t.",dia_landstreicher_hallo_weg);
	Info_AddChoice(dia_landstreicher_hallo,"Kam �el ten druh�?",dia_landstreicher_hallo_wo);
	Info_AddChoice(dia_landstreicher_hallo,"Kdo byl ten druhej chl�pek?",dia_landstreicher_hallo_wer);
};

func void dia_landstreicher_hallo_wo()
{
	AI_Output(other,self,"DIA_Landstreicher_HALLO_wo_15_00");	//Kam �el ten druh�?
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wo_09_01");	//Metelil to d�l po cest� jak namydlenej blesk.
};

func void dia_landstreicher_hallo_wer()
{
	AI_Output(other,self,"DIA_Landstreicher_HALLO_wer_15_00");	//Kdo byl ten druhej chl�pek?
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_09_01");	//Vypadal jako jeden z t�ch chytrol�nskejch novic� z kl�tera.
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_09_02");	//��kej si, co chce�, ale n�kter� z t�ch kluk� to nemaj v hlav� v po��dku.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_09_03");	//Sta�� se pod�vat na ty jejich p�iblbl� h�bity. Necht�l bych, aby m� v tom n�kdo chytil v noci na ulici. (sm�ch)
		Info_AddChoice(dia_landstreicher_hallo,"Sei vorsichtig, was du sagst.",dia_landstreicher_hallo_wer_vorsicht);
	};
};

func void dia_landstreicher_hallo_wer_vorsicht()
{
	AI_Output(other,self,"DIA_Landstreicher_HALLO_wer_vorsicht_15_00");	//D�vej si pozor na jazyk. S�m jsem taky b�val novicem v tom kl�te�e.
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_vorsicht_09_01");	//(sm�ch) Ty uboh� svi�ko. To vysv�tluje p�r v�c�.
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_vorsicht_09_02");	//Hele kl�dek. Hle� si sv�ho. M� sv�ch starost� dost, tak se nenech ru�it.
	Info_AddChoice(dia_landstreicher_hallo,"N�kdo by t� m�l nau�it slu�n�mu chov�n�.",dia_landstreicher_hallo_wer_vorsicht_manieren);
};

func void dia_landstreicher_hallo_wer_vorsicht_manieren()
{
	AI_Output(other,self,"DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_15_00");	//N�kdo by t� m�l nau�it slu�n�mu chov�n�.
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_09_01");	//No tak se netva� tak dot�en�. Fajn, kdy� tak tou�� po boji, m� ho m�t.
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_09_02");	//Tak mi uka�, co v tob� je, novici.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_landstreicher_hallo_weg()
{
	AI_Output(other,self,"DIA_Landstreicher_HALLO_weg_15_00");	//U� mus�m j�t.
	AI_Output(self,other,"DIA_Landstreicher_HALLO_weg_09_01");	//Hej. ��dn� probl�m.
	AI_StopProcessInfos(self);
};


instance DIA_LANDSTREICHER_WASMACHSTDU(C_INFO)
{
	npc = bdt_1050_landstreicher;
	nr = 6;
	condition = dia_landstreicher_wasmachstdu_condition;
	information = dia_landstreicher_wasmachstdu_info;
	permanent = TRUE;
	description = "Co tady d�l�?";
};


func int dia_landstreicher_wasmachstdu_condition()
{
	return TRUE;
};

func void dia_landstreicher_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Landstreicher_WASMACHSTDU_15_00");	//Co tady d�l�?
	if(Npc_KnowsInfo(other,dia_landstreicher_hallo))
	{
		AI_Output(self,other,"DIA_Landstreicher_WASMACHSTDU_09_01");	//M� n�jak moc ot�zek na takov�ho n�fuku.
	};
	AI_Output(self,other,"DIA_Landstreicher_WASMACHSTDU_09_02");	//Vzpome� si na tu sk�et� jeskyni, co jsme spolu prolezli, a j� ti �eknu to tajemstv�.
	AI_Output(self,other,"DIA_Landstreicher_WASMACHSTDU_09_03");	//Jinak se starej s�m o sebe.
	AI_StopProcessInfos(self);
};

