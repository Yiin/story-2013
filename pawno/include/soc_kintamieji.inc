#define npc_pos_med1 ,	 // npc med 1
#define npc_pos_med2 ,	 // npc med 2 priimamasis
#define npc_pos_med3 ,	 // npc med 3
#define npc_pos_med4 ,	 // npc med 4
#define npc_pos_med5 	 // npc med 5 sekretorius
#define npc_pos_med6 ,	 // npc med 6 moko
#define npc_pos_mech_tune 100.8413,-130.6911,2367.2290,278.9739	 // npc mech tune
#define npc_pos_mech_sekr 107.9402,-138.6255,2367.2280,94.1657	 // npc mech sekretor
#define npc_pos_pd_ammo 620.4341,-579.0829,3000.3079,250.6197	 // ginklai

enum e_hInfo
{
	hModelis,
	Float:hX,
	Float:hY,
	Float:hZ
};
/*
new const hInfo[][e_hInfo] = 
{
	{14701, -1.125, -10.283, -2.06995},
	{15041, -9.42798, 4.881, -2.00708},
	{15031, 2.23694, -4.90399, 0.0},
	{14718, 2.24597, -4.904, -0.00305176},
	{14712, 2.20496, -7.553, -1.54199},
	{14713, 4.39502, -4.959, -1.80493},
	{14714, -0.771973, -8.093, -1.80505}
};
*/

new Routes[MP][MAX_DOTS];

enum _:talpa
{
	ITEM::gps = 1,
	ITEM::radija,
	ITEM::raktai_d,
	ITEM::raktai_mech_car,
	ITEM::raktai_m,
	ITEM::raktai_v,
	ITEM::cigaretes,
	ITEM::raktai_kma,
	ITEM::meskere,
	ITEM::sliekai,
	ITEM::armour,
	ITEM::viskis,
	ITEM::alus,
	ITEM::degtine,
	ITEM::pinigai,
	ITEM::kastetas,
	ITEM::lazda1,
	ITEM::lazda2,
	ITEM::lazda3,
	ITEM::lazda4,
	ITEM::kastuvas,
	ITEM::peilis,
	ITEM::katana,
	ITEM::pjuklas,
	ITEM::ninemm,
	ITEM::tazeris,
	ITEM::deagle,
	ITEM::shotgun,
	ITEM::sawnoff,
	ITEM::combat,
	ITEM::uzi,
	ITEM::mp5,
	ITEM::ak,
	ITEM::m4,
	ITEM::tec,
	ITEM::rifle,
	ITEM::awp,
	ITEM::molotov,
	ITEM::granata,
	ITEM::gas,
	ITEM::remotebomb,
	ITEM::flamegun,
	ITEM::minigun,
	ITEM::rocket,
	ITEM::trocket,
	ITEM::spraycan,
	ITEM::camera,
	ITEM::gesintuvas,
	ITEM::parasiutas,
	ITEM::takiniai,
	ITEM::nvakiniai,
	ITEM::jetpack,
	ITEM::detonatorius,
	ITEM::lazda,
	ITEM::geles,
	ITEM::dildo1,
	ITEM::dildo2,
	ITEM::vibro1,
	ITEM::vibro2,
	ITEM::telefonas,
	ITEM::racija,
	ITEM::kulkosp,
	ITEM::kulkoss,
	ITEM::kulkossm,
	ITEM::kulkosr,
	ITEM::kulkosa,
	ITEM::kulkosb,
	ITEM::degalu_bakelis,
	ITEM::zuvis_eserys,
	ITEM::zuvis_karpis,
	ITEM::zuvis_lydeka, 
	ITEM::zuvis_karosas,
	ITEM::zuvis_tunas,
	ITEM::zuvis_lasisa,
	ITEM::zuvis_pleksne,
	ITEM::zuvis_menke,
	ITEM::zuvis_raude,
	ITEM::zuvis_skumbre,
	ITEM::zuvis_starkis,
	ITEM::zuvis_samas,
	ITEM::zuvis_ungurys,
	ITEM::zuvis_upetakis,
	ITEM::maistas_eserys,
	ITEM::maistas_karpis,
	ITEM::maistas_lydeka,
	ITEM::maistas_karosas,
	ITEM::maistas_tunas,
	ITEM::maistas_lasisa,
	ITEM::maistas_pleksne, 
	ITEM::maistas_menke,
	ITEM::maistas_raude,
	ITEM::maistas_skumbre,
	ITEM::maistas_starkis,
	ITEM::maistas_samas,
	ITEM::maistas_ungurys,
	ITEM::maistas_upetakis,
	ITEM::maistas_ikrai,
	ITEM::maistas_duona,
	ITEM::maistas_obuolys,
	ITEM::raktai_pd_car,
	ITEM::raktai_med_car,
	ITEM::raktai_taxi_car,
	ITEM::raktai_fire_car,
	ITEM::tvarstis,
	ITEM::nuskausminamieji,
	ITEM::elektro_sokas,
	ITEM::irankiu_deze,
	ITEM::antrankiai,
	ITEM::b1,
	ITEM::b2,
	ITEM::b3,
	ITEM::b4,
	ITEM::b5,
	ITEM::b6,
	ITEM::b7,
	ITEM::b8,
	ITEM::b9,
	ITEM::b10,
	ITEM::b11,
	ITEM::b12,
	ITEM::b13,
	ITEM::b14,
	ITEM::b15,
	ITEM::raktai_pd_vartai,
	ITEM::raktai_wash_car,
	ITEM::cap1,
	ITEM::cap2,
	ITEM::cap3,
	ITEM::cap4,
	ITEM::cap5,
	ITEM::cap6,
	ITEM::cap7,
	ITEM::cap8,
	ITEM::cap9,
	ITEM::akiniai1,
	ITEM::akiniai2,
	ITEM::akiniai3,
	ITEM::akiniai4,
	ITEM::akiniai5,
	ITEM::akiniai6,
	ITEM::akiniai7,
	ITEM::akiniai8,
	ITEM::akiniai9,
	ITEM::akiniai10,
	ITEM::akiniai11,
	ITEM::akiniai12,
	ITEM::akiniai13,
	ITEM::akiniai14,
	ITEM::akiniai15,
	ITEM::akiniai16,
	ITEM::akiniai17,
	ITEM::akiniai18,
	ITEM::akiniai19,
	ITEM::akiniai20,
	ITEM::akiniai21,
	ITEM::akiniai22,
	ITEM::akiniai23,
	ITEM::akiniai24,
	ITEM::akiniai25,
	ITEM::akiniai26,
	ITEM::akiniai27,
	ITEM::akiniai28,
	ITEM::akiniai29,
	ITEM::akiniai30,
	ITEM::akiniai31,
	ITEM::akiniai32,
	ITEM::akiniai33,
	ITEM::beret1,
	ITEM::beret2,
	ITEM::beret3,
	ITEM::beret4,
	ITEM::malka,
	ITEM::raktai_fura,
	ITEM::raktai_krov,
	ITEM::cola,
	ITEM::pepsi,
	ITEM::sprite,
	ITEM::zemelapis,
	ITEM::Nafta,
	ITEM::Guma,
	ITEM::Plienas,
	ITEM::Ratlankis,
	ITEM::Padanga,
	ITEM::Ratas,
	ITEM::Duslintuvas,
	ITEM::valas,
	ITEM::Meskere_be_valo
};

enum _:eBonus {

	ibPlus,
	ibHp,
	ibCritical,

	ibFistDmgGive,
	ibHandGunGive,
	ibPistolDmgGive,
	ibShotgunDmgGive,
	ibSmgDmgGive,
	ibRifleDmgGive,
	ibAwpDmgGive,
	ibBadGunsDmgGive,

	ibFistDmgTake,
	ibHandGunTake,
	ibPistolDmgTake,
	ibShotgunDmgTake,
	ibSmgDmgTake,
	ibRifleDmgTake,
	ibAwpDmgTake,
	ibBadGunsDmgTake,
	
	ibEnergy,
	ibJump,
	ibFireDmg,
	ibExp,
	ibGangInfluence,
	ibSuccessRate,
	ibCraftingSuccessRate
};


/*
enum flag_bonus:(<<= 1) {

	DMG_2 = 1,
	DMG_5,
	DMG_10,
	DMG_15,
	HP_50,
	HP_100,
	HP_200,
	HP_350,
	CRITICAL_2,
	CRITICAL_5,
	CRITICAL_10,
	GET_DAMAGE_5,
	GET_DAMAGE_10
};
*/
enum flag_item:(<<= 1) {

	IS_INUSE = 1,
	IS_SELECTED
};

enum e_bag
{
	item,
	kiekis,
	effect[eBonus],
	//flag_bonus:item_flag,
	flag_item:item_info
};

new Bag[MP][MAX_ITEM][e_bag];

enum flag_params:(<<= 1) {

 IS_WEAPON = 1,
 IS_USABLE,
 IS_A_KEY,
 IS_AMMO,
 IS_FOOD,
 IS_PISTOL,
 IS_SHOTGUN,
 IS_SMG,
 IS_RIFLE,
 IS_AWP,
 IS_BADGUN,
 IS_ONEHANDED,
 IS_CLOTHE,
 IS_DRUG,
 IS_OTHER,
 IS_FURNITURE,
 IS_MEDICAMENT
};

enum E_ItemInfo
{
	item_name[32],
	item_kaina,
	item_svoris,
	flag_params:item_params,
	item_about[128]
};

new const ItemInfo[][E_ItemInfo] =
{
	{"pikaciu",1000000,0,flag_params:                  0b00000000000000000,"elektrinis pokemonas."},
	{"GPS",180,300,flag_params:                        0b00100000000000010,"Navigacine sistema skirta padeti keliones tiksla pasiekti kuo greiciau ir saugiau."},
	{"Radija",80,1400,flag_params:                     0b00100000000000000,"Komunikacinis prietaisas skirtas bendrauti per atstuma."},
	{"Darbo raktai",0,10,flag_params:                  0b00000000000000000,"Raktai nuo darbo."},
	{"Mechaniku masinos raktai",0,10,flag_params:      0b00000000000000100,"Raktai nuo mechaniku masinos."},
	{"Masinos raktai",0,10,flag_params:                0b00000000000000100,"Asmenines masinos raktai."}, 
	{"Verslo raktai",0,10,flag_params:                 0b00000000000000100,"nera informacijos"}, 
	{"Cigaretes",9,5,flag_params:                      0b00010000000000010,"Rukimas kenkia jums ir aplinkiniams."},  
	{"KMA raktai",0,10,flag_params:                    0b00000000000000010,"Raktai nuo konfiskuotu masinu aiksteles vartu."}, 
	{"Meskere",200,900,flag_params:                    0b00000100000000010,"Meskere yra skirta zvejoti zuvis."},
	{"Sliekai",2,2,flag_params:                        0b00100000000000000,"Bjaurus padarai. Naudojami kaip masalas zuvims."},
	{"Nepersaunama liemene",500,4000,flag_params:      0b00001000000000010,"Liemene apsauganti nuo suviu i krutines sriti."},
	{"Viskis",70,700,flag_params:                      0b00010000000000010,"Neaiskios gamybos viskis.."}, 
	{"Alus",5, 2000,flag_params:                       0b00010000000000010,"A beer."}, 
	{"Degtine",35,1000,flag_params:                    0b00010000000000010,"Lithuanian vodka."},
	{"Deimantas",0, 0,flag_params:                     0b00100000000000000,"Pagrindine zaidimo valiuta."}, 
	{"Kastetas",60, 100,flag_params:                   0b00000000000000011,"Kastetas yra metalinis ir gali sukelti daug zalos priesininkui."},
	{"Beisbolo lazda",70,1000,flag_params:             0b00000100000000001,"nera informacijos"},
	{"Policijos lazda",0,500,flag_params:              0b00000100000000011,"nera informacijos"},
	{"Bilijardo lazda",0,200,flag_params:              0b00000100000000011,"nera informacijos"},
	{"Golfo lazda",50,500,flag_params:                 0b00000100000000011,"nera informacijos"},
	{"Kastuvas",30,1200,flag_params:                   0b00000100000000011,"nera informacijos"},
	{"Peilis",25,300,flag_params:                      0b00000100000000011,"nera informacijos"},
	{"Katana",500,800,flag_params:                     0b00000100000000011,"nera informacijos"},
	{"Bezininis pjuklas",500,5000,flag_params:         0b00000000000000010,"nera informacijos"},
	{"9mm",1600,1000,flag_params:                      0b00000100000100011,"nera informacijos"}, // 9mm
	{"Tazeris",0,300,flag_params:                      0b00000100000100011,"nera informacijos"},
	{"Deagle",1300,1800,flag_params:                   0b00000100000100011,"nera informacijos"},
	{"Shotgun",3400,3000,flag_params:                  0b00000000001000011,"nera informacijos"}, // Tec-9
	{"Sawnoff shotgun",6000,2500,flag_params:          0b00000000001000011,"nera informacijos"},
	{"Combat shotgun",10000,7000,flag_params:          0b00000000000000011,"nera informacijos"},
	{"Uzi",3500,2100,flag_params:                      0b00000000010000011,"nera informacijos"},
	{"MP5",3800,2800,flag_params:                      0b00000000010000011,"nera informacijos"},
	{"ak47",5000,4000,flag_params:                     0b00000000100000011,"nera informacijos"},
	{"m4",4000,4000,flag_params:                       0b00000000100000011,"nera informacijos"},
	{"tec-9",3200,3500,flag_params:                    0b00000000010000011,"nera informacijos"},
	{"rifle",5000,6000,flag_params:                    0b00000000100000011,"nera informacijos"},
	{"awp",8000,10000,flag_params:                     0b00000001000000011,"nera informacijos"},
	{"molotovo kokteilis",0,0,flag_params:             0b00000110000000011,"nera informacijos"},
	{"granata",0,1000,flag_params:                     0b00000110000000011,"nera informacijos"},
	{"asarines dujos",0,800,flag_params:               0b00000100000000011,"nera informacijos"},
	{"nuotolines bombos",0,5000,flag_params:           0b00000110000000011,"nera informacijos"},
	{"ugniasvaidis",0,25000,flag_params:               0b00000010000000011,"nera informacijos"},
	{"minigun",0,50000,flag_params:                    0b00000010000000011,"nera informacijos"},
	{"raketsvaidis",0,30000,flag_params:               0b00000010000000011,"nera informacijos"},
	{"termo-raketsvaidis",0,35000,flag_params:         0b00000010000000011,"nera informacijos"},
	{"flakonelis",60,500,flag_params:                  0b00000100000000010,"nera informacijos"},
	{"fotoparatas",100,300,flag_params:                0b00000100000000011,"nera informacijos"},
	{"gesintuvas",7000,7000,flag_params:               0b00000100000000011,"nera informacijos"},
	{"parasiutas",0,800,flag_params:                   0b00000000000000010,"nera informacijos"},
	{"termo-akiniai",120,250,flag_params:              0b00000100000000011,"nera informacijos"},
	{"naktinio matymo akiniai",0,400,flag_params:      0b00000100000000011,"nera informacijos"},
	{"jetpack",100000,10000,flag_params:               0b00000010000000011,"nera informacijos"},
	{"Nuot. bombø detonatorius",0,250,flag_params:     0b00000110000000011,"nera informacijos"},
	{"Lazda",20,200,flag_params:                       0b00000100000000011,"nera informacijos"},
	{"Geles",5,10,flag_params:                         0b00000100000000011,"nera informacijos"},
	{"Dildo-1",500,300,flag_params:                    0b00000100000000011,"nera informacijos"},
	{"Dildo-2",500,300,flag_params:                    0b00000100000000011,"nera informacijos"},
	{"Vibratorius-1",100,650,flag_params:              0b00000100000000011,"nera informacijos"},
	{"Vibratorius-2",100,650,flag_params:              0b00000100000000011,"nera informacijos"},
	{"Telefonas",400,150,flag_params:                  0b00100000000000000,"nera informacijos"},
	{"Racija",0,450,flag_params:                       0b00100000000000000,"nera informacijos"},
	{"Kulkos (pistol)",10,1,flag_params:               0b00000000000001000,"nera informacijos"},
	{"Kulkos (shotgun)",20,5,flag_params:              0b00000000000001000,"nera informacijos"},
	{"Kulkos (smg)",15,2,flag_params:                  0b00000000000001000,"nera informacijos"},
	{"Kulkos (rifle)",25,3,flag_params:                0b00000000000001000,"nera informacijos"},
	{"Kulkos (awp)",75,10,flag_params:                 0b00000000000001000,"nera informacijos"},
	{"Kulkos (big gunz)",200,20,flag_params:           0b00000000000001000,"nera informacijos"},
	{"Degalu kanistras",80,20000,flag_params:          0b00100000000000000,"nera informacijos"},
	{"Eserys",14,500,flag_params:                      0b00000000000000000,"nera informacijos"},// maistas
	{"Karpis",14,700,flag_params:                      0b00000000000000000,"nera informacijos"},
	{"Lydeka",50,2500,flag_params:                     0b00000000000000000,"nera informacijos"},
	{"Karosas",18,800,flag_params:                     0b00000000000000000,"nera informacijos"},
	{"Tunas",6,100,flag_params:                        0b00000000000000000,"nera informacijos"},
	{"Lasisa",20,850,flag_params:                      0b00000000000000000,"nera informacijos"},
	{"Pleksne",8,250,flag_params:                      0b00000000000000000,"nera informacijos"},
	{"Menke",36,1500,flag_params:                      0b00000000000000000,"nera informacijos"},
	{"Raude",10,400,flag_params:                       0b00000000000000000,"nera informacijos"},
	{"Skumbre",16,500,flag_params:                     0b00000000000000000,"nera informacijos"},
	{"Starkis",24,950,flag_params:                     0b00000000000000000,"nera informacijos"},
	{"Samas",30,2000,flag_params:                      0b00000000000000000,"nera informacijos"},
	{"Ungurys",60,3500,flag_params:                    0b00000000000000000,"nera informacijos"},
	{"Upetakis",40,2000,flag_params:                   0b00000000000000000,"nera informacijos"},
	{"(maistas) ikrai",50,100,flag_params:             0b00000000000010010,"nera informacijos"}, 
	{"(maistas) duona",2,200,flag_params:              0b00000000000010010,"nera informacijos"},
	{"(maistas) obuolys",1,50,flag_params:             0b00000000000010010,"nera informacijos"},
	{"(maistas) eserys",7,1000,flag_params:            0b00000000000010010,"nera informacijos"},// zuvys
	{"(maistas) karpis",7,1400,flag_params:            0b00000000000010010,"nera informacijos"},
	{"(maistas) lydeka",25,5000,flag_params:           0b00000000000010010,"nera informacijos"},
	{"(maistas) karosas",9,1600,flag_params:           0b00000000000010010,"nera informacijos"},
	{"(maistas) tunas",3,200,flag_params:              0b00000000000010010,"nera informacijos"},
	{"(maistas) lasisa",10,1700,flag_params:           0b00000000000010010,"nera informacijos"},
	{"(maistas) pleksne",4,500,flag_params:            0b00000000000010010,"nera informacijos"},
	{"(maistas) menke",18,3000,flag_params:            0b00000000000010010,"nera informacijos"},
	{"(maistas) raude",5,800,flag_params:              0b00000000000010010,"nera informacijos"},
	{"(maistas) skumbre",8,1000,flag_params:           0b00000000000010010,"nera informacijos"},
	{"(maistas) starkis",12,2900,flag_params:          0b00000000000010010,"nera informacijos"},
	{"(maistas) samas",15,4000,flag_params:            0b00000000000010010,"nera informacijos"},
	{"(maistas) ungurys",30,7000,flag_params:          0b00000000000010010,"nera informacijos"},
	{"(maistas) upetakis",20,4000,flag_params:         0b00000000000010010,"nera informacijos"},
	{"Policijos masinos raktai",0,10,flag_params:      0b00000000000000100,"nera informacijos"},
	{"Mediku masinos raktai",0,10,flag_params:         0b00000000000000100,"nera informacijos"},
	{"Taksi masinos raktai",0,10,flag_params:          0b00000000000000100,"nera informacijos"},
	{"Gaisrines masinos raktai",0,10,flag_params:      0b00000000000000100,"nera informacijos"},
	{"Tvarstis", 9, 60,flag_params:                    0b10000000000000010,"nera informacijos"},
	{"Nuskausminamieji", 20, 50,flag_params:           0b10000000000000010,"nera informacijos"},
	{"Elektrosokas", 800, 4000,flag_params:            0b00100000000000010,"nera informacijos"},
	{"Irankiu deze", 120, 4000,flag_params:            0b00100000000000000,"nera informacijos"},
	{"Antrankiai", 200, 600,flag_params:               0b00100000000000000,"nera informacijos"},
	{"Melyna skraiste", 20, 100,flag_params:           0b00001000000000010,"nera informacijos"},
	{"Raudona skraiste", 20, 100,flag_params:          0b00001000000000010,"nera informacijos"},
	{"Raudona/balta skraiste", 20, 100,flag_params:    0b00001000000000010,"nera informacijos"},
	{"Morkine skraiste", 20, 100,flag_params:          0b00001000000000010,"nera informacijos"},
	{"Juoda 'skull' skraiste", 20, 100,flag_params:    0b00001000000000010,"nera informacijos"},
	{"Juoda skraiste", 20, 100,flag_params:            0b00001000000000010,"nera informacijos"},
	{"Melyna 'light' skraiste", 20, 100,flag_params:   0b00001000000000010,"nera informacijos"},
	{"Zalia 'light' skraiste", 20, 100,flag_params:    0b00001000000000010,"nera informacijos"},
	{"Violetine 'light' skraiste", 20, 100,flag_params:0b00001000000000010,"nera informacijos"},
	{"Spalvota skraiste", 20, 100,flag_params:         0b00001000000000010,"nera informacijos"},
	{"'Tiger' skraiste", 20, 100,flag_params:          0b00001000000000010,"nera informacijos"},
	{"Smelio spalvos skraiste", 20, 100,flag_params:   0b00001000000000010,"nera informacijos"},
	{"Deimantine skraiste", 20, 100,flag_params:       0b00001000000000010,"nera informacijos"},
	{"'Energy' skraiste", 20, 100,flag_params:         0b00001000000000010,"nera informacijos"},
	{"Karine skraiste", 20, 100,flag_params:           0b00001000000000010,"nera informacijos"},
	{"Serifo nuovados vartu raktai", 0, 10,flag_params:0b00000000000000100,"nera informacijos"},
	{"Valytoju masinos rakteliai", 0, 10,flag_params:  0b00000000000000100, "nera informacijos"},
	{"Geltona kepure", 100, 20, flag_params:           0b00001000000000010, "Sviesi, geltona kepure."},
	{"Energy kepure", 100, 20, flag_params:            0b00001000000000010, "Juoda kepure su melynais ornamentais"},
	{"kepure", 100, 20, flag_params:                   0b00001000000000010, "kepure"},
	{"kepure", 100, 20, flag_params:                   0b00001000000000010, "kepure"},
	{"kepure", 100, 20, flag_params:                   0b00001000000000010, "kepure"},
	{"kepure", 100, 20, flag_params:                   0b00001000000000010, "kepure"},
	{"kepure", 100, 20, flag_params:                   0b00001000000000010, "kepure"},
	{"kepure", 100, 20, flag_params:                   0b00001000000000010, "kepure"},
	{"kepure", 100, 20, flag_params:                   0b00001000000000010, "kepure"},
	{"akiniai", 100, 30, flag_params:                  0b00001000000000010, "akiniai"},
	{"akiniai", 100, 30, flag_params:                  0b00001000000000010, "akiniai"},
	{"akiniai", 100, 30, flag_params:                  0b00001000000000010, "akiniai"},
	{"akiniai", 100, 30, flag_params:                  0b00001000000000010, "akiniai"},
	{"akiniai", 100, 30, flag_params:                  0b00001000000000010, "akiniai"},
	{"akiniai", 100, 30, flag_params:                  0b00001000000000010, "akiniai"},
	{"akiniai", 100, 30, flag_params:                  0b00001000000000010, "akiniai"},
	{"akiniai", 100, 30, flag_params:                  0b00001000000000010, "akiniai"},
	{"akiniai", 100, 30, flag_params:                  0b00001000000000010, "akiniai"},
	{"akiniai", 100, 30, flag_params:                  0b00001000000000010, "akiniai"},
	{"akiniai", 100, 30, flag_params:                  0b00001000000000010, "akiniai"},
	{"akiniai", 100, 30, flag_params:                  0b00001000000000010, "akiniai"},
	{"akiniai", 100, 30, flag_params:                  0b00001000000000010, "akiniai"},
	{"akiniai", 100, 30, flag_params:                  0b00001000000000010, "akiniai"},
	{"akiniai", 100, 30, flag_params:                  0b00001000000000010, "akiniai"},
	{"akiniai", 100, 30, flag_params:                  0b00001000000000010, "akiniai"},
	{"akiniai", 100, 30, flag_params:                  0b00001000000000010, "akiniai"},
	{"akiniai", 100, 30, flag_params:                  0b00001000000000010, "akiniai"},
	{"akiniai", 100, 30, flag_params:                  0b00001000000000010, "akiniai"},
	{"akiniai", 100, 30, flag_params:                  0b00001000000000010, "akiniai"},
	{"akiniai", 100, 30, flag_params:                  0b00001000000000010, "akiniai"},
	{"akiniai", 100, 30, flag_params:                  0b00001000000000010, "akiniai"},
	{"akiniai", 100, 30, flag_params:                  0b00001000000000010, "akiniai"},
	{"akiniai", 100, 30, flag_params:                  0b00001000000000010, "akiniai"},
	{"akiniai", 100, 30, flag_params:                  0b00001000000000010, "akiniai"},
	{"akiniai", 100, 30, flag_params:                  0b00001000000000010, "akiniai"},
	{"akiniai", 100, 30, flag_params:                  0b00001000000000010, "akiniai"},
	{"akiniai", 100, 30, flag_params:                  0b00001000000000010, "akiniai"},
	{"akiniai", 100, 30, flag_params:                  0b00001000000000010, "akiniai"},
	{"akiniai", 100, 30, flag_params:                  0b00001000000000010, "akiniai"},
	{"akiniai", 100, 30, flag_params:                  0b00001000000000010, "akiniai"},
	{"akiniai", 100, 30, flag_params:                  0b00001000000000010, "akiniai"},
	{"akiniai", 100, 30, flag_params:                  0b00001000000000010, "akiniai"},
	{"berete", 100, 40, flag_params:                   0b00001000000000010, "berete"},
	{"berete", 100, 40, flag_params:                   0b00001000000000010, "berete"},
	{"berete", 100, 40, flag_params:                   0b00001000000000010, "berete"},
	{"berete", 100, 40, flag_params:                   0b00001000000000010, "berete"},
	{"malka", 700, 20, flag_params:                    0b00100000000000000, "Nukirsto medzio malka."},
	{"furos rakteliai", 0, 10, flag_params:            0b00000000000000100, "Raktai nuo furos."},
	{"Krovininio aut. rakteliai", 0, 10, flag_params:  0b00000000000000100, "Raktai nuo krovininio automobilio."},
	{"Kolos skardine", 5, 200, flag_params:            0b00000000000010010, "Kola, saldus gaivusis gerimas."},
	{"Pepsi skardine", 5, 200, flag_params:            0b00000000000010010, "Pepsi, saldus gaivusis gerimas."},
	{"Sprite skardine", 5, 200, flag_params:           0b00000000000010010, "Gaivusis gerimas."},
	{"Zemelapis", 20, 100, flag_params:                0b00100000000000010, "Zemelapis, kuriame suzymetos svarbiausios vietos."},
	{"Energetinis gerimas", 10, 350, flag_params:		0b00000000000010010, "Gerimas, suteikiantis trumpalaiki energijos antpludi."},
	{"Nafta (medziaga)", 20, 1000, flag_params:			0b00000000000000000, "Medziaga skirta gaminti gumai."},
	{"Guma (medziaga)", 0, 0, flag_params:					0b00000000000000000, "Medziaga skirta gaminti padangoms."},
	{"Plienas (medziaga)", 0, 0, flag_params:				0b00000000000000000, "Medziaga skirta gaminti masinos dalims, kulkoms, ginklams."},
	{"Ratlankis (dalis)", 0, 0, flag_params:				0b00000000000000000, "Skirtas gaminti masinos ratams."},
	{"Padanga (dalis)", 0, 0, flag_params:					0b00000000000000000, "Skirta gaminti masinos ratams."},
	{"Ratas (dalis)", 0,0,flag_params:						0b00000000000000000, "Masinos dalis reikalinga masinos gamyboje."},
	{"Duslintuvas (dalis)", 0,0,flag_params:				0b00000000000000000, "Skirtas uzdeti ant pistoleto."},
	{"Valas (dalis)", 0,0,flag_params:						0b00000000000000000, "Skirtas sukonstruoti meskere."},
	{"Meskere (dalis)", 0,0,flag_params:					0b00000000000000000, "Skirtas sukonstruoti meskere."}
};
new AreaName[][] = 
{
	{"Mechanikai - Masinu taisykla (~y~CTRL~w~)"},
	{"Mechanikai - Tune (~y~CTRL~w~)"},
	{"Garazas - (~y~CTRL~w~)"},
	{"Mechanikai - Technikine apziura (~y~CTRL~w~"}
};

