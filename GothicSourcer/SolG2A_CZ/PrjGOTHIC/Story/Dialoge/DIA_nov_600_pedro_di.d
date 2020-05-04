
instance DIA_PEDRO_DI_EXIT(C_INFO)
{
	npc = nov_600_pedro_di;
	nr = 999;
	condition = dia_pedro_di_exit_condition;
	information = dia_pedro_di_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pedro_di_exit_condition()
{
	return TRUE;
};

func void dia_pedro_di_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PEDRO_DI_YOU(C_INFO)
{
	npc = nov_600_pedro_di;
	nr = 2;
	condition = dia_pedro_di_you_condition;
	information = dia_pedro_di_you_info;
	description = "Zrádce! Tak jsem tì koneènì našel.";
};


func int dia_pedro_di_you_condition()
{
	return TRUE;
};

func void dia_pedro_di_you_info()
{
	AI_Output(other,self,"DIA_Pedro_DI_YOU_15_00");	//Zrádce! Tak jsem tì koneènì našel.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(other,self,"DIA_Pedro_DI_YOU_15_01");	//Nemysli si, že se nad tebou slituji jen proto, že jsem jedním z paladinù.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(other,self,"DIA_Pedro_DI_YOU_15_02");	//Mnoho z nás, žoldnéøù, zaprodalo duši Beliarovi, a pøesto mi èasto neèiní dobøe pomyšlení na to, že je bez milosti zabíjíme. Ale u tebe, ty prašivá svinì, udìlám výjimku!
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Pedro_DI_YOU_15_03");	//Ze všech tìch bezpáteøních parchantù, které jsem ve svém životì potkal, jsi ty ten naprosto nejhorší. Jsi hanbou našeho øádu.
	};
	AI_Output(other,self,"DIA_Pedro_DI_YOU_15_04");	//Mìl bych tì na místì zabít.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_09_05");	//Zadrž. Prosím. Oèarovali mì. Nikdy bych nezradil klášter o své vlastní vùli.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_09_06");	//Ani netušíš, èím vším jsem musel bìhem posledních nìkolika dní projít. Dali mi do hlavy ten hlas. Nemohl jsem se tomu ubránit.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_09_07");	//Skøetí plukovník mne celé dny vyslýchal. Poøád mne bil. Ušetøi mne. Jsem nevinný. Musíš mi vìøit.
	Info_ClearChoices(dia_pedro_di_you);
	Info_AddChoice(dia_pedro_di_you,"Tak mi øekni, co víš.",dia_pedro_di_you_verschon);
	Info_AddChoice(dia_pedro_di_you,"Vùbec nic nemusím. Na místì tì zabiju.",dia_pedro_di_you_tot);
	Info_AddChoice(dia_pedro_di_you,"Ukaž mi jediný dùvod, proè bych ti mìl vìøit.",dia_pedro_di_you_grund);
	if(MIS_GORAX_KILLPEDRO == LOG_RUNNING)
	{
		Info_AddChoice(dia_pedro_di_you,"Serpentes mi pøikázal, abych tì zabil.",dia_pedro_di_you_serpentes);
	};
};

func void dia_pedro_di_you_grund()
{
	AI_Output(other,self,"DIA_Pedro_DI_YOU_grund_15_00");	//Ukaž mi jediný dùvod, proè bych ti mìl vìøit.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_grund_09_01");	//(úpìnlivì) Nech mì žít. Mùžu ti dát informaci, s jejíž pomocí se odsud dostaneš. Musíš mì vyslechnout.
};


var int pedrodi_flee;

func void dia_pedro_di_you_tot()
{
	AI_Output(other,self,"DIA_Pedro_DI_YOU_tot_15_00");	//Vùbec nic nemusím. Na místì tì zabiju.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_tot_09_01");	//U všech bohù...
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Ship");
	b_attack(self,other,AR_NONE,1);
	PEDRODI_FLEE = LOG_RUNNING;
};

