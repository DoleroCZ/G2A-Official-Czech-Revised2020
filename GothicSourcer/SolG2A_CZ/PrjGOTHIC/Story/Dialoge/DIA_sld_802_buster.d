
instance DIA_BUSTER_EXIT(C_INFO)
{
	npc = sld_802_buster;
	nr = 999;
	condition = dia_buster_exit_condition;
	information = dia_buster_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_buster_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_buster_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BUSTER_HELLO(C_INFO)
{
	npc = sld_802_buster;
	nr = 1;
	condition = dia_buster_hello_condition;
	information = dia_buster_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_buster_hello_condition()
{
	if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_LOST) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_buster_hello_info()
{
	AI_Output(self,other,"DIA_Buster_Hello_13_00");	//Kohopak to tady m�me? Nezn�m t� odn�kud?
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"Kdy� mysl�. Jsem na cest� za statk��em.",dia_buster_hello_goingtofarm);
	Info_AddChoice(dia_buster_hello,"Kdo se pt�?",dia_buster_hello_whoareyou);
};

func void dia_buster_hello_whoareyou()
{
	AI_Output(other,self,"DIA_Buster_Hello_WhoAreYou_15_00");	//Kdo se pt�?
	AI_Output(self,other,"DIA_Buster_Hello_WhoAreYou_13_01");	//Jsem Buster, jeden z Leeov�ch �oldn���!
	AI_Output(self,other,"DIA_Buster_Hello_WhoAreYou_13_02");	//A TY bys ke mn� m�l b�t tro�ku zdvo�ilej��, nebo toho bude� litovat!
	AI_Output(self,other,"DIA_Buster_Hello_WhoAreYou_13_03");	//Dobr�, co tady chce�?
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"Do toho ti nic nen�.",dia_buster_hello_notyourbusiness);
	Info_AddChoice(dia_buster_hello,"Leeho zn�m!",dia_buster_hello_iknowlee);
	Info_AddChoice(dia_buster_hello,"Jsem pouh�m poutn�kem, kter� by si r�d promluvil s hostinsk�m.",dia_buster_hello_goingtofarm);
};

func void dia_buster_hello_iknowlee()
{
	AI_Output(other,self,"DIA_Buster_Hello_IKnowLee_15_00");	//Leeho zn�m!
	AI_Output(self,other,"DIA_Buster_Hello_IKnowLee_13_01");	//Leeho zn� ka�d�! To nic neznamen�, k�mo. Zrovna te� mluv� SE MNOU!
	AI_Output(self,other,"DIA_Buster_Hello_IKnowLee_13_02");	//Tak�e, kam m� nam��eno?
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"Do toho ti nic nen�.",dia_buster_hello_notyourbusiness);
	Info_AddChoice(dia_buster_hello,"Jsem pouh�m poutn�kem, kter� by si r�d promluvil s hostinsk�m.",dia_buster_hello_goingtofarm);
};

func void dia_buster_hello_notyourbusiness()
{
	AI_Output(other,self,"DIA_Buster_Hello_NotYourBusiness_15_00");	//Do toho ti nic nen�.
	AI_Output(self,other,"DIA_Buster_Hello_NotYourBusiness_13_01");	//Takhle se mnou nikdo mluvit nebude, ty �erve! �ekl bych, �e je �as na po��dnou nakl�da�ku.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_buster_hello_goingtofarm()
{
	AI_Output(other,self,"DIA_Buster_Hello_GoingToFarm_15_00");	//Kdy� mysl�. Jsem na cest� za statk��em.
	AI_Output(self,other,"DIA_Buster_Hello_GoingToFarm_13_01");	//V�n�... Hm - nep�ijde� mi n�jak zvl᚝ nebezpe�n�.
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"Chce� se p�esv�d�it",dia_buster_hello_wannatestit);
	Info_AddChoice(dia_buster_hello,"Jednou nebo dvakr�t jsem zabil n�jakou p��eru.",dia_buster_hello_slewbeasts);
	Info_AddChoice(dia_buster_hello,"To m� pravdu.",dia_buster_hello_imnodanger);
};

func void dia_buster_hello_imnodanger()
{
	AI_Output(other,self,"DIA_Buster_Hello_ImNoDanger_15_00");	//To m� pravdu.
	AI_Output(self,other,"DIA_Buster_Hello_ImNoDanger_13_01");	//(samolib�) Jo, za ty roky se nau�� si takov�ch v�c� v��mat, k�mo.
	AI_Output(self,other,"DIA_Buster_Hello_ImNoDanger_13_02");	//V jednom kuse tady bojujeme se sk�ety. Nebo str�emi z m�sta. Teda, jsou to p�kn� neodbytn� prev�ti, to teda jo. (zasm�je se)
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"Mysl� SKUTE�N� sk�ety? Ty velk� potvory?",dia_buster_hello_realorcs);
	Info_AddChoice(dia_buster_hello,"Tak�e?",dia_buster_hello_sowhat);
	Info_AddChoice(dia_buster_hello,"P�sobiv�.",dia_buster_hello_impressive);
};

