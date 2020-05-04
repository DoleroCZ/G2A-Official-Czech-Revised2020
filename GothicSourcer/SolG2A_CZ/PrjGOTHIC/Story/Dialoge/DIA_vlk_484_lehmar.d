
instance DIA_LEHMAR_EXIT(C_INFO)
{
	npc = vlk_484_lehmar;
	nr = 999;
	condition = dia_lehmar_exit_condition;
	information = dia_lehmar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lehmar_exit_condition()
{
	return TRUE;
};

func void dia_lehmar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LEHMAR_ENTSCHULDIGUNG(C_INFO)
{
	npc = vlk_484_lehmar;
	nr = 2;
	condition = dia_lehmar_entschuldigung_condition;
	information = dia_lehmar_entschuldigung_info;
	permanent = FALSE;
	description = "Jak se vede?";
};


func int dia_lehmar_entschuldigung_condition()
{
	return TRUE;
};

func void dia_lehmar_entschuldigung_info()
{
	AI_Output(other,self,"DIA_Lehmar_ENTSCHULDIGUNG_15_00");	//Jak se vede?
	AI_Output(self,other,"DIA_Lehmar_ENTSCHULDIGUNG_09_01");	//(otr�ven�) Kolik chce�?
	AI_Output(other,self,"DIA_Lehmar_ENTSCHULDIGUNG_15_02");	//Co t�m mysl�, 'kolik'?
	AI_Output(self,other,"DIA_Lehmar_ENTSCHULDIGUNG_09_03");	//Jsem lichv�� a ty jsi p�i�el za mnou. Co bys tak ode m� mohl cht�t? Pen�ze, samoz�ejm�.
};


instance DIA_LEHMAR_GELDLEIHEN(C_INFO)
{
	npc = vlk_484_lehmar;
	nr = 3;
	condition = dia_lehmar_geldleihen_condition;
	information = dia_lehmar_geldleihen_info;
	permanent = TRUE;
	description = "P�j� mi n�jak� pen�ze!";
};


var int dia_lehmar_geldleihen_noperm;

func int dia_lehmar_geldleihen_condition()
{
	if(Npc_KnowsInfo(other,dia_lehmar_entschuldigung) && (DIA_LEHMAR_GELDLEIHEN_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_lehmar_geldleihen_info()
{
	AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_15_00");	//P�j� mi n�jak� pen�ze!
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_09_01");	//Jasn�! Kolik bys cht�l? Po��t�m si 20 procent!
	Info_ClearChoices(dia_lehmar_geldleihen);
	Info_AddChoice(dia_lehmar_geldleihen,"Budu o tom p�em��let.",dia_lehmar_geldleihen_back);
	Info_AddChoice(dia_lehmar_geldleihen,"1000 zlat�ch.",dia_lehmar_geldleihen_1000);
	Info_AddChoice(dia_lehmar_geldleihen," 200 zlat�ch.",dia_lehmar_geldleihen_200);
	Info_AddChoice(dia_lehmar_geldleihen,"  50 zlat�ch.",dia_lehmar_geldleihen_50);
};

func void dia_lehmar_geldleihen_back()
{
	AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_back_15_00");	//Budu o tom p�em��let.
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_back_09_01");	//Tak u� se rozhodni! Nepl�tvej m�m �asem!
	AI_StopProcessInfos(self);
};

func void dia_lehmar_geldleihen_50()
{
	AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_50_15_00");	//50 zlat�ch.
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_50_09_01");	//Mal� ryba, co? Chci to z�tra zp�tky, jasn�?
	CreateInvItems(self,itmi_gold,50);
	b_giveinvitems(self,other,itmi_gold,50);
	DIA_LEHMAR_GELDLEIHEN_NOPERM = TRUE;
	LEHMAR_GELDGELIEHEN_DAY = Wld_GetDay();
	LEHMAR_GELDGELIEHEN = 50;
	Info_ClearChoices(dia_lehmar_geldleihen);
};

func void dia_lehmar_geldleihen_200()
{
	AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_200_15_00");	//200 zlat�ch.
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_200_09_01");	//To je spousta pen�z. Uvid�m t� zase z�tra a ty prachy taky, rozum�me?
	CreateInvItems(self,itmi_gold,200);
	b_giveinvitems(self,other,itmi_gold,200);
	DIA_LEHMAR_GELDLEIHEN_NOPERM = TRUE;
	LEHMAR_GELDGELIEHEN_DAY = Wld_GetDay();
	LEHMAR_GELDGELIEHEN = 200;
	Info_ClearChoices(dia_lehmar_geldleihen);
};

func void dia_lehmar_geldleihen_1000()
{
	AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_1000_15_00");	//1000 zlat�ch.
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_1000_09_01");	//To se ti povolily v�echny �rouby, nebo co?
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_1000_09_02");	//D�m ti 100. A nezapome�, zejtra to chci zp�tky!
	CreateInvItems(self,itmi_gold,100);
	b_giveinvitems(self,other,itmi_gold,100);
	DIA_LEHMAR_GELDLEIHEN_NOPERM = TRUE;
	LEHMAR_GELDGELIEHEN_DAY = Wld_GetDay();
	LEHMAR_GELDGELIEHEN = 100;
	Info_ClearChoices(dia_lehmar_geldleihen);
};


instance DIA_LEHMAR_WARUMGELD(C_INFO)
{
	npc = vlk_484_lehmar;
	nr = 3;
	condition = dia_lehmar_warumgeld_condition;
	information = dia_lehmar_warumgeld_info;
	permanent = FALSE;
	description = "To v�dycky rozhazuje� svoje pen�ze takhle mezi lidi?";
};


func int dia_lehmar_warumgeld_condition()
{
	if(LEHMAR_GELDGELIEHEN != 0)
	{
		return TRUE;
	};
};

func void dia_lehmar_warumgeld_info()
{
	AI_Output(other,self,"DIA_Lehmar_WARUMGELD_15_00");	//To v�dycky rozhazuje� svoje pen�ze takhle mezi lidi?
	AI_Output(self,other,"DIA_Lehmar_WARUMGELD_09_01");	//(pobaven�) Nestarej se. Vr�t� se. Jinak si t� najdu a zabiju. Je to tak jednoduch�.
	AI_Output(self,other,"DIA_Lehmar_WARUMGELD_09_02");	//Ty m� tak osobitej ksicht, �e mi nezabere moc �asu, abych si t� na�el.
	AI_Output(self,other,"DIA_Lehmar_WARUMGELD_09_03");	//Tak�e ani nepomysli na n�jakou boudu.
};


var int lehmar_vorbei;

instance DIA_LEHMAR_GELDEINTREIBEN(C_INFO)
{
	npc = vlk_484_lehmar;
	nr = 5;
	condition = dia_lehmar_geldeintreiben_condition;
	information = dia_lehmar_geldeintreiben_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lehmar_geldeintreiben_condition()
{
	if((LEHMAR_GELDGELIEHEN_DAY <= (Wld_GetDay() - 2)) && (LEHMAR_GELDGELIEHEN != 0) && (RANGERHELP_LEHMARKOHLE == FALSE))
	{
		return TRUE;
	};
};

func void dia_lehmar_geldeintreiben_info()
{
	AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_09_00");	//M� zpo�d�n�, ty bastarde! Dej sem moje prachy! A a� ti budu muset zase p�ipom�nat, u� to bude mnohem dra���.
	AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_09_01");	//Bude t� to st�t 30 procent nam�sto t�ch 20.
	Info_ClearChoices(dia_lehmar_geldeintreiben);
	Info_AddChoice(dia_lehmar_geldeintreiben,"Tady je m�j dluh.",dia_lehmar_geldeintreiben_schuldenzahlen);
	Info_AddChoice(dia_lehmar_geldeintreiben,"Ned�m ti nic.",dia_lehmar_geldeintreiben_kannstmich);
};

func void dia_lehmar_geldeintreiben_kannstmich()
{
	AI_Output(other,self,"DIA_Lehmar_GELDEINTREIBEN_kannstmich_15_00");	//Ned�m ti nic.
	AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_kannstmich_09_01");	//Ale ano, d�.
	LEHMAR_VORBEI = TRUE;
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_lehmar_geldeintreiben_schuldenzahlen()
{
	AI_Output(other,self,"DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_15_00");	//Tady je m�j dluh.
	if(LEHMAR_GELDGELIEHEN == 50)
	{
		LEHMAR_GELDGELIEHEN_MITZINSEN = 65;
	};
	if(LEHMAR_GELDGELIEHEN == 200)
	{
		LEHMAR_GELDGELIEHEN_MITZINSEN = 260;
	};
	if(LEHMAR_GELDGELIEHEN == 100)
	{
		LEHMAR_GELDGELIEHEN_MITZINSEN = 130;
	};
	IntToFloat(LEHMAR_GELDGELIEHEN_MITZINSEN);
	if(Npc_HasItems(other,itmi_gold) >= LEHMAR_GELDGELIEHEN_MITZINSEN)
	{
		b_giveinvitems(other,self,itmi_gold,LEHMAR_GELDGELIEHEN_MITZINSEN);
		AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_01");	//To m� �t�st�! A te� se zdejchni!
		LEHMAR_GELDGELIEHEN = 0;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_02");	//Nem� u sebe dost pen�z! Dobr�, jak chce�. Vid�m, �e bych ti m�l d�t lekci.
		AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_03");	//Neber si to nijak osobn� - mus�m si udr�ovat svou pov�st.
		LEHMAR_VORBEI = TRUE;
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	};
};


instance DIA_LEHMAR_GELDZURUECK(C_INFO)
{
	npc = vlk_484_lehmar;
	nr = 6;
	condition = dia_lehmar_geldzurueck_condition;
	information = dia_lehmar_geldzurueck_info;
	permanent = TRUE;
	description = "Tady jsou zp�tky tvoje pen�ze!";
};


func int dia_lehmar_geldzurueck_condition()
{
	if(!Npc_KnowsInfo(other,dia_lehmar_geldeintreiben) && (LEHMAR_GELDGELIEHEN != 0))
	{
		return TRUE;
	};
};

func void dia_lehmar_geldzurueck_info()
{
	AI_Output(other,self,"DIA_Lehmar_GELDZURUECK_15_00");	//Tady jsou zp�tky tvoje pen�ze!
	if((RANGERHELP_LEHMARKOHLE == TRUE) && (LEHMAR_GELDGELIEHEN_DAY <= (Wld_GetDay() - 2)))
	{
		AI_Output(self,other,"DIA_Addon_Lehmar_GELDZURUECK_09_00");	//Nemysli na to. Lares se u� o to postaral.
		AI_Output(self,other,"DIA_Addon_Lehmar_GELDZURUECK_09_01");	//Ten blb je tv�j k�mo� co?Ah ano, jeden z m�ch obchod�. Hezk� den.
		LEHMAR_GELDGELIEHEN = 0;
		AI_StopProcessInfos(self);
	}
	else
	{
		if(LEHMAR_GELDGELIEHEN == 50)
		{
			LEHMAR_GELDGELIEHEN_MITZINSEN = 60;
		};
		if(LEHMAR_GELDGELIEHEN == 200)
		{
			LEHMAR_GELDGELIEHEN_MITZINSEN = 240;
		};
		if(LEHMAR_GELDGELIEHEN == 100)
		{
			LEHMAR_GELDGELIEHEN_MITZINSEN = 120;
		};
		IntToFloat(LEHMAR_GELDGELIEHEN_MITZINSEN);
		if(Npc_HasItems(other,itmi_gold) >= LEHMAR_GELDGELIEHEN_MITZINSEN)
		{
			b_giveinvitems(other,self,itmi_gold,LEHMAR_GELDGELIEHEN_MITZINSEN);
			AI_Output(self,other,"DIA_Lehmar_GELDZURUECK_09_01");	//V�born�! S tebou se d�laj obchody jedna radost.
			LEHMAR_GELDGELIEHEN = 0;
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(self,other,"DIA_Lehmar_GELDZURUECK_09_02");	//Nem� dost pen�z! Vra� se, a� to bude� m�t pohromad�. Je�t� m� trochu �asu. Pamatuj, 20 procent!
			AI_StopProcessInfos(self);
		};
	};
};


instance DIA_LEHMAR_NOCHMALGELD(C_INFO)
{
	npc = vlk_484_lehmar;
	nr = 8;
	condition = dia_lehmar_nochmalgeld_condition;
	information = dia_lehmar_nochmalgeld_info;
	permanent = TRUE;
	description = "M��u si od tebe p�j�it n�jak� dal�� pen�ze?";
};


func int dia_lehmar_nochmalgeld_condition()
{
	if((LEHMAR_GELDGELIEHEN == 0) && (LEHMAR_GELDGELIEHEN_MITZINSEN != 0))
	{
		return TRUE;
	};
};

func void dia_lehmar_nochmalgeld_info()
{
	AI_Output(other,self,"DIA_Lehmar_NOCHMALGELD_15_00");	//M��u si od tebe p�j�it n�jak� dal�� pen�ze?
	if(Npc_KnowsInfo(other,dia_lehmar_geldeintreiben) || Npc_KnowsInfo(other,dia_lehmar_buchweg))
	{
		AI_Output(self,other,"DIA_Lehmar_NOCHMALGELD_09_01");	//To si mysl�, �e jsem blbej? Vypadni!
	}
	else
	{
		AI_Output(self,other,"DIA_Lehmar_NOCHMALGELD_09_02");	//Te� u� ne! M�l jsem velk� v�daje a pot�ebuju ka�dou minci.
		AI_Output(self,other,"DIA_Lehmar_NOCHMALGELD_09_03");	//Vra� se za p�r dn�!
	};
};


instance DIA_LEHMAR_PICKPOCKET(C_INFO)
{
	npc = vlk_484_lehmar;
	nr = 900;
	condition = dia_lehmar_pickpocket_condition;
	information = dia_lehmar_pickpocket_info;
	permanent = TRUE;
	description = "(Tuhle kn�e�ku by ukradlo i ment�ln� retardovan� d�t� s um�lou rukou.))";
};


func int dia_lehmar_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itwr_schuldenbuch) >= 1) && (other.attribute[ATR_DEXTERITY] >= (20 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_lehmar_pickpocket_info()
{
	Info_ClearChoices(dia_lehmar_pickpocket);
	Info_AddChoice(dia_lehmar_pickpocket,DIALOG_BACK,dia_lehmar_pickpocket_back);
	Info_AddChoice(dia_lehmar_pickpocket,DIALOG_PICKPOCKET,dia_lehmar_pickpocket_doit);
};

func void dia_lehmar_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 20)
	{
		b_giveinvitems(self,other,itwr_schuldenbuch,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_lehmar_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_lehmar_pickpocket_back()
{
	Info_ClearChoices(dia_canthar_pickpocket);
};


instance DIA_LEHMAR_BUCHWEG(C_INFO)
{
	npc = vlk_484_lehmar;
	nr = 1;
	condition = dia_lehmar_buchweg_condition;
	information = dia_lehmar_buchweg_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lehmar_buchweg_condition()
{
	if((self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == TRUE))
	{
		return TRUE;
	};
};

func void dia_lehmar_buchweg_info()
{
	AI_Output(self,other,"DIA_Lehmar_Add_09_00");	//(zkrou�en�) N�jakej mizernej kaps�� mi �lohnul moji ��etn� knihu.
	AI_Output(self,other,"DIA_Lehmar_Add_09_01");	//Nem� s t�m nic spole�n�ho, �e ne?
	AI_Output(other,self,"DIA_Addon_Lehmar_Add_15_02");	//(��klebek) J�? Ne.
	AI_Output(self,other,"DIA_Lehmar_Add_09_03");	//Ano, ano, dobr�. Tak u� b�.
	AI_StopProcessInfos(self);
};


instance DIA_LEHMAR_VERHAUEN(C_INFO)
{
	npc = vlk_484_lehmar;
	nr = 1;
	condition = dia_lehmar_verhauen_condition;
	information = dia_lehmar_verhauen_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_lehmar_verhauen_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		if((self.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || Npc_KnowsInfo(other,dia_lehmar_buchweg) || (LEHMAR_VORBEI == TRUE))
		{
			return TRUE;
		};
	};
};

func void dia_lehmar_verhauen_info()
{
	b_say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};

