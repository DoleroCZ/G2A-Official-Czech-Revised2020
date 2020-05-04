
instance DIA_DRAGOMIR_EXIT(C_INFO)
{
	npc = bau_983_dragomir;
	nr = 999;
	condition = dia_dragomir_exit_condition;
	information = dia_dragomir_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dragomir_exit_condition()
{
	return TRUE;
};

func void dia_dragomir_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DRAGOMIR_HELLO(C_INFO)
{
	npc = bau_983_dragomir;
	nr = 1;
	condition = dia_dragomir_hello_condition;
	information = dia_dragomir_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dragomir_hello_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_dragomir_hello_info()
{
	AI_Output(self,other,"DIA_Dragomir_Hello_12_00");	//Co tak daleko od domova?
	AI_Output(self,other,"DIA_Dragomir_Hello_12_01");	//Tady mus� b�t opatrn�, zvl᚝, kdy� se m��e� spolehnout jen s�m na sebe.
};


instance DIA_DRAGOMIR_OUTHERE(C_INFO)
{
	npc = bau_983_dragomir;
	nr = 2;
	condition = dia_dragomir_outhere_condition;
	information = dia_dragomir_outhere_info;
	permanent = FALSE;
	description = "Co tady d�l�?";
};


func int dia_dragomir_outhere_condition()
{
	return TRUE;
};

func void dia_dragomir_outhere_info()
{
	AI_Output(other,self,"DIA_Dragomir_OutHere_15_00");	//Co tady d�l�?
	AI_Output(self,other,"DIA_Dragomir_OutHere_12_01");	//No, hostinec je pro m� p��li� drah�, tak jsem se ut�bo�il tady.
	AI_Output(self,other,"DIA_Dragomir_OutHere_12_02");	//Vypad� to, �e d��v�j�� obyvatel� u� to tu nepot�ebuj�.
};


instance DIA_DRAGOMIR_SETTLERS(C_INFO)
{
	npc = bau_983_dragomir;
	nr = 2;
	condition = dia_dragomir_settlers_condition;
	information = dia_dragomir_settlers_info;
	permanent = FALSE;
	description = "Kdo tenhle t�bor d��v vyu��val?";
};


func int dia_dragomir_settlers_condition()
{
	if(Npc_KnowsInfo(other,dia_dragomir_outhere))
	{
		return TRUE;
	};
};

func void dia_dragomir_settlers_info()
{
	AI_Output(other,self,"DIA_Dragomir_Settlers_15_00");	//Kdo tenhle t�bor d��v vyu��val?
	AI_Output(self,other,"DIA_Dragomir_Settlers_12_01");	//Nem�m tu�en�, asi n�jac� lovci. P�edpokl�d�m, �e to tu pro n� za�alo b�t p��li� nebezpe�n�.
};


instance DIA_DRAGOMIR_DANGEROUS(C_INFO)
{
	npc = bau_983_dragomir;
	nr = 2;
	condition = dia_dragomir_dangerous_condition;
	information = dia_dragomir_dangerous_info;
	permanent = FALSE;
	description = "Nen� to tu p��li� nebezpe�n�?";
};


func int dia_dragomir_dangerous_condition()
{
	if(Npc_KnowsInfo(other,dia_dragomir_outhere))
	{
		return TRUE;
	};
};

func void dia_dragomir_dangerous_info()
{
	AI_Output(other,self,"DIA_Dragomir_Dangerous_15_00");	//Nen� to tu p��li� nebezpe�n�?
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_01");	//No, ne, kdy� se dok�e� br�nit. Moje ku�e u� mi mnohokr�t prok�zala neoceniteln� slu�by.
	AI_Output(other,self,"DIA_Dragomir_Dangerous_15_02");	//Ta ale nen� moc velk�.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_03");	//Ale sta��. Kdy� v�, jak s n� zach�zet. M�val jsem v�t��. Bohu�el jsem ji v�ak ztratil.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_04");	//Dostal jsem se do hor daleko na severu. Je tam kruh monolit� s ob�tn�m olt��em.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_05");	//Kdy� jsem tam lovil mrcho�routy, za�ali z lesa vyl�zat ti odporn� nemrtv� a napadli m�.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_06");	//Jedin�, co jsem mohl d�lat, bylo vz�t nohy na ramena.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_07");	//Jak jsem ut�kal, vyklouzla mi ta ku�e z rukou. Vsad�m se, �e se tam je�t� po��d u toho podivn�ho kamenn�ho kruhu na severu n�kde povaluje.
	Log_CreateTopic(TOPIC_DRAGOMIRSARMBRUST,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRAGOMIRSARMBRUST,LOG_RUNNING);
	b_logentry(TOPIC_DRAGOMIRSARMBRUST,"V podivn�m kamenn�m kruhu vysoko v hor�ch na severu ztratil Dragomir ku�i.");
	MIS_DRAGOMIRSARMBRUST = LOG_RUNNING;
};


instance DIA_DRAGOMIR_ARMBRUST(C_INFO)
{
	npc = bau_983_dragomir;
	nr = 2;
	condition = dia_dragomir_armbrust_condition;
	information = dia_dragomir_armbrust_info;
	permanent = FALSE;
	description = "Tady. Na�el jsem tvou ku�i.";
};


func int dia_dragomir_armbrust_condition()
{
	if((MIS_DRAGOMIRSARMBRUST == LOG_RUNNING) && Npc_HasItems(other,itrw_dragomirsarmbrust_mis))
	{
		return TRUE;
	};
};

func void dia_dragomir_armbrust_info()
{
	AI_Output(other,self,"DIA_Dragomir_Armbrust_15_00");	//Tady. Na�el jsem tvou ku�i.
	b_giveinvitems(other,self,itrw_dragomirsarmbrust_mis,1);
	AI_Output(self,other,"DIA_Dragomir_Armbrust_12_01");	//Opravdu, je to ta moje. Ne��kej, �es byl tam naho�e u kamenn�ho kruhu?!
	AI_Output(other,self,"DIA_Dragomir_Armbrust_15_02");	//To si pi�!
	AI_Output(self,other,"DIA_Dragomir_Armbrust_12_03");	//To od tebe byla p�kn� lehkov�nost. Ale jinak d�ky.
	AI_Output(self,other,"DIA_Dragomir_Armbrust_12_04");	//Samoz�ejm� ti za ni zaplat�m. Douf�m, �e tohle bude sta�it.
	CreateInvItems(self,itmi_gold,150);
	b_giveinvitems(self,other,itmi_gold,150);
	MIS_DRAGOMIRSARMBRUST = LOG_SUCCESS;
	b_giveplayerxp(XP_DRAGOMIRSARMBRUST);
};


var int dragomir_teachplayer;
const int DRAGOMIR_TEACHINGCOST = 150;

instance DIA_DRAGOMIR_LEARN(C_INFO)
{
	npc = bau_983_dragomir;
	nr = 2;
	condition = dia_dragomir_learn_condition;
	information = dia_dragomir_learn_info;
	permanent = TRUE;
	description = "M��e� m� n��emu nau�it?";
};


func int dia_dragomir_learn_condition()
{
	if(Npc_KnowsInfo(other,dia_dragomir_dangerous) && (DRAGOMIR_TEACHPLAYER == FALSE))
	{
		return TRUE;
	};
};

func void dia_dragomir_learn_info()
{
	AI_Output(other,self,"DIA_Dragomir_Learn_15_00");	//M��e� m� n��emu nau�it?
	if(other.attribute[ATR_DEXTERITY] < 30)
	{
		AI_Output(self,other,"DIA_Dragomir_Learn_12_01");	//Ne� t� budu moct za��t cokoli u�it, mus� nejprve pos�lit svoji obratnost.
	}
	else
	{
		AI_Output(self,other,"DIA_Dragomir_Learn_12_02");	//Jestli na to m�. Jak u� jsem �ekl, pr�v� se mi pon�kud nedost�v� hotovosti.
		AI_Output(other,self,"DIA_Dragomir_Learn_15_03");	//Kolik chce�?
		b_say_gold(self,other,DRAGOMIR_TEACHINGCOST);
		Info_ClearChoices(dia_dragomir_learn);
		Info_AddChoice(dia_dragomir_learn,"Mo�n� pozd�ji.",dia_dragomir_learn_later);
		if(Npc_HasItems(other,itmi_gold) >= DRAGOMIR_TEACHINGCOST)
		{
			Info_AddChoice(dia_dragomir_learn,"Tady je zlato.",dia_dragomir_learn_here);
		};
	};
};

func void dia_dragomir_learn_later()
{
	AI_Output(other,self,"DIA_Dragomir_Learn_Later_15_00");	//Mo�n� pozd�ji.
	Info_ClearChoices(dia_dragomir_learn);
};

func void dia_dragomir_learn_here()
{
	AI_Output(other,self,"DIA_Dragomir_Learn_Here_15_00");	//Tady je zlato.
	b_giveinvitems(other,self,itmi_gold,DRAGOMIR_TEACHINGCOST);
	AI_Output(self,other,"DIA_Dragomir_Learn_Here_12_01");	//V�born�, jestli se nem�l�m, m��eme hned za��t.
	DRAGOMIR_TEACHPLAYER = TRUE;
	Info_ClearChoices(dia_dragomir_learn);
};


var int dia_dragomir_teach_permanent;

instance DIA_DRAGOMIR_TEACH(C_INFO)
{
	npc = bau_983_dragomir;
	nr = 2;
	condition = dia_dragomir_teach_condition;
	information = dia_dragomir_teach_info;
	permanent = TRUE;
	description = "M��e� m� n��emu nau�it?";
};


func int dia_dragomir_teach_condition()
{
	if((DRAGOMIR_TEACHPLAYER == TRUE) && (DIA_DRAGOMIR_TEACH_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_dragomir_teach_info()
{
	AI_Output(other,self,"DIA_Dragomir_Teach_15_00");	//M��e� m� n��emu nau�it?
	Info_ClearChoices(dia_dragomir_teach);
	Info_AddChoice(dia_dragomir_teach,DIALOG_BACK,dia_dragomir_teach_back);
	Info_AddChoice(dia_dragomir_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_dragomir_teach_1h_1);
	Info_AddChoice(dia_dragomir_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1) * 5),dia_dragomir_teach_1h_5);
};

func void dia_dragomir_teach_back()
{
	if(other.hitchance[NPC_TALENT_CROSSBOW] >= 75)
	{
		AI_Output(self,other,"DIA_Dragomir_Teach_12_00");	//U� t� nem�m �emu u�it. Je na�ase, aby sis na�el n�koho zku�en�j��ho.
		DIA_DRAGOMIR_TEACH_PERMANENT = TRUE;
	};
	Info_ClearChoices(dia_dragomir_teach);
};

func void dia_dragomir_teach_1h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,1,75);
	Info_ClearChoices(dia_dragomir_teach);
	Info_AddChoice(dia_dragomir_teach,DIALOG_BACK,dia_dragomir_teach_back);
	Info_AddChoice(dia_dragomir_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_dragomir_teach_1h_1);
	Info_AddChoice(dia_dragomir_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1) * 5),dia_dragomir_teach_1h_5);
};