func void dia_buster_hello_slewbeasts()
{
	AI_Output(other,self,"DIA_Buster_Hello_SlewBeasts_15_00");	//Jednou nebo dvakr�t jsem zabil n�jakou p��eru.
	AI_Output(self,other,"DIA_Buster_Hello_SlewBeasts_13_01");	//Ha! (zasm�je se) Nejsp� jsi v poli roz�l�pnul p�r brouk� a vyhnal n�kolik krys z jejich nor.
	AI_Output(self,other,"DIA_Buster_Hello_SlewBeasts_13_02");	//Tady n�m jdou po krku sk�eti! Jo, a ta mizern� m�stsk� str�. (v�sm�n� se zasm�je)
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"Mysl� SKUTE�N� sk�ety? Ty velk� potvory?",dia_buster_hello_realorcs);
	Info_AddChoice(dia_buster_hello,"Tak�e?",dia_buster_hello_sowhat);
	Info_AddChoice(dia_buster_hello,"P�sobiv�.",dia_buster_hello_impressive);
};

func void dia_buster_hello_wannatestit()
{
	AI_Output(other,self,"DIA_Buster_Hello_WannaTestIt_15_00");	//Chce� se p�esv�d�it
	AI_Output(self,other,"DIA_Buster_Hello_WannaTestIt_13_01");	//Bo���ku! Vybral jsem si �patn�ho otlouk�nka, co?
	AI_Output(other,self,"DIA_Buster_Hello_WannaTestIt_15_02");	//Dalo by se to tak ��ct.
	AI_Output(self,other,"DIA_Buster_Hello_WannaTestIt_13_03");	//Tak poj�, uka� mi, co v tob� je.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_buster_hello_impressive()
{
	AI_Output(other,self,"DIA_Buster_Hello_Impressive_15_00");	//P�sobiv�.
	AI_Output(self,other,"DIA_Buster_Hello_Impressive_13_01");	//(zasm�je se) To je na�e �ivnost, chlap�e! Dokonce si d�l�me vlastn� zbran� a brn�n�!
	AI_Output(self,other,"DIA_Buster_Hello_Impressive_13_02");	//Vysm�v�me se smrti den co den. Ale o n��em takov�m nem� vesnick� bal�k jako ty ani zd�n�.
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"Asi ti budu muset uk�zat, jak velk� pon�t� o tom m�m!",dia_buster_hello_letmeshowyou);
	Info_AddChoice(dia_buster_hello,"Kdy� to ��k�...",dia_buster_hello_ifyousayso);
};

func void dia_buster_hello_ifyousayso()
{
	AI_Output(other,self,"DIA_Buster_Hello_IfYouSaySo_15_00");	//Kdy� to ��k�...
	AI_Output(self,other,"DIA_Buster_Hello_IfYouSaySo_13_01");	//(se znud�n�m zavr�en�m) Mazej, stra�pytle!
	AI_StopProcessInfos(self);
};

func void dia_buster_hello_letmeshowyou()
{
	AI_Output(other,self,"DIA_Buster_Hello_LetMeShowYou_15_00");	//Asi ti budu muset uk�zat, jak velk� pon�t� o tom m�m!
	AI_Output(self,other,"DIA_Buster_Hello_LetMeShowYou_13_01");	//To m� b�t jednomu�n� rolnick� povst�n�, nebo co?
	AI_Output(self,other,"DIA_Buster_Hello_LetMeShowYou_13_02");	//Tak dobr�, uka� mi, co v tob� je.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_buster_hello_sowhat()
{
	AI_Output(other,self,"DIA_Buster_Hello_SoWhat_15_00");	//Tak�e?
	AI_Output(self,other,"DIA_Buster_Hello_SoWhat_13_01");	//(odfrkne si) Jako bys v�d�l, o �em to tady mluv�m. Mysl� si, b�hv�jak nejsi siln�, co?
	AI_Output(self,other,"DIA_Buster_Hello_SoWhat_13_02");	//(rozzloben�) Mo�n� je na �ase, aby ti n�kdo u�t�d�il lekci!
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"Kdykoliv!",dia_buster_hello_whenever);
	Info_AddChoice(dia_buster_hello,"D�l�m si srandu ...",dia_buster_hello_justjoking);
};

