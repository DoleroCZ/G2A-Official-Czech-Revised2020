
instance DIA_MILTENNW_EXIT(C_INFO)
{
	npc = pc_mage_nw;
	nr = 999;
	condition = dia_miltennw_exit_condition;
	information = dia_miltennw_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_miltennw_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_miltennw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MILTENNW_KAP3_EXIT(C_INFO)
{
	npc = pc_mage_nw;
	nr = 999;
	condition = dia_miltennw_kap3_exit_condition;
	information = dia_miltennw_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_miltennw_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_miltennw_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MILTENNW_KAP3_HELLO(C_INFO)
{
	npc = pc_mage_nw;
	nr = 31;
	condition = dia_miltennw_kap3_hello_condition;
	information = dia_miltennw_kap3_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_miltennw_kap3_hello_condition()
{
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_miltennw_kap3_hello_info()
{
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_00");	//(nevÏ¯ÌcnÏ) Nejde mi to na rozum. Opravdu jsi paladin?
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_01");	//EvidentnÏ.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_02");	//(euforicky) Pokud je mezi paladiny nÏkdo jako ty, mÏli by se mÌt Beliarovi poh˘nci radöi na pozoru.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_03");	//Jestli jsi porazil Sp·Ëe, nemÏlo by ti p·r sk¯et˘ dÏlat sebemenöÌ potÌûe.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_04");	//Ve h¯e nejsou jenom sk¯eti.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_05");	//To vÌm, ale i tak je dobrÈ tÏ mÌt na svÈ stranÏ.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_06");	//No dobr·.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_07");	//Co dÏl·ö tady v kl·öte¯e? Nech mÏ h·dat. Chceö se uËit umÏnÌ magie.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_08");	//Moûn·.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_09");	//VÏdÏl jsem to - bÏû si promluvit s Mardukem, on je zodpovÏdn˝ za v·s paladiny. Najdeö ho p¯ed kaplÌ.
	};
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_10");	//VidÌm, ûe ty ¯eËi mÏly pravdu.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_11");	//JakÈ ¯eËi?
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_12");	//ée ses spolËil s tÏmi drakobijci.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_13");	//No, nikdy jsi nebyl dobr˝ materi·l pro cÌrkev. Aù je to ale jak chce, bojujeö za naöi vÏc a to je to, co se poËÌt·.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_14");	//Je to vöe?
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_15");	//M·m samoz¯ejmÏ radost, a vypad·ö tak, ûe se tÏ musÌ kaûd˝ sk¯et hned leknout.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_16");	//Ve h¯e nejsou jenom sk¯eti.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_17");	//To vÌm, ale i tak s nimi jsou problÈmy. Jsi velmi d˘leûit˝.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_18");	//Porazil jsi Sp·Ëe. Moûn· jednoho dne budeme vöichni pot¯ebovat pomoc.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_19");	//No dobr·.
	};
};


instance DIA_MILTENNW_MONASTERY(C_INFO)
{
	npc = pc_mage_nw;
	nr = 35;
	condition = dia_miltennw_monastery_condition;
	information = dia_miltennw_monastery_info;
	permanent = FALSE;
	description = "Jak ses dostal do kl·ötera tak rychle?";
};


func int dia_miltennw_monastery_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_miltennw_monastery_info()
{
	AI_Output(other,self,"DIA_MiltenNW_Monastery_15_00");	//Jak ses dostal do kl·ötera tak rychle?
	AI_Output(self,other,"DIA_MiltenNW_Monastery_03_01");	//Co je to za ot·zku? ProplÌûil jsem se pr˘smykem a namÌ¯il si to rovnou do kl·ötera.
	AI_Output(self,other,"DIA_MiltenNW_Monastery_03_02");	//P¯izn·v·m, ûe nebylo vûdycky snadnÈ proklouznout mezi tÏmi vöemi p¯Ìöerami, kterÈ se zabydlujÌ na tÈhle stranÏ ˙dolÌ, ale p¯ece jenom jsem mÏl mÌÚ problÈm˘, neû jsem Ëekal.
};


