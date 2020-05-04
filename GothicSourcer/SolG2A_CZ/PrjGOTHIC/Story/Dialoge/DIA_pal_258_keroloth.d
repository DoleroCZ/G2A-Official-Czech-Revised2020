
instance DIA_KEROLOTH_EXIT(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 999;
	condition = dia_keroloth_exit_condition;
	information = dia_keroloth_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_keroloth_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_keroloth_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KEROLOTH_HELLO(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 2;
	condition = dia_keroloth_hello_condition;
	information = dia_keroloth_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_keroloth_hello_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_keroloth_hello_info()
{
	AI_Output(other,self,"DIA_Keroloth_HELLO_15_00");	//Ty tady trénuješ ostatní?
	AI_Output(self,other,"DIA_Keroloth_HELLO_07_01");	//Ano. Až ti skøeti, nebo ještì hùø draci znovu zaútoèí, bude každá ruka dobrá.
};


instance DIA_KEROLOTH_WANTTEACH(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 3;
	condition = dia_keroloth_wantteach_condition;
	information = dia_keroloth_wantteach_info;
	permanent = FALSE;
	description = "Mùžeš nìco nauèit i mì?";
};


func int dia_keroloth_wantteach_condition()
{
	if(KEROLOTHS_BEUTELLEER == FALSE)
	{
		return TRUE;
	};
};

func void dia_keroloth_wantteach_info()
{
	AI_Output(other,self,"DIA_Keroloth_WantTeach_15_00");	//Mùžeš nìco nauèit i mì?
	AI_Output(self,other,"DIA_Keroloth_WantTeach_07_01");	//Samozøejmì. Trénuji každého slušného èlovìka.
	AI_Output(self,other,"DIA_Keroloth_WantTeach_07_02");	//Ale pokud tady chceš pøežít, budeš potøebovat kromì talentu i nìjakou dobrou zbraò.
	AI_Output(self,other,"DIA_Keroloth_WantTeach_07_03");	//Požádej rytíøe Tandora. Postará se o tebe.
	KEROLOTH_TEACHPLAYER = TRUE;
	Log_CreateTopic(TOPIC_TEACHER_OC,LOG_NOTE);
	b_logentry(TOPIC_TEACHER_OC,"Keroloth na hradì trénuje bojovníky s meèem.");
	Log_CreateTopic(TOPIC_TRADER_OC,LOG_NOTE);
	b_logentry(TOPIC_TRADER_OC,"Tandor na hradì prodává zbranì.");
};


instance DIA_KEROLOTH_TEACHER(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 6;
	condition = dia_keroloth_teacher_condition;
	information = dia_keroloth_teacher_info;
	permanent = TRUE;
	description = "(Nauèit se jednoruènímu boji.)";
};


func int dia_keroloth_teacher_condition()
{
	if((KEROLOTH_TEACHPLAYER == TRUE) && (KEROLOTHS_BEUTELLEER == FALSE))
	{
		return TRUE;
	};
};

func void dia_keroloth_teacher_info()
{
	AI_Output(other,self,"DIA_Keroloth_Teacher_15_00");	//Chci se uèit!
	Info_ClearChoices(dia_keroloth_teacher);
	Info_AddChoice(dia_keroloth_teacher,DIALOG_BACK,dia_keroloth_teacher_back);
	Info_AddChoice(dia_keroloth_teacher,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_keroloth_teacher_1h_1);
	Info_AddChoice(dia_keroloth_teacher,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_keroloth_teacher_1h_5);
};

func void dia_keroloth_teacher_back()
{
	Info_ClearChoices(dia_keroloth_teacher);
};

func void b_keroloth_teachnomore1()
{
	AI_Output(self,other,"B_Keroloth_TeachNoMore1_07_00");	//Jsi velice dobrý. Už není nic, co bych tì mohl nauèit.
};

func void b_keroloth_teachnomore2()
{
	AI_Output(self,other,"B_Keroloth_TeachNoMore2_07_00");	//Mùže ti pomoci už jen zkušený mistr meèe.
};

func void dia_keroloth_teacher_1h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,60);
	if(other.hitchance[NPC_TALENT_1H] >= 60)
	{
		b_keroloth_teachnomore1();
		if(Npc_GetTalentSkill(other,NPC_TALENT_1H) == 2)
		{
			b_keroloth_teachnomore2();
		};
	};
	Info_AddChoice(dia_keroloth_teacher,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_keroloth_teacher_1h_1);
};

