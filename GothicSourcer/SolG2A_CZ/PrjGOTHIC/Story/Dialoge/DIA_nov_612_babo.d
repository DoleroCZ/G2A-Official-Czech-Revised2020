
instance DIA_BABO_KAP1_EXIT(C_INFO)
{
	npc = nov_612_babo;
	nr = 999;
	condition = dia_babo_kap1_exit_condition;
	information = dia_babo_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_babo_kap1_exit_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_babo_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BABO_HELLO(C_INFO)
{
	npc = nov_612_babo;
	nr = 2;
	condition = dia_babo_hello_condition;
	information = dia_babo_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_babo_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_babo_hello_info()
{
	AI_Output(self,other,"DIA_Babo_Hello_03_00");	//(ostýchavì) Ahoj, ty jsi tady také nový, co?
	AI_Output(other,self,"DIA_Babo_Hello_15_01");	//Ano. Jak dlouho tady jsi?
	AI_Output(self,other,"DIA_Babo_Hello_03_02");	//Zatím tady jsem ètyøi týdny. Dostal jsi už bojovou tyè?
	AI_Output(other,self,"DIA_Babo_Hello_15_03");	//Zatím ne.
	AI_Output(self,other,"DIA_Babo_Hello_03_04");	//Tak si vezmi tuhle. Každý novic dostane vlastní tyè - je symbolem toho, že je schopen se sám ubránit. Umíš bojovat?
	AI_Output(other,self,"DIA_Babo_Hello_15_05");	//No, už jsem jednu nebo dvì zbranì v ruce držel.
	AI_Output(self,other,"DIA_Babo_Hello_03_06");	//Kdybys chtìl, mùžu tì nìco nauèit. Mìl bych ale jednu prosbu...
	b_giveinvitems(self,other,itmw_1h_nov_mace,1);
	AI_EquipBestMeleeWeapon(self);
};


instance DIA_BABO_ANLIEGEN(C_INFO)
{
	npc = nov_612_babo;
	nr = 2;
	condition = dia_babo_anliegen_condition;
	information = dia_babo_anliegen_info;
	permanent = FALSE;
	description = "Co bys potøeboval?";
};


func int dia_babo_anliegen_condition()
{
	if((other.guild == GIL_NOV) && Npc_KnowsInfo(other,dia_babo_hello))
	{
		return TRUE;
	};
};

func void dia_babo_anliegen_info()
{
	AI_Output(other,self,"DIA_Babo_Anliegen_15_00");	//Co bys potøeboval?
	AI_Output(self,other,"DIA_Babo_Anliegen_03_01");	//No, jeden z paladinù, Sergio, je momentálnì tady v klášteøe.
	AI_Output(self,other,"DIA_Babo_Anliegen_03_02");	//Kdyby se ti podaøilo ho pøemluvit, aby si se mnou párkrát zacvièil, nìco bych tì nauèil.
	AI_Output(other,self,"DIA_Babo_Anliegen_15_03");	//Uvidím, co s tím pùjde dìlat.
	Log_CreateTopic(TOPIC_BABOTRAIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BABOTRAIN,LOG_RUNNING);
	b_logentry(TOPIC_BABOTRAIN,"Jestli se mi podaøí pøesvìdèit paladina Sergia, aby Baba trochu pocvièil v boji, nauèí mì bojovat obouruèními zbranìmi.");
};


instance DIA_BABO_SERGIO(C_INFO)
{
	npc = nov_612_babo;
	nr = 2;
	condition = dia_babo_sergio_condition;
	information = dia_babo_sergio_info;
	permanent = FALSE;
	description = "Mluvil jsem se Sergiem...";
};


func int dia_babo_sergio_condition()
{
	if(Npc_KnowsInfo(other,dia_sergio_babo) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_babo_sergio_info()
{
	AI_Output(other,self,"DIA_Babo_Sergio_15_00");	//Mluvil jsem se Sergiem. Bude tì trénovat dvì hodiny každé ráno, od pìti hodin.
	AI_Output(self,other,"DIA_Babo_Sergio_03_01");	//Díky! Je to pro mì obrovská èest!
	AI_Output(self,other,"DIA_Babo_Sergio_03_02");	//Kdybys chtìl, ukážu ti také nìjaké bojové finty.
	BABO_TEACHPLAYER = TRUE;
	BABO_TRAINING = TRUE;
	b_giveplayerxp(XP_AMBIENT * 2);
	Log_CreateTopic(TOPIC_KLOSTERTEACHER,LOG_NOTE);
	b_logentry(TOPIC_KLOSTERTEACHER,"Babo mì mùže vycvièit v obouruèním boji.");
};


instance DIA_BABO_TEACH(C_INFO)
{
	npc = nov_612_babo;
	nr = 100;
	condition = dia_babo_teach_condition;
	information = dia_babo_teach_info;
	permanent = TRUE;
	description = "Jsem pøipraven na výcvik.";
};


var int dia_babo_teach_permanent;
var int babo_labercount;

func int dia_babo_teach_condition()
{
	if(((BABO_TEACHPLAYER == TRUE) && (DIA_BABO_TEACH_PERMANENT == FALSE)) || (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};


var int babo_merk2h;

func void dia_babo_teach_info()
{
	BABO_MERK2H = other.hitchance[NPC_TALENT_2H];
	AI_Output(other,self,"DIA_Babo_Teach_15_00");	//Jsem pøipraven na výcvik.
	Info_ClearChoices(dia_babo_teach);
	Info_AddChoice(dia_babo_teach,DIALOG_BACK,dia_babo_teach_back);
	Info_AddChoice(dia_babo_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_babo_teach_2h_1);
	Info_AddChoice(dia_babo_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_babo_teach_2h_5);
};

func void dia_babo_teach_back()
{
	if(other.hitchance[NPC_TALENT_2H] >= 75)
	{
		AI_Output(self,other,"DIA_DIA_Babo_Teach_Back_03_00");	//Už ses nauèil o boji s obouruèními zbranìmi všechno, co znám.
		DIA_BABO_TEACH_PERMANENT = TRUE;
	};
	Info_ClearChoices(dia_babo_teach);
};

func void dia_babo_teach_2h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,75);
	if(other.hitchance[NPC_TALENT_2H] > BABO_MERK2H)
	{
		if(BABO_LABERCOUNT == 0)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_03_00");	//Bojuj za Innose. Innos je náš život - a tvá víra ti bude dávat sílu.
		};
		if(BABO_LABERCOUNT == 1)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_03_01");	//Innosùv služebník nikdy svého protivníka neprovokuje - pøekvapí ho!
		};
		if(BABO_LABERCOUNT == 2)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_03_02");	//A jdeš kamkoliv, mìj svou tyè stále po ruce.
		};
		if(BABO_LABERCOUNT == 3)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_03_03");	//Innosùv služebník je vždycky pøipravený k boji. Pokud ti nemùže posloužit magie, je tvojí nejvìtší obranou právì hùl.
		};
		BABO_LABERCOUNT = BABO_LABERCOUNT + 1;
		if(BABO_LABERCOUNT >= 3)
		{
			BABO_LABERCOUNT = 0;
		};
	};
	Info_ClearChoices(dia_babo_teach);
	Info_AddChoice(dia_babo_teach,DIALOG_BACK,dia_babo_teach_back);
	Info_AddChoice(dia_babo_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_babo_teach_2h_1);
	Info_AddChoice(dia_babo_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_babo_teach_2h_5);
};

