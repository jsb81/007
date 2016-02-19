{def $valid_node = $block.valid_nodes[0]
		 $hide_content_title = cond( is_set( $block.custom_attributes.hide_title ), $block.custom_attributes.hide_title, 0 )
     $hide_content_link = cond( is_set( $block.custom_attributes.hide_link ), $block.custom_attributes.hide_link, 0 )
}

<div class="content-view-block block-type-mainstory box">
  {if ne( $block.name, '' )}
    <h2 class="box-title">{$block.name|wash()}</h2>
  {/if}
  <div class="box-content">

    {node_view_gui view='main_story_item'
                   content_node=$valid_node
                   block_view=$block.view
						       hide_title=$hide_content_title
                   hide_link=$hide_content_link
	    }

  </div>
</div>
{undef $valid_node}