
instance DIA_ADDON_ALLIGATORJACK_EXIT(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 999;
	condition = dia_addon_alligatorjack_exit_condition;
	information = dia_addon_alligatorjack_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_alligatorjack_exit_condition()
{
	return TRUE;
};


var int dia_addon_alligatorjack_exit_info_onetime;

func void dia_addon_alligatorjack_exit_info()
{
	if((MIS_KROKOJAGD == LOG_SUCCESS) && (dia_addon_alligatorjack_exit_info_onetime == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Exit_12_00");	//Jestli�e m� bude� hledat, jsem obvykle n�kde bl� m�ho t�bora bl�zko palis�d.
		if(pir_1354_addon_henry.aivar[AIV_TALKEDTOPLAYER] == FALSE)
		{
			AI_Output(other,self,"DIA_Addon_AlligatorJack_Exit_15_01");	//Palis�dy?
			AI_Output(self,other,"DIA_Addon_AlligatorJack_Exit_12_02");	//Prost� jdi na z�pad. Pochop�, co mysl�m.
		};
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"START");
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		dia_addon_alligatorjack_exit_info_onetime = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_ALLIGATORJACK_PICKPOCKET(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 900;
	condition = dia_addon_alligatorjack_pickpocket_condition;
	information = dia_addon_alligatorjack_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_addon_alligatorjack_pickpocket_condition()
{
	return c_beklauen(100,333);
};

func void dia_addon_alligatorjack_pickpocket_info()
{
	Info_ClearChoices(dia_addon_alligatorjack_pickpocket);
	Info_AddChoice(dia_addon_alligatorjack_pickpocket,DIALOG_BACK,dia_addon_alligatorjack_pickpocket_back);
	Info_AddChoice(dia_addon_alligatorjack_pickpocket,DIALOG_PICKPOCKET,dia_addon_alligatorjack_pickpocket_doit);
};

func void dia_addon_alligatorjack_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_alligatorjack_pickpocket);
};

func void dia_addon_alligatorjack_pickpocket_back()
{
	Info_ClearChoices(dia_addon_alligatorjack_pickpocket);
};


instance DIA_ADDON_ALLIGATORJACK_HELLO(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_hello_condition;
	information = dia_addon_alligatorjack_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_alligatorjack_hello_condition()
{
	if(GREGISBACK == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_hello_info()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Hello_12_00");	//Kdo tedy MَE� b�t? Nevypad� jako ostatn�.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Hello_15_01");	//Jac� dal��?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Hello_12_02");	//Mysl�m m�gy, kte�� si vykra�uj� v t�ch ruin�ch naho�e.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Hello_12_03");	//Pat�� do toho spolku?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Hello_12_04");	//P�kn� odv�n�, �e se tu potuluje� s�m.
};


instance DIA_ADDON_ALLIGATORJACK_WERBISTDU(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_werbistdu_condition;
	information = dia_addon_alligatorjack_werbistdu_info;
	description = "Kdo jsi?";
};


func int dia_addon_alligatorjack_werbistdu_condition()
{
	return TRUE;
};

func void dia_addon_alligatorjack_werbistdu_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_WerBistDu_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WerBistDu_12_01");	//Pravd�podobn� si u� o m� sly�el.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WerBistDu_12_02");	//(py�n�) J� jsem Alligator Jack.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WerBistDu_12_03");	//Ob�van� ve v�ech zem�ch. J� a ostatn� jsme nejnebezpe�n�j�� pir�ti v okol�.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WerBistDu_12_04");	//Spole�n� s na��m kapit�nem Gregem jsme vylupovali obchodn� lod�.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WerBistDu_12_05");	//Stoj� p�ed �ivouc� legendou a to je co ��ct.
};


instance DIA_ADDON_ALLIGATORJACK_VORSCHLAG(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_vorschlag_condition;
	information = dia_addon_alligatorjack_vorschlag_info;
	description = "Zn� n�koho, kdo se jmenuje Raven?";
};


func int dia_addon_alligatorjack_vorschlag_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_alligatorjack_werbistdu) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_vorschlag_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Vorschlag_15_00");	//Zn� n�koho, kdo se jmenuje Raven?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_12_01");	//Jasn�. Je v�dcem bandit� na v�chod�.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_12_02");	//Co od N�J chce�?
	b_logentry(TOPIC_ADDON_RAVENKDW,"Raven a jeho banditi jsou schovan� u v�chodu z �dol�.");
	Info_ClearChoices(dia_addon_alligatorjack_vorschlag);
	Info_AddChoice(dia_addon_alligatorjack_vorschlag,"Chci se k n�mu p�ipojit.",dia_addon_alligatorjack_vorschlag_join);
	Info_AddChoice(dia_addon_alligatorjack_vorschlag,"Mus�m ho zab�t.",dia_addon_alligatorjack_vorschlag_tot);
};

