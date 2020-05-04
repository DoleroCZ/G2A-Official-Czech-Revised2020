
instance DIA_ADDON_QUARHODRON_EXIT(C_INFO)
{
	npc = none_addon_111_quarhodron;
	nr = 999;
	condition = dia_addon_quarhodron_exit_condition;
	information = dia_addon_quarhodron_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_quarhodron_exit_condition()
{
	return TRUE;
};

func void dia_addon_quarhodron_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_QUARHODRON_HELLO(C_INFO)
{
	npc = none_addon_111_quarhodron;
	nr = 5;
	condition = dia_addon_quarhodron_hello_condition;
	information = dia_addon_quarhodron_hello_info;
	important = TRUE;
	permanent = TRUE;
};


var int dia_addon_quarhodron_hello_noperm;

func int dia_addon_quarhodron_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (DIA_ADDON_QUARHODRON_HELLO_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_quarhodron_hello_info()
{
	if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_11_00");	//Pro� ru�� m�j klid, str�ce?
		AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_11_01");	//(otr�ven�) �ekni mi, co chce�?
		Info_ClearChoices(dia_addon_quarhodron_hello);
		Info_AddChoice(dia_addon_quarhodron_hello,"Co se skr�v� v Adanov� chr�mu?",dia_addon_quarhodron_hello_schwert);
		Info_AddChoice(dia_addon_quarhodron_hello,"N�kdo vstoupil do Adanova chr�mu.",dia_addon_quarhodron_hello_raven);
		Info_AddChoice(dia_addon_quarhodron_hello,"Ud�l mi vstup do Adanova chr�mu.",dia_addon_quarhodron_hello_tempel);
		Info_AddChoice(dia_addon_quarhodron_hello,"Zem� je rozbita zem�t�esen�mi.",dia_addon_quarhodron_hello_erdbeben);
		DIA_ADDON_QUARHODRON_HELLO_NOPERM = TRUE;
		Npc_RemoveInvItems(hero,itwr_addon_summonancientghost,1);
		SC_TALKEDTOGHOST = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_11_02");	//Bengla anthani, Osiri?
		b_say(other,self,"$CANTUNDERSTANDTHIS");
		AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_11_03");	//(hlasit�) Bengla anthani, Osiri?
		AI_StopProcessInfos(self);
	};
};


var int dia_addon_quarhodron_hello_choicecounter;
var int b_quarhodron_hello_kommzumpunkt_onetime;

func void b_quarhodron_hello_kommzumpunkt()
{
	if((DIA_ADDON_QUARHODRON_HELLO_CHOICECOUNTER >= 3) && (b_quarhodron_hello_kommzumpunkt_onetime == FALSE))
	{
		Info_AddChoice(dia_addon_quarhodron_hello,"N�co od tebe pot�ebuji.",dia_addon_quarhodron_hello_frech);
		b_quarhodron_hello_kommzumpunkt_onetime = TRUE;
	};
};

func void dia_addon_quarhodron_hello_erdbeben()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_erdbeben_15_00");	//Zem� je rozbita zem�t�esen�mi. Pokud nic neud�l�me, cel� ostrov se potop�.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_erdbeben_11_01");	//Tady nen� nic, co bychom mohli ud�lat.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_erdbeben_11_02");	//Adan�v hn�v p�i�el na Jharkendar, aby ztrestal bezv�rce.
	DIA_ADDON_QUARHODRON_HELLO_CHOICECOUNTER = DIA_ADDON_QUARHODRON_HELLO_CHOICECOUNTER + 1;
	b_quarhodron_hello_kommzumpunkt();
};

func void dia_addon_quarhodron_hello_raven()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_raven_15_00");	//N�kdo vstoupil do Adanova chr�mu.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_raven_11_01");	//Nesmysl. S�m jsem zape�etil vstup. Je nemo�n� se dostat dovnit�.
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_raven_15_02");	//Je tak?
	DIA_ADDON_QUARHODRON_HELLO_CHOICECOUNTER = DIA_ADDON_QUARHODRON_HELLO_CHOICECOUNTER + 1;
	b_quarhodron_hello_kommzumpunkt();
};

