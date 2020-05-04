
instance DIA_GODAR_EXIT(C_INFO)
{
	npc = djg_711_godar;
	nr = 999;
	condition = dia_godar_exit_condition;
	information = dia_godar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_godar_exit_condition()
{
	return TRUE;
};

func void dia_godar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GODAR_HELLO(C_INFO)
{
	npc = djg_711_godar;
	nr = 4;
	condition = dia_godar_hello_condition;
	information = dia_godar_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_godar_hello_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_godar_hello_info()
{
	AI_Output(self,other,"DIA_Godar_Hello_13_00");	//He? Co?
};


instance DIA_GODAR_COMEFROM(C_INFO)
{
	npc = djg_711_godar;
	nr = 4;
	condition = dia_godar_comefrom_condition;
	information = dia_godar_comefrom_info;
	permanent = FALSE;
	description = "Odkud jsi p�i�el?";
};


func int dia_godar_comefrom_condition()
{
	return TRUE;
};

func void dia_godar_comefrom_info()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_15_00");	//Odkud jsi p�i�el?
	AI_Output(self,other,"DIA_Godar_ComeFrom_13_01");	//P�i�li jsme z... eh, z m�sta.
	Info_ClearChoices(dia_godar_comefrom);
	Info_AddChoice(dia_godar_comefrom,"Jste banditi!",dia_godar_comefrom_bandits);
	Info_AddChoice(dia_godar_comefrom,"Pro� jsme se p�edt�m ve m�st� nikdy nevid�li?",dia_godar_comefrom_notcity);
	Info_AddChoice(dia_godar_comefrom,"V�n�.",dia_godar_comefrom_understand);
};

func void dia_godar_comefrom_bandits()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_Bandits_15_00");	//Jste banditi!
	AI_Output(self,other,"DIA_Godar_ComeFrom_Bandits_13_01");	//Opatrn�! Bere� si p��li� velk� sousto!
	Info_ClearChoices(dia_godar_comefrom);
	Info_AddChoice(dia_godar_comefrom,"Kl�dek. Nechci v�s pr�sknout.",dia_godar_comefrom_bandits_keepcalm);
	Info_AddChoice(dia_godar_comefrom,"M� nevyd�s�.",dia_godar_comefrom_bandits_nofear);
};

func void dia_godar_comefrom_bandits_keepcalm()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_Bandits_KeepCalm_15_00");	//Kl�dek. Nechci v�s pr�sknout.
	AI_Output(self,other,"DIA_Godar_ComeFrom_Bandits_KeepCalm_13_01");	//V to douf�m. Ve tv�m vlastn�m z�jmu. Jinak jsi mrtv�!
	Info_ClearChoices(dia_godar_comefrom);
};

func void dia_godar_comefrom_bandits_nofear()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_Bandits_NoFear_15_00");	//M� nevyd�s�.
	AI_Output(self,other,"DIA_Godar_ComeFrom_Bandits_NoFear_13_01");	//Uvid�me.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_godar_comefrom_notcity()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_NotCity_15_00");	//Nikdy jsem t� ve m�st� nevid�l.
	AI_Output(self,other,"DIA_Godar_ComeFrom_NotCity_13_01");	//Nem��u vyst�t lidi, co strkaj nos do v�c�, do kterejch jim nic nen�, jasn�?
	Info_ClearChoices(dia_godar_comefrom);
	Info_AddChoice(dia_godar_comefrom,"Houby.",dia_godar_comefrom_notcity_cutthroat);
	Info_AddChoice(dia_godar_comefrom,"J� v�m, p�i�el jsi z m�sta.",dia_godar_comefrom_notcity_forget);
};

func void dia_godar_comefrom_notcity_forget()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_NotCity_Forget_15_00");	//J� v�m, p�i�el jsi z m�sta.
	AI_Output(self,other,"DIA_Godar_ComeFrom_NotCity_Forget_13_01");	//P�esn� tak.
	Info_ClearChoices(dia_godar_comefrom);
};

