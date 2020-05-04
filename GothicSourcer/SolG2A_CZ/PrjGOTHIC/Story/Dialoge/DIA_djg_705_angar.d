
instance DIA_ANGARDJG_EXIT(C_INFO)
{
	npc = djg_705_angar;
	nr = 999;
	condition = dia_angardjg_exit_condition;
	information = dia_angardjg_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_angardjg_exit_condition()
{
	return TRUE;
};

func void dia_angardjg_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ANGARDJG_HALLO(C_INFO)
{
	npc = djg_705_angar;
	nr = 5;
	condition = dia_angardjg_hallo_condition;
	information = dia_angardjg_hallo_info;
	description = "Nezn�me se? Ty jsi Cor Angar. B�val jsi templ��em v t�bo�e v ba�in�ch.";
};


func int dia_angardjg_hallo_condition()
{
	return TRUE;
};

func void dia_angardjg_hallo_info()
{
	AI_Output(other,self,"DIA_AngarDJG_HALLO_15_00");	//Nezn�me se? Ty jsi Cor Angar. B�val jsi templ��em v t�bo�e v ba�in�ch.
	AI_Output(self,other,"DIA_AngarDJG_HALLO_04_01");	//(rezignovan�) ��kej mi Angar. Ten titul u� nepou��v�m. Sp��ovo bratrstvo u� neexistuje.
	AI_Output(self,other,"DIA_AngarDJG_HALLO_04_02");	//Zaj�mav�, ale vypad� to, jako bys m� u� odn�kud znal. N�jak si t� nemohu vybavit.
	AI_Output(other,self,"DIA_AngarDJG_HALLO_15_03");	//Co to s tebou je?
	AI_Output(self,other,"DIA_AngarDJG_HALLO_04_04");	//(p�ehl�iv�) Ach, nebyl jsem jeden �as v�bec schopen usnout. Po��d jsem m�l no�n� m�ry.
	b_logentry(TOPIC_DRAGONHUNTER,"V Hornick�m �dol� jsem na�el Angara.");
};

func void b_sctellsangaraboutmadpsi()
{
	if(ANGAR_KNOWSMADPSI == FALSE)
	{
		AI_Output(other,self,"DIA_Angar_B_SCTellsAngarAboutMadPsi_15_00");	//Sp��ovo bratrstvo si zotro�ilo zlo.
		AI_Output(other,self,"DIA_Angar_B_SCTellsAngarAboutMadPsi_15_01");	//Tv� d��v�j�� p��tel� ze star�ho t�bora proch�zej� zem� v �ern�ch r�b�ch a vypadaj�, �e je v�e, co se h�be, neskute�n� �tve.
		AI_Output(self,other,"DIA_Angar_B_SCTellsAngarAboutMadPsi_04_02");	//O �em to mluv�?
	};
};

func void b_sctellsangaraboutmadpsi2()
{
	if(ANGAR_KNOWSMADPSI == FALSE)
	{
		AI_Output(other,self,"DIA_Angar_B_SCTellsAngarAboutMadPsi2_15_00");	//Slou�� nep��teli a nejsou ni��m jin�m ne� bezduch�mi bojovn�ky zla.
		AI_Output(self,other,"DIA_Angar_B_SCTellsAngarAboutMadPsi2_04_01");	//U v�ech boh�. V�d�t to, nebyl bych tak zaslepen�m. U� se to v�ckr�t nestane, P��sah�m..
		b_giveplayerxp(XP_ANGAR_KNOWSMADPSI);
		ANGAR_KNOWSMADPSI = TRUE;
	};
};


instance DIA_ANGAR_WIEKOMMSTDUHIERHER(C_INFO)
{
	npc = djg_705_angar;
	nr = 6;
	condition = dia_angar_wiekommstduhierher_condition;
	information = dia_angar_wiekommstduhierher_info;
	description = "Jak ses sem dostal?";
};


func int dia_angar_wiekommstduhierher_condition()
{
	if(Npc_KnowsInfo(other,dia_angardjg_hallo))
	{
		return TRUE;
	};
};

func void dia_angar_wiekommstduhierher_info()
{
	AI_Output(other,self,"DIA_Angar_WIEKOMMSTDUHIERHER_15_00");	//Jak ses sem dostal?
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_04_01");	//Pot�, co zanikla bari�ra, jsem se ukryl v hor�ch. Pak bylo na�ase, abych za�al n�co d�lat.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_04_02");	//Bloudil jsem n�kolik dn� a pak jsem se n�hle objevil na tomhle hrad�. Neptej se m�, co se stalo. J� to nev�m.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_04_03");	//A jako by toho bylo m�lo, je�t� jsem ztratil amulet, kter� jsem m�l u� dlouh� l�ta. Nejsp� se zbl�zn�m, kdy� se mi ho nepoda�� znovu nal�zt.
	Log_CreateTopic(TOPIC_ANGARSAMULETT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ANGARSAMULETT,LOG_RUNNING);
	b_logentry(TOPIC_ANGARSAMULETT,"Angar ztratil sv�j amulet a te� se jej zoufale sna�� naj�t.");
	Info_AddChoice(dia_angar_wiekommstduhierher,DIALOG_BACK,dia_angar_wiekommstduhierher_gehen);
	Info_AddChoice(dia_angar_wiekommstduhierher,"Kde p�esn� jsi ten amulet ztratil?",dia_angar_wiekommstduhierher_amulett);
	if(SC_KNOWSMADPSI == TRUE)
	{
		Info_AddChoice(dia_angar_wiekommstduhierher,"Sp��ovo bratrstvo si zotro�ilo zlo.",dia_angar_wiekommstduhierher_andere);
	}
	else
	{
		Info_AddChoice(dia_angar_wiekommstduhierher,"Co se stalo s ostatn�ma z t�bora v ba�in�ch?",dia_angar_wiekommstduhierher_andere);
	};
	if(DJG_ANGAR_SENTTOSTONES == FALSE)
	{
		Info_AddChoice(dia_angar_wiekommstduhierher,"Co bude� d�lat d�l?",dia_angar_wiekommstduhierher_nun);
	};
};

