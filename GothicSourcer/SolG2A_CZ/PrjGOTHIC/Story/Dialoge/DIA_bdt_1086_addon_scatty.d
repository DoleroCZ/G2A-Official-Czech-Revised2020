
var int scatty_start;

instance DIA_ADDON_SCATTY_EXIT(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 999;
	condition = dia_addon_scatty_exit_condition;
	information = dia_addon_scatty_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_scatty_exit_condition()
{
	return TRUE;
};

func void dia_addon_scatty_exit_info()
{
	AI_StopProcessInfos(self);
	if(SCATTY_START == FALSE)
	{
		Npc_ExchangeRoutine(self,"START");
		SCATTY_START = TRUE;
	};
};


instance DIA_ADDON_SCATTY_PICKPOCKET(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 900;
	condition = dia_addon_scatty_pickpocket_condition;
	information = dia_addon_scatty_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_addon_scatty_pickpocket_condition()
{
	return c_beklauen(60,90);
};

func void dia_addon_scatty_pickpocket_info()
{
	Info_ClearChoices(dia_addon_scatty_pickpocket);
	Info_AddChoice(dia_addon_scatty_pickpocket,DIALOG_BACK,dia_addon_scatty_pickpocket_back);
	Info_AddChoice(dia_addon_scatty_pickpocket,DIALOG_PICKPOCKET,dia_addon_scatty_pickpocket_doit);
};

func void dia_addon_scatty_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_scatty_pickpocket);
};

func void dia_addon_scatty_pickpocket_back()
{
	Info_ClearChoices(dia_addon_scatty_pickpocket);
};


instance DIA_ADDON_SCATTY_HI(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 2;
	condition = dia_addon_scatty_hi_condition;
	information = dia_addon_scatty_hi_info;
	permanent = FALSE;
	description = "Jak jde obchod?";
};


func int dia_addon_scatty_hi_condition()
{
	return TRUE;
};

func void dia_addon_scatty_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_Hi_15_00");	//Jak jde obchod?
	AI_Output(self,other,"DIA_Addon_Scatty_Hi_01_01");	//Hùø od doby, co byla otevøena krypta ...
	AI_Output(self,other,"DIA_Addon_Scatty_Hi_01_02");	//Raven už nepotøebuje otroky. Teï kutají zlato na Bloodwynùv pøíkaz.
	AI_Output(self,other,"DIA_Addon_Scatty_Hi_01_03");	//A kopáèi si dávají oraz. (mumlá) Kopáèi, kteøí mají pauzu nejsou dobøí pro mùj obchod.
	Log_CreateTopic(TOPIC_ADDON_BDT_TRADER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_BDT_TRADER,"Scatty prodává rùzné vìci.");
};


instance DIA_ADDON_SCATTY_LAST(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 2;
	condition = dia_addon_scatty_last_condition;
	information = dia_addon_scatty_last_info;
	permanent = FALSE;
	description = "Bloodwyn? Má tady nìjaký úkol?";
};


func int dia_addon_scatty_last_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_scatty_hi) && !Npc_IsDead(bloodwyn))
	{
		return TRUE;
	};
};

func void dia_addon_scatty_last_info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_last_15_00");	//Bloodwyn? Má tady nìjaký úkol?
	AI_Output(self,other,"DIA_Addon_Scatty_last_01_01");	//Kontroluje dùl. Ale je tady dole jen seží. Vìtšinu èasu je s Ravenem v chrámu.
	AI_Output(other,self,"DIA_Addon_Scatty_last_15_02");	//Co to 'tìžce' znamená doopravdy?
	AI_Output(self,other,"DIA_Addon_Scatty_last_01_03");	//Naposled jsem ho vidìl, když opouštìl kryptu ...
	AI_Output(self,other,"DIA_Addon_Scatty_last_01_04");	//(uvažuje) Ne, poèkej! Myslím, že to bylo když posílal otroky dolù, aby kopali zlato.
	AI_Output(self,other,"DIA_Addon_Scatty_last_01_05");	//Narozdíl od Ravena, ON je velmi zaujat zlatem.
};


instance DIA_ADDON_SCATTY_GRUFT(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 2;
	condition = dia_addon_scatty_gruft_condition;
	information = dia_addon_scatty_gruft_info;
	permanent = FALSE;
	description = "O jaké kryptì mluvíš?";
};


