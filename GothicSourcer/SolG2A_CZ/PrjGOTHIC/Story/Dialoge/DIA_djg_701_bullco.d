
instance DIA_BULLCODJG_EXIT(C_INFO)
{
	npc = djg_701_bullco;
	nr = 999;
	condition = dia_bullcodjg_exit_condition;
	information = dia_bullcodjg_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bullcodjg_exit_condition()
{
	return TRUE;
};

func void dia_bullcodjg_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BULLCODJG_HALLO(C_INFO)
{
	npc = djg_701_bullco;
	nr = 5;
	condition = dia_bullcodjg_hallo_condition;
	information = dia_bullcodjg_hallo_info;
	description = "Co se dÏje??";
};


func int dia_bullcodjg_hallo_condition()
{
	if(Npc_IsDead(djg_sylvio) == FALSE)
	{
		return TRUE;
	};
};

func void dia_bullcodjg_hallo_info()
{
	AI_Output(other,self,"DIA_BullcoDJG_HALLO_15_00");	//Co se dÏje??
	AI_Output(self,other,"DIA_BullcoDJG_HALLO_06_01");	//Je tady zatracen· zima, chlape! ProË Sylvio trval na tom, abysme öli zrovna sem?
	AI_Output(self,other,"DIA_BullcoDJG_HALLO_06_02");	//Existuje spousta jinejch mÌst, co stojej alespoÚ za nÏco!
	AI_StopProcessInfos(self);
};


instance DIA_BULLCODJG_WARTEMAL(C_INFO)
{
	npc = djg_701_bullco;
	nr = 6;
	condition = dia_bullcodjg_wartemal_condition;
	information = dia_bullcodjg_wartemal_info;
	permanent = TRUE;
	description = "A co jinak. Vöechno v po¯·dku?";
};


func int dia_bullcodjg_wartemal_condition()
{
	if(Npc_KnowsInfo(other,dia_bullcodjg_hallo) || Npc_KnowsInfo(other,dia_bullco_wasnun))
	{
		return TRUE;
	};
};

func void dia_bullcodjg_wartemal_info()
{
	AI_Output(other,self,"DIA_BullcoDJG_WARTEMAL_15_00");	//A co jinak. Vöechno v po¯·dku?
	if(Npc_KnowsInfo(other,dia_bullco_wasnun))
	{
		AI_Output(self,other,"DIA_BullcoDJG_WARTEMAL_06_01");	//ProstÏ mi p¯estaÚ lÈzt na nervy.
	}
	else
	{
		AI_Output(self,other,"DIA_BullcoDJG_WARTEMAL_06_02");	//TeÔ ne! Mrznu! Jedin˝, co chci, je odsud vypadnout, jak nejrychlejö to p˘jde.
	};
	AI_StopProcessInfos(self);
};


instance DIA_BULLCO_SYLVIODEAD(C_INFO)
{
	npc = djg_701_bullco;
	nr = 7;
	condition = dia_bullco_sylviodead_condition;
	information = dia_bullco_sylviodead_info;
	important = TRUE;
};


func int dia_bullco_sylviodead_condition()
{
	if(Npc_IsDead(djg_sylvio))
	{
		return TRUE;
	};
};

func void dia_bullco_sylviodead_info()
{
	AI_Output(self,other,"DIA_Bullco_SYLVIODEAD_06_00");	//»ert aby to spral. Sylvio je mrtvej.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_BULLCO_WASNUN(C_INFO)
{
	npc = djg_701_bullco;
	nr = 8;
	condition = dia_bullco_wasnun_condition;
	information = dia_bullco_wasnun_info;
	description = "Co chceö dÏlat?";
};


func int dia_bullco_wasnun_condition()
{
	if(Npc_KnowsInfo(other,dia_bullco_sylviodead) && Npc_IsDead(djg_sylvio))
	{
		return TRUE;
	};
};

func void dia_bullco_wasnun_info()
{
	AI_Output(other,self,"DIA_Bullco_WASNUN_15_00");	//Co teÔ, kdyû je Sylvio mrtvej?
	AI_Output(self,other,"DIA_Bullco_WASNUN_06_01");	//Nem·m tuöenÌ. H·d·m, ûe p˘jdu d·l s ostatnÌma drakobijcema. Pokud teda o mÏ jeötÏ budou st·t.
	Info_AddChoice(dia_bullco_wasnun,"MÏl bych ti utrhnout hlavu.",dia_bullco_wasnun_kopfab);
	Info_AddChoice(dia_bullco_wasnun,"VÌö, kde jsou ostatnÌ?",dia_bullco_wasnun_woandere);
};

func void dia_bullco_wasnun_woandere()
{
	AI_Output(other,self,"DIA_Bullco_WASNUN_woandere_15_00");	//VÌö, kde jsou ostatnÌ?
	AI_Output(self,other,"DIA_Bullco_WASNUN_woandere_06_01");	//MyslÌm, ûe jo. AlespoÚ jsem jednoho z nich vidÏl tam na ¯ece.
	Info_AddChoice(dia_bullco_wasnun,"Vezmi mÏ k ostatnÌm drakobijc˘m.",dia_bullco_wasnun_woandere_zuihnen);
};

func void dia_bullco_wasnun_woandere_zuihnen()
{
	AI_Output(other,self,"DIA_Bullco_WASNUN_woandere_zuihnen_15_00");	//Vezmi mÏ k ostatnÌm drakobijc˘m.
	AI_Output(self,other,"DIA_Bullco_WASNUN_woandere_zuihnen_06_01");	//Hele, j· nejsem tv˘j sluha.
	Info_ClearChoices(dia_bullco_wasnun);
	Info_AddChoice(dia_bullco_wasnun,"Jak je libo. Jsem si jistej, ûe ho najdu.",dia_bullco_wasnun_woandere_zuihnen_alleine);
	Info_AddChoice(dia_bullco_wasnun,"Povaûuj se za sluhu a j· tÏ nech·m naûivu.",dia_bullco_wasnun_woandere_zuihnen_lebenlassen);
	Info_AddChoice(dia_bullco_wasnun,"D·m ti za to 50 zlat˝ch.",dia_bullco_wasnun_woandere_zuihnen_geld);
};

func void dia_bullco_wasnun_woandere_zuihnen_lebenlassen()
{
	AI_Output(other,self,"DIA_Bullco_WASNUN_woandere_zuihnen_lebenlassen_15_00");	//Povaûuj se za sluhu a j· tÏ nech·m naûivu.
	AI_Output(self,other,"DIA_Bullco_WASNUN_woandere_zuihnen_lebenlassen_06_01");	//Nech mÏ na pokoji.
	AI_StopProcessInfos(self);
};

func void dia_bullco_wasnun_woandere_zuihnen_geld()
{
	AI_Output(other,self,"DIA_Bullco_WASNUN_woandere_zuihnen_Geld_15_00");	//D·m ti za to 50 zlat˝ch.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Bullco_WASNUN_woandere_zuihnen_Geld_06_01");	//Tak dobr·. Naval prachy.
		AI_Output(self,other,"DIA_Bullco_WASNUN_woandere_zuihnen_Geld_06_02");	//PojÔ za mnou. Vezmu tÏ na mÌsto, kde jsem naposledy spat¯il ostatnÌ drakobijce.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"DJGVorposten");
	}
	else
	{
		AI_Output(self,other,"DIA_Bullco_WASNUN_woandere_zuihnen_Geld_06_03");	//Nem·ö 50 zlat˝ch a j· se do takov˝ho pr˘seru prostÏ jen tak nepoûenu. Ztraù se.
		AI_StopProcessInfos(self);
	};
};

func void dia_bullco_wasnun_woandere_zuihnen_alleine()
{
	AI_Output(other,self,"DIA_Bullco_WASNUN_woandere_zuihnen_alleine_15_00");	//Jak je libo. Jsem si jistej, ûe ho najdu.
	AI_Output(self,other,"DIA_Bullco_WASNUN_woandere_zuihnen_alleine_06_01");	//V tom p¯ÌpadÏ û·dn˝ vytr·cenÌ.
	AI_StopProcessInfos(self);
};

func void dia_bullco_wasnun_kopfab()
{
	AI_Output(other,self,"DIA_Bullco_WASNUN_kopfab_15_00");	//MÏl bych ti utrhnout hlavu.
	AI_Output(self,other,"DIA_Bullco_WASNUN_kopfab_06_01");	//Sklapni uû tu svojÌ velkou hubu.
	Info_AddChoice(dia_bullco_wasnun,"Do zbranÏ. SkonËÌme to hned.",dia_bullco_wasnun_kopfab_angriff);
};

func void dia_bullco_wasnun_kopfab_angriff()
{
	AI_Output(other,self,"DIA_Bullco_WASNUN_kopfab_angriff_15_00");	//Do zbranÏ. SkonËÌme to hned.
	AI_Output(self,other,"DIA_Bullco_WASNUN_kopfab_angriff_06_01");	//Jak si p¯ejeö.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_BULLCO_PICKPOCKET(C_INFO)
{
	npc = djg_701_bullco;
	nr = 900;
	condition = dia_bullco_pickpocket_condition;
	information = dia_bullco_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_bullco_pickpocket_condition()
{
	return c_beklauen(34,65);
};

func void dia_bullco_pickpocket_info()
{
	Info_ClearChoices(dia_bullco_pickpocket);
	Info_AddChoice(dia_bullco_pickpocket,DIALOG_BACK,dia_bullco_pickpocket_back);
	Info_AddChoice(dia_bullco_pickpocket,DIALOG_PICKPOCKET,dia_bullco_pickpocket_doit);
};

func void dia_bullco_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_bullco_pickpocket);
};

func void dia_bullco_pickpocket_back()
{
	Info_ClearChoices(dia_bullco_pickpocket);
};

