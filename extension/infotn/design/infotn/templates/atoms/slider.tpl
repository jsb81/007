{ezscript_require( array( "ezjsc::jquery", "plugins/owl-carousel/owl.carousel.js" ) )}
{ezcss_require( array( 'plugins/owl-carousel/owl.carousel.css', 'plugins/owl-carousel/owl.theme.css' ) )}

{*
  items - required - objects to show in the slider
  root_node - required - used to give a unique id to the carousel - the node to point with the link from the title
  title - the title of the block
  slide_speed - the slide transition speed (milliseconds)
  pagination_speed - the pagination transition speed (milliseconds)
  navigation_text - the text (or code) used for the navigation
  show - maximun number of items to display
*}

{if and($items, $root_node)}

{set_defaults( hash(
	'title', '',
	'slide_speed', 300,
	'pagination_speed', 400,
	'navigation_text', concat( "['", '<i class="fa fa-chevron-left"></i>', "','", '<i class="fa fa-chevron-right"></i>', "']"),
	'show',1
))}

<div class="slider box">
	{if $title}
		<h2>{$title}</h2>
	{/if}
	<div id="owl-slider-{$root_node.node_id}" class="owl-carousel owl-theme">

		{foreach $items as $item}
			<div class="item">
				{if $item.url_alias}
					{* it's a node *}
					{node_view_gui view=grid_item content_node=$item show_abstract=true()}
				{else}
					{* it's an object*}
					{node_view_gui view=grid_item content_node=$item.main_node show_abstract=true()}
				{/if}
					{*
				<h3>{$item.name|wash()}</h3>
				<div class="abstract">
					{attribute_view_gui attribute=$node.data_map.short_description}
				</div>
				<p class="goto"><a href={$item.main_node.url_alias|ezurl()}>Dettagli</a></p>
			*}
			</div>
		{/foreach}

	</div>
</div>

	<script>
		$(document).ready(function() {ldelim}

			$("#owl-slider-{$root_node.node_id}").owlCarousel({ldelim}

				navigation : true, // Show next and prev buttons
				slideSpeed : 300,
				paginationSpeed : 400,
				pagination: false,
				navigationText: {$navigation_text},
				{if $show|eq(1)}
					singleItem:true
				{else}
					items: {$show},
					itemsCustom: [[0,1],[480,2],[768,3],[992,1],[1280,{$show}]]
				{/if}

				// "singleItem:true" is a shortcut for:
				// items : 1,
				// itemsDesktop : false,
				// itemsDesktopSmall : false,
				// itemsTablet: false,
				// itemsMobile : false

			{rdelim});

		{rdelim});

	</script>

	{unset_defaults(array('title' , 'slide_speed' , 'pagination_speed'))}

{/if}