func void dia_keroloth_teacher_1h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,60);
	if(other.hitchance[NPC_TALENT_1H] >= 60)
	{
		b_keroloth_teachnomore1();
		if(Npc_GetTalentSkill(other,NPC_TALENT_1H) == 2)
		{
			b_keroloth_teachnomore2();
		};
	};
	Info_AddChoice(dia_keroloth_teacher,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_keroloth_teacher_1h_5);
};


instance DIA_KEROLOTH_TEACH(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 100;
	condition = dia_keroloth_teach_condition;
	information = dia_keroloth_teach_info;
	permanent = TRUE;
	description = "(Osvojit si dovednost obouruèního boje)";
};


var int dia_keroloth_teach_permanent;

func int dia_keroloth_teach_condition()
{
	if((KEROLOTH_TEACHPLAYER == TRUE) && (KEROLOTHS_BEUTELLEER == FALSE) && (DIA_KEROLOTH_TEACH_PERMANENT == FALSE) && (other.hitchance[NPC_TALENT_2H] < 60))
	{
		return TRUE;
	};
};

func void dia_keroloth_teach_info()
{
	AI_Output(other,self,"DIA_Keroloth_Teach_15_00");	//Zaènìme.
	Info_ClearChoices(dia_keroloth_teach);
	Info_AddChoice(dia_keroloth_teach,DIALOG_BACK,dia_keroloth_teach_back);
	Info_AddChoice(dia_keroloth_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_keroloth_teach_2h_1);
	Info_AddChoice(dia_keroloth_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_keroloth_teach_2h_5);
};

func void dia_keroloth_teach_back()
{
	if(other.hitchance[NPC_TALENT_2H] >= 60)
	{
		b_keroloth_teachnomore1();
		DIA_KEROLOTH_TEACH_PERMANENT = TRUE;
	};
	Info_ClearChoices(dia_keroloth_teach);
};

func void dia_keroloth_teach_2h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,60);
	Info_ClearChoices(dia_keroloth_teach);
	Info_AddChoice(dia_keroloth_teach,DIALOG_BACK,dia_keroloth_teach_back);
	Info_AddChoice(dia_keroloth_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_keroloth_teach_2h_1);
	Info_AddChoice(dia_keroloth_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_keroloth_teach_2h_5);
};

func void dia_keroloth_teach_2h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,60);
	Info_ClearChoices(dia_keroloth_teach);
	Info_AddChoice(dia_keroloth_teach,DIALOG_BACK,dia_keroloth_teach_back);
	Info_AddChoice(dia_keroloth_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_keroloth_teach_2h_1);
	Info_AddChoice(dia_keroloth_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_keroloth_teach_2h_5);
};


instance DIA_KEROLOTH_UDAR(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 4;
	condition = dia_keroloth_udar_condition;
	information = dia_keroloth_udar_info;
	permanent = FALSE;
	description = "A co boj na dálku?";
};


func int dia_keroloth_udar_condition()
{
	if((KEROLOTH_TEACHPLAYER == TRUE) && (KEROLOTHS_BEUTELLEER == FALSE))
	{
		return TRUE;
	};
};

func void dia_keroloth_udar_info()
{
	AI_Output(other,self,"DIA_Keroloth_Udar_15_00");	//A co boj na dálku?
	AI_Output(self,other,"DIA_Keroloth_Udar_07_01");	//Co je s ním?
	AI_Output(other,self,"DIA_Keroloth_Udar_15_02");	//Mùžeš mì trénovat i v nìm?
	AI_Output(self,other,"DIA_Keroloth_Udar_07_03");	//Ne, ale mùžeš se zeptat Udara, je to dobrý - ne, je to NEJLEPŠÍ støelec z kuše, jakého znám.
	Log_CreateTopic(TOPIC_TEACHER_OC,LOG_NOTE);
	b_logentry(TOPIC_TEACHER_OC,"Udar z hradu v Hornickém údolí ví o kuších snad všechno, co lze znát.");
};


