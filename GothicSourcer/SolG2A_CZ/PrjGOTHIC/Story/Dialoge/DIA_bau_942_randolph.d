
instance DIA_RANDOLPH_EXIT(C_INFO)
{
	npc = bau_942_randolph;
	nr = 999;
	condition = dia_randolph_exit_condition;
	information = dia_randolph_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_randolph_exit_condition()
{
	return TRUE;
};

func void dia_randolph_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_RANDOLPH_SCHWERELUFT(C_INFO)
{
	npc = bau_942_randolph;
	nr = 4;
	condition = dia_randolph_schwereluft_condition;
	information = dia_randolph_schwereluft_info;
	permanent = FALSE;
	description = "Je v�echno v po��dku?";
};


func int dia_randolph_schwereluft_condition()
{
	if(!Npc_IsDead(alvares) && !Npc_IsDead(engardo) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_schwereluft_info()
{
	AI_Output(other,self,"DIA_Randolph_SchwereLuft_15_00");	//Je v�echno v po��dku?
	AI_Output(self,other,"DIA_Randolph_SchwereLuft_06_01");	//Hmm... jakmile tu �ekne n�kdo n�co �patn�, za�ne tanec... Tak�e si d�vej pozor na jazyk, jinak se taky nemus� do��t z�t�ej��ho r�na.
	AI_Output(other,self,"DIA_Randolph_SchwereLuft_15_02");	//Bude� taky bojovat?
	AI_Output(self,other,"DIA_Randolph_SchwereLuft_06_03");	//Nebudu tady jenom st�t a civ�t, a� se n�co semele. Ale nehodl�m ani nic za��nat.
	AKILS_SLDSTILLTHERE = TRUE;
	Log_CreateTopic(TOPIC_AKILSSLDSTILLTHERE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AKILSSLDSTILLTHERE,LOG_RUNNING);
	b_logentry(TOPIC_AKILSSLDSTILLTHERE,"Akil�v statek ohro�uj� �oldn��i.");
	b_npcclearobsessionbydmt(self);
};


instance DIA_RANDOLPH_HALLO(C_INFO)
{
	npc = bau_942_randolph;
	nr = 4;
	condition = dia_randolph_hallo_condition;
	information = dia_randolph_hallo_info;
	permanent = FALSE;
	description = "Je v�echno v po��dku?";
};


func int dia_randolph_hallo_condition()
{
	if(Npc_IsDead(alvares) && Npc_IsDead(engardo) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_hallo_info()
{
	AI_Output(other,self,"DIA_Randolph_HALLO_15_00");	//Je v�echno v po��dku?
	if(Npc_IsDead(akil) && Npc_IsDead(kati))
	{
		AI_Output(self,other,"DIA_Randolph_HALLO_06_01");	//Te�, kdy� Kati a Akil ode�li do Innosovy ��e, asi za�nu hospoda�it.
		Npc_ExchangeRoutine(self,"START");
		AI_ContinueRoutine(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Randolph_HALLO_06_02");	//Ano, je mi dob�e. Ten Alvares byl posledn� dobou st�le drzej�� a drzej��. Dob�e, �e u� je to za n�mi.
	};
	AI_Output(self,other,"DIA_Randolph_HALLO_06_03");	//Co bych zrovna te� pot�eboval, je po��dnej odvaz v hospod�.
};


instance DIA_RANDOLPH_BALTRAM(C_INFO)
{
	npc = bau_942_randolph;
	nr = 5;
	condition = dia_randolph_baltram_condition;
	information = dia_randolph_baltram_info;
	permanent = FALSE;
	description = "Poslal m� Baltram. M�m tu pro n�j vyzvednou n�jak� bal�k.";
};


func int dia_randolph_baltram_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_hallo) && (MIS_BALTRAM_SCOUTAKIL == LOG_RUNNING) && Npc_IsDead(akil) && Npc_IsDead(kati) && (LIEFERUNG_GEHOLT == FALSE) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_baltram_info()
{
	AI_Output(other,self,"DIA_Randolph_Baltram_15_00");	//Poslal m� Baltram. M�m tu pro n�j vyzvednou n�jak� bal�k.
	AI_Output(self,other,"DIA_Randolph_Baltram_06_01");	//Fajn. U� jsem v�echno p�ipravil. Tady je tv�j bal�k.
	CreateInvItems(self,itmi_baltrampaket,1);
	b_giveinvitems(self,other,itmi_baltrampaket,1);
	LIEFERUNG_GEHOLT = TRUE;
};


instance DIA_RANDOLPH_GESCHICHTE(C_INFO)
{
	npc = bau_942_randolph;
	nr = 5;
	condition = dia_randolph_geschichte_condition;
	information = dia_randolph_geschichte_info;
	permanent = FALSE;
	description = "Ty nejsi zdej��, vi�?";
};


func int dia_randolph_geschichte_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_hallo) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_geschichte_info()
{
	AI_Output(other,self,"DIA_Randolph_Geschichte_15_00");	//Ty nejsi zdej��, vi�?
	AI_Output(self,other,"DIA_Randolph_Geschichte_06_01");	//Poch�z�m z ji�n�ch ostrov�. ��kalo se, �e tady v Korinidu budou zapot�eb� lidi kv�li magick� rud�.
	AI_Output(self,other,"DIA_Randolph_Geschichte_06_02");	//Ale kdy� jsem se sem dostal, m�li tady obrovskou bari�ru. A mn� se tam zrovna necht�lo. Tak jsem za�al pracovat v p��stavu.
	AI_Output(self,other,"DIA_Randolph_Geschichte_06_03");	//No, pak p�estaly lod� vyd�l�vat, tak jsem �el pracovat pro Akila. U� jsem d�lal hor�� v�ci, v�n�.
};


instance DIA_RANDOLPH_TAVERNE(C_INFO)
{
	npc = bau_942_randolph;
	nr = 5;
	condition = dia_randolph_taverne_condition;
	information = dia_randolph_taverne_info;
	description = "Ty jsi vysed�val v hospod�?";
};


func int dia_randolph_taverne_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_hallo) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_taverne_info()
{
	AI_Output(other,self,"DIA_Randolph_TAVERNE_15_00");	//Ty jsi vysed�val v hospod�?
	AI_Output(self,other,"DIA_Randolph_TAVERNE_06_01");	//Jo, p�esn� tak. Ale te� u� ne.
	AI_Output(self,other,"DIA_Randolph_TAVERNE_06_02");	//U� si to nem��u dovolit.
};


instance DIA_RANDOLPH_WASISTINTAVERNE(C_INFO)
{
	npc = bau_942_randolph;
	nr = 6;
	condition = dia_randolph_wasistintaverne_condition;
	information = dia_randolph_wasistintaverne_info;
	description = "Co se vlastn� v t� hospod� d�je?";
};


func int dia_randolph_wasistintaverne_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_taverne) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_wasistintaverne_info()
{
	AI_Output(other,self,"DIA_Randolph_WASISTINTAVERNE_15_00");	//Co se vlastn� v t� hospod� d�je?
	AI_Output(self,other,"DIA_Randolph_WASISTINTAVERNE_06_01");	//Hraje se tam.
	AI_Output(self,other,"DIA_Randolph_WASISTINTAVERNE_06_02");	//Ti chl�pkov� tam sout�ej ka�dej s ka�d�m. Kdo vydr�� nejv�c piv, vyhr�l.
	AI_Output(self,other,"DIA_Randolph_WASISTINTAVERNE_06_03");	//Nakonec jsem ned�lal nic jin�ho ne� prohr�val, a te� pot�ebuju vyd�lat n�co pen�z.
	Log_CreateTopic(TOPIC_WETTSAUFEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WETTSAUFEN,LOG_RUNNING);
	b_logentry(TOPIC_WETTSAUFEN,"V hospod� se uzav�raj� s�zky.");
};


instance DIA_RANDOLPH_GEGENWEN(C_INFO)
{
	npc = bau_942_randolph;
	nr = 7;
	condition = dia_randolph_gegenwen_condition;
	information = dia_randolph_gegenwen_info;
	description = "Proti komu jsi hr�l?";
};


func int dia_randolph_gegenwen_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_wasistintaverne) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_gegenwen_info()
{
	AI_Output(other,self,"DIA_Randolph_GEGENWEN_15_00");	//Proti komu jsi hr�l?
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_01");	//Proti Rukharovi, tomu star�mu budi�kni�emovi. Co v�m, poka�d� m� porazil.
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_02");	//Ale m�m takov� nejasn� tu�en�, �e mi ten mizernej hajzl v�dycky ��znul pivo ginem.
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_03");	//Nejsp� ho m� schovanej ve sv� truhle. Ten v�iv�ckej zkurvysyn!
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_04");	//N�kdo by mu do t� jeho truhly m�l nastr�it �istou vodu. Pak by toho mohl do piva p�id�vat, kolik by cht�l.
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_05");	//Kdybych tak m�l dost pen�z, abych si to s n�m mohl rozdat je�t� jednou.
	b_logentry(TOPIC_WETTSAUFEN,"Randolph mi vypr�v�l o Rukharovi a o sout�i v pit� a tak� o tom, �e u� nem�l dost pen�z, aby s Rukharem zm��il s�ly je�t� jednou.");
	b_logentry(TOPIC_WETTSAUFEN,"Randolph se domn�v�, �e Rukhar p�i souboji v pit� podv�d�l. R�d by mu v truhlici vym�nil jednu l�hev ginu za l�hev vody.");
};


instance DIA_RANDOLPH_WASBRAUCHSTDU(C_INFO)
{
	npc = bau_942_randolph;
	nr = 8;
	condition = dia_randolph_wasbrauchstdu_condition;
	information = dia_randolph_wasbrauchstdu_info;
	description = "Kolik na tu sout� pot�ebuje�?";
};


func int dia_randolph_wasbrauchstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_gegenwen) && (MIS_RUKHAR_WETTKAMPF == LOG_RUNNING) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_wasbrauchstdu_info()
{
	AI_Output(other,self,"DIA_Randolph_WASBRAUCHSTDU_15_00");	//Kolik na tu sout� pot�ebuje�?
	AI_Output(self,other,"DIA_Randolph_WASBRAUCHSTDU_06_01");	//10 zlat�ch.
};