instance DIA_MILTENNW_FOURFRIENDS(C_INFO)
{
	npc = pc_mage_nw;
	nr = 35;
	condition = dia_miltennw_fourfriends_condition;
	information = dia_miltennw_fourfriends_info;
	permanent = FALSE;
	description = "VÌö, kde jsou ostatnÌ?";
};


func int dia_miltennw_fourfriends_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_miltennw_fourfriends_info()
{
	AI_Output(other,self,"DIA_MiltenNW_FourFriends_15_00");	//VÌö, kde jsou ostatnÌ?
	if(Npc_IsDead(pc_fighter_nw_vor_djg) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_01");	//Zd· se, ûe Gorn se vypo¯·dal s pobytem v GarondovÏ vÏzenÌ docela dob¯e.
		if(MIS_RESCUEGORN != LOG_SUCCESS)
		{
			AI_Output(other,self,"DIA_MiltenNW_FourFriends_15_02");	//Jak se dostal ven?
			AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_03");	//Musel jsem Garondovi trochu zalhat, abych ho p¯esvÏdËil, ûe m· obvinÏnÌ st·hnout.
			AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_04");	//Ale bude to jen mezi n·mi, rozumÏno?
		};
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_05");	//Kaûdop·dnÏ chtÏl jÌt za Leem a podÌvat se, co se dÏje na farmÏ.
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_06");	//Po tom blivajzu, co dost·val ve vÏzenÌ, se urËitÏ cpe ze vöech sil. To bude pro z·soby ûoldnÈ¯˘ tÏûk· zkouöka.
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_07");	//Gorn to nep¯eûil.
	};
	if(Npc_IsDead(pc_thief_nw) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_08");	//Diego mumlal nÏco o z˙Ëtov·nÌ. NetuöÌm, co mÏl na mysli.
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_09");	//Ale ¯ekl bych, ûe je ve mÏstÏ. Zn·ö ho - vûdycky se nÏco najde.
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_10");	//Diego to koupil - zd· se, ûe ho bariÈra p¯ece jenom dostala.
	};
};


instance DIA_MILTENNW_KAP3_ENTRY(C_INFO)
{
	npc = pc_mage_nw;
	nr = 32;
	condition = dia_miltennw_kap3_entry_condition;
	information = dia_miltennw_kap3_entry_info;
	permanent = TRUE;
	description = "Pot¯ebuji se dostat do kl·ötera. Je to d˘leûitÈ!";
};


func int dia_miltennw_kap3_entry_condition()
{
	if((KAPITEL == 3) && (hero.guild != GIL_KDF) && (MILTENNW_GIVESMONASTERYKEY == FALSE))
	{
		return TRUE;
	};
};

func void dia_miltennw_kap3_entry_info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Entry_15_00");	//Pot¯ebuji se dostat do kl·ötera. Je to d˘leûitÈ!
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_03_01");	//Ano, jistÏ. Tady je klÌË.
		CreateInvItems(self,itke_innos_mis,1);
		b_giveinvitems(self,other,itke_innos_mis,1);
		MILTENNW_GIVESMONASTERYKEY = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_03_02");	//Nem˘ûu tÏ do kl·ötera vpustit. MÏl bych problÈmy p¯ed NejvyööÌ radou.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_03_03");	//Bez povolenÌ m˝ch nad¯Ìzen˝ch nesmÌm do kl·ötera nikoho vpouötÏt.
		Info_ClearChoices(dia_miltennw_kap3_entry);
		Info_AddChoice(dia_miltennw_kap3_entry,DIALOG_BACK,dia_miltennw_kap3_entry_back);
		Info_AddChoice(dia_miltennw_kap3_entry,"Je to d˘leûitÈ!",dia_miltennw_kap3_entry_important);
		if(Npc_HasItems(other,itwr_permissiontowearinnoseye_mis) >= 1)
		{
			Info_AddChoice(dia_miltennw_kap3_entry,"P¯in·öÌm dopis od lorda Hagena.",dia_miltennw_kap3_entry_permit);
		};
	};
};

func void dia_miltennw_kap3_entry_back()
{
	Info_ClearChoices(dia_miltennw_kap3_entry);
};

func void dia_miltennw_kap3_entry_important()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Entry_Important_15_00");	//Je to d˘leûitÈ!
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_Important_03_01");	//To nep˘jde. Pyrokar by mi utrhl hlavu.
	Info_ClearChoices(dia_miltennw_kap3_entry);
};

