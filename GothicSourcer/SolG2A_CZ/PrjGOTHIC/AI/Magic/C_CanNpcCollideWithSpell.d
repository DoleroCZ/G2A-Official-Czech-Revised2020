
const int COLL_DONOTHING = 0;
const int COLL_DOEVERYTHING = 1;
const int COLL_APPLYDAMAGE = 2;
const int COLL_APPLYHALVEDAMAGE = 4;
const int COLL_APPLYDOUBLEDAMAGE = 8;
const int COLL_APPLYVICTIMSTATE = 16;
const int COLL_DONTKILL = 32;

func int c_cannpccollidewithspell(var int spelltype)
{
	if(spelltype == SPL_WHIRLWIND)
	{
		if(c_npcisdown(self) || c_bodystatecontains(self,BS_SWIM) || c_bodystatecontains(self,BS_DIVE) || (self.guild == GIL_STONEGOLEM) || (self.guild == GIL_ICEGOLEM) || (self.guild == GIL_FIREGOLEM) || (self.guild == GIL_SUMMONED_GOLEM) || (self.guild == GIL_DEMON) || (self.guild == GIL_SUMMONED_DEMON) || (self.guild == GIL_TROLL) || (self.guild == GIL_SUMMONED_GOLEM) || (self.guild == GIL_DRAGON) || (self.guild == GIL_STONEGUARDIAN) || (self.flags == NPC_FLAG_IMMORTAL) || (self.guild == GIL_SHADOWBEAST) || (self.guild == GIL_GARGOYLE))
		{
			return COLL_DONOTHING;
		};
		if(c_npcisgateguard(self) == TRUE)
		{
			return COLL_APPLYDAMAGE;
		};
		return COLL_DOEVERYTHING;
	};
	if(spelltype == SPL_ICELANCE)
	{
		if(c_npcisdown(self) || c_bodystatecontains(self,BS_SWIM) || c_bodystatecontains(self,BS_DIVE))
		{
			return COLL_DONOTHING;
		};
		if((self.guild == GIL_ICEGOLEM) || (self.aivar[AIV_MM_REAL_ID] == ID_ICEWOLF) || (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ICE))
		{
			return COLL_APPLYHALVEDAMAGE;
		};
		if((self.guild == GIL_FIREGOLEM) || (self.aivar[AIV_MM_REAL_ID] == ID_FIREWARAN) || (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_FIRE) || (self.guild == GIL_GARGOYLE))
		{
			return COLL_APPLYDOUBLEDAMAGE;
		};
		return COLL_APPLYDAMAGE;
	};
	if(spelltype == SPL_THUNDERSTORM)
	{
		if(c_npcisdown(self) || c_bodystatecontains(self,BS_SWIM) || c_bodystatecontains(self,BS_DIVE))
		{
			return COLL_DONOTHING;
		};
		if((self.guild == GIL_ICEGOLEM) || (self.aivar[AIV_MM_REAL_ID] == ID_ICEWOLF) || (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ICE))
		{
			return COLL_APPLYHALVEDAMAGE;
		};
		if((self.guild == GIL_FIREGOLEM) || (self.aivar[AIV_MM_REAL_ID] == ID_FIREWARAN) || (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_FIRE) || (self.guild == GIL_GARGOYLE))
		{
			return COLL_APPLYDOUBLEDAMAGE;
		};
		return COLL_DOEVERYTHING;
	};
	if(spelltype == SPL_GEYSER)
	{
		if(c_npcisdown(self) || c_bodystatecontains(self,BS_SWIM) || c_bodystatecontains(self,BS_DIVE) || (self.guild == GIL_STONEGOLEM) || (self.guild == GIL_ICEGOLEM) || (self.guild == GIL_FIREGOLEM) || (self.guild == GIL_SUMMONED_GOLEM) || (self.guild == GIL_DEMON) || (self.guild == GIL_SUMMONED_DEMON) || (self.guild == GIL_TROLL) || (self.guild == GIL_SUMMONED_GOLEM) || (self.guild == GIL_DRAGON) || (self.guild == GIL_STONEGUARDIAN))
		{
			return COLL_DONOTHING;
		};
		return COLL_APPLYDAMAGE | COLL_DONTKILL;
	};
	if(spelltype == SPL_WATERFIST)
	{
		if(c_npcisdown(self) || c_bodystatecontains(self,BS_SWIM) || c_bodystatecontains(self,BS_DIVE))
		{
			return COLL_DONOTHING;
		};
		if((self.guild == GIL_DRAGON) || (self.guild == GIL_TROLL))
		{
			return COLL_APPLYHALVEDAMAGE;
		};
		if((self.guild == GIL_FIREGOLEM) || (self.aivar[AIV_MM_REAL_ID] == ID_FIREWARAN) || (self.guild == GIL_GARGOYLE))
		{
			return COLL_APPLYDOUBLEDAMAGE;
		};
		return COLL_APPLYDAMAGE | COLL_DONTKILL;
	};
	if(spelltype == SPL_ENERGYBALL)
	{
		if(c_npcisdown(self) || c_bodystatecontains(self,BS_SWIM) || c_bodystatecontains(self,BS_DIVE))
		{
			return COLL_DONOTHING;
		};
		if(c_npcisundead(self))
		{
			return COLL_APPLYHALVEDAMAGE;
		};
		return COLL_DOEVERYTHING;
	};
	if(spelltype == SPL_SUCKENERGY)
	{
		if(c_npcisdown(self) || c_bodystatecontains(self,BS_SWIM) || c_bodystatecontains(self,BS_DIVE) || (self.guild > GIL_SEPERATOR_HUM) || (self.flags == NPC_FLAG_IMMORTAL) || (Npc_GetDistToNpc(self,other) > 1000) || (self.guild == GIL_DMT))
		{
			return COLL_DONOTHING;
		};
		return COLL_DOEVERYTHING;
	};
	if(spelltype == SPL_GREENTENTACLE)
	{
		if(c_npcisdown(self) || c_bodystatecontains(self,BS_SWIM) || c_bodystatecontains(self,BS_DIVE) || (c_npcisgateguard(self) == TRUE) || (self.guild == GIL_BLOODFLY) || (self.guild == GIL_DEMON) || (self.guild == GIL_TROLL) || (self.guild == GIL_DRAGON) || (self.guild == GIL_HARPY) || (self.aivar[AIV_MM_REAL_ID] == ID_SKELETON_MAGE) || (self.guild == GIL_GARGOYLE))
		{
			return COLL_DONOTHING;
		};
		return COLL_DOEVERYTHING;
	};
	if(spelltype == SPL_SWARM)
	{
		if(c_npcisdown(self) || c_bodystatecontains(self,BS_SWIM) || c_bodystatecontains(self,BS_DIVE) || (self.guild == GIL_STONEGOLEM) || (self.guild == GIL_ICEGOLEM) || (self.guild == GIL_FIREGOLEM) || (self.guild == GIL_SUMMONED_GOLEM) || (self.guild == GIL_DEMON) || (self.guild == GIL_SUMMONED_DEMON) || (self.guild == GIL_TROLL) || (self.guild == GIL_BLOODFLY) || (self.guild == GIL_DRAGON) || (self.guild == GIL_GARGOYLE) || (self.guild == GIL_DMT) || (self.guild == GIL_STONEGUARDIAN) || (c_npcisundead(self) == TRUE))
		{
			return COLL_DONOTHING;
		};
		if((self.guild > GIL_SEPERATOR_HUM) || (c_npcisgateguard(self) == TRUE))
		{
			return COLL_APPLYDAMAGE;
		};
		return COLL_DOEVERYTHING;
	};
	if(spelltype == SPL_SKULL)
	{
		if(c_npcisdown(self) || c_bodystatecontains(self,BS_SWIM) || c_bodystatecontains(self,BS_DIVE) || c_npcisundead(self))
		{
			return COLL_DONOTHING;
		};
		return COLL_DOEVERYTHING;
	};
	if(spelltype == SPL_WINDFIST)
	{
		if(Npc_GetDistToNpc(other,self) >= 1000)
		{
			return COLL_DONOTHING;
		};
		return COLL_DOEVERYTHING;
	};
	if((spelltype == SPL_ZAP) || (spelltype == SPL_CHARGEZAP) || (spelltype == SPL_CONCUSSIONBOLT))
	{
		if(c_npcisdown(self))
		{
			return COLL_DONOTHING;
		};
		return COLL_APPLYDAMAGE | COLL_DONTKILL;
	};
	if(other.guild == GIL_DMT)
	{
		if((spelltype == SPL_FIRERAIN) || (spelltype == SPL_THUNDERSTORM) || (spelltype == SPL_LIGHTNINGFLASH))
		{
			if(self.guild == GIL_DMT)
			{
				return COLL_DONOTHING;
			}
			else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
			{
				return COLL_APPLYHALVEDAMAGE;
			};
		};
		if((spelltype == SPL_FIRESTORM) && (self.guild == GIL_DMT))
		{
			return COLL_DONOTHING;
		};
	};
	if((spelltype == SPL_CHARGEFIREBALL) || (spelltype == SPL_INSTANTFIREBALL) || (spelltype == SPL_FIRERAIN) || (spelltype == SPL_FIREBOLT) || (spelltype == SPL_FIRESTORM) || (spelltype == SPL_PYROKINESIS) || (spelltype == SPL_DEATHBOLT) || (spelltype == SPL_DEATHBALL))
	{
		if(c_npcisdown(self) || c_bodystatecontains(self,BS_SWIM) || c_bodystatecontains(self,BS_DIVE))
		{
			return COLL_DONOTHING;
		};
		if((self.guild == GIL_FIREGOLEM) || (self.aivar[AIV_MM_REAL_ID] == ID_FIREWARAN) || (self.guild == GIL_GARGOYLE) || (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_FIRE))
		{
			return COLL_APPLYHALVEDAMAGE;
		};
		if((self.guild == GIL_ICEGOLEM) || (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ICE) || (self.aivar[AIV_MM_REAL_ID] == ID_ICEWOLF))
		{
			return COLL_APPLYDOUBLEDAMAGE;
		};
		if((self.guild == GIL_STONEGOLEM) || (self.guild == GIL_SUMMONED_GOLEM) || (self.guild == GIL_DEMON) || (self.guild == GIL_SUMMONED_DEMON) || (self.guild == GIL_TROLL) || (self.guild == GIL_DRAGON))
		{
			return COLL_APPLYDAMAGE;
		};
		return COLL_DOEVERYTHING;
	};
	if((spelltype == SPL_ICECUBE) || (spelltype == SPL_ICEWAVE) || (spelltype == SPL_ICEBOLT))
	{
		if(c_npcisdown(self) || c_bodystatecontains(self,BS_SWIM) || c_bodystatecontains(self,BS_DIVE))
		{
			return COLL_DONOTHING;
		};
		if((self.guild == GIL_FIREGOLEM) || (self.aivar[AIV_MM_REAL_ID] == ID_FIREWARAN) || (self.guild == GIL_GARGOYLE) || (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_FIRE))
		{
			return COLL_APPLYDOUBLEDAMAGE;
		};
		if((self.guild == GIL_ICEGOLEM) || (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ICE) || (self.aivar[AIV_MM_REAL_ID] == ID_ICEWOLF))
		{
			return COLL_APPLYHALVEDAMAGE;
		};
		if((self.guild == GIL_STONEGOLEM) || (self.guild == GIL_SUMMONED_GOLEM) || (self.guild == GIL_DEMON) || (self.guild == GIL_SUMMONED_DEMON) || (self.guild == GIL_TROLL) || (self.guild == GIL_DRAGON))
		{
			return COLL_APPLYDAMAGE;
		};
		return COLL_DOEVERYTHING;
	};
	if(spelltype == SPL_LIGHTNINGFLASH)
	{
		if(c_npcisdown(self))
		{
			return COLL_DONOTHING;
		};
		if(c_bodystatecontains(self,BS_SWIM) || c_bodystatecontains(self,BS_DIVE))
		{
			return COLL_APPLYDOUBLEDAMAGE;
		};
		return COLL_DOEVERYTHING;
	};
	if(spelltype == SPL_FEAR)
	{
		if((self.guild != GIL_FIREGOLEM) && (self.guild != GIL_ICEGOLEM) && (self.guild != GIL_STONEGOLEM) && (self.guild != GIL_SUMMONED_GOLEM) && (self.guild != GIL_SWAMPSHARK) && (self.guild != GIL_TROLL) && !c_npcisevil(self) && (c_npcisgateguard(self) == FALSE))
		{
			return COLL_DOEVERYTHING;
		};
		return COLL_DONOTHING;
	};
	if(spelltype == SPL_DESTROYUNDEAD)
	{
		if(c_npcisundead(self) && (self.attribute[ATR_HITPOINTS_MAX] <= SPL_DAMAGE_DESTROYUNDEAD))
		{
			return COLL_DOEVERYTHING;
		};
		return COLL_DONOTHING;
	};
	if(spelltype == SPL_BREATHOFDEATH)
	{
		if((Npc_GetDistToNpc(other,self) < 1000) && !c_npcisundead(self))
		{
			if((self.guild == GIL_DRAGON) || (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(hero)))
			{
				return COLL_APPLYHALVEDAMAGE;
			};
			return COLL_DOEVERYTHING;
		};
		return COLL_DONOTHING;
	};
	if(spelltype == SPL_MASSDEATH)
	{
		if(!c_npcisundead(self))
		{
			if(self.guild == GIL_DRAGON)
			{
				return COLL_APPLYHALVEDAMAGE;
			};
			return COLL_DOEVERYTHING;
		};
		return COLL_DONOTHING;
	};
	if(spelltype == SPL_MASTEROFDISASTER)
	{
		if(!c_npcisdown(self) && !c_bodystatecontains(self,BS_SWIM) && !c_bodystatecontains(self,BS_DIVE) && c_npcisevil(self))
		{
			return COLL_DOEVERYTHING;
		};
		return COLL_DONOTHING;
	};
	if(spelltype == SPL_SHRINK)
	{
		if(c_npcisdown(self) || c_bodystatecontains(self,BS_SWIM) || c_bodystatecontains(self,BS_DIVE) || (self.guild == GIL_DRAGON))
		{
			return COLL_DONOTHING;
		};
		return COLL_DOEVERYTHING;
	};
	if(spelltype == SPL_PALHOLYBOLT)
	{
		if(c_npcisevil(self))
		{
			return COLL_DOEVERYTHING;
		};
		return COLL_DONOTHING;
	}
	else if(spelltype == SPL_PALREPELEVIL)
	{
		if(c_npcisevil(self))
		{
			if(self.attribute[ATR_HITPOINTS_MAX] <= SPL_DAMAGE_PALREPELEVIL)
			{
				return COLL_DOEVERYTHING;
			}
			else
			{
				return COLL_APPLYHALVEDAMAGE;
			};
		};
		return COLL_DONOTHING;
	}
	else if(spelltype == SPL_PALDESTROYEVIL)
	{
		if(c_npcisevil(self) && (self.attribute[ATR_HITPOINTS_MAX] <= SPL_DAMAGE_PALDESTROYEVIL))
		{
			return COLL_DOEVERYTHING;
		};
		return COLL_DONOTHING;
	};
	return COLL_DOEVERYTHING;
};

