/*
==============================================================================

KNIGHT


	Shield Knight Specifications:
		Charge attack - charges with a shield when at distance from the player, uses it to close gaps. 
		Will run homing at the player for a short window of time. 
	     	If no contact, resume regular behavior 
	     	if contact, do 20 damage, knock player back, play unique sound, and stop charge.
	
		Shield Guard - Same running behavior and damage as the hell knight, can attack while moving, etc. 
		When running
		    Has his shield up and takes 50% reduced damage. 
		    Can be hitstunned 
		    Plays unique pain sound when guarding
			Red+Grey puffs

		Doesn't invite with hell knights 

==============================================================================
*/

$cd id1/models/knight2
$origin 0 0 24
$base base
$skin skin

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


void(float offset) hshield_shot =
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

	sound (self, CHAN_WEAPON, "hshield/attack1.wav", 1, ATTN_NORM);
}

//void() skCheckCharge =
//{
//	// check for mad charge
//	if (!enemy_vis)
//		return;
//	if (time < self.attack_finished)
//		return;	
//	if ( fabs(self.origin_z - self.enemy.origin_z) > 32)
//		return;		// too much height change
//	if ( vlen (self.origin - self.enemy.origin) < 80)
//		return;		// use regular attack
//
//	// charge		
//	ai_attack_finished (2);
//	hshield_char_a1 ();
//}
//
//void() skCheckContinueCharge =
//{
//	if (time > self.attack_finished)
//	{
//		ai_attack_finished (3);
//		hshield_run1 ();
//		
//		return;		// done charging
//	}
//	
//	if (random() > 0.5)
//		sound (self, CHAN_WEAPON, "knight/sword2.wav", 1, ATTN_NORM);
//	else
//		sound (self, CHAN_WEAPON, "knight/sword1.wav", 1, ATTN_NORM);
//}

//===========================================================================

void()	hshield_stand1	=[	$stand1,	hshield_stand2	] {ai_stand();}
void()	hshield_stand2	=[	$stand2,	hshield_stand3	] {ai_stand();}
void()	hshield_stand3	=[	$stand3,	hshield_stand4	] {ai_stand();}
void()	hshield_stand4	=[	$stand4,	hshield_stand5	] {ai_stand();}
void()	hshield_stand5	=[	$stand5,	hshield_stand6	] {ai_stand();}
void()	hshield_stand6	=[	$stand6,	hshield_stand7	] {ai_stand();}
void()	hshield_stand7	=[	$stand7,	hshield_stand8	] {ai_stand();}
void()	hshield_stand8	=[	$stand8,	hshield_stand9	] {ai_stand();}
void()	hshield_stand9	=[	$stand9,	hshield_stand1	] {ai_stand();}

//===========================================================================

void()	hshield_walk1	=[	$walk1,		hshield_walk2	] {
sk_idle_sound();
ai_walk(2);}
void()	hshield_walk2	=[	$walk2,		hshield_walk3	] {ai_walk(5);}
void()	hshield_walk3	=[	$walk3,		hshield_walk4	] {ai_walk(5);}
void()	hshield_walk4	=[	$walk4,		hshield_walk5	] {ai_walk(4);}
void()	hshield_walk5	=[	$walk5,		hshield_walk6	] {ai_walk(4);}
void()	hshield_walk6	=[	$walk6,		hshield_walk7	] {ai_walk(2);}
void()	hshield_walk7	=[	$walk7,		hshield_walk8	] {ai_walk(2);}
void()	hshield_walk8	=[	$walk8,		hshield_walk9	] {ai_walk(3);}
void()	hshield_walk9	=[	$walk9,		hshield_walk10	] {ai_walk(3);}
void()	hshield_walk10	=[	$walk10,	hshield_walk11	] {ai_walk(4);}
void()	hshield_walk11	=[	$walk11,	hshield_walk12	] {ai_walk(3);}
void()	hshield_walk12	=[	$walk12,	hshield_walk13	] {ai_walk(4);}
void()	hshield_walk13	=[	$walk13,	hshield_walk14	] {ai_walk(6);}
void()	hshield_walk14	=[	$walk14,	hshield_walk15	] {ai_walk(2);}
void()	hshield_walk15	=[	$walk15,	hshield_walk16	] {ai_walk(2);}
void()	hshield_walk16	=[	$walk16,	hshield_walk17	] {ai_walk(4);}
void()	hshield_walk17	=[	$walk17,	hshield_walk18	] {ai_walk(3);}
void()	hshield_walk18	=[	$walk18,	hshield_walk19	] {ai_walk(3);}
void()	hshield_walk19	=[	$walk19,	hshield_walk20	] {ai_walk(3);}
void()	hshield_walk20	=[	$walk20,	hshield_walk1	] {ai_walk(2);}

