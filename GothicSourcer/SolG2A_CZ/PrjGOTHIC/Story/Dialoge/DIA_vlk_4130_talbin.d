
instance DIA_TALBIN_EXIT(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 999;
	condition = dia_talbin_exit_condition;
	information = dia_talbin_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_talbin_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_talbin_exit_info()
{
	AI_StopProcessInfos(self);
};


var int talbin_runs;

instance DIA_TALBIN_HALLO(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 5;
	condition = dia_talbin_hallo_condition;
	information = dia_talbin_hallo_info;
	important = TRUE;
};


func int dia_talbin_hallo_condition()
{
	if(KAPITEL <= 3)
	{
		return TRUE;
	};
};

func void dia_talbin_hallo_info()
{
	AI_Output(self,other,"DIA_Talbin_HALLO_07_00");	//St�j! Ani hnout!
	AI_Output(other,self,"DIA_Talbin_HALLO_15_01");	//Jo! Jenom klid!
	AI_Output(self,other,"DIA_Talbin_HALLO_07_02");	//No to m� podr�! Dal�� ztracen� vove�ka, co? Nejd��v jsem t� m�l za jednoho z t�ch zlejch �mejd�, co tu po��d vopruzujou.
	AI_Output(self,other,"DIA_Talbin_HALLO_07_03");	//Ale vid�m, �e k nim nejsp� nepat��. Na to p�sob� a� moc ne�kodn�!
};


instance DIA_TALBIN_WASMACHTIHR(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 6;
	condition = dia_talbin_wasmachtihr_condition;
	information = dia_talbin_wasmachtihr_info;
	description = "Vypad� jak lovec, kter� nev�, co s �asem.";
};


func int dia_talbin_wasmachtihr_condition()
{
	if(TALBIN_RUNS == FALSE)
	{
		return TRUE;
	};
};

func void dia_talbin_wasmachtihr_info()
{
	AI_Output(other,self,"DIA_Talbin_WASMACHTIHR_15_00");	//Vypad� jak lovec, kter� nev�, co s �asem.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_07_01");	//Ha-ha! Jo - jedna nula pro tebe. Ale co m�m d�lat - p�es pr�smyk se vr�tit nem��u!
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_07_02");	//Tak tu prost� tr��m a d�l�m, co se d�.
	if(Npc_IsDead(engrom) == FALSE)
	{
		AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_07_03");	//Je mi ale l�to m�ho k�mo�e Engroma.
	};
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_07_04");	//Poj� bl� k vohni a voh�ej se.
	Info_ClearChoices(dia_talbin_wasmachtihr);
	Info_AddChoice(dia_talbin_wasmachtihr,DIALOG_BACK,dia_talbin_wasmachtihr_back);
	Info_AddChoice(dia_talbin_wasmachtihr,"Ale nevypad�, �e by se ti da�ilo n�jak �patn�.",dia_talbin_wasmachtihr_gut);
	Info_AddChoice(dia_talbin_wasmachtihr,"Ty jsi b�val� v�ze�, kter� byl uvr�en za bari�ru?",dia_talbin_wasmachtihr_strf);
};

func void dia_talbin_wasmachtihr_back()
{
	Info_ClearChoices(dia_talbin_wasmachtihr);
};

func void dia_talbin_wasmachtihr_strf()
{
	AI_Output(other,self,"DIA_Talbin_WASMACHTIHR_strf_15_00");	//Ty jsi b�val� v�ze�, kter� byl uvr�en za bari�ru?
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_01");	//Ne, kdepak! Co si mysl�? Vlastn� jsem se tady cht�l jenom trochu napakovat.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_02");	//N�kdo mi napov�dal, �e v t�chhle kon�in�ch ulov�m spoustu v�c�.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_03");	//�e je to tu prost� bohat� na v�ecko, jestli v�, co mysl�m.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_04");	//Ale vod t� doby, co se tu objevili ti zatracen� sk�eti, tu m��e� dostat tak akor�t p�r p�es �u�u, kdy� n�hodou popojde� trochu d�l!
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_05");	//A ti pitomci m� tu nechali po��dn� vydusit.
	AI_Output(other,self,"DIA_Talbin_WASMACHTIHR_strf_15_06");	//Takov� vtip�lky moc dob�e zn�m!
};

