
instance DIA_BARTOK_EXIT(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 999;
	condition = dia_bartok_exit_condition;
	information = dia_bartok_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bartok_exit_condition()
{
	return TRUE;
};

func void dia_bartok_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BARTOK_PICKPOCKET(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 900;
	condition = dia_bartok_pickpocket_condition;
	information = dia_bartok_pickpocket_info;
	permanent = TRUE;
	description = "(Ukr�st tento toulec se ��py je tak snadn�, jako vz�t d�t�ti bonb�n.)";
};


func int dia_bartok_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itrw_arrow) >= 40) && (other.attribute[ATR_DEXTERITY] >= (30 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_bartok_pickpocket_info()
{
	Info_ClearChoices(dia_bartok_pickpocket);
	Info_AddChoice(dia_bartok_pickpocket,DIALOG_BACK,dia_bartok_pickpocket_back);
	Info_AddChoice(dia_bartok_pickpocket,DIALOG_PICKPOCKET,dia_bartok_pickpocket_doit);
};

func void dia_bartok_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		b_giveinvitems(self,other,itrw_arrow,40);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_bartok_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_bartok_pickpocket_back()
{
	Info_ClearChoices(dia_bartok_pickpocket);
};


instance DIA_BARTOK_HALLO(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 1;
	condition = dia_bartok_hallo_condition;
	information = dia_bartok_hallo_info;
	permanent = FALSE;
	description = "Jak se vede?";
};


func int dia_bartok_hallo_condition()
{
	return TRUE;
};

func void dia_bartok_hallo_info()
{
	AI_Output(other,self,"DIA_Bartok_Hello_15_00");	//Jak se vede?
	AI_Output(self,other,"DIA_Bartok_Hello_04_01");	//Ty nejsi tady z okol�, co? Nevad� - ani j� ne.
	AI_Output(other,self,"DIA_Bartok_Hello_15_02");	//Kde ses toulal d��v?
	AI_Output(self,other,"DIA_Bartok_Hello_04_03");	//V les�ch, spole�n� s dal��mi lovci jsme chytali mrcho�routy a vlky.
	AI_Output(self,other,"DIA_Bartok_Hello_04_04");	//Ale nechal jsem toho. Te� jsou nebezpe�n� �asy. Pohybuje se tu spousta r�zn� ch�try.
};


instance DIA_BARTOK_JAEGER(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 2;
	condition = dia_bartok_jaeger_condition;
	information = dia_bartok_jaeger_info;
	permanent = FALSE;
	description = "Kde najdu ty ostatn� lovce?";
};


func int dia_bartok_jaeger_condition()
{
	if(Npc_KnowsInfo(other,dia_bartok_hallo))
	{
		return TRUE;
	};
};

func void dia_bartok_jaeger_info()
{
	AI_Output(other,self,"DIA_Bartok_Jager_15_00");	//Kde najdu ty ostatn� lovce?
	AI_Output(self,other,"DIA_Bartok_Jager_04_01");	//M�li jsme t�bor venku, pobl� kr�my, nap�l cesty k Onarov� farm�.
	AI_Output(self,other,"DIA_Bartok_Jager_04_02");	//Ale nev�m, jestli tam je�t� n�kdo z�stal.
	AI_Output(self,other,"DIA_Addon_Bartok_Jager_04_00");	//Ned�vno jsme byli je�t� oba ve m�st�.
	AI_Output(self,other,"DIA_Addon_Bartok_Jager_04_01");	//M�j k�mo� Trokar je velmi zru�n� lovec.
};


instance DIA_ADDON_BARTOK_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 5;
	condition = dia_addon_bartok_missingpeople_condition;
	information = dia_addon_bartok_missingpeople_info;
	description = "Kde je tv�j kamar�d te�?";
};


func int dia_addon_bartok_missingpeople_condition()
{
	if(Npc_KnowsInfo(other,dia_bartok_jaeger))
	{
		return TRUE;
	};
};

func void dia_addon_bartok_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Bartok_MissingPeople_15_00");	//Kde je tv�j kamar�d te�?
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_04_01");	//No, to je divn� p��b�h.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_04_02");	//P�ed p�r dny jsme se oba potulovali kolem Coraganovi hospody a pov�dali si o lovu.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_04_03");	//Neptej se m�, co se stalo. Byl jsem toti� dost opil�.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_04_04");	//Jenom si pamtuju, �e Trokar cht�l n�jakou tr�vu z ba�in? Ale nikdy se u� nevr�til.
	MIS_BARTOK_MISSINGTROKAR = LOG_RUNNING;
	Info_ClearChoices(dia_addon_bartok_missingpeople);
	Info_AddChoice(dia_addon_bartok_missingpeople,"Ty jsi ho nehledal?",dia_addon_bartok_missingpeople_such);
	Info_AddChoice(dia_addon_bartok_missingpeople,"Odkud m� to st�blo z ba�in?",dia_addon_bartok_missingpeople_wo);
};

