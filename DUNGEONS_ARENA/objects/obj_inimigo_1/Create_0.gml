// Criação de variáveis no evento Create do inimigo
speed_patrulhando = 0.2; // Velocidade para movimento aleatório
speed_chase = 0.5; // Velocidade para perseguição ao jogador
random_timer = irandom_range(60, 180); // Timer inicial aleatório
stop_timer = irandom_range(60,180);
enemy_range_detect = 180;
enemy_range_atack = 16;
caminho = path_add();
estado = random_range(0,1);