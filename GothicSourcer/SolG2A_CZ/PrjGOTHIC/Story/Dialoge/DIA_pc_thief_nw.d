
instance DIA_DIEGONW_EXIT(C_INFO)
{
	npc = pc_thief_nw;
	nr = 999;
	condition = dia_diegonw_exit_condition;
	information = dia_diegonw_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_diegonw_exit_condition()
{
	return TRUE;
};

func void dia_diegonw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DIEGONW_PERM(C_INFO)
{
	npc = pc_thief_nw;
	nr = 998;
	condition = dia_diegonw_perm_condition;
	information = dia_diegonw_perm_info;
	permanent = TRUE;
	description = "Jak jdou obchody?";
};


func int dia_diegonw_perm_condition()
{
	if(DIEGO_ISONBOARD == FALSE)
	{
		return TRUE;
	};
};

func void dia_diegonw_perm_info()
{
	AI_Output(other,self,"DIA_DiegoNW_Perm_15_00");	//Jak jdou obchody?
	AI_Output(self,other,"DIA_DiegoNW_Perm_11_01");	//Mizern�. N�kdo mi m�l ��ct, �e to s Khorinisem �lo k ��pku.
	AI_Output(other,self,"DIA_DiegoNW_Perm_15_02");	//No nev�m. J� to m�sto zn�m jenom takhle.
	AI_Output(self,other,"DIA_DiegoNW_Perm_11_03");	//M�l jsi ho vid�t p�ed p�r lety. To by se ti v�n� l�bilo.
};


instance DIA_DIEGONW_NEEDHELP(C_INFO)
{
	npc = pc_thief_nw;
	nr = 1;
	condition = dia_diegonw_needhelp_condition;
	information = dia_diegonw_needhelp_info;
	important = TRUE;
};


func int dia_diegonw_needhelp_condition()
{
	if(DIEGO_ISONBOARD == FALSE)
	{
		return TRUE;
	};
};

func void dia_diegonw_needhelp_info()
{
	if(DIEGO_ISDEAD == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_01");	//Netva� se tak p�ekvapen�.
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_02");	//(sm�je se) Ty jsi si opravdu myslel, �e jsem se mrtv�?
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_03");	//Byl jsem chv�li v bezv�dom�. Nicm�n� �iji, jak sis mohl v�imnout.
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_04");	//A nyn� jsme spolu. A to se po��t�.
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_05");	//Pot�ebuji tvou pomoc.
	}
	else
	{
		AI_Output(self,other,"DIA_DiegoNW_NeedHelp_11_00");	//Dob�e �e jsi tady. Bude� mi muset pomoci.
	};
	Info_ClearChoices(dia_diegonw_needhelp);
	if(diegoow.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
	};
	Info_AddChoice(dia_diegonw_needhelp,"Co je tohle za �aty?",dia_diegonw_needhelp_clothes);
	Info_AddChoice(dia_diegonw_needhelp,"Co tady d�l�?",dia_diegonw_needhelp_plan);
	Info_AddChoice(dia_diegonw_needhelp,"Co jako?",dia_diegonw_needhelp_problem);
};

func void dia_diegonw_needhelp_plan()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Plan_15_00");	//Co tady d�l�?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Plan_11_01");	//Pozoroval jsem str�e. Jsou po��d na nohou.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Plan_11_02");	//�ekl bych, �e proklouznout mezi nimi nebude nijak snadn�.
};

func void dia_diegonw_needhelp_whoareyou()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_WhoAreYou_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_01");	//Asi to bude m�mi �aty. Str�e m� necht�j� pustit do m�sta.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_02");	//Proto jsem p�ed m�stem koupil od jednoho obchodn�ka tyhle hadry. Douf�m, �e si na m� u� vzpom�n�. Jsem Diego.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_03");	//Tenkr�t v base jsem t� nau�il v�echno, co jsi pot�eboval v�d�t, abys p�e�il.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_04");	//P�ece jsi to v�echno nemohl zapomenout.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_WhoAreYou_15_05");	//Ehm... co v�echno se vlastn� stalo?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_06");	//No to m� omyj, ty si v�n� nic nepamatuje�.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_07");	//Hele, v�n� te� nem�m �as ti v�echno vysv�tlovat. �eknu to takhle: b�vali jsme zatracen� dob�� p��tel� a n�kolikr�t jsem ti zachr�nil �ivot.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_08");	//A te� pot�ebuji tvou pomoc.
};

