
instance DIA_SHMAN_6013_EXIT(C_Info)
{
	npc = vlk_6013_shman;
	nr = 999;
	condition = dia_shman_6013_exit_condition;
	information = dia_shman_6013_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_shman_6013_exit_condition()
{
	return TRUE;
};

func void dia_shman_6013_exit_info()
{
	AI_StopProcessInfos(self);
};

