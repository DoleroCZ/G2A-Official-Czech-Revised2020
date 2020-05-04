
instance DIA_NOV_8_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_nov_8_exit_condition;
	information = dia_nov_8_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_nov_8_exit_condition()
{
	return TRUE;
};

func void dia_nov_8_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NOV_8_FEGEN(C_INFO)
{
	nr = 2;
	condition = dia_nov_8_fegen_condition;
	information = dia_nov_8_fegen_info;
	permanent = TRUE;
	description = "Potøebuju pomoci zamést pokoje novicù.";
};


func int dia_nov_8_fegen_condition()
{
	if((KAPITEL == 1) && (MIS_KLOSTERARBEIT == LOG_RUNNING) && (NOV_HELFER < 4))
	{
		return TRUE;
	};
};


var int feger3_permanent;

func void dia_nov_8_fegen_info()
{
	AI_Output(other,self,"DIA_NOV_8_Fegen_15_00");	//Potøebuju pomoci zamést pokoje novicù.
	if(Hlp_GetInstanceID(feger3) == Hlp_GetInstanceID(self))
	{
		if(FEGER3_PERMANENT == FALSE)
		{
			AI_Output(self,other,"DIA_NOV_8_Fegen_08_01");	//No nazdar. Právì jsi pøišel a hned ze sebe necháš dìlat uklízeèku?
			AI_Output(self,other,"DIA_NOV_8_Fegen_08_02");	//Uklidni se, se mnou to bylo to samé, když jsem sem poprvé pøišel. A proto se ti chystám pomoct. Asi by se nám pìknì vysmáli, kdybychom to nezvládli.
			NOV_HELFER = NOV_HELFER + 1;
			FEGER3_PERMANENT = TRUE;
			b_giveplayerxp(XP_FEGER);
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"FEGEN");
			b_logentry(TOPIC_PARLANFEGEN,"Už jsem narazil na novice, který mi s úklidem komnat pomùže.");
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_8_Fegen_08_03");	//Bratøe, jsem obeznámen se situací, do které ses dostal. A už jsem ti øekl, že ti pomohu. A to právì dìlám.
		};
	};
	if(Hlp_GetInstanceID(feger3) == Hlp_GetInstanceID(self) == FALSE)
	{
		AI_Output(self,other,"DIA_NOV_8_Fegen_08_04");	//Hele, rád bych, ale fakt nemám èas.
	};
};


instance DIA_NOV_8_WURST(C_INFO)
{
	nr = 3;
	condition = dia_nov_8_wurst_condition;
	information = dia_nov_8_wurst_info;
	permanent = TRUE;
	description = "Co takhle jemòouèká skopová klobáska?";
};


func int dia_nov_8_wurst_condition()
{
	if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void dia_nov_8_wurst_info()
{
	var string novizetext;
	var string novizeleft;
	AI_Output(other,self,"DIA_NOV_8_Wurst_15_00");	//Co takhle jemòouèká skopová klobáska?
	AI_Output(self,other,"DIA_NOV_8_Wurst_08_01");	//Tak tomu se nedá øíct ne. Díky, chlape, pøesnì to jsem potøeboval.
	b_giveinvitems(other,self,itfo_schafswurst,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,itfo_sausage);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,2);
};


instance DIA_NOV_8_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_nov_8_join_condition;
	information = dia_nov_8_join_info;
	permanent = TRUE;
	description = "Co musím udìlat, abych se stal mágem?";
};


