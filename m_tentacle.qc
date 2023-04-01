
/*
==============================================================================

TEN-TACLE
Ten Tactical Tenties

==============================================================================
*/

//      Tentacle teleport behavior:
//      -when aggroed, travel to closest dest to player and attack
//      -After 4 attacks, move to a new random dest and attack
//      -After 4 attacks, move to closest dest to player and attack
//      -Loop the 2 above indefinitely if uninterrupted
//      -Stop attack if player breaks LOS
//      -After 4 seconds of not attacking, travel to closest dest to player and attack
//      -If player deals damage to tentacle and it doesn't die, travel to a random dest
//      -Tentacle will not travel to a dest if it will teledrag monster or itself
//      -Tentacle will gib on death to prevent weird corpse piles on singular dests
//      -Tentacle dests should respect target_lock 
//      -Tentacle falls asleep like tarbaby after a period of inactivity
//      -When inactive, tentacle should be buried in ground invisible to player with no hitbox

//ded
//      - has two head gibs, one for the tip and one for the base
//      - spits a big cluster of attacks that eventually home @ u

//melee
//      - when you get close, immediately (1-2frames) hits you and burrows away
//      - has knockback too
//      - decently heavy hit

float TENT_BALL_TURN_RATE	= 320;
float TENT_BALL_THINK_RATE	= 0.1;
float TENT_BALL_VEL			= 1000;

float DEDTENT_BALL_TURN_RATE	= 512;
float DEDTENT_BALL_THINK_RATE	= 0.1;
float DEDTENT_BALL_VEL			= 300;

$origin 0 0 24

$frame idle1

$frame burrow_dwn1 burrow_dwn2 burrow_dwn3 burrow_dwn4
$frame burrow_up1 burrow_up2 burrow_up3 burrow_up4

void() tent_stand     =[      $burrow_dwn4,       tent_stand    ] {ai_stand();}

void() tent_walk1     =[      $idle1,       tent_walk2    ] {
if (random() < 0.2)
	sound (self, CHAN_VOICE, "shalrath/idle.wav", 1, ATTN_IDLE);
ai_walk(6);}
void() tent_walk2     =[      $idle1,      tent_walk3	] {ai_stand();}
void() tent_walk3     =[      $idle1,      tent_walk4	] {ai_stand();}
void() tent_walk4     =[      $idle1,      tent_walk5	] {ai_stand();}
void() tent_walk5     =[      $idle1,      tent_walk6	] {ai_stand();}
void() tent_walk6     =[      $idle1,      tent_walk7	] {ai_stand();}
void() tent_walk7     =[      $idle1,      tent_walk8	] {ai_stand();}
void() tent_walk8     =[      $idle1,      tent_walk9	] {ai_stand();}
void() tent_walk9     =[      $idle1,      tent_walk10	] {ai_stand();}
void() tent_walk10    =[      $idle1,      tent_walk11	] {ai_stand();}
void() tent_walk11    =[      $idle1,      tent_walk12	] {ai_stand();}
void() tent_walk12    =[      $idle1,      tent_walk1	] {ai_stand();}

void() tent_burrowdwn1	=[      $burrow_dwn1,      tent_burrowdwn2	] {ai_stand();}
void() tent_burrowdwn2	=[      $burrow_dwn2,      tent_burrowdwn3	] {ai_stand();}
void() tent_burrowdwn3	=[      $burrow_dwn3,      tent_burrowdwn4	] {ai_stand();}
void() tent_burrowdwn4	=[      $burrow_dwn4,      tent_burrowdwn5	] {ai_stand();}
void() tent_burrowdwn5	=[      $burrow_dwn4,      tent_burrowdwn4	] {ai_stand(); tentacle_teleport();}

void() tent_burrowup1	=[      $burrow_up1,      tent_burrowup2	] {ai_stand();}
void() tent_burrowup2	=[      $burrow_up2,      tent_burrowup3	] {ai_stand();}
void() tent_burrowup3	=[      $burrow_up3,      tent_burrowup4	] {ai_stand();}
void() tent_burrowup4	=[      $burrow_up4,      tent_run1			] {ai_stand();}

