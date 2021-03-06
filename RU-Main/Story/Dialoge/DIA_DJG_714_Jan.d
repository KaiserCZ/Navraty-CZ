
instance DIA_Jan_EXIT(C_Info)
{
	npc = DJG_714_Jan;
	nr = 999;
	condition = DIA_Jan_EXIT_Condition;
	information = DIA_Jan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Jan_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JAN_Hello(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_Hello_Condition;
	information = DIA_Jan_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Jan_Hello_Condition()
{
	if((Kapitel >= 4) && Npc_IsInState(self,ZS_Talk) && (MIS_OCGateOpen == FALSE))
	{
		return 1;
	};
};

func void DIA_Jan_Hello_Info()
{
	AI_Output(self,other,"DIA_Jan_Hello_10_00");	//И какой идиот затащил меня сюда?!
	AI_Output(self,other,"DIA_Jan_Hello_10_01");	//Я думал, здесь для меня действительно найдется настоящая работа. Но здесь ничего нет кроме нескольких высокомерных паладинов и банды орков.
};


instance DIA_JAN_Dragons(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_Dragons_Condition;
	information = DIA_Jan_Dragons_Info;
	permanent = FALSE;
	description = "Ты забыл о драконах!";
};


func int DIA_Jan_Dragons_Condition()
{
	if(Npc_KnowsInfo(other,DIA_JAN_Hello) && (MIS_JanBecomesSmith == FALSE) && (Kapitel == 4) && (MIS_OCGateOpen == FALSE))
	{
		return 1;
	};
};

func void DIA_Jan_Dragons_Info()
{
	AI_Output(other,self,"DIA_Jan_Dragons_15_00");	//Ты забыл о драконах!
	AI_Output(self,other,"DIA_Jan_Dragons_10_01");	//(с издевкой) Как же я мог забыть?! Знаешь что? Я кузнец, а не воин.
	AI_Output(self,other,"DIA_Jan_Dragons_10_02");	//Я делаю оружие. А сражаются им путь другие.
	AI_Output(other,self,"DIA_Jan_Dragons_15_03");	//Тогда почему ты не стоишь за этой наковальней?
	AI_Output(self,other,"DIA_Jan_Dragons_10_04");	//Паладины не подпускают меня к кузнице. Если я подойду к ней, меня бросят за решетку.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Jan_Dragons_10_05");	//Ты ведь один из них. Может, замолвишь за меня словечко?
	};
	Info_ClearChoices(DIA_JAN_Dragons);
	Info_AddChoice(DIA_JAN_Dragons,"Мне нужно идти.",DIA_JAN_Dragons_ShitHappen);
	Info_AddChoice(DIA_JAN_Dragons,"А что мне будет, если я помогу тебе?",DIA_JAN_Dragons_Reward);
	Info_AddChoice(DIA_JAN_Dragons,"Я попробую помочь тебе.",DIA_JAN_Dragons_HelpYou);
};

func void DIA_JAN_Dragons_HelpYou()
{
	AI_Output(other,self,"DIA_JAN_Dragons_HelpYou_15_00");	//Я попробую помочь тебе.
	AI_Output(self,other,"DIA_JAN_Dragons_HelpYou_10_01");	//Как тебе это удастся? Парсиваль приказал страже ни к чему нас не подпускать.
	AI_Output(self,other,"DIA_JAN_Dragons_HelpYou_10_02");	//Никто не осмелится нарушить его.
	AI_Output(other,self,"DIA_JAN_Dragons_HelpYou_15_03");	//Я сделаю все, что смогу.
	AI_Output(self,other,"DIA_JAN_Dragons_HelpYou_10_04");	//Представить себе не могу, что он послушает тебя.
	Log_CreateTopic(TOPIC_JanBecomesSmith,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JanBecomesSmith,LOG_Running);
	B_LogEntry(TOPIC_JanBecomesSmith,"Охотник на драконов Ян, находящийся в замке Долины Рудников, хочет работать в кузнице. Но Парсиваль запрещает ему это.");
	MIS_JanBecomesSmith = LOG_Running;
	Info_ClearChoices(DIA_JAN_Dragons);
};

func void DIA_JAN_Dragons_Reward()
{
	AI_Output(other,self,"DIA_JAN_Dragons_Reward_15_00");	//А что мне будет, если я помогу тебе?
	AI_Output(self,other,"DIA_JAN_Dragons_Reward_10_01");	//У меня ничего нет. Единственно, я могу научить тебя чему-нибудь.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_JAN_Dragons_Reward_10_02");	//Я знаю способ, как сделать клинок, выкованный из магической руды, еще прочнее.
	};
	Jan_TeachPlayer = TRUE;
};

func void DIA_JAN_Dragons_ShitHappen()
{
	AI_Output(other,self,"DIA_JAN_Dragons_ShitHappen_15_00");	//Мне нужно идти.
	AI_Output(self,other,"DIA_JAN_Dragons_ShitHappen_10_01");	//Все просто ужасно. Я не могу покинуть этот замок и не могу работать в кузнице.
	Info_ClearChoices(DIA_JAN_Dragons);
};


