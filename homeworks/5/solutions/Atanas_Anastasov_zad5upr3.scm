(define (regular-list_one_to_n n)
  (define (iter index)
      (if (> index n) 
      '()
      (cons index (iter (+ index 1)))))
  (iter 1)
  )

(regular-list_one_to_n 5)
(regular-list_one_to_n 0)
(regular-list_one_to_n 1)
(regular-list_one_to_n -1)