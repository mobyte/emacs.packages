{:user
 {:dependencies [[org.clojure/clojure "1.10.3"]]
  :plugins [[cider/cider-nrepl "0.25.3-SNAPSHOT"]
            [refactor-nrepl "2.5.1"]
            [lein-nomis-ns-graph "0.14.6"]]
  :javac-options ["-target" "11" "-source" "11" "-Xlint:-options"]
  :repl-options {:init (do (require 'clojure.pprint
                                    'clojure.tools.namespace.repl)
                           (intern 'clojure.core
                                   '>pprint clojure.pprint/pprint)
                           (intern 'clojure.core
                                     '>refresh clojure.tools.namespace.repl/refresh)
                           (intern 'clojure.core
                                     '>clear clojure.tools.namespace.repl/clear)
                           (intern 'clojure.core
                                   '>run-tests clojure.test/run-tests))
                 :skip-default-init true
                 :host "0.0.0.0"
                 :port 4001}
  :profiles {:dev {:source-paths ["src-int" "src-scripts"]
                   :test-paths ["test-int"]}}
  :offline? false
  :jvm-opts ^:replace ["-Xmx1g"
                       ;; "-Dlogfile.path=logs"
                       ;; "-Djsse.enableSNIExtension=false"
                       ;; "-XX:+TieredCompilation" 
                       ;; "-XX:TieredStopAtLevel=1" 
                       ;; "-XX:+CMSClassUnloadingEnabled"
                       ]}}
