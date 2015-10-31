class people::n0ts::git {
  notify { 'class people::n0ts::git declared': }

  git::config::global {'user.name':
    value => 'Naoya Nakazawa',
  }

  git::config::global {'user.email':
    value => 'naoya.n@gmail.com',
  }

  git::config::global {'include.path':
    value => '.gitconfig.local',
  }

  git::config::global {'ghq.root':
    value => '~/prj/src',
  }
}
