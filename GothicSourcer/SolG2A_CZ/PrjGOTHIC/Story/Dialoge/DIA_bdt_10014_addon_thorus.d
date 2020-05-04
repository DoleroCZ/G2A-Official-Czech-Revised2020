
instance DIA_ADDON_BDT_10014_THORUS_EXIT(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 999;
	condition = dia_addon_thorus_exit_condition;
	information = dia_addon_thorus_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_thorus_exit_condition()
{
	return TRUE;
};

func void dia_addon_thorus_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BDT_10014_THORUS_HI(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 2;
	condition = dia_addon_thorus_hi_condition;
	information = dia_addon_thorus_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_thorus_hi_condition()
{
	if(RAVENISDEAD == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_thorus_hi_info()
{
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Hi_12_00");	//Zn� pravidla. Bez �erven� kamenn� desky se nikdo do dolu nedostane.
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Hi_15_01");	//Zapome� na d�l - mus�m se dostat k Ravenovi.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Hi_12_02");	//I tak. M�me pravidla, kter� plat� pro ka�d�ho. I pro tebe.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Hi_12_03");	//Vra� se. Pokud se pokus� vstoupit do horn� ��sti bez povolen�, str�e t� zabij�. TO jsou pravidla.
	if(!Npc_IsDead(esteban))
	{
		AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Hi_12_04");	//Pokud chce� m�t n�mitky, promluv si s Estebanem. Je zodpov�dn� za t�bor.
	};
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_ADDON_BDT_10014_THORUS_RAVEN(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 3;
	condition = dia_addon_thorus_raven_condition;
	information = dia_addon_thorus_raven_info;
	permanent = FALSE;
	description = "Je velmi d�le�it�, abych se dostal k Ravenovi ...";
};


func int dia_addon_thorus_raven_condition()
{
	if(RAVENISDEAD == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_thorus_raven_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Raven_15_00");	//Je velmi d�le�it�, abych se dostal k Ravenovi ...
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raven_12_01");	//Ano? Opravdu ve��, �e se k n�mu dostane�?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raven_12_02");	//Jeho str�e maj� rozkaz nikoho nevpou�t�t. Bude� mrtev d�iv, ne� ho v�bec spat��.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raven_12_03");	//Tak na to zapome�.
	Log_CreateTopic(TOPIC_ADDON_RAVENKDW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RAVENKDW,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RAVENKDW,"Raven je v�dce bandit�. Budu muset se k n�mu dostat podle pravidel, kter� tu jsou.");
};


instance DIA_ADDON_BDT_10014_THORUS_ZEIT(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 4;
	condition = dia_addon_thorus_zeit_condition;
	information = dia_addon_thorus_zeit_info;
	permanent = FALSE;
	description = "Vzpom�n� si na m�? Ze Star�ho t�bora ...";
};


func int dia_addon_thorus_zeit_condition()
{
	if(RAVENISDEAD == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_thorus_zeit_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Zeit_15_00");	//Vzpom�n� si na m�? Ze Star�ho t�bora ...
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_01");	//Jsi jeden z v�z��? Mo�n� jsi byl jeden z m�ch str��. Ano? D�l� to z n�s spojence?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_02");	//Ne, ned�l�.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_03");	//Mo�n� jsi �lov�k, kter� strhl bari�ru - mo�n� jsi zabil moje lidi.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_04");	//Tak co?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_05");	//Tyhle dny jsou pry�.
	if(!Npc_IsDead(esteban))
	{
		AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_06");	//Chce� vstoupit? Z�skej �erven� k�men a u� nepl�tvej m�m �asem.
	};
};


var int thorus_goodoldperm;

instance DIA_ADDON_BDT_10014_THORUS_GOODOLDPERM(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 4;
	condition = dia_addon_thorus_goodoldperm_condition;
	information = dia_addon_thorus_goodoldperm_info;
	permanent = TRUE;
	description = "No tak, pus� m�. Kv�li star�m dobr�m �as�m.";
};


func int dia_addon_thorus_goodoldperm_condition()
{
	if((MIS_SEND_BUDDLER != LOG_SUCCESS) && Npc_KnowsInfo(other,dia_addon_bdt_10014_thorus_zeit) && (RAVENISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_thorus_goodoldperm_info()
{
	AI_Output(other,self,"DIA_Addon_Thorus_Add_15_00");	//No tak, pus� m�. Kv�li star�m dobr�m �as�m.
	if(THORUS_GOODOLDPERM == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Thorus_Add_12_01");	//Dobr� - nech m� to vysv�tlit. V�, pro� jsem st�le na�ivu?
		AI_Output(self,other,"DIA_Addon_Thorus_Add_12_02");	//Proto�e jsem byl v�dy loaj�ln� ke sv�m lidem.
		AI_Output(self,other,"DIA_Addon_Thorus_Add_12_03");	//Nem�m r�d to, co Raven d�l�. Ale budu se dr�et pravidel.
		AI_Output(self,other,"DIA_Addon_Thorus_Add_12_04");	//A ty taky bude�!
		THORUS_GOODOLDPERM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Thorus_Add_12_05");	//(rozhodn�) NE!
	};
};

func int c_playerhaswrongtoken()
{
	if((c_schasmagicstoneplate() == TRUE) || (Npc_HasItems(hero,itwr_stoneplatecommon_addon) >= 1) || (Npc_HasItems(hero,itmi_addon_stone_02) >= 1) || (Npc_HasItems(hero,itmi_addon_stone_03) >= 1) || (Npc_HasItems(hero,itmi_addon_stone_04) >= 1) || (Npc_HasItems(hero,itmi_addon_stone_05) >= 1))
	{
		return TRUE;
	};
	return FALSE;
};


instance DIA_ADDON_BDT_10014_THORUS_STEIN(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 9;
	condition = dia_addon_thorus_stein_condition;
	information = dia_addon_thorus_stein_info;
	permanent = TRUE;
	description = "M�m pro tebe kamennou desku ...";
};


func int dia_addon_thorus_stein_condition()
{
	if((c_playerhaswrongtoken() == TRUE) && (RAVENISDEAD == FALSE) && (MIS_SEND_BUDDLER != LOG_RUNNING) && (MIS_SEND_BUDDLER != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_thorus_stein_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Stein_15_00");	//M�m pro tebe kamennou desku ...
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Stein_12_01");	//Ta je �patn�. Po��t� se jen �erven�.
};


instance DIA_ADDON_BDT_10014_THORUS_REIN(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 9;
	condition = dia_addon_thorus_rein_condition;
	information = dia_addon_thorus_rein_info;
	permanent = FALSE;
	description = "M�m �ervenou kamennou desku ...";
};


func int dia_addon_thorus_rein_condition()
{
	if((Npc_HasItems(other,itmi_addon_stone_01) >= 1) && (RAVENISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_thorus_rein_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Rein_15_00");	//M�m �ervenou kamennou desku ...
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_01");	//Dobr�.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_02");	//Vy��dil jsi Estebana - to znamen�, �e ty te� d�l� jeho pr�ci.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_03");	//V dole maj� p�r probl�mu s d�ln�mi �ervy.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_04");	//T�i kop��i jsou ji� po smrti. Je tv�j �kol opat�it nov�.
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Rein_15_05");	//A kdy se m��u kone�n� dostat do toho zatracen�ho dolu?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_06");	//Ud�lej svoji pr�ci - potom m��e� d�lat, co chce�.
	MIS_SEND_BUDDLER = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_BUDDLER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BUDDLER,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_BUDDLER,"Proto�e jsem te� dostal Esteban�v �kol, m�l bych poslat t�i kop��e do dolu.");
};


instance DIA_ADDON_BDT_10014_THORUS_SENT(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 9;
	condition = dia_addon_thorus_sent_condition;
	information = dia_addon_thorus_sent_info;
	permanent = FALSE;
	description = "Poslal jsem t�i chlapy.";
};


func int dia_addon_thorus_sent_condition()
{
	if((PLAYER_SENTBUDDLER >= 3) && (RAVENISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_thorus_sent_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Sent_15_00");	//Poslal jsem t�i chlapy.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Sent_12_01");	//Dobr�. Dokud se tady o to star�m j�, tak m��e� dovnit�.
	MIS_SEND_BUDDLER = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ADDON_BDT_10014_THORUS_ARMOR(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 99;
	condition = dia_addon_thorus_armor_condition;
	information = dia_addon_thorus_armor_info;
	permanent = FALSE;
	description = "Hej, a co tvoje brn�n�? Kde dostanu takov�?";
};


func int dia_addon_thorus_armor_condition()
{
	if(RAVENISDEAD == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_thorus_armor_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Armor_15_00");	//Hej, a co tvoje brn�n�? Kde dostanu takov�?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Armor_12_01");	//Nikde. Zbroj je ur�ena pro Ravenovy str�e.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Armor_12_02");	//Nev���m, �e je tu mo�nost, pro nov� �adatele. Ale kone�n� rozhodnut� nen� moje, ale sp�e na Ravenovi.
};


instance DIA_ADDON_THORUS_GEFANGENE(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 88;
	condition = dia_addon_thorus_gefangene_condition;
	information = dia_addon_thorus_gefangene_info;
	permanent = FALSE;
	description = "A co s v�zni?";
};


func int dia_addon_thorus_gefangene_condition()
{
	if(!Npc_IsDead(bloodwyn) && Npc_KnowsInfo(other,dia_addon_patrick_hi))
	{
		return TRUE;
	};
};

func void dia_addon_thorus_gefangene_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Gefangene_15_00");	//A co je s v�zni?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Gefangene_12_01");	//Mmh, jejich pr�ce skon�ila. Co j� v�m, tak te� doluj� zlato.
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Gefangene_15_02");	//A pokud se pokus� o �t�k ... ?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Gefangene_12_03");	//... Bloodwyn za nimy po�le sv� str�e. Ale nev���m, �e jsou dost ��len�, aby se pokusili o �t�k.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Gefangene_12_04");	//Jestli�e ...
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Gefangene_15_05");	//Jestli�e co?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Gefangene_12_06");	//... je n�kdo jin� nebude podporovat. Ale v�m, �e nikdo nen� tak blb�, aby to ud�lal ... v ka�d�m p��pad�, dokud je tu Bloodwyn.
	b_say(other,self,"$VERSTEHE");
};


instance DIA_ADDON_THORUS_SPEECH(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 99;
	condition = dia_addon_thorus_speech_condition;
	information = dia_addon_thorus_speech_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_thorus_speech_condition()
{
	if(Npc_IsDead(bloodwyn))
	{
		return TRUE;
	};
};

func void dia_addon_thorus_speech_info()
{
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_00");	//Co m� vlastn� v �myslu d�lat?
	AI_Output(other,self,"DIA_Addon_Thorus_Speech_15_01");	//Co??
	if(RAVENISDEAD == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_02");	//Te� jsi odstranil z cesty Bloodvyna. Pt�m se s�m sebe: Kdo dal��. Raven? Nebo j�?
		AI_Output(other,self,"DIA_Addon_Thorus_Speech_15_03");	//Boj� se?
		AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_04");	//Neboj�m se bitvy. Ale d�sledku tv�ch �in�.
	};
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_05");	//Tenhle t�bor je jedin� v�c, co n�m zbyla.
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_06");	//Nepracuje to sice tak, aby to ka�d�ho uspokojilo - Ale PRACUJE to.
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_07");	//A s ka�d�m chlapem, kter�ho zabije� se na�e kolonie ten��.
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_08");	//Jsme bandit�. Zadr�ovan�, nez�konn�, opovrhovan�.
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_09");	//Kamkoli jdeme, lov� n�s, v�zn� n�s, zab�j� n�s.
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_10");	//Nen� lep��ho m�sta, ne� tohohle, a lep�� �as ne� te�.
	AI_Output(other,self,"DIA_Addon_Thorus_Speech_15_11");	//Tak co tedy chce�?
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_12");	//Tihle mu�i pot�ebuj� n�koho, kdo by je vedl. Kdo by to m�l d�lat? Ty? N�kdo, kdo neust�le chod� z m�sta na m�sto?
};


instance DIA_ADDON_THORUS_ANSWER(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 99;
	condition = dia_addon_thorus_answer_condition;
	information = dia_addon_thorus_answer_info;
	permanent = FALSE;
	description = "Dobr� - pro� se ty nestane� v�dcem v t�bo�e?";
};


func int dia_addon_thorus_answer_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_thorus_speech))
	{
		return TRUE;
	};
};

func void dia_addon_thorus_answer_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Answer_15_00");	//Dobr� - pro� se ty nestane� v�dcem v t�bo�e?
	if(RAVENISDEAD == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Answer_12_01");	//Dobr�, ale co Raven?
		AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Answer_15_02");	//Raven bude m�t brzy jin� probl�my. Postar�m se o to.
	};
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Answer_15_03");	//A postarej se, �e v�zni budou moci odej�t.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Answer_12_04");	//Oukej. Postar�m se o v�echny str�e venku.
	b_logentry(TOPIC_ADDON_SKLAVEN,"Bloodwyn je mrtev a Thorus bude m�t starosti, �e otroci budou moci odej�t.");
	if(!Npc_IsDead(prisonguard))
	{
		b_logentry(TOPIC_ADDON_SKLAVEN,"Te� si promluv�m je�t� jednou s 'Otro�� hl�dkou', potom m��e Patrick a jeho ho�i zmizet.");
	}
	else
	{
		b_logentry(TOPIC_ADDON_SKLAVEN,"Pot� co jsem promluvil s 'Otro�� hl�dkou', Patrick a jeho chlapi m��ou zmizet.");
	};
};


instance DIA_ADDON_THORUS_RAVENTOT(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 99;
	condition = dia_addon_thorus_raventot_condition;
	information = dia_addon_thorus_raventot_info;
	permanent = FALSE;
	description = "Dok�zal jsem to. Raven je mrtev.";
};


func int dia_addon_thorus_raventot_condition()
{
	if(RAVENISDEAD == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_thorus_raventot_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Raventot_15_00");	//Dok�zal jsem to. Raven je mrtev.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raventot_12_01");	//T�m jsi zkrvavil Beliarovi nos.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raventot_12_02");	//P�jde� te�?
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Raventot_15_03");	//Moje pr�ce v tomhle �dol� skon�ila. M��u p�r dn� odpo��vat.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raventot_12_04");	//(sm�je se) Ano, jsi st�le na cest�? (v�n�) P�eji dobrou cestu.
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Raventot_15_05");	//Kdo v�, mo�n� na sebe znovu natref�me.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raventot_12_06");	//Kdo v�. Je tady mnoho bran a dve��, kter�mi projde�. A u n�kter� z nich m� najde� ...
	AI_StopProcessInfos(self);
};

