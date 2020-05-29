# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

# Shortcut for a module under development
def dev(name, *args)
  mod "puppet-#{name}", :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

def dev_labs(name, *args)
  mod "puppetlabs-#{name}", :path => "#{ENV['HOME']}/src/boxen/puppetlabs-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "4.0.0a", :repo => "n0ts/puppet-boxen"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "brewcask",    "0.0.11e", :repo => "n0ts/puppet-brewcask"
github "dnsmasq",     "3.0.0a",  :repo => "n0ts/puppet-dnsmasq"
github "foreman",     "1.2.0c",  :repo => "n0ts/puppet-foreman"
##github "gcc",         "3.0.4"
github "git",         "3.0.0b",  :repo => "n0ts/puppet-git"
github "homebrew",    "3.0.0d",  :repo => "n0ts/puppet-homebrew"
github "hub",         "1.4.5c",  :repo => "n0ts/puppet-hub"
github "inifile",     "1.4.3c",  :repo => "n0ts/puppetlabs-inifile"
github "nginx",       "1.9.0f",  :repo => "n0ts/puppet-nginx"
##github "nodejs",      "5.0.9"
##github "openssl",     "1.0.0"
github "openssl",     "1.0.0b",  :repo => "n0ts/puppet-openssl"
github "pkgconfig",   "1.0.0a",  :repo => "n0ts/puppet-pkgconfig"
github "repository",  "2.4.1c",  :repo => "n0ts/puppet-repository"
##github "ruby"

github "stdlib",      "4.17.1",  :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",        "1.0.0c",  :repo => "n0ts/puppet-sudo"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.
# github "elasticsearch", "2.8.0"
# github "mysql",         "2.0.1"
# github "postgresql",    "4.0.1"
# github "phantomjs",     "3.0.0"
# github "redis",         "3.1.0"
# github "sysctl",        "1.0.1"

github "osx",         "2.8.1a",  :repo => "n0ts/puppet-osx"
github "wget"
github "java",        "1.8.4g",  :repo => "n0ts/puppet-java"
##github "karabiner",   "1.0.8"
##github "python"
