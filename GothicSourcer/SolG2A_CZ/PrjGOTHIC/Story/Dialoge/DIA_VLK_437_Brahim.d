
var int brahim_showedmaps;

func void b_brahimnewmaps()
{
	if(BRAHIM_SHOWEDMAPS == TRUE)
	{
		AI_Output(self,other,"B_BrahimNewMaps_07_00");	//Vra� se pozd�ji, ur�it� pro tebe pak budu n�co m�t.
	};
};


instance DIA_BRAHIM_EXIT(C_INFO)
{
	npc = vlk_437_brahim;
	nr = 999;
	condition = dia_brahim_exit_condition;
	information = dia_brahim_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_brahim_exit_condition()
{
	if(KAPITEL <= 2)
	{
		return TRUE;
	};
};

func void dia_brahim_exit_info()
{
	b_brahimnewmaps();
	AI_StopProcessInfos(self);
};


instance DIA_BRAHIM_PICKPOCKET(C_INFO)
{
	npc = vlk_437_brahim;
	nr = 900;
	condition = dia_brahim_pickpocket_condition;
	information = dia_brahim_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_brahim_pickpocket_condition()
{
	return c_beklauen(15,15);
};

func void dia_brahim_pickpocket_info()
{
	Info_ClearChoices(dia_brahim_pickpocket);
	Info_AddChoice(dia_brahim_pickpocket,DIALOG_BACK,dia_brahim_pickpocket_back);
	Info_AddChoice(dia_brahim_pickpocket,DIALOG_PICKPOCKET,dia_brahim_pickpocket_doit);
};

func void dia_brahim_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_brahim_pickpocket);
};

func void dia_brahim_pickpocket_back()
{
	Info_ClearChoices(dia_brahim_pickpocket);
};


instance DIA_BRAHIM_GREET(C_INFO)
{
	npc = vlk_437_brahim;
	nr = 2;
	condition = dia_brahim_greet_condition;
	information = dia_brahim_greet_info;
	permanent = FALSE;
	description = "Co tady d�l�?";
};


func int dia_brahim_greet_condition()
{
	return TRUE;
};

func void dia_brahim_greet_info()
{
	AI_Output(other,self,"DIA_Brahim_GREET_15_00");	//Co tady d�l�?
	AI_Output(self,other,"DIA_Brahim_GREET_07_01");	//Jmenuji se Brahim. Kresl�m mapy a pak je prod�v�m.
	AI_Output(self,other,"DIA_Brahim_GREET_07_02");	//Tys tu nov�, a tak by se ti n�jak� mapa m�sta jist� hodila.
	AI_Output(self,other,"DIA_Brahim_GREET_07_03");	//Je pom�rn� levn� a bude se ti dost hodit, dokud se tu �pln� nezorientuje�.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Brahim kresl� a prod�v� mapy. S�dl� pobl� p��stavu.");
};


instance DIA_ADDON_BRAHIM_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_437_brahim;
	nr = 5;
	condition = dia_addon_brahim_missingpeople_condition;
	information = dia_addon_brahim_missingpeople_info;
	description = "Je to pravda, �e obyvatel� tohohle m�sta mizej� bez jak�koli stopy?";
};


func int dia_addon_brahim_missingpeople_condition()
{
	if((SC_HEAREDABOUTMISSINGPEOPLE == TRUE) && (ENTERED_ADDONWORLD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_brahim_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Brahim_MissingPeople_15_00");	//Je to pravda, �e obyvatel� tohohle m�sta mizej� bez jak�koli stopy?
	AI_Output(self,other,"DIA_Addon_Brahim_MissingPeople_07_01");	//Hej, taky sem o tom sly�el. Bohu�el, nem��u ��ct, jestli jsou ty p��behy pravdiv�.
	AI_Output(self,other,"DIA_Addon_Brahim_MissingPeople_07_02");	//Jen se koukni okolo. Tohle skute�n� nen� m�sto kde bys chtel ��t nav�dy, co?
	AI_Output(self,other,"DIA_Addon_Brahim_MissingPeople_07_03");	//��den div, �e lid� odch�zej�.
};


instance DIA_BRAHIM_BUY(C_INFO)
{
	npc = vlk_437_brahim;
	nr = 9;
	condition = dia_brahim_buy_condition;
	information = dia_brahim_buy_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Uka� mi sv� mapy.";
};


func int dia_brahim_buy_condition()
{
	if(Npc_KnowsInfo(hero,dia_brahim_greet))
	{
		return TRUE;
	};
};

func void dia_brahim_buy_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Brahim_BUY_15_00");	//Uka� mi sv� mapy.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Brahim_BUY_07_01");	//Lep�� nenajde� ani v tom sv�m kl�te�e.
	};
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Brahim_BUY_07_02");	//Dobr� mapy jsou d�le�it�, zvl�t� pro ty, kdo p�ich�zej� z pevniny, mist�e paladine.
	};
	BRAHIM_SHOWEDMAPS = TRUE;
};


