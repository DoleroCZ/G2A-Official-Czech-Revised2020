
var int antipaladintalkcount;

func void b_assignorc_antipaladintalk(var C_NPC antipaladin)
{
	if(ANTIPALADINTALKCOUNT == 0)
	{
		AI_Output(self,other,"DIA_ORC_AntiPaladin_18_01");	//LKHROKGNAR! P�n te� ��kat paladinovi! P�n m�t pravda. P�n m�t v�dycky pravda.
		AI_Output(self,other,"DIA_ORC_AntiPaladin_18_02");	//My, v�dci sk�et� arm�dy, p�ij�t zab�t velk�ho paladina.
		AI_Output(self,other,"DIA_ORC_AntiPaladin_18_03");	//Zne�kodnit Hagen a jeho mu�i. Ty u� jim nepomoct.
		b_giveplayerxp(XP_AMBIENT);
	}
	else if(ANTIPALADINTALKCOUNT == 1)
	{
		AI_Output(self,other,"DIA_ORC_AntiPaladin_18_04");	//P�n ��kat sk�et�m v�dc�m, p�in�st hlava velk�ho paladina. Te� zem��t sk�et� rukou. KHROKGNAR!
	}
	else if(ANTIPALADINTALKCOUNT == 2)
	{
		AI_Output(self,other,"DIA_ORC_AntiPaladin_18_05");	//My, v�dci sk�et� arm�dy, p�ij�t zab�t tebe, paladin.
	}
	else
	{
		AI_Output(self,other,"DIA_ORC_AntiPaladin_18_06");	//KHROKGNAR! My t� zab�t, paladin.
	};
	ANTIPALADINTALKCOUNT = ANTIPALADINTALKCOUNT + 1;
	TALKEDTO_ANTIPALADIN = TRUE;
	AI_StopProcessInfos(antipaladin);
	antipaladin.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	Npc_SetRefuseTalk(antipaladin,20);
};

