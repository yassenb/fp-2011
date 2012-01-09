(define (filter1 pred? l)
  (define (helper pred? l1 l2)
    (cond ((null? l1) l2)
          ((pred? (car l1)) (helper pred? (cdr l1) (append l2 (list(car l1)))))
          (else (helper pred? (cdr l1) l2))))
  (helper pred? l '()))

;(filter1 (lambda(x) (not(= x 4))) '(1 2 3 4))

(define (simple_merge l1 l2)
  (cond((null? l2) l1)
       ((member (car l2) l1) (simple_merge l1 (cdr l2)))
       (else (simple_merge (append l1 (list (car l2))) (cdr l2)))))

;(merge '(1 2 3) '(2 3 4))

;primeren sublist ('(mat) (1 2 3))

;(simple_merge '(('(mat) (1 2)) ('(mat) (2 3))) '(('(mat) (1 2)) ('(mat) (11 12))))

(define (merge l1 l2)
  (define (helper list1 llist2 res)
    (cond ((equal? (car(car list1)) (car(car list2))) (helper (cdr list1) list2 (append list2 (simple_merge (cdr(car list1)) (cdr (car list2))))))
          ((null? list2) res)
          ((null? list1) (helper l1 (cdr list2) res))
          (else (helper (cdr list1)  