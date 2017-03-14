(require '[cljs.build.api :as b])

(b/watch "src"
  {:main 'playground.core
   :output-to "out/playground.js"
   :output-dir "out"})
