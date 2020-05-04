
instance DIA_ADDON_EROL_EXIT(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 999;
	condition = dia_addon_erol_exit_condition;
	information = dia_addon_erol_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_erol_exit_condition()
{
	return TRUE;
};

func void dia_addon_erol_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_EROL_PICKPOCKET(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 900;
	condition = dia_addon_erol_pickpocket_condition;
	information = dia_addon_erol_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_addon_erol_pickpocket_condition()
{
	return c_beklauen(43,42);
};

func void dia_addon_erol_pickpocket_info()
{
	Info_ClearChoices(dia_addon_erol_pickpocket);
	Info_AddChoice(dia_addon_erol_pickpocket,DIALOG_BACK,dia_addon_erol_pickpocket_back);
	Info_AddChoice(dia_addon_erol_pickpocket,DIALOG_PICKPOCKET,dia_addon_erol_pickpocket_doit);
};

func void dia_addon_erol_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_erol_pickpocket);
};

func void dia_addon_erol_pickpocket_back()
{
	Info_ClearChoices(dia_addon_erol_pickpocket);
};


instance DIA_ADDON_EROL_HALLO(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 5;
	condition = dia_addon_erol_hallo_condition;
	information = dia_addon_erol_hallo_info;
	description = "Co se d�je?";
};


func int dia_addon_erol_hallo_condition()
{
	return TRUE;
};

func void dia_addon_erol_hallo_info()
{
	AI_Output(other,self,"DIA_Addon_Erol_Hallo_15_00");	//Co se d�je?
	AI_Output(self,other,"DIA_Addon_Erol_Hallo_10_01");	//(rozmrzele) Co se d�je? Pod�vej se na ten nepo��dek tam pod mostem.
	AI_Output(self,other,"DIA_Addon_Erol_Hallo_10_02");	//(rozmrzele) Za cel� �ivot jsem nevid�l nic podobn�ho. N�kdo by je z tama m�l vykou�it, to ti �eknu.
};


instance DIA_ADDON_EROL_WHAT(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 5;
	condition = dia_addon_erol_what_condition;
	information = dia_addon_erol_what_info;
	description = "Co se stalo?";
};


func int dia_addon_erol_what_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_erol_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_erol_what_info()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_15_00");	//Co se stalo?
	AI_Output(self,other,"DIA_Addon_Erol_what_10_01");	//Byl jsem na cest�ch se sv�mi asistenty, kdy� n�jac� p��ern� mu�i sko�ili na m�j voz�k a ka�d�ho srazili dol�.
	AI_Output(self,other,"DIA_Addon_Erol_what_10_02");	//D�ky bohu se um�m trochu br�nit, a tak m� nedostali.
	Log_CreateTopic(TOPIC_ADDON_EROL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_EROL,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_EROL,"Obchodn�k Erol byl p�epaden bandity. Vzali mu ve�ker� jeho zbo��. Bandit� pod mostem nedaleko hospody U mrtv� harpyje st�le maj� jeho cenn� kamenn� desky. Erol by je cht�l z�skat zp�t");
	MIS_ADDON_EROL_BANDITSTUFF = LOG_RUNNING;
	Info_ClearChoices(dia_addon_erol_what);
	Info_AddChoice(dia_addon_erol_what,"To pod mostem je tv�?",dia_addon_erol_what_dein);
	Info_AddChoice(dia_addon_erol_what,"Co to bylo za mu�e?",dia_addon_erol_what_wer);
};

func void dia_addon_erol_what_back()
{
	Info_ClearChoices(dia_addon_erol_what);
};

