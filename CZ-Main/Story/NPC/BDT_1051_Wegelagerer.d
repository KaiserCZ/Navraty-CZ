
instance BDT_1051_Wegelagerer(Npc_Default)
{
	name[0] = "Tulák";
	guild = GIL_BDT;
	id = 1051;
	voice = 7;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Sword_New);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Normal06,BodyTex_N,ItAr_BDT_H);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	start_aistate = ZS_Smalltalk;
};

