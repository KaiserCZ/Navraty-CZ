
instance Mil_326_Miliz(Npc_Default)
{
	name[0] = NAME_Miliz;
	guild = GIL_MIL;
	id = 326;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Torlof,BodyTex_N,ItAr_MIL_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_326;
};


func void Rtn_Start_326()
{
	TA_Stand_Guarding(12,0,14,0,"NW_CITY_UPTOWN_PATH_09");
	TA_Stand_ArmsCrossed(14,0,16,0,"NW_CITY_UPTOWN_PATH_13");
	TA_Stand_Guarding(16,0,18,0,"NW_CITY_UPTOWN_PATH_05");
	TA_Stand_Guarding(18,0,21,0,"NW_CITY_UPTOWN_PATH_09");
	TA_WacheFackel(21,0,22,0,"NW_CITY_UPTOWN_PATH_13");
	TA_WacheFackel(22,0,23,30,"NW_CITY_UPTOWN_PATH_14");
	TA_WacheFackel(23,30,1,0,"NW_CITY_UPTOWN_PATH_09");
	TA_WacheFackel(1,0,2,30,"NW_CITY_UPTOWN_PATH_14");
	TA_WacheFackel(2,30,4,0,"NW_CITY_UPTOWN_PATH_09");
	TA_WacheFackel(4,0,5,30,"NW_CITY_UPTOWN_PATH_13");
	TA_Stand_Guarding(5,30,8,0,"NW_CITY_UPTOWN_PATH_09");
	TA_Stand_ArmsCrossed(8,0,10,0,"NW_CITY_UPTOWN_PATH_13");
	TA_Stand_Guarding(10,0,12,0,"NW_CITY_UPTOWN_PATH_05");
};
