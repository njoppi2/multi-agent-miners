genitor(fred, maria).
genitor(bin, jack).
genitor(pam, bob).
genitor(tom, bob).
genitor(pam, liz).
genitor(tom, liz).

genitor(bob, ana).
genitor(bob, pat).
genitor(bia, ana).
genitor(bia, pat).

genitor(liz,bill).
genitor(trump,bill).

genitor(mary,tim).
genitor(trump,tim).

genitor(pat, jim).
genitor(kim, jim).

mulher(maria).
mulher(pam).
mulher(bia).
mulher(liz).
mulher(mary).
mulher(ana).
mulher(pat).

homem(fred).
homem(tom).
homem(bob).
homem(trump).
homem(kim).
homem(bill).
homem(tim).
homem(jim).
homem(bin).
homem(jack).

idade(bin,87).
idade(jack,65).
idade(fred, 56).
idade(maria, 30).
idade(pam, 98).
idade(tom, 70).
idade(bob, 45).
idade(bia, 43).
idade(liz, 47).
idade(trump, 54).
idade(mary, 51).
idade(ana, 12).
idade(pat, 25).
idade(kim, 27).
idade(bill, 15).
idade(tim, 17).
idade(jim, 1).

pai(PaiX, X) :- genitor(PaiX, X) & homem(PaiX).
avo(AvoX, X) :- genitor(PaiX, X) & genitor(AvoX, PaiX) & homem(AvoX). //AvoX é avô de X 
irmao(IrmaoX, X) :- genitor(PaiAmbos, X) & genitor(PaiAmbos, IrmaoX) & homem(IrmaoX) & X \== IrmaoX. //Y é irmão de X
avo(ListaAvos) :- .setof(AvoX, genitor(PaiX, X) & pai(AvoX, PaiX), ListaAvos).

!start.

+!start <-
	?pai(PaiTim, tim);
	.print("o pai de tim é ", PaiTim);
	?avo(AvoJim, jim);
	.print("o avô de jim é ", AvoJim);
	?irmao(IrmaoLiz, liz);
	.print("o irmão de liz é ", IrmaoLiz);
	?avo(ListaAvos);
	.print("os avôs são ", ListaAvos).