func void dia_addon_erol_what_dein()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_dein_15_00");	//To pod mostem je tv�?
	AI_Output(self,other,"DIA_Addon_Erol_what_dein_10_01");	//K�ra, zbo��, prost� v�e.
	if(Npc_HasItems(other,itmi_erolskelch) > 0)
	{
		AI_Output(other,self,"DIA_Addon_Erol_what_dein_Add_15_00");	//Vzal jsem n�co ze tv�ho zbo�� ...
		AI_Output(self,other,"DIA_Addon_Erol_what_dein_Add_10_01");	//Nech si to. Nic z toho pro m� nem� ��dnou cenu.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Erol_what_dein_Add_10_02");	//Nic z toho pro m� nem� ��dnou cenu.
	};
	AI_Output(self,other,"DIA_Addon_Erol_what_dein_10_02");	//Jedinou pro m� nenahraditelnou v�c� jsou t�i kamenn� desky. Samoz�ejm�, �e mi je vzali.
	Info_AddChoice(dia_addon_erol_what,DIALOG_BACK,dia_addon_erol_what_back);
	Info_AddChoice(dia_addon_erol_what,"Kamenn� desky?",dia_addon_erol_what_was);
};

func void dia_addon_erol_what_was()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_Was_15_00");	//Kamenn� desky?
	AI_Output(self,other,"DIA_Addon_Erol_what_Was_10_01");	//M�gov� Vody ve m�st� je cht�j� ode m� koupit a j� jsem jim je sl�bil.
	AI_Output(self,other,"DIA_Addon_Erol_what_Was_10_02");	//Mus�m je m�t zp�t za ka�dou cenu, nebo velice po�kod� moji dobrou reputaci.
	Info_AddChoice(dia_addon_erol_what,"Kde jsi z�skal tyto kamenn� desky?",dia_addon_erol_what_woher);
	Info_AddChoice(dia_addon_erol_what,"Co s nimi cht�j� M�gov� vody d�lat?",dia_addon_erol_what_kdw);
};

func void dia_addon_erol_what_kdw()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_KDW_15_00");	//Co s nimi cht�j� m�gov� Vody d�lat?
	AI_Output(self,other,"DIA_Addon_Erol_what_KDW_10_01");	//Cht�j� je studovat a pov��ili m�, abych jim je p�inesl.
};

func void dia_addon_erol_what_woher()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_woher_15_00");	//Odkud m� tyto kamenn� desky?
	AI_Output(self,other,"DIA_Addon_Erol_what_woher_10_01");	//Na�el jsem je bl�zko star�ch budov vypadaj�c�ch jako mausolea a ostatn� v n�kter�ch jeskyn�ch.
	AI_Output(self,other,"DIA_Addon_Erol_what_woher_10_02");	//Do dnes jsem byl schopen dodat mnoho v�c�, o kter� m�gov� ��dali.
	AI_Output(self,other,"DIA_Addon_Erol_what_woher_10_03");	//Tady dole jsou celkem vz�cn�. Severov�chodn� od Khorinisu jsem jich ale na�el spoustu.
	Info_AddChoice(dia_addon_erol_what,"Pro� prost� nenajde� dal��?",dia_addon_erol_what_neue);
};

func void dia_addon_erol_what_neue()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_neue_15_00");	//Pro� prost� nenajde� dal��?
	AI_Output(self,other,"DIA_Addon_Erol_what_neue_10_01");	//Vyvrtnul jsem si kotn�k v boji s bandity.
	AI_Output(self,other,"DIA_Addon_Erol_what_neue_10_02");	//M��u chodit, ale nechci cestovat tak daleko se �patnou nohou.
};

func void dia_addon_erol_what_wer()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_wer_15_00");	//Co to bylo za mu�e?
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_01");	//Banditi. Kdo jin�? Sko�ili na m� z mostu.
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_02");	//Ka�d�, kdo chce p�ej�t most, je jimi okraden.
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_03");	//V�d�l jsem, �e jsou naho�e, proto jsem �el pod n�m.
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_04");	//Ale m�j voz�k a m� zbo�� asi vzbudily p��li� mnoho poku�en�, zd� se.
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_05");	//Ti bastardi sko�ili z mostu - p��mo na m�j voz�k.
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_06");	//Zkou�el jsem se za nimi v noci pl�it ...
};