func void dia_babo_teach_2h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,75);
	if(other.hitchance[NPC_TALENT_2H] > BABO_MERK2H)
	{
		if(BABO_LABERCOUNT == 0)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_00");	//Innosùv služebník nebojuje jenom tyèí, ale také svým srdcem.
		};
		if(BABO_LABERCOUNT == 1)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_01");	//Vždycky musíš mít v pamìti místo, kam se mùžeš v pøípadì potøeby stáhnout.
		};
		if(BABO_LABERCOUNT == 2)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_02");	//Nezapomeò, že dobøe bojuješ v pøípadì, kdy svého protivníka ovládáš a nedáváš mu šanci, aby se ovládal sám.
		};
		if(BABO_LABERCOUNT == 3)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_03");	//Prohraješ pouze v pøípadì, když se vzdáš.
		};
		BABO_LABERCOUNT = BABO_LABERCOUNT + 1;
		if(BABO_LABERCOUNT >= 3)
		{
			BABO_LABERCOUNT = 0;
		};
	};
	Info_ClearChoices(dia_babo_teach);
	Info_AddChoice(dia_babo_teach,DIALOG_BACK,dia_babo_teach_back);
	Info_AddChoice(dia_babo_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_babo_teach_2h_1);
	Info_AddChoice(dia_babo_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_babo_teach_2h_5);
};


instance DIA_BABO_WURST(C_INFO)
{
	npc = nov_612_babo;
	nr = 2;
	condition = dia_babo_wurst_condition;
	information = dia_babo_wurst_info;
	permanent = FALSE;
	description = "Tady máš klobásu.";
};


func int dia_babo_wurst_condition()
{
	if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void dia_babo_wurst_info()
{
	var string novizetext;
	var string novizeleft;
	AI_Output(other,self,"DIA_Babo_Wurst_15_00");	//Tady máš klobásu.
	AI_Output(self,other,"DIA_Babo_Wurst_03_01");	//Ach, skopová klobáska, výbornì! Chutnají vážnì výbornì - hele, dej mi ještì jednu!
	AI_Output(other,self,"DIA_Babo_Wurst_15_02");	//Pak mi jich už ale nezbude dost pro ostatní.
	AI_Output(self,other,"DIA_Babo_Wurst_03_03");	//Už jsi dostal stejnì o jednu víc, než si zasloužíš. Konkrétnì o tu, kterou jsem ti právì dal. A co je klobása mezi pøáteli?
	AI_Output(self,other,"DIA_Babo_Wurst_03_04");	//No tak, dám ti za ní svitek s kouzlem 'Ohnivý šíp'.
	b_giveinvitems(other,self,itfo_schafswurst,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,itfo_sausage);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,2);
	Info_ClearChoices(dia_babo_wurst);
	Info_AddChoice(dia_babo_wurst,"No dobøe, tak si ještì vezmi.",dia_babo_wurst_ja);
	Info_AddChoice(dia_babo_wurst,"Ne, to by prostì nešlo.",dia_babo_wurst_nein);
};

