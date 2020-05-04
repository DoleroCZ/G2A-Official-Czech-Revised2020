
instance DIA_ONAR_EXIT(C_INFO)
{
	npc = bau_900_onar;
	nr = 999;
	condition = dia_onar_exit_condition;
	information = dia_onar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_onar_exit_condition()
{
	return TRUE;
};

func void dia_onar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ONAR_HALLO(C_INFO)
{
	npc = bau_900_onar;
	nr = 1;
	condition = dia_onar_hallo_condition;
	information = dia_onar_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_onar_hallo_condition()
{
	if((self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_onar_hallo_info()
{
	AI_Output(self,other,"DIA_Onar_Hallo_14_00");	//Kdo t� sem pustil?!
	AI_Output(self,other,"DIA_Onar_Hallo_14_01");	//Co d�l� na m� farm�?!
};


instance DIA_ONAR_PERM(C_INFO)
{
	npc = bau_900_onar;
	nr = 1;
	condition = dia_onar_perm_condition;
	information = dia_onar_perm_info;
	permanent = TRUE;
	description = "Je tady na farm� v�echno v po��dku?";
};


func int dia_onar_perm_condition()
{
	return TRUE;
};

func void dia_onar_perm_info()
{
	AI_Output(other,self,"DIA_Onar_PERM_15_00");	//Je tady na farm� v�echno v po��dku?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_01");	//Nech�pu, co se star�. Nepat�� na farmu!
	};
	if(other.guild == GIL_SLD)
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_02");	//Samoz�ejm� douf�m, �e ano! Za to p�ece plat�m!!
		AI_Output(self,other,"DIA_Onar_PERM_14_03");	//Ud�l� nejl�p, kdy� zajde� za Torlofem a po��d� o n�jakou pr�ci.
	};
	if(other.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_04");	//Jo, jasn�. Jen si b� lovit ty sv� draky.
	};
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_05");	//Vy pokryte�t� bastardi z kl�tera tu nejste v�t�ni!
	};
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_06");	//Na�e pohostinnost se na kr�lovsk� vojska nevztahuje.
	};
};


instance DIA_ONAR_WORK(C_INFO)
{
	npc = bau_900_onar;
	nr = 2;
	condition = dia_onar_work_condition;
	information = dia_onar_work_info;
	permanent = FALSE;
	description = "Chci pro tebe pracovat!";
};


func int dia_onar_work_condition()
{
	if(LEE_SENDTOONAR == FALSE)
	{
		return TRUE;
	};
};

func void dia_onar_work_info()
{
	AI_Output(other,self,"DIA_Onar_Work_15_00");	//Chci pro tebe pracovat!
	AI_Output(self,other,"DIA_Onar_Work_14_01");	//Te� nepot�ebuju ��dn�ho dal��ho n�den�ka.
	AI_Output(self,other,"DIA_Onar_Work_14_02");	//Moji lid� se staraj� o v�echno ostatn�.
	AI_Output(self,other,"DIA_Onar_Work_14_03");	//Nem� tady co d�lat, tak mazej!
};


instance DIA_ONAR_WORKASSLD(C_INFO)
{
	npc = bau_900_onar;
	nr = 2;
	condition = dia_onar_workassld_condition;
	information = dia_onar_workassld_info;
	permanent = FALSE;
	description = "Chci se st�t �oldn��em!";
};


func int dia_onar_workassld_condition()
{
	if((LEE_SENDTOONAR == FALSE) && (ONAR_WEGENSLDWERDEN == FALSE) && Npc_KnowsInfo(other,dia_onar_work))
	{
		return TRUE;
	};
};

func void dia_onar_workassld_info()
{
	AI_Output(other,self,"DIA_Onar_WorkAsSld_15_00");	//Chci se st�t �oldn��em!
	AI_Output(self,other,"DIA_Onar_WorkAsSld_14_01");	//Ty? �oldn��? Nenech se vysm�t! Pokud bys jako �old�k za n�co st�l, musel by mi o tom Lee n�co ��ct.
	AI_Output(self,other,"DIA_Onar_WorkAsSld_14_02");	//A te� vypadni, pronto!
	ONAR_WEGENSLDWERDEN = TRUE;
};


instance DIA_ONAR_AUFSTAND(C_INFO)
{
	npc = bau_900_onar;
	nr = 3;
	condition = dia_onar_aufstand_condition;
	information = dia_onar_aufstand_info;
	permanent = FALSE;
	description = "Vzbou�ili jste se proti m�stu, nebo co jsem to zaslechl?";
};


func int dia_onar_aufstand_condition()
{
	return TRUE;
};

func void dia_onar_aufstand_info()
{
	AI_Output(other,self,"DIA_Onar_Aufstand_15_00");	//Vzbou�ili jste se proti m�stu, nebo co jsem to zaslechl?
	AI_Output(self,other,"DIA_Onar_Aufstand_14_01");	//Te� m� poslouchej. Zd�dil jsem tuhle farmu a tuhle p�du po sv�m otci.
	AI_Output(self,other,"DIA_Onar_Aufstand_14_02");	//A on ji zase zd�dil po SV�M otci.
	AI_Output(self,other,"DIA_Onar_Aufstand_14_03");	//Nedovol�m t�m nena�ranejm kr�lovskejm pitomc�m odjet s t�m v��m jen proto, aby nakrmili tu svoj� arm�du budi�kni�em�.
	AI_Output(self,other,"DIA_Onar_Aufstand_14_04");	//Ta v�lka se sk�ety nikdy neskon��. A kde budeme my? Mezi prvn�mi, co padnou.
	AI_Output(self,other,"DIA_Onar_Aufstand_14_05");	//Ne - rad�ji budu svou farmu br�nit s�m! Pen�ze, kter� takhle na�et��m, mi zaplat� celou arm�du.
};


instance DIA_ONAR_WEGENPEPE(C_INFO)
{
	npc = bau_900_onar;
	nr = 4;
	condition = dia_onar_wegenpepe_condition;
	information = dia_onar_wegenpepe_info;
	permanent = FALSE;
	description = "D�ky Bullcovi te� m�te o p�r ovc� m��.";
};


func int dia_onar_wegenpepe_condition()
{
	if(MIS_PEPE_KILLWOLVES == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_onar_wegenpepe_info()
{
	AI_Output(other,self,"DIA_Onar_WegenPepe_15_00");	//D�ky Bullcovi te� m�te o p�r ovc� m��.
	AI_Output(self,other,"DIA_Onar_WegenPepe_14_01");	//O �em to mluv�? Kdo je Bullco?
	AI_Output(other,self,"DIA_Onar_WegenPepe_15_02");	//Jeden ze �oldn���.
	AI_Output(self,other,"DIA_Onar_WegenPepe_14_03");	//Pro� by m� to m�lo zaj�mat? Jestli m� z�lusk na moje ovce, bude se muset zodpov�dat Leeovi.
	AI_Output(self,other,"DIA_Onar_WegenPepe_14_04");	//Tak co m� otravuje� s takovejma nepodstatnejma hloupostma?
	ONAR_WEGENPEPE = TRUE;
};


instance DIA_ONAR_WEGENSEKOB(C_INFO)
{
	npc = bau_900_onar;
	nr = 5;
	condition = dia_onar_wegensekob_condition;
	information = dia_onar_wegensekob_info;
	permanent = FALSE;
	description = "P�i�el jsem kv�li Sekobovu n�jmu...";
};


func int dia_onar_wegensekob_condition()
{
	if(MIS_SEKOB_REDEMITONAR == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_onar_wegensekob_info()
{
	AI_Output(other,self,"DIA_Onar_WegenSekob_15_00");	//P�i�el jsem kv�li Sekobovu n�jmu...
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Onar_WegenSekob_14_01");	//A pro� s t�m ksakru leze� za mnou? Dej ty pen�ze Torlofovi.
	}
	else
	{
		AI_Output(self,other,"DIA_Onar_WegenSekob_14_02");	//Pro� si zatracen� mysl�, �e to je TVOJE starost?
		AI_Output(other,self,"DIA_Onar_WegenSekob_15_03");	//Chci se st�t �oldn��em. V�b�r n�jemn�ho je sou��st� zkou�ky.
		ONAR_WEGENSLDWERDEN = TRUE;
	};
	AI_Output(other,self,"DIA_Onar_WegenSekob_15_04");	//Ale Sekob nem� ��dn� pen�ze. U� jsem mu to nandal.
	AI_Output(other,self,"DIA_Onar_WegenSekob_15_05");	//��k�, �e to je kv�li �patn� �rod�.
	AI_Output(self,other,"DIA_Onar_WegenSekob_14_06");	//(�ve) Ty pitom�e! Mysl�, �e nech� ty pen�ze jen tak n�kde povalovat? N�kam je ukryl!
	AI_Output(self,other,"DIA_Onar_WegenSekob_14_07");	//V�, kolik napr�elo? �patn� �roda, tup�e.
	AI_Output(self,other,"DIA_Onar_WegenSekob_14_08");	//B� a vymla� z n�j ty prachy.
	ONAR_WEGENSEKOB = TRUE;
};


instance DIA_ONAR_LEESENTME(C_INFO)
{
	npc = bau_900_onar;
	nr = 6;
	condition = dia_onar_leesentme_condition;
	information = dia_onar_leesentme_info;
	permanent = FALSE;
	description = "Poslal m� Lee. Chci tady pracovat jako �oldn��!";
};


func int dia_onar_leesentme_condition()
{
	if((LEE_SENDTOONAR == TRUE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_onar_leesentme_info()
{
	AI_Output(other,self,"DIA_Onar_LeeSentMe_15_00");	//Poslal m� Lee. Chci tady pracovat jako �oldn��!
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_01");	//U� mi o tom �ekl.
	if(ONAR_WEGENSLDWERDEN == TRUE)
	{
		AI_Output(self,other,"DIA_Onar_LeeSentMe_14_02");	//Kdy� jsem t� poprv� vid�l, nem�l jsem o tob� valn� m�n�n�.
		AI_Output(self,other,"DIA_Onar_LeeSentMe_14_03");	//Ale kdy� si Lee mysl�, �e to zvl�dne�, jsem ochoten d�t ti �anci.
	};
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_04");	//On je za tebe zodpov�dn�. Tak se koukej �init.
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_05");	//Ale ��dn� blbosti! Nech farm��e a slu�ky na pokoji a hlavn� si nic nep�ivlast�uj, jasn�?
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_06");	//S �imkoli dal��m se obra� na Leeho.
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_07");	//V�echno, o �em se pot�ebujeme bavit, se t�k� tv�ho �oldu.
	ONAR_APPROVED = TRUE;
	b_logentry(TOPIC_BECOMESLD,"Onar mi dal sv�j souhlas. Te� u� mi nic nezabr�n�, abych se p�idal k �old�k�m!");
};


var int onar_sold_day;
var int onar_sold_xp;

instance DIA_ONAR_HOWMUCH(C_INFO)
{
	npc = bau_900_onar;
	nr = 7;
	condition = dia_onar_howmuch_condition;
	information = dia_onar_howmuch_info;
	permanent = FALSE;
	description = "Tak co je s t�m �oldem?";
};


func int dia_onar_howmuch_condition()
{
	if(ONAR_APPROVED == TRUE)
	{
		return TRUE;
	};
};

func void dia_onar_howmuch_info()
{
	AI_Output(other,self,"DIA_Onar_HowMuch_15_00");	//Tak co je s t�m �oldem?
	AI_Output(self,other,"DIA_Onar_HowMuch_14_01");	//Fajn, pod�vejme...
	SOLD = 50;
	if(ONAR_WEGENSLDWERDEN == TRUE)
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_14_02");	//Nevypad� moc k sv�tu.
	};
	if(ONAR_WEGENSEKOB == TRUE)
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_14_03");	//Ty sis v�n� nebyl dvakr�t, kdy� Innos rozd�val rozum. To se pozn� podle t� v�ci se Sekobem.
		SOLD = SOLD - 10;
	};
	if((ABSOLUTIONLEVEL_FARM > 1) || ((b_getgreatestpetzcrime(self) > CRIME_NONE) && (ABSOLUTIONLEVEL_FARM > 0)))
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_14_04");	//U� jsi tu nejednou zp�sobil probl�my.
		SOLD = SOLD - 10;
	};
	if((ONAR_WEGENPEPE == TRUE) && ((ONAR_WEGENSEKOB == TRUE) || (ONAR_WEGENSLDWERDEN == TRUE)))
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_14_05");	//A po��d mi za z�dy vyv�d� sam� pt�koviny.
		SOLD = SOLD - 10;
	};
	AI_Output(self,other,"DIA_Onar_HowMuch_14_06");	//Nech m� h�dat...
	b_say_gold(self,other,SOLD);
	ONAR_SOLD_DAY = Wld_GetDay();
	ONAR_SOLD_XP = other.exp;
	AI_Output(self,other,"DIA_Onar_HowMuch_14_07");	//Co �ik�?
	Info_ClearChoices(dia_onar_howmuch);
	Info_AddChoice(dia_onar_howmuch,"N�jak� n�mitky?",dia_onar_howmuch_ok);
	Info_AddChoice(dia_onar_howmuch,"To nen� zrovna moc ...",dia_onar_howmuch_more);
	Info_AddChoice(dia_onar_howmuch,"Za den?",dia_onar_howmuch_perday);
};

func void dia_onar_howmuch_perday()
{
	AI_Output(other,self,"DIA_Onar_HowMuch_PerDay_15_00");	//Za den?
	AI_Output(self,other,"DIA_Onar_HowMuch_PerDay_14_01");	//Cos myslel? Za t�den? V�n� ti to moc nep�l�.
	AI_Output(self,other,"DIA_Onar_HowMuch_PerDay_14_02");	//Tak zvedni ten sv�j zadek a b� pro ty pen�ze.
	AI_Output(self,other,"DIA_Onar_HowMuch_PerDay_14_03");	//Nehodl�m se o to za tebe postarat.
};

func void dia_onar_howmuch_more()
{
	AI_Output(other,self,"DIA_Onar_HowMuch_More_15_00");	//To nen� zrovna moc.
	AI_Output(self,other,"DIA_Onar_HowMuch_More_14_01");	//Jasn�, jestli chce�, m��e� u m� pracovat zadarmo.
	AI_Output(self,other,"DIA_Onar_HowMuch_More_14_02");	//Mimochodem, tohle je v�echno, co dostane�!
	Log_CreateTopic(TOPIC_BONUS,LOG_NOTE);
	b_logentry(TOPIC_BONUS,"Sv�j plat si mohu u Onara vyzvednout ka�d� den.");
	Info_ClearChoices(dia_onar_howmuch);
};

func void dia_onar_howmuch_ok()
{
	AI_Output(other,self,"DIA_Onar_HowMuch_Ok_15_00");	//N�jak� n�mitky?
	AI_Output(self,other,"DIA_Onar_HowMuch_Ok_14_01");	//Taky si mysl�m. Te� zajdi za Leem.
	Log_CreateTopic(TOPIC_BONUS,LOG_NOTE);
	b_logentry(TOPIC_BONUS,"Sv�j plat si mohu u Onara vyzvednout ka�d� den.");
	Info_ClearChoices(dia_onar_howmuch);
};


instance DIA_ONAR_COLLECTGOLD(C_INFO)
{
	npc = bau_900_onar;
	nr = 8;
	condition = dia_onar_collectgold_condition;
	information = dia_onar_collectgold_info;
	permanent = TRUE;
	description = "Dej mi m�j �old!";
};


func int dia_onar_collectgold_condition()
{
	if(Npc_KnowsInfo(other,dia_onar_howmuch) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_onar_collectgold_info()
{
	AI_Output(other,self,"DIA_Onar_CollectGold_15_00");	//Dej mi m�j �old!
	if(other.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Onar_CollectGold_14_01");	//Plat�m �old�k�m, ne drakobijc�m.
	}
	else if(TORLOF_THEOTHERMISSION_TOOLATE == TRUE)
	{
		AI_Output(self,other,"DIA_Onar_CollectGold_14_02");	//Nestarej se to, co dostane� za �kol!
		AI_Output(self,other,"DIA_Onar_CollectGold_14_03");	//Ptal jsem se Torlofa, jak ti to jde. A ��kal, �e ti trv� v��nost, ne� n�co ud�l�.
		AI_Output(self,other,"DIA_Onar_CollectGold_14_04");	//Nebudu pl�tvat pen�zi na darmo�lapy.
		AI_Output(self,other,"DIA_Onar_CollectGold_14_05");	//Te� bude� n�kolik t�dn� makat bez n�roku na �old! To t� mo�n� nau��.
	}
	else if(b_getgreatestpetzcrime(self) > CRIME_NONE)
	{
		AI_Output(self,other,"DIA_Onar_CollectGold_14_06");	//Sly�el jsem, �es to zpackal. Nejd��v zajdi za Leem a dej tu v�c do po��dku.
	}
	else if(Wld_GetDay() <= ONAR_SOLD_DAY)
	{
		AI_Output(self,other,"DIA_Onar_CollectGold_14_07");	//P�esko�ilo ti snad?
		AI_Output(self,other,"DIA_Onar_CollectGold_14_08");	//Nejd��v bude� p�r dn� pracovat pro m�. �old bude� dost�vat v�dycky n�sleduj�c� den.
	}
	else if((Wld_GetDay() - 2) >= ONAR_SOLD_DAY)
	{
		if((Wld_GetDay() - 2) == ONAR_SOLD_DAY)
		{
			AI_Output(self,other,"DIA_Onar_CollectGold_14_09");	//Kdes byl v�era?
		}
		else
		{
			AI_Output(self,other,"DIA_Onar_CollectGold_14_10");	//Kdes byl posledn�ch p�r dn�?
		};
		AI_Output(self,other,"DIA_Onar_CollectGold_14_11");	//Nikdy ses tu neuk�zal.
		AI_Output(self,other,"DIA_Onar_CollectGold_14_12");	//Kdo v�, kde ses fl�kal.
		ONAR_SOLD_DAY = Wld_GetDay();
		ONAR_SOLD_XP = other.exp;
	}
	else
	{
		if(other.exp > (ONAR_SOLD_XP + 200))
		{
			AI_Output(self,other,"DIA_Onar_CollectGold_14_13");	//(zkrou�en�) No dobr�. Tady je tv�j �old.
			b_giveinvitems(self,other,itmi_gold,SOLD);
			b_say_gold(self,other,SOLD);
		}
		else
		{
			AI_Output(self,other,"DIA_Onar_CollectGold_14_14");	//Co? Ned�lal jsi nic jin�ho, ne� �e ses poflakoval kolem? Teda kdy� jsi zrovna nespal?
			AI_Output(self,other,"DIA_Onar_CollectGold_14_15");	//Za to ti platit nebudu!
		};
		ONAR_SOLD_DAY = Wld_GetDay();
		ONAR_SOLD_XP = other.exp;
	};
};


instance DIA_ONAR_MARIAGOLD(C_INFO)
{
	npc = bau_900_onar;
	nr = 9;
	condition = dia_onar_mariagold_condition;
	information = dia_onar_mariagold_info;
	permanent = FALSE;
	description = "Maria si mysl�, �e jsem nedostal dost.";
};


func int dia_onar_mariagold_condition()
{
	if(MARIA_MEHRGOLD == TRUE)
	{
		return TRUE;
	};
};

func void dia_onar_mariagold_info()
{
	AI_Output(other,self,"DIA_Onar_MariaGold_15_00");	//Maria si mysl�, �e jsem nedostal dost.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_01");	//Co?
	AI_Output(other,self,"DIA_Onar_MariaGold_15_02");	//��kala, �e bys mi m�l platit v�c.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_03");	//(remc�) Ta �ensk� taky mus� do v�eho strkat nos.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_04");	//�ekla ti kolik?
	AI_Output(other,self,"DIA_Onar_MariaGold_15_05");	//Ne.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_06");	//Dobr�, po��naje p��t�m �oldem bude� dost�vat o 10 zlat�ch v�c.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_07");	//Ale ani o minci v�c, jasn�?
	SOLD = SOLD + 10;
};


var int onar_sellsheep;

instance DIA_ONAR_WANNASHEEP(C_INFO)
{
	npc = bau_900_onar;
	nr = 10;
	condition = dia_onar_wannasheep_condition;
	information = dia_onar_wannasheep_info;
	permanent = TRUE;
	description = "Chci koupit ovci!";
};


func int dia_onar_wannasheep_condition()
{
	if(ONAR_SELLSHEEP == FALSE)
	{
		return TRUE;
	};
};

func void dia_onar_wannasheep_info()
{
	AI_Output(other,self,"DIA_Onar_WannaSheep_15_00");	//Chci koupit ovci!
	AI_Output(self,other,"DIA_Onar_WannaSheep_14_01");	//Tak co s t�m leze� sem? Vid� tu snad n�jakou ovci?
	AI_Output(other,self,"DIA_Onar_WannaSheep_15_02");	//J�...
	AI_Output(self,other,"DIA_Onar_WannaSheep_14_03");	//Jestli chce� koupit ovci, zajdi na pastvinu, je napravo od m�ho domu.
	AI_Output(self,other,"DIA_Onar_WannaSheep_14_04");	//Pepe ti n�jakou prod�.
	if(Npc_IsDead(pepe))
	{
		AI_Output(other,self,"DIA_Onar_WannaSheep_15_05");	//Pepe je mrtv�, je mi l�to.
		AI_Output(self,other,"DIA_Onar_WannaSheep_14_06");	//�! V tom p��pad�... nech mi tu za ni 200 zlat�ch a vezmi si ji z pastviny s�m.
		ONAR_SELLSHEEP = TRUE;
	};
};


instance DIA_ONAR_BUYLIESEL(C_INFO)
{
	npc = bau_900_onar;
	nr = 10;
	condition = dia_onar_buyliesel_condition;
	information = dia_onar_buyliesel_info;
	permanent = TRUE;
	description = "Tady m�, 200 zlat�ch. Dej mi tu ovci.";
};


func int dia_onar_buyliesel_condition()
{
	if(ONAR_SELLSHEEP == TRUE)
	{
		return TRUE;
	};
};

func void dia_onar_buyliesel_info()
{
	AI_Output(other,self,"DIA_Onar_BuyLiesel_15_00");	//Tady m�, 200 zlat�ch. Dej mi tu ovci.
	if(b_giveinvitems(other,self,itmi_gold,200))
	{
		AI_Output(self,other,"DIA_Onar_BuyLiesel_14_01");	//M��e� si ji z pastviny vz�t s�m.
		AI_Output(self,other,"DIA_Onar_BuyLiesel_14_02");	//Jedna z nich za tebou ur�it� p�jde. V�t�ina jich sly�� na jm�no Betsy.
		Wld_InsertNpc(follow_sheep,"NW_BIGFARM_SHEEP2_02");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Onar_BuyLiesel_14_03");	//Nem� tolik zlata. Nepl�tvej m�m drahocenn�m �asem.
	};
};

