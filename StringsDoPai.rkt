;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname StringsDoPai) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;String -> String
;; produce a string in reverse order
(check-expect (reversed-string "") "")
(check-expect (reversed-string "abcde") "edcba")

;(define (reversed-string s) "") ;stub

(define (reversed-string s)
  (all-together (reverse-los (split s))))

;;ListOfString -> String
;; produce a single string from a list of strings
(check-expect (all-together empty) "")
(check-expect (all-together (list "e" "d" "c" "b" "a")) "edcba")

;(define (all-together los) "") ;stub

(define (all-together los)
  (cond [(empty? los) ""]
        [else
         (string-append (first los)
                        (all-together (rest los)))]))



;;ListOfString -> ListOfString
;;produce a list of strings in reverse order
(check-expect (reverse-los empty) empty)
(check-expect (reverse-los (list "a" "b" "c")) (list "c" "b" "a"))
(check-expect (reverse-los (list "a")) (list "a"))

;(define (reverse-los los) los) ;stub

(define (reverse-los los)
  (cond [(empty? los) empty]
        [else
         (append (reverse-los (rest los))
                 (cons (first los) empty))]))


;; String -> ListOfString
;; produce a list of strings from a single string
(check-expect (split "") empty)
(check-expect (split "abc") (list "a" "b" "c"))
(check-expect (split "abcde") (list "a" "b" "c" "d" "e"))

;(define (split s) empty) ;stub

(define (split s)
  (if (<= (string-length s) 0)
      empty
      (cons (substring s 0 1)
            (split (substring s 1)))))