func void dia_godar_comefrom_notcity_cutthroat()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_NotCity_CutThroat_15_00");	//Houby.
	AI_Output(self,other,"DIA_Godar_ComeFrom_NotCity_CutThroat_13_01");	//Tak to bych to m�l do tebe nahustit.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_godar_comefrom_understand()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_Understand_15_00");	//Jasn�. Tak teda z m�sta.
	AI_Output(self,other,"DIA_Godar_ComeFrom_Understand_13_01");	//Hele! On rozum�!
	AI_Output(self,other,"DIA_Godar_ComeFrom_Understand_13_02");	//Tady, lokni si!
	CreateInvItems(self,itfo_beer,1);
	b_giveinvitems(self,other,itfo_beer,1);
	b_useitem(other,itfo_beer);
	Info_ClearChoices(dia_godar_comefrom);
};


instance DIA_GODAR_PLAN(C_INFO)
{
	npc = djg_711_godar;
	nr = 5;
	condition = dia_godar_plan_condition;
	information = dia_godar_plan_info;
	permanent = FALSE;
	description = "Co tady d�l�?";
};


func int dia_godar_plan_condition()
{
	return TRUE;
};

func void dia_godar_plan_info()
{
	AI_Output(other,self,"DIA_Godar_Plan_15_00");	//Co tady d�l�?
	AI_Output(self,other,"DIA_Godar_Plan_13_01");	//Zaslechli jsme o lovu drak�. Tak jsme si sbalili saky paky a p�i�li sem.
	AI_Output(self,other,"DIA_Godar_Plan_13_02");	//Ale abych byl up��mn�, o drac�ch nev�m ani prd. Chci jen z�skat trochu zlata.
	AI_Output(self,other,"DIA_Godar_Plan_13_03");	//Draci maj� zlato, nebo ne?
	AI_Output(other,self,"DIA_Godar_Plan_15_04");	//Samoz�ejm�.
};


instance DIA_GODAR_DRAGONLORE(C_INFO)
{
	npc = djg_711_godar;
	nr = 5;
	condition = dia_godar_dragonlore_condition;
	information = dia_godar_dragonlore_info;
	permanent = FALSE;
	description = "Co v� o t�ch drac�ch?";
};


func int dia_godar_dragonlore_condition()
{
	if(Npc_KnowsInfo(other,dia_godar_plan))
	{
		return TRUE;
	};
};

func void dia_godar_dragonlore_info()
{
	AI_Output(other,self,"DIA_Godar_DragonLore_15_00");	//Co v� o t�ch drac�ch?
	AI_Output(self,other,"DIA_Godar_DragonLore_13_01");	//Sly�el jsem jen poh�dky pro d�ti.
	AI_Output(self,other,"DIA_Godar_DragonLore_13_02");	//Zn� to, panny, zlato, ohniv� dech a takov� v�ci.
};


instance DIA_GODAR_DESTINATION(C_INFO)
{
	npc = djg_711_godar;
	nr = 5;
	condition = dia_godar_destination_condition;
	information = dia_godar_destination_info;
	permanent = FALSE;
	description = "Kam se chyst�te vyrazit?";
};


func int dia_godar_destination_condition()
{
	if(Npc_KnowsInfo(other,dia_godar_plan))
	{
		return TRUE;
	};
};

func void dia_godar_destination_info()
{
	AI_Output(other,self,"DIA_Godar_Destination_15_00");	//Kam se chyst�te vyrazit?
	AI_Output(self,other,"DIA_Godar_Destination_13_01");	//To netu��m. Je�t� jsme se nerozhodli.
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
		AI_Output(other,self,"DIA_Godar_Destination_15_02");	//M�li byste zaj�t na hrad.
		AI_Output(self,other,"DIA_Godar_Destination_13_03");	//Tam m� nikdo nedostane ani p�rem kon�. Ne k paladin�m.
		AI_Output(self,other,"DIA_Godar_Destination_13_04");	//Nem�m v �myslu vr�tit se do v�zen�. U� jsem tam jednou byl a docela mi to sta��.
	};
};


instance DIA_GODAR_ORKS(C_INFO)
{
	npc = djg_711_godar;
	nr = 5;
	condition = dia_godar_orks_condition;
	information = dia_godar_orks_info;
	permanent = FALSE;
	description = "A co sk�eti?";
};


func int dia_godar_orks_condition()
{
	if(Npc_KnowsInfo(other,dia_godar_destination))
	{
		return TRUE;
	};
};

