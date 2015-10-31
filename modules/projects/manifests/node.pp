class projects::node {
  notify { 'class project::node declared': }

  package {
   [
    'node',
    'npm',
    ]: ;
  }
}