func void dia_diegonw_needhelp_clothes()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Clothes_15_00");	//Co je tohle za �aty?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_01");	//Koupil jsem je p�ed m�stem od jednoho obchodn�ka. Str�e m� poprv� necht�li pustit dovnit�.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_02");	//Tak� nen� nutn�, aby cel� sv�t v�d�l, odkud jsem.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Clothes_15_03");	//To je fakt.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_04");	//Tak� to tak vid�m. Ale i kdy� jsem zahodil sv�j h�bit St�nu, jsem po��d t�m, k�m jsem byl v�dycky.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_05");	//A s t�mhle m�stem m�m velk� pl�ny.
};

func void dia_diegonw_needhelp_problem()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_15_00");	//Co jako?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_01");	//Hodn� v�c� se zm�nilo, co jsem ode�el. Mus�m se znovu postavit na nohy.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_15_02");	//V �em je probl�m?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_03");	//Mus�m se dostat do horn� ��sti m�sta.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_04");	//Nejsem ale ob�anem m�sta a nem�m dost pen�z, abych podplatil str�e. Ale na�t�st� tady jsi ty!
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_15_05");	//Tak�e po mn� chce�, abych ti p�j�il n�jak� pen�ze?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_06");	//Nesmysl. N�jak� zlato m�m - dokonce spoustu zlata! Bohu�el ho nem�m s sebou.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_07");	//Tak�e mi to moje zlato p�inese�.
	Info_ClearChoices(dia_diegonw_needhelp);
	Info_AddChoice(dia_diegonw_needhelp,"Na to nem�m �as.",dia_diegonw_needhelp_problem_notime);
	Info_AddChoice(dia_diegonw_needhelp,"Co z toho budu m�t?",dia_diegonw_needhelp_problem_reward);
	Info_AddChoice(dia_diegonw_needhelp,"Dobr�, pom��u ti.",dia_diegonw_needhelp_problem_willhelpyou);
};

func void dia_diegonw_needhelp_problem_notime()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_NoTime_15_00");	//Na to nem�m �as.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_01");	//Hele, j� myslel, �e jsme k�mo�i! Byl jsem to konec konc� j�, kdo ti zachr�nil kejh�k, kdy� t� hodili do kolonie.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_NoTime_15_02");	//P�eh�n�.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_03");	//V�n�? Tak se zkus na chvilku zamyslet, jak by to s tebou dopadlo, kdybych ti tehdy nevysv�tlil, jak se chovat.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_04");	//Rudn� baroni by si t� dali k sn�dani, �ekala by t� mizern� smrt v dolech.
	MIS_HELPDIEGONW = LOG_FAILED;
	Info_ClearChoices(dia_diegonw_needhelp);
};

func void dia_diegonw_needhelp_problem_reward()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_Reward_15_00");	//Co z toho budu m�t?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_Reward_11_01");	//Ptal jsem se snad n�kdy j� tebe, co dostanu na opl�tku? Jsme p��tel�, copak to je m�lo?
};

