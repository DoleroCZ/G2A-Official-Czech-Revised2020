
instance DIA_GAAN_EXIT(C_INFO)
{
	npc = bau_961_gaan;
	nr = 999;
	condition = dia_gaan_exit_condition;
	information = dia_gaan_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


var int dia_gaan_exit_onetime;

func int dia_gaan_exit_condition()
{
	return TRUE;
};

func void dia_gaan_exit_info()
{
	AI_StopProcessInfos(self);
	if(DIA_GAAN_EXIT_ONETIME == FALSE)
	{
		Npc_ExchangeRoutine(self,"Start");
		DIA_GAAN_EXIT_ONETIME = TRUE;
	};
};


instance DIA_ADDON_GAAN_MEETINGISRUNNING(C_INFO)
{
	npc = bau_961_gaan;
	nr = 1;
	condition = dia_addon_gaan_meetingisrunning_condition;
	information = dia_addon_gaan_meetingisrunning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_addon_gaan_meetingisrunning_condition()
{
	if(Npc_IsInState(self,zs_talk) && (RANGERMEETINGRUNNING == LOG_RUNNING))
	{
		return TRUE;
	};
};


var int dia_addon_gaan_meetingisrunning_one_time;

func void dia_addon_gaan_meetingisrunning_info()
{
	if(DIA_ADDON_GAAN_MEETINGISRUNNING_ONE_TIME == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Gaan_MeetingIsRunning_03_00");	//Nov��ek. V�tej v 'Kruhu Vody'.
		DIA_ADDON_GAAN_MEETINGISRUNNING_ONE_TIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Gaan_MeetingIsRunning_03_01");	//Vatras se po tob� ptal, m�l bys ho nav�t�vit.
	};
	AI_StopProcessInfos(self);
};


instance DIA_GAAN_HALLO(C_INFO)
{
	npc = bau_961_gaan;
	nr = 3;
	condition = dia_gaan_hallo_condition;
	information = dia_gaan_hallo_info;
	description = "Tady naho�e je docela hezky.";
};


func int dia_gaan_hallo_condition()
{
	return TRUE;
};

func void dia_gaan_hallo_info()
{
	AI_Output(other,self,"DIA_Gaan_HALLO_15_00");	//Tady naho�e je docela hezky.
	AI_Output(self,other,"DIA_Gaan_HALLO_03_01");	//Je to tu docela p�kn�. Ale jakmile projde� t�m pr�smykem t�mhle, p�estane� si to myslet.
	AI_Output(self,other,"DIA_Gaan_HALLO_03_02");	//Jestli na tebe tenhle kus zem� ud�lal dojem, tak po�kej, co pak uvid� v Hornick�m �dol�.
};


instance DIA_GAAN_WASMACHSTDU(C_INFO)
{
	npc = bau_961_gaan;
	nr = 4;
	condition = dia_gaan_wasmachstdu_condition;
	information = dia_gaan_wasmachstdu_info;
	description = "Kdo jsi?";
};


func int dia_gaan_wasmachstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_gaan_hallo) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (RANGERMEETINGRUNNING != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_gaan_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Gaan_WASMACHSTDU_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Gaan_WASMACHSTDU_03_01");	//Jmenuju se Gaan. Jsem lovec a pracuju pro Bengara. Farma�� tady na n�horn�ch pastvin�ch.
	AI_Output(self,other,"DIA_Gaan_WASMACHSTDU_03_02");	//Tr�v�m tady venku v�t�inu sv�ho �asu a vyh��v�m se na slunci.
};


instance DIA_ADDON_GAAN_RANGER(C_INFO)
{
	npc = bau_961_gaan;
	nr = 2;
	condition = dia_addon_gaan_ranger_condition;
	information = dia_addon_gaan_ranger_info;
	description = "Pro� ten v�n� obli�ej?";
};


func int dia_addon_gaan_ranger_condition()
{
	if(Npc_KnowsInfo(other,dia_gaan_hallo) && (SCISWEARINGRANGERRING == TRUE) && (RANGERMEETINGRUNNING == 0))
	{
		return TRUE;
	};
};

func void dia_addon_gaan_ranger_info()
{
	AI_Output(other,self,"DIA_Addon_Gaan_Ranger_15_00");	//Pro� ten v�n� obli�ej?
	AI_Output(self,other,"DIA_Addon_Gaan_Ranger_03_01");	//Nos� n� akvamar�nov� prsten.
	AI_Output(other,self,"DIA_Addon_Gaan_Ranger_15_02");	//Pat�� ke 'Kruhu Vody'.
	AI_Output(self,other,"DIA_Addon_Gaan_Ranger_03_03");	//Skv�le. R�d vid�m nov��ky v na�em spolku.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ADDON_GAAN_AUFGABEBEIMRING(C_INFO)
{
	npc = bau_961_gaan;
	nr = 2;
	condition = dia_addon_gaan_aufgabebeimring_condition;
	information = dia_addon_gaan_aufgabebeimring_info;
	description = "Jakou m� funci v 'Kruhu vody'?";
};


func int dia_addon_gaan_aufgabebeimring_condition()
{
	if((Npc_KnowsInfo(other,dia_addon_gaan_ranger) || (RANGERMEETINGRUNNING != 0)) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_addon_gaan_aufgabebeimring_info()
{
	AI_Output(other,self,"DIA_Addon_Gaan_AufgabeBeimRing_15_00");	//Jakou m� funci v 'Kruhu Vody'?
	AI_Output(self,other,"DIA_Addon_Gaan_AufgabeBeimRing_03_01");	//Hl�dal jsem vchod do pr�smyku a kontroloval, kdo jde dovnit� a kdo leze ven.
	AI_Output(self,other,"DIA_Addon_Gaan_AufgabeBeimRing_03_02");	//Ale n�jac� paladinov� se sem nast�hovali, �e si to prej ohl�daj a od t� doby se tam pohybuje m�� lid�.
};


instance DIA_ADDON_GAAN_MISSINGPEOPLE(C_INFO)
{
	npc = bau_961_gaan;
	nr = 2;
	condition = dia_addon_gaan_missingpeople_condition;
	information = dia_addon_gaan_missingpeople_info;
	description = "Sly�el jsi n�co o hledyn�ch lidech?";
};


func int dia_addon_gaan_missingpeople_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_gaan_aufgabebeimring) && (SC_HEAREDABOUTMISSINGPEOPLE == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_gaan_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Gaan_MissingPeople_15_00");	//Sly�el jsi n�co o hledyn�ch lidech?
	AI_Output(self,other,"DIA_Addon_Gaan_MissingPeople_03_01");	//Jist�. Ka�d� d�l� v�echno pro to, aby je nemusel nav�t�vit.
	AI_Output(self,other,"DIA_Addon_Gaan_MissingPeople_03_02");	//Ale j� jsem v klidu, nevid�l jsem tu nic podez�el�ho.
};


instance DIA_GAAN_WALD(C_INFO)
{
	npc = bau_961_gaan;
	nr = 5;
	condition = dia_gaan_wald_condition;
	information = dia_gaan_wald_info;
	description = "Co bych m�l v�d�t o Hornick�m �dol�?";
};


func int dia_gaan_wald_condition()
{
	return TRUE;
};

func void dia_gaan_wald_info()
{
	AI_Output(other,self,"DIA_Gaan_WALD_15_00");	//Co bych m�l v�d�t o Hornick�m �dol�?
	AI_Output(self,other,"DIA_Gaan_WALD_03_01");	//Tak to nev�m. Byl jsem tam jen na skok. Vypad� to tam p�kn� nebezpe�n�.
	AI_Output(self,other,"DIA_Gaan_WALD_03_02");	//Nejlep�� v�c, jakou m��e� ud�lat, je dr�et se po vstupu do pr�smyku vy�lapan� stezky.
	AI_Output(self,other,"DIA_Gaan_WALD_03_03");	//Bu� m��e� j�t velkou str��, nebo po cest� p�es most. Je to krat�� a bezpe�n�j��.
	AI_Output(self,other,"DIA_Gaan_WALD_03_04");	//Te�, kdy� se to v�ude hem�� sk�ety, mus� b�t hodn� opatrn�.
	AI_Output(self,other,"DIA_Gaan_WALD_03_05");	//Nerad bych t� t�hnul k bylink��ce.
};


instance DIA_GAAN_SAGITTA(C_INFO)
{
	npc = bau_961_gaan;
	nr = 7;
	condition = dia_gaan_sagitta_condition;
	information = dia_gaan_sagitta_info;
	description = "Bylink��ce?";
};


func int dia_gaan_sagitta_condition()
{
	if(Npc_KnowsInfo(other,dia_gaan_wald))
	{
		return TRUE;
	};
};

func void dia_gaan_sagitta_info()
{
	AI_Output(other,self,"DIA_Gaan_SAGITTA_15_00");	//Bylink��ce?
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_01");	//Jmenuje se Sagitta. L��� farm��e a ostatn� lidi, co �ij� mimo m�sto.
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_02");	//V�n� podivn� �en�tina.
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_03");	//Nikdo za n� ve skute�nosti nechce chodit a v�ichni o n� roz�i�uj� r�zn� f�my.
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_04");	//Ale kdy� je ti zle, nenajde� nic lep��ho ne� Sagittu a jej� kuchy� plnou l��iv�ch bylin.
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_05");	//Najde� ji v tom pruhu lesa za Sekobovou farmou.
};


instance DIA_GAAN_MONSTER(C_INFO)
{
	npc = bau_961_gaan;
	nr = 8;
	condition = dia_gaan_monster_condition;
	information = dia_gaan_monster_info;
	description = "Jak ta nebezpe�n� bestie vypad�?";
};


func int dia_gaan_monster_condition()
{
	if((MIS_GAAN_SNAPPER == LOG_RUNNING) && (Npc_IsDead(gaans_snapper) == FALSE))
	{
		return TRUE;
	};
};

func void dia_gaan_monster_info()
{
	AI_Output(other,self,"DIA_Gaan_MONSTER_15_00");	//Jak ta nebezpe�n� bestie vypad�?
	AI_Output(self,other,"DIA_Gaan_MONSTER_03_01");	//Po��dn� nev�m. A� dote� jsem jen sly�el vr�en� a �kr�b�n�. Ale dok�u si p�edstavit, co ty zvuky vyd�valo.
	AI_Output(self,other,"DIA_Gaan_MONSTER_03_02");	//P�ed t�m nejsou v bezpe�� ani vlci. Ta bestie u� je do jednoho vyvra�dila.
};


instance DIA_GAAN_WASZAHLSTDU(C_INFO)
{
	npc = bau_961_gaan;
	nr = 9;
	condition = dia_gaan_waszahlstdu_condition;
	information = dia_gaan_waszahlstdu_info;
	description = "Kolik mi d�, kdy� tu bestii zabiju?";
};


func int dia_gaan_waszahlstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_gaan_monster) && (Npc_IsDead(gaans_snapper) == FALSE))
	{
		return TRUE;
	};
};