func void dia_babo_wurst_ja()
{
	AI_Output(other,self,"DIA_Babo_Wurst_JA_15_00");	//No dobøe, tak si ještì vezmi.
	AI_Output(self,other,"DIA_Babo_Wurst_JA_03_01");	//Bezva. Tady je ten svitek.
	b_giveinvitems(other,self,itfo_schafswurst,1);
	b_giveinvitems(self,other,itsc_firebolt,1);
	Info_ClearChoices(dia_babo_wurst);
};

func void dia_babo_wurst_nein()
{
	AI_Output(other,self,"DIA_Babo_Wurst_NEIN_15_00");	//Ne, to by prostì nešlo.
	AI_Output(self,other,"DIA_Babo_Wurst_NEIN_03_01");	//Chlape, že ty jsi jeden z tìch, co berou všechno moc zodpovìdnì?
	Info_ClearChoices(dia_babo_wurst);
};


instance DIA_BABO_YOUANDAGON(C_INFO)
{
	npc = nov_612_babo;
	nr = 3;
	condition = dia_babo_youandagon_condition;
	information = dia_babo_youandagon_info;
	permanent = FALSE;
	description = "Co se stalo mezi tebou a Agonem?";
};


func int dia_babo_youandagon_condition()
{
	if(Npc_KnowsInfo(other,dia_opolos_monastery) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_babo_youandagon_info()
{
	AI_Output(other,self,"DIA_Babo_YouAndAgon_15_00");	//Co se stalo mezi tebou a Agonem?
	AI_Output(self,other,"DIA_Babo_YouAndAgon_03_01");	//Ale to víš, trošku jsme se pohádali o tom, jak se starat o ohnivé kopøivy.
	AI_Output(self,other,"DIA_Babo_YouAndAgon_03_02");	//Agon je zaléval tak moc, že jim jednoho dne uhnily koøeny.
	AI_Output(self,other,"DIA_Babo_YouAndAgon_03_03");	//A když se to stalo, tak to pak shodil na mì.
	AI_Output(self,other,"DIA_Babo_YouAndAgon_03_04");	//Od té doby mì nenechají dìlat nic jiného, než jen zametat dvùr.
};


instance DIA_BABO_WHYDIDAGON(C_INFO)
{
	npc = nov_612_babo;
	nr = 4;
	condition = dia_babo_whydidagon_condition;
	information = dia_babo_whydidagon_info;
	permanent = FALSE;
	description = "Proè to Agon udìlal?";
};


func int dia_babo_whydidagon_condition()
{
	if(Npc_KnowsInfo(other,dia_babo_youandagon) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_babo_whydidagon_info()
{
	AI_Output(other,self,"DIA_Babo_WhyDidAgon_15_00");	//Proè to Agon udìlal?
	AI_Output(self,other,"DIA_Babo_WhyDidAgon_03_01");	//Na to se ho budeš muset zeptat sám. Myslím, že nesnese pomyšlení na to, že by mohl být nìkdo lepší než on.
};


instance DIA_BABO_PLANTLORE(C_INFO)
{
	npc = nov_612_babo;
	nr = 5;
	condition = dia_babo_plantlore_condition;
	information = dia_babo_plantlore_info;
	permanent = FALSE;
	description = "Zdá se, že se v rostlinách docela vyznáš.";
};


func int dia_babo_plantlore_condition()
{
	if(Npc_KnowsInfo(other,dia_babo_youandagon) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_babo_plantlore_info()
{
	AI_Output(other,self,"DIA_Babo_PlantLore_15_00");	//Zdá se, že se v rostlinách docela vyznáš.
	AI_Output(self,other,"DIA_Babo_PlantLore_03_01");	//Mùj dìdeèek mìl bylinkovou zahrádku a tam jsem se pár vìcí nauèil.
	AI_Output(self,other,"DIA_Babo_PlantLore_03_02");	//Vážnì bych byl rád, kdybych mohl znovu pracovat v zahradì.
	MIS_HELPBABO = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BABOGAERTNER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BABOGAERTNER,LOG_RUNNING);
	b_logentry(TOPIC_BABOGAERTNER,"Babo by radši pracoval v bylinkáøské zahradì, než aby zametal dvùr.");
};


instance DIA_BABO_FEGEN(C_INFO)
{
	npc = nov_612_babo;
	nr = 2;
	condition = dia_babo_fegen_condition;
	information = dia_babo_fegen_info;
	permanent = FALSE;
	description = "Mám za úkol zametat v komnatách novicù.";
};


func int dia_babo_fegen_condition()
{
	if(MIS_PARLANFEGEN == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_babo_fegen_info()
{
	AI_Output(other,self,"DIA_Babo_Fegen_15_00");	//Mám za úkol zametat v komnatách novicù.
	AI_Output(self,other,"DIA_Babo_Fegen_03_01");	//Tak to ti toho naložili docela dost. Víš co? Já ti pomùžu. Sám bys to nikdy nedodìlal.
	AI_Output(self,other,"DIA_Babo_Fegen_03_02");	//Strašnì nutnì ale potøebuji svitek s kouzlem 'Vìtrná pìst'. Víš, mìl jsem štìstí a pøeèetl jsem si o nìm knihu.
	AI_Output(self,other,"DIA_Babo_Fegen_03_03");	//Teï si pochopitelnì chci to kouzlo vyzkoušet. Pøines mi tedy ten svitek a já ti pomohu.
	b_logentry(TOPIC_PARLANFEGEN,"Babo mi pomùže zamést komnaty novicù, když mu pøinesu svitek vìtrné pìsti.");
};


instance DIA_BABO_WINDFAUST(C_INFO)
{
	npc = nov_612_babo;
	nr = 3;
	condition = dia_babo_windfaust_condition;
	information = dia_babo_windfaust_info;
	permanent = TRUE;
	description = "Co se toho svitku týèe...";
};


var int dia_babo_windfaust_permanent;

func int dia_babo_windfaust_condition()
{
	if((MIS_PARLANFEGEN == LOG_RUNNING) && Npc_KnowsInfo(other,dia_babo_fegen) && (DIA_BABO_WINDFAUST_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_babo_windfaust_info()
{
	AI_Output(other,self,"DIA_Babo_Windfaust_15_00");	//Co se toho svitku týèe...
	AI_Output(self,other,"DIA_Babo_Windfaust_03_01");	//Máš pro mì to kouzlo Vìtrná pìst?
	if(b_giveinvitems(other,self,itsc_windfist,1))
	{
		AI_Output(other,self,"DIA_Babo_Windfaust_15_02");	//Tady je ten svitek s kouzlem, jak jsi chtìl.
		AI_Output(self,other,"DIA_Babo_Windfaust_03_03");	//To je skvìlé. Teï ti pomùžu s tím zametáním.
		NOV_HELFER = NOV_HELFER + 1;
		DIA_BABO_WINDFAUST_PERMANENT = TRUE;
		b_giveplayerxp(XP_FEGER);
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FEGEN");
		b_logentry(TOPIC_PARLANFEGEN,"Babo mi nyní pomùže zamést cely novicù.");
	}
	else
	{
		AI_Output(other,self,"DIA_Babo_Windfaust_15_04");	//Ne, zatím ne.
		AI_Output(self,other,"DIA_Babo_Windfaust_03_05");	//V tom pøípadì poèkám, až se ti jej podaøí sehnat.
	};
	AI_StopProcessInfos(self);
};


instance DIA_BABO_LIFE(C_INFO)
{
	npc = nov_612_babo;
	nr = 10;
	condition = dia_babo_life_condition;
	information = dia_babo_life_info;
	permanent = TRUE;
	description = "Jak jde život tady v klášteøe?";
};


func int dia_babo_life_condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_babo_life_info()
{
	AI_Output(other,self,"DIA_Babo_Life_15_00");	//Jak jde život tady v klášteøe?
	AI_Output(self,other,"DIA_Babo_Life_03_01");	//Nerad bych, aby to vypadalo, že si stìžuju, ale nikdy mì nenapadlo, že to tady bude tak pøísné. Když se nedržíš pravidel, èeká tì trest.
	AI_Output(self,other,"DIA_Babo_Life_03_02");	//Samozøejmì, že spousta novicù chce v knihovnì studovat Innosovu moudrost, aby byli pøipraveni pro pøípad, že by byli vybráni.
	AI_Output(self,other,"DIA_Babo_Life_03_03");	//Já si ale myslím, že nejlepší pøípravou ke zkoušce magie je plnit zadané úkoly.
	if(Npc_KnowsInfo(other,dia_igaranz_choosen) == FALSE)
	{
		AI_Output(other,self,"DIA_Babo_Life_15_04");	//Co je to vlastnì kolem toho Vyvoleného a zkoušky?
		AI_Output(self,other,"DIA_Babo_Life_03_05");	//Promluv si s bratrem Igarazem. Ten o tom ví hodnì.
	};
};


instance DIA_BABO_HOWISIT(C_INFO)
{
	npc = nov_612_babo;
	nr = 1;
	condition = dia_babo_howisit_condition;
	information = dia_babo_howisit_info;
	permanent = TRUE;
	description = "Jak se máš?";
};


func int dia_babo_howisit_condition()
{
	if((hero.guild == GIL_KDF) && (KAPITEL < 3))
	{
		return TRUE;
	};
};


var int babo_xpgiven;

func void dia_babo_howisit_info()
{
	AI_Output(other,self,"DIA_Babo_HowIsIt_15_00");	//Jak se máš?
	if(MIS_HELPBABO == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Babo_HowIsIt_03_01");	//(skromnì) Dìkuji mágùm za svùj údìl.
		AI_Output(self,other,"DIA_Babo_HowIsIt_03_02");	//Jsem rád, že mohou pracovat v zahradì, a doufám, že jsou se mnou mágové spokojeni, mistøe.
		if(BABO_XPGIVEN == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			BABO_XPGIVEN = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Babo_HowIsIt_03_03");	//(podìšenì) D.. d.. dobøe, mistøe.
		AI_Output(self,other,"DIA_Babo_HowIsIt_03_04");	//... pracuji ze všech sil a snažím se nezklamat mágy.
	};
	AI_StopProcessInfos(self);
};


instance DIA_BABO_KAP2_EXIT(C_INFO)
{
	npc = nov_612_babo;
	nr = 999;
	condition = dia_babo_kap2_exit_condition;
	information = dia_babo_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_babo_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_babo_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BABO_KAP3_EXIT(C_INFO)
{
	npc = nov_612_babo;
	nr = 999;
	condition = dia_babo_kap3_exit_condition;
	information = dia_babo_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_babo_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_babo_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BABO_KAP3_HELLO(C_INFO)
{
	npc = nov_612_babo;
	nr = 31;
	condition = dia_babo_kap3_hello_condition;
	information = dia_babo_kap3_hello_info;
	permanent = FALSE;
	description = "Co tady dìláš?";
};


func int dia_babo_kap3_hello_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_babo_kap3_hello_info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Hello_15_00");	//Co tady dìláš?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Babo_Kap3_Hello_03_01");	//(rozpaèitì) Snažím se splnit úkoly, které my byly zadány ku prospìchu kláštera.
	}
	else
	{
		AI_Output(self,other,"DIA_Babo_Kap3_Hello_03_02");	//Nesmím s tebou mluvit. Na rozhovory s cizinci zde není nahlíženo s pochopením.
	};
};


instance DIA_BABO_KAP3_KEEPTHEFAITH(C_INFO)
{
	npc = nov_612_babo;
	nr = 31;
	condition = dia_babo_kap3_keepthefaith_condition;
	information = dia_babo_kap3_keepthefaith_info;
	permanent = FALSE;
	description = "Nikdy nesmíš ztratit víru.";
};


func int dia_babo_kap3_keepthefaith_condition()
{
	if((KAPITEL >= 3) && Npc_KnowsInfo(other,dia_babo_kap3_hello) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_babo_kap3_keepthefaith_info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_KeepTheFaith_15_00");	//Nikdy nesmíš ztratit víru.
	AI_Output(self,other,"DIA_Babo_Kap3_KeepTheFaith_03_01");	//(zaskoèen) Ne,... tedy, já bych nikdy nic takového neudìlal. Vážnì!
	AI_Output(other,self,"DIA_Babo_Kap3_KeepTheFaith_15_02");	//My všichni èasto stojíme pøed obtížnými zkouškami.
	AI_Output(self,other,"DIA_Babo_Kap3_KeepTheFaith_03_03");	//Ano, mistøe. Budu si to vždycky pamatovat. Dìkuji ti.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_BABO_KAP3_UNHAPPY(C_INFO)
{
	npc = nov_612_babo;
	nr = 31;
	condition = dia_babo_kap3_unhappy_condition;
	information = dia_babo_kap3_unhappy_info;
	permanent = FALSE;
	description = "To nezní zrovna dvakrát šastnì.";
};


func int dia_babo_kap3_unhappy_condition()
{
	if((KAPITEL >= 3) && (hero.guild != GIL_KDF) && Npc_KnowsInfo(other,dia_babo_kap3_hello))
	{
		return TRUE;
	};
};

func void dia_babo_kap3_unhappy_info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_15_00");	//To nezní zrovna dvakrát šastnì.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_03_01");	//(zaskoèen) No... tedy, všechno je v naprostém poøádku, vážnì.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_03_02");	//Jen... Ne, nechci si stìžovat.
	Info_ClearChoices(dia_babo_kap3_unhappy);
	Info_AddChoice(dia_babo_kap3_unhappy,"Tak pøestaò skuhrat.",dia_babo_kap3_unhappy_lament);
	Info_AddChoice(dia_babo_kap3_unhappy,"Ale no tak, mnì to øíct mùžeš.",dia_babo_kap3_unhappy_tellme);
};

func void dia_babo_kap3_unhappy_lament()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Lament_15_00");	//Tak pøestaò skuhrat.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Lament_03_01");	//(s obavami) Já... já... prosím, neøíkej to mágùm.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Lament_03_02");	//Nechci, aby mì znovu potrestali.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Lament_15_03");	//Budu o tom pøemýšlet.
	Info_ClearChoices(dia_babo_kap3_unhappy);
};

func void dia_babo_kap3_unhappy_tellme()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_TellMe_15_00");	//Ale no tak, mnì to øíct mùžeš.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_01");	//A vážnì to mágùm neøekneš?
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_TellMe_15_02");	//Vypadám snad na to?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_03");	//Dobrá. Mám problém s jedním z novicù. Vyhrožuje mi.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_TellMe_15_04");	//No tak už to koneènì vysyp.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_05");	//Igaraz, to je ten novic, našel moje soukromé zápisky.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_06");	//Prý když neudìlám to, co chce, tak je pøedá mágùm.
	MIS_BABOSDOCS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BABOSDOCS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BABOSDOCS,LOG_RUNNING);
	b_logentry(TOPIC_BABOSDOCS,"Igaraz vydírá novice Baba kvùli nìjakým dokumentùm.");
	Info_ClearChoices(dia_babo_kap3_unhappy);
	Info_AddChoice(dia_babo_kap3_unhappy,"Myslím, že to je na mì trošku moc osobní.",dia_babo_kap3_unhappy_privat);
	Info_AddChoice(dia_babo_kap3_unhappy,"Co jsi pro nìj mìl udìlat?",dia_babo_kap3_unhappy_shoulddo);
	Info_AddChoice(dia_babo_kap3_unhappy,"Co to je za dokumenty?",dia_babo_kap3_unhappy_documents);
	Info_AddChoice(dia_babo_kap3_unhappy,"Možná bych ti mohl pomoci.",dia_babo_kap3_unhappy_canhelpyou);
};

func void dia_babo_kap3_unhappy_privat()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Privat_15_00");	//Myslím, že to je na mì trošku moc osobní.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Privat_03_01");	//Rozumím, nechceš žádné potíže. Asi si s tím budu muset poradit sám.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Privat_15_02");	//Nìjak to urèitì zvládneš.
	Info_ClearChoices(dia_babo_kap3_unhappy);
};

func void dia_babo_kap3_unhappy_shoulddo()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_ShouldDo_15_00");	//Co jsi pro nìj mìl udìlat?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_ShouldDo_03_01");	//Nechce se mi o tom mluvit. Každopádnì by to asi Innose nepotìšilo.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_ShouldDo_03_02");	//Ani se mi nechce pøemýšlet nad tím, co by se stalo, kdyby to vyšlo na povrch.
};