func void dia_talbin_wasmachtihr_gut()
{
	AI_Output(other,self,"DIA_Talbin_WASMACHTIHR_gut_15_00");	//Ale nevypad�, �e by se ti da�ilo n�jak �patn�.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_gut_07_01");	//No, mohlo to b�t hor�� - mysl�m, �e si nem��u st�ovat. I p�es ty zatracen� sk�ety je oblast kolem �eky nejm�� nebezpe�n�.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_gut_07_02");	//Vypad� to, �e si netroufaj� moc bl�zko k vod�, ale mo�n� je to jenom n�hoda.
};


instance DIA_TALBIN_SORRYFORENGROM(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 7;
	condition = dia_talbin_sorryforengrom_condition;
	information = dia_talbin_sorryforengrom_info;
	description = "Pro� je ti Engroma l�to?";
};


func int dia_talbin_sorryforengrom_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_wasmachtihr) && (Npc_IsDead(engrom) == FALSE) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (KAPITEL <= 3) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_sorryforengrom_info()
{
	AI_Output(other,self,"DIA_Talbin_SORRYFORENGROM_15_00");	//Pro� je ti Engroma l�to?
	AI_Output(self,other,"DIA_Talbin_SORRYFORENGROM_07_01");	//Proto�e �el prost� se mnou, a to �pln� bez �e��.
	AI_Output(self,other,"DIA_Talbin_SORRYFORENGROM_07_02");	//A te� jsme se dostali do tohohle srabu. Chamtivost se holt nevypl�c�.
};


instance DIA_TALBIN_WASJAGDIHR(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 8;
	condition = dia_talbin_wasjagdihr_condition;
	information = dia_talbin_wasjagdihr_info;
	description = "Co tady u �eky lov�?";
};


func int dia_talbin_wasjagdihr_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_wasmachtihr) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_wasjagdihr_info()
{
	AI_Output(other,self,"DIA_Talbin_WASJAGDIHR_15_00");	//Co tady u �eky lov�?
	AI_Output(self,other,"DIA_Talbin_WASJAGDIHR_07_01");	//To je ale vot�zka! Jen se projdi pod�l koryta a uvid�, co tu asi tak m��u lovit. ��havce, samoz�ejm�!
	AI_Output(self,other,"DIA_Talbin_WASJAGDIHR_07_02");	//Ty potvory se nechytaj zrovna snadno, ale chutnaj mnohem l�p, ne� se lov�j.
	AI_Output(self,other,"DIA_Talbin_WASJAGDIHR_07_03");	//Jednou za �as naraz�m i na mrcho�routa. A ani nad n�m nevohrnuju nos!
};


instance DIA_TALBIN_ENGROMANGRY(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 9;
	condition = dia_talbin_engromangry_condition;
	information = dia_talbin_engromangry_info;
	description = "Mysl�m, �e tv�j k�mo� je tro�ku vystresovan�.";
};


