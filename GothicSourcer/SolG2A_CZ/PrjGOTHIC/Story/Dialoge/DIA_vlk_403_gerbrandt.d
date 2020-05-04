
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
	description = "(Jeho portmonku lze snadno ukr�st.)";
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
	description = "Co tady d�l�?";
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
	AI_Output(other,self,"DIA_Gerbrandt_Hello_15_00");	//Co tady d�l�?
	AI_Output(self,other,"DIA_Gerbrandt_Hello_10_01");	//Tak kdo jsi? Vypad� to, �e jsi to novej a nem� ani tucha, jak to tady chod�.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_10_02");	//��kaj� mi Gerbrandt. Pro tebe to znamen�: pane Gerbrandte, sire. Jasn�?
	Info_ClearChoices(dia_gerbrandt_hello);
	Info_AddChoice(dia_gerbrandt_hello,"Jo jasn�, Gerbrandte.",dia_gerbrandt_hello_no);
	Info_AddChoice(dia_gerbrandt_hello,"Rozum�m, pane Gerbrandte, sire.",dia_gerbrandt_hello_yes);
};

func void dia_gerbrandt_hello_no()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_No_15_00");	//Jo jasn�, Gerbrandte.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_No_10_01");	//Bacha na tu svou nevym�chanou hubu. M�l bys mi rad�i prokazovat v�c �cty, nebo si tady zad�l� na po��dn� trable.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_No_10_02");	//Tady rozkazuju j�. Kdokoli tu zp�sob� n�jak� pot�e, bude se zodpov�dat mn� a ud�l� nejl�p, kdy� kvaltem opust� m�sto. Proto�e jestli se mi dostane do rukou, tak bude velmi litovat toho, �e se se mnou kdy setkal.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_No_10_03");	//V�t�ina lid� z okol� p��stavu pracuje pro m�. Jestli hled� pr�ci, m�l by sis d�vat velk� pozor na to, abys mi utkv�l v pam�ti jako hodnej hoch.
	Info_ClearChoices(dia_gerbrandt_hello);
};

func void dia_gerbrandt_hello_yes()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_Yes_15_00");	//Rozum�m, pane Gerbrandte, sire.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_10_01");	//Nakonec ti netrvalo moc dlouho, ne� ti do�lo, kter� bije.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_10_02");	//Jakmile se za�nou hejbat obchody, budu pot�ebovat urostl�ho chlapa, jako jsi ty.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_10_03");	//M�te tu p�kn� doky.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_10_04");	//Um� ��st?
	Info_ClearChoices(dia_gerbrandt_hello);
	Info_AddChoice(dia_gerbrandt_hello,"Ne.",dia_gerbrandt_hello_yes_no);
	Info_AddChoice(dia_gerbrandt_hello,"Nehled�m pr�ci.",dia_gerbrandt_hello_nojob);
	Info_AddChoice(dia_gerbrandt_hello,"Samoz�ejm�.",dia_gerbrandt_hello_yes_yes);
};

func void dia_gerbrandt_hello_yes_no()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_Yes_No_15_00");	//Ne.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_No_10_01");	//Nevad�. Alespo� m��e� odn�st p�r pytl�.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_No_10_02");	//Jsem s tebou spokojen�, m��u ti nab�dnout st�lou pr�ci. Je toho tady dost na pr�ci.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_No_10_03");	//Dobr�, d�m ti v�d�t, a� se prvn� lo� vr�t� do dok�.
	Info_ClearChoices(dia_gerbrandt_hello);
};

func void dia_gerbrandt_hello_nojob()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_NoJob_15_00");	//Nehled�m pr�ci.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_NoJob_10_01");	//Asi si mysl�, jak jsi stra�n� chytrej. Koukej, nikdo tu nem��e dostat pr�ci, dokud s t�m j� nebudu souhlasit.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_NoJob_10_02");	//Tak�e jestli bude� takhle pyskovat, m��e� si za��t hledat tou nejhnusn�j�� hav�t� prolezlej slamn�k na span�, proto�e to bude v�echno, co si bude� moct dovolit.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_NoJob_10_03");	//Je�t� za mnou p�ileze� a bude� �adonit o pr�ci.
	Info_ClearChoices(dia_gerbrandt_hello);
};

