
func void b_dia_addon_myxir_teachrequest()
{
	AI_Output(other,self,"DIA_Addon_Myxir_TeachRequest_15_00");	//Nauè mì cizí jazyk.
};

func void b_dia_addon_myxir_teachl1()
{
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL1_12_00");	//Zaènìme nìèím jednoduchým. Mùžu tì nauèit jazyk rolníkù.
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL1_12_01");	//Texty, které jsou napsány v jazyce rolníkù jsou obvykle o svìtských zájmech, jako práce, láska a opatøování potravin.
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL1_12_02");	//Byl to obvyklý jazyk ve mìstì. Takže budeš schopen porozumìt vìtšinì textù, které se zde nacházejí.
};

func void b_dia_addon_myxir_teachl2()
{
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL2_12_00");	//Jazyk rolníkù už znáš. Jazyk váleèníkù je nìco težšího.
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL2_12_01");	//Texty, které jsou napsány v jazyce váleèníkù, jsou obvykle o zbraních a válce. Nauèíš se tam užiteèné vìci.
};

func void b_dia_addon_myxir_teachl3()
{
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL3_12_00");	//Vrchní jazyk knìží je docela složitý na nauèení. Ale já ti ho s radostí vysvìtlím.
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL3_12_01");	//Jazyk knìží jsou všechny svaté texty, které vysvìtlují pøíbìh a magii stavitelù.
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL3_12_02");	//Každý z tìchto textù je opravdový poklad, pokud jim porozumíš.
};

func void b_dia_addon_myxir_teachnomore()
{
	AI_Output(self,other,"DIA_Addon_Myxir_TeachNoMore_12_00");	//Už není nic, co bych ti mohl ukázat. Mistrovsky jsi ovládl jazyk stavitelù.
};

func void b_dia_addon_myxir_teach_language_x()
{
	AI_Output(self,other,"DIA_Addon_Myxir_Teach_LANGUAGE_X_12_00");	//Jdi a vyzkoušej své nové znalosti. Uvidíš - písmo stavitelù už pro tebe není nerozluštitelnou záhadou.
};

