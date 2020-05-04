
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
	AI_Output(other,self,"DIA_GornOW_Hello_15_00");	//Konec s t�m fl�k�n�m - jsi voln�!
	AI_Output(self,other,"DIA_GornOW_Hello_12_01");	//U� bylo na �ase, aby m� odsud n�kdo dostal.
	AI_Output(self,other,"DIA_GornOW_Hello_12_02");	//Rozhodn� jsem ale ne�ekal, �e bys to byl ty. Jsem sakra r�d, �e t� vid�m.
	AI_Output(other,self,"DIA_GornOW_Hello_15_03");	//(s ��klebkem) Garond ��k�, �e moc j� a �e u� si nem��e dovolit t� vykrmovat.
	AI_Output(self,other,"DIA_GornOW_Hello_12_04");	//Kdy� u� o tom mluv�, p�r piv by se docela �iklo. Vypadn�me odsud, ta cela m� za��n� nudit.
	if(other.guild == GIL_SLD)
	{
		AI_Output(self,other,"DIA_GornOW_Add_12_00");	//Po�kej, m�m tady n�co, co by se ti mohlo hodit.
		AI_Output(self,other,"DIA_GornOW_Add_12_01");	//Na�el jsem tady v cele tohle brn�n�. Musel ho tu schovat n�jak� v�ze�.
		b_giveinvitems(self,other,itar_sld_m,1);
		AI_Output(self,other,"DIA_GornOW_Add_12_02");	//Na m� je moc mal�, ale tob� by mohlo padnout.
		AI_Output(other,self,"DIA_GornOW_Add_15_03");	//D�ky! Uvid�me se u Miltena.
	}
	else
	{
		AI_Output(other,self,"DIA_GornOW_Hello_15_05");	//Fajn, u Miltena.
	};
	AI_Output(self,other,"DIA_GornOW_Hello_12_06");	//Jasn� v�c.
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
	AI_Output(self,other,"DIA_GornOW_MetMilten_12_00");	//Poslouchej - tady jsem se matlal u� dost dlouho. Je na �ase, abych vid�l tak� n�co jin�ho ne� jen tohle �dol�.
	AI_Output(self,other,"DIA_GornOW_MetMilten_12_01");	//Jak ses dostal skrz pr�smyk?
	AI_Output(other,self,"DIA_GornOW_MetMilten_15_02");	//Skrz opu�t�n� d�l vede cesta.
	AI_Output(self,other,"DIA_GornOW_MetMilten_12_03");	//Dobr�. Po�k�m na tu pravou chv�li a pak odsud vypadnu.
	if(other.guild != GIL_SLD)
	{
		AI_Output(other,self,"DIA_GornOW_MetMilten_15_04");	//A kam p�jdeme?
		AI_Output(self,other,"DIA_GornOW_MetMilten_12_05");	//Sly�el jsem, �e Lee je je�t� na�ivu. Cht�l bych se k n�mu znovu p�ipojit.
	}
	else
	{
		AI_Output(other,self,"DIA_GornOW_MetMilten_15_06");	//V tom p��pad� b� na Onarovu farmu. Lee a jeho chlapci jsou tam. Pot�ebuje dobr� chlapy, jako jsi ty.
		AI_Output(self,other,"DIA_GornOW_MetMilten_12_07");	//To zn� dob�e. P�jdu se pod�vat, jak se jim vede.
	};
};


instance DIA_GORNOW_SEEYOU(C_INFO)
{
	npc = pc_fighter_ow;
	nr = 900;
	condition = dia_gornow_seeyou_condition;
	information = dia_gornow_seeyou_info;
	permanent = TRUE;
	description = "Je�t� se uvid�me.";
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
	AI_Output(other,self,"DIA_GornOW_SeeYou_15_00");	//Je�t� se uvid�me.
	AI_Output(self,other,"DIA_GornOW_SeeYou_12_01");	//S t�m po��tej.
	AI_StopProcessInfos(self);
};

