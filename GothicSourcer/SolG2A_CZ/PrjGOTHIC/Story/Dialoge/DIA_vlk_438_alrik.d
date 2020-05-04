
instance DIA_ALRIK_EXIT(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 999;
	condition = dia_alrik_exit_condition;
	information = dia_alrik_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_alrik_exit_condition()
{
	return TRUE;
};

func void dia_alrik_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ALRIK_PICKPOCKET(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 900;
	condition = dia_alrik_pickpocket_condition;
	information = dia_alrik_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_alrik_pickpocket_condition()
{
	return c_beklauen(55,50);
};

func void dia_alrik_pickpocket_info()
{
	Info_ClearChoices(dia_alrik_pickpocket);
	Info_AddChoice(dia_alrik_pickpocket,DIALOG_BACK,dia_alrik_pickpocket_back);
	Info_AddChoice(dia_alrik_pickpocket,DIALOG_PICKPOCKET,dia_alrik_pickpocket_doit);
};

func void dia_alrik_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_alrik_pickpocket);
};

func void dia_alrik_pickpocket_back()
{
	Info_ClearChoices(dia_alrik_pickpocket);
};


instance DIA_ALRIK_HALLO(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_hallo_condition;
	information = dia_alrik_hallo_info;
	permanent = FALSE;
	description = "Co tady d�l�?";
};


func int dia_alrik_hallo_condition()
{
	return TRUE;
};

func void dia_alrik_hallo_info()
{
	AI_Output(other,self,"DIA_Alrik_Hallo_15_00");	//Co tady d�l�?
	if(Npc_GetDistToWP(self,"NW_CITY_PATH_HABOUR_16_01") <= 500)
	{
		AI_Output(self,other,"DIA_Alrik_Hallo_09_01");	//(sm�je se) J� tady bydl�m!
	}
	else if(Npc_GetDistToWP(self,"NW_CITY_HABOUR_TAVERN01_01") <= 500)
	{
		AI_Output(self,other,"DIA_Alrik_Hallo_09_02");	//Co bych tu asi tak m�l d�lat? Piju!
	}
	else
	{
		AI_Output(self,other,"DIA_Alrik_Hallo_09_03");	//Vyjdu si na men�� proch�zku.
	};
	AI_Output(self,other,"DIA_Alrik_Hallo_09_04");	//Ale jestli t�m mysl�, co d�l�m cel� cen, tak po��d�m souboje.
};


instance DIA_ALRIK_YOUFIGHT(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_youfight_condition;
	information = dia_alrik_youfight_info;
	permanent = FALSE;
	description = "Ty po��d� souboje?";
};


func int dia_alrik_youfight_condition()
{
	if(Npc_KnowsInfo(other,dia_alrik_hallo))
	{
		return TRUE;
	};
};

func void dia_alrik_youfight_info()
{
	AI_Output(other,self,"DIA_Alrik_YouFight_15_00");	//Ty po��d� souboje?
	AI_Output(self,other,"DIA_Alrik_YouFight_09_01");	//Ka�d� den od poledne do ve�era.
	if(Npc_GetDistToWP(self,"NW_CITY_PATH_HABOUR_16_01") <= 500)
	{
		AI_Output(self,other,"DIA_Alrik_YouFight_09_02");	//A p��mo tady!
	};
	AI_Output(self,other,"DIA_Alrik_YouFight_09_03");	//Za skladi�t�m v p��stavn� �tvrti - v�ude dob�e, doma nejl�p!
};


instance DIA_ALRIK_REGELN(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_regeln_condition;
	information = dia_alrik_regeln_info;
	permanent = FALSE;
	description = "Jsou n�jak� pravidla?";
};


func int dia_alrik_regeln_condition()
{
	if(Npc_KnowsInfo(other,dia_alrik_youfight))
	{
		return TRUE;
	};
};