func void b_alligatorjack_besser()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Besser_12_00");	//M�m lep�� n�pad.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Besser_12_01");	//P�ipoj se k n�m.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Besser_12_02");	//D�kladn� si to promysli.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Besser_12_03");	//Jen co zkus� dom�c� rum, sv�t se ti bude zd�t mnohem kr�sn�j��.
	Info_ClearChoices(dia_addon_alligatorjack_vorschlag);
};

func void dia_addon_alligatorjack_vorschlag_tot()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Vorschlag_tot_15_00");	//Mus�m ho zab�t.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_tot_12_01");	//(sm�je se) Co? TY? Jak mysl�, �e HO odstran�?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_tot_12_02");	//Nen� ten chlap na tebe trochu velk� sousto?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_tot_12_03");	//V�bec se k n�mu nedostane�. Bandit�, kter� shrom�dil, t� stejmou d��v, ne� ho jen spat��.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_tot_12_04");	//Nedostne� se ani p�es prvn� p�edsunutou hl�dku.
	b_alligatorjack_besser();
};

func void dia_addon_alligatorjack_vorschlag_join()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Vorschlag_join_15_00");	//Chci se k n�mu p�ipojit.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_join_12_01");	//(opatrn�) Je to tak?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_join_12_02");	//Nevypad�, jako n�kdo, kdo by se cht�l p�idat k t�m bl�zn�m.
	b_alligatorjack_besser();
};


instance DIA_ADDON_ALLIGATORJACK_BDTRUESTUNG(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_bdtruestung_condition;
	information = dia_addon_alligatorjack_bdtruestung_info;
	description = "Pot�ebuji zbroj bandit�.";
};


func int dia_addon_alligatorjack_bdtruestung_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_alligatorjack_vorschlag) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_bdtruestung_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_BDTRuestung_15_00");	//Pot�ebuji zbroj bandit�.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_12_01");	//A co s N�?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_12_02");	//Dostane� se jenom do probl�m�, jenom co t� n�kdo uvid� ji nosit.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_12_03");	//Ka�d� si bude myslet, �e jsi bandita a bude se t� sna�it zab�t.
	Info_ClearChoices(dia_addon_alligatorjack_bdtruestung);
	Info_AddChoice(dia_addon_alligatorjack_bdtruestung,"M� n�jak� n�pad, kde bych mohl sehnat takov� brn�n�?",dia_addon_alligatorjack_bdtruestung_wo);
	Info_AddChoice(dia_addon_alligatorjack_bdtruestung,"To zn� dob�e.",dia_addon_alligatorjack_bdtruestung_gut);
};

func void dia_addon_alligatorjack_bdtruestung_gut()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_BDTRuestung_gut_15_00");	//To zn� dob�e.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_gut_12_01");	//Jo, ale pro n�koho, kdo je sebevrah.
};

func void dia_addon_alligatorjack_bdtruestung_wo()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_BDTRuestung_wo_15_00");	//M� n�jak� n�pad, kde bych mohl sehnat takov� brn�n�?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_wo_12_01");	//Mysl�m, �e m�me jednu v pir�tsk�m t�bo�e.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_wo_12_03");	//Ale nev�m, jestli tam je�t� je.
	b_logentry(TOPIC_ADDON_BDTRUESTUNG,"Pir�ti kdysi m�li zbroj bandit�. Aligator Jack mi nem��e ��ct jestli je�t� existuje.");
	Info_ClearChoices(dia_addon_alligatorjack_bdtruestung);
};


instance DIA_ADDON_ALLIGATORJACK_GREG(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_greg_condition;
	information = dia_addon_alligatorjack_greg_info;
	description = "Tv�j kapit�n se jmenuje Greg?";
};