func void dia_addon_quarhodron_hello_tempel()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_tempel_15_00");	//Ud�l mi vstup do Adanova chr�mu.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_tempel_11_01");	//Chr�m z�stane uzav�en nav�ky, jak rada na��dila.
	DIA_ADDON_QUARHODRON_HELLO_CHOICECOUNTER = DIA_ADDON_QUARHODRON_HELLO_CHOICECOUNTER + 1;
	b_quarhodron_hello_kommzumpunkt();
};

func void dia_addon_quarhodron_hello_schwert()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_schwert_15_00");	//Co se skr�v� v Adanov� chr�mu?
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_schwert_11_01");	//M� nejv�t�� ho�e, m� nejv�t�� zklam�n�.
	DIA_ADDON_QUARHODRON_HELLO_CHOICECOUNTER = DIA_ADDON_QUARHODRON_HELLO_CHOICECOUNTER + 1;
	b_quarhodron_hello_kommzumpunkt();
};

func void dia_addon_quarhodron_hello_frech()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_frech_15_00");	//N�co od tebe pot�ebuji.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_frech_11_01");	//Mu� s tv�m postaven�m by se mnou nem�l takto mluvit.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_frech_11_02");	//Nem��u se zbavit pocitu, �e nejsi ten, za koho se vyd�v�.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_frech_11_03");	//Jestli chce� mou pomoc, bude� muset prvn� zodpov�d�t n�kolik ot�zek.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_frech_11_04");	//Odpov�d� na m� ot�zky m� ujist�, �e neodhaluji n�co ciz�ho.
	Log_CreateTopic(TOPIC_ADDON_QUARHODRON,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_QUARHODRON,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_QUARHODRON,"Quarhodron mi pom��e a�, co zodpov�m n�jak� obt�n� ot�zky. Mus�m je zodpov�d�t spr�vn�, aby mi pomohl.");
	Info_ClearChoices(dia_addon_quarhodron_hello);
};


instance DIA_ADDON_QUARHODRON_FRAGEN(C_INFO)
{
	npc = none_addon_111_quarhodron;
	nr = 5;
	condition = dia_addon_quarhodron_fragen_condition;
	information = dia_addon_quarhodron_fragen_info;
	permanent = TRUE;
	description = "Ptej se na ot�zky.";
};


func int dia_addon_quarhodron_fragen_condition()
{
	if(QUARHODRONISTZUFRIEDEN == FALSE)
	{
		return TRUE;
	};
};


var int quarhodrons_nextquestion;
var int quarhodronistzufrieden;
var int quarhodrons_richtigeantworten;
const int QUARHODRON_ALLEFRAGENGESTELLT = 100;
var int b_quarhodron_fragen_choicesonetime;

func void b_quarhodron_testfailed()
{
	AI_Output(self,other,"DIA_Addon_Quarhodron_TestFailed_11_00");	//Tv� odpov�di jsou chybn� jako tv� z�m�ry.
	AI_Output(self,other,"DIA_Addon_Quarhodron_TestFailed_11_01");	//Nepom��u ti.
	AI_StopProcessInfos(self);
};

