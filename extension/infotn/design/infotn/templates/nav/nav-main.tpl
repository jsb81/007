{def $root_node = fetch( 'content', 'node', hash( 'node_id', $pagedata.root_node ) )}

<nav class="nav-main navbar navbar-inverse" role="navigation">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      {*<a class="navbar-brand" href={'/'|ezurl()}><img src={"images/logo.png"|ezdesign()} alt="Informatica Trentina" /></a>*}
    </div>

    <div class="collapse navbar-collapse navbar-right">

      {def $top_menu_class_filter = appini( 'MenuContentSettings', 'TopIdentifierList', array() )
      $top_menu_items = fetch( 'content', 'list', hash( 'parent_node_id', $root_node.node_id,
      'sort_by', $root_node.sort_array,
      'class_filter_type', 'include',
      'attribute_filter', array(array('priority','>','5000')),
      'class_filter_array', $top_menu_class_filter ) )
      $top_menu_items_count = $top_menu_items|count()}

      {if $top_menu_items_count}
        <ul class="nav navbar-nav">

	        <li class="firts-li"><a href={'/'|ezurl()}>Home page</a></li>

          {foreach $top_menu_items as $key => $item}
            {node_view_gui content_node=$item
            view='nav-main_item'
            key=$key
            current_node_id=$current_node_id
            ui_context=$ui_context
            pagedata=$pagedata
            top_menu_items_count=$top_menu_items_count}
          {/foreach}
        </ul>
      {/if}

	    <form role="search" class="navbar-form navbar-right" method="get" action="{'/content/search'|ezurl( 'no' )}" id="site-wide-search">
		    <div class="form-group">
			    <label for="site-wide-search-field" class="control-label sr-only">{'Search'|i18n('design/ocbootstrap/pagelayout')}</label>

			    {if $pagedata.is_edit}
				    <input class="form-control" type="search" name="SearchText" id="site-wide-search-field" placeholder="{'Search'|i18n('design/ocbootstrap/pagelayout')}" disabled="disabled" />
			    {else}
				    <div class="input-group"><input class="form-control" type="search" name="SearchText" id="site-wide-search-field" placeholder="{'Search'|i18n('design/ocbootstrap/pagelayout')}" /><div class="input-group-btn"><button type="submit" class="btn"><i class="fa fa-search"></i></button></div>
				    </div>
				    {if eq( $ui_context, 'browse' )}
					    <input name="Mode" type="hidden" value="browse" />
				    {/if}
			    {/if}
		    </div>
	    </form>


    </div>
  </div><!--/.container-->
</nav><!--/nav-->