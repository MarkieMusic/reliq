$frame stand1 stand2 stand3 stand4 stand5 stand6 stand7 stand8 stand9

$frame walk1 walk2 walk3 walk4 walk5 walk6 walk7 walk8 walk9
$frame walk10 walk11 walk12 walk13 walk14 walk15 walk16 walk17
$frame walk18 walk19 walk20

$frame run1 run2 run3 run4 run5 run6 run7 run8

$frame pain1 pain2 pain3 pain4 pain5

$frame death1 death2 death3 death4 death5 death6 death7 death8
$frame death9 death10 death11 death12

$frame deathb1 deathb2 deathb3 deathb4 deathb5 deathb6 deathb7 deathb8
$frame deathb9

// swipe left & right whilst running
$frame char_a1 char_a2 char_a3 char_a4 char_a5 char_a6 char_a7 char_a8 char_a9 char_a10 char_a11 char_a12 char_a13 char_a14 char_a15 char_a16
// two armed smash
$frame magica1 magica2 magica3 magica4 magica5 magica6 magica7 magica8 magica9 magica10 magica11 magica12 magica13 magica14
// sword gun - 7 & 8 are identical
$frame magicb1 magicb2 magicb3 magicb4 magicb5 magicb6 magicb7 magicb8 magicb9 magicb10 magicb11 magicb12 magicb13
// helicopter run
$frame char_b1 char_b2 char_b3 char_b4 char_b5 char_b6
// two armed forward swipe
$frame slice1 slice2 slice3 slice4 slice5 slice6 slice7 slice8 slice9 slice10
// one armed forward smash
$frame smash1 smash2 smash3 smash4 smash5 smash6 smash7 smash8 smash9 smash10 smash11
// swipe left & right whilst walking
$frame w_attack1 w_attack2 w_attack3 w_attack4 w_attack5 w_attack6 w_attack7 w_attack8 w_attack9 w_attack10 w_attack11 w_attack12 w_attack13 w_attack14 w_attack15 w_attack16 w_attack17 w_attack18 w_attack19 w_attack20 w_attack21 w_attack22 
// broad sweep attack
$frame magicc1 magicc2 magicc3 magicc4 magicc5 magicc6 magicc7 magicc8 magicc9 magicc10 magicc11


void(float offset) shieldk_shot =
{
	vector	offang;
	vector	org, vec;
	
	vec = enemy_vispos() - self.origin;
	vec += enemy_aim_vertical();
	vec_z += crandom() * 16;
	offang = vectoangles(vec);
	offang_y = offang_y + offset * 6;
	offang_x *= -1;
	
	if (angledif(self.ideal_yaw, offang_y) > 80)	// no assbolts
		makevectors (self.angles + '0 1 0' * offset * 6);
	else
		makevectors (offang + '0 1 0' * offset * 6);

	org = self.origin + self.mins + self.size*0.5 + v_forward * 20;

// set missile speed
	vec = normalize (v_forward);
	vec_z += crandom() * 0.05;
	
	launch_knightspike (org, vec*425);

	sound (self, CHAN_WEAPON, "hknight/attack1.wav", 1, ATTN_NORM);
}

void() skCheckCharge =
{
	// check for mad charge
	if (!enemy_vis)
		return;
	if (time < self.attack_finished)
		return;	
	if ( fabs(self.origin_z - self.enemy.origin_z) > 32)
		return;		// too much height change
	if ( vlen (self.origin - self.enemy.origin) < 80)
		return;		// use regular attack

	// charge		
	ai_attack_finished (2);
	if (random() > .4)
	{
	shieldk_char_a1 ();
	}
}

void() skCheckContinueCharge =
{
	if (time > self.attack_finished)
	{
		ai_attack_finished (3);
		shieldk_run1 ();
		
		return;		// done charging
	}
	
	if (random() > 0.5)
		sound (self, CHAN_WEAPON, "knight/sword2.wav", 1, ATTN_NORM);
	else
		sound (self, CHAN_WEAPON, "knight/sword1.wav", 1, ATTN_NORM);
}

//===========================================================================