instance DIA_JAN_Home(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_Home_Condition;
	information = DIA_Jan_Home_Info;
	permanent = FALSE;
	description = "Откуда ты?";
};


func int DIA_Jan_Home_Condition()
{
	if(Npc_KnowsInfo(other,DIA_JAN_Hello) && (Kapitel >= 4) && (MIS_OCGateOpen == FALSE))
	{
		return 1;
	};
};

func void DIA_Jan_Home_Info()
{
	AI_Output(other,self,"DIA_Jan_Home_15_00");	//Откуда ты пришел?
	AI_Output(self,other,"DIA_Jan_Home_10_01");	//Я присоединился к парням с гор. И мы направились в эту долину, чтобы разбогатеть, охотясь на драконов.
	AI_Output(self,other,"DIA_Jan_Home_10_02");	//Их главаря звали Сильвио. Такая сволочь! Он обращался со мной как со своей собственностью.
};


instance DIA_JAN_OldCamp(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_OldCamp_Condition;
	information = DIA_Jan_OldCamp_Info;
	permanent = TRUE;
	description = "Что произошло в замке?";
};


func int DIA_Jan_OldCamp_Condition()
{
	if(Npc_KnowsInfo(other,DIA_JAN_Hello) && (Kapitel == 4) && (MIS_OCGateOpen == FALSE))
	{
		return 1;
	};
};

func void DIA_Jan_OldCamp_Info()
{
	AI_Output(other,self,"DIA_Jan_OldCamp_15_00");	//А что произошло в замке?
	AI_Output(self,other,"DIA_Jan_OldCamp_10_01");	//Ничего, насколько я слышал. Но, конечно, меня очень волнует, что произошло ВНЕ замка.
};


instance DIA_JAN_Parcival(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_Parcival_Condition;
	information = DIA_Jan_Parcival_Info;
	permanent = FALSE;
	description = "Я поговорил с Парсивалем.";
};


func int DIA_Jan_Parcival_Condition()
{
	if((MIS_JanBecomesSmith != LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Parcival_Jan) && (MIS_OCGateOpen == FALSE))
	{
		return 1;
	};
};

func void DIA_Jan_Parcival_Info()
{
	AI_Output(other,self,"DIA_Jan_Parcival_15_00");	//Я поговорил с Парсивалем.
	AI_Output(self,other,"DIA_Jan_Parcival_10_01");	//И?
	if(hero.guild == GIL_DJG)
	{
		AI_Output(other,self,"DIA_Jan_Parcival_15_02");	//Он не доверяет нам, охотникам на драконов.
	}
	else
	{
		AI_Output(other,self,"DIA_Jan_Parcival_15_03");	//Он не доверяет вам, охотникам на драконов.
	};
	AI_Output(self,other,"DIA_Jan_Parcival_10_04");	//Черт. Я так хочу работать.
	AI_Output(self,other,"DIA_Jan_Parcival_10_05");	//Что ж, видимо, придется смириться. Только Гаронд может помочь мне теперь.
};


instance DIA_JAN_JanIsSmith(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_JanIsSmith_Condition;
	information = DIA_Jan_JanIsSmith_Info;
	permanent = FALSE;
	description = "Берись за молот, для тебя есть работа.";
};


func int DIA_Jan_JanIsSmith_Condition()
{
	if((MIS_JanBecomesSmith == LOG_SUCCESS) && (MIS_OCGateOpen == FALSE))
	{
		return 1;
	};
};

func void DIA_Jan_JanIsSmith_Info()
{
	AI_Output(other,self,"DIA_Jan_JanIsSmith_15_00");	//Берись за молот, для тебя есть работа.
	AI_Output(self,other,"DIA_Jan_JanIsSmith_10_01");	//Ты сделал это? Как тебе удалось?
	AI_Output(other,self,"DIA_Jan_JanIsSmith_15_02");	//Мне пришлось поручиться за тебя, так что не разочаруй меня.
	AI_Output(self,other,"DIA_Jan_JanIsSmith_10_03");	//Не волнуйся. Я так рад, что опять могу работать.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"SMITH");
};


instance DIA_JAN_SellWeapons(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_SellWeapons_Condition;
	information = DIA_Jan_SellWeapons_Info;
	permanent = FALSE;
	description = "Ты продаешь оружие?";
};


func int DIA_Jan_SellWeapons_Condition()
{
	if((MIS_JanBecomesSmith == LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_JAN_JanIsSmith) && (Jan_TeachPlayer == FALSE) && (MIS_OCGateOpen == FALSE))
	{
		return 1;
	};
};

func void DIA_Jan_SellWeapons_Info()
{
	AI_Output(other,self,"DIA_Jan_SellWeapons_15_00");	//Ты продаешь оружие?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Jan_SellWeapons_10_01");	//Ни за что. Чтобы потом твои собратья бросили меня в темницу за торговлю из-под полы? Нет, забудь об этом!
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_SellWeapons_10_02");	//Мог бы, если бы оно у меня было. Но сначала я должен обеспечить оружием паладинов в замке.
	};
	AI_Output(self,other,"DIA_Jan_SellWeapons_10_03");	//Но я могу показать тебе, как ковать хорошее оружие.
	Jan_TeachPlayer = TRUE;
};


