
instance Sld_808_Jarvis(Npc_Default)
{
	name[0] = "Джарвис";
	guild = GIL_SLD;
	id = 808;
	voice = 4;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	attribute[ATR_REGENERATEMANA] = 1;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_jarvis_waffer);
	EquipItem(self,ItAr_Shield_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Torlof,BodyTex_N,itar_sld_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,29);
	daily_routine = Rtn_Start_808;
};


func void Rtn_Start_808()
{
	TA_Sit_Chair(7,5,0,5,"NW_BIGFARM_KITCHEN_07");
	TA_Sleep(0,5,7,5,"NW_BIGFARM_HOUSE_08");
};

func void rtn_inbattle_808()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8662");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8662");
};