func void dia_miltennw_kap3_entry_permit()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Entry_Permit_15_00");	//P¯in·öÌm dopis od lorda Hagena.
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_Permit_03_01");	//Ukaû mi ho.
	b_giveinvitems(other,self,itwr_permissiontowearinnoseye_mis,1);
	b_usefakescroll();
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_Permit_03_02");	//(v·havÏ) Dobr·. Tady je klÌË od kl·ötera. Pyrokar je v kostele.
	CreateInvItems(self,itke_innos_mis,1);
	b_giveinvitems(self,other,itke_innos_mis,1);
	b_giveinvitems(self,other,itwr_permissiontowearinnoseye_mis,1);
	MILTENNW_GIVESMONASTERYKEY = TRUE;
	Info_ClearChoices(dia_miltennw_kap3_entry);
};


instance DIA_MILTENNW_KAP3_NOVIZENCHASE(C_INFO)
{
	npc = pc_mage_nw;
	nr = 31;
	condition = dia_miltennw_kap3_novizenchase_condition;
	information = dia_miltennw_kap3_novizenchase_info;
	permanent = FALSE;
	description = "NevÌö, kde je Pedro?";
};


func int dia_miltennw_kap3_novizenchase_condition()
{
	if((KAPITEL == 3) && (MIS_NOVIZENCHASE == LOG_RUNNING) && (MIS_SCKNOWSINNOSEYEISBROKEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_miltennw_kap3_novizenchase_info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_NovizenChase_15_00");	//NevÌö, kde je Pedro?
	AI_Output(self,other,"DIA_MiltenNW_KAP3_NovizenChase_03_01");	//MyslÌö, ûe bych tady jen tak st·l, kdybych vÏdÏl, kde se ten odpadlÌk schov·v·?
	AI_Output(self,other,"DIA_MiltenNW_KAP3_NovizenChase_03_02");	//MusÌ zaplatit za svÈ Ëiny. Douf·m, ûe se n·m poda¯Ì dostat Oko zp·tky.
	AI_Output(self,other,"DIA_MiltenNW_KAP3_NovizenChase_03_03");	//MusÌö n·m pomoci. Najdi ho a p¯ines zpÏt Innosovo oko.
};


instance DIA_MILTENNW_KAP3_PERM(C_INFO)
{
	npc = pc_mage_nw;
	nr = 39;
	condition = dia_miltennw_kap3_perm_condition;
	information = dia_miltennw_kap3_perm_info;
	permanent = FALSE;
	description = "NevÌö nÏco o tÏch postav·ch v k·pÌch?";
};


func int dia_miltennw_kap3_perm_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_miltennw_kap3_perm_info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Perm_15_00");	//NevÌö nÏco o tÏch postav·ch v k·pÌch?
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Perm_03_01");	//Ne, ale nem·m z tÏch chlapÌk˘ dobr˝ pocit.
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Perm_03_02");	//Pokud na nÏ narazÌö, buÔ opatrn˝.
};


instance DIA_MILTENNW_KAP4_EXIT(C_INFO)
{
	npc = pc_mage_nw;
	nr = 999;
	condition = dia_miltennw_kap4_exit_condition;
	information = dia_miltennw_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_miltennw_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_miltennw_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MILTENNW_KAP4_PERM(C_INFO)
{
	npc = pc_mage_nw;
	nr = 49;
	condition = dia_miltennw_kap4_perm_condition;
	information = dia_miltennw_kap4_perm_info;
	permanent = TRUE;
	description = "Co je novÈho?";
};


func int dia_miltennw_kap4_perm_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_miltennw_kap4_perm_info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP4_PERM_15_00");	//Co je novÈho?
	AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_01");	//Na to bych se mÏl zeptat j·. M·me tady dost starostÌ.
	AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_02");	//NejvyööÌ rada se snaûÌ zjistit, co nep¯Ìtel udÏl· p¯ÌötÏ.
	AI_Output(other,self,"DIA_MiltenNW_KAP4_PERM_15_03");	//NÏco dalöÌho?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_04");	//V poslednÌ dobÏ jsou ˙toky sk¯et˘ ËastÏjöÌ, dokonce i mimo HornickÈ ˙dolÌ.
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_05");	//V˘bec se mi to nechce lÌbit - myslÌm, ûe uû nem·me moc Ëasu.
	}
	else if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_06");	//Jeden farm·¯ ¯Ìkal, ûe poblÌû jeho farmy se objevila nÏjak· öupinat· stvo¯enÌ.
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_07");	//NevÌm, jak˝ to d·v· dohromady smysl, ale m·m pocit, ûe nep¯Ìtel nÏco chyst·.
	}
	else if(MIS_FINDTHEOBESESSED == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_08");	//Dost·v·me ËÌm d·l tÌm vÌc zpr·v o posedl˝ch lidech. Nep¯Ìtel je siln˝, silnÏjöÌ, neû jsme Ëekali.
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_09");	//Ne, situace je st·le v·ûn·. JedinÈ co m˘ûeme dÏlat, je vÏ¯it v Innose.
	};
};


