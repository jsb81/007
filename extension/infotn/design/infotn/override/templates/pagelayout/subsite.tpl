<!DOCTYPE html>
<!--[if lt IE 9 ]><html class="unsupported-ie ie" lang="{$site.http_equiv.Content-language|wash}"><![endif]-->
<!--[if IE 9 ]><html class="ie ie9" lang="{$site.http_equiv.Content-language|wash}"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html lang="{$site.http_equiv.Content-language|wash}"><!--<![endif]-->
<head>
{def $basket_is_empty   = cond( $current_user.is_logged_in, fetch( shop, basket ).is_empty, 1 )
     $user_hash         = concat( $current_user.role_id_list|implode( ',' ), ',', $current_user.limited_assignment_value_list|implode( ',' ) )}


{if is_set( $extra_cache_key )|not}
    {def $extra_cache_key = ''}
{/if}

{cache-block keys=array( $module_result.uri, $basket_is_empty, $current_user.contentobject_id, $extra_cache_key )}
{def $pagedata        = ezpagedata()}

{def $pagestyle        = $pagedata.css_classes
     $locales          = fetch( 'content', 'translation_list' )
     $current_node_id  = $pagedata.node_id}

  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Site: {ezsys( 'hostname' )} -->
  {if ezsys( 'hostname' )|contains( 'opencontent' )}
    <META name="robots" content="NOINDEX,NOFOLLOW" />
  {/if}

{include uri='design:page_head.tpl'}
{include uri='design:page_head_style.tpl'}
{include uri='design:page_head_script.tpl'}

</head>
<body>

{def $current_node = fetch('content', 'node', hash('node_id', $module_result.node_id ))}

{def $root_node = $current_node}

{if $current_node.class_identifier|eq( 'subsite' )}
  {set $root_node = $current_node}
{else}
  {set $root_node=$current_node.path[1]}
{/if}


<div id="page" class="subsite{if $current_node_id|eq($root_node.node_id)} home{/if}">

    {include uri='design:subsite/page_header.tpl'}
{/cache-block}
{cache-block keys=array( $module_result.uri, $user_hash, $extra_cache_key )}

  {if $root_node|attribute('show_submenu')}
    {include uri='design:subsite/nav-main.tpl'}
  {/if  }

    {if and( $pagedata.website_toolbar, $pagedata.is_edit|not)}
      {include uri='design:page_toolbar.tpl'}
    {/if}

    {if and( $pagedata.node_id|ne($root_node.node_id), $pagedata.show_path, array( 'edit', 'browse' )|contains( $ui_context )|not() )}
      {include uri='design:subsite/breadcrumb.tpl'}
    {/if}

    <div class="container">

{/cache-block}

      {$module_result.content}

{cache-block keys=array( $module_result.uri, $user_hash, $access_type.name, $extra_cache_key )}

    </div>

    {include uri='design:subsite/page_footer.tpl'}

</div>

{include uri='design:page_footer_script.tpl'}

{* Codice extra usato da plugin javascript *}
{include uri='design:page_extra.tpl'}

{/cache-block}

{* This comment will be replaced with actual debug report (if debug is on). *}
<!--DEBUG_REPORT-->
</body>
</html>
