
instance STRF_1135_Addon_Sklave(Npc_Default)
{
	name[0] = NAME_Addon_Sklave;
	guild = GIL_STRF;
	id = 1135;
	voice = 3;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_NoFightParker] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_P_Tough_Torrez,BodyTex_P,ITAR_Prisoner);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	EquipItem(self,ItMw_StoneHammer);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,10);
	daily_routine = Rtn_Start_1135;
};


func void Rtn_Start_1135()
{
	TA_Stand_WP(8,0,23,0,"ADW_MINE_SKLAVENTOD_05");
	TA_Stand_WP(23,0,8,0,"ADW_MINE_SKLAVENTOD_05");
};

func void Rtn_Tot_1135()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};
