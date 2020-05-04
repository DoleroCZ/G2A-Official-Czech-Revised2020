
func void b_addcityguidechoices()
{
	Info_ClearChoices(dia_cityguide);
	if(!c_isquarternearest(self,Q_UNTERSTADT))
	{
		Info_AddChoice(dia_cityguide,"Do dolnÌ Ë·sti mÏsta.",dia_cityguide_unterstadt);
	};
	if(!c_isquarternearest(self,Q_OBERSTADT))
	{
		Info_AddChoice(dia_cityguide,"Do hornÌ Ëtvrti.",dia_cityguide_oberstadt);
	};
	if(!c_isquarternearest(self,Q_TEMPEL))
	{
		Info_AddChoice(dia_cityguide,"K Adanovu chr·mu.",dia_cityguide_tempel);
	};
	if(!c_isquarternearest(self,Q_MARKT))
	{
		Info_AddChoice(dia_cityguide,"Na trûiötÏ.",dia_cityguide_markt);
	};
	if(!c_isquarternearest(self,Q_GALGEN))
	{
		Info_AddChoice(dia_cityguide,"Na öibeniËnÌ n·mÏstÌ.",dia_cityguide_galgen);
	};
	if(!c_isquarternearest(self,Q_KASERNE))
	{
		Info_AddChoice(dia_cityguide,"Do kas·ren.",dia_cityguide_kaserne);
	};
	if(!c_isquarternearest(self,Q_HAFEN))
	{
		Info_AddChoice(dia_cityguide,"Do p¯ÌstavnÌ Ëtvrti.",dia_cityguide_hafen);
	};
	Info_AddChoice(dia_cityguide,"DÌky - to je vöe, co jsem chtÏl vÏdÏt!",dia_cityguide_back);
};


instance DIA_CITYGUIDE(C_INFO)
{
	nr = 700;
	condition = dia_cityguide_condition;
	information = dia_cityguide_info;
	permanent = TRUE;
	description = "Co mi m˘ûeö ¯Ìct o tomhle mÌstÏ?";
};


func int dia_cityguide_condition()
{
	return TRUE;
};

func void dia_cityguide_info()
{
	AI_Output(other,self,"DIA_CITYGUIDE_15_00");	//Co mi m˘ûeö ¯Ìct o tomhle mÌstÏ?
	if(c_npcisinquarter(self) == Q_UNTERSTADT)
	{
		b_say(self,other,"$UNTERSTADT");
	}
	else if(c_npcisinquarter(self) == Q_OBERSTADT)
	{
		b_say(self,other,"$OBERSTADT");
	}
	else if(c_npcisinquarter(self) == Q_TEMPEL)
	{
		b_say(self,other,"$TEMPEL");
	}
	else if(c_npcisinquarter(self) == Q_MARKT)
	{
		b_say(self,other,"$MARKT");
	}
	else if(c_npcisinquarter(self) == Q_GALGEN)
	{
		b_say(self,other,"$GALGEN");
	}
	else if(c_npcisinquarter(self) == Q_KASERNE)
	{
		b_say(self,other,"$KASERNE");
	}
	else if(c_npcisinquarter(self) == Q_HAFEN)
	{
		b_say(self,other,"$HAFEN");
	};
	b_say(self,other,"$WHERETO");
	b_addcityguidechoices();
};

func void dia_cityguide_back()
{
	AI_Output(other,self,"DIA_CITYGUIDE_BACK_15_00");	//DÌky - to je vöe, co jsem chtÏl vÏdÏt!
	Info_ClearChoices(dia_cityguide);
};

func void dia_cityguide_unterstadt()
{
	AI_Output(other,self,"DIA_CITYGUIDE_UNTERSTADT_15_00");	//Jak se dostanu do dolnÌ Ë·sti mÏsta?
	if(c_npcisinquarter(self) == Q_OBERSTADT)
	{
		b_say(self,other,"$OBERSTADT_2_UNTERSTADT");
	}
	else if(c_npcisinquarter(self) == Q_TEMPEL)
	{
		b_say(self,other,"$TEMPEL_2_UNTERSTADT");
	}
	else if(c_npcisinquarter(self) == Q_MARKT)
	{
		b_say(self,other,"$MARKT_2_TEMPEL");
		b_say(self,other,"$TEMPEL_2_UNTERSTADT");
	}
	else if(c_npcisinquarter(self) == Q_GALGEN)
	{
		b_say(self,other,"$GALGEN_2_TEMPEL");
		b_say(self,other,"$TEMPEL_2_UNTERSTADT");
	}
	else if(c_npcisinquarter(self) == Q_KASERNE)
	{
		b_say(self,other,"$KASERNE_2_GALGEN");
		b_say(self,other,"$GALGEN_2_TEMPEL");
		b_say(self,other,"$TEMPEL_2_UNTERSTADT");
	}
	else if(c_npcisinquarter(self) == Q_HAFEN)
	{
		b_say(self,other,"$HAFEN_2_UNTERSTADT");
	};
	b_addcityguidechoices();
};

