
func void b_assignschiffswachenguard(var C_NPC schiffswache)
{
	if((MIS_SHIPISFREE == TRUE) || (MIS_SCVISITSHIP == LOG_RUNNING))
	{
		if(schiffswache.voice == 4)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_Ambient_04_00");	//Sledujeme tì. Nezapomínej na to.
		};
		if(schiffswache.voice == 9)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_Ambient_09_01");	//Dokud jsi tady, nedìlej žádné potíže.
		};
		if(schiffswache.voice == 12)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_Ambient_12_02");	//Ani nepomysli na to, že bys tu mohl nìco ukrást, jasné?
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
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_04_00");	//Ti zatracení skøeti vzali útokem Garondùv hrad. Musíme jednat rychle.
		};
		if(schiffswache.voice == 9)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_09_01");	//Kdybychom chytili toho zrádce, co otevøel hlavní bránu do hradu, udìlali bychom s ním krátký proces.
		};
		if(schiffswache.voice == 12)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_12_02");	//Už nemùžeme déle èekat. Chlapi v Hornickém údolí potøebují naši pomoc døív, než zaútoèí další vlna.
		};
	}
	else
	{
		if(schiffswache.voice == 4)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_04_03");	//Garond žádá úplnou mobilizaci. Do Hornického údolí se vydáme co nevidìt.
		};
		if(schiffswache.voice == 9)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_09_04");	//Skøeti musí dostat poøádnou lekci.
		};
		if(schiffswache.voice == 12)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_12_05");	//Nemùžu se doèkat, až tìm skøetùm dáme co proto. Zaèneme už brzo.
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

