# Public: all
class projects::all {
  notify { 'class projects::all declared': }

  include_all_projects()
}
