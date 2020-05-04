
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
		AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_11_00");	//Proè rušíš mùj klid, strážce?
		AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_11_01");	//(otrávenì) Øekni mi, co chceš?
		Info_ClearChoices(dia_addon_quarhodron_hello);
		Info_AddChoice(dia_addon_quarhodron_hello,"Co se skrývá v Adanovì chrámu?",dia_addon_quarhodron_hello_schwert);
		Info_AddChoice(dia_addon_quarhodron_hello,"Nìkdo vstoupil do Adanova chrámu.",dia_addon_quarhodron_hello_raven);
		Info_AddChoice(dia_addon_quarhodron_hello,"Udìl mi vstup do Adanova chrámu.",dia_addon_quarhodron_hello_tempel);
		Info_AddChoice(dia_addon_quarhodron_hello,"Zemì je rozbita zemìtøeseními.",dia_addon_quarhodron_hello_erdbeben);
		DIA_ADDON_QUARHODRON_HELLO_NOPERM = TRUE;
		Npc_RemoveInvItems(hero,itwr_addon_summonancientghost,1);
		SC_TALKEDTOGHOST = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_11_02");	//Bengla anthani, Osiri?
		b_say(other,self,"$CANTUNDERSTANDTHIS");
		AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_11_03");	//(hlasitì) Bengla anthani, Osiri?
		AI_StopProcessInfos(self);
	};
};


var int dia_addon_quarhodron_hello_choicecounter;
var int b_quarhodron_hello_kommzumpunkt_onetime;

func void b_quarhodron_hello_kommzumpunkt()
{
	if((DIA_ADDON_QUARHODRON_HELLO_CHOICECOUNTER >= 3) && (b_quarhodron_hello_kommzumpunkt_onetime == FALSE))
	{
		Info_AddChoice(dia_addon_quarhodron_hello,"Nìco od tebe potøebuji.",dia_addon_quarhodron_hello_frech);
		b_quarhodron_hello_kommzumpunkt_onetime = TRUE;
	};
};

func void dia_addon_quarhodron_hello_erdbeben()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_erdbeben_15_00");	//Zemì je rozbita zemìtøeseními. Pokud nic neudìláme, celý ostrov se potopí.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_erdbeben_11_01");	//Tady není nic, co bychom mohli udìlat.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_erdbeben_11_02");	//Adanùv hnìv pøišel na Jharkendar, aby ztrestal bezvìrce.
	DIA_ADDON_QUARHODRON_HELLO_CHOICECOUNTER = DIA_ADDON_QUARHODRON_HELLO_CHOICECOUNTER + 1;
	b_quarhodron_hello_kommzumpunkt();
};

func void dia_addon_quarhodron_hello_raven()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_raven_15_00");	//Nìkdo vstoupil do Adanova chrámu.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_raven_11_01");	//Nesmysl. Sám jsem zapeèetil vstup. Je nemožné se dostat dovnitø.
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_raven_15_02");	//Je tak?
	DIA_ADDON_QUARHODRON_HELLO_CHOICECOUNTER = DIA_ADDON_QUARHODRON_HELLO_CHOICECOUNTER + 1;
	b_quarhodron_hello_kommzumpunkt();
};

func void dia_addon_quarhodron_hello_tempel()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_tempel_15_00");	//Udìl mi vstup do Adanova chrámu.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_tempel_11_01");	//Chrám zùstane uzavøen navìky, jak rada naøídila.
	DIA_ADDON_QUARHODRON_HELLO_CHOICECOUNTER = DIA_ADDON_QUARHODRON_HELLO_CHOICECOUNTER + 1;
	b_quarhodron_hello_kommzumpunkt();
};

func void dia_addon_quarhodron_hello_schwert()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_schwert_15_00");	//Co se skrývá v Adanovì chrámu?
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_schwert_11_01");	//Mé nejvìtší hoøe, mé nejvìtší zklamání.
	DIA_ADDON_QUARHODRON_HELLO_CHOICECOUNTER = DIA_ADDON_QUARHODRON_HELLO_CHOICECOUNTER + 1;
	b_quarhodron_hello_kommzumpunkt();
};

func void dia_addon_quarhodron_hello_frech()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_frech_15_00");	//Nìco od tebe potøebuji.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_frech_11_01");	//Muž s tvým postavením by se mnou nemìl takto mluvit.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_frech_11_02");	//Nemùžu se zbavit pocitu, že nejsi ten, za koho se vydáváš.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_frech_11_03");	//Jestli chceš mou pomoc, budeš muset prvnì zodpovìdìt nìkolik otázek.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_frech_11_04");	//Odpovìdí na mé otázky mì ujistíš, že neodhaluji nìco cizího.
	Log_CreateTopic(TOPIC_ADDON_QUARHODRON,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_QUARHODRON,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_QUARHODRON,"Quarhodron mi pomùže až, co zodpovím nìjaké obtížné otázky. Musím je zodpovìdìt správnì, aby mi pomohl.");
	Info_ClearChoices(dia_addon_quarhodron_hello);
};


