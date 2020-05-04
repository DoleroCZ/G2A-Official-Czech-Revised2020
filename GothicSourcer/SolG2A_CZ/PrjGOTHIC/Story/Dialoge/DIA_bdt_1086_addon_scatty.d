
var int scatty_start;

instance DIA_ADDON_SCATTY_EXIT(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 999;
	condition = dia_addon_scatty_exit_condition;
	information = dia_addon_scatty_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_scatty_exit_condition()
{
	return TRUE;
};

func void dia_addon_scatty_exit_info()
{
	AI_StopProcessInfos(self);
	if(SCATTY_START == FALSE)
	{
		Npc_ExchangeRoutine(self,"START");
		SCATTY_START = TRUE;
	};
};


instance DIA_ADDON_SCATTY_PICKPOCKET(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 900;
	condition = dia_addon_scatty_pickpocket_condition;
	information = dia_addon_scatty_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_addon_scatty_pickpocket_condition()
{
	return c_beklauen(60,90);
};

func void dia_addon_scatty_pickpocket_info()
{
	Info_ClearChoices(dia_addon_scatty_pickpocket);
	Info_AddChoice(dia_addon_scatty_pickpocket,DIALOG_BACK,dia_addon_scatty_pickpocket_back);
	Info_AddChoice(dia_addon_scatty_pickpocket,DIALOG_PICKPOCKET,dia_addon_scatty_pickpocket_doit);
};

func void dia_addon_scatty_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_scatty_pickpocket);
};

func void dia_addon_scatty_pickpocket_back()
{
	Info_ClearChoices(dia_addon_scatty_pickpocket);
};


instance DIA_ADDON_SCATTY_HI(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 2;
	condition = dia_addon_scatty_hi_condition;
	information = dia_addon_scatty_hi_info;
	permanent = FALSE;
	description = "Jak jde obchod?";
};


func int dia_addon_scatty_hi_condition()
{
	return TRUE;
};

func void dia_addon_scatty_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_Hi_15_00");	//Jak jde obchod?
	AI_Output(self,other,"DIA_Addon_Scatty_Hi_01_01");	//H�� od doby, co byla otev�ena krypta ...
	AI_Output(self,other,"DIA_Addon_Scatty_Hi_01_02");	//Raven u� nepot�ebuje otroky. Te� kutaj� zlato na Bloodwyn�v p��kaz.
	AI_Output(self,other,"DIA_Addon_Scatty_Hi_01_03");	//A kop��i si d�vaj� oraz. (muml�) Kop��i, kte�� maj� pauzu nejsou dob�� pro m�j obchod.
	Log_CreateTopic(TOPIC_ADDON_BDT_TRADER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_BDT_TRADER,"Scatty prod�v� r�zn� v�ci.");
};


instance DIA_ADDON_SCATTY_LAST(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 2;
	condition = dia_addon_scatty_last_condition;
	information = dia_addon_scatty_last_info;
	permanent = FALSE;
	description = "Bloodwyn? M� tady n�jak� �kol?";
};


func int dia_addon_scatty_last_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_scatty_hi) && !Npc_IsDead(bloodwyn))
	{
		return TRUE;
	};
};

func void dia_addon_scatty_last_info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_last_15_00");	//Bloodwyn? M� tady n�jak� �kol?
	AI_Output(self,other,"DIA_Addon_Scatty_last_01_01");	//Kontroluje d�l. Ale je tady dole jen s�e��. V�t�inu �asu je s Ravenem v chr�mu.
	AI_Output(other,self,"DIA_Addon_Scatty_last_15_02");	//Co to 't�ce' znamen� doopravdy?
	AI_Output(self,other,"DIA_Addon_Scatty_last_01_03");	//Naposled jsem ho vid�l, kdy� opou�t�l kryptu ...
	AI_Output(self,other,"DIA_Addon_Scatty_last_01_04");	//(uva�uje) Ne, po�kej! Mysl�m, �e to bylo kdy� pos�lal otroky dol�, aby kopali zlato.
	AI_Output(self,other,"DIA_Addon_Scatty_last_01_05");	//Narozd�l od Ravena, ON je velmi zaujat zlatem.
};


instance DIA_ADDON_SCATTY_GRUFT(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 2;
	condition = dia_addon_scatty_gruft_condition;
	information = dia_addon_scatty_gruft_info;
	permanent = FALSE;
	description = "O jak� krypt� mluv�?";
};