func void dia_gerbrandt_hello_yes_yes()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_Yes_Yes_15_00");	//Samoz�ejm�.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_01");	//Fajn, fajn, dostat se kvalifikovan�mu person�lu nen� nic lehk�ho.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_02");	//Co tv� doporu�en�?
	AI_Output(other,self,"DIA_Gerbrandt_Hello_Yes_Yes_15_03");	//Doporu�en�?
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_04");	//Dobr�, budu si t� pamatovat. Jakmile se zase za�nou hejbat obchody, p�ij� se mi uk�zat. Pak pro tebe budu mo�n� m�t n�jakou pr�ci.
	Info_ClearChoices(dia_gerbrandt_hello);
};

func void b_gerbrandt_pissoff()
{
	AI_Output(self,other,"B_Gerbrandt_PissOff_10_00");	//Co jako m� b�t tohle - d�l� si ze m� srandu?
	AI_Output(self,other,"B_Gerbrandt_PissOff_10_01");	//Ty a ten tv�j k�mo� Diego u� jste nad�lali dost �kody.
	AI_Output(self,other,"B_Gerbrandt_PissOff_10_02");	//Nech m� b�t!
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
	description = "N�co nov�ho?";
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
	AI_Output(other,self,"DIA_Gerbrandt_Perm_15_00");	//N�co nov�ho?
	if(KAPITEL <= 2)
	{
		if((hero.guild != GIL_KDF) && (hero.guild != GIL_PAL))
		{
			AI_Output(self,other,"DIA_Gerbrandt_Perm_10_01");	//Lidi jako ty nemaj� tady naho�e co d�lat. Tady bydl� v�en� ob�an�, ne n�jac� tul�ci nebo podvodn�ci.
			AI_Output(self,other,"DIA_Gerbrandt_Perm_10_02");	//Jestli se ti n�kdy poda�� zbohatnout a doj�t �cty, pak tady mo�n� bude� v�tan�j��.
		}
		else
		{
			AI_Output(self,other,"DIA_Gerbrandt_Perm_10_03");	//Nem��u si st�ovat, v�en� pane.
		};
	}
	else if(KAPITEL >= 3)
	{
		if(MIS_DIEGOSRESIDENCE != LOG_SUCCESS)
		{
			if((hero.guild != GIL_KDF) && (hero.guild != GIL_PAL))
			{
				AI_Output(self,other,"DIA_Gerbrandt_Perm_10_04");	//U� jsem vid�l tob� podobn� - prost� nev�te, kam pat��te.
				AI_Output(self,other,"DIA_Gerbrandt_Perm_10_05");	//Mus�m si promluvit s m�stodr��c�m ohledn� odpov�daj�c�ho zabezpe�en� horn� �tvrti.
			}
			else
			{
				AI_Output(self,other,"DIA_Gerbrandt_Perm_10_06");	//Tohle je jenom moje z�le�itost. Nem�m �as!
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
	description = "Diego se nech� pozdravovat.";
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
	AI_Output(other,self,"DIA_Gerbrandt_GreetingsFromDiego_15_00");	//Diego se nech� pozdravovat.
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_01");	//(vyd�en�) Co? Kdo? Jak� Diego?
	AI_Output(other,self,"DIA_Gerbrandt_GreetingsFromDiego_15_02");	//A taky m� po��dal, abych ti dal tenhle dopis.
	b_giveinvitems(other,self,itwr_diegosletter_mis,1);
	b_usefakescroll();
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_03");	//(znepokojen�) To nem��e b�t pravda. Ne. Jsem mrtv� mu�!
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_04");	//(ustra�en�) Je teda ve m�st�?
	AI_Output(other,self,"DIA_Gerbrandt_GreetingsFromDiego_15_05");	//Kdo?
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_06");	//Diego, p�ece!
	AI_Output(other,self,"DIA_Gerbrandt_GreetingsFromDiego_15_07");	//Ano, zanedlouho se s n�m setk�m.
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_08");	//(zoufale, pro sebe) Tak to je konec. V�echno je v tahu.
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_09");	//Nem�m �as, mus�m odtud vypadnout. Jestli m� tu najde, jsem vy��zenej.
	MIS_DIEGOSRESIDENCE = LOG_SUCCESS;
	b_giveplayerxp(XP_DIEGOSRESIDENCE);
	DIEGO_COMING = TRUE;
};

