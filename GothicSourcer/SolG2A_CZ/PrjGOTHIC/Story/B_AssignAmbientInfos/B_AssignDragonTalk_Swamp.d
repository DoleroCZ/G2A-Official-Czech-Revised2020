
instance DIA_DRAGON_SWAMP_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_dragon_swamp_exit_condition;
	information = dia_dragon_swamp_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dragon_swamp_exit_condition()
{
	if(DRAGONTALK_EXIT_FREE == TRUE)
	{
		return TRUE;
	};
};

func void dia_dragon_swamp_exit_info()
{
	Npc_RemoveInvItems(other,itmi_innoseye_mis,1);
	CreateInvItems(other,itmi_innoseye_discharged_mis,1);
	AI_Output(self,other,"DIA_Dragon_Swamp_Exit_20_00");	//Moc Oka je vy�erp�na. Nit tv�ho �ivota tady kon��, �lov��e.
	SWAMPDRAGON = Hlp_GetNpc(dragon_swamp);
	swampdragon.flags = 0;
	AI_StopProcessInfos(self);
	DRAGONTALK_EXIT_FREE = FALSE;
	if(DJG_SWAMPPARTY_GOGOGO == TRUE)
	{
		if((DJG_SWAMPPARTY == TRUE) && (Npc_IsDead(djg_cipher) == FALSE))
		{
			b_startotherroutine(djg_rod,"SwampDragon");
		};
		b_startotherroutine(djg_cipher,"SwampDragon");
	};
	if(DJG_BIFF_STAY == TRUE)
	{
		b_startotherroutine(biff,"Follow");
		DJG_BIFF_STAY = FALSE;
	};
};


instance DIA_DRAGON_SWAMP_HELLO(C_INFO)
{
	nr = 5;
	condition = dia_dragon_swamp_hello_condition;
	information = dia_dragon_swamp_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dragon_swamp_hello_condition()
{
	if(Npc_HasItems(other,itmi_innoseye_mis) >= 1)
	{
		return 1;
	};
};

func void dia_dragon_swamp_hello_info()
{
	AI_Output(self,other,"DIA_Dragon_Swamp_Hello_20_00");	//�ekaj� t� jen sam� pot�e, jestli se odv�� je�t� o krok bl�!
	if(MIS_KILLEDDRAGONS == 0)
	{
		AI_Output(other,self,"DIA_Dragon_Swamp_Hello_15_01");	//Ach. Vypad� to, �e Innosovo oko funguje.
	};
	AI_Output(self,other,"DIA_Dragon_Swamp_Hello_20_02");	//U� p�i�li mnoz� z tv�ho druhu. V�echny jsem je smetl z povrchu zemsk�ho.
	AI_Output(other,self,"DIA_Dragon_Swamp_Hello_15_03");	//�et�i si dech. Tv� velk� slova m� nemohou vyd�sit, ty smrdut� zplozen�e pekel.
	AI_Output(other,self,"DIA_Dragon_Swamp_Hello_15_04");	//�ekni mi, co chci v�d�t, nebo t� utop�m ve tv� vlastn� krvi.
	AI_Output(self,other,"DIA_Dragon_Swamp_Hello_20_05");	//Ha ha ha. Opova�uje� se mi vyhro�ovat, b�dn� �erve? �ekni mi jeden jedin� d�vod, pro� bych t� hned te� nem�l rozsekat na tis�c kousk�.
	AI_Output(other,self,"DIA_Dragon_Swamp_Hello_15_06");	//Jsem Innos�v posel a m�m u sebe posv�tn� Innosovo oko. Nem� na v�b�r. Mus� se podrobit m� v�li, nebo bude� zni�en.
	AI_Output(self,other,"DIA_Dragon_Swamp_Hello_20_07");	//(�ve) Arrh. �ekni, co ode m� chce�.
};


instance DIA_DRAGON_SWAMP_WERBISTDU(C_INFO)
{
	nr = 6;
	condition = dia_dragon_swamp_werbistdu_condition;
	information = dia_dragon_swamp_werbistdu_info;
	description = "Kdo jsi?";
};


func int dia_dragon_swamp_werbistdu_condition()
{
	if(Npc_KnowsInfo(other,dia_dragon_swamp_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_swamp_werbistdu_info()
{
	AI_Output(other,self,"DIA_Dragon_Swamp_WERBISTDU_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Dragon_Swamp_WERBISTDU_20_01");	//Jmenuju se Pandrodor. A m�l bys sis dob�e rozmyslet, jestli nebude lep�� zal�zt zp�t mezi sk�ly, odkud jsi p�i�el.
};


instance DIA_DRAGON_SWAMP_WOSINDDIEANDEREN(C_INFO)
{
	nr = 7;
	condition = dia_dragon_swamp_wosinddieanderen_condition;
	information = dia_dragon_swamp_wosinddieanderen_info;
	description = "Kde najdu zbytek tob� podobn�ch odporn�ch stvo�en�?";
};


func int dia_dragon_swamp_wosinddieanderen_condition()
{
	if(Npc_KnowsInfo(other,dia_dragon_swamp_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_swamp_wosinddieanderen_info()
{
	AI_Output(other,self,"DIA_Dragon_Swamp_WOSINDDIEANDEREN_15_00");	//Kde najdu zbytek tob� podobn�ch odporn�ch stvo�en�?
	AI_Output(self,other,"DIA_Dragon_Swamp_WOSINDDIEANDEREN_20_01");	//Elementy, z nich� bylo v�e stvo�eno, dr�� tento sv�t pohromad�.
	AI_Output(self,other,"DIA_Dragon_Swamp_WOSINDDIEANDEREN_20_02");	//Ka�d� z nich vyjad�uje schopnost ovl�dat ��st sv�ta.
	AI_Output(self,other,"DIA_Dragon_Swamp_WOSINDDIEANDEREN_20_03");	//Hledej elementy a nalezne� v�echny ostatn�.
};

func void b_assigndragontalk_swamp(var C_NPC slf)
{
	dia_dragon_swamp_exit.npc = Hlp_GetInstanceID(slf);
	dia_dragon_swamp_hello.npc = Hlp_GetInstanceID(slf);
	dia_dragon_swamp_werbistdu.npc = Hlp_GetInstanceID(slf);
	dia_dragon_swamp_wosinddieanderen.npc = Hlp_GetInstanceID(slf);
	b_assigndragontalk_main(slf);
};