void()	shieldk_stand1	=[	$stand1,	shieldk_stand2	] {ai_stand(); self.shieldup = 0;}
void()	shieldk_stand2	=[	$stand2,	shieldk_stand3	] {ai_stand();}
void()	shieldk_stand3	=[	$stand3,	shieldk_stand4	] {ai_stand();}
void()	shieldk_stand4	=[	$stand4,	shieldk_stand5	] {ai_stand();}
void()	shieldk_stand5	=[	$stand5,	shieldk_stand6	] {ai_stand();}
void()	shieldk_stand6	=[	$stand6,	shieldk_stand7	] {ai_stand();}
void()	shieldk_stand7	=[	$stand7,	shieldk_stand8	] {ai_stand();}
void()	shieldk_stand8	=[	$stand8,	shieldk_stand9	] {ai_stand();}
void()	shieldk_stand9	=[	$stand9,	shieldk_stand1	] {ai_stand();}

//===========================================================================

void()	shieldk_walk1	=[	$walk1,		shieldk_walk2	] {
sk_idle_sound();
ai_walk(2); self.shieldup = 0;}
void()	shieldk_walk2	=[	$walk2,		shieldk_walk3	] {ai_walk(5);}
void()	shieldk_walk3	=[	$walk3,		shieldk_walk4	] {ai_walk(5);}
void()	shieldk_walk4	=[	$walk4,		shieldk_walk5	] {ai_walk(4);}
void()	shieldk_walk5	=[	$walk5,		shieldk_walk6	] {ai_walk(4);}
void()	shieldk_walk6	=[	$walk6,		shieldk_walk7	] {ai_walk(2);}
void()	shieldk_walk7	=[	$walk7,		shieldk_walk8	] {ai_walk(2);}
void()	shieldk_walk8	=[	$walk8,		shieldk_walk9	] {ai_walk(3);}
void()	shieldk_walk9	=[	$walk9,		shieldk_walk10	] {ai_walk(3);}
void()	shieldk_walk10	=[	$walk10,	shieldk_walk11	] {ai_walk(4);}
void()	shieldk_walk11	=[	$walk11,	shieldk_walk12	] {ai_walk(3);}
void()	shieldk_walk12	=[	$walk12,	shieldk_walk13	] {ai_walk(4);}
void()	shieldk_walk13	=[	$walk13,	shieldk_walk14	] {ai_walk(6);}
void()	shieldk_walk14	=[	$walk14,	shieldk_walk15	] {ai_walk(2);}
void()	shieldk_walk15	=[	$walk15,	shieldk_walk16	] {ai_walk(2);}
void()	shieldk_walk16	=[	$walk16,	shieldk_walk17	] {ai_walk(4);}
void()	shieldk_walk17	=[	$walk17,	shieldk_walk18	] {ai_walk(3);}
void()	shieldk_walk18	=[	$walk18,	shieldk_walk19	] {ai_walk(3);}
void()	shieldk_walk19	=[	$walk19,	shieldk_walk20	] {ai_walk(3);}
void()	shieldk_walk20	=[	$walk20,	shieldk_walk1	] {ai_walk(2);}

//===========================================================================

void()	shieldk_run1	=[	$run1,		shieldk_run2	] {
sk_idle_sound();
ai_run (10); skCheckCharge (); self.shieldup = 1; }
void()	shieldk_run2	=[	$run2,		shieldk_run3	] {ai_run(17);}
void()	shieldk_run3	=[	$run3,		shieldk_run4	] {ai_run(10);}
void()	shieldk_run4	=[	$run4,		shieldk_run5	] {ai_run(4);}
void()	shieldk_run5	=[	$run5,		shieldk_run6	] {ai_run(13);}
void()	shieldk_run6	=[	$run6,		shieldk_run7	] {ai_run(17);}
void()	shieldk_run7	=[	$run7,		shieldk_run8	] {ai_run(11);}
void()	shieldk_run8	=[	$run8,		shieldk_run1	] {ai_run(3);}

//============================================================================

void()	shieldk_pain1	=[	$pain1,		shieldk_pain2	] { sound (self, CHAN_VOICE, "sknight/pain1.wav", 1, ATTN_NORM); self.shieldup = 0;}
void()	shieldk_pain2	=[	$pain2,		shieldk_pain3	] {}
void()	shieldk_pain3	=[	$pain3,		shieldk_pain4	] {}
void()	shieldk_pain4	=[	$pain4,		shieldk_pain5	] {}
void()	shieldk_pain5	=[	$pain5,		shieldk_pain6	] {}
void()	shieldk_pain6	=[	$stand1,	shieldk_pain7	] {}
void()	shieldk_pain7	=[	$stand5,	shieldk_run1	] {}

