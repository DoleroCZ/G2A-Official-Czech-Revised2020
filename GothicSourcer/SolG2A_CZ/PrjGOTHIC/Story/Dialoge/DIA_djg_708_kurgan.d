
instance DIA_KURGAN_EXIT(C_INFO)
{
	npc = djg_708_kurgan;
	nr = 999;
	condition = dia_kurgan_exit_condition;
	information = dia_kurgan_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_kurgan_exit_condition()
{
	return TRUE;
};

func void dia_kurgan_exit_info()
{
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(biff,400);
};


instance DIA_KURGAN_HELLO(C_INFO)
{
	npc = djg_708_kurgan;
	condition = dia_kurgan_hello_condition;
	information = dia_kurgan_hello_info;
	important = TRUE;
};


func int dia_kurgan_hello_condition()
{
	return TRUE;
};

func void dia_kurgan_hello_info()
{
	AI_Output(self,other,"DIA_Kurgan_HELLO_01_00");	//Hej, ty! Chl�pci jako ty by si m�li d�vat pozor, kam �lapou.
	AI_Output(other,self,"DIA_Kurgan_HELLO_15_01");	//Co se mi to pokou�� ��ct?
	AI_Output(self,other,"DIA_Kurgan_HELLO_01_02");	//Cht�l jsem t�m ��ct, �e zdej�� ovzdu�� nen� prosp�n� tv�mu zdrav�. Tahle oblast je te� prolezl� sk�ety a dal��ma zr�dama.
	AI_Output(self,other,"DIA_Kurgan_HELLO_01_03");	//A to nepo��t�m draky. Ber to jen jako dob�e m�n�nou radu.
	b_logentry(TOPIC_DRAGONHUNTER,"U vchodu do Hornick�ho �dol� m� p�iv�tala skupina drakobijc�. Byli t�ce ozbrojen�, ale ob�v�m se, �e na draky t�m moc velk� dojem neud�laj�.");
};


instance DIA_KURGAN_ELSE(C_INFO)
{
	npc = djg_708_kurgan;
	condition = dia_kurgan_else_condition;
	information = dia_kurgan_else_info;
	description = "M��e� mi ��ct n�co, co u� bych d�vno nev�d�l?";
};


func int dia_kurgan_else_condition()
{
	return TRUE;
};

func void dia_kurgan_else_info()
{
	AI_Output(other,self,"DIA_Kurgan_ELSE_15_00");	//M��e� mi ��ct n�co, co u� bych d�vno nev�d�l?
	AI_Output(self,other,"DIA_Kurgan_ELSE_01_01");	//M��u ti d�t dobrou radu, a to dokonce zdarma.
	AI_Output(self,other,"DIA_Kurgan_ELSE_01_02");	//Nem��em tu pot�ebovat nikoho, kdo se slo�� ze slabou�k�ho dra��ho prdnut�.
	AI_Output(self,other,"DIA_Kurgan_ELSE_01_03");	//Jdi dom�, tohle je pr�ce pro opravdov� chlapy.
};


instance DIA_KURGAN_LEADER(C_INFO)
{
	npc = djg_708_kurgan;
	condition = dia_kurgan_leader_condition;
	information = dia_kurgan_leader_info;
	description = "Ty jsi tady ��f?";
};


func int dia_kurgan_leader_condition()
{
	return TRUE;
};

func void dia_kurgan_leader_info()
{
	AI_Output(other,self,"DIA_Kurgan_Leader_15_00");	//Ty jsi tady ��f?
	AI_Output(self,other,"DIA_Kurgan_Leader_01_01");	//Vypad�m tak? Jasn�, �e ne. Nepot�ebujeme ��dn�ho nafoukan�ho blba, co by n�m n�co rozkazoval.
	AI_Output(self,other,"DIA_Kurgan_Leader_01_02");	//Kdy� se Sylvio sna�il chovat jako n� ��f, uk�zali jsme mu i t�m jeho k�mo��m, co si o tom mysl�me.
	AI_Output(self,other,"DIA_Kurgan_Leader_01_03");	//Poh�dali jsme se. Nakonec sami ode�li.
	AI_Output(self,other,"DIA_Kurgan_Leader_01_04");	//Douf�m, �e Sylvio skon�il v kotli s pol�vkou n�jak�ho sk�eta.
};


instance DIA_KURGAN_KILLDRAGON(C_INFO)
{
	npc = djg_708_kurgan;
	condition = dia_kurgan_killdragon_condition;
	information = dia_kurgan_killdragon_info;
	description = "Tak ty chce� zab�t draky?";
};


func int dia_kurgan_killdragon_condition()
{
	if(Npc_KnowsInfo(other,dia_kurgan_leader))
	{
		return TRUE;
	};
};


var int kurgan_killdragon_day;

func void dia_kurgan_killdragon_info()
{
	AI_Output(other,self,"DIA_Kurgan_KillDragon_15_00");	//(posm�n�) Tak ty chce� zab�t draky?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_01");	//Bl�znivej osle. Tak ty v�, jak slo�it draka?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_02");	//To si mysl�, �e ta bestie si prost� bude jen tak klidn� sed�t ve svym doup�ti a �ekat, a� j� usekne� hlavu?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_03");	//N�co takov�ho vy�aduje dobrej pl�n a r�znou akci.
	AI_Output(other,self,"DIA_Kurgan_KillDragon_15_04");	//J� v�m. A jak se s t�m hodl�te vypo��dat vy?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_05");	//Nejd��v mus�me zjistit, kde tu bestii najdeme.
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_06");	//Teprve pak si m��eme promyslet, jak tu potvoru zab�t.
	KURGAN_KILLDRAGON_DAY = Wld_GetDay();
	Info_AddChoice(dia_kurgan_killdragon,"To bych cht�l vid�t, ale mus�m se starat o sv� v�ci.",dia_kurgan_killdragon_weg);
	Info_AddChoice(dia_kurgan_killdragon,"Jak se chcete dostat p�es sk�ety?",dia_kurgan_killdragon_orks);
	Info_AddChoice(dia_kurgan_killdragon,"M�m dojem, �e nenajde� ani slepou ovci.",dia_kurgan_killdragon_spott);
};

func void dia_kurgan_killdragon_spott()
{
	AI_Output(other,self,"DIA_Kurgan_KillDragon_spott_15_00");	//M�m dojem, �e nenajde� ani slepou ovci.
	AI_Output(self,other,"DIA_Kurgan_KillDragon_spott_01_01");	//Co? To chce�, abych ti n�jakou vrazil?
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_kurgan_killdragon_orks()
{
	AI_Output(other,self,"DIA_Kurgan_KillDragon_orks_15_00");	//Jak se chcete dostat p�es sk�ety?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_orks_01_01");	//Na tyhle v�ci je je�t� dost �asu.
};

func void dia_kurgan_killdragon_weg()
{
	AI_Output(other,self,"DIA_Kurgan_KillDragon_weg_15_00");	//To bych cht�l vid�t, ale mus�m se starat o sv� v�ci.
	AI_Output(self,other,"DIA_Kurgan_KillDragon_weg_01_01");	//M�l by ses odsud rychle vytratit. Jinak se ti m��e st�t, �e p�ijde� o hn�tu, mo�n� o dv�.
	AI_StopProcessInfos(self);
};


instance DIA_KURGAN_SEENDRAGON(C_INFO)
{
	npc = djg_708_kurgan;
	condition = dia_kurgan_seendragon_condition;
	information = dia_kurgan_seendragon_info;
	permanent = TRUE;
	description = "U� jsi n�kdy toho draka vid�l?";
};


func int dia_kurgan_seendragon_condition()
{
	if(KURGAN_KILLDRAGON_DAY <= (Wld_GetDay() - 2))
	{
		return TRUE;
	};
};

func void dia_kurgan_seendragon_info()
{
	AI_Output(other,self,"DIA_Kurgan_SEENDRAGON_15_00");	//U� jsi n�kdy toho draka vid�l?
	AI_Output(self,other,"DIA_Kurgan_SEENDRAGON_01_01");	//Zat�m ne. Ale ta bestie se nem��e schov�vat v��n�.
};


instance DIA_KURGAN_ALLDRAGONSDEAD(C_INFO)
{
	npc = djg_708_kurgan;
	nr = 5;
	condition = dia_kurgan_alldragonsdead_condition;
	information = dia_kurgan_alldragonsdead_info;
	permanent = FALSE;
	description = "Draci jsou mrtv�.";
};


func int dia_kurgan_alldragonsdead_condition()
{
	if(MIS_ALLDRAGONSDEAD == TRUE)
	{
		return TRUE;
	};
};

func void dia_kurgan_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_Kurgan_AllDragonsDead_15_00");	//Draci jsou mrtv�.
	AI_Output(self,other,"DIA_Kurgan_AllDragonsDead_01_01");	//Ha, a kdo je jako m�l zab�t? Paladinov�?
	AI_Output(other,self,"DIA_Kurgan_AllDragonsDead_15_02");	//J�.
	AI_Output(self,other,"DIA_Kurgan_AllDragonsDead_01_03");	//(sm�ch) Ha. Tomu s�m nev���. P�esta� si ze m� utahovat.
};


instance DIA_KURGAN_PICKPOCKET(C_INFO)
{
	npc = djg_708_kurgan;
	nr = 900;
	condition = dia_kurgan_pickpocket_condition;
	information = dia_kurgan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_kurgan_pickpocket_condition()
{
	return c_beklauen(34,120);
};

func void dia_kurgan_pickpocket_info()
{
	Info_ClearChoices(dia_kurgan_pickpocket);
	Info_AddChoice(dia_kurgan_pickpocket,DIALOG_BACK,dia_kurgan_pickpocket_back);
	Info_AddChoice(dia_kurgan_pickpocket,DIALOG_PICKPOCKET,dia_kurgan_pickpocket_doit);
};

func void dia_kurgan_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_kurgan_pickpocket);
};

func void dia_kurgan_pickpocket_back()
{
	Info_ClearChoices(dia_kurgan_pickpocket);
};