func void dia_alrik_regeln_info()
{
	AI_Output(other,self,"DIA_Alrik_Regeln_15_00");	//Jsou n�jak� pravidla?
	AI_Output(self,other,"DIA_Alrik_Regeln_09_01");	//Je to jednoduch�: jsou povolen� v�echny norm�ln� zbran�. ��dn� luky ani ku�e a ��DN� magie!
	AI_Output(self,other,"DIA_Alrik_Regeln_09_02");	//Bojujeme, dokud jeden z n�s nepadne. Jakmile bude jeden le�et s dr�kou v hl�n�, je konec, jasn�?
	AI_Output(self,other,"DIA_Alrik_Regeln_09_03");	//Ka�d�, kdo opust� m�sto z�pasu, taky prohr�l. Tak�e kdy� ute�e�, vyhr�l jsem j�!
	AI_Output(self,other,"DIA_Alrik_Regeln_09_04");	//Z�pisn� je 50 zla��k� a kdy� vyhraje�, dostane� zp�tky stovku. Kdy� ne, tak o ty prachy p�ijde� (u�kl�bne se).
	AI_Output(self,other,"DIA_Alrik_Regeln_09_05");	//Ch�pe�?
	AI_Output(other,self,"DIA_Alrik_Regeln_15_06");	//Jo!
};

func void b_alrik_again()
{
	AI_Output(self,other,"DIA_Alrik_Add_09_03");	//Tak co? Chce� si to se mnou znova rozdat? Mysl�m, �e jsem se mezit�m zlep�il.
};


instance DIA_ALRIK_NEWFIGHTS3(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_newfights3_condition;
	information = dia_alrik_newfights3_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_alrik_newfights3_condition()
{
	if((KAPITEL >= 3) && (KAPITEL <= 4) && (ALRIK_ARENAKAMPFVERLOREN <= 6))
	{
		return TRUE;
	};
};

func void dia_alrik_newfights3_info()
{
	b_addfightskill(self,NPC_TALENT_1H,20);
	b_setattributestochapter(self,4);
	b_alrik_again();
};


instance DIA_ALRIK_NEWFIGHTS5(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_newfights5_condition;
	information = dia_alrik_newfights5_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_alrik_newfights5_condition()
{
	if((KAPITEL >= 5) && (ALRIK_ARENAKAMPFVERLOREN <= 9))
	{
		return TRUE;
	};
};

func void dia_alrik_newfights5_info()
{
	b_addfightskill(self,NPC_TALENT_1H,20);
	b_setattributestochapter(self,6);
	b_alrik_again();
};

func void b_alrik_enough()
{
	AI_Output(self,other,"DIA_Alrik_WannaFight_09_05");	//�ekl bych, �e u� ses navyhr�val dost.
	AI_Output(self,other,"DIA_Alrik_WannaFight_09_06");	//Nech�pej m� �patn�, ale od minula mi je�t� nep�estalo hu�et v hlav�.
};

func void b_alrik_comebacklater()
{
	AI_Output(self,other,"DIA_Alrik_Add_09_02");	//Tak se vra� pozd�ji - j� mezit�m budu cvi�it.
};


instance DIA_ALRIK_WANNAFIGHT(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_wannafight_condition;
	information = dia_alrik_wannafight_info;
	permanent = TRUE;
	description = "Chci s tebou bojovat!";
};


func int dia_alrik_wannafight_condition()
{
	if(Npc_KnowsInfo(other,dia_alrik_regeln) && (self.aivar[AIV_ARENAFIGHT] == AF_NONE))
	{
		return TRUE;
	};
};

func void dia_alrik_wannafight_info()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_15_00");	//Chci s tebou bojovat!
	Info_ClearChoices(dia_alrik_wannafight);
	if(((ALRIK_ARENAKAMPFVERLOREN > 0) && (Npc_HasItems(self,itmw_alrikssword_mis) == 0)) || (Npc_HasEquippedMeleeWeapon(self) == FALSE))
	{
		if(MIS_ALRIK_SWORD == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_01");	//Nejd��v mi vra� me� a pak uvid�me.
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_02");	//Ne-e, ne� se ti znova postav�m, pot�ebuju lep�� zbra�!
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_03");	//P�ed p�r dny jsem musel prodat sv�j me�.
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_04");	//S n�m m� toti� nikdo neporaz�, hochu! Kdy� mi ho p�inese�, klidn� si s tebou zase zabojuju!
			ALRIK_VOMSCHWERTERZAEHLT = TRUE;
			Log_CreateTopic(TOPIC_ALRIKSCHWERT,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_ALRIKSCHWERT,LOG_RUNNING);
			b_logentry(TOPIC_ALRIKSCHWERT,"Alrik prodal sv�j me� obchodn�ku Jorovi. Bude se se mnou b�t pouze tehdy, pokud mu jej p�inesu zp�tky.");
		};
	}
	else if((KAPITEL <= 2) && (ALRIK_ARENAKAMPFVERLOREN > 3))
	{
		AI_Output(self,other,"DIA_Alrik_Add_09_00");	//Mysl�m, �e to by prozat�m mohlo sta�it.
		AI_Output(self,other,"DIA_Alrik_Add_09_01");	//Nech m� trochu vydechnout.
		b_alrik_comebacklater();
	}
	else if((KAPITEL >= 3) && (KAPITEL <= 4) && (ALRIK_ARENAKAMPFVERLOREN > 6))
	{
		b_alrik_enough();
		b_alrik_comebacklater();
	}
	else if((KAPITEL >= 5) && (ALRIK_ARENAKAMPFVERLOREN > 9))
	{
		b_alrik_enough();
		AI_Output(self,other,"DIA_Alrik_Add_09_04");	//Krom toho jsem u� dal dohromady dost pen�z.
		AI_Output(self,other,"DIA_Alrik_Add_09_05");	//Kon��m a jdu si ve m�st� naj�t n�jak� m�sto, kde bych mohl z�stat.
		AI_Output(self,other,"DIA_Alrik_Add_09_06");	//Kdo v�, mo�n� si otev�u obchod se zbran�mi.
	}
	else if(Wld_IsTime(11,0,19,0))
	{
		AI_Output(self,other,"DIA_Alrik_WannaFight_09_07");	//M� 50 zla��k�?
		Info_ClearChoices(dia_alrik_wannafight);
		Info_AddChoice(dia_alrik_wannafight,"Ani n�hodou...",dia_alrik_wannafight_nogold);
		if(Npc_HasItems(other,itmi_gold) >= 50)
		{
			Info_AddChoice(dia_alrik_wannafight,"Jak si p�eje�...",dia_alrik_wannafight_gold);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Alrik_WannaFight_09_08");	//Bojuju pouze od ob�da do ve�era.
		AI_Output(self,other,"DIA_Alrik_WannaFight_09_09");	//Boj stoj� za to pouze tehdy, pokud je kolem dost div�k�, kte�� uzav�raj� s�zky!
		if(Wld_IsTime(19,0,3,30))
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_10");	//Te� u� je moc pozd�, vra� se z�tra v poledne!
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_11");	//Te� je je�t� brzo, vra� se pozd�ji!
		};
	};
};

func void dia_alrik_wannafight_gold()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_Gold_15_00");	//Jak si p�eje�.
	b_giveinvitems(other,self,itmi_gold,50);
	AI_Output(self,other,"DIA_Alrik_WannaFight_Gold_09_01");	//(hlasit�) M�me tu nov�ho vyzyvatele!
	AI_Output(self,other,"DIA_Alrik_WannaFight_Gold_09_02");	//S�zky jsou uzav�eny.
	Npc_RemoveInvItems(self,itmi_gold,Npc_HasItems(self,itmi_gold));
	CreateInvItems(self,itmi_gold,100);
	AI_Output(self,other,"DIA_Alrik_WannaFight_Gold_09_03");	//Jsi p�ipraven?
	self.aivar[AIV_ARENAFIGHT] = AF_RUNNING;
	ALRIK_KAEMPFE = ALRIK_KAEMPFE + 1;
	Info_ClearChoices(dia_alrik_wannafight);
	Info_AddChoice(dia_alrik_wannafight,"Je�t� chvilku.",dia_alrik_wannafight_moment);
	Info_AddChoice(dia_alrik_wannafight,"Poj� sem!",dia_alrik_wannafight_now);
};