func void b_quarhodron_fragen_choices()
{
	Log_AddEntry(TOPIC_ADDON_QUARHODRON," --- QUARHODRONOVY OT�ZKY ---");
	if(QUARHODRONS_NEXTQUESTION == QUARHODRON_ALLEFRAGENGESTELLT)
	{
		b_quarhodron_testfailed();
	}
	else if((QUARHODRONS_NEXTQUESTION == 1) && (QUARHODRONS_RICHTIGEANTWORTEN == 0))
	{
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_00");	//Nev���m ti.
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_01");	//Mysl�m, �e by ses m�l vr�tit, jakmile se rozhodne� mluvit pravdu.
		AI_StopProcessInfos(self);
	}
	else
	{
		if(QUARHODRONS_NEXTQUESTION == 1)
		{
			if(b_quarhodron_fragen_choicesonetime == FALSE)
			{
				AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_02");	//(p�em��liv�) Schopnost str�ce smrti ti dovolila probudit m�, nen�-li pravda.
				AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_03");	//Jestli jsi ten, za koho se vyd�v�, m�l bys b�t schopen zodpov�d�t v�echny m� ot�zky.
				AI_Output(self,other,"DIA_Addon_Quarhodron_Add_11_00");	//Nehled� na jedno ...
				b_quarhodron_fragen_choicesonetime = TRUE;
			};
			QUARHODRONS_NEXTQUESTION = 2;
		};
		if(QUARHODRONS_NEXTQUESTION == 7)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_04");	//Kdo zape�etil port�l, kter� chr�nil sv�t p�ed zlem?
			Log_AddEntry(TOPIC_ADDON_QUARHODRON," --- Kdo zape�etil port�l chr�n�c� sv�t p�ed zlem? ---");
			QUARHODRONS_NEXTQUESTION = QUARHODRON_ALLEFRAGENGESTELLT;
		}
		else if(QUARHODRONS_NEXTQUESTION == 6)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_05");	//Kdo zm�rn� utrpen� a o�et�uje nemocn�?
			Log_AddEntry(TOPIC_ADDON_QUARHODRON," --- Kdo zm�r�uje utrpen� a o�et�uje nemocn� v Jharkendaru? --- ");
			QUARHODRONS_NEXTQUESTION = 7;
		}
		else if(QUARHODRONS_NEXTQUESTION == 5)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_06");	//Kdo m� kone�n� slovo v rad� p�ti?
			Log_AddEntry(TOPIC_ADDON_QUARHODRON," --- Kdo m� kone�n� slovo v rad� p�ti? --- ");
			QUARHODRONS_NEXTQUESTION = 6;
		}
		else if(QUARHODRONS_NEXTQUESTION == 4)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_07");	//Kdo je zodpov�dn� za zlo, kter� n�s p�epadlo?
			Log_AddEntry(TOPIC_ADDON_QUARHODRON," --- Kdo je zodpov�dn� za zlo, kter� n�s p�epadlo? --- ");
			QUARHODRONS_NEXTQUESTION = 5;
		}
		else if(QUARHODRONS_NEXTQUESTION == 3)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_08");	//Kdo mi m��e d�t p��m� rozkaz?
			Log_AddEntry(TOPIC_ADDON_QUARHODRON," --- Kdo mi m��e d�t p��m� rozkaz? --- ");
			QUARHODRONS_NEXTQUESTION = 4;
		}
		else if(QUARHODRONS_NEXTQUESTION == 2)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_09");	//Kdo kdysi chr�nil lid Jharkendaru p�ed nep��telsk�mi �toky?
			Log_AddEntry(TOPIC_ADDON_QUARHODRON," --- Kdo kdysi chr�nil lid Jharkendaru p�ed nep��telsk�mi �toky? --- ");
			QUARHODRONS_NEXTQUESTION = 3;
		};
		Info_ClearChoices(dia_addon_quarhodron_fragen);
		if(QUARHODRONS_NEXTQUESTION >= QUARHODRON_ALLEFRAGENGESTELLT)
		{
			Info_AddChoice(dia_addon_quarhodron_fragen,"To nem��u p�esn� ��ct.",dia_addon_quarhodron_fragen_noplan);
		}
		else
		{
			Info_AddChoice(dia_addon_quarhodron_fragen,"Nev�m.",dia_addon_quarhodron_fragen_noplan);
		};
		Info_AddChoice(dia_addon_quarhodron_fragen,"U�enci",dia_addon_quarhodron_fragen_gele);
		Info_AddChoice(dia_addon_quarhodron_fragen,"Str�ci smrti",dia_addon_quarhodron_fragen_totenw);
		Info_AddChoice(dia_addon_quarhodron_fragen,"Kn�zi",dia_addon_quarhodron_fragen_prie);
		Info_AddChoice(dia_addon_quarhodron_fragen,"V�le�nick� kasta",dia_addon_quarhodron_fragen_warr);
		Info_AddChoice(dia_addon_quarhodron_fragen,"L��itel�",dia_addon_quarhodron_fragen_heiler);
	};
};


