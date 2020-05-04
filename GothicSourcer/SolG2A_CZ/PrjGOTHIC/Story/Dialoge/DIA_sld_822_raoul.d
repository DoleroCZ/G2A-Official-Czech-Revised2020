
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
	AI_Output(self,other,"DIA_Raoul_NoSentenza_01_00");	//PoËkej chvÌli, k·mo!
	AI_Output(self,other,"DIA_Raoul_NoSentenza_01_01");	//Nevöiml jsem si, ûe by tÏ Sentenza hledal.
	if(Hlp_IsValidNpc(sentenza) && !c_npcisdown(sentenza))
	{
		AI_Output(self,other,"DIA_Raoul_NoSentenza_01_02");	//SENTENZO! PojÔ sem!
		AI_Output(self,other,"DIA_Raoul_NoSentenza_01_03");	//(faleönÏ sluönÏ) Chvilku strpenÌ, bude tu co by dup!
		AI_Output(self,other,"DIA_Raoul_NoSentenza_01_04");	//Pak tÏ ale Ëek· nep¯ÌjemnÈ p¯ekvapenÌ!
		b_attack(sentenza,other,AR_NONE,0);
	}
	else
	{
		AI_Output(self,other,"DIA_Raoul_NoSentenza_01_05");	//Kde tedy je? No, to nevadÌ, mÏls prostÏ kliku.
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
		AI_Output(self,other,"DIA_Raoul_Hello_01_00");	//(znudÏnÏ) Co chceö?
	}
	else
	{
		AI_Output(self,other,"DIA_Raoul_Hello_01_01");	//(otr·venÏ) Co chceö teÔ?
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
	description = "Chci se trochu porozhlÈdnout po farmÏ!";
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
		AI_Output(other,self,"DIA_Raoul_PERMNone_15_00");	//Chci se trochu porozhlÈdnout po farmÏ!
		AI_Output(self,other,"DIA_Raoul_PERMNone_01_01");	//Do toho stavenÌ nalevo radöi nechoÔ. BydlÌ tam Sylvio a teÔ zrovna nem· nijak dobrou n·ladu.
		AI_Output(self,other,"DIA_Raoul_PERMNone_01_02");	//Kdyû narazÌ na nÏjakÈho slabocha, kter˝ nepat¯Ì ke statku, mohlo by ho napadnout, ûe by si na nÏm mohl vylÌt vztek.
		RAOUL_GESAGT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Raoul_PERMNone_01_03");	//Tak si to uûij!
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
	description = "Chci se p¯idat k Leeovi!";
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
	AI_Output(other,self,"DIA_Raoul_WannaJoin_15_00");	//Chci se p¯idat k Leeovi!
	AI_Output(self,other,"DIA_Raoul_WannaJoin_01_01");	//Jestli to bude takhle pokraËovat, Lee uû za chvÌli nebude mÌt hlavnÌ slovo!
	AI_Output(other,self,"DIA_Raoul_WannaJoin_15_02");	//Co tÌm myslÌö?
	AI_Output(self,other,"DIA_Raoul_WannaJoin_01_03");	//Chce, abychom tu vöichni sedÏli s rukama v klÌnÏ. Jen tu a tam postraöÌme p·r sedl·k˘ a to je vöechno.
	AI_Output(self,other,"DIA_Raoul_WannaJoin_01_04");	//Sylvio naopak vûdycky ¯Ìk·, ûe nejlepöÌ obrana je ˙tok, a m· sakra pravdu!
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
	AI_Output(self,other,"DIA_Raoul_AboutSylvio_01_01");	//Podle mÏ je to n·ö budoucÌ v˘dce. Jestli se ho ale chceö zeptat, jestli se k n·m m˘ûeö p¯idat, tak na to rovnou zapomeÚ!
	AI_Output(self,other,"DIA_Raoul_AboutSylvio_01_02");	//Vypad·ö, ûe bys umÏl leda tak p·st ovce.
};


instance DIA_RAOUL_STIMME(C_INFO)
{
	npc = sld_822_raoul;
	nr = 2;
	condition = dia_raoul_stimme_condition;
	information = dia_raoul_stimme_info;
	permanent = FALSE;
	description = "Nevadilo by ti, kdybych se tu stal ûold·kem?";
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
	AI_Output(other,self,"DIA_Raoul_Stimme_15_00");	//Nevadilo by ti, kdybych se tu stal ûold·kem?
	AI_Output(self,other,"DIA_Raoul_Stimme_01_01");	//¡le, dÏlej si, co chceö...
	Log_CreateTopic(TOPIC_SLDRESPEKT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SLDRESPEKT,LOG_RUNNING);
	b_logentry(TOPIC_SLDRESPEKT,"Raoul nem· nic proti tomu, abych se p¯idal k ûoldnÈ¯˘m.");
};


