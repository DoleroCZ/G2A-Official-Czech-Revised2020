
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
	AI_Output(self,self,"DIA_Herold_Announce_04_00");	//Sly�te, ob�an� Khorinisu! Podle p��m�ho rozkazu ctihodn�ho lorda Hagena vstupuje v platnost n�sleduj�c� na��zen�.
	if(KAPITEL <= 2)
	{
		randy = Hlp_Random(5);
		if(randy == 0)
		{
			AI_Output(self,self,"DIA_Herold_Announce_04_01");	//UZ bezpe�nostn�ch d�vod� se vstup do les� a divo�iny kolem m�sta d�razn� nedoporu�uje.
			AI_Output(self,self,"DIA_Herold_Announce_04_02");	//Nav�c je p��sn� zak�z�n jak�koli kontakt se vzbou�en�mi roln�ky v p�ilehl�ch oblastech.
		}
		else if(randy == 1)
		{
			AI_Output(self,self,"DIA_Herold_Announce_04_03");	//T�mto okam�ikem se lord Andre st�v� vrchn�m velitelem na�� domobrany.
			AI_Output(self,self,"DIA_Herold_Announce_04_04");	//V�ichni ob�an� na�eho m�sta, kte�� dok�ou dr�et zbra�, jsou nal�hav� ��d�ni, aby pos�lili �ady kr�lovsk� domobrany.
		}
		else if(randy == 2)
		{
			AI_Output(self,self,"DIA_Herold_Announce_04_05");	//Bezpe�nostn� opat�en� zaji��uj�c� ochranu horn� ��sti m�sta budou je�t� v�ce zp��sn�na.
			AI_Output(self,self,"DIA_Herold_Announce_04_06");	//Str�c�m br�ny se nakazuje, aby se p��sn� dr�eli rozkaz� a zabr�nili tak vstupu kohokoli nepovolan�ho.
		}
		else if(randy == 3)
		{
			AI_Output(self,self,"DIA_Herold_Announce_04_07");	//Ve v�ech m�stech a oblastech cel� ��e t�mto okam�ikem vstupuje v platnost stann� pr�vo.
			AI_Output(self,self,"DIA_Herold_Announce_04_08");	//V�ichni civiln� soudci p�edaj� s okam�itou platnost� sv� ��ady kr�lovsk�m paladin�m.
			AI_Output(self,self,"DIA_Herold_Announce_04_09");	//Ctihodn� lord Andre je pov��en co nejp��sn�j��m potrest�n�m ve�ker� nez�konn� �innosti �i pokus� o odpor v��i kr�lovsk� gard�.
			AI_Output(self,self,"DIA_Herold_Announce_04_10");	//Ka�d� obyvatel Khorinisu, kter� se provin� nez�konnou �innost�, se bude okam�it� zodpov�dat lordu Andremu.
		}
		else
		{
			AI_Output(self,self,"DIA_Herold_Announce_04_11");	//Z d�vodu bezprost�edn�ho nebezpe�� �tok� sk�et� jsou v�ichni ob�an� ��d�ni, aby se na tuto hrozbu dostate�n� p�ipravili.
			AI_Output(self,self,"DIA_Herold_Announce_04_12");	//V�ichni nech� neprodlen� zapo�nou s bojov�m v�cvikem a p�im��en� se ozbroj�.
		};
	}
	else if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET != LOG_SUCCESS)
		{
			AI_Output(self,self,"DIA_Herold_Announce_04_13");	//�oldn��sk� kov�� Bennet, kter� podle zavra�dil paladina Lothara, byl ve jm�nu Innose uzn�n vinn�m.
			AI_Output(self,self,"DIA_Herold_Announce_04_14");	//Rozsudek zn� smrt ob�en�m. Poprava se bude konat za n�kolik m�lo dn�.
		}
		else
		{
			AI_Output(self,self,"DIA_Herold_Announce_04_15");	//Kov�� Bennet byl zpro�t�n ob�aloby, proto�e r�dce lorda Hagena prok�zal jeho nevinu.
		};
	}
	else if(KAPITEL == 4)
	{
		AI_Output(self,self,"DIA_Herold_Announce_04_16");	//Zv�sti, kter� vypov�daj� o p��tomnosti drak� v Hornick�m �dol� Khorinisu, se nezakl�daj� na pravd�.
		AI_Output(self,self,"DIA_Herold_Announce_04_17");	//Tyto pov�da�ky byly ���eny nep��telem, aby mezi odv�n�m lidem Myrtany vyvolaly paniku.
		AI_Output(self,self,"DIA_Herold_Announce_04_18");	//Abychom tyto sm�n� zv�sti vyvr�tili, byla do Hornick�ho �dol� vysl�na jednotka state�n�ch paladin� pro veden�m jednoho z nich, jen� se v t� oblasti dokonale vyzn�.
	}
	else
	{
		randy = Hlp_Random(2);
		if(randy == 0)
		{
			AI_Output(self,self,"DIA_Herold_Announce_04_19");	//Draci, kte�� ohro�ovali na�i zem, byli pora�eni state�n�mi mu�i pod veden�m lorda Hagena.
			AI_Output(self,self,"DIA_Herold_Announce_04_20");	//Kr�l Rhobar u� brzy zbav� na�i zemi sk�et� a kr�lovstv� znovu dos�hne d��v�j�� sl�vy a rozkv�tu.
		}
		else
		{
			AI_Output(self,self,"DIA_Herold_Announce_04_21");	//Lord Andre p�evezme s okam�itou platnost� nejvy��� velen� nad m�stem Khorinis.
			AI_Output(self,self,"DIA_Herold_Announce_04_22");	//Lord Hagen prohl�sil, �e se osobn� z��astn� v�pravy do Hornick�ho �dol�, aby zajistil, �e jeho lo� odtamtud odpluje jen a pouze s pln�m podpalub�m magick� rudy.
		};
	};
	AI_UseItemToState(self,fakescroll,-1);
};

