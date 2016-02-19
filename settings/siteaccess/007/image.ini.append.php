<?php /* #?ini charset="utf-8"?

[ImageMagick]
Filters[]=thumb=-resize 'x%1' -resize '%1x<' -resize 50%
Filters[]=centerimg=-gravity center -crop %1x%2+0+0 +repage
Filters[]=strip=-strip
Filters[]=sharpen=-sharpen 0.5
Filters[]=play_watermark=extension/opencontent/design/standard/images/i-play-2.png -composite -gravity Center
Filters[]=play_watermark_big=extension/opencontent/design/ftcoop_base/images/icons/play-btn.png -composite -gravity Center
Filters[]=geometry/scalemin=-geometry %1x%2^
Filters[]=geometry/galleryscale=-gravity center -background %1 -extent %2x%3

[AliasSettings]
AliasList[]
AliasList[]=small
AliasList[]=medium
AliasList[]=listitem
AliasList[]=articleimage
AliasList[]=articlethumbnail
AliasList[]=gallerythumbnail
AliasList[]=galleryline
AliasList[]=imagelarge
AliasList[]=large
AliasList[]=rss
AliasList[]=logo
AliasList[]=infoboximage
AliasList[]=billboard
AliasList[]=productthumbnail
AliasList[]=productimage

AliasList[]=carousel
AliasList[]=squaremini
AliasList[]=squarethumb
AliasList[]=squaremedium
AliasList[]=imagefullwide
AliasList[]=imagefull_cutwide
AliasList[]=thumbnail_square
AliasList[]=portrait

[small]
Reference=
Filters[]
Filters[]=geometry/scaledownonly=100;160

[medium]
Reference=
Filters[]
Filters[]=geometry/scaledownonly=200;290

[large]
Reference=
Filters[]
Filters[]=geometry/scaledownonly=360;440

[rss]
Reference=
Filters[]
Filters[]=geometry/scale=88;31

[logo]
Reference=
Filters[]
Filters[]=geometry/scaleheight=36

[listitem]
Reference=
Filters[]
Filters[]=geometry/scaledownonly=130;190

[articleimage]
Reference=
Filters[]
Filters[]=geometry/scalewidth=770

[articlethumbnail]
Reference=
Filters[]
Filters[]=geometry/scaledownonly=170;220

[gallerythumbnail]
Reference=
Filters[]
Filters[]=geometry/scaledownonly=105;100

[galleryline]
Reference=
Filters[]
Filters[]=geometry/scaledownonly=70;150

[imagelarge]
Reference=
Filters[]
Filters[]=geometry/scaledownonly=550;730

[infoboximage]
Reference=
Filters[]
Filters[]=geometry/scalewidth=75

[billboard]
Reference=
Filters[]
Filters[]=geometry/scalewidth=764

[productthumbnail]
Reference=
Filters[]
Filters[]=geometry/scaledownonly=170;220

[productimage]
Reference=
Filters[]
Filters[]=geometry/scalewidthdownonly=770

[squaremini]
Reference=original
Filters[]
Filters[]=geometry/scalewidthdownonly=150
Filters[]=centerimg=64;64

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

[imagefullwide]
Reference=original
Filters[]
Filters[]=geometry/scalewidthdownonly=1170

[imagefull_cutwide]
Reference=original
Filters[]
Filters[]=geometry/scalewidthdownonly=770
Filters[]=centerimg=770;380

[thumbnail_square]
Reference=original
Filters[]
Filters[]=geometry/scaledownonly=220;220
Filters[]=geometry/galleryscale=#e9e9e9;232;232

[portrait]
Reference=original
Filters[]
Filters[]=geometry/scaledownonly=240;330
Filters[]=geometry/galleryscale=#fff;240;330

*/ ?>