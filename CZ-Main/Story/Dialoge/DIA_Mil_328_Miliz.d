
instance DIA_328_Miliz_EXIT(C_Info)
{
	npc = Mil_328_Miliz;
	nr = 999;
	condition = DIA_328_Miliz_EXIT_Condition;
	information = DIA_328_Miliz_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_328_Miliz_EXIT_Condition()
{
	return TRUE;
};

func void DIA_328_Miliz_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_328_Miliz_Hi(C_Info)
{
	npc = Mil_328_Miliz;
	nr = 1;
	condition = DIA_328_Miliz_Hi_Condition;
	information = DIA_328_Miliz_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_328_Miliz_Hi_Condition()
{
	return TRUE;
};

func void DIA_328_Miliz_Hi_Info()
{
	AI_Output(self,other,"DIA_328_Miliz_Hi_08_00");	//Hele, tady nemáš co dělat. Rozumíš?
	AI_Output(other,self,"DIA_328_Miliz_Hi_15_01");	//Kdo jsi?
	AI_Output(self,other,"DIA_328_Miliz_Hi_08_02");	//Po tom ti vůbec nic není! Šéfuju tomu tady, jasný?
	AI_Output(other,self,"DIA_328_Miliz_Hi_15_03");	//Šéfuješ? Čemu? Těm bednám?
	AI_Output(self,other,"DIA_328_Miliz_Hi_08_04");	//Hele, skladiště spadá pod můj dohled, jasný? Tak vypadni, nebo si poneseš zuby v klobouku.
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,30);
};


instance DIA_328_Miliz_Kill(C_Info)
{
	npc = Mil_328_Miliz;
	nr = 2;
	condition = DIA_328_Miliz_Kill_Condition;
	information = DIA_328_Miliz_Kill_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_328_Miliz_Kill_Condition()
{
	if(Npc_RefuseTalk(self) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_328_Miliz_Kill_Info()
{
	AI_Output(self,other,"DIA_328_Miliz_Kill_08_00");	//Hej, ty jsi pořád ještě tady. Neříkal jsem ti, že máš vypadnout?
	AI_Output(self,other,"DIA_328_Miliz_Kill_08_01");	//Teď ti ukážu, kdo je tady šéf!
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,20);
	B_Attack(self,other,AR_KILL,1);
};

