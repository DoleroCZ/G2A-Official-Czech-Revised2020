
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
		AI_Output(self,other,"DIA_Addon_Cord_MeetingIsRunning_14_00");	//VÌtej v 'Kruhu Vody', brat¯e.
		DIA_ADDON_CORD_MEETINGISRUNNING_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Cord_MeetingIsRunning_14_01");	//MÏl bys jÌt za Vatrasem ...
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
	AI_Output(self,other,"DIA_Cord_Hallo_14_00");	//Jestli m·ö problÈm s vlky nebo polnÌmi ök˘dci, tak si bÏû promluvit s jednÌm z naöich mladöÌch ûold·k˘.
	AI_Output(self,other,"DIA_Cord_Hallo_14_01");	//M˘ûeö ke mnÏ p¯ijÌt, aû se tu uk·ûou paladinovÈ.
	if(SC_ISRANGER == FALSE)
	{
		AI_Output(other,self,"DIA_Cord_Hallo_15_02");	//Co?
		AI_Output(self,other,"DIA_Cord_Hallo_14_03");	//Kdykoliv nÏkdo z v·s rolnÌk˘ p¯ijde ke mnÏ, vûdycky se mluvÌ o vyvraûdÏnÌ nevinn˝ch tvor˘.
		AI_Output(other,self,"DIA_Cord_Hallo_15_04");	//Nejsem rolnÌk.
		AI_Output(self,other,"DIA_Cord_Hallo_14_05");	//Hm? A co tedy potom chceö?
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
	description = "ChtÏl bych se st·t ûold·kem!";
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
	AI_Output(self,other,"DIA_Cord_WannaJoin_14_14");	//A protoûe ty sotva vÌö, jak se zach·zÌ se zbranÌ, ¯ekl bych, ûe jsi tady na öpatnÈm mÌstÏ!
};

func void dia_cord_wannajoin_info()
{
	AI_Output(other,self,"DIA_Cord_WannaJoin_15_00");	//ChtÏl bych se st·t ûold·kem!
	if(CORD_SCHONMALGEFRAGT == FALSE)
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_01");	//Vypad·ö spÌö jako nÏkdo, kdo se narodil pro pr·ci na poli, chlapËe.
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_02");	//UmÌö tedy ovl·dat zbraÚ?
		CORD_SCHONMALGEFRAGT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_03");	//Uû jsi se zlepöil?
	};
	AI_Output(self,other,"DIA_Cord_WannaJoin_14_04");	//Takûe umÌö ovl·dat jednoruËnÌ zbranÏ?
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_05");	//Nejsem v tom öpatnej.
	}
	else
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_06");	//Noooo...
	};
	AI_Output(self,other,"DIA_Cord_WannaJoin_14_07");	//A umÌö ovl·dat obouruËnÌ zbranÏ?
	if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_08");	//UmÌm s nimi zach·zet.
	}
	else
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_09");	//UrËitÏ se zlepöÌm!
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0) || (Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0))
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_10");	//No, alespoÚ nejsi ˙plnej zaË·teËnÌk. V po¯·dku. Budu tÏ volit.
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_11");	//Kdyû budeö pot¯ebovat nÏco dalöÌho, m˘ûeö se to nauËit ode mne.
		CORD_APPROVED = TRUE;
		b_giveplayerxp(XP_CORD_APPROVED);
		b_logentry(TOPIC_SLDRESPEKT,"Cordovu p¯Ìmluvu uû m·m v kapse.");
		Log_CreateTopic(TOPIC_SOLDIERTEACHER,LOG_NOTE);
		b_logentry(TOPIC_SOLDIERTEACHER,"Cord mÏ vycviËÌ v pouûÌv·nÌ jedno- a obouruËnÌch zbranÌ.");
	}
	else
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_12");	//Jin˝mi slovy: jsi mizernej zelen·Ë!
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_13");	//Kaûd˝ ûoldnÈ¯ se musÌ spolehnout na svÈ kamar·dy. Z·visÌ na tom vöechny naöe ûivoty.
		b_cord_bebetter();
		Log_CreateTopic(TOPIC_CORDPROVE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_CORDPROVE,LOG_RUNNING);
		b_logentry(TOPIC_CORDPROVE,"Cord se za mÏ p¯imluvÌ aû potÈ, co se nauËÌm lÈpe bojovat.");
	};
};


