
instance DIA_MOE_EXIT(C_INFO)
{
	npc = vlk_432_moe;
	nr = 999;
	condition = dia_moe_exit_condition;
	information = dia_moe_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_moe_exit_condition()
{
	return TRUE;
};

func void dia_moe_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MOE_PICKPOCKET(C_INFO)
{
	npc = vlk_432_moe;
	nr = 900;
	condition = dia_moe_pickpocket_condition;
	information = dia_moe_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_moe_pickpocket_condition()
{
	return c_beklauen(25,30);
};

func void dia_moe_pickpocket_info()
{
	Info_ClearChoices(dia_moe_pickpocket);
	Info_AddChoice(dia_moe_pickpocket,DIALOG_BACK,dia_moe_pickpocket_back);
	Info_AddChoice(dia_moe_pickpocket,DIALOG_PICKPOCKET,dia_moe_pickpocket_doit);
};

func void dia_moe_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_moe_pickpocket);
};

func void dia_moe_pickpocket_back()
{
	Info_ClearChoices(dia_moe_pickpocket);
};


instance DIA_MOE_HALLO(C_INFO)
{
	npc = vlk_432_moe;
	nr = 2;
	condition = dia_moe_hallo_condition;
	information = dia_moe_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_moe_hallo_condition()
{
	if((Npc_GetDistToNpc(self,other) <= ZIVILANQUATSCHDIST) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF) && (hero.guild != GIL_MIL) && (hero.guild != GIL_NOV) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void dia_moe_hallo_info()
{
	AI_Output(self,other,"DIA_Moe_Hallo_01_00");	//Hej ty, tebe neznám. Co tady chceš? Máš namíøeno do hospody?
	Info_ClearChoices(dia_moe_hallo);
	Info_AddChoice(dia_moe_hallo,"Ne, nemám namíøeno do hospody... (KONEC)",dia_moe_hallo_gehen);
	Info_AddChoice(dia_moe_hallo,"Aha, take tohle je místní nálevna.",dia_moe_hallo_witz);
	Info_AddChoice(dia_moe_hallo,"Jo, vadí ti to?",dia_moe_hallo_reizen);
};

func void dia_moe_hallo_gehen()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Gehen_15_00");	//Ne, nemám namíøeno do hospody.
	AI_Output(self,other,"DIA_Moe_Hallo_Gehen_01_01");	//Jo, to bych øekl. To je ale fuk - právì proto mùeme jít pøímo k vìci.
	AI_Output(self,other,"DIA_Moe_Hallo_Gehen_01_02");	//Kdy u jsi tady, nìco ti nabídnu. Dej mi 50 zlaákù a mùeš jít dál.
	AI_Output(self,other,"DIA_Moe_Hallo_Gehen_01_03");	//To je vstupné do hospody.
	Info_ClearChoices(dia_moe_hallo);
	Info_AddChoice(dia_moe_hallo,"Uvidíme, jestli si to samé myslí i domobrana...",dia_moe_hallo_miliz);
	Info_AddChoice(dia_moe_hallo,"Na to zapomeò, nedostaneš ani mìïák!",dia_moe_hallo_vergisses);
	Info_AddChoice(dia_moe_hallo,"No tak já ti teda zaplatím.",dia_moe_hallo_zahlen);
	Info_AddChoice(dia_moe_hallo,"Ale já nechci jít do hospody!",dia_moe_hallo_kneipe);
};

func void dia_moe_hallo_kneipe()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Kneipe_15_00");	//Ale já do hospody vùbec nechci jít!
	AI_Output(self,other,"DIA_Moe_Hallo_Kneipe_01_01");	//Víš, døív nebo pozdìji chce do hospody kadı. Take kdy mi zaplatíš hned, budeš to mít pro pøíštì z krku.
};

