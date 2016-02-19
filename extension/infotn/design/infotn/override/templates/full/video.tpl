<div class="content-view-full class-{$node.class_identifier} row">
	<div class="content-main">

		<div class="heading">

			<h1>{$node.name|wash()}</h1>
		</div>


		{if $node|has_attribute( 'abstract' )}
			<div class="abstract lead">
				{attribute_view_gui attribute=$node|attribute( 'abstract' )}
			</div>
		{/if}

		{if $node.object.data_map.video_url.has_content}
			<div class="video-wrapper">
				{$node.data_map.video_url.content|autoembed(array( '<div class="video-container">', '</div>' ), hash( 'width', '600' ) )}
			</div>
		{/if}

		{*include uri='design:parts/social_buttons.tpl'*}


	</div>
	<div class="content-related">

				{* def $eventi = fetch('content','related_objects',
												hash('object_id',$node.contentobject_id,
														 'attribute_identifier', 'comunicato/eventi',
														 'sort_by',array( 'published', false() ),
														 'limit', 3
				))}

				{def $approfondimenti = fetch('content','related_objects',
												hash('object_id',$node.contentobject_id,
												'attribute_identifier', 'comunicato/approfondimenti',
												'sort_by',array( 'published', false() ),
												'limit', 3
				))}



				{if or($eventi|count()|gt(0),
							 $approfondimenti|count()|gt(0)
				)}

					<h2><i class="fa fa-star"></i> vedi anche</h2>

					{foreach $eventi as $item}
						{node_view_gui view=listitem content_node=$item.main_node}
					{/foreach}

					{foreach $approfondimenti as $item}
						{node_view_gui view=line content_node=$item.main_node}
					{/foreach}

				{/if*}


		{*include uri='design:parts/content-related/comunicati.tpl' attr_name="comunicato/eventi"*}


		{include uri='design:parts/content-related.tpl'}


	</div>
</div>