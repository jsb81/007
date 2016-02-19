<div class="content-view-full class-{$node.class_identifier} row">
  <div class="content-main">

	  <div class="heading">
		  {if $node.data_map.occhiello.has_content}
		    <h2 class="subheading">{attribute_view_gui attribute=$node.data_map.occhiello}</h2>
		  {/if}
      <h1>{$node.name|wash()}</h1>
	  </div>

	  {if $node.parent.class_identifier|eq("newsletter")}
		  <hr />
	    <div class="row">
		    <div class="col-xs-6">
			    {if $node|has_attribute( 'rubrica' )}
				    <span class="rubrica">{attribute_view_gui attribute=$node|attribute( 'rubrica' )}</span>
			    {/if}
		    </div>
			  <div class="col-xs-6">
				  <p class="text-right">
					  <a href={$node.parent.url_alias|ezurl()}>
						  <img src={"images/link_small.jpg"|ezdesign()} />
						  {attribute_view_gui attribute=$node.parent.data_map.number}
					  </a>
				  </p>
			  </div>
		  </div>
		  <hr />

	  {/if}

	  <div class="meta">
		  <span class="date">
			  <i class="fa fa-calendar"></i> {$node.object.published|l10n( 'shortdate' )}
		  </span>
		  {include uri='design:atoms/autore.tpl'}
	  </div>

    {if $node|has_attribute( 'intro' )}
    <div class="abstract lead">
      {attribute_view_gui attribute=$node|attribute( 'intro' )}
    </div>
    {/if}

	  {if or(
	  $node.data_map.tag.has_content,
	  $node.data_map.tematica.has_content
	  )
	  }

		  <div class="tags-container">
			  {if $node.data_map.tag.has_content}
				  <div>
					  <strong>Argomenti:</strong> {attribute_view_gui attribute=$node.data_map.tag}
				  </div>
			  {/if}

			  {if $node.data_map.tematica.has_content}
				  <div>
					  <strong>Tematiche:</strong> {attribute_view_gui attribute=$node.data_map.tematica}
				  </div>
			  {/if}
		  </div>

	  {/if}

	  {if $node|has_attribute( 'immagini' )}
		  {def $images = array()}
		  {foreach $node.data_map.immagini.content.relation_list as $relation_item}
			  {set $images = $images|append(fetch('content','node',hash('node_id',$relation_item.node_id)))}
		  {/foreach}
	  {/if}

	  {if $node|has_attribute( 'url_video' )}
			  <div class="video-wrapper">
				  {$node.data_map.url_video.content|autoembed(array( '<div class="video-container">', '</div>' ), hash( 'width', '850' ) )}
			  </div>
	  {elseif $images}
        {include uri='design:atoms/image.tpl' item=$images[0] image_class=appini( 'ContentViewFull', 'DefaultImageClass', 'wide' ) caption=$images[0]|attribute( 'caption' ) css_classes='image-main'}
    {/if}

    {if $node|has_attribute( 'body' )}
      <div class="descrizione">
        {attribute_view_gui attribute=$node|attribute( 'body' )}
      </div>
    {/if}

	  {if $node|has_attribute( 'star_rating' )}
		  <div class="rating">
			  {attribute_view_gui attribute=$node|attribute( 'star_rating' )}
		  </div>
	  {/if}

	  {include uri='design:parts/social_buttons.tpl'}

	  {if $node|has_attribute( 'comments' )}
		  <div class="comments">
			  <hr />
			  <h3><i class="fa fa-comments"></i> Commenti</h3>
			  {attribute_view_gui attribute=$node|attribute( 'comments' )}
		  </div>
	  {/if}

  </div>
  <div class="content-related">

    {if gt($images|count,1)}
      <h2><i class="fa fa-camera"></i> Immagini</h2>
      {include uri='design:atoms/gallery.tpl' items=$images}
      {undef $images}
    {/if}

	  {if $node|has_attribute( 'location' )}
		  <h2><i class="fa fa-map-marker"></i> Dove</h2>
		  {attribute_view_gui attribute=$node|attribute( 'location' )}
	  {/if}

{*
	  {def $eventi = fetch('content','related_objects',
	                  hash('object_id',$node.contentobject_id,
	                       'attribute_identifier', 'article/eventi',
	                       'sort_by',array( 'published', false() ),
		                     'limit', 4
	  ))}

	  {def $articoli = fetch('content','related_objects',
									  hash('object_id',$node.contentobject_id,
									  'attribute_identifier', 'article/articoli',
									  'sort_by',array( 'published', false() ),
									  'limit', 4
	  ))}



	  {if or($eventi|count()|gt(0),
		       $articoli|count()|gt(0)
	  )}

		  <h2><i class="fa fa-star"></i> {'see also'|i18n('opencontent')}</h2>

		  {foreach $eventi as $item}
			  {node_view_gui view=listitem content_node=$item.main_node}
			{/foreach}

		  {foreach $articoli as $item}
			  {node_view_gui view=line content_node=$item.main_node}
		  {/foreach}

	  {/if}
*}
  </div>
</div>