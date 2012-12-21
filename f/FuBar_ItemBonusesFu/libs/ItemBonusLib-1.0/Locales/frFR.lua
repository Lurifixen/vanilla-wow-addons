﻿if AceLibrary:HasInstance("ItemBonusLib-1.0") then return end

local L = AceLibrary("AceLocale-2.2"):new("ItemBonusLib")

L:RegisterTranslations("frFR", function () return {
	-- bonus names
	NAMES = {
		STR 		= "Force",
		AGI 		= "Agilité",
		STA 		= "Endurance",
		INT 		= "Intelligence",
		SPI 		= "Esprit",
		ARMOR 		= "Bonus d'Armure",

		ARCANERES 	= "Arcane",
		FIRERES 	= "Feu",
		NATURERES 	= "Nature",
		FROSTRES 	= "Givre",
		SHADOWRES 	= "Ombre",

		FISHING 	= "Pêche",
		MINING 		= "Minage",
		HERBALISM 	= "Herborisme",
		SKINNING 	= "Dépeçage",
		DEFENSE 	= "Défense",

		BLOCK 		= "Chance de Bloquer",
		BLOCKVALUE  = "Valeur de blocage",
		DODGE 		= "Esquive",
		PARRY 		= "Parade",
		ATTACKPOWER = "Puissance d'attaque",
		ATTACKPOWERUNDEAD = "Puissance d'attaque contre les morts-vivants",
		ATTACKPOWERFERAL = "Puissance d'attaque en forme férale",
		CRIT 		= "Coups Critiques",
		RANGEDATTACKPOWER = "Puissance d'attaque à distance",
		RANGEDCRIT 	= "Tirs Crit.",
		TOHIT 		= "Chances de toucher",

		DMG 		= "Dégâts",
		DMGUNDEAD	= "Dégâts des sorts contre les morts-vivants",
		ARCANEDMG 	= "Dégâts d'Arcanes",
		FIREDMG 	= "Dégâts de Feu",
		FROSTDMG 	= "Dégâts de Froid",
		HOLYDMG 	= "Dégâts Sacrés",
		NATUREDMG 	= "Dégâts de Nature",
		SHADOWDMG 	= "Dégâts des Ombres",
		SPELLCRIT 	= "Critiques",
		HEAL 		= "Soins",
		HOLYCRIT 	= "Soins Crit.",
		SPELLTOHIT	= "Chance de toucher avec les sorts",
		SPELLPEN 	= "Diminue les résistances",

		HEALTHREG 	= "Régeneration Vie",
		MANAREG 	= "Régeneration Mana",
		HEALTH 		= "Points de Vie",
		MANA 		= "Points de Mana",
	},

	PATTERNS_PASSIVE = {
		{ pattern = "+(%d+) à la puissance d'attaque%.", effect = "ATTACKPOWER" },
		{ pattern = "+(%d+) à la puissance d'attaque lorsque vous combattez des morts%-vivants%.", effect = "ATTACKPOWERUNDEAD" },
		{ pattern = "+(%d+) à la puissance des attaques à distance%.", effect = "RANGEDATTACKPOWER" },
		{ pattern = "Augmente vos chances de bloquer les attaques avec un bouclier de (%d+)%%%.", effect = "BLOCK" },
		{ pattern = "Augmente le score de blocage de votre bouclier de (%d+)%.", effect = "BLOCKVALUE" },
		{ pattern = "Augmente vos chances d'esquiver une attaque de (%d+)%%%.", effect = "DODGE" },
		{ pattern = "Augmente vos chances de parer une attaque de (%d+)%%%.", effect = "PARRY" },
		{ pattern = "Augmente vos chances d'infliger un coup critique avec vos sorts de (%d+)%%%.", effect = "SPELLCRIT" },
		{ pattern = "Augmente vos chances d'infliger un coup critique de (%d+)%%%.", effect = "CRIT" },
		{ pattern = "Augmente vos chances d'infliger un coup critique avec une arme à feu par (%d+)%%%.", effect = "RANGEDCRIT" },
		{ pattern = "Augmente vos chances de lancer un soin critique par (%d+)%%%.", effect = "HEALCRIT" },
		{ pattern = "Augmente les dégâts infligés par les effets et les sorts des Arcanes de (%d+)% au maximum%.", effect = "ARCANEDMG" },
		{ pattern = "Augmente les dégâts infligés par les sorts et effets de Feu de (%d+)% au maximum%.", effect = "FIREDMG" },
		{ pattern = "Augmente les dégâts infligés par les sorts et les effets de givre de (%d+)% au maximum%.", effect = "FROSTDMG" },
		{ pattern = "Augmente les dommages realises par les sorts Sacrés de (%d+)%.", effect = "HOLYDMG" },
		{ pattern = "Augmente les dégâts infligés par les sorts et les effets de Nature (%d+)% au maximum%.", effect = "NATUREDMG" },
		{ pattern = "Augmente les dégâts infligés par les sorts et les effets d'ombre de (%d+)% au maximum%.", effect = "SHADOWDMG" },
		{ pattern = "(%d+)% aux dégâts des sorts d'ombres%.", effect = "SHADOWDMG" },
		{ pattern = "Augmente les effets des sorts de soins de (%d+)% au maximum%.", effect = "HEAL" },
		{ pattern = "Augmente les soins prodigués par les sorts et effets de (%d+)% au maximum%.", effect = "HEAL"},
		{ pattern = "Augmente les soins et dégâts produits par les sorts et effets magiques de (%d+) au maximum%.", effect = {"HEAL", "DMG" }},
		{ pattern = "Augmente les dégâts et les soins produits par les sorts et effets magiques de (%d+) au maximum%.", effect = {"HEAL", "DMG" }},
		{ pattern = "Augmente les dégâts infligés aux morts%-vivants par les sorts et effets magiques d'un maximum de (%d+)%.", effect = "DMGUNDEAD" },
		{ pattern = "Rend (%d+) points de vie toutes les 5 sec%.", effect = "HEALTHREG" },
		{ pattern = "Rend (%d+) points de mana toutes les 5 secondes%.", effect = "MANAREG" },
		{ pattern = "Augmente vos chances de toucher de (%d+)%%%.", effect = "TOHIT" },
		{ pattern = "Augmente vos chances de toucher avec des sorts de (%d+)%%%.", effect = "SPELLTOHIT" },
		{ pattern = "Diminue les résistances magiques des cibles de vos sorts de (%d+)%.", effect = "SPELLPEN" },
		{ pattern = "Pêche augmentée de (%d+).", effect = "FISHING" },
		{ pattern = "Défense augmentée de (%d+).", effect = "DEFENSE"},
		{ pattern = "+(%d+) à l'Armure", effect = "ARMOR"},
		{ pattern = "+(%d+) à la puissance d'attaque pour les formes de félin, d'ours et d'ours redoutable uniquement%.", effect = "ATTACKPOWERFERAL"},
		{ pattern = "+(%d+) à toutes les résistances%.", effect = { "ARCANERES", "FIRERES", "FROSTRES", "NATURERES", "SHADOWRES"}},

		-- Added
		{ pattern = "(%d+)%% de votre vitesse de récupération du Mana sont actifs lorsque vous incantez%.", effect = "CASTINGREG"},		
		{ pattern = "Vous confère (%d+)%% de votre vitesse normale de récupération du mana pendant l'incantation%.", effect = "CASTINGREG"},
		{ pattern = "Augmente vos chances d'infliger un coup critique avec les sorts de Nature de (%d+)%%%.", effect = "NATURECRIT"}, 
		{ pattern = "Réduit le temps d'incantation de votre sort Rétablissement de 0.(%d+) sec%.", effect = "CASTINGREGROWTH"}, 
		{ pattern = "Réduit le temps d'incantation de votre sort Lumière sacrée de 0.(%d+) sec%.", effect = "CASTINGHOLYLIGHT"}, 
		{ pattern = "-0.(%d+) sec. au temps d'incantation de votre sort Soins rapides%.", effect = "CASTINGFLASHHEAL"}, 
		{ pattern = "-0.(%d+) secondes au temps d'incantation de votre sort Salve de guérison%.", effect = "CASTINGCHAINHEAL"},
		{ pattern = "Réduit le temps de lancement de Toucher Guérisseur de 0.(%d+) secondes%.", effect = "CASTINGHEALINGTOUCH"},
		{ pattern = "Augmente la durée de votre sort Récupération de (%d+) sec%.", effect = "DURATIONREJUV"},
		{ pattern = "Augmente la durée de votre sort Rénovation de (%d+) sec%.", effect = "DURATIONRENEW"},
		{ pattern = "Augmente la régénération des points de vie et de mana de (%d+)%.", effect = "MANAREGNORMAL"},
		{ pattern = "Augmente de (%d+)%% le montant de points de vie rendus par Salve de guérison aux cibles qui suivent la première%.", effect = "IMPCHAINHEAL"},
		{ pattern = "Augmente les soins prodigués par Récupération de (%d+) au maximum%.", effect = "IMPREJUVENATION"},
		{ pattern = "Augmente les soins prodigués par votre Vague de Soins Inférieurs de (%d+)%.", effect = "IMPLESSERHEALINGWAVE"},
		{ pattern = "Augmente les soins prodigués par votre Eclair lumineux de (%d+)%.", effect = "IMPFLASHOFLIGHT"},
		{ pattern = "Après avoir lancé un sort de Vague de soins ou de Vague de soins inférieurs, vous avez 25%% de chances de gagner un nombre de points de mana égal à (%d+)%% du coût de base du sort%.", effect = "REFUNDHEALINGWAVE"},
		{ pattern = "Votre Vague de soins soigne aussi des cibles proches supplémentaires. Chaque nouveau soin perd (%d+)%% d'efficacité, et le sort soigne jusqu'à deux cibles supplémentaires%.", effect = "JUMPHEALINGWAVE"},
		{ pattern = "Réduit de (%d+)%% le coût en mana de vos sorts Toucher guérisseur% Rétablissement% Récupération et Tranquillité%.", effect = "CHEAPERDRUID"},
		{ pattern = "En cas de réussite critique sur un Toucher guérisseur, vous récupérez (%d+)%% du coût en mana du sort%.", effect = "REFUNDHTCRIT"},
		{ pattern = "Reduit le coût en mana de votre sort Rénovation de (%d+)%%%.", effect = "CHEAPERRENEW"},
	},


	PATTERNS_GENERIC_LOOKUP = {
		["Toutes les caractéristiques"] = {"STR", "AGI", "STA", "INT", "SPI"},
		["Force"] = "STR",
		["Agilité"] = "AGI",
		["Endurance"] = "STA",
		["Intelligence"] = "INT",
		["Esprit"] = "SPI",
		["à toutes les résistances"] = { "ARCANERES", "FIRERES", "FROSTRES", "NATURERES", "SHADOWRES"},
		["Pêche"] = "FISHING",
		["Minage"] = "MINING",
		["Herborisme"] = "HERBALISM",
		["Dépeçage"] = "SKINNING",
		["Défense"] = "DEFENSE",
		["puissance d'Attaque"] = "ATTACKPOWER",
		["Puissance d'attaque contre les morts%-vivants"] 		= "ATTACKPOWERUNDEAD",
		["Esquive"] = "DODGE",
		["Blocage"] = "BLOCK",
		["Score de blocage"] = "BLOCKVALUE",
		["Puissance d'Attaque à distance"] = "RANGEDATTACKPOWER",
		["Soins chaque 5 sec."] = "HEALTHREG",
		["Sorts de Soins"] = "HEAL",
		["Sorts de soin"] = "HEAL",
		["Sorts de soins"] = "HEAL", 	
		["Mana chaque 5 sec."] = "MANAREG",
		["Sorts de Dommages"] = "DMG",
		["dégâts des sorts"] = {"HEAL", "DMG"},
		["dégâts et les effets des sorts"] = "DMG",
		["aux dégâts des sorts et aux soins"] = {"HEAL", "DMG"},
		["points de mana toutes les 5 sec"] = "MANAREG",
		["aux sorts de soins"] = "HEAL",
		["Armure"] = "ARMOR",
		["Armure"] = "ARMOR",
		["Bloquer"] = "BLOCKVALUE",
		["Coup Critique"] = "CRIT",
		["Dommage"] = "DMG",
		["Soins"] = "HEALTH",
		["Mana"] = "MANA",
		["Armure renforcée"] = "ARMOR",
	},
		
	PATTERNS_GENERIC_STAGE1 = {
		{ pattern = "Arcane", effect = "ARCANE" },
		{ pattern = "Feu", effect = "FIRE" },
		{ pattern = "Givre", effect = "FROST" },
		{ pattern = "Sacré", effect = "HOLY" },
		{ pattern = "Ombre", effect = "SHADOW" },
		{ pattern = "Nature", effect = "NATURE" },
		{ pattern = "arcanes", effect = "ARCANE" },
		{ pattern = "feu", effect = "FIRE" },
		{ pattern = "givre", effect = "FROST" },
		{ pattern = "ombre", effect = "SHADOW" },
		{ pattern = "nature", effect = "NATURE" }
	},

	PATTERNS_GENERIC_STAGE2 = {
		{ pattern = "résistance", effect = "RES" },
		{ pattern = "dégâts", effect = "DMG" },
		{ pattern = "effets", effect = "DMG" }
	},


	PATTERNS_OTHER = {
		{ pattern = "(%d+) Mana chaque 5 sec.", effect = "MANAREG" }, --?
		{ pattern = "Récup. mana (%d+)/5 sec.", effect = "MANAREG" }, --?
		{ pattern = "Cachet de mojo zandalar", effect = "HEAL", value = 18 }, --?
		{ pattern = "Cachet de sérénité zandalar", effect = "HEAL", value = 33 }, 
		
		{ pattern = "Huile de sorcier mineure", effect = "HEAL", value = 8 },
		{ pattern = "Huile de sorcier inférieure", effect = "HEAL", value = 16 },
		{ pattern = "Huile de sorcier", effect = "HEAL", value = 24 },
		{ pattern = "Huile de sorcier brillante", effect = {"HEAL", "SPELLCRIT"}, value = {36, 1} },

		{ pattern = "Huile de mana mineure", effect = "MANAREG", value = 4 },
		{ pattern = "Huile de mana inférieure", effect = "MANAREG", value = 8 },
		{ pattern = "Huile de mana brillante", effect = { "MANAREG", "HEAL"}, value = {12, 25} },	
	-- enchantements de Saphirron
	--	{ pattern = "Healing %+31 and 5 mana per 5 sec%.", effect = { "MANAREG", "HEAL"}, value = {5, 31} },
	--	{ pattern = "Stamina %+16 and Armor %+100", effect = { "STA", "ARMOR"}, value = {16, 100} },
	--	{ pattern = "Attack Power %+26 and %+1%% Critical Strike", effect = { "ATTACKPOWER", "CRIT"}, value = {26, 1} },
	--	{ pattern = "Spell Damage %+15 and %+1%% Spell Critical Strike", effect = { "DMG", "HEAL", "SPELLCRIT"}, value = {15, 15, 1} },
	}
} end)