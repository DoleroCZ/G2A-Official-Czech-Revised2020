
instance DIA_BODO_EXIT(C_INFO)
{
	npc = bau_903_bodo;
	nr = 999;
	condition = dia_bodo_exit_condition;
	information = dia_bodo_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bodo_exit_condition()
{
	return TRUE;
};

func void dia_bodo_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BODO_HALLO(C_INFO)
{
	npc = bau_903_bodo;
	nr = 1;
	condition = dia_bodo_hallo_condition;
	information = dia_bodo_hallo_info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int dia_bodo_hallo_condition()
{
	return TRUE;
};

func void dia_bodo_hallo_info()
{
	AI_Output(other,self,"DIA_Bodo_Hallo_15_00");	//Jak se vede?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_01");	//Domobrana n�s vyd�rala dost dlouho. Te�, kdy� jsou �oldn��i na na�� stran�, se tu u� nedovol� v�ckr�t objevit.
		AI_Output(self,other,"DIA_Bodo_Hallo_12_02");	//Kr�l si mysl�, �e m��e jednodu�e odjet s ��mkoli. Ale my u� mu nic ned�me.
	};
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_03");	//Fajn. Kdy� uvid� n�koho z domobrany, nandej mu to i za m�, jo?
	};
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_04");	//Fajn. Innos s tebou.
	};
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_05");	//Kr�lovi voj�ci nejsou na t�hle farm� v�t�ni.
		AI_Output(self,other,"DIA_Bodo_Hallo_12_06");	//RI tak s tebou tady mo�n� bude mluvit dost lid�, ale ur�it� si tu neud�l� p��tele.
	};
};


instance DIA_BODO_BAUERNAUFSTAND(C_INFO)
{
	npc = bau_903_bodo;
	nr = 2;
	condition = dia_bodo_bauernaufstand_condition;
	information = dia_bodo_bauernaufstand_info;
	permanent = FALSE;
	description = "Ve m�st� se mluv� o rolnick� vzpou�e!";
};


func int dia_bodo_bauernaufstand_condition()
{
	return TRUE;
};

func void dia_bodo_bauernaufstand_info()
{
	AI_Output(other,self,"DIA_Bodo_Bauernaufstand_15_00");	//Ve m�st� se mluv� o rolnick� vzpou�e!
	AI_Output(self,other,"DIA_Bodo_Bauernaufstand_12_01");	//To je nesmysl. Jenom se sna��me br�nit v�sledky na�� tvrd� d�iny.
	AI_Output(self,other,"DIA_Bodo_Bauernaufstand_12_02");	//V�lka v�dycky nejv�c dol�h� na bedra roln�k�. A Onar u� nehodl� jen d�l st�t a koukat, jak n�s ty kr�lovsk� pijavice vys�vaj�.
};


instance DIA_BODO_BETT(C_INFO)
{
	npc = bau_903_bodo;
	nr = 3;
	condition = dia_bodo_bett_condition;
	information = dia_bodo_bett_info;
	permanent = FALSE;
	description = "M��u si tady n�kde odpo�inout?";
};


func int dia_bodo_bett_condition()
{
	return TRUE;
};

func void dia_bodo_bett_info()
{
	AI_Output(other,self,"DIA_Bodo_Bett_15_00");	//M��u si tady n�kde odpo�inout?
	AI_Output(self,other,"DIA_Bodo_Bett_12_01");	//Jestli hled� m�sto na span�, zajdi si do stodoly. Ale ani omylem si nelehni na �old�ckou postel.
	AI_Output(self,other,"DIA_Bodo_Bett_12_02");	//Onar zajistil, aby nechali n�s, farm��e na pokoji. Ale s cizinci, co nepat�� na farmu, si �old�ci mohou d�lat, co se jim zl�b�.
};


instance DIA_BODO_CIPHER(C_INFO)
{
	npc = bau_903_bodo;
	nr = 4;
	condition = dia_bodo_cipher_condition;
	information = dia_bodo_cipher_info;
	permanent = FALSE;
	description = "Cipher mi �ekl, �e mu n�kdo ukradl bal�k tr�vy z ba�in.";
};