enum eGarazas
{
	eRepairVehicle,
	eTuneVehicle,
	ePeopleCount
};
new aGarazas[eGarazas];

new animlib[32], animname[32];

enum bagedit
{
	row1,row2,row3,row4,row5,
	row6,row7,row8,row9,row10,
	row11,row12,row13,

	trow1,trow2,trow3,trow4,
	trow5,trow6,trow7,trow8,
	trow9,trow10,trow11,trow12,

					pageid,
					tbagpageid,
					ttrunkpageid,
					tshoppageid,
					itemfsk,
					selected_slot,
	PlayerText:		selecteditem,
	PlayerText:		last_clicked_textdraw_row, 
	bool:			isintrunk,
	bool:			isinshop,
					trunk_id,
					shops:shop_id
};
new BagUse[MP][bagedit];

new cSlots[MP][6][e_bag];

enum
{
	status_pavadinimas,
	status_title,
	status_page,
	status_image,
	status_bukle,
	status_greitis,
	status_svoris,
	status_bagazine,
	Text:status_line = 13
};

enum shops
{
	shop_spawn,
	shop_baras,
	shop_gunshop,
	shop_foodstore,
	shop_clothes,
	shop_dealer
};

new shop[shops][MAX_ITEM][e_bag];

enum
{
	cBag,
	cTrunk,
	cShop,
	cWoodcutting,
	cTvarko,
	cFishing,
	cFuel,
	cUseItem,
	cCritical,
	cClickOnPlayer,
	cTvarkoGaraze
};

/*
enum _:e_vGang
{
	g_kill_count,
	g_wins,
	g_losses
};
*/
enum E_GAUJA
{
	g_ID,
	g_name[24],
	g_joinTime,
	g_joined,
	g_rep_diff,
};

enum
{
	TIP_ZVEJYBA,
	TIP_NPC_TALK,
	TIP_KUPRINE_OPEN,
	TIP_USE_ITEM,
	TIP_USE_ENGINE,
	TIP_FAST_USE_ITEM
}

enum e_tip_list
{
	tip_name[32],
	tip_data[256]
};

new const tip_list[][e_tip_list] = {

	{"Zvejyba", "Noredamas ~y~/zvejoti~w~ privalai tureti meskere bei masalo. Zvejojant, kai zuvis pradeda kibti, spaudinek ~y~SPACE~w~ mygtuka kol zuvi istrauksi."},
	{"Kalbejimas su ~y~NPC", "Noredamas kalbeti su npc, i ji nusitaikes (be ginklu) spausk ~y~ALT~w~ mygtuka, arba spausk peles ratuka, ir ~y~kairiji~w~ klavisa ant NPC."},
	{"Kuprines atsidarymas", "Noredamas atsidaryti kuprine ir perziureti jos turini, spausk ~y~K~w~ raide."},
	{"Daikto naudojimas", "Noredamas naudoti daikta, ~y~spausk~w~ greitai ~y~ant jo 2 kartus~w~, arba paspausk viena, ir spausk mygtuka ~y~naudoti~w~."},
	{"Variklio uzvedimas", "Jeigu nori uzvesti masina, spausk ir laikyk ~y~SHIFT~w~ mygtuka, kol masina uzsives."},
	{"Daikto naudojimas", "Jeigu nori greitai panaudoti, nusipirkti, parduoti, padeti arba paimti daikta, kuprines begazines arba parduotuves meniu greitai paspausk ant norimo daikto 2 kartus."}

};

enum e_tut_quest_list
{
	quest_head[128],
	quest_body[256]
};

new const tut_quest_list[][e_tut_quest_list] = {

	{"Pirmoji uzduotis", "Gidas patare tau nusipirkti zemelapi. Surask salia stoties esanti kioskeli."},
	{"Patarimu meniu", "Atsimink, noredamas perziureti patarima, spausk ~y~N~w~, kad ijungtum pelyte. Tuomet su pelyte paspausk ant patarimo."},
	{"Puiku !", "Perskaites, uzdaryti patarimo lentele gali paspaudes ~y~SUPRATAU~w~. Nepamirsk, kad visi meniu pasirinkimai yra atliekami su pelyte ~y~N~w~."},
	{"Antroji uzduotis", "Nusitaikes i NPC ir paspaudes ~y~ALT~w~ ~r~arba~w~ paspaudes ~y~peles ratuka~w~ ir ~y~kairiji peles klavisa~w~ ant NPC, nusipirk zemelapi."},
	{"Parduotuve", "Desineje esantis langas yra tavo kuprine, kaireje - parduotuve. 2 kartus greitai paspausk ant norimos prekes."}

};

enum e_reward
{
	rMoney,
	rPatirtis,
	rRubinai,
	rItem,
	rItemCount
};

enum e_quest_list
{
	quest_type,
	quest_head[128],
	quest_body[256],
	quest_reward[e_reward]
};

new const quest_list[][e_quest_list] = {

	{PD, "Istorija apie \"Broli\" Joe", "Joe - visam San Fierro padugniu luomui zinomas narkotiku prekeivis ir zudikas. Jam nerupi zmoniu gyvybes, jam rupi pinigai. Joe paskutini karta matytas stumdantis marichuana traukiniu stotyje. Pagauk sia padugne per nurodyta laika.", {30,10,0,0,0}},
	{PD, "Narkotiku labaratorijos sturmavimas", "Is patikimu saltiniu suzinojome, kur Las Venturas gaujos ~y~Hells angels~w~, uzsiimancios narkotiku gamyba, pagrindine labaratorija. Mes tau parodysim kelia, o visa kita - tavo ranose.", {40, 12, 0,0,0}},
	{PD, "Apieskoti laiva del galimos kontrabandos", "Si ryt buvo pastebetas nepatvirtintas laivas pavadinimu ~y~Natzi~w~. Yra itarimu, kad juo gabenama didele ginklu kontrabanda. Tavo uzduotis - pasiimti kateri ir apieskoti ~y~Natzi~w~. Ji rasi kiek atokiau nuo uosto.", {40, 6,0,0,0}},
	{MEDIKAS, "Patikrinti vaistu kokybe.", "I vaistine atveze, kaip manoma, nekokybisku vaistu, todel prireike kvalifikuoto specialisto pagalbos. Nuvyk iki vaistines ir sesele tau pasakys ka daryti", {20, 3,0,0,0}}
	{NONE, "Parasyk komanda /test_quest.", {555555, 666, 777, 8, 1}}
};

new playerIP[MP][16];

enum (<<= 1)
{
	SURAKINTAS = 1,
	DEGALAI,
	ZVEJOJA,
	MIRSTA,
	TELEPORT,
	PAUSED,
	TVARKO,
	KERTA_MEDI,
	GULI_LIGONINEI,
	TVARKO_GARAZE,
	GARAZAS
};
new pfreeze[MP];

enum e_darbas
{
	darbo_id,
	rangas,
	d_joined,
	d_join_time,
	data1_today,
	data1_week,
	data2_today,
	data2_week,
	time_today,
	time_week,
	darbo_xp[DARBAI]
};

enum player_info
{
	skin,
	interior,
	virtualworld,
	patirtis,
	lytis,
	DBID,
	carid,
	darbas[e_darbas],
	direktorius,
	vadovas,
	gauja[E_GAUJA],
	vip,
	kb,
	rubinai,
	skinid,
	skin_darbo,
	skin_last,
	wanted,
	draugai,
	jail_time,
	wanted_time,
	kills,
	last_kills,
	Float:max_hp,
	death_state,
	current_quest,
	gps_color,
	time_joined,
	darbas_joined,
	repair_fixing,
	bool:quests[sizeof quest_list]
};
new pDB[MP][player_info];

enum playertemp
{
	Text3D:textlabel,
	socket,

	// Valytojai

	wash_start,
	wash_dest,
	wash_start_node,
	wash_dest_node,
	wash_last_node,

	gps_dest_node,
	targetedNPC,

	// Time diff'ai

	jail_time_diff,
	notification_diff,
	notification2_diff,
	Float:taxi_diff,
	taxi_update_diff,
	tip_diff,
	dmg_diff,
	gangzone_diff,
	vehshop_diff,
	hospital_diff,
	garage_diff,

	// Sustok akimirka žavinga

	garage_pause,

	// Login box

	input_pw[40 char],

	kertamas_medis,

	// Blood

	blood,
	blood_count,
	blood_diff,

	// Basketball

	dunk_state,

	// Patarimai (tip'ai)

	tip_head[32],
	tip_body[256],
	tip_id,

	// Ligoninė

	lova,

	// Užduotys

	quest,

	// weps

	current_handgun[e_bag],
	current_wep[e_bag],
	gunzone,

	// p-flags
	peffect[eBonus]

};
#if defined c0

	ApplyAnimation(playerid, "BSKTBALL", "BBALL_DEF_JUMP_SHOT", 4.0, 0, 0, 0, 0, 1000); // random jump shot
	ApplyAnimation(playerid, "BSKTBALL", "BBALL_DEF_LOOP",      4.0, 0, 0, 0, 0, 1000); // def loop
	ApplyAnimation(playerid, "BSKTBALL", "BBALL_DEF_STEPR",     4.0, 0, 1, 1, 0, 1000); // def step right
	ApplyAnimation(playerid, "BSKTBALL", "BBALL_DEF_STEPL",     4.0, 0, 1, 1, 0, 1000); // def step left
	ApplyAnimation(playerid, "BSKTBALL", "BBALL_DNK",           4.0, 0, 1, 1, 0, 1000); // dunk
	ApplyAnimation(playerid, "BSKTBALL", "BBALL_DNK_GLI",       4.0, 0, 0, 0, 0, 0); // dunk start
	ApplyAnimation(playerid, "BSKTBALL", "BBALL_DNK_LND",       4.0, 0, 0, 0, 0, 0); // dunk finish
	ApplyAnimation(playerid, "BSKTBALL", "BBALL_IDLE",          4.0, 0, 0, 0, 0, 0); // idle
	ApplyAnimation(playerid, "BSKTBALL", "BBALL_IDLE2",         4.0, 0, 0, 0, 0, 0); // idle2
	ApplyAnimation(playerid, "BSKTBALL", "BBALL_IDLELOOP",      4.0, 1, 0, 0, 0, 0); // idle loop musineja kamuoli
	ApplyAnimation(playerid, "BSKTBALL", "BBALL_JUMP_CANCEL",   4.0, 1, 0, 0, 0, 0); // jump cancel
	ApplyAnimation(playerid, "BSKTBALL", "BBALL_JUMP_END",      4.0, 1, 0, 0, 0, 0); // jump end
	ApplyAnimation(playerid, "BSKTBALL", "BBALL_JUMP_SHOT",     4.0, 1, 0, 0, 0, 0); // jump shot
	ApplyAnimation(playerid, "BSKTBALL", "BBALL_PICKUP",        4.0, 1, 0, 0, 0, 0); // pickup ball
	ApplyAnimation(playerid, "BSKTBALL", "BBALL_REACT_MISS",    4.0, 1, 0, 0, 0, 0); // react miss
	ApplyAnimation(playerid, "BSKTBALL", "BBALL_REACT_SCORE",   4.0, 1, 0, 0, 0, 0); // react score
	ApplyAnimation(playerid, "BSKTBALL", "BBALL_RUN",           4.0, 1, 0, 0, 0, 0); // bball run
	ApplyAnimation(playerid, "BSKTBALL", "BBALL_WALK",          4.0, 1, 0, 0, 0, 0); // bball walk

#endif

enum e_bball:(<<= 1)
{
	bBall = 1,
	bMeta,
	bSoka,
	bBlokuoja,
	bKaire,
	bDesine,
	bDunk,
	bLeidzias,
	bPickup,
	bMiss,
	bScore,
	bRun,
	bWalk,
	bCancel,
	bIdleBall,
	bIdle1,
	bIdle2
};
new e_bball:bball[MP];

enum
{
	LOGIN,
	DC,
	CLICKON1,
	CLICKON2,
	BAG,
	ZMENU,
	ENGINEON,
	ENGINEOFF,
	LOCKON,
	LOCKOFF,
	FADEIN,
	FADEOUT,
	FREEZEON,
	FREEZEOFF,
	SPD,
	ENGINEBAR,
	FISHINGBAR,
	FISHING_CATCH,
	FISHING_FAILED,
	OBJECT,
	GANGZONE_DESTROY,
	GANGZONE_CREATE,
	MENU, 	/* race */
	UNFLIP, /* race */
	SPRINT_UPDATE,
	CLICKONVEH1,
	CLICKONVEH2,
	RESTORECAM,
	CAM_ON_PED,
	MECH_BAR_START,
	MECH_BAR_FINISH,
	HIDE_RADAR,
	SHOW_RADAR,
	IS_IN_CARSHOP,
	IS_NOT_IN_CARSHOP,
	IS_CAR_IN_WATER,
	KEY_M,
	WOOD_BAR_START,
	WOOD_BAR_FINISH,
	QUESTS_LIST,
	TOGGLE_CONTROLL,
	BASKETBALL_ON,
	BASKETBALL_OFF,
	BALL_THROW
};

enum eControllerAction
{
	FIRE = 0,
	
	NEXT_WEAPON = 2,
	PREVIOUS_WEAPON,
	FORWARDS,
	BACKWARDS,
	LEFT,
	RIGHT,
	ZOOM_IN,
	ZOOM_OUT,
	ENTER_EXIT,
	CHANGE_CAMERA,
	JUMP,
	SPRINT,
	LOOK_BEHIND,
	CROUCH,
	ACTION,
	WALK,
	VEHICLE_FIRE,
	VEHICLE_SECONDARY_FIRE,
	VEHICLE_LEFT,
	VEHICLE_RIGHT,
	STEER_FORWARDS_DOWN,
	STEER_BACK_UP,
	ACCELERATE,
	BRAKE_REVERSE,
	RADIO_NEXT,
	RADIO_PREVIOUS,
	RADIO_USER_TRACK_SKIP,
	HORN,
	SUB_MISSION,
	HANDBRAKE,
	
	VEHICLE_LOOK_LEFT = 0x22,
	VEHICLE_LOOK_RIGHT,
	VEHICLE_LOOK_BEHIND,
	VEHICLE_MOUSE_LOOK,
	SPECIAL_CONTROL_LEFT,
	SPECIAL_CONTROL_RIGHT,
	SPECIAL_CONTROL_DOWN,
	SPECIAL_CONTROL_UP,

	AIM_WEAPON = 0x2D,

	CONVERSATION_YES = 0x2F,
	CONVERSATION_NO,
	GROUP_CONTROL_FORWARDS,
	GROUP_CONTROL_BACK
};

//new bool:gz[MP][512];

new gTag_count;
new pticks[MAX_PLAYERS];
new
	Socket:socket_server;

new pTemp[MP][playertemp];

enum flag_pbools:(<<= 1)
{
	bPrisijunges = 1,
	bUzsiregistravo,
	bKatikPrisijunge,
	bIsInLogin,
	bIsInReg,
	bAfk,
	bPilaDegalus,
	bZvejoja,
	bHandsUp,
	bTaikosiINPC,
	bRenkasiSkina,
	bBagOpen,
	bGpsOpen,
	bPMenuOpen,
	bTrunkOpen,
	bShopOpen,
	bCraftOpen,
	bQuestListOpen,
	bNotification,
	bNotification2,
	bTip,
	bIsInTaxi,
	bTazeris,
	bGPS,
	bWASH,
	bDmg,
	bIsInCarShop,
	bBloodScreen,
	bBasketBall,
	bIsInGarage
};
new
	flag_pbools:pBools[MP];

enum e_location:(<<=1)
{
	lGangZone = 1,
	lForest,
	lWeaponZone
};
new
	e_location:pLocation[MP];

enum flag_player:(<<= 1)
{
	fNaujokas = 1,
	fPirmosTeises,
	fIsInJail,
	fMirsta,
	fSurakintas,
	fFirstCar,
	fFirstFish,
	fFirstItem,
	fFirstBag,
	fFirstNPC,
	fFirstDeath,
	fOnFire
};

new flag_player:pFlags[MP];

new const skins_v[] = {

	2, 3, 6, 7, 14, 15, 19, 20, 21, 22, 23, 24, 25, 29, 36, 37, 60, 66, 67, 98, 101, 119, 170, 180, 184, 185, 186, 188,221, 222, 223, 250,
};
new const skins_m[] = {

	9, 12, 13, 40, 41, 55, 56, 65, 69, 76, 91, 93, 169, 190, 191, 192, 193, 195, 211, 214, 215, 216, 219, 224, 225, 226, 263
};

new const Float:degalines[][3] = {

	{1814.5856,84.2698,34.8510}, 	// degaline 1
	{656.1325,-564.4717,16.0270}, 	// degaline 2
	{258.6501,30.6388,2.1011}, 		// degaline 3
	{148.6751,21.9260,2.2203},	 	// degaline 4
	{1383.4960,461.3136,19.7666},	// degaline 5
	{2425.7627,119.1733,26.1436},
	{2435.5598,119.3596,26.1431},
	{2436.0676,126.5655,26.1447},
	{2427.3254,126.8447,26.1450},
	{2426.4299,110.8382,26.1432},
	{2433.4382,110.6038,26.1440}

};

new fire[500][5];
//new fire;
new fire_count = 0;

new	// Áspëjimai
	trylog[MP]; 			// Bandymai prisijungti

new g_szSprintfBuffer[16384 char];
new SQL:sqlHandle;

enum e_tune
{
	spoiler,
	hood,
	roof,
	sideskirt,
	lamps,
	nitro,
	exhaust,
	wheels,
	stereo,
	hidraulics,
	fbumper,
	rbumper,
	ventr,
	ventl
};

enum(<<= 1)
{
	fIsDespawned = 1,
	fSpyna,
	fVariklis,
	fIsInWorld,
	fIsOnFire,
	fTrunkInUse
};

enum
{
	FIX_PADANGOS = 1,
	FIX_VARIKLIS,
	FIX_BRAKES,
	FIX_FUEL,
	FIX_PLUG
};

enum(<<= 1)
{
	gEngine = 1,
	gBrakes,
	gTires,
	gFuel,
	gPlug,
	gSankaba
};

new
	Float:	speed_last[MP],
	Float:	speed_now[MP],
	Float:	speed_acceleration[MP],
	Float:	rotation_last[MP],
	Float:	rotation_now[MP],
	Float:	velocity_last[MP][3],
	Float:	velocity_now[MP][3],
			time_last[MP],
			time_now[MP],
			time_last_check[MP];

enum
{
	cGarage, // garaže
	cOkay, // sveika mašina pasaulyje
	cCrashed, // sudužus ir dega
	cNeedsRepair, // buvus sudužus ir užgesinta bet su < 700 hp
	cRepair // taisykloje pas mechanikus
};

enum carstatus
{
	car_savininkas,
	car_model,
	car_tipas,
	car_DBID,
	car_status,
	Float:car_x,
	Float:car_y,
	Float:car_z,
	Float:car_r,
	Float:rida,
	degalai,
	lock_code,
	car_id,
	car_color1,
	car_color2,
	Text3D:car_label,
	plate_number[8],
	car_label_color,
	driver,
	Float:health, 
	spalva1,
	spalva2,
	car_flags,
	gedimai,
	tune[e_tune],
	coords<555>,
	gBrakes_status,
	gTires_status,
	gFuel_status,
	gPlug_status,
	car_timer_damage,
	required_rank,
	repair_times,
	repair_status,
	burning_started,
	technikine,
	last_driver[24]
};

new sampVehicles[MAX_VEHICLES] = {INVALID_VEHICLE_ID, ...};

new car[MAX_VEHICLES][carstatus];
new trunk[MAX_VEHICLES][MAX_ITEM][e_bag];

new Iterator:masinos[8]<100>, // Darbø maðinos.

//  /VehicleID	  /Pavadinimas    /Spalva
	ipilti_degalai[MP][4],
	ipilti_kaina[MP][5],
	pcd[MP],                   // Á kurià maðinà þaidëjas pila degalus?

	// routes
	pnodes[MP][50],

	// Objektø id
	pd_vartai;

enum e_vartai:(<<= 1)
{
	fPD_vartai = 1,
	fKMA_vartai,
	fJail_liftas
};
new e_vartai:obj_bool;

enum
{
	OBJ_STATE_NORMAL,
	OBJ_STATE_NONE,
	OBJ_STATE_ONGROUND,
	OBJ_STATE_FINAL,
	OBJ_STATE_MOVING
};

enum
{
	OBJ_GANG_TAG = 1,
	OBJ_EMPTY_BOX,
	OBJ_GUN_BOX
};

enum e_obj:(<<= 1)
{
	fPickedUp = 1,
	fIsActive,
	fIsInUse
};

enum e_obj_upgrade:(<<= 1)
{
	uWep_9mm = 1,
	uWep_Shotgun,
	uWep_Uzi,
	uWep_Tec,
	uWep_Rifle,
	uWep_AK47,
	eStats_Heal,
	eStats_Regenerate
};

enum e_obj_other_ids
{
	obj_gang_id,
	obj_player_id,
	Text3D:obj_text_id,
	obj_area_id
};

enum e_obj_other_info
{
	obj_gang_influence,
	obj_gang_base_level,
	obj_counting,
	obj_state
};

enum e_obj_details
{
	obj_id,
	obj_dbid,
	e_obj:obj_flags,
	e_obj_upgrade:obj_upgrade,
	obj_other_ids[e_obj_other_ids],
	obj_other_info[e_obj_other_info]
};

new objects[MAX_OBJECTS][e_obj_details];

new const Float:Ligonines_lova[][4] = {

	{1255.1584,318.8760,9106.3291,169.8688}, // L1
	{1255.2416,320.6045,9106.3291,180.8331}, // L2
	{1255.2416,322.3330,9106.3291,180.8331}, // L3
	{1255.2416,324.0615,9106.3291,180.8331}, // L4

	{1262.9613,318.7529,9106.3291,359.8316}, // L5
	{1263.1161,320.7549,9106.3291,356.3849}, // L6
	{1263.0000,322.7549,9106.3291,356.3849} // L7

};
new bool:lova_in_use[7 char];

new const Float:randomHospitalSpawn[][4] = {

	{1260.8322,318.4388,9105.4209,355.9189}, // 1
	{1260.3699,323.3728,9105.4209,10.1652}, // 2
	{1257.1587,325.0131,9105.4209,283.3821}, // 3
	{1258.0189,322.1709,9105.4209,304.8992}, // 4
	{1257.9456,319.3375,9105.4209,214.6694}, // 5
	{1256.3817,317.3758,9105.4209,100.0092}, // 6
	{1256.6655,321.5143,9105.4209,357.2975}, // 7
	{1261.8655,321.8326,9105.4209,244.0161}, // 8
	{1261.2820,320.3171,9105.4209,317.5457}, // 9
	{1263.2804,317.2598,9105.4209,311.1119}, // 10
	{1263.2111,329.1868,9105.4209,183.4194}, // 11
	{1261.7380,326.9068,9105.4209,146.6546}, // 12
	{1259.3757,329.2079,9105.4209,38.6580}, // 13
	{1257.5371,327.2207,9105.4209,127.5829}, // 14
	{1255.9336,329.0824,9105.4209,34.0624} // 15
};