//===========================================================================

void()	hshield_run1	=[	$run1,		hshield_run2	] {
sk_idle_sound();
ai_run (20);}
void()	hshield_run2	=[	$run2,		hshield_run3	] {ai_run(25);}
void()	hshield_run3	=[	$run3,		hshield_run4	] {ai_run(18);}
void()	hshield_run4	=[	$run4,		hshield_run5	] {ai_run(16);}
void()	hshield_run5	=[	$run5,		hshield_run6	] {ai_run(14);}
void()	hshield_run6	=[	$run6,		hshield_run7	] {ai_run(25);}
void()	hshield_run7	=[	$run7,		hshield_run8	] {ai_run(21);}
void()	hshield_run8	=[	$run8,		hshield_run1	] {ai_run(13);}

//============================================================================

void()	hshield_pain1	=[	$pain1,		hshield_pain2	] { sound (self, CHAN_VOICE, "hshield/pain1.wav", 1, ATTN_NORM);}
void()	hshield_pain2	=[	$pain2,		hshield_pain3	] {}
void()	hshield_pain3	=[	$pain3,		hshield_pain4	] {}
void()	hshield_pain4	=[	$pain4,		hshield_pain5	] {}
void()	hshield_pain5	=[	$pain5,		hshield_pain6	] {}
void()	hshield_pain6	=[	$stand1,	hshield_pain7	] {}
void()	hshield_pain7	=[	$stand5,	hshield_run1	] {}

//============================================================================

void()	hshield_die1	=[	$death1,	hshield_die2	] {ai_forward(10);}
void()	hshield_die2	=[	$death2,	hshield_die3	] {ai_forward(8);}
void()	hshield_die3	=[	$death3,	hshield_die4	]
{self.solid = SOLID_NOT; ai_forward(7);}
void()	hshield_die4	=[	$death4,	hshield_die5	] {}
void()	hshield_die5	=[	$death5,	hshield_die6	] {}
void()	hshield_die6	=[	$death6,	hshield_die7	] {}
void()	hshield_die7	=[	$death7,	hshield_die8	] {}
void()	hshield_die8	=[	$death8,	hshield_die9	] {ai_forward(10);}
void()	hshield_die9	=[	$death9,	hshield_die10	] {ai_forward(11);}
void()	hshield_die10	=[	$death10,	hshield_die11	] {}
void()	hshield_die11	=[	$death11,	hshield_die12	] {}
void()	hshield_die12	=[	$death12,	SUB_Null	] {}

void()	hshield_dieb1	=[	$deathb1,	hshield_dieb2	] {}
void()	hshield_dieb2	=[	$deathb2,	hshield_dieb3	] {}
void()	hshield_dieb3	=[	$deathb3,	hshield_dieb4	]
{self.solid = SOLID_NOT;}
void()	hshield_dieb4	=[	$deathb4,	hshield_dieb5	] {}
void()	hshield_dieb5	=[	$deathb5,	hshield_dieb6	] {}
void()	hshield_dieb6	=[	$deathb6,	hshield_dieb7	] {}
void()	hshield_dieb7	=[	$deathb7,	hshield_dieb8	] {}
void()	hshield_dieb8	=[	$deathb8,	hshield_dieb9	] {}
void()	hshield_dieb9	=[	$deathb9,	SUB_Null	] {}

