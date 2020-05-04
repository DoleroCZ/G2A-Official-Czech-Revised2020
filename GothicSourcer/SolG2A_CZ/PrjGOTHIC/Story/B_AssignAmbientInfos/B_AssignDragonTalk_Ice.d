
instance DIA_DRAGON_ICE_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_dragon_ice_exit_condition;
	information = dia_dragon_ice_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dragon_ice_exit_condition()
{
	if(DRAGONTALK_EXIT_FREE == TRUE)
	{
		return TRUE;
	};
};

func void dia_dragon_ice_exit_info()
{
	Npc_RemoveInvItems(other,itmi_innoseye_mis,1);
	CreateInvItems(other,itmi_innoseye_discharged_mis,1);
	AI_Output(self,other,"DIA_Dragon_Ice_Exit_20_00");	//S�la Oka vyhasla a tv�j �as vypr�el.
	AI_StopProcessInfos(self);
	DRAGONTALK_EXIT_FREE = FALSE;
	self.flags = 0;
	if(DJG_BIFF_STAY == TRUE)
	{
		b_startotherroutine(biff,"Follow");
		DJG_BIFF_STAY = FALSE;
	};
	Wld_InsertNpc(draconian,"FP_ROAM_OW_ICEREGION_29_02");
	Wld_InsertNpc(draconian,"FP_ROAM_OW_ICEREGION_30_01");
	Wld_InsertNpc(draconian,"FP_ROAM_OW_BLOODFLY_05_01");
	Wld_InsertNpc(draconian,"FP_ROAM_OW_BLOODFLY_05_01");
};


instance DIA_DRAGON_ICE_HELLO(C_INFO)
{
	nr = 1;
	condition = dia_dragon_ice_hello_condition;
	information = dia_dragon_ice_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dragon_ice_hello_condition()
{
	if(Npc_HasItems(other,itmi_innoseye_mis) >= 1)
	{
		return 1;
	};
};

func void dia_dragon_ice_hello_info()
{
	AI_Output(self,other,"DIA_Dragon_Ice_Hello_20_00");	//Pro� ru�� m�j odpo�inek? To se mus�m v��n� zahrab�vat na st�le vzd�len�j��ch m�stech jen proto, aby m� takov� protivn� hav� jako ty nechala na pokoji?
	if(MIS_KILLEDDRAGONS == 0)
	{
		AI_Output(other,self,"DIA_Dragon_Ice_Hello_15_01");	//Mluv�c� drak. Po�ehn�no bu� Innosovo oko.
	};
	AI_Output(self,other,"DIA_Dragon_Ice_Hello_20_02");	//Vy lid� jste podivn� stvo�en�. I kdy� v�s smete ledov� vichr smrti, v�dycky se najde n�kdo, kdo povstane z popela a mysl� si o sob�, �e je mu d�no b�t hrdinou.
	AI_Output(self,other,"DIA_Dragon_Ice_Hello_20_03");	//Ale to brzo skon��. Osobn� dohl�dnu na to, aby nikdo z v�s u� nikdy z ni�eho nepovstal.
	AI_Output(other,self,"DIA_Dragon_Ice_Hello_15_04");	//Ticho. S moc� posv�tn�ho Oka, je� mi byla prop�j�ena, si m��u dovolit zeptat se t� na p�r v�c�.
	AI_Output(self,other,"DIA_Dragon_Ice_Hello_20_05");	//Ha ha ha. Jen se ptej. Tv� v�domosti ti nebudou k ni�emu.
};


instance DIA_DRAGON_ICE_WERBISTDU(C_INFO)
{
	nr = 5;
	condition = dia_dragon_ice_werbistdu_condition;
	information = dia_dragon_ice_werbistdu_info;
	description = "Kdo jsi?";
};


func int dia_dragon_ice_werbistdu_condition()
{
	if(Npc_KnowsInfo(other,dia_dragon_ice_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_ice_werbistdu_info()
{
	AI_Output(other,self,"DIA_Dragon_Ice_WERBISTDU_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Dragon_Ice_WERBISTDU_20_01");	//Jsem Finkregh. P�n ledu a sn�hu, str�ce shrom�d�n� a konec konc� i tv� smrt.
};


instance DIA_DRAGON_ICE_BELIAR(C_INFO)
{
	nr = 6;
	condition = dia_dragon_ice_beliar_condition;
	information = dia_dragon_ice_beliar_info;
	description = "Jak�mu bohu slou��?";
};


func int dia_dragon_ice_beliar_condition()
{
	if(Npc_KnowsInfo(other,dia_dragon_ice_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_ice_beliar_info()
{
	AI_Output(other,self,"DIA_Dragon_Ice_BELIAR_15_00");	//Jak�mu bohu slou��?
	AI_Output(other,self,"DIA_Dragon_Ice_BELIAR_15_01");	//Kterej zpropadenej b�h mohl kdy dovolit takov� ohavn� potvo�e jako ty chodit po t�hle zemi?
	AI_Output(self,other,"DIA_Dragon_Ice_BELIAR_20_02");	//Neobt�uj se porozum�t smyslu na�eho Shrom�d�n�, mal� hrdino.
	AI_Output(self,other,"DIA_Dragon_Ice_BELIAR_20_03");	//Beliar n�m nejen dovolil, abychom tu byli - on n�s dokonce vede.
	AI_Output(self,other,"DIA_Dragon_Ice_BELIAR_20_04");	//Podn�ceni jeho svat�mi slovy si neodpo�ineme do t� doby, ne� se jeho v�le prom�n� v skutky.
};

func void b_assigndragontalk_ice(var C_NPC slf)
{
	dia_dragon_ice_exit.npc = Hlp_GetInstanceID(slf);
	dia_dragon_ice_hello.npc = Hlp_GetInstanceID(slf);
	dia_dragon_ice_werbistdu.npc = Hlp_GetInstanceID(slf);
	dia_dragon_ice_beliar.npc = Hlp_GetInstanceID(slf);
	b_assigndragontalk_main(slf);
};

