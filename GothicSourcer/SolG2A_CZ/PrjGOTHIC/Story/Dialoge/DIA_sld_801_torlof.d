
instance DIA_TORLOF_EXIT(C_INFO)
{
	npc = sld_801_torlof;
	nr = 999;
	condition = dia_torlof_exit_condition;
	information = dia_torlof_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_torlof_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_torlof_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TORLOF_HALLO(C_INFO)
{
	npc = sld_801_torlof;
	nr = 1;
	condition = dia_torlof_hallo_condition;
	information = dia_torlof_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_torlof_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_torlof_hallo_info()
{
	AI_Output(self,other,"DIA_Torlof_Hallo_01_00");	//(nevrle) Co po mnì chceš?
};


instance DIA_TORLOF_WANNAJOIN(C_INFO)
{
	npc = sld_801_torlof;
	nr = 2;
	condition = dia_torlof_wannajoin_condition;
	information = dia_torlof_wannajoin_info;
	permanent = FALSE;
	description = "Chci se pøidat k oldnéøùm!";
};


func int dia_torlof_wannajoin_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_torlof_wannajoin_info()
{
	AI_Output(other,self,"DIA_Torlof_WannaJoin_15_00");	//Chci se pøidat k oldnéøùm!
	AI_Output(self,other,"DIA_Torlof_WannaJoin_01_01");	//Hm? A proè si myslíš, e bych mìl bıt pro, abychom tì sem pøijali?
};


var int torlof_go;

instance DIA_TORLOF_PROBE(C_INFO)
{
	npc = sld_801_torlof;
	nr = 3;
	condition = dia_torlof_probe_condition;
	information = dia_torlof_probe_info;
	permanent = TRUE;
	description = "Nech mì projít zkouškou!";
};


func int dia_torlof_probe_condition()
{
	if(Npc_KnowsInfo(other,dia_torlof_wannajoin) && (hero.guild == GIL_NONE) && (TORLOF_GO == FALSE))
	{
		return TRUE;
	};
};

func void dia_torlof_probe_info()
{
	AI_Output(other,self,"DIA_Torlof_Probe_15_00");	//Nech mì projít zkouškou!
	AI_Output(self,other,"DIA_Torlof_Probe_01_01");	//Poslal tì za mnou Lee?
	if(Npc_KnowsInfo(other,dia_lee_othersld))
	{
		AI_Output(other,self,"DIA_Torlof_Probe_15_02");	//Øekl, e mi pomùeš.
		AI_Output(self,other,"DIA_Torlof_Probe_01_03");	//(vzdychne si) Fajn. Tak dobrá. Ne se k nám budeš moci pøidat, musíš udìlat dvì vìci.
		AI_Output(self,other,"DIA_Torlof_Probe_01_04");	//Za prvé - musíš prokázat, e budeš schopnı zvládnout úkoly, které budeš jako oldnéø dostávat. Sám tì ozkouším.
		AI_Output(self,other,"DIA_Torlof_Probe_01_05");	//A za druhé - musíš si vyslouit respekt ostatních oldákù.
		TORLOF_GO = TRUE;
		Npc_ExchangeRoutine(self,"Start");
		Log_CreateTopic(TOPIC_BECOMESLD,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_BECOMESLD,LOG_RUNNING);
		b_logentry(TOPIC_BECOMESLD,"Mám-li bıt pøijat mezi oldnéøe, musím projít Torlofovou zkouškou a získat si úctu ostatních.");
	}
	else
	{
		AI_Output(other,self,"DIA_Torlof_Probe_15_06");	//Ne.
		AI_Output(self,other,"DIA_Torlof_Probe_01_07");	//Tak co tady plkáš?
		AI_StopProcessInfos(self);
	};
};


instance DIA_TORLOF_RESPEKT(C_INFO)
{
	npc = sld_801_torlof;
	nr = 4;
	condition = dia_torlof_respekt_condition;
	information = dia_torlof_respekt_info;
	permanent = FALSE;
	description = "Jak si vyslouím respekt ostatních oldnéøù?";
};


func int dia_torlof_respekt_condition()
{
	if((TORLOF_GO == TRUE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_torlof_respekt_info()
{
	AI_Output(other,self,"DIA_Torlof_Respekt_15_00");	//Jak si vyslouím respekt ostatních oldnéøù?
	AI_Output(self,other,"DIA_Torlof_Respekt_01_01");	//Vìtšinì z nich bude staèit, kdy splníš svùj úkol a projdeš mım testem.
	AI_Output(self,other,"DIA_Torlof_Respekt_01_02");	//Nìkteré ale budeš muset pøesvìdèit jinak a sám musíš zjistit jak.
	AI_Output(self,other,"DIA_Torlof_Respekt_01_03");	//Nìkteøí budou chtít vyuít toho, v jaké jsi situaci, jinım se prostì nebude líbit tvoje tváø.
	AI_Output(self,other,"DIA_Torlof_Respekt_01_04");	//Mìl by ses snait najít spoleènou øeè s co nejvíce z nich - ale kdy nepomùe nic jiného, mùeš se vdycky utkat v souboji.
	AI_Output(self,other,"DIA_Torlof_Respekt_01_05");	//Kdy vyhraješ, získáš si u vìtšiny uznání. Dej si ale pozor, abys nìkoho náhodou nezabil. V tom pøípadì bys byl v pìkné kaši.
	Log_CreateTopic(TOPIC_SLDRESPEKT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SLDRESPEKT,LOG_RUNNING);
	b_logentry(TOPIC_SLDRESPEKT,"Splním-li Torlofovu zkoušku, získám si tím respekt i u ostatních oldnéøù. Také na nì mohu zapùsobit, pokud nìkteré z nich pøemùu v souboji.");
};


instance DIA_TORLOF_DUELLREGELN(C_INFO)
{
	npc = sld_801_torlof;
	nr = 5;
	condition = dia_torlof_duellregeln_condition;
	information = dia_torlof_duellregeln_info;
	permanent = FALSE;
	description = "Jaká jsou pravidla pro souboj?";
};


func int dia_torlof_duellregeln_condition()
{
	if(Npc_KnowsInfo(other,dia_torlof_respekt) || Npc_KnowsInfo(other,dia_jarvis_missionko))
	{
		return TRUE;
	};
};

func void dia_torlof_duellregeln_info()
{
	AI_Output(other,self,"DIA_Torlof_Duellregeln_15_00");	//Jaká jsou pravidla pro souboj?
	AI_Output(self,other,"DIA_Torlof_Duellregeln_01_01");	//Je to prosté. Pøed prvním úderem musejí mít oba soupeøi monost vytasit zbraò.
	AI_Output(self,other,"DIA_Torlof_Duellregeln_01_02");	//Nemùeš jen tak nìkoho propíchnout bez varování.
	AI_Output(self,other,"DIA_Torlof_Duellregeln_01_03");	//Musí dojít k nìjaké formì ústní vızvy. Uráce, nebo jinému dùvodu k boji.
	AI_Output(self,other,"DIA_Torlof_Duellregeln_01_04");	//Do takového souboje se nebude nikdo jinı míchat. Leda e by bìhem nìj nìkdo z tìch dvou zemøel.
	b_logentry(TOPIC_SLDRESPEKT,"Pravidla souboje: souboj musí zaèít vızvou, aby do nìj ji nikdo další nezasahoval. Také pøi nìm nikdo nesmí bıt zabit.");
};


instance DIA_TORLOF_DEINESTIMME(C_INFO)
{
	npc = sld_801_torlof;
	nr = 6;
	condition = dia_torlof_deinestimme_condition;
	information = dia_torlof_deinestimme_info;
	permanent = FALSE;
	description = "A co ty? Budeš pro mì hlasovat?";
};


func int dia_torlof_deinestimme_condition()
{
	if((TORLOF_GO == TRUE) && (other.guild == GIL_NONE) && (MIS_TORLOF_HOLPACHTVONSEKOB != LOG_SUCCESS) && (MIS_TORLOF_BENGARMILIZKLATSCHEN != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_torlof_deinestimme_info()
{
	AI_Output(other,self,"DIA_Torlof_DeineStimme_15_00");	//A co ty? Budeš pro mì hlasovat?
	AI_Output(self,other,"DIA_Torlof_DeineStimme_01_01");	//Pokud prokáeš, e jsi schopnı plnit úkoly oldnéøe, tak ano.
};


var int points_sld;

instance DIA_TORLOF_RUF(C_INFO)
{
	npc = sld_801_torlof;
	nr = 7;
	condition = dia_torlof_ruf_condition;
	information = dia_torlof_ruf_info;
	permanent = TRUE;
	description = "Jak to vypadá s mojí reputací mezi oldnéøi?";
};


func int dia_torlof_ruf_condition()
{
	if((TORLOF_GO == TRUE) && (TORLOF_GENUGSTIMMEN == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_torlof_ruf_info()
{
	AI_Output(other,self,"DIA_Torlof_RUF_15_00");	//Jak to vypadá s mojí reputací mezi oldnéøi?
	AI_Output(self,other,"DIA_Torlof_RUF_01_01");	//Tak se na to podívejme...
	POINTS_SLD = 0;
	if(Npc_IsDead(sld_wolf))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(sld_wolf.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_02");	//Wolf nemá nic proti tomu, aby ses pøidal.
		POINTS_SLD = POINTS_SLD + 1;
	};
	if(Npc_IsDead(jarvis))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(MIS_JARVIS_SLDKO == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_03");	//Jarvis si myslí, e stojíš na správné stranì.
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(jarvis.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_04");	//Jarvis si stále není jistı, jestli stojíš na správné stranì.
		AI_Output(self,other,"DIA_Torlof_RUF_01_05");	//Nechce, aby nìkdo další tancoval tak, jak Sylvio píská. Kdy jsme u toho, tak já také ne.
	};
	if(Npc_IsDead(cord))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(CORD_APPROVED == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_06");	//Cord si myslí, e bys mohl bıt dost dobrı na to, abychom tì pøijali.
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(cord.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_07");	//Podle Cordova názoru se budeš muset nejdøív nauèit poøádnì zacházet s meèem, ne se budeš moci pøidat.
	};
	if(Npc_IsDead(cipher))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if((MIS_CIPHER_PAKET == LOG_SUCCESS) || (MIS_CIPHER_BRINGWEED == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_08");	//Cipher øíká, e pro nìj bylo od zaèátku jasné, e by ses mìl pøidat. Vypadá to, e ho nìco vánì potìšilo.
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(cipher.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_09");	//Cipher øíká, e mu dluíš laskavost, a e víš, o èem je øeè.
	};
	if(Npc_IsDead(rod))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(Npc_HasItems(rod,itmw_2h_rod) == 0)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_10");	//Rod chce jen dostat svùj meè zpátky.
	}
	else if((rod.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (ROD_WETTEGEWONNEN == TRUE))
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_11");	//Zdá se, es Roda pøesvìdèil o tom, e jsi dostateènì silnı.
		if(rod.aivar[AIV_DEFEATEDBYPLAYER] == FALSE)
		{
			POINTS_SLD = POINTS_SLD + 1;
		};
	}
	else if(rod.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_12");	//Rod si myslí, e jsi slaboch.
	};
	if(Npc_IsDead(sentenza))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(Npc_HasItems(sentenza,itmi_gold) >= 50)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_13");	//Sentenza pro tebe ruku zvedne. Øíká, e jsi se zachoval velice rozumnì.
		POINTS_SLD = POINTS_SLD + 1;
		TORLOF_SENTENZACOUNTED = TRUE;
	}
	else if(sentenza.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_14");	//Sentenza pro tebe ruku nezvedne. Øíká, e mu stále dluíš 50 zlatıch.
	};
	if(Npc_IsDead(raoul))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(raoul.aivar[AIV_DEFEATEDBYPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_15");	//Raoul je proti tobì. Myslím, e tì nemùe vystát.
	};
	if(Npc_IsDead(bullco))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(bullco.aivar[AIV_DEFEATEDBYPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_16");	//O Sylviovi a Bullcovi mluvit nemusím. Ti dva tupci jsou proti kadému.
	};
	if(Npc_IsDead(buster))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(BUSTER_DUELL == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_17");	//Buster øíká, e jsi v pohodì.
		if(buster.aivar[AIV_DEFEATEDBYPLAYER] == FALSE)
		{
			AI_Output(self,other,"DIA_Torlof_RUF_01_18");	//I kdy jsi prohrál.
		};
	}
	else if(buster.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_19");	//Buster øíká, e kdy tì vyzval, tak jsi vymìkl.
		AI_Output(self,other,"DIA_Torlof_RUF_01_20");	//To nebyl dobrı nápad. Moná bys mìl za ním zajít a vyzvat ho.
	};
	if(Npc_IsDead(dar))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(DAR_LOSTAGAINSTCIPHER == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_21");	//A Dar øíká, e jsi vanil. Ale jeho hlas tady moc neznamená.
	};
	if(POINTS_SLD > 0)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_22");	//Zbytek oldnéøù neøekl nic.
	};
	if((MIS_TORLOF_HOLPACHTVONSEKOB != LOG_SUCCESS) && (MIS_TORLOF_BENGARMILIZKLATSCHEN != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_23");	//Vìtšina z nich èeká, jak si povedeš bìhem zkoušky.
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_24");	//Vìtšinu z nich jsi pøesvìdèil tím, e jsi prošel zkouškou.
		if(CORD_RANGERHELP_TORLOFSPROBE == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Torlof_RUF_01_00");	//(úšklebek) Dokonce i Cord trochu pomohl ...
			POINTS_SLD = POINTS_SLD + 4;
		}
		else if(MIS_TORLOF_HOLPACHTVONSEKOB == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Torlof_RUF_01_25");	//I kdy hodnì z nich øíká, e pøesvìdèit farmáøe, aby zaplatil svùj nájem, bylo na zkoušku moc jednoduché.
			POINTS_SLD = POINTS_SLD + 3;
		}
		else
		{
			POINTS_SLD = POINTS_SLD + 5;
		};
		AI_Output(self,other,"DIA_Torlof_RUF_01_26");	//Mùj hlas kadopádnì máš.
		POINTS_SLD = POINTS_SLD + 1;
	};
	if(SLD_DUELLE_GEWONNEN >= 3)
	{
		POINTS_SLD = POINTS_SLD + 1;
		if(POINTS_SLD >= 9)
		{
			AI_Output(self,other,"DIA_Torlof_RUF_01_27");	//A vyhrál jsi nìkolik èestnıch soubojù.
			AI_Output(self,other,"DIA_Torlof_RUF_01_28");	//To hodnì oldnéøù respektuje.
		}
		else
		{
			AI_Output(self,other,"DIA_Torlof_RUF_01_29");	//Kadopádnì jsi vyhrál nìkolik èestnıch soubojù.
		};
	};
	if(POINTS_SLD >= 9)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_30");	//Vìtšina oldnéøù stojí za tebou - co se nás tıèe, mùeš u nás zaèít kdy se ti zlíbí.
		AI_Output(self,other,"DIA_Torlof_RUF_01_31");	//Bì za Leem. Vysvìtlí ti všechno potøebné.
		TORLOF_GENUGSTIMMEN = TRUE;
		b_logentry(TOPIC_BECOMESLD,"Mezi oldnéøi u jsem si vydobyl dost úcty. Nyní bych mìl prohodit pár slov s Leem.");
	}
	else if(POINTS_SLD >= 7)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_32");	//To je dost, ale poøád to nestaèí.
		AI_Output(self,other,"DIA_Torlof_RUF_01_33");	//Budeš se muset s chlapci ještì chvíli prát.
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_34");	//Nemáš to ani zdaleka za sebou, chlapèe. Jestli chceš, abychom tì pøijali mezi sebe, budeš pro to muset udìlat trochu víc.
	};
};


instance DIA_TORLOF_AUFGABEN(C_INFO)
{
	npc = sld_801_torlof;
	nr = 8;
	condition = dia_torlof_aufgaben_condition;
	information = dia_torlof_aufgaben_info;
	permanent = FALSE;
	description = "Jaké mám jako oldnéø povinnosti?";
};


func int dia_torlof_aufgaben_condition()
{
	if((TORLOF_GO == TRUE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_torlof_aufgaben_info()
{
	AI_Output(other,self,"DIA_Torlof_Aufgaben_15_00");	//Jaké mám jako oldnéø povinnosti?
	AI_Output(self,other,"DIA_Torlof_Aufgaben_01_01");	//Onar nás najal ze dvou dùvodù: chce, abychom od nìj dreli dál domobranu a udrovali poøádek na jeho farmách.
	AI_Output(self,other,"DIA_Torlof_Aufgaben_01_02");	//To zahrnuje vybírání pachtovného, kdy nebudou chtít drobní farmáøi zaplatit.
	AI_Output(self,other,"DIA_Torlof_Aufgaben_01_03");	//Take, co to bude?
	Info_ClearChoices(dia_torlof_aufgaben);
	Info_AddChoice(dia_torlof_aufgaben,"Nech mì vybrat ten nájem!",dia_torlof_aufgaben_pacht);
	Info_AddChoice(dia_torlof_aufgaben,"Vypoøádám se s domobranou, ádné obavy!",dia_torlof_aufgaben_miliz);
};

func void b_torlof_holpachtvonsekob()
{
	AI_Output(self,other,"B_Torlof_HolPachtvonSekob_01_00");	//Dobrá. Poslouchej. Farmáø Sekob u nìkolik tıdnù Onarovi nezaplatil nájem.
	AI_Output(self,other,"B_Torlof_HolPachtvonSekob_01_01");	//Onar po nìm chce, aby vysolil 50 zlatıch. Nìjaké otázky?
	AI_Output(other,self,"B_Torlof_HolPachtvonSekob_15_02");	//Kde je Sekobova farma?
	AI_Output(self,other,"B_Torlof_HolPachtvonSekob_01_03");	//V severní èásti údolí. Kdy se díváš odsud, je to napravo u té velké køiovatky.
	AI_Output(self,other,"B_Torlof_HolPachtvonSekob_01_04");	//Kdybys mìl nìjaké problémy, farmáøi na polích ti pomùou najít cestu.
	MIS_TORLOF_HOLPACHTVONSEKOB = LOG_RUNNING;
	sekob.flags = 0;
	CreateInvItems(sekob,itmi_gold,50);
	Log_CreateTopic(TOPIC_TORLOFPACHT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TORLOFPACHT,LOG_RUNNING);
	b_logentry(TOPIC_TORLOFPACHT,"Torlof mì poádal, abych od sedláka Sekoba vyinkasoval nájemné, které èiní 50 zlaákù.");
};

func void b_torlof_bengarmilizklatschen()
{
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_00");	//Farmáø Bengar si stìoval, e mu domobrana z mìsta v poslední dobì leze na nervy.
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_01");	//Vyvíjejí na toho farmáøe nátlak - nejspíš chtìjí, aby se otoèil k Onarovi zády.
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_02");	//Chci, abys šel na jeho farmu a vyjasnil domobranì, e tady nemají co pohledávat! Otázky?
	AI_Output(other,self,"B_Torlof_BengarMilizKlatschen_15_03");	//Jak najdu Bengarovu farmu?
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_04");	//Na jihozápadì údolí je velké schodištì, které vede na planinu. Tam má Bengar svou farmu.
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_05");	//Kdyby ses ztratil, zeptej se farmáøù na polích, kudy se dát.
	MIS_TORLOF_BENGARMILIZKLATSCHEN = LOG_RUNNING;
	bengar.flags = 0;
	Wld_InsertNpc(mil_335_rumbold,"FARM3");
	Wld_InsertNpc(mil_336_rick,"FARM3");
	b_initnpcglobals();
	Log_CreateTopic(TOPIC_TORLOFMILIZ,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TORLOFMILIZ,LOG_RUNNING);
	b_logentry(TOPIC_TORLOFMILIZ,"Torlof mì povìøil, abych na planinì ze statku sedláka Bengara vyhnal domobranu.");
};

func void dia_torlof_aufgaben_pacht()
{
	AI_Output(other,self,"DIA_Torlof_Aufgaben_Pacht_15_00");	//Nech mì vybrat ten nájem!
	b_torlof_holpachtvonsekob();
	TORLOF_PROBE = PROBE_SEKOB;
	Info_ClearChoices(dia_torlof_aufgaben);
};

func void dia_torlof_aufgaben_miliz()
{
	AI_Output(other,self,"DIA_Torlof_Aufgaben_Miliz_15_00");	//Vypoøádám se s domobranou, ádné obavy!
	b_torlof_bengarmilizklatschen();
	TORLOF_PROBE = PROBE_BENGAR;
	Info_ClearChoices(dia_torlof_aufgaben);
};


var int torlof_theothermission_day;

func void b_torlof_theothermissionday()
{
	if(TORLOF_THEOTHERMISSION_DAY < (Wld_GetDay() - 1))
	{
		AI_Output(self,other,"B_Torlof_TheOtherMissionDay_01_00");	//Trvalo ti to strašnì dlouho. Onar nebude mít radost.
		TORLOF_THEOTHERMISSION_TOOLATE = TRUE;
		if(ENTEROW_KAPITEL2 == TRUE)
		{
			AI_Output(self,other,"DIA_Torlof_Add_01_00");	//A je mu jedno, jestli paladiny nìco seere v Hornickém údolí, nebo ne.
		};
	}
	else
	{
		AI_Output(self,other,"B_Torlof_TheOtherMissionDay_01_01");	//Dobrá práce! A budu mít nìco dalšího, dám ti vìdìt.
	};
};


instance DIA_TORLOF_SEKOBSUCCESS(C_INFO)
{
	npc = sld_801_torlof;
	nr = 9;
	condition = dia_torlof_sekobsuccess_condition;
	information = dia_torlof_sekobsuccess_info;
	permanent = TRUE;
	description = "Vybral jsem nájem od Sekoba.";
};


func int dia_torlof_sekobsuccess_condition()
{
	if(MIS_TORLOF_HOLPACHTVONSEKOB == LOG_RUNNING)
	{
		if((sekob.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || Npc_IsDead(sekob))
		{
			return TRUE;
		};
	};
};

func void dia_torlof_sekobsuccess_info()
{
	AI_Output(other,self,"DIA_Torlof_SekobSuccess_15_00");	//Vybral jsem nájem od Sekoba.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Torlof_SekobSuccess_01_01");	//A? Zaplatil dobrovolnì?
		if(Npc_IsDead(sekob))
		{
			AI_Output(other,self,"DIA_Torlof_SekobTot_15_00");	//No, potkal ho smrtelnı úraz...
		}
		else
		{
			AI_Output(other,self,"DIA_Torlof_SekobSuccess_15_02");	//Nejdøív jsem ho musel pøesvìdèit.
		};
		if(TORLOF_PROBE == PROBE_SEKOB)
		{
			AI_Output(self,other,"DIA_Torlof_SekobSuccess_01_03");	//Dobrá práce! Prošel jsi zkouškou. To pøesvìdèí hodnì oldnéøù o tom, e víš, co se sluší a patøí.
		}
		else
		{
			b_torlof_theothermissionday();
		};
		MIS_TORLOF_HOLPACHTVONSEKOB = LOG_SUCCESS;
		b_giveplayerxp(XP_TORLOF_SEKOBSKOHLEBEKOMMEN);
		b_logentry(TOPIC_BECOMESLD,"Splnil jsem úkol, kterı mi svìøil Torlof.");
		TORLOF_PROBEBESTANDEN = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_SekobSuccess_01_04");	//A? Utratil jsi to snad za chlast? Pøines mi peníze! A hezky zèerstva!
	};
};


instance DIA_TORLOF_BENGARSUCCESS(C_INFO)
{
	npc = sld_801_torlof;
	nr = 10;
	condition = dia_torlof_bengarsuccess_condition;
	information = dia_torlof_bengarsuccess_info;
	permanent = FALSE;
	description = "Postaral jsem se o Bengarùv problém s domobranou.";
};


func int dia_torlof_bengarsuccess_condition()
{
	if((MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_RUNNING) && Npc_IsDead(rumbold) && Npc_IsDead(rick))
	{
		return TRUE;
	};
};

func void dia_torlof_bengarsuccess_info()
{
	AI_Output(other,self,"DIA_Torlof_BengarSuccess_15_00");	//Postaral jsem se o Bengarùv problém s domobranou.
	AI_Output(self,other,"DIA_Torlof_BengarSuccess_01_01");	//Ujistil ses, e nebudou zítra zase stát na jeho zápraí?
	AI_Output(other,self,"DIA_Torlof_BengarSuccess_15_02");	//To by s tím mìli docela potíe...
	AI_Output(self,other,"DIA_Torlof_BengarSuccess_01_03");	//Dobrá práce!
	if(TORLOF_PROBE == PROBE_BENGAR)
	{
		AI_Output(self,other,"DIA_Torlof_BengarSuccess_01_04");	//Prošel jsi zkouškou. Kdy dokáeš zvládnout domobranu, vìtšina tì tady bude uznávat.
	}
	else
	{
		b_torlof_theothermissionday();
	};
	MIS_TORLOF_BENGARMILIZKLATSCHEN = LOG_SUCCESS;
	b_giveplayerxp(XP_BENGAR_MILIZKLATSCHEN);
	b_logentry(TOPIC_BECOMESLD,"U jsem splnil úkol, kterı mi Torlof zadal.");
	TORLOF_PROBEBESTANDEN = TRUE;
};


instance DIA_TORLOF_WELCOME(C_INFO)
{
	npc = sld_801_torlof;
	nr = 11;
	condition = dia_torlof_welcome_condition;
	information = dia_torlof_welcome_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_torlof_welcome_condition()
{
	if((other.guild == GIL_SLD) && (KAPITEL <= 1))
	{
		return TRUE;
	};
};

func void dia_torlof_welcome_info()
{
	AI_Output(self,other,"DIA_Torlof_Welcome_01_00");	//Vítej mezi oldnéøi, chlapèe!
	AI_Output(other,self,"DIA_Torlof_Welcome_15_01");	//Díky!
	AI_Output(self,other,"DIA_Torlof_Welcome_01_02");	//Jakmile pro tebe budu mít nìco na práci, dám ti vìdìt.
};


var int torlof_knowsdragons;

func void b_torlof_dragons()
{
	AI_Output(self,other,"DIA_Torlof_Add_01_01");	//Kde jsi byl?
	AI_Output(other,self,"DIA_Torlof_Add_15_02");	//Byl jsem v Hornickém údolí! Jsou tam draci! Dali paladinùm pìknì zabrat!
	AI_Output(self,other,"DIA_Torlof_Add_01_03");	//Fakt? Take na všech tìch povídaèkách vánì nìco je!
	AI_Output(self,other,"DIA_Torlof_Add_01_04");	//Leeho to bude zajímat.
	TORLOF_KNOWSDRAGONS = TRUE;
};


instance DIA_TORLOF_THEOTHERMISSION(C_INFO)
{
	npc = sld_801_torlof;
	nr = 11;
	condition = dia_torlof_theothermission_condition;
	information = dia_torlof_theothermission_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_torlof_theothermission_condition()
{
	if((other.guild == GIL_SLD) && (KAPITEL >= 2))
	{
		return TRUE;
	};
};

func void dia_torlof_theothermission_info()
{
	if((TORLOF_KNOWSDRAGONS == FALSE) && (ENTER_OLDWORLD_FIRSTTIME_TRIGGER_ONETIME == TRUE))
	{
		b_torlof_dragons();
	};
	AI_Output(self,other,"DIA_Torlof_TheOtherMission_01_00");	//Dobøe, e jsi tady. Mám pro tebe nìco na práci.
	AI_Output(other,self,"DIA_Torlof_TheOtherMission_15_01");	//Co je?
	if(TORLOF_PROBE == PROBE_BENGAR)
	{
		b_torlof_holpachtvonsekob();
	}
	else
	{
		b_torlof_bengarmilizklatschen();
	};
	AI_Output(self,other,"DIA_Torlof_TheOtherMission_01_02");	//A postarej se o to, a je to do zítra hotové!
	TORLOF_THEOTHERMISSION_DAY = Wld_GetDay();
};


instance DIA_TORLOF_DRAGONS(C_INFO)
{
	npc = sld_801_torlof;
	nr = 12;
	condition = dia_torlof_dragons_condition;
	information = dia_torlof_dragons_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_torlof_dragons_condition()
{
	if((ENTER_OLDWORLD_FIRSTTIME_TRIGGER_ONETIME == TRUE) && (KAPITEL <= 3) && (other.guild == GIL_SLD) && (TORLOF_KNOWSDRAGONS == FALSE))
	{
		return TRUE;
	};
};

func void dia_torlof_dragons_info()
{
	b_torlof_dragons();
};


instance DIA_TORLOF_WHATCANYOUTEACH(C_INFO)
{
	npc = sld_801_torlof;
	nr = 140;
	condition = dia_torlof_whatcanyouteach_condition;
	information = dia_torlof_whatcanyouteach_info;
	permanent = FALSE;
	description = "Mùeš mi pomoci vylepšit moje schopnosti?";
};


func int dia_torlof_whatcanyouteach_condition()
{
	return TRUE;
};

func void dia_torlof_whatcanyouteach_info()
{
	AI_Output(other,self,"DIA_Torlof_WhatCanYouTeach_15_00");	//Mùeš mi pomoci vylepšit moje schopnosti?
	AI_Output(self,other,"DIA_Torlof_WhatCanYouTeach_01_01");	//Mohl bych ti ukázat, jak lépe vyuít svou sílu pøi boji na blízko.
	AI_Output(self,other,"DIA_Torlof_WhatCanYouTeach_01_02");	//Spousta bojovníkù je strašnì slabá, protoe nemají správnou techniku, s její pomocí by správnì vyuívali svou sílu.
	AI_Output(self,other,"DIA_Torlof_WhatCanYouTeach_01_03");	//To samé platí u støelnıch zbraní a obratnosti.
	Log_CreateTopic(TOPIC_SOLDIERTEACHER,LOG_NOTE);
	b_logentry(TOPIC_SOLDIERTEACHER,"Torlof mi pomùe vylepšit obratnost a sílu.");
};


var int torlof_merke_str;
var int torlof_merke_dex;

instance DIA_TORLOF_TEACH(C_INFO)
{
	npc = sld_801_torlof;
	nr = 150;
	condition = dia_torlof_teach_condition;
	information = dia_torlof_teach_info;
	permanent = TRUE;
	description = "Chci si vylepšit schopnosti!";
};


func int dia_torlof_teach_condition()
{
	if(Npc_KnowsInfo(other,dia_torlof_whatcanyouteach))
	{
		return TRUE;
	};
};

func void dia_torlof_teach_info()
{
	AI_Output(other,self,"DIA_Torlof_Teach_15_00");	//Chci si vylepšit schopnosti!
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG) || (other.guild == GIL_NONE))
	{
		TORLOF_MERKE_STR = other.attribute[ATR_STRENGTH];
		TORLOF_MERKE_DEX = other.attribute[ATR_DEXTERITY];
		Info_ClearChoices(dia_torlof_teach);
		Info_AddChoice(dia_torlof_teach,DIALOG_BACK,dia_torlof_teach_back);
		Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_torlof_teach_dex_1);
		Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_torlof_teach_dex_5);
		Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_torlof_teach_str_1);
		Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_torlof_teach_str_5);
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_Teach_01_01");	//Øekl jsem, e bych ti MOHL pomoci, ne e ti POMÙU.
		AI_Output(self,other,"DIA_Torlof_Teach_01_02");	//Dokud nejsi jedním z nás, musíš si najít nìkoho jiného, kdo by tì uèil!
	};
};

func void dia_torlof_teach_back()
{
	if((TORLOF_MERKE_STR < other.attribute[ATR_STRENGTH]) || (TORLOF_MERKE_DEX < other.attribute[ATR_DEXTERITY]))
	{
		AI_Output(self,other,"DIA_Torlof_Teach_Back_01_00");	//Dobrá! Nyní dokáeš pouívat svoje schopnosti lépe!
	};
	Info_ClearChoices(dia_torlof_teach);
};

func void dia_torlof_teach_str_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_MAX);
	Info_ClearChoices(dia_torlof_teach);
	Info_AddChoice(dia_torlof_teach,DIALOG_BACK,dia_torlof_teach_back);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_torlof_teach_dex_1);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_torlof_teach_dex_5);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_torlof_teach_str_1);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_torlof_teach_str_5);
};

func void dia_torlof_teach_str_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_MAX);
	Info_ClearChoices(dia_torlof_teach);
	Info_AddChoice(dia_torlof_teach,DIALOG_BACK,dia_torlof_teach_back);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_torlof_teach_dex_1);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_torlof_teach_dex_5);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_torlof_teach_str_1);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_torlof_teach_str_5);
};

func void dia_torlof_teach_dex_1()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,1,T_MED);
	Info_ClearChoices(dia_torlof_teach);
	Info_AddChoice(dia_torlof_teach,DIALOG_BACK,dia_torlof_teach_back);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_torlof_teach_dex_1);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_torlof_teach_dex_5);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_torlof_teach_str_1);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_torlof_teach_str_5);
};

