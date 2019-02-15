{combine_script id='jquery.fancytree' load='footer' require='jquery' path='plugins/album_list/js/fancytree/jquery.fancytree-all-deps.min.js'}
{combine_css id='fancytree' path='plugins/album_list/js/fancytree/skin-lion/ui.fancytree.min.css'}
<!-- {html_style}
{/html_style} -->
{footer_script require='jquery'}
$(function(){  // on page load
  $("#tree").fancytree({
    imagePath: 'plugins/album_list/js/fancytree/skin-custom/',
    renderNode: function(event, data) {
      // Optionally tweak data.node.span
      var node = data.node;
      if(node.data.cstrender){
        var $span = $(node.span);
        $span.find("> span.fancytree-title").text(">> " + node.title).css({
          fontStyle: "italic"
        });
        $span.find("> span.fancytree-icon").css({
          //border: "1px solid green",
          backgroundImage: "url(skin-custom/customDoc2.gif)",
          backgroundPosition: "0 0"
        });
      }
    },
    activate: function(event, data) {
      var node = data.node;
      // Use <a> href and target attributes to load the content:
      if( node.data.href ){
        // Open target
        window.open(node.data.href, node.data.target);
        // or open target in iframe
//      $("[name=contentFrame]").attr("src", node.data.href);
      }
    },
    /*renderNode: function(event, data) {
      // Optionally tweak data.node.span
      var node = data.node;
      if(node.data.nbPhotos){

      }
    }*/
  });
});
{/footer_script}


<div id="tree">
    <ul>
      <li class="folder">Standard nodes, modified by extra CSS rules
        <ul>
          <li id="node_4.1">Sub-item 4.1
          <li id="node_4.2">Sub-item 4.2
        </ul>

      <li class="folder">Override CSS style per node
        <ul>
          <li class="custom1">class="custom1": Additional classes are copied over to outer &lt;span>
          <li class="folder custom1">class="custom1": Additional classes are copied over to outer &lt;span>
        </ul>

      <li class="folder">Use 'data-NAME' attributes to define additional data
        <ul>
          <li data-icon="customDoc1.gif">Node with standard CSS, but custom icon
          <li class="folder" data-icon="folder_docs.gif">Folder with standard CSS but custom icon
          <li data-icon="ui-icon ui-icon-heart">'icon' is directly added to the image &lt;span>, so jQuery stock icons may be used
        </ul>

      <li class="folder">Use 'data-json' attribute to define additional data
        <ul>
          <li>
            <a href="http://localhost/piwigo/index.php?/category/35">Test mov</a>
            <!-- <span>42</span> -->  
          </li>
        </ul>

      <li class="folder">Use render callback
        <ul>
          <li id="renderNode1" data-cstrender="true">Node hat will be handled by 'render' calback
        </ul>

    </ul>
  </div>

<!-- <div class="albumList">
{foreach from=$album_list item=album}
  <div class="albumListItem">{$album}</div>
{/foreach}
</div> -->
