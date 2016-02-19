<?php /* #?ini charset="utf-8"?

[ImageMagick]
IsEnabled=true
ExecutablePath=/usr/bin
Executable=convert

[ImageMagick]
Filters[]=thumb=-resize 'x%1' -resize '%1x<' -resize 50%
Filters[]=centerimg=-gravity center -crop %1x%2+0+0 +repage
Filters[]=strip=-strip
Filters[]=sharpen=-sharpen 0.5
Filters[]=play_watermark=extension/opencontent/design/standard/images/i-play-2.png -composite -gravity Center
Filters[]=play_watermark_big=extension/opencontent/design/ftcoop_base/images/icons/play-btn.png -composite -gravity Center
Filters[]=geometry/scalemin=-geometry %1x%2^
Filters[]=geometry/galleryscale=-gravity center -background %1 -extent %2x%3
Filters[]=geometry/topscale=-gravity North -background %1 -extent %2x%3

[AliasSettings]
AliasList[]
AliasList[]=reference
AliasList[]=small
AliasList[]=tiny
AliasList[]=medium
AliasList[]=large
AliasList[]=rss
AliasList[]=squaremini
AliasList[]=squarethumb
AliasList[]=squaremedium
AliasList[]=widethumb
AliasList[]=imagefull
AliasList[]=imagefull_cutwide
AliasList[]=imagefullwide
AliasList[]=carousel
AliasList[]=carousel_wide
AliasList[]=portrait

[squaremini]
Reference=original
Filters[]
Filters[]=geometry/scalewidthdownonly=80
Filters[]=centerimg=50;50

[squarethumb]
Reference=original
Filters[]
Filters[]=geometry/scalewidthdownonly=200
Filters[]=centerimg=100;100

[squaremedium]
Reference=original
Filters[]
Filters[]=geometry/scalewidth=600
Filters[]=centerimg=250;250

[widethumb]
Reference=original
Filters[]
Filters[]=geometry/scalewidthdownonly=300
#Filters[]=geometry/topscale=#ffffff;300;180
Filters[]=centerimg=300;180

[imagefull]
Reference=original
Filters[]=geometry/scalewidthdownonly=770

[imagefull_cutwide]
Reference=original
Filters[]=geometry/scalewidthdownonly=770
Filters[]=centerimg=770;380

[imagefullwide]
Reference=original
Filters[]=geometry/scalewidthdownonly=1170

[carousel]
Reference=original
Filters[]=geometry/scalewidth=1170;640
Filters[]=centerimg=1170;520

[carousel_wide]
Reference=original
Filters[]=geometry/scalewidth=1170;500
Filters[]=centerimg=1170;380

[portrait]
Reference=original
Filters[]=geometry/scaleheight=480
Filters[]=geometry/topscale=#ffffff;342;480

*/ ?>