func void dia_gaan_waszahlstdu_info()
{
	AI_Output(other,self,"DIA_Gaan_WASZAHLSTDU_15_00");	//Kolik mi d�, kdy� tu bestii zabiju?
	AI_Output(self,other,"DIA_Gaan_WASZAHLSTDU_03_01");	//N�komu, kdo to zabije, bych dal v�echno, co m��u postr�dat.
	b_say_gold(self,other,30);
	MIS_GAAN_DEAL = LOG_RUNNING;
};


instance DIA_GAAN_WOHERMONSTER(C_INFO)
{
	npc = bau_961_gaan;
	nr = 10;
	condition = dia_gaan_wohermonster_condition;
	information = dia_gaan_wohermonster_info;
	description = "Kde ta zatracen� bestie �ije?";
};


func int dia_gaan_wohermonster_condition()
{
	if(Npc_KnowsInfo(other,dia_gaan_monster) && (Npc_IsDead(gaans_snapper) == FALSE))
	{
		return TRUE;
	};
};

func void dia_gaan_wohermonster_info()
{
	AI_Output(other,self,"DIA_Gaan_WOHERMONSTER_15_00");	//Kde ta zatracen� bestie �ije?
	AI_Output(self,other,"DIA_Gaan_WOHERMONSTER_03_01");	//N�kde mimo les. Mo�n� sem chod� z Hornick�ho �dol�. Ale nejsem si t�m jist�.
	AI_Output(self,other,"DIA_Gaan_WOHERMONSTER_03_02");	//Nikdy jsem v Hornick�m �dol� nebyl.
};


