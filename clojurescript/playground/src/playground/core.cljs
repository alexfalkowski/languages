(ns playground.core
  (:require [clojure.browser.repl :as repl]))

;; (defonce conn
;;   (repl/connect "http://localhost:9000/repl"))

(enable-console-print!)

(defn greeting
  ([] (greeting "Hello" "world"))
  ([name] (greeting "Hello" name))
  ([salutation name] (str salutation ", " name "!")))

(defn average
  ([x] x)
  ([x y] (/ (+ x y) 2))
  ([x y & extra] (/ (reduce + (+ x y) extra)(+ 2 (count extra)))))

(println (greeting "Mr" "Alex"))
(println (average 1 2 3 4 5))
