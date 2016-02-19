{*
  events_node = the source event_calendar node
  number = the number of upcoming events to show
  title = the title to assign (if no title is provided, events_node.name is going to be used
*}

{set_defaults(hash(
  'show_title', true(),
  'show_link', true(),
  'number', 5,
  'view', 'line'
))}

{def
    $curr_ts = currentdate()
    $curr_today = $curr_ts|datetime( custom, '%j')
    $curr_year =  $curr_ts|datetime( custom, '%Y')
    $curr_month = $curr_ts|datetime( custom, '%n')
    $today_ts = makedate( $curr_month, $curr_today, $curr_year )
    $upcoming_events = fetch( 'content', 'list',
                        hash( 'parent_node_id', $events_node.node_id,
                              'limit', $number,
                              'sort_by', array( 'attribute', true(), 'event/from_time'),
                              'main_node_only', true(),
                              'class_filter_type', 'include',
                              'class_filter_array', array( 'event' ),
                              'attribute_filter', array(
                              'or',
                              array( 'event/from_time', '>=', $today_ts ),
                              array( 'event/to_time', '>=', $today_ts ) ) ) ) }


{if $upcoming_events}
  {if $show_title}<h2 class="block-title">{if $title}{$title}{else}{$events_node.name|wash()}{/if}</h2>{/if}
  <div class="event-list">
    {foreach $upcoming_events as $event}
      {node_view_gui content_node=$event view=$view}
    {/foreach}
  </div>
  {if $show_link}
  <p class="goto">
    <a href={$events_node.url_alias|ezurl()}>
	    VEDI TUTTI <span class="mybtn"><i class="fa fa-chevron-right"></i></span>
    </a>
  </p>
  {/if}
{/if}

{unset_defaults(array('show_title','number', 'view'))}