instance DIA_ADDON_EROL_FERNANDOSWEAPONS(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 5;
	condition = dia_addon_erol_fernandosweapons_condition;
	information = dia_addon_erol_fernandosweapons_info;
	description = "Pot�ebuji informace o z�silk�ch zbran� bandit�m.";
};


func int dia_addon_erol_fernandosweapons_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_erol_what) && (MIS_VATRAS_FINDTHEBANDITTRADER == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_erol_fernandosweapons_info()
{
	AI_Output(other,self,"DIA_Addon_Erol_FernandosWeapons_15_00");	//Pot�ebuji informace o z�silk�ch zbran� bandit�m.
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_10_01");	//Z�silka zbran�? Jasn�, jedna tu je. N�jak� hajzl z m�sta jim prodal mnoho zbran�. Taktak je mohli odn�st.
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_10_02");	//N�kte�� z nich jsou i ti, kte�� na m� za�to�ili u mostu.
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_10_03");	//Ostatn� museli cestovat n�kam na pastvinu za Bengarovou farmou.
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_10_04");	//Mo�n� cht�li dos�hnout pr�smyku.
	Info_ClearChoices(dia_addon_erol_fernandosweapons);
	Info_AddChoice(dia_addon_erol_fernandosweapons,DIALOG_BACK,dia_addon_erol_fernandosweapons_back);
	Info_AddChoice(dia_addon_erol_fernandosweapons,"Kde je ta pastvina?",dia_addon_erol_fernandosweapons_bengar);
};

func void dia_addon_erol_fernandosweapons_bengar()
{
	AI_Output(other,self,"DIA_Addon_Erol_FernandosWeapons_bengar_15_00");	//Kde je ta pastvina?
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_bengar_10_01");	//P�ibli�n� uprost�ed ostrova Khorinis le�� Orlanova hospoda. Naz�v� se "U mrtv� harpyje".
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_bengar_10_02");	//Z tama vede cesta na jih. Tam n�kde je ta pastvina a pobl� tak� vchod do Hornick�ho �dol�.
	Info_ClearChoices(dia_addon_erol_fernandosweapons);
};

func void dia_addon_erol_fernandosweapons_back()
{
	Info_ClearChoices(dia_addon_erol_fernandosweapons);
};


instance DIA_ADDON_EROL_STONEPLATES(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 5;
	condition = dia_addon_erol_stoneplates_condition;
	information = dia_addon_erol_stoneplates_info;
	permanent = TRUE;
	description = "O kamenn�ch desk�ch ...";
};


func int dia_addon_erol_stoneplates_condition()
{
	if(MIS_ADDON_EROL_BANDITSTUFF == LOG_RUNNING)
	{
		return TRUE;
	};
};


var int stoneplatescounter;
const int ADDON_EROLSSTONEPLATESOFFER = 10;

func void dia_addon_erol_stoneplates_info()
{
	var int stoneplatescount;
	var int xp_addon_bringstoneplates;
	var int stoneplatesgeld;
	AI_Output(other,self,"DIA_Addon_Erol_Stoneplates_15_00");	//O kamenn�ch desk�ch ...
	if(Npc_HasItems(other,itwr_stoneplatecommon_addon) >= 1)
	{
		stoneplatescount = Npc_HasItems(other,itwr_stoneplatecommon_addon);
		if(stoneplatescount == 1)
		{
			AI_Output(other,self,"DIA_Addon_Erol_Stoneplates_15_01");	//M�m jednu z nich.
			b_giveplayerxp(XP_ADDON_BRINGSTONEPLATE);
			b_giveinvitems(other,self,itwr_stoneplatecommon_addon,1);
			STONEPLATESCOUNTER = STONEPLATESCOUNTER + 1;
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Erol_Stoneplates_15_02");	//M�m n�kter� z nich.
			if((stoneplatescount + STONEPLATESCOUNTER) >= 3)
			{
				b_giveinvitems(other,self,itwr_stoneplatecommon_addon,3 - STONEPLATESCOUNTER);
				xp_addon_bringstoneplates = (3 - STONEPLATESCOUNTER) * XP_ADDON_BRINGSTONEPLATE;
				STONEPLATESCOUNTER = 3;
			}
			else
			{
				b_giveinvitems(other,self,itwr_stoneplatecommon_addon,stoneplatescount);
				xp_addon_bringstoneplates = stoneplatescount * XP_ADDON_BRINGSTONEPLATE;
				STONEPLATESCOUNTER = STONEPLATESCOUNTER + stoneplatescount;
			};
			b_giveplayerxp(xp_addon_bringstoneplates);
		};
		AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_03");	//Velmi ti d�kuji.
		if(STONEPLATESCOUNTER == 1)
		{
			AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_04");	//U� pouze dv� chyb�.
		}
		else if(STONEPLATESCOUNTER == 2)
		{
			AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_05");	//U� jen jedna chyb�.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_06");	//To sta��, nyn� m��u dodr�et sv�j slib m�g�m Vody ve m�st� a pak j�t dom�.
			MIS_ADDON_EROL_BANDITSTUFF = LOG_SUCCESS;
			Wld_AssignRoomToGuild("grpwaldhuette01",GIL_PUBLIC);
		};
		AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_07");	//Zaplat�m ti za n�, samoz�ejm�.
		stoneplatesgeld = ADDON_EROLSSTONEPLATESOFFER * Npc_HasItems(self,itwr_stoneplatecommon_addon);
		CreateInvItems(self,itmi_gold,stoneplatesgeld);
		b_giveinvitems(self,other,itmi_gold,stoneplatesgeld);
		Npc_RemoveInvItems(self,itwr_stoneplatecommon_addon,Npc_HasItems(self,itwr_stoneplatecommon_addon));
		if(MIS_ADDON_EROL_BANDITSTUFF == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_08");	//Jdu dom�. Jestli chce�, tak se ke mn� m��e� p�idat.
			AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_09");	//Mo�n� ti budu schopen n�co prodat, kdy� se dostanu dom�.
			AI_StopProcessInfos(self);
			AI_UseMob(self,"BENCH",-1);
			AI_GotoWP(self,"NW_TAVERN_TO_FOREST_03");
			Npc_ExchangeRoutine(self,"Start");
			Wld_AssignRoomToGuild("grpwaldhuette01",GIL_PUBLIC);
		};
	}
	else if(c_schasmagicstoneplate() == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Erol_Stoneplates_15_10");	//A co tyhle?
		AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_11");	//Ne, tento druh kamenn�ch desek je magicky nabit�.
		AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_12");	//M�gov� Vody tyto bohu�el necht�j� koupit.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Erol_Stoneplates_15_13");	//Kolik ti jich chyb�?
		AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_14");	//Abych si zachr�nil svou reputaci ve m�st� u m�g� Vody, pot�ebuji 3 kamenn� desky.
	};
};


