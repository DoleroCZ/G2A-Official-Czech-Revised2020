
instance DIA_JAN_EXIT(C_INFO)
{
	npc = djg_714_jan;
	nr = 999;
	condition = dia_jan_exit_condition;
	information = dia_jan_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jan_exit_condition()
{
	return TRUE;
};

func void dia_jan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JAN_HELLO(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_hello_condition;
	information = dia_jan_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jan_hello_condition()
{
	if((KAPITEL >= 4) && Npc_IsInState(self,zs_talk) && (MIS_OCGATEOPEN == FALSE))
	{
		return 1;
	};
};

func void dia_jan_hello_info()
{
	AI_Output(self,other,"DIA_Jan_Hello_10_00");	//To byl ale v�n� blbej n�pad sem jezdit.
	AI_Output(self,other,"DIA_Jan_Hello_10_01");	//M�l jsem dojem, �e je tu n�co, co by st�lo za to. Ale a� na p�r arogantn�ch paladin� a sk�et� tu nen� v�bec nic.
};


instance DIA_JAN_DRAGONS(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_dragons_condition;
	information = dia_jan_dragons_info;
	permanent = FALSE;
	description = "Zapomn�li jsme na draky, co?";
};


func int dia_jan_dragons_condition()
{
	if(Npc_KnowsInfo(other,dia_jan_hello) && (MIS_JANBECOMESSMITH == FALSE) && (KAPITEL == 4) && (MIS_OCGATEOPEN == FALSE))
	{
		return 1;
	};
};

func void dia_jan_dragons_info()
{
	AI_Output(other,self,"DIA_Jan_Dragons_15_00");	//Zapomn�li jsme na draky, co?
	AI_Output(self,other,"DIA_Jan_Dragons_10_01");	//(posm�n�) Jak bych mohl zapomenout. J� ti pov�m, co. J� jsem kov��, ne bojovn�k.
	AI_Output(self,other,"DIA_Jan_Dragons_10_02");	//D�l�m zbran�. Bojov�n� p�enech�v�m n�komu jin�mu.
	AI_Output(other,self,"DIA_Jan_Dragons_15_03");	//Tak pro� jsi nez�stal u kovadliny?
	AI_Output(self,other,"DIA_Jan_Dragons_10_04");	//Paladinov� m� necht�li pustit do kov�rny. Nemohl jsem nic d�lat, pokud jsem necht�l skon�it v hladomorn�.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Jan_Dragons_10_05");	//Ty jsi taky jedn�m z nich. Tak co kdybys u nich za m� ztratil slovo?
	};
	Info_ClearChoices(dia_jan_dragons);
	Info_AddChoice(dia_jan_dragons,"M�l bych si hled�t sv�ho.",dia_jan_dragons_shithappen);
	Info_AddChoice(dia_jan_dragons,"Co z toho budu m�t, kdy� ti pom��u?",dia_jan_dragons_reward);
	Info_AddChoice(dia_jan_dragons,"Pokus�m se ti pomoct.",dia_jan_dragons_helpyou);
};

func void dia_jan_dragons_helpyou()
{
	AI_Output(other,self,"DIA_JAN_Dragons_HelpYou_15_00");	//Pokus�m se ti pomoct.
	AI_Output(self,other,"DIA_JAN_Dragons_HelpYou_10_01");	//Jak to chce� ud�lat? Parcival na��dil, aby n�s nespou�t�li z o��.
	AI_Output(self,other,"DIA_JAN_Dragons_HelpYou_10_02");	//Nikdo si nedovol� neuposlechnout.
	AI_Output(other,self,"DIA_JAN_Dragons_HelpYou_15_03");	//To nech na mn�.
	AI_Output(self,other,"DIA_JAN_Dragons_HelpYou_10_04");	//Nedovedu si p�edstavit, �e by t� vyslechl.
	Log_CreateTopic(TOPIC_JANBECOMESSMITH,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JANBECOMESSMITH,LOG_RUNNING);
	b_logentry(TOPIC_JANBECOMESSMITH,"Drakobijec Jan z hradu v Hornick�m �dol� chce pracovat v kov�rn�. Parcival mu to ale nechce dovolit.");
	MIS_JANBECOMESSMITH = LOG_RUNNING;
	Info_ClearChoices(dia_jan_dragons);
};

func void dia_jan_dragons_reward()
{
	AI_Output(other,self,"DIA_JAN_Dragons_Reward_15_00");	//Co z toho budu m�t, kdy� ti pom��u?
	AI_Output(self,other,"DIA_JAN_Dragons_Reward_10_01");	//Nem�m v�bec nic. Nanejv�� t� m��u n��emu p�iu�it.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_JAN_Dragons_Reward_10_02");	//Zn�m postup, jak ud�lat �epele z magick� rudy je�t� tvrd��.
	};
	JAN_TEACHPLAYER = TRUE;
};

