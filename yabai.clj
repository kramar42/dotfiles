#!/usr/bin/env bb

(comment
  (require '[clojure.java.shell :as shell])
  (require '[cheshire.core :as json]))

;; returns currently focused window
(defn focused [windows]
  (->> windows
       (filter #(= 1 (:focused %)))
       first))

(defn next-window [windows]
  (if-let [focused (focused windows)]
    ;; if we have focused window
    ;; find next window by id
    (->> windows
         ;; sort them
         (sort-by :id)
         ;; cycle the collection
         cycle
         ;; partition in pairs with overlap
         (partition 2 1)
         ;; find pairs where first element is focused
         (filter (comp #{focused} first))
         ;; return second element of first match
         first second)
    ;; otherwise return most recent window
    (first windows)))

(->> (shell/sh "yabai" "-m" "query" "--windows")
     :out
     (#(json/parse-string % true))
     ;; all windows matched by app name
     (filter #(= (first *command-line-args*) (:app %)))
     next-window
     :id)

