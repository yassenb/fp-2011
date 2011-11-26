(define (sum_list_el l)
  (define (help lr res)
    (if (null? lr)
        res
        (help (cdr lr) (+ res (car lr)))))
  (help l 0)
  )

(sum_list_el '(1 2 3 4 5))
(sum_list_el '())

(define (sum_list_el2 l)
  (if (null? l)
      0
      (+ (car l) (sum_list_el2 (cdr l)))))

(sum_list_el2 '(1 2 3 4 5))
(sum_list_el2 '())