instance DIA_RAOUL_DUELL(C_INFO)
{
	npc = sld_822_raoul;
	nr = 2;
	condition = dia_raoul_duell_condition;
	information = dia_raoul_duell_info;
	permanent = TRUE;
	description = "J· myslÌm, ûe bych ti mÏl d·t p·r p¯es drûku.";
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
	AI_Output(other,self,"DIA_Raoul_Duell_15_00");	//J· myslÌm, ûe bych ti mÏl d·t p·r p¯es drûku.
	AI_Output(self,other,"DIA_Raoul_Duell_01_01");	//Co?
	AI_Output(other,self,"DIA_Raoul_Duell_15_02");	//P¯esnÏ to bys teÔ pot¯eboval.
	AI_Output(self,other,"DIA_Raoul_Duell_01_03");	//ZatÌm jsem k tobÏ byl asi aû moc mil˝, co?
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
	description = "A co jinak. Vöechno v po¯·dku?";
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
	AI_Output(other,self,"DIA_Raoul_PERM_15_00");	//A co jinak. Vöechno v po¯·dku?
	if(MIS_RAOUL_KILLTROLLBLACK == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Raoul_PERM_01_01");	//P¯estaÚ ûvanit a radöi mi obstarej tu k˘ûi z ËernÈho trola.
	}
	else
	{
		AI_Output(self,other,"DIA_Raoul_PERM_01_02");	//SnaûÌö se mi podlejzat, nebo co? Zmizni!
		if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
		{
			AI_Output(self,other,"DIA_Raoul_PERM_01_03");	//NezapomnÏl jsem, cos mi provedl.
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
	AI_Output(self,other,"DIA_Raoul_TROLL_01_00");	//(cynicky) Jen se na to podÌvej!
	AI_Output(other,self,"DIA_Raoul_TROLL_15_01");	//Co chceö?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Raoul_TROLL_01_02");	//Ty ses p¯idal k mÏstsk˝m ûebr·k˘m? Skoro to tak vypad·.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Raoul_TROLL_01_03");	//Nemysli si, ûe si tÏ teÔ budu v·ûit. To, ûe jsi jednÌm z n·s, jeötÏ nic neznamen·.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Raoul_TROLL_01_04");	//Hrajeö si na velkÈho m·ga, co?
	};
	AI_Output(self,other,"DIA_Raoul_TROLL_01_05");	//NÏco ti povÌm. V˘bec nesejde na tom, co m·ö zrovna na sobÏ. J· ti stejnÏ vidÌm aû do ûaludku.
	AI_Output(self,other,"DIA_Raoul_TROLL_01_06");	//Pro mÏ vûdycky nebudeö nic vÌc neû öpinav˝ fl·kaË.
	Info_ClearChoices(dia_raoul_troll);
	Info_AddChoice(dia_raoul_troll,"Uû musÌm jÌt.",dia_raoul_troll_weg);
	Info_AddChoice(dia_raoul_troll,"Co m·ö za problÈm?",dia_raoul_troll_rechnung);
};

func void dia_raoul_troll_weg()
{
	AI_Output(other,self,"DIA_Raoul_TROLL_weg_15_00");	//Uû musÌm jÌt.
	AI_Output(self,other,"DIA_Raoul_TROLL_weg_01_01");	//Jo, vymajzni.
	AI_StopProcessInfos(self);
};

func void dia_raoul_troll_rechnung()
{
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_15_00");	//Co m·ö za problÈm?
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_01");	//TakovÈ jako ty moc dob¯e zn·m. MajÌ akor·t plnou hubu kec˘.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_02");	//Nesn·öÌm lidi, co dÏlajÌ haura a kasajÌ se, jakÈ hrdinskÈ skutky vykonajÌ.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_03");	//Zrovna vËera jsem tu jednomu chl·pkovi dal p·r do zub˘, protoûe tvrdil, ûe by ËernÈho trola sundal i s jednou rukou p¯iv·zanou za z·dy.
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_15_04");	//A co?
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_05");	//(ost¯e) Co myslÌö tÌm "a co"?
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_06");	//Uû jsi nÏkdy vidÏl ËernÈho trola, ty velkohub˝ n·divo? M·ö v˘bec ponÏtÌ, jak obrovsk· potvora to je?
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_07");	//Kdyû se k nÏmu p¯iblÌûÌö jen o krok vÌc, neû je zdr·vo, roztrh· tÏ na cucky.
	Info_ClearChoices(dia_raoul_troll);
	Info_AddChoice(dia_raoul_troll,"Nem·m z·jem.",dia_raoul_troll_rechnung_hastrecht);
	if(Npc_IsDead(troll_black))
	{
		Info_AddChoice(dia_raoul_troll,"Uû jsem zabil toho ËernÈho trola.",dia_raoul_troll_rechnung_ich);
	}
	else
	{
		Info_AddChoice(dia_raoul_troll,"»ern˝ trol? é·dn˝ problÈm!",dia_raoul_troll_rechnung_noprob);
	};
};