instance DIA_MILTENNW_KAP5_EXIT(C_INFO)
{
	npc = pc_mage_nw;
	nr = 999;
	condition = dia_miltennw_kap5_exit_condition;
	information = dia_miltennw_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_miltennw_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_miltennw_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MILTENNW_ALLDRAGONSDEAD(C_INFO)
{
	npc = pc_mage_nw;
	nr = 900;
	condition = dia_miltennw_alldragonsdead_condition;
	information = dia_miltennw_alldragonsdead_info;
	permanent = FALSE;
	description = "Pobil jsem vöechny draky.";
};


func int dia_miltennw_alldragonsdead_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_miltennw_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_MiltenNW_AllDragonsDead_15_00");	//Pobil jsem vöechny draky.
	AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_01");	//V·ûnÏ? Takûe nadÏje p¯ece jenom jeötÏ ûije. TeÔ uû zb˝v· jen useknout Zlu hlavu.
	AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_02");	//Pokud jsi to v·ûnÏ dok·zal, mohli bychom v·lku vyhr·t.
	AI_Output(other,self,"DIA_MiltenNW_AllDragonsDead_15_03");	//Kdo, j·?
	AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_04");	//Samoz¯ejmÏ, ûe ty. Kdo jin˝?
	if(MILTENNW_ISONBOARD == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_05");	//MÏli bychom brzy vyrazit, d¯Ìv neû bude pozdÏ.
	};
};


instance DIA_MILTENNW_SCWASINLIB(C_INFO)
{
	npc = pc_mage_nw;
	nr = 3;
	condition = dia_miltennw_scwasinlib_condition;
	information = dia_miltennw_scwasinlib_info;
	important = TRUE;
};


func int dia_miltennw_scwasinlib_condition()
{
	if(MIS_SCKNOWSWAYTOIRDORATH == TRUE)
	{
		return TRUE;
	};
};

func void dia_miltennw_scwasinlib_info()
{
	AI_Output(self,other,"DIA_MiltenNW_SCWasInLib_03_00");	//Hej, slyöel jsem, ûe jsi str·vil dlouh˝ Ëas v kl·öternÌch sklepech. Co jsi zjistil?
};


instance DIA_MILTENNW_KNOWWHEREENEMY(C_INFO)
{
	npc = pc_mage_nw;
	nr = 55;
	condition = dia_miltennw_knowwhereenemy_condition;
	information = dia_miltennw_knowwhereenemy_info;
	permanent = TRUE;
	description = "VÌm, kde se nep¯Ìtel ukr˝v·. Je to mal˝ ostr˘vek nedaleko odsud.";
};


func int dia_miltennw_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (MILTENNW_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};


var int sctoldmiltenheknowwhereenemy;

