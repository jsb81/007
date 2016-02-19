<div class="griditem pubblicazione">

	{if $node|has_attribute( 'image' )}
	<div class="griditem-image">
			{attribute_view_gui attribute=$node|attribute( 'image' ) image_class='portrait' href=$node.url_alias|ezurl(no)}
	</div>
	{/if}

	<h3 class="griditem-title"><a href={$node.url_alias|ezurl()}>{$node.object.name|wash()}</a></h3>

	{if $node|has_attribute( 'anno' )}
		<span class="meta">{attribute_view_gui attribute=$node|attribute( 'anno' )}</span>
	{/if}

	{if $node|has_abstract}
		<div class="griditem-abstract">
			{$node|abstract}
		</div>
	{/if}

</div>