; SOLUTION
(define (cons x y)
  (lambda (m) (m x y)))

(define (cdr z)
  (z (lambda (p q) q)))

; PROOF
(cdr (cons 1 2))

(cdr (lambda (m) (m 1 2)))

(lambda ((lambda (p q) q)) (lambda (1 2) 2))

(lambda (q) (2))