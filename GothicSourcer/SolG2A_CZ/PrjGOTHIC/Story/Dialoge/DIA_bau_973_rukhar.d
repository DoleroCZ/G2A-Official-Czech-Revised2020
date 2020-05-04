
instance DIA_RUKHAR_EXIT(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 999;
	condition = dia_rukhar_exit_condition;
	information = dia_rukhar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rukhar_exit_condition()
{
	return TRUE;
};

func void dia_rukhar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RUKHAR_HALLO(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 4;
	condition = dia_rukhar_hallo_condition;
	information = dia_rukhar_hallo_info;
	description = "Je tady dobr� pivo?";
};


func int dia_rukhar_hallo_condition()
{
	return TRUE;
};

func void dia_rukhar_hallo_info()
{
	AI_Output(other,self,"DIA_Rukhar_HALLO_15_00");	//Je tady dobr� pivo?
	AI_Output(self,other,"DIA_Rukhar_HALLO_12_01");	//Nen� to zrovna excelentn�, ale v t�chhle temnejch �asech si nem��e� moc vyb�rat.
};


instance DIA_RUKHAR_WASMACHSTDU(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 5;
	condition = dia_rukhar_wasmachstdu_condition;
	information = dia_rukhar_wasmachstdu_info;
	description = "Co tady d�l�?";
};


func int dia_rukhar_wasmachstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_rukhar_hallo))
	{
		return TRUE;
	};
};

func void dia_rukhar_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Rukhar_WASMACHSTDU_15_00");	//Co tady d�l�?
	AI_Output(self,other,"DIA_Rukhar_WASMACHSTDU_12_01");	//A� do minul�ho t�dne jsem d�el jak mezek na pol�ch velkostatk��e.
	AI_Output(self,other,"DIA_Rukhar_WASMACHSTDU_12_02");	//Jednoho dne u� jsem toho prost� m�l dost, a tak jsem odtamtud vypadnul.
	AI_Output(self,other,"DIA_Rukhar_WASMACHSTDU_12_03");	//Te� jsem sv�m vlastn�m p�nem. V�echno, co vlastn�m, je tady v t� truhle. A to je taky v�e, co pot�ebuju.
	AI_Output(self,other,"DIA_Rukhar_WASMACHSTDU_12_04");	//M�l bys z�jem o men�� sout�?
	Log_CreateTopic(TOPIC_WETTSAUFEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WETTSAUFEN,LOG_RUNNING);
	b_logentry(TOPIC_WETTSAUFEN,"V t� hospod� se uzav�raj� s�zky.");
};


instance DIA_RUKHAR_WETTKAMPF(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 3;
	condition = dia_rukhar_wettkampf_condition;
	information = dia_rukhar_wettkampf_info;
	description = "A jak� sout� by to m�la b�t?";
};


func int dia_rukhar_wettkampf_condition()
{
	if(Npc_KnowsInfo(other,dia_rukhar_wasmachstdu))
	{
		return TRUE;
	};
};

func void dia_rukhar_wettkampf_info()
{
	AI_Output(other,self,"DIA_Rukhar_WETTKAMPF_15_00");	//A jak� sout� by to m�la b�t?
	AI_Output(self,other,"DIA_Rukhar_WETTKAMPF_12_01");	//��k�m tomu DO DNA.
	AI_Output(self,other,"DIA_Rukhar_WETTKAMPF_12_02");	//Pravidla jsou docela jednoduch�.
	AI_Output(self,other,"DIA_Rukhar_WETTKAMPF_12_03");	//Budeme se st��dat v objedn�v�n� korbel� toho nejlep��ho piva, co m��e ten chlap nab�dnout.
	AI_Output(self,other,"DIA_Rukhar_WETTKAMPF_12_04");	//Ka�d� korbel mus� do sebe hodit na ex. Nesm� po n�m zbejt na stole ani mokrej krou�ek.
	AI_Output(self,other,"DIA_Rukhar_WETTKAMPF_12_05");	//Kdo vydr�� nejd�l, vyhr�v�. Pora�en� plat� �tratu a s�zku. Tak co, jde� do toho?
	AI_Output(other,self,"DIA_Rukhar_WETTKAMPF_15_06");	//Mo�n� jindy, a� nebudu m�t tak nasp�ch.
};


