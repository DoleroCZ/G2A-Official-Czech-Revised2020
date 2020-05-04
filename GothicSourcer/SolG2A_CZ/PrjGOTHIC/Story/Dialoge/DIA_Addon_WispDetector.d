
func void b_followme_wisp()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_FollowMe_Wisp_15_00");	//Pojï za mnou.
};


instance DIA_ADDON_WISPDETECTOR_EXIT(C_INFO)
{
	npc = wisp_detector;
	nr = 999;
	condition = dia_addon_wispdetector_exit_condition;
	information = dia_addon_wispdetector_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_wispdetector_exit_condition()
{
	return TRUE;
};

func void dia_addon_wispdetector_exit_info()
{
	b_irrlichtbeep();
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_WISPDETECTOR_DETECTITEMS(C_INFO)
{
	npc = wisp_detector;
	nr = 5;
	condition = dia_addon_wispdetector_detectitems_condition;
	information = dia_addon_wispdetector_detectitems_info;
	permanent = TRUE;
	description = "Potøebuji...";
};


func int dia_addon_wispdetector_detectitems_condition()
{
	return TRUE;
};

func void dia_addon_wispdetector_detectitems_info()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_15_00");	//Potøebuji...
	Info_ClearChoices(dia_addon_wispdetector_detectitems);
	Info_AddChoice(dia_addon_wispdetector_detectitems,"Pojï za mnou.",dia_addon_wispdetector_detectitems_follow);
	if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == TRUE)
	{
		Info_AddChoice(dia_addon_wispdetector_detectitems,"... runy a svitky.",dia_addon_wispdetector_detectitems_rune);
	};
	if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == TRUE)
	{
		Info_AddChoice(dia_addon_wispdetector_detectitems,"... zlato, klíèe a hlavní zboží.",dia_addon_wispdetector_detectitems_none);
	};
	if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == TRUE)
	{
		Info_AddChoice(dia_addon_wispdetector_detectitems,"... støelné zbranì a munici.",dia_addon_wispdetector_detectitems_ff);
	};
	if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NF] == TRUE)
	{
		Info_AddChoice(dia_addon_wispdetector_detectitems,"... zbranì pro boj na blízko.",dia_addon_wispdetector_detectitems_nf);
	};
	if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == TRUE)
	{
		Info_AddChoice(dia_addon_wispdetector_detectitems,"... jídlo a byliny.",dia_addon_wispdetector_detectitems_food);
	};
	if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == TRUE)
	{
		Info_AddChoice(dia_addon_wispdetector_detectitems,"... prsteny a amulety.",dia_addon_wispdetector_detectitems_magic);
	};
	if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == TRUE)
	{
		Info_AddChoice(dia_addon_wispdetector_detectitems,"... jakékoliv lektvary.",dia_addon_wispdetector_detectitems_potions);
	};
	Info_AddChoice(dia_addon_wispdetector_detectitems,"... aby si mi ukázal vše, co najdeš.",dia_addon_wispdetector_detectitems_all);
};

func void dia_addon_wispdetector_detectitems_follow()
{
	b_followme_wisp();
	b_irrlichtbeep();
	AI_StopProcessInfos(self);
	WISPSEARCHING = WISPSEARCH_FOLLOW;
};

func void dia_addon_wispdetector_detectitems_all()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_ALL_15_00");	//aby si mi ukázal vše, co najdeš.
	WISPSEARCHING = WISPSEARCH_ALL;
	b_irrlichtbeep();
	AI_StopProcessInfos(self);
};

func void dia_addon_wispdetector_detectitems_potions()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_POTIONS_15_00");	//jakékoliv lektvary.
	WISPSEARCHING = WISPSEARCH_POTIONS;
	b_irrlichtbeep();
	AI_StopProcessInfos(self);
};

func void dia_addon_wispdetector_detectitems_magic()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_MAGIC_15_00");	//prsteny a amulety.
	WISPSEARCHING = WISPSEARCH_MAGIC;
	b_irrlichtbeep();
	AI_StopProcessInfos(self);
};

func void dia_addon_wispdetector_detectitems_food()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_FOOD_15_00");	//jídlo a byliny.
	WISPSEARCHING = WISPSEARCH_FOOD;
	b_irrlichtbeep();
	AI_StopProcessInfos(self);
};

func void dia_addon_wispdetector_detectitems_nf()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_NF_15_00");	//zbranì pro boj na blízko.
	WISPSEARCHING = WISPSEARCH_NF;
	b_irrlichtbeep();
	AI_StopProcessInfos(self);
};

func void dia_addon_wispdetector_detectitems_ff()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_FF_15_00");	//støelné zbranì a munici.
	WISPSEARCHING = WISPSEARCH_FF;
	b_irrlichtbeep();
	AI_StopProcessInfos(self);
};

func void dia_addon_wispdetector_detectitems_none()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_NONE_15_00");	//zlato, klíèe a hlavní zboží.
	WISPSEARCHING = WISPSEARCH_NONE;
	b_irrlichtbeep();
	AI_StopProcessInfos(self);
};

func void dia_addon_wispdetector_detectitems_rune()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_RUNE_15_00");	//runy a svitky.
	WISPSEARCHING = WISPSEARCH_RUNE;
	b_irrlichtbeep();
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_WISPDETECTOR_FOLLOW(C_INFO)
{
	npc = wisp_detector;
	nr = 5;
	condition = dia_addon_wispdetector_follow_condition;
	information = dia_addon_wispdetector_follow_info;
	permanent = TRUE;
	description = "Pojï za mnou.";
};


func int dia_addon_wispdetector_follow_condition()
{
	return TRUE;
};

func void dia_addon_wispdetector_follow_info()
{
	b_followme_wisp();
	WISPSEARCHING = WISPSEARCH_FOLLOW;
	b_irrlichtbeep();
	AI_StopProcessInfos(self);
};

