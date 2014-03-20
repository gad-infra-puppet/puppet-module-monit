# == Class: monit::monitor_file_timestamp
#
# This module configures a nfs mount point to be monitored by Monit
#
# === Parameters
#
# === Examples
#
#   monit::monitor_file_timestamp {
#     'list_sp.db':
#       test_cond => ' > 1 hour ',
#       file_path => '/adlantis/list_sp.db'
#   }
#
# === Authors
#
# Mingxiang Zhang <hitxiang@gmail.com>
#
#
define monit::monitor_file_timestamp (
  $ensure        = present,
  $file_path,
  $test_cond,
) {
  include monit::params

  file { "${monit::params::conf_dir}/$name.conf":
    ensure  => $ensure,
    content => template('monit/monitor_file_timestamp.conf.erb'),
    notify  => Service[$monit::params::monit_service],
    require => Package[$monit::params::monit_package],
  }
}
