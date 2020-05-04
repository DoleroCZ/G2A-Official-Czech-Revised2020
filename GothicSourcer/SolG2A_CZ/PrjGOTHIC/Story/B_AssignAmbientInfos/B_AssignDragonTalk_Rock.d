
instance DIA_DRAGON_ROCK_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_dragon_rock_exit_condition;
	information = dia_dragon_rock_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dragon_rock_exit_condition()
{
	if(DRAGONTALK_EXIT_FREE == TRUE)
	{
		return TRUE;
	};
};

func void dia_dragon_rock_exit_info()
{
	Npc_RemoveInvItems(other,itmi_innoseye_mis,1);
	CreateInvItems(other,itmi_innoseye_discharged_mis,1);
	AI_Output(self,other,"DIA_Dragon_Rock_Exit_20_00");	//Dost �e��. Tv� do�asn� moc vypr�ela. Oko ztratilo svou s�lu. P�iprav se na smrt.
	AI_StopProcessInfos(self);
	DRAGONTALK_EXIT_FREE = FALSE;
	self.flags = 0;
};


instance DIA_DRAGON_ROCK_HELLO(C_INFO)
{
	nr = 1;
	condition = dia_dragon_rock_hello_condition;
	information = dia_dragon_rock_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dragon_rock_hello_condition()
{
	if(Npc_HasItems(other,itmi_innoseye_mis) >= 1)
	{
		return 1;
	};
};

func void dia_dragon_rock_hello_info()
{
	AI_Output(self,other,"DIA_Dragon_Rock_Hello_20_00");	//Dal�� troufal� stvo�en�, co se odv�ilo vyl�zt do m�ch skal. Ty mr�av� �lov��ku. Tak state�n� a z�rove� tak zraniteln�.
	if(MIS_KILLEDDRAGONS == 0)
	{
		AI_Output(other,self,"DIA_Dragon_Rock_Hello_15_01");	//Hej, v�n� um� mluvit.
	};
	AI_Output(self,other,"DIA_Dragon_Rock_Hello_20_02");	//Vyrvu ti z t�la vnit�nosti a nad�l�m z nich krmen� pro krysy.
	AI_Output(other,self,"DIA_Dragon_Rock_Add_15_00");	//Ne tak rychle. M�m u sebe Innosovo oko. Bude� m� muset poslouchat a odpov�dat na m� ot�zky.
	AI_Output(self,other,"DIA_Dragon_Rock_Hello_20_04");	//(�ve) Arrh. Ptej se.
};


instance DIA_DRAGON_ROCK_WERBISTDU(C_INFO)
{
	nr = 6;
	condition = dia_dragon_rock_werbistdu_condition;
	information = dia_dragon_rock_werbistdu_info;
	description = "Kdo jsi?";
};


func int dia_dragon_rock_werbistdu_condition()
{
	if(Npc_KnowsInfo(other,dia_dragon_rock_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_rock_werbistdu_info()
{
	AI_Output(other,self,"DIA_Dragon_Rock_WERBISTDU_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Dragon_Rock_WERBISTDU_20_01");	//Jsem naz�v�n Pedrakhanem a st�hnu z tebe k��i za�iva, a� t� chyt�m.
};


instance DIA_DRAGON_ROCK_HIERARCHIE(C_INFO)
{
	nr = 7;
	condition = dia_dragon_rock_hierarchie_condition;
	information = dia_dragon_rock_hierarchie_info;
	description = "Kdo je mezi draky ten nejsiln�j��?";
};


func int dia_dragon_rock_hierarchie_condition()
{
	if(Npc_KnowsInfo(other,dia_dragon_rock_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_rock_hierarchie_info()
{
	AI_Output(other,self,"DIA_Dragon_Rock_HIERARCHIE_15_00");	//Kdo je mezi draky ten nejsiln�j��?
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_01");	//�erp�me svou s�lu z element� tohoto sv�ta. Jejich hierarchie je jasn� a jednoduch�.
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_02");	//Zem�, kterou pokr�v� m�kk� p�da, poskytla �ivot v�em stvo�en�m pod sluncem. Te� se otev�e a v�echny v�s pohlt�, pokud se dostanete p��li� bl�zko.
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_03");	//Sk�ly, je� by se rad�ji rozpadly, ne� by se vzdaly, se py�n� ty�� k nebi a schov�vaj� samy p�ed sebou jistou nedbalost. A je�t� poskytuj� nejlep�� ochranu proti p��livu.
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_04");	//Jisk�i�ka �ivota d��m� v ��ru hlubin tohoto sv�ta. A te� plameny sp�l� v�e �iv� a nez�stane nic ne� popel.
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_05");	//V�echny na�e elementy dok�� chr�nit i ni�it. Ale pouze ve vod�, kter� se m��e st�t tvrdou a pevnou jako sk�la, se v�e p�em�n� na v��nou nehybnost, kde je �ivot st�� mo�n�.
};

func void b_assigndragontalk_rock(var C_NPC slf)
{
	dia_dragon_rock_exit.npc = Hlp_GetInstanceID(slf);
	dia_dragon_rock_hello.npc = Hlp_GetInstanceID(slf);
	dia_dragon_rock_werbistdu.npc = Hlp_GetInstanceID(slf);
	dia_dragon_rock_hierarchie.npc = Hlp_GetInstanceID(slf);
	b_assigndragontalk_main(slf);
};