instance Jan_Training_Talente(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = Jan_Training_Talente_Condition;
	information = Jan_Training_Talente_Info;
	permanent = TRUE;
	description = "Обучи меня кузнечному делу.";
};


func int Jan_Training_Talente_Condition()
{
	if((Jan_TeachPlayer == TRUE) && Npc_KnowsInfo(other,DIA_JAN_JanIsSmith) && (MIS_OCGateOpen == FALSE))
	{
		return 1;
	};
};

func void Jan_Training_Talente_Info()
{
	AI_Output(other,self,"DIA_Jan_TeachPlayer_15_00");	//Обучи меня кузнечному делу.
	AI_Output(self,other,"DIA_Jan_TeachPlayer_10_01");	//Что именно ты хочешь научиться ковать?
	Info_ClearChoices(Jan_Training_Talente);
	Info_AddChoice(Jan_Training_Talente,Dialog_Back,Jan_Training_Smith_Back);
	if(PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		Info_AddChoice(Jan_Training_Talente,b_buildlearnstringforsmithhunt("Научиться ковать ",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_Common)),Jan_Training_Smith_Common);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE)
	{
		if((PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == FALSE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
		{
			Info_AddChoice(Jan_Training_Talente,b_buildlearnstringforsmithhunt(NAME_ItMw_1H_Special_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_01)),Jan_Training_Smith_1hSpecial1);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == FALSE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
		{
			Info_AddChoice(Jan_Training_Talente,b_buildlearnstringforsmithhunt(NAME_ItMw_2H_Special_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_01)),Jan_Training_Smith_2hSpecial1);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] == FALSE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
		{
			Info_AddChoice(Jan_Training_Talente,b_buildlearnstringforsmithhunt(NAME_ItMw_1H_Special_02,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_02)),Jan_Training_Smith_1hSpecial2);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] == FALSE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
		{
			Info_AddChoice(Jan_Training_Talente,b_buildlearnstringforsmithhunt(NAME_ItMw_2H_Special_02,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_02)),Jan_Training_Smith_2hSpecial2);
		};
	};
};

func void Jan_Training_Smith_Back()
{
	Info_ClearChoices(Jan_Training_Talente);
};

func void Jan_Training_Smith_Common()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_Common);
};

func void Jan_Training_Smith_1hSpecial1()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_01);
};

func void Jan_Training_Smith_2hSpecial1()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_01);
};

func void Jan_Training_Smith_1hSpecial2()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_02);
};

func void Jan_Training_Smith_2hSpecial2()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_02);
};


var int DIA_JAN_SellArmor_permanent;

instance DIA_JAN_SellArmor(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_SellArmor_Condition;
	information = DIA_Jan_SellArmor_Info;
	permanent = TRUE;
	description = "Могу я купить у тебя доспехи?";
};


func int DIA_Jan_SellArmor_Condition()
{
	if((MIS_JanBecomesSmith == LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_JAN_JanIsSmith) && (MIS_OCGateOpen == FALSE) && (DIA_JAN_SellArmor_permanent == FALSE))
	{
		return 1;
	};
};

func void DIA_Jan_SellArmor_Info()
{
	AI_Output(other,self,"DIA_Jan_SellArmor_15_00");	//Могу я купить у тебя доспехи?

	if((hero.guild == GIL_PAL) || (hero.guild == GIL_TPL))
	{
		AI_Output(self,other,"DIA_Jan_SellArmor_10_01");	//Мои доспехи не идут ни в какое сравнение с теми, что у тебя сейчас есть. Забудь об этом.
	}
	else if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_Jan_SellArmor_10_02");	//Маг, который нуждается в доспехах? Забудь об этом - тебе лучше обратиться к портному. Я не могу сделать доспехи для тебя.
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_SellArmor_10_03");	//Если бы они у меня были, я бы продал их тебе. Но, к сожалению, у меня их нет.

		if((SBMode == TRUE) || (RealMode[2] == TRUE))
		{
			Info_ClearChoices(DIA_JAN_SellArmor);
			Info_AddChoice(DIA_JAN_SellArmor,"Ты можешь изготовить что-нибудь для меня?",DIA_JAN_SellArmor_BuildOne);
		};
	};
};

func void DIA_JAN_SellArmor_Sorry()
{
	AI_Output(other,self,"DIA_JAN_SellArmor_Sorry_15_00");	//Думаю, ничего не получится.
	AI_Output(self,other,"DIA_JAN_SellArmor_Sorry_10_01");	//Ну, если все же что-нибудь придумаешь, дай мне знать.
	Info_ClearChoices(DIA_JAN_SellArmor);
};