instance DIA_ADDON_CORD_YOUARERANGER(C_INFO)
{
	npc = sld_805_cord;
	nr = 2;
	condition = dia_addon_cord_youareranger_condition;
	information = dia_addon_cord_youareranger_info;
	description = "Slyöel jsem, ûe jsi Ëlenem 'Kruhu Vody'.";
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
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_15_00");	//Slyöel jsem, ûe jsi Ëlenem "Kruhu Vody".
	if(SC_ISRANGER == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_14_01");	//Kterej idiot o tom nemohl drûet hubu?
		if(SC_KNOWSCORDASRANGERFROMLEE == TRUE)
		{
			AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_15_02");	//Lee mi o tom ¯ekl.
		};
		if(SC_KNOWSCORDASRANGERFROMLARES == TRUE)
		{
			AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_15_03");	//Lares ti vzkazuje, abys mi pomohl, kdyû ti ¯eknu, ûe 'ûiju pod jeho ochrann˝mi k¯Ìdly'.
		};
	};
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_14_04");	//(povzdechne si) To vypad·, ûe tÏ teÔ budu muset p¯ijmout, ûe?
	AI_Output(self,other,"DIA_Addon_Cord_Add_14_01");	//Dobr·, co pot¯ebujeö?
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_14_06");	//A pozor na hubu. I kdyû nem·m radost, z toho, co jsi mi ¯ekl ...
	Info_ClearChoices(dia_addon_cord_youareranger);
	Info_AddChoice(dia_addon_cord_youareranger,"Pr·vÏ teÔ nic nepot¯ebuji, udÏl·m si to posvÈm.",dia_addon_cord_youareranger_nix);
	Info_AddChoice(dia_addon_cord_youareranger,"Chci tvÈ brnÏnÌ.",dia_addon_cord_youareranger_ruestung);
	Info_AddChoice(dia_addon_cord_youareranger,"Chci tvou zbraÚ!",dia_addon_cord_youareranger_waffe);
	if(CORD_APPROVED == FALSE)
	{
		Info_AddChoice(dia_addon_cord_youareranger,"NauË mÏ, jak bojovat.",dia_addon_cord_youareranger_kampf);
	};
	if(hero.guild == GIL_NONE)
	{
	};
	if(hero.guild == GIL_NONE)
	{
		Info_AddChoice(dia_addon_cord_youareranger,"Pomoz mi dostat se k ûold·k˘m.",dia_addon_cord_youareranger_sldaufnahme);
	};
};


var int cord_sc_dreist;

func void b_dia_addon_cord_youareranger_warn()
{
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_WARN_14_00");	//(hrozÌ) A nechtÏj b˝t nadohled, pokud uslyöÌm, ûe jsi nedrûel jazyk za zuby. To ti ¯Ìk·m pouze jednou!
};

func void b_dia_addon_cord_youareranger_fresse()
{
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_FRESSE_14_00");	//(nazlobenÏ) Dobr·, tady to m·ö. Zaöel jsi p¯Ìliö daleko, toho budeö litovat.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
	CORD_RANGERHELP_GETSLD = FALSE;
	CORD_RANGERHELP_FIGHT = FALSE;
	TOPIC_END_RANGERHELPSLD = TRUE;
};

func void dia_addon_cord_youareranger_ruestung()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_ruestung_15_00");	//Chci tvÈ brnÏnÌ.
	if(CORD_SC_DREIST == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_ruestung_14_01");	//JeötÏ jednou to zkusÌö a budeö sbÌrat zuby ze zemÏ.
		CORD_SC_DREIST = TRUE;
	}
	else
	{
		b_dia_addon_cord_youareranger_fresse();
	};
};

func void dia_addon_cord_youareranger_waffe()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_Add_15_00");	//Chci tvou zbraÚ!
	if(CORD_SC_DREIST == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_Add_14_03");	//(v˝hruûnÏ)  Je to tak?
		AI_Output(self,other,"DIA_Addon_Cord_Add_14_02");	//(zubÌ se) ¡, spr·vnÏ ...
		CORD_SC_DREIST = TRUE;
	}
	else
	{
		b_dia_addon_cord_youareranger_fresse();
	};
};

