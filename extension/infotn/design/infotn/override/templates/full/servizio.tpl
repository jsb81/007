<div class="content-view-full class-{$node.class_identifier} row">
	<div class="content-main">

		<h1>{$node.name|wash()}</h1>

		{if $node|has_attribute( 'short_description' )}
			<div class="abstract">
				{attribute_view_gui attribute=$node|attribute( 'short_description' )}
			</div>
		{/if}

		{if or( $node|has_attribute( 'target' ),
					  $node|has_attribute( 'partners' )
		)}

			<div class="well small">
				<div class="row">
					{if $node|has_attribute( 'target' )}
						<div class="col-xs-6">
							<h3><i class="fa fa-bullseye"></i> {$node.data_map.target.contentclass_attribute_name}</h3>
							{attribute_view_gui attribute=$node|attribute( 'target' ) show_link=true() show_newline=true()}
						</div>
					{/if}
					{if $node|has_attribute( 'partners' )}
						<div class="col-xs-6">
							<h3><i class="fa fa-users"></i> {$node.data_map.partners.contentclass_attribute_name}</h3>
							{attribute_view_gui attribute=$node|attribute( 'partners' ) show_link=true() show_newline=true()}
						</div>
					{/if}
				</div>
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

			{*$node|attribute( 'dati' ).content.columns.sequential[0].rows|attribute(show)*}



		{include uri='design:parts/dati.tpl'}

		{if or($node|has_attribute( 'dati_description' ),
					 $node|has_attribute( 'dati' )
		)}

		<h2><i class="fa fa-bar-chart"></i> Dati</h2>

		{attribute_view_gui attribute=$node|attribute( 'dati_description')}

		{if $node|has_attribute( 'dati' )}

			{ezscript_require(array( 'jquery.appear.js' , 'jquery.countTo.js'))}

			<div class="data-counters row">
				{foreach $node|attribute( 'dati' ).content.rows.sequential as $row}

				<div class="col-sm-4">
					<div class="counter">
						<span class="counter-data" data-to="{$row.columns.0}" data-from="0">&nbsp;</span>
						<span class="counter-description">{$row.columns.1}</span>
					</div>
				</div>
				{delimiter modulo=3}
					</div>
					<div class="row">
				{/delimiter}
				{/foreach}
			</div>

			<script>
				{literal}
				jQuery(document).ready(function(){
					var counterAppeared = false;
					$('.data-counters').appear();
					$(document.body).on('appear', '.data-counters', function(e, $affected) {
						if(!counterAppeared){
							$('.counter-data').countTo({
								formatter: function (value, options) {
									return value.toFixed(options.decimals).replace(/\B(?=(?:\d{3})+(?!\d))/g, '.');
								}
							});
						}
						counterAppeared = true;
					});
				});

				{/literal}
			</script>

		{/if}

	{/if}

{*
			{def $values = $node|attribute( 'dati' ).content.columns.sequential[0].rows
					 $sorted_values = $values|sort('string')|reverse()
			     $max_value = $sorted_values[0]
					 $ratio = 100|div($max_value)
			}

			{foreach $node|attribute( 'dati' ).content.rows.sequential as $row}

				<div class="row">
					<div class="col-xs-8">
						<div class="progress">
							<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="{$row.columns.0|mul($ratio)|ceil()}" aria-valuemin="0" aria-valuemax="100" >
								<span class="sr-only">{$row.columns.0}</span>
							</div>
						</div>
					</div>
					<div class="col-xs-4">
						{$row.columns.0} {$row.columns.1}
					</div>
				</div>

			{/foreach}

		{/if}

		{literal}
				<script>
			$(".progress-bar").each(function(){

				var percent_value = $(this).attr("aria-valuenow") + "%";

				$(this).animate({
					width: "0",
					width: percent_value
				}, 2500);
			});

			//$(".progress-bar").animate({width:"0",
			//	width: "40%"
			//}, 2500);
		</script>

		<style>
			.progress.active .progress-bar {
				-webkit-transition: none !important;
				transition: none !important;
			}
		</style>
		{/literal}
*}


		{if or($node|has_attribute( 'tecnologia' ),
					 $node|has_attribute( 'benefici' ))
		}

			{def $tab_attributes = array( $node|attribute( 'tecnologia' ) , $node|attribute( 'benefici' ))}

			{include uri='design:parts/tabs-attributes.tpl' attributes=$tab_attributes view="pills"}

		{/if}

		{if $node|has_attribute( 'data_aggiornamento' )}
			<hr />
			<p class="text-right small">Data ultimo aggiornamento: {attribute_view_gui attribute=$node|attribute( 'data_aggiornamento' )}</p>
		{/if}


	</div>
	<div class="content-related">

		{include uri='design:parts/content-related/contatti.tpl'}

		{include uri='design:parts/content-related/ambito.tpl'}

		{include uri='design:parts/content-related/comunicati.tpl' attr_name="comunicato/servizio"}

		<hr />

		{include uri='design:parts/content-related.tpl'}

	</div>

</div>