func void dia_angar_wiekommstduhierher_amulett()
{
	AI_Output(other,self,"DIA_Angar_WIEKOMMSTDUHIERHER_amulett_15_00");	//Kde p�esn� jsi ten amulet ztratil?
	if(DJG_ANGAR_SENTTOSTONES == FALSE)
	{
		AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_amulett_04_01");	//N�kde na jihu, kr�tce p�edt�m, ne� jsem se objevil tady na hrad�.
		b_logentry(TOPIC_ANGARSAMULETT,"Amulet by m�l le�et kdesi na jihu. Angar se po n�m jde pod�vat.");
	}
	else
	{
		AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_amulett_04_02");	//N�kde mus� b�t.
		b_logentry(TOPIC_ANGARSAMULETT,"Amulet se nach�z� u kamenn� hrobky na jihu Hornick�ho �dol�.");
	};
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_amulett_04_03");	//Boj�m se, �e ho n�kdo ukradl. Mus�m ho za ka�dou cenu dostat zp�tky.
};

func void dia_angar_wiekommstduhierher_andere()
{
	if(SC_KNOWSMADPSI == TRUE)
	{
		b_sctellsangaraboutmadpsi();
	}
	else
	{
		AI_Output(other,self,"DIA_Angar_WIEKOMMSTDUHIERHER_andere_15_00");	//Co se stalo s ostatn�ma z t�bora v ba�in�ch?
	};
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_01");	//Posledn� v�c, na kterou si pamatuju, bylo zni�en� bari�ry a nervy dr�saj�c� jekot, kter� ho doprov�zel.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_02");	//V panick� hr�ze jsme se vrhli k zemi a sv�jeli se bolest�. Ten zvuk. A po��d s�lil.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_03");	//A pak, kdy� bylo po v�em, se v�ichni zbl�znili a s hlasit�m �evem zmizeli ve tm�.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_04");	//Pak u� jsem je nikdy nevid�l.
	if(SC_KNOWSMADPSI == TRUE)
	{
		b_sctellsangaraboutmadpsi2();
	};
};

