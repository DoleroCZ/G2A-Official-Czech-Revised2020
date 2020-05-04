
instance DIA_CORD_EXIT(C_INFO)
{
	npc = sld_805_cord;
	nr = 999;
	condition = dia_cord_exit_condition;
	information = dia_cord_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_cord_exit_condition()
{
	return TRUE;
};

func void dia_cord_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_CORD_MEETINGISRUNNING(C_INFO)
{
	npc = sld_805_cord;
	nr = 1;
	condition = dia_addon_cord_meetingisrunning_condition;
	information = dia_addon_cord_meetingisrunning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_addon_cord_meetingisrunning_condition()
{
	if(Npc_IsInState(self,zs_talk) && (RANGERMEETINGRUNNING == LOG_RUNNING))
	{
		return TRUE;
	};
};


var int dia_addon_cord_meetingisrunning_onetime;

func void dia_addon_cord_meetingisrunning_info()
{
	if(DIA_ADDON_CORD_MEETINGISRUNNING_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_MeetingIsRunning_14_00");	//V�tej v 'Kruhu Vody', brat�e.
		DIA_ADDON_CORD_MEETINGISRUNNING_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Cord_MeetingIsRunning_14_01");	//M�l bys j�t za Vatrasem ...
	};
	AI_StopProcessInfos(self);
};


instance DIA_CORD_HALLO(C_INFO)
{
	npc = sld_805_cord;
	nr = 2;
	condition = dia_cord_hallo_condition;
	information = dia_cord_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_cord_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (other.guild == GIL_NONE) && (RANGERMEETINGRUNNING != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_cord_hallo_info()
{
	AI_Output(self,other,"DIA_Cord_Hallo_14_00");	//Jestli m� probl�m s vlky nebo poln�mi �k�dci, tak si b� promluvit s jedn�m z na�ich mlad��ch �old�k�.
	AI_Output(self,other,"DIA_Cord_Hallo_14_01");	//M��e� ke mn� p�ij�t, a� se tu uk�ou paladinov�.
	if(SC_ISRANGER == FALSE)
	{
		AI_Output(other,self,"DIA_Cord_Hallo_15_02");	//Co?
		AI_Output(self,other,"DIA_Cord_Hallo_14_03");	//Kdykoliv n�kdo z v�s roln�k� p�ijde ke mn�, v�dycky se mluv� o vyvra�d�n� nevinn�ch tvor�.
		AI_Output(other,self,"DIA_Cord_Hallo_15_04");	//Nejsem roln�k.
		AI_Output(self,other,"DIA_Cord_Hallo_14_05");	//Hm? A co tedy potom chce�?
	};
};


var int cord_schonmalgefragt;

instance DIA_CORD_WANNAJOIN(C_INFO)
{
	npc = sld_805_cord;
	nr = 5;
	condition = dia_cord_wannajoin_condition;
	information = dia_cord_wannajoin_info;
	permanent = TRUE;
	description = "Cht�l bych se st�t �old�kem!";
};


func int dia_cord_wannajoin_condition()
{
	if((CORD_APPROVED == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void b_cord_bebetter()
{
	AI_Output(self,other,"DIA_Cord_WannaJoin_14_14");	//A proto�e ty sotva v�, jak se zach�z� se zbran�, �ekl bych, �e jsi tady na �patn�m m�st�!
};

func void dia_cord_wannajoin_info()
{
	AI_Output(other,self,"DIA_Cord_WannaJoin_15_00");	//Cht�l bych se st�t �old�kem!
	if(CORD_SCHONMALGEFRAGT == FALSE)
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_01");	//Vypad� sp� jako n�kdo, kdo se narodil pro pr�ci na poli, chlap�e.
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_02");	//Um� tedy ovl�dat zbra�?
		CORD_SCHONMALGEFRAGT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_03");	//U� jsi se zlep�il?
	};
	AI_Output(self,other,"DIA_Cord_WannaJoin_14_04");	//Tak�e um� ovl�dat jednoru�n� zbran�?
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_05");	//Nejsem v tom �patnej.
	}
	else
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_06");	//Noooo...
	};
	AI_Output(self,other,"DIA_Cord_WannaJoin_14_07");	//A um� ovl�dat obouru�n� zbran�?
	if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_08");	//Um�m s nimi zach�zet.
	}
	else
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_09");	//Ur�it� se zlep��m!
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0) || (Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0))
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_10");	//No, alespo� nejsi �plnej za��te�n�k. V po��dku. Budu t� volit.
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_11");	//Kdy� bude� pot�ebovat n�co dal��ho, m��e� se to nau�it ode mne.
		CORD_APPROVED = TRUE;
		b_giveplayerxp(XP_CORD_APPROVED);
		b_logentry(TOPIC_SLDRESPEKT,"Cordovu p��mluvu u� m�m v kapse.");
		Log_CreateTopic(TOPIC_SOLDIERTEACHER,LOG_NOTE);
		b_logentry(TOPIC_SOLDIERTEACHER,"Cord m� vycvi�� v pou��v�n� jedno- a obouru�n�ch zbran�.");
	}
	else
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_12");	//Jin�mi slovy: jsi mizernej zelen��!
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_13");	//Ka�d� �oldn�� se mus� spolehnout na sv� kamar�dy. Z�vis� na tom v�echny na�e �ivoty.
		b_cord_bebetter();
		Log_CreateTopic(TOPIC_CORDPROVE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_CORDPROVE,LOG_RUNNING);
		b_logentry(TOPIC_CORDPROVE,"Cord se za m� p�imluv� a� pot�, co se nau��m l�pe bojovat.");
	};
};