func int dia_addon_scatty_gruft_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_scatty_hi))
	{
		return TRUE;
	};
};

func void dia_addon_scatty_gruft_info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_Gruft_15_00");	//O jaké kryptì mluvíš?
	AI_Output(self,other,"DIA_Addon_Scatty_Gruft_01_01");	//Je to prokletá krypta! Její ochránci zabili mnoho mužù!
	AI_Output(other,self,"DIA_Addon_Scatty_Gruft_15_02");	//Ochránci? Mluvíš o kamenných stvoøeních? Plochý a kulatý oblièej?
	AI_Output(self,other,"DIA_Addon_Scatty_Gruft_01_03");	//Ano! Nesèetnìkrát se objevili z hluboké skály.
	AI_Output(self,other,"DIA_Addon_Scatty_Gruft_01_04");	//Vìdìl jsem, že otevøení krypty není dobrý nápad už od zaèátku.
	AI_Output(self,other,"DIA_Addon_Scatty_Gruft_01_05");	//Ale Raven byl posedlý nápadem tady dolovat. A jen co byla krypta odkryta, on a jeho strážce do ní vstoupili.
};


instance DIA_ADDON_SCATTY_GRUFTAGAIN(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 2;
	condition = dia_addon_scatty_gruftagain_condition;
	information = dia_addon_scatty_gruftagain_info;
	permanent = FALSE;
	description = "Proè chtìl Raven do té krypty?";
};


func int dia_addon_scatty_gruftagain_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_scatty_gruft))
	{
		return TRUE;
	};
};

func void dia_addon_scatty_gruftagain_info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_GruftAgain_15_00");	//Proè chtìl Raven do té krypty?
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_01");	//(uvažuje) Hmm ... jsi hodnì nosatý. Podobáš se chlápkovi, kterého jsem znal.
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_02");	//Byl stejnì nosatý jak ty. A jednoho dne se obrátil k osudu.
	AI_Output(other,self,"DIA_Addon_Scatty_GruftAgain_15_03");	//Nezakecávej to. Co se stalo v kryptì?
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_04");	//Dobrá ... uhm ... Je trochu sucho a mì by nevadilo nìco k pití ...
	AI_Output(other,self,"DIA_Addon_Scatty_GruftAgain_15_05");	//Hej Scatty, ne teï. Tohle je dùležité, takže, co tam dole Raven dìlal?
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_06");	//Dobrá, dobrá. (dýchá) On ... pøivolal ... nìco. Používal slova jazyka, který neznìl známì.
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_07");	//Oslòující svìtlo se uvolnilo z vnitøku krypty a potom jsem slyšel výkøik. Byl to šokující, démonický výkøik.
	AI_Output(other,self,"DIA_Addon_Scatty_GruftAgain_15_08");	//A potom?
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_09");	//To je vše, co jsem vidìl. Bloodwyn vyšel z krypty a øekl mi, abych odešel. A to jsem také udìlal.
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_10");	//Raven a jeho chlapi opustili chrám krátce potom. A potom už tady dole nebyl vùbec.
};


instance DIA_ADDON_SCATTY_TRINKEN(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 99;
	condition = dia_addon_scatty_trinken_condition;
	information = dia_addon_scatty_trinken_info;
	permanent = FALSE;
	description = "Chtìl by jsi nìco k pití?";
};


func int dia_addon_scatty_trinken_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_scatty_gruftagain))
	{
		return TRUE;
	};
};

func void dia_addon_scatty_trinken_info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_Trinken_15_00");	//Chtìl by jsi nìco k pití?
	AI_Output(self,other,"DIA_Addon_Scatty_Trinken_01_01");	//Urèitì jsi nemyslel pivo. To je velice vzácné v tomhle táboøe.
	AI_Output(self,other,"DIA_Addon_Scatty_Trinken_01_02");	//Možná má Lucia stále nìkde láhev ...
};


instance DIA_ADDON_SCATTY_BIER(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 99;
	condition = dia_addon_scatty_bier_condition;
	information = dia_addon_scatty_bier_info;
	permanent = FALSE;
	description = "Na zdraví! (dát pivo)";
};