func int dia_talbin_engromangry_condition()
{
	if(Npc_KnowsInfo(other,dia_engrom_whataboutleaving) && Npc_KnowsInfo(other,dia_talbin_sorryforengrom) && (Npc_IsDead(engrom) == FALSE) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (KAPITEL <= 3) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_engromangry_info()
{
	AI_Output(other,self,"DIA_Talbin_ENGROMANGRY_15_00");	//Mysl�m, �e tv�j k�mo� je tro�ku vystresovan�.
	AI_Output(self,other,"DIA_Talbin_ENGROMANGRY_07_01");	//Nech si toho. Rad�i ho v�bec neprovokuj, nebo m� p�iprav� o hlavu. V t�hle v�ci u� prost� nem��u nic d�lat.
	AI_Output(self,other,"DIA_Talbin_ENGROMANGRY_07_02");	//Jednou to ale zvl�dnu!
};


instance DIA_TALBIN_ASKTEACHER(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 10;
	condition = dia_talbin_askteacher_condition;
	information = dia_talbin_askteacher_info;
	description = "M��e� m� nau�it n�co o lovu?";
};


func int dia_talbin_askteacher_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_wasjagdihr) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_askteacher_info()
{
	AI_Output(other,self,"DIA_Talbin_AskTeacher_15_00");	//M��e� m� nau�it n�co o lovu?
	AI_Output(self,other,"DIA_Talbin_AskTeacher_07_01");	//Ch�pu! Tak�e jsi dostal taky chu� lovit. No dob�e, ale bude t� to n�co st�t!
	AI_Output(other,self,"DIA_Talbin_AskTeacher_15_02");	//Co za to chce�?
	AI_Output(self,other,"DIA_Talbin_AskTeacher_07_03");	//Nem� n�hodou k j�dlu n�co jin�ho ne� ��hav�� maso? T�eba kus sejra. Jo, dal bych hlavu za kus sejra.
	AI_Output(other,self,"DIA_Talbin_AskTeacher_15_04");	//Uvid�m, co se d� d�lat.
	Log_CreateTopic(TOPIC_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_TEACHER,"Talbin m� nau��, jak ze zv��at z�sk�vat trofeje.");
};


instance DIA_TALBIN_PAYTEACHER(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 11;
	condition = dia_talbin_payteacher_condition;
	information = dia_talbin_payteacher_info;
	permanent = TRUE;
	description = "Tady m� ten s�r. Bude� m� te� u�it?";
};


var int dia_talbin_payteacher_noperm;

func int dia_talbin_payteacher_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_askteacher) && (DIA_TALBIN_PAYTEACHER_NOPERM == FALSE) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_payteacher_info()
{
	if(b_giveinvitems(other,self,itfo_cheese,1))
	{
		AI_Output(other,self,"DIA_Talbin_PayTeacher_15_00");	//Tady m� ten s�r. Bude� m� te� u�it?
		AI_Output(self,other,"DIA_Talbin_PayTeacher_07_01");	//Fakt jsi ��kej schrastil? P�ni, chlape, u� je to cel� v�ky, kdy sem ba�til n�co takov�ho. D�ky. No a co... aha. Nojo. Jasn�!
		TALBIN_TEACHANIMALTROPHY = TRUE;
		DIA_TALBIN_PAYTEACHER_NOPERM = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Talbin_PayTeacher_15_02");	//Te� u sebe zrovna ��dn� s�r nem�m.
		AI_Output(self,other,"DIA_Talbin_PayTeacher_07_03");	//Je to prost� moc dobr�, ne� aby to byla pravda. Ale ur�it� mi dej v�d�t, a� ��kej se�ene�!
	};
};


instance DIA_TALBIN_TEACHHUNTING(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 12;
	condition = dia_talbin_teachhunting_condition;
	information = dia_talbin_teachhunting_info;
	permanent = TRUE;
	description = "Co m� m��e� nau�it?";
};


func int dia_talbin_teachhunting_condition()
{
	if((TALBIN_TEACHANIMALTROPHY == TRUE) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_teachhunting_info()
{
	AI_Output(other,self,"DIA_Talbin_TEACHHUNTING_15_00");	//Co m� m��e� nau�it?
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_SHADOWHORN] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_HEART] == FALSE))
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_07_01");	//Co bys r�d v�d�l?
		Info_AddChoice(dia_talbin_teachhunting,DIALOG_BACK,dia_talbin_teachhunting_back);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE)
		{
			Info_AddChoice(dia_talbin_teachhunting,b_buildlearnstring("Vyjmut� dr�p�",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CLAWS)),dia_talbin_teachhunting_claws);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE)
		{
			Info_AddChoice(dia_talbin_teachhunting,b_buildlearnstring("Sta�en� z k��e",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_FUR)),dia_talbin_teachhunting_fur);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_SHADOWHORN] == FALSE)
		{
			Info_AddChoice(dia_talbin_teachhunting,b_buildlearnstring("Roh st�nov� �elmy",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_SHADOWHORN)),dia_talbin_teachhunting_shadowhorn);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_HEART] == FALSE)
		{
			Info_AddChoice(dia_talbin_teachhunting,b_buildlearnstring("Vy��znut� srdce",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_HEART)),dia_talbin_teachhunting_heart);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_07_02");	//Tak v tom t� mus�m zklamat. U� zn� v�ecko, co bych t� mohl nau�it. Ale i tak e�t� jednou d�kuju za ten sejr!
	};
};

func void dia_talbin_teachhunting_back()
{
	Info_ClearChoices(dia_talbin_teachhunting);
};

func void dia_talbin_teachhunting_claws()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_CLAWS))
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Claws_07_00");	//Dr�py vynd� pom�rn� jednodu�e. Prost� ka�dej popadne� p��mo za kloub a p�itla�� d�lu.
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Claws_07_01");	//A pak u� ho jenom vopatrn� vod��zne� no�em.
	};
	Info_ClearChoices(dia_talbin_teachhunting);
};