instance DIA_GAAN_MONSTERTOT(C_INFO)
{
	npc = bau_961_gaan;
	nr = 11;
	condition = dia_gaan_monstertot_condition;
	information = dia_gaan_monstertot_info;
	important = TRUE;
};


func int dia_gaan_monstertot_condition()
{
	if((Npc_IsDead(gaans_snapper) == TRUE) && (RANGERMEETINGRUNNING != LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_gaan_monstertot_info()
{
	AI_Output(self,other,"DIA_Gaan_MONSTERTOT_03_00");	//To odporn� zv��e je mrtv�.
	AI_Output(self,other,"DIA_Gaan_MONSTERTOT_03_01");	//Tak to zase m��u bez obav za��t lovit.
	if(MIS_GAAN_DEAL == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Gaan_MONSTERTOT_03_02");	//Tady jsou pen�ze, co jsem ti sl�bil.
		CreateInvItems(self,itmi_gold,30);
		b_giveinvitems(self,other,itmi_gold,30);
	};
	MIS_GAAN_SNAPPER = LOG_SUCCESS;
	b_giveplayerxp(XP_GAAN_WALDSNAPPER);
	AI_StopProcessInfos(self);
};


instance DIA_GAAN_ASKTEACHER(C_INFO)
{
	npc = bau_961_gaan;
	nr = 10;
	condition = dia_gaan_askteacher_condition;
	information = dia_gaan_askteacher_info;
	description = "M��e� m� nau�it n�co o lovu?";
};


func int dia_gaan_askteacher_condition()
{
	return TRUE;
};

func void dia_gaan_askteacher_info()
{
	AI_Output(other,self,"DIA_Gaan_AskTeacher_15_00");	//M��e� m� nau�it n�co o lovu?
	AI_Output(self,other,"DIA_Gaan_AskTeacher_03_01");	//��dn� probl�m. Za 100 zlat�ch ti uk�u, jak vyvrhnout zv��ata, co jsi skolil.
	AI_Output(self,other,"DIA_Gaan_AskTeacher_03_02");	//Ko�e�iny a ostatn� trofeje ti na trhu vyd�laj� spoustu pen�z.
	Log_CreateTopic(TOPIC_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_TEACHER,"Gaan nau��, jak z�skat trofeje ze zv��at.");
};


instance DIA_GAAN_PAYTEACHER(C_INFO)
{
	npc = bau_961_gaan;
	nr = 11;
	condition = dia_gaan_payteacher_condition;
	information = dia_gaan_payteacher_info;
	permanent = TRUE;
	description = "Tady. 100 zlat�ch za tv�j v�klad o vyvrhov�n� zv��at.";
};


var int dia_gaan_payteacher_noperm;

func int dia_gaan_payteacher_condition()
{
	if(Npc_KnowsInfo(other,dia_gaan_askteacher) && (DIA_GAAN_PAYTEACHER_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_gaan_payteacher_info()
{
	AI_Output(other,self,"DIA_Gaan_PayTeacher_15_00");	//Tady. 100 zlat�ch za tv�j v�klad o vyvrhov�n� zv��at.
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(self,other,"DIA_Gaan_PayTeacher_03_01");	//D�ky. Tak se mi to l�b�.
		GAAN_TEACHPLAYER = TRUE;
		DIA_GAAN_PAYTEACHER_NOPERM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Gaan_PayTeacher_03_02");	//P�ij� pozd�ji, a� bude� m�t n�jak� pen�ze.
	};
};


instance DIA_GAAN_TEACHHUNTING(C_INFO)
{
	npc = bau_961_gaan;
	nr = 12;
	condition = dia_gaan_teachhunting_condition;
	information = dia_gaan_teachhunting_info;
	permanent = TRUE;
	description = "Co m� m��e� nau�it?";
};


func int dia_gaan_teachhunting_condition()
{
	if(GAAN_TEACHPLAYER == TRUE)
	{
		return TRUE;
	};
};

func void dia_gaan_teachhunting_info()
{
	AI_Output(other,self,"DIA_Gaan_TEACHHUNTING_15_00");	//Co m� m��e� nau�it?
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSTING] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWING] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE) || ((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRGSNAPPERHORN] == FALSE) && (MIS_GAAN_SNAPPER == LOG_SUCCESS)))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_03_01");	//To z�le�� na tom, co chce� v�d�t.
		Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE)
		{
			Info_AddChoice(dia_gaan_teachhunting,b_buildlearnstring("Vyjmut� zub�",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_TEETH)),dia_gaan_teachhunting_teeth);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE)
		{
			Info_AddChoice(dia_gaan_teachhunting,b_buildlearnstring("Vyjmut� dr�p�",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CLAWS)),dia_gaan_teachhunting_claws);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE)
		{
			Info_AddChoice(dia_gaan_teachhunting,b_buildlearnstring("Sta�en� z k��e",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_FUR)),dia_gaan_teachhunting_fur);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSTING] == FALSE)
		{
			Info_AddChoice(dia_gaan_teachhunting,b_buildlearnstring("�ihadla krvav�ch much",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFSTING)),dia_gaan_teachhunting_bfsting);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWING] == FALSE)
		{
			Info_AddChoice(dia_gaan_teachhunting,b_buildlearnstring("K��dla krvav�ch much",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFWING)),dia_gaan_teachhunting_bfwing);
		};
		if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRGSNAPPERHORN] == FALSE) && (MIS_GAAN_SNAPPER == LOG_SUCCESS))
		{
			Info_AddChoice(dia_gaan_teachhunting,b_buildlearnstring("Roh dra��ho ch�apavce",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DRGSNAPPERHORN)),dia_gaan_teachhunting_drgsnapperhorn);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_03_02");	//Te� u� t� nem��u nau�it nic, co bys je�t� neznal. Promi�.
	};
};

