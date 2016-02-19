
<div class="footer">
	<div class="widget">
		{include uri='design:atoms/tel_servizi.tpl'}
	</div>

	<div class="footer-nav">
		<div class="container">
			{def $root_node = fetch( 'content', 'node', hash( 'node_id', $pagedata.root_node ) )
					 $nav_supp_items = fetch( 'content', 'list', hash( 'parent_node_id', $root_node.node_id,
																		'sort_by', $root_node.sort_array,
																	  'attribute_filter', array('and',array('priority','>=','1000'),array('priority','<','2000'))
			))}
			<div class="row">
			{if $nav_supp_items}
				<div class="col-sm-6">
					<ul class="nav nav-pills nav-supp">
					{foreach $nav_supp_items as $item}
						<li><a href={$item.url_alias|ezurl()}>{$item.name|wash()}</a></li>
					{/foreach}
					</ul>
				</div>
			{/if}
				<div class="col-sm-6">
					<div class="row">
						<div class="col-xs-4 text-center">
							<img class="img-responsive" src={'images/logo-family-audit.jpg'|ezdesign()} />
						</div>
						<div class="col-xs-4 text-center">
							<img class="img-responsive" src={'images/logo-csq.jpg'|ezdesign()} />
						</div>
						<div class="col-xs-4 text-center">
							<img class="img-responsive" src={'images/logo-csq-2.jpg'|ezdesign()} />
						</div>
					</div>
				</div>

			</div>

		</div>
	</div>

	{def $site_info_node = fetch( 'content' , 'node' , hash( 'node_id' , appini( 'NodeSettings' , 'SiteInfoNodeID'), 'limitation' , array()))}
	{if $site_info_node|has_attribute( 'short_description' )}
		<div class="footer-siteinfo">
			<div class="container">
				<div class="siteinfo">
					<div class="col-md-8">
						{attribute_view_gui attribute=$site_info_node|attribute( 'short_description' )}
					</div>
					<div class="col-md-4">
						{include uri='design:atoms/social_bar.tpl'}
						<div class="text-right  small">
								<br /><br />
								<i class="fa fa-lock"></i> <a href="http://www.internos.infotn.it/">Area Riservata Dipendenti</a>
						</div>
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