func void dia_jan_dragons_shithappen()
{
	AI_Output(other,self,"DIA_JAN_Dragons_ShitHappen_15_00");	//M�l bych si hled�t sv�ho.
	AI_Output(self,other,"DIA_JAN_Dragons_ShitHappen_10_01");	//No ��asn�. J� te� nem��u opustit hrad a ani nem��u nic vykovat.
	Info_ClearChoices(dia_jan_dragons);
};


instance DIA_JAN_HOME(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_home_condition;
	information = dia_jan_home_info;
	permanent = FALSE;
	description = "Odkud jsi p�i�el?";
};


func int dia_jan_home_condition()
{
	if(Npc_KnowsInfo(other,dia_jan_hello) && (KAPITEL >= 4) && (MIS_OCGATEOPEN == FALSE))
	{
		return 1;
	};
};

func void dia_jan_home_info()
{
	AI_Output(other,self,"DIA_Jan_Home_15_00");	//Odkud jsi p�i�el?
	AI_Output(self,other,"DIA_Jan_Home_10_01");	//P�idal jsem se k n�jak�m mu��m z hor. M�li jsme nam��eno do �dol�, kde jsme si cht�li trochu p�ilep�it lovem drak�.
	AI_Output(self,other,"DIA_Jan_Home_10_02");	//Jejich velitel vystupoval pod jm�nem Sylvio. Chlape, to bylo hovado. Zach�zel se mnou jako s kusem hadru.
};


instance DIA_JAN_OLDCAMP(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_oldcamp_condition;
	information = dia_jan_oldcamp_info;
	permanent = TRUE;
	description = "Co v�echno se na hrad� stalo?";
};


func int dia_jan_oldcamp_condition()
{
	if(Npc_KnowsInfo(other,dia_jan_hello) && (KAPITEL == 4) && (MIS_OCGATEOPEN == FALSE))
	{
		return 1;
	};
};

func void dia_jan_oldcamp_info()
{
	AI_Output(other,self,"DIA_Jan_OldCamp_15_00");	//Co v�echno se na hrad� stalo?
	AI_Output(self,other,"DIA_Jan_OldCamp_10_01");	//Nic, o �em bych v�d�l. Jasn�, znepokojuje m�, co se d�je venku za hradbama.
};


instance DIA_JAN_PARCIVAL(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_parcival_condition;
	information = dia_jan_parcival_info;
	permanent = FALSE;
	description = "Mluvil jsem s Parcivalem.";
};


func int dia_jan_parcival_condition()
{
	if((MIS_JANBECOMESSMITH != LOG_SUCCESS) && Npc_KnowsInfo(other,dia_parcival_jan) && (MIS_OCGATEOPEN == FALSE))
	{
		return 1;
	};
};

func void dia_jan_parcival_info()
{
	AI_Output(other,self,"DIA_Jan_Parcival_15_00");	//Mluvil jsem s Parcivalem.
	AI_Output(self,other,"DIA_Jan_Parcival_10_01");	//Tak�e?
	if(hero.guild == GIL_DJG)
	{
		AI_Output(other,self,"DIA_Jan_Parcival_15_02");	//N�m drakobijc�m prost� nev���.
	}
	else
	{
		AI_Output(other,self,"DIA_Jan_Parcival_15_03");	//V�m drakobijc�m prost� nev���.
	};
	AI_Output(self,other,"DIA_Jan_Parcival_10_04");	//Sakra. Prost� chci jen n�jakou pr�ci.
	AI_Output(self,other,"DIA_Jan_Parcival_10_05");	//Tak to asi budu muset vzd�t. Te� u� mi m��e pomoct jen Garond.
};


instance DIA_JAN_JANISSMITH(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_janissmith_condition;
	information = dia_jan_janissmith_info;
	permanent = FALSE;
	description = "B� si pro kladivo, m� pr�ci.";
};


