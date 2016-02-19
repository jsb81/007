{if $node|has_attribute( 'ambito' )}
	<h2><i class="fa fa-leaf"></i> {$node.data_map.ambito.contentclass_attribute_name}</i></h2>
	{attribute_view_gui attribute=$node|attribute( 'ambito' ) show_link=true() show_newline=true()}
{/if}