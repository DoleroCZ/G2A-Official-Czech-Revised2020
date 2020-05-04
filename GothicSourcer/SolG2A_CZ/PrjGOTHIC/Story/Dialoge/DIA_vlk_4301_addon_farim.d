
instance DIA_ADDON_FARIM_EXIT(C_INFO)
{
	npc = vlk_4301_addon_farim;
	nr = 999;
	condition = dia_addon_farim_exit_condition;
	information = dia_addon_farim_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_farim_exit_condition()
{
	return TRUE;
};

func void dia_addon_farim_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_FARIM_PICKPOCKET(C_INFO)
{
	npc = vlk_4301_addon_farim;
	nr = 900;
	condition = dia_addon_farim_pickpocket_condition;
	information = dia_addon_farim_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_addon_farim_pickpocket_condition()
{
	return c_beklauen(20,11);
};

func void dia_addon_farim_pickpocket_info()
{
	Info_ClearChoices(dia_addon_farim_pickpocket);
	Info_AddChoice(dia_addon_farim_pickpocket,DIALOG_BACK,dia_addon_farim_pickpocket_back);
	Info_AddChoice(dia_addon_farim_pickpocket,DIALOG_PICKPOCKET,dia_addon_farim_pickpocket_doit);
};

func void dia_addon_farim_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_farim_pickpocket);
};

func void dia_addon_farim_pickpocket_back()
{
	Info_ClearChoices(dia_addon_farim_pickpocket);
};


instance DIA_ADDON_FARIM_HALLO(C_INFO)
{
	npc = vlk_4301_addon_farim;
	nr = 5;
	condition = dia_addon_farim_hallo_condition;
	information = dia_addon_farim_hallo_info;
	description = "Ty jsi ryb��?";
};


func int dia_addon_farim_hallo_condition()
{
	return TRUE;
};

func void dia_addon_farim_hallo_info()
{
	AI_Output(other,self,"DIA_Addon_Farim_Hallo_15_00");	//Ty jsi ryb��?
	AI_Output(self,other,"DIA_Addon_Farim_Hallo_11_01");	//(cynicky) Jak si to uhodl?
	AI_Output(self,other,"DIA_Addon_Farim_Hallo_11_02");	//Nem��e� m� prost� nechat na pokoji?
	if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Addon_Farim_Landstreicher_Add_11_02");	//Nevykl�dej si to �patn�, ale j� nem�m domobranu moc v l�sce.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Farim_Landstreicher_Add_11_03");	//Nevykl�dej si to �patn�, ale v posledn� dob� m�m �patnou n�ladu. Probl�my s domobranou ...
	};
};


instance DIA_ADDON_FARIM_MILIZPROBS(C_INFO)
{
	npc = vlk_4301_addon_farim;
	nr = 5;
	condition = dia_addon_farim_milizprobs_condition;
	information = dia_addon_farim_milizprobs_info;
	description = "Probl�my s domobranou?";
};


func int dia_addon_farim_milizprobs_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_farim_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_farim_milizprobs_info()
{
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_15_00");	//Probl�my s domobranou?
	if(((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_01");	//Ti �mejdi sem prost� norm�ln� p�i�li a vzali si, co cht�li.
	};
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_02");	//Minul� t�den mi vzali cel� �lovek. 'Je to pro dobrou v�c', ��kali.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_03");	//V�m, �e se te� v�ichni mus�me starat sami o sebe, je�t� kdy� farm��i p�estali obchodovat.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_04");	//N�kdy mus�m chodit sp�vat s pr�zdn�m �aludkem. Nezaj�m� je to. Seberou mi v�echny ryby a j� nem��u nic d�lat.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_05");	//A pokud to tak p�jde d�l, nebudu m�t, co j�st.
	Info_ClearChoices(dia_addon_farim_milizprobs);
	Info_AddChoice(dia_addon_farim_milizprobs,"Dej mi v�echny tv� ryby.",dia_addon_farim_milizprobs_klauen);
	Info_AddChoice(dia_addon_farim_milizprobs,"Mo�n� bych ti mohl pomoci.",dia_addon_farim_milizprobs_helfen);
	Info_AddChoice(dia_addon_farim_milizprobs,"Mluvil jsi o tom s paladiny?",dia_addon_farim_milizprobs_paladine);
};

func void dia_addon_farim_milizprobs_paladine()
{
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_paladine_15_00");	//Mluvil jsi o tom s paladiny?
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_paladine_11_01");	//(sm�je se) To si d�l� srandu? Mysl�, �e je zaj�m�, �e n�jak� chud�k jako j� m� probl�m s domobranou?
};


var int farim_pissedoff;

func void dia_addon_farim_milizprobs_klauen()
{
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_klauen_15_00");	//Dej mi v�echny tv� ryby.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_klauen_11_01");	//(na�tvan�) V�d�l jsem to. Dal�� z t�ch parchant�.
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_klauen_11_02");	//Ale mysl�m, �e jde� pozd�. Tvoji k�mo�i mi v�echno vzali u� v�era.
	};
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_klauen_11_04");	//�ekl bych, �e bys m�l rad�i odej�t.
	FARIM_PISSEDOFF = TRUE;
	Info_ClearChoices(dia_addon_farim_milizprobs);
};

