<div class="content-view-full class-{$node.class_identifier} row">
	<div class="content-main">

		<div class="heading">
			{*if $node.data_map.occhiello.has_content}
				<h2 class="subheading">{attribute_view_gui attribute=$node.data_map.occhiello}</h2>
			{/if*}
			<h1>{$node.name|wash()}</h1>
		</div>

		{*
		<div class="meta">
		  <span class="date">
			  <i class="fa fa-calendar"></i> {$node.object.published|l10n( 'shortdate' )}
		  </span>
		</div>
		*}

		{if $node|has_attribute( 'short_description' )}
			<div class="abstract lead">
				{attribute_view_gui attribute=$node|attribute( 'short_description' )}
			</div>
		{/if}


		{if $node|has_attribute( 'immagini' )}
			{def $images = array()}
			{foreach $node.data_map.immagini.content.relation_list as $relation_item}
				{set $images = $images|append(fetch('content','node',hash('node_id',$relation_item.node_id)))}
			{/foreach}
		{/if}

		{if $images}
			{include uri='design:atoms/image.tpl' item=$images[0] image_class=appini( 'ContentViewFull', 'DefaultImageClass', 'wide' ) caption=$images[0]|attribute( 'caption' ) css_classes='image-main'}
		{/if}

		{if $node|has_attribute( 'text' )}
			<div class="descrizione">
				{attribute_view_gui attribute=$node|attribute( 'text' )}
			</div>
		{/if}

		{if $node|has_attribute( 'programma' )}
			<h3>Programma</h3>
			<div class="programma well">
				{attribute_view_gui attribute=$node|attribute( 'programma' )}
			</div>
		{/if}

		{*include uri='design:parts/social_buttons.tpl'*}


	</div>
	<div class="content-related">

		<h2><i class="fa fa-calendar-o"></i> {'when'|i18n('opencontent')}</h2>
		<p>
			{include uri='design:parts/event/dates.tpl' item=$node}
		</p>

		{if gt($images|count,1)}
			<h2><i class="fa fa-camera"></i> Immagini</h2>
			{include uri='design:atoms/gallery.tpl' items=$images}
			{undef $images}
		{/if}

		{if $node|has_attribute( 'locandina' )}
			{attribute_view_gui attribute=$node|attribute( 'locandina' )}
		{/if}

		{if or($node|has_attribute( 'struttura' ),
				 	 $node|has_attribute( 'indirizzo' ),
					 $node|has_attribute( 'geo' )
		)}
			<h2><i class="fa fa-map-marker"></i> Dove</h2>
			{if $node|attribute( 'struttura' )}
				<strong><small>{attribute_view_gui attribute=$node|attribute( 'struttura' )}</small></strong>
			{/if}
			{if $node|attribute( 'indirizzo' )}
				{if $node|attribute( 'struttura' )}<br />{/if}
				<small>{attribute_view_gui attribute=$node|attribute( 'indirizzo' )}</small>
			{/if}
			{if $node|attribute( 'geo' )}
				{attribute_view_gui attribute=$node|attribute( 'geo' )}
			{/if}

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

					{foreach $eventi as $item}
						{node_view_gui view=listitem content_node=$item.main_node}
					{/foreach}

					{foreach $approfondimenti as $item}
						{node_view_gui view=line content_node=$item.main_node}
					{/foreach}

				{/if}


		{include uri='design:parts/content-related/comunicati.tpl' attr_name="comunicato/eventi"}

		{if or($node|has_attribute( 'locandina' ),
					 $node|has_attribute( 'struttura' ),
					 $node|has_attribute( 'indirizzo' ),
					 $node|has_attribute( 'geo' ),
					 $eventi|count|gt(0),
			 		 $approfondimenti|count|gt(0))|not()}

		{include uri='design:parts/content-related.tpl'}

		{/if}

	</div>
</div>