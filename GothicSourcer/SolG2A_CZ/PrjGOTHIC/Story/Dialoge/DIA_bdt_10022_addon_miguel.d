
instance DIA_ADDON_MIGUEL_EXIT(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 999;
	condition = dia_addon_miguel_exit_condition;
	information = dia_addon_miguel_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_miguel_exit_condition()
{
	return TRUE;
};

func void dia_addon_miguel_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MIGUEL_PICKPOCKET(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 900;
	condition = dia_addon_miguel_pickpocket_condition;
	information = dia_addon_miguel_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_addon_miguel_pickpocket_condition()
{
	return c_beklauen(40,48);
};

func void dia_addon_miguel_pickpocket_info()
{
	Info_ClearChoices(dia_addon_miguel_pickpocket);
	Info_AddChoice(dia_addon_miguel_pickpocket,DIALOG_BACK,dia_addon_miguel_pickpocket_back);
	Info_AddChoice(dia_addon_miguel_pickpocket,DIALOG_PICKPOCKET,dia_addon_miguel_pickpocket_doit);
};

func void dia_addon_miguel_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_miguel_pickpocket);
};

func void dia_addon_miguel_pickpocket_back()
{
	Info_ClearChoices(dia_addon_miguel_pickpocket);
};


instance DIA_ADDON_MIGUEL_HI(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 1;
	condition = dia_addon_miguel_hi_condition;
	information = dia_addon_miguel_hi_info;
	permanent = FALSE;
	description = "Co tu d�l�?";
};


func int dia_addon_miguel_hi_condition()
{
	return TRUE;
};

func void dia_addon_miguel_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Hi_15_00");	//Co tu d�l�?
	if(Wld_IsTime(6,0,22,0))
	{
		AI_Output(other,self,"DIA_Addon_Miguel_Hi_15_01");	//Hled� n�co?
		AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_02");	//Rostliny - hled�m rostliny.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_03");	//Obvykle hled�m rostliny.
	};
	AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_04");	//V�t�ina z v�c�, kter� zde rostou, mohou b�t k n��emu u�ite�n�.
	AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_05");	//Mnoho rostlin m� l��iv� efekt a tr�va z ba�in se d� kou�it.
	AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_06");	//Pracoval jsem pro alchymistu p�edt�m, ne� m� hodili za bari�ru.
};


instance DIA_ADDON_MIGUEL_STORY(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 2;
	condition = dia_addon_miguel_story_condition;
	information = dia_addon_miguel_story_info;
	permanent = FALSE;
	description = "��m ses provinil?";
};


func int dia_addon_miguel_story_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_miguel_hi))
	{
		return TRUE;
	};
};

func void dia_addon_miguel_story_info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Story_15_00");	//��m ses provinil?
	AI_Output(self,other,"DIA_Addon_Miguel_Story_11_01");	//Experimentoval jsem s lektvary, kter� mohou ovliv�ovat a manipulovat s mysl�.
	AI_Output(self,other,"DIA_Addon_Miguel_Story_11_02");	//Ignaz, m�j mistr, vypil jednou jeden z m�ch experiment� m�sto jeho ve�ern�ho v�na.
	AI_Output(self,other,"DIA_Addon_Miguel_Story_11_03");	//Dob�e, to ho poznamenalo ... trochu nerozumn� �in. A od t� doby je jeho mysl trochu ... Jakoby zaml�en�.
	AI_Output(self,other,"DIA_Addon_Miguel_Story_11_04");	//M�gov� jsou zodpov�dn� za to, �e m� hodili do v�z��sk� kolonie. Pr� za v�zkum "zak�zan�ch v�domost�".
};


instance DIA_ADDON_MIGUEL_LAGER(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 3;
	condition = dia_addon_miguel_lager_condition;
	information = dia_addon_miguel_lager_info;
	permanent = FALSE;
	description = "Co mi m��e� ��ci o t�bo�e?";
};


func int dia_addon_miguel_lager_condition()
{
	return TRUE;
};

func void dia_addon_miguel_lager_info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Lager_15_00");	//Co mi m��e� ��ci o t�bo�e?
	AI_Output(self,other,"DIA_Addon_Miguel_Lager_11_01");	//Ne mnoho. Nikdy jsem tam nebyl.
	AI_Output(self,other,"DIA_Addon_Miguel_Lager_11_02");	//Pouze Ravenovi lid� jsou zde od za��tku. V�ichni ostatn� p�i�li pozd�ji nebo st�le �ekaj� na najmut� nov�ch d�ln�k�. Jako j�.
};


instance DIA_ADDON_MIGUEL_WHEREFROM(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 4;
	condition = dia_addon_miguel_wherefrom_condition;
	information = dia_addon_miguel_wherefrom_info;
	permanent = FALSE;
	description = "Odkud jsi?";
};


func int dia_addon_miguel_wherefrom_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_miguel_hi) || Npc_KnowsInfo(other,dia_addon_miguel_lager))
	{
		return TRUE;
	};
};

func void dia_addon_miguel_wherefrom_info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_WhereFrom_15_00");	//Jak jsi se sem dostal?
	AI_Output(self,other,"DIA_Addon_Miguel_WhereFrom_11_01");	//Dob�e, h�d�m, �e stejn� jako ty. P�es mo�e s pir�ty.
	AI_Output(self,other,"DIA_Addon_Miguel_WhereFrom_11_02");	//�dol� je kompletn� odd�leno od zbytku ostrova. M��e� ho pouze dos�hnout ze strany od mo�e.
	AI_Output(other,self,"DIA_Addon_Miguel_WhereFrom_15_03");	//(v�dom�) P�esn�.
};


