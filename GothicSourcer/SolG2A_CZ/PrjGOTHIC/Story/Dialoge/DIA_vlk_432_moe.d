
instance DIA_MOE_EXIT(C_INFO)
{
	npc = vlk_432_moe;
	nr = 999;
	condition = dia_moe_exit_condition;
	information = dia_moe_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_moe_exit_condition()
{
	return TRUE;
};

func void dia_moe_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MOE_PICKPOCKET(C_INFO)
{
	npc = vlk_432_moe;
	nr = 900;
	condition = dia_moe_pickpocket_condition;
	information = dia_moe_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_moe_pickpocket_condition()
{
	return c_beklauen(25,30);
};

func void dia_moe_pickpocket_info()
{
	Info_ClearChoices(dia_moe_pickpocket);
	Info_AddChoice(dia_moe_pickpocket,DIALOG_BACK,dia_moe_pickpocket_back);
	Info_AddChoice(dia_moe_pickpocket,DIALOG_PICKPOCKET,dia_moe_pickpocket_doit);
};

func void dia_moe_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_moe_pickpocket);
};

func void dia_moe_pickpocket_back()
{
	Info_ClearChoices(dia_moe_pickpocket);
};


instance DIA_MOE_HALLO(C_INFO)
{
	npc = vlk_432_moe;
	nr = 2;
	condition = dia_moe_hallo_condition;
	information = dia_moe_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_moe_hallo_condition()
{
	if((Npc_GetDistToNpc(self,other) <= ZIVILANQUATSCHDIST) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF) && (hero.guild != GIL_MIL) && (hero.guild != GIL_NOV) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void dia_moe_hallo_info()
{
	AI_Output(self,other,"DIA_Moe_Hallo_01_00");	//Hej ty, tebe nezn�m. Co tady chce�? M� nam��eno do hospody?
	Info_ClearChoices(dia_moe_hallo);
	Info_AddChoice(dia_moe_hallo,"Ne, nem�m nam��eno do hospody... (KONEC)",dia_moe_hallo_gehen);
	Info_AddChoice(dia_moe_hallo,"Aha, tak�e tohle je m�stn� n�levna.",dia_moe_hallo_witz);
	Info_AddChoice(dia_moe_hallo,"Jo, vad� ti to?",dia_moe_hallo_reizen);
};

func void dia_moe_hallo_gehen()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Gehen_15_00");	//Ne, nem�m nam��eno do hospody.
	AI_Output(self,other,"DIA_Moe_Hallo_Gehen_01_01");	//Jo, to bych �ekl. To je ale fuk - pr�v� proto m��eme j�t p��mo k v�ci.
	AI_Output(self,other,"DIA_Moe_Hallo_Gehen_01_02");	//Kdy� u� jsi tady, n�co ti nab�dnu. Dej mi 50 zla��k� a m��e� j�t d�l.
	AI_Output(self,other,"DIA_Moe_Hallo_Gehen_01_03");	//To je vstupn� do hospody.
	Info_ClearChoices(dia_moe_hallo);
	Info_AddChoice(dia_moe_hallo,"Uvid�me, jestli si to sam� mysl� i domobrana...",dia_moe_hallo_miliz);
	Info_AddChoice(dia_moe_hallo,"Na to zapome�, nedostane� ani m���k!",dia_moe_hallo_vergisses);
	Info_AddChoice(dia_moe_hallo,"No tak j� ti teda zaplat�m.",dia_moe_hallo_zahlen);
	Info_AddChoice(dia_moe_hallo,"Ale j� nechci j�t do hospody!",dia_moe_hallo_kneipe);
};

func void dia_moe_hallo_kneipe()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Kneipe_15_00");	//Ale j� do hospody v�bec nechci j�t!
	AI_Output(self,other,"DIA_Moe_Hallo_Kneipe_01_01");	//V�, d��v nebo pozd�ji chce do hospody ka�d�. Tak�e kdy� mi zaplat� hned, bude� to m�t pro p��t� z krku.
};