func void dia_diegonw_needhelp_problem_willhelpyou()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_15_00");	//Dobr�, pom��u ti.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_11_01");	//Dobr�, poslouchej: Kdy� je�t� st�la bari�ra, schoval jsem si mal� poklad.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_11_02");	//Po�kej chv�li. To je to, co jsem si zapomn�l vz�t s sebou.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_11_03");	//Ale mus�m zde z�stat.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_11_03");	//Abych to zkr�til, prost� b� do Hornick�ho �dol� a p�ines mi moje zlato.
	MIS_HELPDIEGONW = LOG_RUNNING;
	Log_CreateTopic(TOPIC_HELPDIEGONW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HELPDIEGONW,LOG_RUNNING);
	b_logentry(TOPIC_HELPDIEGONW,"Diegovo zlato je ukryto v Hornick�m �dol�. Pot�ebuje se dostat mezi smet�nku, a tak m� pro n� poslal.");
	Info_ClearChoices(dia_diegonw_needhelp);
	Info_AddChoice(dia_diegonw_needhelp,"Co chce� s t�m zlatem d�lat?",dia_diegonw_needhelp_problem_willhelpyou_yourplan);
	Info_AddChoice(dia_diegonw_needhelp,"Kde jsi to zlato z�skal?",dia_diegonw_needhelp_problem_willhelpyou_howgold);
	Info_AddChoice(dia_diegonw_needhelp,"Kam jsi to zlato ukryl?",dia_diegonw_needhelp_problem_willhelpyou_wheregold);
};

func void dia_diegonw_needhelp_problem_willhelpyou_yourplan()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_15_00");	//Co chce� s t�m zlatem d�lat?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_11_01");	//V horn� ��sti m�sta je obchodn�k, kter�mu mus�m zaplatit dluh. Pot�ebuju to d�t kone�n� do po��dku.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_11_02");	//A pak budu moci za��t zcela nov� �ivot!
};

func void dia_diegonw_needhelp_problem_willhelpyou_howgold()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_15_00");	//Kde jsi to zlato z�skal?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_11_01");	//Jsem snad jedin�, kdo si v Hornick�m �dol� �et�il pro str��ka P��hodu?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_11_02");	//�t�pnout p�r nuget� byla hra�ka. D�lal jsem to prost� pro p��pad, �e bychom se nakonec dostali ven.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_HowGold_11_03");	//Ka�d� se staral pouze o rudu, nikdo se nestaral o zlato ...
};

func void dia_diegonw_needhelp_problem_willhelpyou_wheregold()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_15_00");	//Kam jsi to zlato ukryl?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_01");	//Je p��mo na tr�nici. Nad opu�t�n�m dolem. Jsou v ko�en� kabele.
	if(DIEGO_ANGEKOMMEN == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_WhereGold_11_01");	//Ale ticho. Mysl�m, �e si toho nikdo nev�iml.
		AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_WhereGold_11_02");	//Prost� vezmi v��ek a dones mi ho.
	};
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_02");	//Nezapome� se ale p�esv�d�it, �e tam opravdu je, a� se nevrac� s pr�zdnou.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_15_03");	//Jak to pozn�m?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_04");	//Ten vak je pln� zlata. Je to spousta zlata!
	Info_AddChoice(dia_diegonw_needhelp,"Zkus�m to tvoje zlato naj�t.",dia_diegonw_needhelp_problem_willhelpyou_wheregold_end_tryit);
	b_logentry(TOPIC_HELPDIEGONW,"Diegovo zlato je ukryto kdesi na star� obchodn� cest�, nad opu�t�n�m dolem - tam, kudy kdysi lanovkou dopravovali do kolonie zbo��.");
};

func void dia_diegonw_needhelp_problem_willhelpyou_wheregold_end_tryit()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_TryIt_15_00");	//Zkus�m to tvoje zlato naj�t.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_TryIt_11_01");	//(za�kleb� se) Jen do toho. Budeme si kvit.
	Info_ClearChoices(dia_diegonw_needhelp);
};


instance DIA_DIEGONW_HELPYOU(C_INFO)
{
	npc = pc_thief_nw;
	nr = 30;
	condition = dia_diegonw_helpyou_condition;
	information = dia_diegonw_helpyou_info;
	permanent = FALSE;
	description = "Dobr�, p�ece jenom ti pom��u.";
};