func int dia_addon_alligatorjack_greg_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_alligatorjack_werbistdu) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_greg_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Greg_15_00");	//Tv�j kapit�n se jmenuje Greg?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_01");	//Jo. Je nejv�t�� pir�t, kter�ho kdy oce�n splodil.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Greg_15_02");	//Mysl�m, �e zn�m tv�ho kapit�na. Potkal jsem ho v Khorinisu.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_03");	//(sm�je se) Greg? V khorinisu? Nesmysl!
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_04");	//Greg je pry� na mo�sk�m n�jezdu s p�r chlapci.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_05");	//Jedin� v�c, kter� by mohla Grega p�iv�st do Khorinisu je v�ze�sk� gal�ra kr�le.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_06");	//Je jedn�m z nejhledan�j��ch m��� v zemi.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_07");	//Nep�jde dobrovoln� do m�sta a nenech� kr�lovsk� str�e, aby ho hodily do kobek.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Greg_15_08");	//Kdy� mysl�.
};


instance DIA_ADDON_ALLIGATORJACK_PIRLAGER(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_pirlager_condition;
	information = dia_addon_alligatorjack_pirlager_info;
	description = "Kde je tv�j pir�tsk� t�bor?";
};


func int dia_addon_alligatorjack_pirlager_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_alligatorjack_werbistdu) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_pirlager_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_PIRLager_15_00");	//Kde je tv�j pir�tsk� t�bor?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_01");	//Vid� ten tunel tady? Kdy� ho bude� sledovat a pokra�ovat z�padn�, d��v nebo pozd�ji dojde� k na�� pl�i.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_02");	//Tam m�me na�e chatr�e.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_03");	//Pokud chce�, m��u ti uk�zat cestu. Ale mus� pro m� ud�lat malou laskavost.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_PIRLager_15_04");	//A co to m� b�t?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_05");	//P�edt�m, ne� se m��u vr�tit do t�bora, mus�m nalovit n�jak� maso pro kluky.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_06");	//Jsi siln� mlad�k.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_07");	//M��u pot�ebovat pomoc s lovem. M� z�jem?
	Log_CreateTopic(TOPIC_ADDON_RATHUNT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RATHUNT,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RATHUNT,"Alligatorovi Jackovi se m��e hodit pomoc s loven�m.");
};


instance DIA_ADDON_ALLIGATORJACK_WASJAGEN(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_wasjagen_condition;
	information = dia_addon_alligatorjack_wasjagen_info;
	description = "Co lov�?";
};


func int dia_addon_alligatorjack_wasjagen_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_alligatorjack_pirlager))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_wasjagen_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_WasJagen_15_00");	//Co lov�?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WasJagen_12_01");	//Nic, obvykle jen aligatory. Ale nem��eme je sn�st.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WasJagen_12_02");	//Krom� toho, tu ��dn� nezbyli.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WasJagen_12_03");	//Proto lov�m, co se d� j�st. Mo��lov� krysy.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_WasJagen_15_04");	//Co?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WasJagen_12_05");	//V�t�ina potvor okolo chutn� jako lidsk� noha, nebo jsou moc tuh�, jako alligato�� maso.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WasJagen_12_06");	//Tlust� ba�inn� krysy jsou jedin� v�c, co se d� j�st.
	b_logentry(TOPIC_ADDON_RATHUNT,"Jedina v�c, co je tady pravd�podobn� k j�dlu je mo�alov� krysa.");
};


instance DIA_ADDON_ALLIGATORJACK_PIRATES(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_pirates_condition;
	information = dia_addon_alligatorjack_pirates_info;
	permanent = FALSE;
	description = "�ekni mi v�ce o pir�tech.";
};


func int dia_addon_alligatorjack_pirates_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_alligatorjack_pirlager))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_pirates_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Pirates_15_00");	//�ekni mi v�ce o pir�tech.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_01");	//�ili jsme tu cel� roky. Za star�ch �as�, p�ed v�lkou, ka�d� odsud a� po kontinent v�d�l, kdo jsme.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_02");	//Na�e vlajka na obzoru sta�ila, aby vyd�sila obchodn� lod�.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_03");	//Ale tyto dny skon�ili. Jsou to t�dny, co jsme m�li obchodn� lo� p�ed st�n�.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_04");	//Kapit�n Greg se �el pod�vat znovu, jestli n�hodou nem��e jednu polapit.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_05");	//Zbytek z n�s sed� okolo t�bora a to�� palcema, dokud se nevr�t�.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_06");	//Doufejme, �e p�inese n�jakou dobrou ko�ist.
};