func void DIA_JAN_SellArmor_BuildOne()
{
	AI_Output(other,self,"DIA_JAN_SellArmor_BuildOne_15_00");	//Ты можешь изготовить что-нибудь для меня?
	AI_Output(self,other,"DIA_JAN_SellArmor_BuildOne_10_01");	//Ну, если ты хочешь что-нибудь получше, ты должен принести мне необходимые материалы.
	AI_Output(other,self,"DIA_JAN_SellArmor_BuildOne_15_02");	//А что нужно?
	AI_Output(self,other,"DIA_JAN_SellArmor_BuildOne_10_03");	//Ты хочешь сражаться с драконами, да? Принеси мне драконьи чешуйки - из них я смогу собрать что-нибудь для тебя.
	AI_Output(self,other,"DIA_JAN_SellArmor_BuildOne_10_04");	//Двадцать чешуек должно быть достаточно.
	DIA_JAN_SellArmor_permanent = TRUE;
	Info_ClearChoices(DIA_JAN_SellArmor);
};


var int Jan_Sells_Armor;

instance DIA_JAN_Dragonscales(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_Dragonscales_Condition;
	information = DIA_Jan_Dragonscales_Info;
	permanent = TRUE;
	description = "У меня есть чешуя дракона.";
};


func int DIA_Jan_Dragonscales_Condition()
{
	if((MIS_JanBecomesSmith == LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_JAN_JanIsSmith) && (MIS_OCGateOpen == FALSE) && (DIA_JAN_SellArmor_permanent == TRUE) && (Jan_Sells_Armor == FALSE) && (Npc_HasItems(other,ItAt_DragonScale) >= 1))
	{
		return 1;
	};
};


var int DIA_JAN_Dragonscales_OneTime;

func void DIA_Jan_Dragonscales_Info()
{
	AI_Output(other,self,"DIA_JAN_Dragonscales_15_00");	//У меня есть чешуя дракона.

	if(Npc_HasItems(other,ItAt_DragonScale) >= 20)
	{
		B_GiveInvItems(other,self,ItAt_DragonScale,20);
		Npc_RemoveInvItems(self,ItAt_DragonScale,20);
		AI_Output(self,other,"DIA_JAN_Dragonscales_10_01");	//Хорошо! Думаю, из этого что-нибудь получится.
		AI_Output(self,other,"DIA_JAN_Dragonscales_10_02");	//Заходи завтра и получишь свои новые доспехи.
		if(DIA_JAN_Dragonscales_OneTime == FALSE)
		{
			B_GivePlayerXP(XP_Addon_JanSellsArmor);
			DIA_JAN_Dragonscales_OneTime = TRUE;
		};
		Jan_Sells_Armor = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_JAN_Dragonscales_10_03");	//Мне нужно два десятка драконьих чешуек, иначе я не смогу сделать тебе доспехи.
	};
};


var int DJG_Armor_is_offered;
var int DIA_JAN_ArmorReady_NoPerm;

instance DIA_JAN_ArmorReady(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_ArmorReady_Condition;
	information = DIA_Jan_ArmorReady_Info;
	permanent = TRUE;
	description = "Доспехи готовы?";
};

func int DIA_Jan_ArmorReady_Condition()
{
	if((MIS_OCGateOpen == FALSE) && (Jan_Sells_Armor != FALSE) && (DIA_JAN_ArmorReady_NoPerm == FALSE))
	{
		return 1;
	};
};

func void DIA_Jan_ArmorReady_Info()
{
	AI_Output(other,self,"DIA_JAN_ArmorReady_15_00");	//Доспехи готовы?
	if(Jan_Sells_Armor == Wld_GetDay())
	{
		AI_Output(self,other,"DIA_JAN_ArmorReady_10_01");	//Пока еще нет. Заходи завтра.
	}
	else
	{
		AI_Output(self,other,"DIA_JAN_ArmorReady_10_02");	//Это настоящее произведение искусства. Ты можешь купить их, если хочешь.
		AI_Output(self,other,"DIA_JAN_ArmorReady_10_03");	//Для тебя особая цена.
		AI_Output(other,self,"DIA_JAN_ArmorReady_15_04");	//Что!? И это после всего, что я сделал для тебя
		AI_Output(self,other,"DIA_JAN_ArmorReady_10_05");	//Ну не надо так. Мне же тоже нужно зарабатывать на жизнь. Не хочешь, не бери.
		DJG_Armor_is_offered = TRUE;
		DIA_JAN_ArmorReady_NoPerm = TRUE;
	};
};


var int Jan_DIA_Jan_DJG_ARMOR_M_permanent;

instance DIA_Jan_DJG_ARMOR_M(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_DJG_ARMOR_M_Condition;
	information = DIA_Jan_DJG_ARMOR_M_Info;
	permanent = TRUE;
	description = "Доспех из драконьей чешуи. (Цена: 15000 монет)";
};