func void dia_alrik_wannafight_nogold()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_NoGold_15_00");	//Ani n�hodou.
	AI_Output(self,other,"DIA_Alrik_WannaFight_NoGold_09_01");	//Tak je se�e�! Bez s�zek nen� ��dn� boj!
	Info_ClearChoices(dia_alrik_wannafight);
};

func void dia_alrik_wannafight_now()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_NOW_15_00");	//Poj� sem!
	AI_Output(self,other,"DIA_Alrik_WannaFight_NOW_09_01");	//Tak uvid�me, jak to zvl�dne�!
	if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		CreateInvItems(self,itpo_health_03,1);
		b_useitem(self,itpo_health_03);
	};
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_alrik_wannafight_moment()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_Moment_15_00");	//Je�t� chvilku.
	AI_Output(self,other,"DIA_Alrik_WannaFight_Moment_09_01");	//Klidn� si dej na �as - j� za��n�m te�!
	if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		CreateInvItems(self,itpo_health_03,1);
		b_useitem(self,itpo_health_03);
	};
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_ALRIK_AFTERFIGHT(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_afterfight_condition;
	information = dia_alrik_afterfight_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_alrik_afterfight_condition()
{
	if((self.aivar[AIV_LASTFIGHTCOMMENT] == FALSE) && (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_NONE))
	{
		if(self.aivar[AIV_ARENAFIGHT] != AF_NONE)
		{
			return TRUE;
		}
		else if(Npc_IsInState(self,zs_talk))
		{
			return TRUE;
		};
	};
};

func void dia_alrik_afterfight_info()
{
	if((self.aivar[AIV_LASTPLAYERAR] == AR_NONE) && (self.aivar[AIV_ARENAFIGHT] != AF_NONE) && (self.aivar[AIV_ARENAFIGHT] != AF_AFTER_PLUS_DAMAGE))
	{
		if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_00");	//P�ni, chlape, ty m� ale s�lu!
			if(Npc_HasItems(self,itmi_gold) >= 100)
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_01");	//Tady m� t�ch 100 zla��k�, zaslou�il sis je!
				b_giveinvitems(self,other,itmi_gold,100);
			}
			else if(Npc_HasItems(self,itmi_gold) == 0)
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_02");	//Vid�m, �e sv� zlato sis u� vzal.
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_03");	//M�ls ale po�kat, a� ti je d�m - j� sv� slovo dr��m!
			}
			else
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_04");	//Tys m� ale pro�acoval, kdy� jsem byl v bezv�dom�!
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_05");	//To nen� dobr�, chlape! No, nevad�, ty prachy ti stejn� pat�ily - a tady je zbytek!
				b_giveinvitems(self,other,itmi_gold,Npc_HasItems(self,itmi_gold));
			};
			ALRIK_ARENAKAMPFVERLOREN = ALRIK_ARENAKAMPFVERLOREN + 1;
		}
		else if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_06");	//To byl dobr� boj. S�zku jsi ale prohr�l - nic si z toho ale ned�lej, p�isp�ls na dobrou v�c! (u�kl�bne se)
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_07");	//Hej, jak jsem �ekl, ka�d�, kdo se vzd�l� ze z�pasi�t�, prohr�l! Jestli to chce� ale zkusit znova, jsem ti k dispozici!
		};
		if(ALRIK_KAEMPFE == 1)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_08");	//A je�t� jedna v�c: o tom, co se d�je za skladi�t�m, se nemluv�.
			if((other.guild != GIL_MIL) && (other.guild != GIL_PAL))
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_09");	//Domobrana t� m��e �oupnout za m��e za sebemen�� proh�e�ek - a s�zen� na souboje se jim rozhodn� moc nel�b�.
			};
		};
		self.aivar[AIV_ARENAFIGHT] = AF_NONE;
		self.aivar[AIV_LASTFIGHTCOMMENT] = TRUE;
	}
	else
	{
		if(self.aivar[AIV_ARENAFIGHT] == AF_AFTER_PLUS_DAMAGE)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_10");	//Boj skon�il, b��dile!
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_11");	//Nel�b� se mi, kdy� n�kdo poru�uje pravidla.
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_12");	//Vypadni odsud!
		}
		else
		{
			if(ALRIK_KAEMPFE == 0)
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_13");	//Kdy� jsi se mnou cht�l bojovat, sta�ilo, abys m� prost� vyzval.
			}
			else
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_14");	//Jestli chce� dal�� boj, tak m� k n�mu prost� vyzvi!
			};
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_15");	//S takov�mi pobudy, jako jsi ty, nechci nic m�t! Odpal!
		};
		self.aivar[AIV_ARENAFIGHT] = AF_NONE;
		AI_StopProcessInfos(self);
	};
};