func void dia_addon_bartok_missingpeople_wo()
{
	AI_Output(other,self,"DIA_Addon_Bartok_MissingPeople_wo_15_00");	//Kde sh�n�l tu tr�vu z ba�in?
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_wo_04_01");	//Mysl�m, �e n�kde z p��stavn� �tvrti.
};

func void dia_addon_bartok_missingpeople_such()
{
	AI_Output(other,self,"DIA_Addon_Bartok_MissingPeople_such_15_00");	//Ty jsi ho nehledal?
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_01");	//Ne, ale �ekl jsem o tom domobran�.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_02");	//A nikdo z nich nebyl schopn� ho naj�t.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_03");	//Douf�m, �e ho nenapadnul n�jak� vlk nebo n�co hor��ho.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_04");	//My�lenka, �e p�i lovu zakopnu o jeho chladn� t�lo m� d�s�.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_05");	//Nev�m, jestli bych to p�enesl p�es srdce.
};


instance DIA_BARTOK_BOSPER(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 3;
	condition = dia_bartok_bosper_condition;
	information = dia_bartok_bosper_info;
	permanent = FALSE;
	description = "Bosper ��kal, �e jsi pro n�j pracoval.";
};


func int dia_bartok_bosper_condition()
{
	if(Npc_KnowsInfo(other,dia_bosper_bartok) && Npc_KnowsInfo(other,dia_bartok_hallo))
	{
		return TRUE;
	};
};

func void dia_bartok_bosper_info()
{
	AI_Output(other,self,"DIA_Bartok_Bosper_15_00");	//Bosper ��kal, �e jsi pro n�j pracoval.
	AI_Output(self,other,"DIA_Bartok_Bosper_04_01");	//Ano, pracoval. Ale on se zaj�mal jen o ty sv� k��e.
	AI_Output(self,other,"DIA_Bartok_Bosper_04_02");	//��kal jsem mu, jak je to venku nebezpe�n�. Ale v�bec m� neposlouchal.
	AI_Output(self,other,"DIA_Bartok_Bosper_04_03");	//No, ale jinak platil dob�e - na to si nem��u st�ovat.
	AI_Output(other,self,"DIA_Bartok_Bosper_15_04");	//M��e� mi o n�m n�co ��ct?
	AI_Output(self,other,"DIA_Bartok_Bosper_04_05");	//(sm�ch) Bosperovi n�kdo ned�vno ukradl luk. Za b�l�ho dne.
	AI_Output(self,other,"DIA_Bartok_Bosper_04_06");	//N�jakej chlap prost� nakr��el do jeho skladu, vzal ten luk a zmizel.
	AI_Output(self,other,"DIA_Bartok_Bosper_04_07");	//Ti zlod�ji jsou ��m d�l t�m drzej��!
	if(MIS_BOSPER_BOGEN != LOG_SUCCESS)
	{
		MIS_BOSPER_BOGEN = LOG_RUNNING;
	};
};


instance DIA_BARTOK_WANNALEARN(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 4;
	condition = dia_bartok_wannalearn_condition;
	information = dia_bartok_wannalearn_info;
	permanent = FALSE;
	description = "M��e� m� nau�it n�co o lovu?";
};


func int dia_bartok_wannalearn_condition()
{
	if(Npc_KnowsInfo(other,dia_bartok_hallo))
	{
		return TRUE;
	};
};