func void dia_godar_orks_info()
{
	AI_Output(other,self,"DIA_Godar_Orks_15_00");	//A co sk�eti?
	AI_Output(self,other,"DIA_Godar_Orks_13_01");	//Obl�haj� cel� hrad. Nenechali jedinou skulinu.
	AI_Output(self,other,"DIA_Godar_Orks_13_02");	//Pokou�et se tam propl�it je naprost� nesmysl. Ani nemysli na to, �e by ses tam prosekal, jinak jsi mrtv� mu�.
	AI_Output(self,other,"DIA_Godar_Orks_13_03");	//Nikomu se je�t� nepoda�ilo tamtudy proj�t.
	AI_Output(other,self,"DIA_Godar_Orks_15_04");	//V�n�.
};


instance DIA_GODAR_PRISON(C_INFO)
{
	npc = djg_711_godar;
	nr = 5;
	condition = dia_godar_prison_condition;
	information = dia_godar_prison_info;
	permanent = FALSE;
	description = "Za co jsi sed�l?";
};


func int dia_godar_prison_condition()
{
	if(Npc_KnowsInfo(other,dia_godar_destination) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)))
	{
		return TRUE;
	};
};

func void dia_godar_prison_info()
{
	AI_Output(other,self,"DIA_Godar_Prison_15_00");	//Za co jsi sed�l?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Godar_Prison_13_01");	//Vypad�m snad, �e bych se ti to chystal vyklopit, co?
		AI_Output(self,other,"DIA_Godar_Prison_13_02");	//Vy m�gov� jste s paladiny ve spojen�. Ne ne, p��teli. Zapome� na to.
	}
	else
	{
		AI_Output(self,other,"DIA_Godar_Prison_13_03");	//Ty svin� m� zab�sli za pytla�en�. Kv�li dv�ma zav�ivenejm zaj�c�m!
		AI_Output(self,other,"DIA_Godar_Prison_13_04");	//Napa�ili mi za to 10 let.
		AI_Output(other,self,"DIA_Godar_Prison_15_05");	//A to bylo v�echno?
		AI_Output(self,other,"DIA_Godar_Prison_13_06");	//No, taky jsem se samoz�ejm� br�nil.
		AI_Output(other,self,"DIA_Godar_Prison_15_07");	//A?
		AI_Output(self,other,"DIA_Godar_Prison_13_08");	//Nemohl jsem nic d�lat, ten chl�pek zakopnul a zlomil si vaz. V�n�!
		Info_ClearChoices(dia_godar_prison);
		Info_AddChoice(dia_godar_prison,"To zn� pov�dom�.",dia_godar_prison_court);
		Info_AddChoice(dia_godar_prison,"Nem�l ses nechat chytit.",dia_godar_prison_pissoff);
	};
};

func void dia_godar_prison_court()
{
	AI_Output(other,self,"DIA_Godar_Prison_Court_15_00");	//To zn� pov�dom�.
	AI_Output(self,other,"DIA_Godar_Prison_Court_13_01");	//V�, co mysl�m. Ty bohat� bastardi nemaj� ani tucha, jak tu s n�ma zach�zeli.
	AI_Output(self,other,"DIA_Godar_Prison_Court_13_02");	//V�bec je to nezaj�malo.
	Info_ClearChoices(dia_godar_prison);
	GODARLIKESYOU = TRUE;
};

func void dia_godar_prison_pissoff()
{
	AI_Output(other,self,"DIA_Godar_Prison_Pissoff_15_00");	//Nem�l ses nechat chytit.
	AI_Output(self,other,"DIA_Godar_Prison_Pissoff_13_01");	//(vztekle) Vsad�m se, �es nikdy nebyl zav�enej, co?
	AI_Output(self,other,"DIA_Godar_Prison_Pissoff_13_02");	//Tak to bych ti m�l uk�zat, co se m��e tv�mu t�lu ve v�zen� st�t.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_GODAR_HUNTING(C_INFO)
{
	npc = djg_711_godar;
	nr = 5;
	condition = dia_godar_hunting_condition;
	information = dia_godar_hunting_info;
	permanent = FALSE;
	description = "M��e� m� nau�it n�co o lovu?";
};


func int dia_godar_hunting_condition()
{
	if(Npc_KnowsInfo(other,dia_godar_prison) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF)))
	{
		return TRUE;
	};
};