void() hshield_die =
{
	CheckVampGlobe();
// check for gib
	if (self.health < -40)
	{
		Gib ("progs/h_hellkn.mdl", self.health);
		return;
	}

// regular death
	sound (self, CHAN_VOICE, "hshield/death1.wav", 1, ATTN_NORM);
	if (random() > 0.5)
		hshield_die1 ();
	else
		hshield_dieb1 ();
}


////============================================================================
//// not used
//void()	hshield_magica1 =[	$magica1,	hshield_magica2	] {ai_face();}
//void()	hshield_magica2 =[	$magica2,	hshield_magica3	] {ai_face();}
//void()	hshield_magica3 =[	$magica3,	hshield_magica4	] {ai_face();}
//void()	hshield_magica4 =[	$magica4,	hshield_magica5	] {ai_face();}
//void()	hshield_magica5 =[	$magica5,	hshield_magica6	] {ai_face();}
//void()	hshield_magica6 =[	$magica6,	hshield_magica7	] {ai_face();}
//void()	hshield_magica7 =[	$magica7,	hshield_magica8	] {hshield_shot(-2);}
//void()	hshield_magica8 =[	$magica8,	hshield_magica9	] {hshield_shot(-1);}
//void()	hshield_magica9 =[	$magica9,	hshield_magica10] {hshield_shot(0);}
//void()	hshield_magica10 =[	$magica10,	hshield_magica11] {hshield_shot(1);}
//void()	hshield_magica11 =[	$magica11,	hshield_magica12] {hshield_shot(2);}
//void()	hshield_magica12 =[	$magica12,	hshield_magica13] {hshield_shot(3);}
//void()	hshield_magica13 =[	$magica13,	hshield_magica14] {ai_face();}
//void()	hshield_magica14 =[	$magica14,	hshield_run1	] {ai_face();}
//
////============================================================================
//// not used
//void()	hshield_magicb1 =[	$magicb1,	hshield_magicb2	] {ai_face();}
//void()	hshield_magicb2 =[	$magicb2,	hshield_magicb3	] {ai_face();}
//void()	hshield_magicb3 =[	$magicb3,	hshield_magicb4	] {ai_face();}
//void()	hshield_magicb4 =[	$magicb4,	hshield_magicb5	] {ai_face();}
//void()	hshield_magicb5 =[	$magicb5,	hshield_magicb6	] {ai_face();}
//void()	hshield_magicb6 =[	$magicb6,	hshield_magicb7	] {ai_face();}
//void()	hshield_magicb7 =[	$magicb7,	hshield_magicb8	] {hshield_shot(-2);}
//void()	hshield_magicb8 =[	$magicb8,	hshield_magicb9	] {hshield_shot(-1);}
//void()	hshield_magicb9 =[	$magicb9,	hshield_magicb10] {hshield_shot(0);}
//void()	hshield_magicb10 =[	$magicb10,	hshield_magicb11] {hshield_shot(1);}
//void()	hshield_magicb11 =[	$magicb11,	hshield_magicb12] {hshield_shot(2);}
//void()	hshield_magicb12 =[	$magicb12,	hshield_magicb13] {hshield_shot(3);}
//void()	hshield_magicb13 =[	$magicb13,	hshield_run1] {ai_face();}
//
////============================================================================
//
//void()	hshield_magicc1 =[	$magicc1,	hshield_magicc2	] {ai_face();}
//void()	hshield_magicc2 =[	$magicc2,	hshield_magicc3	] {ai_face();}
//void()	hshield_magicc3 =[	$magicc3,	hshield_magicc4	] {ai_face();}
//void()	hshield_magicc4 =[	$magicc4,	hshield_magicc5	] {ai_face();}
//void()	hshield_magicc5 =[	$magicc5,	hshield_magicc6	] {ai_face();}
//void()	hshield_magicc6 =[	$magicc6,	hshield_magicc7	] {hshield_shot(-2);}
//void()	hshield_magicc7 =[	$magicc7,	hshield_magicc8	] {hshield_shot(-1);}
//void()	hshield_magicc8 =[	$magicc8,	hshield_magicc9	] {hshield_shot(0);}
//void()	hshield_magicc9 =[	$magicc9,	hshield_magicc10] {hshield_shot(1);}
//void()	hshield_magicc10 =[	$magicc10,	hshield_magicc11] {hshield_shot(2);}
//void()	hshield_magicc11 =[	$magicc11,	hshield_run1] {hshield_shot(3);}
//
////===========================================================================
//
//void()	hshield_char_a1	=[	$char_a1,	hshield_char_a2	] {ai_rush(20);}
//void()	hshield_char_a2	=[	$char_a2,	hshield_char_a3	] {ai_rush(25);}
//void()	hshield_char_a3	=[	$char_a3,	hshield_char_a4	] {ai_rush(18);  }
//void()	hshield_char_a4	=[	$char_a4,	hshield_char_a5	] {ai_rush(16); ai_melee(); }
//void()	hshield_char_a5	=[	$char_a5,	hshield_char_a6	] {ai_rush(14); ai_melee(); }
//void()	hshield_char_a6	=[	$char_a6,	hshield_char_a7	] {ai_rush(20); ai_melee(); }
//void()	hshield_char_a7	=[	$char_a7,	hshield_char_a8	] {ai_rush(21);  }
//void()	hshield_char_a8	=[	$char_a8,	hshield_char_a9	] {ai_rush(13); }
//void()	hshield_char_a9	=[	$char_a9,	hshield_char_a10	] {ai_rush(20);  }
//void()	hshield_char_a10=[	$char_a10,	hshield_char_a11	] {ai_rush(20); ai_melee();}
//void()	hshield_char_a11=[	$char_a11,	hshield_char_a12	] {ai_rush(18); ai_melee();}
//void()	hshield_char_a12=[	$char_a12,	hshield_char_a13	] {ai_rush(16); ai_melee();}
//void()	hshield_char_a13=[	$char_a13,	hshield_char_a14	] {ai_rush(14); ai_melee();}
//void()	hshield_char_a14=[	$char_a14,	hshield_char_a15	] {ai_rush(25);  }
//void()	hshield_char_a15=[	$char_a15,	hshield_char_a16	] {ai_rush(21);}
//void()	hshield_char_a16=[	$char_a16,	hshield_run1	] {ai_rush(13);}
//
////===========================================================================
//
//void()	hshield_char_b1	=[	$char_b1,	hshield_char_b2	]
//{skCheckContinueCharge (); ai_rush(23); ai_melee();}
//void()	hshield_char_b2	=[	$char_b2,	hshield_char_b3	] {ai_rush(17); ai_melee();}
//void()	hshield_char_b3	=[	$char_b3,	hshield_char_b4	] {ai_rush(12); ai_melee();}
//void()	hshield_char_b4	=[	$char_b4,	hshield_char_b5	] {ai_rush(22); ai_melee();}
//void()	hshield_char_b5	=[	$char_b5,	hshield_char_b6	] {ai_rush(18); ai_melee();}
//void()	hshield_char_b6	=[	$char_b6,	hshield_char_b1	] {ai_rush(8); ai_melee();}
//
//===========================================================================
//TESTING HERE - fw