func void dia_torlof_teach_dex_5()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,5,T_MED);
	Info_ClearChoices(dia_torlof_teach);
	Info_AddChoice(dia_torlof_teach,DIALOG_BACK,dia_torlof_teach_back);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_torlof_teach_dex_1);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_torlof_teach_dex_5);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_torlof_teach_str_1);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_torlof_teach_str_5);
};


instance DIA_TORLOF_KAP3_EXIT(C_INFO)
{
	npc = sld_801_torlof;
	nr = 999;
	condition = dia_torlof_kap3_exit_condition;
	information = dia_torlof_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_torlof_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_torlof_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TORLOF_DEMENTOREN(C_INFO)
{
	npc = sld_801_torlof;
	nr = 30;
	condition = dia_torlof_dementoren_condition;
	information = dia_torlof_dementoren_info;
	description = "Nemáš pro mì nìco na práci?";
};


func int dia_torlof_dementoren_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_torlof_dementoren_info()
{
	AI_Output(other,self,"DIA_Torlof_DEMENTOREN_15_00");	//Nemáš pro mì nìco na práci?
	AI_Output(self,other,"DIA_Torlof_DEMENTOREN_01_01");	//Vidìls ty chlapíky s èernımi kápìmi, co se potulují po okolí? Øeknu ti, bìhá mi z nich mráz po zádech.
	AI_Output(self,other,"DIA_Torlof_DEMENTOREN_01_02");	//Kdy jsem byl na moøi, vidìl jsem pár vánì divnıch vìcí, ale tihle lidi mì vánì dìsí.
	AI_Output(self,other,"DIA_Torlof_DEMENTOREN_01_03");	//Šli smìrem na tábor banditù, co je v horách na jiním konci údolí.
	AI_Output(self,other,"DIA_Torlof_DEMENTOREN_01_04");	//Moná by ses tam mìl vydat, zjistit, co jsou zaè a vypoøádat se s nimi!
	Wld_InsertNpc(castleminedmt,"FP_STAND_DEMENTOR_KDF_12");
	Log_CreateTopic(TOPIC_TORLOF_DMT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TORLOF_DMT,LOG_RUNNING);
	b_logentry(TOPIC_TORLOF_DMT,"Pár tìch zakuklencù se nejspíš bude skrıvat v táboøe banditù v horách jinì od údolí. Torlofovi poøádnì pijí krev - mám pro nìj tenhle problém vyøešit.");
	MIS_TORLOF_DMT = LOG_RUNNING;
};


instance DIA_TORLOF_DMTSUCCESS(C_INFO)
{
	npc = sld_801_torlof;
	nr = 30;
	condition = dia_torlof_dmtsuccess_condition;
	information = dia_torlof_dmtsuccess_info;
	description = "Ti èernokápníci z hor u nejsou mezi námi.";
};


func int dia_torlof_dmtsuccess_condition()
{
	if((MIS_TORLOF_DMT == LOG_RUNNING) && Npc_IsDead(castleminedmt))
	{
		return TRUE;
	};
};

func void dia_torlof_dmtsuccess_info()
{
	AI_Output(other,self,"DIA_Torlof_DmtSuccess_15_00");	//Ti èernokápníci z hor u nejsou mezi námi.
	AI_Output(self,other,"DIA_Torlof_DmtSuccess_01_01");	//Dokázal jsi je vyøídit? Frajer!
	AI_Output(self,other,"DIA_Torlof_DmtSuccess_01_02");	//Ani za mák jsem tìm chlapíkùm nevìøil. Jenom by budili trable.
	MIS_TORLOF_DMT = LOG_SUCCESS;
	b_giveplayerxp(XP_TORLOF_DMT);
};


instance DIA_TORLOF_KAP4_EXIT(C_INFO)
{
	npc = sld_801_torlof;
	nr = 999;
	condition = dia_torlof_kap4_exit_condition;
	information = dia_torlof_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_torlof_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_torlof_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TORLOF_WOISTSYLVIO(C_INFO)
{
	npc = sld_801_torlof;
	nr = 40;
	condition = dia_torlof_woistsylvio_condition;
	information = dia_torlof_woistsylvio_info;
	description = "Nìkteøí oldnéøi odešli?";
};


func int dia_torlof_woistsylvio_condition()
{
	if((MIS_READYFORCHAPTER4 == TRUE) || (KAPITEL == 4))
	{
		return TRUE;
	};
};

func void dia_torlof_woistsylvio_info()
{
	AI_Output(other,self,"DIA_Torlof_WOISTSYLVIO_15_00");	//Nìkteøí oldnéøi odešli?
	AI_Output(self,other,"DIA_Torlof_WOISTSYLVIO_01_01");	//Sylvio sebral pár chlapcù a zmizel s nimi na druhou stranu prùsmyku.
	AI_Output(self,other,"DIA_Torlof_WOISTSYLVIO_01_02");	//Povídá se, e se tam objevili draci. Kdy se to doslechl, nešlo ho zastavit.
	AI_Output(self,other,"DIA_Torlof_WOISTSYLVIO_01_03");	//Kdo ví? Za draèí trofej by dostal na trhu hromadu penìz.
	AI_Output(self,other,"DIA_Torlof_WOISTSYLVIO_01_04");	//To pro mì není. Jsem námoøník. Patøím na moøe a ne do nìjakého dusného draèího doupìte.
};


instance DIA_TORLOF_KAP5_EXIT(C_INFO)
{
	npc = sld_801_torlof;
	nr = 999;
	condition = dia_torlof_kap5_exit_condition;
	information = dia_torlof_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_torlof_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_torlof_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TORLOF_BEMYCAPTAIN(C_INFO)
{
	npc = sld_801_torlof;
	nr = 51;
	condition = dia_torlof_bemycaptain_condition;
	information = dia_torlof_bemycaptain_info;
	description = "Ty jsi námoøník?";
};


func int dia_torlof_bemycaptain_condition()
{
	if((KAPITEL == 5) && (MIS_SCKNOWSWAYTOIRDORATH == TRUE))
	{
		return TRUE;
	};
};

func void dia_torlof_bemycaptain_info()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN_15_00");	//Ty jsi námoøník?
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_01");	//Koneènì tì to trklo? Jo, ksakru, jsem námoøník. Proè se ptáš?
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN_15_02");	//Hodily by se mi tvoje schopnosti. Potøebuji se dostat na jeden ostrov.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_03");	//(zasmìje se) Na ostrov? Vdy ani nemáš loï, nato posádku, která by ji øídila.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_04");	//Ne, chlapèe. Jestli chceš vyuít mıch slueb jako kapitána a uèitele síly, musíš mi nejdøív dokázat, e víš, o èem mluvíš.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_05");	//Kromì toho mám u tak dost svıch vlastních starostí. Paladinové se nestáhli z mìsta, jak jsme oèekávali.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_06");	//Muselo by se stát nìco opravdu váného, aby vyklidili pole.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_07");	//Bì do hradu v Hornickém údolí. Ukradni stráím klíè od hlavní brány a otevøi ji. Skøeti se u postarají o zbytek!
	Log_CreateTopic(TOPIC_CAPTAIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CAPTAIN,LOG_RUNNING);
	b_logentry(TOPIC_CAPTAIN,"Ještì ne Torlof pøijme funkci kapitána, musím pøimìt paladiny, aby opustili mìsto. Kdy mu pomohu, spoleènì na hradì v Hornickém údolí nastraíme malou lest. Musím stráci ukrást klíè od hlavní brány a otevøít ji, aby do hradu mohli proniknout skøeti. Tohle neštìstí, jak doufá, pøimìje paladiny, aby odešli z mìsta a vydali se na pomoc svım kamarádùm.");
};


instance DIA_TORLOF_BEMYCAPTAIN2(C_INFO)
{
	npc = sld_801_torlof;
	nr = 52;
	condition = dia_torlof_bemycaptain2_condition;
	information = dia_torlof_bemycaptain2_info;
	description = "Brána do hradu v Hornickém údolí je otevøená a zaseknutá...";
};


func int dia_torlof_bemycaptain2_condition()
{
	if((MIS_OCGATEOPEN == TRUE) && Npc_KnowsInfo(other,dia_torlof_bemycaptain))
	{
		return TRUE;
	};
};

func void dia_torlof_bemycaptain2_info()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN2_15_00");	//Brána do hradu v Hornickém údolí je otevøená a zaseknutá. Skøetùm u nic nebrání v tom, aby nevzali hrad útokem.
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN2_15_01");	//Paladinové utrpìli v bitvì se skøety váné ztráty.
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN2_15_02");	//Øekl bych, e u nebude trvat dlouho, ne se paladinové odsud z mìsta vydají do Hornického údolí, aby dostali své kamarády pryè z hradu.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN2_01_03");	//To jsou pøíjemné zprávy. Take u nic nestojí v cestì tomu, abych utekl z tohohle prokletého kraje.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_TORLOF_BEMYCAPTAIN3(C_INFO)
{
	npc = sld_801_torlof;
	nr = 53;
	condition = dia_torlof_bemycaptain3_condition;
	information = dia_torlof_bemycaptain3_info;
	permanent = TRUE;
	description = "Teï u mi pomùeš dostat se na ten ostrov?";
};


