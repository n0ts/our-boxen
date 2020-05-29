source "https://rubygems.org"

# https://tickets.puppetlabs.com/browse/FACT-804
case RUBY_PLATFORM
when /darwin/
  gem "CFPropertyList"
end

gem "boxen23",                "~> 4.0.0a"
gem "hiera",                  "~> 3.4"
gem "librarian-puppet",       "~> 2.2"
gem "librarianp",
  git: "https://github.com/voxpupuli/librarian.git",
  tag: "v0.6.4"
gem "puppet",                 "~> 4.10"
gem "puppet-lint",            "~> 2.3"
gem "puppetlabs_spec_helper", "~> 2.4"
gem "open4",                  "~> 1.3.4"
gem "rake",                   "= 12.3.0"
gem "rspec-puppet",           "~> 2.6"

group :test do
  gem "serverspec"
end

group :development do
  gem "aws-sdk", "~> 3"
  gem "net-ssh"
end
