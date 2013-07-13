#! /usr/bin/guile \
-e main -s
!#

;; Toplevel executable script that expands and records the primes list
;; by x numbers.

;; Load local files
(load "checkprime.scm")

;; Make sure we've loaded srfi-1
(use-modules (srfi srfi-1))

;; Function that recursively finds more primes, +1 by +1
(define (brutesearch x b l)
  (if (not (= x 0))
      (let ((c (+ (last l) b)))
        (if (checkprime c l)
            ;; Important that the below reset b to 1, or it gets wonky
          (brutesearch (- x 1) 1 (append l (list c)))
          (brutesearch x (+ b 1) l)))
      l))

;; Main aggregator function
(define (main cmd)
  (display (brutesearch (string->number (cadr cmd)) 1 primes))
  (newline))
