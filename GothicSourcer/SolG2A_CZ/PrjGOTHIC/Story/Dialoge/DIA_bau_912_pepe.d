
instance DIA_PEPE_EXIT(C_INFO)
{
	npc = bau_912_pepe;
	nr = 999;
	condition = dia_pepe_exit_condition;
	information = dia_pepe_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pepe_exit_condition()
{
	return TRUE;
};

func void dia_pepe_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PEPE_HALLO(C_INFO)
{
	npc = bau_912_pepe;
	nr = 1;
	condition = dia_pepe_hallo_condition;
	information = dia_pepe_hallo_info;
	permanent = FALSE;
	description = "Co tady d�l�?";
};


func int dia_pepe_hallo_condition()
{
	return TRUE;
};

func void dia_pepe_hallo_info()
{
	AI_Output(other,self,"DIA_Pepe_Hallo_15_00");	//Co tady d�l�?
	AI_Output(self,other,"DIA_Pepe_Hallo_03_01");	//(otr�ven�) Hl�d�m ovce! (vzdych�) A pokud je to mo�n�, vyh�b�m se probl�m�m.
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		AI_Output(other,self,"DIA_Pepe_Hallo_15_02");	//Moc to nefunguje, co?
		AI_Output(self,other,"DIA_Pepe_Hallo_03_03");	//Pff, zvl᚝ s t�mi �old�ky. Jsem opravdu r�d, �e m��u b�t tady na pastvin�. I kdy� to m��e b�t nebezpe�n� tak jako tak.
	};
};


instance DIA_PEPE_DANGER(C_INFO)
{
	npc = bau_912_pepe;
	nr = 2;
	condition = dia_pepe_danger_condition;
	information = dia_pepe_danger_info;
	permanent = FALSE;
	description = "Co je tak nebezpe�n�ho na pastvin�?";
};


func int dia_pepe_danger_condition()
{
	if(Npc_KnowsInfo(other,dia_pepe_hallo))
	{
		return TRUE;
	};
};

func void dia_pepe_danger_info()
{
	AI_Output(other,self,"DIA_Pepe_Danger_15_00");	//Co je tak nebezpe�n�ho na pastvin�?
	AI_Output(self,other,"DIA_Pepe_Danger_03_01");	//Po okol� se tu potuluje sme�ka vlk�. Posledn� dobou sem ty zatracen� bestie p�ich�zej se�rat n�kterou z mejch ovc� skoro ka�dej den.
	AI_Output(self,other,"DIA_Pepe_Danger_03_02");	//Je�t� p�ed p�r dny jsem m�l dvakr�t tolik ovc�. Nechci ani pomyslet na to, co se mnou Onar ud�l�, a� na to p�ijde.
};


instance DIA_PEPE_WHYNOTSLD(C_INFO)
{
	npc = bau_912_pepe;
	nr = 3;
	condition = dia_pepe_whynotsld_condition;
	information = dia_pepe_whynotsld_info;
	permanent = FALSE;
	description = "Pro� jsi o t�ch vlc�ch ne�ekl �old�k�m? M�l jsem dojem, �e pro v�s pracuj�.";
};