func void dia_bartok_wannalearn_info()
{
	AI_Output(other,self,"DIA_Bartok_WannaLearn_15_00");	//M��e� m� nau�it n�co o lovu?
	AI_Output(self,other,"DIA_Bartok_WannaLearn_04_01");	//M��u t� nau�it, jak se po��dn� pl�it a jak zach�zet s lukem.
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE)
	{
		AI_Output(self,other,"DIA_Bartok_WannaLearn_04_02");	//Jestli se chce� nau�it stahovat zv��ata, zajdi za Bosperem. On u� bude v�d�t, co a jak.
	};
	BARTOK_TEACHPLAYER = TRUE;
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Bartok m� nau�� lukost�elb� a um�n� pl�it se.");
};


instance DIA_BARTOK_TEACHSNEAK(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 4;
	condition = dia_bartok_teachsneak_condition;
	information = dia_bartok_teachsneak_info;
	permanent = TRUE;
	description = b_buildlearnstring("Nau� m�, jak se pl�it!",b_getlearncosttalent(other,NPC_TALENT_SNEAK,1));
};


func int dia_bartok_teachsneak_condition()
{
	if((BARTOK_TEACHPLAYER == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == 0))
	{
		return TRUE;
	};
};

func void dia_bartok_teachsneak_info()
{
	AI_Output(other,self,"DIA_Bartok_TeachSneak_15_00");	//Nau� m�, jak se pl�it!
	if(b_teachthieftalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_01");	//Dobr� - tak nejd��v se mus� ujistit, �e spr�vn� p�esouv� sv� t�i�t�.
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_02");	//Na to mus� ohnout kolena a do�lapovat na paty.
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_03");	//Mus� m�t v�dycky v�hu sv�ho t�la na noze, na kter� stoj�, a� do t� doby, ne� tou druhou jist� do�l�pne�.
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_04");	//Kolem v�t�iny zv��at se nem��e� propl�it, pokud nesp�. Ty potvory t� prost� vyc�t�.
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_05");	//Tak�e v�dycky, kdy� jsi venku, d�vej dobrej pozor.
	};
};


var int bosper_merkebow;

instance DIA_BARTOK_TEACH(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 4;
	condition = dia_bartok_teach_condition;
	information = dia_bartok_teach_info;
	permanent = TRUE;
	description = "Chci se nau�it l�p zach�zet s lukem!";
};


func int dia_bartok_teach_condition()
{
	if(BARTOK_TEACHPLAYER == TRUE)
	{
		return TRUE;
	};
};

func void dia_bartok_teach_info()
{
	AI_Output(other,self,"DIA_Bartok_TeachBow_15_00");	//Chci se nau�it l�p zach�zet s lukem!
	AI_Output(self,other,"DIA_Bartok_TeachBow_04_01");	//Fajn, tak se pod�v�me, jestli s t�m m��u n�co d�lat.
	BOSPER_MERKEBOW = other.hitchance[NPC_TALENT_BOW];
	Info_ClearChoices(dia_bartok_teach);
	Info_AddChoice(dia_bartok_teach,DIALOG_BACK,dia_bartok_teach_back);
	Info_AddChoice(dia_bartok_teach,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_bartok_teach_bow_1);
	Info_AddChoice(dia_bartok_teach,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_bartok_teach_bow_5);
};

func void dia_bartok_teach_back()
{
	if(other.hitchance[NPC_TALENT_BOW] >= 60)
	{
		AI_Output(self,other,"DIA_Bartok_TeachBow_BACK_04_00");	//M�l by ses pod�vat po n�kom, kdo o tom v� v�c ne� j�.
	}
	else if(BOSPER_MERKEBOW < other.hitchance[NPC_TALENT_BOW])
	{
		AI_Output(self,other,"DIA_Bartok_TeachBow_BACK_04_01");	//Dobr�, u� jsi dos�hl v�t�� p�esnosti.
	};
	Info_ClearChoices(dia_bartok_teach);
};

func void dia_bartok_teach_bow_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,1,60);
	Info_ClearChoices(dia_bartok_teach);
	Info_AddChoice(dia_bartok_teach,DIALOG_BACK,dia_bartok_teach_back);
	Info_AddChoice(dia_bartok_teach,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_bartok_teach_bow_1);
	Info_AddChoice(dia_bartok_teach,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_bartok_teach_bow_5);
};

func void dia_bartok_teach_bow_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,5,60);
	Info_ClearChoices(dia_bartok_teach);
	Info_AddChoice(dia_bartok_teach,DIALOG_BACK,dia_bartok_teach_back);
	Info_AddChoice(dia_bartok_teach,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_bartok_teach_bow_1);
	Info_AddChoice(dia_bartok_teach,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_bartok_teach_bow_5);
};