instance DIA_ADDON_QUARHODRON_FRAGEN(C_INFO)
{
	npc = none_addon_111_quarhodron;
	nr = 5;
	condition = dia_addon_quarhodron_fragen_condition;
	information = dia_addon_quarhodron_fragen_info;
	permanent = TRUE;
	description = "Ptej se na otázky.";
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
	AI_Output(self,other,"DIA_Addon_Quarhodron_TestFailed_11_00");	//Tvé odpovìdi jsou chybné jako tvé zámìry.
	AI_Output(self,other,"DIA_Addon_Quarhodron_TestFailed_11_01");	//Nepomùžu ti.
	AI_StopProcessInfos(self);
};

func void b_quarhodron_fragen_choices()
{
	Log_AddEntry(TOPIC_ADDON_QUARHODRON," --- QUARHODRONOVY OTÁZKY ---");
	if(QUARHODRONS_NEXTQUESTION == QUARHODRON_ALLEFRAGENGESTELLT)
	{
		b_quarhodron_testfailed();
	}
	else if((QUARHODRONS_NEXTQUESTION == 1) && (QUARHODRONS_RICHTIGEANTWORTEN == 0))
	{
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_00");	//Nevìøím ti.
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_01");	//Myslím, že by ses mìl vrátit, jakmile se rozhodneš mluvit pravdu.
		AI_StopProcessInfos(self);
	}
	else
	{
		if(QUARHODRONS_NEXTQUESTION == 1)
		{
			if(b_quarhodron_fragen_choicesonetime == FALSE)
			{
				AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_02");	//(pøemýšlivì) Schopnost strážce smrti ti dovolila probudit mì, není-li pravda.
				AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_03");	//Jestli jsi ten, za koho se vydáváš, mìl bys být schopen zodpovìdìt všechny mé otázky.
				AI_Output(self,other,"DIA_Addon_Quarhodron_Add_11_00");	//Nehledì na jedno ...
				b_quarhodron_fragen_choicesonetime = TRUE;
			};
			QUARHODRONS_NEXTQUESTION = 2;
		};
		if(QUARHODRONS_NEXTQUESTION == 7)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_04");	//Kdo zapeèetil portál, který chránil svìt pøed zlem?
			Log_AddEntry(TOPIC_ADDON_QUARHODRON," --- Kdo zapeèetil portál chránící svìt pøed zlem? ---");
			QUARHODRONS_NEXTQUESTION = QUARHODRON_ALLEFRAGENGESTELLT;
		}
		else if(QUARHODRONS_NEXTQUESTION == 6)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_05");	//Kdo zmírní utrpení a ošetøuje nemocné?
			Log_AddEntry(TOPIC_ADDON_QUARHODRON," --- Kdo zmíròuje utrpení a ošetøuje nemocné v Jharkendaru? --- ");
			QUARHODRONS_NEXTQUESTION = 7;
		}
		else if(QUARHODRONS_NEXTQUESTION == 5)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_06");	//Kdo má koneèné slovo v radì pìti?
			Log_AddEntry(TOPIC_ADDON_QUARHODRON," --- Kdo má koneèné slovo v radì pìti? --- ");
			QUARHODRONS_NEXTQUESTION = 6;
		}
		else if(QUARHODRONS_NEXTQUESTION == 4)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_07");	//Kdo je zodpovìdný za zlo, které nás pøepadlo?
			Log_AddEntry(TOPIC_ADDON_QUARHODRON," --- Kdo je zodpovìdný za zlo, které nás pøepadlo? --- ");
			QUARHODRONS_NEXTQUESTION = 5;
		}
		else if(QUARHODRONS_NEXTQUESTION == 3)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_08");	//Kdo mi mùže dát pøímý rozkaz?
			Log_AddEntry(TOPIC_ADDON_QUARHODRON," --- Kdo mi mùže dát pøímý rozkaz? --- ");
			QUARHODRONS_NEXTQUESTION = 4;
		}
		else if(QUARHODRONS_NEXTQUESTION == 2)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_09");	//Kdo kdysi chránil lid Jharkendaru pøed nepøátelskými útoky?
			Log_AddEntry(TOPIC_ADDON_QUARHODRON," --- Kdo kdysi chránil lid Jharkendaru pøed nepøátelskými útoky? --- ");
			QUARHODRONS_NEXTQUESTION = 3;
		};
		Info_ClearChoices(dia_addon_quarhodron_fragen);
		if(QUARHODRONS_NEXTQUESTION >= QUARHODRON_ALLEFRAGENGESTELLT)
		{
			Info_AddChoice(dia_addon_quarhodron_fragen,"To nemùžu pøesnì øíct.",dia_addon_quarhodron_fragen_noplan);
		}
		else
		{
			Info_AddChoice(dia_addon_quarhodron_fragen,"Nevím.",dia_addon_quarhodron_fragen_noplan);
		};
		Info_AddChoice(dia_addon_quarhodron_fragen,"Uèenci",dia_addon_quarhodron_fragen_gele);
		Info_AddChoice(dia_addon_quarhodron_fragen,"Strážci smrti",dia_addon_quarhodron_fragen_totenw);
		Info_AddChoice(dia_addon_quarhodron_fragen,"Knìzi",dia_addon_quarhodron_fragen_prie);
		Info_AddChoice(dia_addon_quarhodron_fragen,"Váleènická kasta",dia_addon_quarhodron_fragen_warr);
		Info_AddChoice(dia_addon_quarhodron_fragen,"Léèitelé",dia_addon_quarhodron_fragen_heiler);
	};
};


