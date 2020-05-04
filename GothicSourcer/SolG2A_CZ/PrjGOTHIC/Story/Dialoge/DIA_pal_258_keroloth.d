
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
	AI_Output(other,self,"DIA_Keroloth_HELLO_15_00");	//Ty tady tr�nuje� ostatn�?
	AI_Output(self,other,"DIA_Keroloth_HELLO_07_01");	//Ano. A� ti sk�eti, nebo je�t� h�� draci znovu za�to��, bude ka�d� ruka dobr�.
};


instance DIA_KEROLOTH_WANTTEACH(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 3;
	condition = dia_keroloth_wantteach_condition;
	information = dia_keroloth_wantteach_info;
	permanent = FALSE;
	description = "M��e� n�co nau�it i m�?";
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
	AI_Output(other,self,"DIA_Keroloth_WantTeach_15_00");	//M��e� n�co nau�it i m�?
	AI_Output(self,other,"DIA_Keroloth_WantTeach_07_01");	//Samoz�ejm�. Tr�nuji ka�d�ho slu�n�ho �lov�ka.
	AI_Output(self,other,"DIA_Keroloth_WantTeach_07_02");	//Ale pokud tady chce� p�e��t, bude� pot�ebovat krom� talentu i n�jakou dobrou zbra�.
	AI_Output(self,other,"DIA_Keroloth_WantTeach_07_03");	//Po��dej ryt��e Tandora. Postar� se o tebe.
	KEROLOTH_TEACHPLAYER = TRUE;
	Log_CreateTopic(TOPIC_TEACHER_OC,LOG_NOTE);
	b_logentry(TOPIC_TEACHER_OC,"Keroloth na hrad� tr�nuje bojovn�ky s me�em.");
	Log_CreateTopic(TOPIC_TRADER_OC,LOG_NOTE);
	b_logentry(TOPIC_TRADER_OC,"Tandor na hrad� prod�v� zbran�.");
};


instance DIA_KEROLOTH_TEACHER(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 6;
	condition = dia_keroloth_teacher_condition;
	information = dia_keroloth_teacher_info;
	permanent = TRUE;
	description = "(Nau�it se jednoru�n�mu boji.)";
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
	AI_Output(other,self,"DIA_Keroloth_Teacher_15_00");	//Chci se u�it!
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
	AI_Output(self,other,"B_Keroloth_TeachNoMore1_07_00");	//Jsi velice dobr�. U� nen� nic, co bych t� mohl nau�it.
};

func void b_keroloth_teachnomore2()
{
	AI_Output(self,other,"B_Keroloth_TeachNoMore2_07_00");	//M��e ti pomoci u� jen zku�en� mistr me�e.
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
	description = "(Osvojit si dovednost obouru�n�ho boje)";
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
	AI_Output(other,self,"DIA_Keroloth_Teach_15_00");	//Za�n�me.
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
	description = "A co boj na d�lku?";
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
	AI_Output(other,self,"DIA_Keroloth_Udar_15_00");	//A co boj na d�lku?
	AI_Output(self,other,"DIA_Keroloth_Udar_07_01");	//Co je s n�m?
	AI_Output(other,self,"DIA_Keroloth_Udar_15_02");	//M��e� m� tr�novat i v n�m?
	AI_Output(self,other,"DIA_Keroloth_Udar_07_03");	//Ne, ale m��e� se zeptat Udara, je to dobr� - ne, je to NEJLEP�� st�elec z ku�e, jak�ho zn�m.
	Log_CreateTopic(TOPIC_TEACHER_OC,LOG_NOTE);
	b_logentry(TOPIC_TEACHER_OC,"Udar z hradu v Hornick�m �dol� v� o ku��ch snad v�echno, co lze zn�t.");
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
	description = "N�jak protahuje� obli�ej.";
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
	AI_Output(other,self,"DIA_Keroloth_KAP4_HELLO_15_00");	//N�jak protahuje� obli�ej.
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_07_01");	//(nahn�van�) Zatracen�. Jak pov�d�m, jeden mus� b�t jako ost��.
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_07_02");	//Na chv�li se oto�� z�dy a hned ti za�nou mizet v�ci. Ksakru!
	Info_AddChoice(dia_keroloth_kap4_hello,DIALOG_BACK,dia_keroloth_kap4_hello_ende);
	Info_AddChoice(dia_keroloth_kap4_hello,"Paladin by se nem�l nikdy p�estat ovl�dat.",dia_keroloth_kap4_hello_ruhig);
	Info_AddChoice(dia_keroloth_kap4_hello,"N�kdo ti n�co ukradl?",dia_keroloth_kap4_hello_bestohlen);
	Info_AddChoice(dia_keroloth_kap4_hello,"Kdo to podle tebe byl?",dia_keroloth_kap4_hello_pack);
};

