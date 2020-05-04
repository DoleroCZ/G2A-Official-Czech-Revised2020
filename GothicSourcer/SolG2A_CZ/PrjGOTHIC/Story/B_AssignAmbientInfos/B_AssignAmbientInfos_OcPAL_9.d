
instance DIA_OCPAL_9_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_ocpal_9_exit_condition;
	information = dia_ocpal_9_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ocpal_9_exit_condition()
{
	return TRUE;
};

func void dia_ocpal_9_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OCPAL_9_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_ocpal_9_people_condition;
	information = dia_ocpal_9_people_info;
	permanent = TRUE;
	description = "Kdo tomu tady velí?";
};


func int dia_ocpal_9_people_condition()
{
	return TRUE;
};

func void dia_ocpal_9_people_info()
{
	AI_Output(other,self,"DIA_OCPAL_9_PEOPLE_15_00");	//Kdo tomu tady velí?
	AI_Output(self,other,"DIA_OCPAL_9_PEOPLE_09_01");	//Velitelem hradu je Garond. Jeho práci mu vážnì není co závidìt.
};


instance DIA_OCPAL_9_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_ocpal_9_location_condition;
	information = dia_ocpal_9_location_info;
	permanent = TRUE;
	description = "Víš nìco zajímavého o tomhle údolí?";
};


func int dia_ocpal_9_location_condition()
{
	return TRUE;
};

func void dia_ocpal_9_location_info()
{
	AI_Output(other,self,"DIA_OCPAL_9_LOCATION_15_00");	//Víš nìco zajímavého o tomhle údolí?
	AI_Output(self,other,"DIA_OCPAL_9_LOCATION_09_01");	//Na východì skøeti postavili obrovskou obrannou zeï - aby mohli chránit své zásoby, pøedpokládám. Za tou zdí je i místo, kde mohou kotvit jejich lodì.
	AI_Output(self,other,"DIA_OCPAL_9_LOCATION_09_02");	//Doufám, že skøeti nedostanou své zásoby vèas. Už teï mi docela staèí, s èím máme tu èest.
};


instance DIA_OCPAL_9_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_ocpal_9_standard_condition;
	information = dia_ocpal_9_standard_info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int dia_ocpal_9_standard_condition()
{
	return TRUE;
};

func void dia_ocpal_9_standard_info()
{
	AI_Output(other,self,"DIA_OCPAL_4_STANDARD_15_00");	//Jak se vede?
	if(KAPITEL <= 3)
	{
		AI_Output(self,other,"DIA_OCPAL_4_STANDARD_09_01");	//Draci znovu zaútoèili! Ale Innos nám v bitvì poskytl svou ochranu. Ty stvùry zaplatí vysokou daò svou vlastní krví!
	};
	if(KAPITEL == 4)
	{
		if(MIS_KILLEDDRAGONS < 4)
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_09_02");	//Drakobijci! Mìli nám poslat paladiny!
		}
		else
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_09_03");	//Teï, když jsme se zbavili tìch drakù, se mùžeme koneènì vypoøádat se skøety!
		};
	};
	if(KAPITEL >= 5)
	{
		if(MIS_OCGATEOPEN == FALSE)
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_09_04");	//Potøebujeme dostat rudu na loï a odplout z pekla týhle zpropadený zemì.
		}
		else
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_09_05");	//Zrada! Ta brána nemìla být nikdy otevøena. Smrt všem zrádcùm!
		};
	};
};

func void b_assignambientinfos_ocpal_9(var C_NPC slf)
{
	dia_ocpal_9_exit.npc = Hlp_GetInstanceID(slf);
	dia_ocpal_9_people.npc = Hlp_GetInstanceID(slf);
	dia_ocpal_9_location.npc = Hlp_GetInstanceID(slf);
	dia_ocpal_9_standard.npc = Hlp_GetInstanceID(slf);
};

