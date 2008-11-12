/*
 * FBBorderLayout - a jQuery "border layout"
 * Version 0.9.2 - 12 October 2008
 *
 * Copyright (c) 2008 Fabrizio Balliano (http://fabrizioballiano.net).
 * Dual licensed under the GPL (http://www.gnu.org/licenses/gpl.html)
 * and MIT (http://www.opensource.org/licenses/mit-license.php) licenses.
 */

jQuery.fn.FBBorderLayout = function (custom_config)
{
	var defaultConfig = {
		spacing: 5,
		collapseEffect: 'slide', //slide, drop, scale
		animationSpeed: 'normal', //slow, normal, fast
		north_collapsable: true,
		north_resizable: false,
		north_min_height: null,
		north_max_height: null,
		east_width: 200,
		east_collapsable: true,
		east_resizable: false,
		east_min_width: null,
		east_max_width: null,
		south_collapsable: true,
		south_resizable: false,
		south_min_height: null,
		south_max_height: null,
		west_width: 200,
		west_collapsable: true,
		west_resizable: false,
		west_min_width: null,
		west_max_width: null
	}
	
	var numCurCSS = function (object, property) {
		return parseInt(jQuery.curCSS(object[0], property, true), 10) || 0;
	}
	
	var collapseNorth = function () {
		var padding_top = numCurCSS($container, 'paddingTop');
		var top = config.spacing + padding_top;
		$center.css("top", top);
		$east.css("top", top);
		$west.css("top", top);
		$container.find("> .fbbl_north_collapser").css("top", padding_top);
		$north.css({
			zIndex:1000
		}).hide(config.collapseEffect, {direction: "up"}, config.animationSpeed, apply);
	}
	
	var collapseEast = function () {
		var padding_right = numCurCSS($container, 'paddingRight');
		$center.css("right", config.spacing + padding_right);
		$container.find("> .fbbl_east_collapser").css("right", padding_right);
		$east.css({
				height: numCurCSS($east, 'height'),
				left: $east.offset().left,
				zIndex: 1000
		}).hide(config.collapseEffect, {direction: "right"}, config.animationSpeed, apply);
	}
	
	var collapseSouth = function () {
		var padding_bottom = numCurCSS($container, 'paddingBottom');
		var bottom = config.spacing + padding_bottom;
		$center.css("bottom", bottom);
		$east.css("bottom", bottom);
		$west.css("bottom", bottom);
		$container.find("> .fbbl_south_collapser").css("bottom", padding_bottom);
		$south.css({
			top: $south.offset().top,
			zIndex: 1000
		}).hide(config.collapseEffect, {direction: "down"}, config.animationSpeed, apply);
	}
	
	var collapseWest = function () {
		var padding_left = numCurCSS($container, 'paddingLeft');
		$center.css("left", config.spacing + padding_left);
		$container.find("> .fbbl_west_collapser").css("left", padding_left);
		$west.css({
				height: numCurCSS($west, 'height'),
				zIndex: 1000
		}).hide(config.collapseEffect, {direction: 'left'}, config.animationSpeed, apply);
	}
	
	var expandNorth = function () {
		if ($north.is(':visible')) return;
		$north.show(config.collapseEffect, {direction: 'up'}, config.animationSpeed, apply);
	}
	
	var expandEast = function () {
		if ($east.is(':visible')) return;
		$east.show(config.collapseEffect, {direction: 'right'}, config.animationSpeed, apply);
	}
	
	var expandSouth = function () {
		if ($south.is(':visible')) return;
		$south.show(config.collapseEffect, {direction: 'down'}, config.animationSpeed, apply);
	}
	
	var expandWest = function () {
		if ($west.is(':visible')) return;
		$west.show(config.collapseEffect, {direction: 'left'}, config.animationSpeed, apply);
	}
	
	var apply = function () {
		var absolute_top = numCurCSS($container, 'paddingTop');
		var absolute_right = numCurCSS($container, 'paddingRight');
		var absolute_bottom = numCurCSS($container, 'paddingBottom');
		var absolute_left = numCurCSS($container, 'paddingLeft');
		var center_top = absolute_top;
		var center_right = absolute_right;
		var center_bottom = absolute_bottom;
		var center_left = absolute_left;
		
		if ($north.length) {
			center_top += config.spacing;
			if ($north.is(':visible')) {
				$north.css({
					zIndex: 0,
					width: 'auto'
				});
				center_top += $north.outerHeight();
			}
			if (config.north_collapsable) {
				$container.find('> .fbbl_north_collapser').css({
					position: 'absolute',
					cursor: 'pointer',
					zIndex: 0,
					fontSize: '1px',
					width: 50,
					height: config.spacing,
					top: center_top - config.spacing,
					left: ($container.innerWidth()-50)/2
				}).toggle(collapseNorth, expandNorth);
			}
		}
		
		if ($south.length) {
			center_bottom += config.spacing;
			if ($south.is(':visible')) {
				$south.css({
					position: 'absolute',
					zIndex: 0,
					top: 'auto',
					right: absolute_right,
					bottom: absolute_bottom,
					left: absolute_left,
					width: 'auto'
				});
				center_bottom += $south.outerHeight();
				if ($.browser.msie) $south.width('100%');
			}
			if (config.south_collapsable) {
				$container.find('> .fbbl_south_collapser').css({
					position: 'absolute',
					cursor: 'pointer',
					zIndex: 0,
					fontSize: '1px',
					width: 50,
					height: config.spacing,
					bottom: center_bottom - config.spacing,
					left: ($container.innerWidth()-50)/2
				}).toggle(collapseSouth, expandSouth);
			}
		}
	
		if ($west.length) {
			center_left += config.spacing;
			if ($west.is(':visible')) {
				$west.css({
					position: 'absolute',
					overflow: 'auto',
					zIndex: 0,
					top: center_top,
					bottom: center_bottom,
					left: absolute_left,
					width: config.west_width - numCurCSS($west, 'borderLeftWidth') - numCurCSS($west, 'borderRightWidth') - numCurCSS($west, 'paddingLeft') - numCurCSS($west, 'paddingRight'),
					height: 'auto'
				});
				if ($.browser.msie) {
					$west.width(config.west_width).height($container.innerHeight() - center_top - center_bottom);
				} else if ($.browser.opera) {
					$west.height($container.innerHeight() - center_top - center_bottom - numCurCSS($west, 'borderTopWidth') - numCurCSS($west, 'borderBottomWidth') - numCurCSS($west, 'paddingTop') - numCurCSS($west, 'paddingBottom'));
				}
				center_left += $west.outerWidth();
			}
			if (config.west_collapsable) {
				$container.find('> .fbbl_west_collapser').css({
					position: 'absolute',
					cursor: 'pointer',
					zIndex: 0,
					width: config.spacing,
					height: 50,
					top: center_top + ($west.outerHeight()-50)/2,
					left: center_left - config.spacing
				}).toggle(collapseWest, expandWest);
			}
		}
	
		if ($east.length) {
			center_right += config.spacing;
			if ($east.is(':visible')) {
				$east.css({
					position: 'absolute',
					overflow: 'auto',
					zIndex: 0,
					top: center_top,
					right: absolute_right,
					bottom: center_bottom,
					left: 'auto',
					width: config.east_width - numCurCSS($east, 'borderLeftWidth') - numCurCSS($east, 'borderRightWidth') - numCurCSS($east, 'paddingLeft') - numCurCSS($east, 'paddingRight'),
					height: 'auto'
				});
				if ($.browser.msie) {
					$east.width(config.east_width).height($container.innerHeight() - center_top - center_bottom);
				} else if ($.browser.opera) {
					$east.height($container.innerHeight() - center_top - center_bottom - numCurCSS($east, 'borderTopWidth') - numCurCSS($east, 'borderBottomWidth') - numCurCSS($east, 'paddingTop') - numCurCSS($east, 'paddingBottom'));
				}
				center_right += $east.outerWidth();
			}
			if (config.east_collapsable) {
				$container.find('> .fbbl_east_collapser').css({
					position: 'absolute',
					cursor: 'pointer',
					zIndex: 0,
					width: config.spacing,
					height: 50,
					top: center_top + ($east.outerHeight()-50)/2,
					right: center_right - config.spacing
				}).toggle(collapseEast, expandEast);
			}
		}

		if ($center.length) {
			$center.css({
				position: 'absolute',
				zIndex: 0,
				top: center_top,
				right: center_right,
				bottom: center_bottom,
				left: center_left,
				overflow: 'auto'
			});
			if ($.browser.msie) {
				$center.width($container.innerWidth() - center_left - center_right);
				$center.height($container.innerHeight() - center_top - center_bottom);
			}
		}
	}
	
	var $container = jQuery(this);
	var $window = jQuery(window);
	var $html = jQuery("html");
	var $body = jQuery("body");
	var config = jQuery.extend(defaultConfig, custom_config);
	var $north = $container.find("> .fbbl_north");
	var $east = $container.find("> .fbbl_east");
	var $south = $container.find("> .fbbl_south");
	var $west = $container.find("> .fbbl_west");
	var $center = $container.find("> .fbbl_center");
	var center_top = config.spacing;
	var center_right = config.spacing;
	var center_bottom = config.spacing;
	var center_left = config.spacing;
	
	$html.css({
		height: '100%'
	});
	
	$body.css({
		position: 'relative',
		overflow: 'hidden',
		height: '100%',
		margin: 0,
		padding: 0
	});
	
	$container.css({
		overflow: 'hidden'
	});
	
	$window.resize(apply);
	if (config.north_collapsable && $north.length) jQuery("<div class='fbbl_north_collapser'></div>").appendTo($container);
	if (config.east_collapsable && $east.length) jQuery("<div class='fbbl_east_collapser'></div>").appendTo($container);
	if (config.south_collapsable && $south.length) jQuery("<div class='fbbl_south_collapser'></div>").appendTo($container);
	if (config.west_collapsable && $west.length) jQuery("<div class='fbbl_west_collapser'></div>").appendTo($container);
	apply();
	
	if (typeof jQuery.fn.resizable == "function") {
		if (config.north_resizable && $north.length) {
			var tmp = {
				handles: 's',
				transparent: true,
				start: function () {
					$north.css('z-index', 1000);
				},
				stop: apply
			};
			if (config.north_min_height) tmp.minHeight = config.north_min_height;
			if (config.north_max_height) tmp.maxHeight = config.north_max_height;
			$north.resizable(tmp);
		}
		if (config.east_resizable && $east.length) {
			var tmp = {
				handles: 'w',
				transparent: true,
				start: function () {
					$east.css('z-index', 1000);
				},
				stop: function() {
					config.east_width=$east.outerWidth();
					apply();
				}
			};
			if (config.east_min_width) tmp.minWidth = config.east_min_width;
			if (config.east_max_width) tmp.maxWidth = config.east_max_width;
			$east.resizable(tmp);
		}
		if (config.south_resizable && $south.length) {
			var tmp = {
				handles: 'n',
				transparent: true,
				start: function () {
					$south.css('z-index', 1000);
				},
				stop: apply
			};
			if (config.south_min_height) tmp.minHeight = config.south_min_height;
			if (config.south_max_height) tmp.maxHeight = config.south_max_height;
			$south.resizable(tmp);
		}
		if (config.west_resizable && $west.length) {
			var tmp = {
				handles: 'e',
				transparent: true,
				start: function () {
					$west.css('z-index', 1000);
				},
				stop: function() {
					config.west_width=$west.outerWidth();
					apply();
				}
			};
			if (config.west_min_width) tmp.minWidth = config.west_min_width;
			if (config.west_max_width) tmp.maxWidth = config.west_max_width;
			$west.resizable(tmp);
		}
	}
}