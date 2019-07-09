{:user
 {:dependencies [[org.clojure/clojure "1.10.1"]]
  :plugins [[cider/cider-nrepl "0.22.0-beta8"]
            [refactor-nrepl "2.5.0-SNAPSHOT"]]
  :repl-options {:init (do (require 'clojure.pprint
                                    'clojure.tools.namespace.repl)
                           (intern 'clojure.core
                                   '>pprint clojure.pprint/pprint)
                           (intern 'clojure.core
                                   '>refresh clojure.tools.namespace.repl/refresh)
                           (intern 'clojure.core
                                   '>clear clojure.tools.namespace.repl/clear))
                 :skip-default-init true
                 :host "0.0.0.0"
                 :port 4001}
  :jvm-opts ^:replace ["-Xmx1g" "-Dlogfile.path=logs"
                       "-Djsse.enableSNIExtension=false"
                       "-XX:+TieredCompilation" 
                       "-XX:TieredStopAtLevel=1" 
                       "-XX:+CMSClassUnloadingEnabled" 
                       "-Xverify:none"]
  :java-cmd "/Users/mobyte/src/jdk-12.0.1.jdk/Contents/Home/bin/java"}}
