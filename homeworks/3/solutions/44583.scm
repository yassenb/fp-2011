#lang racket
(define (pred2make1 pred1 pred2 op)
   (define (myand arg)
     (and (pred1 arg) (pred2 arg))
   )
   (define (myor arg)
     (or (pred1 arg) (pred2 arg))
   )
   (if (eq? op 'and)
       myand
       myor
   )
)