new const Float:gunDealerSpawn[][3] = {

	{-589.9404,-62.2047,64.3918},
	{-775.8263,-143.4333,65.0747},
	{-107.5987,-31.3899,3.1172},
	{1551.6293,-32.5743,21.3483},
	{2161.6670,-102.5830,2.7500},
	{745.6468,267.1617,27.0859},
	{1386.1888,474.0315,20.0893},
	{2618.6633,-90.4057,52.0050}

};

new const Float:washTarget[][3] = {
	{182.1448,-18.1166,1.3052}, 	// 1
	{325.1937,-57.2651,1.2733}, 	// 2
	{309.6491,-226.0006,1.3226}, 	// 3
	{71.3169,-220.5788,1.3092}, 	// 4
	{-209.3769,-295.9213,1.1568}, 	// 5
	{416.0946,-596.8183,35.5574}, 	// 6
	{682.2709,-664.3629,15.9146}, 	// 7
	{636.6646,-570.3021,15.9864}, 	// 8
	{693.8430,-477.5045,16.0630}, 	// 9
	{852.7819,-568.2615,16.7407}, 	// 10
	{1215.3337,-602.1908,52.1192}, 	// 11
	{1906.6205,45.0870,34.3419}, 	// 12
	{2290.6426,42.1839,26.0636}, 	// 13
	{2344.6294,277.9675,26.0630}, 	// 14
	{2464.1440,-36.2284,26.2114}, 	// 15
	{2588.9932,42.3772,26.0630}, 	// 16
	{2220.9839,139.0428,26.1414}, 	// 17
	{1530.8284,96.4190,29.3449}, 	// 18
	{1270.8682,181.6707,19.1844}, 	// 19
	{1412.7015,274.6195,19.2799}, 	// 20
	{1210.5244,275.7618,19.2820}, 	// 21
	{1215.6442,198.5678,19.2737}
};

new const MaxSeats[212] = 
{
	4,2,2,2,4,4,1,2,2,4,2,2,2,4,2,2,4,2,4,2,4,4,2,2,2,1,4,4,4,2,1,9,1,2,2,1,2,9,4,2,
	4,1,2,2,2,4,1,2,1,6,1,2,1,1,1,2,2,2,4,4,2,2,2,2,2,2,4,4,2,2,4,2,1,1,2,2,1,2,2,4,
	2,1,4,3,1,1,1,4,2,2,4,2,4,1,2,2,2,4,4,2,2,2,2,2,2,2,2,4,2,1,1,2,1,1,2,2,4,2,2,1,
	1,2,2,2,2,2,2,2,2,4,1,1,1,2,2,2,2,0,0,1,4,2,2,2,2,2,4,4,2,2,4,4,2,1,2,2,2,2,2,2,
	4,4,2,2,1,2,4,4,1,0,0,1,1,2,1,2,2,2,2,4,4,2,4,1,1,4,2,2,2,2,6,1,2,2,2,1,4,4,4,2,
	2,2,2,2,4,2,1,1,1,4,1,1
};

new const Float:jailas[][3] = {

	{603.2228,-588.6200,3004.4080},
	{595.8571,-587.3959,3004.4080}, // z2
	{587.6660,-588.9631,3004.4080}, // z3
	{585.5118,-572.3140,3004.4080}, // z4
	{591.7675,-572.2142,3004.4080}, // z5
	{597.6953,-572.4982,3004.4080} // z6
};

new const fishingspot[][2] = {
	{469, -258},
	{895, -109},
	{921, -113},
	{950, -117},
	{973, -121},
	{997, -112},
	{1011, -99},
	{1038, -94},
	{1074, -91},
	{1108, -81},
	{850, -138},
	{892, -130},
	{933, -127},
	{1005, -128},
	{1053, -132},
	{1085, -124},
	{1127, -121},
	{1187, -122}			};

enum AREAS_SOC
{
	mech_repair,
	mech_in_repair,
	mech_tune,
	mech_tech,
	medikai_in,
	medikai_in1,
	medikai_out,
	medikai_persirengimas,
	medikai_isidarbinimas,
	medikai_daiktai,
	oldwood_in,
	oldwood_out,
	akra_in,
	akra_out,
	mech_in,
	mech_out,
	mech_persirengimas,
	mech_daiktai,
	mech_isidarbinimas,
	mech_tuneshop,
	miestas1,
	miestas2,
	miestas3,
	miestas4,
	pd_in,
	pd_out,
	taxi_in,
	taxi_out,
	fishing_area[sizeof fishingspot],
	spawn_shop_area,
	arGarage
};

enum NPC
{
	oldwood_kasininke,
	pd_npc,
	akra_virejas,
	akra_baras,
	akra_gunshop,
	akra_foodstore,
	akra_clothes,
	spawn_shop,
	med[7],
	med_mokytoja,
	gun_dealer,
	furu_npc,
	veh_shop_npc
};


new // NPC
	npc[NPC];

new // Taimeriai
	timer_car_fuel[MAX_VEHICLES], 	// Degalø naudojimas
	timer_degaline[MAX_VEHICLES], 	// Kuro pilimas
	timer_fire[MP];
new // Arenos (Areas)
	area[AREAS_SOC],
	areaType[200];

new const TankFuel[212] = { // Ið sanFierro gm
	65, 48, 67, 170, 48, 66, 150, 80, 70, 67, 45, 70, 68, 59, 59, 70, 99, 115, 82, 55, 64, 59, 60, 60, 37, 200, 50, 88,
	67, 70, 100, 80, 200, 100, 55, 0, 44, 90, 70, 53, 60, 0, 50, 112, 100, 50, 200, 110, 35, 0, 0, 70, 90, 90, 90, 83,
	66, 20, 60, 60, 115, 40, 30, 35, 0, 0, 65, 65, 30, 80, 57, 20, 100, 80, 63, 51, 100, 64, 50, 49, 65, 0, 60, 60, 90,
	100, 25, 80, 55, 54, 60, 75, 40, 57, 100, 80, 90, 40, 80, 80, 70, 50, 0, 70, 70, 62, 60, 70, 40, 72, 0, 0, 100, 90,
	90, 90, 90, 41, 55, 55, 500, 300, 35, 40, 40, 80, 55, 60, 48, 60, 45, 20, 20, 50, 40, 45, 55, 60, 100, 100, 15, 40,
	70, 45, 80, 40, 45, 48, 100, 52, 50, 58, 55, 200, 47, 44, 90, 90, 58, 70, 70, 64, 70, 111, 0, 59, 55, 62, 40, 0, 90,
	20, 15, 80, 25, 57, 53, 200, 84, 61, 50, 35, 55, 20, 0, 50, 30, 48, 65, 43, 0, 0, 200, 99, 0, 101, 65, 65, 65, 65,
	41, 78, 52, 66, 53, 47, 0, 0, 0, 64, 0, 0
};

enum {
	CommonRed = 19006,
	CommonOrange,
	CommonGreen,
	CommonBlue,
	CommonPurple,
	CommonEspiral,
	CommonBlack,
	CommonEyes,
	CommonXadrex,
	CommonTransparent,
	CommonXRayVision,
	SquareFormatYellow,
	SquareFormatOrange,
	SquareFormatRed,
	SquareFormatBlue,
	SquareFormatGreen,
	RayBanGray,
	RayBanBlue,
	RayBanPurple,
	RayBanPink,
	RayBanRed,
	RayBanOrange,
	RayBanYellow,
	RayBanGreen,
	CircularNormal,
	CircularYellow,
	CircularRed,
	CircularBlack,
	CircularXadrex,
	CircularThunders,
	CopGlassesBlack = 19138,
	CopGlassesRed = 19139,
	CopGlassesBlue = 19140
};

new const Float:beretOffset[299][6] = 
{
	{0.135928, 0.002891, -0.008518, 0.000000, 0.000000, 347.188201},//Skin - 0
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                 //Skin - 1
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                 //Skin - 2
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                 //Skin - 3
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                 //Skin - 4
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                 //Skin - 5
	{0.155785, 0.005998, -0.014326, 0.000000, 0.000000, 347.188201},//Skin - 6
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                 //Skin - 7
	{0.131067, -0.013737, -0.008518, 0.000000, 0.000000, 347.188201},//Skin - 8
	{0.118922, -0.015322, -0.008518, 0.000000, 0.000000, 347.188201},//Skin - 9
	{0.125779, -0.001459, -0.008518, 0.000000, 0.000000, 347.188201},//Skin - 10
	{0.129249, -0.014101, -0.008518, 0.000000, 0.000000, 347.188201},//Skin - 11
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 12
	{0.161076, -0.015624, -0.006768, 0.000000, 0.000000, 347.188201},//Skin - 13
	{0.112204, -0.023196, -0.006768, 0.000000, 0.000000, 347.188201},//Skin - 14
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 15
	{0.150166, -0.008718, -0.006768, 0.000000, 0.000000, 347.188201},//Skin - 16
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 17
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 18
	{0.153609, -0.003207, -0.007717, 0.000000, 0.000000, 357.608825},//Skin - 19
	{0.143831, 0.001813, -0.010588, 0.000000, 0.000000, 357.608825}, //Skin - 20
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 21
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 22
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                   //Skin - 23
	{0.127352, 0.009877, -0.006845, 0.726156, 359.666778, 348.825012},//Skin - 24
	{0.124666, -0.029373, -0.006845, 0.726156, 359.666778, 329.940704},//Skin - 25
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                    //Skin - 26
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                    //Skin - 27
	{0.128768, 0.041474, -0.007667, 0.726156, 359.666778, 355.429199}, //Skin - 28
	{0.166457, -0.006228, -0.012669, 0.726156, 359.666778, 354.612152},//Skin - 29
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                    //Skin - 30
	{0.096077, -0.023233, -0.009101, 0.726156, 359.666778, 343.094055},//Skin - 31
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                    //Skin - 32
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                    //Skin - 33
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                    //Skin - 34
	{0.155565, 0.014400, -0.009101, 0.726156, 359.666778, 6.131487},   //Skin - 35
	{0.156485, 0.013641, -0.009101, 0.726156, 359.666778, 6.131487},   //Skin - 36
	{0.144815, 0.013641, -0.009374, 0.726156, 359.666778, 350.562103}, //Skin - 37
	{0.113347, -0.006682, -0.009374, 0.726156, 359.666778, 350.562103},//Skin - 38
	{0.147231, -0.014448, -0.004786, 0.726156, 359.666778, 357.303253},//Skin - 39
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                    //Skin - 40
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                    //Skin - 41
	{0.082446, 0.004202, -0.004786, 0.726156, 359.666778, 357.303253}, //Skin - 42
	{0.104901, 0.004013, -0.004786, 0.726156, 359.666778, 342.983184}, //Skin - 43
	{0.116172, -0.001954, -0.004786, 0.726156, 359.666778, 357.100677},//Skin - 44
	{0.153321, 0.025744, -0.008666, 0.726156, 359.666778, 10.704365},  //Skin - 45
	{0.160556, 0.007781, -0.010438, 0.726156, 359.666778, 0.991972},   //Skin - 46
	{0.179010, -0.035613, -0.010438, 0.726156, 359.666778, 347.956573},//Skin - 47
	{0.123363, 0.008694, -0.010438, 0.726156, 359.666778, 347.956573}, //Skin - 48
	{0.167061, -0.037899, -0.010438, 0.726156, 359.666778, 347.775817},//Skin - 49
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                    //Skin - 50
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                    //Skin - 51
	{0.129040, 0.016069, -0.010438, 0.726156, 359.666778, 347.775817}, //Skin - 52
	{0.129040, 0.016069, -0.006084, 0.726156, 359.666778, 347.775817}, //Skin - 53
	{0.137743, -0.016369, -0.011731, 0.726156, 359.666778, 355.812011},//Skin - 54
	{0.137743, -0.016369, -0.011731, 0.726156, 359.666778, 355.812011},//Skin - 55
	{0.174539, -0.000662, -0.007289, 0.726156, 359.666778, 352.847045},//Skin - 56
	{0.109382, -0.002955, -0.007289, 0.726156, 359.666778, 352.847045},//Skin - 57
	{0.152276, -0.029331, -0.008357, 0.726156, 359.666778, 332.070648},//Skin - 58
	{0.129599, -0.019172, -0.012204, 0.726156, 359.666778, 332.070648},//Skin - 59
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                    //Skin - 60
	{0.130350, 0.000897, -0.000747, 0.726156, 359.666778, 332.070648}, //Skin - 61
	{0.150659, -0.035485, -0.006299, 0.726156, 359.666778, 341.617431},//Skin - 62
	{0.119340, -0.006483, -0.006299, 0.726156, 359.666778, 341.617431},//Skin - 63
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                    //Skin - 64
	{0.133055, -0.000092, -0.006299, 0.726156, 359.666778, 341.617431},//Skin - 65
	{0.129061, -0.006499, -0.006299, 0.726156, 359.666778, 341.617431},//Skin - 66
	{0.127292, 0.010318, -0.006299, 0.726156, 359.666778, 341.617431}, //Skin - 67
	{0.138791, -0.025311, -0.006299, 0.726156, 359.666778, 341.617431},//Skin - 68
	{0.148132, 0.003970, -0.002304, 0.726156, 359.666778, 340.120025}, //Skin - 69
	{0.129753, 0.006469, -0.006376, 0.726156, 359.666778, 354.029815}, //Skin - 70
	{0.125663, 0.015428, -0.006376, 0.726156, 359.666778, 354.029815}, //Skin - 71
	{0.125663, 0.015428, -0.009030, 0.726156, 359.666778, 354.029815}, //Skin - 72
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                    //Skin - 73
	{0.135729, -0.018656, -0.013554, 0.000000, 0.000000, 337.893737},  //Skin - 74
	{0.141888, -0.042810, -0.006206, 0.000000, 0.000000, 337.893737},  //Skin - 75
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                    //Skin - 76
	{0.124348, -0.017813, -0.006206, 0.000000, 0.000000, 346.786865},  //Skin - 77
	{0.124348, 0.000583, -0.006206, 0.000000, 0.000000, 346.786865},   //Skin - 78
	{0.102654, -0.010906, -0.006206, 0.000000, 0.000000, 346.786865},  //Skin - 79
	{0.102654, -0.010906, -0.006206, 0.000000, 0.000000, 346.786865},  //Skin - 81
	{0.167928, 0.031601, -0.006206, 0.000000, 0.000000, 17.955888},    //Skin - 82
	{0.159998, 0.023540, -0.006206, 0.000000, 0.000000, 17.955888},    //Skin - 83
	{0.169630, 0.019315, -0.006206, 0.000000, 0.000000, 17.955888},    //Skin - 84
	{0.163052, -0.039735, -0.006206, 0.000000, 0.000000, 341.169891},  //Skin - 85
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                    //Skin - 86
	{0.144811, -0.007521, -0.014207, 0.000000, 0.000000, 341.169891},  //Skin - 87
	{0.129932, -0.007521, -0.007289, 0.000000, 0.000000, 341.169891},  //Skin - 88
	{0.151147, -0.038608, -0.009597, 0.000000, 0.000000, 343.694549},  //Skin - 89
	{0.147416, -0.031632, -0.009597, 0.000000, 0.000000, 343.694549},  //Skin - 90
	{0.157728, -0.009677, -0.009597, 0.000000, 0.000000, 0.934848},    //Skin - 91
	{0.136577, -0.015592, -0.009597, 0.000000, 0.000000, 341.013824},  //Skin - 92
	{0.143821, 0.000631, -0.008385, 0.000000, 0.000000, 358.808868},   //Skin - 93
	{0.100521, 0.003151, -0.007624, 0.000000, 0.000000, 358.808868},   //Skin - 94
	{0.122833, -0.006031, -0.007624, 0.000000, 0.000000, 358.808868},  //Skin - 95
	{0.145296, 0.003959, -0.007624, 0.000000, 0.000000, 358.808868},   //Skin - 96
	{0.141658, 0.016474, -0.007624, 0.000000, 0.000000, 9.683902},     //Skin - 97
	{0.145276, -0.002846, -0.007624, 0.000000, 0.000000, 340.239593},  //Skin - 98
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                    //Skin - 99
	{0.161745, -0.010244, -0.007624, 0.000000, 0.000000, 351.499267}, //Skin - 100
	{0.151006, -0.030994, -0.005366, 0.000000, 0.000000, 340.428894}, //Skin - 101
	{0.147111, 0.003794, -0.012433, 0.000000, 0.000000, 358.069244},  //Skin - 102
	{0.154213, -0.052348, -0.003511, 356.299316, 0.000000, 336.751647},//Skin - 103
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                    //Skin - 104
	{0.153814, -0.039614, -0.006756, 356.299316, 0.000000, 336.930084},//Skin - 105
	{0.153638, -0.039614, -0.013630, 356.299316, 0.000000, 336.930084},//Skin - 106
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                    //Skin - 107
	{0.140473, -0.026201, -0.000469, 0.390689, 355.405181, 335.554260},//Skin - 108
	{0.140904, -0.007227, -0.008114, 0.390689, 355.405181, 335.554260},//Skin - 109
	{0.140904, -0.007227, -0.008114, 0.390689, 355.405181, 335.554260},//Skin - 110
	{0.134860, 0.001485, -0.010145, 0.390689, 358.632415, 347.730010},//Skin - 111
	{0.124823, 0.001485, -0.009402, 0.390689, 358.632415, 347.730010},//Skin - 112
	{0.157999, -0.012039, -0.006082, 0.390689, 358.632415, 347.730010},//Skin - 113
	{0.144906, -0.005139, -0.009654, 0.390689, 358.632415, 336.830108},//Skin - 114
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                    //Skin - 116
	{0.152829, -0.009735, -0.009654, 0.390689, 358.632415, 336.830108},//Skin - 117
	{0.113804, 0.009252, -0.009654, 0.390689, 358.632415, 345.244384},//Skin - 118
	{0.113804, 0.009252, -0.009654, 0.390689, 358.632415, 345.244384},//Skin - 119
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                   //Skin -120
	{0.154275, -0.037484, -0.009654, 0.390689, 358.632415, 337.676666},//Skin - 121
	{0.155674, -0.015613, -0.004339, 0.390689, 358.632415, 350.571228},//Skin - 122
	{0.136433, -0.019181, -0.004339, 0.390689, 358.632415, 340.261840},//Skin - 123
	{0.163258, -0.032386, -0.013128, 0.390689, 358.632415, 340.261840},//Skin - 124
	{0.153242, -0.029651, -0.002434, 0.390689, 358.632415, 333.367614},//Skin - 125
	{0.127978, -0.001961, -0.008867, 0.390689, 358.632415, 347.279052},//Skin - 126
	{0.160856, -0.025356, -0.004428, 0.390689, 358.632415, 347.279052},//Skin - 127
	{0.150266, -0.009032, -0.006781, 0.390689, 358.632415, 347.223754},//Skin - 128
	{0.158060, 0.022907, -0.006781, 0.390689, 358.632415, 349.378875},//Skin - 129
	{0.111739, 0.012673, -0.006781, 0.390689, 358.632415, 349.378875},//Skin - 130
	{0.091638, -0.011600, -0.008686, 0.390689, 358.632415, 336.674468},//Skin - 131
	{0.125788, 0.000635, -0.005915, 0.390689, 358.632415, 343.007751},//Skin - 132
	{0.031324, -0.014154, -0.005915, 0.390689, 358.632415, 343.007751},//Skin - 133
	{0.142321, 0.015417, -0.005915, 0.243191, 358.632415, 350.329559},//Skin - 133
	{0.128780, -0.030750, 0.006687, 173.184967, 358.632415, 27.422966},//Skin - 134
	{0.115882, -0.004931, -0.003807, 358.837646, 358.632415, 346.206237},//Skin - 135
	{0.127531, -0.008916, -0.003807, 358.837646, 358.632415, 346.206237},//Skin - 136
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 137
	{0.148992, -0.017748, -0.006509, 358.837646, 358.632415, 350.742156},//Skin - 138
	{0.148992, -0.017748, -0.006509, 358.837646, 358.632415, 350.742156},//Skin - 139
	{0.147315, 0.001708, -0.006509, 358.837646, 358.632415, 354.390045},//Skin - 140
	{0.144315, -0.013571, -0.006509, 358.837646, 358.632415, 354.390045},//Skin - 141
	{0.144315, -0.002729, -0.010357, 358.837646, 358.632415, 354.390045},//Skin - 142
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 143
	{0.177516, -0.070868, -0.009114, 358.837646, 358.632415, 331.679321},//Skin - 144
	{0.139578, -0.008750, -0.004405, 358.837646, 358.632415, 343.319335},//Skin - 145
	{0.139578, -0.014406, -0.004405, 358.837646, 358.632415, 343.319335},//Skin - 146
	{0.115592, -0.010754, -0.004405, 358.837646, 358.632415, 343.319335},//Skin - 147
	{0.150735, -0.000459, -0.004405, 358.837646, 358.632415, 9.362450},//Skin - 148
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 149
	{0.149485, -0.008709, -0.006168, 358.837646, 358.632415, 2.276566},//Skin - 150
	{0.168162, -0.009708, -0.012160, 359.504821, 4.442328, 355.348114},//Skin - 151
	{0.156369, -0.024521, -0.012160, 359.504821, 0.415596, 355.348114},//Skin - 152
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 153
	{0.119297, -0.016080, -0.010776, 359.504821, 0.415596, 341.522827},//Skin - 154
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 155
	{0.172295, -0.065549, -0.007187, 359.504821, 0.415596, 336.175567},//Skin - 156
	{0.126340, -0.030764, -0.007187, 359.504821, 0.415596, 336.175567},//Skin - 157
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 158
	{0.154280, 0.002166, -0.010436, 359.504821, 0.415596, 357.792144},//Skin - 159
	{0.121469, -0.007383, -0.010436, 359.504821, 0.415596, 341.538574},//Skin - 160
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 161
	{0.139495, -0.007383, -0.010436, 359.504821, 0.415596, 341.538574},//Skin - 162
	{0.113212, -0.005302, -0.010436, 359.504821, 0.415596, 341.538574},//Skin - 163
	{0.120208, 0.003533, -0.010436, 359.504821, 0.415596, 341.538574},//Skin - 164
	{0.135111, 0.005091, -0.006407, 359.504821, 0.415596, 352.954559},//Skin - 165
	{0.122118, 0.005091, -0.006407, 359.504821, 0.415596, 352.954559},//Skin - 166
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 167
	{0.125229, 0.005091, -0.013084, 359.504821, 0.415596, 352.954559},//Skin - 168
	{0.153451, -0.018119, -0.013276, 359.504821, 0.415596, 358.219451},//Skin - 169
	{0.141395, -0.009131, -0.013276, 359.504821, 0.415596, 347.866027},//Skin - 170
	{0.157631, -0.028753, -0.006450, 359.504821, 0.415596, 339.935516},//Skin - 171
	{0.152687, -0.027057, -0.007731, 359.504821, 0.415596, 344.054809},//Skin - 172
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 173
	{0.165146, 0.015393, -0.007731, 359.504821, 0.415596, 344.001678},//Skin - 174
	{0.162788, -0.019696, -0.007731, 359.504821, 0.415596, 344.001678},//Skin - 175
	{0.157728, -0.027188, -0.012891, 359.504821, 0.415596, 345.804748},//Skin - 176
	{0.187507, 0.010472, -0.012891, 359.504821, 0.415596, 12.315887},//Skin - 177
	{0.153901, -0.027720, -0.007884, 359.504821, 0.415596, 344.553527},//Skin - 178
	{0.137445, -0.009757, -0.012987, 359.504821, 0.415596, 344.553527},//Skin - 179
	{0.173041, -0.006323, -0.012987, 359.504821, 0.415596, 3.267552},//Skin - 180
	{0.143467, 0.016897, -0.007831, 359.504821, 0.415596, 349.504974},//Skin - 181
	{0.114480, 0.006202, -0.007831, 359.504821, 0.415596, 349.504974},//Skin - 182
	{0.114480, 0.008813, -0.007831, 359.504821, 0.415596, 349.504974},//Skin - 183
	{0.128122, -0.012152, -0.013144, 359.504821, 0.415596, 336.326538},//Skin - 184
	{0.156171, 0.007268, -0.013144, 359.504821, 0.415596, 10.805211},//Skin - 185
	{0.156409, -0.034861, -0.007927, 359.504821, 0.415596, 336.978668},//Skin - 186
	{0.118034, -0.024105, -0.002947, 359.504821, 0.415596, 336.978668},//Skin - 187
	{0.128686, -0.029632, -0.002947, 358.201873, 0.415596, 329.325042},//Skin - 188
	{0.172639, -0.026749, -0.012705, 358.201873, 0.415596, 349.092590},//Skin - 189
	{0.180897, -0.026749, -0.007224, 358.201873, 0.415596, 349.092590},//Skin - 190
	{0.180897, -0.026749, -0.007224, 358.201873, 0.415596, 349.092590},//Skin - 191
	{0.178725, -0.010278, -0.007224, 358.201873, 0.415596, 354.053405},//Skin - 192
	{0.172020, -0.010278, -0.010734, 358.201873, 0.415596, 354.053405},//Skin - 193
	{0.172020, -0.010278, -0.010734, 358.201873, 0.415596, 354.053405},//Skin - 194
	{0.176089, -0.032526, -0.005110, 358.201873, 0.415596, 341.814422},//Skin - 195
	{0.118042, 0.007002, -0.005110, 358.201873, 0.415596, 341.814422},//Skin - 196
	{0.143840, -0.042712, -0.007556, 358.201873, 0.415596, 341.814422},//Skin - 197
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 198
	{0.148060, -0.032384, -0.009754, 358.201873, 0.415596, 333.484924},//Skin - 199
	{0.148060, -0.032384, -0.009754, 358.201873, 0.415596, 333.484924},//Skin - 200
	{0.140799, 0.025145, -0.009754, 358.201873, 0.415596, 5.040688},//Skin - 201
	{0.140799, 0.015851, -0.009754, 358.201873, 0.415596, 349.796478},//Skin - 202
	{0.140799, -0.004372, -0.013685, 358.201873, 0.415596, 349.796478},//Skin - 203
	{0.154274, 0.006245, -0.013685, 358.201873, 0.415596, 2.035465},//Skin - 204
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 205
	{0.154274, 0.016669, -0.013685, 358.201873, 0.415596, 2.035465},//Skin - 206
	{0.106604, 0.004805, -0.011840, 358.201873, 0.415596, 2.035465},//Skin - 207
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 208
	{0.148378, -0.003807, -0.011840, 358.201873, 0.415596, 2.035465},//Skin - 209
	{0.113854, 0.001969, -0.011840, 358.201873, 0.415596, 343.826263},//Skin - 210
	{0.149539, -0.028623, -0.009621, 358.201873, 0.415596, 331.587280},//Skin - 211
	{0.104024, -0.014549, -0.009621, 358.201873, 0.415596, 331.587280},//Skin - 212
	{0.145820, -0.029160, -0.009621, 358.201873, 0.415596, 331.587280},//Skin - 213
	{0.148646, -0.008515, -0.009621, 358.201873, 0.415596, 1.360260},//Skin - 214
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 215
	{0.148646, -0.005935, -0.004058, 358.201873, 0.415596, 1.360260},//Skin - 216
	{0.148646, -0.015611, -0.004058, 358.201873, 0.415596, 340.374938},//Skin - 217
	{0.133952, -0.030138, -0.009880, 358.201873, 0.415596, 340.374938},//Skin - 218
	{0.140503, -0.033425, -0.005693, 358.201873, 0.415596, 340.374938},//Skin - 219
	{0.114608, 0.009020, -0.009135, 358.201873, 0.415596, 352.932006},//Skin - 220
	{0.186516, -0.044762, -0.009135, 358.201873, 0.415596, 344.217132},//Skin - 221
	{0.186516, -0.044762, -0.009135, 358.201873, 0.415596, 344.217132},//Skin - 222
	{0.179908, -0.010779, -0.009135, 358.201873, 0.415596, 344.217132},//Skin - 223
	{0.156689, -0.015437, -0.009135, 358.201873, 0.415596, 352.741638},//Skin - 224
	{0.156689, -0.015437, -0.009135, 358.201873, 0.415596, 352.741638},//Skin - 225
	{0.134990, -0.034685, -0.009135, 358.201873, 0.415596, 340.812927},//Skin - 226
	{0.151760, 0.002680, -0.009135, 358.201873, 0.415596, 340.812927},//Skin - 227
	{0.167410, -0.028664, -0.009135, 358.201873, 0.415596, 340.250427},//Skin - 228
	{0.127699, -0.015571, -0.006103, 358.201873, 0.415596, 347.232238},//Skin - 229
	{0.100555, -0.007753, -0.006103, 358.201873, 0.415596, 347.232238},//Skin - 230
	{0.126940, 0.016886, -0.006103, 358.201873, 0.415596, 347.232238},//Skin - 231
	{0.132949, -0.017515, -0.008594, 358.201873, 0.415596, 347.232238},//Skin - 232
	{0.146124, -0.008425, -0.008594, 358.201873, 0.415596, 347.232238},//Skin - 233
	{0.125714, -0.021018, -0.008594, 358.201873, 0.415596, 347.232238},//Skin - 234
	{0.084982, -0.009809, -0.008594, 358.201873, 0.415596, 347.232238},//Skin - 235
	{0.114669, -0.005190, -0.008594, 358.201873, 0.415596, 351.301177},//Skin - 236
	{0.123264, -0.014946, -0.008594, 358.201873, 0.415596, 351.301177},//Skin - 237
	{0.146656, -0.023925, -0.006749, 358.201873, 0.415596, 334.356781},//Skin - 238
	{0.133769, -0.007373, -0.006749, 358.201873, 0.415596, 343.105895},//Skin - 239
	{0.165378, -0.020173, -0.005869, 358.201873, 0.415596, 348.352233},//Skin - 240
	{0.143331, -0.133577, -0.011472, 358.201873, 0.415596, 312.328857},//Skin - 241
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 242
	{0.098602, 0.002084, -0.011472, 358.201873, 0.415596, 348.195495},//Skin - 243
	{0.124240, -0.011682, -0.006423, 358.201873, 0.415596, 341.555999},//Skin - 244
	{0.158155, -0.044311, -0.005439, 358.201873, 0.415596, 336.024902},//Skin - 245
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 246
	{0.164307, -0.040974, -0.006797, 358.201873, 0.415596, 337.067047},//Skin - 247
	{0.191578, -0.040435, -0.010605, 358.201873, 0.415596, 340.908203},//Skin - 248
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 249
	{0.135208, -0.015243, -0.011916, 358.201873, 0.415596, 340.908203},//Skin - 250
	{0.134272, -0.027377, -0.006035, 358.201873, 0.415596, 333.416168},//Skin - 251
	{0.158813, -0.038977, -0.006035, 358.201873, 0.415596, 336.013519},//Skin - 252
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 253
	{0.165106, -0.048880, -0.009719, 358.201873, 0.415596, 331.050933},//Skin - 254
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 255
	{0.142586, 0.020829, -0.008549, 358.201873, 0.415596, 2.765411},//Skin - 256
	{0.134018, -0.024462, -0.008549, 358.201873, 0.415596, 339.642486},//Skin - 257
	{0.147750, -0.042854, -0.008114, 0.951334, 0.415596, 330.441131},//Skin - 258
	{0.147750, -0.042854, -0.008114, 0.951334, 0.415596, 330.441131},//Skin - 259
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 260
	{0.134710, 0.006798, -0.008114, 358.188964, 0.415596, 352.703582},//Skin - 261
	{0.111691, 0.006798, -0.008114, 358.188964, 0.415596, 352.703582},//Skin - 262
	{0.146077, -0.005195, -0.008114, 358.188964, 0.415596, 3.866970},//Skin - 263
	{0.135858, -0.157842, -0.008114, 358.188964, 0.415596, 314.852203},//Skin - 264
	{0.127964, 0.000132, -0.008114, 358.188964, 0.415596, 352.699432},//Skin - 265
	{0.127964, -0.002646, -0.008114, 358.188964, 0.415596, 352.699432},//Skin - 266
	{0.132329, -0.014261, -0.007384, 1.504234, 0.415596, 352.699432},//Skin - 267
	{0.145951, -0.043442, -0.010053, 1.504234, 0.415596, 320.469390},//Skin - 268
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 269
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 270
	{0.141851, -0.034538, -0.010580, 1.504234, 0.415596, 340.349456},//Skin - 271
	{0.136473, -0.057088, -0.008204, 1.504234, 0.415596, 318.134399},//Skin - 272
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                 //Skin - 273
	{0.124270, 0.003252, -0.008204, 1.504234, 0.415596, 346.744995},//Skin - 274
	{0.131583, 0.007682, -0.008204, 1.504234, 0.415596, 346.744995},//Skin - 275
	{0.131583, 0.007682, -0.008204, 1.504234, 0.415596, 346.744995},//Skin - 276
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 277
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 278
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 279
	{0.131583, 0.007682, -0.008204, 1.504234, 0.415596, 346.744995},//Skin - 280
	{0.131583, 0.007682, -0.008204, 1.504234, 0.415596, 346.744995},//Skin - 281
	{0.140515, 0.009018, -0.008204, 1.504234, 0.415596, 346.744995},//Skin - 282
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 283
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 284
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 285
	{0.140515, 0.001933, -0.008204, 1.504234, 0.415596, 346.744995}, //Skin - 286
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 287
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 288
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 289
	{0.128789, -0.014062, -0.007850, 1.504234, 0.415596, 340.341094},//Skin - 290
	{0.158929, -0.027358, -0.010655, 1.504234, 0.415596, 337.298858},//Skin - 291
	{0.113309, -0.012434, -0.010655, 1.504234, 0.415596, 337.298858},//Skin - 292
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 293
	{0.158438, -0.023891, -0.007217, 1.504234, 0.415596, 337.298858},//Skin - 294
	{0.145000, -0.032054, -0.007217, 1.504234, 0.415596, 336.385589},//Skin - 295
	{0.139293, -0.069554, -0.010619, 1.504234, 0.415596, 320.746429},//Skin - 296
	{0.148252, -0.066463, -0.010619, 1.504234, 0.415596, 320.729705},//Skin - 297
	{0.126423, -0.066463, -0.010619, 1.504234, 0.415596, 320.729705},//Skin - 298
	{0.144949, -0.040691, -0.008599, 1.504234, 0.415596, 320.729705}//Skin - 299
};