instance DIA_ADDON_ALLIGATORJACK_LETSGOHUNTING(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_letsgohunting_condition;
	information = dia_addon_alligatorjack_letsgohunting_info;
	permanent = TRUE;
	description = "Jdeme na lov.";
};


func int dia_addon_alligatorjack_letsgohunting_condition()
{
	if((MIS_KROKOJAGD == FALSE) && Npc_KnowsInfo(other,dia_addon_alligatorjack_wasjagen) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_letsgohunting_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_LetsGoHunting_15_00");	//Jdeme na lov.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_LetsGoHunting_12_01");	//Dob�e. I pro dva je to dost pr�ce.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_LetsGoHunting_12_02");	//Jsi p�ipraven?
	Info_ClearChoices(dia_addon_alligatorjack_letsgohunting);
	Info_AddChoice(dia_addon_alligatorjack_letsgohunting,"Ne, je�t� ne.",dia_addon_alligatorjack_letsgohunting_no);
	Info_AddChoice(dia_addon_alligatorjack_letsgohunting,"Ano.",dia_addon_alligatorjack_letsgohunting_yes);
};


const int ALLIGATORJACK_INTER1 = 1;
const int ALLIGATORJACK_KESSEL = 2;
const int ALLIGATORJACK_INTER2 = 3;
const int ALLIGATORJACK_CANYON = 4;

func void dia_addon_alligatorjack_letsgohunting_yes()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_LetsGoHunting_Yes_15_00");	//Ano.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_LetsGoHunting_Yes_12_01");	//Dob�e. Dr� se za mnou.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"HUNT1");
	Wld_InsertNpc(swamprat,"ADW_PIRATECAMP_WATERHOLE_06");
	Wld_InsertNpc(swamprat,"ADW_PIRATECAMP_WATERHOLE_07");
	Wld_InsertNpc(swamprat,"ADW_PIRATECAMP_WATERHOLE_07");
	Wld_InsertNpc(swamprat,"ADW_CANYON_TELEPORT_PATH_06");
	Wld_InsertNpc(swamprat,"ADW_CANYON_TELEPORT_PATH_06");
	Wld_InsertNpc(swamprat,"ADW_CANYON_TELEPORT_PATH_06");
	ALLIGATORJACK_JAGDSTART = ALLIGATORJACK_INTER1;
	MIS_KROKOJAGD = LOG_RUNNING;
};

func void dia_addon_alligatorjack_letsgohunting_no()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_LetsGoHunting_No_15_00");	//Ne, je�t� ne.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_LetsGoHunting_No_12_01");	//Pak si posp�.
	Info_ClearChoices(dia_addon_alligatorjack_letsgohunting);
};


instance DIA_ADDON_ALLIGATORJACK_ALLIGATORJACKINTER1(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_alligatorjackinter1_condition;
	information = dia_addon_alligatorjack_alligatorjackinter1_info;
	important = TRUE;
};


func int dia_addon_alligatorjack_alligatorjackinter1_condition()
{
	if((ALLIGATORJACK_JAGDSTART == ALLIGATORJACK_INTER1) && (Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_16") <= 500))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_alligatorjackinter1_info()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_AlligatorJackInter1_12_00");	//Roklina.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_AlligatorJackInter1_12_01");	//Tady mo�n� najdeme n�jak� zv��ata.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_AlligatorJackInter1_12_02");	//Poj� za mnou.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"HUNT2");
	ALLIGATORJACK_JAGDSTART = ALLIGATORJACK_KESSEL;
};


instance DIA_ADDON_ALLIGATORJACK_THEHUNT(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_thehunt_condition;
	information = dia_addon_alligatorjack_thehunt_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_alligatorjack_thehunt_condition()
{
	if((ALLIGATORJACK_JAGDSTART == ALLIGATORJACK_KESSEL) && (Npc_GetDistToWP(self,"ADW_PIRATECAMP_WATERHOLE_07") <= 500) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_thehunt_info()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_12_00");	//To je to, �eho jsem se ob�val.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_TheHunt_15_01");	//Co?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_12_02");	//Masa z t�ch potvor je jenom polovina, ne� pot�ebuju.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_12_03");	//Te� mus�me j�t tak� do ka�onu.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_12_04");	//D�vej bacha. Hloub�ji v ka�onu u� je to trochu nebezpe�n�j��.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_12_05");	//Pokud m� r�d sv�j �ivot, tak se m� dr�.
	Wld_InsertNpc(waran,"ADW_ENTRANCE_2_VALLEY_10");
	Wld_InsertNpc(waran,"ADW_ENTRANCE_2_VALLEY_10");
	Info_ClearChoices(dia_addon_alligatorjack_thehunt);
	Info_AddChoice(dia_addon_alligatorjack_thehunt,"CO je v ka�onu?",dia_addon_alligatorjack_thehunt_enough);
	Info_AddChoice(dia_addon_alligatorjack_thehunt,"Dobr�, jdeme.",dia_addon_alligatorjack_thehunt_running);
};

func void dia_addon_alligatorjack_thehunt_enough()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_TheHunt_Enough_15_00");	//CO je v ka�onu?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_Enough_12_01");	//Pokud to bude mo�n�, tak se tomu vyhneme.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_Enough_12_02");	//Jsou tam b�itvy. P�kn� vytrval�. Dr� se od nich d�l, pokud chce� ��t.
};