void() tent_run1     =[      $idle1,      tent_run2    ] {ai_run(0);}
void() tent_run2     =[      $idle1,      tent_run3    ] {ai_run(0);}
void() tent_run3     =[      $idle1,      tent_run4    ] {ai_run(0);}
void() tent_run4     =[      $idle1,      tent_run5    ] {ai_run(0);}
void() tent_run5     =[      $idle1,      tent_run6    ] {ai_run(0);}
void() tent_run6     =[      $idle1,      tent_run7    ] {ai_run(0);}
void() tent_run7     =[      $idle1,      tent_run8    ] {ai_run(0);}
void() tent_run8     =[      $idle1,      tent_run9    ] {ai_run(0);}
void() tent_run9     =[      $idle1,       tent_run10  ] {ai_run(0);}
void() tent_run10    =[      $idle1,       tent_run11  ] {ai_run(0);}
void() tent_run11    =[      $idle1,       tent_run12  ] {ai_run(0);}
void() tent_run12    =[      $idle1,      tent_run1    ] {ai_run(0);
if (random() < 0.2)
	sound (self, CHAN_VOICE, "shalrath/idle.wav", 1, ATTN_IDLE);
}

void() tent_attack1     =[      $idle1,       tent_attack2    ] {
sound (self, CHAN_WEAPON, "wizard/wattack.wav", 1, ATTN_NORM);
ai_face();
}
void() tent_attack2     =[      $idle1,      tent_attack3    ] {ai_face();}
void() tent_attack3     =[      $idle1,      tent_attack4    ] {ai_face();}
void() tent_attack4     =[      $idle1,      tent_attack5    ] {ai_face();}
void() tent_attack5     =[      $idle1,      tent_attack6    ] {ai_face();}
void() tent_attack6     =[      $idle1,      tent_attack7    ] {ai_face();}
void() tent_attack7     =[      $idle1,      tent_attack8    ] {ai_face();}
void() tent_attack8     =[      $idle1,      tent_attack9    ] {TentMissile(0, 0);}
void() tent_attack9     =[      $idle1,      tent_attack10   ] {TentMissile(0, 0);}
void() tent_attack10    =[      $idle1,      tent_run1       ] {TentMissile(0, 0); tentacle_tele_count();}

void() tent_pain1       =[      $idle1, tent_pain2      ] {}
void() tent_pain2       =[      $idle1, tent_pain3      ] {}
void() tent_pain3       =[      $idle1, tent_pain4      ] {}
void() tent_pain4       =[      $idle1, tent_pain5      ] {}
void() tent_pain5       =[      $idle1, tent_run1      ] {}

void() tent_death1      =[      $idle1,        tent_death2     ] {}
void() tent_death2      =[      $idle1,        tent_death3     ] {self.solid = SOLID_NOT;}
void() tent_death3      =[      $idle1,        tent_death4     ] {}
void() tent_death4      =[      $idle1,        tent_death5     ] {}
void() tent_death5      =[      $idle1,        tent_death6     ] {}
void() tent_death6      =[      $idle1,        tent_death7     ] {}
void() tent_death7      =[      $idle1,        SUB_Null    ] {}

void() tentacle_tele_count =
{
	self.cnt += 1;
	if (self.cnt > 2)
	{
		self.cnt = 0;
		tent_burrowdwn1();
	}
	else
	return;
}

void() tentacle_teleport =
{
	entity teletar = tentacle_findteleports();
	if ((teletar.classname != "worldspawn") && (teletar.classname != "badtentdest"))
	{
		self.buddy = teletar;
		self.oldorigin = self.origin;
		self.origin = teletar.origin;
		if (walkmove_jitter(0,0))
		{
			setorigin(self, teletar.origin);

			dprint("Teletar.origin: ");
			dprint(vtos(teletar.origin));
			dprint(" SUCCESSFUL \n");

			tent_burrowup1();
		}
		else
		{
			self.origin = self.oldorigin;

			dprint("Teletar.origin: ");
			dprint(vtos(teletar.origin));
			dprint(" FAILED \n");

			tent_burrowdwn4();
		}
	tentacle_findteleports();
	}
}

entity() tentacle_findteleports =
{
	entity head = findradiusplus(BoundsCenter(self), 1024, classname, "info_tentacle_destination");
	while(head)
	{
	if ((head.classname != "badtentdest")
	&& (self.include == head.targetname)
	&& (self.buddy != head)
	&& !BoundsTouching(self.absmin, self.absmax, head.absmin, head.absmax, 2))
		return head;
	else
		head = head.chain;
	} 
	return world;
}

