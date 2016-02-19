{* File - List embed view *}
<div class="content-view-embed">
    <div class="class-file">
    {if $object.data_map.file.has_content}
    {def $file = $object.data_map.file}
    <div class="content-body attribute-{$file.content.mime_type_part|explode('.')|implode('-')}">
        <i class="fa mime-file mime-{$file.content.mime_type_part|explode('.')|implode('-')}"></i> 
		<a href={concat("content/download/", $file.contentobject_id, "/", $file.id, "/file/", $file.content.original_filename)|ezurl}>
			{*$file.content.original_filename|wash("xhtml")*}
			{$object.name|wash()}
		</a> {$file.content.filesize|si(byte)}
    </div>
    {undef $file}
    {else}
    <div class="content-body">
        <a href={$object.main_node.url_alias|ezurl}>{$object.name|wash}</a>
    </div>
    {/if}
   </div>
</div>