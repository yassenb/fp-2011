(define (foldr f x ys)
  (if (null? ys)
    x
    (f (car ys) (foldr f x (cdr ys)))))

(define (my-map f xs)
  (foldr (lambda (x ys)
           (cons (f x) ys))
         '()
         xs))

(define (filter pred? xs)
  (foldr (lambda (x xs)
           (if (pred? x)
             (cons x xs)
             xs))
         '()
         xs))