func void dia_moe_hallo_witz()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Witz_15_00");	//Ahá, tohle je pøístavní nálevna? A já si myslel, e je to palác místodrícího!
	AI_Output(self,other,"DIA_Moe_Hallo_Witz_01_01");	//Hele, nech si ty hloupé šprımy, skrèku, nebo budeš brzo vejkat dlaební kostky.
	Info_ClearChoices(dia_moe_hallo);
	Info_AddChoice(dia_moe_hallo,"Chápu, budu ti muset dát pár pøes drku.",dia_moe_hallo_pruegel);
	Info_AddChoice(dia_moe_hallo,"Ty mì chceš dostat do maléru, co?",dia_moe_hallo_aerger);
	Info_AddChoice(dia_moe_hallo,"Uklidni se, chci si dát jenom jedno pivo.",dia_moe_hallo_ruhig);
	Info_AddChoice(dia_moe_hallo,"Ale já do hospody vùbec nechci jít!",dia_moe_hallo_kneipe);
};

func void dia_moe_hallo_reizen()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Reizen_15_00");	//Jo, vadí ti to?
	AI_Output(self,other,"DIA_Moe_Hallo_Reizen_01_01");	//Tady nemáš co pohledávat, skrèku.
	Info_ClearChoices(dia_moe_hallo);
	Info_AddChoice(dia_moe_hallo,"Chápu, budu ti muset dát pár pøes drku.",dia_moe_hallo_pruegel);
	Info_AddChoice(dia_moe_hallo,"Ty mì chceš dostat do maléru, co?",dia_moe_hallo_aerger);
	Info_AddChoice(dia_moe_hallo,"Uklidni se, chci si dát jenom jedno pivo.",dia_moe_hallo_ruhig);
};

func void dia_moe_hallo_miliz()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Miliz_15_00");	//Uvidíme, jestli si to samé myslí i domobrana.
	AI_Output(self,other,"DIA_Moe_Hallo_Miliz_01_01");	//(smìje se) Nikdo z domobrany tady není. A víš proè?
	AI_Output(self,other,"DIA_Moe_Hallo_Miliz_01_02");	//Protoe tady jsi v pøístavní ètvrti, skrèku. Nikdo z domobrany se tu se mnou rvát nebude.
	AI_Output(self,other,"DIA_Moe_Hallo_Miliz_01_03");	//Vìtšinou jsou všichni nalezlí u 'Èervené lucerny'. Tak vidíš - jsme tu jen my dva. (zlı úšklebek)
};

func void dia_moe_hallo_pruegel()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Pruegel_15_00");	//Chápu. Ne pùjdu dál, budu tì muset stáhnout z kùe.
	AI_Output(self,other,"DIA_Moe_Hallo_Pruegel_01_01");	//Jen si to zkus, skrèku. Uka, co umíš!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_moe_hallo_aerger()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Aerger_15_00");	//Ty mì chceš dostat do maléru, co?
	AI_Output(self,other,"DIA_Moe_Hallo_Aerger_01_01");	//Jo, v tom, jak dostat nìkoho do maléru, jsem mistr. Take se koukej bránit, skrèku!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_moe_hallo_ruhig()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Ruhig_15_00");	//Uklidni se, chci si dát jenom jedno pivo.
	AI_Output(self,other,"DIA_Moe_Hallo_Ruhig_01_01");	//Fajn, ale vstupné tì bude stát 50 zlaákù. (šklebí se)
	Info_ClearChoices(dia_moe_hallo);
	Info_AddChoice(dia_moe_hallo,"Na to zapomeò, nedostaneš ani mìïák!",dia_moe_hallo_vergisses);
	Info_AddChoice(dia_moe_hallo,"No tak já ti teda zaplatím.",dia_moe_hallo_zahlen);
};