func int DIA_Jan_DJG_ARMOR_M_Condition()
{
	if((Jan_DIA_Jan_DJG_ARMOR_M_permanent == FALSE) && (hero.guild == GIL_DJG) && (DJG_Armor_is_offered == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Jan_DJG_ARMOR_M_Info()
{
	AI_Output(other,self,"DIA_Jan_DJG_ARMOR_M_15_00");	//Я хочу купить эти доспехи.

	if(Npc_HasItems(other,ItMi_Gold) >= 15000)
	{
		AI_Output(self,other,"DIA_Jan_DJG_ARMOR_M_10_01");	//Ты увидишь, они стоят своих денег.
		B_GiveInvItems(other,self,ItMi_Gold,15000);
		Npc_RemoveInvItems(self,ItMi_Gold,15000);
		CreateInvItems(self,ITAR_Dargonscale,1);
		B_GiveInvItems(self,other,ITAR_Dargonscale,1);
		Jan_DIA_Jan_DJG_ARMOR_M_permanent = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_DJG_ARMOR_M_10_02");	//У тебя недостаточно золота.
	};
};

instance DIA_Jan_DragonPlettBericht(C_Info)
{
	npc = DJG_714_Jan;
	nr = 3;
	condition = DIA_Jan_DragonPlettBericht_Condition;
	information = DIA_Jan_DragonPlettBericht_Info;
	description = "Насчет драконов...";
};

var int DIA_Jan_DragonPlettBericht_NoPerm;

func int DIA_Jan_DragonPlettBericht_Condition()
{
	if((Kapitel >= 4) && Npc_KnowsInfo(other,DIA_JAN_Dragons) && (DIA_Jan_DragonPlettBericht_NoPerm == FALSE) && (MIS_OCGateOpen == FALSE) && (MIS_KilledDragons != 0))
	{
		return TRUE;
	};
};

func void DIA_Jan_DragonPlettBericht_Info()
{
	if(MIS_KilledDragons == 1)
	{
		AI_Output(other,self,"DIA_Jan_DragonPlettBericht_15_00");	//Я убил дракона.
	}
	else if((MIS_KilledDragons == 2) || (MIS_KilledDragons == 3))
	{
		AI_Output(other,self,"DIA_Jan_DragonPlettBericht_15_01");	//Я убил несколько драконов.
	}
	else
	{
		AI_Output(other,self,"DIA_Jan_DragonPlettBericht_15_02");	//Я убил всех драконов.
	};
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_03");	//И что? Ты ведь охотник на драконов, разве нет?
		AI_Output(other,self,"DIA_Jan_DragonPlettBericht_15_04");	//А ты разве нет?
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_05");	//Да, конечно, но если честно, то мне это не интересно.
	};
	AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_06");	//Я уже говорил тебе, мне больше нравится делать оружие, чем убивать драконов.
	if((hero.guild != GIL_DJG) && (hero.guild != GIL_SLD))
	{
		AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_07");	//Впрочем, есть кое-что, что может заинтересовать меня.
		AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_08");	//Если бы ты принес мне драконьей крови, я бы хорошо заплатил за нее.
		Jan_WantsDragonBlood = TRUE;
	};
};


instance DIA_Jan_DragonBlood(C_Info)
{
	npc = DJG_714_Jan;
	nr = 3;
	condition = DIA_Jan_DragonBlood_Condition;
	information = DIA_Jan_DragonBlood_Info;
	permanent = TRUE;
	description = "У меня есть кровь дракона для тебя.";
};


func int DIA_Jan_DragonBlood_Condition()
{
	if((Jan_WantsDragonBlood == TRUE) && (MIS_OCGateOpen == FALSE) && Npc_HasItems(other,ItAt_DragonBlood) && ((hero.guild != GIL_DJG) && (hero.guild != GIL_SLD)))
	{
		return TRUE;
	};
};

func void DIA_Jan_DragonBlood_Info()
{
	AI_Output(other,self,"DIA_Jan_DragonBlood_15_00");	//Я принес тебе драконью кровь.
	AI_Output(self,other,"DIA_Jan_DragonBlood_10_01");	//Отлично. Приноси мне всю кровь, что найдешь.
	Info_ClearChoices(DIA_Jan_DragonBlood);
	Info_AddChoice(DIA_Jan_DragonBlood,Dialog_Back,DIA_Jan_DragonBlood_BACK);
	if(Npc_HasItems(other,ItAt_DragonBlood) >= 1)
	{
		Info_AddChoice(DIA_Jan_DragonBlood,"(Все)",DIA_Jan_DragonBlood_all);
		Info_AddChoice(DIA_Jan_DragonBlood,"(Одну пробирку)",DIA_Jan_DragonBlood_1);
	};
};

func void DIA_Jan_DragonBlood_BACK()
{
	Info_ClearChoices(DIA_Jan_DragonBlood);
};

func void DIA_Jan_DragonBlood_1()
{
	var int DragonBloodCount;
	var int DragonBloodGeld;
	var int XP_DJG_BringDragonBloods;
	var string BloodText;
	var string BloodLeft;
	DragonBloodCount = 1;
	B_GiveInvItems(other,self,ItAt_DragonBlood,DragonBloodCount);
	Npc_RemoveInvItems(self,ItAt_DragonBlood,DragonBloodCount);
	XP_DJG_BringDragonBloods = DragonBloodCount * XP_AmbientKap4;
	B_GivePlayerXP(XP_DJG_BringDragonBloods);
	DragonBloodGeld = DragonBloodCount * Value_DragonBlood;
	CreateInvItems(self,ItMi_Gold,DragonBloodGeld);
	B_GiveInvItems(self,other,ItMi_Gold,DragonBloodGeld);
	Info_ClearChoices(DIA_Jan_DragonBlood);
	Info_AddChoice(DIA_Jan_DragonBlood,Dialog_Back,DIA_Jan_DragonBlood_BACK);
	if(Npc_HasItems(other,ItAt_DragonBlood) >= 1)
	{
		Info_AddChoice(DIA_Jan_DragonBlood,"(Все)",DIA_Jan_DragonBlood_all);
		Info_AddChoice(DIA_Jan_DragonBlood,"(Одну пробирку)",DIA_Jan_DragonBlood_1);
	};
	BloodLeft = IntToString(Npc_HasItems(other,ItAt_DragonBlood));
	BloodText = ConcatStrings(BloodLeft,PRINT_NumberLeft);
	AI_Print(BloodText);
};

func void DIA_Jan_DragonBlood_all()
{
	var int DragonBloodCount;
	var int DragonBloodGeld;
	var int XP_DJG_BringDragonBloods;
	var string BloodText;
	var string BloodLeft;
	DragonBloodCount = Npc_HasItems(other,ItAt_DragonBlood);
	B_GiveInvItems(other,self,ItAt_DragonBlood,DragonBloodCount);
	Npc_RemoveInvItems(self,ItAt_DragonBlood,DragonBloodCount);
	XP_DJG_BringDragonBloods = DragonBloodCount * XP_AmbientKap4;
	B_GivePlayerXP(XP_DJG_BringDragonBloods);
	DragonBloodGeld = DragonBloodCount * Value_DragonBlood;
	CreateInvItems(self,ItMi_Gold,DragonBloodGeld);
	B_GiveInvItems(self,other,ItMi_Gold,DragonBloodGeld);
	Info_ClearChoices(DIA_Jan_DragonBlood);
	Info_AddChoice(DIA_Jan_DragonBlood,Dialog_Back,DIA_Jan_DragonBlood_BACK);
	if(Npc_HasItems(other,ItAt_DragonBlood) >= 1)
	{
		Info_AddChoice(DIA_Jan_DragonBlood,"(Все)",DIA_Jan_DragonBlood_all);
		Info_AddChoice(DIA_Jan_DragonBlood,"(Одну пробирку)",DIA_Jan_DragonBlood_1);
	};
	BloodLeft = IntToString(Npc_HasItems(other,ItAt_DragonBlood));
	BloodText = ConcatStrings(BloodLeft,PRINT_NumberLeft);
	AI_Print(BloodText);
};


instance DIA_Jan_NACHOCGATEOPEN(C_Info)
{
	npc = DJG_714_Jan;
	nr = 3;
	condition = DIA_Jan_NACHOCGATEOPEN_Condition;
	information = DIA_Jan_NACHOCGATEOPEN_Info;
	permanent = TRUE;
	description = "Все в порядке?";
};


func int DIA_Jan_NACHOCGATEOPEN_Condition()
{
	if(MIS_OCGateOpen == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Jan_NACHOCGATEOPEN_Info()
{
	AI_Output(other,self,"DIA_Jan_NACHOCGATEOPEN_15_00");	//Все в порядке?
	AI_Output(self,other,"DIA_Jan_NACHOCGATEOPEN_10_01");	//Абсолютно ничего не ясно!
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Jan_NACHOCGATEOPEN_10_02");	//Зачем эти идиоты открыли ворота? Вы, паладины, ни на что не годитесь!
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_NACHOCGATEOPEN_10_03");	//Они вот так вот просто взяли и открыли ворота. Идиоты! Мне такое не понять.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Jan_PICKPOCKET(C_Info)
{
	npc = DJG_714_Jan;
	nr = 900;
	condition = DIA_Jan_PICKPOCKET_Condition;
	information = DIA_Jan_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Jan_PICKPOCKET_Condition()
{
	return C_Beklauen(37,95);
};

func void DIA_Jan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Jan_PICKPOCKET);
	Info_AddChoice(DIA_Jan_PICKPOCKET,Dialog_Back,DIA_Jan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Jan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Jan_PICKPOCKET_DoIt);
};

func void DIA_Jan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Jan_PICKPOCKET);
};

func void DIA_Jan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Jan_PICKPOCKET);
};