void()	hshield_slice1	=[	$slice1,	hshield_slice2	] {ai_forward(32); sk_dashdmg();}
void()	hshield_slice2	=[	$slice2,	hshield_slice3	] {ai_forward(32); sk_dashdmg();}
void()	hshield_slice3	=[	$slice3,	hshield_slice4	] {ai_forward(32); sk_dashdmg();}
void()	hshield_slice4	=[	$slice4,	hshield_slice5	] {ai_forward(32); sk_dashdmg();}
void()	hshield_slice5	=[	$slice5,	hshield_slice6	] {ai_forward(32); sk_dashdmg();}
void()	hshield_slice6	=[	$slice6,	hshield_slice7	] {ai_forward(32); sk_dashdmg();}
void()	hshield_slice7	=[	$slice7,	hshield_slice8	] {ai_forward(32); sk_dashdmg();}
void()	hshield_slice8	=[	$slice8,	hshield_slice9	] {ai_forward(32); sk_dashdmg();}
void()	hshield_slice9	=[	$slice9,	hshield_slice10	] {ai_forward(32); sk_dashdmg();}
void()	hshield_slice10	=[	$slice10,	hshield_run1	] {ai_forward(32); sk_dashdmg();}

////===========================================================================
//
//void()	hshield_smash1	=[	$smash1,	hshield_smash2	] {ai_charge(1);}
//void()	hshield_smash2	=[	$smash2,	hshield_smash3	] {ai_charge(13);}
//void()	hshield_smash3	=[	$smash3,	hshield_smash4	] {ai_charge(9);}
//void()	hshield_smash4	=[	$smash4,	hshield_smash5	] {ai_charge(11);  }
//void()	hshield_smash5	=[	$smash5,	hshield_smash6	] {ai_charge(10);}
//void()	hshield_smash6	=[	$smash6,	hshield_smash7	] {ai_charge(7); }
//void()	hshield_smash7	=[	$smash7,	hshield_smash8	] {ai_charge(12);}
//void()	hshield_smash8	=[	$smash8,	hshield_smash9	] {ai_charge(2); }
//void()	hshield_smash9	=[	$smash9,	hshield_smash10	] {ai_charge(3); }
//void()	hshield_smash10	=[	$smash10,	hshield_smash11	] {ai_charge(0);  }
//void()	hshield_smash11	=[	$smash11,	hshield_run1	] {ai_charge(0);}
//
////============================================================================
//
//void()	hshield_watk1	=[	$w_attack1,	hshield_watk2	] {ai_charge(2);}
//void()	hshield_watk2	=[	$w_attack2,	hshield_watk3	] {ai_charge(0); }
//void()	hshield_watk3	=[	$w_attack3,	hshield_watk4	] {ai_charge(0);}
//void()	hshield_watk4	=[	$w_attack4,	hshield_watk5	] {ai_charge(0);}
//void()	hshield_watk5	=[	$w_attack5,	hshield_watk6	] {ai_charge(0);}
//void()	hshield_watk6	=[	$w_attack6,	hshield_watk7	] {ai_charge(0); }
//void()	hshield_watk7	=[	$w_attack7,	hshield_watk8	] {ai_charge(1);}
//void()	hshield_watk8	=[	$w_attack8,	hshield_watk9	] {ai_charge(4);}
//void()	hshield_watk9	=[	$w_attack9,	hshield_watk10	] {ai_charge(5); }
//void()	hshield_watk10	=[	$w_attack10,	hshield_watk11	] {ai_charge(3);}
//void()	hshield_watk11	=[	$w_attack11,	hshield_watk12	] {ai_charge(2);}
//void()	hshield_watk12	=[	$w_attack12,	hshield_watk13	] {ai_charge(2);}
//void()	hshield_watk13	=[	$w_attack13,	hshield_watk14	] {ai_charge(0);  }
//void()	hshield_watk14	=[	$w_attack14,	hshield_watk15	] {ai_charge(0);}
//void()	hshield_watk15	=[	$w_attack15,	hshield_watk16	] {ai_charge(0);}
//void()	hshield_watk16	=[	$w_attack16,	hshield_watk17	] {ai_charge(1);  }
//void()	hshield_watk17	=[	$w_attack17,	hshield_watk18	] {ai_charge(1);}
//void()	hshield_watk18	=[	$w_attack18,	hshield_watk19	] {ai_charge(3);}
//void()	hshield_watk19	=[	$w_attack19,	hshield_watk20	] {ai_charge(4);}
//void()	hshield_watk20	=[	$w_attack20,	hshield_watk21	] {ai_charge(6);  }
//void()	hshield_watk21	=[	$w_attack21,	hshield_watk22	] {ai_charge(7);}
//void()	hshield_watk22	=[	$w_attack22,	hshield_run1	] {ai_charge(3);}