func void dia_gaan_teachhunting_back()
{
	Info_ClearChoices(dia_gaan_teachhunting);
};

func void dia_gaan_teachhunting_claws()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_CLAWS))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Claws_03_00");	//Zv��ata o sv� dr�py p�ich�zej� opravdu nerada. �ez mus� v�st velmi p�esn�.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Claws_03_01");	//Tv� ruce by se m�ly lehce p�ekr�vat. Pak siln�m trhnut�m dr�p odd�l od okoln� tk�n�.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Claws_03_02");	//Obchodn�ci se mohou v�dycky p�etrhnout, aby za dr�py vysolili p�knou sumi�ku.
	};
	Info_ClearChoices(dia_gaan_teachhunting);
	Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
};

func void dia_gaan_teachhunting_teeth()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_TEETH))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Teeth_03_00");	//Nejsnadn�ji se z mrtv�ch zv��at z�sk�vaj� zuby. �ez mus� v jejich tlam� v�st t�sn� kolem nich.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Teeth_03_01");	//Pak je siln�m trhnut�m odd�l� od lebky.
	};
	Info_ClearChoices(dia_gaan_teachhunting);
	Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
};

func void dia_gaan_teachhunting_fur()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_FUR))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Fur_03_00");	//Nejlep�� zp�sob, jak z�skat ko�e�inu, je v�st hlubok� �ez pod�l kon�etin.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Fur_03_01");	//Pak u� je hra�ka st�hnout k��i od hlavy k ocasu.
	};
	Info_ClearChoices(dia_gaan_teachhunting);
	Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
};