var int dia_addon_quarhodron_fragen_info_onetime;

func void dia_addon_quarhodron_fragen_info()
{
	QUARHODRONS_NEXTQUESTION = 0;
	QUARHODRONS_RICHTIGEANTWORTEN = 0;
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_15_00");	//Ptej se na otázky.
	if(dia_addon_quarhodron_fragen_info_onetime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_11_01");	//Já jsem Quarhodron, bývalý váleèník Jharkendaru.
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_11_02");	//Vzbudils mì.
		dia_addon_quarhodron_fragen_info_onetime = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_11_03");	//Ke které kastì jsi patøil?
	b_quarhodron_fragen_choices();
};

func void dia_addon_quarhodron_fragen_warr()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_warr_15_00");	//Váleènická kasta
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
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_prie_15_00");	//Knìží.
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
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_gele_15_00");	//Uèenci
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
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_totenw_15_00");	//K strážcùm smrti
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
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_heiler_15_00");	//Léèitelé
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
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_NoPlan_15_00");	//Nevím
	if((QUARHODRONS_NEXTQUESTION == QUARHODRON_ALLEFRAGENGESTELLT) && (QUARHODRONS_RICHTIGEANTWORTEN >= 6))
	{
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_NoPlan_11_01");	//Dobøe, vìøím ti a poskytnu ti svou pomoc.
		QUARHODRONISTZUFRIEDEN = TRUE;
		Info_ClearChoices(dia_addon_quarhodron_fragen);
	}
	else if(QUARHODRONS_NEXTQUESTION == QUARHODRON_ALLEFRAGENGESTELLT)
	{
		b_quarhodron_testfailed();
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_NoPlan_11_02");	//Pak neplýtvej mým èasem.
		AI_StopProcessInfos(self);
	};
};


instance DIA_ADDON_QUARHODRON_GIBMIRKEY(C_INFO)
{
	npc = none_addon_111_quarhodron;
	nr = 5;
	condition = dia_addon_quarhodron_gibmirkey_condition;
	information = dia_addon_quarhodron_gibmirkey_info;
	description = "(požaduj klíè od chrámu)";
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
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_00");	//Slyš, nìkdo se dostal svou vlastní mocí do Adanova chrámu.
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_01");	//Jestli mi nepomùžeš dostat se dovnitø, pak bude pravdìpodobnì pøíliš pozdì a toto zde pùjde k èertu.
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_02");	//To nemùže být pravda! Nejvyšší knìz KHARDIMON a JÁ jsme jediní v JHARKENDARU, kteøí ví, jak otevøít portál v Adanovì chrámu.
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_03");	//Dobrá. Zdá se, že tvùj kamarád KHARDIMON asi povídal.
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_04");	//Øíkám, že brána je otevøena. Vidìl jsem to na vlastní oèi..
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_05");	//Dobrá, v tvém hlasu je slyšet pravda. Nebudu déle pochybovat o tvých slovech.
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_06");	//Doufám v to.
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_07");	//Vezmi nyní slova, která ti umožní vstup. Jsou napsána na kamenné desce. Øekni slova pøed zavøenými dveømi chrámu a mìly by se otevøít.
	CreateInvItems(self,itmi_tempeltorkey,1);
	b_giveinvitems(self,other,itmi_tempeltorkey,1);
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_08");	//(poloslyšitelnì) Mùj èas je u konce, už ti déle nomohu být nápomocen.
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_09");	//(poloslyšitelnì) Ale opatrnì. Mysli na Adanosovy komnaty. Nebo to bude tvá jistá smrt.
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_10");	//Zatracenì. CO JSOU tyto Adanosovy komnaty?
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_11");	//(poloslyšitelnì) Moje síly jsou u konce. Sbohem. Mìli bychom se opìt setkat v království smrti ...
	AI_StopProcessInfos(self);
	b_logentry(TOPIC_ADDON_QUARHODRON,"Quarhodron mi dal kamennou desku, která otevírá bránu v Adanovì chrámu.");
	Log_CreateTopic(TOPIC_ADDON_KAMMERN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_KAMMERN,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_KAMMERN,"Quarhodron zmínil 'Adanosovy Komory' a øíkal, že bych mìl být opatrný. Musím zjistit, co to znamená, protože nechci skonèit v Adanovì chrámu.");
	GHOST_SCKNOWSHOW2GETINADANOSTEMPEL = TRUE;
};