func void dia_keroloth_kap4_hello_ende()
{
	Info_ClearChoices(dia_keroloth_kap4_hello);
};

func void dia_keroloth_kap4_hello_bestohlen()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_HELLO_bestohlen_15_00");	//N�kdo ti n�co ukradl?
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_bestohlen_07_01");	//Ne. N�kdo mi str�il do kapsy 20 zlat�ch. Samoz�ejm�, �e mi n�kdo n�co ukradl, blbe�ku!
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_bestohlen_07_02");	//Ale to ti pov�d�m, a� se mi ta pra�iv� svin� dostane do rukou...
	Info_AddChoice(dia_keroloth_kap4_hello,"A co ti chyb�?",dia_keroloth_kap4_hello_bestohlen_wasfehlt);
};

func void dia_keroloth_kap4_hello_bestohlen_wasfehlt()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_15_00");	//A co ti chyb�?
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_07_01");	//M�ec - m�l jsem v n�m v�echny sv� �spory.
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_07_02");	//A te� je pry�!
	AI_Output(other,self,"DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_15_03");	//Ur�it� se n�kde objev�.
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_07_04");	//A� se mi dostane do rukou...
	Log_CreateTopic(TOPIC_KEROLOTHSGELDBEUTEL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KEROLOTHSGELDBEUTEL,LOG_RUNNING);
	b_logentry(TOPIC_KEROLOTHSGELDBEUTEL,"Paladinu Kerolothovi se ztratila portmonka a tvrd�, �e mu ji uzmuli drakobijci.");
	Info_ClearChoices(dia_keroloth_kap4_hello);
};

func void dia_keroloth_kap4_hello_pack()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_HELLO_pack_15_00");	//Kdo to podle tebe byl?
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_pack_07_01");	//N�kdo z v�s parchant� drakobijc�, samoz�ejm�. Kdo jin�?
	}
	else
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_pack_07_02");	//Samoz�ejm� n�kdo z t� drakobijeck� ch�try. O kom jin�m bych asi tak mluvil?
	};
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_pack_07_03");	//(pro sebe) Pov�d�m, �e je zapot�eb� m�t je po��d na o��ch.
};

func void dia_keroloth_kap4_hello_ruhig()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_HELLO_ruhig_15_00");	//Uklidni se! Paladin by se nem�l p�estat ovl�dat.
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_ruhig_07_01");	//Ale j� se nechci uklidnit. Bylo to zatracen� v�echno, co jsem m�l!
};


instance DIA_KEROLOTH_KAP4_GELDGEFUNDEN(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 42;
	condition = dia_keroloth_kap4_geldgefunden_condition;
	information = dia_keroloth_kap4_geldgefunden_info;
	description = "Asi jsem na�el tv�j m�ec.";
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
	AI_Output(other,self,"DIA_Keroloth_KAP4_GELDGEFUNDEN_15_00");	//Asi jsem na�el tv�j m�ec.
	TOPIC_END_KEROLOTHSGELDBEUTEL = TRUE;
	b_giveplayerxp(XP_KEROLOTHSGELDBEUTEL);
	if(b_giveinvitems(other,self,itmi_kerolothsgeldbeutelleer_mis,1))
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_07_01");	//Je pr�zdn�. Kter� svin� to ud�lala?
		KEROLOTHS_BEUTELLEER = TRUE;
	};
	if(b_giveinvitems(other,self,itmi_kerolothsgeldbeutel_mis,1))
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_07_02");	//Co? Kde? Kter� parchant to ud�lal?
	};
	if(hero.guild == GIL_DJG)
	{
		Info_AddChoice(dia_keroloth_kap4_geldgefunden,"Moment��ek - jak� bude odm�na?",dia_keroloth_kap4_geldgefunden_lohn);
	};
	Info_AddChoice(dia_keroloth_kap4_geldgefunden,"Byl tady hned u kov�rny.",dia_keroloth_kap4_geldgefunden_schmiede);
	Info_AddChoice(dia_keroloth_kap4_geldgefunden,"Podez�r�m jednoho z drakobijc�.",dia_keroloth_kap4_geldgefunden_djg);
	Info_AddChoice(dia_keroloth_kap4_geldgefunden,"Jak bych to mohl v�d�t?",dia_keroloth_kap4_geldgefunden_keineahnung);
};

