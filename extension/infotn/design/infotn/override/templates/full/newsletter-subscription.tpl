<div class="content-view-full class-folder row">

	<div class="content-main wide">

    <h1>{$node.name|wash()}</h1>


    {if $node|has_attribute( 'short_description' )}
			<div class="abstract">
				{attribute_view_gui attribute=$node|attribute( 'short_description' )}
			</div>
		{/if}

		{if $node|has_attribute( 'geolocation' )}
			<div class="map text-right">
				<hr />
					{attribute_view_gui attribute=$node|attribute( 'geolocation' )}
					<a target="_blank" class="btn btn-primary" href="//www.google.it/maps/dir//'{$node|attribute( 'geolocation' ).content.address}'/@{$node|attribute( 'geolocation' ).content.latitude},{$node|attribute( 'geolocation' ).content.longitude},12z">come arrivare</a>
				<hr />
			</div>
		{/if}

    {if $node|has_attribute( 'image' )}
      {include uri='design:atoms/image.tpl' item=$node image_class=appini( 'ContentViewFull', 'DefaultImageClass', 'wide' ) css_classes="image-main"}
    {/if}

    {if $node|has_attribute( 'tags' )}
      <div class="tags">
        {foreach $node.data_map.tags.content.keywords as $keyword}
          <span class="label label-primary">{$keyword}</span>
        {/foreach}
      </div>
    {/if}

    {if $node|has_attribute( 'description' )}
      <div class="description">
        {attribute_view_gui attribute=$node|attribute( 'description' )}
      </div>
    {/if}

		{def $subscription_url = appini('NewsletterSettings', 'SubscriptionUrl')}

		<iframe style="width:100%" frameborder="0" height="600" src={$subscription_url}></iframe>

  </div>

</div>
