(define (rev1 l)
  (define (rev-help x y)
  (if (null? x) y
      (rev-help (cdr x) (cons (car x) y))))
  (rev-help l '()))
(rev1 (quote(o l l e H))) 
