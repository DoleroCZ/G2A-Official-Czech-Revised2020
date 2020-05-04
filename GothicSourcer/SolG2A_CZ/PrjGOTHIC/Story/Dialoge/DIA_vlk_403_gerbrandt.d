
var int diego_coming;

instance DIA_GERBRANDT_EXIT(C_INFO)
{
	npc = vlk_403_gerbrandt;
	nr = 999;
	condition = dia_gerbrandt_exit_condition;
	information = dia_gerbrandt_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gerbrandt_exit_condition()
{
	return TRUE;
};

func void dia_gerbrandt_exit_info()
{
	if(DIEGO_COMING == TRUE)
	{
		DIEGONW = Hlp_GetNpc(pc_thief_nw);
		if(DIEGO_ISONBOARD == FALSE)
		{
			b_startotherroutine(diegonw,"GERBRANDT");
		};
		Npc_ExchangeRoutine(self,"NEWLIFE");
		b_startotherroutine(gerbrandtsfrau,"NEWLIFE");
		DIEGO_COMING = 2;
	};
	AI_StopProcessInfos(self);
};


instance DIA_GERBRANDT_PICKPOCKET(C_INFO)
{
	npc = vlk_403_gerbrandt;
	nr = 900;
	condition = dia_gerbrandt_pickpocket_condition;
	information = dia_gerbrandt_pickpocket_info;
	permanent = TRUE;
	description = "(Jeho portmonku lze snadno ukrást.)";
};


func int dia_gerbrandt_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itse_goldpocket100) >= 1) && (other.attribute[ATR_DEXTERITY] >= (30 - THEFTDIFF)) && (DIEGO_COMING != TRUE))
	{
		return TRUE;
	};
};

func void dia_gerbrandt_pickpocket_info()
{
	Info_ClearChoices(dia_gerbrandt_pickpocket);
	Info_AddChoice(dia_gerbrandt_pickpocket,DIALOG_BACK,dia_gerbrandt_pickpocket_back);
	Info_AddChoice(dia_gerbrandt_pickpocket,DIALOG_PICKPOCKET,dia_gerbrandt_pickpocket_doit);
};

func void dia_gerbrandt_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		b_giveinvitems(self,other,itse_goldpocket100,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_gerbrandt_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_gerbrandt_pickpocket_back()
{
	Info_ClearChoices(dia_gerbrandt_pickpocket);
};


instance DIA_GERBRANDT_HELLO(C_INFO)
{
	npc = vlk_403_gerbrandt;
	nr = 5;
	condition = dia_gerbrandt_hello_condition;
	information = dia_gerbrandt_hello_info;
	permanent = FALSE;
	description = "Co tady dìláš?";
};


func int dia_gerbrandt_hello_condition()
{
	if((hero.guild != GIL_KDF) && (hero.guild != GIL_PAL) && (DIEGO_COMING == FALSE))
	{
		return TRUE;
	};
};

func void dia_gerbrandt_hello_info()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_15_00");	//Co tady dìláš?
	AI_Output(self,other,"DIA_Gerbrandt_Hello_10_01");	//Tak kdo jsi? Vypadá to, že jsi to novej a nemáš ani tucha, jak to tady chodí.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_10_02");	//Øíkají mi Gerbrandt. Pro tebe to znamená: pane Gerbrandte, sire. Jasný?
	Info_ClearChoices(dia_gerbrandt_hello);
	Info_AddChoice(dia_gerbrandt_hello,"Jo jasný, Gerbrandte.",dia_gerbrandt_hello_no);
	Info_AddChoice(dia_gerbrandt_hello,"Rozumím, pane Gerbrandte, sire.",dia_gerbrandt_hello_yes);
};