instance DIA_KEROLOTH_KAP3_EXIT(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 999;
	condition = dia_keroloth_kap3_exit_condition;
	information = dia_keroloth_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_keroloth_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_keroloth_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KEROLOTH_KAP4_EXIT(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 999;
	condition = dia_keroloth_kap4_exit_condition;
	information = dia_keroloth_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_keroloth_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_keroloth_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KEROLOTH_KAP4_HELLO(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 40;
	condition = dia_keroloth_kap4_hello_condition;
	information = dia_keroloth_kap4_hello_info;
	description = "Nìjak protahuješ oblièej.";
};


func int dia_keroloth_kap4_hello_condition()
{
	if(KAPITEL >= 4)
	{
		return TRUE;
	};
};

func void dia_keroloth_kap4_hello_info()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_HELLO_15_00");	//Nìjak protahuješ oblièej.
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_07_01");	//(nahnìvanì) Zatracenì. Jak povídám, jeden musí být jako ostøíž.
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_07_02");	//Na chvíli se otoèíš zády a hned ti zaènou mizet vìci. Ksakru!
	Info_AddChoice(dia_keroloth_kap4_hello,DIALOG_BACK,dia_keroloth_kap4_hello_ende);
	Info_AddChoice(dia_keroloth_kap4_hello,"Paladin by se nemìl nikdy pøestat ovládat.",dia_keroloth_kap4_hello_ruhig);
	Info_AddChoice(dia_keroloth_kap4_hello,"Nìkdo ti nìco ukradl?",dia_keroloth_kap4_hello_bestohlen);
	Info_AddChoice(dia_keroloth_kap4_hello,"Kdo to podle tebe byl?",dia_keroloth_kap4_hello_pack);
};

func void dia_keroloth_kap4_hello_ende()
{
	Info_ClearChoices(dia_keroloth_kap4_hello);
};

func void dia_keroloth_kap4_hello_bestohlen()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_HELLO_bestohlen_15_00");	//Nìkdo ti nìco ukradl?
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_bestohlen_07_01");	//Ne. Nìkdo mi strèil do kapsy 20 zlatých. Samozøejmì, že mi nìkdo nìco ukradl, blbeèku!
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_bestohlen_07_02");	//Ale to ti povídám, až se mi ta prašivá svinì dostane do rukou...
	Info_AddChoice(dia_keroloth_kap4_hello,"A co ti chybí?",dia_keroloth_kap4_hello_bestohlen_wasfehlt);
};

func void dia_keroloth_kap4_hello_bestohlen_wasfehlt()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_15_00");	//A co ti chybí?
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_07_01");	//Mìšec - mìl jsem v nìm všechny své úspory.
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_07_02");	//A teï je pryè!
	AI_Output(other,self,"DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_15_03");	//Urèitì se nìkde objeví.
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_07_04");	//Až se mi dostane do rukou...
	Log_CreateTopic(TOPIC_KEROLOTHSGELDBEUTEL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KEROLOTHSGELDBEUTEL,LOG_RUNNING);
	b_logentry(TOPIC_KEROLOTHSGELDBEUTEL,"Paladinu Kerolothovi se ztratila portmonka a tvrdí, že mu ji uzmuli drakobijci.");
	Info_ClearChoices(dia_keroloth_kap4_hello);
};

func void dia_keroloth_kap4_hello_pack()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_HELLO_pack_15_00");	//Kdo to podle tebe byl?
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_pack_07_01");	//Nìkdo z vás parchantù drakobijcù, samozøejmì. Kdo jiný?
	}
	else
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_pack_07_02");	//Samozøejmì nìkdo z té drakobijecké chátry. O kom jiném bych asi tak mluvil?
	};
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_pack_07_03");	//(pro sebe) Povídám, že je zapotøebí mít je poøád na oèích.
};

func void dia_keroloth_kap4_hello_ruhig()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_HELLO_ruhig_15_00");	//Uklidni se! Paladin by se nemìl pøestat ovládat.
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_ruhig_07_01");	//Ale já se nechci uklidnit. Bylo to zatracenì všechno, co jsem mìl!
};


instance DIA_KEROLOTH_KAP4_GELDGEFUNDEN(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 42;
	condition = dia_keroloth_kap4_geldgefunden_condition;
	information = dia_keroloth_kap4_geldgefunden_info;
	description = "Asi jsem našel tvùj mìšec.";
};


