;'(FN 44740 Iordan Babukov)

(define (merge l1 l2)
  (cond ((null? l1) l2)
        ((null? l2) l1)
        ((equal? (map car (map car l1 l2)))
         (list (cons (map car (map car l1 l2))) (append (map cdr (map car                            r l1) (cdr l2)))) l2 ))))
        
        
         
       
   
   
(merge (list (cons 'negative (list -1 -2 -3)) (cons 'natural (list 1 2 3)))
       (list (cons 'negative (list -1 -2 -3 -4)) (cons 'natural (list 2 3 4))))