var int dia_addon_quarhodron_fragen_info_onetime;

func void dia_addon_quarhodron_fragen_info()
{
	QUARHODRONS_NEXTQUESTION = 0;
	QUARHODRONS_RICHTIGEANTWORTEN = 0;
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_15_00");	//Ptej se na ot�zky.
	if(dia_addon_quarhodron_fragen_info_onetime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_11_01");	//J� jsem Quarhodron, b�val� v�le�n�k Jharkendaru.
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_11_02");	//Vzbudils m�.
		dia_addon_quarhodron_fragen_info_onetime = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_11_03");	//Ke kter� kast� jsi pat�il?
	b_quarhodron_fragen_choices();
};

func void dia_addon_quarhodron_fragen_warr()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_warr_15_00");	//V�le�nick� kasta
	if(QUARHODRONS_NEXTQUESTION == 0)
	{
		QUARHODRONS_NEXTQUESTION = 1;
	};
	if(QUARHODRONS_NEXTQUESTION == 3)
	{
		QUARHODRONS_RICHTIGEANTWORTEN = QUARHODRONS_RICHTIGEANTWORTEN + 1;
	};
	if(QUARHODRONS_NEXTQUESTION == 5)
	{
		QUARHODRONS_RICHTIGEANTWORTEN = QUARHODRONS_RICHTIGEANTWORTEN + 1;
	};
	b_quarhodron_fragen_choices();
};

func void dia_addon_quarhodron_fragen_prie()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_prie_15_00");	//Kn��.
	if(QUARHODRONS_NEXTQUESTION == 0)
	{
		QUARHODRONS_NEXTQUESTION = 1;
	};
	if(QUARHODRONS_NEXTQUESTION == 4)
	{
		QUARHODRONS_RICHTIGEANTWORTEN = QUARHODRONS_RICHTIGEANTWORTEN + 1;
	};
	b_quarhodron_fragen_choices();
};

func void dia_addon_quarhodron_fragen_gele()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_gele_15_00");	//U�enci
	if(QUARHODRONS_NEXTQUESTION == 0)
	{
		QUARHODRONS_NEXTQUESTION = 1;
	};
	if(QUARHODRONS_NEXTQUESTION == 6)
	{
		QUARHODRONS_RICHTIGEANTWORTEN = QUARHODRONS_RICHTIGEANTWORTEN + 1;
	};
	b_quarhodron_fragen_choices();
};

func void dia_addon_quarhodron_fragen_totenw()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_totenw_15_00");	//K str�c�m smrti
	if(QUARHODRONS_NEXTQUESTION == 0)
	{
		QUARHODRONS_RICHTIGEANTWORTEN = QUARHODRONS_RICHTIGEANTWORTEN + 1;
	};
	if(QUARHODRONS_NEXTQUESTION == 0)
	{
		QUARHODRONS_NEXTQUESTION = 1;
	};
	b_quarhodron_fragen_choices();
};

func void dia_addon_quarhodron_fragen_heiler()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_heiler_15_00");	//L��itel�
	if(QUARHODRONS_NEXTQUESTION == 0)
	{
		QUARHODRONS_NEXTQUESTION = 1;
	};
	if(QUARHODRONS_NEXTQUESTION == 7)
	{
		QUARHODRONS_RICHTIGEANTWORTEN = QUARHODRONS_RICHTIGEANTWORTEN + 1;
	};
	b_quarhodron_fragen_choices();
};

