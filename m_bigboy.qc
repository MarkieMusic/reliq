/*
==============================================================================

BIG BOY

==============================================================================
*/

$frame stand1 stand2 stand3 stand4 stand5 stand6 stand7 stand8 stand9
$frame stand10 stand11 stand12 stand13 stand14 stand15 stand16 stand17

$frame walk1 walk2 walk3 walk4 walk5 walk6 walk7 
$frame walk8 walk9 walk10 walk11 walk12

$frame run1 run2 run3 run4 run5 run6

$frame smash1 smash2 smash3 smash4 smash5 smash6 smash7 
$frame smash8 smash9 smash10 smash11 smash12

$frame swingr1 swingr2 swingr3 swingr4 swingr5 
$frame swingr6 swingr7 swingr8 swingr9

$frame swingl1 swingl2 swingl3 swingl4 swingl5 
$frame swingl6 swingl7 swingl8 swingl9

$frame magic1 magic2 magic3 magic4 magic5 
$frame magic6 magic7 magic8 magic9 magic10 magic11 magic12

$frame pain1 pain2 pain3 pain4 pain5 pain6

$frame death1 death2 death3 death4 death5 death6 
$frame death7 death8 death9 death10 death11

void() large_stand1		=[	$stand1,	large_stand2	] {ai_stand();}
void() large_stand2		=[	$stand2,	large_stand3	] {ai_stand();}
void() large_stand3		=[	$stand3,	large_stand4	] {ai_stand();}
void() large_stand4		=[	$stand4,	large_stand5	] {ai_stand();}
void() large_stand5		=[	$stand5,	large_stand6	] {ai_stand();}
void() large_stand6		=[	$stand6,	large_stand7	] {ai_stand();}
void() large_stand7		=[	$stand7,	large_stand8	] {ai_stand();}
void() large_stand8		=[	$stand8,	large_stand9	] {ai_stand();}
void() large_stand9		=[	$stand9,	large_stand10	] {ai_stand();}
void() large_stand10	=[	$stand10,	large_stand11	] {ai_stand();}
void() large_stand11	=[	$stand11,	large_stand12	] {ai_stand();}
void() large_stand12	=[	$stand12,	large_stand13	] {ai_stand();}
void() large_stand13	=[	$stand13,	large_stand14	] {ai_stand();}
void() large_stand14	=[	$stand14,	large_stand15	] {ai_stand();}
void() large_stand15	=[	$stand15,	large_stand16	] {ai_stand();}
void() large_stand16	=[	$stand16,	large_stand17	] {ai_stand();}
void() large_stand17	=[	$stand17,	large_stand1	] {ai_stand();}

void() large_walk1		=[      $walk1,        large_walk2 ] {ai_walk(10);}
void() large_walk2      =[      $walk2,        large_walk3 ] {ai_walk(9);}
void() large_walk3      =[      $walk3,        large_walk4 ] {ai_walk(9);}
void() large_walk4      =[      $walk4,        large_walk5 ] {ai_walk(5);}
void() large_walk5      =[      $walk5,        large_walk6 ] {ai_walk(6);}
void() large_walk6      =[      $walk6,        large_walk7 ] {ai_walk(12);}
void() large_walk7      =[      $walk7,        large_walk8 ] {ai_walk(8);}
void() large_walk8      =[      $walk8,        large_walk9 ] {ai_walk(3);}
void() large_walk9      =[      $walk9,        large_walk10] {ai_walk(13);}
void() large_walk10     =[      $walk10,       large_walk11] {ai_walk(9);}
void() large_walk11     =[      $walk11,       large_walk12] {ai_walk(7);}
void() large_walk12     =[      $walk12,       large_walk1 ] {ai_walk(7);
//if (random() > 0.8)
	//sound (self, CHAN_VOICE, "shambler/sidle.wav", 1, ATTN_IDLE);
}