//============================================================================

void()	shieldk_die1	=[	$death1,	shieldk_die2	] {ai_forward(10); self.shieldup = 0;}
void()	shieldk_die2	=[	$death2,	shieldk_die3	] {ai_forward(8);}
void()	shieldk_die3	=[	$death3,	shieldk_die4	]
{self.solid = SOLID_NOT; ai_forward(7);}
void()	shieldk_die4	=[	$death4,	shieldk_die5	] {}
void()	shieldk_die5	=[	$death5,	shieldk_die6	] {}
void()	shieldk_die6	=[	$death6,	shieldk_die7	] {}
void()	shieldk_die7	=[	$death7,	shieldk_die8	] {}
void()	shieldk_die8	=[	$death8,	shieldk_die9	] {ai_forward(10);}
void()	shieldk_die9	=[	$death9,	shieldk_die10	] {ai_forward(11);}
void()	shieldk_die10	=[	$death10,	shieldk_die11	] {}
void()	shieldk_die11	=[	$death11,	shieldk_die12	] {}
void()	shieldk_die12	=[	$death12,	SUB_Null	] {}

void()	shieldk_dieb1	=[	$deathb1,	shieldk_dieb2	] { self.shieldup = 0; }
void()	shieldk_dieb2	=[	$deathb2,	shieldk_dieb3	] {}
void()	shieldk_dieb3	=[	$deathb3,	shieldk_dieb4	]
{self.solid = SOLID_NOT;}
void()	shieldk_dieb4	=[	$deathb4,	shieldk_dieb5	] {}
void()	shieldk_dieb5	=[	$deathb5,	shieldk_dieb6	] {}
void()	shieldk_dieb6	=[	$deathb6,	shieldk_dieb7	] {}
void()	shieldk_dieb7	=[	$deathb7,	shieldk_dieb8	] {}
void()	shieldk_dieb8	=[	$deathb8,	shieldk_dieb9	] {}
void()	shieldk_dieb9	=[	$deathb9,	SUB_Null	] {}

void() shieldk_die =
{
// check for gib
	if (self.health < -40)
	{
		Gib ("progs/h_hellkn.mdl", self.health);
		return;
	}

// regular death
	sound (self, CHAN_VOICE, "sknight/death1.wav", 1, ATTN_NORM);
	if (random() > 0.5)
		shieldk_die1 ();
	else
		shieldk_dieb1 ();
}

//===========================================================================

void()	shieldk_char_a1	=[	$char_a1,	shieldk_char_a2	] {ai_rush(30);
	self.shieldup = 1;
	sk_chargesound();
	}
void()	shieldk_char_a2	=[	$char_a2,	shieldk_char_a3	] {ai_rush(32); shieldk_ai_melee();}
void()	shieldk_char_a3	=[	$char_a3,	shieldk_char_a4	] {ai_rush(30); shieldk_ai_melee();}
void()	shieldk_char_a4	=[	$char_a4,	shieldk_char_a5	] {ai_rush(30); shieldk_ai_melee(); }
void()	shieldk_char_a5	=[	$char_a5,	shieldk_char_a6	] {ai_rush(30); shieldk_ai_melee(); }
void()	shieldk_char_a6	=[	$char_a6,	shieldk_char_a7	] {ai_rush(30); shieldk_ai_melee(); }
void()	shieldk_char_a7	=[	$char_a7,	shieldk_char_a8	] {ai_rush(30); shieldk_ai_melee();}
void()	shieldk_char_a8	=[	$char_a8,	shieldk_char_a9	] {ai_rush(30); shieldk_ai_melee();}
void()	shieldk_char_a9	=[	$char_a9,	shieldk_char_a10	] {ai_rush(27); shieldk_ai_melee();}
void()	shieldk_char_a10=[	$char_a10,	shieldk_char_a11	] {ai_rush(27); shieldk_ai_melee();}
void()	shieldk_char_a11=[	$char_a11,	shieldk_char_a12	] {ai_rush(30); shieldk_ai_melee();}
void()	shieldk_char_a12=[	$char_a12,	shieldk_char_a13	] {ai_rush(30); shieldk_ai_melee();}
void()	shieldk_char_a13=[	$char_a13,	shieldk_char_a14	] {ai_rush(30); shieldk_ai_melee();}
void()	shieldk_char_a14=[	$char_a14,	shieldk_char_a15	] {ai_rush(32); shieldk_ai_melee();}
void()	shieldk_char_a15=[	$char_a15,	shieldk_char_a16	] {ai_rush(28); shieldk_ai_melee();}
void()	shieldk_char_a16=[	$char_a16,	shieldk_run1	] {ai_rush(30); shieldk_ai_melee();}