func void dia_addon_cord_youareranger_weg()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_weg_15_00");	//R·d bych mÏl tvou pozici na farmÏ.
	if(CORD_SC_DREIST == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_weg_14_01");	//Nezkouöej ze mÏ udÏlat hlup·ka, k·mo, jinak ti zp¯el·mu kaûdou kost v tÏle.
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
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_kampf_15_00");	//NauË mÏ jak bojovat.
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_kampf_14_01");	//Dobr·, co d·l?
	CORD_RANGERHELP_FIGHT = TRUE;
	if(DIA_ADDON_CORD_YOUARERANGER_SCGOTOFFER == FALSE)
	{
		Info_AddChoice(dia_addon_cord_youareranger,"To staËÌ.",dia_addon_cord_youareranger_reicht);
		DIA_ADDON_CORD_YOUARERANGER_SCGOTOFFER = TRUE;
	};
};

func void dia_addon_cord_youareranger_sldaufnahme()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_SLDAufnahme_15_00");	//Mohl bys mi pomoct dostat se k ûold·k˘m?
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_SLDAufnahme_14_01");	//(smÏje se) ¡, to bude sranda. Dobr·, zkusÌm to. Co d·l?
	CORD_RANGERHELP_GETSLD = TRUE;
	if(DIA_ADDON_CORD_YOUARERANGER_SCGOTOFFER == FALSE)
	{
		Info_AddChoice(dia_addon_cord_youareranger,"To staËÌ.",dia_addon_cord_youareranger_reicht);
		DIA_ADDON_CORD_YOUARERANGER_SCGOTOFFER = TRUE;
	};
};

func void dia_addon_cord_youareranger_gold()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_Gold_15_00");	//Zaplaù mi a nebudu o tom mluvit.
	if(CORD_SC_DREIST == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_Gold_14_01");	//Sorry, ale j· se vydÌrat nenech·m ty bastarde.
		CORD_SC_DREIST = TRUE;
	}
	else
	{
		b_dia_addon_cord_youareranger_fresse();
	};
};

func void dia_addon_cord_youareranger_nix()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_nix_15_00");	//Pr·vÏ nic nepot¯ebuji. UdÏl·m si vöe radÏji s·m.
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_nix_14_01");	//Jak chceö. MÏls na v˝bÏr.
	b_dia_addon_cord_youareranger_warn();
	Info_ClearChoices(dia_addon_cord_youareranger);
};

func void dia_addon_cord_youareranger_reicht()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_reicht_15_00");	//To staËÌ.
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_reicht_14_01");	//H·d·m, ûe to je.
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
	description = "Pomoz mi st·t se ûold·kem.";
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
	AI_Output(other,self,"DIA_Addon_Cord_RangerHelpObsolete_15_00");	//ProblÈm je vy¯eöen.
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelpObsolete_14_01");	//Oh, to se pak st·v· obtÌûnÏjöÌ.
	AI_Output(other,self,"DIA_Addon_Cord_RangerHelpObsolete_15_02");	//Co tÌm myslÌö?
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelpObsolete_14_03");	//Dobr·, to znamen·, ûe ti nem˘ûu pomoct.
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelpObsolete_14_04");	//Nebo bys chtÏl, abych bojoval s kaûd˝m ûold·kem jen proto, aby tÏ p¯ijali?
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelpObsolete_14_05");	//MusÌö to udÏlat s·m.
	DIA_ADDON_CORD_RANGERHELP2GETSLD_NOPERM = TRUE;
	TOPIC_END_RANGERHELPSLD = TRUE;
};

func void b_cord_comelaterwhendone()
{
	AI_Output(self,other,"DIA_Addon_Cord_ComeLaterWhenDone_14_00");	//Dobr·, zajdi pro to za nÌm a vraù se, jakmile ti ji zad·.
	AI_StopProcessInfos(self);
};

