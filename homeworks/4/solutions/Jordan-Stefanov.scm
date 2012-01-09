(define (app in.l1 in.l2)
  (if
   (eq? in.l1 '())
   in.l2
   (cons (car in.l1) (app (cdr in.l1) in.l2))
   )
  )

(define (swap-pairs in.l)
  (cond
    ((eq? in.l '()) in.l)
    ((eq? (cdr in.l) '()) in.l)
    (else (cons (cadr in.l) (cons (car in.l) (swap-pairs (cddr in.l)))))))