func void dia_buster_hello_realorcs()
{
	AI_Output(other,self,"DIA_Buster_Hello_RealOrcs_15_00");	//Mysl� SKUTE�N� sk�ety? Ty velk� potvory?
	AI_Output(self,other,"DIA_Buster_Hello_RealOrcs_13_01");	//(povzdychne si) J� jenom... Po�kat! Chce� si ze m� utahovat?
	AI_Output(other,self,"DIA_Buster_Hello_RealOrcs_15_02");	//(s �sm�vem) To v�bec ne.
	AI_Output(self,other,"DIA_Buster_Hello_RealOrcs_13_03");	//Ty �erve! (ne�ekan� agresivn�) Ned� jinak, co?
	AI_Output(self,other,"DIA_Buster_Hello_RealOrcs_13_04");	//Tak poj� a uka�, co v tob� je, ty hrdino!
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"Kdykoliv!",dia_buster_hello_whenever);
	Info_AddChoice(dia_buster_hello,"D�l�m si srandu ...",dia_buster_hello_justjoking);
};

func void dia_buster_hello_whenever()
{
	AI_Output(other,self,"DIA_Buster_Hello_Whenever_15_00");	//Kdykoliv!
	AI_Output(self,other,"DIA_Buster_Hello_Whenever_13_01");	//Tak poj� bl�, k�mo!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_buster_hello_justjoking()
{
	AI_Output(other,self,"DIA_Buster_Hello_JustJoking_15_00");	//D�l�m si srandu.
	AI_Output(self,other,"DIA_Buster_Hello_JustJoking_13_01");	//No jo, jasn�, zastr� dr�pky! Jdi mi z o��!
	AI_StopProcessInfos(self);
};


instance DIA_BUSTER_FIGHTNONE(C_INFO)
{
	npc = sld_802_buster;
	nr = 1;
	condition = dia_buster_fightnone_condition;
	information = dia_buster_fightnone_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_buster_fightnone_condition()
{
	if(Npc_KnowsInfo(other,dia_buster_hello) && (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_buster_fightnone_info()
{
	AI_Output(self,other,"DIA_Buster_FightNone_13_00");	//Co chce�, stra�pytle?
};


instance DIA_BUSTER_DUELL(C_INFO)
{
	npc = sld_802_buster;
	nr = 3;
	condition = dia_buster_duell_condition;
	information = dia_buster_duell_info;
	permanent = TRUE;
	description = "Vyz�v�m t� k souboji!";
};


func int dia_buster_duell_condition()
{
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_LOST)
	{
		return TRUE;
	};
};

func void dia_buster_duell_info()
{
	AI_Output(other,self,"DIA_Buster_Duell_15_00");	//Vyz�v�m t� k souboji!
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE)
	{
		AI_Output(self,other,"DIA_Buster_Duell_13_01");	//Ha ha! Nechce� to nechat jen tak, co? Tak dobr� - poj� sem!
	}
	else
	{
		AI_Output(self,other,"DIA_Buster_Duell_13_02");	//Chce� to zkusit znovu? Otravo mizernej - dobr�, poj� sem!
		if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_CANCEL)
		{
			AI_Output(self,other,"DIA_Buster_Duell_13_03");	//Ale u� podruh� neut�kej!
		};
	};
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_BUSTER_WANNAJOIN(C_INFO)
{
	npc = sld_802_buster;
	nr = 2;
	condition = dia_buster_wannajoin_condition;
	information = dia_buster_wannajoin_info;
	permanent = TRUE;
	description = "Chci se p�idat k �oldn���m!";
};


func int dia_buster_wannajoin_condition()
{
	if((other.guild == GIL_NONE) && (BUSTER_DUELL == FALSE))
	{
		return TRUE;
	};
};

func void dia_buster_wannajoin_info()
{
	AI_Output(other,self,"DIA_Buster_WannaJoin_15_00");	//Chci se p�idat k �oldn���m!
	if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON) || (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST))
	{
		if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
		{
			AI_Output(self,other,"DIA_Buster_WannaJoin_13_01");	//Ka�d�, kdo m� r�nu tvrdou jako ty, by tady nem�l m�t ��dn� probl�my.
		}
		else
		{
			AI_Output(self,other,"DIA_Buster_WannaJoin_13_02");	//Nejsi zrovna nejlep�� bojovn�k, ale odvaha ti rozhodn� nechyb�.
		};
		AI_Output(self,other,"DIA_Buster_WannaJoin_13_03");	//M�j hlas tady moc neznamen�, proto�e jsem tady dlouho nebyl, ale a� se m� Lee zept�, budu hlasovat pro tebe.
		BUSTER_DUELL = TRUE;
		Log_CreateTopic(TOPIC_SLDRESPEKT,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_SLDRESPEKT,LOG_RUNNING);
		b_logentry(TOPIC_SLDRESPEKT,"Kdy� jsem Bustera porazil, nebude mi u� br�nit v cest� �oldn��sk�ch �ad.");
	}
	else
	{
		AI_Output(self,other,"DIA_Buster_WannaJoin_13_04");	//Ty? Nevzpom�n�m si, �e by k �oldn���m kdy p�ijali n�jak�ho sraba.
		if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_CANCEL)
		{
			AI_Output(self,other,"DIA_Buster_WannaJoin_13_05");	//Ut�kat ze souboje - s t�m se tady moc daleko nedostane�!
		};
	};
};


