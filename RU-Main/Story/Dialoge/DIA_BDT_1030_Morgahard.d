
instance DIA_Morgahard_EXIT(C_Info)
{
	npc = BDT_1030_Morgahard;
	nr = 999;
	condition = DIA_Morgahard_EXIT_Condition;
	information = DIA_Morgahard_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Morgahard_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Morgahard_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Morgahard_HALLO(C_Info)
{
	npc = BDT_1030_Morgahard;
	nr = 3;
	condition = DIA_Morgahard_HALLO_Condition;
	information = DIA_Morgahard_HALLO_Info;
	description = "Ты Моргахард.";
};


func int DIA_Morgahard_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Morgahard_HALLO_Info()
{
	AI_Output(other,self,"DIA_Morgahard_HALLO_15_00");	//Ты Моргахард.
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_01");	//Откуда ты знаешь мое имя?
	AI_Output(other,self,"DIA_Morgahard_HALLO_15_02");	//Тебя ищет судья. Ты сбежал из тюрьмы.
	AI_Output(other,self,"DIA_Morgahard_HALLO_15_03");	//Что ты сделал такого? Украл его бумажник?
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_04");	//Не его! Главы города, по его наводке.
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_05");	//А после того как мы напали на него, он не захотел делиться награбленным с нами и посадил нас за решетку.
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_06");	//Нам не хотелось болтаться на виселице, поэтому мы сбежали.
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_07");	//Мы думали, что нас здесь не найдут. Но похоже, мы ошибались.
	Info_ClearChoices(DIA_Morgahard_HALLO);
	Info_AddChoice(DIA_Morgahard_HALLO,"Хватит хныкать! Доставай свое оружие.",DIA_Morgahard_HALLO_attack);
	Info_AddChoice(DIA_Morgahard_HALLO,"Что мы можем сделать с судьей?",DIA_Morgahard_HALLO_richter);
	Info_AddChoice(DIA_Morgahard_HALLO,"Судья приказал мне убить тебя.",DIA_Morgahard_HALLO_tot);
	B_LogEntry(TOPIC_RichterLakai,"Я нашел Моргахарда, главаря бродяг.");
	SCFoundMorgahard = TRUE;
	B_GivePlayerXP(XP_FoundMorgahard);
};

func void DIA_Morgahard_HALLO_tot()
{
	AI_Output(other,self,"DIA_Morgahard_HALLO_tot_15_00");	//Судья приказал мне убить тебя.
	AI_Output(self,other,"DIA_Morgahard_HALLO_tot_07_01");	//Да, конечно. За этим ты и пришел, да?
};

func void DIA_Morgahard_HALLO_richter()
{
	AI_Output(other,self,"DIA_Morgahard_HALLO_richter_15_00");	//Что мы можем сделать с судьей?
	AI_Output(self,other,"DIA_Morgahard_HALLO_richter_07_01");	//Ничего. Он засел в верхнем квартале города как паук в паутине. Неприкосновенный.
	AI_Output(other,self,"DIA_Morgahard_HALLO_richter_15_02");	//Я бы так не сказал. Нам нужно доказательство его вины в деле главы города.
	AI_Output(self,other,"DIA_Morgahard_HALLO_richter_07_03");	//Доказательство говоришь? У меня есть оно. Но кто послушает беглого преступника?
	AI_Output(other,self,"DIA_Morgahard_HALLO_richter_15_04");	//Дай мне это доказательство, и я позабочусь, чтобы за вами больше никто не охотился.
	AI_Output(self,other,"DIA_Morgahard_HALLO_richter_07_05");	//Ты уверен? Хорошо. Вот, возьми это письмо. Оно подписано судьей.
	B_GiveInvItems(self,other,ItWr_RichterKomproBrief_MIS,1);
	AI_Output(self,other,"DIA_Morgahard_HALLO_richter_07_06");	//Если это и не снимет с меня вину, оно позволит доказать, что судья был соучастником в этом деле.
	B_LogEntry(TOPIC_RichterLakai,"Моргахард передал мне бумагу с приказом судьи. Этот клочок бумаги доказывает, что судья ограбил главу города Лариуса. Я думаю, это именно то, что хотел найти Ли.");
	AI_StopProcessInfos(self);
};

var int MorgahardSucked;

func void DIA_Morgahard_HALLO_attack()
{
	AI_Output(other,self,"DIA_Morgahard_HALLO_attack_15_00");	//Хватит хныкать! Доставай свое оружие. Мы положим этому делу конец.
	AI_Output(self,other,"DIA_Morgahard_HALLO_attack_07_01");	//Отлично. Мне все равно нечего терять.
	AI_StopProcessInfos(self);
	MorgahardSucked = TRUE;
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};

instance DIA_Morgahard_Nickname(C_Info)
{
	npc = BDT_1030_Morgahard;
	nr = 3;
	condition = DIA_Morgahard_Nickname_Condition;
	information = DIA_Morgahard_Nickname_Info;
	permanent = FALSE;
	description = "Аделхард, часом, не твой родственник?";
};

func int DIA_Morgahard_Nickname_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && Npc_KnowsInfo(other,DIA_Morgahard_HALLO) && (MorgahardSucked == FALSE) && (AlehardHere == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Morgahard_Nickname_Info()
{
	AI_Output(other,self,"DIA_Morgahard_Nickname_01_00");	//Аделхард, часом, не твой родственник?
	AI_Output(self,other,"DIA_Morgahard_Nickname_01_01");	//Кто?! Алехард?... Не знаю никакого Алехарда.
	AI_Output(other,self,"DIA_Morgahard_Nickname_01_02");	//Вообще-то, я сказал 'Аделхард'.
	AI_Output(self,other,"DIA_Morgahard_Nickname_01_03");	//И его не знаю.
	AI_Output(other,self,"DIA_Morgahard_Nickname_01_04");	//Да их не двое, а всего один - А-дел-хард!
	AI_Output(self,other,"DIA_Morgahard_Nickname_01_05");	//По-моему, ты просто издеваешься надо мной! Иди к черту!
	AI_Output(other,self,"DIA_Morgahard_Nickname_01_06");	//Воу, воу, полегче! Я просто спросил. Без всякой задней мысли.
	AI_Output(self,other,"DIA_Morgahard_Nickname_01_07");	//Ага, ты на моем веку не первый такой 'просто спрашивающий'. Никого я не знаю, понял?!
	AI_Output(self,other,"DIA_Morgahard_Nickname_01_08");	//Ни Алехарда, ни Леонарда, ни Бернарда, ни Фернандо... хотя, Фернандо я знаю...(с издевкой) Он тебя не интересует случайно?!
	AI_Output(other,self,"DIA_Morgahard_Nickname_01_09");	//Нет.
	AI_Output(self,other,"DIA_Morgahard_Nickname_01_10");	//Жаль!
	AI_Output(other,self,"DIA_Morgahard_Nickname_01_11");	//У вас с Аделхардом похожие имена, у них окончание одно, вот я и подумал...
	AI_Output(self,other,"DIA_Morgahard_Nickname_01_12");	//Ох! Он подумал! Вон, у Лариуса с Корнелиусом тоже имена одинаково заканчиваются! Может, они муж с женой? Спроси при встрече!
	AI_Output(other,self,"DIA_Morgahard_Nickname_01_13");	//А это идея.
};

instance DIA_Morgahard_Perm(C_Info)
{
	npc = BDT_1030_Morgahard;
	nr = 3;
	condition = DIA_Morgahard_Perm_Condition;
	information = DIA_Morgahard_Perm_Info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Morgahard_Perm_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && Npc_KnowsInfo(other,DIA_Morgahard_HALLO) && (MorgahardSucked == FALSE) && (AlehardHere == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Morgahard_Perm_Info()
{
	AI_Output(self,other,"DIA_Morgahard_Perm_07_00");	//А этот подлец судья... Я еще увижу его болтающимся на виселице.
	AI_StopProcessInfos(self);
};


instance DIA_Morgahard_Perm2(C_Info)
{
	npc = BDT_1030_Morgahard;
	nr = 3;
	condition = DIA_Morgahard_Perm2_Condition;
	information = DIA_Morgahard_Perm2_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Morgahard_Perm2_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MorgahardSucked == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Morgahard_Perm2_Info()
{
	AI_Output(self,other,"DIA_Morgahard_Perm2_07_00");	//Почему бы тебе просто не исчезнуть?
	AI_StopProcessInfos(self);
};


instance DIA_Morgahard_PICKPOCKET(C_Info)
{
	npc = BDT_1030_Morgahard;
	nr = 900;
	condition = DIA_Morgahard_PICKPOCKET_Condition;
	information = DIA_Morgahard_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Morgahard_PICKPOCKET_Condition()
{
	return C_Beklauen(73,45);
};

func void DIA_Morgahard_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Morgahard_PICKPOCKET);
	Info_AddChoice(DIA_Morgahard_PICKPOCKET,Dialog_Back,DIA_Morgahard_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Morgahard_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Morgahard_PICKPOCKET_DoIt);
};

func void DIA_Morgahard_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Morgahard_PICKPOCKET);
};

func void DIA_Morgahard_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Morgahard_PICKPOCKET);
};