func void b_cord_idoitforyou()
{
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_00");	//” ano. To je jednoduchÈ. Poslouchej, vraù se zÌtra. To uû to budu mÌt vy¯eöenÈ.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_01");	//JistÏ, ale r·d bych, kdyby si za to pro mÏ nÏco udÏlal.
	AI_Output(other,self,"DIA_Addon_Cord_IDoItForYou_15_02");	//A co by to mÏlo b˝t?
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_03");	//Je tu mal˝ t·bor bandit˘ v hor·ch na jihov˝chod odtud.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_04");	//P˘jdeö p¯Ìmo na jihov˝chod odsud, mÏl bys tam vidÏt vÏû.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_05");	//Jeden z m˝ch muû˘ - Patrick - tam öel p¯ed nÏkolika dny. ChtÏl s tÏmi bastardy obchodovat.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_06");	//ÿÌkal jsem mu, aby tam nechodil, ale ten blbec mÏ neposlouchal.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_07");	//Moûn· jim padl za obÏù. Ale nevÌm to jistÏ?
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_08");	//Zajdeö tam a podÌv·ö se tam kv˘li mÏ.
	b_logentry(TOPIC_ADDON_RANGERHELPSLD,"Cord se postar· o Torlofovu zkouöku. Cord˘v kamar·d Patrick se ztratil. P˘jdu do t·bora bandit˘ nedaleko odsud na jihov˝chodÏ a podÌv·m se, zda-li tam Patrick nenÌ.");
	Info_ClearChoices(dia_addon_cord_rangerhelp2getsld);
	Info_AddChoice(dia_addon_cord_rangerhelp2getsld,"ZapomeÚ na to. ⁄kol je mnohem tÏûöÌ neû ten Torlof˘v.",b_cord_idoitforyou_mist);
	Info_AddChoice(dia_addon_cord_rangerhelp2getsld,"A jak si mohu b˝t jist, ûe na mÏ neza˙toËÌ, jakmile mÏ uvidÌ?",b_cord_idoitforyou_dexter);
	DIA_ADDON_CORD_RANGERHELP2GETSLD_NOPERM = TRUE;
};

func void b_cord_idoitforyou_mist()
{
	AI_Output(other,self,"Dia_Addon_Cord_IDoItForYou_mist_15_00");	//ZapomeÚ na to. ⁄kol je mnohem tÏûöÌ neû ten Torlof˘v.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_mist_14_01");	//Neboj, takov˝ mal˝ lstiv˝ chlapÌk se jim dozajista podez¯el˝ zd·t nebude.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_mist_14_02");	//Taky to nemohu udÏlat s·m, protoûe jsem uû ûold·k a na toho by za˙toËili.
};

func void b_cord_idoitforyou_dexter()
{
	AI_Output(other,self,"Dia_Addon_Cord_IDoItForYou_Dexter_15_00");	//A jak si mohu b˝t jist, ûe na mÏ neza˙toËÌ, jakmile mÏ uvidÌ?
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_Dexter_14_01");	//Protoûe zn·m jmÈno jejich v˘dce. Jeho jmÈno je DEXTER. ProstÏ ¯ekneö, ûe ho zn·ö.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_Dexter_14_02");	//To si pak ti chl·pci dvakr·t rozmyslÌ, neû na tebe za˙toËÌ.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_Dexter_14_03");	//Samoz¯ejmÏ to m˘ûe b˝t nebezpeËnÈ dobrodruûstvÌ.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_Dexter_14_04");	//Ale ty to nÏjak zvl·dneö.
	Info_ClearChoices(dia_addon_cord_rangerhelp2getsld);
	b_logentry(TOPIC_ADDON_RANGERHELPSLD,"V˘dce bandit˘ se jmenuje Dexter.");
	Log_CreateTopic(TOPIC_ADDON_MISSINGPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MISSINGPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MISSINGPEOPLE,"éold·k Cord hled· svÈho p¯Ìtele Patricka.");
	MIS_ADDON_CORD_LOOK4PATRICK = LOG_RUNNING;
	RANGER_SCKNOWSDEXTER = TRUE;
};