new const Float:capsOffset[299][6] = 
{
	{0.135928, 0.002891, -0.008518, 0.000000, 0.000000, 347.188201},//Skin - 0
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                 //Skin - 1
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                 //Skin - 2
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                 //Skin - 3
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                 //Skin - 4
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                 //Skin - 5
	{0.155785, 0.005998, -0.014326, 0.000000, 0.000000, 347.188201},//Skin - 6
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                 //Skin - 7
	{0.131067, -0.013737, -0.008518, 0.000000, 0.000000, 347.188201},//Skin - 8
	{0.118922, -0.015322, -0.008518, 0.000000, 0.000000, 347.188201},//Skin - 9
	{0.125779, -0.001459, -0.008518, 0.000000, 0.000000, 347.188201},//Skin - 10
	{0.129249, -0.014101, -0.008518, 0.000000, 0.000000, 347.188201},//Skin - 11
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 12
	{0.161076, -0.015624, -0.006768, 0.000000, 0.000000, 347.188201},//Skin - 13
	{0.112204, -0.023196, -0.006768, 0.000000, 0.000000, 347.188201},//Skin - 14
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 15
	{0.150166, -0.008718, -0.006768, 0.000000, 0.000000, 347.188201},//Skin - 16
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 17
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 18
	{0.153609, -0.003207, -0.007717, 0.000000, 0.000000, 357.608825},//Skin - 19
	{0.143831, 0.001813, -0.010588, 0.000000, 0.000000, 357.608825}, //Skin - 20
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 21
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 22
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                   //Skin - 23
	{0.127352, 0.009877, -0.006845, 0.726156, 359.666778, 348.825012},//Skin - 24
	{0.124666, -0.029373, -0.006845, 0.726156, 359.666778, 329.940704},//Skin - 25
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                    //Skin - 26
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                    //Skin - 27
	{0.128768, 0.041474, -0.007667, 0.726156, 359.666778, 355.429199}, //Skin - 28
	{0.166457, -0.006228, -0.012669, 0.726156, 359.666778, 354.612152},//Skin - 29
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                    //Skin - 30
	{0.096077, -0.023233, -0.009101, 0.726156, 359.666778, 343.094055},//Skin - 31
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                    //Skin - 32
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                    //Skin - 33
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                    //Skin - 34
	{0.155565, 0.014400, -0.009101, 0.726156, 359.666778, 6.131487},   //Skin - 35
	{0.156485, 0.013641, -0.009101, 0.726156, 359.666778, 6.131487},   //Skin - 36
	{0.144815, 0.013641, -0.009374, 0.726156, 359.666778, 350.562103}, //Skin - 37
	{0.113347, -0.006682, -0.009374, 0.726156, 359.666778, 350.562103},//Skin - 38
	{0.147231, -0.014448, -0.004786, 0.726156, 359.666778, 357.303253},//Skin - 39
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                    //Skin - 40
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                    //Skin - 41
	{0.082446, 0.004202, -0.004786, 0.726156, 359.666778, 357.303253}, //Skin - 42
	{0.104901, 0.004013, -0.004786, 0.726156, 359.666778, 342.983184}, //Skin - 43
	{0.116172, -0.001954, -0.004786, 0.726156, 359.666778, 357.100677},//Skin - 44
	{0.153321, 0.025744, -0.008666, 0.726156, 359.666778, 10.704365},  //Skin - 45
	{0.160556, 0.007781, -0.010438, 0.726156, 359.666778, 0.991972},   //Skin - 46
	{0.179010, -0.035613, -0.010438, 0.726156, 359.666778, 347.956573},//Skin - 47
	{0.123363, 0.008694, -0.010438, 0.726156, 359.666778, 347.956573}, //Skin - 48
	{0.167061, -0.037899, -0.010438, 0.726156, 359.666778, 347.775817},//Skin - 49
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                    //Skin - 50
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                    //Skin - 51
	{0.129040, 0.016069, -0.010438, 0.726156, 359.666778, 347.775817}, //Skin - 52
	{0.129040, 0.016069, -0.006084, 0.726156, 359.666778, 347.775817}, //Skin - 53
	{0.137743, -0.016369, -0.011731, 0.726156, 359.666778, 355.812011},//Skin - 54
	{0.137743, -0.016369, -0.011731, 0.726156, 359.666778, 355.812011},//Skin - 55
	{0.174539, -0.000662, -0.007289, 0.726156, 359.666778, 352.847045},//Skin - 56
	{0.109382, -0.002955, -0.007289, 0.726156, 359.666778, 352.847045},//Skin - 57
	{0.152276, -0.029331, -0.008357, 0.726156, 359.666778, 332.070648},//Skin - 58
	{0.129599, -0.019172, -0.012204, 0.726156, 359.666778, 332.070648},//Skin - 59
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                    //Skin - 60
	{0.130350, 0.000897, -0.000747, 0.726156, 359.666778, 332.070648}, //Skin - 61
	{0.150659, -0.035485, -0.006299, 0.726156, 359.666778, 341.617431},//Skin - 62
	{0.119340, -0.006483, -0.006299, 0.726156, 359.666778, 341.617431},//Skin - 63
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                    //Skin - 64
	{0.133055, -0.000092, -0.006299, 0.726156, 359.666778, 341.617431},//Skin - 65
	{0.129061, -0.006499, -0.006299, 0.726156, 359.666778, 341.617431},//Skin - 66
	{0.127292, 0.010318, -0.006299, 0.726156, 359.666778, 341.617431}, //Skin - 67
	{0.138791, -0.025311, -0.006299, 0.726156, 359.666778, 341.617431},//Skin - 68
	{0.148132, 0.003970, -0.002304, 0.726156, 359.666778, 340.120025}, //Skin - 69
	{0.129753, 0.006469, -0.006376, 0.726156, 359.666778, 354.029815}, //Skin - 70
	{0.125663, 0.015428, -0.006376, 0.726156, 359.666778, 354.029815}, //Skin - 71
	{0.125663, 0.015428, -0.009030, 0.726156, 359.666778, 354.029815}, //Skin - 72
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                    //Skin - 73
	{0.135729, -0.018656, -0.013554, 0.000000, 0.000000, 337.893737},  //Skin - 74
	{0.141888, -0.042810, -0.006206, 0.000000, 0.000000, 337.893737},  //Skin - 75
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                    //Skin - 76
	{0.124348, -0.017813, -0.006206, 0.000000, 0.000000, 346.786865},  //Skin - 77
	{0.124348, 0.000583, -0.006206, 0.000000, 0.000000, 346.786865},   //Skin - 78
	{0.102654, -0.010906, -0.006206, 0.000000, 0.000000, 346.786865},  //Skin - 79
	{0.102654, -0.010906, -0.006206, 0.000000, 0.000000, 346.786865},  //Skin - 81
	{0.167928, 0.031601, -0.006206, 0.000000, 0.000000, 17.955888},    //Skin - 82
	{0.159998, 0.023540, -0.006206, 0.000000, 0.000000, 17.955888},    //Skin - 83
	{0.169630, 0.019315, -0.006206, 0.000000, 0.000000, 17.955888},    //Skin - 84
	{0.163052, -0.039735, -0.006206, 0.000000, 0.000000, 341.169891},  //Skin - 85
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                    //Skin - 86
	{0.144811, -0.007521, -0.014207, 0.000000, 0.000000, 341.169891},  //Skin - 87
	{0.129932, -0.007521, -0.007289, 0.000000, 0.000000, 341.169891},  //Skin - 88
	{0.151147, -0.038608, -0.009597, 0.000000, 0.000000, 343.694549},  //Skin - 89
	{0.147416, -0.031632, -0.009597, 0.000000, 0.000000, 343.694549},  //Skin - 90
	{0.157728, -0.009677, -0.009597, 0.000000, 0.000000, 0.934848},    //Skin - 91
	{0.136577, -0.015592, -0.009597, 0.000000, 0.000000, 341.013824},  //Skin - 92
	{0.143821, 0.000631, -0.008385, 0.000000, 0.000000, 358.808868},   //Skin - 93
	{0.100521, 0.003151, -0.007624, 0.000000, 0.000000, 358.808868},   //Skin - 94
	{0.122833, -0.006031, -0.007624, 0.000000, 0.000000, 358.808868},  //Skin - 95
	{0.145296, 0.003959, -0.007624, 0.000000, 0.000000, 358.808868},   //Skin - 96
	{0.141658, 0.016474, -0.007624, 0.000000, 0.000000, 9.683902},     //Skin - 97
	{0.145276, -0.002846, -0.007624, 0.000000, 0.000000, 340.239593},  //Skin - 98
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                    //Skin - 99
	{0.161745, -0.010244, -0.007624, 0.000000, 0.000000, 351.499267}, //Skin - 100
	{0.151006, -0.030994, -0.005366, 0.000000, 0.000000, 340.428894}, //Skin - 101
	{0.147111, 0.003794, -0.012433, 0.000000, 0.000000, 358.069244},  //Skin - 102
	{0.154213, -0.052348, -0.003511, 356.299316, 0.000000, 336.751647},//Skin - 103
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                    //Skin - 104
	{0.153814, -0.039614, -0.006756, 356.299316, 0.000000, 336.930084},//Skin - 105
	{0.153638, -0.039614, -0.013630, 356.299316, 0.000000, 336.930084},//Skin - 106
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                    //Skin - 107
	{0.140473, -0.026201, -0.000469, 0.390689, 355.405181, 335.554260},//Skin - 108
	{0.140904, -0.007227, -0.008114, 0.390689, 355.405181, 335.554260},//Skin - 109
	{0.140904, -0.007227, -0.008114, 0.390689, 355.405181, 335.554260},//Skin - 110
	{0.134860, 0.001485, -0.010145, 0.390689, 358.632415, 347.730010},//Skin - 111
	{0.124823, 0.001485, -0.009402, 0.390689, 358.632415, 347.730010},//Skin - 112
	{0.157999, -0.012039, -0.006082, 0.390689, 358.632415, 347.730010},//Skin - 113
	{0.144906, -0.005139, -0.009654, 0.390689, 358.632415, 336.830108},//Skin - 114
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                    //Skin - 116
	{0.152829, -0.009735, -0.009654, 0.390689, 358.632415, 336.830108},//Skin - 117
	{0.113804, 0.009252, -0.009654, 0.390689, 358.632415, 345.244384},//Skin - 118
	{0.113804, 0.009252, -0.009654, 0.390689, 358.632415, 345.244384},//Skin - 119
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                   //Skin -120
	{0.154275, -0.037484, -0.009654, 0.390689, 358.632415, 337.676666},//Skin - 121
	{0.155674, -0.015613, -0.004339, 0.390689, 358.632415, 350.571228},//Skin - 122
	{0.136433, -0.019181, -0.004339, 0.390689, 358.632415, 340.261840},//Skin - 123
	{0.163258, -0.032386, -0.013128, 0.390689, 358.632415, 340.261840},//Skin - 124
	{0.153242, -0.029651, -0.002434, 0.390689, 358.632415, 333.367614},//Skin - 125
	{0.127978, -0.001961, -0.008867, 0.390689, 358.632415, 347.279052},//Skin - 126
	{0.160856, -0.025356, -0.004428, 0.390689, 358.632415, 347.279052},//Skin - 127
	{0.150266, -0.009032, -0.006781, 0.390689, 358.632415, 347.223754},//Skin - 128
	{0.158060, 0.022907, -0.006781, 0.390689, 358.632415, 349.378875},//Skin - 129
	{0.111739, 0.012673, -0.006781, 0.390689, 358.632415, 349.378875},//Skin - 130
	{0.091638, -0.011600, -0.008686, 0.390689, 358.632415, 336.674468},//Skin - 131
	{0.125788, 0.000635, -0.005915, 0.390689, 358.632415, 343.007751},//Skin - 132
	{0.031324, -0.014154, -0.005915, 0.390689, 358.632415, 343.007751},//Skin - 133
	{0.142321, 0.015417, -0.005915, 0.243191, 358.632415, 350.329559},//Skin - 133
	{0.128780, -0.030750, 0.006687, 173.184967, 358.632415, 27.422966},//Skin - 134
	{0.115882, -0.004931, -0.003807, 358.837646, 358.632415, 346.206237},//Skin - 135
	{0.127531, -0.008916, -0.003807, 358.837646, 358.632415, 346.206237},//Skin - 136
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 137
	{0.148992, -0.017748, -0.006509, 358.837646, 358.632415, 350.742156},//Skin - 138
	{0.148992, -0.017748, -0.006509, 358.837646, 358.632415, 350.742156},//Skin - 139
	{0.147315, 0.001708, -0.006509, 358.837646, 358.632415, 354.390045},//Skin - 140
	{0.144315, -0.013571, -0.006509, 358.837646, 358.632415, 354.390045},//Skin - 141
	{0.144315, -0.002729, -0.010357, 358.837646, 358.632415, 354.390045},//Skin - 142
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 143
	{0.177516, -0.070868, -0.009114, 358.837646, 358.632415, 331.679321},//Skin - 144
	{0.139578, -0.008750, -0.004405, 358.837646, 358.632415, 343.319335},//Skin - 145
	{0.139578, -0.014406, -0.004405, 358.837646, 358.632415, 343.319335},//Skin - 146
	{0.115592, -0.010754, -0.004405, 358.837646, 358.632415, 343.319335},//Skin - 147
	{0.150735, -0.000459, -0.004405, 358.837646, 358.632415, 9.362450},//Skin - 148
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 149
	{0.149485, -0.008709, -0.006168, 358.837646, 358.632415, 2.276566},//Skin - 150
	{0.168162, -0.009708, -0.012160, 359.504821, 4.442328, 355.348114},//Skin - 151
	{0.156369, -0.024521, -0.012160, 359.504821, 0.415596, 355.348114},//Skin - 152
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 153
	{0.119297, -0.016080, -0.010776, 359.504821, 0.415596, 341.522827},//Skin - 154
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 155
	{0.172295, -0.065549, -0.007187, 359.504821, 0.415596, 336.175567},//Skin - 156
	{0.126340, -0.030764, -0.007187, 359.504821, 0.415596, 336.175567},//Skin - 157
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 158
	{0.154280, 0.002166, -0.010436, 359.504821, 0.415596, 357.792144},//Skin - 159
	{0.121469, -0.007383, -0.010436, 359.504821, 0.415596, 341.538574},//Skin - 160
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 161
	{0.139495, -0.007383, -0.010436, 359.504821, 0.415596, 341.538574},//Skin - 162
	{0.113212, -0.005302, -0.010436, 359.504821, 0.415596, 341.538574},//Skin - 163
	{0.120208, 0.003533, -0.010436, 359.504821, 0.415596, 341.538574},//Skin - 164
	{0.135111, 0.005091, -0.006407, 359.504821, 0.415596, 352.954559},//Skin - 165
	{0.122118, 0.005091, -0.006407, 359.504821, 0.415596, 352.954559},//Skin - 166
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 167
	{0.125229, 0.005091, -0.013084, 359.504821, 0.415596, 352.954559},//Skin - 168
	{0.153451, -0.018119, -0.013276, 359.504821, 0.415596, 358.219451},//Skin - 169
	{0.141395, -0.009131, -0.013276, 359.504821, 0.415596, 347.866027},//Skin - 170
	{0.157631, -0.028753, -0.006450, 359.504821, 0.415596, 339.935516},//Skin - 171
	{0.152687, -0.027057, -0.007731, 359.504821, 0.415596, 344.054809},//Skin - 172
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 173
	{0.165146, 0.015393, -0.007731, 359.504821, 0.415596, 344.001678},//Skin - 174
	{0.162788, -0.019696, -0.007731, 359.504821, 0.415596, 344.001678},//Skin - 175
	{0.157728, -0.027188, -0.012891, 359.504821, 0.415596, 345.804748},//Skin - 176
	{0.187507, 0.010472, -0.012891, 359.504821, 0.415596, 12.315887},//Skin - 177
	{0.153901, -0.027720, -0.007884, 359.504821, 0.415596, 344.553527},//Skin - 178
	{0.137445, -0.009757, -0.012987, 359.504821, 0.415596, 344.553527},//Skin - 179
	{0.173041, -0.006323, -0.012987, 359.504821, 0.415596, 3.267552},//Skin - 180
	{0.143467, 0.016897, -0.007831, 359.504821, 0.415596, 349.504974},//Skin - 181
	{0.114480, 0.006202, -0.007831, 359.504821, 0.415596, 349.504974},//Skin - 182
	{0.114480, 0.008813, -0.007831, 359.504821, 0.415596, 349.504974},//Skin - 183
	{0.128122, -0.012152, -0.013144, 359.504821, 0.415596, 336.326538},//Skin - 184
	{0.156171, 0.007268, -0.013144, 359.504821, 0.415596, 10.805211},//Skin - 185
	{0.156409, -0.034861, -0.007927, 359.504821, 0.415596, 336.978668},//Skin - 186
	{0.118034, -0.024105, -0.002947, 359.504821, 0.415596, 336.978668},//Skin - 187
	{0.128686, -0.029632, -0.002947, 358.201873, 0.415596, 329.325042},//Skin - 188
	{0.172639, -0.026749, -0.012705, 358.201873, 0.415596, 349.092590},//Skin - 189
	{0.180897, -0.026749, -0.007224, 358.201873, 0.415596, 349.092590},//Skin - 190
	{0.180897, -0.026749, -0.007224, 358.201873, 0.415596, 349.092590},//Skin - 191
	{0.178725, -0.010278, -0.007224, 358.201873, 0.415596, 354.053405},//Skin - 192
	{0.172020, -0.010278, -0.010734, 358.201873, 0.415596, 354.053405},//Skin - 193
	{0.172020, -0.010278, -0.010734, 358.201873, 0.415596, 354.053405},//Skin - 194
	{0.176089, -0.032526, -0.005110, 358.201873, 0.415596, 341.814422},//Skin - 195
	{0.118042, 0.007002, -0.005110, 358.201873, 0.415596, 341.814422},//Skin - 196
	{0.143840, -0.042712, -0.007556, 358.201873, 0.415596, 341.814422},//Skin - 197
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 198
	{0.148060, -0.032384, -0.009754, 358.201873, 0.415596, 333.484924},//Skin - 199
	{0.148060, -0.032384, -0.009754, 358.201873, 0.415596, 333.484924},//Skin - 200
	{0.140799, 0.025145, -0.009754, 358.201873, 0.415596, 5.040688},//Skin - 201
	{0.140799, 0.015851, -0.009754, 358.201873, 0.415596, 349.796478},//Skin - 202
	{0.140799, -0.004372, -0.013685, 358.201873, 0.415596, 349.796478},//Skin - 203
	{0.154274, 0.006245, -0.013685, 358.201873, 0.415596, 2.035465},//Skin - 204
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 205
	{0.154274, 0.016669, -0.013685, 358.201873, 0.415596, 2.035465},//Skin - 206
	{0.106604, 0.004805, -0.011840, 358.201873, 0.415596, 2.035465},//Skin - 207
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 208
	{0.148378, -0.003807, -0.011840, 358.201873, 0.415596, 2.035465},//Skin - 209
	{0.113854, 0.001969, -0.011840, 358.201873, 0.415596, 343.826263},//Skin - 210
	{0.149539, -0.028623, -0.009621, 358.201873, 0.415596, 331.587280},//Skin - 211
	{0.104024, -0.014549, -0.009621, 358.201873, 0.415596, 331.587280},//Skin - 212
	{0.145820, -0.029160, -0.009621, 358.201873, 0.415596, 331.587280},//Skin - 213
	{0.148646, -0.008515, -0.009621, 358.201873, 0.415596, 1.360260},//Skin - 214
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 215
	{0.148646, -0.005935, -0.004058, 358.201873, 0.415596, 1.360260},//Skin - 216
	{0.148646, -0.015611, -0.004058, 358.201873, 0.415596, 340.374938},//Skin - 217
	{0.133952, -0.030138, -0.009880, 358.201873, 0.415596, 340.374938},//Skin - 218
	{0.140503, -0.033425, -0.005693, 358.201873, 0.415596, 340.374938},//Skin - 219
	{0.114608, 0.009020, -0.009135, 358.201873, 0.415596, 352.932006},//Skin - 220
	{0.186516, -0.044762, -0.009135, 358.201873, 0.415596, 344.217132},//Skin - 221
	{0.186516, -0.044762, -0.009135, 358.201873, 0.415596, 344.217132},//Skin - 222
	{0.179908, -0.010779, -0.009135, 358.201873, 0.415596, 344.217132},//Skin - 223
	{0.156689, -0.015437, -0.009135, 358.201873, 0.415596, 352.741638},//Skin - 224
	{0.156689, -0.015437, -0.009135, 358.201873, 0.415596, 352.741638},//Skin - 225
	{0.134990, -0.034685, -0.009135, 358.201873, 0.415596, 340.812927},//Skin - 226
	{0.151760, 0.002680, -0.009135, 358.201873, 0.415596, 340.812927},//Skin - 227
	{0.167410, -0.028664, -0.009135, 358.201873, 0.415596, 340.250427},//Skin - 228
	{0.127699, -0.015571, -0.006103, 358.201873, 0.415596, 347.232238},//Skin - 229
	{0.100555, -0.007753, -0.006103, 358.201873, 0.415596, 347.232238},//Skin - 230
	{0.126940, 0.016886, -0.006103, 358.201873, 0.415596, 347.232238},//Skin - 231
	{0.132949, -0.017515, -0.008594, 358.201873, 0.415596, 347.232238},//Skin - 232
	{0.146124, -0.008425, -0.008594, 358.201873, 0.415596, 347.232238},//Skin - 233
	{0.125714, -0.021018, -0.008594, 358.201873, 0.415596, 347.232238},//Skin - 234
	{0.084982, -0.009809, -0.008594, 358.201873, 0.415596, 347.232238},//Skin - 235
	{0.114669, -0.005190, -0.008594, 358.201873, 0.415596, 351.301177},//Skin - 236
	{0.123264, -0.014946, -0.008594, 358.201873, 0.415596, 351.301177},//Skin - 237
	{0.146656, -0.023925, -0.006749, 358.201873, 0.415596, 334.356781},//Skin - 238
	{0.133769, -0.007373, -0.006749, 358.201873, 0.415596, 343.105895},//Skin - 239
	{0.165378, -0.020173, -0.005869, 358.201873, 0.415596, 348.352233},//Skin - 240
	{0.143331, -0.133577, -0.011472, 358.201873, 0.415596, 312.328857},//Skin - 241
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 242
	{0.098602, 0.002084, -0.011472, 358.201873, 0.415596, 348.195495},//Skin - 243
	{0.124240, -0.011682, -0.006423, 358.201873, 0.415596, 341.555999},//Skin - 244
	{0.158155, -0.044311, -0.005439, 358.201873, 0.415596, 336.024902},//Skin - 245
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 246
	{0.164307, -0.040974, -0.006797, 358.201873, 0.415596, 337.067047},//Skin - 247
	{0.191578, -0.040435, -0.010605, 358.201873, 0.415596, 340.908203},//Skin - 248
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 249
	{0.135208, -0.015243, -0.011916, 358.201873, 0.415596, 340.908203},//Skin - 250
	{0.134272, -0.027377, -0.006035, 358.201873, 0.415596, 333.416168},//Skin - 251
	{0.158813, -0.038977, -0.006035, 358.201873, 0.415596, 336.013519},//Skin - 252
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 253
	{0.165106, -0.048880, -0.009719, 358.201873, 0.415596, 331.050933},//Skin - 254
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 255
	{0.142586, 0.020829, -0.008549, 358.201873, 0.415596, 2.765411},//Skin - 256
	{0.134018, -0.024462, -0.008549, 358.201873, 0.415596, 339.642486},//Skin - 257
	{0.147750, -0.042854, -0.008114, 0.951334, 0.415596, 330.441131},//Skin - 258
	{0.147750, -0.042854, -0.008114, 0.951334, 0.415596, 330.441131},//Skin - 259
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 260
	{0.134710, 0.006798, -0.008114, 358.188964, 0.415596, 352.703582},//Skin - 261
	{0.111691, 0.006798, -0.008114, 358.188964, 0.415596, 352.703582},//Skin - 262
	{0.146077, -0.005195, -0.008114, 358.188964, 0.415596, 3.866970},//Skin - 263
	{0.135858, -0.157842, -0.008114, 358.188964, 0.415596, 314.852203},//Skin - 264
	{0.127964, 0.000132, -0.008114, 358.188964, 0.415596, 352.699432},//Skin - 265
	{0.127964, -0.002646, -0.008114, 358.188964, 0.415596, 352.699432},//Skin - 266
	{0.132329, -0.014261, -0.007384, 1.504234, 0.415596, 352.699432},//Skin - 267
	{0.145951, -0.043442, -0.010053, 1.504234, 0.415596, 320.469390},//Skin - 268
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 269
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 270
	{0.141851, -0.034538, -0.010580, 1.504234, 0.415596, 340.349456},//Skin - 271
	{0.136473, -0.057088, -0.008204, 1.504234, 0.415596, 318.134399},//Skin - 272
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                 //Skin - 273
	{0.124270, 0.003252, -0.008204, 1.504234, 0.415596, 346.744995},//Skin - 274
	{0.131583, 0.007682, -0.008204, 1.504234, 0.415596, 346.744995},//Skin - 275
	{0.131583, 0.007682, -0.008204, 1.504234, 0.415596, 346.744995},//Skin - 276
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 277
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 278
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 279
	{0.131583, 0.007682, -0.008204, 1.504234, 0.415596, 346.744995},//Skin - 280
	{0.131583, 0.007682, -0.008204, 1.504234, 0.415596, 346.744995},//Skin - 281
	{0.140515, 0.009018, -0.008204, 1.504234, 0.415596, 346.744995},//Skin - 282
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 283
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 284
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 285
	{0.140515, 0.001933, -0.008204, 1.504234, 0.415596, 346.744995}, //Skin - 286
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 287
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 288
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 289
	{0.128789, -0.014062, -0.007850, 1.504234, 0.415596, 340.341094},//Skin - 290
	{0.158929, -0.027358, -0.010655, 1.504234, 0.415596, 337.298858},//Skin - 291
	{0.113309, -0.012434, -0.010655, 1.504234, 0.415596, 337.298858},//Skin - 292
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0},                                  //Skin - 293
	{0.158438, -0.023891, -0.007217, 1.504234, 0.415596, 337.298858},//Skin - 294
	{0.145000, -0.032054, -0.007217, 1.504234, 0.415596, 336.385589},//Skin - 295
	{0.139293, -0.069554, -0.010619, 1.504234, 0.415596, 320.746429},//Skin - 296
	{0.148252, -0.066463, -0.010619, 1.504234, 0.415596, 320.729705},//Skin - 297
	{0.126423, -0.066463, -0.010619, 1.504234, 0.415596, 320.729705},//Skin - 298
	{0.144949, -0.040691, -0.008599, 1.504234, 0.415596, 320.729705}//Skin - 299
};

