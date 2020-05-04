
var int antipaladintalkcount;

func void b_assignorc_antipaladintalk(var C_NPC antipaladin)
{
	if(ANTIPALADINTALKCOUNT == 0)
	{
		AI_Output(self,other,"DIA_ORC_AntiPaladin_18_01");	//LKHROKGNAR! Pán teï øíkat paladinovi! Pán mít pravda. Pán mít vždycky pravda.
		AI_Output(self,other,"DIA_ORC_AntiPaladin_18_02");	//My, vùdci skøetí armády, pøijít zabít velkého paladina.
		AI_Output(self,other,"DIA_ORC_AntiPaladin_18_03");	//Zneškodnit Hagen a jeho muži. Ty už jim nepomoct.
		b_giveplayerxp(XP_AMBIENT);
	}
	else if(ANTIPALADINTALKCOUNT == 1)
	{
		AI_Output(self,other,"DIA_ORC_AntiPaladin_18_04");	//Pán øíkat skøetím vùdcùm, pøinést hlava velkého paladina. Teï zemøít skøetí rukou. KHROKGNAR!
	}
	else if(ANTIPALADINTALKCOUNT == 2)
	{
		AI_Output(self,other,"DIA_ORC_AntiPaladin_18_05");	//My, vùdci skøetí armády, pøijít zabít tebe, paladin.
	}
	else
	{
		AI_Output(self,other,"DIA_ORC_AntiPaladin_18_06");	//KHROKGNAR! My tì zabít, paladin.
	};
	ANTIPALADINTALKCOUNT = ANTIPALADINTALKCOUNT + 1;
	TALKEDTO_ANTIPALADIN = TRUE;
	AI_StopProcessInfos(antipaladin);
	antipaladin.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	Npc_SetRefuseTalk(antipaladin,20);
};

