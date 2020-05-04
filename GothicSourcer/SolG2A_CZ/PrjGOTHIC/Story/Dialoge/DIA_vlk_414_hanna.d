
instance DIA_HANNA_EXIT(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 999;
	condition = dia_hanna_exit_condition;
	information = dia_hanna_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hanna_exit_condition()
{
	if(KAPITEL <= 2)
	{
		return TRUE;
	};
};

func void dia_hanna_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HANNA_HELLO(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 1;
	condition = dia_hanna_hello_condition;
	information = dia_hanna_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hanna_hello_condition()
{
	return TRUE;
};

func void dia_hanna_hello_info()
{
	AI_Output(self,other,"DIA_Hanna_Hello_17_00");	//�, z�kazn�k - ��mpak poslou��m?
};


instance DIA_HANNA_ROOM(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 2;
	condition = dia_hanna_room_condition;
	information = dia_hanna_room_info;
	permanent = FALSE;
	description = "Hled�m pokoj.";
};


func int dia_hanna_room_condition()
{
	return TRUE;
};

func void dia_hanna_room_info()
{
	AI_Output(other,self,"DIA_Hanna_Room_15_00");	//Hled�m pokoj.
	AI_Output(self,other,"DIA_Hanna_Room_17_01");	//Tak to jsi na spr�vn�m m�st�.
	if(Npc_KnowsInfo(other,dia_lothar_schlafen))
	{
		AI_Output(other,self,"DIA_Hanna_Add_15_03");	//Jeden z paladin� mi nazna�il, �e bych tu mohl p�espat i zadarmo.
	}
	else
	{
		AI_Output(other,self,"DIA_Hanna_Add_15_00");	//Kolik stoj� noc?
		AI_Output(self,other,"DIA_Hanna_Add_17_01");	//V�bec nic.
		AI_Output(self,other,"DIA_Hanna_Add_17_02");	//Ubytov�n� poutn�k� jde na ��et paladin�m.
		AI_Output(other,self,"DIA_Hanna_Add_15_04");	//Tak�e tu m��u z�stat zadarmo?
	};
	AI_Output(self,other,"DIA_Hanna_Add_17_05");	//Ano, ano.
	AI_Output(self,other,"DIA_Hanna_Add_17_06");	//Prost� vyjdi po schodech nahoru.
	AI_Output(self,other,"DIA_Hanna_Add_17_07");	//Je�t� tam m�me dv� postele voln�.
};


instance DIA_HANNA_WHYPAY(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 3;
	condition = dia_hanna_whypay_condition;
	information = dia_hanna_whypay_info;
	permanent = FALSE;
	description = "Pro� paladinov� za v�echno plat�?";
};


func int dia_hanna_whypay_condition()
{
	if(Npc_KnowsInfo(other,dia_hanna_room))
	{
		return TRUE;
	};
};

func void dia_hanna_whypay_info()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_12");	//Pro� paladinov� za v�echno plat�?
	AI_Output(self,other,"DIA_Hanna_Add_17_13");	//Nev�m, ale nejsp� v tom bude v�c v�c� najednou.
	AI_Output(self,other,"DIA_Hanna_Add_17_14");	//Jednak cht�j�, aby se po ulici netoulala ��dn� pochybn� sebranka a zbyte�n� tu ned�lala bordel.
	AI_Output(self,other,"DIA_Hanna_Add_17_15");	//A taky si mo�n� cht�j� na svou stranu naklonit potuln� kupce.
	AI_Output(self,other,"DIA_Hanna_Add_17_16");	//Te�, kdy� se sedl�ci bou��, je na�e z�sobov�n� z�visl� hlavn� na obchodn�c�ch.
	AI_Output(self,other,"DIA_Hanna_Add_17_17");	//A krom� toho bych �ekla, �e taky cht�j� ve m�st� trochu pozvednout mor�lku.
	AI_Output(self,other,"DIA_Hanna_Add_17_18");	//Lord Andre dokonce na��dil, aby v �ibeni�n� uli�ce nal�vali jedno pivo zdarma.
};


instance DIA_HANNA_WERHIER(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 4;
	condition = dia_hanna_werhier_condition;
	information = dia_hanna_werhier_info;
	permanent = TRUE;
	description = "Kdo tady zrovna je?";
};


func int dia_hanna_werhier_condition()
{
	if(Npc_KnowsInfo(other,dia_hanna_room))
	{
		return TRUE;
	};
};

func void dia_hanna_werhier_info()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_08");	//Kdo tady zrovna je?
	AI_Output(self,other,"DIA_Hanna_Add_17_09");	//Skoro v�echno jsou potuln� trhovci.
	AI_Output(other,self,"DIA_Hanna_Add_15_10");	//Aha.
	AI_Output(self,other,"DIA_Hanna_Add_17_11");	//A� t� ani nenapadne, �e bys jim �el "zkontrolovat" zbo��! Nechci tu m�t ��dn� nep��jemnosti!
};


