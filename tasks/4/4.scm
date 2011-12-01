(define (filter pred? l)
  (if (null? l)
    l
    (let ((h (car l))
          (ft (filter pred? (cdr l))))
      (if (pred? h)
        (cons h ft)
        ft))))