func void b_raoul_blame()
{
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_00");	//Ty si o to ale p¯Ìmo koledujeö, co? MÏl bych ti rovnou zakroutit krkem, ale m·m lepöÌ n·pad.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_01");	//Jestli jsi fakt tak dobr˝ bojovnÌk, tak to dokaû.
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_02");	//Co z toho budu mÌt?
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_03");	//To je ale hloup· ot·zka. »est a nerozbitej cifernÌk?
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_04");	//To teda nenÌ zrovna moc.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_05");	//No, ¯eknÏme, ûe jestli mi p¯ineseö k˘ûi ËernÈho trola, d·m ti pÏknou hromadu penÏz. Co ty na to?
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_06");	//To uû je lepöÌ.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_07");	//Tak na co Ëek·ö?
	Log_CreateTopic(TOPIC_KILLTROLLBLACK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLTROLLBLACK,LOG_RUNNING);
	b_logentry(TOPIC_KILLTROLLBLACK,"Raoul û·d·, abych mu p¯inesl k˘ûi ËernÈho trola.");
	MIS_RAOUL_KILLTROLLBLACK = LOG_RUNNING;
	Info_ClearChoices(dia_raoul_troll);
};

func void dia_raoul_troll_rechnung_hastrecht()
{
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_hastrecht_15_00");	//Nem·m z·jem.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_hastrecht_01_01");	//To je pro tebe nejspÌö lepöÌ.
	Info_ClearChoices(dia_raoul_troll);
};

func void dia_raoul_troll_rechnung_ich()
{
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_ich_15_00");	//Uû jsem zabil toho ËernÈho trola.
	b_raoul_blame();
};

func void dia_raoul_troll_rechnung_noprob()
{
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_noProb_15_00");	//»ern˝ trol? é·dn˝ problÈm!
	b_raoul_blame();
};


instance DIA_RAOUL_TROPHYFUR(C_INFO)
{
	npc = sld_822_raoul;
	nr = 3;
	condition = dia_raoul_trophyfur_condition;
	information = dia_raoul_trophyfur_info;
	permanent = TRUE;
	description = "Nejd¯Ìv mi prozraÔ, jak z trola tu k˘ûi st·hnout.";
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
	AI_Output(other,self,"DIA_Raoul_TrophyFur_15_00");	//Nejd¯Ìv mi prozraÔ, jak z trola tu k˘ûi st·hnout.
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_FUR))
	{
		AI_Output(self,other,"DIA_Raoul_TrophyFur_01_01");	//Tak pozornÏ poslouchej, tuhle radu ti d·m zadarmo.
		AI_Output(self,other,"DIA_Raoul_TrophyFur_01_02");	//Kaûdou nohu tÈ bestie opatrnÏ na¯Ìzneö...
		AI_Output(self,other,"DIA_Raoul_TrophyFur_01_03");	//...a pak jÌ st·hneö k˘ûi aû k uöÌm. Je to na tebe moc sloûitÈ nebo co?
	};
};


