{def $title = cond( is_set( $block.name ), $block.name, '' )
	   $valid_nodes = array()
}

	{def $classes = cond( $block.custom_attributes.class|ne( '' ), $block.custom_attributes.class|explode( ',' ), array() )
				$limit = cond( is_set( $block.custom_attributes.limit ), $block.custom_attributes.limit, 10 )
				$offset = cond( is_set( $block.custom_attributes.offset ), $block.custom_attributes.offset, 0 )
				$parent_node_id = cond( is_set( $block.custom_attributes.parent_node_id ), $block.custom_attributes.parent_node_id, 0 )
	}
	{if $parent_node_id|eq(0)}
		{editor_warning( 'Inserire un nodo <em>sorgente</em> valido' )}
		{set $valid_nodes = array()}
	{else}
		{def $classes_hash = hash()}

		{if $classes|count()}
			{set $classes_hash = hash( 'class_filter_type', 'include', 'class_filter_array', $classes )}
		{/if}

		{def $newsletter_node = fetch( 'content' , 'node' , hash( 'node_id' , $parent_node_id))
				 $newsletter_items = fetch( 'content' , 'list' , hash(
																	 'parent_node_id' , $newsletter_node.node_id,
																	 'class_filter_type' , 'include',
																	 'class_filter_array' , array( 'newsletter' ),
																	 'sort_by' , $newsletter_node.sort_array,
																	 'limit', 1
																	 ))}

		{if $newsletter_items}
		{set $valid_nodes = fetch( 'content', 'list', hash(
															 'parent_node_id', $newsletter_items[0].node_id,
															 'sort_by', $newsletter_items[0].sort_array,
															 'limit', $limit,
															 'offset', $offset )|merge( $classes_hash ) )}
		{else}
			{set $valid_nodes = array()}
		{/if}
	{/if}


{if $valid_nodes}

	<div class="block-type-latest_newsletter box">

		{if $title}
			<h2>{$title}</h2>
		{else}
			<h2>>Newsletter</h2>
		{/if}
		<h3><a href={$newsletter_items[0].url_alias|ezurl()}>{$newsletter_items[0].name|wash()}</a></h3>

		{foreach $valid_nodes as $valid_node}

			{node_view_gui view="line" content_node=$valid_node}

		{/foreach}

		{* if $block.type|eq( 'LatestContent' )}
			{if $parent_node_id|ne(0)}
				{def $root_node= fetch( 'content' , 'node' , hash( 'node_id' , $parent_node_id))}
				<p class="text-right">
					<a href={$root_node.url_alias|ezurl()}>
						VEDI TUTTE
						<span class="mybtn"><i class="fa fa-chevron-right"></i></span>
					</a>
				</p>
			{/if}
		{/if*}

	</div>

{/if}