func void dia_addon_cord_rangerhelp2getsld_info()
{
	AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_00");	//Pomoz mi st·t se ûold·kem.
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelp2GetSLD_14_01");	//PodÌvej. MusÌö udÏlat Torlofovu zkouöku, jestli chceö projÌt. To je jistÈ.
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelp2GetSLD_14_02");	//Uû jsi o tom ¯ekl Torlofovi?
	if(TORLOF_GO == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_03");	//Opravdu ne.
		b_cord_comelaterwhendone();
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_04");	//¡, zkouöka.
		AI_Output(self,other,"DIA_Addon_Cord_RangerHelp2GetSLD_14_05");	//VidÌm. A co p¯esnÏ znamen· ten test?
		if((TORLOF_PROBEBESTANDEN == TRUE) || ((MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_RUNNING) && Npc_IsDead(rumbold) && Npc_IsDead(rick)) || ((MIS_TORLOF_HOLPACHTVONSEKOB == LOG_RUNNING) && ((sekob.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || Npc_IsDead(sekob))))
		{
			b_cord_rangerhelpobsolete();
		}
		else if(TORLOF_PROBE == 0)
		{
			AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_06");	//JeötÏ jsem se k tomu nedostal.
			b_cord_comelaterwhendone();
		}
		else if(TORLOF_PROBE == PROBE_SEKOB)
		{
			AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_07");	//M·m vybrat n·jemnÈ od Sekoba.
			b_cord_idoitforyou();
		}
		else if(TORLOF_PROBE == PROBE_BENGAR)
		{
			AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_08");	//M·m se postarat o domobranu u Bengarovy farmy.
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
	description = "Byl jsem za tÌm Dextrem.";
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
	AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_00");	//Byl jsem za tÌm Dextrem.
	AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_01");	//Dobr·, a?
	if(Npc_IsDead(bdt_1060_dexter))
	{
		AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_02");	//Je mrtev.
	};
	AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_03");	//NicmÈnÏ jsem nenaöel ani stopu po tvÈm p¯Ìteli Patrickovi.
	if(DEXTER_KNOWSPATRICK == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_04");	//Dexter si na nÏj vzpomnÏl, ale ¯ekl mi, ûe nenavötÌvil t·bor.
		AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_05");	//A jsi si jist, ûe ti Dexter nelhal?
		AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_06");	//Ne, to nejsem. Ale to jsou vöechny informace, kterÈ jsem byl schopen sehnat.
	};
	AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_07");	//Ten chlap prostÏ zmizel beze stopy.
	AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_08");	//Dobr·, dodrûel jsi svou Ë·st dohody ...
	MIS_ADDON_CORD_LOOK4PATRICK = LOG_SUCCESS;
	TOPIC_END_RANGERHELPSLD = TRUE;
	b_giveplayerxp(XP_ADDON_CORD_LOOK4PATRICK);
	AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_09");	//Co Torlof˘v test?
	AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_10");	//ProstÏ se vraù k Torlofovi. Povaûuj test za zvl·dnut˝. Jen mu ¯ekni, ûe se o to postar·m.
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
	description = "Patrick se vr·til.";
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
	AI_Output(other,self,"DIA_Addon_Cord_ReturnPatrick_15_00");	//Patrick se vr·til.
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_01");	//¡, ani jsem nevÏ¯il, ûe ho jeötÏ nÏkdy uvidÌm. Ty ...
	AI_Output(other,self,"DIA_Addon_Cord_ReturnPatrick_15_02");	//Hej, udÏlej mi laskavost.
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_03");	//Ano?
	AI_Output(other,self,"DIA_Addon_Cord_ReturnPatrick_15_04");	//UchraÚ mÏ svÈho vdÏku.
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_05");	//Nepl·noval jsem ti dÏkovat.
	AI_Output(other,self,"DIA_Addon_Cord_ReturnPatrick_15_06");	//Dob¯e ... ?
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_07");	//(smÏje se) Jen jsem ti chtÏl ¯Ìct, ûe jsi straön˝ bl·zen.
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_09");	//(smÏje se) Opatruj se!
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
	description = "Co bych se mÏl nauËit...";
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
	AI_Output(other,self,"DIA_Cord_ExplainSkills_15_00");	//Co bych se mÏl nauËit jako prvnÌ, boj s jednoruËnÌmi, nebo obouruËnÌmi zbranÏmi?
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_01");	//Oba dva druhy boje jsou si hodnÏ podobnÈ.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_02");	//Jakmile dos·hneö u jednoho typu zbranÌ dalöÌ ˙rovnÏ, automaticky se to nauËÌö takÈ i pro druh˝ typ zbranÌ.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_03");	//Jestliûe jsi nap¯Ìklad dobr˝ v boji s jednoruËnÌmi meËi, ale jsi st·le zaË·teËnÌk v boji s obouruËnÌmi zbranÏmi...
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_04");	//... tvÈ dovednosti s obouruËnÌmi zbranÏmi se zv˝öÌ, i kdyû trÈnujeö s jednoruËnÌ zbranÌ.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_05");	//Pokud trÈnujeö pouze s jednÌm typem zbranÌ, zjistÌö, ûe v˝cvik je mnohem vÌce vyËerp·vajÌcÌ.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_06");	//Pokud trÈnujeö vûdy s obÏma typy zbranÌ, dos·hneö stejnÈho v˝sledku s menöÌm ˙silÌm.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_07");	//V koneËnÈm d˘sledku dos·hneö stejnÈho v˝sledku obÏma zp˘soby - v˝bÏr je na tobÏ.
};


instance DIA_CORD_EXPLAINWEAPONS(C_INFO)
{
	npc = sld_805_cord;
	nr = 2;
	condition = dia_cord_explainweapons_condition;
	information = dia_cord_explainweapons_info;
	permanent = FALSE;
	description = "JakÈ jsou v˝hody jednoruËnÌch a obouruËnÌch zbranÌ?";
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
	AI_Output(other,self,"DIA_Cord_ExplainWeapons_15_00");	//JakÈ jsou v˝hody jednoruËnÌch a obouruËnÌch zbranÌ?
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_01");	//Dobr· ot·zka. VidÌm, ûe tÈhle vÏci vÏnujeö dostateËnou pozornost.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_02");	//JednoruËnÌ zbranÏ jsou rychlejöÌ, ale trochu slaböÌ.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_03");	//ObouruËnÌ zbranÏ zp˘sobujÌ vÏtöÌ poökozenÌ, ale nem˘ûeö s nimi ˙toËit tak rychle.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_04");	//K ovl·d·nÌ obouruËnÌch zbranÌ takÈ pot¯ebujeö vÌce sÌly. To znamen· dodateËn˝ trÈnink.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_05");	//Jedin˝ zp˘sob, jak se st·t skuteËnÏ dobr˝m, je vloûit do toho mnoho ˙silÌ.
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
	description = "NauË mÏ bojovat!";
};


