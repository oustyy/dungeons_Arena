/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


image_xscale = scale;
image_yscale = scale;

scale -= 0.05;

if scale <= 0 {
	instance_destroy();
}