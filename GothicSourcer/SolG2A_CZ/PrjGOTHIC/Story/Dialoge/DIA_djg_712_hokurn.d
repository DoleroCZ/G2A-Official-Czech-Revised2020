
instance DIA_HOKURN_EXIT(C_INFO)
{
	npc = djg_712_hokurn;
	nr = 999;
	condition = dia_hokurn_exit_condition;
	information = dia_hokurn_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hokurn_exit_condition()
{
	return TRUE;
};

func void dia_hokurn_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HOKURN_HELLO(C_INFO)
{
	npc = djg_712_hokurn;
	nr = 4;
	condition = dia_hokurn_hello_condition;
	information = dia_hokurn_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hokurn_hello_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_hokurn_hello_info()
{
	AI_Output(self,other,"DIA_Hokurn_Hello_01_00");	//Nem� n�co k pit�?
	AI_Output(other,self,"DIA_Hokurn_Hello_15_01");	//A asi to nem� b�t voda, co?
	AI_Output(self,other,"DIA_Hokurn_Hello_01_02");	//To teda ne, ksakru!! Pot�ebuju n�jakej alkohol, abych se kone�n� zbavil toho zatracen�ho bolehlavu.
	AI_Output(self,other,"DIA_Hokurn_Hello_01_03");	//Jestli se brzo n��eho nenapiju, nejsp� mi pukne hlava.
	Info_ClearChoices(dia_hokurn_hello);
	Info_AddChoice(dia_hokurn_hello,"Pokus�m se n�co obstarat.",dia_hokurn_hello_no);
	if((Npc_HasItems(other,itfo_beer) >= 1) || (Npc_HasItems(other,itfo_booze) >= 1) || (Npc_HasItems(other,itfo_wine) >= 1))
	{
		Info_AddChoice(dia_hokurn_hello,"Tady, vezmi si tohle.",dia_hokurn_hello_yes);
	};
};

func void dia_hokurn_hello_no()
{
	AI_Output(other,self,"DIA_Hokurn_Hello_No_15_00");	//Nem�m nic, co bych ti mohl d�t.
	AI_Output(self,other,"DIA_Hokurn_Hello_No_01_01");	//Tak zmizni!
	Info_ClearChoices(dia_hokurn_hello);
	Info_AddChoice(dia_hokurn_hello,DIALOG_ENDE,dia_hokurn_hello_end);
	Info_AddChoice(dia_hokurn_hello,"Je�t� jedna v�c ...",dia_hokurn_hello_ask1);
};

func void dia_hokurn_hello_ask1()
{
	AI_Output(other,self,"DIA_Hokurn_Hello_ASK1_15_00");	//Je�t� jedna v�c...
	AI_Output(self,other,"DIA_Hokurn_Hello_ASK1_01_01");	//(povzdech) Tys mi nerozum�l? VYPADNI!!!
	Info_ClearChoices(dia_hokurn_hello);
	Info_AddChoice(dia_hokurn_hello,DIALOG_ENDE,dia_hokurn_hello_end);
	Info_AddChoice(dia_hokurn_hello,"Je to d�le�it�.",dia_hokurn_hello_ask2);
};

func void dia_hokurn_hello_ask2()
{
	AI_Output(other,self,"DIA_Hokurn_Hello_ASK2_15_00");	//Je to d�le�it�.
	AI_Output(self,other,"DIA_Hokurn_Hello_ASK2_01_01");	//(povzdech) �ekl sis o to.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_hokurn_hello_end()
{
	AI_StopProcessInfos(self);
};

func void b_hokurn_sauf()
{
	AI_Output(self,other,"B_Hokurn_Sauf_01_00");	//(��hnut�) Ha, tohle jsem pot�eboval.
	AI_Output(self,other,"B_Hokurn_Sauf_01_01");	//Te� m��u znova myslet s �istou hlavou. Co pro tebe m��u ud�lat?
};

func void dia_hokurn_hello_yes()
{
	AI_Output(other,self,"DIA_Hokurn_Hello_Yes_15_00");	//Tady, vezmi si tohle.
	if(Npc_HasItems(other,itfo_booze) >= 1)
	{
		b_giveinvitems(other,self,itfo_booze,1);
		b_useitem(self,itfo_booze);
	}
	else if(Npc_HasItems(other,itfo_wine) >= 1)
	{
		b_giveinvitems(other,self,itfo_wine,1);
		b_useitem(self,itfo_wine);
	}
	else if(Npc_HasItems(other,itfo_beer) >= 1)
	{
		b_giveinvitems(other,self,itfo_beer,1);
		b_useitem(self,itfo_beer);
	};
	HOKURNLASTDRINK = Wld_GetDay();
	HOKURNGETSDRINK = TRUE;
	b_hokurn_sauf();
	Info_ClearChoices(dia_hokurn_hello);
};


instance DIA_HOKURN_DRINK(C_INFO)
{
	npc = djg_712_hokurn;
	nr = 5;
	condition = dia_hokurn_drink_condition;
	information = dia_hokurn_drink_info;
	permanent = TRUE;
	description = "Tady m� n�co k pit�.";
};


func int dia_hokurn_drink_condition()
{
	if((HOKURNGETSDRINK == FALSE) && ((Npc_HasItems(other,itfo_beer) >= 1) || (Npc_HasItems(other,itfo_booze) >= 1) || (Npc_HasItems(other,itfo_wine) >= 1)))
	{
		return TRUE;
	};
};

func void dia_hokurn_drink_info()
{
	AI_Output(other,self,"DIA_Hokurn_Drink_15_00");	//Tady m� n�co k pit�.
	AI_Output(self,other,"DIA_Hokurn_Drink_01_01");	//(dychtiv�) Dej to sem!!
	if(Npc_HasItems(other,itfo_booze) >= 1)
	{
		b_giveinvitems(other,self,itfo_booze,1);
		b_useitem(self,itfo_booze);
	}
	else if(Npc_HasItems(other,itfo_wine) >= 1)
	{
		b_giveinvitems(other,self,itfo_wine,1);
		b_useitem(self,itfo_wine);
	}
	else if(Npc_HasItems(other,itfo_beer) >= 1)
	{
		b_giveinvitems(other,self,itfo_beer,1);
		b_useitem(self,itfo_beer);
	};
	HOKURNLASTDRINK = Wld_GetDay();
	HOKURNGETSDRINK = TRUE;
	b_hokurn_sauf();
};


instance DIA_HOKURN_QUESTION(C_INFO)
{
	npc = djg_712_hokurn;
	nr = 5;
	condition = dia_hokurn_question_condition;
	information = dia_hokurn_question_info;
	permanent = TRUE;
	description = "Pot�ebuju n�jak� informace.";
};


func int dia_hokurn_question_condition()
{
	if(HOKURNGETSDRINK == FALSE)
	{
		return TRUE;
	};
};

func void dia_hokurn_question_info()
{
	AI_Output(other,self,"DIA_Hokurn_Question_15_00");	//Pot�ebuju n�jak� informace.
	AI_Output(self,other,"DIA_Hokurn_Question_01_01");	//(otr�ven�) M�l jsem dojem, �e jsme si rozum�li. Mluv�m jen s p��teli.
	AI_Output(self,other,"DIA_Hokurn_Question_01_02");	//A p��tel� ti nab�dnou n�co k pit�. Jasn�? Te� odpal!
};


instance DIA_HOKURN_LEARN(C_INFO)
{
	npc = djg_712_hokurn;
	nr = 6;
	condition = dia_hokurn_learn_condition;
	information = dia_hokurn_learn_info;
	permanent = FALSE;
	description = "Hled�m n�koho, kdo by m� mohl n��emu nau�it.";
};


func int dia_hokurn_learn_condition()
{
	if(HOKURNGETSDRINK == TRUE)
	{
		return TRUE;
	};
};

func void dia_hokurn_learn_info()
{
	AI_Output(other,self,"DIA_Hokurn_Learn_15_00");	//Hled�m n�koho, kdo by m� mohl n��emu nau�it.
	AI_Output(self,other,"DIA_Hokurn_Learn_01_01");	//M��u ti uk�zat p�r v�c�. Jsem nejlep�� bojovn�k na m�le daleko.
	AI_Output(self,other,"DIA_Hokurn_Learn_01_02");	//Jeliko� jsme p��tel�, ud�l�m ti zvl�tn� cenu. 300 zlat�ch.
	Info_ClearChoices(dia_hokurn_learn);
	Info_AddChoice(dia_hokurn_learn,"To je pro m� moc drah�.",dia_hokurn_learn_tooexpensive);
	if(Npc_HasItems(other,itmi_gold) >= 300)
	{
		Info_AddChoice(dia_hokurn_learn,"Dobr�, tady jsou pen�ze.",dia_hokurn_learn_ok);
	};
};

func void dia_hokurn_learn_tooexpensive()
{
	AI_Output(other,self,"DIA_Hokurn_Learn_TooExpensive_15_00");	//To je pro m� moc drah�.
	AI_Output(self,other,"DIA_Hokurn_Learn_TooExpensive_01_01");	//Moc drah�? To je nejm��, co by si na m�m m�st� �ekl kdokoli jin�.
	AI_Output(self,other,"DIA_Hokurn_Learn_TooExpensive_01_02");	//P�em��lej o tom.
	Info_ClearChoices(dia_hokurn_learn);
};

func void dia_hokurn_learn_ok()
{
	AI_Output(other,self,"DIA_Hokurn_Learn_OK_15_00");	//Dobr�, tady jsou pen�ze.
	b_giveinvitems(other,self,itmi_gold,300);
	HOKURN_TEACHPLAYER = TRUE;
	Info_ClearChoices(dia_hokurn_learn);
};


instance DIA_HOKURN_PAYTEACHER(C_INFO)
{
	npc = djg_712_hokurn;
	nr = 6;
	condition = dia_hokurn_payteacher_condition;
	information = dia_hokurn_payteacher_info;
	permanent = TRUE;
	description = "Tady jsou pen�ze. Chci, abys m� u�il.";
};


func int dia_hokurn_payteacher_condition()
{
	if(Npc_KnowsInfo(other,dia_hokurn_learn) && (Npc_HasItems(other,itmi_gold) >= 300) && (HOKURN_TEACHPLAYER == FALSE))
	{
		return TRUE;
	};
};

func void dia_hokurn_payteacher_info()
{
	AI_Output(other,self,"DIA_Hokurn_PayTeacher_15_00");	//Tady jsou pen�ze. Chci, abys m� u�il.
	AI_Output(self,other,"DIA_Hokurn_PayTeacher_01_01");	//Nebude� litovat!
	b_giveinvitems(other,self,itmi_gold,300);
	HOKURN_TEACHPLAYER = TRUE;
};


instance DIA_HOKURN_DRINKANDLEARN(C_INFO)
{
	npc = djg_712_hokurn;
	nr = 7;
	condition = dia_hokurn_drinkandlearn_condition;
	information = dia_hokurn_drinkandlearn_info;
	permanent = TRUE;
	description = "Tady je pro tebe n�co k pit�.";
};


func int dia_hokurn_drinkandlearn_condition()
{
	if((HOKURNGETSDRINK == TRUE) && ((Npc_HasItems(other,itfo_booze) >= 1) || (Npc_HasItems(other,itfo_wine) >= 1) || (Npc_HasItems(other,itfo_beer) >= 1)))
	{
		return TRUE;
	};
};

func void dia_hokurn_drinkandlearn_info()
{
	AI_Output(other,self,"DIA_Hokurn_DrinkAndLearn_15_00");	//Tady je pro tebe n�co k pit�.
	if(Npc_HasItems(other,itfo_booze) >= 1)
	{
		b_giveinvitems(other,self,itfo_booze,1);
		b_useitem(self,itfo_booze);
	}
	else if(Npc_HasItems(other,itfo_wine) >= 1)
	{
		b_giveinvitems(other,self,itfo_wine,1);
		b_useitem(self,itfo_wine);
	}
	else if(Npc_HasItems(other,itfo_beer) >= 1)
	{
		b_giveinvitems(other,self,itfo_beer,1);
		b_useitem(self,itfo_beer);
	};
	HOKURNLASTDRINK = Wld_GetDay();
	AI_Output(self,other,"DIA_Hokurn_DrinkAndLearn_01_01");	//C�t�m se o moc l�p. Jsem p�ipraven na v�e.
};


instance DIA_HOKURN_TEACH(C_INFO)
{
	npc = djg_712_hokurn;
	nr = 7;
	condition = dia_hokurn_teach_condition;
	information = dia_hokurn_teach_info;
	permanent = TRUE;
	description = "Za�n�me s tr�ninkem.";
};


func int dia_hokurn_teach_condition()
{
	if(HOKURN_TEACHPLAYER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hokurn_teach_info()
{
	AI_Output(other,self,"DIA_Hokurn_Teach_15_00");	//Za�n�me s tr�ninkem.
	if(HOKURNLASTDRINK < Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Hokurn_Teach_01_01");	//Nejd��v mi p�ines n�co k pit�!
	}
	else
	{
		if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Hokurn_Teach_01_02");	//Pak se uvid�, co m��eme dostat z t�ch tvejch zatuhlejch paladinskejch kost�, jasn�?
		}
		else if(hero.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Hokurn_Teach_01_03");	//Co ty v�. Dokonce i m�gov� pou��vaj� chladn� zbran�.
		};
		Info_ClearChoices(dia_hokurn_teach);
		Info_AddChoice(dia_hokurn_teach,DIALOG_BACK,dia_hokurn_teach_back);
		Info_AddChoice(dia_hokurn_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_hokurn_teach_2h_1);
		Info_AddChoice(dia_hokurn_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_hokurn_teach_2h_5);
		Info_AddChoice(dia_hokurn_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_hokurn_teach_1h_1);
		Info_AddChoice(dia_hokurn_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_hokurn_teach_1h_5);
	};
};

func void dia_hokurn_teach_back()
{
	Info_ClearChoices(dia_hokurn_teach);
};

func void b_hokurn_teachedenough()
{
	AI_Output(self,other,"B_Hokurn_TeachedEnough_01_00");	//Na tuhle discipl�nu u� nepot�ebuje� ��dn�ho u�itele.
};

func void dia_hokurn_teach_2h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,100);
	if(other.hitchance[NPC_TALENT_2H] >= 100)
	{
		b_hokurn_teachedenough();
	};
	Info_AddChoice(dia_hokurn_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_hokurn_teach_2h_1);
};

func void dia_hokurn_teach_2h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,100);
	if(other.hitchance[NPC_TALENT_2H] >= 100)
	{
		b_hokurn_teachedenough();
	};
	Info_AddChoice(dia_hokurn_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_hokurn_teach_2h_5);
};