instance DIA_BRAHIM_KAP3_EXIT(C_INFO)
{
	npc = vlk_437_brahim;
	nr = 999;
	condition = dia_brahim_kap3_exit_condition;
	information = dia_brahim_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_brahim_kap3_exit_condition()
{
	if((KAPITEL >= 3) && (Npc_KnowsInfo(other,dia_brahim_kap3_first_exit) || (Npc_HasItems(other,itwr_shatteredgolem_mis) == 0)))
	{
		return TRUE;
	};
};

func void dia_brahim_kap3_exit_info()
{
	if(KAPITEL <= 4)
	{
		b_brahimnewmaps();
	};
	AI_StopProcessInfos(self);
};


instance DIA_BRAHIM_KAP3_FIRST_EXIT(C_INFO)
{
	npc = vlk_437_brahim;
	nr = 999;
	condition = dia_brahim_kap3_first_exit_condition;
	information = dia_brahim_kap3_first_exit_info;
	permanent = FALSE;
	description = DIALOG_ENDE;
};


func int dia_brahim_kap3_first_exit_condition()
{
	if((KAPITEL >= 3) && (Npc_HasItems(other,itwr_shatteredgolem_mis) >= 1))
	{
		return TRUE;
	};
};

func void dia_brahim_kap3_first_exit_info()
{
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_07_00");	//J� v�d�l, �e t� tenhle kousek bude zaj�mat.
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_15_01");	//Jak� kousek?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_07_02");	//No, ta star� mapa, kterou sis pr�v� koupil.
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_07_03");	//Zn�m takov�, jako jsi ty. Neprop�snete jedinou �anci, jak p�ij�t k bohatstv�.
	Info_ClearChoices(dia_brahim_kap3_first_exit);
	Info_AddChoice(dia_brahim_kap3_first_exit,DIALOG_BACK,dia_brahim_kap3_first_exit_back);
	Info_AddChoice(dia_brahim_kap3_first_exit,"Jak jsi z�skal tenhle dokument?",dia_brahim_kap3_first_exit_wheregetit);
	Info_AddChoice(dia_brahim_kap3_first_exit,"Co je to za dokument?",dia_brahim_kap3_first_exit_content);
	Info_AddChoice(dia_brahim_kap3_first_exit,"Pro� si ji nenech� s�m?",dia_brahim_kap3_first_exit_keepit);
};

func void dia_brahim_kap3_first_exit_back()
{
	Info_ClearChoices(dia_brahim_kap3_first_exit);
};

func void dia_brahim_kap3_first_exit_wheregetit()
{
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_15_00");	//Kde jsi z�skal tuhle mapu?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_07_01");	//No, na�el jsem ji ve �tosu star�ch map, kter� jsem ned�vno koupil.
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_07_02");	//Ten, kdo ji prod�val, ji musel p�ehl�dnout.
};

func void dia_brahim_kap3_first_exit_content()
{
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_Content_15_00");	//Co je to za mapu?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_Content_07_01");	//Vypad� to jako n�jak� mapa k pokladu.
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_Content_07_02");	//Ty mi ale p�ipad� jako n�kdo, kdo by n��emu takov�mu mohl p�ij�t na kloub.
};

func void dia_brahim_kap3_first_exit_keepit()
{
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_KeepIt_15_00");	//Pro� si ji nenech� s�m?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_KeepIt_07_01");	//Jsem u� star� a �asy, kdy jsem vyr�el na v�pravy, u� jsou d�vno pry�.
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_KeepIt_07_02");	//Te� u� to nech�v�m na mlad��ch.
};

