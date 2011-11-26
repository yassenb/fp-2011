(define (append1 a b)
    (if (null? a) b (cons (car a)  (append1 (cdr a)  b) )
  )
 )