instance DIA_RAOUL_TROLLFELL(C_INFO)
{
	npc = sld_822_raoul;
	nr = 3;
	condition = dia_raoul_trollfell_condition;
	information = dia_raoul_trollfell_info;
	description = "M·m u sebe tu k˘ûi ËernÈho trola.";
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
	AI_Output(other,self,"DIA_Raoul_TROLLFELL_15_00");	//M·m u sebe tu k˘ûi ËernÈho trola.
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_01_01");	//To nenÌ moûnÈ. Ukaû mi ji.
	b_giveinvitems(other,self,itat_trollblackfur,1);
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_01_02");	//To je fakt neuvÏ¯itelnÈ. Co za ni chceö?
	AI_Output(other,self,"DIA_Raoul_TROLLFELL_15_03");	//Dej mi, co m·ö.
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_01_04");	//Fajn, d·m ti 500 zlaù·k˘ a t¯i lÈËivÈ lektvary, co ty na to?
	Info_ClearChoices(dia_raoul_trollfell);
	Info_AddChoice(dia_raoul_trollfell,"To nestaËÌ.",dia_raoul_trollfell_nein);
	Info_AddChoice(dia_raoul_trollfell,"PlatÌ.",dia_raoul_trollfell_ja);
	MIS_RAOUL_KILLTROLLBLACK = LOG_SUCCESS;
	b_giveplayerxp(XP_RAOUL_KILLTROLLBLACK);
};

func void dia_raoul_trollfell_ja()
{
	AI_Output(other,self,"DIA_Raoul_TROLLFELL_ja_15_00");	//PlatÌ.
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_ja_01_01");	//TÏöilo mÏ.
	CreateInvItems(self,itpo_health_03,3);
	b_giveinvitems(self,other,itpo_health_03,3);
	CreateInvItems(self,itmi_gold,500);
	b_giveinvitems(self,other,itmi_gold,500);
	Info_ClearChoices(dia_raoul_trollfell);
};

func void dia_raoul_trollfell_nein()
{
	AI_Output(other,self,"DIA_Raoul_TROLLFELL_nein_15_00");	//To nestaËÌ.
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_nein_01_01");	//Jen si posluû, j· si tu k˘ûi stejnÏ nech·m.
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_nein_01_02");	//Nenech·m si mezi prsty proklouznout takovouhle öanci.
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
	description = "Vraù mi tu trolÌ k˘ûi.";
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
	AI_Output(other,self,"DIA_Raoul_FELLZURUECK_15_00");	//Vraù mi tu trolÌ k˘ûi.
	AI_Output(self,other,"DIA_Raoul_FELLZURUECK_01_01");	//Ne.
	AI_StopProcessInfos(self);
};


instance DIA_RAOUL_GOTTROLLFURBACK(C_INFO)
{
	npc = sld_822_raoul;
	nr = 3;
	condition = dia_raoul_gottrollfurback_condition;
	information = dia_raoul_gottrollfurback_info;
	description = "Uû se mÏ nikdy nesnaû oökubat, rozumÌö?";
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
	AI_Output(other,self,"DIA_Raoul_GotTrollFurBack_15_00");	//Uû se mÏ nikdy nesnaû oökubat, rozumÌö?
	AI_Output(self,other,"DIA_Raoul_GotTrollFurBack_01_01");	//No jo. VÌö p¯ece, jak to tady chodÌ, ne? Tak se uklidni.
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
	description = "NechtÏl by sis vyjet na mo¯e?";
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
	AI_Output(other,self,"DIA_Raoul_Ship_15_00");	//NechtÏl by sis vyjet na mo¯e?
	AI_Output(self,other,"DIA_Raoul_Ship_01_01");	//Co m·ö v pl·nu? Chceö zabrat tu paladinskou loÔ? (smÏje se)
	AI_Output(other,self,"DIA_Raoul_Ship_15_02");	//A co kdyû jo?
	AI_Output(self,other,"DIA_Raoul_Ship_01_03");	//(v·ûnÏ) Ty ses ˙plnÏ zbl·znil. Ne, dÌky, to nenÌ nic pro mÏ.
	AI_Output(self,other,"DIA_Raoul_Ship_01_04");	//Nem·m d˘vod opustit Khorinis. BuÔ si nÏjakÈ prachy vydÏl·m tady, nebo na pevninÏ - mnÏ to p¯ijde praöù jak uhoÔ.
	AI_Output(self,other,"DIA_Raoul_Ship_01_05");	//Najdi si nÏkoho jinÈho.
	if(Npc_IsDead(torlof) == FALSE)
	{
		AI_Output(self,other,"DIA_Raoul_Ship_01_06");	//Zeptej se Torlofa. Pokud vÌm, tak se po mo¯i kdysi plavil.
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

