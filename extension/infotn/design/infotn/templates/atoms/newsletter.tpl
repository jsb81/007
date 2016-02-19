<div class="well newsletter">
	<h2>Newsletter Link</h2>
	<img class="img-responsive" src={'images/link.png'|ezdesign()} alt="Link" />
	<br />
	<p>News, focus e tendenze dell'informatica in Trentino</p>
	<ul class="list-unstyled">
		{def $newsletter_node = fetch( 'content' , 'node' , hash( 'node_id' , appini( 'NodeSettings' , 'NewsletterNodeID' )))
			   $newsletter_sub = fetch('content' , 'node' , hash( 'node_id' , appini( 'NodeSettings' , 'NewsletterSubscriptionNodeID')))
		}

		{if $newsletter_sub}
			<li><a href={$newsletter_sub.url_alias|ezurl()}>ISCRIVITI <span class="mybtn"><i class="fa fa-chevron-right"></i></span></a></li>
		{/if}

		{if $newsletter_node}
			<li><a href={$newsletter_node.url_alias|ezurl()}>LA NEWSLETTER <span class="mybtn"><i class="fa fa-chevron-right"></i></span></a></li>
		{/if}
	</ul>
</div>