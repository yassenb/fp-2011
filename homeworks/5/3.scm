(define (foldr f x ys)
  (if (null? ys)
    x
    (f (car ys) (foldr f x (cdr ys)))))

(define (foldl f x ys)
  ((foldr (lambda (y g) (lambda (x) (g (f x y))))
          (lambda (x) x)
          ys)
   x))
