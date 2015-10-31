class projects::postgresql {
  notify { 'class project::postgresql declared': }

  package { 'postgresql': }
}
