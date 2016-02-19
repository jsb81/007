{def $root_node = fetch( 'content', 'node', hash( 'node_id', $pagedata.root_node ) )}

{def $nav_supp_class_filter = appini( 'MenuContentSettings', 'TopIdentifierList', array() )
		 $nav_supp_items = fetch( 'content', 'list', hash( 'parent_node_id', $root_node.node_id,
		'sort_by', $root_node.sort_array,
			'class_filter_type', 'include',
			'attribute_filter', array('and',array('priority','>=','3000'),array('priority','<','4000')),
			'class_filter_array', $nav_supp_class_filter ) )
		$nav_supp_items_count = $nav_supp_items|count()}


{if $nav_supp_items_count}
	<div class="nav-supp">
		<ul class="nav navbar-nav navbar-right">
			{foreach $nav_supp_items as $item}
				{if $item.class_identifier|ne('link')}
					<li><a href={$item.url_alias|ezurl()}>{$item.name|wash()}</a></li>
				{else}
					<li><a href={$item.data_map.location.content}>{$item.name|wash()}</a></li>
				{/if}
			{/foreach}
		<ul>
	</div>
{/if}