func int dia_jan_janissmith_condition()
{
	if((MIS_JANBECOMESSMITH == LOG_SUCCESS) && (MIS_OCGATEOPEN == FALSE))
	{
		return 1;
	};
};

func void dia_jan_janissmith_info()
{
	AI_Output(other,self,"DIA_Jan_JanIsSmith_15_00");	//B� si pro kladivo, m� pr�ci.
	AI_Output(self,other,"DIA_Jan_JanIsSmith_10_01");	//Tys to dok�zal? Jaks to za��dil?
	AI_Output(other,self,"DIA_Jan_JanIsSmith_15_02");	//P�imluvil jsem se za tebe, tak a� m� nezklame�.
	AI_Output(self,other,"DIA_Jan_JanIsSmith_10_03");	//Nem�j strach. Jsem r�d, �e v�bec m��u pracovat.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"SMITH");
};


instance DIA_JAN_SELLWEAPONS(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_sellweapons_condition;
	information = dia_jan_sellweapons_info;
	permanent = FALSE;
	description = "Prod�v� n�jak� zbran�?";
};


func int dia_jan_sellweapons_condition()
{
	if((MIS_JANBECOMESSMITH == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_jan_janissmith) && (JAN_TEACHPLAYER == FALSE) && (MIS_OCGATEOPEN == FALSE))
	{
		return 1;
	};
};

func void dia_jan_sellweapons_info()
{
	AI_Output(other,self,"DIA_Jan_SellWeapons_15_00");	//Prod�v� n�jak� zbran�?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Jan_SellWeapons_10_01");	//To v�. A pak m� tv� kolegov� �oupnou za m��e za �ernej obchod, co? Ne, zapome� na to.
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_SellWeapons_10_02");	//Ud�lal bych to, kdybych mohl. Ale nejd��v mus�m ud�lat dost zbran� pro paladiny tady na hrad�.
	};
	AI_Output(self,other,"DIA_Jan_SellWeapons_10_03");	//Ale m��u ti uk�zat, jak si vykovat vlastn� zbra�.
	JAN_TEACHPLAYER = TRUE;
};


instance JAN_TRAINING_TALENTE(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = jan_training_talente_condition;
	information = jan_training_talente_info;
	permanent = TRUE;
	description = "Nau� m� kov��sk�mu �emeslu.";
};


func int jan_training_talente_condition()
{
	if((JAN_TEACHPLAYER == TRUE) && Npc_KnowsInfo(other,dia_jan_janissmith) && (MIS_OCGATEOPEN == FALSE))
	{
		return 1;
	};
};

func void jan_training_talente_info()
{
	AI_Output(other,self,"DIA_Jan_TeachPlayer_15_00");	//Nau� m� kov��sk�mu �emeslu.
	AI_Output(self,other,"DIA_Jan_TeachPlayer_10_01");	//Co p�esn� chce� vyrobit?
	Info_ClearChoices(jan_training_talente);
	Info_AddChoice(jan_training_talente,DIALOG_BACK,jan_training_smith_back);
	if(PLAYER_TALENT_SMITH[WEAPON_COMMON] == FALSE)
	{
		Info_AddChoice(jan_training_talente,b_buildlearnstring("Nau�it se kov��stv�",b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_COMMON)),jan_training_smith_common);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_COMMON] == TRUE)
	{
		if((PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_01] == FALSE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
		{
			Info_AddChoice(jan_training_talente,b_buildlearnstring(NAME_ITMW_1H_SPECIAL_01,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_1H_SPECIAL_01)),jan_training_smith_1hspecial1);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_01] == FALSE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
		{
			Info_AddChoice(jan_training_talente,b_buildlearnstring(NAME_ITMW_2H_SPECIAL_01,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_2H_SPECIAL_01)),jan_training_smith_2hspecial1);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_02] == FALSE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
		{
			Info_AddChoice(jan_training_talente,b_buildlearnstring(NAME_ITMW_1H_SPECIAL_02,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_1H_SPECIAL_02)),jan_training_smith_1hspecial2);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_02] == FALSE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
		{
			Info_AddChoice(jan_training_talente,b_buildlearnstring(NAME_ITMW_2H_SPECIAL_02,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_2H_SPECIAL_02)),jan_training_smith_2hspecial2);
		};
	};
};

func void jan_training_smith_back()
{
	Info_ClearChoices(jan_training_talente);
};

func void jan_training_smith_common()
{
	b_teachplayertalentsmith(self,other,WEAPON_COMMON);
};

