{ezscript_require( array( 'ezjsc::jquery', 'ezjsc::jqueryio', 'plugins/chosen.jquery.js', 'jquery.facetnavigation.js' ) )}

{def $data = facet_navigation(
hash(
'subtree_array', array( $node.object.main_node_id ),
'class_id', array( 'servizio_infotn' ),
'offset', $view_parameters.offset,
'sort_by', hash( 'name', 'asc' ),
'facet', array(
hash( 'field', 'subattr_ambito___title____s', 'name', 'Ambito', 'limit', 50, 'sort', 'alpha' ),
hash( 'field', 'subattr_target___title____s', 'name', 'Utenza Target', 'limit', 50, 'sort', 'alpha' ) ),
'limit', 18
),
$view_parameters,
$node.url_alias,
)}

<script>
	{literal}
	$(document).ready(function(){
		$('#facetcontainer').facetnavigation({
			useForm: true,
			navigationContainer: ".nav-facets-horizontal",
			json:'{/literal}{$data.json_params}{/literal}',
			token:'{/literal}{$data.token}{/literal}',
			template:{
				content: {
					name: "parts/servizi/children-facet.tpl",
					view: "line",
					page_limit: 18
				},
				navigation: "nav/nav-section-facet-horizontal.tpl"
			},
			chosen: {
				allow_single_deselect:true,
				width:'200px'
			}
		});
	});
	{/literal}
</script>

<div id="facetcontainer" class="content-view-full class-folder row">

	<div class="content-main wide">

    <h1>{$node.name|wash()}</h1>
		{*
				{if $node|has_attribute( 'short_description' )}
					<div class="abstract">
						{attribute_view_gui attribute=$node|attribute( 'short_description' )}
					</div>
				{/if}

				{if $node|has_attribute( 'image' )}
					{include uri='design:atoms/image.tpl' item=$node image_class=appini( 'ContentViewFull', 'DefaultImageClass', 'wide' ) css_classes="image-main"}
				{/if}

				{if $node|has_attribute( 'tags' )}
					<div class="tags">
						{foreach $node.data_map.tags.content.keywords as $keyword}
							<span class="label label-primary">{$keyword}</span>
						{/foreach}
					</div>
				{/if}

				{if $node|has_attribute( 'description' )}
					<div class="description">
						{attribute_view_gui attribute=$node|attribute( 'description' )}
					</div>
				{/if}
		*}

		{include uri='design:nav/nav-section-facet-horizontal.tpl' data=$data}

		{include uri='design:parts/servizi/children-facet.tpl' data=$data page_limit=12}


	</div>

</div>