func int dia_diegonw_helpyou_condition()
{
	if((DIEGO_ISONBOARD == FALSE) && (MIS_HELPDIEGONW == LOG_FAILED) && (DIEGO_ISONBOARD != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_diegonw_helpyou_info()
{
	AI_Output(other,self,"DIA_DiegoNW_HelpYou_15_00");	//Dobr�, p�ece jenom ti pom��u.
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_01");	//V�d�l jsem to.
	AI_Output(other,self,"DIA_DiegoNW_HelpYou_15_02");	//Fajn, p�ejd�me rovnou k v�ci.
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_03");	//Tak�e. V Hornick�m �dol� jsem si schoval poklad, a ty mi ho p�inese�.
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_06");	//J� mezit�m z�stanu tady a v�echno p�iprav�m.
	dia_diegonw_needhelp_problem_willhelpyou_wheregold();
	dia_diegonw_needhelp_problem_willhelpyou_wheregold_end_tryit();
	MIS_HELPDIEGONW = LOG_RUNNING;
	Log_CreateTopic(TOPIC_HELPDIEGONW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HELPDIEGONW,LOG_RUNNING);
	b_logentry(TOPIC_HELPDIEGONW,"Diegovo zlato je ukryto kdesi na star� obchodn� cest�, nad opu�t�n�m dolem - tam, kudy kdysi lanovkou dopravovali do kolonie zbo��.");
};


instance DIA_DIEGONW_HAVEYOURGOLD(C_INFO)
{
	npc = pc_thief_nw;
	nr = 31;
	condition = dia_diegonw_haveyourgold_condition;
	information = dia_diegonw_haveyourgold_info;
	permanent = TRUE;
	description = "Na�el jsem tvoje zlato!";
};


func int dia_diegonw_haveyourgold_condition()
{
	if(((OPENEDDIEGOSBAG == TRUE) || (Npc_HasItems(other,itse_diegostreasure_mis) >= 1)) && (MIS_HELPDIEGONW == LOG_RUNNING) && (DIEGO_ISONBOARD != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void b_diegonw_diegosrevenge()
{
	AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_05");	//Prefekt. Gerbrandt by se m�l rad�i m�t na pozoru.
};


var int diegosrevenge;

func void dia_diegonw_haveyourgold_info()
{
	AI_Output(other,self,"DIA_DiegoNW_HaveYourGold_15_00");	//Na�el jsem tvoje zlato!
	AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_01");	//V�born�. Uka�.
	if(Npc_HasItems(other,itse_diegostreasure_mis) >= 1)
	{
		b_giveinvitems(other,self,itse_diegostreasure_mis,1);
		b_diegonw_diegosrevenge();
		DIEGOSREVENGE = TRUE;
	}
	else if(Npc_HasItems(other,itmi_gold) < DIEGOSTREASURE)
	{
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_02");	//Ale to nen� v�echno! Nev��� mi? Pot�ebuju v�echno.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_03");	//Pokud m�j pl�n vyjde, zbude dost i na tebe.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_04");	//Tak�e se sna�, aby nic nechyb�lo. Je to d�le�it�!
	}
	else
	{
		b_giveinvitems(other,self,itmi_gold,DIEGOSTREASURE);
		b_diegonw_diegosrevenge();
		DIEGOSREVENGE = TRUE;
	};
	if((Npc_IsDead(gerbrandt) == FALSE) && (DIEGOSREVENGE == TRUE))
	{
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_06");	//Poslouchej, je�t� se mus�m postarat o ty str�e.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_07");	//Cht�l bych, abys donesl tenhle dopis Gerbrandtovi. Je to jeden z t�ch tlust�ch obchodn�k� v horn� �tvrti.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_08");	//Pozdravuj ho ode mne. Pak se s tebou setk�m p�ed Gerbrandtov�m domem.
		CreateInvItems(self,itwr_diegosletter_mis,1);
		b_giveinvitems(self,other,itwr_diegosletter_mis,1);
		b_startotherroutine(gerbrandt,"WaitForDiego");
		MIS_HELPDIEGONW = LOG_SUCCESS;
		MIS_DIEGOSRESIDENCE = LOG_RUNNING;
		b_giveplayerxp(XP_HELPDIEGONW);
		Log_CreateTopic(TOPIC_DIEGOSRESIDENCE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DIEGOSRESIDENCE,LOG_RUNNING);
		b_logentry(TOPIC_DIEGOSRESIDENCE,"Diego mi p�edal dopis pro obchodn�ka Gerbrandta.");
		AI_StopProcessInfos(self);
	};
};


instance DIA_DIEGONW_DELIVEREDLETTER(C_INFO)
{
	npc = pc_thief_nw;
	nr = 30;
	condition = dia_diegonw_deliveredletter_condition;
	information = dia_diegonw_deliveredletter_info;
	permanent = FALSE;
	description = "Doru�il jsem ten dopis.";
};


func int dia_diegonw_deliveredletter_condition()
{
	if((DIEGO_ISONBOARD == FALSE) && (MIS_DIEGOSRESIDENCE == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_diegonw_deliveredletter_info()
{
	AI_Output(other,self,"DIA_DiegoNW_DeliveredLetter_15_00");	//Doru�il jsem ten dopis.
	AI_Output(self,other,"DIA_DiegoNW_DeliveredLetter_11_01");	//Velmi dob�e. Jak to Gerbrandt vzal?
	AI_Output(other,self,"DIA_DiegoNW_DeliveredLetter_15_02");	//Vypadal docela �okovan� a okam�it� se ztratil.
	AI_Output(self,other,"DIA_DiegoNW_DeliveredLetter_11_03");	//(spokojen�) To bych �ekl.
	AI_Output(self,other,"DIA_DiegoNW_DeliveredLetter_11_04");	//Ob�v�m se, �e ze v�eho nejd��v budu muset dohl�dnout na vybaven� sv�ho nov�ho domu. Pokud si dob�e pamatuju, tak Gerbrandt m�l stra�n� vkus, co se n�bytku t��e.
	b_giveplayerxp(XP_DIEGOHASANEWHOME);
	Wld_AssignRoomToGuild("reich01",GIL_PUBLIC);
	Info_ClearChoices(dia_diegonw_deliveredletter);
	Info_AddChoice(dia_diegonw_deliveredletter,"A jak jsi to vlastn� ud�lal?",dia_diegonw_deliveredletter_yourtrick);
	Info_AddChoice(dia_diegonw_deliveredletter,"Tak�e ten d�m je tv�j?",dia_diegonw_deliveredletter_yourhouse);
};

func void dia_diegonw_deliveredletter_gerbrandt()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_15_00");	//A co Gerbrandt?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_01");	//U� si u��val toho pohodln�ho �ivota p��li� dlouho.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_02");	//On si �il tady, uprost�ed luxusu, zat�mco j� dlabal v dolech v�var z krys.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_03");	//Netu��m, kam m�l nam��eno, ale do Khorinisu u� nikdy nevkro�� - na to dohl�dnu.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_04");	//Kdybys ho hledal, najde� ho asi v p��stavn� �tvrti.
};

func void dia_diegonw_deliveredletter_yourhouse()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourHouse_15_00");	//Tak�e ten d�m je tv�j?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_01");	//Ano, od sklepa a� po p�du, v�etn� v�eho n�bytku.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_02");	//Po n�kolika letech str�ven�ch v krajn� nevyhovuj�c�ch podm�nk�ch se t��m, a� se vysp�m v posteli s nebesy.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_03");	//A k sn�dani si pak d�m dobr� v�no a ��avnatou �un�i�ku.
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourHouse_15_04");	//Chyt� �t�st� za pa�esy, co?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_05");	//Se vsa�.
};

func void dia_diegonw_deliveredletter_yourtrick()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourTrick_15_00");	//A jak jsi to vlastn� ud�lal?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_01");	//Mysl� snad, �e Gerbrandt p�i�el ke v�emu tomu bohatstv� poctiv�m obchodem?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_02");	//Kdy� p�i�lo na n�jakou levotu, tak si s�m ruce pochopiteln� nikdy neza�pinil. Na to m�l pomocn�ka.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_03");	//Samoz�ejm�, �e jsem tu a tam n�co pochytil. Gerbrandt se m� nakonec zbavil. Nejsp� se b�l, �e toho v�m p��li�.
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourTrick_15_04");	//O tom jsi mi nikdy ne�ekl.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_05");	//Nikdy ses neptal.
	Info_ClearChoices(dia_diegonw_deliveredletter);
	Info_AddChoice(dia_diegonw_deliveredletter,DIALOG_BACK,dia_diegonw_deliveredletter_yourtrick_back);
	Info_AddChoice(dia_diegonw_deliveredletter,"A co m�j pod�l?",dia_diegonw_deliveredletter_yourtrick_reward);
	Info_AddChoice(dia_diegonw_deliveredletter,"A co Gerbrandt?",dia_diegonw_deliveredletter_gerbrandt);
};

