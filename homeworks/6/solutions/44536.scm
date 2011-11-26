(define (foldl op null l)
  (if (eq? l '())
      null
      (foldl op (op null (car l)) (cdr l))
  )
)

(define (filter pred? l)
  (foldl
     append
     '()
     (map
          (lambda (x)
            (if (pred? x)
                '()
                (list x)
            )
          )
          l
     )
  )
)

(filter (lambda (x) (= x 5)) '(5 1 5 2 5 3 5 5 5 5 4))


(define (foldl op null l)
  (if (eq? l '())
      null
      (foldl op (op null (car l)) (cdr l))
  )
)

(define (gen.all.inserts x l)
  (define (help.f prev.l next.l result)
    (if (eq? next.l '())
        (append result (list (append prev.l (list x))))
        (help.f (append prev.l (list (car next.l))) (cdr next.l) (append result (list (append prev.l (list x) next.l))))
    )
  )
  (help.f '() l '())
)

(define (perm l)
  (foldl
     (lambda (l x) (foldl append '() (map (lambda (.l) (gen.all.inserts x .l)) l)) )
     (list (list (car l)))
     (cdr l)
  )
)

(perm '(1 2 3 4))


(define (foldr op null l)
  (if
    (eq? l '())
    l
    (op (car l) (foldr op null (cdr l)))
  )
)

(define (shift-time frames_diff frames_list)
  (map (lambda (frame) (list (+ frames_diff (car frame)) (+ frames_diff (cadr frame)) (caddr frame))) frames_list)
)

(define (change-fps current_fps new_fps)
  (map (lambda (frame) (list (* (/ current_fps new_fps) (car frame)) (* (/ current_fps new_fps) (cadr frame)) (caddr frame))) frames_list)
)

(define (filter pred? l)
  (foldr
    (lambda (x so.far) (if (pred? x) so.far (cons x so.far)))
    '()
    l
  )
)

(define (is-letter? char)
  (or
    (and
      (>= (char->integer char) (char->integer #\a))
      (<= (char->integer char) (char->integer #\z))
    )
    (and
      (>= (char->integer char) (char->integer #\A))
      (<= (char->integer char) (char->integer #\Z))
    )
  )
)

(define (str-contains-word? my_str word)
  (define str-len (+ (string-length my_str) 1))
  (define word-len (string-length word))
  (define str (string-append "_" my_str " "))
  
  (define (helpF n)
    (cond
      ((> n (- str-len word-len)) #f )
      ((and
           (equal? (substring str n (+ n word-len)) word)
           (not (is-letter? (string-ref str (- n 1))) )
           (not (is-letter? (string-ref str (+ n word-len))) )
       ) #t)
      (else (helpF (+ n 1)))
    )
  )
  
  (if
    (> word-len str-len)
    #f
    (helpF 1)
  )
)

(define (str-contains-words? str bawdyWordsList)
  (cond
    ((eq? bawdyWordsList '()) #f)
    ((str-contains-word? str (car bawdyWordsList)) #t)
    (else (str-contains-words? str (cdr bawdyWordsList)))
  )
)

(define (remove-bowdiness subsList bawdyWordsList)
  (filter
    (lambda (sub) (str-contains-words? (caddr sub) bawdyWordsList) )
    subsList
  )
)

(define bawdyList '("sum" "integral"))

(define subs '
              (
                (0 0 "I love math")
                (0 0 "I love to summarize the integral's formulas")
                (0 0 "I expect the sum of two numbers")
                (0 0 "to be the... ,integral of each one of them")
                (0 0 "to sum up, everything is important")
                (0 0 "and the sum")
                (0 0 "and the integral")
                (0 0 "the end")
              )
)

(remove-bowdiness subs bawdyList)
