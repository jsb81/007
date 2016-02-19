{* https://github.com/blueimp/Gallery vedi anche page_extra.tpl *}
{ezscript_require( array( "ezjsc::jquery", "plugins/blueimp/jquery.blueimp-gallery.min.js" ) )}
{ezcss_require( array( "plugins/blueimp/blueimp-gallery.css" ) )}

{set_defaults( hash(  
  'thumbnail_class', 'squarethumb',
  'wide_class', 'imagefullwide',
  'items', array(),
  'fluid', false(),
  'mode', 'strip',
  'show_download' , false()
))}

<div class="gallery gallery-{$mode}">
  {if $title}
    <h2>{$title}</h2>
  {/if}
  {foreach $items as $item}
    {def $caption=$item.name}
    {if $item|has_attribute( 'caption' )}
      {set $caption = $item.data_map.caption.data_text|wash()}
    {/if}
	  <div class="gallery-strip-thumbnail">
	    <a href={$item|attribute('image').content[$wide_class].url|ezroot} title="{$caption}" data-gallery>
	      {attribute_view_gui attribute=$item|attribute('image') image_class=$thumbnail_class fluid=$fluid}
	    </a>
		  {if $show_download}
		  <p class="text-center"><a title="scarica l'immagine ad alta risoluzione" href={$item|attribute('image').content[$wide_class].url|ezroot}><i class="fa fa-download"></i> download</a></p>
		  {*<a href="{concat( 'content/download/', $item|attribute('image').contentobject_id, '/', $item|attribute('image').id,'/version/', $item|attribute('image').version , '/file/', $item|attribute('image').content.original_filename|urlencode )|ezurl( 'no' )}" class="btn btn-primary {$size}">
			  {$item|attribute('image').content.filesize|si( byte )}
		  </a>*}
			  {/if}
	  </div>
    {undef $caption}
	{/foreach}
</div>

{unset_defaults(array('thumbnail_class', 'wide_class', 'items' , 'fluid', 'mode', 'show_download'))}