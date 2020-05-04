
func void b_announce_herold()
{
	var int randy;
	if(c_bodystatecontains(self,BS_SIT))
	{
		AI_Standup(self);
		b_turntonpc(self,hero);
	};
	AI_RemoveWeapon(self);
	CreateInvItem(self,fakescroll);
	AI_UseItemToState(self,fakescroll,1);
	AI_Output(self,self,"DIA_Herold_Announce_04_00");	//Slyšte, obèané Khorinisu! Podle pøímého rozkazu ctihodného lorda Hagena vstupuje v platnost následující naøízení.
	if(KAPITEL <= 2)
	{
		randy = Hlp_Random(5);
		if(randy == 0)
		{
			AI_Output(self,self,"DIA_Herold_Announce_04_01");	//UZ bezpeènostních dùvodù se vstup do lesù a divoèiny kolem mìsta dùraznì nedoporuèuje.
			AI_Output(self,self,"DIA_Herold_Announce_04_02");	//Navíc je pøísnì zakázán jakýkoli kontakt se vzbouøenými rolníky v pøilehlých oblastech.
		}
		else if(randy == 1)
		{
			AI_Output(self,self,"DIA_Herold_Announce_04_03");	//Tímto okamžikem se lord Andre stává vrchním velitelem naší domobrany.
			AI_Output(self,self,"DIA_Herold_Announce_04_04");	//Všichni obèané našeho mìsta, kteøí dokážou držet zbraò, jsou naléhavì žádáni, aby posílili øady královské domobrany.
		}
		else if(randy == 2)
		{
			AI_Output(self,self,"DIA_Herold_Announce_04_05");	//Bezpeènostní opatøení zajišující ochranu horní èásti mìsta budou ještì více zpøísnìna.
			AI_Output(self,self,"DIA_Herold_Announce_04_06");	//Strážcùm brány se nakazuje, aby se pøísnì drželi rozkazù a zabránili tak vstupu kohokoli nepovolaného.
		}
		else if(randy == 3)
		{
			AI_Output(self,self,"DIA_Herold_Announce_04_07");	//Ve všech mìstech a oblastech celé øíše tímto okamžikem vstupuje v platnost stanné právo.
			AI_Output(self,self,"DIA_Herold_Announce_04_08");	//Všichni civilní soudci pøedají s okamžitou platností své úøady královským paladinùm.
			AI_Output(self,self,"DIA_Herold_Announce_04_09");	//Ctihodný lord Andre je povìøen co nejpøísnìjším potrestáním veškeré nezákonné èinnosti èi pokusù o odpor vùèi královské gardì.
			AI_Output(self,self,"DIA_Herold_Announce_04_10");	//Každý obyvatel Khorinisu, který se proviní nezákonnou èinností, se bude okamžitì zodpovídat lordu Andremu.
		}
		else
		{
			AI_Output(self,self,"DIA_Herold_Announce_04_11");	//Z dùvodu bezprostøedního nebezpeèí útokù skøetù jsou všichni obèané žádáni, aby se na tuto hrozbu dostateènì pøipravili.
			AI_Output(self,self,"DIA_Herold_Announce_04_12");	//Všichni nech neprodlenì zapoènou s bojovým výcvikem a pøimìøenì se ozbrojí.
		};
	}
	else if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET != LOG_SUCCESS)
		{
			AI_Output(self,self,"DIA_Herold_Announce_04_13");	//Žoldnéøský kováø Bennet, který podle zavraždil paladina Lothara, byl ve jménu Innose uznán vinným.
			AI_Output(self,self,"DIA_Herold_Announce_04_14");	//Rozsudek zní smrt obìšením. Poprava se bude konat za nìkolik málo dnù.
		}
		else
		{
			AI_Output(self,self,"DIA_Herold_Announce_04_15");	//Kováø Bennet byl zproštìn obžaloby, protože rádce lorda Hagena prokázal jeho nevinu.
		};
	}
	else if(KAPITEL == 4)
	{
		AI_Output(self,self,"DIA_Herold_Announce_04_16");	//Zvìsti, které vypovídají o pøítomnosti drakù v Hornickém údolí Khorinisu, se nezakládají na pravdì.
		AI_Output(self,self,"DIA_Herold_Announce_04_17");	//Tyto povídaèky byly šíøeny nepøítelem, aby mezi odvážným lidem Myrtany vyvolaly paniku.
		AI_Output(self,self,"DIA_Herold_Announce_04_18");	//Abychom tyto smìšné zvìsti vyvrátili, byla do Hornického údolí vyslána jednotka stateèných paladinù pro vedením jednoho z nich, jenž se v té oblasti dokonale vyzná.
	}
	else
	{
		randy = Hlp_Random(2);
		if(randy == 0)
		{
			AI_Output(self,self,"DIA_Herold_Announce_04_19");	//Draci, kteøí ohrožovali naši zem, byli poraženi stateènými muži pod vedením lorda Hagena.
			AI_Output(self,self,"DIA_Herold_Announce_04_20");	//Král Rhobar už brzy zbaví naši zemi skøetù a království znovu dosáhne døívìjší slávy a rozkvìtu.
		}
		else
		{
			AI_Output(self,self,"DIA_Herold_Announce_04_21");	//Lord Andre pøevezme s okamžitou platností nejvyšší velení nad mìstem Khorinis.
			AI_Output(self,self,"DIA_Herold_Announce_04_22");	//Lord Hagen prohlásil, že se osobnì zúèastní výpravy do Hornického údolí, aby zajistil, že jeho loï odtamtud odpluje jen a pouze s plným podpalubím magické rudy.
		};
	};
	AI_UseItemToState(self,fakescroll,-1);
};