func void dia_diegonw_deliveredletter_yourtrick_reward()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_15_00");	//A co m�j pod�l?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_11_01");	//Zd� se, �e jsi nakonec p�ece jenom nezapomn�l na v�echno, co jsem t� nau�il.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_11_02");	//Ale m� pravdu, bez tebe bych to nedok�zal. Tady je tv�j d�l.
	CreateInvItems(self,itmi_gold,500);
	b_giveinvitems(self,other,itmi_gold,500);
};

func void dia_diegonw_deliveredletter_yourtrick_back()
{
	Info_ClearChoices(dia_diegonw_deliveredletter);
};


var int diego_teach;

instance DIA_DIEGONW_CANYOUTEACH(C_INFO)
{
	npc = pc_thief_nw;
	nr = 995;
	condition = dia_diegonw_canyouteach_condition;
	information = dia_diegonw_canyouteach_info;
	permanent = TRUE;
	description = "M��e� m� n��emu nau�it?";
};


func int dia_diegonw_canyouteach_condition()
{
	if((DIEGO_ISONBOARD == FALSE) && (DIEGO_TEACH == FALSE))
	{
		return TRUE;
	};
};

func void dia_diegonw_canyouteach_info()
{
	AI_Output(other,self,"DIA_DiegoNW_CanYouTeach_15_00");	//M��e� m� n��emu nau�it?
	if(Npc_KnowsInfo(other,dia_diegonw_deliveredletter))
	{
		AI_Output(self,other,"DIA_DiegoNW_CanYouTeach_11_01");	//Ale jist�. Jen mi �ekni, a� bude� p�ipraven.
		DIEGO_TEACH = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_DiegoNW_CanYouTeach_11_02");	//Nejd��v se mus�m postarat o vlastn� z�le�itosti.
	};
};