instance DIA_ADDON_CORD_YOUARERANGER(C_INFO)
{
	npc = sld_805_cord;
	nr = 2;
	condition = dia_addon_cord_youareranger_condition;
	information = dia_addon_cord_youareranger_info;
	description = "Sly�el jsem, �e jsi �lenem 'Kruhu Vody'.";
};


func int dia_addon_cord_youareranger_condition()
{
	if((RANGERHELP_GILDESLD == TRUE) && (CORD_SCHONMALGEFRAGT == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_cord_youareranger_info()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_15_00");	//Sly�el jsem, �e jsi �lenem "Kruhu Vody".
	if(SC_ISRANGER == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_14_01");	//Kterej idiot o tom nemohl dr�et hubu?
		if(SC_KNOWSCORDASRANGERFROMLEE == TRUE)
		{
			AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_15_02");	//Lee mi o tom �ekl.
		};
		if(SC_KNOWSCORDASRANGERFROMLARES == TRUE)
		{
			AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_15_03");	//Lares ti vzkazuje, abys mi pomohl, kdy� ti �eknu, �e '�iju pod jeho ochrann�mi k��dly'.
		};
	};
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_14_04");	//(povzdechne si) To vypad�, �e t� te� budu muset p�ijmout, �e?
	AI_Output(self,other,"DIA_Addon_Cord_Add_14_01");	//Dobr�, co pot�ebuje�?
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_14_06");	//A pozor na hubu. I kdy� nem�m radost, z toho, co jsi mi �ekl ...
	Info_ClearChoices(dia_addon_cord_youareranger);
	Info_AddChoice(dia_addon_cord_youareranger,"Pr�v� te� nic nepot�ebuji, ud�l�m si to posv�m.",dia_addon_cord_youareranger_nix);
	Info_AddChoice(dia_addon_cord_youareranger,"Chci tv� brn�n�.",dia_addon_cord_youareranger_ruestung);
	Info_AddChoice(dia_addon_cord_youareranger,"Chci tvou zbra�!",dia_addon_cord_youareranger_waffe);
	if(CORD_APPROVED == FALSE)
	{
		Info_AddChoice(dia_addon_cord_youareranger,"Nau� m�, jak bojovat.",dia_addon_cord_youareranger_kampf);
	};
	if(hero.guild == GIL_NONE)
	{
	};
	if(hero.guild == GIL_NONE)
	{
		Info_AddChoice(dia_addon_cord_youareranger,"Pomoz mi dostat se k �old�k�m.",dia_addon_cord_youareranger_sldaufnahme);
	};
};


var int cord_sc_dreist;

func void b_dia_addon_cord_youareranger_warn()
{
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_WARN_14_00");	//(hroz�) A necht�j b�t nadohled, pokud usly��m, �e jsi nedr�el jazyk za zuby. To ti ��k�m pouze jednou!
};

func void b_dia_addon_cord_youareranger_fresse()
{
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_FRESSE_14_00");	//(nazloben�) Dobr�, tady to m�. Za�el jsi p��li� daleko, toho bude� litovat.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
	CORD_RANGERHELP_GETSLD = FALSE;
	CORD_RANGERHELP_FIGHT = FALSE;
	TOPIC_END_RANGERHELPSLD = TRUE;
};

func void dia_addon_cord_youareranger_ruestung()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_ruestung_15_00");	//Chci tv� brn�n�.
	if(CORD_SC_DREIST == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_ruestung_14_01");	//Je�t� jednou to zkus� a bude� sb�rat zuby ze zem�.
		CORD_SC_DREIST = TRUE;
	}
	else
	{
		b_dia_addon_cord_youareranger_fresse();
	};
};

func void dia_addon_cord_youareranger_waffe()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_Add_15_00");	//Chci tvou zbra�!
	if(CORD_SC_DREIST == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_Add_14_03");	//(v�hru�n�)  Je to tak?
		AI_Output(self,other,"DIA_Addon_Cord_Add_14_02");	//(zub� se) �, spr�vn� ...
		CORD_SC_DREIST = TRUE;
	}
	else
	{
		b_dia_addon_cord_youareranger_fresse();
	};
};