var int bartok_bereit;
var int bartok_later;

instance DIA_BARTOK_ZUSAMMEN(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 5;
	condition = dia_bartok_zusammen_condition;
	information = dia_bartok_zusammen_info;
	permanent = TRUE;
	description = "Co takhle j�t lovit spole�n�?";
};


func int dia_bartok_zusammen_condition()
{
	if((BARTOK_BEREIT == FALSE) && Npc_KnowsInfo(other,dia_bartok_hallo))
	{
		return TRUE;
	};
};

func void dia_bartok_zusammen_info()
{
	if(BARTOK_LATER == FALSE)
	{
		AI_Output(other,self,"DIA_Bartok_Zusammen_15_00");	//Co takhle j�t lovit spole�n�?
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_01");	//Hmm. Ve dvou to nebude tak nebezpe�n�, to je pravda.
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_02");	//V� aspo� n�co o lovu?
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_03");	//Mysl�m, jak stahovat zv��ata?
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == TRUE)
	{
		if(BARTOK_LATER == TRUE)
		{
			AI_Output(self,other,"DIA_Bartok_HuntNOW_04_01");	//M� 50 zla��k�?
		}
		else
		{
			AI_Output(other,self,"DIA_Bartok_Zusammen_15_04");	//Ano.
			AI_Output(self,other,"DIA_Bartok_Zusammen_04_05");	//Dobr�, ale chci nejd��v vid�t 50 zlat�ch. Za to si m��e� nechat v�echny k��e a prodat je Bosperovi.
			AI_Output(self,other,"DIA_Bartok_Zusammen_04_06");	//To je f�rov� nab�dka, ne?
		};
		Info_ClearChoices(dia_bartok_zusammen);
		Info_AddChoice(dia_bartok_zusammen,"Pozd�ji...",dia_bartok_zusammen_later);
		Info_AddChoice(dia_bartok_zusammen,"Tady jsou ...",dia_bartok_zusammen_pay);
	}
	else
	{
		AI_Output(other,self,"DIA_Bartok_Zusammen_15_07");	//Ne.
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_08");	//V tom p��pad� to za to nestoj�.
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_09");	//Vra� se, a� se n�co nau��.
	};
};

func void dia_bartok_zusammen_later()
{
	AI_Output(other,self,"DIA_Bartok_HuntNOW_Later_15_00");	//Pozd�ji...
	BARTOK_LATER = TRUE;
	Info_ClearChoices(dia_bartok_zusammen);
};

func void dia_bartok_zusammen_pay()
{
	Info_ClearChoices(dia_bartok_zusammen);
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(other,self,"DIA_Bartok_HuntNOW_GO_15_00");	//Tady jsou.
		BARTOK_BEREIT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bartok_HuntNOW_GO_04_03");	//A kde? Nem� zlato.
	};
};


var int bartok_los;

instance DIA_BARTOK_HUNTNOW(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 5;
	condition = dia_bartok_huntnow_condition;
	information = dia_bartok_huntnow_info;
	permanent = FALSE;
	description = "Jdeme na lov!";
};


func int dia_bartok_huntnow_condition()
{
	if(BARTOK_BEREIT == TRUE)
	{
		return TRUE;
	};
};

func void dia_bartok_huntnow_info()
{
	AI_Output(other,self,"DIA_Bartok_HuntNOW_15_00");	//Jdeme na lov!
	AI_Output(self,other,"DIA_Bartok_HuntNOW_GO_04_01");	//Dobr�, poj� za mnou. Venku za ji�n� br�nou je les, kde se d� t� hav�ti naj�t v�c ne� dost.
	AI_Output(self,other,"DIA_Bartok_HuntNOW_GO_04_02");	//(pro sebe) Mo�n� v�c, ne� by n�m mohlo l�bit.
	BARTOK_LOS = TRUE;
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"GUIDEMITTE");
	Wld_InsertNpc(wolf,"NW_FARM1_CITYWALL_FOREST_02");
	Wld_InsertNpc(wolf,"NW_FARM1_CITYWALL_FOREST_02");
	Wld_InsertNpc(wolf,"NW_FARM1_CITYWALL_FOREST_02");
};


