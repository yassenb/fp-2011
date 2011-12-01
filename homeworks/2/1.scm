(define (my-reverse l)
  (define (helper l res)
    (if (null? l)
      res
      (helper (cdr l) (cons (car l) res))))
  (helper l '()))
