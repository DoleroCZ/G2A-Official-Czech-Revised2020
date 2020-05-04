
instance DIA_ADDON_EREMIT_EXIT(C_INFO)
{
	npc = none_addon_115_eremit;
	nr = 999;
	condition = dia_addon_eremit_exit_condition;
	information = dia_addon_eremit_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_eremit_exit_condition()
{
	return TRUE;
};

func void dia_addon_eremit_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_EREMIT_HELLO(C_INFO)
{
	npc = none_addon_115_eremit;
	nr = 1;
	condition = dia_addon_eremit_hello_condition;
	information = dia_addon_eremit_hello_info;
	important = TRUE;
};


func int dia_addon_eremit_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_eremit_hello_info()
{
	AI_Output(other,self,"DIA_Addon_Eremit_Add_15_00");	//(P�ekvapen�) Co tady d�l�?
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_00");	//Co tu d�l�m?! A na kter�ho �erta jsi tu pros�m t� ty?
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_01");	//�el jsem co do nejodlehlej�� ��sti ostrova, abych m�l klid.
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_02");	//Ob�ansk� v�lka, �to��c� banditi, hordy sk�et� skoro na prahu ...
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_03");	//To nen� pro m�. Nikdy v�c. Vypadl jsem z toho ��lenstv�.
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_04");	//Tam je taky p�r sk�et�, ale ti jsou daleko a nen� jich tolik.
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_05");	//A ostatn� lid� sem - d�ky Innosovi - nechod�. (mrzut�) Dodnes.
};


instance DIA_ADDON_EREMIT_SEEKTAFELN(C_INFO)
{
	npc = none_addon_115_eremit;
	nr = 2;
	condition = dia_addon_eremit_seektafeln_condition;
	information = dia_addon_eremit_seektafeln_info;
	description = "Hled�m kamenn� desky. Nena�els n�hodou n�jak�?";
};


func int dia_addon_eremit_seektafeln_condition()
{
	return TRUE;
};

func void dia_addon_eremit_seektafeln_info()
{
	AI_Output(other,self,"DIA_Addon_Eremit_Add_15_02");	//Hled�m kamenn� desky. Nena�els n�hodou n�jak�?
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_06");	//No jo ... Ale nech�m si je!
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_07");	//Jsou tu jedinou v�c�, kterou m�m, tak je �tu.
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_08");	//Zat�m v�emu nerozum�m, ale nekter� jsem u� de�ifroval.
};


var int eremit_teach_once;

instance DIA_ADDON_EREMIT_TEACH(C_INFO)
{
	npc = none_addon_115_eremit;
	nr = 3;
	condition = dia_addon_eremit_teach_condition;
	information = dia_addon_eremit_teach_info;
	permanent = TRUE;
	description = "O kamenn�ch desk�ch ...";
};


func int dia_addon_eremit_teach_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_eremit_seektafeln) && (EREMIT_TEACH_ONCE == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_eremit_teach_info()
{
	AI_Output(other,self,"DIA_Addon_Eremit_Add_15_03");	//O kamenn�ch desk�ch ...
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_25");	//Mohl bych t� n�co o tom nau�it?
	if(MIS_EREMIT_KLAMOTTEN != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_26");	//(rychle) Ale ty m� desky nedostane�! Bude� si muset sehnat vlastn�.
	};
	Info_ClearChoices(dia_addon_eremit_teach);
	Info_AddChoice(dia_addon_eremit_teach,DIALOG_BACK,dia_addon_eremit_teach_no);
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	{
		Info_AddChoice(dia_addon_eremit_teach,b_buildlearnstring(NAME_ADDON_LEARNLANGUAGE_1,b_getlearncosttalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_1)),dia_addon_eremit_teach_yes);
	}
	else if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE))
	{
		Info_AddChoice(dia_addon_eremit_teach,b_buildlearnstring(NAME_ADDON_LEARNLANGUAGE_2,b_getlearncosttalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_2)),dia_addon_eremit_teach_yes);
	}
	else if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE))
	{
		Info_AddChoice(dia_addon_eremit_teach,b_buildlearnstring(NAME_ADDON_LEARNLANGUAGE_3,b_getlearncosttalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_3)),dia_addon_eremit_teach_yes);
	};
};

func void b_addon_eremit_teachlanguage()
{
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_27");	//Je to docela jednoduch�, sleduj. 'G' je 'O',  'T' je 'H' , 'I' je 'C'.
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_28");	//Jak to jednou ud�l�, zbytek t� napadne s�m ...
	EREMIT_TEACH_ONCE = TRUE;
};

