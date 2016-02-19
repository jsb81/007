<div class="container">
	<div class="banner tel_servizi text-center">
		{def $tel_servizi = fetch( 'content' , 'node' , hash( 'node_id' , appini( 'NodeSettings' , 'TelServiziNodeID' )))}
		<h3><a href={$tel_servizi.url_alias|ezurl()}><i class="fa fa-phone"></i> {$tel_servizi.name|wash()}</a></h3>
	</div>
</div>