<div class="content-view-full class-{$node.class_identifier} row">
  <div class="content-main wide">

	  <div class="heading">
      <h1>{$node.name|wash()}</h1>
		  {*if $node.data_map.sottotitolo.has_content}
			  <p class="subheading">{attribute_view_gui attribute=$node.data_map.sottotitolo}</p>
		  {/if*}
	  </div>

	  <div class="row">
		  <div class="col-sm-3">


			  {if $node|has_attribute( 'issuu' )}
				  <div class="issuu">
					  {attribute_view_gui attribute=$node|attribute( 'issuu' )}
				  </div>
				{elseif $node|has_attribute( 'image' )}
					 {attribute_view_gui attribute=$node|attribute( 'image' ) image_class='portrait' href=$node.url_alias|ezurl(no)}
			  {/if}

		  </div>
			<div class="col-sm-9">

				{if $node|has_attribute( 'abstract' )}
					<div class="abstract lead">
						{attribute_view_gui attribute=$node|attribute( 'abstract' )}
					</div>
				{/if}
				{if $node|has_attribute( 'anno' )}
					<p class="meta"><i class="fa fa-calendar"></i> {attribute_view_gui attribute=$node|attribute( 'anno' )}</p>
				{/if}
				{if $node|has_attribute( 'descrizione' )}
					<div class="descrizione">
						{attribute_view_gui attribute=$node|attribute( 'descrizione' )}
					</div>
				{/if}

				{if $node|has_attribute( 'file' )}
					<p class="file">
						<i class="fa fa-download"></i> {attribute_view_gui attribute=$node|attribute( 'file' )}
					</p>
				{/if}

			</div>
	  </div>

  </div>

</div>