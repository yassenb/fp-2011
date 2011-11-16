(define (foldr f x ys)
  (if (null? ys)
    x
    (f (car ys) (foldr f x (cdr ys)))))