func void dia_talbin_teachhunting_fur()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_FUR))
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Fur_07_00");	//��hav�� k��i nejleh�ejc st�hne� tak, �e ud�l� dlouhej �ez pod�l b�icha...
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Fur_07_01");	//...pak �kubne� za zadn� nohy a celou k��i vodzadu dop�edu z t� potvory strhne�.
	};
	Info_ClearChoices(dia_talbin_teachhunting);
};

func void dia_talbin_teachhunting_shadowhorn()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_SHADOWHORN))
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_ShadowHorn_07_00");	//Rohy st�novejch �elem jsou po��dn� tvrd� - vyr�b�j se z nich hlavn� so�ky a r�zn� n�stroje.
	};
	Info_ClearChoices(dia_talbin_teachhunting);
};

func void dia_talbin_teachhunting_heart()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_HEART))
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Heart_07_00");	//Srdce magickejch tvor� jsou setsakramentsky vz�cn� a z�sk� je fakt t�ko. Kdy� to zkou��, bu� po��dn� vopatrnej, zvl᚝ kdy� jde vo golemy.
	};
	Info_ClearChoices(dia_talbin_teachhunting);
};


instance DIA_TALBIN_KAP3_EXIT(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 999;
	condition = dia_talbin_kap3_exit_condition;
	information = dia_talbin_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_talbin_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_talbin_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TALBIN_KAP4_EXIT(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 999;
	condition = dia_talbin_kap4_exit_condition;
	information = dia_talbin_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_talbin_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_talbin_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TALBIN_KAP4_WASNEUES(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 13;
	condition = dia_talbin_kap4_wasneues_condition;
	information = dia_talbin_kap4_wasneues_info;
	description = "Nev�iml sis, �e by tudy n�kdo pro�el?";
};


func int dia_talbin_kap4_wasneues_condition()
{
	if((KAPITEL >= 4) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_kap4_wasneues_info()
{
	AI_Output(other,self,"DIA_Talbin_KAP4_WASNEUES_15_00");	//Nev�iml sis, �e by tudy n�kdo pro�el?
	AI_Output(self,other,"DIA_Talbin_KAP4_WASNEUES_07_01");	//Jo, ned�vno tudy prob�hlo p�r takovejch divnejch chl�pk�. Vykra�ovali si v tom sv�m nale�t�n�m brn�n� jak p�vi a chovali se, jako dy� se�rali v�ecku moudrost sv�ta.
};


instance DIA_TALBIN_KAP4_WASWOLLTENDJG(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 14;
	condition = dia_talbin_kap4_waswolltendjg_condition;
	information = dia_talbin_kap4_waswolltendjg_info;
	description = "A co tady ti 'divn� chl�pkov�' cht�li?";
};


func int dia_talbin_kap4_waswolltendjg_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_kap4_wasneues) && (KAPITEL >= 4) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_kap4_waswolltendjg_info()
{
	AI_Output(other,self,"DIA_Talbin_KAP4_WASWOLLTENDJG_15_00");	//A co tady ti 'divn� chl�pkov�' cht�li?
	AI_Output(self,other,"DIA_Talbin_KAP4_WASWOLLTENDJG_07_01");	//Cht�li po mn� proviant a vybaven�. Chlape, dyk j� m�m sotva dost pro sebe!
	AI_Output(self,other,"DIA_Talbin_KAP4_WASWOLLTENDJG_07_02");	//Pr� zab�jej� draky a tak. B�hv� vodku� ti ho�ani p�i�li, ale nevypadali moc d�v�ryhodn�!
	if(KAPITEL == 4)
	{
		b_logentry(TOPIC_DRAGONHUNTER,"U s�dla lovce Talbina se zastavilo n�kolik drakobijc�.");
	};
};


instance DIA_TALBIN_WOENGROM(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 15;
	condition = dia_talbin_woengrom_condition;
	information = dia_talbin_woengrom_info;
	description = "Ty jsi tu v t�hle chv�li s�m?";
};


func int dia_talbin_woengrom_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_wasmachtihr) && (KAPITEL >= 4) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (ENGROMISGONE == TRUE) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_woengrom_info()
{
	AI_Output(other,self,"DIA_Talbin_WOENGROM_15_00");	//Ty jsi tu v t�hle chv�li s�m?
	AI_Output(self,other,"DIA_Talbin_WOENGROM_07_01");	//Jo. M�j k�mo� Engrom u� toho m�l dost a zdrhnul. V�era tvrdil, �e m�l ��kou vizi, �e na n�j prej n�kdo d�sn� jemn� mluvil.
	AI_Output(self,other,"DIA_Talbin_WOENGROM_07_02");	//J� ale nesly�el ani �uk. Prost� jsem si myslel, �e u� se tot�ln� zcvoknul a...
	AI_Output(self,other,"DIA_Talbin_WOENGROM_07_03");	//...a pak byl najednou pry�. Nem�m tu��ka, kam se ztratil.
	AI_Output(self,other,"DIA_Talbin_WOENGROM_07_04");	//Kdybys Engrema n�hodou n�kde zahl�d, tak mu vy�i�, �e mi ten hajzl e�t� furt dlu�� k��i z ��havce.
	if(Npc_KnowsInfo(other,dia_engrom_whataboutleaving))
	{
		AI_Output(other,self,"DIA_Talbin_WOENGROM_15_05");	//M�l jsem ale dojem, �e se vocu� nechce hnout, dokud nebudou pry� v�ichni sk�eti.
		AI_Output(self,other,"DIA_Talbin_WOENGROM_07_06");	//Jak sem �ek - je v tom n�co divn�ho.
	};
	MIS_TABIN_LOOKFORENGROM = LOG_RUNNING;
};


instance DIA_TALBIN_FOUNDENGROM(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 16;
	condition = dia_talbin_foundengrom_condition;
	information = dia_talbin_foundengrom_info;
	description = "Na�el jsem tv�ho k�mo�e Engroma.";
};


func int dia_talbin_foundengrom_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_woengrom) && ((NPCOBSESSEDBYDMT_ENGROM == TRUE) || Npc_HasItems(other,itat_talbinslurkerskin)) && (KAPITEL >= 4) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_foundengrom_info()
{
	AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_00");	//Na�el jsem tv�ho k�mo�e Engroma.
	AI_Output(self,other,"DIA_Talbin_FOUNDENGROM_07_01");	//Fakt? A kde je?
	if(Npc_IsDead(engrom))
	{
		AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_02");	//Je mrtv�.
	}
	else
	{
		AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_03");	//Ani sem nedoufal, �e ho e�t� n�kdy uvid�m.
	};
	if(b_giveinvitems(other,self,itat_talbinslurkerskin,1))
	{
		AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_04");	//Tum� - m�l u sebe tuhle ��hav�� k��i.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_05");	//Posedli ho P�tra�i.
		AI_Output(self,other,"DIA_Talbin_FOUNDENGROM_07_06");	//P�tra�i? A kdo to m� jako bejt?
		AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_07");	//Slu�ebn�ci z doln�ch zem�. To oni ve skute�nosti vel� v�em t�m sk�et�m.
	};
	AI_Output(self,other,"DIA_Talbin_FOUNDENGROM_07_08");	//P�i Innosovi! Mus�m se vocu� dostat, i kdyby m� to m�lo st�t krk! Te� nebo nikdy!
	AI_StopProcessInfos(self);
	Log_CreateTopic(TOPIC_TALBIN_RUNS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TALBIN_RUNS,LOG_RUNNING);
	b_logentry(TOPIC_TALBIN_RUNS,"Talbin, lovec z Hornick�ho �dol�, prob�hl p�es pr�smyk, i kdy� m�l v pat�ch cel� roje krvav�ch much. Mysl�m, �e m��� do Khorinisu.");
	b_giveplayerxp(XP_AMBIENT);
	Npc_ExchangeRoutine(self,"FleePass");
	Wld_InsertNpc(snapper,"START");
	TALBIN_RUNS = TRUE;
};


