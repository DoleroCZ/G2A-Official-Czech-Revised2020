
func void b_dragon_undead_bla()
{
	AI_Output(self,other,"DIA_Addon_UndeadDragon_Add_20_00");	//Ano kámo? Taky máš originální verzi?
};


instance DIA_DRAGON_UNDEAD_EXIT(C_INFO)
{
	npc = dragon_undead;
	nr = 999;
	condition = dia_dragon_undead_exit_condition;
	information = dia_dragon_undead_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dragon_undead_exit_condition()
{
	if(DRAGONTALK_EXIT_FREE == TRUE)
	{
		return TRUE;
	};
};

func void dia_dragon_undead_exit_info()
{
	AI_StopProcessInfos(self);
	DRAGONTALK_EXIT_FREE = FALSE;
	self.flags = 0;
};


instance DIA_DRAGON_UNDEAD_HELLO(C_INFO)
{
	npc = dragon_undead;
	nr = 5;
	condition = dia_dragon_undead_hello_condition;
	information = dia_dragon_undead_hello_info;
	important = TRUE;
};


func int dia_dragon_undead_hello_condition()
{
	if(Npc_HasItems(other,itmi_innoseye_mis) >= 1)
	{
		return TRUE;
	};
};

func void dia_dragon_undead_hello_info()
{
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_00");	//Tak jsi mì koneènì našel. Na tvùj pøíjezd jsem èekal tak dlouho.
	AI_Output(other,self,"DIA_Dragon_Undead_Hello_15_01");	//Tak pokraèuj. Pøestaò pøedstírat, e sis to takhle pøedstavoval.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_02");	//(hluènı smích) Co ty mùeš vìdìt o mıch zámìrech?
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_03");	//Neposlal jsem snad Pátraèe, aby tì vlákali mnì do cesty?
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_04");	//Nenechával jsem ti snad stopy o mé existenci tak na oèích, es je nemohl minout?
	if((hero.guild == GIL_DJG) && (DRAGONEGGCOUNTER >= 7))
	{
		AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_05");	//A nepøispìla snad draèí vejce k vylepšení tvé zbroje, take ses sem mohl snadnìji dostat?
	};
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_06");	//Nebyli snad znovuzrození paladinové dostateènım dùvodem, abys zaèal pátrat po skryté moci v pozadí?
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_07");	//Nebylo snad prokletí tvého rodu dostateènım dùvodem, abys zaèal pátrat po skryté síle v pozadí?
	};
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_08");	//A se budeš vykrucovat, jak chceš, tohle všechno popøít nemùeš.
	AI_Output(self,other,"DIA_Addon_UndeadDragon_Add_20_01");	//Je pouze JEDNA vìc, jen nebyla pøedem dána!
	AI_Output(self,other,"DIA_Addon_UndeadDragon_Add_20_02");	//Zabil jsi jednoho z mıch sluebníkù. Byl vyvolen nosit dráp.
	AI_Output(self,other,"DIA_Addon_UndeadDragon_Add_20_03");	//A jak vidím, nyní ho neseš ty. Zato zemøeš!
	Info_AddChoice(dia_dragon_undead_hello,"Dost øeèí.",dia_dragon_undead_hello_attack);
	Info_AddChoice(dia_dragon_undead_hello,"Jménem koho vedeš své taení proti lidstvu?",dia_dragon_undead_hello_auftraggeber);
	Info_AddChoice(dia_dragon_undead_hello,"Proè jsi tady?",dia_dragon_undead_hello_warum);
	Info_AddChoice(dia_dragon_undead_hello,"Kdo jsi?",dia_dragon_undead_hello_wer);
	b_logentry(TOPIC_HALLENVONIRDORATH,"Hlavním nepøítelem je nemrtvı drak. Musím ho zabít, ještì ne z tohoto zatraceného ostrova odletí.");
};

func void dia_dragon_undead_hello_wer()
{
	AI_Output(other,self,"DIA_Dragon_Undead_Hello_wer_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_01");	//(smích) Ještì poøád se na to musíš ptát? Zeptej se sám sebe, ty hlupáku. Víš, kdo jsem.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_02");	//Nenesu ádné jméno. Stejnì jako ty.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_03");	//Mùj stvoøitel mi dal boskou moc. Stejnì jako ty v sobì nosíš moc svého boha.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_04");	//Mım osudem je znièení svìta.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_05");	//Stejnì jako je tvùj osud pøedurèen bezúhonností a poctivostí paladinù.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_06");	//Stejnì jako tvá ruka pøináší jistou smrt, drakobijèe.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_07");	//Stejnì jako je tvım údìlem kázat Innosovo uèení, mágu ohnì.
	};
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_08");	//Necítíš to pouto, co nás spolu pojí? Ano, ty víš, kdo jsem.
	AI_Output(other,self,"DIA_Dragon_Undead_Hello_wer_15_09");	//(rozzlobenì) Ne. To nemùe bıt pravda. Xardas vdycky øíkal...
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_10");	//Xardas je slabı a ty pro mì nepøedstavuješ ádnou hrozbu. Pro tebe je ctí, e ses se mnou mohl vùbec setkat.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_11");	//Tak stojí psáno. Nadešel èas pøijmout svùj osud.
};

func void dia_dragon_undead_hello_warum()
{
	AI_Output(other,self,"DIA_Dragon_Undead_Hello_warum_15_00");	//Proè jsi tady?
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_warum_20_01");	//Boství, je mi bylo propùjèeno, mì podnítilo k tomu, abych tento svìt utopil v øece násilí.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_warum_20_02");	//Jedinì tehdy, a poslední pevnost poctivıch padne, si budu moci odpoèinout.
};

func void dia_dragon_undead_hello_auftraggeber()
{
	AI_Output(other,self,"DIA_Dragon_Undead_Hello_Auftraggeber_15_00");	//Jménem koho vedeš své taení proti lidstvu?
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_Auftraggeber_20_01");	//Mım pánem je samotná Tma. Znáš ji. Slyšíš její volání.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_Auftraggeber_20_03");	//Má vojska povstanou v jejím jménu a zahalí svìt do temnoty.
};

func void dia_dragon_undead_hello_attack()
{
	AI_Output(other,self,"DIA_Dragon_Undead_Hello_attack_15_00");	//Dost øeèí. Zaenu tì zpìt pod kamení, z pod nìho ses vyhrabal, ty zrùdo.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_attack_20_01");	//(smích) Ještì nejsi schopen mì porazit. Od mého cíle mì u dìlí jen nepatrná chvilka.
	if(c_schasequippedbeliarsweapon() || c_schasreadiedbeliarsweapon() || c_schasbeliarsrune())
	{
		AI_Output(self,other,"DIA_Addon_UndeadDragon_Add_20_04");	//Opravdu si myslíš, e mì mùeš zranit tímto drápem? (smích)
	};
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_attack_20_02");	//Tvé kosti mi poslouí k tomu, abych mohl nechat vát zhoubnı vítr smrti nad povrchem celého svìta.
	Npc_RemoveInvItems(other,itmi_innoseye_mis,1);
	CreateInvItems(other,itmi_innoseye_discharged_mis,1);
	AI_StopProcessInfos(self);
	DRAGONTALK_EXIT_FREE = FALSE;
	self.flags = 0;
};

