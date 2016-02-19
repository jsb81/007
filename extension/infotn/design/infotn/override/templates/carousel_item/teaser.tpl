{def $url= null
$goto=null}

{if $node.data_map.link_external.has_content}
	{set $url=$node.data_map.link_external.content}
{/if}

{if $node.data_map.link_internal.has_content}
	{set $goto=fetch('content','node',hash('node_id',$node.data_map.link_internal.content.relation_list[0].node_id))
		   $url=$goto.url_alias|ezroot()
	}
{/if}

{if $goto}
	{* link interno *}
	{if and($node|has_attribute( 'image'),$node.data_map.image.content[$image_class])}
		{def $image = $node.data_map.image.content[$image_class]}
		<img src={$image.url|ezroot} width="{$image.width}" height="{$image.height}" alt="" />
		{undef $image}

	{elseif and($goto|has_attribute('image'),$goto.data_map.image.content[$image_class])}
		{def $image = $goto.data_map.image.content[$image_class]}
		<img src={$image.url|ezroot} width="{$image.width}" height="{$image.height}" alt="{$goto.name|wash}" />
		{undef $image}


	{elseif $goto|has_attribute('immagini')}
		{def $image_rel = $node.data_map.immagini.content.relation_list[0]
				 $image_node = fetch('content','node',hash('node_id',$image_rel.node_id))
				 $image = $image_node.data_map.image.content[$image_class]
		}
		<img src={$image.url|ezroot} width="{$image.width}" height="{$image.height}" alt="{$goto.name|wash}" />
		{undef $image_rel $image_node $image}

	{/if}

{else}

	{if and($node|has_attribute( 'image'),$node.data_map.image.content[$image_class])}
		{def $image = $node.data_map.image.content[$image_class]}
		<img src={$image.url|ezroot} width="{$image.width}" height="{$image.height}" alt="{$node.name|wash}" />
		{undef $image}

	{/if}

{/if}

<div class="carousel-caption">
	<a href={$url}>
		{if $node.data_map.description.has_content}
			{attribute_view_gui attribute=$node.data_map.description}
		{/if}
	</a>
</div>