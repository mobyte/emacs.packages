{:user
 {:dependencies [[org.clojure/clojure "1.10.1"]]
  :plugins [[cider/cider-nrepl "0.25.3-SNAPSHOT"]
            [refactor-nrepl "2.5.0"]
            [lein-nomis-ns-graph "0.14.6"]]
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
  :offline? false
  :jvm-opts ^:replace ["-Xmx1g" "-Dlogfile.path=logs"
                       ;; "-Djsse.enableSNIExtension=false"
                       ;; "-XX:+TieredCompilation" 
                       ;; "-XX:TieredStopAtLevel=1" 
                       ;; "-XX:+CMSClassUnloadingEnabled"
                       ]}}
