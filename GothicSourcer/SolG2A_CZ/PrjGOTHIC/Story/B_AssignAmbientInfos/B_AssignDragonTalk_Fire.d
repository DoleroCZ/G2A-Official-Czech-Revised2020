
instance DIA_DRAGON_FIRE_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_dragon_fire_exit_condition;
	information = dia_dragon_fire_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dragon_fire_exit_condition()
{
	if(DRAGONTALK_EXIT_FREE == TRUE)
	{
		return TRUE;
	};
};

func void dia_dragon_fire_exit_info()
{
	Npc_RemoveInvItems(other,itmi_innoseye_mis,1);
	CreateInvItems(other,itmi_innoseye_discharged_mis,1);
	AI_Output(self,other,"DIA_Dragon_Fire_Exit_20_00");	//Oko ztratilo svou moc a ty se nedo�k� p��t�ho dne.
	AI_StopProcessInfos(self);
	DRAGONTALK_EXIT_FREE = FALSE;
	self.flags = 0;
	if(DJG_BIFF_STAY == TRUE)
	{
		b_startotherroutine(biff,"Follow");
		DJG_BIFF_STAY = FALSE;
	};
};


instance DIA_DRAGON_FIRE_HELLO(C_INFO)
{
	nr = 1;
	condition = dia_dragon_fire_hello_condition;
	information = dia_dragon_fire_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dragon_fire_hello_condition()
{
	if(Npc_HasItems(other,itmi_innoseye_mis) >= 1)
	{
		return 1;
	};
};

func void dia_dragon_fire_hello_info()
{
	AI_Output(self,other,"DIA_Dragon_Fire_Hello_20_00");	//Prost� nem��u uv��it, �e opravdu je�t� existuj� lid�, kte�� jsou ochotni ob�tovat sv�j �ivot jen proto, aby na vlastn� o�i vid�li draka.
	if(MIS_KILLEDDRAGONS == 0)
	{
		AI_Output(other,self,"DIA_Dragon_Fire_Hello_15_01");	//Jsi docela v��e�n� - na takovou neskladnou obludu.
	};
	AI_Output(other,self,"DIA_Dragon_Fire_Hello_15_02");	//Nep�i�el jsem se obdivovat tv�mu zevn�j�ku. M�m pon�kud radik�ln�j�� �mysly, je mi l�to.
	AI_Output(self,other,"DIA_Dragon_Fire_Hello_20_03");	//Nechce� t�m ��ct, �e se mi hodl� postavit?
	AI_Output(self,other,"DIA_Dragon_Fire_Hello_20_04");	//Ha ha ha. Zlom�m ti ten tv�j huben� kr�ek.
	AI_Output(other,self,"DIA_Dragon_Fire_Hello_15_05");	//Ne tak rychle, p��teli. M�m u sebe Innosovo oko. Nem��e� odolat m� moci. Odpov�z na m� ot�zky, nebo okus� nesnesiteln� muka.
	AI_Output(self,other,"DIA_Dragon_Fire_Hello_20_06");	//c(�ve) Arrgh. Tak se pochlub s t�mi tv�mi ot�zkami, dokud m��e�. Tv� moc nebude m�t dlouh�ho trv�n�.
};


instance DIA_DRAGON_FIRE_WERBISTDU(C_INFO)
{
	nr = 5;
	condition = dia_dragon_fire_werbistdu_condition;
	information = dia_dragon_fire_werbistdu_info;
	description = "Kdo jsi?";
};


func int dia_dragon_fire_werbistdu_condition()
{
	if(Npc_KnowsInfo(other,dia_dragon_fire_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_fire_werbistdu_info()
{
	AI_Output(other,self,"DIA_Dragon_Fire_WerBistDu_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Dragon_Fire_WerBistDu_20_01");	//Jmenuju se Feomathar, a to je v�e, co se o mn� dozv�.
	AI_Output(self,other,"DIA_Dragon_Fire_WerBistDu_20_02");	//Jakmile uniknu ��ink�m kouzla Oka, u�ije� si ��ru po��dn�ho plamene.
};


instance DIA_DRAGON_FIRE_HORT(C_INFO)
{
	nr = 5;
	condition = dia_dragon_fire_hort_condition;
	information = dia_dragon_fire_hort_info;
	description = "Tak kde m� ty sv� poklady?";
};


func int dia_dragon_fire_hort_condition()
{
	if(Npc_KnowsInfo(other,dia_dragon_fire_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_fire_hort_info()
{
	AI_Output(other,self,"DIA_Dragon_Fire_HORT_15_00");	//Ka�d� drak m� skr��, ve kter� schov�v� sv� poklady. Tak�e, kde ta skr�� je?
	AI_Output(self,other,"DIA_Dragon_Fire_HORT_20_01");	//Na m�st�, na kter� se nem��e� dostat, proto�e j� se nakonec zbav�m �et�z� toho Oka.
	AI_Output(self,other,"DIA_Dragon_Fire_HORT_20_02");	//Vzal jsem sv�j poklad nahoru na �hav� �tesy, kter� lze nazvat v�elijak, jenom ne p��stupn�mi neok��dlen�mu �lov��kovi, jako jsi ty.
};

func void b_assigndragontalk_fire(var C_NPC slf)
{
	dia_dragon_fire_exit.npc = Hlp_GetInstanceID(slf);
	dia_dragon_fire_hello.npc = Hlp_GetInstanceID(slf);
	dia_dragon_fire_werbistdu.npc = Hlp_GetInstanceID(slf);
	dia_dragon_fire_hort.npc = Hlp_GetInstanceID(slf);
	b_assigndragontalk_main(slf);
};

