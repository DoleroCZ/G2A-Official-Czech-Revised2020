
var int enterdi_kapitel6;

func void enter_di_firsttime_trigger()
{
	if(Npc_HasItems(hero,itke_ship_levelchange_mis))
	{
		Npc_RemoveInvItems(hero,itke_ship_levelchange_mis,1);
	};
	if(hero.attribute[ATR_DEXTERITY] < 15)
	{
		Wld_InsertItem(itpo_perm_dex,"FP_ITEM_DI_ENTER_05");
	};
	if(ENTERDI_KAPITEL6 == FALSE)
	{
		if(hero.guild == GIL_PAL)
		{
			CreateInvItems(archol,itru_paldestroyevil,1);
		};
		Wld_InsertItem(itmi_flask,"FP_ITEM_SHIP_12");
		if(Npc_HasItems(hero,itmi_innoseye_mis) == FALSE)
		{
			if(Npc_HasItems(hero,itmi_innoseye_discharged_mis) == FALSE)
			{
				Wld_InsertItem(itse_xardasnotfallbeutel_mis,"FP_ITEM_SHIP_12");
				SC_INNOSEYEVERGESSEN_DI = TRUE;
				b_logentry(TOPIC_HALLENVONIRDORATH,"Dnes v noci jsem m�l zvl�tn� sen. Hovo�il se mnou Xardas a ��dal m�, abych na lodi p�istoupil k alchymistick� kolon� a n�co odtamtud sebral. Bylo to velmi zvl�tn�, proto�e jsem ve�er p�ed t�m kupodivu v�bec nic nepil. Mo�n� to bylo delirium ze st��zlivosti.");
			};
			Wld_InsertItem(itmi_flask,"FP_ITEM_SHIP_06");
			if(((Npc_HasItems(hero,itat_icedragonheart) >= 1) || (Npc_HasItems(hero,itat_rockdragonheart) >= 1) || (Npc_HasItems(hero,itat_firedragonheart) >= 1) || (Npc_HasItems(hero,itat_swampdragonheart) >= 1)) == FALSE)
			{
				CreateInvItems(orkelite_antipaladinorkoberst_di,itat_rockdragonheart,1);
			};
		};
		Log_CreateTopic(TOPIC_MYCREW,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_MYCREW,LOG_RUNNING);
		if(JORGENISCAPTAIN == TRUE)
		{
			Log_AddEntry(TOPIC_MYCREW,"Kapit�n Jorgen z�stane na lodi, dokud se nevr�t�m.");
		};
		if(TORLOFISCAPTAIN == TRUE)
		{
			Log_AddEntry(TOPIC_MYCREW,"Kapit�n Torlof z�stane na lodi a bude ji hl�dat po celou dobu, co budu na ostrov�. P�itom za n�m mohu zaj�t, pokud si budu cht�t zv��it obratnost �i s�lu.");
		};
		if(JACKISCAPTAIN == TRUE)
		{
			Log_AddEntry(TOPIC_MYCREW,"Kapit�n Jack z�stane tady na lodi, dokud se nevr�t�m. Je sice trochu vyd�en�, ale douf�m, �e se �asem uklidn�. Pot�ebuji ho.");
		};
		if(LEE_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Lee se po dobu m� nep��tomnosti dohl�dne na lo�. Tak� se u n�j mohu zastavit, budu-li si cht�t vylep�it schopnosti boje jednoru�n�mi a obouru�n�mi zbran�mi.");
		};
		if(MILTENNW_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"S Miltenovou pomoc� si mohu zv��it sv� z�soby many.");
			if(hero.guild == GIL_KDF)
			{
				Log_AddEntry(TOPIC_MYCREW,"Milten mi krom toho m��e vysv�tlit, jak vyrobit runy.");
			};
		};
		if(LESTER_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"M�m pocit, �e na tom podivn�m ostrov� se Lester�v stav je�t� zhor�il.");
		};
		if(MARIO_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Mario je n�jak� divn�. Po celou dobu plavby jen sed� na z�di a nepromluv� ani slovo. ");
		};
		if(WOLF_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Wolf m� nau�� st��let z luku a ku�e.");
		};
		if(VATRAS_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Vatras se uch�lil do kajuty pro m�gy. M��e m� uzdravit a prozradit mi spoustu v�c� ohledn� m�ch�n� lektvar�. ");
			if(hero.guild == GIL_KDF)
			{
				Log_AddEntry(TOPIC_MYCREW,"Vatras mi tak� m��e pomoci s postupem do dal��ho magick�ho kruhu. ");
			};
		};
		if(BENNET_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Bennet m� nau�� kova�in�, kdy� ho o to po��d�m.");
		};
		if(DIEGO_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Kdy� nebudu v�d�t, kudy kam, mohu se obr�tit na Diega, kter� m� nav�c z�sob� st�elivem. Tak� m� nau�� p��it z�mky a st��let z luku a ku�e.");
		};
		if(GORN_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Gorn b�hem na�eho v�letu nezah�lel a te� na lo� dohl�dne. Mysl�m, �e kdy� mu ji sv���m, bude v dobr�ch rukou.");
			Log_AddEntry(TOPIC_MYCREW,"S Gornovou pomoc� se mohu zlep�it v ovl�d�n� obouru�n�ch zbran�.");
		};
		if(LARES_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Lares mi sl�bil, �e m� nau�� pl�en� a jednoru�n�mu boji. Krom toho si u n�j mohu vylep�it obratnost.");
		};
		if(BIFF_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Biff je tak hami�n�, a� to bol�. Nebude snadn� na n�j dohl�et.");
		};
		if(ANGAR_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Angar nem� nikde st�n�. M�m pocit, �e se zanedlouho pust� do boje s�m se sebou.");
		};
		if(GIRION_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Girion se dr�� po��dn� stranou - jeho trp�livost je obdivuhodn�. A p�itom je to bojov� cvi�itel. To se mi na konci m��e hodit.");
		};
		IntroduceChapter(KAPWECHSEL_6,KAPWECHSEL_6_TEXT,"chapter6.tga","chapter_01.wav",6000);
		ENTERDI_KAPITEL6 = TRUE;
	};
};