func int dia_pepe_whynotsld_condition()
{
	if(Npc_KnowsInfo(other,dia_pepe_danger) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_pepe_whynotsld_info()
{
	AI_Output(other,self,"DIA_Pepe_WhyNotSLD_15_00");	//Pro� jsi o t�ch vlc�ch ne�ekl �old�k�m? M�l jsem dojem, �e pro v�s pracuj�.
	AI_Output(self,other,"DIA_Pepe_WhyNotSLD_03_01");	//Jo, j� vim. M�l jsem to ud�lat. Ale nestalo se, sakra.
	AI_Output(self,other,"DIA_Pepe_WhyNotSLD_03_02");	//A te�, kdy� je tolik ovc� pry�, m�m strach o tom n�komu cokoli ��ct.
	AI_Output(other,self,"DIA_Pepe_WhyNotSLD_15_03");	//Ale pr�v� jsi to �ekl MN�.
	AI_Output(self,other,"DIA_Pepe_WhyNotSLD_03_04");	//(zlostn�) U� toho taky lituju.
};


instance DIA_PEPE_KILLWOLVES(C_INFO)
{
	npc = bau_912_pepe;
	nr = 4;
	condition = dia_pepe_killwolves_condition;
	information = dia_pepe_killwolves_info;
	permanent = FALSE;
	description = "Co kdy� ty vlky zabiju?";
};


func int dia_pepe_killwolves_condition()
{
	if(Npc_KnowsInfo(other,dia_pepe_danger))
	{
		return TRUE;
	};
};

func void dia_pepe_killwolves_info()
{
	AI_Output(other,self,"DIA_Pepe_KillWolves_15_00");	//Co kdy� ty vlky zabiju?
	AI_Output(self,other,"DIA_Pepe_KillWolves_03_01");	//(posm�n�) Ty? A s�m? Ha ha. Tomu nev���m. To d��v uv��il tomu, �e to ud�l� m�j chlebod�rce.
	AI_Output(other,self,"DIA_Pepe_KillWolves_15_02");	//Zapome� na to. Byl to jen n�vrh. Zajdu za chlapama a uvid�m, co tomu �eknou ONI.
	AI_Output(self,other,"DIA_Pepe_KillWolves_03_03");	//(vyd�en�) Po�kej chvilku. Fajn, fajn! Ehm... Jsi nejv�t�� ze v�ech nejv�t��ch a klidn� zvl�dne� sto vlk� najednou. ��dn� probl�m!
	AI_Output(self,other,"DIA_Pepe_KillWolves_03_04");	//Nej�ast�ji se skr�vaj� mezi stromy pobl� pastviny. (stranou) M�m dojem, �e jsou jen �ty�i.
	AI_StopProcessInfos(self);
	Wld_InsertNpc(pepes_ywolf1,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_01");
	Wld_InsertNpc(pepes_ywolf2,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_02");
	Wld_InsertNpc(pepes_ywolf3,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_03");
	Wld_InsertNpc(pepes_ywolf4,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_04");
	MIS_PEPE_KILLWOLVES = LOG_RUNNING;
	Log_CreateTopic(TOPIC_PEPEWOLVES,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PEPEWOLVES,LOG_RUNNING);
	b_logentry(TOPIC_PEPEWOLVES,"Pepeho ovce ohro�uj� �ty�i vlci. M�l bych je zahnat. ");
};


instance DIA_PEPE_KILLEDWOLVES(C_INFO)
{
	npc = bau_912_pepe;
	nr = 5;
	condition = dia_pepe_killedwolves_condition;
	information = dia_pepe_killedwolves_info;
	permanent = TRUE;
	description = "Odd�lal jsem ty vlky.";
};


func int dia_pepe_killedwolves_condition()
{
	if(MIS_PEPE_KILLWOLVES == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_pepe_killedwolves_info()
{
	AI_Output(other,self,"DIA_Pepe_KilledWolves_15_00");	//Odd�lal jsem ty vlky.
	if(Npc_IsDead(pepes_ywolf1) && Npc_IsDead(pepes_ywolf2) && Npc_IsDead(pepes_ywolf3) && Npc_IsDead(pepes_ywolf4))
	{
		AI_Output(self,other,"DIA_Pepe_KilledWolves_03_01");	//(u�asle) Dok�zals to! D�ky Innosovi!
		AI_Output(self,other,"DIA_Pepe_KilledWolves_03_02");	//Ale je�t� po��d nev�m, jak ��ct Onarovi, �e p�i�el o tolik ovc�.
		AI_Output(self,other,"DIA_Pepe_KilledWolves_03_03");	//(pro sebe) V�echno je to chyba toho zatracen�ho Bullca!
		MIS_PEPE_KILLWOLVES = LOG_SUCCESS;
		b_giveplayerxp(XP_PEPEWOLVES);
	}
	else
	{
		AI_Output(self,other,"DIA_Pepe_KilledWolves_03_04");	//Ned�lej si ze m� bl�zny. Ty bestie je�t� nejsou v�echny mrtv�.
	};
};


instance DIA_PEPE_BULLCO(C_INFO)
{
	npc = bau_912_pepe;
	nr = 5;
	condition = dia_pepe_bullco_condition;
	information = dia_pepe_bullco_info;
	permanent = FALSE;
	description = "Cos to ��kal o tom Bullcovi?";
};


func int dia_pepe_bullco_condition()
{
	if((MIS_PEPE_KILLWOLVES == LOG_SUCCESS) && !Npc_IsDead(bullco) && (KAPITEL <= 3))
	{
		return TRUE;
	};
};

func void dia_pepe_bullco_info()
{
	AI_Output(other,self,"DIA_Pepe_Bullco_15_00");	//Cos to ��kal o tom Bullcovi?
	AI_Output(self,other,"DIA_Pepe_Bullco_03_01");	//Je to jeden ze �old�k�. Je to vlastn� jeho pr�ce, hl�dat pastviny.
	AI_Output(self,other,"DIA_Pepe_Bullco_03_02");	//Ale m�sto toho se se sv�m k�mo�em Sylviem jen cel� dny fl�kaj kolem Thekly v kuchyni.
	AI_Output(self,other,"DIA_Pepe_Bullco_03_03");	//Je to chyba t�ch bastard�, �e kv�li t�m ovc�m nedostanu tejdenn� mzdu.
	AI_Output(self,other,"DIA_Pepe_Bullco_03_04");	//Kdybych mu alespo� mohl za to d�t do zub�. Ale proti n�mu nikdo nem� ��dnou �anci. Ten chlap je zabij�k.
	MIS_PEPE_KICKBULLCO = LOG_RUNNING;
	Log_CreateTopic(TOPIC_KICKBULLCO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KICKBULLCO,LOG_RUNNING);
	b_logentry(TOPIC_KICKBULLCO,"Bullco se m�l o Pepeho ovce l�p starat. Pepe te� chce n�komu d�t po��dn� za vyu�enou.");
};


instance DIA_PEPE_BULLCODEFEATED(C_INFO)
{
	npc = bau_912_pepe;
	nr = 5;
	condition = dia_pepe_bullcodefeated_condition;
	information = dia_pepe_bullcodefeated_info;
	permanent = FALSE;
	description = "Bullco dostal, co si zaslou�il. Postaral jsem se o to.";
};


func int dia_pepe_bullcodefeated_condition()
{
	if(MIS_PEPE_KICKBULLCO == LOG_RUNNING)
	{
		if((bullco.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (djg_bullco.aivar[AIV_DEFEATEDBYPLAYER] == TRUE))
		{
			return TRUE;
		};
	};
};

func void dia_pepe_bullcodefeated_info()
{
	AI_Output(other,self,"DIA_Pepe_BullcoDefeated_15_00");	//Bullco dostal, co si zaslou�il. Postaral jsem se o to.
	AI_Output(self,other,"DIA_Pepe_BullcoDefeated_03_01");	//Ta svin� si to zaslou�ila.
	MIS_PEPE_KICKBULLCO = LOG_SUCCESS;
	b_giveplayerxp(XP_KICKBULLCO);
};


instance DIA_PEPE_PERM(C_INFO)
{
	npc = bau_912_pepe;
	nr = 6;
	condition = dia_pepe_perm_condition;
	information = dia_pepe_perm_info;
	permanent = TRUE;
	description = "Jak se m�? A co tvoje ovce?";
};


func int dia_pepe_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_pepe_hallo))
	{
		return TRUE;
	};
};

func void dia_pepe_perm_info()
{
	AI_Output(other,self,"DIA_Pepe_PERM_15_00");	//Jak se m�? A co tvoje ovce?
	if(KAPITEL <= 1)
	{
		AI_Output(self,other,"DIA_Pepe_PERM_03_01");	//V pohod�. A stejn� tak ovce. Ty, co tu po��d je�t� jsou, se maj� dob�e.
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_Pepe_PERM_03_02");	//Fajn. Ale ty vlci se jednou vr�t�j. A asi jich bude je�t� v�c!
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_Pepe_PERM_03_03");	//Sly�el jsem hodn� divn� v�ci. N�jak� hroziv� vypadaj�c� postavy otravuj� u Sekoba. Obkl��ily jeho d�m.
	};
	if(KAPITEL >= 4)
	{
		AI_Output(self,other,"DIA_Pepe_PERM_03_04");	//Sly�el jsem, �e se na Lobartov� farm� rozvaluj� n�jac� �old�ci. N�kdo by jim mo�n� m�l pomoct.
	};
};


instance DIA_PEPE_LIESEL(C_INFO)
{
	npc = bau_912_pepe;
	nr = 7;
	condition = dia_pepe_liesel_condition;
	information = dia_pepe_liesel_info;
	permanent = FALSE;
	description = "M��u si koupit ovci?";
};


func int dia_pepe_liesel_condition()
{
	if(Npc_KnowsInfo(hero,dia_pepe_hallo))
	{
		return TRUE;
	};
};

func void dia_pepe_liesel_info()
{
	AI_Output(other,self,"DIA_Pepe_Liesel_15_00");	//M��u si koupit ovci?
	AI_Output(self,other,"DIA_Pepe_Liesel_03_01");	//Kdykoli, kdy� za ni d� dost pen�z. Jedna ovce stoj� 100 zlat�ch.
	AI_Output(self,other,"DIA_Pepe_Liesel_03_02");	//Kdy� zaplat�, m��e� si ovci vz�t. Ale mus� se o ni dob�e postarat.
};


var int pepe_schafgekauft;

instance DIA_PEPE_BUYLIESEL(C_INFO)
{
	npc = bau_912_pepe;
	nr = 8;
	condition = dia_pepe_buyliesel_condition;
	information = dia_pepe_buyliesel_info;
	permanent = TRUE;
	description = "Tady je 100 zlat�ch. Tak mi dej ovci.";
};


func int dia_pepe_buyliesel_condition()
{
	if(Npc_KnowsInfo(other,dia_pepe_liesel))
	{
		return TRUE;
	};
};

func void dia_pepe_buyliesel_info()
{
	AI_Output(other,self,"DIA_Pepe_BuyLiesel_15_00");	//Tady je 100 zlat�ch. Tak mi dej ovci.
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		if(PEPE_SCHAFGEKAUFT == 0)
		{
			AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_01");	//Fajn. Tak si vezmi Betsy - najde� ji na pastvin�.
			AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_02");	//Prost� �ekni, a� jde za tebou. Na ovci je docela chytr�. Starej se o ni dob�e!
		}
		else
		{
			AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_03");	//Zase? Fajn. Vezmi si Betsy.
			AI_Output(other,self,"DIA_Pepe_BuyLiesel_15_04");	//Betsy? Ale u� ta minul� ovce se jmenovala Betsy.
			AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_05");	//V�echny ovce se jmenuj� Betsy.
			if(PEPE_SCHAFGEKAUFT == 3)
			{
				AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_06");	//Samoz�ejm� krom� beran�.
				AI_Output(other,self,"DIA_Pepe_BuyLiesel_15_07");	//A jak se jmenuj� oni?
				AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_08");	//Bruce.
			};
		};
		PEPE_SCHAFGEKAUFT = PEPE_SCHAFGEKAUFT + 1;
		Wld_InsertNpc(follow_sheep,"NW_BIGFARM_SHEEP2_02");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_09");	//Nem� dost zlata. Nem��u ti tu ovci d�t levn�ji.
	};
};


instance DIA_PEPE_PICKPOCKET(C_INFO)
{
	npc = bau_912_pepe;
	nr = 900;
	condition = dia_pepe_pickpocket_condition;
	information = dia_pepe_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_pepe_pickpocket_condition()
{
	return c_beklauen(15,25);
};

func void dia_pepe_pickpocket_info()
{
	Info_ClearChoices(dia_pepe_pickpocket);
	Info_AddChoice(dia_pepe_pickpocket,DIALOG_BACK,dia_pepe_pickpocket_back);
	Info_AddChoice(dia_pepe_pickpocket,DIALOG_PICKPOCKET,dia_pepe_pickpocket_doit);
};

func void dia_pepe_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_pepe_pickpocket);
};

func void dia_pepe_pickpocket_back()
{
	Info_ClearChoices(dia_pepe_pickpocket);
};

