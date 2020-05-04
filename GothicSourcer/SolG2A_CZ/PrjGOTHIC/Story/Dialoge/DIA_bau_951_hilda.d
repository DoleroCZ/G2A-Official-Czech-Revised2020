
instance DIA_HILDA_EXIT(C_INFO)
{
	npc = bau_951_hilda;
	nr = 999;
	condition = dia_hilda_exit_condition;
	information = dia_hilda_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hilda_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_hilda_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HILDA_HALLO(C_INFO)
{
	npc = bau_951_hilda;
	nr = 2;
	condition = dia_hilda_hallo_condition;
	information = dia_hilda_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hilda_hallo_condition()
{
	if((MIS_LOBART_RUEBEN != LOG_SUCCESS) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_hilda_hallo_info()
{
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Hilda_Hallo_17_00");	//Hej, kdo t� sem zval? Okam�it� vypadni. Nikdo t� tu nechce.
	}
	else
	{
		AI_Output(self,other,"DIA_Hilda_Hallo_17_01");	//Jo, co je?
	};
	AI_StopProcessInfos(self);
};


instance DIA_HILDA_WASZUESSEN(C_INFO)
{
	npc = bau_951_hilda;
	nr = 2;
	condition = dia_hilda_waszuessen_condition;
	information = dia_hilda_waszuessen_info;
	permanent = TRUE;
	description = "M��e� mi d�t n�co k j�dlu?";
};


func int dia_hilda_waszuessen_condition()
{
	if((Npc_KnowsInfo(other,dia_hilda_hallo) || (MIS_LOBART_RUEBEN == LOG_SUCCESS)) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_hilda_waszuessen_info()
{
	var int rueben_tagnull;
	if(hero.guild == GIL_NONE)
	{
		AI_Output(other,self,"DIA_Hilda_WasZuEssen_15_00");	//M��e� mi d�t n�co k j�dlu?
		if(MIS_LOBART_RUEBEN == LOG_SUCCESS)
		{
			if(!Npc_KnowsInfo(other,dia_hilda_pfannetoolate))
			{
				if(HILDA_STEW_DAY != Wld_GetDay())
				{
					b_giveinvitems(self,other,itfo_stew,1);
					AI_Output(self,other,"DIA_Hilda_WasZuEssen_17_01");	//Tady, vezmi si to. Jsi dobrej pracant.
					HILDA_STEW_DAY = Wld_GetDay();
				}
				else if((Wld_GetDay() == 0) && (rueben_tagnull == FALSE))
				{
					AI_Output(self,other,"DIA_Hilda_WasZuEssen_17_02");	//Pro dal�� si m��e� p�ij�t zase z�tra.
					b_giveinvitems(self,other,itfo_stew,1);
					HILDA_STEW_DAY = Wld_GetDay();
					rueben_tagnull = TRUE;
					Log_CreateTopic(TOPIC_BONUS,LOG_NOTE);
					b_logentry(TOPIC_BONUS,"Ka�d� den dostanu od Hildy trochu du�en�ch tu��n�.");
				}
				else
				{
					AI_Output(self,other,"DIA_Hilda_WasZuEssen_17_03");	//Dne�n� porci u� jsi dostal! Vra� se pozd�ji.
				};
			}
			else
			{
				AI_Output(self,other,"DIA_Hilda_WasZuEssen_17_04");	//Fl�ka�e tu nekrm�me. Vypadni!
				AI_StopProcessInfos(self);
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Hilda_WasZuEssen_17_05");	//Naj�st dostanou jen ti, co tu pracuj�!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Hilda_WasZuEssen_17_06");	//Ur�it� m� dost zlata, aby sis mohl s�m n�co koupit ve m�st�.
	};
};


instance DIA_HILDA_BRINGBEET(C_INFO)
{
	npc = bau_951_hilda;
	nr = 1;
	condition = dia_hilda_bringbeet_condition;
	information = dia_hilda_bringbeet_info;
	permanent = FALSE;
	description = "M�m tady pro tebe p�r tu��n�.";
};


func int dia_hilda_bringbeet_condition()
{
	if((MIS_LOBART_RUEBENTOHILDA == LOG_RUNNING) && (Npc_HasItems(other,itpl_beet) >= 1) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_hilda_bringbeet_info()
{
	AI_Output(other,self,"DIA_Hilda_BringBeet_15_00");	//M�m tady pro tebe p�r tu��n�.
	if(Npc_HasItems(other,itpl_beet) >= 20)
	{
		b_giveinvitems(other,self,itpl_beet,Npc_HasItems(other,itpl_beet));
		AI_Output(self,other,"DIA_Hilda_BringBeet_17_01");	//V�born�! (sm�ch) To by mohlo na nakrmen� t�ch chlap� i sta�it!
		AI_Output(self,other,"DIA_Hilda_BringBeet_17_02");	//Jinak, dokud jsi tady - vid�la jsem tudy p�ed p�r minutami proch�zet ko�ovn�ho kupce.
		AI_Output(self,other,"DIA_Hilda_BringBeet_17_03");	//M�m dojem, �e na cest� do m�sta na chv�li zastavil. B� se ho zeptat, jestli by pro m� nem�l po��dnou p�nev.
		MIS_LOBART_RUEBENTOHILDA = LOG_SUCCESS;
		b_giveplayerxp(XP_AMBIENT);
	}
	else
	{
		if(hero.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Hilda_BringBeet_17_04");	//Co?! A to m� b�t jako v�echno?
		}
		else
		{
			AI_Output(self,other,"DIA_Hilda_BringBeet_17_05");	//To nen� moc.
		};
		AI_Output(self,other,"DIA_Hilda_BringBeet_17_06");	//B� na pole a p�ines mi dal��. Chlapi maj� hlad!
		AI_StopProcessInfos(self);
	};
};


instance DIA_HILDA_EINKAUFEN(C_INFO)
{
	npc = bau_951_hilda;
	nr = 2;
	condition = dia_hilda_einkaufen_condition;
	information = dia_hilda_einkaufen_info;
	permanent = FALSE;
	description = "Dej mi zlato a j� zajdu za t�m kupcem.";
};


func int dia_hilda_einkaufen_condition()
{
	if((MIS_LOBART_RUEBENTOHILDA == LOG_SUCCESS) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_hilda_einkaufen_info()
{
	AI_Output(other,self,"DIA_Hilda_Einkaufen_15_00");	//Dej mi zlato a j� zajdu za t�m kupcem.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Hilda_Einkaufen_17_01");	//��k�, �e ti m�m v��it? Tak jen ty pen�ze nevyho� za chlast, sly��?!
	};
	b_giveinvitems(self,other,itmi_gold,20);
	MIS_HILDA_PFANNEKAUFEN = LOG_RUNNING;
	MIS_HILDA_PFANNEKAUFEN_DAY = b_getdayplus();
	Log_CreateTopic(TOPIC_HILDA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HILDA,LOG_RUNNING);
	b_logentry(TOPIC_HILDA,"Hilda, �ena sedl�ka Lobarta, m� po��dala, abych j� u podomn�ho obchodn�ka koupil n�jakou p�nev.");
};


instance DIA_HILDA_PFANNEGEHOLT(C_INFO)
{
	npc = bau_951_hilda;
	nr = 2;
	condition = dia_hilda_pfannegeholt_condition;
	information = dia_hilda_pfannegeholt_info;
	permanent = FALSE;
	description = "Tady je tvoje p�nev.";
};


func int dia_hilda_pfannegeholt_condition()
{
	if((MIS_HILDA_PFANNEKAUFEN == LOG_RUNNING) && (Npc_HasItems(other,itmi_pan) > 0) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_hilda_pfannegeholt_info()
{
	AI_Output(other,self,"DIA_Hilda_PfanneGeholt_15_00");	//Tady je tvoje p�nev.
	b_giveinvitems(other,self,itmi_pan,1);
	AI_Output(self,other,"DIA_Hilda_PfanneGeholt_17_01");	//Fajn. To se pod�vejme, je�t� se d� narazit na poctivce.
	MIS_HILDA_PFANNEKAUFEN = LOG_SUCCESS;
	b_giveplayerxp(XP_HILDAHOLPFANNE);
};


instance DIA_HILDA_PFANNETOOLATE(C_INFO)
{
	npc = bau_951_hilda;
	nr = 1;
	condition = dia_hilda_pfannetoolate_condition;
	information = dia_hilda_pfannetoolate_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hilda_pfannetoolate_condition()
{
	if((MIS_HILDA_PFANNEKAUFEN == LOG_RUNNING) && (MIS_HILDA_PFANNEKAUFEN_DAY <= (Wld_GetDay() - 1)) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_hilda_pfannetoolate_info()
{
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_00");	//To si je�t� dovol� se sem vracet? Cos ud�lal s m�mi pen�zi, ty darmo�lape?!
	}
	else
	{
		AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_01");	//M�ls na to dost �asu. Kde jsou pen�ze, co jsem ti dala na tu p�nev?
	};
	if(Npc_HasItems(other,itmi_pan) > 0)
	{
		AI_Output(other,self,"DIA_Hilda_PfanneTooLate_15_02");	//Promi�, zapomn�l jsem. Tady je tvoje p�nev!
		b_giveinvitems(other,self,itmi_pan,1);
		AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_03");	//Arrh, tak sem tu v�c dej. Takov� drzost - neuv��iteln�!
		MIS_HILDA_PFANNEKAUFEN = LOG_SUCCESS;
		b_giveplayerxp(XP_HILDAHOLPFANNE / 2);
		AI_StopProcessInfos(self);
	}
	else
	{
		if(Npc_HasItems(other,itmi_gold) >= 20)
		{
			AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_04");	//Ach! Ty to je�t� po��d m� u sebe! Vra� mi to. Hned.
			b_giveinvitems(other,self,itmi_gold,20);
			AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_05");	//Takov� drzost - neuv��iteln�!
		}
		else
		{
			AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_06");	//Ty to je�t� nem�! Dala jsem ti 20 zlat�ch!
			AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_07");	//Jdi mi z o��, ty mizernej zlod�ji!
			b_memorizeplayercrime(self,other,CRIME_THEFT);
		};
		MIS_HILDA_PFANNEKAUFEN = LOG_FAILED;
		b_checklog();
		AI_StopProcessInfos(self);
	};
};


instance DIA_HILDA_KAP3_EXIT(C_INFO)
{
	npc = bau_951_hilda;
	nr = 999;
	condition = dia_hilda_kap3_exit_condition;
	information = dia_hilda_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hilda_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_hilda_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HILDA_KRANK(C_INFO)
{
	npc = bau_951_hilda;
	nr = 30;
	condition = dia_hilda_krank_condition;
	information = dia_hilda_krank_info;
	permanent = TRUE;
	description = "C�t� se dob�e?";
};


func int dia_hilda_krank_condition()
{
	if((KAPITEL >= 3) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF)) && (MIS_HEALHILDA != LOG_SUCCESS))
	{
		return TRUE;
	};
};


var int dia_hilda_krank_ontime;

func void dia_hilda_krank_info()
{
	AI_Output(other,self,"DIA_Hilda_KRANK_15_00");	//C�t� se dob�e?
	AI_Output(self,other,"DIA_Hilda_KRANK_17_01");	//Ne, v�bec ne. M�m zase tu stra�nou hore�ku.
	AI_Output(self,other,"DIA_Hilda_KRANK_17_02");	//M�la bych zaj�t za m�stsk�m l��itelem, ale jsem na to moc slab�.
	if(DIA_HILDA_KRANK_ONTIME == FALSE)
	{
		Info_ClearChoices(dia_hilda_krank);
		Info_AddChoice(dia_hilda_krank,"Tak se brzo uzdrav. U� mus�m j�t.",dia_hilda_krank_besserung);
		Info_AddChoice(dia_hilda_krank,"Mohu n�jak pomoci?",dia_hilda_krank_helfen);
		DIA_HILDA_KRANK_ONTIME = TRUE;
	};
	MIS_HEALHILDA = LOG_RUNNING;
};

func void dia_hilda_krank_besserung()
{
	AI_Output(other,self,"DIA_Hilda_KRANK_besserung_15_00");	//Tak se brzo uzdrav. U� mus�m j�t.
	AI_Output(self,other,"DIA_Hilda_KRANK_besserung_17_01");	//Doufejme, �e p�ijdou lep�� �asy.
	AI_StopProcessInfos(self);
};

func void dia_hilda_krank_helfen()
{
	AI_Output(other,self,"DIA_Hilda_KRANK_helfen_15_00");	//Mohu n�jak pomoci?
	AI_Output(self,other,"DIA_Hilda_KRANK_helfen_17_01");	//Bylo by od tebe moc mil�, kdybys za�el za Vatrasem a z�skal od n�j l�k.
	AI_Output(self,other,"DIA_Hilda_KRANK_helfen_17_02");	//On u� bude v�d�t, co m� ud�lat! J� u� to sama nezvl�dnu.
	Log_CreateTopic(TOPIC_HEALHILDA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HEALHILDA,LOG_RUNNING);
	b_logentry(TOPIC_HEALHILDA,"Lobartov� �en� Hild� je �patn�, ale Vatras by pro ni m�l m�t l�k.");
	AI_StopProcessInfos(self);
};


instance DIA_HILDA_HEILUNGBRINGEN(C_INFO)
{
	npc = bau_951_hilda;
	nr = 31;
	condition = dia_hilda_heilungbringen_condition;
	information = dia_hilda_heilungbringen_info;
	description = "M�m pro tebe ten l�k.";
};


func int dia_hilda_heilungbringen_condition()
{
	if(Npc_HasItems(other,itpo_healhilda_mis))
	{
		return TRUE;
	};
};

func void dia_hilda_heilungbringen_info()
{
	AI_Output(other,self,"DIA_Hilda_HEILUNGBRINGEN_15_00");	//M�m pro tebe ten l�k.
	b_giveinvitems(other,self,itpo_healhilda_mis,1);
	AI_Output(self,other,"DIA_Hilda_HEILUNGBRINGEN_17_01");	//V�n�. Na�e spole�nost by pot�ebovala v�c lid� jako ty. Mockr�t d�ky.
	b_useitem(self,itpo_healhilda_mis);
	AI_Output(self,other,"DIA_Hilda_HEILUNGBRINGEN_17_02");	//Douf�m, �e t�chhle p�r zlat�ch bude sta�it.
	CreateInvItems(self,itmi_gold,50);
	b_giveinvitems(self,other,itmi_gold,50);
	MIS_HEALHILDA = LOG_SUCCESS;
	b_giveplayerxp(XP_HEALHILDA);
	AI_StopProcessInfos(self);
};


instance DIA_HILDA_DISTURB(C_INFO)
{
	npc = bau_951_hilda;
	nr = 32;
	condition = dia_hilda_disturb_condition;
	information = dia_hilda_disturb_info;
	permanent = TRUE;
	description = "Jak se m�?";
};


func int dia_hilda_disturb_condition()
{
	if((MIS_HEALHILDA == LOG_SUCCESS) || (((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && (KAPITEL > 3)))
	{
		return TRUE;
	};
};

func void dia_hilda_disturb_info()
{
	if(MIS_HEALHILDA == LOG_SUCCESS)
	{
		AI_Output(other,self,"DIA_Hilda_DISTURB_15_00");	//Jak se m�?
		AI_Output(self,other,"DIA_Hilda_DISTURB_17_01");	//U� je mi l�p, d�ky tob�.
	}
	else
	{
		AI_Output(self,other,"DIA_Hilda_DISTURB_17_02");	//��dn� sl�va.
	};
};


instance DIA_HILDA_KAP4_EXIT(C_INFO)
{
	npc = bau_951_hilda;
	nr = 999;
	condition = dia_hilda_kap4_exit_condition;
	information = dia_hilda_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hilda_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_hilda_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HILDA_KAP5_EXIT(C_INFO)
{
	npc = bau_951_hilda;
	nr = 999;
	condition = dia_hilda_kap5_exit_condition;
	information = dia_hilda_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hilda_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_hilda_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HILDA_KAP6_EXIT(C_INFO)
{
	npc = bau_951_hilda;
	nr = 999;
	condition = dia_hilda_kap6_exit_condition;
	information = dia_hilda_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hilda_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_hilda_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HILDA_PICKPOCKET(C_INFO)
{
	npc = bau_951_hilda;
	nr = 900;
	condition = dia_hilda_pickpocket_condition;
	information = dia_hilda_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40_FEMALE;
};


func int dia_hilda_pickpocket_condition()
{
	return c_beklauen(26,35);
};

func void dia_hilda_pickpocket_info()
{
	Info_ClearChoices(dia_hilda_pickpocket);
	Info_AddChoice(dia_hilda_pickpocket,DIALOG_BACK,dia_hilda_pickpocket_back);
	Info_AddChoice(dia_hilda_pickpocket,DIALOG_PICKPOCKET,dia_hilda_pickpocket_doit);
};

func void dia_hilda_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_hilda_pickpocket);
};

func void dia_hilda_pickpocket_back()
{
	Info_ClearChoices(dia_hilda_pickpocket);
};

