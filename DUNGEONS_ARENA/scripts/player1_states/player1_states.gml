

function player1_states_free(){
global.player_action = "idle";
//moviment
var keyUp = keyboard_check(ord("W"));
var keyDown = keyboard_check(ord("S"))
var keyLeft = keyboard_check(ord("A"));
var keyRight = keyboard_check(ord("D"));




var key = keyRight - keyLeft != 0 || keyDown - keyUp != 0;

if(keyboard_check_pressed(ord("F")) && (global.arma == true) ){
	image_index = 0;
	
	state = player1_states_atk_light;
	}



if(key){
	global.player_action = "run";
	global.player_image_speed = image_speed;
	sprite_index = spr_perso_run_ns;
	dir = point_direction(0, 0, keyRight - keyLeft, keyDown - keyUp);
	
	speedh = lengthdir_x(speedc * key,dir);
	speedv = lengthdir_y(speedc * key,dir);
	if(speedh !=0){
		image_xscale = sign(speedh);
		global.player_directio = image_xscale;
			
	}
}else{
	sprite_index = spr_perso_idle_ns;
	speedh =0;
	speedv = 0;
}


if(place_meeting(x+speedh,y,obj_parede)){
	
	while(!place_meeting(x+sign(speedh),y,obj_parede)){
		x+= sign(speedh);
	}
	speedh = 0;	
}
if(place_meeting(x,y+speedv,obj_parede)){
	
	while(!place_meeting(x,y+sign(speedv),obj_parede)){
		y+= sign(speedv);
	}
	speedv = 0;	
}




x = x + speedh;

y = y + speedv;
}

function player1_states_atk_light(){
	global.player_image_speed = image_speed;
	sprite_index = spr_perso_attack_ns;
	global.player_action = "ataque 1";
	
	if(image_index >= image_number -3 && keyboard_check_pressed(ord("F"))){
			global.player_action = "ataque 2";
			image_index = 0;
			state = player1_states_atk_light2;
	
	}
	
	if(image_index >= image_number -1){
			
		
			
			state = player1_states_free;	
	
	}
}


function player1_states_atk_light2(){
		global.player_image_speed = image_speed;
		
		sprite_index = spr_perso_attack_2_ns;
		if(image_index >= image_number -1){
			
			
			state = player1_states_free;	
	
	}
	
	}
	

	
	



