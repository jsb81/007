{set_defaults(hash(
	'show_abstract' , true()
))}


<div class="content-view-line class-{$node.class_identifier} media">

	{if $node|has_attribute( 'immagini' )}
		{def $images = array()}
		{foreach $node.data_map.immagini.content.relation_list as $relation_item}
			{set $images = $images|append(fetch('content','node',hash('node_id',$relation_item.node_id)))}
		{/foreach}
		{if $images}
			<a class="pull-left" href="{if is_set( $node.url_alias )}{$node.url_alias|ezurl('no')}{else}#{/if}">
				{attribute_view_gui attribute=$images[0]|attribute( 'image' ) href=false() image_class='squarethumb' css_class="media-object"}
			</a>
		{/if}
	{elseif $node|has_attribute( 'image' )}
		<a class="pull-left" href="{if is_set( $node.url_alias )}{$node.url_alias|ezurl('no')}{else}#{/if}">
			{attribute_view_gui attribute=$node|attribute( 'image' ) href=false() image_class='squarethumb' css_class="media-object"}
		</a>
	{/if}

  <div class="media-body">
    <h4 class="media-heading">
	  {if is_set( $node.url_alias )}
			<a href="{$node.url_alias|ezurl('no')}" title="{$node.name|wash()}">{$node.name|wash()}</a>
	  {else}
		{$node.name|wash()}
	  {/if}
	</h4>
  <span class="date">
	  <i class="fa fa-calendar"></i> {$node.object.published|l10n( 'shortdate' )}
  </span>
  {if and($show_abstract , $node|has_abstract())}
    <div class="media-abstract">
      {$node|abstract()}
    </div>
	{/if}
	{if $node|has_attribute( 'tematica' )}
        {attribute_view_gui attribute=$node|attribute( 'tematica' )}
    {/if}
  </div>
</div>

{unset_defaults(array('show_abstract'))}