var int torlof_paidtobecaptain;

func int dia_torlof_bemycaptain3_condition()
{
	if(Npc_KnowsInfo(other,dia_torlof_bemycaptain2) && (TORLOF_PAIDTOBECAPTAIN == FALSE) && (SCGOTCAPTAIN == FALSE))
	{
		return TRUE;
	};
};

func void dia_torlof_bemycaptain3_info()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN3_15_00");	//Teï u mi pomùeš dostat se na ten ostrov?
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_01_01");	//No jasnì. Chtìl jsi jet na nìjakı ostrov. Hmm. Dám ti jeden návrh.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_01_02");	//Zaplatíš mi 2500 zlatıch a já se ujmu velení tvé lodi.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_01_03");	//Navíc tì budu trénovat v síle a obratnosti, kdykoliv to jen budeš chtít.
	Info_ClearChoices(dia_torlof_bemycaptain3);
	Info_AddChoice(dia_torlof_bemycaptain3,"To je strašná spousta penìz.",dia_torlof_bemycaptain3_zuviel);
	Info_AddChoice(dia_torlof_bemycaptain3,"Dobrá. Tady máš své peníze.",dia_torlof_bemycaptain3_ok);
};

func void dia_torlof_bemycaptain3_zuviel()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN3_zuViel_15_00");	//To je strašná spousta penìz.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_zuViel_01_01");	//To jo. Dobrá pomoc je drahá. Nemáš na vıbìr. Tady v okolí nenajdeš nikoho dalšího, kdo by velel tvé lodi.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_zuViel_01_02");	//Tak zapla a nedìlej vlny.
	Info_ClearChoices(dia_torlof_bemycaptain3);
	b_logentry(TOPIC_CAPTAIN,"Torlof je nyní ochoten øídit loï. Bohuel za to ale poaduje 2500 zlaákù.");
};