func void dia_cityguide_oberstadt()
{
	AI_Output(other,self,"DIA_CITYGUIDE_OBERSTADT_15_00");	//Jak se dostanu do hornÌ Ë·sti mÏsta?
	if(c_npcisinquarter(self) == Q_UNTERSTADT)
	{
		b_say(self,other,"$UNTERSTADT_2_OBERSTADT");
	}
	else if(c_npcisinquarter(self) == Q_TEMPEL)
	{
		b_say(self,other,"$TEMPEL_2_UNTERSTADT");
		b_say(self,other,"$UNTERSTADT_2_OBERSTADT");
	}
	else if(c_npcisinquarter(self) == Q_MARKT)
	{
		b_say(self,other,"$MARKT_2_TEMPEL");
		b_say(self,other,"$TEMPEL_2_UNTERSTADT");
		b_say(self,other,"$UNTERSTADT_2_OBERSTADT");
	}
	else if(c_npcisinquarter(self) == Q_GALGEN)
	{
		b_say(self,other,"$GALGEN_2_TEMPEL");
		b_say(self,other,"$TEMPEL_2_UNTERSTADT");
		b_say(self,other,"$UNTERSTADT_2_OBERSTADT");
	}
	else if(c_npcisinquarter(self) == Q_KASERNE)
	{
		b_say(self,other,"$KASERNE_2_GALGEN");
		b_say(self,other,"$GALGEN_2_TEMPEL");
		b_say(self,other,"$TEMPEL_2_UNTERSTADT");
		b_say(self,other,"$UNTERSTADT_2_OBERSTADT");
	}
	else if(c_npcisinquarter(self) == Q_HAFEN)
	{
		b_say(self,other,"$HAFEN_2_UNTERSTADT");
		b_say(self,other,"$UNTERSTADT_2_OBERSTADT");
	};
	b_addcityguidechoices();
};

func void dia_cityguide_tempel()
{
	AI_Output(other,self,"DIA_CITYGUIDE_TEMPEL_15_00");	//Hled·m chr·m.
	if(c_npcisinquarter(self) == Q_UNTERSTADT)
	{
		b_say(self,other,"$UNTERSTADT_2_TEMPEL");
	}
	else if(c_npcisinquarter(self) == Q_OBERSTADT)
	{
		b_say(self,other,"$OBERSTADT_2_UNTERSTADT");
		b_say(self,other,"$UNTERSTADT_2_TEMPEL");
	}
	else if(c_npcisinquarter(self) == Q_MARKT)
	{
		b_say(self,other,"$MARKT_2_TEMPEL");
	}
	else if(c_npcisinquarter(self) == Q_GALGEN)
	{
		b_say(self,other,"$GALGEN_2_TEMPEL");
	}
	else if(c_npcisinquarter(self) == Q_KASERNE)
	{
		b_say(self,other,"$KASERNE_2_MARKT");
		b_say(self,other,"$MARKT_2_TEMPEL");
	}
	else if(c_npcisinquarter(self) == Q_HAFEN)
	{
		b_say(self,other,"$HAFEN_2_UNTERSTADT");
		b_say(self,other,"$UNTERSTADT_2_TEMPEL");
	};
	b_addcityguidechoices();
};

func void dia_cityguide_markt()
{
	AI_Output(other,self,"DIA_CITYGUIDE_MARKT_15_00");	//Kde je trûiötÏ?
	if(c_npcisinquarter(self) == Q_UNTERSTADT)
	{
		b_say(self,other,"$UNTERSTADT_2_TEMPEL");
		b_say(self,other,"$TEMPEL_2_MARKT");
	}
	else if(c_npcisinquarter(self) == Q_OBERSTADT)
	{
		b_say(self,other,"$OBERSTADT_2_UNTERSTADT");
		b_say(self,other,"$UNTERSTADT_2_TEMPEL");
		b_say(self,other,"$TEMPEL_2_MARKT");
	}
	else if(c_npcisinquarter(self) == Q_TEMPEL)
	{
		b_say(self,other,"$TEMPEL_2_MARKT");
	}
	else if(c_npcisinquarter(self) == Q_GALGEN)
	{
		b_say(self,other,"$GALGEN_2_MARKT");
	}
	else if(c_npcisinquarter(self) == Q_KASERNE)
	{
		b_say(self,other,"$KASERNE_2_MARKT");
	}
	else if(c_npcisinquarter(self) == Q_HAFEN)
	{
		b_say(self,other,"$HAFEN_2_UNTERSTADT");
		b_say(self,other,"$UNTERSTADT_2_TEMPEL");
		b_say(self,other,"$TEMPEL_2_MARKT");
	};
	b_addcityguidechoices();
};