new const Float:glassesOffset[300][7] = 
{
	{0.098771, 0.030772, -0.000335, 85.342658, 84.122947, 4.236968, 1.000000}, // - 0
	{0.100766, 0.028630, -0.003521, 87.936676, 82.110870, 4.236968, 1.000000}, // - 1
	{0.083712, 0.033132, -0.003521, 87.936676, 82.110870, 4.236968, 1.000000}, // - 2
	{0.099500, 0.047703, 0.000558, 280.687683, 90.938697, 169.126358, 1.000000}, // - 3
	{0.126660, 0.017465, -0.004450, 281.516479, 103.193008, 168.312896, 1.167009}, // - 4
	{0.109650, 0.017465, -0.004712, 281.516479, 106.686439, 168.312896, 1.167009}, // - 5
	{0.101269, 0.028933, 0.000001, 281.516479, 91.839576, 168.312896, 1.000000}, // - 6
	{0.090066, 0.043458, -0.006523, 87.936676, 82.110870, 4.236968, 1.000000}, // - 7
	{0.087873, 0.038192, -0.003603, 281.516479, 91.839576, 168.312896, 1.020467}, // - 8
	{0.070977, 0.028663, 0.000147, 81.164970, 92.128402, 4.236968, 1.000000},  // - 9
	{0.072317, 0.032179, -0.002934, 86.843269, 84.196006, 4.236968, 1.000000}, // - 10
	{0.072317, 0.035465, -0.002201, 86.843269, 84.196006, 4.236968, 1.000000}, // - 11
	{0.072317, 0.028100, -0.002201, 86.843269, 84.196006, 4.236968, 1.000000}, // - 12
	{0.076569, 0.028100, -0.002201, 86.843269, 84.196006, 4.236968, 1.000000}, // - 13
	{0.091310, 0.049169, -0.002201, 86.843269, 84.196006, 4.236968, 1.000000}, // - 14
	{0.073734, 0.006292, -0.002755, 86.843269, 84.196006, 4.236968, 1.000000}, // - 15
	{0.092845, 0.040331, 0.000183, 86.843269, 82.864280, 4.236968, 1.000000},  // - 16
	{0.088241, 0.030184, -0.000157, 86.843269, 82.864280, 4.236968, 1.000000}, // - 17
	{0.061677, 0.029596, -0.007398, 86.843269, 82.864280, 4.236968, 1.000000}, // - 18
	{0.079911, 0.029596, -0.002934, 86.843269, 82.864280, 4.236968, 1.000000}, // - 19
	{0.095079, 0.029596, -0.001718, 85.261871, 86.296562, 4.236968, 1.000000}, // - 20
	{0.093728, 0.042083, -0.005781, 85.261871, 81.636192, 4.236968, 1.000000}, // - 21
	{0.079585, 0.042083, -0.005781, 85.261871, 81.636192, 4.236968, 1.000000}, // - 22
	{0.090786, 0.041737, -0.005263, 85.261871, 81.636192, 4.236968, 1.000000}, // - 23
	{0.085247, 0.026941, -0.000317, 85.261871, 81.636192, 4.236968, 1.000000}, // - 24
	{0.081646, 0.031448, -0.001113, 89.393653, 81.665985, 4.236968, 1.000000}, // - 25
	{0.083700, 0.033814, -0.001960, 86.436462, 81.665985, 4.236968, 1.000000}, // - 26
	{0.092498, 0.037321, -0.001960, 86.436462, 85.568023, 4.236968, 1.000000}, // - 27
	{0.097068, 0.041360, -0.007881, 86.771400, 85.568023, 4.236968, 1.000000}, // - 28
	{0.083456, 0.050595, 0.001011, 86.771400, 77.201461, 4.236968, 1.000000},  // - 29
	{0.076983, 0.047168, -0.006161, 86.771400, 74.329719, 4.236968, 1.000000}, // - 30
	{0.083798, 0.042184, -0.001869, 86.771400, 83.181861, 4.236968, 1.000000}, // - 31
	{0.053021, -0.000587, -0.001869, 86.771400, 66.859710, 4.236968, 1.000000},// - 32
	{0.034386, 0.013324, -0.001869, 86.771400, 80.314460, 4.236968, 1.000000}, // - 33
	{0.104669, 0.037365, -0.001403, 86.771400, 87.178382, 4.236968, 1.000000}, // - 34
	{0.102659, 0.037465, -0.000829, 86.771400, 93.020492, 4.236968, 1.000000}, // - 35
	{0.107638, 0.037465, -0.000829, 86.771400, 93.020492, 4.236968, 1.000000}, // - 36
	{0.107638, 0.035879, -0.000829, 86.771400, 93.020492, 4.236968, 1.000000}, // - 37
	{0.107638, 0.041106, -0.000829, 86.771400, 93.020492, 4.236968, 1.000000}, // - 38
	{0.080326, 0.035634, -0.000829, 86.771400, 93.020492, 4.236968, 1.000000}, // - 39
	{0.080326, 0.027371, -0.000829, 86.771400, 93.020492, 4.236968, 1.000000}, // - 40
	{0.084617, 0.039613, -0.001620, 86.771400, 93.020492, 4.236968, 1.000000}, // - 41
	{0.087873, 0.037386, -0.003603, 281.516479, 91.839576, 168.312896, 1.093392}, // - 42
	{0.040075, 0.025445, -0.000974, 86.771400, 92.964149, 4.236968, 1.000000}, // - 43
	{0.077369, 0.028469, -0.000974, 86.771400, 78.435791, 4.236968, 1.000000}, // - 44
	{0.064145, 0.028684, -0.000974, 86.771400, 84.762802, 4.236968, 1.000000}, // - 45
	{0.091993, 0.056559, -0.000974, 86.771400, 84.762802, 4.236968, 1.000000}, // - 46
	{0.084582, 0.051277, -0.005034, 86.771400, 84.762802, 4.236968, 1.000000}, // - 47
	{0.092182, 0.042095, -0.003533, 86.771400, 84.762802, 4.236968, 1.000000}, // - 48
	{0.086866, 0.032203, -0.001021, 86.771400, 84.762802, 4.236968, 1.000000}, // - 49
	{0.099350, 0.009422, -0.005899, 86.771400, 84.762802, 4.236968, 1.000000}, // - 50
	{0.099350, 0.030598, -0.005899, 86.771400, 84.762802, 4.236968, 1.000000}, // - 51
	{0.099350, 0.030598, -0.003575, 86.771400, 84.762802, 4.236968, 1.000000}, // - 52
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0}, // - 53
	{0.079123, 0.030598, -0.003575, 86.771400, 84.762802, 4.236968, 1.000000}, // - 54
	{0.063159, 0.029641, -0.003575, 86.771400, 84.762802, 4.236968, 1.000000}, // - 55
	{0.070293, 0.029641, -0.000570, 86.771400, 84.762802, 4.236968, 1.000000}, // - 56
	{0.111305, 0.045368, -0.000570, 86.771400, 84.458084, 4.236968, 1.000000}, // - 57
	{0.084901, 0.020965, -0.000570, 86.771400, 79.542411, 4.236968, 1.000000}, // - 58
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0}, // - 59
	{0.090164, 0.044163, -0.004754, 86.771400, 79.542411, 4.236968, 1.000000}, // - 60
	{0.087151, 0.041447, -0.000885, 90.928329, 89.598678, 0.000000, 1.000000}, // - 61
	{0.094350, 0.041447, 0.005717, 90.928329, 89.598678, 0.000000, 1.000000},  // - 62
	{0.075534, 0.041447, -0.001751, 90.928329, 89.598678, 0.000000, 1.000000}, // - 63
	{0.075534, 0.041447, -0.001751, 90.928329, 89.598678, 0.000000, 1.000000}, // - 64
	{0.087873, 0.032505, -0.003603, 281.516479, 91.839576, 168.312896, 0.965358}, // - 65
	{0.104148, 0.034787, 0.001341, 90.928329, 89.598678, 0.000000, 1.000000},  // - 66
	{0.104148, 0.034787, 0.001341, 90.928329, 89.598678, 0.000000, 1.000000},  // - 67
	{0.087317, 0.039646, -0.004032, 90.928329, 89.598678, 0.000000, 1.000000}, // - 68
	{0.074873, 0.039646, -0.003072, 90.928329, 89.598678, 0.000000, 1.000000}, // - 69
	{0.090391, 0.042364, 0.005494, 90.928329, 89.598678, 0.000000, 1.000000},  // - 70
	{0.090391, 0.022298, -0.001170, 90.928329, 89.598678, 0.000000, 1.000000}, // - 71
	{0.090391, 0.039580, -0.001170, 90.928329, 89.598678, 0.000000, 1.000000}, // - 72
	{0.090391, 0.038224, -0.001170, 90.928329, 89.598678, 0.000000, 1.000000}, // - 73
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0}, // - 74
	{0.083113, 0.038224, -0.001170, 90.928329, 89.598678, 0.000000, 1.000000}, // - 75
	{0.072957, 0.028956, -0.001170, 90.928329, 89.598678, 0.000000, 1.000000}, // - 76
	{0.069398, 0.039981, -0.001170, 90.928329, 89.598678, 0.000000, 1.000000}, // - 77
	{0.105738, 0.010001, 0.004508, 90.928329, 79.030494, 0.000000, 1.000000},  // - 78
	{0.078264, 0.019668, 0.004508, 90.928329, 79.030494, 0.000000, 1.000000},  // - 79
	{0.087377, 0.022096, -0.001993, 90.928329, 79.030494, 0.000000, 1.000000}, // - 80
	{0.087377, 0.022096, -0.001635, 90.928329, 79.030494, 0.000000, 1.000000}, // - 81
	{0.100623, 0.043063, -0.001635, 90.928329, 87.672645, 0.000000, 1.000000}, // - 82
	{0.092528, 0.027493, -0.001635, 90.928329, 87.672645, 0.000000, 1.000000}, // - 83
	{0.102086, 0.027493, -0.001635, 90.928329, 87.672645, 0.000000, 1.000000}, // - 84
	{0.081954, 0.041672, -0.001635, 90.928329, 87.672645, 0.000000, 1.000000}, // - 85
	{0.025608, -0.003408, 281.516479, 106.686721, 167.551193, 0.965358}, // - 86
	{0.077010, 0.046925, -0.003438, 90.928329, 91.590301, 0.000000, 1.000000}, // - 87
	{0.069952, 0.042635, -0.003438, 90.928329, 86.722587, 0.000000, 1.000000}, // - 88
	{0.093827, 0.019258, -0.003438, 90.928329, 86.722587, 0.000000, 1.000000}, // - 89
	{0.066464, 0.035685, -0.000843, 90.928329, 86.722587, 0.000000, 1.000000}, // - 90
	{0.066464, 0.035685, -0.000843, 90.928329, 86.722587, 0.000000, 1.000000}, // - 91
	{0.066464, 0.038135, -0.000843, 90.928329, 86.722587, 0.000000, 1.000000}, // - 92
	{0.066464, 0.038135, -0.001690, 90.928329, 86.722587, 0.000000, 1.000000}, // - 93
	{0.048124, 0.010598, -0.001690, 90.928329, 86.722587, 0.000000, 1.000000}, // - 94
	{0.084997, 0.006773, -0.001690, 90.928329, 86.722587, 0.000000, 1.000000}, // - 95
	{0.100076, 0.026633, -0.001690, 90.928329, 80.020179, 0.000000, 1.000000}, // - 96
	{0.061686, 0.027537, -0.001690, 90.928329, 80.020179, 0.000000, 1.000000}, // - 97
	{0.098318, 0.053993, -0.001690, 90.928329, 89.237678, 0.000000, 1.000000}, // - 98
	{0.098318, 0.033702, -0.001690, 90.928329, 89.237678, 0.000000, 1.000000}, // - 99
	{0.086149, 0.042526, -0.001690, 90.928329, 77.587478, 0.000000, 1.000000}, // - 100
	{0.081864, 0.030555, -0.001690, 90.928329, 78.145759, 0.000000, 1.000000}, // - 101
	{0.081864, 0.047914, -0.005079, 90.928329, 78.145759, 0.000000, 1.000000}, // - 102
	{0.089607, 0.036717, -0.005079, 90.928329, 78.145759, 0.000000, 1.000000}, // - 103
	{0.079655, 0.042021, -0.005079, 90.928329, 78.145759, 0.000000, 1.000000}, // - 104
	{0.091779, 0.037620, -0.005079, 90.928329, 78.145759, 0.000000, 1.000000}, // - 105
	{0.084179, 0.035251, -0.005079, 90.928329, 78.145759, 0.000000, 1.000000}, // - 106
	{0.089387, 0.040297, -0.006006, 90.928329, 78.145759, 0.000000, 1.000000}, // - 107
	{0.081930, 0.030756, 0.001523, 90.928329, 78.145759, 0.000000, 1.000000},  // - 108
	{0.092857, 0.043070, -0.006084, 90.928329, 85.326652, 0.000000, 1.000000}, // - 109
	{0.092857, 0.043070, -0.006084, 90.928329, 85.326652, 0.000000, 1.000000}, // - 110
	{0.106601, 0.028021, -0.003537, 90.928329, 90.217376, 0.000000, 1.000000}, // - 111
	{0.096335, 0.015873, -0.003537, 90.928329, 90.217376, 0.000000, 1.000000}, // - 112
	{0.105827, 0.046620, -0.001395, 90.928329, 90.217376, 0.000000, 1.000000}, // - 113
	{0.097520, 0.044296, -0.007286, 90.928329, 90.217376, 0.000000, 1.000000}, // - 114
	{0.097408, 0.043470, -0.007286, 90.928329, 90.217376, 0.000000, 1.000000}, // - 115
	{0.092588, 0.049832, -0.007286, 90.928329, 90.217376, 0.000000, 1.000000}, // - 116
	{0.081444, 0.037602, -0.003125, 90.928329, 90.217376, 0.000000, 1.000000}, // - 117
	{0.078678, 0.037602, -0.001816, 90.928329, 90.217376, 0.000000, 1.000000}, // - 118
	{0.093011, 0.037032, -0.001987, 281.516479, 94.968688, 167.551193, 1.051324}, // - 119
	{0.089214, 0.029291, -0.000784, 90.928329, 84.624763, 0.000000, 1.000000}, // - 120
	{0.086825, 0.033424, -0.000784, 90.928329, 77.233818, 0.000000, 1.000000}, // - 121
	{0.082869, 0.030783, -0.000950, 90.928329, 77.233818, 0.000000, 1.000000}, // - 122
	{0.096117, 0.048957, -0.006245, 90.928329, 87.579650, 0.000000, 1.000000}, // - 123
	{0.103663, 0.040022, 0.000449, 90.928329, 87.579650, 0.000000, 1.000000},  // - 124
	{0.099326, 0.031202, -0.001180, 90.928329, 87.579650, 0.000000, 1.000000}, // - 125
	{0.099326, 0.031132, -0.001180, 90.928329, 87.579650, 0.000000, 1.000000}, // - 126
	{0.099326, 0.039279, -0.001180, 90.928329, 87.579650, 0.000000, 1.000000}, // - 127
	{0.099326, 0.047422, -0.001180, 90.928329, 87.579650, 0.000000, 1.000000}, // - 128
	{0.088817, 0.021210, 0.000730, 90.928329, 87.579650, 0.000000, 1.000000},  // - 129
	{0.025784, 0.028323, 0.000730, 90.928329, 59.394767, 0.000000, 1.000000},  // - 130
	{0.068455, 0.031841, -0.004470, 90.928329, 79.979003, 0.000000, 1.000000}, // - 131
	{0.012930, 0.008392, -0.004470, 90.928329, 72.129173, 0.000000, 1.000000}, // - 132
	{0.102457, 0.032260, -0.003338, 90.928329, 84.534217, 0.000000, 1.000000}, // - 133
	{0.085976, 0.014956, -0.003338, 90.928329, 80.308830, 0.000000, 1.000000}, // - 134
	{0.071574, 0.028186, -0.001588, 90.928329, 80.308830, 0.000000, 1.000000}, // - 135
	{0.085219, 0.016666, -0.000738, 90.928329, 80.308830, 0.000000, 1.000000}, // - 136
	{0.065114, 0.009318, -0.000738, 90.928329, 80.308830, 0.000000, 1.000000}, // - 137
	{0.066890, 0.040024, -0.000738, 90.928329, 87.341934, 0.000000, 1.000000}, // - 138
	{0.072037, 0.036141, -0.000702, 90.928329, 87.341934, 0.000000, 1.000000}, // - 139
	{0.069108, 0.042194, -0.000436, 90.928329, 87.341934, 0.000000, 1.000000}, // - 140
	{0.058717, 0.043547, -0.000436, 90.928329, 87.209770, 0.000000, 1.000000}, // - 141
	{0.104196, 0.039601, -0.005481, 90.928329, 87.209770, 0.000000, 1.000000}, // - 142
	{0.090929, 0.045881, -0.012780, 90.928329, 87.209770, 0.000000, 1.000000}, // - 143
	{0.098291, 0.042464, -0.006952, 90.928329, 83.081665, 0.000000, 1.000000}, // - 144
	{0.080087, 0.030122, 0.000606, 90.928329, 83.081665, 0.000000, 1.000000},  // - 145
	{0.093500, 0.030690, -0.001545, 90.928329, 83.081665, 0.000000, 1.000000}, // - 146
	{0.079566, 0.020138, 0.004838, 90.928329, 73.715591, 0.000000, 1.000000},  // - 147
	{0.073564, 0.028430, -0.000527, 90.928329, 88.295433, 0.000000, 1.000000}, // - 148
	{0.099901, 0.011976, 0.001273, 281.516479, 97.607620, 167.551193, 1.190787}, // - 149
	{0.073564, 0.028430, -0.000527, 90.928329, 88.295433, 0.000000, 1.000000}, // - 150
	{0.083426, 0.032359, -0.005717, 90.928329, 88.295433, 0.000000, 1.000000}, // - 151
	{0.072349, 0.019623, -0.000747, 90.928329, 82.624351, 0.000000, 1.000000}, // - 152
	{0.075065, 0.015351, 0.006545, 90.928329, 71.041442, 0.000000, 1.000000},  // - 153
	{0.062227, 0.029731, -0.004938, 90.928329, 84.602760, 0.000000, 1.000000}, // - 154
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0}, // - 155
	{0.079936, 0.049000, -0.000304, 90.928329, 82.926010, 0.000000, 1.000000}, // - 156
	{0.067550, 0.035686, -0.000017, 90.928329, 82.926010, 0.000000, 1.000000}, // - 157
	{0.090676, 0.039383, -0.001726, 90.928329, 88.667900, 0.000000, 1.000000}, // - 158
	{0.090676, 0.039383, -0.003532, 90.928329, 88.667900, 0.000000, 1.000000}, // - 159
	{0.098662, 0.017441, -0.001589, 90.928329, 88.667900, 0.000000, 1.000000}, // - 160
	{0.105388, 0.038409, 0.003155, 90.928329, 88.667900, 0.000000, 1.000000},  // - 161
	{0.097415, 0.036904, -0.000525, 90.928329, 88.667900, 0.000000, 1.000000}, // - 162
	{0.088934, 0.023302, -0.004153, 90.928329, 80.393875, 0.000000, 1.000000}, // - 163
	{0.088934, 0.023302, -0.004153, 90.928329, 80.393875, 0.000000, 1.000000}, // - 164
	{0.087018, 0.051364, 0.000484, 90.928329, 94.584838, 0.000000, 1.000000},  // - 165
	{0.087018, 0.051364, 0.000484, 90.928329, 94.584838, 0.000000, 1.000000},  // - 166
	{0.095996, 0.038787, 0.000484, 90.928329, 84.315711, 0.000000, 1.000000},  // - 167
	{0.089094, 0.034001, -0.006451, 90.928329, 84.315711, 0.000000, 1.000000}, // - 168
	{0.075700, 0.028082, -0.006451, 90.928329, 84.315711, 0.000000, 1.000000}, // - 169
	{0.093751, 0.041968, -0.005545, 90.928329, 84.315711, 0.000000, 1.000000}, // - 170
	{0.090124, 0.031055, -0.000505, 90.928329, 84.315711, 0.000000, 1.000000}, // - 171
	{0.066033, 0.032915, -0.002713, 90.928329, 84.315711, 0.000000, 1.000000}, // - 172
	{0.088287, 0.045350, -0.005384, 90.928329, 84.315711, 0.000000, 1.000000}, // - 173
	{0.087750, 0.042129, -0.005384, 90.928329, 84.315711, 0.000000, 1.000000}, // - 174
	{0.092384, 0.039294, -0.005384, 90.928329, 84.315711, 0.000000, 1.000000}, // - 175
	{0.097661, 0.039065, -0.006344, 90.928329, 80.736480, 0.000000, 1.000000}, // - 176
	{0.097114, 0.039641, -0.006692, 90.928329, 80.736480, 0.000000, 1.000000}, // - 177
	{0.069354, 0.039641, -0.000474, 90.928329, 80.736480, 0.000000, 1.000000}, // - 178
	{0.091414, 0.039641, -0.005617, 90.928329, 80.736480, 0.000000, 1.000000}, // - 179
	{0.094914, 0.039641, -0.005617, 90.928329, 80.736480, 0.000000, 1.000000}, // - 180
	{0.117232, 0.033217, -0.001099, 90.928329, 82.396362, 0.000000, 1.000000}, // - 181
	{0.082569, 0.032748, -0.003248, 90.928329, 87.394371, 0.000000, 1.000000}, // - 182
	{0.095527, 0.027237, -0.001960, 90.928329, 86.443649, 0.000000, 1.000000}, // - 183
	{0.095527, 0.040994, -0.006878, 90.928329, 86.443649, 0.000000, 1.000000}, // - 184
	{0.085663, 0.030601, -0.002345, 90.928329, 81.496513, 0.000000, 1.000000}, // - 185
	{0.085663, 0.030601, -0.001015, 90.928329, 81.496513, 0.000000, 1.000000}, // - 186
	{0.076527, 0.027211, 0.008500, 90.928329, 74.401092, 0.000000, 1.000000},  // - 187
	{0.096669, 0.032578, 0.001662, 90.928329, 83.502502, 0.000000, 1.000000},  // - 188
	{0.098753, 0.032129, -0.001659, 90.928329, 90.153724, 0.000000, 1.000000}, // - 189
	{0.092821, 0.035572, -0.001659, 90.928329, 90.153724, 0.000000, 1.000000}, // - 190
	{0.092821, 0.035572, -0.001132, 90.928329, 90.153724, 0.000000, 1.000000}, // - 191
	{0.092821, 0.035572, -0.001132, 90.928329, 90.153724, 0.000000, 1.000000}, // - 192
	{0.092821, 0.035572, -0.001132, 90.928329, 90.153724, 0.000000, 1.000000}, // - 193
	{0.092821, 0.035572, -0.001132, 90.928329, 90.153724, 0.000000, 1.000000}, // - 194
	{0.092821, 0.035572, -0.001132, 90.928329, 90.153724, 0.000000, 1.000000}, // - 195
	{0.092821, 0.035572, -0.001132, 90.928329, 90.153724, 0.000000, 1.000000}, // - 196
	{0.100630, 0.020568, -0.001132, 90.928329, 90.153724, 0.000000, 1.000000}, // - 197
	{0.077905, 0.028523, 0.000000, 89.675476, 89.270309, 0.000000, 1.000000},  // - 198
	{0.099095, 0.022463, 0.000000, 89.675476, 89.270309, 0.000000, 1.000000},  // - 199
	{0.103182, 0.031106, 0.000000, 89.675476, 89.270309, 0.000000, 1.000000},  // - 200
	{0.078426, 0.038546, 0.000000, 89.675476, 89.270309, 0.000000, 1.000000},  // - 201
	{0.101092, 0.035797, -0.002997, 89.675476, 82.081153, 0.000000, 1.000000}, // - 202
	{0.092009, 0.042780, -0.005841, 89.675476, 84.463294, 0.000000, 1.000000}, // - 203
	{0.092009, 0.042780, -0.005841, 89.675476, 84.463294, 0.000000, 1.000000}, // - 204
	{0.092969, 0.027782, -0.002959, 89.675476, 84.463294, 0.000000, 1.000000}, // - 205
	{0.105109, 0.036128, -0.000471, 89.675476, 84.463294, 0.000000, 1.000000}, // - 206
	{0.066892, 0.024410, -0.002792, 89.675476, 84.463294, 0.000000, 1.000000}, // - 207
	{0.088610, 0.043561, 0.001273, 281.516479, 89.674781, 167.551193, 1.000000}, // - 208
	{0.084046, 0.013608, -0.002792, 89.675476, 81.667831, 0.000000, 1.000000}, // - 209
	{0.084046, 0.013608, -0.001034, 89.675476, 81.667831, 0.000000, 1.000000}, // - 210
	{0.067610, 0.033777, -0.001034, 89.675476, 85.214485, 0.000000, 1.000000}, // - 211
	{0.094159, 0.020717, 0.000715, 89.675476, 85.214485, 0.000000, 1.000000},  // - 212
	{0.098744, 0.036786, -0.001770, 89.675476, 85.214485, 0.000000, 1.000000}, // - 213
	{0.068755, 0.036786, -0.001770, 89.675476, 85.214485, 0.000000, 1.000000}, // - 214
	{0.068755, 0.026863, -0.001770, 89.675476, 85.214485, 0.000000, 1.000000}, // - 215
	{0.068755, 0.026863, -0.001770, 89.675476, 85.214485, 0.000000, 1.000000}, // - 216
	{0.095765, 0.030034, -0.001770, 89.675476, 85.214485, 0.000000, 1.000000}, // - 217
	{0.085486, 0.039427, -0.003311, 89.675476, 85.214485, 0.000000, 1.000000}, // - 218
	{0.068874, 0.027850, -0.001021, 89.675476, 85.214485, 0.000000, 1.000000}, // - 219
	{0.052931, 0.050390, -0.002062, 89.675476, 88.113647, 0.000000, 1.000000}, // - 220
	{0.094479, 0.034432, 0.000875, 89.675476, 83.572830, 0.000000, 1.000000},  // - 221
	{0.094479, 0.034432, -0.000596, 89.675476, 83.572830, 0.000000, 1.000000}, // - 222
	{0.094479, 0.062073, -0.003098, 89.675476, 83.572830, 0.000000, 1.000000}, // - 223
	{0.064458, 0.029760, -0.001460, 89.675476, 83.572830, 0.000000, 1.000000}, // - 224
	{0.064458, 0.029760, -0.001460, 89.675476, 83.572830, 0.000000, 1.000000}, // - 225
	{0.072095, 0.029760, -0.001460, 89.675476, 83.572830, 0.000000, 1.000000}, // - 226
	{0.110619, 0.043037, -0.001466, 89.675476, 86.927627, 0.000000, 1.000000}, // - 227
	{0.099446, 0.050772, -0.001466, 89.675476, 85.103805, 0.000000, 1.000000}, // - 228
	{0.078635, 0.023680, -0.000275, 89.675476, 73.445220, 0.000000, 1.000000}, // - 229
	{0.043357, 0.028726, -0.000275, 89.675476, 73.445220, 0.000000, 1.000000}, // - 230
	{0.092488, 0.049972, -0.000275, 89.675476, 88.981941, 0.000000, 1.000000}, // - 231
	{0.092488, 0.016739, -0.000275, 89.675476, 88.981941, 0.000000, 1.000000}, // - 232
	{0.071677, 0.037055, -0.002878, 89.675476, 88.981941, 0.000000, 1.000000}, // - 233
	{0.082745, 0.004209, -0.002878, 89.675476, 88.981941, 0.000000, 1.000000}, // - 234
	{0.057909, 0.021331, -0.002878, 89.675476, 88.981941, 0.000000, 1.000000}, // - 235
	{0.079016, 0.021331, -0.000419, 89.675476, 77.678733, 0.000000, 1.000000}, // - 236
	{0.074572, 0.021331, -0.000419, 89.675476, 84.527442, 0.000000, 1.000000}, // - 237
	{0.074572, 0.038346, -0.001500, 89.675476, 84.527442, 0.000000, 1.000000}, // - 238
	{0.111645, 0.011549, 0.006237, 89.675476, 84.527442, 0.000000, 1.000000},  // - 239
	{0.090766, 0.044221, -0.000423, 89.675476, 89.461883, 0.000000, 1.000000}, // - 240
	{0.069491, 0.049021, -0.000423, 89.675476, 89.461883, 0.000000, 1.000000}, // - 241
	{0.059706, 0.031911, -0.000423, 89.675476, 89.461883, 0.000000, 1.000000}, // - 242
	{0.065242, 0.031911, -0.000423, 89.675476, 89.461883, 0.000000, 1.000000}, // - 243
	{0.065242, 0.051077, -0.001103, 89.675476, 89.461883, 0.000000, 1.000000}, // - 244
	{0.082393, 0.038233, 0.000410, 89.675476, 89.461883, 0.000000, 1.000000},  // - 245
	{0.079338, 0.044859, -0.002535, 89.675476, 89.461883, 0.000000, 1.000000}, // - 246
	{0.101566, 0.037019, 0.000750, 89.675476, 83.514060, 0.000000, 1.000000},  // - 247
	{0.091887, 0.047776, -0.000040, 89.675476, 83.514060, 0.000000, 1.000000}, // - 248
	{0.089745, 0.044044, 0.004071, 89.675476, 83.514060, 0.000000, 1.000000},  // - 249
	{0.094214, 0.044044, -0.007274, 89.675476, 83.514060, 0.000000, 1.000000}, // - 250
	{0.072282, 0.044044, -0.001468, 89.675476, 90.444763, 0.000000, 1.000000}, // - 251
	{0.095764, 0.034224, -0.000264, 89.675476, 82.959915, 0.000000, 1.000000}, // - 252
	{0.087454, 0.026208, -0.000264, 89.675476, 82.959915, 0.000000, 1.000000}, // - 253
	{0.099198, 0.037362, -0.000264, 89.675476, 82.959915, 0.000000, 1.000000}, // - 254
	{0.070845, 0.019943, 0.003505, 89.675476, 73.529716, 0.000000, 1.000000},  // - 255
	{0.065373, 0.033656, -0.001141, 89.675476, 83.002151, 0.000000, 1.000000}, // - 256
	{0.070077, 0.033656, -0.001141, 89.675476, 83.002151, 0.000000, 1.000000}, // - 257
	{0.089536, 0.041904, 0.000715, 89.675476, 83.002151, 0.000000, 1.000000},  // - 258
	{0.084822, 0.041904, 0.000715, 89.675476, 83.002151, 0.000000, 1.000000},  // - 259
	{0.093009, 0.031491, -0.001568, 89.675476, 83.002151, 0.000000, 1.000000}, // - 260
	{0.093009, 0.015023, -0.001477, 89.675476, 83.002151, 0.000000, 1.000000}, // - 261
	{0.076580, 0.039782, -0.001477, 89.675476, 88.620780, 0.000000, 1.000000}, // - 262
	{0.076580, 0.028967, -0.001477, 89.675476, 88.620780, 0.000000, 1.000000}, // - 263
	{0.075424, 0.043059, -0.001477, 89.675476, 88.620780, 0.000000, 1.000000}, // - 264
	{0.089655, 0.021726, -0.001477, 89.675476, 88.620780, 0.000000, 1.000000}, // - 265
	{0.096792, 0.014114, -0.003062, 89.675476, 85.166038, 0.000000, 1.000000}, // - 266
	{0.094886, 0.024989, -0.003184, 89.675476, 85.166038, 0.000000, 1.000000}, // - 267
	{0.094886, 0.024989, -0.003184, 89.675476, 85.166038, 0.000000, 1.000000}, // - 268
	{0.102252, 0.024989, -0.003184, 89.675476, 85.166038, 0.000000, 1.000000}, // - 269
	{0.102252, 0.024989, 0.000529, 89.675476, 85.166038, 0.000000, 1.000000},  // - 270
	{0.096134, 0.025462, 0.000529, 89.675476, 79.225112, 0.000000, 1.000000},  // - 271
	{0.099226, 0.032663, 0.000529, 89.675476, 79.225112, 0.000000, 1.000000},  // - 272
	{0.080779, 0.028227, -0.001415, 281.516479, 91.776855, 167.551193, 1.061396}, // - 273
	{0.089833, 0.022466, -0.001590, 89.675476, 88.636062, 0.000000, 1.000000}, // - 274
	{0.089833, 0.022466, -0.001590, 89.675476, 88.636062, 0.000000, 1.000000}, // - 275
	{0.089833, 0.022466, -0.001590, 89.675476, 88.636062, 0.000000, 1.000000}, // - 276
	{0.082718, 0.062596, -0.000201, 89.675476, 88.636062, 0.000000, 1.000000}, // - 277
	{0.082718, 0.062596, -0.000201, 89.675476, 88.636062, 0.000000, 1.000000}, // - 278
	{0.087652, 0.059379, -0.000201, 89.675476, 88.636062, 0.000000, 1.000000}, // - 279
	{0.087652, 0.023702, -0.003091, 89.675476, 88.636062, 0.000000, 1.000000}, // - 280
	{0.087652, 0.023702, -0.003091, 89.675476, 88.636062, 0.000000, 1.000000}, // - 281
	{0.090877, 0.026643, -0.003091, 89.675476, 88.636062, 0.000000, 1.000000}, // - 282
	{0.090877, 0.026643, -0.003091, 89.675476, 88.636062, 0.000000, 1.000000}, // - 283
	{0.090877, 0.053674, 0.009879, 89.675476, 88.636062, 0.000000, 1.000000},  // - 284
	{0.104320, 0.041487, 0.008021, 89.675476, 88.636062, 0.000000, 1.000000},  // - 285
	{0.087062, 0.021779, -0.003307, 89.675476, 88.636062, 0.000000, 1.000000}, // - 286
	{0.073173, 0.048856, 0.005337, 89.675476, 92.561180, 0.000000, 1.000000},  // - 287
	{0.090294, 0.027592, -0.003497, 89.675476, 92.561180, 0.000000, 1.000000}, // - 288
	{0.081684, 0.015000, 0.001780, 281.516479, 108.106758, 169.790878, 1.042815}, // - 289
	{0.086562, 0.042698, -0.000612, 89.675476, 92.561180, 0.000000, 1.000000}, // - 290
	{0.096768, 0.039233, -0.000612, 89.675476, 83.550270, 0.000000, 1.000000}, // - 291
	{0.079939, 0.020731, -0.005162, 89.675476, 83.550270, 0.000000, 1.000000}, // - 292
	{0.097107, 0.027826, -0.005162, 89.675476, 88.505996, 0.000000, 1.000000}, // - 293
	{0.097107, 0.037636, 0.000618, 89.675476, 88.505996, 0.000000, 1.000000},  // - 294
	{0.079985, 0.035006, -0.000826, 89.675476, 87.533462, 0.000000, 1.000000}, // - 295
	{0.088445, 0.024209, -0.002076, 89.675476, 73.285072, 0.000000, 1.000000}, // - 296
	{0.094039, 0.035411, 0.000490, 89.675476, 84.277572, 0.000000, 1.000000},  // - 297
	{0.099553, 0.024683, -0.002919, 89.675476, 84.277572, 0.000000, 1.000000}, // - 298
	{0.099553, 0.044356, -0.000285, 89.675476, 84.277572, 0.000000, 1.000000}  // - 299
};