func void dia_addon_cord_youareranger_weg()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_weg_15_00");	//R�d bych m�l tvou pozici na farm�.
	if(CORD_SC_DREIST == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_weg_14_01");	//Nezkou�ej ze m� ud�lat hlup�ka, k�mo, jinak ti zp�el�mu ka�dou kost v t�le.
		CORD_SC_DREIST = TRUE;
	}
	else
	{
		b_dia_addon_cord_youareranger_fresse();
	};
};


var int dia_addon_cord_youareranger_scgotoffer;

func void dia_addon_cord_youareranger_kampf()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_kampf_15_00");	//Nau� m� jak bojovat.
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_kampf_14_01");	//Dobr�, co d�l?
	CORD_RANGERHELP_FIGHT = TRUE;
	if(DIA_ADDON_CORD_YOUARERANGER_SCGOTOFFER == FALSE)
	{
		Info_AddChoice(dia_addon_cord_youareranger,"To sta��.",dia_addon_cord_youareranger_reicht);
		DIA_ADDON_CORD_YOUARERANGER_SCGOTOFFER = TRUE;
	};
};

func void dia_addon_cord_youareranger_sldaufnahme()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_SLDAufnahme_15_00");	//Mohl bys mi pomoct dostat se k �old�k�m?
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_SLDAufnahme_14_01");	//(sm�je se) �, to bude sranda. Dobr�, zkus�m to. Co d�l?
	CORD_RANGERHELP_GETSLD = TRUE;
	if(DIA_ADDON_CORD_YOUARERANGER_SCGOTOFFER == FALSE)
	{
		Info_AddChoice(dia_addon_cord_youareranger,"To sta��.",dia_addon_cord_youareranger_reicht);
		DIA_ADDON_CORD_YOUARERANGER_SCGOTOFFER = TRUE;
	};
};

func void dia_addon_cord_youareranger_gold()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_Gold_15_00");	//Zapla� mi a nebudu o tom mluvit.
	if(CORD_SC_DREIST == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_Gold_14_01");	//Sorry, ale j� se vyd�rat nenech�m ty bastarde.
		CORD_SC_DREIST = TRUE;
	}
	else
	{
		b_dia_addon_cord_youareranger_fresse();
	};
};

func void dia_addon_cord_youareranger_nix()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_nix_15_00");	//Pr�v� nic nepot�ebuji. Ud�l�m si v�e rad�ji s�m.
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_nix_14_01");	//Jak chce�. M�ls na v�b�r.
	b_dia_addon_cord_youareranger_warn();
	Info_ClearChoices(dia_addon_cord_youareranger);
};

