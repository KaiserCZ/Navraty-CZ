
const int MAGICBOWBONUS = 5;
const int MAGICCROSSBOWBONUS = 5;

instance ItMi_ArrowTip(C_Item)
{
	name = "Наконечник стрелы";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_ArrowTip.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Используется для изготовления стрел...";
	inv_animate = 1;
};

instance ItMi_KerArrowTip(C_Item)
{
	name = "Рудный наконечник стрелы";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_ArrowTip.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Используется для изготовления кереновых стрел...";
	inv_animate = 1;
};

instance ItMi_BoltTip(C_Item)
{
	name = "Наконечник болта";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_BoltTip.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Используется для изготовления болтов...";
	inv_animate = 1;
};

instance ItMi_ArrowShaft(C_Item)
{
	name = "Древко стрелы";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_ArrowShaft.3ds";
	material = MAT_WOOD;
	description = name;
	text[4] = "Используется для изготовления стрел...";
	inv_animate = 1;
};

instance ItMi_BoltShaft(C_Item)
{
	name = "Древко болта";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_BoltShaft.3ds";
	material = MAT_WOOD;
	description = name;
	text[4] = "Используется для изготовления болтов...";
	inv_animate = 1;
};

instance ItRw_Arrow(C_Item)
{
	name = "Стрела";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_BOW | ITEM_MULTI | ITEM_MISSION;
	value = Value_Pfeil;
	visual = "ItRw_Arrow_Sky_Iron.3ds";
	material = MAT_WOOD;
	scemeName = "MAPSEALED";
	on_state[0] = UseItRw_Arrow;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void UseItRw_Arrow()
{
	var C_Item weapon;

	CreateInvItems(hero,ItRw_Arrow,1);

	if((Npc_HasEquippedRangedWeapon(hero) == TRUE) && (Use_Arrow == FALSE))
	{
		weapon = Npc_GetEquippedRangedWeapon(hero);

		if((Hlp_IsItem(weapon,ITRW_SHADOWBOW) != TRUE) && ((weapon.flags & ITEM_BOW) == ITEM_BOW))
		{
			if(Use_Arrow == FALSE)
			{
				weapon.munition = ItRw_Arrow;
				Use_Arrow = TRUE;
				AI_Print("Используются обычные стрелы");
			};
			if(Use_PoisonArrow == TRUE)
			{
				Use_PoisonArrow = FALSE;
			};
			if(Use_HolyArrow == TRUE)
			{
				Use_HolyArrow = FALSE;
			};
			if(Use_FireArrow == TRUE)
			{
				Use_FireArrow = FALSE;
			};
			if(Use_MagicArrow == TRUE)
			{
				Use_MagicArrow = FALSE;
			};
		}
		else
		{
			//Print("Не экипирован подходящий лук!");
			AI_PrintClr("Не экипирован подходящий лук!",177,58,17);		
		};
	}
	else
	{
		if(Npc_HasEquippedRangedWeapon(hero) == FALSE)
		{
			//Print("Не экипирован ни один лук!");	
			AI_PrintClr("Не экипирован ни один лук!",177,58,17);	
		}
		else
		{
			//Print("Вы уже используете этот тип стрел!");
			AI_PrintClr("Вы уже используете этот тип стрел!",177,58,17);		
		};
	};
};

instance ItRw_PoisonArrow(C_Item)
{
	name = "Отравленная стрела";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_BOW | ITEM_MULTI | ITEM_MISSION;
	value = 7;
	effect = "SPELLFX_POISONARROW";
	visual = "ItRw_Arrow_Sky_Iron.3ds";
	material = MAT_WOOD;
	scemeName = "MAPSEALED";
	on_state[0] = UseItRw_Arrow_Poison;
	description = name;
	text[4] = "Наносит дополнительный урон ядом...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void UseItRw_Arrow_Poison()
{
	var C_Item weapon;

	CreateInvItems(hero,ItRw_PoisonArrow,1);

	if((Npc_HasEquippedRangedWeapon(hero) == TRUE) && (Use_PoisonArrow == FALSE))
	{
		weapon = Npc_GetEquippedRangedWeapon(hero);

		if((Hlp_IsItem(weapon,ITRW_SHADOWBOW) != TRUE) && ((weapon.flags & ITEM_BOW) == ITEM_BOW))
		{
			if(Use_PoisonArrow == FALSE)
			{
				weapon.munition = ItRw_PoisonArrow;
				Use_PoisonArrow = TRUE;
				Print("Используются отравленые стрелы");
			};
			if(Use_Arrow == TRUE)
			{
				Use_Arrow = FALSE;
			};
			if(Use_HolyArrow == TRUE)
			{
				Use_HolyArrow = FALSE;
			};
			if(Use_FireArrow == TRUE)
			{
				Use_FireArrow = FALSE;
			};
			if(Use_MagicArrow == TRUE)
			{
				Use_MagicArrow = FALSE;
			};
		}
		else
		{
			//Print("Не экипирован подходящий лук!");	
			AI_PrintClr("Не экипирован подходящий лук!",177,58,17);			
		};
	}
	else
	{
		if(Npc_HasEquippedRangedWeapon(hero) == FALSE)
		{
			//Print("Не экипирован ни один лук!");		
			AI_PrintClr("Не экипирован ни один лук!",177,58,17);	
		}
		else
		{
			//Print("Вы уже используете этот тип стрел!");	
			AI_PrintClr("Вы уже используете этот тип стрел!",177,58,17);
		};	
	};
};

instance ItRw_HolyArrow(C_Item)
{
	name = "Освященная стрела";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_BOW | ITEM_MULTI | ITEM_MISSION;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_HOLYARROW";
	value = 7;
	visual = "ItRw_Arrow_Sky_Iron.3ds";
	material = MAT_WOOD;
	scemeName = "MAPSEALED";
	on_state[0] = UseItRw_Arrow_Holy;
	description = name;
	text[4] = "Наносит дополнительный урон нежити...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = TRUE;
	//inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void UseItRw_Arrow_Holy()
{
	var C_Item weapon;

	CreateInvItems(hero,ItRw_HolyArrow,1);

	if((Npc_HasEquippedRangedWeapon(hero) == TRUE) && (Use_HolyArrow == FALSE))
	{
		weapon = Npc_GetEquippedRangedWeapon(hero);

		if((Hlp_IsItem(weapon,ITRW_SHADOWBOW) != TRUE) && ((weapon.flags & ITEM_BOW) == ITEM_BOW))
		{
			if(Use_HolyArrow == FALSE)
			{
				weapon.munition = ItRw_HolyArrow;
				Use_HolyArrow = TRUE;
				Print("Используются освященные стрелы");
			};
			if(Use_Arrow == TRUE)
			{
				Use_Arrow = FALSE;
			};
			if(Use_PoisonArrow == TRUE)
			{
				Use_PoisonArrow = FALSE;
			};
			if(Use_FireArrow == TRUE)
			{
				Use_FireArrow = FALSE;
			};
			if(Use_MagicArrow == TRUE)
			{
				Use_MagicArrow = FALSE;
			};
		}
		else
		{
			//Print("Не экипирован подходящий лук!");	
			AI_PrintClr("Не экипирован подходящий лук!",177,58,17);			
		};
	}
	else
	{
		if(Npc_HasEquippedRangedWeapon(hero) == FALSE)
		{
			//Print("Не экипирован ни один лук!");		
			AI_PrintClr("Не экипирован ни один лук!",177,58,17);	
		}
		else
		{
			//Print("Вы уже используете этот тип стрел!");	
			AI_PrintClr("Вы уже используете этот тип стрел!",177,58,17);
		};	
	};
};

instance ItRw_Addon_MagicArrow(C_Item)
{
	name = "Магическая стрела";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_BOW | ITEM_MULTI | ITEM_MISSION;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_MAGICARROW";
	value = 7;
	visual = "ItRw_Arrow_Sky_Claim.3ds";
	material = MAT_WOOD;
	scemeName = "MAPSEALED";
	on_state[0] = UseItRw_Arrow_Magic;
	description = name;
	text[4] = "Наносит дополнительный урон магией...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = TRUE;
	//inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void UseItRw_Arrow_Magic()
{
	var C_Item weapon;

	CreateInvItems(hero,ItRw_Addon_MagicArrow,1);

	if((Npc_HasEquippedRangedWeapon(hero) == TRUE) && (Use_MagicArrow == FALSE))
	{
		weapon = Npc_GetEquippedRangedWeapon(hero);

		if((Hlp_IsItem(weapon,ITRW_SHADOWBOW) != TRUE) && ((weapon.flags & ITEM_BOW) == ITEM_BOW))
		{
			if(Use_MagicArrow == FALSE)
			{
				weapon.munition = ItRw_Addon_MagicArrow;
				Use_MagicArrow = TRUE;
				Print("Используются магические стрелы");
			};
			if(Use_Arrow == TRUE)
			{
				Use_Arrow = FALSE;
			};
			if(Use_PoisonArrow == TRUE)
			{
				Use_PoisonArrow = FALSE;
			};
			if(Use_FireArrow == TRUE)
			{
				Use_FireArrow = FALSE;
			};
			if(Use_HolyArrow == TRUE)
			{
				Use_HolyArrow = FALSE;
			};
		}
		else
		{
			//Print("Не экипирован подходящий лук!");	
			AI_PrintClr("Не экипирован подходящий лук!",177,58,17);			
		};
	}
	else
	{
		if(Npc_HasEquippedRangedWeapon(hero) == FALSE)
		{
			//Print("Не экипирован ни один лук!");		
			AI_PrintClr("Не экипирован ни один лук!",177,58,17);	
		}
		else
		{
			//Print("Вы уже используете этот тип стрел!");	
			AI_PrintClr("Вы уже используете этот тип стрел!",177,58,17);
		};	
	};
};

instance ItRw_Addon_FireArrow(C_Item)
{
	name = "Огненная стрела";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_BOW | ITEM_MULTI | ITEM_MISSION;
	wear = WEAR_EFFECT;
	value = 7;
	effect = "SPELLFX_FIREARROW";
	visual = "ItRw_Arrow_Sky_Claim.3ds";
	material = MAT_WOOD;
	scemeName = "MAPSEALED";
	on_state[0] = UseItRw_Arrow_Fire;
	description = name;
	text[4] = "Наносит дополнительный урон огнем...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = TRUE;
	//inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void UseItRw_Arrow_Fire()
{
	var C_Item weapon;

	CreateInvItems(hero,ItRw_Addon_FireArrow,1);

	if((Npc_HasEquippedRangedWeapon(hero) == TRUE) && (Use_FireArrow == FALSE))
	{
		weapon = Npc_GetEquippedRangedWeapon(hero);

		if((Hlp_IsItem(weapon,ITRW_SHADOWBOW) != TRUE) && ((weapon.flags & ITEM_BOW) == ITEM_BOW))
		{
			if(Use_FireArrow == FALSE)
			{
				weapon.munition = ItRw_Addon_FireArrow;
				Use_FireArrow = TRUE;
				Print("Используются огненные стрелы");
			};
			if(Use_Arrow == TRUE)
			{
				Use_Arrow = FALSE;
			};
			if(Use_PoisonArrow == TRUE)
			{
				Use_PoisonArrow = FALSE;
			};
			if(Use_MagicArrow == TRUE)
			{
				Use_MagicArrow = FALSE;
			};
			if(Use_HolyArrow == TRUE)
			{
				Use_HolyArrow = FALSE;
			};
		}
		else
		{
			//Print("Не экипирован подходящий лук!");
			AI_PrintClr("Не экипирован подходящий лук!",177,58,17);				
		};
	}
	else
	{
		if(Npc_HasEquippedRangedWeapon(hero) == FALSE)
		{
			//Print("Не экипирован ни один лук!");		
			AI_PrintClr("Не экипирован ни один лук!",177,58,17);	
		}
		else
		{
			//Print("Вы уже используете этот тип стрел!");	
			AI_PrintClr("Вы уже используете этот тип стрел!",177,58,17);
		};	
	};
};

instance ItRw_Bolt(C_Item)
{
	name = "Болт";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_CROSSBOW | ITEM_MULTI | ITEM_MISSION;
	value = Value_Bolzen;
	visual = "ItRw_Bolt_Sky.3ds";
	material = MAT_WOOD;
	scemeName = "MAPSEALED";
	on_state[0] = UseItRw_Bolt;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void UseItRw_Bolt()
{
	var C_Item weapon;

	CreateInvItems(hero,ItRw_Bolt,1);

	if((Npc_HasEquippedRangedWeapon(hero) == TRUE) && (Use_Bolt == FALSE))
	{
		weapon = Npc_GetEquippedRangedWeapon(hero);

		if((Hlp_IsItem(weapon,ITRW_ADDON_MAGICCROSSBOW_SHV) != TRUE) && ((weapon.flags & ITEM_CROSSBOW) == ITEM_CROSSBOW))
		{
			if(Use_Bolt == FALSE)
			{
				weapon.munition = ItRw_Bolt;
				Use_Bolt = TRUE;
				AI_Print("Используются обычные болты");
			};
			if(Use_MagicBolt == TRUE)
			{
				Use_MagicBolt = FALSE;
			};
			if(Use_HolyBolt == TRUE)
			{
				Use_HolyBolt = FALSE;
			};
		}
		else
		{
			//Print("Не экипирован подходящий арбалет!");
			AI_PrintClr("Не экипирован подходящий арбалет!",177,58,17);		
		};
	}
	else
	{
		if(Npc_HasEquippedRangedWeapon(hero) == FALSE)
		{
			//Print("Не экипирован ни один арбалет!");	
			AI_PrintClr("Не экипирован ни один арбалет!",177,58,17);	
		}
		else
		{
			//Print("Вы уже используете этот тип болтов!");	
			AI_PrintClr("Вы уже используете этот тип болтов!",177,58,17);	
		};
	};
};

instance ItRw_Addon_MagicBolt(C_Item)
{
	name = "Магический болт";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_CROSSBOW | ITEM_MULTI | ITEM_MISSION;
	value = 15;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_MAGICBOLT";
	visual = "ItRw_Bolt_Sky_Magic.3ds";
	material = MAT_WOOD;
	scemeName = "MAPSEALED";
	on_state[0] = UseItRw_Bolt_Magic;
	description = name;
	text[4] = "Наносит дополнительный урон магией...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = TRUE;
	//inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void UseItRw_Bolt_Magic()
{
	var C_Item weapon;

	CreateInvItems(hero,ItRw_Addon_MagicBolt,1);

	if((Npc_HasEquippedRangedWeapon(hero) == TRUE) && (Use_MagicBolt == FALSE))
	{
		weapon = Npc_GetEquippedRangedWeapon(hero);

		if((Hlp_IsItem(weapon,ITRW_ADDON_MAGICCROSSBOW_SHV) != TRUE) && ((weapon.flags & ITEM_CROSSBOW) == ITEM_CROSSBOW))
		{
			if(Use_MagicBolt == FALSE)
			{
				weapon.munition = ItRw_Addon_MagicBolt;
				Use_MagicBolt = TRUE;
				AI_Print("Используются магические болты");
			};
			if(Use_Bolt == TRUE)
			{
				Use_Bolt = FALSE;
			};
			if(Use_HolyBolt == TRUE)
			{
				Use_HolyBolt = FALSE;
			};
		}
		else
		{
			//Print("Не экипирован подходящий арбалет!");		
			AI_PrintClr("Не экипирован подходящий арбалет!",177,58,17);
		};
	}
	else
	{
		if(Npc_HasEquippedRangedWeapon(hero) == FALSE)
		{
			//Print("Не экипирован ни один арбалет!");	
			AI_PrintClr("Не экипирован ни один арбалет!",177,58,17);		
		}
		else
		{
			//Print("Вы уже используете этот тип болтов!");	
			AI_PrintClr("Вы уже используете этот тип болтов!",177,58,17);	
		};
	};
};

instance ItRw_HolyBolt(C_Item)
{
	name = "Освященный болт";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_CROSSBOW | ITEM_MULTI | ITEM_MISSION;
	value = 15;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_HOLYBOLT";
	visual = "ItRw_Bolt_Sky_Magic.3ds";
	material = MAT_WOOD;
	scemeName = "MAPSEALED";
	on_state[0] = UseItRw_Bolt_Holy;
	description = name;
	text[4] = "Наносит дополнительный урон нежити...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = TRUE;
	//inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void UseItRw_Bolt_Holy()
{
	var C_Item weapon;

	CreateInvItems(hero,ItRw_HolyBolt,1);

	if((Npc_HasEquippedRangedWeapon(hero) == TRUE) && (Use_HolyBolt == FALSE))
	{
		weapon = Npc_GetEquippedRangedWeapon(hero);

		if((Hlp_IsItem(weapon,ITRW_ADDON_MAGICCROSSBOW_SHV) != TRUE) && ((weapon.flags & ITEM_CROSSBOW) == ITEM_CROSSBOW))
		{
			if(Use_HolyBolt == FALSE)
			{
				weapon.munition = ItRw_HolyBolt;
				Use_HolyBolt = TRUE;
				AI_Print("Используются освященные болты");
			};
			if(Use_Bolt == TRUE)
			{
				Use_Bolt = FALSE;
			};
			if(Use_MagicBolt == TRUE)
			{
				Use_MagicBolt = FALSE;
			};
		}
		else
		{
			//Print("Не экипирован подходящий арбалет!");
			AI_PrintClr("Не экипирован подходящий арбалет!",177,58,17);
		};
	}
	else
	{
		if(Npc_HasEquippedRangedWeapon(hero) == FALSE)
		{
			//Print("Не экипирован ни один арбалет!");	
			AI_PrintClr("Не экипирован ни один арбалет!",177,58,17);	
		}
		else
		{
			//Print("Вы уже используете этот тип болтов!");	
			AI_PrintClr("Вы уже используете этот тип болтов!",177,58,17);		
		};
	};
};

//--------------------специфические боеприпасы------------------------------------

instance ITRW_ZUNTARROW(C_Item)
{
	name = "Клейменная стрела";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_BOW | ITEM_MULTI | ITEM_MISSION;
	value = Value_Pfeil;
	visual = "ItRw_Arrow_Sky_Iron.3ds";
	material = MAT_WOOD;
	description = name;
	text[2] = "На наконечнике стрелы выбита литера 'Ф'...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITRW_MYHUNTARROW(C_Item)
{
	name = "Кереновая стрела";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_BOW | ITEM_MULTI | ITEM_MISSION;
	value = Value_Pfeil;
	visual = "ItRw_Arrow_Sky_Keren.3ds";
	material = MAT_WOOD;
	description = name;
	text[2] = "";
	text[4] = "Способна пробить почти любую броню...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItRw_Ass_2x2(C_Item)
{
	name = "";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_CROSSBOW | ITEM_MULTI;
	value = 0;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_BOLT";
	visual = "ItMw_DS_MonWeapon.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = TRUE;
	inv_rotx = INVCAM_X_RING_STANDARD;
};

instance ITRW_ADDON_MAGICBOLT_SHV(C_Item)
{
	name = "Стрела Вершителя";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_CROSSBOW | ITEM_MULTI | ITEM_MISSION;
	value = 500;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_BOLT";
	visual = "ItRw_Bolt_Sky_Shv.3ds";
	material = MAT_WOOD;
	description = name;
	text[4] = "Излучает сильную магическую энергию...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = TRUE;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

//---------------------------------Луки------------------------------

instance ItRw_Bow_L_01(C_Item)
{
	name = "Короткий лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = 100;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 15;
	damageTotal = 15;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Kurzbogen;
	cond_atr[1] = ATR_REGENERATEHP;
	cond_value[1] = 5;
	visual = "ItRw_Bow_L_01.mms";
	on_equip = equip_bow_light;
	on_unequip = unequip_bow_light;
	description = name;
	text[1] = NAME_Bow_needed;
	count[1] = cond_value[1];
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItRw_Bow_L_02(C_Item)
{
	name = "Ивовый лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_Weidenbogen;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 20;
	damageTotal = 20;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Weidenbogen;
	cond_atr[1] = ATR_REGENERATEHP;
	cond_value[1] = 10;
	visual = "ItRw_Bow_L_02.mms";
	on_equip = equip_bow_light;
	on_unequip = unequip_bow_light;
	description = name;
	text[1] = NAME_Bow_needed;
	count[1] = cond_value[1];
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItRw_Bow_L_03(C_Item)
{
	name = "Охотничий лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_Jagdbogen;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 30;
	damageTotal = 30;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Jagdbogen;
	cond_atr[1] = ATR_REGENERATEHP;
	cond_value[1] = 15;
	visual = "ITRW_G3_SMALL_BOW_01.mms";
	on_equip = equip_bow_light;
	on_unequip = unequip_bow_light;
	description = name;
	text[1] = NAME_Bow_needed;
	count[1] = cond_value[1];
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITRW_BOSPBOW_L_03(C_Item)
{
	name = "Лук следопыта";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = VALUE_JAGDBOGENBOSP;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 35;
	damageTotal = 35;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_JAGDBOGENBOSP;
	cond_atr[1] = ATR_REGENERATEHP;
	cond_value[1] = 15;
	visual = "ItRw_Bow_L_05.mms";
	on_equip = equip_bow_medium;
	on_unequip = unequip_bow_medium;
	description = name;
	text[1] = NAME_Bow_needed;
	count[1] = cond_value[1];
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[4] = "Этот лук подарил мне Боспер...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItRw_Bow_L_04(C_Item)
{
	name = "Вязовый лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_Ulmenbogen;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 40;
	damageTotal = 40;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Ulmenbogen;
	cond_atr[1] = ATR_REGENERATEHP;
	cond_value[1] = 20;
	visual = "ITRW_G3_LONG_BOW_01.mms";
	on_equip = equip_bow_medium;
	on_unequip = unequip_bow_medium;
	description = name;
	text[1] = NAME_Bow_needed;
	count[1] = cond_value[1];
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItRw_Bow_M_01(C_Item)
{
	name = "Составной лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_Kompositbogen;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 50;
	damageTotal = 50;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Kompositbogen;
	cond_atr[1] = ATR_REGENERATEHP;
	cond_value[1] = 25;
	visual = "ItRw_Bow_M_01.mms";
	on_equip = equip_bow_medium;
	on_unequip = unequip_bow_medium;
	description = name;
	text[1] = NAME_Bow_needed;
	count[1] = cond_value[1];
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItRw_Bow_M_02(C_Item)
{
	name = "Ясеневый лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_Eschenbogen;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 70;
	damageTotal = 70;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Eschenbogen;
	cond_atr[1] = ATR_REGENERATEHP;
	cond_value[1] = 30;
	visual = "ItRw_Bow_M_02.mms";
	on_equip = equip_bow_medium;
	on_unequip = unequip_bow_medium;
	description = name;
	text[1] = NAME_Bow_needed;
	count[1] = cond_value[1];
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItRw_Bow_M_03(C_Item)
{
	name = "Длинный лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_Langbogen;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 80;
	damageTotal = 80;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Langbogen;
	cond_atr[1] = ATR_REGENERATEHP;
	cond_value[1] = 35;
	visual = "ItRw_Bow_M_03.mms";
	on_equip = equip_bow_medium;
	on_unequip = unequip_bow_medium;
	description = name;
	text[1] = NAME_Bow_needed;
	count[1] = cond_value[1];
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItRw_Bow_M_04(C_Item)
{
	name = "Буковый лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_Buchenbogen;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 100;
	damageTotal = 100;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Buchenbogen;
	cond_atr[1] = ATR_REGENERATEHP;
	cond_value[1] = 40;
	visual = "ItRw_Bow_M_04.mms";
	on_equip = equip_bow_heavy;
	on_unequip = unequip_bow_heavy;
	description = name;
	text[1] = NAME_Bow_needed;
	count[1] = cond_value[1];
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


//--------------------------Крафт луков----------------------------------

instance ItRw_BowCraft_01(C_Item)
{
	name = "Короткий лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = 50;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 15;
	damageTotal = 15;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Kurzbogen;
	cond_atr[1] = ATR_REGENERATEHP;
	cond_value[1] = 10;
	visual = "ItRw_Bow_L_01.mms";
	on_equip = equip_bow_craft_01;
	on_unequip = unequip_bow_craft_01;
	description = name;
	text[1] = NAME_Bow_needed;
	count[1] = cond_value[1];
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[4] = NAME_WieldBowBonus;
	count[4] = 1;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItRw_BowCraft_02(C_Item)
{
	name = "Ивовый лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = 100;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 35;
	damageTotal = 35;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Weidenbogen;
	cond_atr[1] = ATR_REGENERATEHP;
	cond_value[1] = 20;
	visual = "ItRw_Bow_L_02.mms";
	on_equip = equip_bow_craft_02;
	on_unequip = unequip_bow_craft_02;
	description = name;
	text[1] = NAME_Bow_needed;
	count[1] = cond_value[1];
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[4] = NAME_WieldBowBonus;
	count[4] = 2;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItRw_BowCraft_03(C_Item)
{
	name = "Вязовый лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = 200;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 60;
	damageTotal = 60;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Ulmenbogen;
	cond_atr[1] = ATR_REGENERATEHP;
	cond_value[1] = 30;
	visual = "ITRW_G3_LONG_BOW_01.mms";
	on_equip = equip_bow_craft_03;
	on_unequip = unequip_bow_craft_03;
	description = name;
	text[1] = NAME_Bow_needed;
	count[1] = cond_value[1];
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[4] = NAME_WieldBowBonus;
	count[4] = 3;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItRw_BowCraft_04(C_Item)
{
	name = "Ясеневый лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = 300;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 80;
	damageTotal = 80;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Eschenbogen;
	cond_atr[1] = ATR_REGENERATEHP;
	cond_value[1] = 35;
	visual = "ItRw_Bow_M_02.mms";
	on_equip = equip_bow_craft_04;
	on_unequip = unequip_bow_craft_04;
	description = name;
	text[1] = NAME_Bow_needed;
	count[1] = cond_value[1];
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[4] = NAME_WieldBowBonus;
	count[4] = 4;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItRw_BowCraft_05(C_Item)
{
	name = "Буковый лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = 750;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 110;
	damageTotal = 110;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Buchenbogen;
	cond_atr[1] = ATR_REGENERATEHP;
	cond_value[1] = 40;
	visual = "ItRw_Bow_M_04.mms";
	on_equip = equip_bow_craft_05;
	on_unequip = unequip_bow_craft_05;
	description = name;
	text[1] = NAME_Bow_needed;
	count[1] = cond_value[1];
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[4] = NAME_WieldBowBonus;
	count[4] = 5;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

//---------------Луки с силой----------------------------------------------------

instance ItRw_Bow_H_01(C_Item)
{
	name = "Костяной лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_Knochenbogen;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 110;
	damageTotal = 110;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 130;
	visual = "ItRw_Bow_H_01.mms";
	on_equip = equip_bow_heavy;
	on_unequip = unequip_bow_heavy;
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItRw_Bow_H_02(C_Item)
{
	name = "Дубовый лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_Eichenbogen;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 120;
	damageTotal = 120;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 150;
	visual = "ItRw_Bow_H_02.mms";
	on_equip = equip_bow_heavy;
	on_unequip = unequip_bow_heavy;
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItRw_Bow_H_03(C_Item)
{
	name = "Боевой лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_Kriegsbogen;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 130;
	damageTotal = 130;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 170;
	visual = "ItRw_Bow_H_03.mms";
	on_equip = equip_bow_heavy;
	on_unequip = unequip_bow_heavy;
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItRw_Bow_H_04(C_Item)
{
	name = "Драконий лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_Drachenbogen;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 150;
	damageTotal = 150;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 200;
	visual = "ITRW_BOWMAKED8_S_DRAGONBONE.mms";
	on_equip = equip_bow_heavy;
	on_unequip = unequip_bow_veryheavy;
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

//-----------------уникальные----------------------------------///


instance ITRW_WHITEBOW(C_Item)
{
	name = "Нордмарский лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = 3000;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 190;
	damageTotal = 190;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 240;
	visual = "ITRW_BOWMAKED4_G3_HORN.mms";
	on_equip = equip_bow_veryheavy;
	on_unequip = unequip_bow_veryheavy;
	description = name;
	text[2] = NAME_Damage;
	count[2] = damage[DAM_INDEX_POINT];
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItRw_Sld_Bow(C_Item)
{
	name = "Лук наемника";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_SldBogen;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 30;
	damageTotal = 30;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 50;
	visual = "ITRW_BOW_S_IRON.mms";
	on_equip = equip_bow_medium;
	on_unequip = unequip_bow_medium;
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITRW_DIEGO_BOW(C_Item)
{
	name = "Взгляд Диего";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = value_itrw_diego_bow;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 70;
	damageTotal = 70;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 170;
	cond_atr[1] = ATR_REGENERATEHP;
	cond_value[1] = 40;
	visual = "ITRW_BOWMAKED3_A_BONE.mms";
	on_equip = equip_bow_heavy;
	on_unequip = unequip_bow_heavy;
	description = name;
	text[1] = NAME_Bow_needed;
	count[1] = cond_value[1];
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItRw_Arabic_Bow(C_Item)
{
	name = "Лук Тени";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = 500;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 170;
	damageTotal = 170;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 200;
	visual = "ItRw_Bow_Long_Arabic.mms";
	on_equip = equip_bow_medium;
	on_unequip = unequip_bow_medium;
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

//----------------------Арбалеты---------------------------------------------

instance ItRw_Crossbow_Light(C_Item)
{
	name = "Легкий арбалет";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = 100;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 30;
	munition = ItRw_Bolt;
	cond_atr[0] = SKL_CROSSBOW;
	cond_value[0] = 5;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 50;
	visual = "ITRW_MIL_CROSSBOW.mms";
	on_equip = equip_crossbow_light;
	on_unequip = unequip_crossbow_light;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_POINT];
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Crb_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Mil_Crossbow(C_Item)
{
	name = "Арбалет ополченца";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_MilArmbrust;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 80;
	munition = ItRw_Bolt;
	cond_atr[0] = SKL_CROSSBOW;
	cond_value[0] = 10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	visual = "ITRW_MIL_CROSSBOW.mms";
	on_equip = equip_crossbow_light;
	on_unequip = unequip_crossbow_light;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_POINT];
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Crb_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_BDT_Crossbow(C_Item)
{
	name = "Самострел бандита";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_MilArmbrust;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 90;
	munition = ItRw_Bolt;
	cond_atr[0] = SKL_CROSSBOW;
	cond_value[0] = 15;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 120;
	visual = "ItRw_Mil_Crossbow.mms";
	on_equip = equip_crossbow_light;
	on_unequip = unequip_crossbow_light;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_POINT];
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Crb_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Crossbow_L_01(C_Item)
{
	name = "Охотничий арбалет";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_Jagdarmbrust;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 105;
	munition = ItRw_Bolt;
	cond_atr[0] = SKL_CROSSBOW;
	cond_value[0] = 25;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 145;
	visual = "ItRw_Crossbow_L_01.mms";
	on_equip = equip_crossbow_light;
	on_unequip = unequip_crossbow_light;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_POINT];
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Crb_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Crossbow_L_02(C_Item)
{
	name = "Арбалет";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_LeichteArmbrust;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 120;
	munition = ItRw_Bolt;
	cond_atr[0] = SKL_CROSSBOW;
	cond_value[0] = 30;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 170;
	visual = "ItRw_Crossbow_L_02.mms";
	on_equip = equip_crossbow_light;
	on_unequip = unequip_crossbow_light;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_POINT];
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Crb_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_PAL_Crossbow_NPC(C_Item)
{
	name = "Легкий арбалет рыцаря";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = 100;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 140;
	munition = ItRw_Bolt;
	cond_atr[0] = SKL_CROSSBOW;
	cond_value[0] = 40;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 210;
	visual = "ItRw_Crossbow_M_02.mms";
	on_equip = equip_crossbow_medium;
	on_unequip = unequip_crossbow_medium;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_POINT];
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Crb_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Crossbow_M_01(C_Item)
{
	name = "Боевой арбалет";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_Armbrust;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 160;
	munition = ItRw_Bolt;
	cond_atr[0] = SKL_CROSSBOW;
	cond_value[0] = 40;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 220;
	visual = "ItRw_Crossbow_M_02.mms";
	on_equip = equip_crossbow_medium;
	on_unequip = unequip_crossbow_medium;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_POINT];
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Crb_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Crossbow_M_02(C_Item)
{
	name = "Арбалет рыцаря";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_Kriegsarmbrust;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 200;
	munition = ItRw_Bolt;
	cond_atr[0] = SKL_CROSSBOW;
	cond_value[0] = 50;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 250;
	visual = "ItRw_Crossbow_H_01.mms";
	on_equip = equip_crossbow_medium;
	on_unequip = unequip_crossbow_medium;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_POINT];
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Crb_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_PAL_Crossbow(C_Item)
{
	name = "Арбалет паладина";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_Kriegsarmbrust;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 240;
	munition = ItRw_Bolt;
	cond_atr[0] = SKL_CROSSBOW;
	cond_value[0] = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 300;
	visual = "ItRw_Crossbow_M_02.mms";
	on_equip = equip_crossbow_medium;
	on_unequip = unequip_crossbow_medium;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_POINT];
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Crb_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Crossbow_H_01(C_Item)
{
	name = "Тяжелый арбалет";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_SchwereArmbrust;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 265;
	munition = ItRw_Bolt;
	cond_atr[0] = SKL_CROSSBOW;
	cond_value[0] = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 350;
	visual = "ITRW_CROSSBOW_A_XBOW_OCEAN.mms";
	on_equip = equip_crossbow_heavy;
	on_unequip = unequip_crossbow_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_POINT];
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Crb_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Crossbow_H_02(C_Item)
{
	name = "Арбалет драконоборца";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_Drachenjaegerarmbrust;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 300;
	munition = ItRw_Bolt;
	cond_atr[0] = SKL_CROSSBOW;
	cond_value[0] = 80;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 400;
	visual = "ITRW_CROSSBOW_A_XBOW_LEVIATHAN.mms";
	on_equip = equip_crossbow_heavy;
	on_unequip = unequip_crossbow_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_POINT];
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Crb_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITRW_CROSSBOW_ORC(C_Item)
{
	name = "Драг Мора";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = 200;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 130;
	munition = ItRw_Bolt;
	cond_atr[0] = SKL_CROSSBOW;
	cond_value[0] = 30;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 160;
	visual = "ITRW_CROSSBOW_R_GUARD.mms";
	on_equip = equip_crossbow_veryheavy;
	on_unequip = unequip_crossbow_veryheavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_POINT];
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Crb_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITRW_CROSSBOW_ORC_LIGHT(C_Item)
{
	name = "Драг Мал";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = 100;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 80;
	munition = ItRw_Bolt;
	cond_atr[0] = SKL_CROSSBOW;
	cond_value[0] = 20;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 120;
	visual = "ITRW_CROSSBOW_R_SMALL.mms";
	on_equip = equip_crossbow_heavy;
	on_unequip = unequip_crossbow_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_POINT];
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Crb_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITRW_ADDON_MAGICCROSSBOW_SHV(C_Item)
{
	name = "Вершитель";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW | ITEM_MISSION;
	material = MAT_WOOD;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_MAGIC_SMOKE";
	value = 10000;
	damageTotal = 1500;
	damagetype = DAM_MAGIC;
	munition = itrw_addon_magicbolt_shv;
	visual = "ITRW_CROSSBOW_S_DAWNGUARD.mms";
	on_equip = equip_crossbow_shv;
	on_unequip = unequip_crossbow_shv;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[4] = "Для стрельбы требуются Стрелы Вершителя...";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITRW_GREATARBALET_ORC_01(C_Item)
{
	name = "Драг Нимрод";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = 5000;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 320;
	munition = ItRw_Bolt;
	cond_atr[0] = SKL_CROSSBOW;
	cond_value[0] = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 450;
	visual = "ITRW_CROSSBOW_MAKED8_G3_NRD.mms";
	on_equip = equip_crossbow_veryheavy_dr1;
	on_unequip = unequip_crossbow_veryheavy_dr1;
	description = name;
	text[0] = NAME_Damage;
	count[0] = damage[DAM_INDEX_POINT];
	text[1] = NAME_Str_needed;
	count[1] = cond_value[2];
	text[2] = NAME_Crb_needed;
	count[2] = cond_value[0];
	text[4] = "Легендарное орочье оружие...";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITRW_GREATARBALET_ORC_02(C_Item)
{
	name = "Драг Нимрод";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = 5000;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 345;
	munition = ItRw_Bolt;
	cond_atr[0] = SKL_CROSSBOW;
	cond_value[0] = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 450;
	visual = "ITRW_CROSSBOW_MAKED8_G3_NRD.mms";
	on_equip = equip_crossbow_veryheavy_dr2;
	on_unequip = unequip_crossbow_veryheavy_dr2;
	description = name;
	text[0] = NAME_Damage;
	count[0] = damage[DAM_INDEX_POINT];
	text[1] = NAME_Str_needed;
	count[1] = cond_value[2];
	text[2] = NAME_Crb_needed;
	count[2] = cond_value[0];
	text[4] = "Легендарное орочье оружие...";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITRW_GREATARBALET_ORC_03(C_Item)
{
	name = "Драг Нимрод";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = 5000;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 370;
	munition = ItRw_Bolt;
	cond_atr[0] = SKL_CROSSBOW;
	cond_value[0] = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 450;
	visual = "ITRW_CROSSBOW_MAKED8_G3_NRD.mms";
	on_equip = equip_crossbow_veryheavy_dr3;
	on_unequip = unequip_crossbow_veryheavy_dr3;
	description = name;
	text[0] = NAME_Damage;
	count[0] = damage[DAM_INDEX_POINT];
	text[1] = NAME_Str_needed;
	count[1] = cond_value[2];
	text[2] = NAME_Crb_needed;
	count[2] = cond_value[0];
	text[4] = "Легендарное орочье оружие...";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITRW_GREATARBALET_ORC_04(C_Item)
{
	name = "Драг Нимрод";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = 5000;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 400;
	munition = ItRw_Bolt;
	cond_atr[0] = SKL_CROSSBOW;
	cond_value[0] = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 450;
	visual = "ITRW_CROSSBOW_MAKED8_G3_NRD.mms";
	on_equip = equip_crossbow_veryheavy_dr4;
	on_unequip = unequip_crossbow_veryheavy_dr4;
	description = name;
	text[0] = NAME_Damage;
	count[0] = damage[DAM_INDEX_POINT];
	text[1] = NAME_Str_needed;
	count[1] = cond_value[2];
	text[2] = NAME_Crb_needed;
	count[2] = cond_value[0];
	text[4] = "Легендарное орочье оружие...";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITRW_GREATARBALET_ORC_05(C_Item)
{
	name = "Драг Нимрод";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = 5000;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 425;
	munition = ItRw_Bolt;
	cond_atr[0] = SKL_CROSSBOW;
	cond_value[0] = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 450;
	visual = "ITRW_CROSSBOW_MAKED8_G3_NRD.mms";
	on_equip = equip_crossbow_veryheavy_dr5;
	on_unequip = unequip_crossbow_veryheavy_dr5;
	description = name;
	text[0] = NAME_Damage;
	count[0] = damage[DAM_INDEX_POINT];
	text[1] = NAME_Str_needed;
	count[1] = cond_value[2];
	text[2] = NAME_Crb_needed;
	count[2] = cond_value[0];
	text[4] = "Легендарное орочье оружие...";
	text[5] = NAME_Value;
	count[5] = value;
};

//-----------------------------уникальные луки-----------------

instance ITRW_BOW_DOUBLE_01(C_Item)		//Хоринис
{
	name = "Ночной странник";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = 5000;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 120;
	damageTotal = 120;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 160;
	cond_atr[1] = ATR_REGENERATEHP;
	cond_value[1] = 50;
	protection[PROT_MAGIC] = 5;
	protection[PROT_FIRE] = 5;
	visual = "ITRW_BOW_R_BONE.mms";
	on_equip = equip_bow_medium_uniq;
	on_unequip = unequip_bow_medium_uniq;
	description = name;
	text[0] = NAME_Bow_needed;
	count[0] = cond_value[1];
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITRW_G3_LONG_BOW_02(C_Item)		//Яркендар Золотой Дракон
{
	name = "Якулус";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = 1200;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 140;
	damageTotal = 140;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 190;
	cond_atr[1] = ATR_REGENERATEHP;
	cond_value[1] = 55;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 10;
	visual = "ITRW_G3_LONG_BOW_02.mms";
	on_equip = equip_bow_medium_uniq;
	on_unequip = unequip_bow_medium_uniq;
	description = name;
	text[0] = NAME_Bow_needed;
	count[0] = cond_value[1];
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Prot_Phis;
	count[3] = protection[PROT_EDGE];
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITRW_KMR_KADAT_BOW_01(C_Item)	//Долина Рудников - Нетбек
{
	name = "Кудзу";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = 2500;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 160;
	damageTotal = 160;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 210;
	cond_atr[1] = ATR_REGENERATEHP;
	cond_value[1] = 55;
	change_atr[2] = ATR_HITPOINTS_MAX;
	change_value[2] = 200;
	visual = "ITRW_KMR_KADAT_BOW_01.mms";
	on_equip = equip_bow_medium_uniq;
	on_unequip = unequip_bow_medium_uniq;
	description = name;
	text[0] = NAME_Bow_needed;
	count[0] = cond_value[1];
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Bonus_HpMax;
	count[3] = change_value[2];
	text[4] = "Основание лука украшено живыми стеблями древа...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITRW_KMR_DARKLONG_BOW_01(C_Item)	//Cтарая шахта
{
	name = "Прядильщик боли";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = 1400;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 170;
	damageTotal = 170;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 220;
	cond_atr[1] = ATR_REGENERATEHP;
	cond_value[1] = 60;
	protection[PROT_MAGIC] = 10;
	visual = "ITRW_KMR_DARKLONG_BOW_01.mms";
	on_equip = equip_bow_medium_uniq;
	on_unequip = unequip_bow_medium_uniq;
	description = name;
	text[0] = NAME_Bow_needed;
	count[0] = cond_value[1];
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Prot_Magic;
	count[3] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITRW_SHADOWBOW(C_Item)
{
	name = "Лук Теней";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = 3500;
	damagetype = DAM_BLUNT;
	damage[DAM_INDEX_BLUNT] = 180;
	damageTotal = 180;
	munition = ITRW_MYHUNTARROW;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 230;
	cond_atr[1] = ATR_REGENERATEHP;
	cond_value[1] = 60;
	protection[PROT_FLY] = 30;
	visual = "ITRW_BOWMAKED6_S_NIGHTINGALEBOW.mms";
	on_equip = equip_bow_keren;
	on_unequip = unequip_bow_keren;
	description = name;
	text[0] = NAME_Bow_needed;
	count[0] = cond_value[1];
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Bonus_Fly;
	count[3] = 3;
	text[4] = "Этот лук сделан из дерева керенового дуба...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITRW_KMR_SHADOWS_BOW_01(C_Item) //Приорат
{
	name = "Хамасин";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = 1000;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 190;
	damageTotal = 190;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 250;
	cond_atr[1] = ATR_REGENERATEHP;
	cond_value[1] = 60;
	protection[PROT_MAGIC] = 25;
	visual = "ITRW_KMR_SHADOWS_BOW_01.mms";
	on_equip = equip_bow_heavy_uniq_ham;
	on_unequip = unequip_bow_heavy_uniq_ham;
	description = name;
	text[0] = NAME_Bow_needed;
	count[0] = cond_value[1];
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Prot_Magic;
	count[3] = protection[PROT_MAGIC];
	text[4] = "Легендарное оружие воинов Масиаф...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITRW_G3_SILENTDEATH_BOW_01_NPC(C_Item) //Гонсалес 
{
	name = "Тихая смерть";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = 1500;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 100;
	damageTotal = 100;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 200;
	cond_atr[1] = ATR_REGENERATEHP;
	cond_value[1] = 65;
	visual = "ITRW_G3_SILENTDEATH_BOW_01.mms";
	on_equip = equip_bow_heavy_uniq;
	on_unequip = unequip_bow_heavy_uniq;
	description = name;
	text[1] = NAME_Bow_needed;
	count[1] = cond_value[1];
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITRW_G3_SILENTDEATH_BOW_01(C_Item) //Гонсалес 
{
	name = "Тихая смерть";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = 1500;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 200;
	damageTotal = 200;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 260;
	cond_atr[1] = ATR_REGENERATEHP;
	cond_value[1] = 65;
	protection[PROT_FIRE] = 25;
	visual = "ITRW_G3_SILENTDEATH_BOW_01.mms";
	on_equip = equip_bow_heavy_uniq;
	on_unequip = unequip_bow_heavy_uniq;
	description = name;
	text[0] = NAME_Bow_needed;
	count[0] = cond_value[1];
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = "Этот лук подарил мне Гонсалес...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITRW_BOW_BONES(C_Item)		//Город мертвых
{
	name = "Шер Гар Мал";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = 3000;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 240;
	damageTotal = 240;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 340;
	cond_atr[1] = ATR_REGENERATEHP;
	cond_value[1] = 80;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 40;
	visual = "ITRW_BOW_BONES_01.mms";
	on_equip = equip_bow_bones;
	on_unequip = unequip_bow_bones;
	description = name;
	text[0] = NAME_Bow_needed;
	count[0] = cond_value[1];
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Prot_Phis;
	count[3] = protection[PROT_EDGE];
	text[4] = "Этот лук сделан из человеческих костей...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITRW_G4_OAK_BOW_01(C_Item)	//Храм Слез
{
	name = "Эр'Хазир";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = 5000;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 210;
	damageTotal = 210;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 310;
	cond_atr[1] = ATR_REGENERATEHP;
	cond_value[1] = 70;
	change_atr[2] = ATR_HITPOINTS_MAX;
	change_value[2] = 200;
	protection[PROT_EDGE] = 20;
	protection[PROT_BLUNT] = 20;
	visual = "ITRW_G4_OAK_BOW_01.mms";
	on_equip = equip_bow_heavy_uniq;
	on_unequip = unequip_bow_heavy_uniq;
	description = name;
	text[0] = NAME_Bow_needed;
	count[0] = cond_value[1];
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Bonus_HpMax;
	count[3] = change_value[2];
	text[4] = NAME_Prot_Phis;
	count[4] = protection[PROT_EDGE];
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITRW_HOLYBOW(C_Item) //Шахта орков
{
	name = "Святой посланник";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = 5000;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 260;
	damageTotal = 260;
	on_equip = equip_holybow;
	on_unequip = unequip_holybow;
	munition = ItRw_Arrow;
	wear = WEAR_EFFECT;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 360;
	cond_atr[1] = ATR_REGENERATEHP;
	cond_value[1] = 95;
	visual = "ITRW_BOWMAKED5_A_COBRA.mms";
	description = name;
	text[0] = NAME_Bow_needed;
	count[0] = cond_value[1];
	text[1] = NAME_Dam_Magic;
	count[1] = damageTotal;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[4] = "Эффективен против нежити...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITRW_G3_DEMON_BOW_01(C_Item) //Ирдорат
{
	name = "Цвет Смерти";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = 10000;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 360;
	damageTotal = 360;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 420;
	cond_atr[1] = ATR_REGENERATEHP;
	cond_value[1] = 100;
	protection[PROT_MAGIC] = 50;
	visual = "ITRW_G3_DEMON_BOW_01.mms";
	on_equip = equip_bow_demon;
	on_unequip = unequip_bow_demon;
	description = name;
	text[0] = NAME_Bow_needed;
	count[0] = cond_value[1];
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Prot_Magic;
	count[3] = protection[PROT_MAGIC];
	text[4] = "Кажется, сама смерть коснулась этого лука...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITRW_HAOS_BOW_01(C_Item) //Демон ритуала магов Воды
{
	name = "Длань Хаоса";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_METAL;
	value = 15000;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 400;
	damageTotal = 400;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 500;
	cond_atr[1] = ATR_REGENERATEHP;
	cond_value[1] = 100;
	protection[PROT_MAGIC] = 75;
	effect = "SPELLFX_STONESPHERE";
	visual = "ITRW_BOW_S_DAEDRIC.mms";
	on_equip = equip_bow_chaos;
	on_unequip = unequip_bow_chaos;
	description = name;
	text[0] = NAME_Bow_needed;
	count[0] = cond_value[1];
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Prot_Magic;
	count[3] = protection[PROT_MAGIC];
	text[4] = "При одном лишь взгляде на лук вас охватывает приступ безумия...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

//---------------------------проклятое оружие---------------------------

instance ItRw_Undead(C_Item)
{
	name = "Лук проклятых";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_Knochenbogen;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = Damage_Knochenbogen;
	damageTotal = Damage_Knochenbogen;
	cond_atr[1] = ATR_MANA_MAX;
	cond_value[1] = 6666;
	munition = ItRw_Arrow;
	visual = "ItRw_Bow_H_01.mms";
	on_equip = equip_bow_heavy_dam;
	on_unequip = unequip_bow_heavy_dam;
	description = name;
	inv_animate = 1;
};

instance ItRw_Crossbow_Undead(C_Item)
{
	name = "Арбалет проклятых";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_MilArmbrust;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 200;
	damageTotal = 200;
	cond_atr[1] = ATR_MANA_MAX;
	cond_value[1] = 6666;
	munition = ItRw_Bolt;
	visual = "ItRw_Mil_Crossbow.mms";
	on_equip = equip_crossbow_light_dam;
	on_unequip = unequip_crossbow_light_dam;
	description = name;
	inv_animate = 1;
};


//---------------------Колчаны--------------------------------

instance ItSl_BackArrowSack_01(C_Item) 
{	
	name	= "Колчан";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItSl_BackArrowSack_01.3ds";
	material = MAT_LEATHER;
	description = name;
	inv_animate = 1;
};

instance ItSl_BackArrowSack_02(C_Item) 
{	
	name	= "Колчан";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItSl_BackArrowSack_02.3ds";
	material = MAT_LEATHER;
	description = name;
	inv_animate = 1;
};

instance ItSl_BackArrowSack_04(C_Item)	
{	
	name	= "Колчан";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItSl_BackArrowSack_04.3ds";
	material = MAT_LEATHER;
	description = name;
	inv_animate = 1;
};

instance ItSl_BackArrowSack_05(C_Item) 
{	
	name	= "Колчан";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItSl_BackArrowSack_05.3ds";
	material = MAT_LEATHER;
	description = name;
	inv_animate = 1;
};

instance ItSl_BackArrowSack_06(C_Item)	
{	
	name	= "Колчан";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItSl_BackArrowSack_06.3ds";
	material = MAT_LEATHER;
	description = name;
	inv_animate = 1;
};

instance ItSl_BackArrowSack_07(C_Item)	
{	
	name	= "Колчан";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItSl_BackArrowSack_07.3ds";
	material = MAT_LEATHER;
	description = name;
	inv_animate = 1;
};

instance ItSl_BackArrowSack_08(C_Item)	
{	
	name	= "Колчан";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItSl_BackArrowSack_08.3ds";
	material = MAT_LEATHER;
	description = name;
	inv_animate = 1;
};

instance ItSl_BackArrowSack_09(C_Item)	
{	
	name	= "Колчан";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItSl_BackArrowSack_09.3ds";
	material = MAT_LEATHER;
	description = name;
	inv_animate = 1;
};

instance ItSl_BackArrowSack_10(C_Item)	
{	
	name	= "Колчан";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItSl_BackArrowSack_10.3ds";
	material = MAT_LEATHER;
	description = name;
	inv_animate = 1;
};

instance ItSl_BackBoltSack_01(C_Item)
{	
	name	= "Сумка для болтов";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItSl_BackBoltSack_01.3ds";
	material = MAT_LEATHER;
	description = name;
	inv_animate = 1;
};