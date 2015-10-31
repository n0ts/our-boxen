class projects::golang {
  notify { 'class project::golang declared': }

  package { 'go': }
}
