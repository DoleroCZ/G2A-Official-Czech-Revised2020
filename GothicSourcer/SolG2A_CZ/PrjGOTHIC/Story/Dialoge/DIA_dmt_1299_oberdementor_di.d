
instance DIA_SCHWARZMAGIER_HELLO(C_INFO)
{
	npc = dmt_1299_oberdementor_di;
	nr = 5;
	condition = dia_schwarzmagier_hello_condition;
	information = dia_schwarzmagier_hello_info;
	important = TRUE;
};


func int dia_schwarzmagier_hello_condition()
{
	return TRUE;
};


var int sc_knowsmadpsi;

func void dia_schwarzmagier_hello_info()
{
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_09_00");	//Tak, ty slizký èerve, opovážil ses pøijít až pøed bránu samotného Pána!
	AI_Output(other,self,"DIA_Schwarzmagier_HELLO_15_01");	//To ty tady taháš za provázky?
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_09_02");	//Jsem strážcem Irdorathských síní, mocného zdroje Beliarovy síly na zemi. Božská Pánova moc pulzuje nyní mýma rukama.
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_09_03");	//Staèí mi jediné slovo k tomu, abych tì uvrhl do vìèného šílenství.
	AI_Output(other,self,"DIA_Schwarzmagier_HELLO_15_04");	//Aha. Hádám, že jsem se mìl ostatních prostøedníkù radìji zbavit.
	b_logentry(TOPIC_HALLENVONIRDORATH,"Jsem u poslední brány. Klíèem k ní bude nejspíš èerný mág.");
	Info_ClearChoices(dia_schwarzmagier_hello);
	Info_AddChoice(dia_schwarzmagier_hello,"Zaveï mì ke svému pánovi.",dia_schwarzmagier_hello_meister);
	Info_AddChoice(dia_schwarzmagier_hello,"Kolik tobì podobných budu ještì muset zabít?",dia_schwarzmagier_hello_dmt);
	Info_AddChoice(dia_schwarzmagier_hello,"Co je tam za tím velkým portálem?",dia_schwarzmagier_hello_hintertor);
	Info_AddChoice(dia_schwarzmagier_hello,"Kdo je tvùj pán?",dia_schwarzmagier_hello_wer);
	if(SC_KNOWSMADPSI == TRUE)
	{
		Info_AddChoice(dia_schwarzmagier_hello,"Býval jsi Spáèovým následovníkem.",dia_schwarzmagier_hello_schlaefer);
	};
};

func void dia_schwarzmagier_hello_wer()
{
	AI_Output(other,self,"DIA_Schwarzmagier_HELLO_wer_15_00");	//Kdo je tvùj pán?
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_wer_09_01");	//Je to poutník mezi svìty. Jeho božská moudrost nám pøináší poznání.
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_wer_09_02");	//Je Beliarovým vyvoleným, který zemi zbaví bídných Innosových následovníkù.
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_wer_09_03");	//Všem, kteøí pochybují o jeho velkoleposti, pøináší smrt.
	AI_Output(other,self,"DIA_Schwarzmagier_HELLO_wer_15_04");	//To zní povìdomì.
};

func void dia_schwarzmagier_hello_hintertor()
{
	AI_Output(other,self,"DIA_Schwarzmagier_HELLO_hinterTor_15_00");	//Co je tam za tím velkým portálem?
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_hinterTor_09_01");	//(smích) Komnaty mého pána ti zùstanou zapovìzeny. K otevøení té brány ti neposkytnu žádnou pøíležitost.
};

func void dia_schwarzmagier_hello_schlaefer()
{
	AI_Output(other,self,"DIA_Schwarzmagier_HELLO_schlaefer_15_00");	//Býval jsi Spáèovým následovníkem.
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_schlaefer_09_01");	//To už je dávno. Pán nám otevøel oèi. Teï už nás nikdo nezastaví.
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_schlaefer_09_02");	//Pán nám ukázal jedinou možnou cestu, jak se vypoøádat s vámi nevìøícími.
	TOPIC_END_DEMENTOREN = TRUE;
	b_giveplayerxp(XP_AMBIENT);
};

func void dia_schwarzmagier_hello_dmt()
{
	AI_Output(other,self,"DIA_Schwarzmagier_HELLO_dmt_15_00");	//Kolik tobì podobných budu ještì muset zabít?
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_dmt_09_01");	//Je nás hodnì. Nemáš ani ponìtí, kolik je tìch, co èekali na tuto chvíli svobody.
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_dmt_09_02");	//Bìdný køik se šíøí celou zemí, když vstupujeme do tohoto svìta.
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_dmt_09_03");	//Osvobodíme svìt od barbarù, co si øíkají Strážci ohnì. Naše shromáždìní tady v chrámu už nebude trvat dlouho.
	AI_Output(other,self,"DIA_Schwarzmagier_HELLO_dmt_15_04");	//Ano.
};

func void dia_schwarzmagier_hello_meister()
{
	Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_meister_09_00");	//(teatrálnì) Dost už tìch blábolù! Znièím tì.
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_meister_09_01");	//Tvùj zrak tì opustí a tvá duše zmizí v temnotách.
	if(Npc_HasItems(other,itam_prot_blackeye_mis))
	{
		AI_Output(other,self,"DIA_Schwarzmagier_HELLO_meister_15_02");	//(pro sebe) Bez toho amuletu na vyvolávání duší to teï asi bude trochu problém.
	}
	else
	{
		hero.attribute[ATR_MANA] = 0;
		if(hero.attribute[ATR_HITPOINTS] > 50)
		{
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] / 2;
		};
		SC_OBSESSIONCOUNTER = 100;
		b_scisobsessed(hero);
	};
	Info_ClearChoices(dia_schwarzmagier_hello);
	Info_AddChoice(dia_schwarzmagier_hello,DIALOG_ENDE,dia_schwarzmagier_hello_back);
};

func void dia_schwarzmagier_hello_back()
{
	AI_StopProcessInfos(self);
	Wld_StopEffect("DEMENTOR_FX");
	self.flags = 0;
	Snd_Play("MFX_FEAR_CAST");
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};