instance DIA_RUKHAR_HOLERANDOLPH(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 3;
	condition = dia_rukhar_holerandolph_condition;
	information = dia_rukhar_holerandolph_info;
	description = "A m��u si tedy vsadit na n�koho jin�ho?";
};


func int dia_rukhar_holerandolph_condition()
{
	if(Npc_KnowsInfo(other,dia_rukhar_wettkampf))
	{
		return TRUE;
	};
};

func void dia_rukhar_holerandolph_info()
{
	AI_Output(other,self,"DIA_Rukhar_HOLERANDOLPH_15_00");	//M��u si taky vsadit na n�koho jin�ho?
	AI_Output(self,other,"DIA_Rukhar_HOLERANDOLPH_12_01");	//Samoz�ejm�. Kdy� dok�e� sehnat n�koho, kdo bude m�t odvahu se mi postavit, pak se se mnou m��e� vsadit.
	AI_Output(self,other,"DIA_Rukhar_HOLERANDOLPH_12_02");	//V�ichni d�vaj� stejn� vklad. V�t�z bere v�echno. V��ka s�zky z�le�� jen na tv� pen�ence.
	AI_Output(self,other,"DIA_Rukhar_HOLERANDOLPH_12_03");	//Doho� mi n�koho, kdo bude m�t dost odvahy si to se mnou rozdat, a m��e� se vsadit.
	b_logentry(TOPIC_WETTSAUFEN,"Rukhar t� sv� h�e ��k� NA EX! Ne, d�ky, ale to m� nezaj�m�. Rad�i najdu n�koho jin�ho, z koho m��e d�lat ka�para.");
};


instance DIA_RUKHAR_RANDOLPHWILL(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 3;
	condition = dia_rukhar_randolphwill_condition;
	information = dia_rukhar_randolphwill_info;
	permanent = TRUE;
	description = "M�m n�koho, kdo by cht�l s tebou soupe�it.";
};


var int dia_rukhar_randolphwill_noperm;

func int dia_rukhar_randolphwill_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_gegenwen) && Npc_KnowsInfo(other,dia_rukhar_holerandolph) && (DIA_RUKHAR_RANDOLPHWILL_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_rukhar_randolphwill_info()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_15_00");	//M�m n�koho, kdo by cht�l s tebou soupe�it.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_12_01");	//Kdo by to mohl b�t?
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_15_02");	//Randolph.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_12_03");	//Ho ho. Chvastoun Randolph? Dobr�. Pro� ne.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_12_04");	//Po�li mi sem toho stra�pytla a j� za��d�m zbytek.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_12_05");	//Sebere se a� tak za dva dny. Kdo v�? T�eba bude� m�t �t�st� a on se pak je�t� n�kdy postav�.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_12_06");	//Jak� je tvoje s�zka?
	Info_ClearChoices(dia_rukhar_randolphwill);
	Info_AddChoice(dia_rukhar_randolphwill,"Nic takov�ho.",dia_rukhar_randolphwill_nix);
	Info_AddChoice(dia_rukhar_randolphwill,"100 zlat�ch",dia_rukhar_randolphwill_100);
	Info_AddChoice(dia_rukhar_randolphwill,"50 zlat�ch",dia_rukhar_randolphwill_50);
	Info_AddChoice(dia_rukhar_randolphwill,"20 zlat�ch",dia_rukhar_randolphwill_20);
	Info_AddChoice(dia_rukhar_randolphwill,"10 zlat�ch",dia_rukhar_randolphwill_10);
};

func void dia_rukhar_randolphwill_annehmen()
{
	Info_ClearChoices(dia_rukhar_randolphwill);
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_annehmen_12_00");	//Vezmu si tvou s�zku a bude u m� a� do konce sout�e, dobr�?
	DIA_RUKHAR_RANDOLPHWILL_NOPERM = TRUE;
};

func void dia_rukhar_randolphwill_mehr()
{
	Info_ClearChoices(dia_rukhar_randolphwill);
	Info_AddChoice(dia_rukhar_randolphwill,"Nic takov�ho.",dia_rukhar_randolphwill_nix);
	Info_AddChoice(dia_rukhar_randolphwill,"100 zlat�ch",dia_rukhar_randolphwill_100);
	Info_AddChoice(dia_rukhar_randolphwill,"50 zlat�ch",dia_rukhar_randolphwill_50);
	Info_AddChoice(dia_rukhar_randolphwill,"20 zlat�ch",dia_rukhar_randolphwill_20);
	Info_AddChoice(dia_rukhar_randolphwill,"10 zlat�ch",dia_rukhar_randolphwill_10);
};

