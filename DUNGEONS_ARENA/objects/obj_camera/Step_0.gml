if(instance_exists(obj_player1)){
	
	x=lerp(x,target.x-cam_largura/2,cam_velc);
	y=lerp(y,target.y-cam_altura/2,cam_velc);
	
	
	x = clamp(x,0,room_width - cam_largura);
	y = clamp(y,0,room_height - cam_altura);
	
	camera_set_view_pos(view_camera[0],x,y);
	
}else{
	target = -1;
}