func void dia_miltennw_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_15_00");	//VÌm, kde se nep¯Ìtel ukr˝v·. Je to mal˝ ostr˘vek nedaleko odsud.
	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_01");	//To je naöe velk· öance. MusÌme okamûitÏ vyrazit a zniËit zlo jednou provûdy.
	SCTOLDMILTENHEKNOWWHEREENEMY = TRUE;
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	if(Npc_IsDead(diegonw) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_02");	//Mluvil jsi o tom s Diegem? MyslÌm, ûe by chtÏl jet s tebou.
		b_logentry(TOPIC_CREW,"Diego mi m˘ûe velmi pomoci - nikdy dlouho nepobyl na jednom mÌstÏ.");
	};
	if(Npc_IsDead(gornnw_nach_djg) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_03");	//A co Gorn? Promluv si s nÌm. Slyöel jsem, ûe se vr·til z HornickÈho ˙dolÌ.
		b_logentry(TOPIC_CREW,"Gorn by mi jistÏ byl takÈ zdatn˝m pomocnÌkem. Nikdy neuökodÌ, m·ö-li po boku zdatnÈho bojovnÌka. Snad by mÏ mohl trochu vycviËit.");
	};
	if(Npc_IsDead(lester) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_04");	//A nezapomeÚ na Lestera. Pokud ho nevyt·hneö z toho jeho ˙dolÌ, tak tam shnije.
		b_logentry(TOPIC_CREW,"Jestli Lestera nevezmu s sebou, nejspÌö se z tohoto ˙dolÌ nikdy nedostane.");
	};
	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_05");	//Zn·m takÈ svou vlastnÌ roli, kterou bych mÏl hr·t. Aû budeme Ëelit nep¯Ìteli, m˘ûu ti posÌlit magickou energii a pom·hat ti p¯i vytv·¯enÌ run. Kdy zaËneme?
	b_logentry(TOPIC_CREW,"P˘jde-li Milten se mnou, m˘ûe mÏ nauËit, jak vyr·bÏt runy a zv˝öit si z·soby many.");
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_15_06");	//Ne tak rychle, uû m·m dost lidÌ.
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_07");	//VÌö, ûe bych s tebou öel. Pokud si to rozmyslÌö, budu tady na tebe Ëekat.
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_08");	//HodnÏ ötÏstÌ, a aù nad tebou Innos drûÌ ochrannou ruku.
	}
	else
	{
		Info_ClearChoices(dia_miltennw_knowwhereenemy);
		Info_AddChoice(dia_miltennw_knowwhereenemy,"V tuhle chvÌli pro tebe nem·m vyuûitÌ.",dia_miltennw_knowwhereenemy_no);
		Info_AddChoice(dia_miltennw_knowwhereenemy,"VÌtej na palubÏ!",dia_miltennw_knowwhereenemy_yes);
	};
};

func void dia_miltennw_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_Yes_15_00");	//VÌtej na palubÏ!
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_Yes_15_01");	//Setk·me se v p¯Ìstavu. PoËkej tam na mÏ.
	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_Yes_03_02");	//Dobr·. Budu tam, aû budeö p¯ipraven.
	self.flags = NPC_FLAG_IMMORTAL;
	MILTENNW_ISONBOARD = LOG_SUCCESS;
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(dia_miltennw_knowwhereenemy);
};

func void dia_miltennw_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_No_15_00");	//V tuhle chvÌli pro tebe nem·m vyuûitÌ.
	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_No_03_01");	//VÌö, ûe bych to s tebou t·hl aû do konce. Pokud si to rozmyslÌö, budu tady na tebe Ëekat.
	MILTENNW_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_miltennw_knowwhereenemy);
};


instance DIA_MILTENNW_WHERECAPTAIN(C_INFO)
{
	npc = pc_mage_nw;
	nr = 3;
	condition = dia_miltennw_wherecaptain_condition;
	information = dia_miltennw_wherecaptain_info;
	description = "Kde bych mÏl hledat kapit·na?";
};


func int dia_miltennw_wherecaptain_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (SCTOLDMILTENHEKNOWWHEREENEMY == TRUE) && (SCGOTCAPTAIN == FALSE))
	{
		return TRUE;
	};
};

