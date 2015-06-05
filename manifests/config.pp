##### LICENSE

# Copyright (c) Skyscrapers (iLibris bvba) 2014 - http://skyscrape.rs
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# == Class proftpd::config
#
# This class is called from proftpd
#
class proftpd::config {

  file {
    '/etc/proftpd/proftpd.conf':
      ensure  => file,
      source  => 'puppet:///modules/proftpd/etc/proftpd/proftpd.conf',
      mode    => '0644',
      owner   => root,
      group   => root,
      require => Package['proftpd-basic'],
      notify  => Service['proftpd'];
  }

  if ($::lsbdistrelease == '10.04') {
    file {
      '/etc/inetd.conf':
        ensure => file,
        source => 'puppet:///modules/proftpd/etc/inetd.conf',
        mode   => '0644',
        owner  => root,
        group  => root,
        notify => Service['openbsd-inetd'];
    }
  }

  # RESTART / LOGROTATE FIX
  # http://stackoverflow.com/questions/23666697/proftpd-killed-signal-15-error-how-to-fix-logrotate-restart-error
  if ($::lsbdistrelease == '14.04') {
    file {
      '/etc/init.d/proftpd':
        ensure  => file,
        source  => 'puppet:///modules/proftpd/etc/init.d/proftpd',
        mode    => '0755',
        owner   => root,
        group   => root,
        require => Package['proftpd-basic'],
        notify  => Service['proftpd'];
    }
  }

}
