
func void b_assignschiffswachenguard(var C_NPC schiffswache)
{
	if((MIS_SHIPISFREE == TRUE) || (MIS_SCVISITSHIP == LOG_RUNNING))
	{
		if(schiffswache.voice == 4)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_Ambient_04_00");	//Sledujeme t�. Nezapom�nej na to.
		};
		if(schiffswache.voice == 9)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_Ambient_09_01");	//Dokud jsi tady, ned�lej ��dn� pot�e.
		};
		if(schiffswache.voice == 12)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_Ambient_12_02");	//Ani nepomysli na to, �e bys tu mohl n�co ukr�st, jasn�?
		};
		AI_StopProcessInfos(schiffswache);
		Npc_SetRefuseTalk(schiffswache,60);
		Npc_SetRefuseTalk(pal_220_schiffswache,60);
		Npc_SetRefuseTalk(pal_221_schiffswache,60);
		Npc_SetRefuseTalk(pal_222_schiffswache,60);
		Npc_SetRefuseTalk(pal_223_schiffswache,60);
		Npc_SetRefuseTalk(pal_224_schiffswache,60);
		Npc_SetRefuseTalk(pal_225_schiffswache,60);
		Npc_SetRefuseTalk(pal_226_schiffswache,60);
		Npc_SetRefuseTalk(pal_227_schiffswache,60);
		Npc_SetRefuseTalk(pal_228_schiffswache,60);
	}
	else
	{
		b_say(self,other,"$ALARM");
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_GUARDSTOPSINTRUDER,1);
		Npc_SetRefuseTalk(schiffswache,20);
		Npc_SetRefuseTalk(pal_220_schiffswache,20);
		Npc_SetRefuseTalk(pal_221_schiffswache,20);
		Npc_SetRefuseTalk(pal_222_schiffswache,20);
		Npc_SetRefuseTalk(pal_223_schiffswache,20);
		Npc_SetRefuseTalk(pal_224_schiffswache,20);
		Npc_SetRefuseTalk(pal_225_schiffswache,20);
		Npc_SetRefuseTalk(pal_226_schiffswache,20);
		Npc_SetRefuseTalk(pal_227_schiffswache,20);
		Npc_SetRefuseTalk(pal_228_schiffswache,20);
	};
};

func void b_assignschiffswacheninfos(var C_NPC schiffswache)
{
	if(MIS_OCGATEOPEN == TRUE)
	{
		if(schiffswache.voice == 4)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_04_00");	//Ti zatracen� sk�eti vzali �tokem Garond�v hrad. Mus�me jednat rychle.
		};
		if(schiffswache.voice == 9)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_09_01");	//Kdybychom chytili toho zr�dce, co otev�el hlavn� br�nu do hradu, ud�lali bychom s n�m kr�tk� proces.
		};
		if(schiffswache.voice == 12)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_12_02");	//U� nem��eme d�le �ekat. Chlapi v Hornick�m �dol� pot�ebuj� na�i pomoc d��v, ne� za�to�� dal�� vlna.
		};
	}
	else
	{
		if(schiffswache.voice == 4)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_04_03");	//Garond ��d� �plnou mobilizaci. Do Hornick�ho �dol� se vyd�me co nevid�t.
		};
		if(schiffswache.voice == 9)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_09_04");	//Sk�eti mus� dostat po��dnou lekci.
		};
		if(schiffswache.voice == 12)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_12_05");	//Nem��u se do�kat, a� t�m sk�et�m d�me co proto. Za�neme u� brzo.
		};
	};
	AI_StopProcessInfos(schiffswache);
};

func void b_assignschiffswachentalk(var C_NPC schiffswache)
{
	if(KAPITEL >= 5)
	{
		b_assignschiffswacheninfos(schiffswache);
	}
	else
	{
		b_assignschiffswachenguard(schiffswache);
	};
};

func int b_assignschiffswacheninfoconditions(var C_NPC schiffswache)
{
	if((KAPITEL < 5) && (Npc_RefuseTalk(self) == FALSE) && (MIS_SCVISITSHIP != LOG_RUNNING))
	{
		return TRUE;
	}
	else if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

