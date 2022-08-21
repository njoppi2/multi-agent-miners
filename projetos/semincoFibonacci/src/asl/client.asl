!run(5).

+!run(0).
+!run(S) <- 
  .my_name(Me);
  N = math.round(math.random(25)+1);
  Start = system.time;
  .send(fibonacher,askOne,fib(N,_),fib(_,F));
  .print("Fibonacci ", N, " é ", F, " Tempo: ", system.time-Start);
  !run(S-1).
