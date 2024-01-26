// Evento Step do inimigo
if (distance_to_object(obj_player1) <= 64) {
    // Se o jogador está próximo, mova-se em direção ao jogador com velocidade lenta
    direction = point_direction(x, y, obj_player1.x, obj_player1.y);
    speed = speed_chase;
} else {
    // Se o jogador não está próximo, ande aleatoriamente
    if (random_timer > 0) {
        // Continue na direção aleatória por um tempo
        random_timer -= 1;
    } else {
        // Escolha uma nova direção aleatória apenas para as quatro direções cardeais
        var newDirection = irandom(3) * 90; // 0, 90, 180, 270
        // Verifica se a nova direção não resulta em colisão com obj_parede
        if (!place_meeting(x + lengthdir_x(speed_normal, newDirection), y + lengthdir_y(speed_normal, newDirection), obj_parede)) {
            direction = newDirection;
        }
        random_timer = irandom_range(60, 180);
    }
    speed = speed_normal;
}

// Movimento baseado na direção
if (!place_meeting(x + lengthdir_x(speed, direction), y + lengthdir_y(speed, direction), obj_parede)) {
    x += lengthdir_x(speed, direction);
    y += lengthdir_y(speed, direction);
}else{
	x += 0;
	y += 0;
}