instance DIA_HANNA_CITY(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 5;
	condition = dia_hanna_city_condition;
	information = dia_hanna_city_info;
	permanent = TRUE;
	description = "M�l bych p�r ot�zek ohledn� m�sta...";
};


func int dia_hanna_city_condition()
{
	return TRUE;
};

func void dia_hanna_city_info()
{
	AI_Output(other,self,"DIA_Hanna_City_15_00");	//M�l bych p�r ot�zek ohledn� m�sta...
	Info_ClearChoices(dia_hanna_city);
	Info_AddChoice(dia_hanna_city,DIALOG_BACK,dia_hanna_city_back);
	Info_AddChoice(dia_hanna_city,"Kde bych si tu mohl n�co nakoupit?",dia_hanna_city_buy);
	Info_AddChoice(dia_hanna_city,"Pov�z mi n�co o m�st�.",dia_hanna_city_city);
};

func void dia_hanna_city_back()
{
	Info_ClearChoices(dia_hanna_city);
};

func void dia_hanna_city_buy()
{
	AI_Output(other,self,"DIA_Hanna_City_Buy_15_00");	//Kde bych si tu mohl n�co nakoupit?
	AI_Output(self,other,"DIA_Hanna_City_Buy_17_01");	//P��mo naproti dve��m je tr�i�t�, tam bys m�l naj�t v�echno, co pot�ebuje�.
	AI_Output(self,other,"DIA_Hanna_City_Buy_17_02");	//Na druh� stran� m�sta najde� p�r �emeslnick�ch kr�mk�. V�t�ina z nich le�� pobl� druh� m�stsk� br�ny.
	AI_Output(self,other,"DIA_Hanna_City_Buy_17_03");	//V p��stavu tak� m��e� zaj�t k ryb��i. Jeho obchod se nach�z� p��mo v p��stavu, najde� to snadno.
};

func void dia_hanna_city_city()
{
	AI_Output(other,self,"DIA_Hanna_City_City_15_00");	//Pov�z mi n�co o m�st�.
	AI_Output(self,other,"DIA_Hanna_City_City_17_01");	//Khorinis je jedn�m z nejbohat��ch m�st v kr�lovstv�, i kdy� te� to tak nevypad�.
	AI_Output(self,other,"DIA_Hanna_City_City_17_02");	//Ale od t� doby, co za�aly ty probl�my se sk�ety, se obchod t�m�� zastavil. Kr�l toti� naverboval do arm�dy celou kupeckou flotilu.
	AI_Output(self,other,"DIA_Hanna_City_City_17_03");	//To znamen�, �e do p��stavu te� ��dn� lodi nepluj� a z�soby zbo�� se rapidn� ten��. Spousta zdej��ch obyvatel se proto boj�, co bude d�l.
	AI_Output(self,other,"DIA_Hanna_City_City_17_04");	//Nikdo nev� p�esn�, co n�m budoucnost p�inese. Vlastn� nem��eme d�lat nic jin�ho, ne� tu sed�t a �ekat, co se stane. Nezd� se, �e bychom mohli n�co zm�nit.
};


instance DIA_HANNA_KAP3_EXIT(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 999;
	condition = dia_hanna_kap3_exit_condition;
	information = dia_hanna_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hanna_kap3_exit_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_hanna_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


var int hanna_priceforletter;

instance DIA_HANNA_ANYNEWS(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 31;
	condition = dia_hanna_anynews_condition;
	information = dia_hanna_anynews_info;
	permanent = FALSE;
	description = "Jak se vede?";
};


func int dia_hanna_anynews_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_hanna_anynews_info()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_15_00");	//Jak se vede?
	AI_Output(self,other,"DIA_Hanna_AnyNews_17_01");	//Nevypad�, �e by t� probl�my druh�ch lid� n�jak zvl᚝ zaj�maly.
	Info_ClearChoices(dia_hanna_anynews);
	Info_AddChoice(dia_hanna_anynews,"Ano, jist�, samoz�ejm�.",dia_hanna_anynews_yes);
	Info_AddChoice(dia_hanna_anynews,"P�ijde na to.",dia_hanna_anynews_depends);
	Info_AddChoice(dia_hanna_anynews,"Vlastn� ne.",dia_hanna_anynews_no);
};

