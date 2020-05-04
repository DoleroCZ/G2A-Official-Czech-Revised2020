
instance DIA_BDT_1020_WEGELAGERER_EXIT(C_INFO)
{
	npc = bdt_1020_bandit_l;
	nr = 999;
	condition = dia_wegelagerer_exit_condition;
	information = dia_wegelagerer_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_wegelagerer_exit_condition()
{
	return TRUE;
};

func void dia_wegelagerer_exit_info()
{
	AI_StopProcessInfos(self);
};


const string BDT_1020_WEGELAGERER_CHECKPOINT = "NW_TROLLAREA_PATH_46";

instance DIA_BDT_1020_WEGELAGERER_FIRSTWARN(C_INFO)
{
	npc = bdt_1020_bandit_l;
	nr = 1;
	condition = dia_bdt_1020_wegelagerer_firstwarn_condition;
	information = dia_bdt_1020_wegelagerer_firstwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_bdt_1020_wegelagerer_firstwarn_condition()
{
	if((other.aivar[AIV_GUARDPASSAGE_STATUS] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE))
	{
		return TRUE;
	};
};

func void dia_bdt_1020_wegelagerer_firstwarn_info()
{
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_06_00");	//Hej ty, st˘j!
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_15_01");	//Co chceö?
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_06_02");	//Jestli nechceö, abych ti nÏjakou nat·hnul, mÏl bys nÏkolik mincÌ ze svojÌ kapsy p¯esunout do t˝ m˝. A pronto!
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,BDT_1020_WEGELAGERER_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
	Info_ClearChoices(dia_bdt_1020_wegelagerer_firstwarn);
	Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,"Kolik chceö?",dia_bdt_1020_wegelagerer_firstwarn_howmuch);
	Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,"To si dÏl·ö srandu?",dia_bdt_1020_wegelagerer_firstwarn_joke);
	Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,"Z cesty!",dia_bdt_1020_wegelagerer_pissoff);
	if(MIS_SCHNITZELJAGD == LOG_RUNNING)
	{
		Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,"ÿekni, nevidÏl jsi novice?",dia_bdt_1020_wegelagerer_agon);
	};
};

func void dia_bdt_1020_wegelagerer_agon()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_AGON_15_00");	//ÿekni, nevidÏl jsi novice?
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_AGON_06_01");	//(zmatenÏ) Ehm - co? Hmm... (p¯em˝ölÌ) Jo, to by mohlo b˝t.
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_AGON_06_02");	//Dej mi 20 zlat˝ch a j· ti to povÌm!
	WEGELAGERER_SURPRISE = TRUE;
	if(Npc_HasItems(other,itmi_gold) >= 20)
	{
		Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,"Dobr·, dobr·, tady jsou ty prachy.",dia_bdt_1020_wegelagerer_firstwarn_givemoney);
	};
	Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,"PromiÚ, nem·m û·dnÈ penÌze.",dia_bdt_1020_wegelagerer_firstwarn_nomoney);
	Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,"Jdi mi z cesty.",dia_bdt_1020_wegelagerer_firstwarn_never);
};

func void dia_bdt_1020_wegelagerer_firstwarn_howmuch()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_HowMuch_15_00");	//Kolik chceö?
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_HowMuch_06_01");	//(smÏje se) 20 zlat˝ch a m˘ûeme bejt k·moöi.
	Info_ClearChoices(dia_bdt_1020_wegelagerer_firstwarn);
	if(Npc_HasItems(other,itmi_gold) >= 20)
	{
		Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,"Dobr·, dobr·, tady jsou ty prachy.",dia_bdt_1020_wegelagerer_firstwarn_givemoney);
	};
	Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,"PromiÚ, nem·m û·dnÈ penÌze.",dia_bdt_1020_wegelagerer_firstwarn_nomoney);
	Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,"Jdi mi z cesty.",dia_bdt_1020_wegelagerer_firstwarn_never);
};

func void dia_bdt_1020_wegelagerer_firstwarn_joke()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_15_00");	//To si dÏl·ö srandu.
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_06_01");	//Vypad·m na to?
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_06_02");	//Pokud neuvidÌm 20 zlat˝ch, staËÌ udÏlat jedinej krok navÌc a...
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_06_03");	//V tom p¯ÌpadÏ tÏ sejmu. Tak uû ty prachy naval.
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_SECONDWARNGIVEN;
	Info_ClearChoices(dia_bdt_1020_wegelagerer_firstwarn);
	if(Npc_HasItems(other,itmi_gold) >= 20)
	{
		Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,"Dobr·, dobr·, tady jsou ty prachy.",dia_bdt_1020_wegelagerer_firstwarn_givemoney);
	};
	Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,"PromiÚ, nem·m û·dnÈ penÌze.",dia_bdt_1020_wegelagerer_firstwarn_nomoney);
	Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,"Jdi mi z cesty.",dia_bdt_1020_wegelagerer_firstwarn_never);
};

