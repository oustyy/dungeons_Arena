var _direita, _esquerda, _baixo, _cima, _movimento_horizontal, _movimento_vertical, _velocidade_horizontal, _velocidade_vertical, _correr, _aceleracao, _freiagem, _checa_movimentacao, _aceleracao_spr, _spawn_box, _restar_room

_direita = (keyboard_check(vk_right)|| keyboard_check(ord("D")));
_esquerda = keyboard_check(vk_left)	|| keyboard_check(ord("A"));
_baixo = keyboard_check(vk_down)	|| keyboard_check(ord("S"));
_cima = keyboard_check(vk_up)		|| keyboard_check(ord("W"));
_correr = keyboard_check(vk_space)	|| keyboard_check(vk_shift);
_spawn_box = mouse_check_button(mb_left);

_restar_room = keyboard_check(ord("R"));


if _restar_room{ room_restart() }

if _spawn_box {
	instance_create_layer(mouse_x,mouse_y,"Instances",obj_caixa);
}

_checa_movimentacao = (_cima || _baixo  or  _esquerda || _direita);

_aceleracao = lerp(velocidade,velocidade_maxima,aceleracao);
_aceleracao_spr = lerp(image_speed,4,aceleracao)
_freiagem = lerp(velocidade,0,aceleracao)

_movimento_horizontal = _esquerda - _direita
_movimento_vertical = _cima - _baixo

_velocidade_horizontal = lengthdir_x(velocidade,movimentation_direction);
_velocidade_vertical = lengthdir_y(velocidade,movimentation_direction);


if _correr && _checa_movimentacao{
	
	timer -= 1
	velocidade_maxima = lerp(velocidade_maxima,6,aceleracao)
	if velocidade > 4{
		if timer <= 0{
		instance_create_layer(x,y-(random(5)),"Instances",obj_eft_poeira);
			timer = random_range(1,10);
			}
		sprite_index = spr_skeleton_run;
		}
}else{
	velocidade_maxima = lerp(velocidade_maxima,3,aceleracao)
	if velocidade <= 4{
		sprite_index = spr_skeleton_walk;
			
		}	
	

}

if(_checa_movimentacao){
	movimentation_direction = point_direction(0, 0, (_movimento_horizontal),(_movimento_vertical));
	velocidade = _aceleracao
}
else {
	

	velocidade = _freiagem
}


if(velocidade > 0) && (_checa_movimentacao) {
	image_speed = _aceleracao_spr
}else{image_speed = _freiagem}

if _velocidade_horizontal > 1 {
	image_xscale = -1
}else{ 
	if(_velocidade_horizontal) < -1{ 
	image_xscale = 1
	}
}


// Se não houver colisão ele se move normalmente
if (!place_meeting(x - _velocidade_horizontal, y - _velocidade_vertical, obj_parede)) {
    x -= _velocidade_horizontal;
    y -= _velocidade_vertical;
} else {
    // Se houver colisão, tenta mover apenas horizontalmente
    if (!place_meeting(x - _velocidade_horizontal, y, obj_parede)) {
        x -= _velocidade_horizontal;
    }
    // Se ainda houver colisão, tenta mover apenas verticalmente
    if (!place_meeting(x, y - _velocidade_vertical, obj_parede)) {
        y -= _velocidade_vertical;
    }
}