var int diegonw_merke_dex;

instance DIA_DIEGONW_TEACH(C_INFO)
{
	npc = pc_thief_nw;
	nr = 995;
	condition = dia_diegonw_teach_condition;
	information = dia_diegonw_teach_info;
	permanent = TRUE;
	description = "U� m�.";
};


func int dia_diegonw_teach_condition()
{
	if((DIEGO_ISONBOARD == FALSE) && (DIEGO_TEACH == TRUE))
	{
		return TRUE;
	};
};

func void dia_diegonw_teach_info()
{
	AI_Output(other,self,"DIA_DiegoNW_Teach_15_00");	//U� m�.
	AI_Output(self,other,"DIA_DiegoNW_Teach_11_01");	//Nau��m t�, jak b�t o n�co obratn�j��.
	DIEGONW_MERKE_DEX = other.attribute[ATR_DEXTERITY];
	Info_ClearChoices(dia_diegonw_teach);
	Info_AddChoice(dia_diegonw_teach,DIALOG_BACK,dia_diegonw_teach_back);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_diegonw_teachdex_1);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_diegonw_teachdex_5);
};

func void dia_diegonw_teach_back()
{
	if(DIEGONW_MERKE_DEX < other.attribute[ATR_DEXTERITY])
	{
		AI_Output(self,other,"DIA_DiegoNW_Teach_BACK_11_00");	//U� jsi obratn�j��. Jen tak d�l!
	};
	Info_ClearChoices(dia_diegonw_teach);
};