func void jan_training_smith_1hspecial1()
{
	b_teachplayertalentsmith(self,other,WEAPON_1H_SPECIAL_01);
};

func void jan_training_smith_2hspecial1()
{
	b_teachplayertalentsmith(self,other,WEAPON_2H_SPECIAL_01);
};

func void jan_training_smith_1hspecial2()
{
	b_teachplayertalentsmith(self,other,WEAPON_1H_SPECIAL_02);
};

func void jan_training_smith_2hspecial2()
{
	b_teachplayertalentsmith(self,other,WEAPON_2H_SPECIAL_02);
};


var int dia_jan_sellarmor_permanent;

instance DIA_JAN_SELLARMOR(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_sellarmor_condition;
	information = dia_jan_sellarmor_info;
	permanent = TRUE;
	description = "M��u si od tebe koupit n�jakou zbroj?";
};


func int dia_jan_sellarmor_condition()
{
	if((MIS_JANBECOMESSMITH == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_jan_janissmith) && (MIS_OCGATEOPEN == FALSE) && (DIA_JAN_SELLARMOR_PERMANENT == FALSE))
	{
		return 1;
	};
};

func void dia_jan_sellarmor_info()
{
	AI_Output(other,self,"DIA_Jan_SellArmor_15_00");	//M��u si od tebe koupit n�jakou zbroj?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Jan_SellArmor_10_01");	//Tv�mu brn�n� se nic nevyrovn�. Zapome� na to.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Jan_SellArmor_10_02");	//M�g, co chce brn�n�? Zapome� na to - b� se pod�vat za krej��m. Pro tebe zbroj ud�lat nedok�u.
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_SellArmor_10_03");	//Kdybych n�jakou m�l, tak bych ti ji prodal. Bohu�el, ��dnou nem�m.
		Info_ClearChoices(dia_jan_sellarmor);
		Info_AddChoice(dia_jan_sellarmor,"H�d�m, �e s t�m nejde nic d�lat.",dia_jan_sellarmor_sorry);
		Info_AddChoice(dia_jan_sellarmor,"A mohl bys pro m� n�jakou ud�lat?",dia_jan_sellarmor_buildone);
	};
};

func void dia_jan_sellarmor_sorry()
{
	AI_Output(other,self,"DIA_JAN_SellArmor_Sorry_15_00");	//H�d�m, �e s t�m nejde nic d�lat.
	AI_Output(self,other,"DIA_JAN_SellArmor_Sorry_10_01");	//Kdybys p�ece jen na n�co narazil, dej mi v�d�t.
	Info_ClearChoices(dia_jan_sellarmor);
};

func void dia_jan_sellarmor_buildone()
{
	AI_Output(other,self,"DIA_JAN_SellArmor_BuildOne_15_00");	//A mohl bys pro m� n�jakou ud�lat?
	AI_Output(self,other,"DIA_JAN_SellArmor_BuildOne_10_01");	//Dobr�, jestli stoj� o n�co lep��ho, mus� mi opat�it vhodn� materi�l.
	AI_Output(other,self,"DIA_JAN_SellArmor_BuildOne_15_02");	//Co pot�ebuje�?
	AI_Output(self,other,"DIA_JAN_SellArmor_BuildOne_10_03");	//Chce� bojovat s draky, ne? P�ines mi n�jak� dra�� �upiny - s t�m u� bych pro tebe mohl n�co ud�lat.
	AI_Output(self,other,"DIA_JAN_SellArmor_BuildOne_10_04");	//20 �upin by mohlo sta�it.
	DIA_JAN_SELLARMOR_PERMANENT = TRUE;
	Info_ClearChoices(dia_jan_sellarmor);
};


var int jan_sells_armor;

instance DIA_JAN_DRAGONSCALES(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_dragonscales_condition;
	information = dia_jan_dragonscales_info;
	permanent = TRUE;
	description = "M�m pro tebe ty dra�� �upiny.";
};


func int dia_jan_dragonscales_condition()
{
	if((MIS_JANBECOMESSMITH == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_jan_janissmith) && (MIS_OCGATEOPEN == FALSE) && (DIA_JAN_SELLARMOR_PERMANENT == TRUE) && (JAN_SELLS_ARMOR == FALSE) && (Npc_HasItems(other,itat_dragonscale) >= 1))
	{
		return 1;
	};
};


var int dia_jan_dragonscales_onetime;