instance DIA_ALRIK_DUWOHNST(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_duwohnst_condition;
	information = dia_alrik_duwohnst_info;
	permanent = FALSE;
	description = "Ty bydl� za skladi�t�m?";
};


func int dia_alrik_duwohnst_condition()
{
	if(Npc_KnowsInfo(other,dia_alrik_youfight))
	{
		return TRUE;
	};
};

func void dia_alrik_duwohnst_info()
{
	AI_Output(other,self,"DIA_Alrik_DuWohnst_15_00");	//(p�ekvapen�) Ty bydl� za skladi�t�m?
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_01");	//Je to jenom do�asn�. (u�kl�bne se) Kdybys m�l tolik pen�z co j�, taky by sis dop��l trochu pohodl�!
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_02");	//B�val jsem v�cvikov�m instruktorem v arm�d�, ale pak jsem toho nechal a vydal se za dobrodru�stv�m.
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_03");	//A te� jsem skon�il v t�hle �pinav� d��e a posledn�ch 100 zla��k� vysolil str��m u br�ny.
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_04");	//Tak�e te� kouk�m zase p�ij�t k n�jak�m pen�z�m. Dokonce jsem musel prodat i sv�j me�.
	ALRIK_VOMSCHWERTERZAEHLT = TRUE;
};