void() large_run1       =[      $run1,        large_run2      ] {ai_run(15);}
void() large_run2       =[      $run2,        large_run3      ] {ai_run(17);}
void() large_run3       =[      $run3,        large_run4      ] {ai_run(16);}
void() large_run4       =[      $run4,        large_run5      ] {ai_run(16);}
void() large_run5       =[      $run5,        large_run6      ] {ai_run(18);}
void() large_run6       =[      $run6,        large_run1      ] {ai_run(15);
//if (random() > 0.8 && time > self.show_hostile)
	//sound (self, CHAN_VOICE, "shambler/sidle.wav", 1, ATTN_IDLE);
}

void(float side) LargeClaw =
{
	float 	ldmg;

	if (!self.enemy)
		return;
	ai_charge(10);

	if (vdist(self.enemy.origin, self.origin) > 100)
		return;
		
	ldmg = (random() + random() + random()) * 20;
	T_DamageMelee (self.enemy, self, ldmg);
	sound (self, CHAN_VOICE, "shambler/smack.wav", 1, ATTN_NORM);

	if (side)
	{
		makevectors (self.angles);
		SpawnMeatSpray (self.origin + v_forward*16, side * v_right);
	}
}

void() large_swingl1	=[      $swingl1,      large_swingl2   ] {
	sound (self, CHAN_VOICE, "shambler/melee2.wav", 1, ATTN_NORM);
	ai_charge(5);
}
void() large_swingl2 =[      $swingl2,      large_swingl3   ] {ai_charge(3);}
void() large_swingl3 =[      $swingl3,      large_swingl4   ] {ai_charge(7);}
void() large_swingl4 =[      $swingl4,      large_swingl5   ] {ai_charge(3);}
void() large_swingl5 =[      $swingl5,      large_swingl6   ] {ai_charge(7);}
void() large_swingl6 =[      $swingl6,      large_swingl7   ] {ai_charge(9);}
void() large_swingl7 =[      $swingl7,      large_swingl8   ] {ai_charge(5); LargeClaw(250);}
void() large_swingl8 =[      $swingl8,      large_swingl9   ] {ai_charge(4);}
void() large_swingl9 =[      $swingl9,      large_run1  ] {
	ai_charge(8);
	if (random()<0.5 && 
		vdist(self.enemy.origin, self.origin) < 100 && 
		CheckClearAttack())
		self.think = large_swingr1;
}

void() large_swingr1	=[      $swingr1,      large_swingr2   ] {
	sound (self, CHAN_VOICE, "shambler/melee1.wav", 1, ATTN_NORM);
	ai_charge(1);
}
void() large_swingr2	=[      $swingr2,      large_swingr3   ] {ai_charge(8);}
void() large_swingr3 =[      $swingr3,      large_swingr4   ] {ai_charge(14);}
void() large_swingr4 =[      $swingr4,      large_swingr5   ] {ai_charge(7);}
void() large_swingr5 =[      $swingr5,      large_swingr6   ] {ai_charge(3);}
void() large_swingr6 =[      $swingr6,      large_swingr7   ] {ai_charge(6);}
void() large_swingr7 =[      $swingr7,      large_swingr8   ] {ai_charge(6); LargeClaw(-250);}
void() large_swingr8 =[      $swingr8,      large_swingr9   ] {ai_charge(3);}
void() large_swingr9 =[      $swingr9,      large_run1  ] {
	ai_charge(11);
	if (random()<0.5 && 
		vdist(self.enemy.origin, self.origin) < 100 && 
		CheckClearAttack())
		self.think = large_swingl1;
}

void() large_melee =
{
		if (random() > 0.5)
			large_swingr1 ();
		else
			large_swingl1 ();
}

void() large_magic1     =[      $magic1,       large_magic2    ] {ai_face();
	sound (self, CHAN_WEAPON, "shambler/sattck1.wav", 1, ATTN_NORM);}