func void dia_pedro_di_you_serpentes()
{
	AI_Output(other,self,"DIA_Pedro_DI_YOU_Serpentes_15_00");	//Serpentes mi dal rozkaz, abych tì zabil. Už jenom z principu udìlám to, co mi bylo øeèeno.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_Serpentes_09_01");	//(úpìnlivì) Prosím, ne. To nemùžeš udìlat. Mùžu ti být k užitku. Nejednej ukvapenì.
	b_giveplayerxp(XP_PEDRO_SERPENTESMISSION);
	MIS_GORAX_KILLPEDRO = LOG_SUCCESS;
};

func void dia_pedro_di_you_verschon()
{
	AI_Output(other,self,"DIA_Pedro_DI_YOU_verschon_15_00");	//Tak mi øekni, co víš.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_verschon_09_01");	//(uklidnìnì) Ano, samozøejmì. Øeknu ti všechno, co budeš chtít. Pod jednou podmínkou. Musíš mì dostat z tohoto prokletého ostrova, souhlasíš?
	Info_ClearChoices(dia_pedro_di_you);
	Info_AddChoice(dia_pedro_di_you,"Vùbec nic nemusím. Na místì tì zabiju.",dia_pedro_di_you_tot);
	Info_AddChoice(dia_pedro_di_you,"No dobøe. Pojï se mnou, vezmu tì na svou loï.",dia_pedro_di_you_followship);
};


var int mis_pedro_di_followship;

func void dia_pedro_di_you_followship()
{
	AI_Output(other,self,"DIA_Pedro_DI_YOU_FollowShip_15_00");	//Dobrá. Pojï za mnou, odvedu tì na loï.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_FollowShip_09_01");	//Máš mé díky. Nebudeš toho litovat.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowShip");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	MIS_PEDRO_DI_FOLLOWSHIP = LOG_RUNNING;
};


instance DIA_PEDRO_DI_ARRIVEDATSHIP(C_INFO)
{
	npc = nov_600_pedro_di;
	nr = 4;
	condition = dia_pedro_di_arrivedatship_condition;
	information = dia_pedro_di_arrivedatship_info;
	description = "Tak jsme tady!";
};


func int dia_pedro_di_arrivedatship_condition()
{
	if((Npc_GetDistToWP(self,"SHIP") < 6000) && (MIS_PEDRO_DI_FOLLOWSHIP == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_pedro_di_arrivedatship_info()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_15_00");	//Tak jsme tady!
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_09_01");	//Máš opravdu pùsobivou loï. Jsi opravdu vynikající vùdce.
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_15_02");	//Pøestaò blábolit. Øekni mi koneènì to, co chci vìdìt.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_09_03");	//Ech, samozøejmì. Kde bych mìl zaèít?
	Info_ClearChoices(dia_pedro_di_arrivedatship);
	Info_AddChoice(dia_pedro_di_arrivedatship,"Už jsem slyšel dost. Bìž si najít místo na mé lodi. Ještì poøád mám dost práce.",dia_pedro_di_arrivedatship_back);
	Info_AddChoice(dia_pedro_di_arrivedatship,"Jak je možné dostat se dovnitø ostrova?",dia_pedro_di_arrivedatship_innere);
	Info_AddChoice(dia_pedro_di_arrivedatship,"Jaké pøíšery se pohybují po tomto ostrovì?",dia_pedro_di_arrivedatship_monster);
	Info_AddChoice(dia_pedro_di_arrivedatship,"Co bylo s tím skøetím plukovníkem?",dia_pedro_di_arrivedatship_orkoberst);
};

func void dia_pedro_di_arrivedatship_orkoberst()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_OrkOberst_15_00");	//Co bylo s tím skøetím plukovníkem?
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_01");	//Znièil mou poslední jiskøièku nadìje, že ještì nìkdy spatøím svou domovinu.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_02");	//Od chvíle, co jsem sem pøišel, mì vyslýchal ohlednì strategického rozmístìní paladinù v Khorinisu.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_03");	//Samozøejmì, že jsem mu o tom mnoho neøekl. Jak bych také mohl, sakra? Vždy jsem u ohnivých jenom novic.
	if(Npc_IsDead(orkelite_antipaladinorkoberst_di))
	{
		Info_AddChoice(dia_pedro_di_arrivedatship,"Skøetí plukovník je mrtvý.",dia_pedro_di_arrivedatship_obersttot);
	};
};