func void dia_babo_kap3_unhappy_documents()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Documents_15_00");	//Co to je za dokumenty?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Documents_03_01");	//(nejistì) Do toho nikomu nic není. Je to jen moje vìc.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Documents_15_02");	//No tak, øekni mi to.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Documents_03_03");	//Jsou to, ehm... naprosto normální dokumenty. Nic zvláštního.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Documents_15_04");	//Dobrá, už se nebudu ptát.
};

func void dia_babo_kap3_unhappy_canhelpyou()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_00");	//Možná bych ti mohl pomoci.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_01");	//Udìlal bys to pro mì?
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_02");	//No, pøijde na to.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_03");	//(kvapnì) Samozøejmì, že bych ti za to zaplatil.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_04");	//Kolik?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_05");	//Pochopitelnì nemám moc penìz, ale mohl bych ti dát svitek s kouzlem. Je to léèivé kouzlo.
	Info_ClearChoices(dia_babo_kap3_unhappy);
	Info_AddChoice(dia_babo_kap3_unhappy,"Radši se do toho nebudu míchat.",dia_babo_kap3_unhappy_no);
	Info_AddChoice(dia_babo_kap3_unhappy,"Uvidím, co se dá dìlat.",dia_babo_kap3_unhappy_yes);
};

func void dia_babo_kap3_unhappy_no()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_No_15_00");	//Radši se do toho nebudu míchat.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_No_03_01");	//V tom pøípadì nemám na výbìr, pojedu v tom dál.
	Info_ClearChoices(dia_babo_kap3_unhappy);
};