func int dia_addon_scatty_bier_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_scatty_trinken) && Npc_HasItems(other,itfo_beer))
	{
		return TRUE;
	};
};

func void dia_addon_scatty_bier_info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_Bier_15_00");	//Na zdraví!
	if(b_giveinvitems(other,self,itfo_beer,1))
	{
		AI_UseItem(self,itfo_beer);
	};
	AI_Output(self,other,"DIA_Addon_Scatty_Bier_01_01");	//Oh, tohle chutná skvìle. Díky, chlape, jseš mùj hrdina.
	b_giveplayerxp(XP_AMBIENT * 5);
};


instance DIA_ADDON_SCATTY_GOLD(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 2;
	condition = dia_addon_scatty_gold_condition;
	information = dia_addon_scatty_gold_info;
	permanent = FALSE;
	description = DIALOG_ADDON_GOLD_DESCRIPTION;
};


func int dia_addon_scatty_gold_condition()
{
	return TRUE;
};

func void dia_addon_scatty_gold_info()
{
	b_say(other,self,"$ADDON_GOLD_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Scatty_Gold_01_00");	//Získat krumpáè a bušit zlaté mince ... Každý to mùže dìlat.
	AI_Output(self,other,"DIA_Addon_Scatty_Gold_01_01");	//Nicménì, pokud do toho bušíš mince se roztøíští na mnoho malých nugetù. Proto mohou dolovat je zkušení lidé.
	AI_Output(self,other,"DIA_Addon_Scatty_Gold_01_02");	//Mùžu ti dát pár informací, pokud jsi dostatìènì zkušený.
	b_upgrade_hero_hackchance(5);
};


var int scatty_teach_perm;

instance DIA_ADDON_SCATTY_TEACH(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 2;
	condition = dia_addon_scatty_teach_condition;
	information = dia_addon_scatty_teach_info;
	permanent = TRUE;
	description = "Nauèit se dolovat zlato (Stojí: 2 LP - 10 procent)";
};


func int dia_addon_scatty_teach_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_scatty_gold) && (SCATTY_TEACH_PERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_scatty_teach_info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_teach_15_00");	//Co o dolování zlata?
	if(other.lp >= 1)
	{
		AI_Output(self,other,"DIA_Addon_Scatty_teach_01_01");	//Musíš si být vìdom, že zlato není jako ruda. Je jemné jako máslo. Pokud udeøíš moc silnì, rozpadne se na malé kousky.
		AI_Output(self,other,"DIA_Addon_Scatty_teach_01_02");	//Každý kopáè má své vlastní triky jak ze skály získat nìjaké pìkné nuggety.
		AI_Output(self,other,"DIA_Addon_Scatty_teach_01_03");	//To tyhle triky odlišují kopáèe a dobrého kopáèe.
		AI_Output(self,other,"DIA_Addon_Scatty_teach_01_04");	//Také, je to všechno o praxi. Budeš se zlepšovat, pokud tady budeš chvíli pracovat.
		other.lp = other.lp - 1;
		b_upgrade_hero_hackchance(10);
		SCATTY_TEACH_PERM = TRUE;
	}
	else
	{
		b_say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance DIA_ADDON_SCATTY_TOT(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 2;
	condition = dia_addon_scatty_tot_condition;
	information = dia_addon_scatty_tot_info;
	permanent = FALSE;
	description = "Bloodwyn je mrtvý.";
};


func int dia_addon_scatty_tot_condition()
{
	if(Npc_IsDead(bloodwyn))
	{
		return TRUE;
	};
};

func void dia_addon_scatty_tot_info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_tot_15_00");	//Bloodwyn je mrtvý.
	AI_Output(self,other,"DIA_Addon_Scatty_tot_01_01");	//Hm, normálnì nepøipíjím na takovéhle zprávy - nicménì, Bloodwyn byl náhodou jeden z chlapù, kteøí jsou lepší mrtví.
};


instance DIA_ADDON_SCATTY_TRADE(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 99;
	condition = dia_addon_scatty_trade_condition;
	information = dia_addon_scatty_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE;
};


func int dia_addon_scatty_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_scatty_hi))
	{
		return TRUE;
	};
};

func void dia_addon_scatty_trade_info()
{
	b_givetradeinv(self);
	b_say(other,self,"$TRADE_1");
};