func int dia_nov_8_join_condition()
{
	if(hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_nov_8_join_info()
{
	AI_Output(other,self,"DIA_NOV_8_JOIN_15_00");	//Co musím udìlat, abych se stal mágem?
	AI_Output(self,other,"DIA_NOV_8_JOIN_08_01");	//Innosovým vyvoleným se mùžeš stát pouze v pøípadì, že k tomu dá svolení Nejvyšší rada.
	AI_Output(self,other,"DIA_NOV_8_JOIN_08_02");	//Jako novicové máme zakázáno studovat runovou magii - a staré posvátné spisy mùžeme proèítat jen se svolením mágù.
};


instance DIA_NOV_8_PEOPLE(C_INFO)
{
	nr = 5;
	condition = dia_nov_8_people_condition;
	information = dia_nov_8_people_info;
	permanent = TRUE;
	description = "Kdo vede tenhle klášter?";
};


func int dia_nov_8_people_condition()
{
	return TRUE;
};

func void dia_nov_8_people_info()
{
	AI_Output(other,self,"DIA_NOV_8_PEOPLE_15_00");	//Kdo vede tenhle klášter?
	AI_Output(self,other,"DIA_NOV_8_PEOPLE_08_01");	//Nejvyšší rada, kterou tvoøí tøi nejmocnìjší mágové. Každodennì se scházejí v kostele.
	AI_Output(self,other,"DIA_NOV_8_PEOPLE_08_02");	//Innosovi Vyvolení jsou všichni mágové. Innos jim poskytl tento dar, a tak mohou na zemi plnit jeho vùli.
};


instance DIA_NOV_8_LOCATION(C_INFO)
{
	nr = 6;
	condition = dia_nov_8_location_condition;
	information = dia_nov_8_location_info;
	permanent = TRUE;
	description = "Øekni mi o klášteru nìco víc.";
};


func int dia_nov_8_location_condition()
{
	return TRUE;
};

func void dia_nov_8_location_info()
{
	AI_Output(other,self,"DIA_NOV_8_LOCATION_15_00");	//Øekni mi o klášteru nìco víc.
	AI_Output(self,other,"DIA_NOV_8_LOCATION_08_01");	//Jeho pùvod sahá hluboko do minulosti. Pochází z dob vlády Rhobara I.
	AI_Output(self,other,"DIA_NOV_8_LOCATION_08_02");	//Pod klášterem se rozkládají katakomby. Vedou hluboko do hor.
};


instance DIA_NOV_8_STANDARD(C_INFO)
{
	nr = 10;
	condition = dia_nov_8_standard_condition;
	information = dia_nov_8_standard_info;
	permanent = TRUE;
	description = "Co je nového?";
};


func int dia_nov_8_standard_condition()
{
	return TRUE;
};

func void dia_nov_8_standard_info()
{
	AI_Output(other,self,"DIA_NOV_8_STANDARD_15_00");	//Co je nového?
	if(KAPITEL == 1)
	{
		if(other.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_01");	//Dalo by se øíct, že ano. Už je to víc než sto let, co byl nìjaký novic tak rychle pøijat do Kruhu ohnì.
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_02");	//Doufám, že se mi této cti také jednou dostane. Budu na tom tvrdì pracovat.
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_03");	//Nedávno do Khorinisu pøijeli paladinové. Jeden z nich je tady v klášteøe, aby se tu modlil k Innosovi.
		};
	};
	if((KAPITEL == 2) || (KAPITEL == 3))
	{
		if((PEDRO_TRAITOR == TRUE) && (MIS_NOVIZENCHASE != LOG_SUCCESS))
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_08_04");	//Poøád tomu nemohu uvìøit. Jeden z nás zradil klášter a ukradl Innosovo oko.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_08_05");	//Naším úkolem bylo vybudovat soudržnou spoleènost, ale byli jsme pøíliš slabí. To je jediný dùvod, proè se mohlo Beliarovi podaøit pøetáhnout jednoho z nás na svou stranu.
		}
		else if(MIS_NOVIZENCHASE == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_08_06");	//Innos buï pochválen. Podaøilo se nám Oko dostat od nepøítele zpìt.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_08_07");	//Tvá odvaha by mohla být pøíkladem mnoha zoufalým duším, a pomoci jim tak pøeèkat tyto temné èasy.
		}
		else if(MIS_OLDWORLD == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_08");	//Zaslechl jsem nìco o dracích a armádì Zla. Innos nás opatruj!
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_09");	//Nejvyšší rada má na situaci našich paladinù zvláštní zájem. Už nìjakou dobu jsme z Hornického údolí nedostali žádné zprávy.
		};
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_NOV_8_STANDARD_08_10");	//Ne. A jsem za to našemu Pánu vdìèný. S Innosovým okem budeme moci ty draky porazit!
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_NOV_8_STANDARD_08_11");	//Ano. Dosáhli jsme vítìzství nad draky! Innos nám ukázal, že nikdy nesmíme ztrácet nadìji.
		AI_Output(self,other,"DIA_NOV_8_STANDARD_08_12");	//V souèasnosti se musíme potýkat s množstvím temnoty a bude potøeba ještì zažehnout mnoho ohòù, abychom ji zprovodili ze svìta.
	};
};

func void b_assignambientinfos_nov_8(var C_NPC slf)
{
	dia_nov_8_exit.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_join.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_people.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_location.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_standard.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_fegen.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_wurst.npc = Hlp_GetInstanceID(slf);
};

