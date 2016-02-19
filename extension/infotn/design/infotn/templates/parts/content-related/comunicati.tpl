{if $attr_name}

{* comunicati correlati inversi *}
{def $comunicati = fetch( 'content' , 'reverse_related_objects',
								 hash( 'object_id' , $node.contentobject_id,
											 'attribute_identifier' , $attr_name,
	                     'sort_by' , array( 'published' , false()),
											 'limit' , 4
))}

{if $comunicati}

		<h2><i class="fa fa-file-o"></i> Vedi anche</h2>
		<ul class="list-simple">
			{foreach $comunicati as $comunicato}
				<li>{node_view_gui view=line content_node=$comunicato.main_node show_abstract=false()}</li>
			{/foreach}
		</ul>
{/if}

{/if}