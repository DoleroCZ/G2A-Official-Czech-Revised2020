
var int npcobsessedbydmt;
var int npcobsessedbydmt_brutus;
var int npcobsessedbydmt_engrom;
var int npcobsessedbydmt_vino;
var int npcobsessedbydmt_malak;
var int npcobsessedbydmt_fernando;
var int npcobsessedbydmt_bromor;
var int npcobsessedbydmt_sekob;
var int npcobsessedbydmt_randolph;

func void b_dmtwurm()
{
	AI_Output(self,other,"DIA_NoName_ObsessedByDMT_19_00");	//My tÏ vidÏt, Ëerve. Ty nemoct utÈct.
};

func void b_npcclearobsessionbydmt(var C_NPC medium)
{
	AI_StopProcessInfos(medium);
	if(NPCOBSESSEDBYDMT == TRUE)
	{
		Npc_RemoveInvItems(medium,itar_dementor,1);
		AI_EquipBestArmor(medium);
		NPCOBSESSEDBYDMT = FALSE;
		medium.flags = 0;
		b_attack(medium,other,AR_NONE,1);
		Wld_StopEffect("DEMENTOR_FX");
		Snd_Play("MFX_FEAR_CAST");
		b_scisobsessed(medium);
		if(Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(malak))
		{
			Npc_SetTarget(bau_962_bauer,other);
			AI_StartState(bau_962_bauer,zs_flee,0,"");
			Npc_SetTarget(bau_964_bauer,other);
			AI_StartState(bau_964_bauer,zs_flee,0,"");
			Npc_SetTarget(bau_965_bauer,other);
			AI_StartState(bau_965_bauer,zs_flee,0,"");
			Npc_SetTarget(bau_966_bauer,other);
			AI_StartState(bau_966_bauer,zs_flee,0,"");
			Npc_SetTarget(bau_967_bauer,other);
			AI_StartState(bau_967_bauer,zs_flee,0,"");
			Npc_SetTarget(bau_968_bauer,other);
			AI_StartState(bau_968_bauer,zs_flee,0,"");
			Npc_SetTarget(bau_969_bauer,other);
			AI_StartState(bau_969_bauer,zs_flee,0,"");
		};
	};
};

func void b_npcobsessedbydmt(var C_NPC medium)
{
	if(NPCOBSESSEDBYDMT == FALSE)
	{
		Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
		CreateInvItems(medium,itar_dementor,1);
		AI_UnequipArmor(medium);
		AI_EquipArmor(medium,itar_dementor);
		AI_PlayAni(medium,"T_PRACTICEMAGIC5");
		Wld_PlayEffect("spellFX_Fear",medium,medium,0,0,0,FALSE);
		NPCOBSESSEDBYDMT = TRUE;
		if(Npc_HasItems(medium,itwr_dementorobsessionbook_mis) == FALSE)
		{
			CreateInvItems(medium,itwr_dementorobsessionbook_mis,1);
		};
		if(Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(brutus))
		{
			if(MIS_OCGATEOPEN == TRUE)
			{
				AI_Output(self,other,"DIA_Brutus_ObsessedByDMT_19_00");	//Otev¯enÌ br·ny p¯edstavovat velk· sluûba naöemu P·n, mal˝ smrtelnÌk. My postavit svatyni na jeho poËest na tv˘j hrob.
			}
			else
			{
				b_dmtwurm();
			};
			NPCOBSESSEDBYDMT_BRUTUS = TRUE;
		}
		else if(Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(engrom))
		{
			AI_Output(self,other,"DIA_Engrom_ObsessedByDMT_19_00");	//Obraù sebe, dokud pro tebe neb˝t p¯Ìliö pozdÏ.
			NPCOBSESSEDBYDMT_ENGROM = TRUE;
		}
		else if(Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(vino))
		{
			AI_Output(self,other,"DIA_Vino_ObsessedByDMT_19_00");	//Uû brzo jim budeme vöem velet. Ty pro n·s se sv˝mi ûalostn˝mi magick˝mi schopnostmi nep¯edstavujeö û·dnÈ nebezpeËÌ.
			NPCOBSESSEDBYDMT_VINO = TRUE;
		}
		else if(Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(malak))
		{
			AI_Output(self,other,"DIA_Malak_ObsessedByDMT_19_00");	//Nem˘ûeö tuhle duöi nijak zachr·nit, m·gu. Nikdy se nevr·tÌ do svÈho tÏla.
			NPCOBSESSEDBYDMT_MALAK = TRUE;
		}
		else if(Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(sekob))
		{
			AI_Output(self,other,"DIA_Sekob_ObsessedByDMT_19_00");	//Vzdej to, m·gu. Nem˘ûeö vyhr·t.
			NPCOBSESSEDBYDMT_SEKOB = TRUE;
		}
		else if(Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(randolph))
		{
			AI_Output(self,other,"DIA_Randolph_ObsessedByDMT_19_00");	//Nezab˝vej se se slabochy. Vöechny si je podrobÌme.
			NPCOBSESSEDBYDMT_RANDOLPH = TRUE;
		}
		else
		{
			b_dmtwurm();
			if(Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(bromor))
			{
				NPCOBSESSEDBYDMT_BROMOR = TRUE;
			};
			if(Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(fernando))
			{
				NPCOBSESSEDBYDMT_FERNANDO = TRUE;
			};
		};
		b_giveplayerxp(XP_SCFOUNDOBSESSEDNPC);
	}
	else
	{
		b_npcclearobsessionbydmt(medium);
	};
};