func int dia_bodo_cipher_condition()
{
	if((MIS_CIPHER_BRINGWEED == LOG_RUNNING) || (MIS_CIPHER_PAKET == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_bodo_cipher_info()
{
	AI_Output(other,self,"DIA_Bodo_Cipher_15_00");	//Cipher mi �ekl, �e mu n�kdo ukradl bal�k tr�vy z ba�in.
	AI_Output(self,other,"DIA_Bodo_Cipher_12_01");	//A?
	AI_Output(other,self,"DIA_Bodo_Cipher_15_02");	//Mysl� si, �es to byl ty, kdo mu to vzal.
	AI_Output(self,other,"DIA_Bodo_Cipher_12_03");	//Aha, tak proto na m� ten chlap v�dycky tak p�iblble z�r�.
	AI_Output(self,other,"DIA_Bodo_Cipher_12_04");	//Posledn� dobou jsem na n�j byl obzv᚝ mil�, proto�e vypadal, �e sl�znul po��dnou pecku.
	AI_Output(self,other,"DIA_Bodo_Cipher_12_05");	//Ale s t�m j� nic neud�l�m. M��u se k n�mu chovat p��telsky, jak chci, a on se na m� stejn� �kleb�, jako by m� cht�l zab�t.
};


instance DIA_BODO_WEEDORELSE(C_INFO)
{
	npc = bau_903_bodo;
	nr = 5;
	condition = dia_bodo_weedorelse_condition;
	information = dia_bodo_weedorelse_info;
	permanent = FALSE;
	description = "Dej mi m�sto toho tu tr�vu!";
};


func int dia_bodo_weedorelse_condition()
{
	if((MIS_CIPHER_BRINGWEED == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bodo_cipher))
	{
		return TRUE;
	};
};

func void dia_bodo_weedorelse_info()
{
	AI_Output(other,self,"DIA_Bodo_WeedOrElse_15_00");	//Dej mi m�sto toho tu tr�vu!
	AI_Output(self,other,"DIA_Bodo_WeedOrElse_12_01");	//Hele, v�echno, co m�m, je tenhle �pek. Vem si ho a nech m� na pokoji.
	b_giveinvitems(self,other,itmi_joint,1);
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bodo_WeedOrElse_12_02");	//Je ti jasn�, �e na n�s �old�ci dohl�ej, �e jo?
		AI_Output(self,other,"DIA_Bodo_WeedOrElse_12_03");	//Tak ��dn� hlouposti!
	};
};


instance DIA_BODO_WEEDPERM(C_INFO)
{
	npc = bau_903_bodo;
	nr = 6;
	condition = dia_bodo_weedperm_condition;
	information = dia_bodo_weedperm_info;
	permanent = TRUE;
	description = "Nev���m ti ani slovo. Dej mi tu tr�vu!";
};


func int dia_bodo_weedperm_condition()
{
	if((MIS_CIPHER_BRINGWEED == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bodo_weedorelse))
	{
		return TRUE;
	};
};

func void dia_bodo_weedperm_info()
{
	AI_Output(other,self,"DIA_Bodo_WeedPERM_15_00");	//Nev���m ti ani slovo. Dej mi tu tr�vu!
	AI_Output(self,other,"DIA_Bodo_WeedPERM_12_01");	//Nem�m ji. Namoudu�i.
};


instance DIA_BODO_PICKPOCKET(C_INFO)
{
	npc = bau_903_bodo;
	nr = 900;
	condition = dia_bodo_pickpocket_condition;
	information = dia_bodo_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_bodo_pickpocket_condition()
{
	return c_beklauen(30,60);
};

func void dia_bodo_pickpocket_info()
{
	Info_ClearChoices(dia_bodo_pickpocket);
	Info_AddChoice(dia_bodo_pickpocket,DIALOG_BACK,dia_bodo_pickpocket_back);
	Info_AddChoice(dia_bodo_pickpocket,DIALOG_PICKPOCKET,dia_bodo_pickpocket_doit);
};

func void dia_bodo_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_bodo_pickpocket);
};

func void dia_bodo_pickpocket_back()
{
	Info_ClearChoices(dia_bodo_pickpocket);
};