func void dia_babo_kap3_unhappy_yes()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Yes_15_00");	//Uvidím, co se dá dìlat.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Yes_03_01");	//(šastnì) Vážnì, urèitì to pùjde. Musí!
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Yes_03_02");	//Takže je vlastnì zapotøebí jenom zjistit, kde ty vìci Igaraz má. Pak už mu je nìjak sebereš a všechno bude v poøádku.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Yes_15_03");	//Uklidni se. Klidnì pracuj dál. O zbytek se postarám sám.
	Info_ClearChoices(dia_babo_kap3_unhappy);
};


instance DIA_BABO_KAP3_HAVEYOURDOCS(C_INFO)
{
	npc = nov_612_babo;
	nr = 31;
	condition = dia_babo_kap3_haveyourdocs_condition;
	information = dia_babo_kap3_haveyourdocs_info;
	permanent = FALSE;
	description = "Mám ty tvoje dokumenty.";
};


func int dia_babo_kap3_haveyourdocs_condition()
{
	if(((MIS_BABOSDOCS == LOG_RUNNING) && (Npc_HasItems(other,itwr_babosdocs_mis) >= 1)) || ((Npc_HasItems(other,itwr_babospinup_mis) >= 1) && (Npc_HasItems(other,itwr_babosletter_mis) >= 1)))
	{
		return TRUE;
	};
};

