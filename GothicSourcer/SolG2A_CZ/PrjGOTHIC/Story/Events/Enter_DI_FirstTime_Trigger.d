
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
				b_logentry(TOPIC_HALLENVONIRDORATH,"Dnes v noci jsem mìl zvláštní sen. Hovoøil se mnou Xardas a žádal mì, abych na lodi pøistoupil k alchymistické kolonì a nìco odtamtud sebral. Bylo to velmi zvláštní, protože jsem veèer pøed tím kupodivu vùbec nic nepil. Možná to bylo delirium ze støízlivosti.");
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
			Log_AddEntry(TOPIC_MYCREW,"Kapitán Jorgen zùstane na lodi, dokud se nevrátím.");
		};
		if(TORLOFISCAPTAIN == TRUE)
		{
			Log_AddEntry(TOPIC_MYCREW,"Kapitán Torlof zùstane na lodi a bude ji hlídat po celou dobu, co budu na ostrovì. Pøitom za ním mohu zajít, pokud si budu chtít zvýšit obratnost èi sílu.");
		};
		if(JACKISCAPTAIN == TRUE)
		{
			Log_AddEntry(TOPIC_MYCREW,"Kapitán Jack zùstane tady na lodi, dokud se nevrátím. Je sice trochu vydìšený, ale doufám, že se èasem uklidní. Potøebuji ho.");
		};
		if(LEE_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Lee se po dobu mé nepøítomnosti dohlédne na loï. Také se u nìj mohu zastavit, budu-li si chtít vylepšit schopnosti boje jednoruèními a obouruèními zbranìmi.");
		};
		if(MILTENNW_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"S Miltenovou pomocí si mohu zvýšit své zásoby many.");
			if(hero.guild == GIL_KDF)
			{
				Log_AddEntry(TOPIC_MYCREW,"Milten mi krom toho mùže vysvìtlit, jak vyrobit runy.");
			};
		};
		if(LESTER_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Mám pocit, že na tom podivném ostrovì se Lesterùv stav ještì zhoršil.");
		};
		if(MARIO_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Mario je nìjaký divný. Po celou dobu plavby jen sedí na zádi a nepromluví ani slovo. ");
		};
		if(WOLF_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Wolf mì nauèí støílet z luku a kuše.");
		};
		if(VATRAS_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Vatras se uchýlil do kajuty pro mágy. Mùže mì uzdravit a prozradit mi spoustu vìcí ohlednì míchání lektvarù. ");
			if(hero.guild == GIL_KDF)
			{
				Log_AddEntry(TOPIC_MYCREW,"Vatras mi také mùže pomoci s postupem do dalšího magického kruhu. ");
			};
		};
		if(BENNET_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Bennet mì nauèí kovaøinì, když ho o to požádám.");
		};
		if(DIEGO_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Když nebudu vìdìt, kudy kam, mohu se obrátit na Diega, který mì navíc zásobí støelivem. Také mì nauèí páèit zámky a støílet z luku a kuše.");
		};
		if(GORN_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Gorn bìhem našeho výletu nezahálel a teï na loï dohlédne. Myslím, že když mu ji svìøím, bude v dobrých rukou.");
			Log_AddEntry(TOPIC_MYCREW,"S Gornovou pomocí se mohu zlepšit v ovládání obouruèních zbraní.");
		};
		if(LARES_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Lares mi slíbil, že mì nauèí plížení a jednoruènímu boji. Krom toho si u nìj mohu vylepšit obratnost.");
		};
		if(BIFF_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Biff je tak hamižný, až to bolí. Nebude snadné na nìj dohlížet.");
		};
		if(ANGAR_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Angar nemá nikde stání. Mám pocit, že se zanedlouho pustí do boje sám se sebou.");
		};
		if(GIRION_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Girion se drží poøádnì stranou - jeho trpìlivost je obdivuhodná. A pøitom je to bojový cvièitel. To se mi na konci mùže hodit.");
		};
		IntroduceChapter(KAPWECHSEL_6,KAPWECHSEL_6_TEXT,"chapter6.tga","chapter_01.wav",6000);
		ENTERDI_KAPITEL6 = TRUE;
	};
};

