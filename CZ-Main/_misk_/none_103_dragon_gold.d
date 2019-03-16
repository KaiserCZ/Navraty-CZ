
instance NONE_103_DRAGON_GOLD(C_Npc)
{
	name[0] = "Ashtar";
	guild = GIL_DRAGON;
	aivar[AIV_MM_REAL_ID] = ID_DRAGON_GOLD;
	id = 103;
	voice = 18;
	level = 1000;
	flags = NPC_FLAG_IMMORTAL;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 500;
	attribute[ATR_HITPOINTS_MAX] = 10000;
	attribute[ATR_HITPOINTS] = 10000;
	attribute[ATR_MANA_MAX] = 5000;
	attribute[ATR_MANA] = 5000;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 250;
	protection[PROT_FIRE] = 25;
	protection[PROT_FLY] = 1000;
	protection[PROT_MAGIC] = 100;
	damagetype = DAM_FIRE | DAM_FLY;
	damage[DAM_INDEX_FIRE] = 130;
	damage[DAM_INDEX_FLY] = 1;
	fight_tactic = FAI_DRAGON;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_DRAGON_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_MaxDistToWp] = 650;
	aivar[AIV_OriginalFightTactic] = FAI_DRAGON;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	effect = "SPELLFX_ICEDRAGONAURA";
	Mdl_SetVisual(self,"Dragon.mds");
	Mdl_SetModelScale(self,0.5,0.5,0.5);
	Mdl_SetVisualBody(self,"Dragon_Gold_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
	aivar[AIV_MM_RestStart] = OnlyRoutine;
	start_aistate = ZS_MM_Rtn_DragonRest;
};

instance Dragon_AV(C_Npc)
{
	name[0] = "Adanar, strážce Adanův";
	guild = GIL_DRAGON;
	aivar[AIV_MM_REAL_ID] = ID_DRAGON_PW;
	id = 2030;
	voice = 18;
	level = 1000;
	flags = NPC_FLAG_IMMORTAL;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	attribute[ATR_STRENGTH] = 5000;
	attribute[ATR_DEXTERITY] = 5000;
	attribute[ATR_HITPOINTS_MAX] = 50000;
	attribute[ATR_HITPOINTS] = 50000;
	attribute[ATR_MANA_MAX] = 5000;
	attribute[ATR_MANA] = 5000;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = IMMUNE;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = IMMUNE;
	protection[PROT_FLY] = IMMUNE;
	protection[PROT_MAGIC] = IMMUNE;
	damagetype = DAM_FIRE | DAM_FLY;
	damage[DAM_INDEX_FIRE] = 130;
	damage[DAM_INDEX_FLY] = 1;
	fight_tactic = FAI_DRAGON;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_DRAGON_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_MaxDistToWp] = 650;
	aivar[AIV_OriginalFightTactic] = FAI_DRAGON;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	effect = "SPELLFX_ICEDRAGONAURA";
	Mdl_SetVisual(self,"Dragon.mds");
	Mdl_SetModelScale(self,0.7,0.7,0.7);
	Mdl_SetVisualBody(self,"Dragon_RUNE_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
	aivar[AIV_MM_RestStart] = OnlyRoutine;
	start_aistate = ZS_MM_Rtn_DragonRest;
};