func void dia_miltennw_wherecaptain_info()
{
	AI_Output(other,self,"DIA_MiltenNW_WhereCaptain_15_00");	//Kde bych mÏl hledat kapit·na?
	AI_Output(self,other,"DIA_MiltenNW_WhereCaptain_03_01");	//Zeptej se Jorgena. Je to konec konc˘ n·mo¯nÌk. MÏl by b˝t jeötÏ po¯·d v kl·öte¯e.
	AI_Output(self,other,"DIA_MiltenNW_WhereCaptain_03_02");	//Ale jestli ti nebude schopen pomoci, budeö muset hledat nÏkoho, kdo by ti ¯Ìdil loÔ, na farm·ch nebo ve mÏstÏ.
	AI_Output(self,other,"DIA_MiltenNW_WhereCaptain_03_03");	//NejlepöÌ asi bude promluvit si s Leem nebo jÌt do p¯Ìstavu v Khorinisu. Nic lepöÌho mÏ teÔ nenapad·.
	Log_CreateTopic(TOPIC_CAPTAIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CAPTAIN,LOG_RUNNING);
	b_logentry(TOPIC_CAPTAIN,"Snad by se mi mohlo poda¯it najmout kapit·na - Jorgena. MÏl by se jeötÏ zdrûovat v kl·öte¯e. KromÏ nÏho bych mÏl na statcÌch Ëi ve mÏstÏ natrefit i na jinÈ kandid·ty na tuto funkci. Snad bych si mohl promluvit s Leem nebo se poptat po p¯Ìstavu.");
};


instance DIA_MILTENNW_LEAVEMYSHIP(C_INFO)
{
	npc = pc_mage_nw;
	nr = 55;
	condition = dia_miltennw_leavemyship_condition;
	information = dia_miltennw_leavemyship_info;
	permanent = TRUE;
	description = "Nakonec tÏ p¯ece jenom nem˘ûu vzÌt s sebou.";
};