//============================================================================

void() sk_idle_sound =
{
	if (random() < 0.2 && time > self.show_hostile)
		sound (self, CHAN_VOICE, "hshield/idle.wav", 1, ATTN_NORM);
}

void() hshield_pain_go =
{
	hshield_pain1 ();
	PainFinished(1);
}

void(entity attacker, float damage)	hshield_pain =
{
	if (self.pain_finished > time)
		return;

	if (time - self.pain_finished > 5)
	{	// always go into pain frame if it has been a while
		hshield_pain_go();
		return;
	}
	
	if ( ( random()*30 > damage ) )
		return;		// didn't flinch

	hshield_pain_go();
}

//float hshield_type;

void() hshield_melee =
{
//	hshield_type = hshield_type + 1;

	sound (self, CHAN_WEAPON, "hshield/slash1.wav", 1, ATTN_NORM);
//	if (hshield_type == 1)
//		hshield_slice1 ();
//	else if (hshield_type == 2)
//		hshield_smash1 ();
//	else if (hshield_type == 3)
//	{
//		hshield_watk1 ();
//		hshield_type = 0;
//	}
}

void()	sk_dashdmg =
{
	local	float	ldmg;
	local vector	spot1, spot2;
		spot1 = self.origin + self.view_ofs;
		spot2 = self.enemy.origin + self.enemy.view_ofs;

	if (self.health <= 0)
		return;

	float distance = vlen(spot1 - spot2);
	if (distance <= 40)
	{
		ldmg = 20 + 10 * random();
		T_Damage(self.enemy, self, self, ldmg);	// fiend leap counts as a ranged attack
		ai_attack_finished(0);	// free to keep going ham
		if (self.enemy.flags & FL_ONGROUND){
			self.enemy.flags = self.enemy.flags - FL_ONGROUND;
			self.enemy.velocity_z = 200;
		}
	}
}