func void dia_angar_wiekommstduhierher_nun()
{
	AI_Output(other,self,"DIA_Angar_WIEKOMMSTDUHIERHER_nun_15_00");	//Co bude� d�lat d�l?
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_01");	//Nejd��v jsem si musel trochu odpo�inout, abych mohl za��t hledat sv�j ztracen� amulet.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_02");	//Zaslechl jsem n�co o drac�ch.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_03");	//Tak� se pov�d�, �e se do Hornick�ho �dol� vydalo mnoho bojovn�k� na jejich lov.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_04");	//Uva�uju o tom, �e bych se k nim p�idal.
	ANGAR_WILLDJGWERDEN = TRUE;
};

func void dia_angar_wiekommstduhierher_gehen()
{
	Info_ClearChoices(dia_angar_wiekommstduhierher);
};


instance DIA_ANGAR_SCTELLSANGARABOUTMADPSI2(C_INFO)
{
	npc = djg_705_angar;
	nr = 7;
	condition = dia_angar_sctellsangaraboutmadpsi2_condition;
	information = dia_angar_sctellsangaraboutmadpsi2_info;
	description = "Sp��ovo bratrstvo si zotro�ilo zlo.";
};


func int dia_angar_sctellsangaraboutmadpsi2_condition()
{
	if((SC_KNOWSMADPSI == TRUE) && (ANGAR_KNOWSMADPSI == FALSE) && Npc_KnowsInfo(other,dia_angar_wiekommstduhierher))
	{
		return TRUE;
	};
};

func void dia_angar_sctellsangaraboutmadpsi2_info()
{
	b_sctellsangaraboutmadpsi();
	b_sctellsangaraboutmadpsi2();
};


instance DIA_ANGAR_FOUNDAMULETT(C_INFO)
{
	npc = djg_705_angar;
	nr = 7;
	condition = dia_angar_foundamulett_condition;
	information = dia_angar_foundamulett_info;
	description = "Na�el jsem tv�j amulet.";
};


func int dia_angar_foundamulett_condition()
{
	if(Npc_HasItems(other,itam_mana_angar_mis) && Npc_KnowsInfo(other,dia_angar_wiekommstduhierher))
	{
		return TRUE;
	};
};

func void b_angarsamulettabgeben()
{
	AI_Output(other,self,"DIA_Angar_FOUNDAMULETT_15_00");	//Na�el jsem tv�j amulet.
	AI_Output(self,other,"DIA_Angar_FOUNDAMULETT_04_01");	//D�ky. Myslel jsem, �e u� ho nikdy neuvid�m.
	b_giveinvitems(other,self,itam_mana_angar_mis,1);
	DJG_ANGARGOTAMULETT = TRUE;
	b_giveplayerxp(XP_ANGARDJGUNDEADMAGE);
};

func void dia_angar_foundamulett_info()
{
	b_angarsamulettabgeben();
	Info_AddChoice(dia_angar_foundamulett,"Pro� je pro tebe tak d�le�it�?",dia_angar_foundamulett_besonders);
	Info_AddChoice(dia_angar_foundamulett,"Co bude� d�lat te�?",dia_angar_foundamulett_nun);
};

func void dia_angar_foundamulett_besonders()
{
	AI_Output(other,self,"DIA_Angar_FOUNDAMULETT_besonders_15_00");	//Pro� je pro tebe tak d�le�it�?
	AI_Output(self,other,"DIA_Angar_FOUNDAMULETT_besonders_04_01");	//Byl to d�rek.
	AI_Output(other,self,"DIA_Angar_FOUNDAMULETT_besonders_15_02");	//Aha.
};

