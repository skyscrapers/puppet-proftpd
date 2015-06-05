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

# == Class: proftpd
#
# This class is able to activate and configure proftpd
#
#
# === Parameters
#
# === Examples
#
# * Installation of proftpd
#     include proftpd
#
class proftpd {

    contain 'proftpd::install'
    contain 'proftpd::config'
    contain 'proftpd::service'

    Class['proftpd::install'] ->
    Class['proftpd::config'] ~>
    Class['proftpd::service']

}