new const Float:gCuffSkinData[][] = 
{
	{0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0}, // CJ - Does not work
	{-0.027999, 0.052999, -0.029999, -18.099925, -14.000000, 104.199928, 1.405999, 3.036000, 1.635999},
	{-0.015998, 0.021999, -0.029999, -18.099925, -14.000000, 104.199928, 1.157999, 2.612998, 1.561999},
	{-0.027999, 0.078998, -0.029999, -18.699926, 0.000000, 104.199928, 1.489999, 3.036000, 1.957998},
	{-0.027999, 0.078998, -0.029999, -18.699926, 0.000000, 104.199928, 1.982999, 3.036000, 2.327999},
	{-0.016998, 0.074999, -0.024000, -6.299927, -14.000000, 107.499961, 1.999999, 2.612998, 2.404001},
	{0.015001, 0.027999, -0.024000, -6.299927, -14.000000, 107.499961, 1.444999, 2.612998, 1.844001},
	{0.015001, 0.038999, -0.035000, -6.299927, -14.000000, 107.499961, 1.444999, 2.612998, 1.844001},
	{0.015001, 0.038999, -0.035000, -6.299927, -14.000000, 107.499961, 1.444999, 2.612998, 1.844001},
	{0.015001, 0.006999, -0.039000, -6.299927, -14.000000, 107.499961, 1.065999, 2.612998, 1.424002},
	{0.015001, 0.006999, -0.039000, -6.299927, -14.000000, 107.499961, 1.065999, 2.612998, 1.424002},
	{-0.013998, -0.005000, -0.013000, -6.299927, -14.000000, 107.499961, 0.773998, 2.612998, 1.419001},
	{-0.013998, -0.005000, -0.013000, -6.299927, -14.000000, 107.499961, 0.773998, 2.612998, 1.419001},
	{-0.013998, -0.005000, -0.013000, -6.299927, -14.000000, 107.499961, 0.773998, 2.612998, 1.419001},
	{-0.013998, 0.051999, -0.013000, -6.299927, -14.000000, 107.499961, 1.274998, 2.612998, 2.159001},
	{-0.013998, 0.025999, -0.023000, -6.299927, -14.000000, 107.499961, 1.124998, 2.612998, 2.016000},
	{-0.013998, 0.040999, -0.032000, -6.299927, -14.000000, 107.499961, 1.344999, 2.612998, 2.492002},
	{-0.013998, 0.040999, -0.032000, -6.299927, -14.000000, 107.499961, 1.344999, 2.612998, 2.492002},
	{-0.013998, 0.026999, -0.013000, -6.299927, -14.000000, 107.499961, 1.344999, 2.612998, 2.492002},
	{-0.013998, 0.026999, -0.013000, -6.299927, -14.000000, 107.499961, 1.344999, 2.612998, 2.492002},
	{-0.013998, 0.026999, -0.013000, -6.299927, -14.000000, 107.499961, 1.344999, 2.612998, 2.492002},
	{-0.013998, 0.026999, -0.013000, -6.299927, -14.000000, 107.499961, 1.344999, 2.612998, 2.492002},
	{-0.013998, 0.026999, -0.033000, -6.299927, -14.000000, 107.499961, 1.344999, 2.612998, 2.492002},
	{-0.013998, 0.060999, -0.033000, -6.299927, -14.000000, 107.499961, 1.344999, 2.612998, 2.492002},
	{-0.003998, 0.032999, -0.014000, -6.299927, -14.000000, 107.499961, 1.344999, 2.612998, 2.492002},
	{-0.002998, 0.028999, -0.021000, -6.299927, -14.000000, 107.499961, 1.525998, 2.612998, 2.492002},
	{-0.002998, 0.049999, -0.021000, -6.299927, -14.000000, 107.499961, 1.525998, 2.612998, 2.492002},
	{-0.002998, 0.033999, -0.021000, -6.299927, -14.000000, 107.499961, 1.316998, 2.612998, 1.977001},
	{-0.002998, 0.026999, -0.021000, -6.299927, -14.000000, 107.499961, 1.189998, 2.612998, 1.869001},
	{-0.002998, 0.040999, -0.018000, -6.299927, -14.000000, 107.499961, 1.189998, 2.612998, 1.869001},
	{-0.002998, 0.034999, -0.018000, -6.299927, -14.000000, 107.499961, 1.189998, 2.612998, 1.869001},
	{-0.006998, 0.020999, -0.039000, -6.299927, -14.000000, 107.499961, 0.971998, 2.612998, 1.627001},
	{-0.006998, 0.020999, -0.009000, -6.299927, -14.000000, 107.499961, 0.971998, 2.612998, 1.627001},
	{0.026001, 0.032999, -0.009000, -6.299927, -14.000000, 107.499961, 0.971998, 2.612998, 1.627001},
	{-0.013998, 0.053999, -0.009000, -6.299927, -14.000000, 107.499961, 1.330997, 2.612998, 2.222002},
	{-0.013998, 0.027999, -0.017000, -6.299927, -14.000000, 107.499961, 1.123997, 2.573997, 1.688002},
	{-0.013998, 0.027999, -0.017000, -6.299927, -14.000000, 107.499961, 1.123997, 2.573997, 1.688002},
	{-0.013998, 0.027999, -0.017000, -6.299927, -14.000000, 107.499961, 1.123997, 2.573997, 1.688002},
	{-0.013998, 0.027999, -0.038000, -6.299927, -14.000000, 107.499961, 1.123997, 2.573997, 1.688002},
	{0.006001, 0.027999, -0.038000, -6.299927, -14.000000, 107.499961, 1.123997, 2.573997, 1.688002},
	{0.006001, 0.011999, -0.010000, -6.299927, -14.000000, 107.499961, 0.872997, 2.573997, 1.168002},
	{0.006001, 0.011999, -0.010000, -6.299927, -14.000000, 107.499961, 0.872997, 2.573997, 1.168002},
	{0.006001, 0.026999, -0.024000, -6.299927, -14.000000, 107.499961, 1.147997, 2.573997, 1.755001},
	{0.006001, 0.021999, -0.012000, -6.299927, -14.000000, 107.499961, 0.928997, 2.573997, 1.435001},
	{0.006001, 0.035999, -0.012000, -6.299927, -14.000000, 107.499961, 1.044997, 2.573997, 1.554002},
	{0.006001, 0.035999, -0.012000, -6.299927, -14.000000, 107.499961, 1.044997, 2.573997, 1.554002},
	{0.006001, 0.035999, -0.012000, -6.299927, -14.000000, 107.499961, 1.044997, 2.573997, 1.554002},
	{0.006001, 0.035999, -0.012000, -6.299927, -14.000000, 107.499961, 1.044997, 2.573997, 1.554002},
	{0.006001, 0.035999, -0.012000, -6.299927, -14.000000, 107.499961, 1.044997, 2.573997, 1.554002},
	{-0.011998, 0.001999, -0.028000, -6.299927, -14.000000, 107.499961, 1.044997, 2.573997, 1.554002},
	{0.004001, 0.025999, -0.028000, -6.299927, -14.000000, 107.499961, 1.419997, 2.573997, 2.230002},
	{0.004001, 0.044999, -0.028000, -6.299927, -14.000000, 107.499961, 1.419997, 2.573997, 2.230002},
	{0.004001, 0.044999, -0.028000, -6.299927, -14.000000, 107.499961, 1.419997, 2.573997, 2.230002},
	{0.004001, 0.019999, -0.028000, -6.299927, -14.000000, 107.499961, 1.026996, 2.573997, 1.536001},
	{0.004001, 0.019999, -0.028000, -6.299927, -14.000000, 107.499961, 1.026996, 2.573997, 1.536001},
	{0.004001, 0.007999, -0.005000, -6.299927, -14.000000, 107.499961, 0.824997, 2.573997, 1.341000},
	{0.004001, 0.007999, -0.005000, -6.299927, -14.000000, 107.499961, 1.056996, 2.573997, 1.879001},
	{0.004001, 0.007999, -0.005000, -6.299927, -14.000000, 107.499961, 1.056996, 2.573997, 1.879001},
	{0.004001, 0.042999, -0.005000, -6.299927, -14.000000, 107.499961, 1.056996, 2.573997, 1.879001},
	{-0.024998, 0.026999, -0.025000, -6.299927, -14.000000, 107.499961, 1.056996, 2.573997, 1.879001},
	{-0.009998, 0.039999, -0.010000, -6.299927, -14.000000, 107.499961, 1.056996, 2.573997, 1.879001},
	{0.018001, 0.049999, -0.025000, -6.299927, -14.000000, 107.499961, 1.225996, 2.573997, 2.201001},
	{-0.009998, 0.075999, -0.024000, -10.599922, -26.000003, 106.999954, 1.591997, 2.573997, 2.532999},
	{-0.009998, 0.003999, -0.004000, -10.599922, -26.000003, 106.999954, 0.719997, 2.573997, 1.799999},
	{-0.009998, 0.003999, -0.004000, -10.599922, -26.000003, 106.999954, 0.719997, 2.573997, 1.799999},
	{-0.009998, 0.003999, -0.004000, -10.599922, -26.000003, 106.999954, 0.719997, 2.573997, 1.799999},
	{0.004001, 0.029999, -0.010000, -10.599922, -26.000003, 106.999954, 0.946997, 2.573997, 2.151999},
	{0.004001, 0.029999, -0.010000, -10.599922, -26.000003, 106.999954, 0.946997, 2.573997, 2.151999},
	{0.004001, 0.034999, -0.022000, -10.599922, -26.000003, 106.999954, 1.082998, 2.573997, 2.240000},
	{-0.020998, -0.009000, -0.022000, -10.599922, -26.000003, 106.999954, 0.945998, 2.573997, 1.684999},
	{0.023001, 0.041999, -0.020000, -10.599922, -26.000003, 106.999954, 1.308998, 2.573997, 2.138000},
	{-0.008998, 0.041999, -0.020000, -10.599922, -26.000003, 106.999954, 1.308998, 2.573997, 2.138000},
	{-0.008998, 0.050999, -0.020000, -10.599922, -26.000003, 106.999954, 1.308998, 2.573997, 2.138000},
	{-0.008998, 0.050999, -0.020000, -10.599922, -26.000003, 106.999954, 1.308998, 2.573997, 2.138000},
	{0.053000, 0.050999, -0.020000, -10.599922, -26.000003, 106.999954, 1.308998, 2.573997, 2.138000},
	{-0.023999, -0.010000, -0.020000, -10.599922, -26.000003, 106.999954, 1.308998, 2.573997, 2.138000},
	{0.027000, 0.006999, 0.003999, -10.599922, -26.000003, 106.999954, 1.308998, 2.573997, 2.138000},
	{0.027000, 0.039999, -0.026000, -10.599922, -26.000003, 106.999954, 1.308998, 2.573997, 2.138000},
	{0.027000, 0.039999, -0.026000, -10.599922, -26.000003, 106.999954, 1.308998, 2.573997, 2.138000},
	{0.027000, 0.039999, -0.026000, -10.599922, -26.000003, 106.999954, 1.308998, 2.573997, 2.138000},
	{0.027000, 0.039999, -0.026000, -10.599922, -26.000003, 106.999954, 1.308998, 2.573997, 2.138000},
	{0.027000, 0.039999, -0.026000, -10.599922, -26.000003, 106.999954, 1.308998, 2.573997, 2.138000},
	{0.027000, 0.039999, -0.026000, -10.599922, -26.000003, 106.999954, 1.308998, 2.573997, 2.138000},
	{0.027000, 0.039999, -0.026000, -10.599922, -26.000003, 106.999954, 1.308998, 2.573997, 2.138000},
	{0.027000, 0.039999, -0.026000, -10.599922, -26.000003, 106.999954, 1.308998, 2.573997, 2.138000},
	{0.027000, -0.012000, -0.026000, -10.599922, -26.000003, 106.999954, 1.308998, 2.573997, 2.138000},
	{0.027000, 0.040999, -0.026000, -10.599922, -26.000003, 106.999954, 1.308998, 2.573997, 2.138000},
	{-0.037999, -0.027000, -0.026000, -10.599922, -26.000003, 106.999954, 1.308998, 2.573997, 2.138000},
	{-0.011999, 0.018999, -0.038000, -10.599922, -26.000003, 106.999954, 1.308998, 2.573997, 2.138000},
	{-0.011999, 0.018999, -0.038000, -10.599922, -26.000003, 106.999954, 1.308998, 2.573997, 2.138000},
	{-0.011999, -0.000000, -0.038000, -10.599922, -26.000003, 106.999954, 1.308998, 2.573997, 2.138000},
	{-0.011999, 0.010999, -0.006000, -10.599922, -26.000003, 106.999954, 1.074998, 2.573997, 1.762999},
	{-0.011999, 0.010999, -0.006000, -10.599922, -26.000003, 106.999954, 1.074998, 2.573997, 1.762999},
	{-0.011999, -0.006000, -0.037000, -10.599922, -26.000003, 106.999954, 1.074998, 2.573997, 1.762999},
	{-0.011999, 0.007999, -0.037000, -10.599922, -26.000003, 106.999954, 1.074998, 2.573997, 1.762999},
	{-0.011999, 0.026999, -0.024000, -10.599922, -26.000003, 106.999954, 1.373998, 2.573997, 2.071999},
	{-0.011999, 0.050999, -0.024000, -10.599922, -26.000003, 106.999954, 1.373998, 2.573997, 2.071999},
	{-0.011999, 0.029999, -0.024000, -10.599922, -26.000003, 106.999954, 1.425998, 2.573997, 2.134999},
	{-0.011999, 0.029999, -0.024000, -10.599922, -26.000003, 106.999954, 1.425998, 2.573997, 2.134999},
	{-0.011999, 0.029999, -0.024000, -10.599922, -26.000003, 106.999954, 1.425998, 2.573997, 2.134999},
	{-0.011999, 0.023999, -0.024000, -10.599922, -26.000003, 106.999954, 1.425998, 2.573997, 2.134999},
	{0.007000, 0.023999, -0.024000, -10.599922, -26.000003, 106.999954, 1.425998, 2.573997, 2.134999},
	{0.006000, 0.043999, -0.000000, -10.599922, -26.000003, 106.999954, 1.231999, 2.573997, 1.906999},
	{0.006000, 0.109999, -0.041000, -10.599922, -26.000003, 106.999954, 2.172999, 2.573997, 2.635000},
	{0.004000, 0.046999, -0.004000, -10.599922, -26.000003, 106.999954, 1.382000, 2.573997, 2.559998},
	{-0.048999, 0.131999, -0.004000, -10.599922, -26.000003, 106.999954, 2.232000, 2.573997, 3.521998},
	{0.000000, 0.037999, -0.004000, -10.599922, -26.000003, 106.999954, 1.075000, 2.573997, 1.932999},
	{0.000000, 0.029999, -0.004000, -10.599922, -26.000003, 106.999954, 1.075000, 2.573997, 1.932999},
	{0.000000, 0.062999, -0.004000, -10.599922, -26.000003, 106.999954, 1.075000, 2.573997, 1.932999},
	{0.000000, 0.039999, -0.004000, -10.599922, -26.000003, 106.999954, 1.075000, 2.573997, 1.932999},
	{0.000000, 0.039999, -0.004000, -10.599922, -26.000003, 106.999954, 1.075000, 2.573997, 1.932999},
	{0.017000, 0.045999, -0.031000, -10.599922, -26.000003, 106.999954, 1.075000, 2.573997, 1.932999},
	{0.017000, 0.045999, -0.031000, -10.599922, -26.000003, 106.999954, 1.075000, 2.573997, 1.932999},
	{0.034000, 0.045999, -0.031000, -10.599922, -26.000003, 106.999954, 1.189000, 2.573997, 2.121999},
	{0.034000, 0.034999, -0.031000, -10.599922, -26.000003, 106.999954, 1.189000, 2.573997, 2.121999},
	{0.034000, 0.034999, -0.031000, -10.599922, -26.000003, 106.999954, 1.189000, 2.573997, 2.121999},
	{0.034000, 0.034999, -0.031000, -10.599922, -26.000003, 106.999954, 1.189000, 2.573997, 2.121999},
	{0.009000, 0.023999, -0.012000, -10.599922, -26.000003, 106.999954, 0.973000, 2.573997, 1.650999},
	{0.009000, 0.023999, -0.012000, -10.599922, -26.000003, 106.999954, 0.973000, 2.573997, 1.650999},
	{0.009000, 0.023999, -0.012000, -10.599922, -26.000003, 106.999954, 0.973000, 2.573997, 1.650999},
	{0.009000, 0.071999, -0.012000, -10.599922, -26.000003, 106.999954, 1.606999, 2.573997, 2.610999},
	{0.009000, 0.071999, -0.012000, -10.599922, -26.000003, 106.999954, 1.606999, 2.573997, 2.610999},
	{0.009000, 0.062999, -0.012000, -10.599922, -26.000003, 106.999954, 1.606999, 2.573997, 2.610999},
	{0.009000, 0.050999, -0.012000, -10.599922, -26.000003, 106.999954, 1.606999, 2.573997, 2.610999},
	{0.009000, 0.040999, -0.012000, -10.599922, -26.000003, 106.999954, 1.606999, 2.573997, 2.610999},
	{0.009000, 0.030999, -0.012000, -10.599922, -26.000003, 106.999954, 1.606999, 2.573997, 2.610999},
	{-0.000999, 0.035999, -0.026000, -10.599922, -26.000003, 106.999954, 1.606999, 2.573997, 2.610999},
	{-0.000999, 0.064999, -0.026000, -10.599922, -26.000003, 106.999954, 1.606999, 2.573997, 2.610999},
	{-0.000999, 0.064999, -0.026000, -10.599922, -26.000003, 106.999954, 1.606999, 2.573997, 2.610999},
	{-0.000999, 0.015999, -0.020000, -10.599922, -26.000003, 106.999954, 1.203999, 2.573997, 2.227999},
	{-0.013999, 0.029999, -0.029000, -10.599922, -26.000003, 106.999954, 1.203999, 2.573997, 2.227999},
	{-0.013999, 0.002999, -0.029000, -10.599922, -26.000003, 106.999954, 1.203999, 2.573997, 2.227999},
	{-0.013999, 0.034999, -0.018000, -10.599922, -26.000003, 106.999954, 1.203999, 2.573997, 1.778998},
	{-0.013999, 0.050999, -0.018000, -10.599922, -26.000003, 106.999954, 1.203999, 2.573997, 1.778998},
	{-0.013999, 0.038999, -0.018000, -10.599922, -26.000003, 106.999954, 1.203999, 2.573997, 1.778998},
	{0.008000, 0.038999, -0.018000, -10.599922, -26.000003, 106.999954, 1.400999, 2.573997, 2.047998},
	{0.008000, 0.038999, -0.018000, -10.599922, -26.000003, 106.999954, 1.400999, 2.573997, 2.047998},
	{0.008000, 0.030999, -0.002000, -10.599922, -26.000003, 106.999954, 1.117999, 2.573997, 1.710999},
	{0.008000, 0.010999, -0.002000, -10.599922, -26.000003, 106.999954, 1.117999, 2.573997, 1.710999},
	{0.008000, 0.010999, -0.002000, -10.599922, -26.000003, 106.999954, 1.117999, 2.573997, 1.710999},
	{0.008000, 0.010999, -0.002000, -10.599922, -26.000003, 106.999954, 1.117999, 2.573997, 1.710999},
	{0.008000, 0.010999, -0.002000, -10.599922, -26.000003, 106.999954, 1.117999, 2.573997, 1.710999},
	{0.008000, 0.038999, -0.002000, -10.599922, -26.000003, 106.999954, 1.117999, 2.573997, 1.710999},
	{0.008000, 0.038999, -0.002000, -10.599922, -26.000003, 106.999954, 1.314999, 2.573997, 2.124999},
	{0.008000, 0.038999, -0.002000, -10.599922, -26.000003, 106.999954, 1.314999, 2.573997, 2.124999},
	{0.008000, 0.017999, -0.002000, -10.599922, -26.000003, 106.999954, 1.314999, 2.573997, 2.124999},
	{0.008000, 0.058999, -0.002000, -10.599922, -26.000003, 106.999954, 1.314999, 2.573997, 2.124999},
	{0.008000, 0.053999, -0.002000, -10.599922, -26.000003, 106.999954, 1.314999, 2.573997, 2.124999},
	{0.008000, 0.023999, -0.002000, -10.599922, -26.000003, 106.999954, 1.314999, 2.573997, 2.124999},
	{0.008000, 0.047999, -0.015000, -10.599922, -26.000003, 106.999954, 1.314999, 2.573997, 2.124999},
	{0.008000, 0.019999, -0.015000, -10.599922, -26.000003, 106.999954, 1.067999, 2.573997, 1.860999},
	{0.008000, 0.027999, -0.015000, -10.599922, -26.000003, 106.999954, 1.067999, 2.573997, 1.860999},
	{-0.008999, -0.002000, -0.028000, -10.599922, -26.000003, 106.999954, 1.067999, 2.573997, 1.860999},
	{-0.008999, 0.044999, -0.028000, -10.599922, -26.000003, 106.999954, 1.067999, 2.573997, 1.860999},
	{-0.008999, 0.029999, -0.028000, -10.599922, -26.000003, 106.999954, 1.067999, 2.573997, 1.860999},
	{-0.008999, 0.029999, -0.028000, -10.599922, -26.000003, 106.999954, 1.067999, 2.573997, 1.860999},
	{-0.008999, 0.051999, -0.028000, -10.599922, -26.000003, 106.999954, 1.271999, 2.573997, 2.094999},
	{-0.008999, 0.002999, -0.028000, -10.599922, -26.000003, 106.999954, 0.653999, 2.573997, 1.504999},
	{-0.008999, 0.046999, -0.028000, -10.599922, -26.000003, 106.999954, 1.552998, 2.573997, 2.796000},
	{-0.008999, 0.020999, -0.008000, -10.599922, -26.000003, 106.999954, 1.064998, 2.573997, 2.115999},
	{-0.008999, 0.025999, -0.008000, -10.599922, -26.000003, 106.999954, 1.064998, 2.573997, 2.115999},
	{-0.008999, 0.025999, -0.008000, -10.599922, -26.000003, 106.999954, 1.064998, 2.573997, 2.115999},
	{-0.018999, 0.025999, -0.014000, -10.599922, -26.000003, 106.999954, 1.064998, 2.573997, 2.115999},
	{-0.018999, 0.042999, -0.014000, -10.599922, -26.000003, 106.999954, 1.328998, 2.573997, 2.533999},
	{-0.018999, 0.042999, -0.014000, -10.599922, -26.000003, 106.999954, 1.328998, 2.573997, 2.533999},
	{-0.018999, -0.006000, -0.045000, -10.599922, -26.000003, 106.999954, 0.907998, 2.573997, 1.861999},
	{-0.018999, -0.006000, -0.045000, -10.599922, -26.000003, 106.999954, 0.907998, 2.573997, 1.861999},
	{-0.018999, 0.027999, -0.045000, -10.599922, -26.000003, 106.999954, 1.306998, 2.573997, 2.221999},
	{-0.018999, 0.013999, -0.045000, -10.599922, -26.000003, 106.999954, 1.306998, 2.573997, 2.221999},
	{-0.018999, 0.000999, -0.045000, -10.599922, -26.000003, 106.999954, 1.090998, 2.573997, 1.614999},
	{-0.018999, 0.026999, -0.045000, -10.599922, -26.000003, 106.999954, 1.328998, 2.573997, 2.105999},
	{-0.018999, 0.018999, -0.045000, -10.599922, -26.000003, 106.999954, 1.328998, 2.573997, 2.105999},
	{-0.018999, -0.017000, -0.045000, -10.599922, -26.000003, 106.999954, 1.085998, 2.573997, 1.653999},
	{-0.018999, 0.030999, -0.023999, -10.599922, -26.000003, 106.999954, 1.546998, 2.573997, 2.329000},
	{-0.018999, 0.030999, -0.023999, -10.599922, -26.000003, 106.999954, 1.546998, 2.573997, 2.329000},
	{-0.018999, 0.030999, -0.023999, -10.599922, -26.000003, 106.999954, 1.546998, 2.573997, 2.329000},
	{-0.018999, 0.030999, -0.023999, -10.599922, -26.000003, 106.999954, 1.546998, 2.573997, 2.329000},
	{-0.018999, 0.030999, -0.023999, -10.599922, -26.000003, 106.999954, 1.546998, 2.573997, 2.329000},
	{-0.018999, -0.003000, -0.023999, -10.599922, -26.000003, 106.999954, 1.129998, 2.573997, 2.010000},
	{-0.018999, 0.027999, -0.023999, -10.599922, -26.000003, 106.999954, 1.129998, 2.573997, 2.010000},
	{-0.018999, 0.027999, -0.023999, -10.599922, -26.000003, 106.999954, 1.129998, 2.573997, 2.010000},
	{-0.018999, 0.047999, -0.023999, -10.599922, -26.000003, 106.999954, 1.502998, 2.573997, 2.519000},
	{-0.018999, 0.030999, -0.023999, -10.599922, -26.000003, 106.999954, 1.502998, 2.573997, 2.519000},
	{-0.018999, 0.030999, -0.023999, -10.599922, -26.000003, 106.999954, 1.502998, 2.573997, 2.519000},
	{-0.018999, 0.030999, -0.023999, -10.599922, -26.000003, 106.999954, 1.502998, 2.573997, 2.519000},
	{-0.018999, 0.030999, -0.023999, -10.599922, -26.000003, 106.999954, 1.502998, 2.573997, 2.519000},
	{0.024000, 0.043999, -0.023999, -10.599922, -26.000003, 106.999954, 1.502998, 2.573997, 2.519000},
	{0.024000, 0.043999, -0.023999, -10.599922, -26.000003, 106.999954, 1.502998, 2.573997, 2.519000},
	{0.012000, 0.043999, -0.023999, -10.599922, -26.000003, 106.999954, 1.502998, 2.573997, 2.519000},
	{-0.010999, 0.023999, -0.023999, -10.599922, -26.000003, 106.999954, 1.332998, 2.573997, 2.051000},
	{-0.001999, 0.010999, -0.020999, -10.599922, -26.000003, 106.999954, 0.949998, 2.573997, 2.051000},
	{-0.001999, 0.021999, -0.010999, -10.599922, -26.000003, 106.999954, 0.949998, 2.573997, 1.658000},
	{-0.001999, 0.021999, -0.010999, -10.599922, -26.000003, 106.999954, 0.949998, 2.573997, 1.658000},
	{-0.001999, 0.021999, -0.010999, -10.599922, -26.000003, 106.999954, 0.949998, 2.573997, 1.658000},
	{-0.001999, 0.021999, -0.010999, -10.599922, -26.000003, 106.999954, 0.949998, 2.573997, 1.658000},
	{-0.001999, 0.021999, -0.010999, -10.599922, -26.000003, 106.999954, 0.949998, 2.573997, 1.658000},
	{-0.001999, 0.021999, -0.010999, -10.599922, -26.000003, 106.999954, 0.949998, 2.573997, 1.658000},
	{-0.001999, 0.021999, -0.010999, -10.599922, -26.000003, 106.999954, 0.949998, 2.573997, 1.658000},
	{-0.001999, 0.021999, -0.010999, -10.599922, -26.000003, 106.999954, 0.949998, 2.573997, 1.658000},
	{-0.001999, 0.021999, -0.010999, -10.599922, -26.000003, 106.999954, 0.949998, 2.573997, 1.658000},
	{-0.001999, 0.055999, -0.010999, -10.599922, -26.000003, 106.999954, 1.488999, 2.573997, 2.591001},
	{-0.001999, 0.018999, -0.010999, -10.599922, -26.000003, 106.999954, 0.995998, 2.573997, 1.734001},
	{-0.001999, 0.050999, -0.010999, -10.599922, -26.000003, 106.999954, 1.318998, 2.573997, 2.427001},
	{0.016000, 0.032999, -0.010999, -10.599922, -26.000003, 106.999954, 1.318998, 2.573997, 2.649002},
	{0.016000, 0.032999, -0.010999, -10.599922, -26.000003, 106.999954, 1.318998, 2.573997, 2.649002},
	{0.016000, 0.032999, -0.010999, -10.599922, -26.000003, 106.999954, 1.318998, 2.573997, 2.649002},
	{0.016000, 0.063999, -0.010999, -10.599922, -26.000003, 106.999954, 1.318998, 2.573997, 2.649002},
	{-0.012999, 0.008999, -0.010999, -10.599922, -26.000003, 106.999954, 0.782998, 2.573997, 1.527001},
	{0.035000, 0.019999, -0.010999, -10.599922, -26.000003, 106.999954, 1.023998, 2.573997, 2.074001},
	{0.035000, 0.030999, -0.010999, -10.599922, -26.000003, 106.999954, 1.023998, 2.573997, 2.074001},
	{0.035000, 0.030999, -0.010999, -10.599922, -26.000003, 106.999954, 1.023998, 2.573997, 2.074001},
	{-0.019999, 0.000999, -0.010999, -10.599922, -26.000003, 106.999954, 1.023998, 2.573997, 2.074001},
	{-0.019999, 0.027999, -0.010999, -10.599922, -26.000003, 106.999954, 1.285998, 2.573997, 2.470001},
	{-0.019999, 0.027999, -0.010999, -10.599922, -26.000003, 106.999954, 1.285998, 2.573997, 2.470001},
	{-0.019999, 0.013999, -0.010999, -10.599922, -26.000003, 106.999954, 0.957997, 2.573997, 1.784001},
	{0.005000, 0.013999, -0.010999, -10.599922, -26.000003, 106.999954, 1.263998, 2.573997, 2.263001},
	{0.005000, 0.013999, -0.010999, -10.599922, -26.000003, 106.999954, 1.263998, 2.573997, 2.263001},
	{0.005000, 0.058999, -0.010999, -10.599922, -26.000003, 106.999954, 1.263998, 2.573997, 2.263001},
	{0.005000, 0.025999, -0.040999, -10.599922, -26.000003, 106.999954, 0.959998, 2.573997, 1.387001},
	{0.005000, 0.009999, -0.040999, -10.599922, -26.000003, 106.999954, 0.959998, 2.573997, 1.387001},
	{0.005000, 0.041999, -0.013999, -10.599922, -26.000003, 106.999954, 1.294998, 2.573997, 2.168000},
	{0.005000, 0.063999, -0.013999, -10.599922, -26.000003, 106.999954, 1.294998, 2.573997, 2.168000},
	{0.005000, 0.063999, -0.013999, -10.599922, -26.000003, 106.999954, 1.294998, 2.573997, 2.168000},
	{-0.032999, 0.023999, -0.013999, -10.599922, -26.000003, 106.999954, 1.294998, 2.573997, 2.168000},
	{-0.032999, 0.004999, -0.013999, -10.599922, -26.000003, 106.999954, 1.294998, 2.573997, 2.168000},
	{-0.032999, 0.004999, -0.013999, -10.599922, -26.000003, 106.999954, 1.294998, 2.573997, 2.168000},
	{-0.032999, 0.004999, -0.013999, -10.599922, -26.000003, 106.999954, 1.294998, 2.573997, 2.168000},
	{0.010000, 0.004999, -0.034999, -10.599922, -26.000003, 106.999954, 1.294998, 2.573997, 2.168000},
	{0.010000, 0.004999, -0.034999, -10.599922, -26.000003, 106.999954, 1.294998, 2.573997, 2.168000},
	{0.010000, 0.029999, -0.034999, -10.599922, -26.000003, 106.999954, 0.933998, 2.573997, 1.888000},
	{0.010000, 0.037999, -0.011999, -10.599922, -26.000003, 106.999954, 1.043997, 2.573997, 2.135000},
	{0.010000, 0.037999, -0.011999, -10.599922, -26.000003, 106.999954, 1.043997, 2.573997, 2.135000},
	{0.010000, 0.037999, -0.011999, -10.599922, -26.000003, 106.999954, 1.043997, 2.573997, 2.135000},
	{0.010000, 0.001999, -0.011999, -10.599922, -26.000003, 106.999954, 1.043997, 2.573997, 2.135000},
	{-0.006999, 0.038999, -0.011999, -10.599922, -26.000003, 106.999954, 1.043997, 2.573997, 2.135000},
	{-0.006999, 0.030999, -0.011999, -10.599922, -26.000003, 106.999954, 1.043997, 2.573997, 2.135000},
	{-0.006999, 0.030999, -0.011999, -10.599922, -26.000003, 106.999954, 1.043997, 2.573997, 2.135000},
	{-0.022999, 0.008999, -0.011999, -10.599922, -26.000003, 106.999954, 1.043997, 2.573997, 2.135000},
	{-0.022999, 0.008999, -0.011999, -10.599922, -26.000003, 106.999954, 1.043997, 2.573997, 2.135000},
	{-0.022999, 0.027999, -0.011999, -10.599922, -26.000003, 106.999954, 1.431997, 2.573997, 2.910001},
	{-0.022999, 0.027999, -0.011999, -10.599922, -26.000003, 106.999954, 1.431997, 2.573997, 2.910001},
	{-0.022999, 0.027999, -0.011999, -10.599922, -26.000003, 106.999954, 1.431997, 2.573997, 2.910001},
	{-0.022999, 0.027999, -0.011999, -10.599922, -26.000003, 106.999954, 1.431997, 2.573997, 2.910001},
	{-0.022999, 0.008999, -0.011999, -10.599922, -26.000003, 106.999954, 0.837997, 2.573997, 2.142000},
	{-0.022999, -0.025000, -0.011999, -10.599922, -26.000003, 106.999954, 0.837997, 2.573997, 2.142000},
	{-0.022999, 0.026999, -0.011999, -10.599922, -26.000003, 106.999954, 1.562997, 2.573997, 2.611000},
	{-0.022999, -0.015000, -0.011999, -10.599922, -26.000003, 106.999954, 0.991997, 2.573997, 1.622996},
	{-0.022999, 0.036999, -0.025999, -10.599922, -26.000003, 106.999954, 1.304997, 2.573997, 1.857996},
	{-0.022999, 0.021999, -0.025999, -10.599922, -26.000003, 106.999954, 1.304997, 2.573997, 1.857996},
	{-0.022999, 0.021999, -0.025999, -10.599922, -26.000003, 106.999954, 1.743997, 2.573997, 2.624996},
	{-0.022999, 0.044999, -0.025999, -10.599922, -26.000003, 106.999954, 1.414997, 2.573997, 1.979995},
	{-0.022999, 0.008999, -0.025999, -10.599922, -26.000003, 106.999954, 0.964996, 2.573997, 1.467995},
	{-0.022999, 0.053999, -0.025999, -10.599922, -26.000003, 106.999954, 1.693996, 2.573997, 2.664995},
	{-0.022999, 0.023999, -0.004999, -10.599922, -26.000003, 106.999954, 1.166996, 2.573997, 2.171994},
	{-0.022999, 0.040999, -0.004999, -10.599922, -26.000003, 106.999954, 1.212996, 2.573997, 2.383994},
	{-0.022999, 0.040999, -0.004999, -10.599922, -26.000003, 106.999954, 1.212996, 2.573997, 2.383994},
	{-0.022999, -0.008000, -0.004999, -10.599922, -26.000003, 106.999954, 1.212996, 2.573997, 2.383994},
	{-0.022999, -0.008000, -0.004999, -10.599922, -26.000003, 106.999954, 1.212996, 2.573997, 2.383994},
	{-0.022999, 0.061999, -0.020999, -10.599922, -26.000003, 106.999954, 1.212996, 2.573997, 2.383994},
	{-0.022999, 0.061999, -0.020999, -10.599922, -26.000003, 106.999954, 1.212996, 2.573997, 2.383994},
	{-0.022999, 0.026999, -0.020999, -10.599922, -26.000003, 106.999954, 1.212996, 2.573997, 2.383994},
	{-0.022999, 0.026999, -0.020999, -10.599922, -26.000003, 106.999954, 1.212996, 2.573997, 2.383994},
	{-0.022999, 0.026999, -0.020999, -10.599922, -26.000003, 106.999954, 1.212996, 2.573997, 2.383994},
	{-0.022999, 0.001999, -0.020999, -10.599922, -26.000003, 106.999954, 1.212996, 2.573997, 2.383994},
	{-0.022999, 0.023999, -0.020999, -10.599922, -26.000003, 106.999954, 1.212996, 2.573997, 2.383994},
	{-0.022999, 0.023999, -0.020999, -10.599922, -26.000003, 106.999954, 1.212996, 2.573997, 2.383994},
	{-0.022999, 0.023999, -0.020999, -10.599922, -26.000003, 106.999954, 1.212996, 2.573997, 2.383994},
	{-0.022999, -0.006000, -0.020999, -10.599922, -26.000003, 106.999954, 1.212996, 2.573997, 2.383994},
	{-0.022999, 0.031999, -0.020999, -10.599922, -26.000003, 106.999954, 1.212996, 2.573997, 2.383994},
	{-0.022999, 0.046999, -0.020999, -10.599922, -26.000003, 106.999954, 1.563997, 2.573997, 2.764994},
	{-0.022999, 0.032999, -0.020999, -10.599922, -26.000003, 106.999954, 1.175997, 2.573997, 2.325994},
	{-0.022999, 0.032999, -0.020999, -10.599922, -26.000003, 106.999954, 1.175997, 2.573997, 2.325994},
	{0.031000, 0.066999, -0.020999, -10.599922, -26.000003, 106.999954, 1.505997, 2.573997, 2.687994},
	{-0.001999, -0.005000, -0.020999, -10.599922, -26.000003, 106.999954, 0.748999, 2.573997, 1.579993},
	{-0.001999, 0.037999, -0.020999, -10.599922, -26.000003, 106.999954, 0.987999, 2.573997, 2.194994},
	{-0.001999, 0.037999, -0.020999, -10.599922, -26.000003, 106.999954, 0.987999, 2.573997, 2.194994},
	{-0.001999, 0.037999, -0.020999, -10.599922, -26.000003, 106.999954, 0.987999, 2.573997, 2.194994},
	{-0.001999, 0.037999, -0.020999, -10.599922, -26.000003, 106.999954, 1.146999, 2.573997, 2.483994},
	{-0.001999, 0.037999, -0.020999, -10.599922, -26.000003, 106.999954, 1.146999, 2.573997, 2.483994},
	{-0.001999, 0.037999, -0.020999, -10.599922, -26.000003, 106.999954, 1.146999, 2.573997, 2.483994},
	{-0.001999, 0.037999, -0.020999, -10.599922, -26.000003, 106.999954, 1.146999, 2.573997, 2.483994},
	{-0.001999, 0.037999, -0.020999, -10.599922, -26.000003, 106.999954, 1.146999, 2.573997, 2.483994},
	{-0.001999, 0.037999, -0.020999, -10.599922, -26.000003, 106.999954, 1.146999, 2.573997, 2.483994},
	{-0.001999, 0.037999, -0.020999, -10.599922, -26.000003, 106.999954, 1.146999, 2.573997, 2.483994},
	{-0.001999, 0.018999, -0.020999, -10.599922, -26.000003, 106.999954, 1.146999, 2.573997, 2.483994},
	{-0.001999, 0.018999, -0.020999, -10.599922, -26.000003, 106.999954, 1.146999, 2.573997, 2.483994},
	{-0.001999, 0.046999, -0.020999, -10.599922, -26.000003, 106.999954, 1.146999, 2.573997, 2.483994},
	{-0.001999, 0.046999, -0.020999, -10.599922, -26.000003, 106.999954, 1.146999, 2.573997, 2.483994},
	{-0.001999, 0.046999, -0.020999, -10.599922, -26.000003, 106.999954, 1.146999, 2.573997, 2.483994},
	{-0.001999, 0.046999, -0.020999, -10.599922, -26.000003, 106.999954, 1.146999, 2.573997, 2.483994},
	{-0.001999, 0.042999, -0.020999, -10.599922, -26.000003, 106.999954, 1.146999, 2.573997, 2.483994},
	{-0.001999, 0.026999, -0.020999, -10.599922, -26.000003, 106.999954, 1.146999, 2.573997, 2.483994},
	{-0.001999, 0.058999, -0.020999, -10.599922, -26.000003, 106.999954, 1.146999, 2.573997, 2.483994},
	{-0.001999, 0.029999, -0.020999, -10.599922, -26.000003, 106.999954, 1.146999, 2.573997, 2.483994},
	{-0.001999, 0.029999, -0.020999, -10.599922, -26.000003, 106.999954, 1.146999, 2.573997, 2.483994},
	{-0.001999, -0.001000, -0.020999, -10.599922, -26.000003, 106.999954, 1.146999, 2.573997, 2.483994},
	{-0.001999, -0.001000, -0.020999, -10.599922, -26.000003, 106.999954, 1.146999, 2.573997, 2.483994},
	{-0.001999, 0.027999, -0.020999, -10.599922, -26.000003, 106.999954, 1.146999, 2.573997, 2.483994},
	{-0.001999, 0.011999, -0.020999, -10.599922, -26.000003, 106.999954, 1.146999, 2.573997, 2.483994},
	{-0.001999, 0.044999, -0.020999, -10.599922, -26.000003, 106.999954, 1.146999, 2.573997, 2.483994}
};