func void dia_jan_dragonscales_info()
{
	AI_Output(other,self,"DIA_JAN_Dragonscales_15_00");	//M�m pro tebe ty dra�� �upiny.
	if(Npc_HasItems(other,itat_dragonscale) >= 20)
	{
		b_giveinvitems(other,self,itat_dragonscale,20);
		AI_Output(self,other,"DIA_JAN_Dragonscales_10_01");	//Dobr�, s t�m u� se d� n�co d�lat.
		AI_Output(self,other,"DIA_JAN_Dragonscales_10_02");	//Vra� se z�tra, pak u� by toho mohl b�t kus hotov�.
		if(DIA_JAN_DRAGONSCALES_ONETIME == FALSE)
		{
			b_giveplayerxp(XP_ADDON_JANSELLSARMOR);
			DIA_JAN_DRAGONSCALES_ONETIME = TRUE;
		};
		JAN_SELLS_ARMOR = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_JAN_Dragonscales_10_03");	//Pot�ebuju 20 dra��ch �upin, jinak ti nebudu moct ��dn� brn�n� vyrobit.
	};
};


var int djg_armor_is_offered;
var int dia_jan_armorready_noperm;

instance DIA_JAN_ARMORREADY(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_armorready_condition;
	information = dia_jan_armorready_info;
	permanent = TRUE;
	description = "Je ta zbroj hotov�?";
};


func int dia_jan_armorready_condition()
{
	if((MIS_OCGATEOPEN == FALSE) && (JAN_SELLS_ARMOR != FALSE) && (DIA_JAN_ARMORREADY_NOPERM == FALSE))
	{
		return 1;
	};
};

func void dia_jan_armorready_info()
{
	AI_Output(other,self,"DIA_JAN_ArmorReady_15_00");	//Je ta zbroj hotov�?
	if(JAN_SELLS_ARMOR == Wld_GetDay())
	{
		AI_Output(self,other,"DIA_JAN_ArmorReady_10_01");	//Ne, je�t� ne. Vra� se z�tra.
	}
	else
	{
		AI_Output(self,other,"DIA_JAN_ArmorReady_10_02");	//Ano, v�n� mistrovsk� kousek. M��e� si ho koupit, pokud o n�j stoj�.
		AI_Output(self,other,"DIA_JAN_ArmorReady_10_03");	//Ud�l�m ti zvl�tn� cenu. 12 000 zlat�ch.
		AI_Output(other,self,"DIA_JAN_ArmorReady_15_04");	//Co? Po tom v�em, co jsem pro tebe ud�lal?
		AI_Output(self,other,"DIA_JAN_ArmorReady_10_05");	//Nebu� takovej. Mus�m se n�jak �ivit. Bu� ber, nebo nech le�et.
		DJG_ARMOR_IS_OFFERED = TRUE;
		DIA_JAN_ARMORREADY_NOPERM = TRUE;
	};
};


var int jan_dia_jan_djg_armor_m_permanent;

instance DIA_JAN_DJG_ARMOR_M(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_djg_armor_m_condition;
	information = dia_jan_djg_armor_m_info;
	permanent = TRUE;
	description = "St�edn� drakobijeck� zbroj: ochrana: zbran� 120, ��py 120 (12000 zla��k�)";
};


func int dia_jan_djg_armor_m_condition()
{
	if((JAN_DIA_JAN_DJG_ARMOR_M_PERMANENT == FALSE) && (hero.guild == GIL_DJG) && (DJG_ARMOR_IS_OFFERED == TRUE))
	{
		return TRUE;
	};
};

func void dia_jan_djg_armor_m_info()
{
	AI_Output(other,self,"DIA_Jan_DJG_ARMOR_M_15_00");	//Chci si koupit nov� brn�n�.
	if(Npc_HasItems(other,itmi_gold) >= 12000)
	{
		AI_Output(self,other,"DIA_Jan_DJG_ARMOR_M_10_01");	//Jak vid�, tak m� cenu zlata.
		b_giveinvitems(other,self,itmi_gold,12000);
		CreateInvItems(self,itar_djg_m,1);
		b_giveinvitems(self,other,itar_djg_m,1);
		JAN_DIA_JAN_DJG_ARMOR_M_PERMANENT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_DJG_ARMOR_M_10_02");	//Nem� dost zlata.
	};
};