func void dia_angar_foundamulett_nun()
{
	AI_Output(other,self,"DIA_Angar_FOUNDAMULETT_nun_15_00");	//Co bude� d�lat te�?
	AI_Output(self,other,"DIA_Angar_FOUNDAMULETT_nun_04_01");	//Vypadnu z tohodle zatracen�ho �dol�.
	AI_Output(self,other,"DIA_Angar_FOUNDAMULETT_nun_04_02");	//Mo�n� se je�t� n�kdy setk�me. Sbohem.
	AI_StopProcessInfos(self);
	if((Npc_GetDistToWP(self,"OC_TO_MAGE") < 1000) == FALSE)
	{
		Npc_ExchangeRoutine(self,"LeavingOW");
	};
};


instance DIA_ANGAR_DJG_ANWERBEN(C_INFO)
{
	npc = djg_705_angar;
	nr = 8;
	condition = dia_angar_djg_anwerben_condition;
	information = dia_angar_djg_anwerben_info;
	description = "Mo�n� bych ti mohl pomoct s nalezen�m toho amuletu.";
};


func int dia_angar_djg_anwerben_condition()
{
	if(Npc_KnowsInfo(other,dia_angar_wiekommstduhierher) && (DJG_ANGARGOTAMULETT == FALSE))
	{
		return TRUE;
	};
};

func void dia_angar_djg_anwerben_info()
{
	AI_Output(other,self,"DIA_Angar_DJG_ANWERBEN_15_00");	//Mo�n� bych ti mohl pomoct s nalezen�m toho amuletu.
	AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_04_01");	//Pro� ne. Trocha pomoci nem��e �kodit.
	if(DJG_ANGAR_SENTTOSTONES == FALSE)
	{
		Info_AddChoice(dia_angar_djg_anwerben,"U� mus�m j�t.",dia_angar_djg_anwerben_gehen);
		Info_AddChoice(dia_angar_djg_anwerben,"Kam chce� vyrazit?",dia_angar_djg_anwerben_wo);
		Info_AddChoice(dia_angar_djg_anwerben,"Kdy p�jde�?",dia_angar_djg_anwerben_wann);
	};
	if(ANGAR_WILLDJGWERDEN == TRUE)
	{
		Info_AddChoice(dia_angar_djg_anwerben,"Co ti drakobijci?",dia_angar_djg_anwerben_djg);
	};
};

func void dia_angar_djg_anwerben_djg()
{
	AI_Output(other,self,"DIA_Angar_DJG_ANWERBEN_DJG_15_00");	//Co ti drakobijci?
	AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_DJG_04_01");	//Promluv�m si s nimi pozd�ji. Mo�n� se jim moje siln� pa�e budou hodit.
};

func void dia_angar_djg_anwerben_wann()
{
	AI_Output(other,self,"DIA_Angar_DJG_ANWERBEN_wann_15_00");	//Kdy p�jde�?
	AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_wann_04_01");	//Jakmile mi bude l�p.
};

func void dia_angar_djg_anwerben_wo()
{
	AI_Output(other,self,"DIA_Angar_DJG_ANWERBEN_wo_15_00");	//Kam chce� vyrazit?
	AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_wo_04_01");	//M�l bych se vydat na jih, tam, co jsem byl naposled.
	AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_wo_04_02");	//Je tam jeskynn� hrob obklopen� balvany.
};

func void dia_angar_djg_anwerben_gehen()
{
	AI_Output(other,self,"DIA_Angar_DJG_ANWERBEN_gehen_15_00");	//U� mus�m j�t.
	AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_gehen_04_01");	//Bu� opatrn�.
	AI_StopProcessInfos(self);
};


instance DIA_ANGARDJG_WASMACHSTDU(C_INFO)
{
	npc = djg_705_angar;
	nr = 9;
	condition = dia_angardjg_wasmachstdu_condition;
	information = dia_angardjg_wasmachstdu_info;
	description = "N�co je �patn�?";
};


