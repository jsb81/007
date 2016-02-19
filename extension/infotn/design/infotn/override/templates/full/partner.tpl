<div class="content-view-full class-{$node.class_identifier} row">
	<div class="content-main">

		<h1>{$node.name|wash()}</h1>

		{if $node|has_attribute( 'logo' )}
			<div class="figure image-main">
				{attribute_view_gui attribute=$node|attribute( 'logo' ) image_class='large' href=$node.url_alias|ezurl(no)}
			</div>
		{/if}

		{if $node|has_attribute( 'short_description' )}
			<div class="description">
				{attribute_view_gui attribute=$node|attribute( 'short_description' )}
			</div>
		{/if}

	</div>
	<div class="content-related">

		{def $collaborazioni = fetch( 'content' , 'reverse_related_objects',
														hash( 'object_id' , $node.contentobject_id,
																	'all_relations' , true(),
																	'group_by_attribute', true(),
																	'sort_by' , array( 'modified' , false())
														))}

		{def $attr = null()}

		{if $collaborazioni}
			<h2><i class="fa fa-cog"></i> Collaborazioni</h2>
			{foreach $collaborazioni as $attr_id => $item}

				{set $attr = fetch( 'content', 'class_attribute', hash( 'attribute_id', $attr_id))}

				{foreach $item as $k =>$it}
					{if $k|eq(0)}
						{* il nome della classe è singolare, nascondiamolo *}
						{*<h4>{$it.class_name}</h4>*}

						<ul class="list-simple">
					{/if}

					<li><a href={$it.main_node.url_alias|ezurl()}>{$it.name|wash()}</a></li>
				{/foreach}
				</ul>

			{/foreach}
		{/if}

		{*
		<hr />
		{include uri='design:parts/content-related.tpl'}
		*}

	</div>

</div>