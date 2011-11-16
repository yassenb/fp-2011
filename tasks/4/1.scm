(define (foldl f x ys)
  (if (null? ys)
    x
    (foldl f (f x (car ys)) (cdr ys))))
