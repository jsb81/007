<?php /*

[PushToBlock]
ContentClasses[]
ContentClasses[]=frontpage
ContentClasses[]=landing_page
ContentClasses[]=subsite
RootSubtree=1

[General]
AllowedTypes[]
AllowedTypes[]=Carousel
AllowedTypes[]=Slider
AllowedTypes[]=UpcomingEvents
AllowedTypes[]=LatestContent
AllowedTypes[]=LatestNewsletterContent
AllowedTypes[]=Grid
AllowedTypes[]=HTML
AllowedTypes[]=MainStory
AllowedTypes[]=Widget

#---------------------------------------------#
#   eZ Demo
#---------------------------------------------#

AllowedTypes[]=Campaign
#AllowedTypes[]=ContentGrid
AllowedTypes[]=Gallery
AllowedTypes[]=Banner
AllowedTypes[]=Video
AllowedTypes[]=TagCloud
AllowedTypes[]=Poll
AllowedTypes[]=ItemList
#AllowedTypes[]=FeedReader
#AllowedTypes[]=FeedbackForm
AllowedTypes[]=HighlightedItem

#---------------------------------------------#

[Carousel]
Name=Carousel
NumberOfValidItems=10
NumberOfArchivedItems=0
ManualAddingOfItems=enabled
ViewList[]
ViewList[]=default
ViewName[default]=Default

[Slider]
Name=Slider
NumberOfValidItems=10
NumberOfArchivedItems=0
ManualAddingOfItems=enabled
CustomAttributes[]=sliderMaxElements
CustomAttributeNames[sliderMaxElements]=Slider: numero massimo di elementi
ViewList[]
ViewList[]=default
ViewName[default]=Default

[UpcomingEvents]
Name=Prossimi eventi
ManualAddingOfItems=disabled
CustomAttributes[]=node_id
UseBrowseMode[node_id]=true
CustomAttributes[]=number
CustomAttributeNames[number]=Numero di eventi
CustomAttributeTypes[number]=select
CustomAttributeSelection_number[]
CustomAttributeSelection_number[3]=3
CustomAttributeSelection_number[5]=5
CustomAttributeSelection_number[8]=8
CustomAttributeSelection_number[10]=10
ViewList[]
ViewList[]=default
ViewName[default]=Lista

[LatestContent]
Name=Ultimi contenuti
ManualAddingOfItems=disabled
CustomAttributes[]=parent_node_id
UseBrowseMode[parent_node_id]=true
CustomAttributes[]=class
CustomAttributes[]=limit
CustomAttributes[]=offset
CustomAttributes[]=tree
CustomAttributeTypes[tree]=checkbox
CustomAttributes[]=sliderMaxElements
CustomAttributeNames[sliderMaxElements]=Slider: numero massimo di elementi
CustomAttributeNames[tree]=Fetch Tree (considera il sottoalbero)
CustomAttributes[]=linktext
CustomAttributeNames[linktext]=Testo del link
ViewList[]
ViewList[]=default
ViewList[]=slider
ViewName[]
ViewName[default]=Default
ViewName[slider]=Slider

[LatestNewsletterContent]
Name=Ultimi dalla Newsletter
ManualAddingOfItems=disabled
CustomAttributes[]=parent_node_id
UseBrowseMode[parent_node_id]=true
CustomAttributes[]=class
CustomAttributes[]=limit
CustomAttributes[]=offset
ViewList[]
ViewList[]=default
ViewName[]
ViewName[default]=Default

[Grid]
Name=Griglia
NumberOfValidItems=6
NumberOfArchivedItems=6
ManualAddingOfItems=enabled
ViewList[]
ViewList[]=1_row_2_columns
ViewList[]=1_row_3_columns
ViewList[]=2_rows_2_column
ViewList[]=2_rows_3_columns
ViewName[1_row_2_columns]=1 riga 2 colonne
ViewName[1_row_3_columns]=1 riga 3 colonne
ViewName[2_rows_2_column]=2 righe 2 colonne
ViewName[2_rows_3_columns]=2 righe 3 colonne

[HTML]
Name=Codice HTML
ManualAddingOfItems=disabled
CustomAttributes[]
CustomAttributes[]=html
CustomAttributeTypes[html]=text
ViewList[]
ViewList[]=html
ViewName[html]=html

[Banner]
Name=Banner
NumberOfValidItems=4
NumberOfArchivedItems=0
ManualAddingOfItems=enabled
ViewList[]
ViewList[]=default
ViewName[default]=Default

[Widget]
Name=Widget
NumberOfValidItems=0
NumberOfArchivedItems=0
ManualAddingOfItems=disabled
ViewList[]
ViewList[]=area_riservata
ViewList[]=newsletter
ViewList[]=uru
ViewList[]=tel_servizi
ViewList[]=social_bar
ViewName[area_riservata]=Area Riservata
ViewName[newsletter]=Newsletter
ViewName[uru]=URU
ViewName[tel_servizi]=Numeri Servizi
ViewName[social_bar]=Barra Social Network

#---------------------------------------------#
#   eZ Demo
#---------------------------------------------#

[Campaign]
Name=Campaign
NumberOfValidItems=5
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]
ViewList[]=default
ViewName[default]=Default

[MainStory]
Name=Main story
NumberOfValidItems=1
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
CustomAttributes[]=hide_title
CustomAttributes[]=hide_link
CustomAttributeNames[hide_title]=Nascondi il titolo del contenuto
CustomAttributeNames[hide_link]=Nascondi il link al contenuto
CustomAttributeTypes[hide_title]=checkbox
CustomAttributeTypes[hide_link]=checkbox
ViewList[]
ViewList[]=default
ViewList[]=jumbotron
ViewName[default]=Default
ViewName[jumbotron]=Highlight

#[ContentGrid]
#Name=Content Grid
#NumberOfValidItems=8
#NumberOfArchivedItems=8
#ManualAddingOfItems=enabled
#ViewList[]
#ViewList[]=default
#ViewList[]=1_column_4_rows
#ViewList[]=2_columns_2_rows
#ViewList[]=3_columns_1_row
#ViewList[]=3_columns_2_rows
#ViewList[]=4_columns_1_row
#ViewList[]=4_columns_2_rows
#ViewName[default]=1 column 2 rows
#ViewName[1_column_4_rows]=1 column 4 rows
#ViewName[2_columns_2_rows]=2 columns 2 rows
#ViewName[3_columns_1_row]=3 columns 1 row
#ViewName[3_columns_2_rows]=3 columns 2 rows
#ViewName[4_columns_1_row]=4 columns 1 row
#ViewName[4_columns_2_rows]=4 columns 2 rows

[Gallery]
Name=Gallery
NumberOfValidItems=8
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]
ViewList[]=default
ViewName[default]=Default


[Video]
Name=Video
NumberOfValidItems=1
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]
ViewList[]=default
ViewName[default]=Default

[TagCloud]
Name=Tag cloud
ManualAddingOfItems=disabled
CustomAttributes[]
CustomAttributes[]=subtree_node_id
UseBrowseMode[subtree_node_id]=true
ViewList[]
ViewList[]=default
ViewName[default]=Default

[Poll]
Name=Poll
ManualAddingOfItems=disabled
CustomAttributes[]
CustomAttributes[]=poll_node_id
UseBrowseMode[poll_node_id]=true
ViewList[]
ViewList[]=default
ViewName[default]=Default

[ItemList]
Name=Item list
NumberOfValidItems=12
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]
ViewList[]=default
ViewName[default]=Default

[FeedReader]
Name=Feed reader
ManualAddingOfItems=disabled
CustomAttributes[]
CustomAttributes[]=source
CustomAttributes[]=limit
CustomAttributes[]=offset
ViewList[]
ViewList[]=default
ViewName[default]=Default

[FeedbackForm]
Name=Feedback Form
NumberOfValidItems=1
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]
ViewList[]=default
ViewName[default]=Default

[HighlightedItem]
Name=Highlighted Item
NumberOfValidItems=1
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]
ViewList[]=default
ViewName[default]=Default

*/ ?>