func void dia_rukhar_randolphwill_nix()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_nix_15_00");	//Nic takov�ho.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_nix_12_01");	//Tak to m��em na celou v�c zapomenout.
	AI_StopProcessInfos(self);
};

func void dia_rukhar_randolphwill_10()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_10_15_00");	//10 zlat�ch
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_10_12_01");	//Hele, tohle nem��e� myslet v�n�. O n�co v�c zlata t� snad nezabije.
	RUKHAR_EINSATZ = 10;
	RUKHAR_GEWINN = 20;
	Info_ClearChoices(dia_rukhar_randolphwill);
	Info_AddChoice(dia_rukhar_randolphwill,"(Zvolit jinou s�zku.)",dia_rukhar_randolphwill_mehr);
	Info_AddChoice(dia_rukhar_randolphwill,"(P�ijmout s�zku.)",dia_rukhar_randolphwill_annehmen);
};

func void dia_rukhar_randolphwill_20()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_20_15_00");	//20
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_20_12_01");	//Kdy� u� se chce� vs�zet, tak to laskav� d�lej po��dn�.
	RUKHAR_EINSATZ = 20;
	RUKHAR_GEWINN = 40;
	Info_ClearChoices(dia_rukhar_randolphwill);
	Info_AddChoice(dia_rukhar_randolphwill,"(Zvolit jinou s�zku.)",dia_rukhar_randolphwill_mehr);
	Info_AddChoice(dia_rukhar_randolphwill,"(P�ijmout s�zku.)",dia_rukhar_randolphwill_annehmen);
};

func void dia_rukhar_randolphwill_50()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_50_15_00");	//50
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_50_12_01");	//Nedr� se tak p�i zdi. Trochu odvahy.
	RUKHAR_EINSATZ = 50;
	RUKHAR_GEWINN = 100;
	Info_ClearChoices(dia_rukhar_randolphwill);
	Info_AddChoice(dia_rukhar_randolphwill,"(Zvolit jinou s�zku.)",dia_rukhar_randolphwill_mehr);
	Info_AddChoice(dia_rukhar_randolphwill,"(P�ijmout s�zku.)",dia_rukhar_randolphwill_annehmen);
};

func void dia_rukhar_randolphwill_100()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_100_15_00");	//100
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_100_12_01");	//To jsem cht�l sly�et.
	RUKHAR_EINSATZ = 100;
	RUKHAR_GEWINN = 200;
	Info_ClearChoices(dia_rukhar_randolphwill);
	Info_AddChoice(dia_rukhar_randolphwill,"(Zvolit jinou s�zku.)",dia_rukhar_randolphwill_mehr);
	Info_AddChoice(dia_rukhar_randolphwill,"(P�ijmout s�zku.)",dia_rukhar_randolphwill_annehmen);
};


instance DIA_RUKHAR_ICHSEHEDICH(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 3;
	condition = dia_rukhar_ichsehedich_condition;
	information = dia_rukhar_ichsehedich_info;
	permanent = TRUE;
	description = "Tady je m�j vklad.";
};


var int dia_rukhar_ichsehedich_noperm;

func int dia_rukhar_ichsehedich_condition()
{
	if((DIA_RUKHAR_ICHSEHEDICH_NOPERM == FALSE) && (DIA_RUKHAR_RANDOLPHWILL_NOPERM == TRUE) && (RUKHAR_EINSATZ != 0))
	{
		return TRUE;
	};
};

func void dia_rukhar_ichsehedich_info()
{
	AI_Output(other,self,"DIA_Rukhar_ICHSEHEDICH_15_00");	//Tady je m�j vklad.
	if(b_giveinvitems(other,self,itmi_gold,RUKHAR_EINSATZ))
	{
		AI_Output(self,other,"DIA_Rukhar_ICHSEHEDICH_12_01");	//Dobr�. Moc tady Randolpha nezdr�uj, sly��?
		DIA_RUKHAR_ICHSEHEDICH_NOPERM = TRUE;
		MIS_RUKHAR_WETTKAMPF = LOG_RUNNING;
		b_giveplayerxp(XP_AMBIENT);
	}
	else
	{
		AI_Output(self,other,"DIA_Rukhar_ICHSEHEDICH_12_02");	//To je sranda. Vra� se, a� bude� m�t dost pen�z.
	};
	AI_StopProcessInfos(self);
};