func void dia_torlof_bemycaptain3_ok()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN3_ok_15_00");	//Dobrá. Tady máš své peníze.
	if(b_giveinvitems(other,self,itmi_gold,2500))
	{
		AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_ok_01_01");	//Nádhera. Teï mi jen pøesnì øekni, co po mnì budeš chtít.
		TORLOF_PAIDTOBECAPTAIN = TRUE;
		b_logentry(TOPIC_CAPTAIN,"Jakmile jsem mu pøedal 2500 zlaákù, je Torlof koneènì pøipraven mì dopravit k cíli.");
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_ok_01_02");	//Snaíš se mì oblbnout pár mincemi? Nejdøív pøines peníze. Pak uvidíme.
	};
	Info_ClearChoices(dia_torlof_bemycaptain3);
};


instance DIA_TORLOF_BEMYCAPTAIN4(C_INFO)
{
	npc = sld_801_torlof;
	nr = 54;
	condition = dia_torlof_bemycaptain4_condition;
	information = dia_torlof_bemycaptain4_info;
	permanent = TRUE;
	description = "Buï mım kapitánem.";
};


func int dia_torlof_bemycaptain4_condition()
{
	if((SCGOTCAPTAIN == FALSE) && (TORLOF_PAIDTOBECAPTAIN == TRUE))
	{
		return TRUE;
	};
};

