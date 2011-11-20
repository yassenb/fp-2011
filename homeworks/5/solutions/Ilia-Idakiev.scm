(define (flatten a)
    (cond ((null? a) '())
          ((list? (car a)) (append flatten (car a) (flatten (cdr a))))
          (else (append (list (car a) (flatten (cdr a)))))))

(define (isMember? x y)
  (cond ((null? y) #f)
        ((equal? x (car y)) #t) 
        (else (isMember? x (cdr y)))))

(define (rmDuplicates l)
  (cond ((null? l) '())
        ((isMember? (car l) (cdr l)) (rmDuplicates (cdr l)))
        (else (cons (car l) (rmDuplicates (cdr l))))))

(define app (lambda x
    (define (func l1 l2)
      (if (null? l1) l2
          (cons (car l1) (func (cdr l1) l2))))                 
    (define (func2 l)
        (if (null? l) '()
            (func (car l) (func2 (cdr l)))))
    (func2 x)))