new const PlayerColors[200] = 
{
	0xFF8C13FF,0xC715FFFF,0x20B2AAFF,0xDC143CFF,0x6495EDFF,0xf0e68cFF,0x778899FF,0xFF1493FF,0xF4A460FF,
	0xEE82EEFF,0xFFD720FF,0x8b4513FF,0x4949A0FF,0x148b8bFF,0x14ff7fFF,0x556b2fFF,0x0FD9FAFF,0x10DC29FF,
	0x534081FF,0x0495CDFF,0xEF6CE8FF,0xBD34DAFF,0x247C1BFF,0x0C8E5DFF,0x635B03FF,0xCB7ED3FF,0x65ADEBFF,
	0x5C1ACCFF,0xF2F853FF,0x11F891FF,0x7B39AAFF,0x53EB10FF,0x54137DFF,0x275222FF,0xF09F5BFF,0x3D0A4FFF,
	0x22F767FF,0xD63034FF,0x9A6980FF,0xDFB935FF,0x3793FAFF,0x90239DFF,0xE9AB2FFF,0xAF2FF3FF,0x057F94FF,
	0xB98519FF,0x388EEAFF,0x028151FF,0xA55043FF,0x0DE018FF,0x93AB1CFF,0x95BAF0FF,0x369976FF,0x18F71FFF,
	0x4B8987FF,0x491B9EFF,0x829DC7FF,0xBCE635FF,0xCEA6DFFF,0x20D4ADFF,0x2D74FDFF,0x3C1C0DFF,0x12D6D4FF,
	0x48C000FF,0x2A51E2FF,0xE3AC12FF,0xFC42A8FF,0x2FC827FF,0x1A30BFFF,0xB740C2FF,0x42ACF5FF,0x2FD9DEFF,
	0xFAFB71FF,0x05D1CDFF,0xC471BDFF,0x94436EFF,0xC1F7ECFF,0xCE79EEFF,0xBD1EF2FF,0x93B7E4FF,0x3214AAFF,
	0x184D3BFF,0xAE4B99FF,0x7E49D7FF,0x4C436EFF,0xFA24CCFF,0xCE76BEFF,0xA04E0AFF,0x9F945CFF,0xDCDE3DFF,
	0x10C9C5FF,0x70524DFF,0x0BE472FF,0x8A2CD7FF,0x6152C2FF,0xCF72A9FF,0xE59338FF,0xEEDC2DFF,0xD8C762FF,
	0xD8C762FF,0xFF8C13FF,0xC715FFFF,0x20B2AAFF,0xDC143CFF,0x6495EDFF,0xf0e68cFF,0x778899FF,0xFF1493FF,
	0xF4A460FF,0xEE82EEFF,0xFFD720FF,0x8b4513FF,0x4949A0FF,0x148b8bFF,0x14ff7fFF,0x556b2fFF,0x0FD9FAFF,
	0x10DC29FF,0x534081FF,0x0495CDFF,0xEF6CE8FF,0xBD34DAFF,0x247C1BFF,0x0C8E5DFF,0x635B03FF,0xCB7ED3FF,
	0x65ADEBFF,0x5C1ACCFF,0xF2F853FF,0x11F891FF,0x7B39AAFF,0x53EB10FF,0x54137DFF,0x275222FF,0xF09F5BFF,
	0x3D0A4FFF,0x22F767FF,0xD63034FF,0x9A6980FF,0xDFB935FF,0x3793FAFF,0x90239DFF,0xE9AB2FFF,0xAF2FF3FF,
	0x057F94FF,0xB98519FF,0x388EEAFF,0x028151FF,0xA55043FF,0x0DE018FF,0x93AB1CFF,0x95BAF0FF,0x369976FF,
	0x18F71FFF,0x4B8987FF,0x491B9EFF,0x829DC7FF,0xBCE635FF,0xCEA6DFFF,0x20D4ADFF,0x2D74FDFF,0x3C1C0DFF,
	0x12D6D4FF,0x48C000FF,0x2A51E2FF,0xE3AC12FF,0xFC42A8FF,0x2FC827FF,0x1A30BFFF,0xB740C2FF,0x42ACF5FF,
	0x2FD9DEFF,0xFAFB71FF,0x05D1CDFF,0xC471BDFF,0x94436EFF,0xC1F7ECFF,0xCE79EEFF,0xBD1EF2FF,0x93B7E4FF,
	0x3214AAFF,0x184D3BFF,0xAE4B99FF,0x7E49D7FF,0x4C436EFF,0xFA24CCFF,0xCE76BEFF,0xA04E0AFF,0x9F945CFF,
	0xDCDE3DFF,0x10C9C5FF,0x70524DFF,0x0BE472FF,0x8A2CD7FF,0x6152C2FF,0xCF72A9FF,0xE59338FF,0xEEDC2DFF,
	0xD8C762FF,0xD8C762FF
};