func void dia_addon_quarhodron_fragen_noplan()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_NoPlan_15_00");	//Nev�m
	if((QUARHODRONS_NEXTQUESTION == QUARHODRON_ALLEFRAGENGESTELLT) && (QUARHODRONS_RICHTIGEANTWORTEN >= 6))
	{
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_NoPlan_11_01");	//Dob�e, v���m ti a poskytnu ti svou pomoc.
		QUARHODRONISTZUFRIEDEN = TRUE;
		Info_ClearChoices(dia_addon_quarhodron_fragen);
	}
	else if(QUARHODRONS_NEXTQUESTION == QUARHODRON_ALLEFRAGENGESTELLT)
	{
		b_quarhodron_testfailed();
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_NoPlan_11_02");	//Pak nepl�tvej m�m �asem.
		AI_StopProcessInfos(self);
	};
};


instance DIA_ADDON_QUARHODRON_GIBMIRKEY(C_INFO)
{
	npc = none_addon_111_quarhodron;
	nr = 5;
	condition = dia_addon_quarhodron_gibmirkey_condition;
	information = dia_addon_quarhodron_gibmirkey_info;
	description = "(po�aduj kl�� od chr�mu)";
};


func int dia_addon_quarhodron_gibmirkey_condition()
{
	if(QUARHODRONISTZUFRIEDEN == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_quarhodron_gibmirkey_info()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_00");	//Sly�, n�kdo se dostal svou vlastn� moc� do Adanova chr�mu.
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_01");	//Jestli mi nepom��e� dostat se dovnit�, pak bude pravd�podobn� p��li� pozd� a toto zde p�jde k �ertu.
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_02");	//To nem��e b�t pravda! Nejvy��� kn�z KHARDIMON a J� jsme jedin� v JHARKENDARU, kte�� v�, jak otev��t port�l v Adanov� chr�mu.
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_03");	//Dobr�. Zd� se, �e tv�j kamar�d KHARDIMON asi pov�dal.
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_04");	//��k�m, �e br�na je otev�ena. Vid�l jsem to na vlastn� o�i..
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_05");	//Dobr�, v tv�m hlasu je sly�et pravda. Nebudu d�le pochybovat o tv�ch slovech.
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_06");	//Douf�m v to.
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_07");	//Vezmi nyn� slova, kter� ti umo�n� vstup. Jsou naps�na na kamenn� desce. �ekni slova p�ed zav�en�mi dve�mi chr�mu a m�ly by se otev��t.
	CreateInvItems(self,itmi_tempeltorkey,1);
	b_giveinvitems(self,other,itmi_tempeltorkey,1);
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_08");	//(polosly�iteln�) M�j �as je u konce, u� ti d�le nomohu b�t n�pomocen.
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_09");	//(polosly�iteln�) Ale opatrn�. Mysli na Adanosovy komnaty. Nebo to bude tv� jist� smrt.
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_10");	//Zatracen�. CO JSOU tyto Adanosovy komnaty?
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_11");	//(polosly�iteln�) Moje s�ly jsou u konce. Sbohem. M�li bychom se op�t setkat v kr�lovstv� smrti ...
	AI_StopProcessInfos(self);
	b_logentry(TOPIC_ADDON_QUARHODRON,"Quarhodron mi dal kamennou desku, kter� otev�r� br�nu v Adanov� chr�mu.");
	Log_CreateTopic(TOPIC_ADDON_KAMMERN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_KAMMERN,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_KAMMERN,"Quarhodron zm�nil 'Adanosovy Komory' a ��kal, �e bych m�l b�t opatrn�. Mus�m zjistit, co to znamen�, proto�e nechci skon�it v Adanov� chr�mu.");
	GHOST_SCKNOWSHOW2GETINADANOSTEMPEL = TRUE;
};