func void dia_addon_alligatorjack_thehunt_running()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_TheHunt_Running_15_00");	//Dobr�, jdeme.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_Running_12_01");	//Jasn�.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"HUNT3");
	ALLIGATORJACK_JAGDSTART = ALLIGATORJACK_INTER2;
};


instance DIA_ADDON_ALLIGATORJACK_ALLIGATORJACKINTER2(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_alligatorjackinter2_condition;
	information = dia_addon_alligatorjack_alligatorjackinter2_info;
	important = TRUE;
};


func int dia_addon_alligatorjack_alligatorjackinter2_condition()
{
	if((ALLIGATORJACK_JAGDSTART == ALLIGATORJACK_INTER2) && (Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_16") <= 500) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_alligatorjackinter2_info()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_AlligatorJackInter2_12_00");	//Poj� sem.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"HUNT4");
	ALLIGATORJACK_JAGDSTART = ALLIGATORJACK_CANYON;
};


instance DIA_ADDON_ALLIGATORJACK_HUNTEND(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_huntend_condition;
	information = dia_addon_alligatorjack_huntend_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_alligatorjack_huntend_condition()
{
	if((ALLIGATORJACK_JAGDSTART == ALLIGATORJACK_CANYON) && (Npc_GetDistToWP(self,"ADW_CANYON_TELEPORT_PATH_06") <= 500) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_huntend_info()
{
	if(ALLIGATORJACK_KROKOSKILLED == 0)
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_00");	//Te� mi �ekni, pro� jsem t� vlastn� bral sebou?
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_01");	//Nezabil jsi ani jednu mo��lovou krysu.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_02");	//Hmm, dobr�, mo�n� se uk�e� v�c pot�ebn� p��t�.
	}
	else if(ALLIGATORJACK_KROKOSKILLED == 1)
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_03");	//Velmi dob�e! M��eme pot�ebovat n�koho, jako si ty.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_04");	//Na tv�m prvn�m lovu jsi ulovil jednu z t�ch potvor. To nen� �patn�.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_05");	//M� opravdov� talent.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_06");	//Zatracen�, pokud bude� pokra�ovat jako te�, m��u z�stat v t�bo�e.
	};
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_07");	//Tady, vem tohle krys� maso a dones to tomu povale�i Morganovi.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_08");	//Najde� ho v na�em t�bo�e.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_09");	//Pravd�podobn� se povaluje n�kde okolo pl�e. Mysl�m, �e t� u� o�ek�v�.
	if(pir_1354_addon_henry.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_10");	//U vchodu do t�bora najde� pravd�podobn� Henryho. Star� se o hl�d�ni v p��pad�, �e by za�to�ili bandit�.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_11");	//Jestli t� nepust� dovnit�, tak mu �ekni, �e t� pos�l�m.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_12");	//To by ho m�lo ud�lat p��pustn�j��m.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_13");	//Henry m��e b�t trochu nep��jemn� a r�d ��fuje.
	};
	MIS_ALLIGATORJACK_BRINGMEAT = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_BRINGMEAT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BRINGMEAT,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_BRINGMEAT,"Alligator Jack mi dal 10 kousk� masa. M�m je p�in�st Morganovi.");
	b_logentry(TOPIC_ADDON_RATHUNT,"Lov byl usp�n�. Zabyli jsme n�kolik ba�inn�ch krys.");
	b_giveinvitems(self,other,itfomuttonraw,10);
	MIS_KROKOJAGD = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_KROKOJAGD);
};