instance DIA_JAN_ARMORCANTEACH(C_Info)
{
	npc = DJG_714_Jan;
	nr = 5;
	condition = dia_jan_armorcanteach_condition;
	information = dia_jan_armorcanteach_info;
	permanent = TRUE;
	description = "Ты умеешь ковать доспехи?";
};


func int dia_jan_armorcanteach_condition()
{
	if((JAN_TEACHARMOR == FALSE) && (other.guild == GIL_DJG) && (MIS_JanBecomesSmith == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_jan_armorcanteach_info()
{
	AI_Output(other,self,"DIA_Jan_ArmorCanTeach_01_00");	//Ты умеешь ковать доспехи?
	AI_Output(self,other,"DIA_Jan_ArmorCanTeach_01_01");	//Да, я кое-что умею. А тебе зачем?
	AI_Output(other,self,"DIA_Jan_ArmorCanTeach_01_02");	//А можешь меня научить этому?
	AI_Output(self,other,"DIA_Jan_ArmorCanTeach_01_03");	//Ну, почему бы и нет. Ведь ты тоже охотник на драконов. Я бы мог показать тебе несколько способов, как улучшить свой доспех.
	AI_Output(self,other,"DIA_Jan_ArmorCanTeach_01_04");	//Правда, для начала тебе надо немного разбираться в ковке.

	if(Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0)
	{
		AI_Output(other,self,"DIA_Jan_ArmorCanTeach_01_05");	//Я довольно сносно разбираюсь в ковке.
		AI_Output(self,other,"DIA_Jan_ArmorCanTeach_01_06");	//Да, вижу, что разбираешся. Хорошо, я покажу тебе, как это сделать.
		AI_Output(self,other,"DIA_Jan_ArmorCanTeach_01_07");	//Но сам понимаешь, тебе за это придется заплатить.
		AI_Output(self,other,"DIA_Jan_ArmorCanTeach_01_08");	//А так - только скажи, и мы приступим к твоему обучению.
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_ArmorCanTeach_01_09");	//А ты, как я погляжу, даже понятия не имеешь, что это такое!
		AI_Output(self,other,"DIA_Jan_ArmorCanTeach_01_10");	//Вот что, парень. Иди сначала научись хоть как-то ковать. А после мы поговорим о твоем обучении.
		AI_Output(self,other,"DIA_Jan_ArmorCanTeach_01_11");	//И еще: сам понимаешь, тебе за это придется заплатить.
	};

	JAN_TEACHARMOR = TRUE;
	Log_CreateTopic(TOPIC_ARMORTEACHER,LOG_NOTE);
	B_LogEntry(TOPIC_ARMORTEACHER,"Ян может научить меня улучшать доспехи охотников на драконов.");
};

func void b_jan_teacharmor_4()
{
	AI_Output(self,other,"DIA_Jan_TeachArmor_4_01_01");	//Итак, приступим. Проверь, что все необходимые материалы у тебя под рукой. Берешь разогретую стальную заготовку...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_BIGFARM_SMITH_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Jan_TeachArmor_4_01_02");	//...на наковальне придаешь ей форму пластины и вковываешь в нее кусок магической руды....
		AI_Output(self,other,"DIA_Jan_TeachArmor_4_01_03");	//...далее делаешь крепления и соединяешь пластину с ними, тщательно проковывая места схода...
		AI_Output(self,other,"DIA_Jan_TeachArmor_4_01_04");	//...после этого тщательно крепишь полученный элемент на корпус доспеха - вот таким образом... смотри...(показывает)
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Jan_TeachArmor_4_01_05");	//...готово!
		AI_Output(self,other,"DIA_Jan_TeachArmor_4_01_06");	//Это все, что тебе следует знать, чтобы улучшить этот доспех.
	};
};

func void b_jan_teacharmor_5()
{
	AI_Output(self,other,"DIA_Jan_TeachArmor_5_01_01");	//Ну что ж, пожалуй, начнем. Для создания этого доспеха тебе потребуется много времени и усилий - но поверь, это того стоит...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_BIGFARM_SMITH_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Jan_TeachArmor_5_01_02");	//...возьми раскаленную стальную заготовку и раздели ее на несколько равных частей. Постарайся, чтобы они были примерно одного размера...
		AI_Output(self,other,"DIA_Jan_TeachArmor_5_01_03");	//...далее бери каждую часть и обработай ее последовательно с помощью магической рудной крошки. После скрепи две части и прокуй места схода...
		AI_Output(self,other,"DIA_Jan_TeachArmor_5_01_04");	//...а после полученный элемент скрепляешь с доспехом по бокам с помощью металлической пластины... Смотри, как я это делаю... (показывает)
		AI_Output(self,other,"DIA_Jan_TeachArmor_5_01_05");	//...видишь, как он сел четко, практически обтекая поверхность доспеха. Усиливаешь крепление металлическими болтами, и ...
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Jan_TeachArmor_5_01_06");	//...готово! Ну и как тебе процесс? Ничего, немного практики - и у тебя все выйдет, как надо.
		AI_Output(self,other,"DIA_Jan_TeachArmor_5_01_07");	//Теперь иди, пробуй сам.
	};
};

func void b_jan_teacharmor_6()
{
	AI_Output(self,other,"DIA_Jan_TeachArmor_6_01_01");	//Овладев этим знанием, ты сможешь сделать такой доспех, с которым по своей прочности и надежности не сравнится никакой другой...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_BIGFARM_SMITH_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Jan_TeachArmor_6_01_02");	//...следи внимательно. Берешь раскаленную стальную заготовку и на наковальне придаешь ей форму пластины...
		AI_Output(self,other,"DIA_Jan_TeachArmor_6_01_03");	//...после этого покрываешь полученный элемент магической рудной крошкой и поверху наносишь слой черной руды...
		AI_Output(self,other,"DIA_Jan_TeachArmor_6_01_04");	//...далее скрепляешь две таких пластины стальными болтами и крепишь на каркас брони... вот так, как я это делаю...(показывает)
		AI_Output(self,other,"DIA_Jan_TeachArmor_6_01_05");	//...это добавит прочности в местах крепления всех элементов доспеха...еще немного подбиваем контур брони, и...
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Jan_TeachArmor_6_01_06");	//...все, доспех готов! Воистину, настоящее произведения искусства.
		AI_Output(self,other,"DIA_Jan_TeachArmor_6_01_07");	//Мне больше нечему тебя учить. Все, что я знал, я тебе поведал. Теперь иди и опробуй свои знания.
	};
};