func void dia_addon_farim_milizprobs_helfen()
{
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_helfen_15_00");	//Mo�n� bych ti mohl pomoci.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_helfen_11_02");	//Nev�m. Musel bys zn�t n�koho z domobrany, kdo se zn� s paladiny ...
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_helfen_11_03");	//Paladinov� moje ryby jen st�� vykoup�.
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_helfen_15_04");	//Uvid�m, co se d� d�lat.
	Info_ClearChoices(dia_addon_farim_milizprobs);
	Log_CreateTopic(TOPIC_ADDON_FARIMSFISH,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_FARIMSFISH,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_FARIMSFISH,"Ryb�� Farim m� probl�my s domobranou. Berou mu p��li� mnoho ryb. Mus�m naj�t n�koho z domobrany, kdo m� kontakt na paladiny a kdo mu pom��e.");
	MIS_ADDON_FARIM_PALADINFISCH = LOG_RUNNING;
};


instance DIA_ADDON_FARIM_MARTINHELPS(C_INFO)
{
	npc = vlk_4301_addon_farim;
	nr = 5;
	condition = dia_addon_farim_martinhelps_condition;
	information = dia_addon_farim_martinhelps_info;
	description = "M�m �e�en� tv�ho probl�mu.";
};


func int dia_addon_farim_martinhelps_condition()
{
	if((MIS_ADDON_FARIM_PALADINFISCH == LOG_RUNNING) && (MARTIN_KNOWSFARIM == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_farim_martinhelps_info()
{
	AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_00");	//M�m �e�en� tv�ho probl�mu.
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_01");	//Fakt? A jak�?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_02");	//Tro�ku jsem to tady omrknul.
		AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_03");	//A zn�m n�koho, kdo by mohl pomoci.
	};
	AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_04");	//Martin, d�stojn�k paladin�, si vyslechne tv�j probl�m s domobranou.
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_05");	//A mysl�, �e m��e zajistit, aby m� domobrana u� neotravovala?
	AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_06");	//P�esn� tak.
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_07");	//Par�da. D�ky. Nem��u ti toho moc d�t. Ale po�kej ...
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_08");	//Na�el jsem tenhle zvl�tn� modr� k�men na ostrov� bl�zko khorinisu.
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_09");	//Nemysl�m, �e je to n�jak cenn�, ale n�kdo jako ty, by to mohl vyu��t.
	b_giveinvitems(self,other,itmi_aquamarine,1);
	MIS_ADDON_FARIM_PALADINFISCH = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_FARIM_PALADINFISCH);
};


instance DIA_ADDON_FARIM_LANDSTREICHER(C_INFO)
{
	npc = vlk_4301_addon_farim;
	nr = 5;
	condition = dia_addon_farim_landstreicher_condition;
	information = dia_addon_farim_landstreicher_info;
	description = "M��e� mi ��ct n�co o chyb�j�c�ch lidech?";
};


