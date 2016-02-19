<div class="facet-content">
{if $data.count}

  {include name=navigator
		   uri='design:navigator/google.tpl'
		   page_uri=$data.base_uri
		   item_count=$data.count
		   view_parameters=$view_parameters
		   item_limit=$page_limit}

      <div class="row">
        {foreach $data.contents as $child}
          <div class="col-sm-3 col-xs-6">

              {node_view_gui view=grid_item content_node=$child}

          </div>
          {delimiter modulo=4}
            </div>
            <div class="row">
          {/delimiter}
        {/foreach}
      </div>


  {include name=navigator
		   uri='design:navigator/google.tpl'
		   page_uri=$data.base_uri
		   item_count=$data.count
		   view_parameters=$view_parameters
		   item_limit=$page_limit}

{else}
  <em>Nessun risultato</em>
{/if}
</div>