func int dia_angardjg_wasmachstdu_condition()
{
	if((Npc_GetDistToWP(self,"OW_DJG_WATCH_STONEHENGE_01") < 8000) && Npc_KnowsInfo(other,dia_angar_djg_anwerben) && (DJG_ANGARGOTAMULETT == FALSE))
	{
		return TRUE;
	};
};

func void dia_angardjg_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_AngarDJG_WASMACHSTDU_15_00");	//N�co je �patn�?
	AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_04_01");	//Sly�els to? Je�t� nikdy jsem v cel�m sv�m �ivot� nesly�el tak p��ern� zvuk!
	AI_Output(other,self,"DIA_AngarDJG_WASMACHSTDU_15_02");	//Co mysl�? Nesly�el jsem ani hl�sku!
	AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_04_03");	//Cel� tahle oblast p�chne smrt� a zk�zou. Ta zahn�vaj�c� stvo�en� hl�daj� skaln� p��stup do krypty, tam p�ed n�mi.
	AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_04_04");	//Skr�v� se tam n�co p��ern�ho a vys�l� to sv� nohsledy na povrch zem�.
	AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_04_05");	//Jsem si t�m�� jist�, �e jsem ten amulet ztratil n�kde tady.
	if(ANGAR_WILLDJGWERDEN == TRUE)
	{
		Info_AddChoice(dia_angardjg_wasmachstdu,"Mluvil jsi s drakobijci?",dia_angardjg_wasmachstdu_djg);
	};
};

func void dia_angardjg_wasmachstdu_djg()
{
	AI_Output(other,self,"DIA_AngarDJG_WASMACHSTDU_DJG_15_00");	//Mluvil jsi s drakobijci?
	AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_DJG_04_01");	//Ano. Ale o�ek�val jsem spole�enstvo podobn� tomu, co jsme m�li v t�bo�e v ba�in�ch.
	AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_DJG_04_02");	//Ti chlapi ale nejsou nic v�c ne� jen divok� nesourod� sb�rka naprost�ch pitomc�. To nen� nic pro m�.
};


instance DIA_ANGARDJG_WHATSINTHERE(C_INFO)
{
	npc = djg_705_angar;
	nr = 10;
	condition = dia_angardjg_whatsinthere_condition;
	information = dia_angardjg_whatsinthere_info;
	description = "Co se skr�v� v t� jeskyni ve skal�ch?";
};


func int dia_angardjg_whatsinthere_condition()
{
	if(Npc_KnowsInfo(other,dia_angardjg_wasmachstdu) && (DJG_ANGARGOTAMULETT == FALSE))
	{
		return TRUE;
	};
};

func void dia_angardjg_whatsinthere_info()
{
	AI_Output(other,self,"DIA_AngarDJG_WHATSINTHERE_15_00");	//Co se skr�v� v t� jeskyni ve skal�ch?
	AI_Output(self,other,"DIA_AngarDJG_WHATSINTHERE_04_01");	//N�co mi nechce dovolit se k t� jeskyni p�ibl�it!
	AI_Output(self,other,"DIA_AngarDJG_WHATSINTHERE_04_02");	//St�e�� ji magick� stvo�en�. Vid�l jsem je v noci, jak prohled�vaj� okol�. Nechutnost sama.
	AI_Output(self,other,"DIA_AngarDJG_WHATSINTHERE_04_03");	//Obr�tili se nazp�t a zmizeli mezi stromy. A tys m�l pocit, jako by vys�li v�echen �ivot z okol� jako houba vys�v� vodu.
	b_logentry(TOPIC_DRAGONHUNTER,"V Hornick�m �dol� jsem nalezl Angara.");
};


instance DIA_ANGARDJG_WANTTOGOINTHERE(C_INFO)
{
	npc = djg_705_angar;
	nr = 11;
	condition = dia_angardjg_wanttogointhere_condition;
	information = dia_angardjg_wanttogointhere_info;
	description = "Jdeme spole�n�.";
};