//===========================================================================

void()	shieldk_char_b1	=[	$char_b1,	shieldk_char_b2	]
{skCheckContinueCharge (); ai_rush(32); shieldk_ai_melee(); self.shieldup = 1;}
void()	shieldk_char_b2	=[	$char_b2,	shieldk_char_b3	] {ai_rush(30); shieldk_ai_melee();}
void()	shieldk_char_b3	=[	$char_b3,	shieldk_char_b4	] {ai_rush(30); shieldk_ai_melee();}
void()	shieldk_char_b4	=[	$char_b4,	shieldk_char_b5	] {ai_rush(30); shieldk_ai_melee();}
void()	shieldk_char_b5	=[	$char_b5,	shieldk_char_b6	] {ai_rush(30); shieldk_ai_melee();}
void()	shieldk_char_b6	=[	$char_b6,	shieldk_char_b1	] {ai_rush(30); shieldk_ai_melee();}

//===========================================================================

void()	shieldk_slice1	=[	$slice1,	shieldk_slice2	] {ai_charge(9); self.shieldup = 0;}
void()	shieldk_slice2	=[	$slice2,	shieldk_slice3	] {ai_charge(6);}
void()	shieldk_slice3	=[	$slice3,	shieldk_slice4	] {ai_charge(13);  }
void()	shieldk_slice4	=[	$slice4,	shieldk_slice5	] {ai_charge(4);}
void()	shieldk_slice5	=[	$slice5,	shieldk_slice6	] {ai_charge(7); ai_melee();}
void()	shieldk_slice6	=[	$slice6,	shieldk_slice7	] {ai_charge(15); ai_melee();}
void()	shieldk_slice7	=[	$slice7,	shieldk_slice8	] {ai_charge(8); ai_melee();}
void()	shieldk_slice8	=[	$slice8,	shieldk_slice9	] {ai_charge(2); ai_melee();}
void()	shieldk_slice9	=[	$slice9,	shieldk_slice10	] {ai_melee();}
void()	shieldk_slice10	=[	$slice10,	shieldk_run1	] {ai_charge(3);}

//==========================================================================
void()	shieldk_bash1	=[	$slice1,	shieldk_bash2	] {ai_forward(2); self.shieldup = 0;}
void()	shieldk_bash2	=[	$slice2,	shieldk_bash3	] {ai_forward(4);}
void()	shieldk_bash3	=[	$slice3,	shieldk_bash4	] {ai_forward(6);}
void()	shieldk_bash4	=[	$slice4,	shieldk_bash5	] {ai_forward(2);}
void()	shieldk_bash5	=[	$slice5,	shieldk_bash6	] {ai_forward(0);}
void()	shieldk_bash6	=[	$slice6,	shieldk_run1	] {ai_forward(0);}

//===========================================================================

void()	shieldk_smash1	=[	$smash1,	shieldk_smash2	] {ai_charge(1); self.shieldup = 0;}
void()	shieldk_smash2	=[	$smash2,	shieldk_smash3	] {ai_charge(13);}
void()	shieldk_smash3	=[	$smash3,	shieldk_smash4	] {ai_charge(9);}
void()	shieldk_smash4	=[	$smash4,	shieldk_smash5	] {ai_charge(11);  }
void()	shieldk_smash5	=[	$smash5,	shieldk_smash6	] {ai_charge(10); ai_melee();}
void()	shieldk_smash6	=[	$smash6,	shieldk_smash7	] {ai_charge(7); ai_melee();}
void()	shieldk_smash7	=[	$smash7,	shieldk_smash8	] {ai_charge(12); ai_melee();}
void()	shieldk_smash8	=[	$smash8,	shieldk_smash9	] {ai_charge(2); ai_melee();}
void()	shieldk_smash9	=[	$smash9,	shieldk_smash10	] {ai_charge(3); ai_melee();}
void()	shieldk_smash10	=[	$smash10,	shieldk_smash11	] {ai_charge(0);  }
void()	shieldk_smash11	=[	$smash11,	shieldk_run1	] {ai_charge(0);}

