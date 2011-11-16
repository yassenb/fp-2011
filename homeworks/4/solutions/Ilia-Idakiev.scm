#lang racket

;3.11

(define (app a b)
  ((lambda x x) 'a b))

;2.7

(define (func f)
  (lambda (x)
    (or (f (abs x)) (f (- (abs x))))))

;3.10

(define (switch l)
  (if (< (length l) 2)
    l
    (cons (car(cdr l)) (cons (car l) (switch (cdr(cdr l)))))))

;2.6

(define (func3 f n)
  (lambda(x)
    (define (func2 n)
      (if (zero? n)
        x
        (f (func2 (- n 1)))))
    (func2 n)))

;2.5

(define (func4 f)
  (lambda (x)
    (define (der y)
      (/ (- (x (+ y f)) (x y))
         f))
    der))

;2.4

(define (check pred?)
  (lambda (x)
    (not (pred? x))))

;2.3

(define (func5 f g)
  (lambda (x)
    (f (g x))))

;2.1

(define (min1 a b)
  (if(< a b) a
     b))
(define (max1 a b)
  (if(> a b) b
     a))
(define (func6 op arg1 arg2 arg3)
  (op (op arg1 arg2)(op arg2 arg3)))
