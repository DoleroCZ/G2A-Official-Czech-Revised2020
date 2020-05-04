
instance DIA_ONAR_EXIT(C_INFO)
{
	npc = bau_900_onar;
	nr = 999;
	condition = dia_onar_exit_condition;
	information = dia_onar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_onar_exit_condition()
{
	return TRUE;
};

func void dia_onar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ONAR_HALLO(C_INFO)
{
	npc = bau_900_onar;
	nr = 1;
	condition = dia_onar_hallo_condition;
	information = dia_onar_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_onar_hallo_condition()
{
	if((self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_onar_hallo_info()
{
	AI_Output(self,other,"DIA_Onar_Hallo_14_00");	//Kdo tì sem pustil?!
	AI_Output(self,other,"DIA_Onar_Hallo_14_01");	//Co dìláš na mé farmì?!
};


instance DIA_ONAR_PERM(C_INFO)
{
	npc = bau_900_onar;
	nr = 1;
	condition = dia_onar_perm_condition;
	information = dia_onar_perm_info;
	permanent = TRUE;
	description = "Je tady na farmì všechno v poøádku?";
};


func int dia_onar_perm_condition()
{
	return TRUE;
};

func void dia_onar_perm_info()
{
	AI_Output(other,self,"DIA_Onar_PERM_15_00");	//Je tady na farmì všechno v poøádku?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_01");	//Nechápu, co se staráš. Nepatøíš na farmu!
	};
	if(other.guild == GIL_SLD)
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_02");	//Samozøejmì doufám, že ano! Za to pøece platím!!
		AI_Output(self,other,"DIA_Onar_PERM_14_03");	//Udìláš nejlíp, když zajdeš za Torlofem a požádáš o nìjakou práci.
	};
	if(other.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_04");	//Jo, jasnì. Jen si bìž lovit ty své draky.
	};
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_05");	//Vy pokryteètí bastardi z kláštera tu nejste vítáni!
	};
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_06");	//Naše pohostinnost se na královská vojska nevztahuje.
	};
};


instance DIA_ONAR_WORK(C_INFO)
{
	npc = bau_900_onar;
	nr = 2;
	condition = dia_onar_work_condition;
	information = dia_onar_work_info;
	permanent = FALSE;
	description = "Chci pro tebe pracovat!";
};


func int dia_onar_work_condition()
{
	if(LEE_SENDTOONAR == FALSE)
	{
		return TRUE;
	};
};

func void dia_onar_work_info()
{
	AI_Output(other,self,"DIA_Onar_Work_15_00");	//Chci pro tebe pracovat!
	AI_Output(self,other,"DIA_Onar_Work_14_01");	//Teï nepotøebuju žádného dalšího nádeníka.
	AI_Output(self,other,"DIA_Onar_Work_14_02");	//Moji lidé se starají o všechno ostatní.
	AI_Output(self,other,"DIA_Onar_Work_14_03");	//Nemáš tady co dìlat, tak mazej!
};


instance DIA_ONAR_WORKASSLD(C_INFO)
{
	npc = bau_900_onar;
	nr = 2;
	condition = dia_onar_workassld_condition;
	information = dia_onar_workassld_info;
	permanent = FALSE;
	description = "Chci se stát žoldnéøem!";
};


func int dia_onar_workassld_condition()
{
	if((LEE_SENDTOONAR == FALSE) && (ONAR_WEGENSLDWERDEN == FALSE) && Npc_KnowsInfo(other,dia_onar_work))
	{
		return TRUE;
	};
};

func void dia_onar_workassld_info()
{
	AI_Output(other,self,"DIA_Onar_WorkAsSld_15_00");	//Chci se stát žoldnéøem!
	AI_Output(self,other,"DIA_Onar_WorkAsSld_14_01");	//Ty? Žoldnéø? Nenech se vysmát! Pokud bys jako žoldák za nìco stál, musel by mi o tom Lee nìco øíct.
	AI_Output(self,other,"DIA_Onar_WorkAsSld_14_02");	//A teï vypadni, pronto!
	ONAR_WEGENSLDWERDEN = TRUE;
};


instance DIA_ONAR_AUFSTAND(C_INFO)
{
	npc = bau_900_onar;
	nr = 3;
	condition = dia_onar_aufstand_condition;
	information = dia_onar_aufstand_info;
	permanent = FALSE;
	description = "Vzbouøili jste se proti mìstu, nebo co jsem to zaslechl?";
};


func int dia_onar_aufstand_condition()
{
	return TRUE;
};

func void dia_onar_aufstand_info()
{
	AI_Output(other,self,"DIA_Onar_Aufstand_15_00");	//Vzbouøili jste se proti mìstu, nebo co jsem to zaslechl?
	AI_Output(self,other,"DIA_Onar_Aufstand_14_01");	//Teï mì poslouchej. Zdìdil jsem tuhle farmu a tuhle pùdu po svém otci.
	AI_Output(self,other,"DIA_Onar_Aufstand_14_02");	//A on ji zase zdìdil po SVÉM otci.
	AI_Output(self,other,"DIA_Onar_Aufstand_14_03");	//Nedovolím tìm nenažranejm královskejm pitomcùm odjet s tím vším jen proto, aby nakrmili tu svojí armádu budižknièemù.
	AI_Output(self,other,"DIA_Onar_Aufstand_14_04");	//Ta válka se skøety nikdy neskonèí. A kde budeme my? Mezi prvními, co padnou.
	AI_Output(self,other,"DIA_Onar_Aufstand_14_05");	//Ne - radìji budu svou farmu bránit sám! Peníze, které takhle našetøím, mi zaplatí celou armádu.
};


instance DIA_ONAR_WEGENPEPE(C_INFO)
{
	npc = bau_900_onar;
	nr = 4;
	condition = dia_onar_wegenpepe_condition;
	information = dia_onar_wegenpepe_info;
	permanent = FALSE;
	description = "Díky Bullcovi teï máte o pár ovcí míò.";
};


func int dia_onar_wegenpepe_condition()
{
	if(MIS_PEPE_KILLWOLVES == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_onar_wegenpepe_info()
{
	AI_Output(other,self,"DIA_Onar_WegenPepe_15_00");	//Díky Bullcovi teï máte o pár ovcí míò.
	AI_Output(self,other,"DIA_Onar_WegenPepe_14_01");	//O èem to mluvíš? Kdo je Bullco?
	AI_Output(other,self,"DIA_Onar_WegenPepe_15_02");	//Jeden ze žoldnéøù.
	AI_Output(self,other,"DIA_Onar_WegenPepe_14_03");	//Proè by mì to mìlo zajímat? Jestli má zálusk na moje ovce, bude se muset zodpovídat Leeovi.
	AI_Output(self,other,"DIA_Onar_WegenPepe_14_04");	//Tak co mì otravuješ s takovejma nepodstatnejma hloupostma?
	ONAR_WEGENPEPE = TRUE;
};


instance DIA_ONAR_WEGENSEKOB(C_INFO)
{
	npc = bau_900_onar;
	nr = 5;
	condition = dia_onar_wegensekob_condition;
	information = dia_onar_wegensekob_info;
	permanent = FALSE;
	description = "Pøišel jsem kvùli Sekobovu nájmu...";
};


func int dia_onar_wegensekob_condition()
{
	if(MIS_SEKOB_REDEMITONAR == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_onar_wegensekob_info()
{
	AI_Output(other,self,"DIA_Onar_WegenSekob_15_00");	//Pøišel jsem kvùli Sekobovu nájmu...
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Onar_WegenSekob_14_01");	//A proè s tím ksakru lezeš za mnou? Dej ty peníze Torlofovi.
	}
	else
	{
		AI_Output(self,other,"DIA_Onar_WegenSekob_14_02");	//Proè si zatracenì myslíš, že to je TVOJE starost?
		AI_Output(other,self,"DIA_Onar_WegenSekob_15_03");	//Chci se stát žoldnéøem. Výbìr nájemného je souèástí zkoušky.
		ONAR_WEGENSLDWERDEN = TRUE;
	};
	AI_Output(other,self,"DIA_Onar_WegenSekob_15_04");	//Ale Sekob nemá žádný peníze. Už jsem mu to nandal.
	AI_Output(other,self,"DIA_Onar_WegenSekob_15_05");	//Øíká, že to je kvùli špatné úrodì.
	AI_Output(self,other,"DIA_Onar_WegenSekob_14_06");	//(øve) Ty pitomèe! Myslíš, že nechá ty peníze jen tak nìkde povalovat? Nìkam je ukryl!
	AI_Output(self,other,"DIA_Onar_WegenSekob_14_07");	//Víš, kolik napršelo? Špatná úroda, tupèe.
	AI_Output(self,other,"DIA_Onar_WegenSekob_14_08");	//Bìž a vymla z nìj ty prachy.
	ONAR_WEGENSEKOB = TRUE;
};


instance DIA_ONAR_LEESENTME(C_INFO)
{
	npc = bau_900_onar;
	nr = 6;
	condition = dia_onar_leesentme_condition;
	information = dia_onar_leesentme_info;
	permanent = FALSE;
	description = "Poslal mì Lee. Chci tady pracovat jako žoldnéø!";
};


func int dia_onar_leesentme_condition()
{
	if((LEE_SENDTOONAR == TRUE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_onar_leesentme_info()
{
	AI_Output(other,self,"DIA_Onar_LeeSentMe_15_00");	//Poslal mì Lee. Chci tady pracovat jako žoldnéø!
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_01");	//Už mi o tom øekl.
	if(ONAR_WEGENSLDWERDEN == TRUE)
	{
		AI_Output(self,other,"DIA_Onar_LeeSentMe_14_02");	//Když jsem tì poprvé vidìl, nemìl jsem o tobì valné mínìní.
		AI_Output(self,other,"DIA_Onar_LeeSentMe_14_03");	//Ale když si Lee myslí, že to zvládneš, jsem ochoten dát ti šanci.
	};
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_04");	//On je za tebe zodpovìdný. Tak se koukej èinit.
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_05");	//Ale žádný blbosti! Nech farmáøe a služky na pokoji a hlavnì si nic nepøivlastòuj, jasný?
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_06");	//S èimkoli dalším se obra na Leeho.
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_07");	//Všechno, o èem se potøebujeme bavit, se týká tvého žoldu.
	ONAR_APPROVED = TRUE;
	b_logentry(TOPIC_BECOMESLD,"Onar mi dal svùj souhlas. Teï už mi nic nezabrání, abych se pøidal k žoldákùm!");
};


var int onar_sold_day;
var int onar_sold_xp;

instance DIA_ONAR_HOWMUCH(C_INFO)
{
	npc = bau_900_onar;
	nr = 7;
	condition = dia_onar_howmuch_condition;
	information = dia_onar_howmuch_info;
	permanent = FALSE;
	description = "Tak co je s tím žoldem?";
};


func int dia_onar_howmuch_condition()
{
	if(ONAR_APPROVED == TRUE)
	{
		return TRUE;
	};
};

func void dia_onar_howmuch_info()
{
	AI_Output(other,self,"DIA_Onar_HowMuch_15_00");	//Tak co je s tím žoldem?
	AI_Output(self,other,"DIA_Onar_HowMuch_14_01");	//Fajn, podívejme...
	SOLD = 50;
	if(ONAR_WEGENSLDWERDEN == TRUE)
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_14_02");	//Nevypadáš moc k svìtu.
	};
	if(ONAR_WEGENSEKOB == TRUE)
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_14_03");	//Ty sis vážnì nebyl dvakrát, když Innos rozdával rozum. To se pozná podle tý vìci se Sekobem.
		SOLD = SOLD - 10;
	};
	if((ABSOLUTIONLEVEL_FARM > 1) || ((b_getgreatestpetzcrime(self) > CRIME_NONE) && (ABSOLUTIONLEVEL_FARM > 0)))
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_14_04");	//Už jsi tu nejednou zpùsobil problémy.
		SOLD = SOLD - 10;
	};
	if((ONAR_WEGENPEPE == TRUE) && ((ONAR_WEGENSEKOB == TRUE) || (ONAR_WEGENSLDWERDEN == TRUE)))
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_14_05");	//A poøád mi za zády vyvádíš samý ptákoviny.
		SOLD = SOLD - 10;
	};
	AI_Output(self,other,"DIA_Onar_HowMuch_14_06");	//Nech mì hádat...
	b_say_gold(self,other,SOLD);
	ONAR_SOLD_DAY = Wld_GetDay();
	ONAR_SOLD_XP = other.exp;
	AI_Output(self,other,"DIA_Onar_HowMuch_14_07");	//Co øikáš?
	Info_ClearChoices(dia_onar_howmuch);
	Info_AddChoice(dia_onar_howmuch,"Nìjaký námitky?",dia_onar_howmuch_ok);
	Info_AddChoice(dia_onar_howmuch,"To není zrovna moc ...",dia_onar_howmuch_more);
	Info_AddChoice(dia_onar_howmuch,"Za den?",dia_onar_howmuch_perday);
};

func void dia_onar_howmuch_perday()
{
	AI_Output(other,self,"DIA_Onar_HowMuch_PerDay_15_00");	//Za den?
	AI_Output(self,other,"DIA_Onar_HowMuch_PerDay_14_01");	//Cos myslel? Za týden? Vážnì ti to moc nepálí.
	AI_Output(self,other,"DIA_Onar_HowMuch_PerDay_14_02");	//Tak zvedni ten svùj zadek a bìž pro ty peníze.
	AI_Output(self,other,"DIA_Onar_HowMuch_PerDay_14_03");	//Nehodlám se o to za tebe postarat.
};

func void dia_onar_howmuch_more()
{
	AI_Output(other,self,"DIA_Onar_HowMuch_More_15_00");	//To není zrovna moc.
	AI_Output(self,other,"DIA_Onar_HowMuch_More_14_01");	//Jasnì, jestli chceš, mùžeš u mì pracovat zadarmo.
	AI_Output(self,other,"DIA_Onar_HowMuch_More_14_02");	//Mimochodem, tohle je všechno, co dostaneš!
	Log_CreateTopic(TOPIC_BONUS,LOG_NOTE);
	b_logentry(TOPIC_BONUS,"Svùj plat si mohu u Onara vyzvednout každý den.");
	Info_ClearChoices(dia_onar_howmuch);
};

func void dia_onar_howmuch_ok()
{
	AI_Output(other,self,"DIA_Onar_HowMuch_Ok_15_00");	//Nìjaký námitky?
	AI_Output(self,other,"DIA_Onar_HowMuch_Ok_14_01");	//Taky si myslím. Teï zajdi za Leem.
	Log_CreateTopic(TOPIC_BONUS,LOG_NOTE);
	b_logentry(TOPIC_BONUS,"Svùj plat si mohu u Onara vyzvednout každý den.");
	Info_ClearChoices(dia_onar_howmuch);
};


instance DIA_ONAR_COLLECTGOLD(C_INFO)
{
	npc = bau_900_onar;
	nr = 8;
	condition = dia_onar_collectgold_condition;
	information = dia_onar_collectgold_info;
	permanent = TRUE;
	description = "Dej mi mùj žold!";
};


func int dia_onar_collectgold_condition()
{
	if(Npc_KnowsInfo(other,dia_onar_howmuch) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_onar_collectgold_info()
{
	AI_Output(other,self,"DIA_Onar_CollectGold_15_00");	//Dej mi mùj žold!
	if(other.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Onar_CollectGold_14_01");	//Platím žoldákùm, ne drakobijcùm.
	}
	else if(TORLOF_THEOTHERMISSION_TOOLATE == TRUE)
	{
		AI_Output(self,other,"DIA_Onar_CollectGold_14_02");	//Nestarej se to, co dostaneš za úkol!
		AI_Output(self,other,"DIA_Onar_CollectGold_14_03");	//Ptal jsem se Torlofa, jak ti to jde. A øíkal, že ti trvá vìènost, než nìco udìláš.
		AI_Output(self,other,"DIA_Onar_CollectGold_14_04");	//Nebudu plýtvat penìzi na darmošlapy.
		AI_Output(self,other,"DIA_Onar_CollectGold_14_05");	//Teï budeš nìkolik týdnù makat bez nároku na žold! To tì možná nauèí.
	}
	else if(b_getgreatestpetzcrime(self) > CRIME_NONE)
	{
		AI_Output(self,other,"DIA_Onar_CollectGold_14_06");	//Slyšel jsem, žes to zpackal. Nejdøív zajdi za Leem a dej tu vìc do poøádku.
	}
	else if(Wld_GetDay() <= ONAR_SOLD_DAY)
	{
		AI_Output(self,other,"DIA_Onar_CollectGold_14_07");	//Pøeskoèilo ti snad?
		AI_Output(self,other,"DIA_Onar_CollectGold_14_08");	//Nejdøív budeš pár dní pracovat pro mì. Žold budeš dostávat vždycky následující den.
	}
	else if((Wld_GetDay() - 2) >= ONAR_SOLD_DAY)
	{
		if((Wld_GetDay() - 2) == ONAR_SOLD_DAY)
		{
			AI_Output(self,other,"DIA_Onar_CollectGold_14_09");	//Kdes byl vèera?
		}
		else
		{
			AI_Output(self,other,"DIA_Onar_CollectGold_14_10");	//Kdes byl posledních pár dní?
		};
		AI_Output(self,other,"DIA_Onar_CollectGold_14_11");	//Nikdy ses tu neukázal.
		AI_Output(self,other,"DIA_Onar_CollectGold_14_12");	//Kdo ví, kde ses flákal.
		ONAR_SOLD_DAY = Wld_GetDay();
		ONAR_SOLD_XP = other.exp;
	}
	else
	{
		if(other.exp > (ONAR_SOLD_XP + 200))
		{
			AI_Output(self,other,"DIA_Onar_CollectGold_14_13");	//(zkroušenì) No dobrá. Tady je tvùj žold.
			b_giveinvitems(self,other,itmi_gold,SOLD);
			b_say_gold(self,other,SOLD);
		}
		else
		{
			AI_Output(self,other,"DIA_Onar_CollectGold_14_14");	//Co? Nedìlal jsi nic jiného, než že ses poflakoval kolem? Teda když jsi zrovna nespal?
			AI_Output(self,other,"DIA_Onar_CollectGold_14_15");	//Za to ti platit nebudu!
		};
		ONAR_SOLD_DAY = Wld_GetDay();
		ONAR_SOLD_XP = other.exp;
	};
};


instance DIA_ONAR_MARIAGOLD(C_INFO)
{
	npc = bau_900_onar;
	nr = 9;
	condition = dia_onar_mariagold_condition;
	information = dia_onar_mariagold_info;
	permanent = FALSE;
	description = "Maria si myslí, že jsem nedostal dost.";
};


func int dia_onar_mariagold_condition()
{
	if(MARIA_MEHRGOLD == TRUE)
	{
		return TRUE;
	};
};

func void dia_onar_mariagold_info()
{
	AI_Output(other,self,"DIA_Onar_MariaGold_15_00");	//Maria si myslí, že jsem nedostal dost.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_01");	//Co?
	AI_Output(other,self,"DIA_Onar_MariaGold_15_02");	//Øíkala, že bys mi mìl platit víc.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_03");	//(remcá) Ta ženská taky musí do všeho strkat nos.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_04");	//Øekla ti kolik?
	AI_Output(other,self,"DIA_Onar_MariaGold_15_05");	//Ne.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_06");	//Dobrá, poèínaje pøíštím žoldem budeš dostávat o 10 zlatých víc.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_07");	//Ale ani o minci víc, jasný?
	SOLD = SOLD + 10;
};


var int onar_sellsheep;

instance DIA_ONAR_WANNASHEEP(C_INFO)
{
	npc = bau_900_onar;
	nr = 10;
	condition = dia_onar_wannasheep_condition;
	information = dia_onar_wannasheep_info;
	permanent = TRUE;
	description = "Chci koupit ovci!";
};


func int dia_onar_wannasheep_condition()
{
	if(ONAR_SELLSHEEP == FALSE)
	{
		return TRUE;
	};
};

func void dia_onar_wannasheep_info()
{
	AI_Output(other,self,"DIA_Onar_WannaSheep_15_00");	//Chci koupit ovci!
	AI_Output(self,other,"DIA_Onar_WannaSheep_14_01");	//Tak co s tím lezeš sem? Vidíš tu snad nìjakou ovci?
	AI_Output(other,self,"DIA_Onar_WannaSheep_15_02");	//Já...
	AI_Output(self,other,"DIA_Onar_WannaSheep_14_03");	//Jestli chceš koupit ovci, zajdi na pastvinu, je napravo od mého domu.
	AI_Output(self,other,"DIA_Onar_WannaSheep_14_04");	//Pepe ti nìjakou prodá.
	if(Npc_IsDead(pepe))
	{
		AI_Output(other,self,"DIA_Onar_WannaSheep_15_05");	//Pepe je mrtvý, je mi líto.
		AI_Output(self,other,"DIA_Onar_WannaSheep_14_06");	//Ó! V tom pøípadì... nech mi tu za ni 200 zlatých a vezmi si ji z pastviny sám.
		ONAR_SELLSHEEP = TRUE;
	};
};


instance DIA_ONAR_BUYLIESEL(C_INFO)
{
	npc = bau_900_onar;
	nr = 10;
	condition = dia_onar_buyliesel_condition;
	information = dia_onar_buyliesel_info;
	permanent = TRUE;
	description = "Tady máš, 200 zlatých. Dej mi tu ovci.";
};


func int dia_onar_buyliesel_condition()
{
	if(ONAR_SELLSHEEP == TRUE)
	{
		return TRUE;
	};
};

func void dia_onar_buyliesel_info()
{
	AI_Output(other,self,"DIA_Onar_BuyLiesel_15_00");	//Tady máš, 200 zlatých. Dej mi tu ovci.
	if(b_giveinvitems(other,self,itmi_gold,200))
	{
		AI_Output(self,other,"DIA_Onar_BuyLiesel_14_01");	//Mùžeš si ji z pastviny vzít sám.
		AI_Output(self,other,"DIA_Onar_BuyLiesel_14_02");	//Jedna z nich za tebou urèitì pùjde. Vìtšina jich slyší na jméno Betsy.
		Wld_InsertNpc(follow_sheep,"NW_BIGFARM_SHEEP2_02");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Onar_BuyLiesel_14_03");	//Nemáš tolik zlata. Neplýtvej mým drahocenným èasem.
	};
};