func void dia_moe_hallo_witz()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Witz_15_00");	//Ah�, tohle je p��stavn� n�levna? A j� si myslel, �e je to pal�c m�stodr��c�ho!
	AI_Output(self,other,"DIA_Moe_Hallo_Witz_01_01");	//Hele, nech si ty hloup� �pr�my, skr�ku, nebo bude� brzo �vejkat dla�ebn� kostky.
	Info_ClearChoices(dia_moe_hallo);
	Info_AddChoice(dia_moe_hallo,"Ch�pu, budu ti muset d�t p�r p�es dr�ku.",dia_moe_hallo_pruegel);
	Info_AddChoice(dia_moe_hallo,"Ty m� chce� dostat do mal�ru, co?",dia_moe_hallo_aerger);
	Info_AddChoice(dia_moe_hallo,"Uklidni se, chci si d�t jenom jedno pivo.",dia_moe_hallo_ruhig);
	Info_AddChoice(dia_moe_hallo,"Ale j� do hospody v�bec nechci j�t!",dia_moe_hallo_kneipe);
};

func void dia_moe_hallo_reizen()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Reizen_15_00");	//Jo, vad� ti to?
	AI_Output(self,other,"DIA_Moe_Hallo_Reizen_01_01");	//Tady nem� co pohled�vat, skr�ku.
	Info_ClearChoices(dia_moe_hallo);
	Info_AddChoice(dia_moe_hallo,"Ch�pu, budu ti muset d�t p�r p�es dr�ku.",dia_moe_hallo_pruegel);
	Info_AddChoice(dia_moe_hallo,"Ty m� chce� dostat do mal�ru, co?",dia_moe_hallo_aerger);
	Info_AddChoice(dia_moe_hallo,"Uklidni se, chci si d�t jenom jedno pivo.",dia_moe_hallo_ruhig);
};

func void dia_moe_hallo_miliz()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Miliz_15_00");	//Uvid�me, jestli si to sam� mysl� i domobrana.
	AI_Output(self,other,"DIA_Moe_Hallo_Miliz_01_01");	//(sm�je se) Nikdo z domobrany tady nen�. A v� pro�?
	AI_Output(self,other,"DIA_Moe_Hallo_Miliz_01_02");	//Proto�e tady jsi v p��stavn� �tvrti, skr�ku. Nikdo z domobrany se tu se mnou rv�t nebude.
	AI_Output(self,other,"DIA_Moe_Hallo_Miliz_01_03");	//V�t�inou jsou v�ichni nalezl� u '�erven� lucerny'. Tak vid� - jsme tu jen my dva. (zl� ��klebek)
};

func void dia_moe_hallo_pruegel()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Pruegel_15_00");	//Ch�pu. Ne� p�jdu d�l, budu t� muset st�hnout z k��e.
	AI_Output(self,other,"DIA_Moe_Hallo_Pruegel_01_01");	//Jen si to zkus, skr�ku. Uka�, co um�!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_moe_hallo_aerger()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Aerger_15_00");	//Ty m� chce� dostat do mal�ru, co?
	AI_Output(self,other,"DIA_Moe_Hallo_Aerger_01_01");	//Jo, v tom, jak dostat n�koho do mal�ru, jsem mistr. Tak�e se koukej br�nit, skr�ku!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_moe_hallo_ruhig()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Ruhig_15_00");	//Uklidni se, chci si d�t jenom jedno pivo.
	AI_Output(self,other,"DIA_Moe_Hallo_Ruhig_01_01");	//Fajn, ale vstupn� t� bude st�t 50 zla��k�. (�kleb� se)
	Info_ClearChoices(dia_moe_hallo);
	Info_AddChoice(dia_moe_hallo,"Na to zapome�, nedostane� ani m���k!",dia_moe_hallo_vergisses);
	Info_AddChoice(dia_moe_hallo,"No tak j� ti teda zaplat�m.",dia_moe_hallo_zahlen);
};

