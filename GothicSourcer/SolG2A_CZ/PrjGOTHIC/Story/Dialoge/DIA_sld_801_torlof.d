
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
	AI_Output(self,other,"DIA_Torlof_Hallo_01_00");	//(nevrle) Co po mn� chce�?
};


instance DIA_TORLOF_WANNAJOIN(C_INFO)
{
	npc = sld_801_torlof;
	nr = 2;
	condition = dia_torlof_wannajoin_condition;
	information = dia_torlof_wannajoin_info;
	permanent = FALSE;
	description = "Chci se p�idat k �oldn���m!";
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
	AI_Output(other,self,"DIA_Torlof_WannaJoin_15_00");	//Chci se p�idat k �oldn���m!
	AI_Output(self,other,"DIA_Torlof_WannaJoin_01_01");	//Hm? A pro� si mysl�, �e bych m�l b�t pro, abychom t� sem p�ijali?
};


var int torlof_go;

instance DIA_TORLOF_PROBE(C_INFO)
{
	npc = sld_801_torlof;
	nr = 3;
	condition = dia_torlof_probe_condition;
	information = dia_torlof_probe_info;
	permanent = TRUE;
	description = "Nech m� proj�t zkou�kou!";
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
	AI_Output(other,self,"DIA_Torlof_Probe_15_00");	//Nech m� proj�t zkou�kou!
	AI_Output(self,other,"DIA_Torlof_Probe_01_01");	//Poslal t� za mnou Lee?
	if(Npc_KnowsInfo(other,dia_lee_othersld))
	{
		AI_Output(other,self,"DIA_Torlof_Probe_15_02");	//�ekl, �e mi pom��e�.
		AI_Output(self,other,"DIA_Torlof_Probe_01_03");	//(vzdychne si) Fajn. Tak dobr�. Ne� se k n�m bude� moci p�idat, mus� ud�lat dv� v�ci.
		AI_Output(self,other,"DIA_Torlof_Probe_01_04");	//Za prv� - mus� prok�zat, �e bude� schopn� zvl�dnout �koly, kter� bude� jako �oldn�� dost�vat. S�m t� ozkou��m.
		AI_Output(self,other,"DIA_Torlof_Probe_01_05");	//A za druh� - mus� si vyslou�it respekt ostatn�ch �old�k�.
		TORLOF_GO = TRUE;
		Npc_ExchangeRoutine(self,"Start");
		Log_CreateTopic(TOPIC_BECOMESLD,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_BECOMESLD,LOG_RUNNING);
		b_logentry(TOPIC_BECOMESLD,"M�m-li b�t p�ijat mezi �oldn��e, mus�m proj�t Torlofovou zkou�kou a z�skat si �ctu ostatn�ch.");
	}
	else
	{
		AI_Output(other,self,"DIA_Torlof_Probe_15_06");	//Ne.
		AI_Output(self,other,"DIA_Torlof_Probe_01_07");	//Tak co tady plk�?
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
	description = "Jak si vyslou��m respekt ostatn�ch �oldn���?";
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
	AI_Output(other,self,"DIA_Torlof_Respekt_15_00");	//Jak si vyslou��m respekt ostatn�ch �oldn���?
	AI_Output(self,other,"DIA_Torlof_Respekt_01_01");	//V�t�in� z nich bude sta�it, kdy� spln� sv�j �kol a projde� m�m testem.
	AI_Output(self,other,"DIA_Torlof_Respekt_01_02");	//N�kter� ale bude� muset p�esv�d�it jinak a s�m mus� zjistit jak.
	AI_Output(self,other,"DIA_Torlof_Respekt_01_03");	//N�kte�� budou cht�t vyu��t toho, v jak� jsi situaci, jin�m se prost� nebude l�bit tvoje tv��.
	AI_Output(self,other,"DIA_Torlof_Respekt_01_04");	//M�l by ses sna�it naj�t spole�nou �e� s co nejv�ce z nich - ale kdy� nepom��e nic jin�ho, m��e� se v�dycky utkat v souboji.
	AI_Output(self,other,"DIA_Torlof_Respekt_01_05");	//Kdy� vyhraje�, z�sk� si u v�t�iny uzn�n�. Dej si ale pozor, abys n�koho n�hodou nezabil. V tom p��pad� bys byl v p�kn� ka�i.
	Log_CreateTopic(TOPIC_SLDRESPEKT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SLDRESPEKT,LOG_RUNNING);
	b_logentry(TOPIC_SLDRESPEKT,"Spln�m-li Torlofovu zkou�ku, z�sk�m si t�m respekt i u ostatn�ch �oldn���. Tak� na n� mohu zap�sobit, pokud n�kter� z nich p�em��u v souboji.");
};


instance DIA_TORLOF_DUELLREGELN(C_INFO)
{
	npc = sld_801_torlof;
	nr = 5;
	condition = dia_torlof_duellregeln_condition;
	information = dia_torlof_duellregeln_info;
	permanent = FALSE;
	description = "Jak� jsou pravidla pro souboj?";
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
	AI_Output(other,self,"DIA_Torlof_Duellregeln_15_00");	//Jak� jsou pravidla pro souboj?
	AI_Output(self,other,"DIA_Torlof_Duellregeln_01_01");	//Je to prost�. P�ed prvn�m �derem musej� m�t oba soupe�i mo�nost vytasit zbra�.
	AI_Output(self,other,"DIA_Torlof_Duellregeln_01_02");	//Nem��e� jen tak n�koho prop�chnout bez varov�n�.
	AI_Output(self,other,"DIA_Torlof_Duellregeln_01_03");	//Mus� doj�t k n�jak� form� �stn� v�zvy. Ur�ce, nebo jin�mu d�vodu k boji.
	AI_Output(self,other,"DIA_Torlof_Duellregeln_01_04");	//Do takov�ho souboje se nebude nikdo jin� m�chat. Leda �e by b�hem n�j n�kdo z t�ch dvou zem�el.
	b_logentry(TOPIC_SLDRESPEKT,"Pravidla souboje: souboj mus� za��t v�zvou, aby do n�j ji� nikdo dal�� nezasahoval. Tak� p�i n�m nikdo nesm� b�t zabit.");
};


instance DIA_TORLOF_DEINESTIMME(C_INFO)
{
	npc = sld_801_torlof;
	nr = 6;
	condition = dia_torlof_deinestimme_condition;
	information = dia_torlof_deinestimme_info;
	permanent = FALSE;
	description = "A co ty? Bude� pro m� hlasovat?";
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
	AI_Output(other,self,"DIA_Torlof_DeineStimme_15_00");	//A co ty? Bude� pro m� hlasovat?
	AI_Output(self,other,"DIA_Torlof_DeineStimme_01_01");	//Pokud prok�e�, �e jsi schopn� plnit �koly �oldn��e, tak ano.
};


var int points_sld;

instance DIA_TORLOF_RUF(C_INFO)
{
	npc = sld_801_torlof;
	nr = 7;
	condition = dia_torlof_ruf_condition;
	information = dia_torlof_ruf_info;
	permanent = TRUE;
	description = "Jak to vypad� s moj� reputac� mezi �oldn��i?";
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
	AI_Output(other,self,"DIA_Torlof_RUF_15_00");	//Jak to vypad� s moj� reputac� mezi �oldn��i?
	AI_Output(self,other,"DIA_Torlof_RUF_01_01");	//Tak se na to pod�vejme...
	POINTS_SLD = 0;
	if(Npc_IsDead(sld_wolf))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(sld_wolf.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_02");	//Wolf nem� nic proti tomu, aby ses p�idal.
		POINTS_SLD = POINTS_SLD + 1;
	};
	if(Npc_IsDead(jarvis))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(MIS_JARVIS_SLDKO == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_03");	//Jarvis si mysl�, �e stoj� na spr�vn� stran�.
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(jarvis.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_04");	//Jarvis si st�le nen� jist�, jestli stoj� na spr�vn� stran�.
		AI_Output(self,other,"DIA_Torlof_RUF_01_05");	//Nechce, aby n�kdo dal�� tancoval tak, jak Sylvio p�sk�. Kdy� jsme u toho, tak j� tak� ne.
	};
	if(Npc_IsDead(cord))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(CORD_APPROVED == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_06");	//Cord si mysl�, �e bys mohl b�t dost dobr� na to, abychom t� p�ijali.
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(cord.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_07");	//Podle Cordova n�zoru se bude� muset nejd��v nau�it po��dn� zach�zet s me�em, ne� se bude� moci p�idat.
	};
	if(Npc_IsDead(cipher))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if((MIS_CIPHER_PAKET == LOG_SUCCESS) || (MIS_CIPHER_BRINGWEED == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_08");	//Cipher ��k�, �e pro n�j bylo od za��tku jasn�, �e by ses m�l p�idat. Vypad� to, �e ho n�co v�n� pot�ilo.
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(cipher.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_09");	//Cipher ��k�, �e mu dlu�� laskavost, a �e v�, o �em je �e�.
	};
	if(Npc_IsDead(rod))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(Npc_HasItems(rod,itmw_2h_rod) == 0)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_10");	//Rod chce jen dostat sv�j me� zp�tky.
	}
	else if((rod.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (ROD_WETTEGEWONNEN == TRUE))
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_11");	//Zd� se, �es Roda p�esv�d�il o tom, �e jsi dostate�n� siln�.
		if(rod.aivar[AIV_DEFEATEDBYPLAYER] == FALSE)
		{
			POINTS_SLD = POINTS_SLD + 1;
		};
	}
	else if(rod.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_12");	//Rod si mysl�, �e jsi slaboch.
	};
	if(Npc_IsDead(sentenza))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(Npc_HasItems(sentenza,itmi_gold) >= 50)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_13");	//Sentenza pro tebe ruku zvedne. ��k�, �e jsi se zachoval velice rozumn�.
		POINTS_SLD = POINTS_SLD + 1;
		TORLOF_SENTENZACOUNTED = TRUE;
	}
	else if(sentenza.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_14");	//Sentenza pro tebe ruku nezvedne. ��k�, �e mu st�le dlu�� 50 zlat�ch.
	};
	if(Npc_IsDead(raoul))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(raoul.aivar[AIV_DEFEATEDBYPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_15");	//Raoul je proti tob�. Mysl�m, �e t� nem��e vyst�t.
	};
	if(Npc_IsDead(bullco))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(bullco.aivar[AIV_DEFEATEDBYPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_16");	//O Sylviovi a Bullcovi mluvit nemus�m. Ti dva tupci jsou proti ka�d�mu.
	};
	if(Npc_IsDead(buster))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(BUSTER_DUELL == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_17");	//Buster ��k�, �e jsi v pohod�.
		if(buster.aivar[AIV_DEFEATEDBYPLAYER] == FALSE)
		{
			AI_Output(self,other,"DIA_Torlof_RUF_01_18");	//I kdy� jsi prohr�l.
		};
	}
	else if(buster.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_19");	//Buster ��k�, �e kdy� t� vyzval, tak jsi vym�kl.
		AI_Output(self,other,"DIA_Torlof_RUF_01_20");	//To nebyl dobr� n�pad. Mo�n� bys m�l za n�m zaj�t a vyzvat ho.
	};
	if(Npc_IsDead(dar))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(DAR_LOSTAGAINSTCIPHER == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_21");	//A Dar ��k�, �e jsi �vanil. Ale jeho hlas tady moc neznamen�.
	};
	if(POINTS_SLD > 0)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_22");	//Zbytek �oldn��� ne�ekl nic.
	};
	if((MIS_TORLOF_HOLPACHTVONSEKOB != LOG_SUCCESS) && (MIS_TORLOF_BENGARMILIZKLATSCHEN != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_23");	//V�t�ina z nich �ek�, jak si povede� b�hem zkou�ky.
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_24");	//V�t�inu z nich jsi p�esv�d�il t�m, �e jsi pro�el zkou�kou.
		if(CORD_RANGERHELP_TORLOFSPROBE == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Torlof_RUF_01_00");	//(��klebek) Dokonce i Cord trochu pomohl ...
			POINTS_SLD = POINTS_SLD + 4;
		}
		else if(MIS_TORLOF_HOLPACHTVONSEKOB == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Torlof_RUF_01_25");	//I kdy� hodn� z nich ��k�, �e p�esv�d�it farm��e, aby zaplatil sv�j n�jem, bylo na zkou�ku moc jednoduch�.
			POINTS_SLD = POINTS_SLD + 3;
		}
		else
		{
			POINTS_SLD = POINTS_SLD + 5;
		};
		AI_Output(self,other,"DIA_Torlof_RUF_01_26");	//M�j hlas ka�dop�dn� m�.
		POINTS_SLD = POINTS_SLD + 1;
	};
	if(SLD_DUELLE_GEWONNEN >= 3)
	{
		POINTS_SLD = POINTS_SLD + 1;
		if(POINTS_SLD >= 9)
		{
			AI_Output(self,other,"DIA_Torlof_RUF_01_27");	//A vyhr�l jsi n�kolik �estn�ch souboj�.
			AI_Output(self,other,"DIA_Torlof_RUF_01_28");	//To hodn� �oldn��� respektuje.
		}
		else
		{
			AI_Output(self,other,"DIA_Torlof_RUF_01_29");	//Ka�dop�dn� jsi vyhr�l n�kolik �estn�ch souboj�.
		};
	};
	if(POINTS_SLD >= 9)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_30");	//V�t�ina �oldn��� stoj� za tebou - co se n�s t��e, m��e� u n�s za��t kdy se ti zl�b�.
		AI_Output(self,other,"DIA_Torlof_RUF_01_31");	//B� za Leem. Vysv�tl� ti v�echno pot�ebn�.
		TORLOF_GENUGSTIMMEN = TRUE;
		b_logentry(TOPIC_BECOMESLD,"Mezi �oldn��i u� jsem si vydobyl dost �cty. Nyn� bych m�l prohodit p�r slov s Leem.");
	}
	else if(POINTS_SLD >= 7)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_32");	//To je dost, ale po��d to nesta��.
		AI_Output(self,other,"DIA_Torlof_RUF_01_33");	//Bude� se muset s chlapci je�t� chv�li pr�t.
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_34");	//Nem� to ani zdaleka za sebou, chlap�e. Jestli chce�, abychom t� p�ijali mezi sebe, bude� pro to muset ud�lat trochu v�c.
	};
};


instance DIA_TORLOF_AUFGABEN(C_INFO)
{
	npc = sld_801_torlof;
	nr = 8;
	condition = dia_torlof_aufgaben_condition;
	information = dia_torlof_aufgaben_info;
	permanent = FALSE;
	description = "Jak� m�m jako �oldn�� povinnosti?";
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
	AI_Output(other,self,"DIA_Torlof_Aufgaben_15_00");	//Jak� m�m jako �oldn�� povinnosti?
	AI_Output(self,other,"DIA_Torlof_Aufgaben_01_01");	//Onar n�s najal ze dvou d�vod�: chce, abychom od n�j dr�eli d�l domobranu a udr�ovali po��dek na jeho farm�ch.
	AI_Output(self,other,"DIA_Torlof_Aufgaben_01_02");	//To zahrnuje vyb�r�n� pachtovn�ho, kdy� nebudou cht�t drobn� farm��i zaplatit.
	AI_Output(self,other,"DIA_Torlof_Aufgaben_01_03");	//Tak�e, co to bude?
	Info_ClearChoices(dia_torlof_aufgaben);
	Info_AddChoice(dia_torlof_aufgaben,"Nech m� vybrat ten n�jem!",dia_torlof_aufgaben_pacht);
	Info_AddChoice(dia_torlof_aufgaben,"Vypo��d�m se s domobranou, ��dn� obavy!",dia_torlof_aufgaben_miliz);
};

func void b_torlof_holpachtvonsekob()
{
	AI_Output(self,other,"B_Torlof_HolPachtvonSekob_01_00");	//Dobr�. Poslouchej. Farm�� Sekob u� n�kolik t�dn� Onarovi nezaplatil n�jem.
	AI_Output(self,other,"B_Torlof_HolPachtvonSekob_01_01");	//Onar po n�m chce, aby vysolil 50 zlat�ch. N�jak� ot�zky?
	AI_Output(other,self,"B_Torlof_HolPachtvonSekob_15_02");	//Kde je Sekobova farma?
	AI_Output(self,other,"B_Torlof_HolPachtvonSekob_01_03");	//V severn� ��sti �dol�. Kdy� se d�v� odsud, je to napravo u t� velk� k�i�ovatky.
	AI_Output(self,other,"B_Torlof_HolPachtvonSekob_01_04");	//Kdybys m�l n�jak� probl�my, farm��i na pol�ch ti pom��ou naj�t cestu.
	MIS_TORLOF_HOLPACHTVONSEKOB = LOG_RUNNING;
	sekob.flags = 0;
	CreateInvItems(sekob,itmi_gold,50);
	Log_CreateTopic(TOPIC_TORLOFPACHT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TORLOFPACHT,LOG_RUNNING);
	b_logentry(TOPIC_TORLOFPACHT,"Torlof m� po��dal, abych od sedl�ka Sekoba vyinkasoval n�jemn�, kter� �in� 50 zla��k�.");
};

func void b_torlof_bengarmilizklatschen()
{
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_00");	//Farm�� Bengar si st�oval, �e mu domobrana z m�sta v posledn� dob� leze na nervy.
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_01");	//Vyv�jej� na toho farm��e n�tlak - nejsp� cht�j�, aby se oto�il k Onarovi z�dy.
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_02");	//Chci, abys �el na jeho farmu a vyjasnil domobran�, �e tady nemaj� co pohled�vat! Ot�zky?
	AI_Output(other,self,"B_Torlof_BengarMilizKlatschen_15_03");	//Jak najdu Bengarovu farmu?
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_04");	//Na jihoz�pad� �dol� je velk� schodi�t�, kter� vede na planinu. Tam m� Bengar svou farmu.
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_05");	//Kdyby ses ztratil, zeptej se farm��� na pol�ch, kudy se d�t.
	MIS_TORLOF_BENGARMILIZKLATSCHEN = LOG_RUNNING;
	bengar.flags = 0;
	Wld_InsertNpc(mil_335_rumbold,"FARM3");
	Wld_InsertNpc(mil_336_rick,"FARM3");
	b_initnpcglobals();
	Log_CreateTopic(TOPIC_TORLOFMILIZ,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TORLOFMILIZ,LOG_RUNNING);
	b_logentry(TOPIC_TORLOFMILIZ,"Torlof m� pov��il, abych na planin� ze statku sedl�ka Bengara vyhnal domobranu.");
};

func void dia_torlof_aufgaben_pacht()
{
	AI_Output(other,self,"DIA_Torlof_Aufgaben_Pacht_15_00");	//Nech m� vybrat ten n�jem!
	b_torlof_holpachtvonsekob();
	TORLOF_PROBE = PROBE_SEKOB;
	Info_ClearChoices(dia_torlof_aufgaben);
};

func void dia_torlof_aufgaben_miliz()
{
	AI_Output(other,self,"DIA_Torlof_Aufgaben_Miliz_15_00");	//Vypo��d�m se s domobranou, ��dn� obavy!
	b_torlof_bengarmilizklatschen();
	TORLOF_PROBE = PROBE_BENGAR;
	Info_ClearChoices(dia_torlof_aufgaben);
};


var int torlof_theothermission_day;

func void b_torlof_theothermissionday()
{
	if(TORLOF_THEOTHERMISSION_DAY < (Wld_GetDay() - 1))
	{
		AI_Output(self,other,"B_Torlof_TheOtherMissionDay_01_00");	//Trvalo ti to stra�n� dlouho. Onar nebude m�t radost.
		TORLOF_THEOTHERMISSION_TOOLATE = TRUE;
		if(ENTEROW_KAPITEL2 == TRUE)
		{
			AI_Output(self,other,"DIA_Torlof_Add_01_00");	//A je mu jedno, jestli paladiny n�co se�ere v Hornick�m �dol�, nebo ne.
		};
	}
	else
	{
		AI_Output(self,other,"B_Torlof_TheOtherMissionDay_01_01");	//Dobr� pr�ce! A� budu m�t n�co dal��ho, d�m ti v�d�t.
	};
};


instance DIA_TORLOF_SEKOBSUCCESS(C_INFO)
{
	npc = sld_801_torlof;
	nr = 9;
	condition = dia_torlof_sekobsuccess_condition;
	information = dia_torlof_sekobsuccess_info;
	permanent = TRUE;
	description = "Vybral jsem n�jem od Sekoba.";
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
	AI_Output(other,self,"DIA_Torlof_SekobSuccess_15_00");	//Vybral jsem n�jem od Sekoba.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Torlof_SekobSuccess_01_01");	//A? Zaplatil dobrovoln�?
		if(Npc_IsDead(sekob))
		{
			AI_Output(other,self,"DIA_Torlof_SekobTot_15_00");	//No, potkal ho smrteln� �raz...
		}
		else
		{
			AI_Output(other,self,"DIA_Torlof_SekobSuccess_15_02");	//Nejd��v jsem ho musel p�esv�d�it.
		};
		if(TORLOF_PROBE == PROBE_SEKOB)
		{
			AI_Output(self,other,"DIA_Torlof_SekobSuccess_01_03");	//Dobr� pr�ce! Pro�el jsi zkou�kou. To p�esv�d�� hodn� �oldn��� o tom, �e v�, co se slu�� a pat��.
		}
		else
		{
			b_torlof_theothermissionday();
		};
		MIS_TORLOF_HOLPACHTVONSEKOB = LOG_SUCCESS;
		b_giveplayerxp(XP_TORLOF_SEKOBSKOHLEBEKOMMEN);
		b_logentry(TOPIC_BECOMESLD,"Splnil jsem �kol, kter� mi sv��il Torlof.");
		TORLOF_PROBEBESTANDEN = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_SekobSuccess_01_04");	//A? Utratil jsi to snad za chlast? P�ines mi pen�ze! A hezky z�erstva!
	};
};


instance DIA_TORLOF_BENGARSUCCESS(C_INFO)
{
	npc = sld_801_torlof;
	nr = 10;
	condition = dia_torlof_bengarsuccess_condition;
	information = dia_torlof_bengarsuccess_info;
	permanent = FALSE;
	description = "Postaral jsem se o Bengar�v probl�m s domobranou.";
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
	AI_Output(other,self,"DIA_Torlof_BengarSuccess_15_00");	//Postaral jsem se o Bengar�v probl�m s domobranou.
	AI_Output(self,other,"DIA_Torlof_BengarSuccess_01_01");	//Ujistil ses, �e nebudou z�tra zase st�t na jeho z�pra��?
	AI_Output(other,self,"DIA_Torlof_BengarSuccess_15_02");	//To by s t�m m�li docela pot�e...
	AI_Output(self,other,"DIA_Torlof_BengarSuccess_01_03");	//Dobr� pr�ce!
	if(TORLOF_PROBE == PROBE_BENGAR)
	{
		AI_Output(self,other,"DIA_Torlof_BengarSuccess_01_04");	//Pro�el jsi zkou�kou. Kdy� dok�e� zvl�dnout domobranu, v�t�ina t� tady bude uzn�vat.
	}
	else
	{
		b_torlof_theothermissionday();
	};
	MIS_TORLOF_BENGARMILIZKLATSCHEN = LOG_SUCCESS;
	b_giveplayerxp(XP_BENGAR_MILIZKLATSCHEN);
	b_logentry(TOPIC_BECOMESLD,"U� jsem splnil �kol, kter� mi Torlof zadal.");
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
	AI_Output(self,other,"DIA_Torlof_Welcome_01_00");	//V�tej mezi �oldn��i, chlap�e!
	AI_Output(other,self,"DIA_Torlof_Welcome_15_01");	//D�ky!
	AI_Output(self,other,"DIA_Torlof_Welcome_01_02");	//Jakmile pro tebe budu m�t n�co na pr�ci, d�m ti v�d�t.
};


var int torlof_knowsdragons;

func void b_torlof_dragons()
{
	AI_Output(self,other,"DIA_Torlof_Add_01_01");	//Kde jsi byl?
	AI_Output(other,self,"DIA_Torlof_Add_15_02");	//Byl jsem v Hornick�m �dol�! Jsou tam draci! Dali paladin�m p�kn� zabrat!
	AI_Output(self,other,"DIA_Torlof_Add_01_03");	//Fakt? Tak�e na v�ech t�ch pov�da�k�ch v�n� n�co je!
	AI_Output(self,other,"DIA_Torlof_Add_01_04");	//Leeho to bude zaj�mat.
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
	AI_Output(self,other,"DIA_Torlof_TheOtherMission_01_00");	//Dob�e, �e jsi tady. M�m pro tebe n�co na pr�ci.
	AI_Output(other,self,"DIA_Torlof_TheOtherMission_15_01");	//Co je?
	if(TORLOF_PROBE == PROBE_BENGAR)
	{
		b_torlof_holpachtvonsekob();
	}
	else
	{
		b_torlof_bengarmilizklatschen();
	};
	AI_Output(self,other,"DIA_Torlof_TheOtherMission_01_02");	//A postarej se o to, a� je to do z�tra hotov�!
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
	description = "M��e� mi pomoci vylep�it moje schopnosti?";
};


func int dia_torlof_whatcanyouteach_condition()
{
	return TRUE;
};

func void dia_torlof_whatcanyouteach_info()
{
	AI_Output(other,self,"DIA_Torlof_WhatCanYouTeach_15_00");	//M��e� mi pomoci vylep�it moje schopnosti?
	AI_Output(self,other,"DIA_Torlof_WhatCanYouTeach_01_01");	//Mohl bych ti uk�zat, jak l�pe vyu��t svou s�lu p�i boji na bl�zko.
	AI_Output(self,other,"DIA_Torlof_WhatCanYouTeach_01_02");	//Spousta bojovn�k� je stra�n� slab�, proto�e nemaj� spr�vnou techniku, s jej� pomoc� by spr�vn� vyu��vali svou s�lu.
	AI_Output(self,other,"DIA_Torlof_WhatCanYouTeach_01_03");	//To sam� plat� u st�eln�ch zbran� a obratnosti.
	Log_CreateTopic(TOPIC_SOLDIERTEACHER,LOG_NOTE);
	b_logentry(TOPIC_SOLDIERTEACHER,"Torlof mi pom��e vylep�it obratnost a s�lu.");
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
	description = "Chci si vylep�it schopnosti!";
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
	AI_Output(other,self,"DIA_Torlof_Teach_15_00");	//Chci si vylep�it schopnosti!
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
		AI_Output(self,other,"DIA_Torlof_Teach_01_01");	//�ekl jsem, �e bych ti MOHL pomoci, ne �e ti POMَU.
		AI_Output(self,other,"DIA_Torlof_Teach_01_02");	//Dokud nejsi jedn�m z n�s, mus� si naj�t n�koho jin�ho, kdo by t� u�il!
	};
};

func void dia_torlof_teach_back()
{
	if((TORLOF_MERKE_STR < other.attribute[ATR_STRENGTH]) || (TORLOF_MERKE_DEX < other.attribute[ATR_DEXTERITY]))
	{
		AI_Output(self,other,"DIA_Torlof_Teach_Back_01_00");	//Dobr�! Nyn� dok�e� pou��vat svoje schopnosti l�pe!
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
	description = "Nem� pro m� n�co na pr�ci?";
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
	AI_Output(other,self,"DIA_Torlof_DEMENTOREN_15_00");	//Nem� pro m� n�co na pr�ci?
	AI_Output(self,other,"DIA_Torlof_DEMENTOREN_01_01");	//Vid�ls ty chlap�ky s �ern�mi k�p�mi, co se potuluj� po okol�? �eknu ti, b�h� mi z nich mr�z po z�dech.
	AI_Output(self,other,"DIA_Torlof_DEMENTOREN_01_02");	//Kdy� jsem byl na mo�i, vid�l jsem p�r v�n� divn�ch v�c�, ale tihle lidi m� v�n� d�s�.
	AI_Output(self,other,"DIA_Torlof_DEMENTOREN_01_03");	//�li sm�rem na t�bor bandit�, co je v hor�ch na ji�n�m konci �dol�.
	AI_Output(self,other,"DIA_Torlof_DEMENTOREN_01_04");	//Mo�n� by ses tam m�l vydat, zjistit, co jsou za� a vypo��dat se s nimi!
	Wld_InsertNpc(castleminedmt,"FP_STAND_DEMENTOR_KDF_12");
	Log_CreateTopic(TOPIC_TORLOF_DMT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TORLOF_DMT,LOG_RUNNING);
	b_logentry(TOPIC_TORLOF_DMT,"P�r t�ch zakuklenc� se nejsp� bude skr�vat v t�bo�e bandit� v hor�ch ji�n� od �dol�. Torlofovi po��dn� pij� krev - m�m pro n�j tenhle probl�m vy�e�it.");
	MIS_TORLOF_DMT = LOG_RUNNING;
};


instance DIA_TORLOF_DMTSUCCESS(C_INFO)
{
	npc = sld_801_torlof;
	nr = 30;
	condition = dia_torlof_dmtsuccess_condition;
	information = dia_torlof_dmtsuccess_info;
	description = "Ti �ernok�pn�ci z hor u� nejsou mezi n�mi.";
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
	AI_Output(other,self,"DIA_Torlof_DmtSuccess_15_00");	//Ti �ernok�pn�ci z hor u� nejsou mezi n�mi.
	AI_Output(self,other,"DIA_Torlof_DmtSuccess_01_01");	//Dok�zal jsi je vy��dit? Frajer!
	AI_Output(self,other,"DIA_Torlof_DmtSuccess_01_02");	//Ani za m�k jsem t�m chlap�k�m nev��il. Jenom by budili trable.
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
	description = "N�kte�� �oldn��i ode�li?";
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
	AI_Output(other,self,"DIA_Torlof_WOISTSYLVIO_15_00");	//N�kte�� �oldn��i ode�li?
	AI_Output(self,other,"DIA_Torlof_WOISTSYLVIO_01_01");	//Sylvio sebral p�r chlapc� a zmizel s nimi na druhou stranu pr�smyku.
	AI_Output(self,other,"DIA_Torlof_WOISTSYLVIO_01_02");	//Pov�d� se, �e se tam objevili draci. Kdy� se to doslechl, ne�lo ho zastavit.
	AI_Output(self,other,"DIA_Torlof_WOISTSYLVIO_01_03");	//Kdo v�? Za dra�� trofej by dostal na trhu hromadu pen�z.
	AI_Output(self,other,"DIA_Torlof_WOISTSYLVIO_01_04");	//To pro m� nen�. Jsem n�mo�n�k. Pat��m na mo�e a ne do n�jak�ho dusn�ho dra��ho doup�te.
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
	description = "Ty jsi n�mo�n�k?";
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
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN_15_00");	//Ty jsi n�mo�n�k?
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_01");	//Kone�n� t� to trklo? Jo, ksakru, jsem n�mo�n�k. Pro� se pt�?
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN_15_02");	//Hodily by se mi tvoje schopnosti. Pot�ebuji se dostat na jeden ostrov.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_03");	//(zasm�je se) Na ostrov? V�dy� ani nem� lo�, nato� pos�dku, kter� by ji ��dila.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_04");	//Ne, chlap�e. Jestli chce� vyu��t m�ch slu�eb jako kapit�na a u�itele s�ly, mus� mi nejd��v dok�zat, �e v�, o �em mluv�.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_05");	//Krom� toho m�m u� tak dost sv�ch vlastn�ch starost�. Paladinov� se nest�hli z m�sta, jak jsme o�ek�vali.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_06");	//Muselo by se st�t n�co opravdu v�n�ho, aby vyklidili pole.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_07");	//B� do hradu v Hornick�m �dol�. Ukradni str��m kl�� od hlavn� br�ny a otev�i ji. Sk�eti se u� postaraj� o zbytek!
	Log_CreateTopic(TOPIC_CAPTAIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CAPTAIN,LOG_RUNNING);
	b_logentry(TOPIC_CAPTAIN,"Je�t� ne� Torlof p�ijme funkci kapit�na, mus�m p�im�t paladiny, aby opustili m�sto. Kdy� mu pomohu, spole�n� na hrad� v Hornick�m �dol� nastra��me malou lest. Mus�m str�ci ukr�st kl�� od hlavn� br�ny a otev��t ji, aby do hradu mohli proniknout sk�eti. Tohle ne�t�st�, jak douf�, p�im�je paladiny, aby ode�li z m�sta a vydali se na pomoc sv�m kamar�d�m.");
};


instance DIA_TORLOF_BEMYCAPTAIN2(C_INFO)
{
	npc = sld_801_torlof;
	nr = 52;
	condition = dia_torlof_bemycaptain2_condition;
	information = dia_torlof_bemycaptain2_info;
	description = "Br�na do hradu v Hornick�m �dol� je otev�en� a zaseknut�...";
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
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN2_15_00");	//Br�na do hradu v Hornick�m �dol� je otev�en� a zaseknut�. Sk�et�m u� nic nebr�n� v tom, aby nevzali hrad �tokem.
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN2_15_01");	//Paladinov� utrp�li v bitv� se sk�ety v�n� ztr�ty.
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN2_15_02");	//�ekl bych, �e u� nebude trvat dlouho, ne� se paladinov� odsud z m�sta vydaj� do Hornick�ho �dol�, aby dostali sv� kamar�dy pry� z hradu.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN2_01_03");	//To jsou p��jemn� zpr�vy. Tak�e u� nic nestoj� v cest� tomu, abych utekl z tohohle proklet�ho kraje.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_TORLOF_BEMYCAPTAIN3(C_INFO)
{
	npc = sld_801_torlof;
	nr = 53;
	condition = dia_torlof_bemycaptain3_condition;
	information = dia_torlof_bemycaptain3_info;
	permanent = TRUE;
	description = "Te� u� mi pom��e� dostat se na ten ostrov?";
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
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN3_15_00");	//Te� u� mi pom��e� dostat se na ten ostrov?
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_01_01");	//No jasn�. Cht�l jsi jet na n�jak� ostrov. Hmm. D�m ti jeden n�vrh.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_01_02");	//Zaplat� mi 2500 zlat�ch a j� se ujmu velen� tv� lodi.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_01_03");	//Nav�c t� budu tr�novat v s�le a obratnosti, kdykoliv to jen bude� cht�t.
	Info_ClearChoices(dia_torlof_bemycaptain3);
	Info_AddChoice(dia_torlof_bemycaptain3,"To je stra�n� spousta pen�z.",dia_torlof_bemycaptain3_zuviel);
	Info_AddChoice(dia_torlof_bemycaptain3,"Dobr�. Tady m� sv� pen�ze.",dia_torlof_bemycaptain3_ok);
};

