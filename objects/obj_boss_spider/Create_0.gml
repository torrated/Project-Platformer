/// @description 

// Inherit the parent event
event_inherited();

vidas = 3;

state = BOSSSTATE.IDLE;
state_anterior = state; // se usa para que despues de ser golpeado, vuelva al estado en que estaba
overwrite = false; // para habilitar o no el cambiar el sprite dependiendo del STATE

sprite_idle = spr_spider_boss_idle;
sprite_ataque_1 = spr_spider_boss_ataque_1;
sprite_ataque_2 = spr_spider_boss_ataque_2;
sprite_movimiento = spr_spider_boss_movimiento;
sprite_damaged = spr_spider_boss_damaged;
sprite_muerto = spr_spider_boss_muerto;

secuencia_ataque = [ //IDLE;ATAQUE1;ATAQUE2;IDLE;MOVIMIENTO
	BOSSSTATE.IDLE,
	BOSSSTATE.ATAQUE1,
	BOSSSTATE.IDLE,
	BOSSSTATE.ATAQUE2,
	BOSSSTATE.IDLE,
	BOSSSTATE.MOVIMIENTO
	];