func void dia_addon_eremit_teach_no()
{
	Info_ClearChoices(dia_addon_eremit_teach);
};

func void dia_addon_eremit_teach_yes()
{
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_29");	//Mysl�m, �e u� t� nic nem��u nau�it ...
		EREMIT_TEACH_ONCE = TRUE;
	}
	else if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE)
	{
		if(b_teachplayertalentforeignlanguage(self,other,LANGUAGE_3))
		{
			b_addon_eremit_teachlanguage();
		};
	}
	else if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		if(b_teachplayertalentforeignlanguage(self,other,LANGUAGE_2))
		{
			b_addon_eremit_teachlanguage();
		};
	}
	else if(b_teachplayertalentforeignlanguage(self,other,LANGUAGE_1))
	{
		b_addon_eremit_teachlanguage();
	};
};


instance DIA_ADDON_EREMIT_KLAMOTTEN(C_INFO)
{
	npc = none_addon_115_eremit;
	nr = 4;
	condition = dia_addon_eremit_klamotten_condition;
	information = dia_addon_eremit_klamotten_info;
	permanent = TRUE;
	description = "N�co pro tebe m�m ...";
};


func int dia_addon_eremit_klamotten_condition()
{
	if(MIS_EREMIT_KLAMOTTEN == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_eremit_klamotten_info()
{
	AI_Output(other,self,"DIA_Addon_Eremit_Add_15_01");	//N�co pro tebe m�m ...
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_19");	//Opravdu? Dej mi to! Pod�v�me se, zda-li se to bude hodit.
	Info_ClearChoices(dia_addon_eremit_klamotten);
	Info_AddChoice(dia_addon_eremit_klamotten,DIALOG_BACK,dia_addon_eremit_klamotten_back);
	if(Npc_HasItems(other,itar_pir_l_addon) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej Lehk� pir�tsk� brn�n�",dia_addon_eremit_klamotten_pir_l);
	};
	if(Npc_HasItems(other,itar_pir_m_addon) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej St�edn� pir�tsk� brn�n�",dia_addon_eremit_klamotten_pir_m);
	};
	if(Npc_HasItems(other,itar_pir_h_addon) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej Kapit�nsk� brn�n�",dia_addon_eremit_klamotten_pir_h);
	};
	if(Npc_HasItems(other,itar_ranger_addon) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej brn�n� kruhu vody",dia_addon_eremit_klamotten_ranger);
	};
	if(Npc_HasItems(other,itar_kdw_l_addon) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej Lehk� roucho m�ga vody",dia_addon_eremit_klamotten_kdw_l);
	};
	if(Npc_HasItems(other,itar_kdw_h) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej T�k� roucho m�ga vody",dia_addon_eremit_klamotten_kdw_h);
	};
	if(Npc_HasItems(other,itar_governor) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej Guvern�rovu kazajku",dia_addon_eremit_klamotten_governor);
	};
	if(Npc_HasItems(other,itar_judge) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej Soudcovu r�bu",dia_addon_eremit_klamotten_judge);
	};
	if(Npc_HasItems(other,itar_smith) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej Kov��skou z�st�ru",dia_addon_eremit_klamotten_smith);
	};
	if(Npc_HasItems(other,itar_barkeeper) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej Hospod��skoou z�st�ru",dia_addon_eremit_klamotten_barkeeper);
	};
	if(Npc_HasItems(other,itar_vlk_l) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej M욝ansk� od�v I",dia_addon_eremit_klamotten_vlk_l);
	};
	if(Npc_HasItems(other,itar_vlk_m) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej M욝ansk� od�v II",dia_addon_eremit_klamotten_vlk_m);
	};
	if(Npc_HasItems(other,itar_vlk_h) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej M욝ansk� od�v III",dia_addon_eremit_klamotten_vlk_h);
	};
	if(Npc_HasItems(other,itar_vlkbabe_l) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej M욝ansk� �at I",dia_addon_eremit_klamotten_vlkbabe_l);
	};
	if(Npc_HasItems(other,itar_vlkbabe_m) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej M욝ansk� �at II",dia_addon_eremit_klamotten_vlkbabe_m);
	};
	if(Npc_HasItems(other,itar_vlkbabe_h) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej M욝ansk� �at III",dia_addon_eremit_klamotten_vlkbabe_h);
	};
	if(Npc_HasItems(other,itar_pal_skel) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej Star� paladinsk� brn�n�",dia_addon_eremit_klamotten_pal_skel);
	};
	if(Npc_HasItems(other,itar_bau_l) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej Lehk� farm��sk� od�v",dia_addon_eremit_klamotten_bau_l);
	};
	if(Npc_HasItems(other,itar_bau_m) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej St�edn� farm��sk� od�v",dia_addon_eremit_klamotten_bau_m);
	};
	if(Npc_HasItems(other,itar_baubabe_l) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej Lehk� farm��sk� �at",dia_addon_eremit_klamotten_baubabe_l);
	};
	if(Npc_HasItems(other,itar_baubabe_m) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej St�edn� farm��sk� �at",dia_addon_eremit_klamotten_baubabe_m);
	};
	if(Npc_HasItems(other,itar_djg_crawler) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej Zbroj z krun��e d�ln�ho �erva",dia_addon_eremit_klamotten_djg_crawler);
	};
	if(Npc_HasItems(other,itar_leather_l) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej Ko�en� brn�n�",dia_addon_eremit_klamotten_leather);
	};
	if(Npc_HasItems(other,itar_xardas) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej Roucho temn�ch um�n�",dia_addon_eremit_klamotten_xardas);
	};
	if(Npc_HasItems(other,itar_lester) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej Lesterovo roucho",dia_addon_eremit_klamotten_lester);
	};
	if(Npc_HasItems(other,itar_diego) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej Diegovo brn�n�",dia_addon_eremit_klamotten_diego);
	};
	if(Npc_HasItems(other,itar_corangar) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej Cor'Angarovu zbroj",dia_addon_eremit_klamotten_corangar);
	};
	if(Npc_HasItems(other,itar_prisoner) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej Kalhoty kop��e",dia_addon_eremit_klamotten_prisoner);
	};
	if(Npc_HasItems(other,itar_dementor) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Dej P�tra�ovo roucho",dia_addon_eremit_klamotten_dementor);
	};
};

func void b_eremit_tatsache()
{
	AI_EquipBestArmor(self);
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_20");	//Jako ulit�!
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_21");	//Hmm, co bych ti mohl d�t? V�echno zlato jsem dal pir�t�m za vstup.
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_22");	//M��u ti d�t n�jak� star� kamenn� desky.
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_23");	//Na, ber. J� si m��u naj�t dal��.
	b_giveinvitems(self,other,itwr_dexstoneplate3_addon,1);
	b_giveinvitems(self,other,itwr_stoneplatecommon_addon,1);
	MIS_EREMIT_KLAMOTTEN = LOG_SUCCESS;
	b_giveplayerxp(200);
	Info_ClearChoices(dia_addon_eremit_klamotten);
};

func void dia_addon_eremit_klamotten_back()
{
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_24");	//Skv�l�. Prvn� zv��ila mou nedo�kavost a pak ... (povzdechne si)
	Info_ClearChoices(dia_addon_eremit_klamotten);
};

func void dia_addon_eremit_klamotten_pir_l()
{
	b_giveinvitems(other,self,itar_pir_l_addon,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_pir_m()
{
	b_giveinvitems(other,self,itar_pir_m_addon,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_pir_h()
{
	b_giveinvitems(other,self,itar_pir_h_addon,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_thorus()
{
	b_giveinvitems(other,self,itar_thorus_addon,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_orebaron()
{
	b_giveinvitems(other,self,itar_orebaron_addon,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_bloodwyn()
{
	b_giveinvitems(other,self,itar_bloodwyn_addon,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_raven()
{
	b_giveinvitems(other,self,itar_raven_addon,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_ranger()
{
	b_giveinvitems(other,self,itar_ranger_addon,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_kdw_l()
{
	b_giveinvitems(other,self,itar_kdw_l_addon,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_kdw_h()
{
	b_giveinvitems(other,self,itar_kdw_h,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_governor()
{
	b_giveinvitems(other,self,itar_governor,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_judge()
{
	b_giveinvitems(other,self,itar_judge,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_smith()
{
	b_giveinvitems(other,self,itar_smith,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_barkeeper()
{
	b_giveinvitems(other,self,itar_barkeeper,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_vlk_l()
{
	b_giveinvitems(other,self,itar_vlk_l,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_vlk_m()
{
	b_giveinvitems(other,self,itar_vlk_m,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_vlk_h()
{
	b_giveinvitems(other,self,itar_vlk_h,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_vlkbabe_l()
{
	b_giveinvitems(other,self,itar_vlkbabe_l,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_vlkbabe_m()
{
	b_giveinvitems(other,self,itar_vlkbabe_m,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_vlkbabe_h()
{
	b_giveinvitems(other,self,itar_vlkbabe_h,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_mil_l()
{
	b_giveinvitems(other,self,itar_mil_l,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_mil_m()
{
	b_giveinvitems(other,self,itar_mil_m,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_pal_m()
{
	b_giveinvitems(other,self,itar_pal_m,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_pal_h()
{
	b_giveinvitems(other,self,itar_pal_h,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_pal_skel()
{
	b_giveinvitems(other,self,itar_pal_skel,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_bau_l()
{
	b_giveinvitems(other,self,itar_bau_l,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_bau_m()
{
	b_giveinvitems(other,self,itar_bau_m,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_baubabe_l()
{
	b_giveinvitems(other,self,itar_baubabe_l,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_baubabe_m()
{
	b_giveinvitems(other,self,itar_baubabe_m,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_sld_l()
{
	b_giveinvitems(other,self,itar_sld_l,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_sld_m()
{
	b_giveinvitems(other,self,itar_sld_m,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_sld_h()
{
	b_giveinvitems(other,self,itar_sld_h,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_djg_crawler()
{
	b_giveinvitems(other,self,itar_djg_crawler,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_djg_l()
{
	b_giveinvitems(other,self,itar_djg_l,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_djg_m()
{
	b_giveinvitems(other,self,itar_djg_m,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_djg_h()
{
	b_giveinvitems(other,self,itar_djg_h,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_nov_l()
{
	b_giveinvitems(other,self,itar_nov_l,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_kdf_l()
{
	b_giveinvitems(other,self,itar_kdf_l,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_kdf_h()
{
	b_giveinvitems(other,self,itar_kdf_h,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_leather()
{
	b_giveinvitems(other,self,itar_leather_l,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_bdt_m()
{
	b_giveinvitems(other,self,itar_bdt_m,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_bdt_h()
{
	b_giveinvitems(other,self,itar_bdt_h,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_xardas()
{
	b_giveinvitems(other,self,itar_xardas,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_lester()
{
	b_giveinvitems(other,self,itar_lester,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_diego()
{
	b_giveinvitems(other,self,itar_diego,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_corangar()
{
	b_giveinvitems(other,self,itar_corangar,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_prisoner()
{
	b_giveinvitems(other,self,itar_prisoner,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_dementor()
{
	b_giveinvitems(other,self,itar_dementor,1);
	b_eremit_tatsache();
};


instance DIA_ADDON_EREMIT_PERM(C_INFO)
{
	npc = none_addon_115_eremit;
	nr = 99;
	condition = dia_addon_eremit_perm_condition;
	information = dia_addon_eremit_perm_info;
	permanent = TRUE;
	description = "Jak� je to ��t jako poustevn�k?";
};


func int dia_addon_eremit_perm_condition()
{
	return TRUE;
};

func void dia_addon_eremit_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Eremit_Add_15_04");	//Jak� je to ��t jako poustevn�k?
	if(MIS_EREMIT_KLAMOTTEN == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_09");	//(py�n�) D�l�m si v�e s�m. Zbran�, n�stroje, chatr�, prost� v�e.
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_10");	//P�i�el jsem sem a nem�l jsem nic, ale m� p�le ...
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_11");	//Jinak ...
		AI_Output(other,self,"DIA_Addon_Eremit_Doppelt_15_01");	//Ano?
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_12");	//N�kdy si p�eju, abych si s sebou vzal n�jak� oble�en�.
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_13");	//Nev�m nic o stahov�n� zv��at ...
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_14");	//A noci v t�to ��sti ostrova nejsou zrovna nejteplej��.
		MIS_EREMIT_KLAMOTTEN = LOG_RUNNING;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_15");	//Vysta��m si.
		if(MIS_EREMIT_KLAMOTTEN == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Addon_Eremit_Add_04_18");	//S t�mito �aty p�e�iju zimu a pak ... uvid�me ...
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Eremit_Add_04_16");	//Je to lep�� jak v Khorinisu!
			AI_Output(self,other,"DIA_Addon_Eremit_Add_04_17");	//Dokonce bez pokr�vek.
		};
	};
};