func int dia_miltennw_leavemyship_condition()
{
	if((MILTENNW_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_miltennw_leavemyship_info()
{
	AI_Output(other,self,"DIA_MiltenNW_LeaveMyShip_15_00");	//Nakonec tÏ p¯ece jenom nem˘ûu vzÌt s sebou.
	AI_Output(self,other,"DIA_MiltenNW_LeaveMyShip_03_01");	//S·m musÌö nejlÌp vÏdÏt, koho budeö pot¯ebovat. Pokud si to rozmyslÌö, budu na tebe Ëekat v kl·öte¯e.
	MILTENNW_ISONBOARD = LOG_OBSOLETE;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_MILTENNW_STILLNEEDYOU(C_INFO)
{
	npc = pc_mage_nw;
	nr = 55;
	condition = dia_miltennw_stillneedyou_condition;
	information = dia_miltennw_stillneedyou_info;
	permanent = TRUE;
	description = "Pot¯ebuji tÏ.";
};


func int dia_miltennw_stillneedyou_condition()
{
	if(((MILTENNW_ISONBOARD == LOG_OBSOLETE) || (MILTENNW_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_miltennw_stillneedyou_info()
{
	AI_Output(other,self,"DIA_MiltenNW_StillNeedYou_15_00");	//Pot¯ebuji tÏ.
	AI_Output(self,other,"DIA_MiltenNW_StillNeedYou_03_01");	//Bude mi ctÌ. PojÔme, nem·me Ëasu nazbyt.
	AI_Output(self,other,"DIA_MiltenNW_StillNeedYou_03_02");	//Jdu do p¯Ìstavu. Potk·me se tam.
	self.flags = NPC_FLAG_IMMORTAL;
	MILTENNW_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	AI_StopProcessInfos(self);
};


instance DIA_MILTENNW_TEACH(C_INFO)
{
	npc = pc_mage_nw;
	nr = 90;
	condition = dia_miltennw_teach_condition;
	information = dia_miltennw_teach_info;
	permanent = TRUE;
	description = "Chci se nauËit nÏjak· nov· kouzla.";
};


func int dia_miltennw_teach_condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_miltennw_teach_info()
{
	AI_Output(other,self,"DIA_MiltenNW_Teach_15_00");	//Chci se nauËit nÏjak· nov· kouzla.
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_ClearChoices(dia_miltennw_teach);
		Info_AddChoice(dia_miltennw_teach,DIALOG_BACK,dia_miltennw_teach_back);
		if(PLAYER_TALENT_RUNES[SPL_WINDFIST] == FALSE)
		{
			Info_AddChoice(dia_miltennw_teach,b_buildlearnstring(NAME_SPL_WINDFIST,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_WINDFIST)),dia_miltennw_teach_windfist);
		};
		if(PLAYER_TALENT_RUNES[SPL_INSTANTFIREBALL] == FALSE)
		{
			Info_AddChoice(dia_miltennw_teach,b_buildlearnstring(NAME_SPL_INSTANTFIREBALL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_INSTANTFIREBALL)),dia_miltennw_teach_feuerball);
		};
		if(PLAYER_TALENT_RUNES[SPL_ICEBOLT] == FALSE)
		{
			Info_AddChoice(dia_miltennw_teach,b_buildlearnstring(NAME_SPL_ICEBOLT,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ICEBOLT)),dia_miltennw_teach_eispfeil);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_Teach_03_01");	//JeötÏ jsi nepostoupil do druhÈho MagickÈho kruhu. NenÌ nic, co bych tÏ mohl nauËit.
	};
};

func void dia_miltennw_teach_back()
{
	Info_ClearChoices(dia_miltennw_teach);
};

func void dia_miltennw_teach_windfist()
{
	b_teachplayertalentrunes(self,other,SPL_WINDFIST);
};

func void dia_miltennw_teach_feuerball()
{
	b_teachplayertalentrunes(self,other,SPL_INSTANTFIREBALL);
};

func void dia_miltennw_teach_eispfeil()
{
	b_teachplayertalentrunes(self,other,SPL_ICEBOLT);
};


instance DIA_MILTENNW_MANA(C_INFO)
{
	npc = pc_mage_nw;
	nr = 100;
	condition = dia_miltennw_mana_condition;
	information = dia_miltennw_mana_info;
	permanent = TRUE;
	description = "ChtÏl bych posÌlit svoji magickou moc.";
};


func int dia_miltennw_mana_condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_miltennw_mana_info()
{
	AI_Output(other,self,"DIA_MiltenNW_Mana_15_00");	//ChtÏl bych posÌlit svoji magickou moc.
	Info_ClearChoices(dia_miltennw_mana);
	Info_AddChoice(dia_miltennw_mana,DIALOG_BACK,dia_miltennw_mana_back);
	Info_AddChoice(dia_miltennw_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_miltennw_mana_1);
	Info_AddChoice(dia_miltennw_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_miltennw_mana_5);
};

func void dia_miltennw_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output(self,other,"DIA_MiltenNW_Mana_03_00");	//Tvoje magickÈ sÌly jsou velkÈ. Moc velkÈ na to, abych ti je pomohl jeötÏ zv˝öit.
	};
	Info_ClearChoices(dia_miltennw_mana);
};

func void dia_miltennw_mana_1()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,1,T_MED);
	Info_ClearChoices(dia_miltennw_mana);
	Info_AddChoice(dia_miltennw_mana,DIALOG_BACK,dia_miltennw_mana_back);
	Info_AddChoice(dia_miltennw_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_miltennw_mana_1);
	Info_AddChoice(dia_miltennw_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_miltennw_mana_5);
};

func void dia_miltennw_mana_5()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,5,T_MED);
	Info_ClearChoices(dia_miltennw_mana);
	Info_AddChoice(dia_miltennw_mana,DIALOG_BACK,dia_miltennw_mana_back);
	Info_AddChoice(dia_miltennw_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_miltennw_mana_1);
	Info_AddChoice(dia_miltennw_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_miltennw_mana_5);
};


instance DIA_MAGE_NW_PICKPOCKET(C_INFO)
{
	npc = pc_mage_nw;
	nr = 900;
	condition = dia_mage_nw_pickpocket_condition;
	information = dia_mage_nw_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_mage_nw_pickpocket_condition()
{
	return c_beklauen(56,75);
};

func void dia_mage_nw_pickpocket_info()
{
	Info_ClearChoices(dia_mage_nw_pickpocket);
	Info_AddChoice(dia_mage_nw_pickpocket,DIALOG_BACK,dia_mage_nw_pickpocket_back);
	Info_AddChoice(dia_mage_nw_pickpocket,DIALOG_PICKPOCKET,dia_mage_nw_pickpocket_doit);
};

func void dia_mage_nw_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_mage_nw_pickpocket);
};

func void dia_mage_nw_pickpocket_back()
{
	Info_ClearChoices(dia_mage_nw_pickpocket);
};

