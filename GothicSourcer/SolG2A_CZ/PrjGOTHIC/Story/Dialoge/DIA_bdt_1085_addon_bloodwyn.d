
instance DIA_ADDON_BLOODWYN_EXIT(C_INFO)
{
	npc = bdt_1085_addon_bloodwyn;
	nr = 999;
	condition = dia_addon_bloodwyn_exit_condition;
	information = dia_addon_bloodwyn_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_bloodwyn_exit_condition()
{
	return TRUE;
};

func void dia_addon_bloodwyn_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BLOODWYN_PICKPOCKET(C_INFO)
{
	npc = bdt_1085_addon_bloodwyn;
	nr = 900;
	condition = dia_addon_bloodwyn_pickpocket_condition;
	information = dia_addon_bloodwyn_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_addon_bloodwyn_pickpocket_condition()
{
	return c_beklauen(90,250);
};

func void dia_addon_bloodwyn_pickpocket_info()
{
	Info_ClearChoices(dia_addon_bloodwyn_pickpocket);
	Info_AddChoice(dia_addon_bloodwyn_pickpocket,DIALOG_BACK,dia_addon_bloodwyn_pickpocket_back);
	Info_AddChoice(dia_addon_bloodwyn_pickpocket,DIALOG_PICKPOCKET,dia_addon_bloodwyn_pickpocket_doit);
};

func void dia_addon_bloodwyn_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_bloodwyn_pickpocket);
};

func void dia_addon_bloodwyn_pickpocket_back()
{
	Info_ClearChoices(dia_addon_bloodwyn_pickpocket);
};


instance DIA_ADDON_BLOODWYN_DEAD(C_INFO)
{
	npc = bdt_1085_addon_bloodwyn;
	nr = 2;
	condition = dia_addon_bloodwyn_dead_condition;
	information = dia_addon_bloodwyn_dead_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_bloodwyn_dead_condition()
{
	if(Npc_GetDistToWP(self,"BL_RAVEN_09") <= 1000)
	{
		return TRUE;
	};
};

func void dia_addon_bloodwyn_dead_info()
{
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Dead_04_00");	//Hej, jakses sem dostal?
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Dead_15_01");	//Skrz vchod.
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Dead_04_02");	//VtÌpkujeö? Nesn·öÌm vtipy.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void bloodwyn_choices_1()
{
	Info_ClearChoices(dia_addon_bloodwyn_wait);
	Info_AddChoice(dia_addon_bloodwyn_wait,PRINT_ADDON_ENOUGHTALK,dia_addon_bloodwyn_wait_fight);
	Info_AddChoice(dia_addon_bloodwyn_wait,"A tady jsem myslel, ûe tÏ dostanu.",dia_addon_bloodwyn_wait_good1);
	Info_AddChoice(dia_addon_bloodwyn_wait,"Vöechno m· sv˘j konec.",dia_addon_bloodwyn_wait_bad1);
};

func void bloodwyn_choices_2()
{
	Info_ClearChoices(dia_addon_bloodwyn_wait);
	Info_AddChoice(dia_addon_bloodwyn_wait,PRINT_ADDON_ENOUGHTALK,dia_addon_bloodwyn_wait_fight);
	Info_AddChoice(dia_addon_bloodwyn_wait,"A kdo je podle tebe zodpovÏdn˝ za zniËenÌ bariÈry?",dia_addon_bloodwyn_wait_good2);
	Info_AddChoice(dia_addon_bloodwyn_wait,"Ty a mnoho ostatnÌch chl·pk˘ taky ...",dia_addon_bloodwyn_wait_bad2);
};

func void bloodwyn_choices_3()
{
	Info_ClearChoices(dia_addon_bloodwyn_wait);
	Info_AddChoice(dia_addon_bloodwyn_wait,PRINT_ADDON_ENOUGHTALK,dia_addon_bloodwyn_wait_fight);
	Info_AddChoice(dia_addon_bloodwyn_wait,"NemyslÌm, ûe mÏl Ëas b˝t vybÌrav˝ ...",dia_addon_bloodwyn_wait_good3);
	Info_AddChoice(dia_addon_bloodwyn_wait,"Ano, to byla jeho nÏjvÏtöÌ chyba ...",dia_addon_bloodwyn_wait_bad3);
};


instance DIA_ADDON_BLOODWYN_WAIT(C_INFO)
{
	npc = bdt_1085_addon_bloodwyn;
	nr = 2;
	condition = dia_addon_bloodwyn_wait_condition;
	information = dia_addon_bloodwyn_wait_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_bloodwyn_wait_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MINECRAWLER_KILLED >= 9))
	{
		return TRUE;
	};
};