var int buster_sentenzatip;

instance DIA_BUSTER_OTHERSLD(C_INFO)
{
	npc = sld_802_buster;
	nr = 1;
	condition = dia_buster_othersld_condition;
	information = dia_buster_othersld_info;
	permanent = FALSE;
	description = "R�d bych se dozv�d�l n�co o �oldn���ch a zdej��m okol�.";
};


func int dia_buster_othersld_condition()
{
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_buster_othersld_info()
{
	AI_Output(other,self,"DIA_Buster_OtherSld_15_00");	//R�d bych se dozv�d�l n�co o �oldn���ch a zdej��m okol�.
	AI_Output(self,other,"DIA_Buster_OtherSld_13_01");	//O okol� ti toho moc nepov�m. Na to by ses m�l rad�ji zeptat farm���.
	AI_Output(self,other,"DIA_Buster_OtherSld_13_02");	//A co se t��e n�s �oldn��� - m�me jedno velice jednoduch� pravidlo: jestli dok�e� neustoupit, m��e� mezi n�s.
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Buster_OtherSld_13_03");	//Mysl�m, �e jsi p�esn� z toho materi�lu, kter� pot�ebujeme.
		AI_Output(self,other,"DIA_Buster_OtherSld_13_04");	//Ale ne, aby ti to stouplo do hlavy, �e jsi m�l v na�em posledn�m souboji �t�st�.
		AI_Output(self,other,"DIA_Buster_OtherSld_13_05");	//Na farm� je spousta hoch�, kte�� jsou o chloupek lep�� ne� j�.
		AI_Output(self,other,"DIA_Buster_OtherSld_13_06");	//Sentenza, nap��klad. Hl�d� vstup na farmu. A� se d�je co se d�je, s n�m se do k��ku nepou�t�j.
		BUSTER_SENTENZATIP = TRUE;
	}
	else if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON)
	{
	}
	else
	{
		AI_Output(self,other,"DIA_Buster_OtherSld_13_07");	//Ale pro� to vlastn� ��k�m takov�mu zbab�lci!
		AI_StopProcessInfos(self);
	};
};


var int buster_goldzumbrennen;
var int buster_bonus;

instance DIA_BUSTER_ABOUTSENTENZA(C_INFO)
{
	npc = sld_802_buster;
	nr = 1;
	condition = dia_buster_aboutsentenza_condition;
	information = dia_buster_aboutsentenza_info;
	permanent = FALSE;
	description = "Co s t�m Sentenzou?";
};


func int dia_buster_aboutsentenza_condition()
{
	if(BUSTER_SENTENZATIP == TRUE)
	{
		return TRUE;
	};
};

func void dia_buster_aboutsentenza_info()
{
	AI_Output(other,self,"DIA_Buster_AboutSentenza_15_00");	//Co s t�m Sentenzou?
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_01");	//A� p�ijde� na farmu, pokus� se z tebe vym��knout n�jak� pen�ze - to d�l� v�em nov��k�m.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_02");	//A b�t na tv�m m�st�, tak bych zaplatil. S�m jsem to sv�ho �asu ud�lal. Dobr� bylo, �e mi pak dal sv�j hlas.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_03");	//��k�, �e jedna laskavost vy�aduje druhou. Tenkr�t jsem tak p�i�el o v�echny sv� pen�ze, ale nebylo to vlastn� a� tak moc. A nakonec jsem byl r�d, �e to tak dopadlo.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_04");	//Ve chv�li, kdy� jsem vid�l, jak zml�til man�ka, kter� se rozhodl NEZAPLATIT.
	AI_Output(other,self,"DIA_Buster_AboutSentenza_15_05");	//D�ky za radu.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_06");	//R�do se stalo. M� pro tebe n�jakou cenu?
	Info_ClearChoices(dia_buster_aboutsentenza);
	Info_AddChoice(dia_buster_aboutsentenza,"Ne.",dia_buster_aboutsentenza_no);
	Info_AddChoice(dia_buster_aboutsentenza,"Tady m� - 5 zlat�ch.",dia_buster_aboutsentenza_give);
};