func void dia_godar_hunting_info()
{
	AI_Output(other,self,"DIA_Godar_Hunting_15_00");	//M��e� m� nau�it n�co o lovu?
	if(GODARLIKESYOU == FALSE)
	{
		AI_Output(self,other,"DIA_Godar_Hunting_13_01");	//To nemysl� v�n�, co? Zmizni!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Godar_Hunting_13_03");	//Ze zv��at se d� z�skat mnohem v�c ne� jen maso. Ko�e�iny a dr�py m��e� pak n�kde prodat. D� se na tom docela vyd�lat.
		AI_Output(self,other,"DIA_Godar_Hunting_13_04");	//U� se nem��u do�kat, a� si to rozd�m s drakem.
		GODAR_TEACHANIMALTROPHY = TRUE;
	};
};


instance DIA_GODAR_DRAGONSTUFF(C_INFO)
{
	npc = djg_711_godar;
	nr = 5;
	condition = dia_godar_dragonstuff_condition;
	information = dia_godar_dragonstuff_info;
	permanent = TRUE;
	description = "Uka� mi, jak vykuchat draka.";
};


var int godar_teachdragonstuff;

func int dia_godar_dragonstuff_condition()
{
	if((GODAR_TEACHANIMALTROPHY == TRUE) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)) && ((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONSCALE] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONBLOOD] == FALSE)) && (GODAR_TEACHDRAGONSTUFF == FALSE))
	{
		return TRUE;
	};
};

func void dia_godar_dragonstuff_info()
{
	AI_Output(other,self,"DIA_Godar_Dragonstuff_15_00");	//Uka� mi, jak vykuchat draka.
	AI_Output(self,other,"DIA_Godar_Dragonstuff_13_01");	//Chce� v�echny prachy pro sebe, co?
	AI_Output(self,other,"DIA_Godar_Dragonstuff_13_02");	//No dobr�, ale bude t� to st�t 1000 zlat�ch.
	Info_ClearChoices(dia_godar_dragonstuff);
	Info_AddChoice(dia_godar_dragonstuff,"Za tolik mi to nestoj�.",dia_godar_dragonstuff_nein);
	Info_AddChoice(dia_godar_dragonstuff,"To je f�r.",dia_godar_dragonstuff_fair);
};

func void dia_godar_dragonstuff_fair()
{
	AI_Output(other,self,"DIA_Godar_Dragonstuff_fair_15_00");	//To je f�r.
	if(b_giveinvitems(other,self,itmi_gold,1000))
	{
		GODAR_TEACHDRAGONSTUFF = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Godar_Dragonstuff_fair_13_01");	//Ne bez prach�. Nejd��v mi dej ty pen�ze.
	};
	Info_ClearChoices(dia_godar_dragonstuff);
};

func void dia_godar_dragonstuff_nein()
{
	AI_Output(other,self,"DIA_Godar_Dragonstuff_nein_15_00");	//Za tolik mi to nestoj�.
	AI_Output(self,other,"DIA_Godar_Dragonstuff_nein_13_01");	//Jak je libo.
	Info_ClearChoices(dia_godar_dragonstuff);
};


instance DIA_GODAR_TEACH(C_INFO)
{
	npc = djg_711_godar;
	nr = 5;
	condition = dia_godar_teach_condition;
	information = dia_godar_teach_info;
	permanent = TRUE;
	description = "Uka� mi, jak lovit.";
};


func int dia_godar_teach_condition()
{
	if((GODAR_TEACHANIMALTROPHY == TRUE) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)))
	{
		return TRUE;
	};
};

func void dia_godar_teach_info()
{
	AI_Output(other,self,"DIA_Godar_Teach_15_00");	//Uka� mi, jak lovit.
	if((Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSTING] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWING] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONSCALE] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONBLOOD] == FALSE))
	{
		Info_AddChoice(dia_godar_teach,DIALOG_BACK,dia_godar_teach_back);
		if(Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == FALSE)
		{
			Info_AddChoice(dia_godar_teach,b_buildlearnstring("Pl�en�",b_getlearncosttalent(other,NPC_TALENT_SNEAK,1)),dia_godar_teach_thief_sneak);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE)
		{
			Info_AddChoice(dia_godar_teach,b_buildlearnstring("Vyjmut� zub�",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_TEETH)),dia_godar_teach_trophys_teeth);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSTING] == FALSE)
		{
			Info_AddChoice(dia_godar_teach,b_buildlearnstring("�ihadlo krvav� mouchy",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFSTING)),dia_godar_teach_trophys_bfsting);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWING] == FALSE)
		{
			Info_AddChoice(dia_godar_teach,b_buildlearnstring("K��dla krvav� mouchy",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFWING)),dia_godar_teach_trophys_bfwing);
		};
		if(GODAR_TEACHDRAGONSTUFF == TRUE)
		{
			if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONSCALE] == FALSE)
			{
				Info_AddChoice(dia_godar_teach,b_buildlearnstring("Z�sk�n� dra��ch �upin",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DRAGONSCALE)),dia_godar_teach_trophys_dragonscale);
			};
			if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONBLOOD] == FALSE)
			{
				Info_AddChoice(dia_godar_teach,b_buildlearnstring("Z�sk�n� dra�� krve",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DRAGONBLOOD)),dia_godar_teach_trophys_dragonblood);
			};
		};
	}
	else
	{
		b_say(self,other,"$NOLEARNYOUREBETTER");
	};
};

