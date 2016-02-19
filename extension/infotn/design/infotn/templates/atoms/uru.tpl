<div class="well newsletter">
	<h2>Ufficio Relazioni con L'utenza</h2>
	<img class="img-responsive" src={'images/uru.png'|ezdesign()} alt="Link" />
	<br />
	{def $uru = fetch( 'content' , 'node' , hash( 'node_id' , appini( 'NodeSettings' , 'UruNodeID' )))}
	{if $uru}
		{if $uru|has_attribute( 'short_description' )}
			{attribute_view_gui attribute=$uru|attribute( 'short_description' )}
		{/if}
		{if $uru|has_attribute( 'file' )}
				{def $attribute = $uru|attribute( 'file' )}
				<ul class="list-unstyled">
					<li>
						<a href={concat("content/download/",$attribute.contentobject_id,"/",$attribute.id,"/file/",$attribute.content.original_filename)|ezurl} title="Scarica il file {$attribute.content.original_filename|wash( xhtml )}">
		            Scarica la brochure ({$attribute.content.filesize|si( byte )}) <span class="mybtn"><i class="fa fa-download"></i></span>
		        </a>
					</li>
				</ul>
		{/if}
	{/if}
</div>