instance DIA_RANDOLPH_ICHGEBEDIRGELD(C_INFO)
{
	npc = bau_942_randolph;
	nr = 9;
	condition = dia_randolph_ichgebedirgeld_condition;
	information = dia_randolph_ichgebedirgeld_info;
	permanent = TRUE;
	description = "D�m ti ty pen�ze, aby sis to mohl rozdat s Rukharem.";
};


var int dia_randolph_ichgebedirgeld_noperm;

func int dia_randolph_ichgebedirgeld_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_wasbrauchstdu) && (DIA_RANDOLPH_ICHGEBEDIRGELD_NOPERM == FALSE) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_ichgebedirgeld_info()
{
	AI_Output(other,self,"DIA_Randolph_ICHGEBEDIRGELD_15_00");	//D�m ti ty pen�ze, aby sis to mohl rozdat s Rukharem.
	if(b_giveinvitems(other,self,itmi_gold,10))
	{
		AI_Output(self,other,"DIA_Randolph_ICHGEBEDIRGELD_06_01");	//(nad�en�) Fakt? D�ky moc. Brzo ti to vr�t�m.
		AI_Output(self,other,"DIA_Randolph_ICHGEBEDIRGELD_06_02");	//Kdy� vyhraju, vyklop�m je�t� o trochu v�c, ne� jsi mi dal. Je�t� se uvid�me.
		b_logentry(TOPIC_WETTSAUFEN,"U� jsem si vsadil a te� se na to pod�v�m.");
		b_giveplayerxp(XP_RANDOLPH_WETTKAMPFSTART);
		DIA_RANDOLPH_ICHGEBEDIRGELD_NOPERM = TRUE;
		b_npcclearobsessionbydmt(self);
		MIS_RUKHAR_WETTKAMPF_DAY = Wld_GetDay();
		Npc_ExchangeRoutine(self,"Wettkampf");
		b_startotherroutine(orlan,"Wettkampf");
		b_startotherroutine(rukhar,"Wettkampf");
	}
	else
	{
		AI_Output(self,other,"DIA_Randolph_ICHGEBEDIRGELD_06_03");	//To je v po��dku. Nem� dost ani pro sebe.
	};
	b_npcclearobsessionbydmt(self);
};


