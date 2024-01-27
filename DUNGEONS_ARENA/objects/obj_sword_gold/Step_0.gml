/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor




x = obj_player1.x
y = obj_player1.y
image_xscale = global.player_directio;


switch (global.player_action) {
    case "run":
            sprite_index = spr_sword_gold_run;
        break;

    case "ataque 1":
            sprite_index = spr_sword_gold_attack;
			
        break;

    case "ataque 2":
        
            sprite_index = spr_sword_gold_attack_2;
        
        break;

    case "idle":
            sprite_index = spr_sword_gold_idle;
        break;
}

if(keyboard_check(ord("G"))){
	global.arma = false;
	instance_create_layer(x,y,"instances",obj_item_sword_gold);
	instance_destroy();
}





