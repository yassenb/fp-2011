(define (reverse l)
  (define (rev2 l a)
    (if (null? l)
      a
      (rev2 (cdr l) (cons (car l) a))))
  (rev2 l '()))
