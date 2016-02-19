{if $attributes}

{def $count = 0}

<div role="tabpanel" class="tabpanel">

	<!-- Nav tabs -->
	<ul class="nav nav-{$view}" role="tablist" class="tablist">
		{foreach $attributes as $attr}
		{if $attr.has_content}
				<li role="presentation" {if $count|eq(0)}class="active"{/if}>
				<a href="#tab-{$attr.contentclass_attribute_identifier}" aria-controls="{$attr.contentclass_attribute_identifier}" role="tab" data-toggle="tab">{$attr.contentclass_attribute_name}</a>
			</li>
			{set $count = $count|inc(1)}
		{/if}
		{/foreach}
	</ul>

	{set $count = 0}
	<div class="tab-content">
		<!-- Tab panes -->
		{foreach $attributes as $attr}
			{if $attr.has_content}
			<div role="tabpanel" class="tab-pane {if $count|eq(0)}active{/if}" id="tab-{$attr.contentclass_attribute_identifier}">
				{attribute_view_gui attribute=$attr show_link=true()}
			</div>
				{set $count = $count|inc(1)}
			{/if}
		{/foreach}
	</div>

</div>

{undef $count}
{/if}
