{if or($node|has_attribute( 'telefono' ),
$node|has_attribute( 'fax' ),
$node|has_attribute( 'email' ),
$node|has_attribute( 'note_contatti' ))
}

	{*<div class="well contatti">*}
	<div class="contatti">
		<h2><i class="fa fa-comment"></i> Contatti</h2>
		{if $node|has_attribute( 'telefono' )}
			<i class="fa fa-phone"></i> {attribute_view_gui attribute=$node|attribute( 'telefono' )}<br />
		{/if}
		{if $node|has_attribute( 'fax' )}
			<i class="fa fa-fax"></i> {attribute_view_gui attribute=$node|attribute( 'fax' )}<br />
		{/if}
		{if $node|has_attribute( 'email' )}
			<i class="fa fa-envelope"></i> {attribute_view_gui attribute=$node|attribute( 'email' )}<br />
		{/if}
		{if $node|has_attribute( 'note_contatti' )}
			<div class="note">
				{attribute_view_gui attribute=$node|attribute( 'note_contatti' )}
			</div>
		{/if}
	</div>

{/if}