func void dia_hanna_anynews_no()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_No_15_00");	//Vlastn� ne.
	AI_Output(self,other,"DIA_Hanna_AnyNews_No_17_01");	//P�esn� jak ��k�m. Nikdo tu nemysl� na nic jin�ho, ne� jenom na sebe. Tak�e co chce�?
	MIS_HANNARETRIEVELETTER = LOG_FAILED;
	Info_ClearChoices(dia_hanna_anynews);
};

func void dia_hanna_anynews_depends()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Depends_15_00");	//P�ijde na to.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Depends_17_01");	//To jako �e p�ijde na to, co ti z toho k�pne.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Depends_17_02");	//Takov� jako ty tu nem��u vyst�t.
	MIS_HANNARETRIEVELETTER = LOG_FAILED;
	Info_ClearChoices(dia_hanna_anynews);
};

func void dia_hanna_anynews_yes()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_15_00");	//Ano, jist�, samoz�ejm�.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_17_01");	//Co ty v�, sv�t je pln� p�ekvapen�. Ned�vno jsem d�lala po��dek ve zbo�� a p�i t� p��le�itosti jsem prodala �t�sek map Brahimovi, kartografovi dole v p��stavu.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_17_02");	//Bohu�el jsem ale vz�p�t� zjistila, �e mi chyb� jeden dokument.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_17_03");	//Po��t�m, �e se musel n�jak p�imotat mezi ty pap�ry.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_17_04");	//Nemohl bys mi ho p�in�st zp�tky?
	MIS_HANNARETRIEVELETTER = LOG_RUNNING;
	Log_CreateTopic(TOPIC_HANNARETRIEVELETTER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HANNARETRIEVELETTER,LOG_RUNNING);
	b_logentry(TOPIC_HANNARETRIEVELETTER,"Hann� se ztratil n�jak� dokument. Nejsp� j� zmizel v p��stavu - tam, kde s�dl� kartograf Brahim.");
	Info_ClearChoices(dia_hanna_anynews);
	Info_AddChoice(dia_hanna_anynews,"Nejsem ��dn� posl��ek.",dia_hanna_anynews_yes_footboy);
	Info_AddChoice(dia_hanna_anynews,"Co z toho budu m�t?",dia_hanna_anynews_yes_reward);
	Info_AddChoice(dia_hanna_anynews,"Uvid�m, co se d� d�lat.",dia_hanna_anynews_yes_willsee);
};

func void dia_hanna_anynews_yes_footboy()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Footboy_15_00");	//Nejsem ��dn� posl��ek.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Footboy_17_01");	//Ch�pu - probl�my oby�ejn� �eny ti nestoj� za n�mahu. No dob�e, tak se o to budu muset postarat sama.
	Info_ClearChoices(dia_hanna_anynews);
};

func void dia_hanna_anynews_yes_reward()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Reward_15_00");	//Co z toho budu m�t?
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_17_01");	//Aha, j� to v�d�la - nejsi o nic lep�� ne� ta l�za dole v p��stavu.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_17_02");	//Tak�e co chce� po uboh� �en�?
	Info_ClearChoices(dia_hanna_anynews);
	Info_AddChoice(dia_hanna_anynews,"To nic.",dia_hanna_anynews_yes_reward_ok);
	Info_AddChoice(dia_hanna_anynews,"Taky bys ke mn� mohla b�t trochu vl�dn�j��.",dia_hanna_anynews_yes_reward_benice);
	Info_AddChoice(dia_hanna_anynews,"Zlato.",dia_hanna_anynews_yes_reward_gold);
};

func void dia_hanna_anynews_yes_reward_ok()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Reward_OK_15_00");	//To nic.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_OK_17_01");	//Aspo� �e v tob� zbyla trocha slu�nosti. Kdy� mi ten dokument p�inese�, dostane� ode m� 75 zla��k�.
	HANNA_PRICEFORLETTER = 75;
	Info_ClearChoices(dia_hanna_anynews);
};

func void dia_hanna_anynews_yes_reward_benice()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_15_00");	//Taky bys ke mn� mohla b�t trochu vl�dn�j��.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_17_01");	//To je ale hnusn�! J�... zmiz odsud! Ty nevychovan� hulv�te!
	MIS_HANNARETRIEVELETTER = LOG_FAILED;
	AI_StopProcessInfos(self);
};

