
instance DIA_NOV_8_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_nov_8_exit_condition;
	information = dia_nov_8_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_nov_8_exit_condition()
{
	return TRUE;
};

func void dia_nov_8_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NOV_8_FEGEN(C_INFO)
{
	nr = 2;
	condition = dia_nov_8_fegen_condition;
	information = dia_nov_8_fegen_info;
	permanent = TRUE;
	description = "Pot�ebuju pomoci zam�st pokoje novic�.";
};


func int dia_nov_8_fegen_condition()
{
	if((KAPITEL == 1) && (MIS_KLOSTERARBEIT == LOG_RUNNING) && (NOV_HELFER < 4))
	{
		return TRUE;
	};
};


var int feger3_permanent;

func void dia_nov_8_fegen_info()
{
	AI_Output(other,self,"DIA_NOV_8_Fegen_15_00");	//Pot�ebuju pomoci zam�st pokoje novic�.
	if(Hlp_GetInstanceID(feger3) == Hlp_GetInstanceID(self))
	{
		if(FEGER3_PERMANENT == FALSE)
		{
			AI_Output(self,other,"DIA_NOV_8_Fegen_08_01");	//No nazdar. Pr�v� jsi p�i�el a hned ze sebe nech� d�lat ukl�ze�ku?
			AI_Output(self,other,"DIA_NOV_8_Fegen_08_02");	//Uklidni se, se mnou to bylo to sam�, kdy� jsem sem poprv� p�i�el. A proto se ti chyst�m pomoct. Asi by se n�m p�kn� vysm�li, kdybychom to nezvl�dli.
			NOV_HELFER = NOV_HELFER + 1;
			FEGER3_PERMANENT = TRUE;
			b_giveplayerxp(XP_FEGER);
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"FEGEN");
			b_logentry(TOPIC_PARLANFEGEN,"U� jsem narazil na novice, kter� mi s �klidem komnat pom��e.");
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_8_Fegen_08_03");	//Brat�e, jsem obezn�men se situac�, do kter� ses dostal. A u� jsem ti �ekl, �e ti pomohu. A to pr�v� d�l�m.
		};
	};
	if(Hlp_GetInstanceID(feger3) == Hlp_GetInstanceID(self) == FALSE)
	{
		AI_Output(self,other,"DIA_NOV_8_Fegen_08_04");	//Hele, r�d bych, ale fakt nem�m �as.
	};
};


instance DIA_NOV_8_WURST(C_INFO)
{
	nr = 3;
	condition = dia_nov_8_wurst_condition;
	information = dia_nov_8_wurst_info;
	permanent = TRUE;
	description = "Co takhle jem�ou�k� skopov� klob�ska?";
};


func int dia_nov_8_wurst_condition()
{
	if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void dia_nov_8_wurst_info()
{
	var string novizetext;
	var string novizeleft;
	AI_Output(other,self,"DIA_NOV_8_Wurst_15_00");	//Co takhle jem�ou�k� skopov� klob�ska?
	AI_Output(self,other,"DIA_NOV_8_Wurst_08_01");	//Tak tomu se ned� ��ct ne. D�ky, chlape, p�esn� to jsem pot�eboval.
	b_giveinvitems(other,self,itfo_schafswurst,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,itfo_sausage);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,2);
};


instance DIA_NOV_8_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_nov_8_join_condition;
	information = dia_nov_8_join_info;
	permanent = TRUE;
	description = "Co mus�m ud�lat, abych se stal m�gem?";
};