func void dia_buster_aboutsentenza_give()
{
	AI_Output(other,self,"DIA_Buster_AboutSentenza_Give_15_00");	//Tady m� - 5 zlat�ch.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_Give_13_01");	//D�ky, chlape. Zd� se, �e si ve�er budu moc d�t p�r korbel�. Na to nezapomenu.
	BUSTER_GOLDZUMBRENNEN = TRUE;
	BUSTER_BONUS = 50;
	Info_ClearChoices(dia_buster_aboutsentenza);
};

func void dia_buster_aboutsentenza_no()
{
	AI_Output(other,self,"DIA_Buster_AboutSentenza_No_15_00");	//Ne.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_No_13_01");	//Myslel jsem si to.
	Info_ClearChoices(dia_buster_aboutsentenza);
};


instance DIA_BUSTER_LEELEADER(C_INFO)
{
	npc = sld_802_buster;
	nr = 2;
	condition = dia_buster_leeleader_condition;
	information = dia_buster_leeleader_info;
	permanent = FALSE;
	description = "Lee je ��f �oldn���, ne?";
};


func int dia_buster_leeleader_condition()
{
	if(BUSTER_DUELL == TRUE)
	{
		return TRUE;
	};
};

func void dia_buster_leeleader_info()
{
	AI_Output(other,self,"DIA_Buster_LeeLeader_15_00");	//Lee je ��f �oldn���, ne?
	AI_Output(self,other,"DIA_Buster_LeeLeader_13_01");	//P�esn� tak - hej, u� jsem si vzpomn�l, odkud t� zn�m! Tys byl tak� v kolonii.
	AI_Output(other,self,"DIA_Buster_LeeLeader_15_02");	//(s povzdychem) To jsem byl.
	AI_Output(self,other,"DIA_Buster_LeeLeader_13_03");	//Nevid�l jsem t�, kdy� do�lo k tomu velk�mu t�esku. Ani hodnou chv�li p�edt�m.
	AI_Output(other,self,"DIA_Buster_LeeLeader_15_04");	//M�l jsem jin� starosti.
	AI_Output(self,other,"DIA_Buster_LeeLeader_13_05");	//Tos o hodn� p�i�el - co jsme byli v lochu, tak se dost v�c� zm�nilo.
};


instance DIA_BUSTER_WHATHAPPENED(C_INFO)
{
	npc = sld_802_buster;
	nr = 2;
	condition = dia_buster_whathappened_condition;
	information = dia_buster_whathappened_info;
	permanent = FALSE;
	description = "Co se stalo se �oldn��i v kolonii?";
};


func int dia_buster_whathappened_condition()
{
	if(Npc_KnowsInfo(other,dia_buster_leeleader) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_buster_whathappened_info()
{
	AI_Output(other,self,"DIA_Buster_WhatHappened_15_00");	//Co se stalo se �oldn��i v kolonii?
	AI_Output(self,other,"DIA_Buster_WhatHappened_13_01");	//Jakmile bari�ra padla, vyvedl n�s Lee z kolonie. ��kal, �e kdy� budeme dr�et pohromad�, tak se n�m nic nestane. A m�l pravdu.
	AI_Output(self,other,"DIA_Buster_WhatHappened_13_02");	//Netrvalo dlouho a na�li jsme si tady hezk� m�ste�ko. Statk�� n�m plat�, abychom zametali s domobranou z m�sta.
	AI_Output(self,other,"DIA_Buster_WhatHappened_13_03");	//A v�t�ina z n�s by do toho �la dobrovoln� i zadarmo.
	AI_Output(self,other,"DIA_Buster_WhatHappened_13_04");	//Ale Onar n�m d�v� j�dlo a aspo� tak m��eme n�jak zab�t �as, ne� se naskytne n�jak� p��le�itost pl�chnout z tohohle mizern�ho ostrova.
};


instance DIA_BUSTER_TEACH(C_INFO)
{
	npc = sld_802_buster;
	nr = 8;
	condition = dia_buster_teach_condition;
	information = dia_buster_teach_info;
	permanent = TRUE;
	description = "M��e� m� nau�it, jak l�pe bojovat?";
};


func int dia_buster_teach_condition()
{
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) <= 60)
	{
		return TRUE;
	};
};

