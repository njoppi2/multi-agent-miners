+?fib(0,0).
+?fib(1,1).
+?fib(N,X) <- ?fib(N-1,A); ?fib(N-2,B); X = A+B.
