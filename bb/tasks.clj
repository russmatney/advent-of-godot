(ns tasks
  (:require [babashka.curl :as curl]
            [babashka.fs :as fs]
            [babashka.process :as process]
            [clojure.string :as string]))

(defn cookie
  "Expected to be manually created, and session token pulled from a logged-in browser session."
  []
  (when-not (fs/exists? ".session")
    (fs/create-file ".session"))
  (string/trim (slurp ".session")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; input downloading
;; called via `bb` as `bb download-input 2022 3`
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn leading-zero [day]
  (if (= 1 (count day)) (str "0" day) day))

(defn get-input [year day]
  (let [url (str "https://adventofcode.com/" year "/day/" day "/input")]
    (-> url
        (curl/get {:headers {"Cookie" (str "session=" (cookie))}})
        :body)))

(defn create-input [year day]
  (let [dir   (str "src/" year "/" (leading-zero day))
        file  (str dir "/input.txt")
        input (get-input year day)]
    (->
      (process/$ mkdir -p ~dir)
      process/check :out str)
    (spit file input)))

(comment
  (create-input "2022" "3"))
