(define (merge list1 list2)
  (define (union2 l1 l2)
    (define (searchElemInList e l)
      (cond ((null? l) #f)
            ((= e (car l)) #t)
            (else (searchElemInList e (cdr l)))))
    (cond ((null? l2) l1)
          ((searchElemInList (car l2) l1)(union2 l1 (cdr l2)))
          (else (append (list (car l2)) (union2 l1 (cdr l2)) ))))
  (cond ((null? list2) list1)
        (else
         (