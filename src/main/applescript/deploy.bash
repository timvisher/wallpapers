#!/bin/bash

for f in *.applescript
do
    new=${f%.*}".scpt"
    osacompile -o $new $f
done

trash ~/Library/Scripts/wallpaper*

mv *.scpt ~/Library/Scripts/