func void dia_hokurn_teach_1h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,100);
	if(other.hitchance[NPC_TALENT_1H] >= 100)
	{
		b_hokurn_teachedenough();
	};
	Info_AddChoice(dia_hokurn_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_hokurn_teach_1h_1);
};

func void dia_hokurn_teach_1h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,100);
	if(other.hitchance[NPC_TALENT_1H] >= 100)
	{
		b_hokurn_teachedenough();
	};
	Info_AddChoice(dia_hokurn_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_hokurn_teach_1h_5);
};


instance DIA_HOKURN_STAYHERE(C_INFO)
{
	npc = djg_712_hokurn;
	nr = 5;
	condition = dia_hokurn_stayhere_condition;
	information = dia_hokurn_stayhere_info;
	permanent = FALSE;
	description = "A co tady vlastn� d�l�?";
};


func int dia_hokurn_stayhere_condition()
{
	if(HOKURNGETSDRINK == TRUE)
	{
		return TRUE;
	};
};

func void dia_hokurn_stayhere_info()
{
	AI_Output(other,self,"DIA_Hokurn_StayHere_15_00");	//A co tady vlastn� d�l�?
	AI_Output(self,other,"DIA_Hokurn_StayHere_01_01");	//Nem�m tu�en�, pro� jsme sem p�i�li, nebo kdy to za�ne.
	AI_Output(self,other,"DIA_Hokurn_StayHere_01_02");	//A dokud m�m co p�t, ani se o to nestar�m.
};


