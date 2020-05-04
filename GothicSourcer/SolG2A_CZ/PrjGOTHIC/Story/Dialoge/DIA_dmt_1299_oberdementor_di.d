
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
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_09_00");	//Tak, ty slizk� �erve, opov�il ses p�ij�t a� p�ed br�nu samotn�ho P�na!
	AI_Output(other,self,"DIA_Schwarzmagier_HELLO_15_01");	//To ty tady tah� za prov�zky?
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_09_02");	//Jsem str�cem Irdorathsk�ch s�n�, mocn�ho zdroje Beliarovy s�ly na zemi. Bo�sk� P�nova moc pulzuje nyn� m�ma rukama.
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_09_03");	//Sta�� mi jedin� slovo k tomu, abych t� uvrhl do v��n�ho ��lenstv�.
	AI_Output(other,self,"DIA_Schwarzmagier_HELLO_15_04");	//Aha. H�d�m, �e jsem se m�l ostatn�ch prost�edn�k� rad�ji zbavit.
	b_logentry(TOPIC_HALLENVONIRDORATH,"Jsem u posledn� br�ny. Kl��em k n� bude nejsp� �ern� m�g.");
	Info_ClearChoices(dia_schwarzmagier_hello);
	Info_AddChoice(dia_schwarzmagier_hello,"Zave� m� ke sv�mu p�novi.",dia_schwarzmagier_hello_meister);
	Info_AddChoice(dia_schwarzmagier_hello,"Kolik tob� podobn�ch budu je�t� muset zab�t?",dia_schwarzmagier_hello_dmt);
	Info_AddChoice(dia_schwarzmagier_hello,"Co je tam za t�m velk�m port�lem?",dia_schwarzmagier_hello_hintertor);
	Info_AddChoice(dia_schwarzmagier_hello,"Kdo je tv�j p�n?",dia_schwarzmagier_hello_wer);
	if(SC_KNOWSMADPSI == TRUE)
	{
		Info_AddChoice(dia_schwarzmagier_hello,"B�val jsi Sp��ov�m n�sledovn�kem.",dia_schwarzmagier_hello_schlaefer);
	};
};

func void dia_schwarzmagier_hello_wer()
{
	AI_Output(other,self,"DIA_Schwarzmagier_HELLO_wer_15_00");	//Kdo je tv�j p�n?
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_wer_09_01");	//Je to poutn�k mezi sv�ty. Jeho bo�sk� moudrost n�m p�in�� pozn�n�.
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_wer_09_02");	//Je Beliarov�m vyvolen�m, kter� zemi zbav� b�dn�ch Innosov�ch n�sledovn�k�.
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_wer_09_03");	//V�em, kte�� pochybuj� o jeho velkoleposti, p�in�� smrt.
	AI_Output(other,self,"DIA_Schwarzmagier_HELLO_wer_15_04");	//To zn� pov�dom�.
};

func void dia_schwarzmagier_hello_hintertor()
{
	AI_Output(other,self,"DIA_Schwarzmagier_HELLO_hinterTor_15_00");	//Co je tam za t�m velk�m port�lem?
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_hinterTor_09_01");	//(sm�ch) Komnaty m�ho p�na ti z�stanou zapov�zeny. K otev�en� t� br�ny ti neposkytnu ��dnou p��le�itost.
};

func void dia_schwarzmagier_hello_schlaefer()
{
	AI_Output(other,self,"DIA_Schwarzmagier_HELLO_schlaefer_15_00");	//B�val jsi Sp��ov�m n�sledovn�kem.
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_schlaefer_09_01");	//To u� je d�vno. P�n n�m otev�el o�i. Te� u� n�s nikdo nezastav�.
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_schlaefer_09_02");	//P�n n�m uk�zal jedinou mo�nou cestu, jak se vypo��dat s v�mi nev���c�mi.
	TOPIC_END_DEMENTOREN = TRUE;
	b_giveplayerxp(XP_AMBIENT);
};

func void dia_schwarzmagier_hello_dmt()
{
	AI_Output(other,self,"DIA_Schwarzmagier_HELLO_dmt_15_00");	//Kolik tob� podobn�ch budu je�t� muset zab�t?
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_dmt_09_01");	//Je n�s hodn�. Nem� ani pon�t�, kolik je t�ch, co �ekali na tuto chv�li svobody.
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_dmt_09_02");	//B�dn� k�ik se ���� celou zem�, kdy� vstupujeme do tohoto sv�ta.
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_dmt_09_03");	//Osvobod�me sv�t od barbar�, co si ��kaj� Str�ci ohn�. Na�e shrom�d�n� tady v chr�mu u� nebude trvat dlouho.
	AI_Output(other,self,"DIA_Schwarzmagier_HELLO_dmt_15_04");	//Ano.
};

func void dia_schwarzmagier_hello_meister()
{
	Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_meister_09_00");	//(teatr�ln�) Dost u� t�ch bl�bol�! Zni��m t�.
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_meister_09_01");	//Tv�j zrak t� opust� a tv� du�e zmiz� v temnot�ch.
	if(Npc_HasItems(other,itam_prot_blackeye_mis))
	{
		AI_Output(other,self,"DIA_Schwarzmagier_HELLO_meister_15_02");	//(pro sebe) Bez toho amuletu na vyvol�v�n� du�� to te� asi bude trochu probl�m.
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