func void dia_babo_kap3_haveyourdocs_info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_15_00");	//Mám ty tvoje dokumenty.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_03_01");	//Vážnì? Díky, zachránil jsi mì. Ani nevím, jak bych se ti odvdìèil.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_15_02");	//Jasnì, jasnì, už se uklidni.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_03_03");	//(nervóznì) Jsou vážnì moje? Jsi si jistý? Ukaž mi je.
	Info_ClearChoices(dia_babo_kap3_haveyourdocs);
	Info_AddChoice(dia_babo_kap3_haveyourdocs,"Ještì si je chvíli ponechám.",dia_babo_kap3_haveyourdocs_keepthem);
	if(BABOSDOCSOPEN == TRUE)
	{
		Info_AddChoice(dia_babo_kap3_haveyourdocs,"Odvozeno od holých faktù - cena vzrostla.",dia_babo_kap3_haveyourdocs_iwantmore);
	};
	Info_AddChoice(dia_babo_kap3_haveyourdocs,"Tady to máš.",dia_babo_kap3_haveyourdocs_heretheyare);
};

func void dia_babo_kap3_haveyourdocs_keepthem()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_15_00");	//Ještì si je chvíli ponechám.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_03_01");	//(ohromenì) Cože!? Co to má znamenat? Co chceš dìlat?
	Info_ClearChoices(dia_babo_kap3_haveyourdocs);
	Info_AddChoice(dia_babo_kap3_haveyourdocs,"Dìlám si srandu.",dia_babo_kap3_haveyourdocs_keepthem_justjoke);
	Info_AddChoice(dia_babo_kap3_haveyourdocs,"To je èistì moje vìc.",dia_babo_kap3_haveyourdocs_keepthem_myconcern);
	if(IGARAZ_ISPARTNER == LOG_SUCCESS)
	{
		Info_AddChoice(dia_babo_kap3_haveyourdocs,"Igaraz a já jsme partneøi.",dia_babo_kap3_haveyourdocs_keepthem_partner);
	};
};

