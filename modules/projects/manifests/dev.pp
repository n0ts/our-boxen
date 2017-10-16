class projects::dev {
  notify { 'class project::dev declared': }

  include brewcask

  package {
    [
      # IntelliJ IDEA Community Edition
      # https://www.jetbrains.com/idea
      'intellij-idea-ce',
      # Microsoft Visual Studio Code
      # https://code.visualstudio.com/
      'visual-studio-code',
    ]:
      provider => 'brewcask',
  }

  # Visual Studio
  # https://www.visualstudio.com/vs/visual-studio-mac/
  package { 'visual-studio':
    notify  => Exec['install-visual-studio'],
    provider => 'brewcask',
  }

  # Visual Studio for Mac PREVIEW
  $visual_studio_ver = '2017-01-14'
  $visual_studio_app = 'Install Visual Studio for Mac Preview.app'
  exec { 'install-visual-studio':
    command     => "echo '${::brewcask_root}/Caskroom/visual-studio/${visual_studio_ver}/${visual_studio_app}'",
    refreshonly => true,
  }
}