func void b_janarmorchoices()
{
	Info_ClearChoices(dia_jan_armorteach);
	Info_AddChoice(dia_jan_armorteach,Dialog_Back,dia_jan_armorteach_back);

	if((PLAYER_TALENT_SMITH[20] == FALSE) && (SHOW_DJG_ARMOR_L == TRUE))
	{
		Info_AddChoice(dia_jan_armorteach,B_BuildLearnString("Улучшить легкие доспехи драконоборца (Цена: 4000 монет)",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_ITAR_DJG_L_V1)),dia_jan_armorteach_itar_djg_l_v1);
	};
	if((PLAYER_TALENT_SMITH[21] == FALSE) && (Show_DJG_Armor_M == TRUE))
	{
		Info_AddChoice(dia_jan_armorteach,B_BuildLearnString("Улучшить доспехи драконоборца (Цена: 6000 монет)",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_ITAR_DJG_M_V1)),dia_jan_armorteach_itar_djg_m_v1);
	};
	if((PLAYER_TALENT_SMITH[22] == FALSE) && (SHOW_DJG_ARMOR_H == TRUE))
	{
		Info_AddChoice(dia_jan_armorteach,B_BuildLearnString("Улучшить тяжелые доспехи драконоборца (Цена: 8000 монет)",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_ITAR_DJG_H_V1)),dia_jan_armorteach_itar_djg_h_v1);
	};
};


