function EnemigoState_Quieto(){
	if (contador = 0)
	{
		if (irandom(1)) image_xscale *= -1;
		contador = 120; //2 segundos
	}
	else
		contador -= 1;
}