instance DIA_JAN_DRAGONPLETTBERICHT(C_INFO)
{
	npc = djg_714_jan;
	nr = 3;
	condition = dia_jan_dragonplettbericht_condition;
	information = dia_jan_dragonplettbericht_info;
	description = "A co se t��e t�ch drak�...";
};


var int dia_jan_dragonplettbericht_noperm;

func int dia_jan_dragonplettbericht_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_jan_dragons) && (DIA_JAN_DRAGONPLETTBERICHT_NOPERM == FALSE) && (MIS_OCGATEOPEN == FALSE) && (MIS_KILLEDDRAGONS != 0))
	{
		return TRUE;
	};
};

func void dia_jan_dragonplettbericht_info()
{
	if(MIS_KILLEDDRAGONS == 1)
	{
		AI_Output(other,self,"DIA_Jan_DragonPlettBericht_15_00");	//Zabil jsem draka.
	}
	else if((MIS_KILLEDDRAGONS == 2) || (MIS_KILLEDDRAGONS == 3))
	{
		AI_Output(other,self,"DIA_Jan_DragonPlettBericht_15_01");	//Zabil jsem p�r drak�.
	}
	else
	{
		AI_Output(other,self,"DIA_Jan_DragonPlettBericht_15_02");	//Zabil jsem v�echny draky.
	};
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_03");	//A co? Jsi p�ece drakobijec, ne?
		AI_Output(other,self,"DIA_Jan_DragonPlettBericht_15_04");	//Nejsi n�hodou taky jedn�m z nich?
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_05");	//To je v�born�. Ale abych pravdu �ekl, v�bec m� to nezaj�m�.
	};
	AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_06");	//U� jsem ti ��kal, �e rad�j vyr�b�m zbran�, ne� abych chodil zab�jet draky.
	if((hero.guild != GIL_DJG) && (hero.guild != GIL_SLD))
	{
		AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_07");	//Nicm�n�, je jedna v�c, co by m� mohla zaj�mat.
		AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_08");	//Pokud bys mi cht�l p�in�st n�jakou dra�� krev, slu�n� ti za ni zaplat�m.
		JAN_WANTSDRAGONBLOOD = TRUE;
	};
};


instance DIA_JAN_DRAGONBLOOD(C_INFO)
{
	npc = djg_714_jan;
	nr = 3;
	condition = dia_jan_dragonblood_condition;
	information = dia_jan_dragonblood_info;
	permanent = TRUE;
	description = "M�m pro tebe tu dra�� krev.";
};


func int dia_jan_dragonblood_condition()
{
	if((JAN_WANTSDRAGONBLOOD == TRUE) && (MIS_OCGATEOPEN == FALSE) && Npc_HasItems(other,itat_dragonblood) && ((hero.guild != GIL_DJG) && (hero.guild != GIL_SLD)))
	{
		return TRUE;
	};
};

func void dia_jan_dragonblood_info()
{
	AI_Output(other,self,"DIA_Jan_DragonBlood_15_00");	//M�m pro tebe tu dra�� krev.
	AI_Output(self,other,"DIA_Jan_DragonBlood_10_01");	//To je skv�l�. Koup�m v�echno, co m�.
	Info_ClearChoices(dia_jan_dragonblood);
	Info_AddChoice(dia_jan_dragonblood,DIALOG_BACK,dia_jan_dragonblood_back);
	if(Npc_HasItems(other,itat_dragonblood) >= 1)
	{
		Info_AddChoice(dia_jan_dragonblood,"(V�echno)",dia_jan_dragonblood_all);
		Info_AddChoice(dia_jan_dragonblood,"(Jednu lahvi�ku)",dia_jan_dragonblood_1);
	};
};

func void dia_jan_dragonblood_back()
{
	Info_ClearChoices(dia_jan_dragonblood);
};