//============================================================================

void()	shieldk_watk1	=[	$w_attack1,		shieldk_watk2	] {ai_charge(2); self.shieldup = 0;}
void()	shieldk_watk2	=[	$w_attack2,		shieldk_watk3	] {ai_charge(0); }
void()	shieldk_watk3	=[	$w_attack3,		shieldk_watk4	] {ai_charge(0);}
void()	shieldk_watk4	=[	$w_attack4,		shieldk_watk5	] {ai_charge(0);}
void()	shieldk_watk5	=[	$w_attack5,		shieldk_watk6	] {ai_charge(0);}
void()	shieldk_watk6	=[	$w_attack6,		shieldk_watk7	] {ai_charge(0); }
void()	shieldk_watk7	=[	$w_attack7,		shieldk_watk8	] {ai_charge(1); ai_melee();}
void()	shieldk_watk8	=[	$w_attack8,		shieldk_watk9	] {ai_charge(4); ai_melee();}
void()	shieldk_watk9	=[	$w_attack9,		shieldk_watk10	] {ai_charge(5); ai_melee(); }
void()	shieldk_watk10	=[	$w_attack10,	shieldk_watk11	] {ai_charge(3); ai_melee();}
void()	shieldk_watk11	=[	$w_attack11,	shieldk_watk12	] {ai_charge(2); ai_melee();}
void()	shieldk_watk12	=[	$w_attack12,	shieldk_watk13	] {ai_charge(2); ai_melee();}
void()	shieldk_watk13	=[	$w_attack13,	shieldk_watk14	] {ai_charge(0);  }
void()	shieldk_watk14	=[	$w_attack14,	shieldk_watk15	] {ai_charge(0);}
void()	shieldk_watk15	=[	$w_attack15,	shieldk_watk16	] {ai_charge(0);}
void()	shieldk_watk16	=[	$w_attack16,	shieldk_watk17	] {ai_charge(1);  }
void()	shieldk_watk17	=[	$w_attack17,	shieldk_watk18	] {ai_charge(1); ai_melee();}
void()	shieldk_watk18	=[	$w_attack18,	shieldk_watk19	] {ai_charge(3); ai_melee();}
void()	shieldk_watk19	=[	$w_attack19,	shieldk_watk20	] {ai_charge(4); ai_melee();}
void()	shieldk_watk20	=[	$w_attack20,	shieldk_watk21	] {ai_charge(6);  }
void()	shieldk_watk21	=[	$w_attack21,	shieldk_watk22	] {ai_charge(7);}
void()	shieldk_watk22	=[	$w_attack22,	shieldk_run1	] {ai_charge(3);}

//============================================================================

void() sk_chargesound =
{
	if (random() < 0.3)
	sound (self, CHAN_WEAPON, "sknight/shieldcharge1.wav", 1, ATTN_NORM);
	else if (random() < 0.5)
	sound (self, CHAN_WEAPON, "sknight/shieldcharge2.wav", 1, ATTN_NORM);
	else
	sound (self, CHAN_WEAPON, "sknight/shieldcharge3.wav", 1, ATTN_NORM);
}

void() sk_idle_sound =
{
	if (random() < 0.2 && time > self.show_hostile)
		sound (self, CHAN_VOICE, "sknight/idle.wav", 1, ATTN_NORM);
}

void() shieldk_pain_go =
{
	shieldk_pain1 ();
	PainFinished(1);
}