instance DIA_RUKHAR_GELDZURUECK(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 3;
	condition = dia_rukhar_geldzurueck_condition;
	information = dia_rukhar_geldzurueck_info;
	permanent = TRUE;
	description = "Chci zp�tky svoje pen�ze.";
};


func int dia_rukhar_geldzurueck_condition()
{
	if((MIS_RUKHAR_WETTKAMPF == LOG_SUCCESS) && (RUKHAR_WON_WETTKAMPF == TRUE))
	{
		return TRUE;
	};
};

func void dia_rukhar_geldzurueck_info()
{
	AI_Output(other,self,"DIA_Rukhar_GELDZURUECK_15_00");	//Chci zp�tky svoje pen�ze.
	AI_Output(self,other,"DIA_Rukhar_GELDZURUECK_12_01");	//Hern� s�zky jsou s�zkami cti, k�mo. M�l sis to rozmyslet d��v.
	AI_StopProcessInfos(self);
};


instance DIA_RUKHAR_HAENSELN(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 3;
	condition = dia_rukhar_haenseln_condition;
	information = dia_rukhar_haenseln_info;
	permanent = TRUE;
	description = "Vypad�, �e sis vzal v�t�� sousto, ne� dok�e� spolknout.";
};


func int dia_rukhar_haenseln_condition()
{
	if((MIS_RUKHAR_WETTKAMPF == LOG_SUCCESS) && (RUKHAR_WON_WETTKAMPF == FALSE))
	{
		return TRUE;
	};
};


var int dia_rukhar_haenseln_nureimalgeld;

func void dia_rukhar_haenseln_info()
{
	AI_Output(other,self,"DIA_Rukhar_HAENSELN_15_00");	//Vypad�, �e sis vzal v�t�� sousto, ne� dok�e� spolknout.
	if(DIA_RUKHAR_HAENSELN_NUREIMALGELD == FALSE)
	{
		AI_Output(self,other,"DIA_Rukhar_HAENSELN_12_01");	//Tady jsou tv� pen�ze a u� ani slovo.
		b_giveplayerxp(XP_RUKHAR_LOST);
		IntToFloat(RUKHAR_GEWINN);
		CreateInvItems(self,itmi_gold,RUKHAR_GEWINN);
		b_giveinvitems(self,other,itmi_gold,RUKHAR_GEWINN);
		DIA_RUKHAR_HAENSELN_NUREIMALGELD = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Rukhar_HAENSELN_12_02");	//Je�t� si to s tebou vy��d�m, na to se m��e� spolehnout.
	};
	AI_StopProcessInfos(self);
};


instance DIA_RUKHAR_PERM(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 7;
	condition = dia_rukhar_perm_condition;
	information = dia_rukhar_perm_info;
	permanent = TRUE;
	description = "Stalo se je�t� n�co, co by st�lo za �e�?";
};


func int dia_rukhar_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_rukhar_wasmachstdu))
	{
		return TRUE;
	};
};

func void dia_rukhar_perm_info()
{
	AI_Output(other,self,"DIA_Rukhar_Perm_15_00");	//Stalo se je�t� n�co, co by st�lo za �e�?
	AI_Output(self,other,"DIA_Rukhar_Perm_12_01");	//Nic, o �em bych v�d�l. Nikdo mi nic ne�ekl.
};


instance DIA_RUKHAR_PICKPOCKET(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 900;
	condition = dia_rukhar_pickpocket_condition;
	information = dia_rukhar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_rukhar_pickpocket_condition()
{
	return c_beklauen(26,30);
};

func void dia_rukhar_pickpocket_info()
{
	Info_ClearChoices(dia_rukhar_pickpocket);
	Info_AddChoice(dia_rukhar_pickpocket,DIALOG_BACK,dia_rukhar_pickpocket_back);
	Info_AddChoice(dia_rukhar_pickpocket,DIALOG_PICKPOCKET,dia_rukhar_pickpocket_doit);
};

func void dia_rukhar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_rukhar_pickpocket);
};

func void dia_rukhar_pickpocket_back()
{
	Info_ClearChoices(dia_rukhar_pickpocket);
};