func void dia_babo_kap3_haveyourdocs_keepthem_justjoke()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_00");	//Dìlám si srandu.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_03_01");	//(kousavì) Ha ha, smìju se, až se za bøicho popadám. Tak kde jsou?
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_02");	//Tady.
	if(Npc_HasItems(other,itwr_babosdocs_mis) >= 1)
	{
		b_giveinvitems(other,self,itwr_babosdocs_mis,1);
	}
	else
	{
		b_giveinvitems(other,self,itwr_babospinup_mis,1);
		b_giveinvitems(other,self,itwr_babosletter_mis,1);
	};
	b_usefakescroll();
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_03_03");	//Nechtìl jsem tì urazit, ale jsem z toho všeho prostì strašnì nervózní.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_04");	//To je v poøádku. Tak si užij ty svoje DOKUMENTY.
	MIS_BABOSDOCS = LOG_SUCCESS;
	b_giveplayerxp(XP_BABOSDOCS);
	Info_ClearChoices(dia_babo_kap3_haveyourdocs);
};

func void dia_babo_kap3_haveyourdocs_keepthem_myconcern()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_15_00");	//To je èistì moje vìc.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_03_01");	//Ty dokumenty jsou moje. Nemáš právo si je nechávat.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_15_02");	//Nashle.
	Info_ClearChoices(dia_babo_kap3_haveyourdocs);
};

func void dia_babo_kap3_haveyourdocs_keepthem_partner()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_00");	//Igaraz a já jsme teï partneøi.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_03_01");	//(nevìøícnì) Cože? To pøece nemùžeš.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_02");	//Vypadá to, že mùžu. Nechám si ty papíry a všechno zùstane jako dosud.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_03");	//Urovnám tu finanèní záležitost s Igarazem.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_04");	//No, tak se hezky starej o rostlinky.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_03_05");	//Jsi svinì. Ubohá, hrabivá svinì. Innos tì potrestá.
	Info_ClearChoices(dia_babo_kap3_haveyourdocs);
	Info_AddChoice(dia_babo_kap3_haveyourdocs,DIALOG_ENDE,dia_babo_kap3_haveyourdocs_end);
	Info_AddChoice(dia_babo_kap3_haveyourdocs,"Pozor na jazyk.",dia_babo_kap3_haveyourdocs_keepthem_partner_keepcalm);
	Info_AddChoice(dia_babo_kap3_haveyourdocs,"Nemáš co na práci?",dia_babo_kap3_haveyourdocs_keepthem_partner_nothingtodo);
};

func void dia_babo_kap3_haveyourdocs_end()
{
	AI_StopProcessInfos(self);
};

func void dia_babo_kap3_haveyourdocs_keepthem_partner_keepcalm()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm_15_00");	//Pozor na jazyk.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm_03_01");	//Jsem moc mìkký, jako obvykle.
	AI_StopProcessInfos(self);
};

func void dia_babo_kap3_haveyourdocs_keepthem_partner_nothingtodo()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_NothingToDo_15_00");	//Nemáš co na práci?
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_NothingToDo_03_01");	//Já ti rozumím, ale mùžeš mi vìøit - to ještì bude mít dohru.
	AI_StopProcessInfos(self);
};