instance DIA_RANDOLPH_WETTKAMPFZUENDE(C_INFO)
{
	npc = bau_942_randolph;
	nr = 10;
	condition = dia_randolph_wettkampfzuende_condition;
	information = dia_randolph_wettkampfzuende_info;
	permanent = TRUE;
	description = "Kocovina?";
};


func int dia_randolph_wettkampfzuende_condition()
{
	if((MIS_RUKHAR_WETTKAMPF == LOG_SUCCESS) && (KAPITEL < 4))
	{
		return TRUE;
	};
};


var int dia_randolph_wettkampfzuende_onetime;

func void dia_randolph_wettkampfzuende_info()
{
	AI_Output(other,self,"DIA_Randolph_WETTKAMPFZUENDE_15_00");	//Kocovina?
	if(RUKHAR_WON_WETTKAMPF == TRUE)
	{
		AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_01");	//P��mo matka v�ech kocovin. A j� j� nem��u zbavit. U� nebudu chlastat, p��sah�m.
		AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_02");	//Tvoje pen�ze jsou fu�. Je mi l�to.
	}
	else
	{
		AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_03");	//Ani n�pad. Je mi fajn, v�n�.
		if(DIA_RANDOLPH_WETTKAMPFZUENDE_ONETIME == FALSE)
		{
			AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_04");	//Tak to tentokr�t kone�n� vy�lo. Je�t� jednou d�k za pen�ze. Tady, vezmi si je zp�tky.
			CreateInvItems(self,itmi_gold,20);
			b_giveinvitems(self,other,itmi_gold,12);
			DIA_RANDOLPH_WETTKAMPFZUENDE_ONETIME = TRUE;
		};
		AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_05");	//Vypad� to, �e Rukhar nevstane zrovna brzo.
	};
	b_npcclearobsessionbydmt(self);
};