instance DIA_TALBIN_WOHIN(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 17;
	condition = dia_talbin_wohin_condition;
	information = dia_talbin_wohin_info;
	permanent = TRUE;
	description = "Kam se vyd�?";
};


func int dia_talbin_wohin_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_foundengrom) && (TALBIN_FOLLOWSTHROUGHPASS == 0))
	{
		return TRUE;
	};
};

func void dia_talbin_wohin_info()
{
	AI_Output(other,self,"DIA_Talbin_WOHIN_15_00");	//Kam se vyd�?
	if(Npc_GetDistToWP(self,"START") < 1000)
	{
		AI_Output(self,other,"DIA_Talbin_WOHIN_07_01");	//Prove� m� pr�smykem! Pros�m!!!
		Info_ClearChoices(dia_talbin_wohin);
		Info_AddChoice(dia_talbin_wohin,"Nem�m na tebe �as.",dia_talbin_wohin_);
		Info_AddChoice(dia_talbin_wohin,"B� d�l a projdi pr�smykem.",dia_talbin_wohin_durch);
		Info_AddChoice(dia_talbin_wohin,"Dobr�.",dia_talbin_wohin_ok);
	}
	else
	{
		AI_Output(self,other,"DIA_Talbin_WOHIN_07_02");	//Mus�m se vocu� dostat, p�es pr�smyk. Jdi mi z cesty!
		AI_StopProcessInfos(self);
	};
};

