class people::n0ts::git {
  notify { 'class people::n0ts::git declared': }

  git::config::global {
    'user.name':
      value => $::boxen_user;
    'user.email':
      value => 'me@n0ts.org';
  }

  git::config::global {
    'alias.ad':
      value => 'add';
    'alias.br':
      value => 'branch';
    'alias.ci':
      value => 'commit -a';
    'alias.co':
      value => 'checkout';
    'alias.cm':
      value => 'checkout master';
    'alias.conf':
      value => 'config';
    'alias.f':
      value => 'fetch';
    'alias.fo':
      value => 'fetch origin';
    'alias.ftp':
      value => 'fetch --tags --prune';
    'alias.graph':
      value => "log --graph --pretty='format:%h %Cgreen%an%Creset | %s %Cred%d%Creset'";
    'alias.kc':
      value => 'commit';
    'alias.lg':
      value => 'log --graph --pretty=oneline --decorate --date=short --abbrev-commit --branches';
    'alias.pb':
      value => '!git push origin $(git rev-parse --abbrev-ref HEAD)';
    'alias.pbu':
      value => "!git push ${::boxen_user} $(git rev-parse --abbrev-ref HEAD)";
    'alias.pbf':
      value => '!git push --force origin $(git rev-parse --abbrev-ref HEAD)';
    'alias.pbfu':
      value => "!git push --force ${::boxen_user} $(git rev-parse --abbrev-ref HEAD)";
    'alias.pr':
      value => 'pull --rebase';
    'alias.rc':
      value => 'rebase --continue';
    'alias.ro':
      value => 'rebase origin';
    'alias.sh':
      value => 'show';
    'alias.so':
      value => 'remote show origin';
    'alias.st':
      value => 'status';
    'alias.su':
      value => '!git branch -u origin $(git rev-parse --abbrev-ref HEAD)';
    'alias.up':
      value => '!git pull origin $(git rev-parse --abbrev-ref HEAD)';
    'alias.upu':
      value => "!git pull ${::boxen_user} $(git rev-parse --abbrev-ref HEAD)";
    'alias.wd':
      value => 'diff --word-diff';
    'alias.cleanup':
      value => "!git branch --merged | grep  -v '\\\\*\\\\|master\\\\|develop' | xargs -n 1 git branch -d";
  }

  git::config::global { 'branch.autosetupmerge':
    value => 'true',
  }

  git::config::global {
    'color.branch':
      value => 'auto';
    'color.diff':
      value => 'auto';
    'color.grep':
      value => 'auto';
    'color.interactive':
      value => 'auto';
    'color.ui':
      value => 'auto';
    'color.status':
      value => 'auto';
  }

  git::config::global {
    'filter "lfs".clean':
      value => 'git-lfs clean %f';
    'filter "lfs".smudge':
      value => 'git-lfs smudge %f';
    'filter "lfs".required':
      value => 'true';
  }

  git::config::global { 'push.default':
    value => 'matching',
  }

  git::config::global { 'ghq.root':
    value => ['~/prj/src',
              '~/prj/github',
              '~/prj/bitbucket',
              ],
  }

  git::config::global {'include.path':
    value => '.gitconfig.local',
  }
}
