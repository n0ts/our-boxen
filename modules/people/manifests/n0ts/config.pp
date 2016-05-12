class people::n0ts::config {
  notify { "class people::n0ts::config declared - ${sp_machine_name}": }

  $is_macbook = $sp_machine_name ? {
    /^MacBook.*/ => true,
    default      => false,
  }
  $is_mac_mini = $sp_machine_name ? {
    /^Mac mini.*/ => true,
    default       => false,
  }

  include osx::activity_monitor::dock_icon
  include osx::activity_monitor::show_all_processes
  include osx::activity_monitor::show_main_window
  include osx::activity_monitor::sort

  include osx::airdrop::all_interfaces

  if $is_macbook {
    include osx::appearance::font_rendering_mode
  }
  if $is_mac_mini {
    class { 'osx::appearance::font_rendering_mode':
      mode => 2,
    }
  }

  class { 'osx::appearance::sidebar_icons':
    size => 'small',
  }
  class { 'osx::appearance::colors':
    highlight => 'graphite',
    main      => 'graphite',
  }

  include osx::calendar::show_days
  include osx::calendar::first_day
  include osx::calendar::show_event_times
  include osx::calendar::show_time_zone
  include osx::calendar::show_week_numbers

  include osx::cd_dvd::disable_automatic_actions

  include osx::contacts::address_format
  include osx::contacts::display_format
  include osx::contacts::sort

  if versioncmp($::macosx_productversion_major, '10.11') >= 0 {
    class { 'osx::dashboard::enable':
      value => 2,   # As Space
    }
  }

  include osx::debug_mode

  include osx::disk_images::auto_mount
  include osx::disk_images::skip_verification

  include osx::disk_utility::advanced_image_options
  include osx::disk_utility::hidden_partitions

  if $is_macbook {
    include osx::displays::auto_brightness_adjustment
  }

  class { 'osx::dock::autohide':
    delay => 0,
  }
  include osx::dock::clear
  include osx::dock::dim_hidden_apps
  include osx::dock::disable_rearrange_spaces
  include osx::dock::itunes_notifications
  class { 'osx::dock::icon_size':
    size => 24,
  }
  include osx::dock::hilite_stack
  class { 'osx::dock::hot_corners':
    top_left     => 'Desktop',
    top_right    => 'Mission Control',
    bottom_left  => 'Start Screen Saver',
    bottom_right => 'Dashboard',
  }
  class { 'osx::dock::magnification':
    magnification_size => '48',
  }
  include osx::dock::new_stack_list
  class { 'osx::dock::pin_position':
    position => 'end',
  }
  class { 'osx::dock::position':
    position => 'right',
  }
  class { 'osx::dock::workspaces_edge_delay':
    delay => 2.2,
  }

  if versioncmp($::macosx_productversion_major, '10.10') >= 0 and $is_macbook {
    include osx::dock::dark
  }

  if $is_macbook or $is_mac_mini {
    include osx::energy::enable_power_nap
  }

  if $is_macbook {
    class { 'osx::energy::disk_sleep':
      on_battery      => 10,
      when_plugged_in => 60,
    }
    class { 'osx::energy::display_sleep':
      on_battery      => 5,
      when_plugged_in => 30,
    }
    if versioncmp($::macosx_productversion_major, '10.10') < 0 {
      $mode = 7
    } else {
      $mode = 3
    }
    class { 'osx::energy::hibernatemode':
      mode => $mode,
    }
    class { 'osx::energy::hibernation':
      on_battery      => 30,
      when_plugged_in => 90,
    }

    # use iStat
    class { 'osx::energy::battery':
      percent => false,
      time    => false,
    }
  }
  if $is_mac_mini {
    class { 'osx::energy::disk_sleep':
      when_plugged_in => 60,
    }
    class { 'osx::energy::display_sleep':
      when_plugged_in => 30,
    }
    include osx::energy::enable_autorestart
  }

  include osx::firewall::enable_stealth_mode

  include osx::finder::animations
  include osx::finder::default_file_view_mode
  class { 'osx::finder::default_location':
    location => "/Users/${::boxen_user}/Desktop",
  }
  include osx::finder::default_search_scope
  include osx::finder::empty_trash_securely
  include osx::finder::expand_file_info
  include osx::finder::file_dialog_view_mode
  include osx::finder::path_bar
  include osx::finder::posix_title_path
  include osx::finder::quicklook_folder
  include osx::finder::quicklook_text_selection
  include osx::finder::show_all_extensions
  include osx::finder::show_all_on_desktop
  include osx::finder::springing
  include osx::finder::status_bar
  include osx::finder::unhide_library

  if versioncmp($::macosx_productversion_major, '10.11') >= 0 and $is_macbook {
    include osx::finder::hidden_menu_bar
  }
  # use iStat
  include osx::menu_bar::hide_date_time
  include osx::menu_bar::toolbar

  include osx::global::disable_autocorrect
  if $is_macbook {
    include osx::global::disable_remote_control_ir_receiver
  }
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog

  if $is_mac_mini {
    include osx::itunes::automatic_device_backup_when_syncing
    include osx::itunes::automatic_sync
  }

  include osx::keyboard::capslock_to_control
  include osx::keyboard::enable_keyboard_control_access
  include osx::keyboard::disable_smart
  include osx::keyboard::key_repeat_rate
  include osx::keyboard::key_repeat_delay
  if $is_macbook {
    class { 'osx::keyboard::enable_illuminate':
      turn_off_sec => 300,
    }
  }

  include osx::launchpad::reset

  include osx::login::disable_guest
  include osx::login::enable_fast_user_switching
  include osx::login::show_admin_information

  include osx::mail::copy_email_addresses
  include osx::mail::disable_inline_attachments
  include osx::mail::disable_spell_checking 
  include osx::mail::display_threaded_mode

  class { 'osx::mission_control::animation':
    speed => '0.15',
  }
  include osx::mission_control::disable_dashboard_visibility
  include osx::mission_control::disable_group_by_app

  class { 'osx::network::default_login_name':
    default_name => $::boxen_user,
  }
  include osx::network::disable_dsstores
  include osx::network::disable_guest

  include osx::printing::quit_when_finished

  include osx::safari::homepage
  include osx::safari::disable_auto_open_safe
  include osx::safari::disable_thumbnail_cache
  include osx::safari::do_not_track
  include osx::safari::enable_develop_menu
  include osx::safari::enable_plugins
  include osx::safari::hide_top_sites
  include osx::safari::update_extensions_automatically

  if versioncmp($::macosx_productversion_major, '10.11') >= 0 {
    include osx::safari::always_restore
    include osx::safari::encoding_utf8
    include osx::safari::minimum_font_size
    include osx::safari::show_full_url
  }

  include osx::screencapture::add_drop_shadows
  class { 'osx::screencapture::base_name':
    base_name => 'cap_',
  }
  include osx::screencapture::format
  class { 'osx::screencapture::location':
    location => "/Users/${::boxen_user}/Desktop",
  }

  if $is_mac_mini {
    include osx::screensaver::disable_password_protection
    class { 'osx::screensaver::idle_time':
      time => 0,
    }
  }
  if $is_macbook {
    include boxen::security
    class { 'osx::screensaver::idle_time':
      time => 180,
    }
  }

  class { 'osx::sound::bluetooth':
    audio_bitpool => 40,
  }
  include osx::sound::disable_boot
  include osx::sound::disable_volume_feedback

  include osx::system::disable_app_quarantine
  include osx::system::disable_crash_reporter
  include osx::system::disable_save_documents_to_icloud_by_default
  class { 'osx::system::software_update':
    days => 7,
  }

  include osx::text_edit::disable_rich_text
  include osx::text_edit::encoding

  include osx::time_machine::disable_local_backups
  include osx::time_machine::enable_unsupported_network_volumes

  include osx::system_preferences::all_mode

  if $is_macbook {
    include osx::touchpad::gestures::enable_app_expose
    include osx::touchpad::gestures::enable_tap_to_click
    include osx::touchpad::gestures::enable_three_finger_drag
    include osx::touchpad::gestures::enable_three_finger_look_up
  }

  include osx::universal_access::assistive_device_access
  include osx::universal_access::ctrl_mod_zoom
  include osx::universal_access::cursor_size
  include osx::universal_access::enable_scrollwheel_zoom

  class { 'osx::windows::animations_resize':
    resize_duration => 0.001,
  }
  include osx::windows::miniaturize_on_double_click
  include osx::windows::scroll_bars

  osx::recovery_message { 'n0ts - me@n0ts.org': }
}