func int dia_angardjg_wanttogointhere_condition()
{
	if(Npc_KnowsInfo(other,dia_angardjg_whatsinthere) && (DJG_ANGARGOTAMULETT == FALSE))
	{
		return TRUE;
	};
};

func void dia_angardjg_wanttogointhere_info()
{
	AI_Output(other,self,"DIA_AngarDJG_WANTTOGOINTHERE_15_00");	//Jdeme spole�n�.
	AI_Output(self,other,"DIA_AngarDJG_WANTTOGOINTHERE_04_01");	//Zkus�m to. Ale bu� opatrn�.
	AI_StopProcessInfos(self);
	if(Npc_IsDead(skeletonmage_angar))
	{
		Npc_ExchangeRoutine(self,"Zwischenstop");
	}
	else
	{
		Npc_ExchangeRoutine(self,"Angriff");
		DJG_ANGARANGRIFF = TRUE;
	};
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};


instance DIA_ANGARDJG_UNDEADMAGEDEAD(C_INFO)
{
	npc = djg_705_angar;
	nr = 13;
	condition = dia_angardjg_undeadmagedead_condition;
	information = dia_angardjg_undeadmagedead_info;
	important = TRUE;
};


func int dia_angardjg_undeadmagedead_condition()
{
	if((Npc_GetDistToWP(self,"OW_UNDEAD_DUNGEON_02") < 1000) && (DJG_ANGARANGRIFF == TRUE) && (DJG_ANGARGOTAMULETT == FALSE) && Npc_IsDead(skeletonmage_angar))
	{
		return TRUE;
	};
};

func void dia_angardjg_undeadmagedead_info()
{
	AI_Output(self,other,"DIA_AngarDJG_UndeadMageDead_04_00");	//(k�i��) Jenom smrt a zk�za. Mus�m se odsud dostat.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"RunToEntrance");
};


instance DIA_ANGARDJG_UNDEADMAGECOMES(C_INFO)
{
	npc = djg_705_angar;
	nr = 13;
	condition = dia_angardjg_undeadmagecomes_condition;
	information = dia_angardjg_undeadmagecomes_info;
	important = TRUE;
};


func int dia_angardjg_undeadmagecomes_condition()
{
	if((Npc_GetDistToWP(self,"OW_PATH_3_13") < 500) && Npc_KnowsInfo(other,dia_angardjg_wanttogointhere) && (Npc_KnowsInfo(other,dia_angardjg_undeadmagedead) == FALSE) && (DJG_ANGARGOTAMULETT == FALSE) && Npc_IsDead(skeletonmage_angar))
	{
		return TRUE;
	};
};

func void dia_angardjg_undeadmagecomes_info()
{
	AI_Output(self,other,"DIA_AngarDJG_UNDEADMAGECOMES_04_00");	//(�ept�) Tady to je! Sly�els to?
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GotoStonehendgeEntrance");
};


instance DIA_ANGAR_WASISTLOS(C_INFO)
{
	npc = djg_705_angar;
	nr = 14;
	condition = dia_angar_wasistlos_condition;
	information = dia_angar_wasistlos_info;
	description = "Co se d�je?";
};


func int dia_angar_wasistlos_condition()
{
	if((Npc_GetDistToWP(self,"OW_PATH_3_STONES") < 1000) && (DJG_ANGARGOTAMULETT == FALSE) && Npc_IsDead(skeletonmage_angar))
	{
		return TRUE;
	};
};