func void dia_gerbrandt_hello_no()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_No_15_00");	//Jo jasný, Gerbrandte.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_No_10_01");	//Bacha na tu svou nevymáchanou hubu. Mìl bys mi radši prokazovat víc úcty, nebo si tady zadìláš na poøádný trable.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_No_10_02");	//Tady rozkazuju já. Kdokoli tu zpùsobí nìjaké potíže, bude se zodpovídat mnì a udìlá nejlíp, když kvaltem opustí mìsto. Protože jestli se mi dostane do rukou, tak bude velmi litovat toho, že se se mnou kdy setkal.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_No_10_03");	//Vìtšina lidí z okolí pøístavu pracuje pro mì. Jestli hledáš práci, mìl by sis dávat velký pozor na to, abys mi utkvìl v pamìti jako hodnej hoch.
	Info_ClearChoices(dia_gerbrandt_hello);
};

func void dia_gerbrandt_hello_yes()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_Yes_15_00");	//Rozumím, pane Gerbrandte, sire.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_10_01");	//Nakonec ti netrvalo moc dlouho, než ti došlo, která bije.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_10_02");	//Jakmile se zaènou hejbat obchody, budu potøebovat urostlýho chlapa, jako jsi ty.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_10_03");	//Máte tu pìkný doky.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_10_04");	//Umíš èíst?
	Info_ClearChoices(dia_gerbrandt_hello);
	Info_AddChoice(dia_gerbrandt_hello,"Ne.",dia_gerbrandt_hello_yes_no);
	Info_AddChoice(dia_gerbrandt_hello,"Nehledám práci.",dia_gerbrandt_hello_nojob);
	Info_AddChoice(dia_gerbrandt_hello,"Samozøejmì.",dia_gerbrandt_hello_yes_yes);
};

func void dia_gerbrandt_hello_yes_no()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_Yes_No_15_00");	//Ne.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_No_10_01");	//Nevadí. Alespoò mùžeš odnést pár pytlù.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_No_10_02");	//Jsem s tebou spokojený, mùžu ti nabídnout stálou práci. Je toho tady dost na práci.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_No_10_03");	//Dobrá, dám ti vìdìt, až se první loï vrátí do dokù.
	Info_ClearChoices(dia_gerbrandt_hello);
};

func void dia_gerbrandt_hello_nojob()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_NoJob_15_00");	//Nehledám práci.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_NoJob_10_01");	//Asi si myslíš, jak jsi strašnì chytrej. Koukej, nikdo tu nemùže dostat práci, dokud s tím já nebudu souhlasit.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_NoJob_10_02");	//Takže jestli budeš takhle pyskovat, mùžeš si zaèít hledat tou nejhnusnìjší havìtí prolezlej slamník na spaní, protože to bude všechno, co si budeš moct dovolit.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_NoJob_10_03");	//Ještì za mnou pøilezeš a budeš žadonit o práci.
	Info_ClearChoices(dia_gerbrandt_hello);
};

func void dia_gerbrandt_hello_yes_yes()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_Yes_Yes_15_00");	//Samozøejmì.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_01");	//Fajn, fajn, dostat se kvalifikovanýmu personálu není nic lehkýho.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_02");	//Co tvá doporuèení?
	AI_Output(other,self,"DIA_Gerbrandt_Hello_Yes_Yes_15_03");	//Doporuèení?
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_04");	//Dobrá, budu si tì pamatovat. Jakmile se zase zaènou hejbat obchody, pøijï se mi ukázat. Pak pro tebe budu možná mít nìjakou práci.
	Info_ClearChoices(dia_gerbrandt_hello);
};

func void b_gerbrandt_pissoff()
{
	AI_Output(self,other,"B_Gerbrandt_PissOff_10_00");	//Co jako má být tohle - dìláš si ze mì srandu?
	AI_Output(self,other,"B_Gerbrandt_PissOff_10_01");	//Ty a ten tvùj kámoš Diego už jste nadìlali dost škody.
	AI_Output(self,other,"B_Gerbrandt_PissOff_10_02");	//Nech mì být!
	if(DIEGO_COMING != TRUE)
	{
		AI_StopProcessInfos(self);
	};
};


instance DIA_GERBRANDT_PERM(C_INFO)
{
	npc = vlk_403_gerbrandt;
	nr = 800;
	condition = dia_gerbrandt_perm_condition;
	information = dia_gerbrandt_perm_info;
	permanent = TRUE;
	description = "Nìco nového?";
};