func void dia_diegonw_teachdex_1()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,1,T_MAX);
	Info_ClearChoices(dia_diegonw_teach);
	Info_AddChoice(dia_diegonw_teach,DIALOG_BACK,dia_diegonw_teach_back);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_diegonw_teachdex_1);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_diegonw_teachdex_5);
};

func void dia_diegonw_teachdex_5()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,5,T_MAX);
	Info_ClearChoices(dia_diegonw_teach);
	Info_AddChoice(dia_diegonw_teach,DIALOG_BACK,dia_diegonw_teach_back);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_diegonw_teachdex_1);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_diegonw_teachdex_5);
};


instance DIA_DIEGONW_KNOWWHEREENEMY(C_INFO)
{
	npc = pc_thief_nw;
	nr = 55;
	condition = dia_diegonw_knowwhereenemy_condition;
	information = dia_diegonw_knowwhereenemy_info;
	permanent = TRUE;
	description = "Odch�z�m z Khorinisu.";
};


func int dia_diegonw_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (DIEGO_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_diegonw_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_15_00");	//Odch�z�m z Khorinisu.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_01");	//Moudr� rozhodnut�. P��l bych si j�t s tebou. Tohle m�sto se p��li� rychle zm�nilo - �asy, kdy jsi mohl rychle zbohatnout, u� jsou pry�.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_02");	//Mohl bych t� u�it v lu�i�tnictv�, p��en� z�mk� a navy�ov�n� obratnosti.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_03");	//Nav�c by se ti ur�it� hodil n�jak� slu�n� zlod�j.
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"Diego chce j�t samoz�ejm� se mnou. Vid� to tak, �e ��m d��v Khorinis opust�, t�m l�p. Mohl by mi uk�zat, jak se st�t obratn�j��m a vycvi�it m� v lukost�elb�. Tak� se se mnou pod�l� o um�n� p��it z�mky.");
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_15_04");	//Nech�m si to proj�t hlavou. Moment�ln� je moje pos�dka v pln�m stavu.
		AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_05");	//Rozmysli si to. Tak jako tak m� najde� tady.
	}
	else
	{
		Info_ClearChoices(dia_diegonw_knowwhereenemy);
		Info_AddChoice(dia_diegonw_knowwhereenemy,"Snad ti d�m v�d�t, a� p�ijde ten prav� �as.",dia_diegonw_knowwhereenemy_no);
		Info_AddChoice(dia_diegonw_knowwhereenemy,"Nechce� j�t taky?",dia_diegonw_knowwhereenemy_yes);
	};
};

func void dia_diegonw_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_Yes_15_00");	//Tak poje� se mnou setk�me se v p��stavu.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_01");	//Hmm. M� pravdu, Khorinis je �umpa. Jdu s tebou.
	self.flags = NPC_FLAG_IMMORTAL;
	DIEGO_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"NW_CITY_UPTOWN_PATH_23") == 1)
	{
		AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_02");	//Po�kej, za okam�ik budu p�ipraven.
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_CITY_UPTOWN_HUT_01_01");
		CreateInvItems(self,itar_diego,1);
		AI_EquipArmor(self,itar_diego);
		AI_Wait(self,1);
		AI_GotoWP(self,self.wp);
	};
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_03");	//Tak, jsem p�ipraven. Uvid�me se u lodi.
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(dia_diegonw_knowwhereenemy);
};

func void dia_diegonw_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_No_15_00");	//Mo�n� ti d�m v�d�t, a� nadejde �as.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_No_11_01");	//Jak mysl�. A mo�n� s tebou dokonce i p�jdu. Kdo v�?
	DIEGO_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_diegonw_knowwhereenemy);
};


instance DIA_DIEGONW_LEAVEMYSHIP(C_INFO)
{
	npc = pc_thief_nw;
	nr = 55;
	condition = dia_diegonw_leavemyship_condition;
	information = dia_diegonw_leavemyship_info;
	permanent = TRUE;
	description = "Dohl�dni rad�i na m�sto.";
};


