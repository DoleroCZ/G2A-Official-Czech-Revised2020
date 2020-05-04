
instance DIA_1052_WEGELAGERER_EXIT(C_INFO)
{
	npc = bdt_1052_wegelagerer;
	nr = 999;
	condition = dia_1052_wegelagerer_exit_condition;
	information = dia_1052_wegelagerer_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_1052_wegelagerer_exit_condition()
{
	return TRUE;
};

func void dia_1052_wegelagerer_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_1052_WEGELAGERER_HELLO(C_INFO)
{
	npc = bdt_1052_wegelagerer;
	nr = 1;
	condition = dia_1052_wegelagerer_hello_condition;
	information = dia_1052_wegelagerer_hello_info;
	permanent = FALSE;
	description = "Kdo jsi?";
};


func int dia_1052_wegelagerer_hello_condition()
{
	var C_NPC pal;
	pal = Hlp_GetNpc(bdt_1051_wegelagerer);
	if(c_npcisdown(pal) == FALSE)
	{
		return TRUE;
	};
};

func void dia_1052_wegelagerer_hello_info()
{
	AI_Output(other,self,"DIA_1052_Wegelagerer_Hello_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_1052_Wegelagerer_Hello_06_01");	//Co to je? Nìjaký výslech?
	AI_Output(self,other,"DIA_1052_Wegelagerer_Hello_06_02");	//Nemám, co bych ti øekl, ale možná by sis chtìl promluvit tady s mým kámošem.
	AI_Output(self,other,"DIA_1052_Wegelagerer_Hello_06_03");	//Ale bacha, cizince nemá zrovna v lásce.
};


instance DIA_WEGELAGERER_ANGRIFF2(C_INFO)
{
	npc = bdt_1052_wegelagerer;
	nr = 2;
	condition = dia_wegelagerer_angriff2_condition;
	information = dia_wegelagerer_angriff2_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_wegelagerer_angriff2_condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && c_npcisdown(bdt_1051_wegelagerer))
	{
		return TRUE;
	};
};

func void dia_wegelagerer_angriff2_info()
{
	AI_Output(self,other,"DIA_Wegelagerer_ANGRIFF2_06_00");	//Jak chceš, kámo. Tohle si vypiješ.
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,40);
	self.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	bdt_1051_wegelagerer.aivar[AIV_ENEMYOVERRIDE] = FALSE;
};