func void dia_addon_cord_youareranger_reicht()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_reicht_15_00");	//To sta��.
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_reicht_14_01");	//H�d�m, �e to je.
	b_dia_addon_cord_youareranger_warn();
	Info_ClearChoices(dia_addon_cord_youareranger);
};


instance DIA_ADDON_CORD_RANGERHELP2GETSLD(C_INFO)
{
	npc = sld_805_cord;
	nr = 2;
	condition = dia_addon_cord_rangerhelp2getsld_condition;
	information = dia_addon_cord_rangerhelp2getsld_info;
	permanent = TRUE;
	description = "Pomoz mi st�t se �old�kem.";
};


var int dia_addon_cord_rangerhelp2getsld_noperm;

func int dia_addon_cord_rangerhelp2getsld_condition()
{
	if((CORD_RANGERHELP_GETSLD == TRUE) && (hero.guild == GIL_NONE) && (DIA_ADDON_CORD_RANGERHELP2GETSLD_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void b_cord_rangerhelpobsolete()
{
	AI_Output(other,self,"DIA_Addon_Cord_RangerHelpObsolete_15_00");	//Probl�m je vy�e�en.
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelpObsolete_14_01");	//Oh, to se pak st�v� obt�n�j��.
	AI_Output(other,self,"DIA_Addon_Cord_RangerHelpObsolete_15_02");	//Co t�m mysl�?
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelpObsolete_14_03");	//Dobr�, to znamen�, �e ti nem��u pomoct.
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelpObsolete_14_04");	//Nebo bys cht�l, abych bojoval s ka�d�m �old�kem jen proto, aby t� p�ijali?
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelpObsolete_14_05");	//Mus� to ud�lat s�m.
	DIA_ADDON_CORD_RANGERHELP2GETSLD_NOPERM = TRUE;
	TOPIC_END_RANGERHELPSLD = TRUE;
};

func void b_cord_comelaterwhendone()
{
	AI_Output(self,other,"DIA_Addon_Cord_ComeLaterWhenDone_14_00");	//Dobr�, zajdi pro to za n�m a vra� se, jakmile ti ji zad�.
	AI_StopProcessInfos(self);
};

func void b_cord_idoitforyou()
{
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_00");	//� ano. To je jednoduch�. Poslouchej, vra� se z�tra. To u� to budu m�t vy�e�en�.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_01");	//Jist�, ale r�d bych, kdyby si za to pro m� n�co ud�lal.
	AI_Output(other,self,"DIA_Addon_Cord_IDoItForYou_15_02");	//A co by to m�lo b�t?
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_03");	//Je tu mal� t�bor bandit� v hor�ch na jihov�chod odtud.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_04");	//P�jde� p��mo na jihov�chod odsud, m�l bys tam vid�t v�.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_05");	//Jeden z m�ch mu�� - Patrick - tam �el p�ed n�kolika dny. Cht�l s t�mi bastardy obchodovat.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_06");	//��kal jsem mu, aby tam nechodil, ale ten blbec m� neposlouchal.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_07");	//Mo�n� jim padl za ob�. Ale nev�m to jist�?
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_08");	//Zajde� tam a pod�v� se tam kv�li m�.
	b_logentry(TOPIC_ADDON_RANGERHELPSLD,"Cord se postar� o Torlofovu zkou�ku. Cord�v kamar�d Patrick se ztratil. P�jdu do t�bora bandit� nedaleko odsud na jihov�chod� a pod�v�m se, zda-li tam Patrick nen�.");
	Info_ClearChoices(dia_addon_cord_rangerhelp2getsld);
	Info_AddChoice(dia_addon_cord_rangerhelp2getsld,"Zapome� na to. �kol je mnohem t잚� ne� ten Torlof�v.",b_cord_idoitforyou_mist);
	Info_AddChoice(dia_addon_cord_rangerhelp2getsld,"A jak si mohu b�t jist, �e na m� neza�to��, jakmile m� uvid�?",b_cord_idoitforyou_dexter);
	DIA_ADDON_CORD_RANGERHELP2GETSLD_NOPERM = TRUE;
};

func void b_cord_idoitforyou_mist()
{
	AI_Output(other,self,"Dia_Addon_Cord_IDoItForYou_mist_15_00");	//Zapome� na to. �kol je mnohem t잚� ne� ten Torlof�v.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_mist_14_01");	//Neboj, takov� mal� lstiv� chlap�k se jim dozajista podez�el� zd�t nebude.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_mist_14_02");	//Taky to nemohu ud�lat s�m, proto�e jsem u� �old�k a na toho by za�to�ili.
};

func void b_cord_idoitforyou_dexter()
{
	AI_Output(other,self,"Dia_Addon_Cord_IDoItForYou_Dexter_15_00");	//A jak si mohu b�t jist, �e na m� neza�to��, jakmile m� uvid�?
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_Dexter_14_01");	//Proto�e zn�m jm�no jejich v�dce. Jeho jm�no je DEXTER. Prost� �ekne�, �e ho zn�.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_Dexter_14_02");	//To si pak ti chl�pci dvakr�t rozmysl�, ne� na tebe za�to��.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_Dexter_14_03");	//Samoz�ejm� to m��e b�t nebezpe�n� dobrodru�stv�.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_Dexter_14_04");	//Ale ty to n�jak zvl�dne�.
	Info_ClearChoices(dia_addon_cord_rangerhelp2getsld);
	b_logentry(TOPIC_ADDON_RANGERHELPSLD,"V�dce bandit� se jmenuje Dexter.");
	Log_CreateTopic(TOPIC_ADDON_MISSINGPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MISSINGPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MISSINGPEOPLE,"�old�k Cord hled� sv�ho p��tele Patricka.");
	MIS_ADDON_CORD_LOOK4PATRICK = LOG_RUNNING;
	RANGER_SCKNOWSDEXTER = TRUE;
};

