
instance DIA_ADDON_PATRICK_EXIT(C_INFO)
{
	npc = strf_1118_addon_patrick;
	nr = 999;
	condition = dia_addon_patrick_exit_condition;
	information = dia_addon_patrick_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_patrick_exit_condition()
{
	return TRUE;
};

func void dia_addon_patrick_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_PATRICK_HI(C_INFO)
{
	npc = strf_1118_addon_patrick;
	nr = 2;
	condition = dia_addon_patrick_hi_condition;
	information = dia_addon_patrick_hi_info;
	permanent = FALSE;
	description = "Jsem zde na rozkaz m�g� Vody a v�echny v�s osvobod�m.";
};


func int dia_addon_patrick_hi_condition()
{
	return TRUE;
};

func void dia_addon_patrick_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_15_00");	//Jsem zde na rozkaz m�g� Vody a v�echny v�s osvobod�m.
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_07_01");	//(podez��vav�) Opravdu? Pro� bych ti m�l v��it?
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_15_02");	//Tak chcete odsud vypadnout nebo ne?
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_07_03");	//Samoz�ejm�, �e chci - ale ...
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_15_04");	//Vatras m� poslal. Jesli se v�m to nezd� dobr�, pak m��ete hn�t v t�to d��e, o co� se postar�m.
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_07_05");	//(rychle) V po��dku, v���m ti.
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_15_06");	//(zara�en�) Opravdu? Bylo to jednodu���, ne� jsem o�ek�val. OK, v�e, co nyn� pot�ebujeme, je pl�n.
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_07_07");	//Pokusit se o �t�k je p��li� riskantn�. William to zkou�el a koupil si farmu.
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_07_08");	//V�zni jsou farm��i a d�ln�ci - v��� mi, ale nebudou riskovat nebezpe��.
	Info_ClearChoices(dia_addon_patrick_hi);
	Info_AddChoice(dia_addon_patrick_hi,"O�ek�v�te mne, abych dostal pro v�s od Ravena milost?",dia_addon_patrick_hi_raven);
	Info_AddChoice(dia_addon_patrick_hi,"To mus�m zab�t v�echny bandity, abyste si pohli?",dia_addon_patrick_hi_kill);
};

func void b_say_patrick_plan()
{
	AI_Output(self,other,"DIA_Addon_Patrick_Plan_07_00");	//Ale to nen� pl�n.
	AI_Output(self,other,"DIA_Addon_Patrick_Plan_07_01");	//Jen n�s ujisti, �e str�e na n�s neza�to��, a my p�jdeme odsud pry�.
	AI_Output(other,self,"DIA_Addon_Patrick_Plan_15_02");	//Dobr�, postar�m se o to. �ekni ostatn�m, aby se p�ipravili.
	b_logentry(TOPIC_ADDON_SKLAVEN,"Otroci se nepokus� o �t�k. Mus�m naj�t zp�sob, aby ode�li bez n�mitek.");
};

func void dia_addon_patrick_hi_raven()
{
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_Raven_15_00");	//O�ek�v�te ode mne, �e pro v�s dostanu od Ravena milost?
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_Raven_07_01");	//(usm�vav�) To by nebylo tak �patn�.
	b_say_patrick_plan();
	Info_ClearChoices(dia_addon_patrick_hi);
};

func void dia_addon_patrick_hi_kill()
{
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_Kill_15_00");	//To mus�m zab�t v�echny bandity, aby jste se pohli?
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_Kill_07_01");	//(p�ekvapen�) To by bylo ��lenstv�!
	b_say_patrick_plan();
	Info_ClearChoices(dia_addon_patrick_hi);
};


instance DIA_ADDON_PATRICK_READY(C_INFO)
{
	npc = strf_1118_addon_patrick;
	nr = 2;
	condition = dia_addon_patrick_ready_condition;
	information = dia_addon_patrick_ready_info;
	permanent = FALSE;
	description = "V�e v pohod�, m��ete j�t.";
};


func int dia_addon_patrick_ready_condition()
{
	if(((READY_TOGO == TRUE) && Npc_KnowsInfo(other,dia_addon_patrick_hi)) || (Npc_IsDead(prisonguard) && Npc_IsDead(bloodwyn) && Npc_KnowsInfo(other,dia_addon_thorus_answer)) || (Npc_IsDead(thorus) && Npc_IsDead(bloodwyn) && Npc_IsDead(prisonguard)))
	{
		return TRUE;
	};
};