func int dia_gerbrandt_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_gerbrandt_hello))
	{
		return TRUE;
	};
};

func void dia_gerbrandt_perm_info()
{
	AI_Output(other,self,"DIA_Gerbrandt_Perm_15_00");	//Nìco nového?
	if(KAPITEL <= 2)
	{
		if((hero.guild != GIL_KDF) && (hero.guild != GIL_PAL))
		{
			AI_Output(self,other,"DIA_Gerbrandt_Perm_10_01");	//Lidi jako ty nemají tady nahoøe co dìlat. Tady bydlí vážení obèané, ne nìjací tuláci nebo podvodníci.
			AI_Output(self,other,"DIA_Gerbrandt_Perm_10_02");	//Jestli se ti nìkdy podaøí zbohatnout a dojít úcty, pak tady možná budeš vítanìjší.
		}
		else
		{
			AI_Output(self,other,"DIA_Gerbrandt_Perm_10_03");	//Nemùžu si stìžovat, vážený pane.
		};
	}
	else if(KAPITEL >= 3)
	{
		if(MIS_DIEGOSRESIDENCE != LOG_SUCCESS)
		{
			if((hero.guild != GIL_KDF) && (hero.guild != GIL_PAL))
			{
				AI_Output(self,other,"DIA_Gerbrandt_Perm_10_04");	//Už jsem vidìl tobì podobné - prostì nevíte, kam patøíte.
				AI_Output(self,other,"DIA_Gerbrandt_Perm_10_05");	//Musím si promluvit s místodržícím ohlednì odpovídajícího zabezpeèení horní ètvrti.
			}
			else
			{
				AI_Output(self,other,"DIA_Gerbrandt_Perm_10_06");	//Tohle je jenom moje záležitost. Nemám èas!
			};
		}
		else
		{
			b_gerbrandt_pissoff();
		};
	};
};


instance DIA_GERBRANDT_GREETINGSFROMDIEGO(C_INFO)
{
	npc = vlk_403_gerbrandt;
	nr = 10;
	condition = dia_gerbrandt_greetingsfromdiego_condition;
	information = dia_gerbrandt_greetingsfromdiego_info;
	permanent = FALSE;
	description = "Diego se nechá pozdravovat.";
};


func int dia_gerbrandt_greetingsfromdiego_condition()
{
	if((MIS_DIEGOSRESIDENCE == LOG_RUNNING) && (Npc_HasItems(other,itwr_diegosletter_mis) >= 1))
	{
		return TRUE;
	};
};

func void dia_gerbrandt_greetingsfromdiego_info()
{
	AI_Output(other,self,"DIA_Gerbrandt_GreetingsFromDiego_15_00");	//Diego se nechá pozdravovat.
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_01");	//(vydìšenì) Co? Kdo? Jaký Diego?
	AI_Output(other,self,"DIA_Gerbrandt_GreetingsFromDiego_15_02");	//A taky mì požádal, abych ti dal tenhle dopis.
	b_giveinvitems(other,self,itwr_diegosletter_mis,1);
	b_usefakescroll();
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_03");	//(znepokojenì) To nemùže být pravda. Ne. Jsem mrtvý muž!
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_04");	//(ustrašenì) Je teda ve mìstì?
	AI_Output(other,self,"DIA_Gerbrandt_GreetingsFromDiego_15_05");	//Kdo?
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_06");	//Diego, pøece!
	AI_Output(other,self,"DIA_Gerbrandt_GreetingsFromDiego_15_07");	//Ano, zanedlouho se s ním setkám.
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_08");	//(zoufale, pro sebe) Tak to je konec. Všechno je v tahu.
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_09");	//Nemám èas, musím odtud vypadnout. Jestli mì tu najde, jsem vyøízenej.
	MIS_DIEGOSRESIDENCE = LOG_SUCCESS;
	b_giveplayerxp(XP_DIEGOSRESIDENCE);
	DIEGO_COMING = TRUE;
};