func void dia_addon_cord_rangerhelp2getsld_info()
{
	AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_00");	//Pomoz mi st�t se �old�kem.
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelp2GetSLD_14_01");	//Pod�vej. Mus� ud�lat Torlofovu zkou�ku, jestli chce� proj�t. To je jist�.
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelp2GetSLD_14_02");	//U� jsi o tom �ekl Torlofovi?
	if(TORLOF_GO == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_03");	//Opravdu ne.
		b_cord_comelaterwhendone();
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_04");	//�, zkou�ka.
		AI_Output(self,other,"DIA_Addon_Cord_RangerHelp2GetSLD_14_05");	//Vid�m. A co p�esn� znamen� ten test?
		if((TORLOF_PROBEBESTANDEN == TRUE) || ((MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_RUNNING) && Npc_IsDead(rumbold) && Npc_IsDead(rick)) || ((MIS_TORLOF_HOLPACHTVONSEKOB == LOG_RUNNING) && ((sekob.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || Npc_IsDead(sekob))))
		{
			b_cord_rangerhelpobsolete();
		}
		else if(TORLOF_PROBE == 0)
		{
			AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_06");	//Je�t� jsem se k tomu nedostal.
			b_cord_comelaterwhendone();
		}
		else if(TORLOF_PROBE == PROBE_SEKOB)
		{
			AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_07");	//M�m vybrat n�jemn� od Sekoba.
			b_cord_idoitforyou();
		}
		else if(TORLOF_PROBE == PROBE_BENGAR)
		{
			AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_08");	//M�m se postarat o domobranu u Bengarovy farmy.
			b_cord_idoitforyou();
		}
		else
		{
			b_cord_rangerhelpobsolete();
		};
	};
};


instance DIA_ADDON_CORD_TALKEDTODEXTER(C_INFO)
{
	npc = sld_805_cord;
	nr = 5;
	condition = dia_addon_cord_talkedtodexter_condition;
	information = dia_addon_cord_talkedtodexter_info;
	description = "Byl jsem za t�m Dextrem.";
};


func int dia_addon_cord_talkedtodexter_condition()
{
	if(((bdt_1060_dexter.aivar[AIV_TALKEDTOPLAYER] == TRUE) || Npc_IsDead(bdt_1060_dexter)) && (MIS_ADDON_CORD_LOOK4PATRICK == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_cord_talkedtodexter_info()
{
	AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_00");	//Byl jsem za t�m Dextrem.
	AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_01");	//Dobr�, a?
	if(Npc_IsDead(bdt_1060_dexter))
	{
		AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_02");	//Je mrtev.
	};
	AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_03");	//Nicm�n� jsem nena�el ani stopu po tv�m p��teli Patrickovi.
	if(DEXTER_KNOWSPATRICK == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_04");	//Dexter si na n�j vzpomn�l, ale �ekl mi, �e nenav�t�vil t�bor.
		AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_05");	//A jsi si jist, �e ti Dexter nelhal?
		AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_06");	//Ne, to nejsem. Ale to jsou v�echny informace, kter� jsem byl schopen sehnat.
	};
	AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_07");	//Ten chlap prost� zmizel beze stopy.
	AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_08");	//Dobr�, dodr�el jsi svou ��st dohody ...
	MIS_ADDON_CORD_LOOK4PATRICK = LOG_SUCCESS;
	TOPIC_END_RANGERHELPSLD = TRUE;
	b_giveplayerxp(XP_ADDON_CORD_LOOK4PATRICK);
	AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_09");	//Co Torlof�v test?
	AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_10");	//Prost� se vra� k Torlofovi. Pova�uj test za zvl�dnut�. Jen mu �ekni, �e se o to postar�m.
	CORD_RANGERHELP_TORLOFSPROBE = TRUE;
	if(TORLOF_PROBE == PROBE_SEKOB)
	{
		MIS_TORLOF_HOLPACHTVONSEKOB = LOG_SUCCESS;
	}
	else if(TORLOF_PROBE == PROBE_BENGAR)
	{
		MIS_TORLOF_BENGARMILIZKLATSCHEN = LOG_SUCCESS;
	};
};


instance DIA_CORD_RETURNPATRICK(C_INFO)
{
	npc = sld_805_cord;
	nr = 8;
	condition = dia_cord_returnpatrick_condition;
	information = dia_cord_returnpatrick_info;
	permanent = FALSE;
	description = "Patrick se vr�til.";
};


func int dia_cord_returnpatrick_condition()
{
	if((Npc_GetDistToWP(patrick_nw,"NW_BIGFARM_PATRICK") <= 1000) && (MISSINGPEOPLERETURNEDHOME == TRUE))
	{
		return TRUE;
	};
};

func void dia_cord_returnpatrick_info()
{
	AI_Output(other,self,"DIA_Addon_Cord_ReturnPatrick_15_00");	//Patrick se vr�til.
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_01");	//�, ani jsem nev��il, �e ho je�t� n�kdy uvid�m. Ty ...
	AI_Output(other,self,"DIA_Addon_Cord_ReturnPatrick_15_02");	//Hej, ud�lej mi laskavost.
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_03");	//Ano?
	AI_Output(other,self,"DIA_Addon_Cord_ReturnPatrick_15_04");	//Uchra� m� sv�ho vd�ku.
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_05");	//Nepl�noval jsem ti d�kovat.
	AI_Output(other,self,"DIA_Addon_Cord_ReturnPatrick_15_06");	//Dob�e ... ?
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_07");	//(sm�je se) Jen jsem ti cht�l ��ct, �e jsi stra�n� bl�zen.
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_09");	//(sm�je se) Opatruj se!
	b_giveplayerxp(XP_AMBIENT);
	AI_StopProcessInfos(self);
};


instance DIA_CORD_EXPLAINSKILLS(C_INFO)
{
	npc = sld_805_cord;
	nr = 1;
	condition = dia_cord_explainskills_condition;
	information = dia_cord_explainskills_info;
	permanent = FALSE;
	description = "Co bych se m�l nau�it...";
};


func int dia_cord_explainskills_condition()
{
	if(CORD_APPROVED == TRUE)
	{
		return TRUE;
	};
};

func void dia_cord_explainskills_info()
{
	AI_Output(other,self,"DIA_Cord_ExplainSkills_15_00");	//Co bych se m�l nau�it jako prvn�, boj s jednoru�n�mi, nebo obouru�n�mi zbran�mi?
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_01");	//Oba dva druhy boje jsou si hodn� podobn�.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_02");	//Jakmile dos�hne� u jednoho typu zbran� dal�� �rovn�, automaticky se to nau�� tak� i pro druh� typ zbran�.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_03");	//Jestli�e jsi nap��klad dobr� v boji s jednoru�n�mi me�i, ale jsi st�le za��te�n�k v boji s obouru�n�mi zbran�mi...
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_04");	//... tv� dovednosti s obouru�n�mi zbran�mi se zv���, i kdy� tr�nuje� s jednoru�n� zbran�.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_05");	//Pokud tr�nuje� pouze s jedn�m typem zbran�, zjist�, �e v�cvik je mnohem v�ce vy�erp�vaj�c�.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_06");	//Pokud tr�nuje� v�dy s ob�ma typy zbran�, dos�hne� stejn�ho v�sledku s men��m �sil�m.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_07");	//V kone�n�m d�sledku dos�hne� stejn�ho v�sledku ob�ma zp�soby - v�b�r je na tob�.
};


instance DIA_CORD_EXPLAINWEAPONS(C_INFO)
{
	npc = sld_805_cord;
	nr = 2;
	condition = dia_cord_explainweapons_condition;
	information = dia_cord_explainweapons_info;
	permanent = FALSE;
	description = "Jak� jsou v�hody jednoru�n�ch a obouru�n�ch zbran�?";
};


func int dia_cord_explainweapons_condition()
{
	if(CORD_APPROVED == TRUE)
	{
		return TRUE;
	};
};

func void dia_cord_explainweapons_info()
{
	AI_Output(other,self,"DIA_Cord_ExplainWeapons_15_00");	//Jak� jsou v�hody jednoru�n�ch a obouru�n�ch zbran�?
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_01");	//Dobr� ot�zka. Vid�m, �e t�hle v�ci v�nuje� dostate�nou pozornost.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_02");	//Jednoru�n� zbran� jsou rychlej��, ale trochu slab��.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_03");	//Obouru�n� zbran� zp�sobuj� v�t�� po�kozen�, ale nem��e� s nimi �to�it tak rychle.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_04");	//K ovl�d�n� obouru�n�ch zbran� tak� pot�ebuje� v�ce s�ly. To znamen� dodate�n� tr�nink.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_05");	//Jedin� zp�sob, jak se st�t skute�n� dobr�m, je vlo�it do toho mnoho �sil�.
};


var int cord_merke_1h;
var int cord_merke_2h;

instance DIA_CORD_TEACH(C_INFO)
{
	npc = sld_805_cord;
	nr = 3;
	condition = dia_cord_teach_condition;
	information = dia_cord_teach_info;
	permanent = TRUE;
	description = "Nau� m� bojovat!";
};


func int dia_cord_teach_condition()
{
	return TRUE;
};

func void b_cord_zeitverschwendung()
{
	AI_Output(self,other,"DIA_Cord_Teach_14_03");	//Nebudu pl�tvat sv�m �asem se za��te�n�ky.
};

func void dia_cord_teach_info()
{
	AI_Output(other,self,"DIA_Cord_Teach_15_00");	//Nau� m� bojovat!
	if((CORD_APPROVED == TRUE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (CORD_RANGERHELP_FIGHT == TRUE))
	{
		if(((Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0) && (Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)) || (CORD_RANGERHELP_FIGHT == TRUE))
		{
			AI_Output(self,other,"DIA_Cord_Teach_14_01");	//Mohu t� nau�it pou��vat jakoukoliv zbra� - kde za�neme?
			CORD_APPROVED = TRUE;
		}
		else if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
		{
			AI_Output(self,other,"DIA_Cord_Teach_14_02");	//Mohu t� nau�it pou��vat jednoru�n� me�. Ale nejsi dost dobrej na to, abys pou��val obouru��k.
			b_cord_zeitverschwendung();
			CORD_APPROVED = TRUE;
		}
		else if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
		{
			AI_Output(self,other,"DIA_Cord_Teach_14_04");	//Co se t��e jednoru�n�ch zbran�, jsi naprost� za��te�n�k! Ale tv� dovednosti v obouru�n�ch zbran�ch nejsou tak �patn�.
			AI_Output(self,other,"DIA_Cord_Teach_14_05");	//Pokud pot�ebuje� v�ce zku�enost� s jednoru�n�mi zbran�mi, jdi si naj�t jin�ho u�itele.
			CORD_APPROVED = TRUE;
		}
		else
		{
			b_cord_zeitverschwendung();
			b_cord_bebetter();
		};
		if(CORD_APPROVED == TRUE)
		{
			Info_ClearChoices(dia_cord_teach);
			Info_AddChoice(dia_cord_teach,DIALOG_BACK,dia_cord_teach_back);
			if((Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0) || (CORD_RANGERHELP_FIGHT == TRUE))
			{
				Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_cord_teach_2h_1);
				Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_cord_teach_2h_5);
			};
			if((Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0) || (CORD_RANGERHELP_FIGHT == TRUE))
			{
				Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_cord_teach_1h_1);
				Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_cord_teach_1h_5);
			};
			CORD_MERKE_1H = other.hitchance[NPC_TALENT_1H];
			CORD_MERKE_2H = other.hitchance[NPC_TALENT_2H];
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Cord_Teach_14_06");	//J� tr�nuji pouze �old�ky nebo vhodn� uchaze�e!
	};
};

