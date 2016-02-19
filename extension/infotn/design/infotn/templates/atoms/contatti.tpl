<div class="well contatti">
	<h2>Contatti</h2>
		{def $contatti_node = fetch( 'content' , 'node' , hash( 'node_id' , appini( 'NodeSettings' , 'ContattiNodeID' )))}
		{if $contatti_node}
			{attribute_view_gui attribute=$contatti_node|attribute( 'short_description' )}
		{/if}
</div>