func void dia_moe_hallo_zahlen()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Zahlen_15_00");	//No tak já ti teda zaplatím.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Moe_Hallo_Zahlen_01_01");	//Vıbornì. A kdy jsme to tak hezky vyøešili, teï mi mùeš dát i to ostatní, co máš u sebe.
		Info_ClearChoices(dia_moe_hallo);
		Info_AddChoice(dia_moe_hallo,"Na to zapomeò, nedostaneš ani mìïák!",dia_moe_hallo_vergisses);
		Info_AddChoice(dia_moe_hallo,"OK, tohle je všechno, co mám.",dia_moe_hallo_alles);
	}
	else if(Npc_HasItems(hero,itmi_gold) > 9)
	{
		AI_Output(other,self,"DIA_Moe_Hallo_Zahlen_15_02");	//...ale já u sebe nemám tolik zlaákù.
		AI_Output(self,other,"DIA_Moe_Hallo_Zahlen_01_03");	//To nevadí, tak prostì naval všechno, co máš u sebe.
		Info_ClearChoices(dia_moe_hallo);
		Info_AddChoice(dia_moe_hallo,"Na to zapomeò, nedostaneš ani mìïák!",dia_moe_hallo_vergisses);
		Info_AddChoice(dia_moe_hallo,"OK, tohle je všechno, co mám.",dia_moe_hallo_alles);
	}
	else
	{
		AI_Output(other,self,"DIA_Moe_Hallo_Zahlen_15_04");	//...ale já nemám ani 10 zlaákù.
		AI_Output(self,other,"DIA_Moe_Hallo_Zahlen_01_05");	//Chlape, já nemám ani vindru.
		AI_Output(self,other,"DIA_Moe_Hallo_Zahlen_01_06");	//No dobøe - povzdech - mùeš jít.
		AI_StopProcessInfos(self);
	};
};

func void dia_moe_hallo_vergisses()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Vergisses_15_00");	//Na to zapomeò, nedostaneš ani mìïák!
	AI_Output(self,other,"DIA_Moe_Hallo_Vergisses_01_01");	//Pak si vezmu všechno, co máš - jen co mi budeš leet u nohou.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_moe_hallo_alles()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Alles_15_00");	//Fajn, tohle je všechno, co mám.
	b_giveinvitems(other,self,itmi_gold,Npc_HasItems(other,itmi_gold));
	AI_Output(self,other,"DIA_Moe_Hallo_Alles_01_01");	//Dobrá, to mi teda staèí. To jsem celı já - vdycky velkorysı. (šklebí se)
	AI_StopProcessInfos(self);
};


instance DIA_MOE_HARBOR(C_INFO)
{
	npc = vlk_432_moe;
	nr = 998;
	condition = dia_moe_harbor_condition;
	information = dia_moe_harbor_info;
	permanent = TRUE;
	description = "Ty se tady v pøístavu dost vyznáš, viï?";
};


func int dia_moe_harbor_condition()
{
	return TRUE;
};

func void dia_moe_harbor_info()
{
	AI_Output(other,self,"DIA_Moe_Harbor_15_00");	//Ty se tady v pøístavu dost vyznáš, viï?
	AI_Output(self,other,"DIA_Moe_Harbor_01_01");	//Jasná vìc. Proè?
	Info_ClearChoices(dia_moe_harbor);
	Info_AddChoice(dia_moe_harbor,DIALOG_BACK,dia_moe_harbor_back);
	Info_AddChoice(dia_moe_harbor,"Jakı je tu provoz lodí?",dia_moe_harbor_ship);
	Info_AddChoice(dia_moe_harbor,"Jak to, e tu nevidím nikoho z domobrany?",dia_moe_harbor_militia);
	Info_AddChoice(dia_moe_harbor,"O èem se tu asi tak nejvíc povídá?",dia_moe_harbor_rumors);
};

func void dia_moe_harbor_back()
{
	Info_ClearChoices(dia_moe_harbor);
};

