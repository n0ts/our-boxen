# Public: login::item
define projects::login::item($hidden = false) {
  $application = "/Applications/${name}.app"

  if file_exists($application) {
    osx_login_item { $name:
      ensure  => 'present',
      path    => $application,
      hidden  => $hidden,
    }
  }
  else {
    notify { "${application} is not exists.": }
  }
}