instance DIA_HOKURN_WHEREDRAGON(C_INFO)
{
	npc = djg_712_hokurn;
	nr = 5;
	condition = dia_hokurn_wheredragon_condition;
	information = dia_hokurn_wheredragon_info;
	permanent = TRUE;
	description = "Tak v�, kde ty draci jsou?";
};


func int dia_hokurn_wheredragon_condition()
{
	if((HOKURNGETSDRINK == TRUE) && (HOKURNTELLSDRAGON == FALSE) && Npc_KnowsInfo(other,dia_hokurn_stayhere))
	{
		return TRUE;
	};
};

func void dia_hokurn_wheredragon_info()
{
	AI_Output(other,self,"DIA_Hokurn_WhereDragon_15_00");	//Tak v�, kde ty draci jsou?
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_01_01");	//Co z toho budu m�t, kdy� ti to �eknu?
	Info_ClearChoices(dia_hokurn_wheredragon);
	Info_AddChoice(dia_hokurn_wheredragon,"Nic, vyd�m se za nima s�m.",dia_hokurn_wheredragon_findmyself);
	Info_AddChoice(dia_hokurn_wheredragon,"Jsem ochoten ti za tu informaci zaplatit.",dia_hokurn_wheredragon_gold);
	if(Npc_HasItems(other,itfo_booze) >= 1)
	{
		Info_AddChoice(dia_hokurn_wheredragon,"Je�t� tu m�m l�hev ginu!",dia_hokurn_wheredragon_booze);
	};
};