instance DIA_RANDOLPH_PERM(C_INFO)
{
	npc = bau_942_randolph;
	nr = 30;
	condition = dia_randolph_perm_condition;
	information = dia_randolph_perm_info;
	permanent = TRUE;
	description = "Jsi v po��dku?";
};


func int dia_randolph_perm_condition()
{
	if((KAPITEL >= 4) && (NPCOBSESSEDBYDMT_RANDOLPH == FALSE))
	{
		return TRUE;
	};
};


var int dia_randolph_perm_gotmoney;

func void dia_randolph_perm_info()
{
	if(hero.guild == GIL_KDF)
	{
		b_npcobsessedbydmt(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Randolph_PERM_15_00");	//Jsi v po��dku?
		if(((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)) && (MIS_HEALRANDOLPH != LOG_SUCCESS))
		{
			if((DIA_SAGITTA_HEALRANDOLPH_GOTONE == FALSE) && (DIA_SAGITTA_HEALRANDOLPH_KNOWSPRICE == TRUE) && (DIA_RANDOLPH_PERM_GOTMONEY == FALSE))
			{
				AI_Output(other,self,"DIA_Randolph_PERM_15_01");	//Pos�l� m� tam bez jedin� zlatky a v�bec se neobt�uje� mi ��ct, �e to je tak drah�?
				AI_Output(other,self,"DIA_Randolph_PERM_15_02");	//Sagitta po mn� chce 300 zlat�ch.
				AI_Output(self,other,"DIA_Randolph_PERM_06_03");	//Nem��u ti d�t v�c ne� 150 zlat�ch. Pros�m, mus� mi pomoct. Pros�m.
				CreateInvItems(self,itmi_gold,150);
				b_giveinvitems(self,other,itmi_gold,150);
				DIA_RANDOLPH_PERM_GOTMONEY = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Randolph_PERM_06_04");	//Jsem v�n� na dn�. I kdybych p�estal p�t, zabije m� abs��k. V�n� pot�ebuju pomoct.
				AI_Output(self,other,"DIA_Randolph_PERM_06_05");	//Je tu jeden zp�sob, jak bys mi mohl pomoct.
				AI_Output(self,other,"DIA_Randolph_PERM_06_06");	//Sagitta, ta star� bylink��ka, to pro m� p�ipravuje. Ale nemysl�m si, �e bych to mohl dok�zat, kdy� je te� v okol� tolik sk�et�.
			};
			Log_CreateTopic(TOPIC_HEALRANDOLPH,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_HEALRANDOLPH,LOG_RUNNING);
			b_logentry(TOPIC_HEALRANDOLPH,"Randolph pr� nechal pit� a poslal m� za bylink��kou Sagittou, aby mu dala n�co na jeho abstinen�n� p��znaky.");
			MIS_HEALRANDOLPH = LOG_RUNNING;
		}
		else
		{
			AI_Output(self,other,"DIA_Randolph_PERM_06_07");	//Je�t� po��d se mi trochu pletou nohy, ale jinak jsem v pohod�.
		};
	};
};


instance DIA_RANDOLPH_HEILUNG(C_INFO)
{
	npc = bau_942_randolph;
	nr = 55;
	condition = dia_randolph_heilung_condition;
	information = dia_randolph_heilung_info;
	permanent = TRUE;
	description = "Chlast ti nalezl do hlavy, co?";
};


func int dia_randolph_heilung_condition()
{
	if((NPCOBSESSEDBYDMT_RANDOLPH == TRUE) && (NPCOBSESSEDBYDMT == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_randolph_heilung_info()
{
	AI_Output(other,self,"DIA_Randolph_Heilung_15_00");	//Chlast ti nalezl do hlavy, co?
	AI_Output(self,other,"DIA_Randolph_Heilung_06_01");	//U� si ned�m ani pan�ka. Ne v tomhle �ivot�. To se m��e� vsadit, chlape.
	b_npcclearobsessionbydmt(self);
};


instance DIA_RANDOLPH_SAGITTAHEAL(C_INFO)
{
	npc = bau_942_randolph;
	nr = 56;
	condition = dia_randolph_sagittaheal_condition;
	information = dia_randolph_sagittaheal_info;
	description = "Tady. To by m�lo zm�rnit abstinen�n� p��znaky.";
};


func int dia_randolph_sagittaheal_condition()
{
	if((MIS_HEALRANDOLPH == LOG_RUNNING) && Npc_HasItems(other,itpo_healrandolph_mis))
	{
		return TRUE;
	};
};

func void dia_randolph_sagittaheal_info()
{
	AI_Output(other,self,"DIA_Randolph_SAGITTAHEAL_15_00");	//Tady. To by m�lo zm�rnit abstinen�n� p��znaky.
	b_giveinvitems(other,self,itpo_healrandolph_mis,1);
	if(Npc_IsInState(self,zs_pick_fp))
	{
		b_useitem(self,itpo_healrandolph_mis);
	};
	AI_Output(self,other,"DIA_Randolph_SAGITTAHEAL_06_01");	//Ach! D�ky, chlape. Te� si zase budu moct odpo�inout.
	AI_Output(self,other,"DIA_Randolph_SAGITTAHEAL_06_02");	//Jak se ti za to budu moct kdy odvd��it?
	if(DIA_RANDOLPH_PERM_GOTMONEY == FALSE)
	{
		AI_Output(self,other,"DIA_Randolph_SAGITTAHEAL_06_03");	//H�d�m, �e t�chhle p�r minc� je dobrejch akor�t k tomu, abych si zachoval tv��. Ale to je v�echno, je mi l�to.
		CreateInvItems(self,itmi_gold,150);
		b_giveinvitems(self,other,itmi_gold,150);
	}
	else
	{
		AI_Output(other,self,"DIA_Randolph_SAGITTAHEAL_15_04");	//Zaplatil jsem za tebe spoustu pen�z a t�ch tvejch p�r u�mudlanejch minc� nesta�� ani na pokryt� mejch n�klad�.
		AI_Output(self,other,"DIA_Randolph_SAGITTAHEAL_06_05");	//Fajn - v tom p��pad� m��u mluvit o �t�st�, �e jsem potkal tak vst��cn�ho paladina, nemysl�?
	};
	MIS_HEALRANDOLPH = LOG_SUCCESS;
	b_giveplayerxp(XP_HEALRANDOLPH);
	b_npcclearobsessionbydmt(self);
};


instance DIA_RANDOLPH_PICKPOCKET(C_INFO)
{
	npc = bau_942_randolph;
	nr = 900;
	condition = dia_randolph_pickpocket_condition;
	information = dia_randolph_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_randolph_pickpocket_condition()
{
	return c_beklauen(58,2);
};

func void dia_randolph_pickpocket_info()
{
	Info_ClearChoices(dia_randolph_pickpocket);
	Info_AddChoice(dia_randolph_pickpocket,DIALOG_BACK,dia_randolph_pickpocket_back);
	Info_AddChoice(dia_randolph_pickpocket,DIALOG_PICKPOCKET,dia_randolph_pickpocket_doit);
};

func void dia_randolph_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_randolph_pickpocket);
};

func void dia_randolph_pickpocket_back()
{
	Info_ClearChoices(dia_randolph_pickpocket);
};