var int bartok_orkstillthere;

instance DIA_BARTOK_IMWALD(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 1;
	condition = dia_bartok_imwald_condition;
	information = dia_bartok_imwald_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_bartok_imwald_condition()
{
	if((BARTOK_LOS == TRUE) && (Npc_GetDistToWP(self,"NW_FARM1_CITYWALL_FOREST_03") < 500))
	{
		return TRUE;
	};
};

func void dia_bartok_imwald_info()
{
	AI_Output(self,other,"DIA_Bartok_ImWald_04_00");	//Tak co mysl�, p�jdeme d�l do lesa, nebo ne?
	Info_ClearChoices(dia_bartok_imwald);
	Info_AddChoice(dia_bartok_imwald,"Vra�me se!",dia_bartok_imwald_nachhause);
	Info_AddChoice(dia_bartok_imwald,"Pokra�ujem.",dia_bartok_imwald_weiter);
};

func void dia_bartok_imwald_nachhause()
{
	AI_Output(other,self,"DIA_Bartok_ImWald_NachHause_15_00");	//Vra�me se!
	AI_Output(self,other,"DIA_Bartok_ImWald_NachHause_04_01");	//Taky bych se rad�j vr�til. Nejsp� by se n�m poda�ilo vb�hnout p��mo do n�ru�� n�jak�mu sk�etovi.
	Info_ClearChoices(dia_bartok_imwald);
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};

func void dia_bartok_imwald_weiter()
{
	AI_Output(other,self,"DIA_Bartok_ImWald_Weiter_15_00");	//Pokra�ujem.
	AI_Output(self,other,"DIA_Bartok_ImWald_Weiter_04_01");	//Dobr�. (pro sebe) Doufejme, �e se to n�jak vy�e��.
	if(!Npc_IsDead(cityorc))
	{
		BARTOK_ORKSTILLTHERE = TRUE;
	};
	Info_ClearChoices(dia_bartok_imwald);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDEENDE");
};


var int bartok_ende;

instance DIA_BARTOK_ANGEKOMMEN(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 1;
	condition = dia_bartok_angekommen_condition;
	information = dia_bartok_angekommen_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_bartok_angekommen_condition()
{
	if((BARTOK_LOS == TRUE) && (Npc_GetDistToWP(self,"NW_FARM1_CITYWALL_FOREST_07") < 500))
	{
		return TRUE;
	};
};

func void dia_bartok_angekommen_info()
{
	AI_Output(self,other,"DIA_Bartok_Angekommen_04_00");	//Tak! Mysl�m, �e se vr�tim do m�sta.
	AI_Output(self,other,"DIA_Bartok_Angekommen_04_01");	//Tady venku je to pro m� prost� p��li� nebezpe�n� - dokonce pro n�s oba.
	if(BARTOK_ORKSTILLTHERE == TRUE)
	{
		b_bartok_shitanorc();
		BARTOK_ORKGESAGT = TRUE;
	};
	AI_Output(self,other,"DIA_Bartok_Angekommen_04_03");	//Tak nashle!
	AI_Output(self,other,"DIA_Bartok_Angekommen_04_04");	//M��e� ty k��e prodat Bosperovi.
	BARTOK_ENDE = TRUE;
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_BARTOK_PERM(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 1;
	condition = dia_bartok_perm_condition;
	information = dia_bartok_perm_info;
	permanent = TRUE;
	description = "V pohod�?";
};


func int dia_bartok_perm_condition()
{
	if(BARTOK_LOS == TRUE)
	{
		return TRUE;
	};
};

func void dia_bartok_perm_info()
{
	AI_Output(other,self,"DIA_Bartok_PERM_15_00");	//V pohod�?
	if(BARTOK_ENDE == TRUE)
	{
		AI_Output(self,other,"DIA_Bartok_PERM_04_01");	//Ano. Ale za br�ny m�sta u� m� nikdy nikdo nedostane - alespo� ne v dohledn� dob�.
		if(BARTOK_ORKGESAGT == TRUE)
		{
			AI_Output(self,other,"DIA_Bartok_PERM_04_02");	//Po��d se mi klepou strachy kolena, �e n�s dostane do sp�r� n�jakej sk�et.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bartok_PERM_04_03");	//Jasn�. Jen ulov�me p�r besti�!
	};
};

