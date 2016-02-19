<div class="content-view-full class-{$node.class_identifier} row">
	<div class="content-main">

		<h1>{$node.name|wash()}</h1>

		{if $node|has_attribute( 'short_description' )}
			<div class="abstract">
				{attribute_view_gui attribute=$node|attribute( 'short_description' )}
			</div>
		{/if}

		{if $node|has_attribute( 'immagini' )}
			{def $images = array()}
			{foreach $node.data_map.immagini.content.relation_list as $relation_item}
				{set $images = $images|append(fetch('content','node',hash('node_id',$relation_item.node_id)))}
			{/foreach}
			{if $images}
				{include uri='design:atoms/image.tpl' item=$images[0] image_class=appini( 'ContentViewFull', 'DefaultImageClass', 'wide' ) caption=$images[0]|attribute( 'caption' ) css_classes='image-main'}
				{if $images|count()|gt(1)}
					{include uri='design:atoms/gallery.tpl' items=$images}
				{/if}
			{/if}
		{/if}

		{if $node|has_attribute( 'description' )}
			<div class="description">
				{attribute_view_gui attribute=$node|attribute( 'description' )}
			</div>
		{/if}


		{if $node|has_attribute( 'dati_quantitativi' )}

			{def $tab_attributes = array( $node|attribute( 'dati_quantitativi' ))}

			{include uri='design:parts/tabs-attributes.tpl' attributes=$tab_attributes view="pills"}

		{/if}


		{* servizi correlati inversi *}
		{def $servizi = fetch( 'content' , 'reverse_related_objects',
									 	hash( 'object_id' , $node.contentobject_id,
										'attribute_identifier' , 'servizio_infotn/ambito'
		))}

		{if $servizi}

			<h2><i class="fa fa-cube"></i> Servizi collegati</h2>


			<div class="row">
			{foreach $servizi as $item}
				<div class="col-sm-4">
					{node_view_gui view=grid_item content_node=$item.main_node}
				</div>
				{delimiter modulo=3}
					</div>
					<div class="row">
				{/delimiter}
			{/foreach}
			</div>

		{/if}

		{*def $sottosistemi = fetch('content' , 'list',
													hash('parent_node_id' , $node.node_id,
															 'class_filter_type' , 'include',
															 'class_filter_array' , array('sottosistema'),
			                         'sort_by',$node.sort_array
		))}

		{if $sottosistemi}

		<div class="row">
			{foreach $sottosistemi as $item}
				<div class="col-sm-4">

					{node_view_gui view=grid_item content_node=$item}

					</div>
					{delimiter modulo=3}
						</div>
						<div class="row">
					{/delimiter}
			{/foreach}
		</div>



		{/if*}



	</div>
	<div class="content-related">

		{include uri='design:parts/content-related/contatti.tpl'}

		{* progetti correlati inversi *}
		{def $progetti = fetch( 'content' , 'reverse_related_objects',
											hash( 'object_id' , $node.contentobject_id,
											'attribute_identifier' , 'progetto/ambito'
		))}

		{if $progetti}
			<h2><i class="fa fa-cog"></i> Progetti collegati</h2>
			<ul class="list-simple">
				{foreach $progetti as $progetto}
					<li>{node_view_gui view=listitem content_node=$progetto.main_node}</li>
				{/foreach}
			</ul>
		{/if}

		{include uri='design:parts/content-related/comunicati.tpl' attr_name="comunicato/ambito"}


		{include uri='design:parts/content-related.tpl'}

		{*/if*}




	</div>

</div>