func int dia_keroloth_kap4_geldgefunden_condition()
{
	if(Npc_KnowsInfo(other,dia_keroloth_kap4_hello) && (Npc_HasItems(other,itmi_kerolothsgeldbeutel_mis) || Npc_HasItems(other,itmi_kerolothsgeldbeutelleer_mis)))
	{
		return TRUE;
	};
};

func void dia_keroloth_kap4_geldgefunden_info()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_GELDGEFUNDEN_15_00");	//Asi jsem našel tvùj mìšec.
	TOPIC_END_KEROLOTHSGELDBEUTEL = TRUE;
	b_giveplayerxp(XP_KEROLOTHSGELDBEUTEL);
	if(b_giveinvitems(other,self,itmi_kerolothsgeldbeutelleer_mis,1))
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_07_01");	//Je prázdný. Která svinì to udìlala?
		KEROLOTHS_BEUTELLEER = TRUE;
	};
	if(b_giveinvitems(other,self,itmi_kerolothsgeldbeutel_mis,1))
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_07_02");	//Co? Kde? Který parchant to udìlal?
	};
	if(hero.guild == GIL_DJG)
	{
		Info_AddChoice(dia_keroloth_kap4_geldgefunden,"Momentíèek - jaká bude odmìna?",dia_keroloth_kap4_geldgefunden_lohn);
	};
	Info_AddChoice(dia_keroloth_kap4_geldgefunden,"Byl tady hned u kovárny.",dia_keroloth_kap4_geldgefunden_schmiede);
	Info_AddChoice(dia_keroloth_kap4_geldgefunden,"Podezírám jednoho z drakobijcù.",dia_keroloth_kap4_geldgefunden_djg);
	Info_AddChoice(dia_keroloth_kap4_geldgefunden,"Jak bych to mohl vìdìt?",dia_keroloth_kap4_geldgefunden_keineahnung);
};

func void dia_keroloth_kap4_geldgefunden_keineahnung()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_15_00");	//Jak bych to mohl vìdìt?
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_07_01");	//Dìláš si ze mì legraci? Pøiznej se, žes to byl ty.
		Info_ClearChoices(dia_keroloth_kap4_geldgefunden);
		Info_AddChoice(dia_keroloth_kap4_geldgefunden,"Podezírám jednoho z drakobijcù.",dia_keroloth_kap4_geldgefunden_djg);
		Info_AddChoice(dia_keroloth_kap4_geldgefunden,"Polib mi.",dia_keroloth_kap4_geldgefunden_keineahnung_kannstmich);
	}
	else
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_07_02");	//To ještì zjistím.
		AI_StopProcessInfos(self);
	};
};

func void dia_keroloth_kap4_geldgefunden_keineahnung_kannstmich()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_kannstmich_15_00");	//Polib mi.
	AI_Output(self,other,"DIA_Keroloth_KAP4_kannstmich_07_01");	//Já ti ukážu, okrádat poctivé lidi.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_keroloth_kap4_geldgefunden_djg()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_15_00");	//Podezírám jednoho z drakobijcù.
	AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_07_01");	//(rozzlobenì) Já to vìdìl.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_07_02");	//(køièí) Nikdy tì nemìli pouštìt do hradu.
	}
	else
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_07_03");	//Jen poèkej, já dám té svini co proto.
	};
	AI_StopProcessInfos(self);
	other.aivar[AIV_INVINCIBLE] = FALSE;
	if((Npc_IsDead(ferros) == FALSE) && (Npc_GetDistToNpc(self,ferros) <= 2000))
	{
		b_attack(self,ferros,AR_NONE,1);
	}
	else if((Npc_IsDead(jan) == FALSE) && (Npc_GetDistToNpc(self,jan) <= 2000))
	{
		b_attack(self,jan,AR_NONE,1);
	}
	else if((Npc_IsDead(rethon) == FALSE) && (Npc_GetDistToNpc(self,rethon) <= 2000))
	{
		b_attack(self,rethon,AR_NONE,1);
	};
};

func void dia_keroloth_kap4_geldgefunden_schmiede()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_GELDGEFUNDEN_Schmiede_15_00");	//Ehm. Byl tady, hned vedle kovárny.
	AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_Schmiede_07_01");	//Kde? Poblíž kovárny? Urèitì vypadl jednomu z tìch drakobijcù z kapsy, neøíkej, že ne.
};