func void dia_gaan_teachhunting_bfsting()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_BFSTING))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_BFSting_03_00");	//Tyhle mouchy maj� na h�bet� m�kk� m�sto.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_BFSting_03_01");	//Kdy� na n�j zatla��, vytla�� se �ihadlo daleko ze zade�ku a pak ho sta�� odd�lit no�em.
	};
	Info_ClearChoices(dia_gaan_teachhunting);
	Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
};

func void dia_gaan_teachhunting_bfwing()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_BFWING))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_BFWing_03_00");	//Nejlep�� zp�sob, jak odd�lit k��dla od t�la, je od��znout je ostr�m no�em t�sn� nad hrud�.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_BFWing_03_01");	//Mus� si d�vat velk� pozor, abys nepo�kodil velmi jemnou tk�� k��del. Pokud bude� p�i jejich odd�lov�n� neopatrn�, z�sk� akor�t bezcennou hromadu smet�.
	};
	Info_ClearChoices(dia_gaan_teachhunting);
	Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
};

func void dia_gaan_teachhunting_drgsnapperhorn()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_DRGSNAPPERHORN))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_DrgSnapperHorn_03_00");	//Te�, kdy� je ten p�erostl� ch�apavec mrtv�, ti m��u uk�zat, jak z�skat jeho roh.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_DrgSnapperHorn_03_01");	//Zano�� n�� hluboko do �ela a opatrn� tu v�c vyp��� nahoru.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_DrgSnapperHorn_03_02");	//Pokud to nep�jde odd�lit od lebky, pou�ij je�t� dal�� n�� z druh� strany.
		CreateInvItems(gaans_snapper,itat_drgsnapperhorn,1);
	};
	Info_ClearChoices(dia_gaan_teachhunting);
	Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
};