func void dia_godar_teach_back()
{
	Info_ClearChoices(dia_godar_teach);
};

func void dia_godar_teach_trophys_teeth()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_TEETH))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_Teeth_13_00");	//Nejlep�� zp�sob, jak z�skat zuby, je za pomoci po��dn�ho no�e.
	};
	Info_ClearChoices(dia_godar_teach);
};

func void dia_godar_teach_trophys_bfsting()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_BFSTING))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_BFSting_13_00");	//Nejrychlej�� zp�sob, jak z�skat �ihadlo krvav� mouchy, je vym��knout ho dozadu p�ed t�m, ne� ho vy��zne�.
	};
	Info_ClearChoices(dia_godar_teach);
};

func void dia_godar_teach_trophys_bfwing()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_BFWING))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_BFWing_13_00");	//K��dla krvav�ch much jsou velmi k�ehk�. Tak�e a� je bude� od�ez�vat, mus� b�t opravdu opatrn�.
	};
	Info_ClearChoices(dia_godar_teach);
};

func void dia_godar_teach_thief_sneak()
{
	if(b_teachthieftalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_Sneak_13_00");	//Kdy� se chce� pl�it, nazuj si m�kk� boty. Tuh� podr�ka m��e nad�lat spoustu hluku.
	};
	Info_ClearChoices(dia_godar_teach);
};

func void dia_godar_teach_trophys_dragonscale()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_DRAGONSCALE))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_DragonScale_13_00");	//Abys mohl z draka dostat jeho �upiny, bude� pot�ebovat spoustu s�ly. Ale d� se to zvl�dnout.
	};
	Info_ClearChoices(dia_godar_teach);
};

func void dia_godar_teach_trophys_dragonblood()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_DRAGONBLOOD))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_DragonBlood_13_00");	//Najdi si na dra��m b�ichu m�kk� m�ste�ko. Tam roz��zni a vyextrahuj krev.
	};
	Info_ClearChoices(dia_godar_teach);
};


instance DIA_GODAR_ALLDRAGONSDEAD(C_INFO)
{
	npc = djg_711_godar;
	nr = 5;
	condition = dia_godar_alldragonsdead_condition;
	information = dia_godar_alldragonsdead_info;
	permanent = FALSE;
	description = "Zabil jsem v�echny draky.";
};


func int dia_godar_alldragonsdead_condition()
{
	if(MIS_ALLDRAGONSDEAD == TRUE)
	{
		return TRUE;
	};
};

func void dia_godar_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_Godar_AllDragonsDead_15_00");	//Zabil jsem v�echny draky.
	AI_Output(self,other,"DIA_Godar_AllDragonsDead_13_01");	//No a. Tady v �dol� n�m toho z�stalo je�t� spousta.
};


instance DIA_GODAR_PICKPOCKET(C_INFO)
{
	npc = djg_711_godar;
	nr = 900;
	condition = dia_godar_pickpocket_condition;
	information = dia_godar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_godar_pickpocket_condition()
{
	return c_beklauen(16,160);
};

func void dia_godar_pickpocket_info()
{
	Info_ClearChoices(dia_godar_pickpocket);
	Info_AddChoice(dia_godar_pickpocket,DIALOG_BACK,dia_godar_pickpocket_back);
	Info_AddChoice(dia_godar_pickpocket,DIALOG_PICKPOCKET,dia_godar_pickpocket_doit);
};

func void dia_godar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_godar_pickpocket);
};

func void dia_godar_pickpocket_back()
{
	Info_ClearChoices(dia_godar_pickpocket);
};

