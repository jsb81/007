<div class="content-view-full newsletter class-{$node.class_identifier} row">
  <div class="content-main">

	  <div class="heading">
	    <h2 class="subheading">News, focus e tendenze dell’informatica in Trentino</h2>
      <h1>{$node.name|wash()}</h1>
	  </div>


	  {def $rubrica = ''
				 $rubrica_cur = ''
	       $selected_id_array = array()
	  }

	  {foreach $node.children as $k => $item}

		  {set $selected_id_array=$item|attribute( 'rubrica' ).content}
		  {foreach $item.data_map.rubrica.class_content.options as $option}
			  {if $selected_id_array|contains( $option.id )}
				  {set $rubrica_cur = $option.name}
				  {break}
			  {/if}
		  {/foreach}

		  {if and($rubrica_cur|ne(''),$rubrica|ne($rubrica_cur))}
			  <h2 class="newsletter-rubrica">{$rubrica_cur}</h2>
			{/if}

		  {if $k|eq(0)}

			  <div class="well">
				  {def $images = array()}
			    {if $item|has_attribute( 'immagini' )}
				    {foreach $item.data_map.immagini.content.relation_list as $relation_item}
					    {set $images = $images|append(fetch('content','node',hash('node_id',$relation_item.node_id)))}
				    {/foreach}
				  {/if}

			    <div class="row">

			      {if $images}
					    <div class="col-sm-4 col-sm-push-8">
						    {include uri='design:atoms/image.tpl' item=$images[0] image_class='imagefull' href=$node.url_alias|ezurl(no)}
					    </div>
				    {/if}

				    <div class="{if $images}col-sm-8 col-sm-pull-4{else}col-sm-12{/if}">
						  <h2><a href={$item.url_alias|ezurl()}>{$item.name|wash()}</a></h2>
							<span class="date">
								<i class="fa fa-calendar"></i> {$node.object.published|l10n( 'shortdate' )}
		          </span>
					    {if $item|has_abstract()}
							  <div class="">
								  {$item|abstract()}
							  </div>
						  {/if}
					  </div>


			    </div>
			  </div>


			{else}
			  {node_view_gui view=line content_node=$item}
			{/if}

		  {*
		  <h2><a href={$item.url_alias|ezurl()}>{$item.name}</a></h2>
		  {if $item|has_attribute( 'abstract' )}
		    {attribute_view_gui attribute=$item|attribute( 'abstract' )}
		  {/if}
			*}

		  {set $rubrica = $rubrica_cur}
		{/foreach}


  </div>
  <div class="content-related">

	  {include uri='design:parts/content-related.tpl'}

  </div>
</div>