func void dia_addon_patrick_ready_info()
{
	AI_Output(other,self,"DIA_Addon_Patrick_ready_15_00");	//V�e v pohod�, m��ete j�t.
	AI_Output(self,other,"DIA_Addon_Patrick_ready_07_01");	//Dob�e, zn�m jeskyni v ba�in�ch. Shrom�d�me se tam, ale co budeme d�lat pak?
	AI_Output(other,self,"DIA_Addon_Patrick_ready_15_02");	//Dejte se mo��lem p��mo k jihoz�padu. M�gov� Vody si tam v ruin�ch zalo�ili t�bor.
	AI_Output(other,self,"DIA_Addon_Patrick_ready_15_03");	//Uk�ou v�m cestu z tohohle �dol�.
	AI_Output(self,other,"DIA_Addon_Patrick_ready_07_04");	//D�kuji ti, d�kuji ti moc. (form�ln�) Jsme ti hluboce zav�z�ni ...
	AI_Output(other,self,"DIA_Addon_Patrick_ready_15_05");	//Nechte to tak!
	SKLAVEN_FLUCHT = TRUE;
	b_giveplayerxp(XP_ADDON_FLUCHT);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FLUCHT");
	b_startotherroutine(telbor,"FLUCHT");
	b_startotherroutine(tonak,"FLUCHT");
	b_startotherroutine(pardos,"FLUCHT");
	b_startotherroutine(monty,"FLUCHT");
	b_startotherroutine(buddler_1,"WORK");
	b_startotherroutine(buddler_2,"WORK");
	b_startotherroutine(buddler_3,"WORK");
	b_removenpc(strf_1128_addon_sklave);
	b_removenpc(strf_1129_addon_sklave);
	b_removenpc(strf_1130_addon_sklave);
	b_removenpc(strf_1136_addon_sklave);
	b_removenpc(strf_1137_addon_sklave);
	b_removenpc(strf_1138_addon_sklave);
	b_removenpc(strf_1139_addon_sklave);
	b_removenpc(strf_1140_addon_sklave);
};


instance DIA_ADDON_PATRICK_KILLER(C_INFO)
{
	npc = strf_1118_addon_patrick;
	nr = 2;
	condition = dia_addon_patrick_killer_condition;
	information = dia_addon_patrick_killer_info;
	permanent = FALSE;
	description = "Str�e jsou vy��zeny, m��ete j�t.";
};


func int dia_addon_patrick_killer_condition()
{
	if(Npc_IsDead(prisonguard) && (READY_TOGO == FALSE) && Npc_KnowsInfo(other,dia_addon_patrick_hi))
	{
		return TRUE;
	};
};

func void dia_addon_patrick_killer_info()
{
	AI_Output(other,self,"DIA_Addon_Patrick_Killer_15_00");	//Str�e jsou vy��zeny, m��ete j�t.
	AI_Output(self,other,"DIA_Addon_Patrick_Killer_07_01");	//A co se stane, kdy� opust�me d�l? Ostatn� str�e n�s zabij�, kdekoliv si stoupneme. Nikdy. P��li� riskantn�.
};


instance DIA_ADDON_PATRICK_HOEHLE(C_INFO)
{
	npc = strf_1118_addon_patrick;
	nr = 2;
	condition = dia_addon_patrick_hoehle_condition;
	information = dia_addon_patrick_hoehle_info;
	permanent = TRUE;
	description = "Nechcete odej�t???";
};


func int dia_addon_patrick_hoehle_condition()
{
	if(Npc_GetDistToWP(self,"ADW_BL_HOEHLE_04") <= 1000)
	{
		return TRUE;
	};
};

func void dia_addon_patrick_hoehle_info()
{
	AI_Output(other,self,"DIA_Addon_Patrick_Hoehle_15_00");	//Nechcete odej�t???
	AI_Output(self,other,"DIA_Addon_Patrick_Hoehle_07_01");	//Samoz�ejm�, �e chceme. Pouze �ek�me na vhodou p��le�itost.
};

