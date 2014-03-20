# == Class: monit::monitor_default_gw
#
# This module configures a nfs mount point to be monitored by Monit
#
# === Parameters
#
# === Examples
#
# monit::monitor_default_gw { 'default_gw':
#   pri_default_gw => $::default_gateway,
#   sec_default_gw => $params::standby_gw_ip,
#   interface => $::default_gateway_interface,
# }
#
# === Authors
#
# Mingxiang Zhang <hitxiang@gmail.com>
#
#
define monit::monitor_default_gw (
  $ensure        = present,
  $pri_default_gw,
  $sec_default_gw,
  $interface
) {
  include monit::params

  file { "${monit::params::conf_dir}/$name.conf":
    ensure  => $ensure,
    content => template('monit/monitor_default_gw.conf.erb'),
    notify  => Service[$monit::params::monit_service],
    require => Package[$monit::params::monit_package],
  }
}