enum _:vInfo
{
	vName [32 char],
	vMaxSpeed,
	vTrunkSize,
	vPrice,
	vPriceLT,
	vWeight
};

new const VehicleInfo[][vInfo] =
{
	{!"Landstalker", 140,60,30000,15, 1700},
	{!"Bravura", 131, 30,20000,10, 1300},
	{!"Buffalo", 166, 20,80000,40, 1500},
	{!"Linerunner", 98, 0,0,0, 3800},
	{!"Pereniel", 118, 120,20000,10, 1200},
	{!"Sentinel", 146, 40,40000,20, 1600},
	{!"Dumper", 98, 0,0,0, 20000},
	{!"Firetruck", 132, 0,0,0, 6500},
	{!"Trashmaster", 89, 0,0,0, 5500},
	{!"Limuzinas", 140, 40,40000,20, 2200},
	{!"Manana", 115, 30,30000,15, 1000},
	{!"Infernus", 197, 15,300000,150, 1400},
	{!"Voodoo", 150, 50,30000,15, 1800},
	{!"Pony", 98, 300,20000,10, 2600},
	{!"Mule", 94, 800,30000,15, 3500},
	{!"Cheetah", 171, 15,120000,60, 1200},
	{!"Ambulance", 137, 0,0,0, 2600},
	{!"Leviathan", 399, 0,0,0, 15000},
	{!"Moonbeam", 103, 100,25000,13, 2000},
	{!"Esperanto", 133, 50,30000,15, 1800},
	{!"Taxi", 129, 0,0,0, 1450},
	{!"Washington", 137, 40,40000,20, 1850},
	{!"Bobcat", 124, 150,30000,15, 1700},
	{!"Mr Whoopee", 88, 0,0,0, 1700},
	{!"BF Injection", 120, 0, 30000,15, 1200},
	{!"Hunter", 399, 0,0,0, 10000},
	{!"Premier", 154, 80,60000,30, 1600},
	{!"Enforcer", 147, 0,0,0, 4000},
	{!"Securicar", 139, 0,0,0, 7000},
	{!"Banshee", 179, 40,100000,50, 1400},
	{!"Predator", 399, 0,0,0, 2200},
	{!"Bus", 116, 0,0,0, 5500},
	{!"Rhino", 84, 0,0,0, 25000},
	{!"Barracks", 98, 0,0,0, 10500},
	{!"Hotknife", 148, 20,50000,25, 1400},
	{!"Trailer", 0, 0,0,0, 3800},
	{!"Previon", 133, 40,30000,15, 1400},
	{!"Coach", 140, 0,0,0, 9500},
	{!"Cabbie", 127, 0,0,0, 1750},
	{!"Stallion", 150, 40,40000,20, 1600},
	{!"Rumpo", 121, 400,30000,15, 2000},
	{!"RC Bandit", 67, 0,0,0, 100},
	{!"Romero", 124, 0,0,0, 2500},
	{!"Packer", 112, 0,0,0, 8000},
	{!"Monster Truck A", 98, 0,0,0, 5000},
	{!"Admiral", 146, 60,50000,25, 1650},
	{!"Squalo", 399, 0,0,0, 2200},
	{!"Seasparrow", 399, 0,0,0, 3000},
	{!"Pizzaboy", 162, 0,0,0, 350},
	{!"Tram", 399, 0,0,0, 1900},
	{!"Trailer", 399, 0,0,0, 3800},
	{!"Turismo", 172, 20,150000,75, 1400},
	{!"Speeder", 399, 0,0,0, 2200},
	{!"Reefer", 399, 0,0,0, 5000},
	{!"Tropic", 399, 0,0,0, 2200},
	{!"Flatbed", 140, 0,0,0, 8500},
	{!"Yankee", 94, 0,0,0, 4500},
	{!"Caddy", 84, 0,0,0, 1000},
	{!"Solair", 140, 150,40000,20, 2000},
	{!"Berkley's RC Van", 121, 0,0,0, 1900},
	{!"Skimmer", 399, 0,0,0, 5000},
	{!"PCJ-600", 180, 0,0,0, 500},
	{!"Faggio", 105, 0,0,0, 350},
	{!"Freeway", 180, 0,0,0, 800},
	{!"RC Baron", 399, 0,0,0, 100},
	{!"RC Raider", 399, 0,0,0, 100},
	{!"Glendale", 131, 50,40000,20, 1600},
	{!"Oceanic", 125, 50,50000,25, 1900},
	{!"Sanchez", 164, 0,0,0, 500},
	{!"Sparrow", 399, 0,0,0, 2500},
	{!"Patriot", 139, 0,0,0, 2500},
	{!"Quad", 98, 0,0,0, 400},
	{!"Coastguard", 399, 0,0,0, 1200},
	{!"Dinghy", 399, 0,0,0, 800},
	{!"Hermes", 133, 60,30000,15, 1950},
	{!"Sabre", 154, 50,70000,35, 1700},
	{!"Rustler", 399, 0,0,0, 5000},
	{!"ZR-350", 166, 30,50000,25, 1400},
	{!"Walton", 105, 90,20000,10, 1850},
	{!"Regina", 124, 120,40000,20, 1500},
	{!"Comet", 164, 30,100000,50, 1400},
	{!"BMX", 86, 0,0,0, 100},
	{!"Burrito", 139, 300,25000,13, 1900},
	{!"Camper", 109, 80,50000,25, 1900},
	{!"Marquis", 399, 0,0,0, 5000},
	{!"Baggage", 88, 0,0,0, 1000},
	{!"Dozer", 56, 0,0,0, 10000},
	{!"Maverick", 399, 0,0,0, 5000},
	{!"News Chopper", 399, 0,0,0, 3500},
	{!"Rancher", 124, 60,40000,20, 2500},
	{!"FBI Rancher", 139, 0,0,0, 3500},
	{!"Virgo", 132, 40,30000,15, 1700},
	{!"Greenwood", 125, 50,60000,30, 1600},
	{!"Jetmax", 399, 0,0,0, 3000},
	{!"Hotring", 191, 0,0,0, 1600},
	{!"Sandking", 157, 0,0,0, 2000},
	{!"Blista", 145, 20,20000,10, 1000},
	{!"Police Maverick", 399, 0,0,0, 4500},
	{!"Boxville", 96, 600,40000,20, 5500},
	{!"Benson", 109, 700,50000,25, 3500},
	{!"Mesa", 125, 30,30000,15, 1300},
	{!"RC Goblin", 399, 0,0,0, 100},
	{!"Hotring Racer", 191, 0,0,0, 1600},
	{!"Hotring Racer", 191, 0,0,0, 1600},
	{!"Bloodring Banger", 154, 0,0,0, 2100},
	{!"Rancher", 124, 0,0,0, 2500},
	{!"Super GT", 159, 30,150000,75, 1400},
	{!"Elegant", 148, 60,50000,25, 2200},
	{!"Journey", 96, 200,80000,40, 3500},
	{!"Bike", 93, 0,0,0, 100},
	{!"Mountain Bike", 117, 0,0,0, 100},
	{!"Beagle", 399, 0,0,0, 10000},
	{!"Cropdust", 399, 0,0,0, 5000},
	{!"Stunt", 399, 0,0,0, 5000},
	{!"Tanker", 107, 0,0,0, 3800},
	{!"RoadTrain", 126, 0,0,0, 5000},
	{!"Nebula", 140, 50,40000,20, 1400},
	{!"Majestic", 140, 50,40000,20, 1400},
	{!"Buccaneer", 146, 40,40000,20, 1700},
	{!"Shamal", 399, 0,0,0, 15000},
	{!"Hydra", 399, 0,0,0, 9000},
	{!"FCR-900", 190, 0,0,0, 500},
	{!"NRG-500", 200, 0,0,0, 400},
	{!"HPV1000", 172, 0,0,0, 500},
	{!"Cement Truck", 116, 0,0,0, 5500},
	{!"Tow Truck", 143, 0,0,0, 3500},
	{!"Fortune", 140, 40,40000,20, 1700},
	{!"Cadrona", 133, 40,40000,20, 1200},
	{!"FBI Truck", 157, 0,0,0, 4000},
	{!"Willard", 133, 40,40000,20, 1800},
	{!"Forklift", 54, 0,0,0, 1000},
	{!"Tractor", 62, 0,0,0, 2000},
	{!"Combine", 98, 0,0,0, 8500},
	{!"Feltzer", 148, 40,50000,25, 1600},
	{!"Remington", 150, 40,30000,15, 1800},
	{!"Slamvan", 140, 80,70000,35, 1950},
	{!"Blade", 154, 50,70000,35, 1500},
	{!"Freight", 399, 0,0,0, 5500},
	{!"Streak", 399, 0,0,0, 5500},
	{!"Vortex", 89, 0,0,0, 1900},
	{!"Vincent", 136, 40,50000,25, 1800},
	{!"Bullet", 180, 20,200000,100, 1200},
	{!"Clover", 146, 30,30000,15, 1600},
	{!"Sadler", 134, 60,20000,10, 1700},
	{!"Firetruck", 132, 0,0,0, 6500},
	{!"Hustler", 131, 20,40000,20, 1700},
	{!"Intruder", 133, 40,40000,20, 1800},
	{!"Primo", 127, 40,40000,20, 1600},
	{!"Cargobob", 399, 0,0,0, 20000},
	{!"Tampa", 136, 50,30000,15, 1700},
	{!"Sunrise", 128, 40,30000,15, 1600},
	{!"Merit", 140, 60,40000,20, 1800},
	{!"Utility", 108, 0,0,0, 2600},
	{!"Nevada", 399, 0,0,0, 25000},
	{!"Yosemite", 128, 60,40000,20, 3000},
	{!"Windsor", 141, 20,30000,15, 1500},
	{!"Monster Truck B", 98, 0,0,0, 5000},
	{!"Monster Truck C", 98, 0,0,0, 5000},
	{!"Uranus", 139, 40,50000,25, 1400},
	{!"Jester", 158, 40,70000,35, 1500},
	{!"Sultan", 150, 60,100000,50, 1400},
	{!"Stratum", 137, 80,100000,50, 1800},
	{!"Elegy", 158, 40,150000,75, 1500},
	{!"Raindance", 399, 0,0,0, 10000},
	{!"RC Tiger", 79, 0,0,0, 100},
	{!"Flash", 146, 40,30000,15, 1400},
	{!"Tahoma", 142, 40,40000,20, 1800},
	{!"Savanna", 154, 50,70000,35, 1500},
	{!"Bandito", 130, 0,0,0, 1000},
	{!"Freight", 399, 0,0,0, 5500},
	{!"Trailer", 399, 0,0,0, 5500},
	{!"Kart", 83, 0,0,0, 300},
	{!"Mower", 54, 0,0,0, 800},
	{!"Duneride", 98, 0,0,0, 10000},
	{!"Sweeper", 53, 0,0,0, 800},
	{!"Broadway", 140, 30,30000,15, 1700},
	{!"Tornado", 140, 40,40000,20, 1700},
	{!"AT-400", 399, 0,0,0, 60000},
	{!"DFT-30", 116, 0,0,0, 5500},
	{!"Huntley", 140, 100,80000,40, 2500},
	{!"Stafford", 136, 50,40000,20, 2200},
	{!"BF-400", 170, 0,0,0, 500},
	{!"Newsvan", 121, 0,0,0, 1900},
	{!"Tug", 76, 0,0,0, 800},
	{!"Trailer", 399, 0,0,0, 3800},
	{!"Emperor", 136, 40,40000,20, 1800},
	{!"Wayfarer", 175, 0,0,0, 800},
	{!"Euros", 147, 40,70000,35, 1400},
	{!"Hotdog", 96, 0,0,0, 5500},
	{!"Club", 145, 30,40000,20, 1400},
	{!"Trailer", 399, 0,0,0, 5500},
	{!"Trailer", 399, 0,0,0, 3800},
	{!"Andromada", 399, 0,0,0, 40000},
	{!"Dodo", 399, 0,0,0, 5000},
	{!"RC Cam", 54, 0,0,0, 100},
	{!"Launch", 399, 0,0,0, 2200},
	{!"Police Car (LSPD)", 156, 0,0,0, 1600},
	{!"Police Car (SFPD)", 156, 0,0,0, 1600},
	{!"Police Car (LVPD)", 156, 0,0,0, 1600},
	{!"Police Ranger", 140, 0,0,0, 2500},
	{!"Picador", 134, 60,40000,20, 1600},
	{!"S.W.A.T. Van", 98, 0,0,0, 5000},
	{!"Alpha", 150, 50,50000,25, 1500},
	{!"Phoenix", 152, 40,80000,40, 1500},
	{!"Glendale", 131, 20,10000,5, 1600},
	{!"Sadler", 134, 50,10000,5, 1700},
	{!"Luggage Trailer", 399, 0,0,0, 1000},
	{!"Luggage Trailer", 399, 0,0,0, 1000},
	{!"Stair Trailer", 399, 0,0,0, 1000},
	{!"Boxville", 96, 0,0,0, 5500},
	{!"Farm Plow", 399, 0,0,0, 400},
	{!"Utility Trailer", 399, 0, 0,0,0}
};

enum e_medziai
{
	Float:mX,
	Float:mY,
	Float:mZ,
	Float:mRX,
	Float:mRY,
	Float:mRZ
};

new const medziai[][e_medziai] = 
{
	{498.28589, 116.41320, 25.19140,   101.72800, 0.00000, -166.45200},
	{504.12231, 112.59300, 25.96740,   99.59400, 0.00000, -176.34599},
	{481.72379, 79.04400, 22.47540,   107.74200, 0.00000, -22.11600},
	{476.29199, 81.21380, 21.89340,   107.74200, 0.00000, -46.56000},
	{471.91681, 86.29030, 20.72940,   109.68200, 0.00000, -59.94600},
	{470.43079, 91.87580, 20.92340,   112.59200, 0.00000, -88.65800},
	{473.20901, 98.98050, 21.50540,   112.59200, 0.00000, -106.50600},
	{477.14511, 104.93060, 21.89340,   106.57800, 0.00000, -133.66600},
	{483.17029, 110.49360, 22.28140,   101.14600, 0.00000, -151.32001},
	{489.79391, 113.16040, 23.83340,   101.14600, 0.00000, -166.45200},
	{488.96881, 80.15380, 23.44540,   105.99600, 0.00000, 0.00000},
	{498.36819, 84.28730, 24.99740,   105.41400, 0.00000, 9.89400},
	{499.71381, 91.12720, 26.54940,   99.59400, 0.00000, 37.24800},
	{485.79129, 87.62270, 25.19140,   105.41400, 0.00000, -7.76000},
	{481.72449, 91.19640, 24.41540,   105.60800, 0.00000, -46.94800},
	{481.12839, 96.14820, 24.22140,   105.60800, 0.00000, -88.07600},
	{483.98471, 101.14310, 24.60940,   105.60800, 0.00000, -144.53000},
	{488.07541, 106.04860, 24.99740,   102.89200, 0.00000, -163.54201},
	{496.44641, 110.07580, 26.16140,   102.89200, 0.00000, -163.54201},
	{491.05365, 87.70797, 26.54940,   105.41400, 0.00000, 17.46000}
};