func void dia_hokurn_wheredragon_findmyself()
{
	AI_Output(other,self,"DIA_Hokurn_WhereDragon_FindMyself_15_00");	//Nic, vyd�m se za nima s�m.
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_FindMyself_01_01");	//M�l by sis d�vat pozor. �ek� t� spousta boj�.
	Info_ClearChoices(dia_hokurn_wheredragon);
};

func void dia_hokurn_wheredragon_gold()
{
	AI_Output(other,self,"DIA_Hokurn_WhereDragon_Gold_15_00");	//Jsem ochoten ti za tu informaci zaplatit.
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_Gold_01_01");	//Zaplatit mi? Hmm. Za 200 zlat�ch ti to pov�m.
	Info_ClearChoices(dia_hokurn_wheredragon);
	Info_AddChoice(dia_hokurn_wheredragon,"To je moc!",dia_hokurn_wheredragon_toomuch);
	if(Npc_HasItems(other,itmi_gold) >= 200)
	{
		Info_AddChoice(dia_hokurn_wheredragon,"Tady jsou pen�ze!",dia_hokurn_wheredragon_ok);
	};
};

func void dia_hokurn_wheredragon_toomuch()
{
	AI_Output(other,self,"DIA_Hokurn_WhereDragon_TooMuch_15_00");	//To je moc!
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_TooMuch_01_01");	//Tak to na to zapome�.
	Info_ClearChoices(dia_hokurn_wheredragon);
};

