// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('turbolinks:load', function() {

  var $tree = $('.tree');
  var $nodes = $tree.find('.parent');
  var $node_names = $nodes.children('span').find('.name');
  var $node_toggles = $nodes.children('span').find('.toggle-icon');

  // make the nodes toggleable
  $node_toggles.add($node_names).click(function() {
    $(this).parent().children(':first').toggleClass('glyphicon-minus glyphicon-plus');
    $(this).parent().siblings().slideToggle(200);
  });

  var $items = $tree.find('li > span');
  var $item_actions = $items.find('.actions');
  var timer;
  
  // show the controls on item hover
  $item_actions.hide();
  $items.hover(
    function() {
      var $self = $(this);
      timer = setTimeout(function() {
        $self.children(':last').stop().fadeIn(200);
      }, 100);
    }, function() {
      $(this).children(':last').stop().fadeOut(200);
      clearTimeout(timer);
    }
  );

  var $tree_collapse_btn = $('#collapse-tree');
  var $tree_expand_btn = $('#expand-tree');

  // get the Collapse All button to work
  $tree_collapse_btn.click(function(e) {
    e.preventDefault();
    $nodes.find('.glyphicon-minus').click();
    $(this).blur();
  });

  // get the Expand All button to work
  $tree_expand_btn.click(function(e) {
    e.preventDefault();
    $nodes.find('.glyphicon-plus').click();
    $(this).blur();
  });
});