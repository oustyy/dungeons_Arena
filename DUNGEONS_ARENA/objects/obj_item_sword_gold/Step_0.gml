/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if distance_to_object(obj_player1)<= global.distancia_coleta && global.arma == false{
	global.coleta = true;
	image_index = 1
	if (keyboard_check(ord("E"))) {
	instance_create_layer(x,y,"instances",sword);
	instance_destroy();
	global.coleta = false;
	
	}
}else {
		image_index = 0
		global.coleta = false;
}
	



//Codigo para ficar subindo e descendo movimento senoidal
y = point_y + sin(tempo*frequency)*amplitude;
tempo ++;