instance DIA_JAN_ARMORTEACH(C_Info)
{
	npc = DJG_714_Jan;
	nr = 5;
	condition = dia_jan_armorteach_condition;
	information = dia_jan_armorteach_info;
	permanent = TRUE;
	description = "Научи меня улучшать доспехи.";
};


func int dia_jan_armorteach_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0) && (JAN_TEACHARMOR == TRUE) && (other.guild == GIL_DJG) && (MIS_JanBecomesSmith == LOG_SUCCESS))
	{
		if((PLAYER_TALENT_SMITH[20] == FALSE) || (PLAYER_TALENT_SMITH[21] == FALSE) || (PLAYER_TALENT_SMITH[22] == FALSE))
		{
			return TRUE;
		};
	};
};

func void dia_jan_armorteach_info()
{
	AI_Output(other,self,"DIA_Jan_ArmorTeach_01_00");	//Научи меня улучшать доспехи.
	if(Wld_IsTime(8,0,20,0))
	{
		AI_Output(self,other,"DIA_Jan_ArmorTeach_01_01");	//И что же ты хочешь узнать?
		b_janarmorchoices();
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_ArmorTeach_01_02");	//На сегодня я уже закончил работать в кузне.
		AI_Output(self,other,"DIA_Jan_ArmorTeach_01_03");	//Приходи завтра утром, тогда и поговорим об этом.
	};
};

func void dia_jan_armorteach_back()
{
	Info_ClearChoices(dia_jan_armorteach);
};

func void dia_jan_armorteach_itar_djg_l_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 4000)
	{
		ARMORTEACHFLAG = TRUE;
		if(B_TeachPlayerTalentSmith(self,other,WEAPON_ITAR_DJG_L_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,4000);
			b_jan_teacharmor_4();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_TeachArmor_04_00");	//Но ведь у тебя недостаточно золота! Так что пока забудь об этом.
	};
	b_janarmorchoices();
};

func void dia_jan_armorteach_itar_djg_m_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 6000)
	{
		ARMORTEACHFLAG = TRUE;
		if(B_TeachPlayerTalentSmith(self,other,WEAPON_ITAR_DJG_M_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,6000);
			b_jan_teacharmor_5();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_TeachArmor_05_00");	//Но ведь у тебя недостаточно золота! Так что пока забудь об этом.
	};
	b_janarmorchoices();
};

func void dia_jan_armorteach_itar_djg_h_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 8000)
	{
		ARMORTEACHFLAG = TRUE;
		if(B_TeachPlayerTalentSmith(self,other,WEAPON_ITAR_DJG_H_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,8000);
			b_jan_teacharmor_6();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_TeachArmor_06_00");	//Но ведь у тебя недостаточно золота! Так что пока забудь об этом.
	};
	b_janarmorchoices();
};