void() monster_shield_knight_spawn =
{
	self.classname = "monster_shield_knight";
		
	self.solid = SOLID_SLIDEBOX;
	//self.movetype = MOVETYPE_STEP;

	setmodel (self, "progs/hknight.mdl");

	setsize (self, '-16 -16 -24', '16 16 40');

	self.th_stand = hshield_stand1;
	self.th_walk = hshield_walk1;
	self.th_run = hshield_run1;
	self.th_melee = hshield_slice1;
//	self.th_missile = hshield_magicc1;
	self.th_pain = hshield_pain;
	self.th_die = hshield_die;
	self.th_checkattack = CheckAttack;

	self.type = "brigade";	// no infighting amongst the hell death brigade legion squad

	if (self.deathtype == string_null)
		self.deathtype = "was slain by a Death Knight";

	walkmonster_start ();
}

void() monster_shield_knight_spawner = {mon_spawner_use(monster_shield_knight_spawn);}

/*QUAKED monster_shield_knight (1 0 0) (-16 -16 -24) (16 16 40) AMBUSH ? ? ? TRIGGERED NOTFOG NOTELEFRAG INSTAWAKE
"Shield" Knight, 250 health points.

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
@PointClass base(Monster) size(-16 -16 -24, 16 16 40) model({ "path": ":progs/hknight.mdl" }) = monster_shield_knight : "Shield knight" []
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
	precache_model2 ("progs/hknight.mdl");
	precache_model2 ("progs/k_spike.mdl");
	precache_model2 ("progs/h_hellkn.mdl");

	
	precache_sound2 ("hshield/attack1.wav");
	precache_sound2 ("hshield/death1.wav");
	precache_sound2 ("hshield/pain1.wav");
	precache_sound2 ("hshield/sight1.wav");
	precache_sound ("hshield/hit.wav");		// used by C code, so don't sound2
	precache_sound2 ("hshield/slash1.wav");
	precache_sound2 ("hshield/idle.wav");
	precache_sound2 ("hshield/grunt.wav");

	precache_sound ("knight/sword1.wav");
	precache_sound ("knight/sword2.wav");
	
	self.health = 250;
	setsize (self, '-16 -16 -24', '16 16 40');
	if ( monster_spawnsetup( monster_shield_knight_spawner ) ) return;
	
	addmonster(1);
	monster_shield_knight_spawn();
}