func void dia_dragomir_teach_1h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,5,75);
	Info_ClearChoices(dia_dragomir_teach);
	Info_AddChoice(dia_dragomir_teach,DIALOG_BACK,dia_dragomir_teach_back);
	Info_AddChoice(dia_dragomir_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_dragomir_teach_1h_1);
	Info_AddChoice(dia_dragomir_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1) * 5),dia_dragomir_teach_1h_5);
};


instance DIA_DRAGOMIR_PICKPOCKET(C_INFO)
{
	npc = bau_983_dragomir;
	nr = 900;
	condition = dia_dragomir_pickpocket_condition;
	information = dia_dragomir_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_dragomir_pickpocket_condition()
{
	return c_beklauen(47,70);
};

func void dia_dragomir_pickpocket_info()
{
	Info_ClearChoices(dia_dragomir_pickpocket);
	Info_AddChoice(dia_dragomir_pickpocket,DIALOG_BACK,dia_dragomir_pickpocket_back);
	Info_AddChoice(dia_dragomir_pickpocket,DIALOG_PICKPOCKET,dia_dragomir_pickpocket_doit);
};

func void dia_dragomir_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_dragomir_pickpocket);
};

func void dia_dragomir_pickpocket_back()
{
	Info_ClearChoices(dia_dragomir_pickpocket);
};

