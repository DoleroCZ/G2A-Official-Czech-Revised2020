
instance DIA_ADDON_RAVEN_EXIT(C_INFO)
{
	npc = bdt_1090_addon_raven;
	nr = 999;
	condition = dia_addon_raven_exit_condition;
	information = dia_addon_raven_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_raven_exit_condition()
{
	return TRUE;
};

func void dia_addon_raven_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_RAVEN_HI(C_INFO)
{
	npc = bdt_1090_addon_raven;
	nr = 1;
	condition = dia_addon_raven_hi_condition;
	information = dia_addon_raven_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_raven_hi_condition()
{
	return TRUE;
};

func void dia_addon_raven_hi_info()
{
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_00");	//�, pod�vejme se, kdo to sem p�i�el.
	if(c_bodystatecontains(self,BS_SIT))
	{
		Npc_StopAni(self,"T_PRAY_RANDOM");
		AI_PlayAniBS(self,"T_PRAY_2_STAND",BS_STAND);
		AI_TurnToNPC(self,other);
	};
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_01");	//M�j p�n m� varoval, �e Innos na m� po�le sv�ho obl�bence.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_02");	//Neo�ek�val jsem t� ale tak brzy.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_03");	//Dob�e, nyn� kdy� jsi tu tak rychle, m��u t� ujistit, �e zem�e� stejn�.
	Info_ClearChoices(dia_addon_raven_hi);
	Info_AddChoice(dia_addon_raven_hi,"Ty jsi ten, kdo zem�e.",dia_addon_raven_hi_du);
	Info_AddChoice(dia_addon_raven_hi,"Tys zaprodal svou du�i Beliarovi!",dia_addon_raven_hi_soul);
};

func void dia_addon_raven_hi_du()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_00");	//Ty jsi ten, kdo zem�e.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_04");	//(posm�n�) Ty pro m� nejsi hrozba. J� ovl�d�m Beliar�v dr�p.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_05");	//J� povedu draky na pevninu. Spole�n� pak p�inesem temnotu na sv�t lid�.
};

func void dia_addon_raven_hi_soul()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_01");	//Tys zaprodal svou du�i Beliarovi!
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_06");	//Byl to ale dobr� obchod. Budu hlavn�m v�dcem jeho arm�d.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_07");	//A ty? Jak� je cena za TVOU du�i?
	Info_ClearChoices(dia_addon_raven_hi);
	Info_AddChoice(dia_addon_raven_hi,"Okay, sly�el jsem dost. Poj�me na to ...",dia_addon_raven_hi_attack);
	Info_AddChoice(dia_addon_raven_hi,"D�l�m pouze to, co mus� b�t ud�l�no.",dia_addon_raven_hi_only);
};

func void dia_addon_raven_hi_only()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_02");	//D�l�m pouze to, co mus� b�t ud�l�no.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_08");	//(usm�vav�) Poslouchej ho. Opravdov� slu�ebn�ku Innos�v! (hlasit� sm�ch)
	Info_ClearChoices(dia_addon_raven_hi);
	Info_AddChoice(dia_addon_raven_hi,"Okay, sly�el jsem dost. Poj�me na to ...",dia_addon_raven_hi_attack);
	Info_AddChoice(dia_addon_raven_hi,"Jsi si jist�, �e jsem Innos�v slu�ebn�k?",dia_addon_raven_hi_sure);
};

func void dia_addon_raven_hi_sure()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_03");	//Jsi si jist�, �e jsem Innos�v slu�ebn�k?
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_09");	//Co? O �em to mluv�?
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_04");	//A co kdy� jsem slu�ebn�k Adanose?
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_10");	//(posm�n�) Nesmysl!
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_05");	//Mo�n� 'J�' tak� slou��m Beliarovi - nebo pouze s�m sob�.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_11");	//(posm�v� se) Dob�e, kdy� je to tak, pak pro m� nejsi v�bec nep��tel.
	Info_ClearChoices(dia_addon_raven_hi);
	Info_AddChoice(dia_addon_raven_hi,"Okay, sly�el jsem dost. Poj�me na to ...",dia_addon_raven_hi_attack);
};

func void dia_addon_raven_hi_attack()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_06");	//Dobr�, sly�el jsem dost. Poj�me na to ...
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_12");	//(posm�v� se) Ty fakt chce� tak rychle zem��t? Dobr�, kdy� to tak chce� ...
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};

