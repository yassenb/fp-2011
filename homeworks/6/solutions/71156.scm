(define (filter p L)
  (define (helper e)
    (if (p e)
      e
      '()
    )
  )
  (flatten (map helper L))
)

(display (filter odd? '(1 2 3 4 5 6))) 
(display (filter even? '(1 2 3 4 5 6))) 

(define (insert-nth a L n)
  (define (helper n sofar rest)
    (if (<= n 0) (append (reverse sofar) (list a) rest)
      (helper (- n 1) (cons (car rest) sofar) (cdr rest))
    )
  )
  (helper n '() L)
)

(define (partial-perm a L)
  (define (helper lst n res)
      (if (not (null? lst))
	  (helper (cdr lst) (+ n 1) (cons (insert-nth a L n) res))
	  (cons (insert-nth a L n) res)
      )
   )
  (helper L 0 '() )
)

(define (perm L)
  (define (helper a prevPerms res)
    (if (= (length prevPerms) 0)
      res
      (helper a (cdr prevPerms) (append (partial-perm a (car prevPerms)) res))
    )
  )
  (if (<= (length L) 1) (list L)
    (helper (car L) (perm (cdr L)) '() )
  )
)

;(display (partial-perm 'c '(a b d)))

(display (perm '(a b c d)))


(require srfi/13)

(define (create-subtitle frStart frEnd text)
  (append (list frStart frEnd) text)
)

(define (get-start-frame subtitle)
  (car subtitle)
)

(define (get-end-frame subtitle)
  (car (cdr subtitle))
)

(define (get-text subtitle)
  (cdr (cdr subtitle))
)

(define (createExampleSubs)
  (list
    (create-subtitle 1 2 "sub 1")
    (create-subtitle 3 10 "sub 2")
    (create-subtitle 20 22 "sub 3")
    (create-subtitle 30 34 "sub 4")
    (create-subtitle 34 64 "sub 5")
    (create-subtitle 100 128 "sub 6")
    (create-subtitle 200 222 "sub 7")
    (create-subtitle 280 297 "sub 8")
    (create-subtitle 300 350 "sub 9")
  )
)

(define (transform-frames subs func)
  (map 
    (lambda (s) (create-subtitle (func (get-start-frame s)) (func (get-end-frame s)) (get-text s)))
    subs
  )
)

(define (move subs byFrames)
  (transform-frames subs (lambda (frame) (+ frame byFrames)))
)

(define (change-framerate subs currentFR newFR)
  (define ratio (/ newFR currentFR))
  (transform-frames subs (lambda (frame) (round (* frame ratio))))
)

(define (censor subs words)
  (define (or-func p1 p2) (or p1 p2))
  (filter
    (lambda (sub) (not (foldl or-func #f (map (lambda (cword) (string-contains-ci (get-text sub) cword)) words))))
    subs
  )
)

(define subs (createExampleSubs))
(display "input subtitles:")(newline)
(display subs)(newline)

(display "move subtitles:")(newline)
(display (move subs 10))(newline)

(display "change framerate:")(newline)
(display (change-framerate subs 10 15))(newline)

(display "censor:")(newline)
(display (censor subs '("8")))(newline)

