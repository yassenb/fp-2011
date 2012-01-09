(define (filter pred? l)
  (if (null? l)
    l
    (let ((h (car l))
          (ft (filter pred? (cdr l))))
      (if (pred? h)
        (cons h ft)
        ft))))

(define sub-start-frame car)
(define sub-end-frame cadr)
(define sub-text cddr)

(define (change-frames subs frame-calculator)
  (map (lambda (sub)
         (cons (frame-calculator (sub-start-frame sub))
               (cons (frame-calculator (sub-end-frame sub))
                     (sub-text sub))))
       subs))

(define (shift subs nframes)
  (change-frames subs
                 (lambda (frame)
                   (let ((new-frame (+ frame nframes)))
                     (if (< new-frame 0)
                       0
                       new-frame)))))

(define (change-framerate subs original-framerate desired-framerate)
  (change-frames subs
                 (lambda (frame)
                   (floor (* frame (/ desired-framerate original-framerate))))))

(define (censor subs censored-phrases)
  (define (is-substring? string1 string2)
    (define (helper start end)
      (if (> end (string-length string2))
        #f
        (or (string=? string1 (substring string2 start end))
            (helper (+ start 1) (+ end 1)))))
    (helper 0 (string-length string1)))
  (filter (lambda (sub)
            (null? (filter (lambda (phrase)
                             (is-substring? phrase (sub-text sub)))
                           censored-phrases)))
          subs))

; (define test-subs '((24 72 . "Hey,")
;                     (100 200 . "dirty,")
;                     (300 400 . "baby I got your money\ndon't you worry")
;                     (500 600 . "I said hey.")
;                     (700 700 . "Baby I got your money")
;                     (800 1024 . "Baby I got your money")
;                     ))
; 
; (shift test-subs 48)
; (change-framerate test-subs 24 25)
; (censor test-subs '("dirty" "money"))