func void dia_hanna_anynews_yes_reward_gold()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Reward_Gold_15_00");	//Zlato.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_01");	//Nem��u ti nab�dnout v�c ne� mrzk� pen�z. No - cen�m si to na 50 zla��k�.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_02");	//Jestli se ti poda�� ten dokument z�skat zp�tky, d�m ti 50 zla��k�.
	HANNA_PRICEFORLETTER = 50;
	Info_ClearChoices(dia_hanna_anynews);
};

func void dia_hanna_anynews_yes_willsee()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_WillSee_15_00");	//Uvid�m, co se d� d�lat.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_01");	//To je od tebe mil�! Hodn� �t�st�!
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_02");	//Kdy� mi ten dokument p�inese� zp�tky, odm�n�m se ti.
	HANNA_PRICEFORLETTER = 200;
	Info_ClearChoices(dia_hanna_anynews);
};


instance DIA_HANNA_THISLETTER(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 31;
	condition = dia_hanna_thisletter_condition;
	information = dia_hanna_thisletter_info;
	permanent = FALSE;
	description = "Myslelas tenhle dokument?";
};


func int dia_hanna_thisletter_condition()
{
	if((MIS_HANNARETRIEVELETTER == LOG_RUNNING) && (Npc_HasItems(other,itwr_shatteredgolem_mis) >= 1))
	{
		return TRUE;
	};
};

func void dia_hanna_thisletter_info()
{
	AI_Output(other,self,"DIA_Hanna_ThisLetter_15_00");	//Myslelas tenhle dokument?
	AI_Output(self,other,"DIA_Hanna_ThisLetter_17_01");	//Ano, to je p�esn� ono. D�kuji ti.
	AI_Output(other,self,"DIA_Hanna_ThisLetter_15_02");	//A co m� odm�na?
	AI_Output(self,other,"DIA_Hanna_ThisLetter_17_03");	//Ne tak zhurta. Tady m� pen�ze.
	CreateInvItems(self,itmi_gold,HANNA_PRICEFORLETTER);
	b_giveinvitems(self,other,itmi_gold,HANNA_PRICEFORLETTER);
	MIS_HANNARETRIEVELETTER = LOG_SUCCESS;
	b_giveplayerxp(XP_HANNARETRIEVELETTER);
};


instance DIA_HANNA_PICKPOCKET(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 900;
	condition = dia_hanna_pickpocket_condition;
	information = dia_hanna_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60_FEMALE;
};


func int dia_hanna_pickpocket_condition()
{
	return c_beklauen(45,25);
};

func void dia_hanna_pickpocket_info()
{
	Info_ClearChoices(dia_hanna_pickpocket);
	Info_AddChoice(dia_hanna_pickpocket,DIALOG_BACK,dia_hanna_pickpocket_back);
	Info_AddChoice(dia_hanna_pickpocket,DIALOG_PICKPOCKET,dia_hanna_pickpocket_doit);
};

func void dia_hanna_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_hanna_pickpocket);
};

func void dia_hanna_pickpocket_back()
{
	Info_ClearChoices(dia_hanna_pickpocket);
};


