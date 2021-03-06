
{def $target_node=fetch('content' , 'node', hash( 'node_id', appini('NodeSettings' , 'ServiziNodeID') ))
		 $target=concat($target_node.url_alias,'/(Utenza_Target)/',$node.name)|ezurl
}

<div class="griditem target_utenza text-center">

	{if $node|has_attribute( 'image' )}
	<div class="griditem-image">
			{attribute_view_gui attribute=$node|attribute( 'image' ) image_class='large' href=$target}
	</div>
	{/if}

	<h3 class="griditem-title"><a href={$target}>{$node.object.name|wash()}</a></h3>

	{if $node|has_attribute( 'anno' )}
		<span class="meta">{attribute_view_gui attribute=$node|attribute( 'anno' )}</span>
	{/if}

	{if $node|has_abstract}
		<div class="griditem-abstract">
			{$node|abstract}
		</div>
	{/if}

</div>