
func void b_dia_addon_myxir_teachrequest()
{
	AI_Output(other,self,"DIA_Addon_Myxir_TeachRequest_15_00");	//Nau� m� ciz� jazyk.
};

func void b_dia_addon_myxir_teachl1()
{
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL1_12_00");	//Za�n�me n���m jednoduch�m. M��u t� nau�it jazyk roln�k�.
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL1_12_01");	//Texty, kter� jsou naps�ny v jazyce roln�k� jsou obvykle o sv�tsk�ch z�jmech, jako pr�ce, l�ska a opat�ov�n� potravin.
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL1_12_02");	//Byl to obvykl� jazyk ve m�st�. Tak�e bude� schopen porozum�t v�t�in� text�, kter� se zde nach�zej�.
};

func void b_dia_addon_myxir_teachl2()
{
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL2_12_00");	//Jazyk roln�k� u� zn�. Jazyk v�le�n�k� je n�co te���ho.
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL2_12_01");	//Texty, kter� jsou naps�ny v jazyce v�le�n�k�, jsou obvykle o zbran�ch a v�lce. Nau�� se tam u�ite�n� v�ci.
};

func void b_dia_addon_myxir_teachl3()
{
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL3_12_00");	//Vrchn� jazyk kn�� je docela slo�it� na nau�en�. Ale j� ti ho s radost� vysv�tl�m.
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL3_12_01");	//Jazyk kn�� jsou v�echny svat� texty, kter� vysv�tluj� p��b�h a magii stavitel�.
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL3_12_02");	//Ka�d� z t�chto text� je opravdov� poklad, pokud jim porozum�.
};

func void b_dia_addon_myxir_teachnomore()
{
	AI_Output(self,other,"DIA_Addon_Myxir_TeachNoMore_12_00");	//U� nen� nic, co bych ti mohl uk�zat. Mistrovsky jsi ovl�dl jazyk stavitel�.
};

func void b_dia_addon_myxir_teach_language_x()
{
	AI_Output(self,other,"DIA_Addon_Myxir_Teach_LANGUAGE_X_12_00");	//Jdi a vyzkou�ej sv� nov� znalosti. Uvid� - p�smo stavitel� u� pro tebe nen� nerozlu�titelnou z�hadou.
};

