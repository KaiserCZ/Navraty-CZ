
instance PIR_1368_Addon_Malcom(Npc_Default)
{
	name[0] = "Malcom";
	guild = GIL_PIR;
	id = 1368;
	voice = 4;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Piratensaebel);
	CreateInvItems(self,ItWr_TwoHStonePlate3_Addon,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Normal_Sly,BodyTex_N,ITAR_PIR_L_Addon);
	Mdl_SetModelFatness(self,1.1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Pirate.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_PreStart_1368;
};


func void Rtn_PreStart_1368()
{
	TA_Sit_Campfire(6,0,10,0,"ADW_PIRATECAMP_LUMBER_SIT");
	TA_Saw(10,0,14,0,"ADW_PIRATECAMP_WAY_15");
	TA_Sit_Campfire(14,0,18,0,"ADW_PIRATECAMP_LUMBER_SIT");
	TA_Saw(18,0,22,0,"ADW_PIRATECAMP_WAY_15");
	TA_Sit_Campfire(22,0,2,0,"ADW_PIRATECAMP_LUMBER_SIT");
	TA_Sit_Campfire(2,0,6,0,"ADW_PIRATECAMP_LUMBER_SIT");
};

func void Rtn_Start_1368()
{
	TA_Sleep(6,0,18,0,"ADW_PIRATECAMP_SECRETCAVE_02");
	TA_Sleep(18,0,6,0,"ADW_PIRATECAMP_SECRETCAVE_02");
};

func void rtn_tot_1368()
{
	TA_Stand_Guarding(8,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,8,0,"TOT");
};