instance DIA_ADDON_ALLIGATORJACK_ANGUS(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_angus_condition;
	information = dia_addon_alligatorjack_angus_info;
	permanent = FALSE;
	description = "Zn� Anguse a jeho kamar�da Hanka?";
};


func int dia_addon_alligatorjack_angus_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bill_angusnhank) == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_angus_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Angus_15_00");	//Zn� Anguse a jeho kamar�da Hanka?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Angus_12_03");	//Docela dlouho jsem je nevid�l.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Angus_12_04");	//Vlastn� si mysl�m, �e se u� znovu neobjev�.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Angus_15_05");	//Pro�?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Angus_12_06");	//Tihle idioti se jen poflakovali kolem jezera a byli st�le vyd�en�.
};


instance DIA_ADDON_ALLIGATORJACK_LAKE(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_lake_condition;
	information = dia_addon_alligatorjack_lake_info;
	permanent = FALSE;
	description = "U kter�ho jezera se potloukali?";
};


func int dia_addon_alligatorjack_lake_condition()
{
	if((Npc_KnowsInfo(other,dia_addon_alligatorjack_angus) == TRUE) && (MIS_ADDON_MORGAN_SEEKTRAITOR != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_lake_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Lake_15_00");	//U kter�ho jezera se potloukali?
	if(MIS_KROKOJAGD == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_01");	//Pamatuje� n� lov?
		AI_Output(other,self,"DIA_Addon_AlligatorJack_Lake_15_02");	//Ano.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_03");	//Jezero v roklin�. Tam jsem je v�t�inou vid�l.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_04");	//Na jezeru ve velk� kotlin�.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_05");	//Jenom jdi na v�chod z na�eho t�bora. Nem��e� to minout.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_06");	//M� to hodn� mal�ch vodop�d�.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_07");	//Ale bu� opatrn�. Jestli nic nem�, ale c�t� such� p�sek pod sv�ma nohama,tak si se �patn� oto�il a vstoupil do ka�onu.
	};
	b_logentry(TOPIC_ADDON_SKIPSGROG,"Jak se zd� jeskyn� je na v�chod od t�bora. Na pravo jezera.");
};


instance DIA_ADDON_ALLIGATORJACK_CANLEARN(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_canlearn_condition;
	information = dia_addon_alligatorjack_canlearn_info;
	permanent = TRUE;
	description = "M��e� m� n�co nau�it?";
};


func int dia_addon_alligatorjack_canlearn_condition()
{
	if(ALLIGATORJACK_ADDON_TEACHPLAYER == FALSE)
	{
		if((Npc_KnowsInfo(other,dia_addon_alligatorjack_huntend) == TRUE) || (GREGISBACK == TRUE))
		{
			return TRUE;
		};
	};
};

func void dia_addon_alligatorjack_canlearn_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_CanLearn_15_00");	//M��e� m� n�co nau�it?
	if(MIS_KROKOJAGD > LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_CanLearn_12_01");	//Jasn�, jsem dobr� lovec.M��u ti uk�zat jak st�hnout zv��ata a jak vyndat jejich zuby.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_CanLearn_12_02");	//M��i ti to uk�zat, jestli chce�.
		Log_CreateTopic(TOPIC_ADDON_PIR_TEACHER,LOG_NOTE);
		b_logentry(TOPIC_ADDON_PIR_TEACHER,"Alligator Jack m� m��e nau�it jak st�hnout ze zv��at k��i a vyndat jejich zuby. M��e m� tak� nau�it st��let z luku.");
		ALLIGATORJACK_ADDON_TEACHPLAYER = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_CanLearn_12_03");	//Nejd�iv mi mus� uk�zat, jak si p�ipraven� na lov.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_CanLearn_12_04");	//Kdy� budeme na lovu spole�n�, mo�n� to zvl�dnu.
	};
};