func void dia_torlof_bemycaptain4_info()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN4_15_00");	//Buï mım kapitánem.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN4_01_01");	//Dobrá. Seeò mi loï a dostateènì silnou posádku a já tì dostanu na ten tvùj mizernı ostrov.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN4_01_02");	//Máš námoøní mapy? Bez nich se moc daleko nedostaneme.
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN4_15_03");	//O to se postarám. Setkáme se v pøístavu.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN4_01_04");	//Jsem vánì zvìdavı, jak to chceš udìlat.
	AI_StopProcessInfos(self);
	SCGOTCAPTAIN = TRUE;
	TORLOFISCAPTAIN = TRUE;
	self.flags = NPC_FLAG_IMMORTAL;
	Npc_ExchangeRoutine(self,"WaitForShipCaptain");
	b_giveplayerxp(XP_CAPTAIN_SUCCESS);
};


instance DIA_TORLOF_LOSFAHREN(C_INFO)
{
	npc = sld_801_torlof;
	nr = 59;
	condition = dia_torlof_losfahren_condition;
	information = dia_torlof_losfahren_info;
	permanent = TRUE;
	description = "Vzhùru na ostrov!";
};


func int dia_torlof_losfahren_condition()
{
	if((TORLOFISCAPTAIN == TRUE) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_torlof_losfahren_info()
{
	AI_Output(other,self,"DIA_Torlof_LOSFAHREN_15_00");	//Vzhùru na ostrov!
	if(b_captainconditions(self) == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_01");	//Dobrá. Dej mi mapy a mùeme vyplout.
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_02");	//(zavolá) Všichni na palubu.
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_03");	//Ujisti se, e máš opravdu všechno, co bys mohl potøebovat. Vracet se nemùeme.
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_04");	//Jestli si jsi jistı, bì se natáhnout do kapitánské kajuty. Za chvíli vyrazíme na cestu.
		AI_StopProcessInfos(self);
		b_captaincallsallonboard(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_05");	//ádná loï, ádná posádka, ádná mapa, ádnı vılet, pøíteli.
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_06");	//Chci vidìt aspoò pìt chlapù ochotnıch a schopnıch plavby.
		AI_StopProcessInfos(self);
	};
};


instance DIA_TORLOF_PERM5_NOTCAPTAIN(C_INFO)
{
	npc = sld_801_torlof;
	nr = 59;
	condition = dia_torlof_perm5_notcaptain_condition;
	information = dia_torlof_perm5_notcaptain_info;
	permanent = TRUE;
	description = "Rozhodl jsem se pro jiného kapitána. Mùeš mi hned vrátit mé peníze.";
};


func int dia_torlof_perm5_notcaptain_condition()
{
	if((SCGOTCAPTAIN == TRUE) && (TORLOFISCAPTAIN == FALSE) && (TORLOF_PAIDTOBECAPTAIN == TRUE))
	{
		return TRUE;
	};
};

func void dia_torlof_perm5_notcaptain_info()
{
	AI_Output(other,self,"DIA_Torlof_PERM5_NOTCAPTAIN_15_00");	//Rozhodl jsem se pro jiného kapitána. Mùeš mi hned vrátit mé peníze.
	AI_Output(self,other,"DIA_Torlof_PERM5_NOTCAPTAIN_01_01");	//To by nešlo. Nic takového. Kdy mi nejdøív zaplatíš a pak nakonec moje sluby odmítáš, je to tvùj problém.
	AI_StopProcessInfos(self);
};


instance DIA_TORLOF_KAP6_EXIT(C_INFO)
{
	npc = sld_801_torlof;
	nr = 999;
	condition = dia_torlof_kap6_exit_condition;
	information = dia_torlof_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_torlof_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_torlof_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TORLOF_PICKPOCKET(C_INFO)
{
	npc = sld_801_torlof;
	nr = 900;
	condition = dia_torlof_pickpocket_condition;
	information = dia_torlof_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_torlof_pickpocket_condition()
{
	return c_beklauen(76,120);
};

func void dia_torlof_pickpocket_info()
{
	Info_ClearChoices(dia_torlof_pickpocket);
	Info_AddChoice(dia_torlof_pickpocket,DIALOG_BACK,dia_torlof_pickpocket_back);
	Info_AddChoice(dia_torlof_pickpocket,DIALOG_PICKPOCKET,dia_torlof_pickpocket_doit);
};

func void dia_torlof_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_torlof_pickpocket);
};

func void dia_torlof_pickpocket_back()
{
	Info_ClearChoices(dia_torlof_pickpocket);
};

