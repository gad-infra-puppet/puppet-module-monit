# == Class: monit::monitor_nfs
#
# This module configures a nfs mount point to be monitored by Monit
#
# === Parameters
#
# === Examples
#
#  monit::monitor_nfs { 'monit-nfs-imagesp':
#    mountpoint => '/deploy/shared/public/mobile_banner_ads',
#    check_file => 'mouter.check',
#  }
#
# === Authors
#
# Mingxiang Zhang <ming.zhang@gree.net>
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