instance DIA_ADDON_MIGUEL_ANGEFORDERT(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 4;
	condition = dia_addon_miguel_angefordert_condition;
	information = dia_addon_miguel_angefordert_info;
	permanent = FALSE;
	description = "Kdy obvykle pot�ebuj� nov� pracovn�ky?";
};


func int dia_addon_miguel_angefordert_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_miguel_lager))
	{
		return TRUE;
	};
};

func void dia_addon_miguel_angefordert_info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Angefordert_15_00");	//Kdy obvykle pot�ebuj� nov� pracovn�ky?
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_01");	//O, kdykoliv jim n�kdo chyb�.
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_02");	//N�hradn�k je pot�eba, kdy� je n�kter� z d�ln�k� zabit d�ln�m �ervem.
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_03");	//A n�kdy se chlapi pozab�jej� tak� mezi sebou. Ale nen� to tak zl�, jak to b�valo kdysi.
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_04");	//Raven to z n�jak�ho d�vodu organizuje a star� se o to, aby nikdo nepracoval v dole ve stejnou dobu.
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_05");	//Nev�m, jak to p�esn� funguje. Nikdy jsem tam nebyl.
};


instance DIA_ADDON_MIGUEL_FORTUNO(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 6;
	condition = dia_addon_miguel_fortuno_condition;
	information = dia_addon_miguel_fortuno_info;
	permanent = FALSE;
	description = "O Fortunovi ...";
};


func int dia_addon_miguel_fortuno_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_fortuno_free))
	{
		return TRUE;
	};
};

func void dia_addon_miguel_fortuno_info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Fortuno_15_00");	//Fortuno se zd� "pomaten�". H�dal bych, �e n�jak� lektvar by mu mohl vr�tit pam�.
	AI_Output(self,other,"DIA_Addon_Miguel_Fortuno_11_01");	//Fortuno? To je jeden z Ravenov�ch slu�ebn�k�.
	AI_Output(other,self,"DIA_Addon_Miguel_Fortuno_15_02");	//Dobr�, byl. Nyn� je z n�j troska. A to je Ravenova chyba.
	AI_Output(self,other,"DIA_Addon_Miguel_Fortuno_11_03");	//Raven? Nikdy jsem si o n�m moc nemyslel. Hmm, dobr�. Bohu�el, nemohu nam�chat lektvar zde v ba�in�ch.
	AI_Output(other,self,"DIA_Addon_Miguel_Fortuno_15_04");	//Mohl bych nam�chat lektvar. V t�bo�e je alchymistick� kolona. Pouze kdybych m�l recept ...
	AI_Output(self,other,"DIA_Addon_Miguel_Fortuno_11_05");	//Bu� opatrn�. Nam�chat tento lektvar je nebezpe�n�.
	b_giveinvitems(self,other,itwr_addon_mcelixier_01,1);
	AI_Output(self,other,"DIA_Addon_Miguel_Fortuno_11_06");	//Tento lektvar je smrt�c�, pokud je n�co ud�l�no �patn�. A� u� v ingredienc�ch nebo v procesu.
	AI_Output(other,self,"DIA_Addon_Miguel_Fortuno_15_07");	//Budu opatrn�.
	b_logentry(TOPIC_ADDON_FORTUNO,"Miguel mi dal recept na lektvarm tak m��u pomoci Fortunovi znovu z�skat pam�. M�l bych nam�chat lektvar pouze pokud budu m�t pln� v�domosti s v�emi ingrediencemi. Jinak by mohl b�t smrteln�.");
};


instance DIA_ADDON_MIGUEL_BRAU(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 7;
	condition = dia_addon_miguel_brau_condition;
	information = dia_addon_miguel_brau_info;
	permanent = FALSE;
	description = "Co m� d�l m��e� nau�it?";
};


func int dia_addon_miguel_brau_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_miguel_story))
	{
		return TRUE;
	};
};

func void dia_addon_miguel_brau_info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_BRAU_15_00");	//Co m� d�l m��e� nau�it?
	AI_Output(self,other,"DIA_Addon_Miguel_BRAU_11_01");	//Nic. P�i�el jsem zde, abych si vyd�lal n�jak� pen�ze. Vyd�l�v�m si prod�v�n�m rostlin dokud m� nepust� do t�bora.
	AI_Output(self,other,"DIA_Addon_Miguel_BRAU_11_02");	//Nicm�n�, mohu ti poskytnout n�kolik lektvar�, jestli pot�ebuje�.
	Log_CreateTopic(TOPIC_ADDON_BDT_TRADER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_BDT_TRADER,"U Miguela si mohu kupovat rostliny a lektvary");
};


instance DIA_ADDON_MIGUEL_TRADE(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 888;
	condition = dia_addon_miguel_trade_condition;
	information = dia_addon_miguel_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE;
};


func int dia_addon_miguel_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_miguel_brau))
	{
		return TRUE;
	};
};

func void dia_addon_miguel_trade_info()
{
	b_say(other,self,"$TRADE_1");
	b_givetradeinv(self);
};

