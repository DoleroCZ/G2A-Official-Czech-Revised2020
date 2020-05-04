
instance DIA_AGON_EXIT(C_INFO)
{
	npc = nov_603_agon;
	nr = 999;
	condition = dia_agon_exit_condition;
	information = dia_agon_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_agon_exit_condition()
{
	return TRUE;
};

func void dia_agon_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_AGON_HELLO(C_INFO)
{
	npc = nov_603_agon;
	nr = 2;
	condition = dia_agon_hello_condition;
	information = dia_agon_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_agon_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_SCHNITZELJAGD == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_agon_hello_info()
{
	AI_Output(self,other,"DIA_Agon_Hello_07_00");	//(opovr�liv�) Co chce�?
};


instance DIA_AGON_WURST(C_INFO)
{
	npc = nov_603_agon;
	nr = 2;
	condition = dia_agon_wurst_condition;
	information = dia_agon_wurst_info;
	permanent = FALSE;
	description = "Tum�, m�m tu pro tebe skopovou klob�su.";
};


func int dia_agon_wurst_condition()
{
	if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void dia_agon_wurst_info()
{
	var string novizetext;
	var string novizeleft;
	AI_Output(other,self,"DIA_Agon_Wurst_15_00");	//Tum�, m�m tu pro tebe skopovou klob�su.
	AI_Output(self,other,"DIA_Agon_Wurst_07_01");	//Ov�� klob�sa, ov�� s�r... ov�� ml�ko... u� mi to v�echno leze krkem.
	AI_Output(other,self,"DIA_Agon_Wurst_15_02");	//Tak chce� tu klob�su, nebo ne?
	AI_Output(self,other,"DIA_Agon_Wurst_07_03");	//Ale no tak ho sem dej!
	b_giveinvitems(other,self,itfo_schafswurst,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,itfo_sausage);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,2);
};


instance DIA_AGON_NEW(C_INFO)
{
	npc = nov_603_agon;
	nr = 1;
	condition = dia_agon_new_condition;
	information = dia_agon_new_info;
	permanent = FALSE;
	description = "Jsem tady nov�.";
};


func int dia_agon_new_condition()
{
	if((MIS_SCHNITZELJAGD == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_agon_new_info()
{
	AI_Output(other,self,"DIA_Agon_New_15_00");	//Jsem tady nov�.
	AI_Output(self,other,"DIA_Agon_New_07_01");	//To vid�m.
	AI_Output(self,other,"DIA_Agon_New_07_02");	//Jestli zat�m nem� co na pr�ci, promluv si s Parlanem. On u� ti n�jakou d�.
};


instance DIA_AGON_YOUANDBABO(C_INFO)
{
	npc = nov_603_agon;
	nr = 1;
	condition = dia_agon_youandbabo_condition;
	information = dia_agon_youandbabo_info;
	permanent = FALSE;
	description = "Co se stalo mezi tebou a Babem?";
};


func int dia_agon_youandbabo_condition()
{
	if(Npc_KnowsInfo(other,dia_opolos_monastery) && (MIS_SCHNITZELJAGD == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_agon_youandbabo_info()
{
	AI_Output(other,self,"DIA_Agon_YouAndBabo_15_00");	//Co se stalo mezi tebou a Babem?
	AI_Output(self,other,"DIA_Agon_YouAndBabo_07_01");	//Nem�l bys v��it v�emu, co usly��.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_07_02");	//(ne�stupn�) �ekn�me si jedno: p�jdu svou vlastn� cestou. Tou, kterou mi p�edur�il Innos.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_07_03");	//Nedovol�m nikomu st�t mi v cest�, a ur�it� ne tomu jelim�nkovi Babovi.
	Info_ClearChoices(dia_agon_youandbabo);
	Info_AddChoice(dia_agon_youandbabo,"Nem�li bychom my novicov� dr�et pohromad�?",dia_agon_youandbabo_alltogether);
	Info_AddChoice(dia_agon_youandbabo,"Innos s�m v�, jakou cestou bychom se m�li vydat.",dia_agon_youandbabo_innosway);
	Info_AddChoice(dia_agon_youandbabo,"Vych�z�me spolu docela dob�e.",dia_agon_youandbabo_understand);
};

func void dia_agon_youandbabo_alltogether()
{
	AI_Output(other,self,"DIA_Agon_YouAndBabo_AllTogether_15_00");	//Nem�li bychom my novicov� dr�et pohromad�?
	AI_Output(self,other,"DIA_Agon_YouAndBabo_AllTogether_07_01");	//Vy ostatn� si dr�te pohromad�, jak chcete.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_AllTogether_07_02");	//Ale pros�m, nepl�tvej m�m �asem. (chladn�) A nestav se mi do cesty.
	Info_ClearChoices(dia_agon_youandbabo);
};

func void dia_agon_youandbabo_innosway()
{
	AI_Output(other,self,"DIA_Agon_YouAndBabo_InnosWay_15_00");	//Innos s�m v�, jakou cestou bychom se m�li vydat.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_InnosWay_07_01");	//Moje rodina v�dycky st�la vysoko v Innosov� p��zni a na tom se nic nezm�n�.
	Info_ClearChoices(dia_agon_youandbabo);
};

func void dia_agon_youandbabo_understand()
{
	AI_Output(other,self,"DIA_Agon_YouAndBabo_Understand_15_00");	//Vych�z�me spolu docela dob�e.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_Understand_07_01");	//To douf�m. A� budu m�gem, m��u za tebe ztratit sl�vko.
	Info_ClearChoices(dia_agon_youandbabo);
};


instance DIA_AGON_GETHERB(C_INFO)
{
	npc = nov_603_agon;
	nr = 1;
	condition = dia_agon_getherb_condition;
	information = dia_agon_getherb_info;
	permanent = TRUE;
	description = "Co tady p�stujete?";
};


func int dia_agon_getherb_condition()
{
	if(MIS_SCHNITZELJAGD == FALSE)
	{
		return TRUE;
	};
};

func void dia_agon_getherb_info()
{
	AI_Output(other,self,"DIA_Agon_GetHerb_15_00");	//Co tady p�stujete?
	AI_Output(self,other,"DIA_Agon_GetHerb_07_01");	//Sna��me se vyp�stovat l��iv� byliny, aby mohl mistr Neoras va�it lektvary.
};


instance DIA_AGON_GOLEMDEAD(C_INFO)
{
	npc = nov_603_agon;
	nr = 1;
	condition = dia_agon_golemdead_condition;
	information = dia_agon_golemdead_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_agon_golemdead_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && Npc_IsDead(magic_golem))
	{
		return TRUE;
	};
};

func void dia_agon_golemdead_info()
{
	AI_Output(self,other,"DIA_Agon_GolemDead_07_00");	//(v�t�zn�) Jde� pozd�!
	AI_Output(self,other,"DIA_Agon_GolemDead_07_01");	//Byl jsem tady prvn�! Vyhr�l jsem!
	Info_ClearChoices(dia_agon_golemdead);
	Info_AddChoice(dia_agon_golemdead,"(v�hr��n�) Jenom pokud se odsud dostane� �iv�.",dia_agon_golemdead_noway);
	Info_AddChoice(dia_agon_golemdead,"Dr� hubu!",dia_agon_golemdead_shutup);
	Info_AddChoice(dia_agon_golemdead,"Gratuluji, v�n� sis to zaslou�il.",dia_agon_golemdead_congrat);
};

func void dia_agon_golemdead_noway()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_NoWay_15_00");	//(v�hr��n�) Jenom pokud se odsud dostane� �iv�.
	AI_Output(self,other,"DIA_Agon_GolemDead_NoWay_07_01");	//Chce� m� zab�t? To se ti nikdy nepovede.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_agon_golemdead_shutup()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_ShutUp_15_00");	//Dr� hubu!
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_07_01");	//(v�sm�n�) Nem� n�rok, prohr�l jsi! P�iznej si to.
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_07_02");	//Jenom mn� bylo osudem ur�eno st�t se m�gem.
	Info_ClearChoices(dia_agon_golemdead);
	Info_AddChoice(dia_agon_golemdead,"Osud ti ur�il leda pol�bit mi zadek. Truhla je moje.",dia_agon_golemdead_shutup_mychest);
	Info_AddChoice(dia_agon_golemdead,"Vyhr�l jsi.",dia_agon_golemdead_shutup_youwin);
};

func void dia_agon_golemdead_shutup_mychest()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_ShutUp_MyChest_15_00");	//Osud ti ur�il leda pol�bit mi zadek. Truhla je moje.
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_MyChest_07_01");	//(rozzloben�) Ne, to teda ne, to t� sp� zabiju.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_agon_golemdead_shutup_youwin()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_ShutUp_YouWin_15_00");	//Vyhr�l jsi.
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_YouWin_07_01");	//(zb�sile) Ne, m� neo��l�. Sna�� se m� zbavit.
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_YouWin_07_02");	//To nedopust�m!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_agon_golemdead_congrat()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_Congrat_15_00");	//Gratuluji, v�n� sis to zaslou�il.
	AI_Output(self,other,"DIA_Agon_GolemDead_Congrat_07_01");	//(ned�v��iv�) Co to m� znamenat? Co m� za lubem?
	AI_Output(other,self,"DIA_Agon_GolemDead_Congrat_15_02");	//O �em to mluv�?
	AI_Output(self,other,"DIA_Agon_GolemDead_Congrat_07_03");	//(nerv�zn�) Chce� m� zab�t a nechat si v�echnu sl�vu pro sebe!
	AI_Output(self,other,"DIA_Agon_GolemDead_Congrat_07_04");	//To se ti nikdy nepoda��!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_AGON_GOLEMLIVES(C_INFO)
{
	npc = nov_603_agon;
	nr = 1;
	condition = dia_agon_golemlives_condition;
	information = dia_agon_golemlives_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_agon_golemlives_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (Npc_IsDead(magic_golem) == FALSE))
	{
		return TRUE;
	};
};

func void dia_agon_golemlives_info()
{
	AI_Output(self,other,"DIA_Agon_GolemLives_07_00");	//(p�ekvapen�) Na�el jsi ten �kryt p�ede mnou. To nejde...
	AI_Output(self,other,"DIA_Agon_GolemLives_07_01");	//(odhodlan�) Tak to nem��e z�stat! To nedovol�m.
	AI_Output(self,other,"DIA_Agon_GolemLives_07_02");	//Dokonce nikdy nenajdou tvou mrtvolu.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,0);
};


instance DIA_AGON_PERM(C_INFO)
{
	npc = nov_603_agon;
	nr = 2;
	condition = dia_agon_perm_condition;
	information = dia_agon_perm_info;
	permanent = TRUE;
	description = "Tak jak to jde?";
};


func int dia_agon_perm_condition()
{
	if((KAPITEL >= 3) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_agon_perm_info()
{
	AI_Output(other,self,"DIA_Agon_Perm_15_00");	//Tak jak to jde?
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Agon_Perm_07_01");	//Ach - d�ky za tv�j z�jem, sire paladine. Pr�ce se mi l�b� a jsem si jist, �e brzy budu vybr�n mezi m�gy.
	}
	else
	{
		AI_Output(self,other,"DIA_Agon_Perm_07_02");	//(arogantn�) Tady v Innosov� kl�te�e jsi jenom hostem. M�l by ses tedy podle toho chovat a neru�it m� v m� pr�ci. P�eji hezk� den.
	};
};


instance DIA_AGON_PICKPOCKET(C_INFO)
{
	npc = nov_603_agon;
	nr = 900;
	condition = dia_agon_pickpocket_condition;
	information = dia_agon_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_agon_pickpocket_condition()
{
	return c_beklauen(23,12);
};

func void dia_agon_pickpocket_info()
{
	Info_ClearChoices(dia_agon_pickpocket);
	Info_AddChoice(dia_agon_pickpocket,DIALOG_BACK,dia_agon_pickpocket_back);
	Info_AddChoice(dia_agon_pickpocket,DIALOG_PICKPOCKET,dia_agon_pickpocket_doit);
};

func void dia_agon_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_agon_pickpocket);
};

func void dia_agon_pickpocket_back()
{
	Info_ClearChoices(dia_agon_pickpocket);
};