func void dia_talbin_wohin_ok()
{
	AI_Output(other,self,"DIA_Talbin_WOHIN_ok_15_00");	//Dobr�.
	AI_Output(self,other,"DIA_Talbin_WOHIN_ok_07_01");	//D�ky ti - prost� b� nap�ed a j� pudu za tebou.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"IntoPass");
	TALBIN_FOLLOWSTHROUGHPASS = LOG_RUNNING;
	self.flags = NPC_FLAG_IMMORTAL;
};

func void dia_talbin_wohin_durch()
{
	AI_Output(other,self,"DIA_Talbin_WOHIN_durch_15_00");	//B� d�l a projdi pr�smykem.
	AI_Output(self,other,"DIA_Talbin_WOHIN_durch_07_01");	//Je tam takov� tma - nikdy bych se tam s�m nevodv�il.
};

func void dia_talbin_wohin_()
{
	AI_Output(other,self,"DIA_Talbin_WOHIN_schwein_15_00");	//Nem�m na tebe �as.
	AI_Output(self,other,"DIA_Talbin_WOHIN_schwein_07_01");	//Tak�e ty m� tu nech�, aby m� se�raly vr�ny. Za tohle se bude� sma�it v pekle!
	TALBIN_FOLLOWSTHROUGHPASS = LOG_OBSOLETE;
	AI_StopProcessInfos(self);
};


instance DIA_TALBIN_VERSCHWINDE(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 15;
	condition = dia_talbin_verschwinde_condition;
	information = dia_talbin_verschwinde_info;
	permanent = TRUE;
	description = "Hej.";
};


func int dia_talbin_verschwinde_condition()
{
	if(TALBIN_FOLLOWSTHROUGHPASS == LOG_OBSOLETE)
	{
		return TRUE;
	};
};

func void dia_talbin_verschwinde_info()
{
	AI_Output(other,self,"DIA_Talbin_VERSCHWINDE_15_00");	//Hej.
	AI_Output(self,other,"DIA_Talbin_VERSCHWINDE_07_01");	//Zmizni. Zvl�dnu to i bez tebe, ty parchante!
	AI_StopProcessInfos(self);
};


instance DIA_TALBIN_KAP5_EXIT(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 999;
	condition = dia_talbin_kap5_exit_condition;
	information = dia_talbin_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_talbin_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_talbin_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TALBIN_KAP6_EXIT(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 999;
	condition = dia_talbin_kap6_exit_condition;
	information = dia_talbin_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_talbin_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_talbin_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TALBIN_PICKPOCKET(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 900;
	condition = dia_talbin_pickpocket_condition;
	information = dia_talbin_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_talbin_pickpocket_condition()
{
	return c_beklauen(40,25);
};

func void dia_talbin_pickpocket_info()
{
	Info_ClearChoices(dia_talbin_pickpocket);
	Info_AddChoice(dia_talbin_pickpocket,DIALOG_BACK,dia_talbin_pickpocket_back);
	Info_AddChoice(dia_talbin_pickpocket,DIALOG_PICKPOCKET,dia_talbin_pickpocket_doit);
};

func void dia_talbin_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_talbin_pickpocket);
};

func void dia_talbin_pickpocket_back()
{
	Info_ClearChoices(dia_talbin_pickpocket);
};

