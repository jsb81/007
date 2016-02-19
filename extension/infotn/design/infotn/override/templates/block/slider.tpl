{def $valid_nodes = $block.valid_nodes
		 $maxElements = cond( is_set( $block.custom_attributes.sliderMaxElements ), $block.custom_attributes.sliderMaxElements, 1 )
		 $title = cond( is_set( $block.name ), $block.name, '' )
}

	{if $block.type|eq( 'LatestContent' )}


		{def $classes = cond( $block.custom_attributes.class|ne( '' ), $block.custom_attributes.class|explode( ',' ), array() )
				 $limit = cond( is_set( $block.custom_attributes.limit ), $block.custom_attributes.limit, 10 )
				 $offset = cond( is_set( $block.custom_attributes.offset ), $block.custom_attributes.offset, 0 )
				 $parent_node_id = cond( is_set( $block.custom_attributes.parent_node_id ), $block.custom_attributes.parent_node_id, 0 )
				 $fetch_type = cond( eq($block.custom_attributes.tree,1), 'tree', 'list' )
		}
			{if $parent_node_id|eq(0)}
				{editor_warning( 'Inserire un nodo <em>sorgente</em> valido' )}
				{set $valid_nodes = array()}
			{else}
				{def $classes_hash = hash()
						 $parent_node = fetch( 'content', 'node', hash( 'node_id', $parent_node_id ) )}
				{if $classes|count()}
					{set $classes_hash = hash( 'class_filter_type', 'include', 'class_filter_array', $classes )}
				{/if}

				{set $valid_nodes = fetch( 'content', $fetch_type, hash(
																	 'parent_node_id', $parent_node.node_id,
																	 'sort_by', $parent_node.sort_array,
																 	 'limit', $limit,
																	 'offset', $offset )|merge( $classes_hash ) )}
			{/if}

	{/if}

{if $valid_nodes}

<div class="block-type-slider slider">

	{include uri='design:atoms/slider.tpl' root_node=$valid_nodes[0].parent items=$valid_nodes show=$maxElements title=$title}


	{if $block.type|eq( 'LatestContent' )}
		{if $parent_node_id|ne(0)}
			{def $root_node= fetch( 'content' , 'node' , hash( 'node_id' , $parent_node_id))}
			<p class="text-right">
				<a href={$root_node.url_alias|ezurl()}>
					VEDI TUTTE
					<span class="mybtn"><i class="fa fa-chevron-right"></i></span>
				</a>
			</p>
		{/if}
	{/if}

</div>

{/if}