func void dia_bdt_1020_wegelagerer_pissoff()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_PissOff_15_00");	//Z cesty!
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_PissOff_06_01");	//Ty m·ö ale velkou hubu na tak vychrtl˝ho zaprcatÏl˝ho chl·pka.
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_PissOff_06_02");	//Uû je naËase, abych ti ji zav¯el.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_bdt_1020_wegelagerer_firstwarn_givemoney()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_15_00");	//Dobr·, dobr·, tady jsou ty prachy.
	if(WEGELAGERER_SURPRISE == FALSE)
	{
		AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_06_01");	//(jÌzlivÏ) ÿÌkal jsem si, ûe 20 zlat˝ch nenÌ tak velk· cena za tv˘j ûivot. M˘ûeö projÌt.
	};
	if(WEGELAGERER_SURPRISE == TRUE)
	{
		AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_06_02");	//Fajn, tak ten novic tudy proöel p¯ed necelou hodinou.
		AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_06_03");	//MÏl docela naspÏch. Celou dobu se ohlÌûel. A teÔ se zdejchni.
	};
	b_giveinvitems(other,self,itmi_gold,20);
	self.aivar[AIV_PASSGATE] = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_bdt_1020_wegelagerer_firstwarn_nomoney()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_15_00");	//PromiÚ, nem·m û·dnÈ penÌze.
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_06_01");	//Jo, jsou to teÔ zl˝ Ëasy, co.
	if(Npc_HasEquippedMeleeWeapon(other))
	{
		AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_06_02");	//Ale nÏco ti povÌm - dej mi svou zbraÚ. Pak tÏ nech·m projÌt.
		Info_ClearChoices(dia_bdt_1020_wegelagerer_firstwarn);
		Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,"ZapomeÚ na to.",dia_bdt_1020_wegelagerer_firstwarn_noweapon);
		Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,"Tady, vezmi si mou zbraÚ.",dia_bdt_1020_wegelagerer_firstwarn_giveweapon);
	}
	else
	{
		AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_06_03");	//J· ti ¯eknu co: vraù se, aû budeö mÌt nÏjak˝ penÌze. é·dn˝ prachy, û·dnej most.
		self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
		AI_StopProcessInfos(self);
	};
};

func void dia_bdt_1020_wegelagerer_firstwarn_never()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_Never_15_00");	//Jdi mi z cesty.
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_Never_06_01");	//Takûe ty na to jdeö tvrdÏ?
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_bdt_1020_wegelagerer_firstwarn_noweapon()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoWeapon_15_00");	//ZapomeÚ na to.
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoWeapon_06_01");	//Dobr·, tak teda tvrdÏ.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_bdt_1020_wegelagerer_firstwarn_giveweapon()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveWeapon_15_00");	//Tady, vezmi si mou zbraÚ.
	AI_DrawWeapon(other);
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveWeapon_06_01");	//Nech tu zbraÚ na pokoji. Jen poËkej!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_GUARDSTOPSINTRUDER,1);
};


instance DIA_BDT_1020_WEGELAGERER_SECONDWARN(C_INFO)
{
	npc = bdt_1020_bandit_l;
	nr = 2;
	condition = dia_bdt_1020_wegelagerer_secondwarn_condition;
	information = dia_bdt_1020_wegelagerer_secondwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_bdt_1020_wegelagerer_secondwarn_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_FIRSTWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,BDT_1020_WEGELAGERER_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_bdt_1020_wegelagerer_secondwarn_info()
{
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_SecondWarn_06_00");	//V·ûnÏ chceö jeötÏ dostat öanci? Je to tvoje pr·vo.
	Info_ClearChoices(dia_bdt_1020_wegelagerer_secondwarn);
	if(Npc_HasItems(other,itmi_gold) >= 20)
	{
		Info_AddChoice(dia_bdt_1020_wegelagerer_secondwarn,"Tady jsou penÌze.",dia_bdt_1020_wegelagerer_secondwarn_givemoney);
	};
	Info_AddChoice(dia_bdt_1020_wegelagerer_secondwarn,"Ned·m ti ani mÏÔ·k.",dia_bdt_1020_wegelagerer_secondwarn_nomoney);
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,BDT_1020_WEGELAGERER_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_SECONDWARNGIVEN;
};

func void dia_bdt_1020_wegelagerer_secondwarn_givemoney()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_SecondWarn_GiveMoney_15_00");	//Tady jsou penÌze.
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_SecondWarn_GiveMoney_06_01");	//¡, ono uû se s tebou d· mluvit.
	b_giveinvitems(other,self,itmi_gold,20);
	self.aivar[AIV_PASSGATE] = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_bdt_1020_wegelagerer_secondwarn_nomoney()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_SecondWarn_NoMoney_15_00");	//Ned·m ti ani mÏÔ·k.
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_SecondWarn_NoMoney_06_01");	//Tak si ho vezmu s·m.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_BDT_1020_WEGELAGERER_ATTACK(C_INFO)
{
	npc = bdt_1020_bandit_l;
	nr = 3;
	condition = dia_bdt_1020_wegelagerer_attack_condition;
	information = dia_bdt_1020_wegelagerer_attack_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_bdt_1020_wegelagerer_attack_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_SECONDWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,BDT_1020_WEGELAGERER_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_bdt_1020_wegelagerer_attack_info()
{
	other.aivar[AIV_LASTDISTTOWP] = 0;
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_NONE;
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

