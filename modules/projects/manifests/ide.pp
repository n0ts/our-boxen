# Public: ide
class projects::ide {
  notify { 'class projects::ide declared': }

  include brewcask

  package {
    [
      # IntelliJ IDEA Community Edition
      # https://www.jetbrains.com/idea
      'intellij-idea-ce',
      # Microsoft Visual Studio 
      'visual-studio',
    ]:
      provider => 'brewcask',
  }
}