void() large_magic2     =[      $magic2,       large_magic3    ] {ai_face();}
void() large_magic3     =[      $magic3,       large_magic4    ] {ai_face();}
void() large_magic4     =[      $magic4,       large_magic5    ] {ai_face();}
void() large_magic5     =[      $magic5,       large_magic6    ] {ai_face();}
void() large_magic6     =[      $magic6,       large_magic9    ] {ai_face();LargeFireRocket(1);}
void() large_magic9     =[      $magic9,       large_magic10   ] {ai_face();}
void() large_magic10    =[      $magic10,      large_magic11   ] {ai_face();}
void() large_magic11    =[      $magic11,      large_magic12   ] {ai_face();}
void() large_magic12    =[      $magic12,      large_magic13   ] {ai_face();}
void() large_magic13    =[      $magic5,       large_magic14   ] {ai_face();}
void() large_magic14    =[      $magic6,       large_magic15   ] {ai_face();LargeFireRocket(2);}
void() large_magic15    =[      $magic9,       large_magic16   ] {ai_face();}
void() large_magic16    =[      $magic10,      large_magic17   ] {ai_face();}
void() large_magic17    =[      $magic11,      large_magic18   ] {ai_face();}
void() large_magic18    =[      $magic12,      large_magic19   ] {ai_face();}
void() large_magic19    =[      $magic5,       large_magic20   ] {ai_face();}
void() large_magic20    =[      $magic6,       large_magic21   ] {ai_face();LargeFireRocket(1);}
void() large_magic21    =[      $magic9,       large_magic22   ] {ai_face();}
void() large_magic22    =[      $magic9,       large_magic23   ] {ai_face();}
void() large_magic23    =[      $magic10,      large_magic24   ] {ai_face();}
void() large_magic24    =[      $magic11,      large_magic25   ] {ai_face();}
void() large_magic25    =[      $magic12,      large_run1      ] {ai_face();}

void(float type) LargeFireRocket =
{
	local   entity r;
    local   vector loc, org;

	self.effects = self.effects | EF_MUZZLEFLASH;
    sound (self, CHAN_WEAPON, "weapons/sgun1.wav", 1, ATTN_NORM);

	if (type == 1)
		org = (self.origin - '0 24 0');
	else
		org = (self.origin + '0 24 0');

    loc = enemy_vispos() - org;
    loc = normalize(loc);

    r = launch_rocket(org + '0 0 24', loc * 800);
    r.dmg = 70;
    r.touch = large_missiletouch;
}

void() large_missiletouch =
{
    if (other == self.owner) return;		// don't explode on owner
	if (CheckProjectilePassthru()) return;

	if (pointcontents(self.origin) == CONTENT_SKY)
	{
		remove(self);
		return;
	}

	large_missileexplode(self.dmg);

	self.origin = self.origin - 8*normalize(self.velocity);
	T_ExplosiveTouch();
}

void(float damg) large_missileexplode =
{
	if (other.health)
	{
		if (other.classname == "monster_shambler")
			damg = damg * 0.5;
		if (other.type == "zombie")
			damg = max(damg, other.health + 25);	// so ogre rockets kill zombies despite being too weak
		T_Damage (other, self, self.trueowner, damg);
	}

    T_RadiusDamage (self, self.trueowner, damg, other);
}


void() large_pain1       =[      $pain1, large_pain2      ] {}
void() large_pain2       =[      $pain2, large_pain3      ] {}
void() large_pain3       =[      $pain3, large_pain4      ] {}
void() large_pain4       =[      $pain4, large_pain5      ] {}
void() large_pain5       =[      $pain5, large_pain6      ] {}
void() large_pain6       =[      $pain6, large_run1      ] {}

// i get no kick from this function
void(entity attacker, float damage)	large_pain =
{
	if (self.health <= 0) return;	
	if (self.pain_finished > time) return;
	if (random()*400 > damage) return;		// didn't flinch
	
	sound (self, CHAN_VOICE, "shambler/shurt2.wav", 1, ATTN_NORM);
	PainFinished(2);
	large_pain1 ();
}

//============================================================================

