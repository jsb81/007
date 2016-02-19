{def $valid_nodes = $block.valid_nodes}

{if $valid_nodes}
	<div class="content-view-block block-banner box">
  {foreach $valid_nodes as $i => $valid_node}
    {*node_view_gui view='block_item' image_class='articlethumbnail' content_node=$valid_node*}


    {include uri='design:atoms/banner.tpl'
             item=$valid_node
    }


  {/foreach}
	</div>
{/if}
{undef $valid_nodes}