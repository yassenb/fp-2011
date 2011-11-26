; arg(list, element, position), position is where to be put the element
; positions start from 0, n-th element is on position (n-1)
(define (putc lst el pos)
  (define (iter currentPos l)
          (if (= currentPos pos) 
              (append (list el) (list(car l)) (cdr l))
              (append (list(car l)) (iter (+ currentPos 1) (cdr l)))))  
  (cond ((null? lst) (list el))
        ((>= pos (length lst)) (append (list el) lst))
        ((<= pos 0) (append lst (list el)))
        (else (iter 0 lst))))

;(putc '() 'a 0) ; (a)
;(putc '(a) 'b 0) ; (a b)
;(putc '(a) 'b -1); (a b)
;(putc '(a) 'b 2) ; (b a)
;(putc '(a) 'b 10); (b a)
;(putc '(a b c d) 'e 2); (a b e c d)
;(putc '(a b) 'c 0); (a b c)
;(putc '(a b) 'c 1); (a c b)
;(putc '(a b) 'c 2); (c a b)
(define (list_perm_helper lst elem)
  (define (iter index)
    (if (= index (+ (length lst) 1)) 
        '()
        (cons (putc lst elem index) (iter (+ index 1)))))
  (iter 0))
;(list_perm_helper '() 'a)   ; ((a))
;(list_perm_helper '(a) 'b)  ; ((a b) (b a))
;(list_perm_helper '(a b) 'c); ((a b c) (a c b) (c a b))
;(list_perm_helper '(a b c) 'd); ((a b c d) (a d b c) (a b d c) (d a b c))
  
; append all sub-lists to one list
(define (appendAll lst)
  (if (null? lst) 
      '()
      (append (car lst) (appendAll (cdr lst)))))
;(appendAll (map (lambda(x) (list_perm_helper x 'c)) '((a b) (b a))))  ; ((a b c) (a c b) (c a b) (b a c) (b c a) (c b a))
  

; real permutation function
(define (perm lst)
  (define (help res rest_lst)
    (if (null? rest_lst)
        res
        (help (appendAll (map (lambda(x) (list_perm_helper x (car rest_lst))) res)) (cdr rest_lst))))
  (if (= (length lst) 1)
      lst
      (help (list (list (car lst) (cadr lst)) (list (cadr lst) (car lst))) (cddr lst)))
  )
;(perm '(a))       ; 1 element
;(perm '(a b))     ; 2 elements
;(perm '(a b c))   ; 6 elements
;(perm '(a b c d)) ; 24 elements
(perm '(1))        ; 1 element
(perm '(1 2))      ; 2 elements
(perm '(1 2 3))    ; 6 elements
(perm '(1 2 3 4))  ; 24 elements  

  
  
  
        



