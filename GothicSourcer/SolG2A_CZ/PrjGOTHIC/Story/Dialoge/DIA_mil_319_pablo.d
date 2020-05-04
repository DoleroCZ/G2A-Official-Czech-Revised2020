
instance DIA_PABLO_EXIT(C_INFO)
{
	npc = mil_319_pablo;
	nr = 999;
	condition = dia_pablo_exit_condition;
	information = dia_pablo_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pablo_exit_condition()
{
	return TRUE;
};

func void dia_pablo_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PABLO_PICKPOCKET(C_INFO)
{
	npc = mil_319_pablo;
	nr = 900;
	condition = dia_pablo_pickpocket_condition;
	information = dia_pablo_pickpocket_info;
	permanent = TRUE;
	description = "(Tento klíè by ukradlo i malé dítì.)";
};


func int dia_pablo_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_city_tower_01) >= 1) && (other.attribute[ATR_DEXTERITY] >= (20 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_pablo_pickpocket_info()
{
	Info_ClearChoices(dia_pablo_pickpocket);
	Info_AddChoice(dia_pablo_pickpocket,DIALOG_BACK,dia_pablo_pickpocket_back);
	Info_AddChoice(dia_pablo_pickpocket,DIALOG_PICKPOCKET,dia_pablo_pickpocket_doit);
};

func void dia_pablo_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 20)
	{
		b_giveinvitems(self,other,itke_city_tower_01,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_pablo_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_pablo_pickpocket_back()
{
	Info_ClearChoices(dia_pablo_pickpocket);
};


var int pablo_belogen;

instance DIA_PABLO_WANTED(C_INFO)
{
	npc = mil_319_pablo;
	nr = 1;
	condition = dia_pablo_wanted_condition;
	information = dia_pablo_wanted_info;
	important = TRUE;
};


func int dia_pablo_wanted_condition()
{
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_pablo_wanted_info()
{
	AI_Output(self,other,"DIA_Pablo_WANTED_12_00");	//Hej, poèkej - jsi mi nìjaký povìdomý.
	AI_Output(other,self,"DIA_Pablo_WANTED_15_01");	//Co chceš?
	AI_Output(self,other,"DIA_Pablo_WANTED_12_02");	//Tvùj oblièej jsem už nìkde vidìl... ano - už vím!
	b_usefakescroll();
	AI_Output(self,other,"DIA_Pablo_WANTED_12_03");	//Tady - tenhle obrázek u sebe mìla skupina banditù, kterou jsme sbalili pøed pár dny. Vypadá vážnì jako ty.
	b_giveinvitems(self,other,itwr_poster_mis,1);
	AI_Output(self,other,"DIA_Pablo_WANTED_12_04");	//Zdá se, že tì ti chlapíci hledali.
	Info_ClearChoices(dia_pablo_wanted);
	Info_AddChoice(dia_pablo_wanted,"Ne, musel ses splést.",dia_pablo_wanted_nothing);
	Info_AddChoice(dia_pablo_wanted,"Božínku, nìco takového by mì samotného nikdy nenapadlo.",dia_pablo_wanted_irony);
};

func void dia_pablo_wanted_nothing()
{
	AI_Output(other,self,"DIA_Pablo_WANTED_NOTHING_15_00");	//Ne, to se urèitì pletete. To musel být nìkdo jiný.
	AI_Output(self,other,"DIA_Pablo_WANTED_NOTHING_12_01");	//Jak myslíš, cizinèe.
	AI_Output(self,other,"DIA_Pablo_Add_12_00");	//Ale jestli se nakonec ukáže, žes na tom obrázku pøece jenom byl TY - a pokud budeš mít nìjaké potíže - snaž se je netahat s sebou do mìsta. Už takhle to tady není žádný med.
	AI_Output(self,other,"DIA_Pablo_WANTED_NOTHING_12_03");	//A cizinci, kteøí s sebou pøinášejí potíže, tady moc dlouho vìtšinou nezùstanou - doufám, že jsem se vyjádøil jasnì.
	PABLO_BELOGEN = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_pablo_wanted_irony()
{
	AI_Output(other,self,"DIA_Pablo_WANTED_IRONY_15_00");	//Božínku, nìco takového by mì samotného nikdy nenapadlo.
	AI_Output(self,other,"DIA_Pablo_WANTED_IRONY_12_01");	//Vážnì legrace... co od tebe ti chlapíci chtìli?
	AI_Output(other,self,"DIA_Pablo_Add_15_01");	//Zeptejte se jich sami. Máte je pøece v bezpeèí pod zámkem, ne?
	AI_Output(self,other,"DIA_Pablo_WANTED_IRONY_12_03");	//Ne - jsou mrtví.
	AI_Output(other,self,"DIA_Pablo_WANTED_IRONY_15_04");	//Tak mám dojem, že se to už nikdy nedozvíme.
	AI_Output(self,other,"DIA_Pablo_Add_12_02");	//V pøípadì, že bys mìl nìjaké problémy, promluv si s lordem Andrem. Možná by byl schopný ti pomoci. Najdeš ho v kasárnách.
	AI_StopProcessInfos(self);
};


instance DIA_PABLO_BANDITEN(C_INFO)
{
	npc = mil_319_pablo;
	nr = 3;
	condition = dia_pablo_banditen_condition;
	information = dia_pablo_banditen_info;
	permanent = FALSE;
	description = "Co víš o banditech?";
};


func int dia_pablo_banditen_condition()
{
	return TRUE;
};

func void dia_pablo_banditen_info()
{
	AI_Output(other,self,"DIA_Pablo_Add_15_03");	//Co víš o banditech?
	AI_Output(self,other,"DIA_Pablo_Add_12_04");	//Všichni pocházejí z té zatracené tìžaøské kolonie. Je mezi nimi ale nìkolik skupinek odpadlíkù.
	AI_Output(self,other,"DIA_Pablo_Add_12_05");	//Nìkteøí se zašili v horách a další se spojili s Onarem, velkostatkáøem.
	AI_Output(self,other,"DIA_Pablo_Add_12_06");	//Nejvíc potíží ale zpùsobují bandité, kteøí se zdržují mimo mìsto.
	AI_Output(self,other,"DIA_Pablo_Add_12_07");	//To kvùli nim se teï žádný obchodník neodváží vyrazit za mìstské brány.
};


instance DIA_PABLO_HAKONBANDITS(C_INFO)
{
	npc = mil_319_pablo;
	nr = 3;
	condition = dia_pablo_hakonbandits_condition;
	information = dia_pablo_hakonbandits_info;
	permanent = FALSE;
	description = "Nevíš nìco o banditech, kteøí okradli obchodníka Hakona?";
};


func int dia_pablo_hakonbandits_condition()
{
	if(Npc_KnowsInfo(other,dia_hakon_miliz) && Npc_KnowsInfo(other,dia_pablo_banditen))
	{
		return TRUE;
	};
};

func void dia_pablo_hakonbandits_info()
{
	AI_Output(other,self,"DIA_Pablo_Add_15_20");	//Nevíš nìco o banditech, kteøí okradli obchodníka Hakona?
	AI_Output(self,other,"DIA_Pablo_Add_12_21");	//Jo TOHLE. Ani mi to nepøipomínej.
	AI_Output(self,other,"DIA_Pablo_Add_12_22");	//Co víme, tak mají na svìdomí už pìknou øádku útokù na rùzné kupce.
	AI_Output(self,other,"DIA_Pablo_Banditen_12_01");	//Ty krysy zalezly do svých dìr a neodvažují se ani vystrèit nos.
	AI_Output(self,other,"DIA_Pablo_Banditen_12_02");	//Kdysi se nám je podaøilo vystopovat a sledovat. V lese za mìstem jsme ale museli s pronásledováním pøestat.
	AI_Output(self,other,"DIA_Pablo_Banditen_12_03");	//Kolem se potuluje spousta šelem, je to moc nebezpeèné.
	b_logentry(TOPIC_HAKONBANDITEN,"Bandité, kteøí okradli Hakona, se skrývají kdesi v lesích poblíž mìsta.");
	if(PABLO_ANDREMELDEN == FALSE)
	{
		AI_Output(self,other,"DIA_Pablo_Add_12_23");	//Ale je tady ještì jedna vìc...
		AI_Output(self,other,"DIA_Pablo_Banditen_12_04");	//V Khorinisu se objevila èást uloupeného zboží.
		AI_Output(other,self,"DIA_Pablo_Banditen_15_05");	//To znamená, že vìdí, jak lup propašovat do mìsta a pak ho tady prodat...
		AI_Output(self,other,"DIA_Pablo_Banditen_12_06");	//Jo, máme podezøení, že mají tady nìkde ve mìstì pøekupníka. Zatím se nám ale toho chlápka nepodaøilo chytit.
		AI_Output(self,other,"DIA_Pablo_Banditen_12_07");	//Pokud by se ti podaøilo na nìco pøijít, tak mìj na pamìti, že lord Andre vypsal na toho pašeráka odmìnu.
		b_logentry(TOPIC_HAKONBANDITEN,"Bandité mají ve mìstì nejspíš nìjakou spojku. Lord Andre nechal na tohoto jejich spojence vypsat odmìnu.");
	};
};


instance DIA_PABLO_MYBANDITS(C_INFO)
{
	npc = mil_319_pablo;
	nr = 4;
	condition = dia_pablo_mybandits_condition;
	information = dia_pablo_mybandits_info;
	permanent = FALSE;
	description = "Odkud byli ti bandité, kteøí mìli ten mùj obrázek?";
};


func int dia_pablo_mybandits_condition()
{
	if(Npc_KnowsInfo(other,dia_pablo_banditen) && Npc_KnowsInfo(other,dia_pablo_wanted))
	{
		return TRUE;
	};
};

func void dia_pablo_mybandits_info()
{
	AI_Output(other,self,"DIA_Pablo_Add_15_08");	//Odkud byli ti bandité, kteøí mìli ten mùj obrázek?
	if(PABLO_BELOGEN == TRUE)
	{
		AI_Output(self,other,"DIA_Pablo_Add_12_09");	//AHÁ! Takže to nakonec BYL tvùj oblièej. Proè jsi to nepøiznal hned, co?
		AI_Output(self,other,"DIA_Pablo_Add_12_10");	//(naléhavì) Proè po tobì jdou?
		AI_Output(other,self,"DIA_Pablo_Add_15_11");	//Já nevím - vážnì!
		AI_Output(self,other,"DIA_Pablo_Add_12_12");	//Jasnì, jasnì. Chápu. Nìco ti øeknu. Kdybych si myslel, že jsi s tìmi bandity jedna ruka, už bys pìknì bruèel v chládku. Kapišto?
		AI_Output(self,other,"DIA_Pablo_Add_12_13");	//I tak bych to ale asi mìl nahlásit lordu Andremu...
		PABLO_ANDREMELDEN = TRUE;
		AI_Output(self,other,"DIA_Pablo_Add_12_14");	//Ale co se týèe té tvé otázky...
	};
	AI_Output(self,other,"DIA_Pablo_Add_12_15");	//Sebrali jsme je poblíž statkáøova sídla.
	AI_Output(self,other,"DIA_Pablo_Add_12_16");	//Rozhodnì ale nevypadají jako Onarovi lidé.
	AI_Output(self,other,"DIA_Pablo_Add_12_17");	//Øekl bych, že to byla èást menší skupinky, která se ukrývá v horách poblíž Onarovy farmy.
	AI_Output(self,other,"DIA_Pablo_Add_12_18");	//Jestli bys ale mìl v plánu se tam vydat, musím tì varovat. Tihle hrdloøezové provedou s každým krátký proces!
	AI_Output(other,self,"DIA_Pablo_Add_15_19");	//Budu to mít na pamìti.
};


instance DIA_PABLO_PERM(C_INFO)
{
	npc = mil_319_pablo;
	nr = 1;
	condition = dia_pablo_perm_condition;
	information = dia_pablo_perm_info;
	permanent = TRUE;
	description = "Jak to vypadá?";
};


func int dia_pablo_perm_condition()
{
	return TRUE;
};

func void dia_pablo_perm_info()
{
	AI_Output(other,self,"DIA_Pablo_Perm_15_00");	//Jak to vypadá?
	if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET != LOG_SUCCESS)
		{
			if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
			{
				AI_Output(self,other,"DIA_Pablo_Perm_12_01");	//Vždycky jsem øíkal, že se tìm žoldákùm nedá vìøit.
				AI_Output(self,other,"DIA_Pablo_Perm_12_02");	//Je na èase, abychom tìm neøádùm uštìdøili lekci. Tohle nevymyslel Bennet sám o sobì.
			}
			else if(hero.guild == GIL_KDF)
			{
				AI_Output(self,other,"DIA_Pablo_Perm_12_03");	//Jsem hluboce otøesen vraždou ctihodného paladina Lothara.
				AI_Output(self,other,"DIA_Pablo_Perm_12_04");	//Ale vìøím, že církev viníky spravedlivì potrestá.
			}
			else
			{
				AI_Output(self,other,"DIA_Pablo_Perm_12_05");	//Co že se tady potuluješ po okolí? Jestli máš v plánu osvobodit svého žoldáckého pøítelíèka, tak na to rovnou zapomeò.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Pablo_Perm_12_06");	//To je k pláèi. Teï se nás snaží poštvat proti sobì navzájem.
			AI_Output(self,other,"DIA_Pablo_Perm_12_07");	//Jestli jste nedokázali najít pravého vraha, skøeti nebudou muset ani hnout prstem.
		};
	}
	else if(KAPITEL == 5)
	{
		AI_Output(self,other,"DIA_Pablo_Perm_12_08");	//Dìlá mi starosti, co se stane, když teï paladinové odejdou.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Pablo_Perm_12_09");	//Na nás se mùžeš spolehnout. Použijeme všechny dostupné prostøedky, aby tohle mìsto nezabøedlo do bahna bezpráví.
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Pablo_Perm_12_10");	//Mìj se na pozoru. Darebáky jako ty nespouštíme jen tak z oèí.
	}
	else
	{
		AI_Output(self,other,"DIA_Pablo_Perm_12_11");	//Teï je docela klid. Problémy nám dìlají jen bandité za okrajem mìsta.
	};
};

