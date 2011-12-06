(define l1 (list (cons 'n '(1 2 3)) (cons 'b '(6 7 8))))
(define l2 (list (cons 'n '(2 3 4)) (cons 'z '(6 7 8))))
;vru6ta ni mnojestvo bez povtoreniq
(define (remove-duplicates l)
  (cond ((null? l) '())
        ((member (car l) (cdr l)) (remove-duplicates (cdr l)))
        (else (cons (car l) (remove-duplicates (cdr l))))))
     
 ;  
(define (merge lst1 lst2)
  (map (lambda(y)((map (lambda(x)(if (eq? (car y) (car x)) 
                                     (cons (car y) (append (cdr y) (cdr x))) (cons (car x) (cdr x)))) lst_2)) lst1)))


(merge l1 l2)
  
  





