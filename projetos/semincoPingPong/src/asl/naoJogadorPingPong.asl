-!_::NoPlan[error(no_relevant), source(AgenteAdversario)] <-
		.print("Não sei como fazer ", NoPlan, ". Vou pedir para ", AgenteAdversario, ". :(");
		.send(AgenteAdversario, askHow, {+!NoPlan[_]}, Result);
		.add_plan(Result);
		!NoPlan[source(AgenteAdversario)].