instance DIA_HANNA_AUSKELLER(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 11;
	condition = dia_hanna_auskeller_condition;
	information = dia_hanna_auskeller_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hanna_auskeller_condition()
{
	if(Npc_HasItems(other,itke_thiefguildkey_hotel_mis) >= 1)
	{
		return TRUE;
	};
};

func void dia_hanna_auskeller_info()
{
	if((cassia.aivar[AIV_KILLEDBYPLAYER] == TRUE) || (jesper.aivar[AIV_KILLEDBYPLAYER] == TRUE) || (ramirez.aivar[AIV_KILLEDBYPLAYER] == TRUE))
	{
		AI_Output(self,other,"DIA_Hanna_Add_17_27");	//Odkud... jsi to p�i�el?
		AI_Output(other,self,"DIA_Hanna_Add_15_28");	//U tebe ve sklep� jsem na�el cosi velmi zaj�mav�ho.
		AI_Output(self,other,"DIA_Hanna_Add_17_29");	//A co jsi d�lal u m� ve sklep�?
		AI_Output(other,self,"DIA_Hanna_Add_15_30");	//To v� zatracen� dob�e!
		AI_Output(self,other,"DIA_Hanna_Add_17_31");	//(chladn�) Nem�m pon�t�, o �em to mluv�.
	}
	else
	{
		AI_Output(self,other,"DIA_Hanna_Add_17_19");	//(ned�v��iv�) Jen se na sebe pod�vej! Odkud jsi to p�i�el, co?
		AI_Output(other,self,"DIA_Hanna_Add_15_20");	//(rozpa�it�) J�...
		AI_Output(self,other,"DIA_Hanna_Add_17_21");	//(usm�je se) J� v�m!
		AI_Output(self,other,"DIA_Hanna_Add_17_22");	//(spiklenecky) Nemus� mi nic ��kat - v�m v�echno.
		AI_Output(self,other,"DIA_Hanna_Add_17_23");	//A� t� ani nenapadne n�co tady ukr�st, jasn�?
		AI_Output(self,other,"DIA_Hanna_Add_17_24");	//U� se nem��eme hotelu d�le v�novat.
	};
	AI_StopProcessInfos(self);
};


instance DIA_HANNA_SCHULDENBUCH(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 1;
	condition = dia_hanna_schuldenbuch_condition;
	information = dia_hanna_schuldenbuch_info;
	permanent = FALSE;
	description = "Pod�vej, jakou knihu tu m�m!";
};


func int dia_hanna_schuldenbuch_condition()
{
	if(Npc_HasItems(other,itwr_schuldenbuch) >= 1)
	{
		return TRUE;
	};
};

func void dia_hanna_schuldenbuch_info()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_41");	//Pod�vej, jakou knihu tu m�m!
	AI_Output(self,other,"DIA_Hanna_Add_17_42");	//Lehmarova ��etn� kniha. Jak jsi k n� p�i�el?
	AI_Output(other,self,"DIA_Hanna_Add_15_43");	//No...
	AI_Output(self,other,"DIA_Hanna_Add_17_44");	//Pokud u� ji Lehmar nem�, je to dobr� v�c. Stejn� bych ji ale rad�i ukryl u sebe.
};


instance DIA_HANNA_GIVESCHULDENBUCH(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 1;
	condition = dia_hanna_giveschuldenbuch_condition;
	information = dia_hanna_giveschuldenbuch_info;
	permanent = FALSE;
	description = "Tum� - klidn� si tu knihu vezmi.";
};


func int dia_hanna_giveschuldenbuch_condition()
{
	if(Npc_KnowsInfo(other,dia_hanna_schuldenbuch) && (Npc_HasItems(other,itwr_schuldenbuch) >= 1))
	{
		return TRUE;
	};
};

func void dia_hanna_giveschuldenbuch_info()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_45");	//Tum� - klidn� si tu knihu vezmi.
	b_giveinvitems(other,self,itwr_schuldenbuch,1);
	AI_Output(self,other,"DIA_Hanna_Add_17_46");	//D�ky.
	AI_Output(self,other,"DIA_Hanna_Add_17_47");	//Tady m� n�co za odm�nu.
	b_giveinvitems(self,other,itse_hannasbeutel,1);
	b_giveplayerxp(XP_SCHULDENBUCH);
	AI_Output(other,self,"DIA_Hanna_Add_15_49");	//Co jsi mi to dal?
	AI_Output(self,other,"DIA_Hanna_Add_17_48");	//Je to kl�� od br�ny bohatstv�.
};

func void hanna_blubb()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_37");	//Je v �krytu v�echno v po��dku?
	AI_Output(self,other,"DIA_Hanna_Add_17_39");	//U� jsem nikoho z nich n�jakou dobu nevid�la.
	AI_Output(self,other,"DIA_Hanna_Add_17_40");	//M�l bych sej�t tam dol� a trochu to tam pro�et�it.
	AI_Output(self,other,"DIA_Hanna_Add_17_38");	//Ano, ale rad�i bys o tom nem�l mluvit.
	AI_Output(other,self,"DIA_Hanna_Add_15_25");	//U� jsem zjistil, kde se skr�vaj� zlod�ji?
	AI_Output(self,other,"DIA_Hanna_Add_17_26");	//(dom��liv�) Nem�m potuchy, o �em to mluv�.
	AI_Output(self,other,"DIA_Hanna_Add_17_32");	//Vtrhla sem domobrana - n�kdo vyzradil na�i skr��!
	AI_Output(self,other,"DIA_Hanna_Add_17_33");	//Mn� nem�li co p�i��t, ale Cassia je mrtv� a jej� lid� taky!
	AI_Output(self,other,"DIA_Hanna_Add_17_34");	//Ur�it� jsi to byl TY.
	AI_Output(self,other,"DIA_Hanna_Add_17_35");	//Tohle jsem koupil zvl᚝ pro tebe.
	AI_Output(self,other,"DIA_Hanna_Add_17_36");	//St�lo m� to sice majlant, ale ty si to fakt zaslou��, ty svin� podraz�ck�.
};

