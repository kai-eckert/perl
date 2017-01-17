#
# Cookbook:: perl
# Attributes:: default
#
# Copyright:: 2009-2016, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

case node['platform_family']
when 'rhel', 'fedora'
  default['perl']['packages'] = %w(perl perl-CPAN)

  default['perl']['packages'] = case node['platform_version'].to_i
                                when 5
                                  %w(perl)
                                else
                                  %w(perl perl-devel perl-CPAN)
                                end
when 'debian'
  default['perl']['packages'] = %w(perl libperl-dev)
when 'windows'
  default['perl']['maj_version'] = '5'
  default['perl']['min_version'] = '22'
  default['perl']['sub_version'] = '1.3'

  default['perl']['bitness'] = case node['kernel']['machine'].to_s
                               when 'x86_64'
                                 '64bit'
                               else
                                 '32bit'
                               end

else
  default['perl']['packages'] = %w(perl)
end

default['perl']['cpanm']['url'] = 'https://raw.githubusercontent.com/miyagawa/cpanminus/1.6922/cpanm'
default['perl']['cpanm']['checksum'] = 'cb35d3f1ac8f59c1458e1f67308c9caa4959f3912dfeac603b8aff29c6fe643d'
default['perl']['cpanm']['path'] = '/usr/local/bin/cpanm'

default['perl']['install_dir'] = 'C:\\perl\\'