func int dia_addon_scatty_gruft_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_scatty_hi))
	{
		return TRUE;
	};
};

func void dia_addon_scatty_gruft_info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_Gruft_15_00");	//O jak� krypt� mluv�?
	AI_Output(self,other,"DIA_Addon_Scatty_Gruft_01_01");	//Je to proklet� krypta! Jej� ochr�nci zabili mnoho mu��!
	AI_Output(other,self,"DIA_Addon_Scatty_Gruft_15_02");	//Ochr�nci? Mluv� o kamenn�ch stvo�en�ch? Ploch� a kulat� obli�ej?
	AI_Output(self,other,"DIA_Addon_Scatty_Gruft_01_03");	//Ano! Nes�etn�kr�t se objevili z hlubok� sk�ly.
	AI_Output(self,other,"DIA_Addon_Scatty_Gruft_01_04");	//V�d�l jsem, �e otev�en� krypty nen� dobr� n�pad u� od za��tku.
	AI_Output(self,other,"DIA_Addon_Scatty_Gruft_01_05");	//Ale Raven byl posedl� n�padem tady dolovat. A jen co byla krypta odkryta, on a jeho str�ce do n� vstoupili.
};


instance DIA_ADDON_SCATTY_GRUFTAGAIN(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 2;
	condition = dia_addon_scatty_gruftagain_condition;
	information = dia_addon_scatty_gruftagain_info;
	permanent = FALSE;
	description = "Pro� cht�l Raven do t� krypty?";
};


func int dia_addon_scatty_gruftagain_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_scatty_gruft))
	{
		return TRUE;
	};
};

func void dia_addon_scatty_gruftagain_info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_GruftAgain_15_00");	//Pro� cht�l Raven do t� krypty?
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_01");	//(uva�uje) Hmm ... jsi hodn� nosat�. Podob� se chl�pkovi, kter�ho jsem znal.
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_02");	//Byl stejn� nosat� jak ty. A jednoho dne se obr�til k osudu.
	AI_Output(other,self,"DIA_Addon_Scatty_GruftAgain_15_03");	//Nezakec�vej to. Co se stalo v krypt�?
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_04");	//Dobr� ... uhm ... Je trochu sucho a m� by nevadilo n�co k pit� ...
	AI_Output(other,self,"DIA_Addon_Scatty_GruftAgain_15_05");	//Hej Scatty, ne te�. Tohle je d�le�it�, tak�e, co tam dole Raven d�lal?
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_06");	//Dobr�, dobr�. (d�ch�) On ... p�ivolal ... n�co. Pou��val slova jazyka, kter� nezn�l zn�m�.
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_07");	//Osl�uj�c� sv�tlo se uvolnilo z vnit�ku krypty a potom jsem sly�el v�k�ik. Byl to �okuj�c�, d�monick� v�k�ik.
	AI_Output(other,self,"DIA_Addon_Scatty_GruftAgain_15_08");	//A potom?
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_09");	//To je v�e, co jsem vid�l. Bloodwyn vy�el z krypty a �ekl mi, abych ode�el. A to jsem tak� ud�lal.
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_10");	//Raven a jeho chlapi opustili chr�m kr�tce potom. A potom u� tady dole nebyl v�bec.
};


instance DIA_ADDON_SCATTY_TRINKEN(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 99;
	condition = dia_addon_scatty_trinken_condition;
	information = dia_addon_scatty_trinken_info;
	permanent = FALSE;
	description = "Cht�l by jsi n�co k pit�?";
};


func int dia_addon_scatty_trinken_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_scatty_gruftagain))
	{
		return TRUE;
	};
};

func void dia_addon_scatty_trinken_info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_Trinken_15_00");	//Cht�l by jsi n�co k pit�?
	AI_Output(self,other,"DIA_Addon_Scatty_Trinken_01_01");	//Ur�it� jsi nemyslel pivo. To je velice vz�cn� v tomhle t�bo�e.
	AI_Output(self,other,"DIA_Addon_Scatty_Trinken_01_02");	//Mo�n� m� Lucia st�le n�kde l�hev ...
};


instance DIA_ADDON_SCATTY_BIER(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 99;
	condition = dia_addon_scatty_bier_condition;
	information = dia_addon_scatty_bier_info;
	permanent = FALSE;
	description = "Na zdrav�! (d�t pivo)";
};


