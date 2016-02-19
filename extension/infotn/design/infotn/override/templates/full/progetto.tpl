<div class="content-view-full class-{$node.class_identifier} row">
	<div class="content-main">

		<h1>{$node.name|wash()}</h1>

		{if $node|has_attribute( 'short_description' )}
			<div class="abstract">
				{attribute_view_gui attribute=$node|attribute( 'short_description' )}
			</div>
		{/if}

		{if or( $node|has_attribute( 'start_date' ),
						$node|has_attribute( 'end_date' ),
						$node|has_attribute( 'partners' )
		)}

			<div class="well small">

				<div class="row">
				{if or( $node|has_attribute( 'start_date' ),
								$node|has_attribute( 'end_date' ))}
						<div class="col-xs-6">
							<h3><i class="fa fa-calendar"></i> Date</h3>
							{if $node|has_attribute( 'start_date' )}
								Inizio: {attribute_view_gui  attribute=$node|attribute( 'start_date' )}<br />
							{/if}
							{if $node|has_attribute( 'end_date' )}
								Fine:	{attribute_view_gui  attribute=$node|attribute( 'end_date' )}
							{/if}
						</div>
				{/if}
				{if $node|has_attribute( 'partners' )}
					<div class="col-xs-6">
						<h3><i class="fa fa-users"></i> Partners</h3>
						{attribute_view_gui attribute=$node|attribute( 'partners' ) show_link=true() show_newline=true()}

					</div>
				{/if}
				</div>
			</div>

		{/if}

		{if $node|has_attribute( 'description' )}
			<div class="description">
				{attribute_view_gui attribute=$node|attribute( 'description' )}
			</div>
		{/if}

		{if $node|has_attribute( 'data_aggiornamento' )}
			<hr />
			<p class="text-right small">Data ultimo aggiornamento: {attribute_view_gui attribute=$node|attribute( 'data_aggiornamento' )}</p>
		{/if}

	</div>
	<div class="content-related">


		{include uri='design:parts/content-related/ambito.tpl'}

		{* servizi correlati diretti *}
		{def $servizi = fetch( 'content' , 'related_objects',
										 hash( 'object_id' , $node.contentobject_id,
													 'attribute_identifier' , 'progetto/servizio'
		))}

		{if $servizi}
			{*if lt($servizi|count(),4)}
				{include uri='design:atoms/slider.tpl' root_node=$node items=$servizi title="<i class='fa fa-cube'></i> Servizi collegati"}
			{else*}
				<h2><i class="fa fa-cube"></i> Servizi collegati</h2>
				<ul class="list-simple">
				{foreach $servizi as $servizio}
					<li>{node_view_gui view=listitem content_node=$servizio.main_node}</li>
				{/foreach}
				</ul>
			{*/if*}

		{/if}

		{include uri='design:parts/content-related/comunicati.tpl' attr_name="comunicato/progetti"}

		{*
		<hr />
		{include uri='design:parts/content-related.tpl'}
		*}

	</div>

</div>