func void dia_buster_teach_info()
{
	AI_Output(other,self,"DIA_Buster_Teach_15_00");	//M��e� m� nau�it, jak l�pe bojovat?
	if(self.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Buster_Teach_13_01");	//Mo�n� bych ti mohl d�t jednu dv� rady.
	}
	else
	{
		AI_Output(self,other,"DIA_Buster_Teach_13_02");	//Nejsi tak tup�, jak vypad�. Dobr�, nau��m t�, co v�m. Pak mo�n� proti mn� bude� m�t n�jakou �anci.
	};
	if(BUSTERLOG == FALSE)
	{
		Log_CreateTopic(TOPIC_SOLDIERTEACHER,LOG_NOTE);
		b_logentry(TOPIC_SOLDIERTEACHER,"Buster m� nau��, jak bojovat jednoru�n�mi zbran�mi.");
		BUSTERLOG = TRUE;
	};
	Info_ClearChoices(dia_buster_teach);
	Info_AddChoice(dia_buster_teach,DIALOG_BACK,dia_buster_teach_back);
	Info_AddChoice(dia_buster_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_buster_teach_1h_1);
	Info_AddChoice(dia_buster_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_buster_teach_1h_5);
};

func void dia_buster_teach_back()
{
	Info_ClearChoices(dia_buster_teach);
};

func void dia_buster_teach_1h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,60);
	Info_ClearChoices(dia_buster_teach);
	Info_AddChoice(dia_buster_teach,DIALOG_BACK,dia_buster_teach_back);
	Info_AddChoice(dia_buster_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_buster_teach_1h_1);
	Info_AddChoice(dia_buster_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_buster_teach_1h_5);
};

func void dia_buster_teach_1h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,60);
	Info_ClearChoices(dia_buster_teach);
	Info_AddChoice(dia_buster_teach,DIALOG_BACK,dia_buster_teach_back);
	Info_AddChoice(dia_buster_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_buster_teach_1h_1);
	Info_AddChoice(dia_buster_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_buster_teach_1h_5);
};


instance DIA_BUSTER_KAP3_EXIT(C_INFO)
{
	npc = sld_802_buster;
	nr = 999;
	condition = dia_buster_kap3_exit_condition;
	information = dia_buster_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_buster_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_buster_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BUSTER_SHADOWBEASTS(C_INFO)
{
	npc = sld_802_buster;
	nr = 30;
	condition = dia_buster_shadowbeasts_condition;
	information = dia_buster_shadowbeasts_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_buster_shadowbeasts_condition()
{
	if(((KAPITEL == 3) || (KAPITEL == 4)) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void b_dia_buster_shadowbeasts_ok()
{
	AI_StopProcessInfos(self);
};

func void dia_buster_shadowbeasts_info()
{
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_13_00");	//Hej, ty, chlap�e!
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_15_01");	//Co chce�?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_13_02");	//Posledn�ch p�r dn� jsem p�em��lel, jak v t�hle d��e p�ij�t k n�jak�m snadn�m pen�z�m.
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_15_03");	//A?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_13_04");	//Mysl�m, �e jsem p�i�el na to, jak n�jak� prachy z�skat.
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_13_05");	//Jeden kupec z m�sta vyklop� za jistou v�c p�knej bal�k.
	Info_ClearChoices(dia_buster_shadowbeasts);
	Info_AddChoice(dia_buster_shadowbeasts,"Co je to za kupce, o kter�m mluv�?",dia_buster_shadowbeasts_wer);
	Info_AddChoice(dia_buster_shadowbeasts,"O co jde?",dia_buster_shadowbeasts_was);
	Info_AddChoice(dia_buster_shadowbeasts,"Pro� mi to ��k�?",dia_buster_shadowbeasts_ich);
};

func void dia_buster_shadowbeasts_ich()
{
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_ich_15_00");	//Pro� mi to ��k�?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_ich_13_01");	//Nem��u do toho j�t s�m. Mus�m z�stat tady a d�vat pozor na ty pitom� ovce.
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_ich_15_02");	//Mysl� farm��e.
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_ich_13_03");	//No v�dy�.
};

func void dia_buster_shadowbeasts_was()
{
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_was_15_00");	//O co jde?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_was_13_01");	//Ten kupec tvrd�, �e by mohl na trhu velice dob�e zpen�it rohy st�nov� �elmy.
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_was_13_02");	//N�kdo bude muset j�t do lesa a ty stv�ry pokosit. A to je pr�v� pr�ce pro tebe.
	Info_AddChoice(dia_buster_shadowbeasts,"Kolik z toho kouk�?",dia_buster_shadowbeasts_was_wieviel);
};