instance DIA_ALRIK_WERSCHWERT(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_werschwert_condition;
	information = dia_alrik_werschwert_info;
	permanent = FALSE;
	description = "Komu jsi sv�j me� prodal?";
};


func int dia_alrik_werschwert_condition()
{
	if((ALRIK_VOMSCHWERTERZAEHLT == TRUE) && (MIS_ALRIK_SWORD != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_alrik_werschwert_info()
{
	AI_Output(other,self,"DIA_Alrik_WerSchwert_15_00");	//Komu jsi sv�j me� prodal?
	AI_Output(self,other,"DIA_Alrik_WerSchwert_09_01");	//U jednoho obchodn�ka na tr�i�ti jsem jej vym�nil za n�jak� z�soby.
	AI_Output(self,other,"DIA_Alrik_WerSchwert_09_02");	//Ten chl�pek se jmenuje Jora. Ty pochodn� a trochu j�dla, co mi dal, jsem u� d�vno spot�eboval.
	AI_Output(other,self,"DIA_Alrik_WerSchwert_15_03");	//Ten me� mi ale asi jen tak zadarmo ned�.
	AI_Output(self,other,"DIA_Alrik_WerSchwert_09_04");	//Ten me� je star� a nejsp� za n�j moc cht�t nebude. Mysli p�itom na prachy, kter� si vyd�l� na s�zk�ch p�i z�pase. (u�kl�bne se)
	MIS_ALRIK_SWORD = LOG_RUNNING;
};


var int alrik_einmalschwertbonus;

instance DIA_ALRIK_HAVESWORD(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_havesword_condition;
	information = dia_alrik_havesword_info;
	permanent = TRUE;
	description = "M�m ten tv�j me�.";
};


func int dia_alrik_havesword_condition()
{
	if(Npc_HasItems(other,itmw_alrikssword_mis) > 0)
	{
		return TRUE;
	};
};

func void dia_alrik_havesword_info()
{
	AI_Output(other,self,"DIA_Alrik_HaveSword_15_00");	//M�m ten tv�j me�.
	b_giveinvitems(other,self,itmw_alrikssword_mis,1);
	if(MIS_ALRIK_SWORD != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Alrik_HaveSword_09_01");	//P�ni! To je mnohem lep�� ne� bojovat s n�jak�m star�m klackem!
		MIS_ALRIK_SWORD = LOG_SUCCESS;
		b_giveplayerxp(XP_ALRIKSSWORD);
	}
	else
	{
		AI_Output(self,other,"DIA_Alrik_HaveSword_09_02");	//Skv�l�! Jsem zv�dav, jestli se m� te� odv�� vyzvat je�t� jednou!
	};
	if(ALRIK_EINMALSCHWERTBONUS == FALSE)
	{
		b_addfightskill(self,NPC_TALENT_1H,20);
		ALRIK_EINMALSCHWERTBONUS = TRUE;
	};
	AI_EquipBestMeleeWeapon(self);
};


instance DIA_ALRIK_KRIEG(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_krieg_condition;
	information = dia_alrik_krieg_info;
	permanent = FALSE;
	description = "Co v� o t� v�lce se sk�ety?";
};


func int dia_alrik_krieg_condition()
{
	if(Npc_KnowsInfo(other,dia_alrik_duwohnst) || (hero.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_alrik_krieg_info()
{
	AI_Output(other,self,"DIA_Alrik_Krieg_15_00");	//Co v� o t� v�lce se sk�ety?
	AI_Output(self,other,"DIA_Alrik_Krieg_09_01");	//K tomu nen� moc co ��ct. Ta v�lka prost� trv� u� moc dlouho.
	AI_Output(self,other,"DIA_Alrik_Krieg_09_02");	//Cel� zem� hladov�. V�ude propukaj� rolnick� nepokoje, kter� kr�l nemilosrdn� pot�r�.
	AI_Output(self,other,"DIA_Alrik_Krieg_09_03");	//Ale moc mu to nepom��e - t�ch vzpour je p��li� mnoho. Jestli v�lka brzo neskon��, cel� ��e se rozpadne.
};


var int alrik_vorauserzaehlt;

instance DIA_ALRIK_AUSBILDEN(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_ausbilden_condition;
	information = dia_alrik_ausbilden_info;
	permanent = TRUE;
	description = "M��e� m� u�it?";
};


func int dia_alrik_ausbilden_condition()
{
	if((Npc_KnowsInfo(other,dia_alrik_duwohnst) || (hero.guild != GIL_NONE)) && (ALRIK_TEACH1H == FALSE))
	{
		return TRUE;
	};
};

func void dia_alrik_ausbilden_info()
{
	AI_Output(other,self,"DIA_Alrik_Ausbilden_15_00");	//M��e� m� u�it?
	if((ALRIK_KAEMPFE == 0) && (hero.guild == GIL_NONE))
	{
		AI_Output(self,other,"DIA_Alrik_Ausbilden_09_01");	//Jestli se opravdu chce� nau�it bojovat, tak si to poj� rozdat se mnou. (dom��liv�) A ani si za tu lekci nebude� muset p�iplatit.
		ALRIK_VORAUSERZAEHLT = TRUE;
	}
	else
	{
		if(ALRIK_VORAUSERZAEHLT == TRUE)
		{
			AI_Output(self,other,"DIA_Alrik_Ausbilden_09_02");	//Dodr��m slovo a nau��m t� v�echno, co zn�m - pokud m� tedy dostatek zku�enost�.
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_Ausbilden_09_03");	//Jestli m� dostatek zku�enost�, tak jasn�!
		};
		ALRIK_TEACH1H = TRUE;
		Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
		b_logentry(TOPIC_CITYTEACHER,"Alrik m� nau�� bojovat jednoru�n�mi zbran�mi. Potuluje se za skladi�t�m v p��stavn� �tvrti.");
	};
};


var int alrik_merke_1h;

instance DIA_ALRIK_TEACH(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_teach_condition;
	information = dia_alrik_teach_info;
	permanent = TRUE;
	description = "Vycvi� m� v boji s me�em!";
};


func int dia_alrik_teach_condition()
{
	if(ALRIK_TEACH1H == TRUE)
	{
		return TRUE;
	};
};

func void dia_alrik_teach_info()
{
	AI_Output(other,self,"DIA_Alrik_Teach_15_00");	//Vycvi� m� v boji s me�em!
	ALRIK_MERKE_1H = other.hitchance[NPC_TALENT_1H];
	Info_ClearChoices(dia_alrik_teach);
	Info_AddChoice(dia_alrik_teach,DIALOG_BACK,dia_alrik_teach_back);
	Info_AddChoice(dia_alrik_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_alrik_teach_1h_1);
	Info_AddChoice(dia_alrik_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_alrik_teach_1h_5);
};

func void dia_alrik_teach_back()
{
	if(other.hitchance[NPC_TALENT_1H] >= (60 - 30))
	{
		AI_Output(self,other,"DIA_Alrik_Teach_Back_09_00");	//U� nejsi ��dn� nov��ek!
	}
	else if(other.hitchance[NPC_TALENT_1H] > ALRIK_MERKE_1H)
	{
		AI_Output(self,other,"DIA_Alrik_Teach_Back_09_01");	//U� ses po��dn� zlep�il - brzo z tebe bude po��dn� bojovn�k!
	};
	Info_ClearChoices(dia_alrik_teach);
};

func void dia_alrik_teach_1h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,60);
	Info_ClearChoices(dia_alrik_teach);
	Info_AddChoice(dia_alrik_teach,DIALOG_BACK,dia_alrik_teach_back);
	Info_AddChoice(dia_alrik_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_alrik_teach_1h_1);
	Info_AddChoice(dia_alrik_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_alrik_teach_1h_5);
};

func void dia_alrik_teach_1h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,60);
	Info_ClearChoices(dia_alrik_teach);
	Info_AddChoice(dia_alrik_teach,DIALOG_BACK,dia_alrik_teach_back);
	Info_AddChoice(dia_alrik_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_alrik_teach_1h_1);
	Info_AddChoice(dia_alrik_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_alrik_teach_1h_5);
};

