/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if aceleracao > 0 { aceleracao -=1}





var _dir_caixa = point_direction(x, y, obj_playerTeste_1.x, obj_playerTeste_1.y);
var _move_x_box = lengthdir_x(3, _dir_caixa);
var _move_y_box = lengthdir_y(3, _dir_caixa);

if place_meeting(x,y,obj_playerTeste_1) {
	aceleracao = 2

}
	x -= _move_x_box*aceleracao

	y -= _move_y_box*aceleracao