func void dia_jan_dragonblood_1()
{
	var int dragonbloodcount;
	var int dragonbloodgeld;
	var int xp_djg_bringdragonbloods;
	var string bloodtext;
	var string bloodleft;
	dragonbloodcount = 1;
	b_giveinvitems(other,self,itat_dragonblood,dragonbloodcount);
	xp_djg_bringdragonbloods = dragonbloodcount * XP_AMBIENTKAP4;
	b_giveplayerxp(xp_djg_bringdragonbloods);
	dragonbloodgeld = dragonbloodcount * VALUE_DRAGONBLOOD;
	CreateInvItems(self,itmi_gold,dragonbloodgeld);
	b_giveinvitems(self,other,itmi_gold,dragonbloodgeld);
	Info_ClearChoices(dia_jan_dragonblood);
	Info_AddChoice(dia_jan_dragonblood,DIALOG_BACK,dia_jan_dragonblood_back);
	if(Npc_HasItems(other,itat_dragonblood) >= 1)
	{
		Info_AddChoice(dia_jan_dragonblood,"(V�echno)",dia_jan_dragonblood_all);
		Info_AddChoice(dia_jan_dragonblood,"(Jednu lahvi�ku)",dia_jan_dragonblood_1);
	};
	bloodleft = IntToString(Npc_HasItems(other,itat_dragonblood));
	bloodtext = ConcatStrings(bloodleft,PRINT_NUMBERLEFT);
	AI_PrintScreen(bloodtext,-1,-1,FONT_SCREENSMALL,2);
};

func void dia_jan_dragonblood_all()
{
	var int dragonbloodcount;
	var int dragonbloodgeld;
	var int xp_djg_bringdragonbloods;
	var string bloodtext;
	var string bloodleft;
	dragonbloodcount = Npc_HasItems(other,itat_dragonblood);
	b_giveinvitems(other,self,itat_dragonblood,dragonbloodcount);
	xp_djg_bringdragonbloods = dragonbloodcount * XP_AMBIENTKAP4;
	b_giveplayerxp(xp_djg_bringdragonbloods);
	dragonbloodgeld = dragonbloodcount * VALUE_DRAGONBLOOD;
	CreateInvItems(self,itmi_gold,dragonbloodgeld);
	b_giveinvitems(self,other,itmi_gold,dragonbloodgeld);
	Info_ClearChoices(dia_jan_dragonblood);
	Info_AddChoice(dia_jan_dragonblood,DIALOG_BACK,dia_jan_dragonblood_back);
	if(Npc_HasItems(other,itat_dragonblood) >= 1)
	{
		Info_AddChoice(dia_jan_dragonblood,"(V�echno)",dia_jan_dragonblood_all);
		Info_AddChoice(dia_jan_dragonblood,"(Jednu lahvi�ku)",dia_jan_dragonblood_1);
	};
	bloodleft = IntToString(Npc_HasItems(other,itat_dragonblood));
	bloodtext = ConcatStrings(bloodleft,PRINT_NUMBERLEFT);
	AI_PrintScreen(bloodtext,-1,-1,FONT_SCREENSMALL,2);
};


instance DIA_JAN_NACHOCGATEOPEN(C_INFO)
{
	npc = djg_714_jan;
	nr = 3;
	condition = dia_jan_nachocgateopen_condition;
	information = dia_jan_nachocgateopen_info;
	permanent = TRUE;
	description = "Je v�echno v po��dku?";
};


func int dia_jan_nachocgateopen_condition()
{
	if(MIS_OCGATEOPEN == TRUE)
	{
		return TRUE;
	};
};

func void dia_jan_nachocgateopen_info()
{
	AI_Output(other,self,"DIA_Jan_NACHOCGATEOPEN_15_00");	//Je v�echno v po��dku?
	AI_Output(self,other,"DIA_Jan_NACHOCGATEOPEN_10_01");	//V po��dku nen� naprosto nic!
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Jan_NACHOCGATEOPEN_10_02");	//Pro� jste vy idioti otev�rali tu br�nu? Vy paladinov� jste taky chytr� jak prdy ve spodk�ch!
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_NACHOCGATEOPEN_10_03");	//Tak prost� �li a otev�eli tu br�nu. Tupci! Tohle prost� nepochopim.
	};
	AI_StopProcessInfos(self);
};


instance DIA_JAN_PICKPOCKET(C_INFO)
{
	npc = djg_714_jan;
	nr = 900;
	condition = dia_jan_pickpocket_condition;
	information = dia_jan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_jan_pickpocket_condition()
{
	return c_beklauen(37,95);
};

func void dia_jan_pickpocket_info()
{
	Info_ClearChoices(dia_jan_pickpocket);
	Info_AddChoice(dia_jan_pickpocket,DIALOG_BACK,dia_jan_pickpocket_back);
	Info_AddChoice(dia_jan_pickpocket,DIALOG_PICKPOCKET,dia_jan_pickpocket_doit);
};

func void dia_jan_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_jan_pickpocket);
};

func void dia_jan_pickpocket_back()
{
	Info_ClearChoices(dia_jan_pickpocket);
};