func int dia_cord_teach_condition()
{
	return TRUE;
};

func void b_cord_zeitverschwendung()
{
	AI_Output(self,other,"DIA_Cord_Teach_14_03");	//Nebudu pl˝tvat sv˝m Ëasem se zaË·teËnÌky.
};

func void dia_cord_teach_info()
{
	AI_Output(other,self,"DIA_Cord_Teach_15_00");	//NauË mÏ bojovat!
	if((CORD_APPROVED == TRUE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (CORD_RANGERHELP_FIGHT == TRUE))
	{
		if(((Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0) && (Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)) || (CORD_RANGERHELP_FIGHT == TRUE))
		{
			AI_Output(self,other,"DIA_Cord_Teach_14_01");	//Mohu tÏ nauËit pouûÌvat jakoukoliv zbraÚ - kde zaËneme?
			CORD_APPROVED = TRUE;
		}
		else if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
		{
			AI_Output(self,other,"DIA_Cord_Teach_14_02");	//Mohu tÏ nauËit pouûÌvat jednoruËnÌ meË. Ale nejsi dost dobrej na to, abys pouûÌval obouruË·k.
			b_cord_zeitverschwendung();
			CORD_APPROVED = TRUE;
		}
		else if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
		{
			AI_Output(self,other,"DIA_Cord_Teach_14_04");	//Co se t˝Ëe jednoruËnÌch zbranÌ, jsi naprost˝ zaË·teËnÌk! Ale tvÈ dovednosti v obouruËnÌch zbranÌch nejsou tak öpatnÈ.
			AI_Output(self,other,"DIA_Cord_Teach_14_05");	//Pokud pot¯ebujeö vÌce zkuöenostÌ s jednoruËnÌmi zbranÏmi, jdi si najÌt jinÈho uËitele.
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
		AI_Output(self,other,"DIA_Cord_Teach_14_06");	//J· trÈnuji pouze ûold·ky nebo vhodnÈ uchazeËe!
	};
};

func void dia_cord_teach_back()
{
	if((CORD_MERKE_1H < other.hitchance[NPC_TALENT_1H]) || (CORD_MERKE_2H < other.hitchance[NPC_TALENT_2H]))
	{
		AI_Output(self,other,"DIA_Cord_Teach_BACK_14_00");	//Jestli jsi se uû zlepöil, tak v tom pokraËuj!
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