func void dia_cord_teach_back()
{
	if((CORD_MERKE_1H < other.hitchance[NPC_TALENT_1H]) || (CORD_MERKE_2H < other.hitchance[NPC_TALENT_2H]))
	{
		AI_Output(self,other,"DIA_Cord_Teach_BACK_14_00");	//Jestli jsi se u� zlep�il, tak v tom pokra�uj!
	};
	Info_ClearChoices(dia_cord_teach);
};

func void dia_cord_teach_2h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,90);
	Info_ClearChoices(dia_cord_teach);
	Info_AddChoice(dia_cord_teach,DIALOG_BACK,dia_cord_teach_back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
	{
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_cord_teach_2h_1);
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_cord_teach_2h_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
	{
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_cord_teach_1h_1);
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_cord_teach_1h_5);
	};
};

func void dia_cord_teach_2h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,90);
	Info_ClearChoices(dia_cord_teach);
	Info_AddChoice(dia_cord_teach,DIALOG_BACK,dia_cord_teach_back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
	{
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_cord_teach_2h_1);
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_cord_teach_2h_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
	{
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_cord_teach_1h_1);
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_cord_teach_1h_5);
	};
};

func void dia_cord_teach_1h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,90);
	Info_ClearChoices(dia_cord_teach);
	Info_AddChoice(dia_cord_teach,DIALOG_BACK,dia_cord_teach_back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
	{
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_cord_teach_2h_1);
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_cord_teach_2h_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
	{
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_cord_teach_1h_1);
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_cord_teach_1h_5);
	};
};

func void dia_cord_teach_1h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,90);
	Info_ClearChoices(dia_cord_teach);
	Info_AddChoice(dia_cord_teach,DIALOG_BACK,dia_cord_teach_back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
	{
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_cord_teach_2h_1);
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_cord_teach_2h_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
	{
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_cord_teach_1h_1);
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_cord_teach_1h_5);
	};
};


instance DIA_CORD_PICKPOCKET(C_INFO)
{
	npc = sld_805_cord;
	nr = 900;
	condition = dia_cord_pickpocket_condition;
	information = dia_cord_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_cord_pickpocket_condition()
{
	return c_beklauen(65,75);
};

func void dia_cord_pickpocket_info()
{
	Info_ClearChoices(dia_cord_pickpocket);
	Info_AddChoice(dia_cord_pickpocket,DIALOG_BACK,dia_cord_pickpocket_back);
	Info_AddChoice(dia_cord_pickpocket,DIALOG_PICKPOCKET,dia_cord_pickpocket_doit);
};

func void dia_cord_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_cord_pickpocket);
};

func void dia_cord_pickpocket_back()
{
	Info_ClearChoices(dia_cord_pickpocket);
};

