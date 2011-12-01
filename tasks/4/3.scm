(define (my-map f l)
  (if (null? l)
    l
    (cons (f (car l)) (my-map f (cdr l)))))