func void dia_moe_hallo_zahlen()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Zahlen_15_00");	//No tak j� ti teda zaplat�m.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Moe_Hallo_Zahlen_01_01");	//V�born�. A kdy� jsme to tak hezky vy�e�ili, te� mi m��e� d�t i to ostatn�, co m� u sebe.
		Info_ClearChoices(dia_moe_hallo);
		Info_AddChoice(dia_moe_hallo,"Na to zapome�, nedostane� ani m���k!",dia_moe_hallo_vergisses);
		Info_AddChoice(dia_moe_hallo,"OK, tohle je v�echno, co m�m.",dia_moe_hallo_alles);
	}
	else if(Npc_HasItems(hero,itmi_gold) > 9)
	{
		AI_Output(other,self,"DIA_Moe_Hallo_Zahlen_15_02");	//...ale j� u sebe nem�m tolik zla��k�.
		AI_Output(self,other,"DIA_Moe_Hallo_Zahlen_01_03");	//To nevad�, tak prost� naval v�echno, co m� u sebe.
		Info_ClearChoices(dia_moe_hallo);
		Info_AddChoice(dia_moe_hallo,"Na to zapome�, nedostane� ani m���k!",dia_moe_hallo_vergisses);
		Info_AddChoice(dia_moe_hallo,"OK, tohle je v�echno, co m�m.",dia_moe_hallo_alles);
	}
	else
	{
		AI_Output(other,self,"DIA_Moe_Hallo_Zahlen_15_04");	//...ale j� nem�m ani 10 zla��k�.
		AI_Output(self,other,"DIA_Moe_Hallo_Zahlen_01_05");	//Chlape, j� nem�m ani vindru.
		AI_Output(self,other,"DIA_Moe_Hallo_Zahlen_01_06");	//No dob�e - povzdech - m��e� j�t.
		AI_StopProcessInfos(self);
	};
};

func void dia_moe_hallo_vergisses()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Vergisses_15_00");	//Na to zapome�, nedostane� ani m���k!
	AI_Output(self,other,"DIA_Moe_Hallo_Vergisses_01_01");	//Pak si vezmu v�echno, co m� - jen co mi bude� le�et u nohou.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_moe_hallo_alles()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Alles_15_00");	//Fajn, tohle je v�echno, co m�m.
	b_giveinvitems(other,self,itmi_gold,Npc_HasItems(other,itmi_gold));
	AI_Output(self,other,"DIA_Moe_Hallo_Alles_01_01");	//Dobr�, to mi teda sta��. To jsem cel� j� - v�dycky velkorys�. (�kleb� se)
	AI_StopProcessInfos(self);
};


instance DIA_MOE_HARBOR(C_INFO)
{
	npc = vlk_432_moe;
	nr = 998;
	condition = dia_moe_harbor_condition;
	information = dia_moe_harbor_info;
	permanent = TRUE;
	description = "Ty se tady v p��stavu dost vyzn�, vi�?";
};


func int dia_moe_harbor_condition()
{
	return TRUE;
};

func void dia_moe_harbor_info()
{
	AI_Output(other,self,"DIA_Moe_Harbor_15_00");	//Ty se tady v p��stavu dost vyzn�, vi�?
	AI_Output(self,other,"DIA_Moe_Harbor_01_01");	//Jasn� v�c. Pro�?
	Info_ClearChoices(dia_moe_harbor);
	Info_AddChoice(dia_moe_harbor,DIALOG_BACK,dia_moe_harbor_back);
	Info_AddChoice(dia_moe_harbor,"Jak� je tu provoz lod�?",dia_moe_harbor_ship);
	Info_AddChoice(dia_moe_harbor,"Jak to, �e tu nevid�m nikoho z domobrany?",dia_moe_harbor_militia);
	Info_AddChoice(dia_moe_harbor,"O �em se tu asi tak nejv�c pov�d�?",dia_moe_harbor_rumors);
};

func void dia_moe_harbor_back()
{
	Info_ClearChoices(dia_moe_harbor);
};