func void dia_moe_harbor_ship()
{
	AI_Output(other,self,"DIA_Moe_Harbor_Ship_15_00");	//Jakı je tu provoz lodí?
	AI_Output(self,other,"DIA_Moe_Harbor_Ship_01_01");	//Jediná loï, která sem v poslední dobì pøiplula, je ta paladinská galéra.
	AI_Output(self,other,"DIA_Moe_Harbor_Ship_01_02");	//Najdeš ji tamhle za tím útesem na jihozápadì
};

func void dia_moe_harbor_militia()
{
	AI_Output(other,self,"DIA_Moe_Harbor_Militia_15_00");	//Jak to, e tu nevidím nikoho z domobrany?
	AI_Output(self,other,"DIA_Moe_Harbor_Militia_01_01");	//Netroufají si sem chodit - vdycky si všechno vyøídíme sami.
};

func void dia_moe_harbor_rumors()
{
	AI_Output(other,self,"DIA_Moe_Harbor_Rumors_15_00");	//O èem se tu asi tak nejvíc povídá?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_01");	//Nemáme rádi lidi, kteøí se moc vyptávají. Zvláš kdy jsou to cizinci.
	}
	else if(KAPITEL == 2)
	{
		if(hero.guild == GIL_MIL)
		{
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_02");	//Coby - nic. Všechno je tu v klidu a pohodì.
		}
		else if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
		{
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_03");	//(nepøirozenì) Je to špatné. Èasy jsou zlé, ale všichni se snaíme zùstat èestní a poctiví.
			AI_Output(other,self,"DIA_Moe_Harbor_Rumors_15_04");	//Nedìlej si ze mì šoufky.
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_05");	//Jak si o mnì mùeš nìco takového myslet? Teï ses mì teda hluboce dotkl.
		}
		else
		{
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_06");	//Je tu fakt horko. Lord Andre se u nìjakou dobu snaí strkat nos do vìcí, po kterıch mu pranic není.
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_07");	//Ti nafoukanci nikdy nepochopí, jak to tady dole chodí.
		};
	}
	else if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET == LOG_SUCCESS)
		{
			if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
			{
				AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_08");	//My s tím nemáme nic spoleèného.
				AI_Output(other,self,"DIA_Moe_Harbor_Rumors_15_09");	//S èím?
				AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_10");	//S tím paladinem, kterého tu zabili. Opravdu by ses o ty oldáky nemìl starat - jenom tím maøíš èas.
			}
			else
			{
				AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_11");	//Vím, e s tím nemáš nic spoleèného, ale ta vrada paladina všechny urozené dentlmeny poøádnì vylekala.
				AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_12");	//Jestli ti mùu dát pøátelskou radu, tak zmiz z mìsta. Aspoò na chvíli.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_13");	//Kdy vyšlo najevo, e oldáci s tím paladinem nemìli nic spoleèného, domobrana si sem u netroufá ani vkroèit.
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_14");	//Myslím, e se bojí, aby jim nikdo nerozbil drku. Mnì osobnì to vùbec nevadí.
		};
	}
	else if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_15");	//Nedìje se tu absolutnì nic.
	}
	else
	{
		AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_16");	//Koneènì ti nabubøelí paladinové opustili pøístav. Bylo naèase.
	};
};


instance DIA_MOE_LEHMARGELDEINTREIBEN(C_INFO)
{
	npc = vlk_432_moe;
	nr = 2;
	condition = dia_moe_lehmargeldeintreiben_condition;
	information = dia_moe_lehmargeldeintreiben_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_moe_lehmargeldeintreiben_condition()
{
	if((LEHMAR_GELDGELIEHEN_DAY <= (Wld_GetDay() - 2)) && (LEHMAR_GELDGELIEHEN != 0) && (RANGERHELP_LEHMARKOHLE == FALSE) && (lehmar.aivar[AIV_DEFEATEDBYPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_moe_lehmargeldeintreiben_info()
{
	AI_Output(self,other,"DIA_Moe_LEHMARGELDEINTREIBEN_01_00");	//Hej, ty tam! Lehmar tì zdraví.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

