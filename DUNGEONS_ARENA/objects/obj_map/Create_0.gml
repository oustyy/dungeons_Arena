
north = 1;
west = 2;
east = 4;
south = 8;
qtd_inimigo = 10



var layer_id = layer_tilemap_get_id("TileMapDungeons");

cell_size = 32;
grid_width = room_width div cell_size;
grid_height = room_height div cell_size;
grid = ds_grid_create(grid_width,grid_height);
ds_grid_clear(grid,0);

randomize();

var xx = grid_width div 2;
var yy = grid_height div 2;
var dir = irandom(3);
var room_count = 9;
var room_size = 3;

for(var i =0; i< room_count; i++){
	
	ds_grid_set_region(grid,xx - room_size,yy - room_size,xx + room_size,yy + room_size,1);
	
	var path_distance = room_size *5;
	
	while(path_distance >0){
		
			
			grid[# xx,yy] = 1;
			
			xx+=lengthdir_x(1,dir * 90);
			yy+=lengthdir_y(1,dir * 90);
			
			xx = clamp(xx,4,grid_width - 4);
			yy = clamp(yy,4,grid_height - 4);
			var x1 = xx * cell_size + cell_size / 2;
			var y1 = yy * cell_size + cell_size / 2;
			if(!instance_exists(obj_player1)){
			instance_create_layer(x1,y1,"instances",obj_player1);
			}
			if(!instance_exists(obj_item_sword_white)){
			instance_create_layer(x1+random_range(-75,75),y1+random_range(-75,75),"instances",obj_item_sword_white);
			}
			if(!instance_exists(obj_item_sword_gold)){
			instance_create_layer(x1+random_range(-75,75),y1+random_range(-75,75),"instances",obj_item_sword_gold);
			}
			
			
		
			path_distance --;
	}
	if(path_distance == 0){
		//create room
		
		ds_grid_set_region(grid,xx - room_size,yy - room_size,xx + room_size,yy + room_size,1);
		
		
		dir = irandom(3);
	}
}
for(var xx = 0; xx< grid_width; xx++){
	for(var yy = 0; yy< grid_height; yy++){
		if(grid[# xx,yy] !=1 ){
			var n_tile = grid[# xx,yy -1] == 0;
			var w_tile = grid[# xx -1,yy] == 0;
			var e_tile = grid[# xx +1,yy] == 0;
			var s_tile = grid[# xx,yy + 1] == 0;
			instance_create_layer(xx * cell_size, yy * cell_size,"instances",obj_parede);
			var index = n_tile * north + w_tile * west + e_tile * east + s_tile * south + 1;
			
			tilemap_set(layer_id,index,xx,yy);
			
		}else if(grid[# xx,yy] == 1){
			if(qtd_inimigo > random(10)){
				if random(100)<= 10{
				instance_create_layer(x1,y1,"instances",obj_inimigo_1);
				qtd_inimigo --
				}
			}
			
			tilemap_set(layer_id,17,xx,yy);	
		}
	}
}


grid_path = mp_grid_create(0,0,grid_width,grid_height,cell_size,cell_size);
mp_grid_add_instances(grid_path,obj_parede,false);



