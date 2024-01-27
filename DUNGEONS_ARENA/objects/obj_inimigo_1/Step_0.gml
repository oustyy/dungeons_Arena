
var _checa_player_distance = distance_to_object(obj_player1) <= enemy_range_detect;
var _checa_ataque_distance = distance_to_object(obj_player1) <= enemy_range_atack;
depth = -y


if (_checa_player_distance && _checa_ataque_distance == false) {
	
    // Se o jogador está próximo, mova-se em direção ao jogador com velocidade maxima
	var _x1 = x;
	var _y1 = y;
	var _x2 = (obj_player1.x div 32)*32+16;
	var _y2 = (obj_player1.y  div 32)*32+16;
	// Se não estiver muito perto do player ele vai andar em direção a ele
	if (_checa_ataque_distance == false ){
		if(mp_grid_path(obj_map.grid_path,caminho,_x1,_y1,_x2,_y2,true)){
			path_start(caminho,speed_chase,path_action_stop,false);
			sprite_index = spr_slime_enemy_walk;
			if(x < obj_player1.x){ 
				image_xscale = -1;
			}else{
				image_xscale = 1;
			}

		}
			
	}
		
}

else{
	if (_checa_player_distance == false) {
	path_end();
	sprite_index = spr_slime_enemy_idle;
	}
	
	
	else{
		path_end();
		sprite_index = spr_slime_enemy_atack;

	}
}
