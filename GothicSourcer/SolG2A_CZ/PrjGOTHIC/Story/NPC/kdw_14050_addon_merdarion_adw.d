
instance KDW_14050_ADDON_MERDARION_ADW(NPC_DEFAULT)
{
	name[0] = "Merdarion";
	guild = GIL_KDW;
	id = 14050;
	voice = 6;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_MAGICUSER] = MAGIC_ALWAYS;
	aivar[AIV_IGNORESFAKEGUILD] = TRUE;
	aivar[AIV_IGNORESARMOR] = TRUE;
	b_setattributestochapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Thief",FACE_P_NORMALBART_NEFARIUS,BODYTEX_P,itar_kdw_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	b_givenpctalents(self);
	b_setfightskills(self,80);
	daily_routine = rtn_start_14050;
};


func void rtn_start_14050()
{
	ta_study_wp(6,5,7,15,"ADW_ENTRANCE_01");
	ta_study_wp(7,15,8,25,"ADW_ENTRANCE_02");
	ta_study_wp(8,25,9,35,"ADW_ENTRANCE_01");
	ta_study_wp(9,35,10,45,"ADW_ENTRANCE_02");
	ta_study_wp(10,45,11,55,"ADW_ENTRANCE_01");
	ta_study_wp(11,55,12,5,"ADW_ENTRANCE_02");
	ta_study_wp(12,5,13,15,"ADW_ENTRANCE_01");
	ta_study_wp(13,15,14,25,"ADW_ENTRANCE_02");
	ta_study_wp(14,25,15,35,"ADW_ENTRANCE_01");
	ta_study_wp(15,35,16,45,"ADW_ENTRANCE_02");
	ta_study_wp(16,45,17,55,"ADW_ENTRANCE_01");
	ta_study_wp(17,55,18,5,"ADW_ENTRANCE_02");
	ta_study_wp(18,5,19,15,"ADW_ENTRANCE_01");
	ta_study_wp(19,15,20,25,"ADW_ENTRANCE_02");
	ta_study_wp(20,25,21,35,"ADW_ENTRANCE_01");
	ta_study_wp(21,35,22,45,"ADW_ENTRANCE_02");
	ta_sleep(22,45,6,5,"ADW_ENTRANCE_BUILDING2_05");
};