instance DIA_ADDON_EROL_BUERGER(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 5;
	condition = dia_addon_erol_buerger_condition;
	information = dia_addon_erol_buerger_info;
	description = "Jsi ob�anem m�sta?";
};


func int dia_addon_erol_buerger_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_erol_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_erol_buerger_info()
{
	AI_Output(other,self,"DIA_Addon_Erol_Buerger_15_00");	//Jsi ob�anem m�sta?
	AI_Output(self,other,"DIA_Addon_Erol_Buerger_10_01");	//U� ne dlouho, m�j synu. Nem�m r�d tyto zkorumpovan� lidi z Horn� �tvrti v Khorinisu.
	AI_Output(self,other,"DIA_Addon_Erol_Buerger_10_02");	//M�val jsem velk� vliv. Jen abys v�d�l. Ale to bylo p�ed mnoha m�s�ci.
};


instance DIA_ADDON_EROL_PRETEACH(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 5;
	condition = dia_addon_erol_preteach_condition;
	information = dia_addon_erol_preteach_info;
	description = "Tys dok�zal zahnat bandity?";
};


func int dia_addon_erol_preteach_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_erol_what))
	{
		return TRUE;
	};
};

func void dia_addon_erol_preteach_info()
{
	AI_Output(other,self,"DIA_Addon_Erol_PreTeach_15_00");	//Tys dok�zal zahnat bandity?
	AI_Output(self,other,"DIA_Addon_Erol_PreTeach_10_01");	//Ano. Jsem si jist, �e jsou st�le na most�.
	AI_Output(other,self,"DIA_Addon_Erol_PreTeach_15_02");	//M��e� mi uk�zat, jak ud��it tak tvrd� jako ty?
	AI_Output(self,other,"DIA_Addon_Erol_PreTeach_10_03");	//Jist�e m��u.
	EROL_ADDON_TEACHPLAYER = TRUE;
	Log_CreateTopic(TOPIC_OUTTEACHER,LOG_NOTE);
	b_logentry(TOPIC_OUTTEACHER,LOGTEXT_ADDON_EROL_TEACH);
};


