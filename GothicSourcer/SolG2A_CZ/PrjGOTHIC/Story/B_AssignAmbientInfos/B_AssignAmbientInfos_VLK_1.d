
instance DIA_VLK_1_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_vlk_1_exit_condition;
	information = dia_vlk_1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vlk_1_exit_condition()
{
	return TRUE;
};

func void dia_vlk_1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_1_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_vlk_1_join_condition;
	information = dia_vlk_1_join_info;
	permanent = TRUE;
	description = "Jak se mùžu stát obèanem mìsta?";
};


func int dia_vlk_1_join_condition()
{
	if((hero.guild == GIL_NONE) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_vlk_1_join_info()
{
	AI_Output(other,self,"DIA_VLK_1_JOIN_15_00");	//Jak se mùžu stát obèanem mìsta?
	AI_Output(self,other,"DIA_VLK_1_JOIN_01_01");	//Najdi si slušnou práci! Každý, kdo je v Khorinisu zamìstnán, je považován za obèana mìsta.
};


instance DIA_VLK_1_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_vlk_1_people_condition;
	information = dia_vlk_1_people_info;
	permanent = TRUE;
	description = "Kdo tady zastává dùležité funkce?";
};


func int dia_vlk_1_people_condition()
{
	return TRUE;
};

func void dia_vlk_1_people_info()
{
	AI_Output(other,self,"DIA_VLK_1_PEOPLE_15_00");	//Kdo tady zastává dùležité funkce?
	AI_Output(self,other,"DIA_VLK_1_PEOPLE_01_01");	//(smích) Až donedávna to byl místodržící a soudce. Ale pak pøijeli paladinové a pøevzali nad mìstem moc.
	AI_Output(self,other,"DIA_VLK_1_PEOPLE_01_02");	//Jejich velitelem je lord Hagen. Je také novým místodržícím, více ménì.
	AI_Output(self,other,"DIA_VLK_1_PEOPLE_01_03");	//Lord Andre je jeho pravou rukou. Velí mìstské stráži a také zastává roli soudce.
	AI_Output(self,other,"DIA_VLK_1_PEOPLE_01_04");	//Každý, kdo se ve mìstì nìèím proviní, se zodpovídá pøímo jemu.
};


instance DIA_VLK_1_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_vlk_1_location_condition;
	information = dia_vlk_1_location_info;
	permanent = TRUE;
	description = "Co je ve mìstì zajímavého?";
};


func int dia_vlk_1_location_condition()
{
	return TRUE;
};

func void dia_vlk_1_location_info()
{
	AI_Output(other,self,"DIA_VLK_1_LOCATION_15_00");	//Co je ve mìstì zajímavého?
	AI_Output(self,other,"DIA_VLK_1_LOCATION_01_01");	//Mùžeš tu koupit témìø vše, na co si vzpomeneš. Buï od obchodníkù na tržišti, nebo v dolní èásti mìsta.
	AI_Output(self,other,"DIA_VLK_1_LOCATION_01_02");	//Ale taky skoro všechno, co si mùžeš koupit, nìco stojí.
	AI_Output(self,other,"DIA_VLK_1_LOCATION_01_03");	//Pokud nemáš dost penìz, mùže ti pomoct lichváø Lehmar. Pokud pùjdeš k dokùm z dolní èásti mìsta, narazíš na jeho dùm hned u vstupu do pøístavní ètvrti.
};


instance DIA_VLK_1_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_vlk_1_standard_condition;
	information = dia_vlk_1_standard_info;
	permanent = TRUE;
	description = "Co je nového?";
};


func int dia_vlk_1_standard_condition()
{
	return TRUE;
};

func void dia_vlk_1_standard_info()
{
	AI_Output(other,self,"DIA_VLK_1_STANDARD_15_00");	//Co je nového?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_VLK_1_STANDARD_01_01");	//Od té doby, co bariéra vzala za své, se náhle pøerušil obchod s velkými farmáøi. Kdo ví, co mají za lubem.  Chystá se nìjaká levárna.
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_VLK_1_STANDARD_01_02");	//Onar zašel moc daleko. Poøád odmítá zásobovat mìsto. Jestli domobrana brzy nezasáhne, zaènou si i ostatní farmy dìlat, co se jim zlíbí.
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_VLK_1_STANDARD_01_03");	//Slyšel jsem, že se žoldnéøi spojili s mágy. Mocnými temnými mágy v èerných róbách. Pøísahal bych, že jsem jednoho z nich minulou noc zahlédl ve mìstì.
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_VLK_1_STANDARD_01_04");	//Slyšel jsem, že se nìkteøí z Onarových žoldnéøù vydali zabít draky. Koneènì zaèali dìlat nìco užiteèného!
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_VLK_1_STANDARD_01_05");	//Øíká se, že draci byli poraženi! Lord Hagen shromažïuje své muže, aby v Hornickém údolí skoncovali i se zbývajícími nestvùrami.
	};
};

func void b_assignambientinfos_vlk_1(var C_NPC slf)
{
	dia_vlk_1_exit.npc = Hlp_GetInstanceID(slf);
	dia_vlk_1_join.npc = Hlp_GetInstanceID(slf);
	dia_vlk_1_people.npc = Hlp_GetInstanceID(slf);
	dia_vlk_1_location.npc = Hlp_GetInstanceID(slf);
	dia_vlk_1_standard.npc = Hlp_GetInstanceID(slf);
};

