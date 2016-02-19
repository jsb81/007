<div class="griditem partner">


	{if $node|has_attribute( 'logo' )}
	<div class="griditem-image text-center">
			{attribute_view_gui attribute=$node|attribute( 'logo' ) image_class='imagefull_cutwide' href=$node.url_alias|ezurl(no)}
	</div>
	{/if}

	<h3 class="griditem-title"><a href={$node.url_alias|ezurl()}>{$node.object.name|wash()}</a></h3>


	{if $node|has_abstract}
		<div class="griditem-abstract">
			{$node|abstract}
		</div>
	{/if}

</div>