func void dia_buster_shadowbeasts_was_wieviel()
{
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_was_wieviel_15_00");	//Kolik z toho kouk�?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_was_wieviel_13_01");	//Bal�k pen�z, to ti pov�d�m. Bude dost pro n�s pro oba.
	if(BUSTER_GOLDZUMBRENNEN == TRUE)
	{
		AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_was_wieviel_13_02");	//A proto�e jsi mi tenkr�t p�inesl to zlato, ud�l�m ti zvl�tn� cenu.
	};
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_was_wieviel_15_03");	//To zn� dob�e! D�m ti v�d�t, a� budu m�t n�jak� ty rohy.
	MIS_BUSTER_KILLSHADOWBEASTS_DJG = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BUSTER_KILLSHADOWBEASTS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BUSTER_KILLSHADOWBEASTS,LOG_RUNNING);
	b_logentry(TOPIC_BUSTER_KILLSHADOWBEASTS,"Buster mi nab�dl dobrou cenu za ka�d� roh st�nov� �elmy, kter� mu p�inesu.");
	Info_ClearChoices(dia_buster_shadowbeasts);
};

func void dia_buster_shadowbeasts_wer()
{
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_wer_15_00");	//Co je to za kupce, o kter�m mluv�?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_wer_13_01");	//Tak to ne, k�mo. Byl bych v�n� pitomec, kdybych ti prozradil sv�j zdroj. Chce� m� snad podfouknout?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_wer_13_02");	//Bu� se dohodne� SE MNOU, nebo v�bec. Kapi�to?
};


instance DIA_BUSTER_BRINGTROPHYSHADOWBEAST(C_INFO)
{
	npc = sld_802_buster;
	nr = 2;
	condition = dia_buster_bringtrophyshadowbeast_condition;
	information = dia_buster_bringtrophyshadowbeast_info;
	permanent = TRUE;
	description = "K t�m roh�m st�nov� �elmy...";
};


func int dia_buster_bringtrophyshadowbeast_condition()
{
	if((MIS_BUSTER_KILLSHADOWBEASTS_DJG == LOG_RUNNING) && (Npc_HasItems(other,itat_shadowhorn) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_SHADOWHORN] == FALSE)) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};


var int bustertrophyshadowbeastcounter;

func void dia_buster_bringtrophyshadowbeast_info()
{
	var int bustertrophyshadowbeastcount;
	var int xp_bringbustertrophyshadowbeast;
	var int xp_bringbustertrophyshadowbeasts;
	var int bustersbustertrophyshadowbeastoffer;
	var int bustertrophyshadowbeastgeld;
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_13_00");	//M�j kupec n�m dal sbohem.
		AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_15_01");	//Co to m� znamenat?
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_13_02");	//Je mrtv�. Klidn� si ty rohy nech. Stejn� nev�m, co bych s nimi te� d�lal.
		MIS_BUSTER_KILLSHADOWBEASTS_DJG = LOG_SUCCESS;
		b_giveplayerxp(XP_AMBIENT);
	}
	else if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_SHADOWHORN] == FALSE)
	{
		AI_Output(other,self,"DIA_Buster_ANIMALTROPHYSHADOWBEAST_15_03");	//Jak m�m vykuchat st�novou �elmu?
		AI_Output(self,other,"DIA_Buster_ANIMALTROPHYSHADOWBEAST_13_04");	//Ty to nev�? Teda chlape, �ekal jsem od tebe v�c.
		Info_ClearChoices(dia_buster_bringtrophyshadowbeast);
		Info_AddChoice(dia_buster_bringtrophyshadowbeast,"Pak se k tob� vr�t�m.",dia_buster_bringtrophyshadowbeast_back);
		Info_AddChoice(dia_buster_bringtrophyshadowbeast,b_buildlearnstring("U� m�.",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_SHADOWHORN)),dia_buster_bringtrophyshadowbeast_teach);
	}
	else
	{
		bustertrophyshadowbeastcount = Npc_HasItems(other,itat_shadowhorn);
		xp_bringbustertrophyshadowbeast = shadowbeast.level * XP_PER_VICTORY;
		bustersbustertrophyshadowbeastoffer = VALUE_SHADOWHORN + BUSTER_BONUS;
		if(bustertrophyshadowbeastcount == 1)
		{
			AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_15_05");	//M�m pro tebe roh st�nov� �elmy.
			b_giveplayerxp(xp_bringbustertrophyshadowbeast);
			b_giveinvitems(other,self,itat_shadowhorn,1);
			BUSTERTROPHYSHADOWBEASTCOUNTER = BUSTERTROPHYSHADOWBEASTCOUNTER + 1;
		}
		else
		{
			AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_15_06");	//M�m pro tv�ho kupce p�r dal��ch roh� st�nov� �elmy.
			b_giveinvitems(other,self,itat_shadowhorn,bustertrophyshadowbeastcount);
			xp_bringbustertrophyshadowbeasts = bustertrophyshadowbeastcount * xp_bringbustertrophyshadowbeast;
			BUSTERTROPHYSHADOWBEASTCOUNTER = BUSTERTROPHYSHADOWBEASTCOUNTER + bustertrophyshadowbeastcount;
			b_giveplayerxp(xp_bringbustertrophyshadowbeasts);
		};
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_13_07");	//Skv�l�. Uka�. A p�ines jich v�c. Kdo v�, jak dlouho bude ten kupec tyhle v�ci je�t� cht�t.
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_13_08");	//Tady je tv�j pod�l.
		bustertrophyshadowbeastgeld = bustertrophyshadowbeastcount * bustersbustertrophyshadowbeastoffer;
		CreateInvItems(self,itmi_gold,bustertrophyshadowbeastgeld);
		b_giveinvitems(self,other,itmi_gold,bustertrophyshadowbeastgeld);
	};
};

