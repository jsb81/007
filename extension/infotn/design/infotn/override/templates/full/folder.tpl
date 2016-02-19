<div class="content-view-full class-folder row">


{*
  {if and( $node.parent_node_id|ne(1), $node.node_id|ne( ezini( 'NodeSettings', 'RootNode', 'content.ini' ) ) )}
    {include uri='design:nav/nav-section.tpl'}
  {/if}

  <div class="content-main{if or( $node.parent_node_id|eq(1), $node.node_id|eq( ezini( 'NodeSettings', 'RootNode', 'content.ini' ) ) )} wide{/if}">
*}
	<div class="content-main wide">

    {if $node.node_id|ne( ezini( 'NodeSettings', 'RootNode', 'content.ini' ) )}
      <h1>{$node.name|wash()}</h1>
    {/if}

    {if $node|has_attribute( 'short_description' )}
			<div class="abstract">
				{attribute_view_gui attribute=$node|attribute( 'short_description' )}
			</div>
		{/if}

		{if $node|has_attribute( 'geolocation' )}
			<div class="map text-right">
				<hr />
					{attribute_view_gui attribute=$node|attribute( 'geolocation' )}
					<a target="_blank" class="btn btn-primary" href="//www.google.it/maps/dir//'{$node|attribute( 'geolocation' ).content.address}'/@{$node|attribute( 'geolocation' ).content.latitude},{$node|attribute( 'geolocation' ).content.longitude},12z">come arrivare</a>
				<hr />
			</div>
		{/if}

    {if and($node|attribute( 'show_image_in_full_view' ).data_int, $node|has_attribute( 'image' ))}
      {include uri='design:atoms/image.tpl' item=$node image_class=appini( 'ContentViewFull', 'DefaultImageClass', 'wide' ) css_classes="image-main"}
    {/if}

    {if $node|has_attribute( 'tags' )}
      <div class="tags">
        {foreach $node.data_map.tags.content.keywords as $keyword}
          <span class="label label-primary">{$keyword}</span>
        {/foreach}
      </div>
    {/if}

    {if $node|has_attribute( 'description' )}
      <div class="description">
        {attribute_view_gui attribute=$node|attribute( 'description' )}
      </div>
    {/if}

    {if $node|has_attribute( 'children_view' )}
      {include uri=concat('design:parts/children/', $node.data_map.children_view.class_content.options[$node.data_map.children_view.value[0]].name|downcase(), '.tpl')}
    {else}
      {include uri='design:parts/children.tpl' view='line'}
    {/if}

  </div>

  {* Per visualizzare l'extrainfo: aggiungi la classe "full-stack" al primo div e scommenta la seguenta inclusione *}
  {*include uri='design:parts/content-related.tpl'*}

</div>
