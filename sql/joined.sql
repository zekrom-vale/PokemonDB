--=REGEXREPLACE(JOIN(", ",A2:A17),"(\w+)","items.$0 ITEM_$0")
create or replace view joined as(
	select pokemon.NAME, pokemon.DEX, species.CLASS, species.DEX_SUFFIX,
		--body.*,
body.BODY BODY_BODY, body.PARENT BODY_PARENT, body.DESCRIPTION BODY_DESCRIPTION, body.ID BODY_ID,
		--items.*,
items.NAME ITEM_NAME, items.GEN ITEM_GEN, items.GEN2 ITEM_GEN2, items.DESCRIPTION ITEM_DESCRIPTION, items.NOTE ITEM_NOTE, items.JAPANESE_KANA ITEM_JAPANESE_KANA, items.JAPANESE_ROMAJI ITEM_JAPANESE_ROMAJI, items.FRENCH ITEM_FRENCH, items.GERMAN ITEM_GERMAN, items.ITALIAN ITEM_ITALIAN, items.SPANISH ITEM_SPANISH, items.KOREAN_HANGUL ITEM_KOREAN_HANGUL, items.KOREAN_ROMANIZED ITEM_KOREAN_ROMANIZED, items.CHINESE_HANZI ITEM_CHINESE_HANZI, items.CHINESE_ROMANIZED ITEM_CHINESE_ROMANIZED, items.STAR ITEM_STAR,
--eggGroups.*,
eggGroups.NAME EGG_GROUP_NAME, eggGroups.TYPE_ALIAS EGG_GROUP_TYPE_ALIAS, eggGroups.URL EGG_GROUP_URL,
--eggGroups2.*,
eggGroups2.NAME EGG_GROUP2_NAME, eggGroups2.TYPE_ALIAS EGG_GROUP2_TYPE_ALIAS, eggGroups2.URL EGG_GROUP2_URL,
--types.*,
types.TYPE TYPE_TYPE, types.DESCRIPTION TYPE_DESCRIPTION, types.ATK_SE TYPE_ATK_SE, types.ATK_NVE TYPE_ATK_NVE, types.ATK_NE TYPE_ATK_NE, types.DEF_SE TYPE_DEF_SE, types.DEF_NVE TYPE_DEF_NVE, types.DEF_NE TYPE_DEF_NE, types.URL TYPE_URL,
--types2.*,
types2.TYPE TYPE2_TYPE, types2.DESCRIPTION TYPE2_DESCRIPTION, types2.ATK_SE TYPE2_ATK_SE, types2.ATK_NVE TYPE2_ATK_NVE, types2.ATK_NE TYPE2_ATK_NE, types2.DEF_SE TYPE2_DEF_SE, types2.DEF_NVE TYPE2_DEF_NVE, types2.DEF_NE TYPE2_DEF_NE, types2.URL TYPE2_URL,
		--gender_ratio.*,
gender_ratio.KEY GENDER_RATIO_KEY, gender_ratio.MALE GENDER_RATIO_MALE, gender_ratio.FEMALE GENDER_RATIO_FEMALE, gender_ratio.UNBREEDABLE GENDER_RATIO_UNBREEDABLE,
--ability.*,
ability.ID ABILITY_ID, ability.NAME ABILITY_NAME, ability.EFFECT ABILITY_EFFECT, ability.GENERATION ABILITY_GENERATION, ability.SINGLE ABILITY_SINGLE, ability.DUAL ABILITY_DUAL, ability.HIDDEN ABILITY_HIDDEN, ability.JAPANESE_KANA ABILITY_JAPANESE_KANA, ability.JAPANESE_ROMAJI ABILITY_JAPANESE_ROMAJI, ability.FRENCH ABILITY_FRENCH, ability.GERMAN ABILITY_GERMAN, ability.ITALIAN ABILITY_ITALIAN, ability.SPANISH ABILITY_SPANISH, ability.KOREAN_HANGUL ABILITY_KOREAN_HANGUL, ability.KOREAN_ROMANIZED ABILITY_KOREAN_ROMANIZED, ability.CHINESE_HANZI ABILITY_CHINESE_HANZI, ability.CHINESE_ROMANIZED ABILITY_CHINESE_ROMANIZED,
--ability2.*,
ability2.ID ABILITY2_ID, ability2.NAME ABILITY2_NAME, ability2.EFFECT ABILITY2_EFFECT, ability2.GENERATION ABILITY2_GENERATION, ability2.SINGLE ABILITY2_SINGLE, ability2.DUAL ABILITY2_DUAL, ability2.HIDDEN ABILITY2_HIDDEN, ability2.JAPANESE_KANA ABILITY2_JAPANESE_KANA, ability2.JAPANESE_ROMAJI ABILITY2_JAPANESE_ROMAJI, ability2.FRENCH ABILITY2_FRENCH, ability2.GERMAN ABILITY2_GERMAN, ability2.ITALIAN ABILITY2_ITALIAN, ability2.SPANISH ABILITY2_SPANISH, ability2.KOREAN_HANGUL ABILITY2_KOREAN_HANGUL, ability2.KOREAN_ROMANIZED ABILITY2_KOREAN_ROMANIZED, ability2.CHINESE_HANZI ABILITY2_CHINESE_HANZI, ability2.CHINESE_ROMANIZED ABILITY2_CHINESE_ROMANIZED,
--hidden_ability.*,
hidden_ability.ID HIDDEN_ABILITY_ID, hidden_ability.NAME HIDDEN_ABILITY_NAME, hidden_ability.EFFECT HIDDEN_ABILITY_EFFECT, hidden_ability.GENERATION HIDDEN_ABILITY_GENERATION, hidden_ability.SINGLE HIDDEN_ABILITY_SINGLE, hidden_ability.DUAL HIDDEN_ABILITY_DUAL, hidden_ability.HIDDEN HIDDEN_ABILITY_HIDDEN, hidden_ability.JAPANESE_KANA HIDDEN_ABILITY_JAPANESE_KANA, hidden_ability.JAPANESE_ROMAJI HIDDEN_ABILITY_JAPANESE_ROMAJI, hidden_ability.FRENCH HIDDEN_ABILITY_FRENCH, hidden_ability.GERMAN HIDDEN_ABILITY_GERMAN, hidden_ability.ITALIAN HIDDEN_ABILITY_ITALIAN, hidden_ability.SPANISH HIDDEN_ABILITY_SPANISH, hidden_ability.KOREAN_HANGUL HIDDEN_ABILITY_KOREAN_HANGUL, hidden_ability.KOREAN_ROMANIZED HIDDEN_ABILITY_KOREAN_ROMANIZED, hidden_ability.CHINESE_HANZI HIDDEN_ABILITY_CHINESE_HANZI, hidden_ability.CHINESE_ROMANIZED HIDDEN_ABILITY_CHINESE_ROMANIZED,
		pokemon.PAGE, pokemon.HABITAT, pokemon.LDEX, pokemon.LDEX_SUFFIX,
--generation.*
generation.GEN GENERATION_GEN, generation.REGION GENERATION_REGION, generation.DEX_MIN GENERATION_DEX_MIN, generation.DEX_MAX GENERATION_DEX_MAX, generation.LDEX_MIN GENERATION_LDEX_MIN, generation.LDEX_MAX GENERATION_LDEX_MAX
	from
	species inner join pokemon
		on species.DEX=pokemon.DEX
	left join eggGroups
		on species.EGGGROUP1=eggGroups.NAME
	left join eggGroups eggGroups2
		on species.EGGGROUP2=eggGroups2.NAME
	left join types
		on species.TYPE=types.TYPE
	left join types types2
		on species.TYPE2=types2.TYPE
	left join 
		on species.BODY=body.BODY
	inner join gender_ratio
		on species.GENDER_RATIO=gender_ratio.key
	inner join ability
		on species.ABILITY1=ability.NAME
	left join ability ability2
		on species.ABILITY2=ability.NAME
	left join ability hidden_ability
		on species.HIDDEN_ABILITY=ability.NAME
	inner join generation
		on pokemon.GEN=generation.GEN
	left join items
		on species.ITEM=items.NAME
);
