(define (list_one_to_n n)
  (define (iter index)
      (if (>= index n) 
      index
      (cons index (iter (+ index 1)))))
  (iter 1)
  )

(list_one_to_n 5)
(list_one_to_n 0)
(list_one_to_n 2)
(list_one_to_n -1)