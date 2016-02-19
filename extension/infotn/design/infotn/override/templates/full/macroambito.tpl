<div class="content-view-full class-{$node.class_identifier} row">
	<div class="content-main wide">

		<h1>{$node.name|wash()}</h1>

		{if $node|has_attribute( 'short_description' )}
			<div class="abstract">
				{attribute_view_gui attribute=$node|attribute( 'short_description' )}
			</div>
		{/if}

		{if $node|has_attribute( 'image' )}
			{attribute_view_gui attribute=$node|attribute( 'image' ) image_class=appini( 'ContentViewFull', 'DefaultImageClass', 'wide' )}
		{/if}

		{if $node|has_attribute( 'description' )}
			<div class="description">
				{attribute_view_gui attribute=$node|attribute( 'description' )}
			</div>
		{/if}

		{def $ambiti = fetch( 'content' , 'list',
										hash( 'parent_node_id' , $node.node_id,
													'class_filter_type' , 'include',
													'class_filter_array' , array( 'ambito' ),
													'sort_by' , $node.sort_array

		))}

		{if $ambiti}
		<div class="row">
		{foreach $ambiti as $item}
			<div class="col-sm-4">
				{node_view_gui view=grid_item content_node=$item}
			</div>
			{delimiter modulo=3}
			</div>
			<div class="row">
			{/delimiter}
		{/foreach}
		</div>
		{/if}

		{node_view_gui view=grid_item content_node=$item.main_node}


		{*def $sistemi = fetch( 'content' , 'reverse_related_objects',
		hash( 'object_id' , $node.contentobject_id,
		'attribute_identifier' , 'ambito/macroambito',
		'sort_by' , array( 'modified' , false())

		))}

		{if $sistemi|count()|gt(0)}

			{include uri='design:atoms/slider.tpl' root_node=$node items=$sistemi show=4 title="<i class='fa fa-cubes'></i> Ambiti"}

		{/if*}
	</div>
</div>