func void dia_addon_bloodwyn_wait_info()
{
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_04_00");	//Zabils d˘lnÌ Ëervy? Dob¯e. Postar·m se o zbytek. Ztraù se.
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_15_01");	//Ne tak rychle.
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_04_02");	//Ty tu jeötÏ jsi?
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_15_03");	//Je tu nÏco, o Ëem si musÌme promluvit.
	Info_ClearChoices(dia_addon_bloodwyn_wait);
	Info_AddChoice(dia_addon_bloodwyn_wait,PRINT_ADDON_ENOUGHTALK,dia_addon_bloodwyn_wait_fight);
	Info_AddChoice(dia_addon_bloodwyn_wait,"Hled·m Ravena.",dia_addon_bloodwyn_wait_raven);
};

func void dia_addon_bloodwyn_wait_raven()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_15_00");	//Hled·m Ravena.
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_Raven_04_01");	//Ano ... a proË by se o TEBE mÏl Raven zajÌmat ... poËkej chviliËku ... TY jsi ...  to jsi TY???
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_Raven_04_02");	//äpinav˝ hajzl, kterÈho hled·me uû celu vÏËnost. Co tady dÏl·ö? MÏls b˝t uû d·vno mrtev!
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_15_03");	//To nenÌ poprvÈ, co jsem to slyöel.
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_Raven_04_04");	//Vöichni tito dob¯Ì-nanic zklamali ... ale ty p¯es mÏ neprojdeö. Tentokr·t skonËÌm tvou cestu!
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_15_05");	//Jak uû jsem ¯ekl, hled·m Ravena, ty mÏ nezajÌm·ö.
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_Raven_04_06");	//P¯iöel jsem tÏ zabÌt - p¯eûil jsem zatÌm kaûd˝ souboj!
	bloodwyn_choices_1();
};

func void dia_addon_bloodwyn_wait_fight()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_FIGHT_15_00");	//Dost ¯eËÌ, skonËeme to.
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_Raven_FIGHT_04_01");	//(triumf·lnÏ) P¯iöel jsi pozdÏ! Raven otev¯el chr·m, zatÌmco my tady spolu mluvÌme. Hahaha - zem¯i, hrdino.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void bloodwyn_lach()
{
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Lach_04_00");	//HAHAHA - stejnÏ zvÌtÏzÌm!
};

func void bloodwyn_wut()
{
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wut_04_00");	//AARGH! TY synu prasete!
	self.attribute[ATR_STRENGTH] = self.attribute[ATR_STRENGTH] - 5;
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 25;
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - 25;
};

func void bloodwyn_next_1()
{
	AI_Output(self,other,"DIA_Addon_Bloodwyn_SayChoice_2_04_00");	//A p¯eûil jsem p·d bariÈry bez sebemenöÌho ökr·bnutÌ!
};

func void bloodwyn_next_2()
{
	AI_Output(self,other,"DIA_Addon_Bloodwyn_SayChoice_3_04_00");	//Nem˘ûeö mÏ porazit! Jsem Raven˘v d˘vÏryhodn˝ spoleËnÌk! Jeho prav· ruka!
};

func void dia_addon_bloodwyn_wait_good1()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_GOOD1_15_00");	//A tady jsem tÏ dostal.
	bloodwyn_wut();
	bloodwyn_next_1();
	bloodwyn_choices_2();
};

func void dia_addon_bloodwyn_wait_bad1()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_BAD1_15_00");	//Vöe jednou skonËÌ.
	bloodwyn_lach();
	bloodwyn_next_1();
	bloodwyn_choices_2();
};

func void dia_addon_bloodwyn_wait_good2()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_GOOD2_15_00");	//A kdo je podle tebe zodpovÏdn˝ za p·d bariÈry?
	bloodwyn_wut();
	bloodwyn_next_2();
	bloodwyn_choices_3();
};

func void dia_addon_bloodwyn_wait_bad2()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_BAD2_15_00");	//Ty a mnoho ostatnÌch chl·pk˘ taky ...
	bloodwyn_lach();
	bloodwyn_next_2();
	bloodwyn_choices_3();
};

func void dia_addon_bloodwyn_wait_good3()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_GOOD3_15_00");	//NemyslÌm, ûe mÏl Ëas b˝t vybÌrav˝ ...
	bloodwyn_wut();
	Info_ClearChoices(dia_addon_bloodwyn_wait);
	Info_AddChoice(dia_addon_bloodwyn_wait,PRINT_ADDON_ENOUGHTALK,dia_addon_bloodwyn_wait_fight);
};

func void dia_addon_bloodwyn_wait_bad3()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_BAD3_15_00");	//Ano, to byla jeho nejvÏtöÌ chyba ...
	bloodwyn_wut();
	Info_ClearChoices(dia_addon_bloodwyn_wait);
	Info_AddChoice(dia_addon_bloodwyn_wait,PRINT_ADDON_ENOUGHTALK,dia_addon_bloodwyn_wait_fight);
};

