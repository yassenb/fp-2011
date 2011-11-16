#lang racket
(define (fib n)
  (define (fib-i a b counter)
    (if (= counter 0) b
        (fib-i b (+ a b ) ( - counter 1))))
  (fib-i 2 3 n)
  )

(fib 2) 