func void b_aj_teach()
{
	Info_ClearChoices(dia_addon_alligatorjack_teach);
	Info_AddChoice(dia_addon_alligatorjack_teach,DIALOG_BACK,dia_addon_alligatorjack_teach_back);
	Info_AddChoice(dia_addon_alligatorjack_teach,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,1) * 5),dia_addon_alligatorjack_teach_bow_5);
	Info_AddChoice(dia_addon_alligatorjack_teach,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_addon_alligatorjack_teach_bow_1);
	Info_AddChoice(dia_addon_alligatorjack_teach,b_buildlearnstring("Stahov�n� k��e",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_REPTILESKIN)),dia_addon_alligatorjack_teach_fur);
	Info_AddChoice(dia_addon_alligatorjack_teach,b_buildlearnstring("V�jmut� zub�",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_TEETH)),dia_addon_alligatorjack_teach_teeth);
};


instance DIA_ADDON_ALLIGATORJACK_TEACH(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_teach_condition;
	information = dia_addon_alligatorjack_teach_info;
	permanent = TRUE;
	description = "U� m�!";
};


func int dia_addon_alligatorjack_teach_condition()
{
	if(ALLIGATORJACK_ADDON_TEACHPLAYER == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_teach_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Teach_15_00");	//U� m�!
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Teach_12_01");	//Co chce� v�d�t?
	b_aj_teach();
};

func void dia_addon_alligatorjack_teach_back()
{
	Info_ClearChoices(dia_addon_alligatorjack_teach);
};

func void dia_addon_alligatorjack_teach_bow_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,1,75);
	b_aj_teach();
};

func void dia_addon_alligatorjack_teach_bow_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,5,75);
	b_aj_teach();
};

func void dia_addon_alligatorjack_teach_fur()
{
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_REPTILESKIN] == FALSE)
	{
		if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_REPTILESKIN))
		{
			AI_Output(self,other,"DIA_Addon_AlligatorJack_Teach_Fur_12_00");	//V�dy jedin� �ez pod�l b�icha, nebo to zni�� kvalitu.
		};
	}
	else
	{
		b_say(self,other,"$NOLEARNYOUREBETTER");
	};
	b_aj_teach();
};

func void dia_addon_alligatorjack_teach_teeth()
{
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE)
	{
		b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_TEETH);
	}
	else
	{
		b_say(self,other,"$NOLEARNYOUREBETTER");
	};
	b_aj_teach();
};

func void b_allijack_alliklar()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Anheuern_12_01");	//Jasn�.
};


instance DIA_ADDON_ALLIGATORJACK_ANHEUERN(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 11;
	condition = dia_addon_alligatorjack_anheuern_condition;
	information = dia_addon_alligatorjack_anheuern_info;
	permanent = FALSE;
	description = "Poj�me lovit.";
};


func int dia_addon_alligatorjack_anheuern_condition()
{
	if(MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_anheuern_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Anheuern_15_00");	//Poj�me lovit.
	b_allijack_alliklar();
	AI_StopProcessInfos(self);
	b_addon_piratesfollowagain();
	Npc_ExchangeRoutine(self,"FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};


instance DIA_ADDON_ALLIGATORJACK_COMEON(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 12;
	condition = dia_addon_alligatorjack_comeon_condition;
	information = dia_addon_alligatorjack_comeon_info;
	permanent = TRUE;
	description = "Jdeme na lov.";
};


func int dia_addon_alligatorjack_comeon_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_alligatorjack_anheuern))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_comeon_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_KommMit_15_00");	//Jdeme na lov.
	if(c_gregspiratestoofar() == TRUE)
	{
		b_say(self,other,"$NOTNOW");
		AI_StopProcessInfos(self);
	}
	else
	{
		b_allijack_alliklar();
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_ADDON_ALLIGATORJACK_GOHOME(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 13;
	condition = dia_addon_alligatorjack_gohome_condition;
	information = dia_addon_alligatorjack_gohome_info;
	permanent = TRUE;
	description = "U� t� nepot�ebuji";
};


func int dia_addon_alligatorjack_gohome_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_gohome_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_DontNeedYou_15_00");	//U� t� nepot�ebuji.
	b_allijack_alliklar();
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_ADDON_ALLIGATORJACK_TOOFAR(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 14;
	condition = dia_addon_alligatorjack_toofar_condition;
	information = dia_addon_alligatorjack_toofar_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_alligatorjack_toofar_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (c_gregspiratestoofar() == TRUE) && (MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_toofar_info()
{
	b_say(self,other,"$RUNAWAY");
	b_addon_piratesgohome();
	AI_StopProcessInfos(self);
};

