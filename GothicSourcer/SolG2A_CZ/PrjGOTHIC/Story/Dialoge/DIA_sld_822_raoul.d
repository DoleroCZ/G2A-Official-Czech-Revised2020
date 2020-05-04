
instance DIA_RAOUL_EXIT(C_INFO)
{
	npc = sld_822_raoul;
	nr = 999;
	condition = dia_raoul_exit_condition;
	information = dia_raoul_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_raoul_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_raoul_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RAOUL_NOSENTENZA(C_INFO)
{
	npc = sld_822_raoul;
	nr = 1;
	condition = dia_raoul_nosentenza_condition;
	information = dia_raoul_nosentenza_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_raoul_nosentenza_condition()
{
	if(!Npc_KnowsInfo(other,dia_sentenza_hello) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_raoul_nosentenza_info()
{
	AI_Output(self,other,"DIA_Raoul_NoSentenza_01_00");	//Po�kej chv�li, k�mo!
	AI_Output(self,other,"DIA_Raoul_NoSentenza_01_01");	//Nev�iml jsem si, �e by t� Sentenza hledal.
	if(Hlp_IsValidNpc(sentenza) && !c_npcisdown(sentenza))
	{
		AI_Output(self,other,"DIA_Raoul_NoSentenza_01_02");	//SENTENZO! Poj� sem!
		AI_Output(self,other,"DIA_Raoul_NoSentenza_01_03");	//(fale�n� slu�n�) Chvilku strpen�, bude tu co by dup!
		AI_Output(self,other,"DIA_Raoul_NoSentenza_01_04");	//Pak t� ale �ek� nep��jemn� p�ekvapen�!
		b_attack(sentenza,other,AR_NONE,0);
	}
	else
	{
		AI_Output(self,other,"DIA_Raoul_NoSentenza_01_05");	//Kde tedy je? No, to nevad�, m�ls prost� kliku.
	};
	AI_StopProcessInfos(self);
};


instance DIA_RAOUL_HELLO(C_INFO)
{
	npc = sld_822_raoul;
	nr = 1;
	condition = dia_raoul_hello_condition;
	information = dia_raoul_hello_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_raoul_hello_condition()
{
	if((other.guild == GIL_NONE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_raoul_hello_info()
{
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Raoul_Hello_01_00");	//(znud�n�) Co chce�?
	}
	else
	{
		AI_Output(self,other,"DIA_Raoul_Hello_01_01");	//(otr�ven�) Co chce� te�?
	};
};


var int raoul_gesagt;

instance DIA_RAOUL_PERMNONE(C_INFO)
{
	npc = sld_822_raoul;
	nr = 1;
	condition = dia_raoul_permnone_condition;
	information = dia_raoul_permnone_info;
	permanent = TRUE;
	description = "Chci se trochu porozhl�dnout po farm�!";
};


func int dia_raoul_permnone_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_raoul_permnone_info()
{
	if(RAOUL_GESAGT == FALSE)
	{
		AI_Output(other,self,"DIA_Raoul_PERMNone_15_00");	//Chci se trochu porozhl�dnout po farm�!
		AI_Output(self,other,"DIA_Raoul_PERMNone_01_01");	//Do toho staven� nalevo rad�i necho�. Bydl� tam Sylvio a te� zrovna nem� nijak dobrou n�ladu.
		AI_Output(self,other,"DIA_Raoul_PERMNone_01_02");	//Kdy� naraz� na n�jak�ho slabocha, kter� nepat�� ke statku, mohlo by ho napadnout, �e by si na n�m mohl vyl�t vztek.
		RAOUL_GESAGT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Raoul_PERMNone_01_03");	//Tak si to u�ij!
		AI_StopProcessInfos(self);
	};
};


instance DIA_RAOUL_WANNAJOIN(C_INFO)
{
	npc = sld_822_raoul;
	nr = 2;
	condition = dia_raoul_wannajoin_condition;
	information = dia_raoul_wannajoin_info;
	permanent = FALSE;
	description = "Chci se p�idat k Leeovi!";
};


func int dia_raoul_wannajoin_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_raoul_wannajoin_info()
{
	AI_Output(other,self,"DIA_Raoul_WannaJoin_15_00");	//Chci se p�idat k Leeovi!
	AI_Output(self,other,"DIA_Raoul_WannaJoin_01_01");	//Jestli to bude takhle pokra�ovat, Lee u� za chv�li nebude m�t hlavn� slovo!
	AI_Output(other,self,"DIA_Raoul_WannaJoin_15_02");	//Co t�m mysl�?
	AI_Output(self,other,"DIA_Raoul_WannaJoin_01_03");	//Chce, abychom tu v�ichni sed�li s rukama v kl�n�. Jen tu a tam postra��me p�r sedl�k� a to je v�echno.
	AI_Output(self,other,"DIA_Raoul_WannaJoin_01_04");	//Sylvio naopak v�dycky ��k�, �e nejlep�� obrana je �tok, a m� sakra pravdu!
};


instance DIA_RAOUL_ABOUTSYLVIO(C_INFO)
{
	npc = sld_822_raoul;
	nr = 2;
	condition = dia_raoul_aboutsylvio_condition;
	information = dia_raoul_aboutsylvio_info;
	permanent = FALSE;
	description = "Kdo je Sylvio?";
};


func int dia_raoul_aboutsylvio_condition()
{
	if((RAOUL_GESAGT == TRUE) || Npc_KnowsInfo(other,dia_raoul_wannajoin))
	{
		return TRUE;
	};
};

func void dia_raoul_aboutsylvio_info()
{
	AI_Output(other,self,"DIA_Raoul_AboutSylvio_15_00");	//Kdo je Sylvio?
	AI_Output(self,other,"DIA_Raoul_AboutSylvio_01_01");	//Podle m� je to n� budouc� v�dce. Jestli se ho ale chce� zeptat, jestli se k n�m m��e� p�idat, tak na to rovnou zapome�!
	AI_Output(self,other,"DIA_Raoul_AboutSylvio_01_02");	//Vypad�, �e bys um�l leda tak p�st ovce.
};


instance DIA_RAOUL_STIMME(C_INFO)
{
	npc = sld_822_raoul;
	nr = 2;
	condition = dia_raoul_stimme_condition;
	information = dia_raoul_stimme_info;
	permanent = FALSE;
	description = "Nevadilo by ti, kdybych se tu stal �old�kem?";
};


func int dia_raoul_stimme_condition()
{
	if(self.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
	{
		return TRUE;
	};
};

func void dia_raoul_stimme_info()
{
	AI_Output(other,self,"DIA_Raoul_Stimme_15_00");	//Nevadilo by ti, kdybych se tu stal �old�kem?
	AI_Output(self,other,"DIA_Raoul_Stimme_01_01");	//�le, d�lej si, co chce�...
	Log_CreateTopic(TOPIC_SLDRESPEKT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SLDRESPEKT,LOG_RUNNING);
	b_logentry(TOPIC_SLDRESPEKT,"Raoul nem� nic proti tomu, abych se p�idal k �oldn���m.");
};


instance DIA_RAOUL_DUELL(C_INFO)
{
	npc = sld_822_raoul;
	nr = 2;
	condition = dia_raoul_duell_condition;
	information = dia_raoul_duell_info;
	permanent = TRUE;
	description = "J� mysl�m, �e bych ti m�l d�t p�r p�es dr�ku.";
};


func int dia_raoul_duell_condition()
{
	if((RAOUL_GESAGT == TRUE) || Npc_KnowsInfo(other,dia_raoul_aboutsylvio) || Npc_KnowsInfo(other,dia_jarvis_missionko))
	{
		return TRUE;
	};
};

func void dia_raoul_duell_info()
{
	AI_Output(other,self,"DIA_Raoul_Duell_15_00");	//J� mysl�m, �e bych ti m�l d�t p�r p�es dr�ku.
	AI_Output(self,other,"DIA_Raoul_Duell_01_01");	//Co?
	AI_Output(other,self,"DIA_Raoul_Duell_15_02");	//P�esn� to bys te� pot�eboval.
	AI_Output(self,other,"DIA_Raoul_Duell_01_03");	//Zat�m jsem k tob� byl asi a� moc mil�, co?
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_RAOUL_PERM(C_INFO)
{
	npc = sld_822_raoul;
	nr = 900;
	condition = dia_raoul_perm_condition;
	information = dia_raoul_perm_info;
	permanent = TRUE;
	description = "A co jinak. V�echno v po��dku?";
};


func int dia_raoul_perm_condition()
{
	if(other.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_raoul_perm_info()
{
	AI_Output(other,self,"DIA_Raoul_PERM_15_00");	//A co jinak. V�echno v po��dku?
	if(MIS_RAOUL_KILLTROLLBLACK == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Raoul_PERM_01_01");	//P�esta� �vanit a rad�i mi obstarej tu k��i z �ern�ho trola.
	}
	else
	{
		AI_Output(self,other,"DIA_Raoul_PERM_01_02");	//Sna�� se mi podlejzat, nebo co? Zmizni!
		if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
		{
			AI_Output(self,other,"DIA_Raoul_PERM_01_03");	//Nezapomn�l jsem, cos mi provedl.
		};
	};
};


instance DIA_RAOUL_TROLL(C_INFO)
{
	npc = sld_822_raoul;
	nr = 2;
	condition = dia_raoul_troll_condition;
	information = dia_raoul_troll_info;
	important = TRUE;
};


func int dia_raoul_troll_condition()
{
	if(hero.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_raoul_troll_info()
{
	AI_Output(self,other,"DIA_Raoul_TROLL_01_00");	//(cynicky) Jen se na to pod�vej!
	AI_Output(other,self,"DIA_Raoul_TROLL_15_01");	//Co chce�?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Raoul_TROLL_01_02");	//Ty ses p�idal k m�stsk�m �ebr�k�m? Skoro to tak vypad�.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Raoul_TROLL_01_03");	//Nemysli si, �e si t� te� budu v�it. To, �e jsi jedn�m z n�s, je�t� nic neznamen�.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Raoul_TROLL_01_04");	//Hraje� si na velk�ho m�ga, co?
	};
	AI_Output(self,other,"DIA_Raoul_TROLL_01_05");	//N�co ti pov�m. V�bec nesejde na tom, co m� zrovna na sob�. J� ti stejn� vid�m a� do �aludku.
	AI_Output(self,other,"DIA_Raoul_TROLL_01_06");	//Pro m� v�dycky nebude� nic v�c ne� �pinav� fl�ka�.
	Info_ClearChoices(dia_raoul_troll);
	Info_AddChoice(dia_raoul_troll,"U� mus�m j�t.",dia_raoul_troll_weg);
	Info_AddChoice(dia_raoul_troll,"Co m� za probl�m?",dia_raoul_troll_rechnung);
};

func void dia_raoul_troll_weg()
{
	AI_Output(other,self,"DIA_Raoul_TROLL_weg_15_00");	//U� mus�m j�t.
	AI_Output(self,other,"DIA_Raoul_TROLL_weg_01_01");	//Jo, vymajzni.
	AI_StopProcessInfos(self);
};

func void dia_raoul_troll_rechnung()
{
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_15_00");	//Co m� za probl�m?
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_01");	//Takov� jako ty moc dob�e zn�m. Maj� akor�t plnou hubu kec�.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_02");	//Nesn��m lidi, co d�laj� haura a kasaj� se, jak� hrdinsk� skutky vykonaj�.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_03");	//Zrovna v�era jsem tu jednomu chl�pkovi dal p�r do zub�, proto�e tvrdil, �e by �ern�ho trola sundal i s jednou rukou p�iv�zanou za z�dy.
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_15_04");	//A co?
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_05");	//(ost�e) Co mysl� t�m "a co"?
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_06");	//U� jsi n�kdy vid�l �ern�ho trola, ty velkohub� n�divo? M� v�bec pon�t�, jak obrovsk� potvora to je?
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_07");	//Kdy� se k n�mu p�ibl�� jen o krok v�c, ne� je zdr�vo, roztrh� t� na cucky.
	Info_ClearChoices(dia_raoul_troll);
	Info_AddChoice(dia_raoul_troll,"Nem�m z�jem.",dia_raoul_troll_rechnung_hastrecht);
	if(Npc_IsDead(troll_black))
	{
		Info_AddChoice(dia_raoul_troll,"U� jsem zabil toho �ern�ho trola.",dia_raoul_troll_rechnung_ich);
	}
	else
	{
		Info_AddChoice(dia_raoul_troll,"�ern� trol? ��dn� probl�m!",dia_raoul_troll_rechnung_noprob);
	};
};

func void b_raoul_blame()
{
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_00");	//Ty si o to ale p��mo koleduje�, co? M�l bych ti rovnou zakroutit krkem, ale m�m lep�� n�pad.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_01");	//Jestli jsi fakt tak dobr� bojovn�k, tak to doka�.
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_02");	//Co z toho budu m�t?
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_03");	//To je ale hloup� ot�zka. �est a nerozbitej cifern�k?
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_04");	//To teda nen� zrovna moc.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_05");	//No, �ekn�me, �e jestli mi p�inese� k��i �ern�ho trola, d�m ti p�knou hromadu pen�z. Co ty na to?
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_06");	//To u� je lep��.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_07");	//Tak na co �ek�?
	Log_CreateTopic(TOPIC_KILLTROLLBLACK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLTROLLBLACK,LOG_RUNNING);
	b_logentry(TOPIC_KILLTROLLBLACK,"Raoul ��d�, abych mu p�inesl k��i �ern�ho trola.");
	MIS_RAOUL_KILLTROLLBLACK = LOG_RUNNING;
	Info_ClearChoices(dia_raoul_troll);
};

func void dia_raoul_troll_rechnung_hastrecht()
{
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_hastrecht_15_00");	//Nem�m z�jem.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_hastrecht_01_01");	//To je pro tebe nejsp� lep��.
	Info_ClearChoices(dia_raoul_troll);
};

func void dia_raoul_troll_rechnung_ich()
{
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_ich_15_00");	//U� jsem zabil toho �ern�ho trola.
	b_raoul_blame();
};

func void dia_raoul_troll_rechnung_noprob()
{
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_noProb_15_00");	//�ern� trol? ��dn� probl�m!
	b_raoul_blame();
};


instance DIA_RAOUL_TROPHYFUR(C_INFO)
{
	npc = sld_822_raoul;
	nr = 3;
	condition = dia_raoul_trophyfur_condition;
	information = dia_raoul_trophyfur_info;
	permanent = TRUE;
	description = "Nejd��v mi prozra�, jak z trola tu k��i st�hnout.";
};


func int dia_raoul_trophyfur_condition()
{
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE) && (MIS_RAOUL_KILLTROLLBLACK == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_raoul_trophyfur_info()
{
	AI_Output(other,self,"DIA_Raoul_TrophyFur_15_00");	//Nejd��v mi prozra�, jak z trola tu k��i st�hnout.
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_FUR))
	{
		AI_Output(self,other,"DIA_Raoul_TrophyFur_01_01");	//Tak pozorn� poslouchej, tuhle radu ti d�m zadarmo.
		AI_Output(self,other,"DIA_Raoul_TrophyFur_01_02");	//Ka�dou nohu t� bestie opatrn� na��zne�...
		AI_Output(self,other,"DIA_Raoul_TrophyFur_01_03");	//...a pak j� st�hne� k��i a� k u��m. Je to na tebe moc slo�it� nebo co?
	};
};


instance DIA_RAOUL_TROLLFELL(C_INFO)
{
	npc = sld_822_raoul;
	nr = 3;
	condition = dia_raoul_trollfell_condition;
	information = dia_raoul_trollfell_info;
	description = "M�m u sebe tu k��i �ern�ho trola.";
};


func int dia_raoul_trollfell_condition()
{
	if(Npc_HasItems(other,itat_trollblackfur) && Npc_KnowsInfo(other,dia_raoul_troll))
	{
		return TRUE;
	};
};

func void dia_raoul_trollfell_info()
{
	AI_Output(other,self,"DIA_Raoul_TROLLFELL_15_00");	//M�m u sebe tu k��i �ern�ho trola.
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_01_01");	//To nen� mo�n�. Uka� mi ji.
	b_giveinvitems(other,self,itat_trollblackfur,1);
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_01_02");	//To je fakt neuv��iteln�. Co za ni chce�?
	AI_Output(other,self,"DIA_Raoul_TROLLFELL_15_03");	//Dej mi, co m�.
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_01_04");	//Fajn, d�m ti 500 zla��k� a t�i l��iv� lektvary, co ty na to?
	Info_ClearChoices(dia_raoul_trollfell);
	Info_AddChoice(dia_raoul_trollfell,"To nesta��.",dia_raoul_trollfell_nein);
	Info_AddChoice(dia_raoul_trollfell,"Plat�.",dia_raoul_trollfell_ja);
	MIS_RAOUL_KILLTROLLBLACK = LOG_SUCCESS;
	b_giveplayerxp(XP_RAOUL_KILLTROLLBLACK);
};

func void dia_raoul_trollfell_ja()
{
	AI_Output(other,self,"DIA_Raoul_TROLLFELL_ja_15_00");	//Plat�.
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_ja_01_01");	//T�ilo m�.
	CreateInvItems(self,itpo_health_03,3);
	b_giveinvitems(self,other,itpo_health_03,3);
	CreateInvItems(self,itmi_gold,500);
	b_giveinvitems(self,other,itmi_gold,500);
	Info_ClearChoices(dia_raoul_trollfell);
};

func void dia_raoul_trollfell_nein()
{
	AI_Output(other,self,"DIA_Raoul_TROLLFELL_nein_15_00");	//To nesta��.
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_nein_01_01");	//Jen si poslu�, j� si tu k��i stejn� nech�m.
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_nein_01_02");	//Nenech�m si mezi prsty proklouznout takovouhle �anci.
	MIS_RAOUL_DOESNTPAYTROLLFUR = LOG_RUNNING;
	AI_StopProcessInfos(self);
};


instance DIA_RAOUL_FELLZURUECK(C_INFO)
{
	npc = sld_822_raoul;
	nr = 3;
	condition = dia_raoul_fellzurueck_condition;
	information = dia_raoul_fellzurueck_info;
	permanent = TRUE;
	description = "Vra� mi tu trol� k��i.";
};


func int dia_raoul_fellzurueck_condition()
{
	if((MIS_RAOUL_DOESNTPAYTROLLFUR == LOG_RUNNING) && Npc_HasItems(self,itat_trollblackfur))
	{
		return TRUE;
	};
};

func void dia_raoul_fellzurueck_info()
{
	AI_Output(other,self,"DIA_Raoul_FELLZURUECK_15_00");	//Vra� mi tu trol� k��i.
	AI_Output(self,other,"DIA_Raoul_FELLZURUECK_01_01");	//Ne.
	AI_StopProcessInfos(self);
};


instance DIA_RAOUL_GOTTROLLFURBACK(C_INFO)
{
	npc = sld_822_raoul;
	nr = 3;
	condition = dia_raoul_gottrollfurback_condition;
	information = dia_raoul_gottrollfurback_info;
	description = "U� se m� nikdy nesna� o�kubat, rozum�?";
};


func int dia_raoul_gottrollfurback_condition()
{
	if((MIS_RAOUL_DOESNTPAYTROLLFUR == LOG_RUNNING) && (Npc_HasItems(self,itat_trollblackfur) == FALSE) && (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST))
	{
		return TRUE;
	};
};

func void dia_raoul_gottrollfurback_info()
{
	AI_Output(other,self,"DIA_Raoul_GotTrollFurBack_15_00");	//U� se m� nikdy nesna� o�kubat, rozum�?
	AI_Output(self,other,"DIA_Raoul_GotTrollFurBack_01_01");	//No jo. V� p�ece, jak to tady chod�, ne? Tak se uklidni.
	MIS_RAOUL_DOESNTPAYTROLLFUR = LOG_SUCCESS;
	AI_StopProcessInfos(self);
};


instance DIA_RAOUL_KAP3_EXIT(C_INFO)
{
	npc = sld_822_raoul;
	nr = 999;
	condition = dia_raoul_kap3_exit_condition;
	information = dia_raoul_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_raoul_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_raoul_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RAOUL_KAP4_EXIT(C_INFO)
{
	npc = sld_822_raoul;
	nr = 999;
	condition = dia_raoul_kap4_exit_condition;
	information = dia_raoul_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_raoul_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_raoul_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RAOUL_KAP5_EXIT(C_INFO)
{
	npc = sld_822_raoul;
	nr = 999;
	condition = dia_raoul_kap5_exit_condition;
	information = dia_raoul_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_raoul_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_raoul_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RAOUL_SHIP(C_INFO)
{
	npc = sld_822_raoul;
	nr = 2;
	condition = dia_raoul_ship_condition;
	information = dia_raoul_ship_info;
	description = "Necht�l by sis vyjet na mo�e?";
};


func int dia_raoul_ship_condition()
{
	if((KAPITEL >= 5) && (MIS_SCKNOWSWAYTOIRDORATH == TRUE))
	{
		return TRUE;
	};
};

func void dia_raoul_ship_info()
{
	AI_Output(other,self,"DIA_Raoul_Ship_15_00");	//Necht�l by sis vyjet na mo�e?
	AI_Output(self,other,"DIA_Raoul_Ship_01_01");	//Co m� v pl�nu? Chce� zabrat tu paladinskou lo�? (sm�je se)
	AI_Output(other,self,"DIA_Raoul_Ship_15_02");	//A co kdy� jo?
	AI_Output(self,other,"DIA_Raoul_Ship_01_03");	//(v�n�) Ty ses �pln� zbl�znil. Ne, d�ky, to nen� nic pro m�.
	AI_Output(self,other,"DIA_Raoul_Ship_01_04");	//Nem�m d�vod opustit Khorinis. Bu� si n�jak� prachy vyd�l�m tady, nebo na pevnin� - mn� to p�ijde pra�� jak uho�.
	AI_Output(self,other,"DIA_Raoul_Ship_01_05");	//Najdi si n�koho jin�ho.
	if(Npc_IsDead(torlof) == FALSE)
	{
		AI_Output(self,other,"DIA_Raoul_Ship_01_06");	//Zeptej se Torlofa. Pokud v�m, tak se po mo�i kdysi plavil.
	};
};


instance DIA_RAOUL_KAP6_EXIT(C_INFO)
{
	npc = sld_822_raoul;
	nr = 999;
	condition = dia_raoul_kap6_exit_condition;
	information = dia_raoul_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_raoul_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_raoul_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RAOUL_PICKPOCKET(C_INFO)
{
	npc = sld_822_raoul;
	nr = 900;
	condition = dia_raoul_pickpocket_condition;
	information = dia_raoul_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_raoul_pickpocket_condition()
{
	return c_beklauen(45,85);
};

func void dia_raoul_pickpocket_info()
{
	Info_ClearChoices(dia_raoul_pickpocket);
	Info_AddChoice(dia_raoul_pickpocket,DIALOG_BACK,dia_raoul_pickpocket_back);
	Info_AddChoice(dia_raoul_pickpocket,DIALOG_PICKPOCKET,dia_raoul_pickpocket_doit);
};

func void dia_raoul_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_raoul_pickpocket);
};

func void dia_raoul_pickpocket_back()
{
	Info_ClearChoices(dia_raoul_pickpocket);
};