func void dia_hokurn_wheredragon_ok()
{
	AI_Output(other,self,"DIA_Hokurn_WhereDragon_OK_15_00");	//Tady jsou pen�ze!
	b_giveinvitems(other,self,itmi_gold,200);
	HOKURNTELLSDRAGON = TRUE;
	Info_ClearChoices(dia_hokurn_wheredragon);
};

func void dia_hokurn_wheredragon_booze()
{
	AI_Output(other,self,"DIA_Hokurn_WhereDragon_Booze_15_00");	//Je�t� tu m�m l�hev ginu!
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_Booze_01_01");	//Za po��dnou pitku bych zabil v�echny draky sv�ta.
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_Booze_01_02");	//Souhlas. Dej sem tu l�hev!
	b_giveinvitems(other,self,itfo_booze,1);
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_Booze_01_03");	//Schov�m si ji na hor�� �asy.
	HOKURNTELLSDRAGON = TRUE;
	Info_ClearChoices(dia_hokurn_wheredragon);
};


instance DIA_HOKURN_DRAGON(C_INFO)
{
	npc = djg_712_hokurn;
	nr = 5;
	condition = dia_hokurn_dragon_condition;
	information = dia_hokurn_dragon_info;
	permanent = TRUE;
	description = "Dobr�, tak kde jsou ti draci?";
};


