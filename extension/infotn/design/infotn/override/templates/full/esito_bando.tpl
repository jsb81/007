<div class="content-view-full class-{$node.class_identifier} row">
	<div class="content-main">

		<div class="heading">
			<h1>{attribute_view_gui attribute=$node.data_map.titolo}</h1>
		</div>

		<div class="meta">
		  <span class="date">
			  <i class="fa fa-calendar"></i> {$node.data_map.data_esito.contentclass_attribute.name}: {attribute_view_gui attribute=$node.data_map.data_esito}
		  </span>
		</div>

		{if $node.data_map|count()|gt(2)}
			<h3>Tabella informativa di dettaglio</h3>
			<table class="table table-responsive">
				<tbody>
				{foreach $node.data_map as $i => $attr}
					<tr>
						<th>{$attr.contentclass_attribute.name}</th>
						<td>{attribute_view_gui attribute=$attr}</td>
					</tr>
				{/foreach}
				</tbody>
			</table>
		{/if}

	</div>
	<div class="content-related">

		{include uri='design:parts/content-related.tpl'}

	</div>
</div>