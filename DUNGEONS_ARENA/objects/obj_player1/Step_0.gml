depth = -y
state();
var keyUp = keyboard_check(ord("W"));
var keyDown = keyboard_check(ord("S"))
var keyLeft = keyboard_check(ord("A"));
var keyRight = keyboard_check(ord("D"));




var key = keyRight - keyLeft != 0 || keyDown - keyUp != 0;

if(key== true){
	if(!audio_is_playing(snd_passos_1)){
	audio_play_sound(snd_passos_1,1,0)
	}
}else{
	audio_stop_sound(snd_passos_1)
}




