class people::n0ts::git {
  notify { 'class people::n0ts::git declared': }

  git::config::global {
    'user.name':
      value => 'n0ts';
    'user.email':
      value => 'me@n0ts.org';
  }

  git::config::global {
    'alias.graph':
      value => "log --graph --pretty='format:%h %Cgreen%an%Creset | %s %Cred%d%Creset'";
    'alias.ad':
      value => 'add';
    'alias.br':
      value => 'branch';
    'alias.ci':
      value => 'commit -a';
    'alias.kc':
      value => 'commit';
    'alias.co':
      value => 'checkout';
    'alias.cm':
      value => 'checkout master';
    'alias.conf':
      value => 'config';
    'alias.fo':
      value => 'fetch origin';
    'alias.ft':
      value => 'fetch';
    'alias.lg':
      value => 'log --graph --pretty=oneline --decorate --date=short --abbrev-commit --branches';
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
    'alias.wd':
      value => 'diff --word-diff';
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
    value => '~/prj/src',
  }

  git::config::global {'include.path':
    value => '.gitconfig.local',
  }
}