func int dia_addon_scatty_bier_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_scatty_trinken) && Npc_HasItems(other,itfo_beer))
	{
		return TRUE;
	};
};

func void dia_addon_scatty_bier_info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_Bier_15_00");	//Na zdrav�!
	if(b_giveinvitems(other,self,itfo_beer,1))
	{
		AI_UseItem(self,itfo_beer);
	};
	AI_Output(self,other,"DIA_Addon_Scatty_Bier_01_01");	//Oh, tohle chutn� skv�le. D�ky, chlape, jse� m�j hrdina.
	b_giveplayerxp(XP_AMBIENT * 5);
};


instance DIA_ADDON_SCATTY_GOLD(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 2;
	condition = dia_addon_scatty_gold_condition;
	information = dia_addon_scatty_gold_info;
	permanent = FALSE;
	description = DIALOG_ADDON_GOLD_DESCRIPTION;
};


func int dia_addon_scatty_gold_condition()
{
	return TRUE;
};

func void dia_addon_scatty_gold_info()
{
	b_say(other,self,"$ADDON_GOLD_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Scatty_Gold_01_00");	//Z�skat krump�� a bu�it zlat� mince ... Ka�d� to m��e d�lat.
	AI_Output(self,other,"DIA_Addon_Scatty_Gold_01_01");	//Nicm�n�, pokud do toho bu�� mince se rozt��t� na mnoho mal�ch nuget�. Proto mohou dolovat je zku�en� lid�.
	AI_Output(self,other,"DIA_Addon_Scatty_Gold_01_02");	//M��u ti d�t p�r informac�, pokud jsi dostat��n� zku�en�.
	b_upgrade_hero_hackchance(5);
};


var int scatty_teach_perm;

instance DIA_ADDON_SCATTY_TEACH(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 2;
	condition = dia_addon_scatty_teach_condition;
	information = dia_addon_scatty_teach_info;
	permanent = TRUE;
	description = "Nau�it se dolovat zlato (Stoj�: 2 LP - 10 procent)";
};


func int dia_addon_scatty_teach_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_scatty_gold) && (SCATTY_TEACH_PERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_scatty_teach_info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_teach_15_00");	//Co o dolov�n� zlata?
	if(other.lp >= 1)
	{
		AI_Output(self,other,"DIA_Addon_Scatty_teach_01_01");	//Mus� si b�t v�dom, �e zlato nen� jako ruda. Je jemn� jako m�slo. Pokud ude�� moc siln�, rozpadne se na mal� kousky.
		AI_Output(self,other,"DIA_Addon_Scatty_teach_01_02");	//Ka�d� kop�� m� sv� vlastn� triky jak ze sk�ly z�skat n�jak� p�kn� nuggety.
		AI_Output(self,other,"DIA_Addon_Scatty_teach_01_03");	//To tyhle triky odli�uj� kop��e a dobr�ho kop��e.
		AI_Output(self,other,"DIA_Addon_Scatty_teach_01_04");	//Tak�, je to v�echno o praxi. Bude� se zlep�ovat, pokud tady bude� chv�li pracovat.
		other.lp = other.lp - 1;
		b_upgrade_hero_hackchance(10);
		SCATTY_TEACH_PERM = TRUE;
	}
	else
	{
		b_say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance DIA_ADDON_SCATTY_TOT(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 2;
	condition = dia_addon_scatty_tot_condition;
	information = dia_addon_scatty_tot_info;
	permanent = FALSE;
	description = "Bloodwyn je mrtv�.";
};


func int dia_addon_scatty_tot_condition()
{
	if(Npc_IsDead(bloodwyn))
	{
		return TRUE;
	};
};

func void dia_addon_scatty_tot_info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_tot_15_00");	//Bloodwyn je mrtv�.
	AI_Output(self,other,"DIA_Addon_Scatty_tot_01_01");	//Hm, norm�ln� nep�ip�j�m na takov�hle zpr�vy - nicm�n�, Bloodwyn byl n�hodou jeden z chlap�, kte�� jsou lep�� mrtv�.
};


instance DIA_ADDON_SCATTY_TRADE(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 99;
	condition = dia_addon_scatty_trade_condition;
	information = dia_addon_scatty_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE;
};


func int dia_addon_scatty_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_scatty_hi))
	{
		return TRUE;
	};
};

func void dia_addon_scatty_trade_info()
{
	b_givetradeinv(self);
	b_say(other,self,"$TRADE_1");
};

