<div class="content-view-full class-{$node.class_identifier} row">
	<div class="content-main">

		<div class="heading">
			{if $node.data_map.occhiello.has_content}
				<h2 class="subheading">{attribute_view_gui attribute=$node.data_map.occhiello}</h2>
			{/if}
			<h1>{$node.name|wash()}</h1>
		</div>

		<div class="meta">
		  <span class="date">
			  <i class="fa fa-calendar"></i> {$node.object.published|l10n( 'shortdate' )}
		  </span>
		</div>

		{if $node|has_attribute( 'abstract' )}
			<div class="abstract lead">
				{attribute_view_gui attribute=$node|attribute( 'abstract' )}
			</div>
		{/if}

		{*if $node.data_map.tag.has_content}

			<div class="tags-container">
				{if $node.data_map.argomento.has_content}
					<div>
						<strong>Argomenti:</strong> {attribute_view_gui attribute=$node.data_map.tag}
					</div>
				{/if}
			</div>

		{/if*}

		{if $node|has_attribute( 'immagini' )}
			{def $images = array()}
			{foreach $node.data_map.immagini.content.relation_list as $relation_item}
				{set $images = $images|append(fetch('content','node',hash('node_id',$relation_item.node_id)))}
			{/foreach}
		{/if}

		{* if $node|has_attribute( 'url_video' )}
			<div class="video-wrapper">
				{$node.data_map.url_video.content|autoembed(array( '<div class="video-container">', '</div>' ), hash( 'width', '850' ) )}
			</div>
		{else*}
		{if $images}
			{include uri='design:atoms/image.tpl' item=$images[0] image_class=appini( 'ContentViewFull', 'DefaultImageClass', 'wide' ) caption=$images[0]|attribute( 'caption' ) css_classes='image-main'}
		{/if}

		{if $node|has_attribute( 'testo_completo' )}
			<div class="descrizione">
				{attribute_view_gui attribute=$node|attribute( 'testo_completo' )}
			</div>
		{/if}

		{if $node|has_attribute( 'star_rating' )}
			<div class="rating">
				{attribute_view_gui attribute=$node|attribute( 'star_rating' )}
			</div>
		{/if}

		{*include uri='design:parts/social_buttons.tpl'*}

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

		{def $allegati = fetch('content','related_objects',
		hash('object_id',$node.contentobject_id,
		'attribute_identifier', 'comunicato/allegati'
		))}

		{if $allegati}
			<h2><i class="fa fa-file"></i> Allegati</h2>
			<ul class="list-simple">
			{foreach $allegati as $item}
				<li>{content_view_gui view=embed content_object=$item}</li>
			{/foreach}
			</ul>
		{/if}


		{def $audio = fetch('content','related_objects',
		hash('object_id',$node.contentobject_id,
		'attribute_identifier', 'comunicato/audio'
		))}

		{if $audio}
		<h2><i class="fa fa-volume-up"></i> Audio</h2>
		<ul class="list-simple">
			{foreach $audio as $item}
				<li>{content_view_gui view=embed content_object=$item}</li>
			{/foreach}
		</ul>
		{/if}

		{if $node|has_attribute( 'progetti' )}
			<h2><i class="fa fa-cubes"></i> Progetti</i></h2>
			{attribute_view_gui attribute=$node|attribute( 'progetti' ) show_link=true() show_newline=true()}
		{/if}

		{include uri='design:parts/content-related/ambito.tpl'}

		{if $node|has_attribute( 'servizi' )}
			<h2><i class="fa fa-cube"></i> Servizi</i></h2>
			{attribute_view_gui attribute=$node|attribute( 'servizi' ) show_link=true() show_newline=true()}
		{/if}

				{def $eventi = fetch('content','related_objects',
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

					<ul class="list-simple">
					{foreach $eventi as $item}
						<li>{node_view_gui view=listitem content_node=$item.main_node}</li>
					{/foreach}

					{foreach $approfondimenti as $item}
						<li>{node_view_gui view=listitem content_node=$item.main_node}</li>
					{/foreach}
					</ul>

				{else}

					{include uri='design:parts/content-related.tpl'}

				{/if}


	</div>
</div>