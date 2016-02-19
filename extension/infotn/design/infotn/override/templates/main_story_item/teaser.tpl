<div class="mainstory {$block_view}">

  {if $node|has_attribute( 'image' )}
    {attribute_view_gui attribute=$node|has_attribute( 'image' ) image_class='imagefull_cutwide' href=$node.url_alias|ezurl(no) css_class="mainstory-image"}
  {/if}
  {if $hide_title|not()}
    <h3 class="mainstory-title"><a href={$node.url_alias|ezurl()}>{$node.object.name|wash()}</a></h3>
  {/if}

  {if $node|has_abstract}
    <div class="mainstory-abstract abstract">
      {$node|abstract}
    </div>
  {/if}


	{def $url= null
			 $goto=null}

	{if $node.data_map.link_external.has_content}
		{set $url=$node.data_map.link_external.content}
	{/if}

	{if $node.data_map.link_internal.has_content}
		{set $goto=fetch('content','node',hash('node_id',$node.data_map.link_internal.content.relation_list[0].node_id))}
	{/if}

	{if $goto|ne(null)}
		<a class="button" href={$goto.url_alias|ezurl()}>{if $node.data_map.link_text.has_content}{attribute_view_gui attribute=$node.data_map.link_text}{else}{$goto.name|wash}{/if}</a>
	{else}
		{if $url|ne(null)}
			<a class="button" href={$url}>{if $node.data_map.link_text.has_content}{attribute_view_gui attribute=$node.data_map.link_text}{else}{'Read more'|i18n('ocbootstrap')}{/if}</a>
		{/if}
	{/if}
	
</div>