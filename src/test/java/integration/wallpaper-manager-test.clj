(ns wallpaper-manager
  (:use [clojure.java.io :only [copy]])
  (:import [java.io File FileInputStream]
           javax.imageio.ImageIO))

(def target-directory "/Users/tim/Documents/Software/Wallpaper Manager/target")

(binding [wallpaper-source (str target-directory "/wallpaper-source")
           wallpaper-dest (str target-directory "/wallpaper-dest")]
  (doseq [current-dir [(File. wallpaper-source) (File. wallpaper-dest)]] (.mkdirs current-dir))
  (doseq [current-file (rest (file-seq (File. "/Users/tim/Documents/Software/Wallpaper Manager/src/test/resources/wallpaper")))] (copy current-file (File. (str wallpaper-source "/" (.getName current-file)))))
  (doseq [the-wallpaper (wallpaper-seq)] (when the-wallpaper (do-file-wallpaper the-wallpaper))))