func void dia_buster_bringtrophyshadowbeast_teach()
{
	AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_teach_15_00");	//U� m�.
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_SHADOWHORN))
	{
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_teach_13_01");	//Tak poslouchej. Zabije� st�novou �elmu a pak ji pravou rukou chyt� co nejpevn�ji za roh.
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_teach_13_02");	//Potom zaraz� n�� do jej�ho �ela a kolem rohu vy��zne� �l�bek.
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_teach_13_03");	//N�� potom pou�ije� jako p�ku, roh odlom� a d� si ho do kapsy.
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_teach_13_04");	//No. A pak mi ho p�inese�. To by pro tebe nem�lo b�t a� tak t�k�.
	};
	Info_ClearChoices(dia_buster_bringtrophyshadowbeast);
};

func void dia_buster_bringtrophyshadowbeast_back()
{
	AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_back_15_00");	//Pak se k tob� vr�t�m.
	AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_back_13_01");	//To douf�m.
	Info_ClearChoices(dia_buster_bringtrophyshadowbeast);
};


instance DIA_BUSTER_KAP4_EXIT(C_INFO)
{
	npc = sld_802_buster;
	nr = 999;
	condition = dia_buster_kap4_exit_condition;
	information = dia_buster_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_buster_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_buster_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BUSTER_PERM4(C_INFO)
{
	npc = sld_802_buster;
	nr = 2;
	condition = dia_buster_perm4_condition;
	information = dia_buster_perm4_info;
	permanent = TRUE;
	description = "Co si mysl� o cel� t� drakobijeck� z�le�itosti?";
};


func int dia_buster_perm4_condition()
{
	if(KAPITEL >= 4)
	{
		return TRUE;
	};
};

func void dia_buster_perm4_info()
{
	AI_Output(other,self,"DIA_Buster_Perm4_15_00");	//Co si mysl� o cel� t� drakobijeck� z�le�itosti?
	AI_Output(self,other,"DIA_Buster_Perm4_13_01");	//Ho�i by z toho mohli vyt��skat docela dost zlata - pokud d��v nezaklepou ba�korama.
	AI_Output(self,other,"DIA_Buster_Perm4_13_02");	//J� osobn� se rad�i dr��m Leeho.
};


instance DIA_BUSTER_KAP5_EXIT(C_INFO)
{
	npc = sld_802_buster;
	nr = 999;
	condition = dia_buster_kap5_exit_condition;
	information = dia_buster_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_buster_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_buster_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BUSTER_KAP6_EXIT(C_INFO)
{
	npc = sld_802_buster;
	nr = 999;
	condition = dia_buster_kap6_exit_condition;
	information = dia_buster_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_buster_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_buster_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BUSTER_PICKPOCKET(C_INFO)
{
	npc = sld_802_buster;
	nr = 900;
	condition = dia_buster_pickpocket_condition;
	information = dia_buster_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_buster_pickpocket_condition()
{
	return c_beklauen(34,60);
};

func void dia_buster_pickpocket_info()
{
	Info_ClearChoices(dia_buster_pickpocket);
	Info_AddChoice(dia_buster_pickpocket,DIALOG_BACK,dia_buster_pickpocket_back);
	Info_AddChoice(dia_buster_pickpocket,DIALOG_PICKPOCKET,dia_buster_pickpocket_doit);
};

func void dia_buster_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_buster_pickpocket);
};

func void dia_buster_pickpocket_back()
{
	Info_ClearChoices(dia_buster_pickpocket);
};