func int dia_addon_farim_landstreicher_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_farim_hallo) && (MIS_ADDON_VATRAS_WHEREAREMISSINGPEOPLE == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_farim_landstreicher_info()
{
	AI_Output(other,self,"DIA_Addon_Farim_Landstreicher_15_01");	//M��e� mi ��ct n�co o chyb�j�c�ch lidech?
	AI_Output(self,other,"DIA_Addon_Farim_Landstreicher_11_02");	//M�j kamar�d Wiliam se zapletl s podez�el�mi lidmi. A co se mu stalo?
	AI_Output(self,other,"DIA_Addon_Farim_Landstreicher_11_03");	//Jednoho dne p�estal pracovat a od t� doby jsem o n�m nesly�el.
	SCKNOWSFARIMASWILLIAMSFRIEND = TRUE;
};


instance DIA_ADDON_FARIM_WILLIAM(C_INFO)
{
	npc = vlk_4301_addon_farim;
	nr = 5;
	condition = dia_addon_farim_william_condition;
	information = dia_addon_farim_william_info;
	description = "Tv�j kamar�d William zmizel?";
};


func int dia_addon_farim_william_condition()
{
	if((SCKNOWSFARIMASWILLIAMSFRIEND == TRUE) && Npc_KnowsInfo(other,dia_addon_farim_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_farim_william_info()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_15_00");	//Tv�j kamar�d William zmizel?
	AI_Output(self,other,"DIA_Addon_Farim_William_11_01");	//Asi jo. Mohl z n�ho b�t ryb��, ale to by na sob� musel pracovat, ale to on ne - je trochu n�ladov�.
	AI_Output(self,other,"DIA_Addon_Farim_William_11_02");	//Nikdy se nem�l zapl�st s t�mi chl�pky.
	Log_CreateTopic(TOPIC_ADDON_MISSINGPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MISSINGPEOPLE,LOG_RUNNING);
	Log_AddEntry(TOPIC_ADDON_MISSINGPEOPLE,LOGTEXT_ADDON_WILLIAMMISSING);
	Info_ClearChoices(dia_addon_farim_william);
	Info_AddChoice(dia_addon_farim_william,"O kom p�esn� mluv�?",dia_addon_farim_william_typen);
	Info_AddChoice(dia_addon_farim_william,"Jsem si jist�, �e se znovu objev�.",dia_addon_farim_william_auftauchen);
	Info_AddChoice(dia_addon_farim_william,"Co s n�m bylo pak?",dia_addon_farim_william_wasgemacht);
	Info_AddChoice(dia_addon_farim_william,"Kdy jsi je vid�l naposled?",dia_addon_farim_william_wannweg);
};

func void dia_addon_farim_william_wasgemacht()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_WasGemacht_15_00");	//Co s n�m bylo pak?
	AI_Output(self,other,"DIA_Addon_Farim_William_WasGemacht_11_01");	//William a ti hrdlo�ezov� se zapletli do n�jak� �pinav� pr�ce.
	AI_Output(self,other,"DIA_Addon_Farim_William_WasGemacht_11_02");	//Mysl�m, �e ho to m�lo p�iv�st na jejich stranu.
};

func void dia_addon_farim_william_typen()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_typen_15_00");	//O kom p�esn� mluv�?
	AI_Output(self,other,"DIA_Addon_Farim_William_typen_11_01");	//Nev�m kdo jsou ani co d�laj� v Khorinisu.
	AI_Output(self,other,"DIA_Addon_Farim_William_typen_11_02");	//V�m jen, kde se setkali s Wiliamem.
	AI_Output(self,other,"DIA_Addon_Farim_William_typen_11_03");	//Jen co jsem Wiliama poprv� vid�l, �ekl jsem si, �e je to rozen� ryb��.
	Info_AddChoice(dia_addon_farim_william,"Kde se p�esn� setkali?",dia_addon_farim_william_wo);
};

func void dia_addon_farim_william_wo()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_Wo_15_00");	//Kde se p�esn� setkali?
	AI_Output(self,other,"DIA_Addon_Farim_William_Wo_11_01");	//Na druh� stran� p��stavu na severu, je tam z�toka.
	AI_Output(self,other,"DIA_Addon_Farim_William_Wo_11_02");	//D� se tam dostat jen lod� nabo plav�n�m.
	AI_Output(self,other,"DIA_Addon_Farim_William_Wo_11_03");	//Je tam pl� a mal� ryb��sk� t�bor. Tam jsem je vid�l.
	self.flags = 0;
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Ryb�� Farim postr�d� sv�ho kamar�da Williama. Farim ��k�, �e William se setk�val s n�jak�mi hrdlo�ezy v z�toce na severu p��stavu.");
	Info_AddChoice(dia_addon_farim_william,"Mysl�m, �e jsem sly�el dost.",dia_addon_farim_william_tschau);
};

