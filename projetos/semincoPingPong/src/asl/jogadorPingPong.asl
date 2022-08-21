!start.

+!start: .my_name(bia) <-
	!startPingPong(tom);
	!startPingPong(robert);
	!startPingPong(clara).
+!start.

+!startPingPong(AgenteAdversario) <-
	.print("Enviado ping para ", AgenteAdversario);
	.send(AgenteAdversario, achieve, ping).

+!ping[source(AgenteAdversario)] <-
	.wait(500);
	.print("Enviado pong para ", AgenteAdversario);
	.send(AgenteAdversario, achieve, pong).

+!pong[source(AgenteAdversario)] <-
	.wait(500);
	.print("Enviado ping para ", AgenteAdversario);
	.send(AgenteAdversario, achieve, ping).

