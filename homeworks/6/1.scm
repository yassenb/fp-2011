(define (foldl f x ys)
  (if (null? ys)
    x
    (foldl f (f x (car ys)) (cdr ys))))

(define (filter pred? l)
  (apply append
         (map (lambda (x)
                (if (pred? x) (list x) '()))
              l)))
