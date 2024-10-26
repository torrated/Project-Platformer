function EnemigoState_Quieto(){
	// la imagen puede voltearse (o no) cada 2 segundos
	if (contador = 0)
	{
		if (irandom(1)) image_xscale *= -1;
		contador = 120; //2 segundos
	}
	else
		contador -= 1;
}