func void dia_moe_harbor_ship()
{
	AI_Output(other,self,"DIA_Moe_Harbor_Ship_15_00");	//Jak� je tu provoz lod�?
	AI_Output(self,other,"DIA_Moe_Harbor_Ship_01_01");	//Jedin� lo�, kter� sem v posledn� dob� p�iplula, je ta paladinsk� gal�ra.
	AI_Output(self,other,"DIA_Moe_Harbor_Ship_01_02");	//Najde� ji tamhle za t�m �tesem na jihoz�pad�
};

func void dia_moe_harbor_militia()
{
	AI_Output(other,self,"DIA_Moe_Harbor_Militia_15_00");	//Jak to, �e tu nevid�m nikoho z domobrany?
	AI_Output(self,other,"DIA_Moe_Harbor_Militia_01_01");	//Netroufaj� si sem chodit - v�dycky si v�echno vy��d�me sami.
};

func void dia_moe_harbor_rumors()
{
	AI_Output(other,self,"DIA_Moe_Harbor_Rumors_15_00");	//O �em se tu asi tak nejv�c pov�d�?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_01");	//Nem�me r�di lidi, kte�� se moc vypt�vaj�. Zvl᚝ kdy� jsou to cizinci.
	}
	else if(KAPITEL == 2)
	{
		if(hero.guild == GIL_MIL)
		{
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_02");	//Coby - nic. V�echno je tu v klidu a pohod�.
		}
		else if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
		{
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_03");	//(nep�irozen�) Je to �patn�. �asy jsou zl�, ale v�ichni se sna��me z�stat �estn� a poctiv�.
			AI_Output(other,self,"DIA_Moe_Harbor_Rumors_15_04");	//Ned�lej si ze m� �oufky.
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_05");	//Jak si o mn� m��e� n�co takov�ho myslet? Te� ses m� teda hluboce dotkl.
		}
		else
		{
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_06");	//Je tu fakt horko. Lord Andre se u� n�jakou dobu sna�� strkat nos do v�c�, po kter�ch mu pranic nen�.
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_07");	//Ti nafoukanci nikdy nepochop�, jak to tady dole chod�.
		};
	}
	else if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET == LOG_SUCCESS)
		{
			if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
			{
				AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_08");	//My s t�m nem�me nic spole�n�ho.
				AI_Output(other,self,"DIA_Moe_Harbor_Rumors_15_09");	//S ��m?
				AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_10");	//S t�m paladinem, kter�ho tu zabili. Opravdu by ses o ty �old�ky nem�l starat - jenom t�m ma�� �as.
			}
			else
			{
				AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_11");	//V�m, �e s t�m nem� nic spole�n�ho, ale ta vra�da paladina v�echny urozen� d�entlmeny po��dn� vylekala.
				AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_12");	//Jestli ti m��u d�t p��telskou radu, tak zmiz z m�sta. Aspo� na chv�li.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_13");	//Kdy� vy�lo najevo, �e �old�ci s t�m paladinem nem�li nic spole�n�ho, domobrana si sem u� netrouf� ani vkro�it.
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_14");	//Mysl�m, �e se boj�, aby jim nikdo nerozbil dr�ku. Mn� osobn� to v�bec nevad�.
		};
	}
	else if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_15");	//Ned�je se tu absolutn� nic.
	}
	else
	{
		AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_16");	//Kone�n� ti nabub�el� paladinov� opustili p��stav. Bylo na�ase.
	};
};


instance DIA_MOE_LEHMARGELDEINTREIBEN(C_INFO)
{
	npc = vlk_432_moe;
	nr = 2;
	condition = dia_moe_lehmargeldeintreiben_condition;
	information = dia_moe_lehmargeldeintreiben_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_moe_lehmargeldeintreiben_condition()
{
	if((LEHMAR_GELDGELIEHEN_DAY <= (Wld_GetDay() - 2)) && (LEHMAR_GELDGELIEHEN != 0) && (RANGERHELP_LEHMARKOHLE == FALSE) && (lehmar.aivar[AIV_DEFEATEDBYPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_moe_lehmargeldeintreiben_info()
{
	AI_Output(self,other,"DIA_Moe_LEHMARGELDEINTREIBEN_01_00");	//Hej, ty tam! Lehmar t� zdrav�.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

