<?php
/**
 * @package Artist_Init
 * @version 1.0
 */
/*
Plugin Name: Artist Init
Description: This is how we init an artist.
Author: Tyler Rop
Version: 1.0
*/

/**
 * initializes an artist
**/
	
	add_action('init', 'artist_init');
	function artist_init() {
		$labels = array(
						'name' =>__('Artists'),
						'singular_name' => __('Artist'),
						'add_new_item' => __('Add new Artist'),
					  );

		$args = array(
						'labels' => $labels,
						'description' => 'Holds artists',
						'public' => TRUE,
						'supports' => array('name', 'bio', 'startyear', 'IMG'),
						'has_archive' => TRUE
			         );

		register_post_type('artist', $args);
	}
?>	