void() large_death1      =[      $death1,       large_death2     ] {}
void() large_death2      =[      $death2,       large_death3     ] {}
void() large_death3      =[      $death3,       large_death4     ] {}
void() large_death4      =[      $death4,       large_death5     ] {self.solid = SOLID_NOT;}
void() large_death5      =[      $death5,       large_death6     ] {}
void() large_death6      =[      $death6,       large_death7     ] {}
void() large_death7      =[      $death7,       large_death8     ] {}
void() large_death8      =[      $death8,       large_death9     ] {}
void() large_death9      =[      $death9,       large_death10    ] {}
void() large_death10     =[      $death10,      large_death11    ] {}
void() large_death11     =[      $death11,      SUB_Null    ] {}

void() large_die =
{
	 
// check for gib
	if (self.health < -98)
	{
		Gib ("progs/h_shams.mdl", self.health);
		return;
	}

// regular death
	sound (self, CHAN_VOICE, "shambler/sdeath.wav", 1, ATTN_NORM);
	large_death1 ();
}

//============================================================================


void() monster_bigboy_spawn =
{
	self.classname = "monster_bigboy";
		
	self.solid = SOLID_SLIDEBOX;
	//self.movetype = MOVETYPE_STEP;
	setmodel (self, "progs/mon_bigboy.mdl");
	self.skin = 1;

	setsize (self, '-32 -32 -24', '32 32 96');

	self.th_stand = large_stand1;
	self.th_walk = large_walk1;
	self.th_run = large_run1;
	self.th_die = large_die;
	self.th_missile = large_magic1;
	self.th_pain = large_pain;
	self.th_checkattack = CheckAttack;

	if (self.deathtype == string_null)
		self.deathtype = "was bonked by a Bigboy";

	walkmonster_start();	
}

void() monster_bigboy_spawner = {mon_spawner_use(monster_bigboy_spawn);}

/*QUAKED monster_bigboy (1 0 0) (-32 -32 -24) (32 32 64) AMBUSH ? ? ? TRIGGERED NOTFOG NOTELEFRAG INSTAWAKE
Bigboy, 1200 health points.

Flags:
"ambush" only wake up on seeing the player, not another monster getting angry

"Triggered"	will not spawn until triggered - triggering again will wake him up. Set 'count' to make this a multi-use spawner.
"NoTfog" 	supress teleport glitter when spawned with 'triggered'
"NoTelefrag" will silently fail to spawn if doing so would telefrag an existing monster. will try again automatically 2x/second until it succeeds.
"Instawake" spawn angry at activator

Keys:
"target" entity to trigger when killed
"targetname" entity name
"movedir" set to a velocity to make the monster jump on awakening
*/
/*FGD
@PointClass base(Monster) size(-32 -32 -24, 32 32 64) model({ "path": ":progs/mon_bigboy.mdl" }) = monster_bigboy : "Bigboy" []
*/
void() monster_bigboy =
{
	if (!SUB_ShouldSpawn()) return;
	if (nomonster()) return;
	if (deathmatch)
	{
		remove(self);
		return;
	}
	precache_model ("progs/mon_bigboy.mdl");
	precache_model ("progs/s_light.mdl");
	precache_model ("progs/h_shams.mdl");
	precache_model ("progs/bolt.mdl");
	
	precache_sound ("shambler/sattck1.wav");
	precache_sound ("shambler/sboom.wav");
	precache_sound ("shambler/sdeath.wav");
	precache_sound ("shambler/shurt2.wav");
	precache_sound ("shambler/sidle.wav");
	precache_sound ("shambler/ssight.wav");
	precache_sound ("shambler/melee1.wav");
	precache_sound ("shambler/melee2.wav");
	precache_sound ("shambler/smack.wav");
	precache_sound ("weapons/sgun1.wav");

	self.health = 1200;
	setsize (self, '-32 -32 -24', '32 32 96');

	if ( monster_spawnsetup( monster_bigboy_spawner ) ) return;
	
	addmonster(1);
	monster_bigboy_spawn();
}