instance DIA_GAAN_JAGD(C_INFO)
{
	npc = bau_961_gaan;
	nr = 80;
	condition = dia_gaan_jagd_condition;
	information = dia_gaan_jagd_info;
	permanent = TRUE;
	description = "Jak jde lov?";
};


func int dia_gaan_jagd_condition()
{
	return TRUE;
};

func void b_wasmachtjagd()
{
	AI_Output(other,self,"DIA_Gaan_JAGD_15_00");	//Jak jde lov?
};

func void dia_gaan_jagd_info()
{
	b_wasmachtjagd();
	if(Npc_IsDead(gaans_snapper) == FALSE)
	{
		AI_Output(self,other,"DIA_Gaan_JAGD_03_01");	//Posledn� zv��e, co se mi poda�ilo zab�t, byla velk� krysa. Nic extra a nav�c z toho nic nek�pne.
		AI_Output(self,other,"DIA_Gaan_JAGD_03_02");	//Posledn�ch n�kolik dn� se tu potuluje n�jak� ufun�n� bestie.
		AI_Output(self,other,"DIA_Gaan_JAGD_03_03");	//Nejen, �e zab�j� v�echno, co se h�be, ale taky mi kaz� moji pr�ci.
		Log_CreateTopic(TOPIC_GAANSCHNAUBI,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_GAANSCHNAUBI,LOG_RUNNING);
		b_logentry(TOPIC_GAANSCHNAUBI,"Lovce Gaana tr�p� n�jak� podivn� nestv�ra. Dokud ji nezabiju, nebude moci d�l lovit.");
		MIS_GAAN_SNAPPER = LOG_RUNNING;
	}
	else if(KAPITEL >= 3)
	{
		AI_Output(self,other,"DIA_Gaan_JAGD_03_04");	//Za��n� tu b�t p�kn� bl�zinec. Z pr�smyku u� se sem mezit�m stihla nahrnout spousta t�ch fun�c�ch zv��at.
		AI_Output(self,other,"DIA_Gaan_JAGD_03_05");	//Za t�chto okolnost� je lov ��m d�l t�m obt�n�j��.
	}
	else
	{
		AI_Output(self,other,"DIA_Gaan_JAGD_03_06");	//Nem��u si st�ovat.
	};
};


instance DIA_GAAN_PICKPOCKET(C_INFO)
{
	npc = bau_961_gaan;
	nr = 900;
	condition = dia_gaan_pickpocket_condition;
	information = dia_gaan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_gaan_pickpocket_condition()
{
	return c_beklauen(23,35);
};

func void dia_gaan_pickpocket_info()
{
	Info_ClearChoices(dia_gaan_pickpocket);
	Info_AddChoice(dia_gaan_pickpocket,DIALOG_BACK,dia_gaan_pickpocket_back);
	Info_AddChoice(dia_gaan_pickpocket,DIALOG_PICKPOCKET,dia_gaan_pickpocket_doit);
};

func void dia_gaan_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_gaan_pickpocket);
};

func void dia_gaan_pickpocket_back()
{
	Info_ClearChoices(dia_gaan_pickpocket);
};