func void dia_cityguide_galgen()
{
	AI_Output(other,self,"DIA_CITYGUIDE_GALGEN_15_00");	//Jak se dostanu na öibeniËnÌ n·mÏstÌ?
	if(c_npcisinquarter(self) == Q_UNTERSTADT)
	{
		b_say(self,other,"$UNTERSTADT_2_TEMPEL");
		b_say(self,other,"$TEMPEL_2_GALGEN");
	}
	else if(c_npcisinquarter(self) == Q_OBERSTADT)
	{
		b_say(self,other,"$OBERSTADT_2_UNTERSTADT");
		b_say(self,other,"$UNTERSTADT_2_TEMPEL");
		b_say(self,other,"$TEMPEL_2_GALGEN");
	}
	else if(c_npcisinquarter(self) == Q_TEMPEL)
	{
		b_say(self,other,"$TEMPEL_2_GALGEN");
	}
	else if(c_npcisinquarter(self) == Q_MARKT)
	{
		b_say(self,other,"$MARKT_2_GALGEN");
	}
	else if(c_npcisinquarter(self) == Q_KASERNE)
	{
		b_say(self,other,"$KASERNE_2_GALGEN");
	}
	else if(c_npcisinquarter(self) == Q_HAFEN)
	{
		b_say(self,other,"$HAFEN_2_UNTERSTADT");
		b_say(self,other,"$UNTERSTADT_2_TEMPEL");
		b_say(self,other,"$TEMPEL_2_GALGEN");
	};
	b_addcityguidechoices();
};

func void dia_cityguide_kaserne()
{
	AI_Output(other,self,"DIA_CITYGUIDE_KASERNE_15_00");	//Kde jsou kas·rna?
	if(c_npcisinquarter(self) == Q_UNTERSTADT)
	{
		b_say(self,other,"$UNTERSTADT_2_TEMPEL");
		b_say(self,other,"$TEMPEL_2_GALGEN");
		b_say(self,other,"$GALGEN_2_KASERNE");
	}
	else if(c_npcisinquarter(self) == Q_OBERSTADT)
	{
		b_say(self,other,"$OBERSTADT_2_UNTERSTADT");
		b_say(self,other,"$UNTERSTADT_2_TEMPEL");
		b_say(self,other,"$TEMPEL_2_GALGEN");
		b_say(self,other,"$GALGEN_2_KASERNE");
	}
	else if(c_npcisinquarter(self) == Q_TEMPEL)
	{
		b_say(self,other,"$TEMPEL_2_GALGEN");
		b_say(self,other,"$GALGEN_2_KASERNE");
	}
	else if(c_npcisinquarter(self) == Q_MARKT)
	{
		b_say(self,other,"$MARKT_2_KASERNE");
	}
	else if(c_npcisinquarter(self) == Q_GALGEN)
	{
		b_say(self,other,"$GALGEN_2_KASERNE");
	}
	else if(c_npcisinquarter(self) == Q_HAFEN)
	{
		b_say(self,other,"$HAFEN_2_UNTERSTADT");
		b_say(self,other,"$UNTERSTADT_2_TEMPEL");
		b_say(self,other,"$TEMPEL_2_GALGEN");
		b_say(self,other,"$GALGEN_2_KASERNE");
	};
	b_addcityguidechoices();
};

func void dia_cityguide_hafen()
{
	AI_Output(other,self,"DIA_CITYGUIDE_HAFEN_15_00");	//Kde je p¯ÌstavnÌ Ëtvrù?
	if(c_npcisinquarter(self) == Q_UNTERSTADT)
	{
		b_say(self,other,"$UNTERSTADT_2_HAFEN");
	}
	else if(c_npcisinquarter(self) == Q_OBERSTADT)
	{
		b_say(self,other,"$OBERSTADT_2_UNTERSTADT");
		b_say(self,other,"$UNTERSTADT_2_HAFEN");
	}
	else if(c_npcisinquarter(self) == Q_TEMPEL)
	{
		b_say(self,other,"$TEMPEL_2_UNTERSTADT");
		b_say(self,other,"$UNTERSTADT_2_HAFEN");
	}
	else if(c_npcisinquarter(self) == Q_MARKT)
	{
		b_say(self,other,"$MARKT_2_TEMPEL");
		b_say(self,other,"$TEMPEL_2_UNTERSTADT");
		b_say(self,other,"$UNTERSTADT_2_HAFEN");
	}
	else if(c_npcisinquarter(self) == Q_GALGEN)
	{
		b_say(self,other,"$GALGEN_2_TEMPEL");
		b_say(self,other,"$TEMPEL_2_UNTERSTADT");
		b_say(self,other,"$UNTERSTADT_2_HAFEN");
	}
	else if(c_npcisinquarter(self) == Q_KASERNE)
	{
		b_say(self,other,"$KASERNE_2_GALGEN");
		b_say(self,other,"$GALGEN_2_TEMPEL");
		b_say(self,other,"$TEMPEL_2_UNTERSTADT");
		b_say(self,other,"$UNTERSTADT_2_HAFEN");
	};
	b_addcityguidechoices();
};

func void b_assigncityguide(var C_NPC slf)
{
	dia_cityguide.npc = Hlp_GetInstanceID(slf);
};