func void dia_babo_kap3_haveyourdocs_iwantmore()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_15_00");	//Odvozeno od holých faktù - cena vzrostla.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_03_01");	//Nejsi o nic lepší než ostatní. Co chceš?
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_15_02");	//Co máš?
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_03_03");	//Mùžu ti dát 121 zlatých, to je všechno, co mám.
	Info_ClearChoices(dia_babo_kap3_haveyourdocs);
	Info_AddChoice(dia_babo_kap3_haveyourdocs,"To nebude staèit.",dia_babo_kap3_haveyourdocs_iwantmore_notenough);
	Info_AddChoice(dia_babo_kap3_haveyourdocs,"Plácneme si.",dia_babo_kap3_haveyourdocs_iwantmore_thatsenough);
};

func void dia_babo_kap3_haveyourdocs_iwantmore_notenough()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough_15_00");	//To nebude staèit.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough_03_01");	//Ale já víc penìz opravdu nemám. Kdybych nìco takového tušil døív, nikdy bych do kláštera nevstoupil.
	Info_ClearChoices(dia_babo_kap3_haveyourdocs);
};

func void dia_babo_kap3_haveyourdocs_iwantmore_thatsenough()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough_15_00");	//Plácneme si.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough_03_01");	//Tady máš peníze a ten svitek.
	CreateInvItems(self,itsc_mediumheal,1);
	CreateInvItems(self,itmi_gold,121);
	b_giveinvitems(self,other,itsc_mediumheal,1);
	b_giveinvitems(self,other,itmi_gold,121);
	MIS_BABOSDOCS = LOG_SUCCESS;
	b_giveplayerxp(XP_BABOSDOCS);
	Info_ClearChoices(dia_babo_kap3_haveyourdocs);
};

func void dia_babo_kap3_haveyourdocs_heretheyare()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_15_00");	//Tady to máš.
	if(Npc_HasItems(other,itwr_babosdocs_mis) >= 1)
	{
		b_giveinvitems(other,self,itwr_babosdocs_mis,1);
	}
	else
	{
		b_giveinvitems(other,self,itwr_babospinup_mis,1);
		b_giveinvitems(other,self,itwr_babosletter_mis,1);
	};
	b_usefakescroll();
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_01");	//Jo, jsou všechny.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_02");	//Koukal ses do nich?
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_15_03");	//Záleží na tom?
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_04");	//Teï, když je mám zpátky, tak vlastnì ne.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_05");	//Doufám, že si teï mùžu koneènì vydechnout.
	CreateInvItems(self,itsc_mediumheal,1);
	b_giveinvitems(self,other,itsc_mediumheal,1);
	MIS_BABOSDOCS = LOG_SUCCESS;
	b_giveplayerxp(XP_BABOSDOCS);
	Info_ClearChoices(dia_babo_kap3_haveyourdocs);
};


instance DIA_BABO_KAP3_PERM(C_INFO)
{
	npc = nov_612_babo;
	nr = 39;
	condition = dia_babo_kap3_perm_condition;
	information = dia_babo_kap3_perm_info;
	permanent = TRUE;
	description = "Jsi spokojený s tím, co dìláš?";
};


func int dia_babo_kap3_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_babo_kap3_hello))
	{
		return TRUE;
	};
};

func void dia_babo_kap3_perm_info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Perm_15_00");	//Jsi spokojený s tím, co dìláš?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_01");	//(nepøíliš pøesvìdèivì) Ano, samozøejmì. Moje víra v Innosovu moudrost a moc mi dává sílu.
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_02");	//(úhybnì) Nechci být nezdvoøilý, ale mám toho dnes hodnì na práci.
		AI_Output(other,self,"DIA_Babo_Kap3_Perm_15_03");	//Jen pokraèuj.
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_04");	//(s úlevou) Díky.
	}
	else
	{
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_05");	//Jo, jde to, ale musím se vrátit do práce, jinak to dneska nikdy nedodìlám.
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_06");	//Nechci zase makat pùlku noci, jen abych splnil, co mi bylo zadáno, a nedostal se tak do potíží.
	};
	AI_StopProcessInfos(self);
};


instance DIA_BABO_KAP4_EXIT(C_INFO)
{
	npc = nov_612_babo;
	nr = 999;
	condition = dia_babo_kap4_exit_condition;
	information = dia_babo_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_babo_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_babo_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BABO_KAP5_EXIT(C_INFO)
{
	npc = nov_612_babo;
	nr = 999;
	condition = dia_babo_kap5_exit_condition;
	information = dia_babo_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_babo_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_babo_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BABO_PICKPOCKET(C_INFO)
{
	npc = nov_612_babo;
	nr = 900;
	condition = dia_babo_pickpocket_condition;
	information = dia_babo_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_babo_pickpocket_condition()
{
	return c_beklauen(17,25);
};

func void dia_babo_pickpocket_info()
{
	Info_ClearChoices(dia_babo_pickpocket);
	Info_AddChoice(dia_babo_pickpocket,DIALOG_BACK,dia_babo_pickpocket_back);
	Info_AddChoice(dia_babo_pickpocket,DIALOG_PICKPOCKET,dia_babo_pickpocket_doit);
};

func void dia_babo_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_babo_pickpocket);
};

func void dia_babo_pickpocket_back()
{
	Info_ClearChoices(dia_babo_pickpocket);
};