instance DIA_ADDON_EROL_PRETRADE(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 100;
	condition = dia_addon_erol_pretrade_condition;
	information = dia_addon_erol_pretrade_info;
	permanent = TRUE;
	description = "Uka� mi sv� zbo��.";
};


func int dia_addon_erol_pretrade_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_erol_what) && (Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01") > 2000))
	{
		return TRUE;
	};
};

func void dia_addon_erol_pretrade_info()
{
	b_say(other,self,"$TRADE_2");
	AI_Output(self,other,"DIA_Addon_Erol_PreTrade_10_00");	//Nem��u ti nic prodat, v�echno, co jsem m�l, le�� pod mostem.
	AI_Output(self,other,"DIA_Addon_Erol_PreTrade_10_01");	//M��u za��t prod�vat znova, a� se vr�t�m dom�.
	if(MIS_ADDON_EROL_BANDITSTUFF != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Erol_PreTrade_10_02");	//Ale dokud nedostanu zp�t m� kamenn� desky, nem��u odsud odej�t.
	};
};


instance DIA_ADDON_EROL_SLD(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 5;
	condition = dia_addon_erol_sld_condition;
	information = dia_addon_erol_sld_info;
	description = "To je TV�J d�m?";
};


func int dia_addon_erol_sld_condition()
{
	if(Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01") < 2000)
	{
		return TRUE;
	};
};


var int erol_isathome;

func void dia_addon_erol_sld_info()
{
	AI_Output(other,self,"DIA_Addon_Erol_SLD_15_00");	//(p�ekvapen�) To je TV�J d�m?
	AI_Output(self,other,"DIA_Addon_Erol_SLD_10_01");	//Ano. Pro�? Co je na tom �patn�ho?
	AI_Output(other,self,"DIA_Addon_Erol_SLD_15_02");	//Nem� probl�my se �old�ky?
	AI_Output(self,other,"DIA_Addon_Erol_SLD_10_03");	//Dokud jsem nevyru�oval je a jejich pr�ci, nech�vali m� napokoji.
	AI_Output(self,other,"DIA_Addon_Erol_SLD_10_04");	//Krom� toho, jsou tam m� dob�� z�kazn�ci a j� jsem jim zaplatil, aby dohl�dli na m�j majetek, zat�mco jsem pry�.
	b_giveplayerxp(XP_AMBIENT);
	if(EROL_ISATHOME == FALSE)
	{
		Npc_ExchangeRoutine(self,"HOME");
		EROL_ISATHOME = TRUE;
	};
};


instance DIA_ADDON_EROL_TRADE(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 100;
	condition = dia_addon_erol_trade_condition;
	information = dia_addon_erol_trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = "Uka� mi, co nab�z�.";
};


func int dia_addon_erol_trade_condition()
{
	if((MIS_ADDON_EROL_BANDITSTUFF == LOG_SUCCESS) && (Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01") < 3000))
	{
		return TRUE;
	};
};


var int dia_addon_erol_trade_onetime;

func void dia_addon_erol_trade_info()
{
	b_givetradeinv(self);
	b_say(other,self,"$TRADE_2");
	AI_Output(self,other,"DIA_Addon_Erol_Trade_10_00");	//Nab�dka nen� moc velk�.
	if(EROL_ISATHOME == FALSE)
	{
		Log_CreateTopic(TOPIC_OUTTRADER,LOG_NOTE);
		b_logentry(TOPIC_OUTTRADER,LOGTEXT_ADDON_EROLTRADE);
		Npc_ExchangeRoutine(self,"Home");
		EROL_ISATHOME = TRUE;
	};
};


instance DIA_ADDON_EROL_TEACH(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 99;
	condition = dia_addon_erol_teach_condition;
	information = dia_addon_erol_teach_info;
	permanent = TRUE;
	description = "Uka� mi, jak ude�it tvrd�ji.";
};


func int dia_addon_erol_teach_condition()
{
	if(EROL_ADDON_TEACHPLAYER == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_erol_teach_info()
{
	AI_Output(other,self,"DIA_Addon_Erol_Teach_15_00");	//Uka� mi jak ud��it tvrd�ji.
	if(MIS_ADDON_EROL_BANDITSTUFF != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Erol_Teach_10_01");	//Chci n�co vr�tit.
		AI_Output(self,other,"DIA_Addon_Erol_Teach_10_02");	//Pomoz mi zachr�nit mou reputaci t�m, �e mi vr�t� kamenn� desky.
		AI_Output(self,other,"DIA_Addon_Erol_Teach_10_03");	//A j� ti uk�u, jak l�pe vyu��t svou s�lu v souboji.
	}
	else if(EROL_BONUS == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Erol_Teach_Add_10_00");	//Dob�e, sleduj, zn�m jeden dobr� trik.
		AI_Output(self,other,"DIA_Addon_Erol_Teach_Add_10_01");	//Kdy� bouchne�, pou�ij s�lu cel�ho t�la, ne pouze pa�e.
		AI_Output(self,other,"DIA_Addon_Erol_Teach_Add_10_02");	//Oto� se bokem, nat�hni rameno dop�edu a sou�asn� vymr�ti svou pa�i.
		AI_Output(self,other,"DIA_Addon_Erol_Teach_Add_10_03");	//(sm�je se) Kdy� to ud�l� spr�vn�, pozn� ten rozd�l!
		b_raiseattribute(other,ATR_STRENGTH,1);
		EROL_BONUS = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Erol_Teach_Add_10_04");	//Jestli chce� b�t je�t� lep��, mus� na sob� je�t� v�ce pracovat ...
		Info_ClearChoices(dia_addon_erol_teach);
		Info_AddChoice(dia_addon_erol_teach,DIALOG_BACK,dia_addon_erol_teach_back);
		Info_AddChoice(dia_addon_erol_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_addon_erol_teach_str_1);
		Info_AddChoice(dia_addon_erol_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_addon_erol_teach_str_5);
	};
};

func void dia_addon_erol_teach_back()
{
	Info_ClearChoices(dia_addon_erol_teach);
};

func void dia_addon_erol_teach_str_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_MAX);
	Info_ClearChoices(dia_addon_erol_teach);
	Info_AddChoice(dia_addon_erol_teach,DIALOG_BACK,dia_addon_erol_teach_back);
	Info_AddChoice(dia_addon_erol_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_addon_erol_teach_str_1);
	Info_AddChoice(dia_addon_erol_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_addon_erol_teach_str_5);
};

func void dia_addon_erol_teach_str_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_MAX);
	Info_ClearChoices(dia_addon_erol_teach);
	Info_AddChoice(dia_addon_erol_teach,DIALOG_BACK,dia_addon_erol_teach_back);
	Info_AddChoice(dia_addon_erol_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_addon_erol_teach_str_1);
	Info_AddChoice(dia_addon_erol_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_addon_erol_teach_str_5);
};