void( entity attacker, float damage ) tentacle_pain =
{
	if (self.health <= 0) return;
	if (self.pain_finished > time) return;

	sound (self, CHAN_VOICE, "shalrath/pain.wav", 1, ATTN_NORM);
	tent_pain1();
	
	PainFinished(3);
}

void() tentacle_die =
{
// check for gib
	 
	if (self.health < 1)
	{
		Gib ("progs/h_shal.mdl", self.health);
        TentMissileDed(0, 64);
        TentMissileDed(32, 64);
        TentMissileDed(-32, 128);
        TentMissileDed(-48, 96);
        TentMissileDed(48, 96);
		return;
	}

	sound (self, CHAN_VOICE, "shalrath/death.wav", 1, ATTN_NORM);
	tent_death1();
}

//=================================================================
//TentMissile
//=================================================================

void() TentMissileTouch =
{
	if (CheckProjectilePassthru()) return;
	if (other == self.owner)
		return;
    
	remove(self);
}

vector(entity targ, float turnrate) TentTurnToward =
{
	vector	vel, aimdir, temp, temp2, out;

	temp = targ.origin + '0 0 10';
	aimdir = temp - self.origin;
	aimdir = normalize(aimdir);
	vel = normalize(self.velocity);

	temp = CrossProduct(vel, aimdir);
	out = rotateVectorAround(vel, temp, turnrate * TENT_BALL_THINK_RATE);

	// don't turn past the desired direction
	temp2 = CrossProduct(out, aimdir);
	if ((temp * temp2) < 0)
		return aimdir;
	return out;
}

void() TentHome =
{
	float rate, dot;
	
	if (!enemy_alive())
	{
		return;
	}
	
	self.nextthink = time + TENT_BALL_THINK_RATE;
	rate = TENT_BALL_TURN_RATE;
	dot = normalize(self.velocity) * normalize(self.enemy.origin - self.origin);
	self.owner = self.trueowner;
    rate = TENT_BALL_TURN_RATE;

    if (self.attack_finished > time)
        self.velocity = TENT_BALL_VEL * TentTurnToward(self.enemy, rate);
    else
        self.velocity = TENT_BALL_VEL * TentTurnToward(self.enemy, rate * 0.1);

	self.think = TentHome;
}

void(float offset_side, float offset_up) TentMissile =
{
	entity 	missile;
	vector	dir;

	self.effects = self.effects | EF_MUZZLEFLASH;
	sound (self, CHAN_WEAPON, "shalrath/attack2.wav", 1, ATTN_NORM);
	makevectors(self.angles);
	
	dir = (enemy_vispos() + '0 0 10') - self.origin + enemy_aim_vertical();
	dir = normalize(dir);

	// if player has strafed around behind, don't lob the missile out of our ass
    // but only do this when he's dead, so our cool death attack works
	if ((self.owner.health > 0) && (angledif(self.ideal_yaw, self.angles_y) > 80))
	{
		dir_x = v_forward_x;
		dir_y = v_forward_y;
		dir = normalize(dir);
	}

	dir = dir + (v_up * offset_up) + (v_right * offset_side);
	dir = normalize(dir);

	missile = launch_projectile(self.origin + '0 0 32' + v_forward * 16, dir * TENT_BALL_VEL, "tentspit");

	SUB_ChangeModel (missile, "progs/w_spike.mdl");
	missile.nextthink = time + 0.1;
	missile.think = TentHome;
	missile.enemy = self.enemy;
    missile.attack_finished = time + 1.5;
    missile.dmg = 9;
	missile.touch = spike_touch;
}

void(float offset_side, float offset_up) TentMissileDed =
{
	entity 	missile;
	vector	dir;

	self.effects = self.effects | EF_MUZZLEFLASH;
	sound (self, CHAN_WEAPON, "shalrath/attack2.wav", 1, ATTN_NORM);
	makevectors(self.angles);
	
	dir = (enemy_vispos() + '0 0 10') - self.origin + enemy_aim_vertical();
	dir = normalize(dir);

	// if player has strafed around behind, don't lob the missile out of our ass
    // but only do this when he's dead, so our cool death attack works
	if ((self.owner.health > 0) && (angledif(self.ideal_yaw, self.angles_y) > 80))
	{
		dir_x = v_forward_x;
		dir_y = v_forward_y;
		dir = normalize(dir);
	}

	dir = dir + (v_up * offset_up) + (v_right * offset_side);
	dir = normalize(dir);

	missile = launch_projectile(self.origin + '0 0 32' + v_forward * 16, dir * 300, "tentspit");

	SUB_ChangeModel (missile, "progs/w_spike.mdl");
	missile.nextthink = time + 0.25;
	missile.think = TentHomeDed;
	missile.enemy = self.enemy;
    missile.attack_finished = time + 0.5 + (random() * 0.4);
    missile.dmg = 9;
	missile.touch = spike_touch;
}