func void dia_angar_wasistlos_info()
{
	AI_Output(other,self,"DIA_Angar_WASISTLOS_15_00");	//Co se d�je?
	AI_Output(self,other,"DIA_Angar_WASISTLOS_04_01");	//D�l u� s tebou j�t nem��u.
	AI_Output(self,other,"DIA_Angar_WASISTLOS_04_02");	//N�co mi ��k�, �e se odsud �iv� nedostanu.
	AI_Output(self,other,"DIA_Angar_WASISTLOS_04_03");	//Nedok�u to vysv�tlit, ale...
	if(SC_KNOWSMADPSI == TRUE)
	{
		AI_Output(self,other,"DIA_Angar_WASISTLOS_04_04");	//M�l bych se z t�hle zpropaden� zem� dostat co nejrychlej�. Jinak m� potk� stejn� osud jako m� bratry.
	}
	else
	{
		AI_Output(self,other,"DIA_Angar_WASISTLOS_04_05");	//Poka�d�, kdy� naraz�m na tyhle... zplozence pekel, m�m pocit, jako bych bojoval proti vlastn�m lidem.
	};
	AI_StopProcessInfos(self);
	b_logentry(TOPIC_DRAGONHUNTER,"Angar prost� ode�el. P�i boji se v�emi t�mi nemrtv�mi m�l pocit, jako by bojoval s vlastn�mi druhy.");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"LeavingOW");
};


instance DIA_ANGAR_WHYAREYOUHERE(C_INFO)
{
	npc = djg_705_angar;
	nr = 15;
	condition = dia_angar_whyareyouhere_condition;
	information = dia_angar_whyareyouhere_info;
	description = "Angare! Co tady d�l�?";
};


func int dia_angar_whyareyouhere_condition()
{
	if(Npc_GetDistToWP(self,"OW_CAVALORN_01") < 1000)
	{
		return TRUE;
	};
};

func void dia_angar_whyareyouhere_info()
{
	AI_Output(other,self,"DIA_Angar_WHYAREYOUHERE_15_00");	//Angare! Co tady d�l�?
	AI_Output(self,other,"DIA_Angar_WHYAREYOUHERE_04_01");	//Byl jsem na cest� k pr�smyku, kdy� jsem narazil na sk�ety. Nedok�zal jsem ty bezbo�n� barbary set��st.
	AI_Output(self,other,"DIA_Angar_WHYAREYOUHERE_04_02");	//Zat�m tady po�k�m a pak projdu pr�smykem. Uvid�me se na druh� stran�!
	b_logentry(TOPIC_DRAGONHUNTER,"Op�t jsem se potkal s Angarem. Je�t� po��d z�st�v� v Hornick�m �dol�.");
	b_giveplayerxp(XP_ANGARDJGAGAIN);
	AI_StopProcessInfos(self);
};


instance DIA_ANGAR_PERMKAP4(C_INFO)
{
	npc = djg_705_angar;
	condition = dia_angar_permkap4_condition;
	information = dia_angar_permkap4_info;
	permanent = TRUE;
	description = "V�n� t� m��u nechat samotn�ho?";
};


func int dia_angar_permkap4_condition()
{
	if(Npc_KnowsInfo(other,dia_angar_whyareyouhere))
	{
		return TRUE;
	};
};

func void dia_angar_permkap4_info()
{
	AI_Output(other,self,"DIA_Angar_PERMKAP4_15_00");	//V�n� t� m��u nechat samotn�ho?
	AI_Output(self,other,"DIA_Angar_PERMKAP4_04_01");	//Jasn�. Jdi. Uvid�me se.
	AI_StopProcessInfos(self);
};


instance DIA_ANGAR_PICKPOCKET(C_INFO)
{
	npc = djg_705_angar;
	nr = 900;
	condition = dia_angar_pickpocket_condition;
	information = dia_angar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_angar_pickpocket_condition()
{
	return c_beklauen(47,55);
};

func void dia_angar_pickpocket_info()
{
	Info_ClearChoices(dia_angar_pickpocket);
	Info_AddChoice(dia_angar_pickpocket,DIALOG_BACK,dia_angar_pickpocket_back);
	Info_AddChoice(dia_angar_pickpocket,DIALOG_PICKPOCKET,dia_angar_pickpocket_doit);
};

func void dia_angar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_angar_pickpocket);
};

func void dia_angar_pickpocket_back()
{
	Info_ClearChoices(dia_angar_pickpocket);
};