func int dia_nov_8_join_condition()
{
	if(hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_nov_8_join_info()
{
	AI_Output(other,self,"DIA_NOV_8_JOIN_15_00");	//Co mus�m ud�lat, abych se stal m�gem?
	AI_Output(self,other,"DIA_NOV_8_JOIN_08_01");	//Innosov�m vyvolen�m se m��e� st�t pouze v p��pad�, �e k tomu d� svolen� Nejvy��� rada.
	AI_Output(self,other,"DIA_NOV_8_JOIN_08_02");	//Jako novicov� m�me zak�z�no studovat runovou magii - a star� posv�tn� spisy m��eme pro��tat jen se svolen�m m�g�.
};


instance DIA_NOV_8_PEOPLE(C_INFO)
{
	nr = 5;
	condition = dia_nov_8_people_condition;
	information = dia_nov_8_people_info;
	permanent = TRUE;
	description = "Kdo vede tenhle kl�ter?";
};


func int dia_nov_8_people_condition()
{
	return TRUE;
};

func void dia_nov_8_people_info()
{
	AI_Output(other,self,"DIA_NOV_8_PEOPLE_15_00");	//Kdo vede tenhle kl�ter?
	AI_Output(self,other,"DIA_NOV_8_PEOPLE_08_01");	//Nejvy��� rada, kterou tvo�� t�i nejmocn�j�� m�gov�. Ka�dodenn� se sch�zej� v kostele.
	AI_Output(self,other,"DIA_NOV_8_PEOPLE_08_02");	//Innosovi Vyvolen� jsou v�ichni m�gov�. Innos jim poskytl tento dar, a tak mohou na zemi plnit jeho v�li.
};


instance DIA_NOV_8_LOCATION(C_INFO)
{
	nr = 6;
	condition = dia_nov_8_location_condition;
	information = dia_nov_8_location_info;
	permanent = TRUE;
	description = "�ekni mi o kl�teru n�co v�c.";
};


func int dia_nov_8_location_condition()
{
	return TRUE;
};

func void dia_nov_8_location_info()
{
	AI_Output(other,self,"DIA_NOV_8_LOCATION_15_00");	//�ekni mi o kl�teru n�co v�c.
	AI_Output(self,other,"DIA_NOV_8_LOCATION_08_01");	//Jeho p�vod sah� hluboko do minulosti. Poch�z� z dob vl�dy Rhobara I.
	AI_Output(self,other,"DIA_NOV_8_LOCATION_08_02");	//Pod kl�terem se rozkl�daj� katakomby. Vedou hluboko do hor.
};


instance DIA_NOV_8_STANDARD(C_INFO)
{
	nr = 10;
	condition = dia_nov_8_standard_condition;
	information = dia_nov_8_standard_info;
	permanent = TRUE;
	description = "Co je nov�ho?";
};


func int dia_nov_8_standard_condition()
{
	return TRUE;
};

func void dia_nov_8_standard_info()
{
	AI_Output(other,self,"DIA_NOV_8_STANDARD_15_00");	//Co je nov�ho?
	if(KAPITEL == 1)
	{
		if(other.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_01");	//Dalo by se ��ct, �e ano. U� je to v�c ne� sto let, co byl n�jak� novic tak rychle p�ijat do Kruhu ohn�.
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_02");	//Douf�m, �e se mi t�to cti tak� jednou dostane. Budu na tom tvrd� pracovat.
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_03");	//Ned�vno do Khorinisu p�ijeli paladinov�. Jeden z nich je tady v kl�te�e, aby se tu modlil k Innosovi.
		};
	};
	if((KAPITEL == 2) || (KAPITEL == 3))
	{
		if((PEDRO_TRAITOR == TRUE) && (MIS_NOVIZENCHASE != LOG_SUCCESS))
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_08_04");	//Po��d tomu nemohu uv��it. Jeden z n�s zradil kl�ter a ukradl Innosovo oko.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_08_05");	//Na��m �kolem bylo vybudovat soudr�nou spole�nost, ale byli jsme p��li� slab�. To je jedin� d�vod, pro� se mohlo Beliarovi poda�it p�et�hnout jednoho z n�s na svou stranu.
		}
		else if(MIS_NOVIZENCHASE == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_08_06");	//Innos bu� pochv�len. Poda�ilo se n�m Oko dostat od nep��tele zp�t.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_08_07");	//Tv� odvaha by mohla b�t p��kladem mnoha zoufal�m du��m, a pomoci jim tak p�e�kat tyto temn� �asy.
		}
		else if(MIS_OLDWORLD == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_08");	//Zaslechl jsem n�co o drac�ch a arm�d� Zla. Innos n�s opatruj!
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_09");	//Nejvy��� rada m� na situaci na�ich paladin� zvl�tn� z�jem. U� n�jakou dobu jsme z Hornick�ho �dol� nedostali ��dn� zpr�vy.
		};
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_NOV_8_STANDARD_08_10");	//Ne. A jsem za to na�emu P�nu vd��n�. S Innosov�m okem budeme moci ty draky porazit!
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_NOV_8_STANDARD_08_11");	//Ano. Dos�hli jsme v�t�zstv� nad draky! Innos n�m uk�zal, �e nikdy nesm�me ztr�cet nad�ji.
		AI_Output(self,other,"DIA_NOV_8_STANDARD_08_12");	//V sou�asnosti se mus�me pot�kat s mno�stv�m temnoty a bude pot�eba je�t� za�ehnout mnoho oh��, abychom ji zprovodili ze sv�ta.
	};
};

func void b_assignambientinfos_nov_8(var C_NPC slf)
{
	dia_nov_8_exit.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_join.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_people.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_location.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_standard.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_fegen.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_wurst.npc = Hlp_GetInstanceID(slf);
};

