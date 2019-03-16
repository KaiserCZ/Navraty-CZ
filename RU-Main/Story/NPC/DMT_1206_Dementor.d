
instance DMT_1206_Dementor(Npc_Default)
{
	name[0] = NAME_Dementor;
	guild = GIL_DMT;
	id = 1206;
	voice = 19;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	bodyStateInterruptableOverride = TRUE;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_MadPsi,BodyTex_N,ITAR_Dementor);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_1206;
};


func void Rtn_Start_1206()
{
	TA_Circle(8,0,23,0,"NW_TROLLAREA_RITUAL_01");
	TA_Circle(23,0,8,0,"NW_TROLLAREA_RITUAL_01");
};

func void Rtn_AfterRitual_1206()
{
	TA_Stand_Dementor(6,0,7,0,"NW_TAVERN_TO_FOREST_05");
	TA_Stand_Dementor(7,0,8,0,"NW_PATH_TO_MONASTERY_07");
	TA_Stand_Dementor(8,0,9,0,"NW_TAVERN_TO_FOREST_05");
	TA_Stand_Dementor(9,0,10,0,"NW_PATH_TO_MONASTERY_07");
	TA_Stand_Dementor(10,0,11,0,"NW_TAVERN_TO_FOREST_05");
	TA_Stand_Dementor(11,0,12,0,"NW_PATH_TO_MONASTERY_07");
	TA_Stand_Dementor(12,0,13,0,"NW_TAVERN_TO_FOREST_05");
	TA_Stand_Dementor(13,0,14,0,"NW_PATH_TO_MONASTERY_07");
	TA_Stand_Dementor(14,0,15,0,"NW_TAVERN_TO_FOREST_05");
	TA_Stand_Dementor(15,0,16,0,"NW_PATH_TO_MONASTERY_07");
	TA_Stand_Dementor(16,0,17,0,"NW_TAVERN_TO_FOREST_05");
	TA_Stand_Dementor(17,0,18,0,"NW_PATH_TO_MONASTERY_07");
	TA_Stand_Dementor(18,0,19,0,"NW_TAVERN_TO_FOREST_05");
	TA_Stand_Dementor(19,0,20,0,"NW_PATH_TO_MONASTERY_07");
	TA_Stand_Dementor(20,0,21,0,"NW_TAVERN_TO_FOREST_05");
	TA_Stand_Dementor(21,0,22,0,"NW_PATH_TO_MONASTERY_07");
	TA_Stand_Dementor(22,0,23,0,"NW_TAVERN_TO_FOREST_05");
	TA_Stand_Dementor(23,0,0,0,"NW_PATH_TO_MONASTERY_07");
	TA_Stand_Dementor(0,0,1,0,"NW_TAVERN_TO_FOREST_05");
	TA_Stand_Dementor(1,0,2,0,"NW_PATH_TO_MONASTERY_07");
	TA_Stand_Dementor(2,0,3,0,"NW_TAVERN_TO_FOREST_05");
	TA_Stand_Dementor(3,0,4,0,"NW_PATH_TO_MONASTERY_07");
	TA_Stand_Dementor(4,0,5,0,"NW_TAVERN_TO_FOREST_05");
	TA_Stand_Dementor(5,0,6,0,"NW_PATH_TO_MONASTERY_07");
};