func void dia_keroloth_kap4_geldgefunden_keineahnung()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_15_00");	//Jak bych to mohl v�d�t?
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_07_01");	//D�l� si ze m� legraci? P�iznej se, �es to byl ty.
		Info_ClearChoices(dia_keroloth_kap4_geldgefunden);
		Info_AddChoice(dia_keroloth_kap4_geldgefunden,"Podez�r�m jednoho z drakobijc�.",dia_keroloth_kap4_geldgefunden_djg);
		Info_AddChoice(dia_keroloth_kap4_geldgefunden,"Polib mi.",dia_keroloth_kap4_geldgefunden_keineahnung_kannstmich);
	}
	else
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_07_02");	//To je�t� zjist�m.
		AI_StopProcessInfos(self);
	};
};

func void dia_keroloth_kap4_geldgefunden_keineahnung_kannstmich()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_kannstmich_15_00");	//Polib mi.
	AI_Output(self,other,"DIA_Keroloth_KAP4_kannstmich_07_01");	//J� ti uk�u, okr�dat poctiv� lidi.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_keroloth_kap4_geldgefunden_djg()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_15_00");	//Podez�r�m jednoho z drakobijc�.
	AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_07_01");	//(rozzloben�) J� to v�d�l.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_07_02");	//(k�i��) Nikdy t� nem�li pou�t�t do hradu.
	}
	else
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_07_03");	//Jen po�kej, j� d�m t� svini co proto.
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
	AI_Output(other,self,"DIA_Keroloth_KAP4_GELDGEFUNDEN_Schmiede_15_00");	//Ehm. Byl tady, hned vedle kov�rny.
	AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_Schmiede_07_01");	//Kde? Pobl� kov�rny? Ur�it� vypadl jednomu z t�ch drakobijc� z kapsy, ne��kej, �e ne.
};

func void dia_keroloth_kap4_geldgefunden_lohn()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn_15_00");	//Po�kej. A co odm�na?
	if(KEROLOTHS_BEUTELLEER == TRUE)
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn_07_01");	//Tak to je posledn� kapka. U� dlouho ti nikdo p�st� nep�epo��tal zuby, co?
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn_07_02");	//Arrh. Dobr�. Tady je p�r zlat�ch. A te� mi �ekne�, kdo to ud�lal?
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
	description = "Chci n�lezn� za tv�j m�ec.";
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
	AI_Output(other,self,"DIA_Keroloth_KAP4_BELOHNUNG_15_00");	//Chci n�lezn� za tv�j m�ec.
	if((KEROLOTHS_BEUTELLEER == TRUE) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_BELOHNUNG_07_01");	//Dostane� akor�t tak r�nu do zub�!
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_BELOHNUNG_07_02");	//To je jedin�, co t� zaj�m�? Tady m� sakra p�r zlat�ch a te� zmiz.
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
	description = "Kl�dek.";
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
	AI_Output(other,self,"DIA_Keroloth_KAP4_ENTSPANNDICH_15_00");	//Kl�dek.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_ENTSPANNDICH_07_01");	//Ano, mist�e. Pokus�m se.
	}
	else if(MIS_OCGATEOPEN == TRUE)
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_ENTSPANNDICH_07_02");	//Nem��u to dok�zat, ale mysl�m, �e ty jsi ten zr�dce, kter� otev�el br�nu.
		AI_Output(self,other,"DIA_Keroloth_KAP4_ENTSPANNDICH_07_03");	//Za to te� zaplat�.
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_Output(other,self,"DIA_Keroloth_KAP4_ENTSPANNDICH_15_04");	//M� sv�j m�ec zp�tky, ne?
		AI_Output(self,other,"DIA_Keroloth_KAP4_ENTSPANNDICH_07_05");	//Nehraj si se mnou, chlap�e! Padej!
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