func int dia_diegonw_leavemyship_condition()
{
	if((DIEGO_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_diegonw_leavemyship_info()
{
	AI_Output(other,self,"DIA_DiegoNW_LeaveMyShip_15_00");	//Dohl�dni rad�i na m�sto.
	AI_Output(self,other,"DIA_DiegoNW_LeaveMyShip_11_01");	//V�n�? U� m� nepot�ebuje�? No dobr�. Nezapome� se stavit, a� bude� zp�tky ve m�st�.
	AI_Output(other,self,"DIA_DiegoNW_LeaveMyShip_15_02");	//Mysl�, �e se je�t� setk�me?
	AI_Output(self,other,"DIA_DiegoNW_LeaveMyShip_11_03");	//Nikdy nezapomenu na ten v�raz, kter� jsi m�l ve tv��i, kdy� ses v�lel po zemi po t� r�n� od Bullita a my se poprv� setkali.
	AI_Output(self,other,"DIA_DiegoNW_LeaveMyShip_11_04");	//Nemaj� �anci sehnat n�koho lep��ho, ne� jsi ty. M�LI bychom se znovu setkat. D�vej na sebe pozor.
	DIEGO_ISONBOARD = LOG_OBSOLETE;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_DIEGONW_STILLNEEDYOU(C_INFO)
{
	npc = pc_thief_nw;
	nr = 55;
	condition = dia_diegonw_stillneedyou_condition;
	information = dia_diegonw_stillneedyou_info;
	permanent = TRUE;
	description = "Rozmyslel jsem si to. Chci, abys �el se mnou.";
};


func int dia_diegonw_stillneedyou_condition()
{
	if(((DIEGO_ISONBOARD == LOG_OBSOLETE) || (DIEGO_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_diegonw_stillneedyou_info()
{
	AI_Output(other,self,"DIA_DiegoNW_StillNeedYou_15_00");	//Rozmyslel jsem si to. Chci, abys �el se mnou.
	AI_Output(self,other,"DIA_DiegoNW_StillNeedYou_11_01");	//Kam se pod�lo tv� odhodl�n�, p��teli? Jasn�, �e s tebou p�jdu - ale u� se sakra rozhodni.
	self.flags = NPC_FLAG_IMMORTAL;
	DIEGO_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"NW_CITY_UPTOWN_PATH_23") == 1)
	{
		AI_Output(self,other,"DIA_DiegoNW_StillNeedYou_11_02");	//Po�kej, za okam�ik budu p�ipraven.
		AI_GotoWP(self,"NW_CITY_UPTOWN_HUT_01_01");
		CreateInvItems(self,itar_diego,1);
		AI_EquipArmor(self,itar_diego);
		AI_GotoWP(self,self.wp);
	};
	AI_Output(self,other,"DIA_DiegoNW_StillNeedYou_11_03");	//Dobr�, m��eme j�t.
	AI_StopProcessInfos(self);
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};


instance DIA_THIEF_NW_PICKPOCKET(C_INFO)
{
	npc = pc_thief_nw;
	nr = 900;
	condition = dia_thief_nw_pickpocket_condition;
	information = dia_thief_nw_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_120;
};


func int dia_thief_nw_pickpocket_condition()
{
	return c_beklauen(120,600);
};

func void dia_thief_nw_pickpocket_info()
{
	Info_ClearChoices(dia_thief_nw_pickpocket);
	Info_AddChoice(dia_thief_nw_pickpocket,DIALOG_BACK,dia_thief_nw_pickpocket_back);
	Info_AddChoice(dia_thief_nw_pickpocket,DIALOG_PICKPOCKET,dia_thief_nw_pickpocket_doit);
};

func void dia_thief_nw_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_thief_nw_pickpocket);
};

func void dia_thief_nw_pickpocket_back()
{
	Info_ClearChoices(dia_thief_nw_pickpocket);
};

