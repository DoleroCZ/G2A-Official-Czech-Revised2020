
instance DIA_BRIDGEDEMENTOR_EXIT(C_INFO)
{
	npc = dmt_1200_dementor;
	nr = 999;
	condition = dia_bridgedementor_exit_condition;
	information = dia_bridgedementor_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bridgedementor_exit_condition()
{
	return TRUE;
};

func void dia_bridgedementor_exit_info()
{
	Wld_StopEffect("DEMENTOR_FX");
	b_scisobsessed(self);
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,30);
	b_attack(self,other,AR_NONE,1);
	Snd_Play("MFX_FEAR_CAST");
};


instance DIA_BRIDGEDEMENTOR(C_INFO)
{
	npc = dmt_1200_dementor;
	nr = 1;
	condition = dia_bridgedementor_condition;
	information = dia_bridgedementor_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_bridgedementor_condition()
{
	if(Npc_RefuseTalk(self) == FALSE)
	{
		return TRUE;
	};
};

func void dia_bridgedementor_info()
{
	Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DIA_BridgeDementor_19_00");	//V�d�li jsme, �e p�ijde�!
	AI_Output(self,other,"DIA_BridgeDementor_19_01");	//M�j P�n dos�hne v�t�zstv� a p�evezme vl�du nad cel�m sv�tem.
	AI_Output(self,other,"DIA_BridgeDementor_19_02");	//Ty popletenej hlup�ku! Nem� ani tu�en�, komu ses postavil, a j� t� zni��m pr�v� te� a pr�v� tady!
	Npc_SetRefuseTalk(self,30);
};

