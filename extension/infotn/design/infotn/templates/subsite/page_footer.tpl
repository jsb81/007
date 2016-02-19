
<div class="footer">

	<div class="footer-nav">
		<div class="container">

		</div>
	</div>

		<div class="footer-siteinfo">
			<div class="container">
				<div class="siteinfo">
					<div class="col-md-8">
						{attribute_view_gui attribute=$root_node|attribute( 'info' )}
					</div>
					<div class="col-md-4">

						{def $social_networks = array( 'facebook_channel' , 'twitter_channel' , 'flickr_channel' , 'youtube_channel' , 'linkedin_channel')}
						<div class="social-bar">
						{foreach $social_networks as $sn}

							{if $root_node|has_attribute($sn)}

								<a href="{$root_node|attribute($sn).content}">
									<i class="fa fa-2x fa-{$sn|explode('_')[0]}"></i>
								</a>

							{/if}

						{/foreach}
						</p>
					</div>
				</div>
			</div>
		</div>
	{/if}

</div>

{*
<div id="footer" class="container">
  <div class="row">
    <div class="col-md-3 col-md-offset-9">
      <p class="text-right"><small><span class="label label-danger">Powered by OpenContent</span></small></p>
    </div>
  </div>
</div>
*}