func int dia_hokurn_dragon_condition()
{
	if(HOKURNTELLSDRAGON == TRUE)
	{
		return TRUE;
	};
};

func void dia_hokurn_dragon_info()
{
	AI_Output(other,self,"DIA_Hokurn_Dragon_15_00");	//Dobr�, tak kde jsou ti draci?
	AI_Output(self,other,"DIA_Hokurn_Dragon_01_01");	//P�irozen� ti to ne�eknu �pln� p�esn�, ale sly�el jsem, �e by tu m�li b�t celkem �ty�i.
	AI_Output(self,other,"DIA_Hokurn_Dragon_01_02");	//V noci jsme zahl�dli nad nejvy��� horou rudou z��i.
	AI_Output(self,other,"DIA_Hokurn_Dragon_01_03");	//P��sah�m na hrob m� matky, pokud hled� draka, tak kdy� nikde jinde, tam ho ur�it� najde�.
};


instance DIA_HOKURN_ALLDRAGONSDEAD(C_INFO)
{
	npc = djg_712_hokurn;
	nr = 5;
	condition = dia_hokurn_alldragonsdead_condition;
	information = dia_hokurn_alldragonsdead_info;
	permanent = TRUE;
	description = "Zabil jsem v�echny draky.";
};


func int dia_hokurn_alldragonsdead_condition()
{
	if(MIS_ALLDRAGONSDEAD == TRUE)
	{
		return TRUE;
	};
};

func void dia_hokurn_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_Hokurn_AllDragonsDead_15_00");	//Zabil jsem v�echny draky.
	AI_Output(self,other,"DIA_Hokurn_AllDragonsDead_01_01");	//Ud�lej si v�let a vypr�v�j sv� poh�dky n�komu jin�mu.
};


instance DIA_HOKURN_PICKPOCKET(C_INFO)
{
	npc = djg_712_hokurn;
	nr = 900;
	condition = dia_hokurn_pickpocket_condition;
	information = dia_hokurn_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_hokurn_pickpocket_condition()
{
	return c_beklauen(69,210);
};

func void dia_hokurn_pickpocket_info()
{
	Info_ClearChoices(dia_hokurn_pickpocket);
	Info_AddChoice(dia_hokurn_pickpocket,DIALOG_BACK,dia_hokurn_pickpocket_back);
	Info_AddChoice(dia_hokurn_pickpocket,DIALOG_PICKPOCKET,dia_hokurn_pickpocket_doit);
};

func void dia_hokurn_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_hokurn_pickpocket);
};

func void dia_hokurn_pickpocket_back()
{
	Info_ClearChoices(dia_hokurn_pickpocket);
};