func void dia_pedro_di_arrivedatship_monster()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_Monster_15_00");	//Jaké pøíšery se pohybují po tomto ostrovì?
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Monster_09_01");	//Bìhem dne mùžeš èasto vidìt, jak k pobøeží míøí ještìrani. Obvykle nesou nìjaká ohromná vejce.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Monster_09_02");	//Moc jsem toho ve své cele nepochytil, ale myslím, že se chystají k odjezdu z ostrova.
};

func void dia_pedro_di_arrivedatship_innere()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_Innere_15_00");	//Jak je možné dostat se dovnitø ostrova?
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_01");	//V trùnním sálu skøetího plukovníka je tajná chodba.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_02");	//Vlekli mì tam pokaždé, když mì chtìl vyslýchat. Vidìl jsem, že tam je.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_03");	//Jeden ze šamanù spustil mechanismus tak, že zatáhnul za jednu z pochodní visících na zdi v chodbì.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_04");	//Hmm. Myslím, že nejprve zatáhl za pochodeò nalevo a pak napravo, ale možná si to nepamatuju úplnì pøesnì.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_05");	//V zadní èásti se náhle otevøel prùchod, který vedl hluboko do hory.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_06");	//Bohužel nevím, kde ta chodba konèí.
};

func void dia_pedro_di_arrivedatship_obersttot()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_OberstTot_15_00");	//Skøetí plukovník je mrtvý.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_OberstTot_09_01");	//Mrtvý? Innos budiž pochválen. Na ten jeho pøíšerný oblièej nikdy nezapomenu.
};

func void dia_pedro_di_arrivedatship_back()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_Back_15_00");	//Už jsem slyšel dost. Bìž si najít místo na mé lodi. Ještì poøád mám dost práce.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Back_09_01");	//Nech tì Innosova síla provází. Budu se za tebe modlit.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Ship");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
};


instance DIA_PEDRO_DI_PERM(C_INFO)
{
	npc = nov_600_pedro_di;
	nr = 5;
	condition = dia_pedro_di_perm_condition;
	information = dia_pedro_di_perm_info;
	permanent = TRUE;
	description = "Unavený?";
};


var int pedrodi_talknomore;

func int dia_pedro_di_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_pedro_di_you) && (PEDRODI_TALKNOMORE == FALSE))
	{
		return TRUE;
	};
};

func void dia_pedro_di_perm_info()
{
	AI_Output(other,self,"DIA_Pedro_DI_PERM_15_00");	//Unavený?
	if(Npc_GetDistToWP(self,"SHIP_DECK_05") < 1000)
	{
		if(PEDRODI_FLEE == LOG_RUNNING)
		{
			AI_Output(other,self,"DIA_Pedro_DI_PERM_15_01");	//Chtìl bys snad, abych ti pøinesl polštáø?
			AI_Output(self,other,"DIA_Pedro_DI_PERM_09_02");	//Nech mì být, prosím. Potichu si tady sednu a ani nepípnu.
			AI_Output(other,self,"DIA_Pedro_DI_PERM_15_03");	//Hmm.
			b_giveplayerxp(XP_AMBIENT);
			PEDRODI_FLEE = LOG_SUCCESS;
		}
		else if(Npc_IsDead(dragon_undead))
		{
			AI_Output(self,other,"DIA_Pedro_DI_PERM_09_04");	//Jsem úplnì odrovnaný.
			AI_Output(other,self,"DIA_Pedro_DI_PERM_15_05");	//Sbal si svých pìt švestek. Brzy zase vyrazíme na moøe.
			AI_Output(self,other,"DIA_Pedro_DI_PERM_09_06");	//Díky, chlape. Už jsem si myslel, že se svalím z lavice rovnou na zem. Dobrou noc.
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"SleepShip");
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			PEDRODI_TALKNOMORE = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Pedro_DI_PERM_09_07");	//To je v poøádku. Díky.
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Pedro_DI_PERM_09_08");	//Prosím. Nech mì žít!
		AI_StopProcessInfos(self);
	};
};

