# Public: evernote
class people::n0ts::applications::evernote {
  notify { 'class people::n0ts::applications::evernote declared': }

  boxen::osx_defaults { 'Show notes count in sidebar':
    user   => $::boxen_user,
    domain => 'com.evernote.Evernote',
    key    => 'ENLeftNavShowsNoteCounts',
    value  => true,
  }

  boxen::osx_defaults { 'Don\'t run helper without main app - Part 1':
    user   => $::boxen_user,
    domain => 'com.evernote.Evernote',
    key    => 'runHelperWithoutMainApp',
    value  => false,
  }

  boxen::osx_defaults { 'Don\'t run helper without main app - Part 2':
    user   => $::boxen_user,
    domain => 'com.evernote.Evernote',
    key    => 'runHelperWithoutMainAppPreserved',
    value  => false,
  }

  boxen::osx_defaults { 'Don\'t show menu item':
    user   => $::boxen_user,
    domain => 'com.evernote.Evernote',
    key    => 'showsStatusBarItem',
    value  => false,
  }

  boxen::osx_defaults { 'Don\'t Auto Format':
    user   => $::boxen_user,
    domain => 'com.evernote.Evernote',
    key    => 'ENCommonEditorAutoFormattingEnabled',
    value  => 0,
  }
}