func void dia_addon_farim_william_wannweg()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_WannWeg_15_00");	//Kdy jsi je vid�l naposled?
	AI_Output(self,other,"DIA_Addon_Farim_William_WannWeg_11_01");	//P�ed n�kolika dny.
	Info_AddChoice(dia_addon_farim_william,"Ne�el jenom n�kam d�l ryba�it?",dia_addon_farim_william_fischen);
};

func void dia_addon_farim_william_fischen()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_Fischen_15_00");	//Ne�el jenom n�kam d�l ryba�it?
	AI_Output(self,other,"DIA_Addon_Farim_William_Fischen_11_01");	//To ne. Jeho lo� z�stala v p��stavu.
};

func void dia_addon_farim_william_auftauchen()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_auftauchen_15_00");	//Jsem si jist�, �e se znovu objev�.
	AI_Output(self,other,"DIA_Addon_Farim_William_auftauchen_11_01");	//To si nemysl�m. U� je pry� p��li� dlouho.
	AI_Output(self,other,"DIA_Addon_Farim_William_auftauchen_11_02");	//Boj�m se, �e jednoho dne z mo�e vylov�m jeho mrtvolu.
};

func void dia_addon_farim_william_tschau()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_Tschau_15_00");	//Mysl�m, �e jsem sly�el dost.
	AI_Output(self,other,"DIA_Addon_Farim_William_Tschau_11_01");	//Ned�lej si s t�m starosti. Nemysl�m si, �e bys ho na�el.
	Info_ClearChoices(dia_addon_farim_william);
};


instance DIA_ADDON_FARIM_PERM(C_INFO)
{
	npc = vlk_4301_addon_farim;
	nr = 99;
	condition = dia_addon_farim_perm_condition;
	information = dia_addon_farim_perm_info;
	permanent = TRUE;
	description = "Tak�e, jak jdou obchody?";
};


func int dia_addon_farim_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_farim_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_farim_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Farim_Perm_15_00");	//Tak�e, jak jdou obchody?
	if(FARIM_PISSEDOFF == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Farim_Perm_11_01");	//Ah. Ned�lej, �e t� to zaj�m�.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Farim_Perm_11_02");	//U� jsem za�il lep�� �asy. P��li� m�lo pro �ivot a p��li� mnoho pro smrt.
	};
};


instance DIA_ADDON_FARIM_WILLIAMREPORT(C_INFO)
{
	npc = vlk_4301_addon_farim;
	nr = 1;
	condition = dia_addon_farim_williamreport_condition;
	information = dia_addon_farim_williamreport_info;
	important = TRUE;
};


func int dia_addon_farim_williamreport_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_farim_william))
	{
		if((Npc_HasItems(other,itwr_addon_william_01) > 0) || (SATURAS_ABOUTWILLIAM == TRUE))
		{
			return TRUE;
		};
	};
};

func void dia_addon_farim_williamreport_info()
{
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_01");	//Jsi zp�t!
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_02");	//Sly�el jsi n�co o Wiliamovi?
	AI_Output(other,self,"DIA_Addon_Farim_Add_15_02");	//Je mrtv�.
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_03");	//(vzdychne) Ano, to jsem �ekal.
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_04");	//D�ky, �e jsi mi to p�i�l ��ct.
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_05");	//P�jdu do hospody a za jeho pod�l na posledn�m �lovku se napiju - on by to tak cht�l ...
};