void() shieldk_ai_melee =
{
	local vector	delta;

	if (!self.enemy)
		return;		// removed before stroke
		
	delta = self.enemy.origin - self.origin;

	if (vlensqr(delta) > 60*60)
		return;

	sound (self, CHAN_VOICE, "sknight/shieldslam.wav", 1, ATTN_NORM);

	//get the player off the ground so it launches them :D
	if ((self.enemy.classname == "player"))
	{
		makevectors(self.enemy.angles);
		self.enemy.origin_z = self.enemy.origin_z + 1;
		self.enemy.velocity = v_forward * -200 + '0 0 250';
	}

	T_DamageMelee (self.enemy, self, 25);
	//don't try again before 2s to let the player maneuver
	ai_attack_finished (3);
	//shield recovery aniamtion after bashing
	shieldk_bash1();
}

void(entity attacker, float damage)	shieldk_pain =
{
	if (self.pain_finished > time)
		return;

	if (time - self.pain_finished > 5)
	{	// always go into pain frame if it has been a while
		shieldk_pain_go();
		return;
	}
	
	if ( ( random()*30 > damage ) )
		return;		// didn't flinch

	shieldk_pain_go();
}

float shieldk_type;

void() shieldk_melee =
{
	shieldk_type = shieldk_type + 1;

	if (time < self.attack_finished)
	return;

	sound (self, CHAN_WEAPON, "sknight/slash1.wav", 1, ATTN_NORM);
	if (shieldk_type == 1)
		shieldk_slice1 ();
	else if (shieldk_type == 2)
		shieldk_smash1 ();
	else if (shieldk_type == 3)
	{
		shieldk_watk1 ();
		shieldk_type = 0;
	}
}


void() monster_shield_knight_spawn =
{
	self.classname = "monster_shield_knight";
		
	self.solid = SOLID_SLIDEBOX;
	//self.movetype = MOVETYPE_STEP;

	setmodel (self, "progs/mon_sknight.mdl");

	setsize (self, '-16 -16 -24', '16 16 40');

	self.th_stand = shieldk_stand1;
	self.th_walk = shieldk_walk1;
	self.th_run = shieldk_run1;
	self.th_melee = shieldk_melee;
	//self.th_missile = shieldk_magicc1;
	self.th_pain = shieldk_pain;
	self.th_die = shieldk_die;
	self.th_checkattack = CheckAttack;

	self.type = "brigade";	// no infighting amongst the hell death brigade legion squad

	if (self.deathtype == string_null)
		self.deathtype = "was sheared by a Shield Knight";

	walkmonster_start ();
}

void() monster_shield_knight_spawner = {mon_spawner_use(monster_shield_knight_spawn);}

/*QUAKED monster_shield_knight (1 0 0) (-16 -16 -24) (16 16 40) AMBUSH ? ? ? TRIGGERED NOTFOG NOTELEFRAG INSTAWAKE
"Death" Knight, 250 health points.

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
@PointClass base(Monster) size(-16 -16 -24, 16 16 40) model({ "path": ":progs/mon_sknight.mdl" }) = monster_shield_knight : "Death knight" []
*/
void() monster_shield_knight =
{
	if (!SUB_ShouldSpawn()) return;
	if (nomonster()) return;
	if (deathmatch)
	{
		remove(self);
		return;
	}
	precache_model2 ("progs/mon_sknight.mdl");
	precache_model2 ("progs/k_spike.mdl");
	precache_model2 ("progs/h_hellkn.mdl");

	
	precache_sound2 ("hknight/attack1.wav");
	precache_sound2 ("sknight/death1.wav");
	precache_sound2 ("sknight/pain1.wav");
	precache_sound2 ("sknight/sight1.wav");
	precache_sound ("hknight/hit.wav");		// used by C code, so don't sound2
	precache_sound2 ("sknight/slash1.wav");
	precache_sound2 ("sknight/idle.wav");

	precache_sound2 ("sknight/shieldcharge1.wav");
	precache_sound2 ("sknight/shieldcharge2.wav");
	precache_sound2 ("sknight/shieldcharge3.wav");
	precache_sound2 ("sknight/shieldslam.wav");

	precache_sound ("knight/sword1.wav");
	precache_sound ("knight/sword2.wav");
	
	self.health = 250;
	setsize (self, '-16 -16 -24', '16 16 40');
	if ( monster_spawnsetup( monster_shield_knight_spawner ) ) return;
	
	addmonster(1);
	monster_shield_knight_spawn();
}