func void dia_torlof_bemycaptain3_zuviel()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN3_zuViel_15_00");	//To je stra�n� spousta pen�z.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_zuViel_01_01");	//To jo. Dobr� pomoc je drah�. Nem� na v�b�r. Tady v okol� nenajde� nikoho dal��ho, kdo by velel tv� lodi.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_zuViel_01_02");	//Tak zapla� a ned�lej vlny.
	Info_ClearChoices(dia_torlof_bemycaptain3);
	b_logentry(TOPIC_CAPTAIN,"Torlof je nyn� ochoten ��dit lo�. Bohu�el za to ale po�aduje 2500 zla��k�.");
};

func void dia_torlof_bemycaptain3_ok()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN3_ok_15_00");	//Dobr�. Tady m� sv� pen�ze.
	if(b_giveinvitems(other,self,itmi_gold,2500))
	{
		AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_ok_01_01");	//N�dhera. Te� mi jen p�esn� �ekni, co po mn� bude� cht�t.
		TORLOF_PAIDTOBECAPTAIN = TRUE;
		b_logentry(TOPIC_CAPTAIN,"Jakmile jsem mu p�edal 2500 zla��k�, je Torlof kone�n� p�ipraven m� dopravit k c�li.");
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_ok_01_02");	//Sna�� se m� oblbnout p�r mincemi? Nejd��v p�ines pen�ze. Pak uvid�me.
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
	description = "Bu� m�m kapit�nem.";
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
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN4_15_00");	//Bu� m�m kapit�nem.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN4_01_01");	//Dobr�. Se�e� mi lo� a dostate�n� silnou pos�dku a j� t� dostanu na ten tv�j mizern� ostrov.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN4_01_02");	//M� n�mo�n� mapy? Bez nich se moc daleko nedostaneme.
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN4_15_03");	//O to se postar�m. Setk�me se v p��stavu.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN4_01_04");	//Jsem v�n� zv�dav�, jak to chce� ud�lat.
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
	description = "Vzh�ru na ostrov!";
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
	AI_Output(other,self,"DIA_Torlof_LOSFAHREN_15_00");	//Vzh�ru na ostrov!
	if(b_captainconditions(self) == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_01");	//Dobr�. Dej mi mapy a m��eme vyplout.
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_02");	//(zavol�) V�ichni na palubu.
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_03");	//Ujisti se, �e m� opravdu v�echno, co bys mohl pot�ebovat. Vracet se nem��eme.
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_04");	//Jestli si jsi jist�, b� se nat�hnout do kapit�nsk� kajuty. Za chv�li vyraz�me na cestu.
		AI_StopProcessInfos(self);
		b_captaincallsallonboard(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_05");	//��dn� lo�, ��dn� pos�dka, ��dn� mapa, ��dn� v�let, p��teli.
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_06");	//Chci vid�t aspo� p�t chlap� ochotn�ch a schopn�ch plavby.
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
	description = "Rozhodl jsem se pro jin�ho kapit�na. M��e� mi hned vr�tit m� pen�ze.";
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
	AI_Output(other,self,"DIA_Torlof_PERM5_NOTCAPTAIN_15_00");	//Rozhodl jsem se pro jin�ho kapit�na. M��e� mi hned vr�tit m� pen�ze.
	AI_Output(self,other,"DIA_Torlof_PERM5_NOTCAPTAIN_01_01");	//To by ne�lo. Nic takov�ho. Kdy� mi nejd��v zaplat� a pak nakonec moje slu�by odm�t�, je to tv�j probl�m.
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