func void dia_keroloth_kap4_geldgefunden_lohn()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn_15_00");	//Poèkej. A co odmìna?
	if(KEROLOTHS_BEUTELLEER == TRUE)
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn_07_01");	//Tak to je poslední kapka. Už dlouho ti nikdo pìstí nepøepoèítal zuby, co?
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn_07_02");	//Arrh. Dobrá. Tady je pár zlatých. A teï mi øekneš, kdo to udìlal?
		CreateInvItems(self,itmi_gold,50);
		b_giveinvitems(self,other,itmi_gold,50);
		KEROLOTH_HASPAYED = TRUE;
	};
};


instance DIA_KEROLOTH_KAP4_BELOHNUNG(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 43;
	condition = dia_keroloth_kap4_belohnung_condition;
	information = dia_keroloth_kap4_belohnung_info;
	permanent = TRUE;
	description = "Chci nálezné za tvùj mìšec.";
};


func int dia_keroloth_kap4_belohnung_condition()
{
	if(Npc_KnowsInfo(other,dia_keroloth_kap4_geldgefunden) && (KEROLOTH_HASPAYED == FALSE) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_keroloth_kap4_belohnung_info()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_BELOHNUNG_15_00");	//Chci nálezné za tvùj mìšec.
	if((KEROLOTHS_BEUTELLEER == TRUE) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_BELOHNUNG_07_01");	//Dostaneš akorát tak ránu do zubù!
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_BELOHNUNG_07_02");	//To je jediné, co tì zajímá? Tady máš sakra pár zlatých a teï zmiz.
		CreateInvItems(self,itmi_gold,50);
		b_giveinvitems(self,other,itmi_gold,50);
		KEROLOTH_HASPAYED = TRUE;
	};
};


instance DIA_KEROLOTH_KAP4_ENTSPANNDICH(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 44;
	condition = dia_keroloth_kap4_entspanndich_condition;
	information = dia_keroloth_kap4_entspanndich_info;
	permanent = TRUE;
	description = "Klídek.";
};


func int dia_keroloth_kap4_entspanndich_condition()
{
	if((Npc_KnowsInfo(other,dia_keroloth_kap4_geldgefunden) && (KAPITEL >= 4)) || (MIS_OCGATEOPEN == TRUE))
	{
		return TRUE;
	};
};

func void dia_keroloth_kap4_entspanndich_info()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_ENTSPANNDICH_15_00");	//Klídek.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_ENTSPANNDICH_07_01");	//Ano, mistøe. Pokusím se.
	}
	else if(MIS_OCGATEOPEN == TRUE)
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_ENTSPANNDICH_07_02");	//Nemùžu to dokázat, ale myslím, že ty jsi ten zrádce, který otevøel bránu.
		AI_Output(self,other,"DIA_Keroloth_KAP4_ENTSPANNDICH_07_03");	//Za to teï zaplatíš.
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_Output(other,self,"DIA_Keroloth_KAP4_ENTSPANNDICH_15_04");	//Máš svùj mìšec zpátky, ne?
		AI_Output(self,other,"DIA_Keroloth_KAP4_ENTSPANNDICH_07_05");	//Nehraj si se mnou, chlapèe! Padej!
		AI_StopProcessInfos(self);
	};
};


instance DIA_KEROLOTH_KAP5_EXIT(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 999;
	condition = dia_keroloth_kap5_exit_condition;
	information = dia_keroloth_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_keroloth_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_keroloth_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KEROLOTH_KAP6_EXIT(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 999;
	condition = dia_keroloth_kap6_exit_condition;
	information = dia_keroloth_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_keroloth_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_keroloth_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KEROLOTH_PICKPOCKET(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 900;
	condition = dia_keroloth_pickpocket_condition;
	information = dia_keroloth_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_keroloth_pickpocket_condition()
{
	return c_beklauen(25,45);
};

func void dia_keroloth_pickpocket_info()
{
	Info_ClearChoices(dia_keroloth_pickpocket);
	Info_AddChoice(dia_keroloth_pickpocket,DIALOG_BACK,dia_keroloth_pickpocket_back);
	Info_AddChoice(dia_keroloth_pickpocket,DIALOG_PICKPOCKET,dia_keroloth_pickpocket_doit);
};

func void dia_keroloth_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_keroloth_pickpocket);
};

func void dia_keroloth_pickpocket_back()
{
	Info_ClearChoices(dia_keroloth_pickpocket);
};

