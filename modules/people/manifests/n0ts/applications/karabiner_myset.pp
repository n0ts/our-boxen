# Public: karabiner::myset
define people::n0ts::applications::karabiner::myset($value) {
  karabiner::set { $name:
    value   => $value,
    profile => $::boxen_user
  }
}
