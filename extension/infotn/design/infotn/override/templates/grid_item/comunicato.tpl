<div class="griditem">

	{if $node|has_attribute( 'immagini' )}
		{def $images = array()}
		{foreach $node.data_map.immagini.content.relation_list as $relation_item}
			{set $images = $images|append(fetch('content','node',hash('node_id',$relation_item.node_id)))}
		{/foreach}
		{if $images}
			{include uri='design:atoms/image.tpl' item=$images[0] image_class='imagefull_cutwide' href=$node.url_alias|ezurl(no) css_classes='image-main'}
		{/if}
  {elseif $node|has_attribute( 'image' )}
		{attribute_view_gui attribute=$node|attribute( 'image' ) image_class='imagefull_cutwide' href=$node.url_alias|ezurl(no) css_class="griditem-image"}
  {/if}

	<h3 class="griditem-title"><a href={$node.url_alias|ezurl()}>{$node.object.name|wash()}</a></h3>
  {*if $node.data_map.tags.has_content}
    <span class="griditem-tags tags">
      {attribute_view_gui attribute=$node.data_map.tags}
    </span>
  {/if*}

  <span class="griditem-meta meta">
    <i class="fa fa-calendar"></i> {$node.object.published|l10n('shortdate')}
  </span>

  {if $node|has_abstract}  
    <div class="griditem-abstract">
      {$node|abstract}
    </div>
  {/if}
	{*
	<p><a href={$node.url_alias|ezurl()}>ULTERIORI DETTAGLI
			<span class="mybtn"><i class="fa fa-chevron-right"></i></span></a>
	</p>
	*}



</div>