void() TentHomeDed =
{
	float rate, dot;
	
	if (!enemy_alive())
	{
		return;
	}
	
	self.nextthink = time + TENT_BALL_THINK_RATE;
	rate = TENT_BALL_TURN_RATE;
	dot = normalize(self.velocity) * normalize(self.enemy.origin - self.origin);
	self.owner = self.trueowner;
    rate = DEDTENT_BALL_TURN_RATE;

    if (self.attack_finished > time)
        self.velocity = DEDTENT_BALL_VEL * TentTurnToward(self.enemy, rate);
    else if ((self.attack_finished + 2) < time)
        self.velocity = TENT_BALL_VEL * TentTurnToward(self.enemy, rate * 0.5);
    else
        self.velocity = TENT_BALL_VEL * TentTurnToward(self.enemy, rate * 0.1);

	self.think = TentHomeDed;
}

float() TentCheckAttack =
{
    if (!CheckClearAttack()) return FALSE;

	if (random() < .5)
	{
		self.th_missile();
		ai_attack_finished (2*random());
		return TRUE;
	}
	
	return FALSE;
}

//=================================================================
void() monster_tentacle_spawn =
{
	self.classname = "monster_tentacle";
		
	self.solid = SOLID_SLIDEBOX;
	//self.movetype = MOVETYPE_STEP;
	
	setmodel (self, "progs/mon_tentacle.mdl");
	setsize (self, VEC_HULL_MIN, VEC_HULL_MAX);
	self.health = 99;

	self.th_stand = tent_stand;
	self.th_walk = tent_walk1;
	self.th_run = tent_run1;
	self.th_die = tentacle_die;
	self.th_pain = tentacle_pain;
	self.th_missile = tent_attack1;
	self.th_checkattack = TentCheckAttack;

	if (self.deathtype == string_null)
		self.deathtype = "was F%@&'ed by a Tentacle";
		
	//self.think = walkmonster_start;
	//self.nextthink = time + 0.1 + random ()*0.1;	
	
	walkmonster_start();
}

void() monster_tentacle_spawner = {mon_spawner_use(monster_tentacle_spawn);}


/*QUAKED monster_tentacle (1 0 0) (-32 -32 -24) (32 32 40) AMBUSH ? ? ? TRIGGERED NOTFOG NOTELEFRAG INSTAWAKE
Shub Tentacle, 200 health points.
Stationary monster. Fires Scrag projectiles with light homing towards the player.

Randomly selects a info_tentacle_teleport with the targetname of the "include" key and will teleport between these points.
Will try and select a point clear of other entities, otherwise will not teleport as to prevent telefragging.

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
"include" set to a info_tentacle_teleport to make him teleport to a point after being hurt
*/
/*FGD
@PointClass base(Monster) size(-32 -32 -24, 32 32 64) model({ "path": ":progs/mon_tentacle.mdl" }) = monster_tentacle : "Tentacle" []
*/
void() monster_tentacle =
{
	if (!SUB_ShouldSpawn()) return;
	if (nomonster()) return;
	if (deathmatch)
	{
		remove(self);
		return;
	}
    self.yaw_speed = 40;
	precache_model2 ("progs/mon_tentacle.mdl");
	precache_model2 ("progs/h_shal.mdl");
	precache_model2 ("progs/w_spike.mdl");
	
	precache_sound2 ("wizard/wattack.wav");
	precache_sound2 ("shalrath/attack2.wav");
	precache_sound2 ("shalrath/death.wav");
	precache_sound2 ("shalrath/idle.wav");
	precache_sound2 ("shalrath/pain.wav");
	precache_sound2 ("shalrath/sight.wav");
	
	self.health = 99;
	setsize (self, VEC_HULL_MIN, VEC_HULL_MAX);
	if ( monster_spawnsetup( monster_tentacle_spawner ) ) return;
	
	addmonster(1);

	if (!self.include)
	{
		dprint("monster_tentacle at ");
		dprint(vtos(self.origin));
		dprint(" has no 'include' key, and thus will never teleport!\n");
	}
	
	monster_tentacle_spawn();
}



