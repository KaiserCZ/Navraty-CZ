
instance INFO_OUT_20_QUEST3(C_Info)
{
	nr = 4;
	condition = info_out_20_quest3_condition;
	information = info_out_20_quest3_info;
	permanent = TRUE;
	description = "Jak se daří?";
};


func int info_out_20_quest3_condition()
{
	return TRUE;
};

func void info_out_20_quest3_info()
{
	AI_Output(other,self,"Info_Out_20_Quest3_01_00");	//Jak se daří?
	AI_Output(self,other,"Info_Out_20_Quest3_01_01");	//Co myslíš? Jako vždy, mizerne. Mám hodně práce a nic k jídlu.
};

func void b_assignambientinfos_out_20(var C_Npc slf)
{
	info_out_20_quest3.npc = Hlp_GetInstanceID(slf);
};

