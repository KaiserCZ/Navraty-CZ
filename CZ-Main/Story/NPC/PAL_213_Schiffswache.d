
instance PAL_213_Schiffswache(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 213;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_NAILED;
	EquipItem(self,ItMw_1H_Blessed_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_B_Cavalorn,BodyTex_B,ItAr_PAL_M_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_213;
};


func void Rtn_Start_213()
{
	TA_Guard_Passage(8,0,23,0,"NW_CITY_SHIP_GUARD_01");
	TA_Guard_Passage(23,0,8,0,"NW_CITY_SHIP_GUARD_01");
};

func void Rtn_ShipFree_213()
{
	TA_Smalltalk(8,0,23,0,"NW_CITY_PALCAMP_01");
	TA_Smalltalk(23,0,8,0,"NW_CITY_PALCAMP_01");
};

