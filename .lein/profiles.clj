{:user
 {:plugins [[cider/cider-nrepl "0.11.0-SNAPSHOT"]
            [refactor-nrepl "2.2.0-SNAPSHOT"]]
  :repl-options {:nrepl-middleware
                 [cider.nrepl.middleware.apropos/wrap-apropos
                  cider.nrepl.middleware.classpath/wrap-classpath
                  cider.nrepl.middleware.complete/wrap-complete
                  cider.nrepl.middleware.debug/wrap-debug
                  cider.nrepl.middleware.format/wrap-format
                  cider.nrepl.middleware.info/wrap-info
                  cider.nrepl.middleware.inspect/wrap-inspect
                  cider.nrepl.middleware.macroexpand/wrap-macroexpand
                  cider.nrepl.middleware.ns/wrap-ns
                  cider.nrepl.middleware.pprint/wrap-pprint
                  cider.nrepl.middleware.resource/wrap-resource
                  cider.nrepl.middleware.stacktrace/wrap-stacktrace
                  cider.nrepl.middleware.test/wrap-test
                  cider.nrepl.middleware.trace/wrap-trace
                  cider.nrepl.middleware.undef/wrap-undef
                  refactor-nrepl.middleware/wrap-refactor]}
  :dependencies [[org.clojure/tools.nrepl "0.2.12"]
                 [spyscope "0.1.5"]
                 [org.clojure/tools.namespace "0.2.11"]
                 [leiningen #=(leiningen.core.main/leiningen-version)]
                 [io.aviso/pretty "0.1.8"]
                 [im.chit/vinyasa "0.4.2"]
                 [alembic "0.3.2"]]
  :injections [(require 'spyscope.core)
               (require '[vinyasa.inject :as inject])
               (require 'io.aviso.repl)
               (inject/in ;; the default injected namespace is `.`
                ;; note that `:refer, :all and :exclude can be used
                [vinyasa.inject :refer [inject [in inject-in]]]  
                [vinyasa.lein :exclude [*project*]]  
                ;; imports all functions in vinyasa.pull
                [alembic.still [distill pull]]
                ;; inject into clojure.core
                clojure.core
                [vinyasa.reflection .> .? .* .% .%> .& .>ns .>var]
                ;; inject into clojure.core with prefix
                clojure.core >
                [clojure.pprint pprint]
                [clojure.tools.namespace.repl refresh]
                [clojure.tools.namespace.repl refresh-all]
                [clojure.java.shell sh]
                [clojure.repl doc])]
  ;; :test-paths ["test-int"]
  ;; :source-paths ["src-int"]
  :jvm-opts ["-Djsse.enableSNIExtension=false"]}}
