{:user
 {:plugins [[cider/cider-nrepl "0.19.0-SNAPSHOT"]]
  :middleware [cider-nrepl.plugin/middleware]
  :jvm-opts ["-Djsse.enableSNIExtension=false"]}}
