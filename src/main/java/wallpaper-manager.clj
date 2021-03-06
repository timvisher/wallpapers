(ns wallpaper-manager
  (:import [java.io File FileInputStream]
           javax.imageio.ImageIO))

(def wallpaper-source "/Users/tim/Downloads/")

(def wallpaper-dest "/Users/tim/Pictures/Wallpaper")

(def wallpaper-resolutions
     [
      ;[1024 1024]
      ;[640 960]
      ;[320 480]
      ;[2560 1024]
      ;[1600 1200]
      ;[1400 1050]
      ;[1280 960]
      ;[1024 768]
      [1280 1024]
      ;[960 854]
      ;[960 800]
      ;[640 480]
      [1920 1080]
      ;[1280 720]
      ;[1366 768]
      ;[1024 600]
      ;[800 480]
      ;[480 272]
      ;[320 240]
      [2560 1600]
      [1920 1200]
      [1680 1050]
      [1440 900]
      [1280 800]
      ;[2560 1440]
      ;[1600 900]
      ])

;; Global Structures
(defstruct resolution :width :height)

(defstruct wallpaper :file :resolution :destination-file)

;; Worker Functions
(def wallpaper-resolutions-seq
     (for [[the-width the-height] wallpaper-resolutions] (struct resolution the-width the-height)))

(defn to-resolution [the-image]
  (struct resolution (.getWidth the-image) (.getHeight the-image)))

(defn wallpaper-resolution? [the-image]
  (some #(= (to-resolution the-image) %) wallpaper-resolutions-seq))

(defn to-dir-name [{{:keys [width height]} :resolution}]
  (str width "x" height))

(defn name-has-resolution? [file-name expected-suffix]
  (.matches file-name (str ".+" expected-suffix "\\..+")))

(defn to-file-name-suffix [the-wallpaper]
  (str "_" (to-dir-name the-wallpaper)))

(defn to-wallpaper-name [{:keys [file resolution] :as the-wallpaper}]
  (let [the-name (.getName file)
        extension-index (.lastIndexOf the-name ".")]
    (if (not (name-has-resolution? the-name (to-file-name-suffix the-wallpaper)))
      (str (.substring the-name 0 extension-index)
           (to-file-name-suffix the-wallpaper)
           (.substring the-name extension-index))
      (.getName file))))

(defn to-destination-file [the-wallpaper]
  (when the-wallpaper
    (File. (str wallpaper-dest "/" (to-dir-name the-wallpaper) "/" (to-wallpaper-name the-wallpaper)))))

(defn file-to-wallpaper [the-file]
  (with-open [r (FileInputStream. the-file)]
    (let [image (ImageIO/read r)]
      (if (and image (wallpaper-resolution? image))
        (let [without-destination-file (struct wallpaper the-file (to-resolution image))]
          (assoc without-destination-file :destination-file (to-destination-file without-destination-file)))))))

(defn wallpaper-seq []
  (map file-to-wallpaper (rest (file-seq (File. wallpaper-source)))))

(defn do-file-wallpaper [{:keys [file] :as the-wallpaper}]
  (do
    (let [destination-file (to-destination-file the-wallpaper)]
      (.mkdirs (File. (.getParent destination-file)))
      (.renameTo file destination-file))
    ))
