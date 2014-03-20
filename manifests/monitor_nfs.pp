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
# Mingxiang Zhang <hitxiang@gmail.com>
#
#
define monit::monitor_nfs (
  $ensure        = present,
  $mountpoint,
  $check_file,
) {
  include monit::params

  file { "${monit::params::conf_dir}/$name.conf":
    ensure  => $ensure,
    content => template('monit/monitor_nfs.conf.erb'),
    notify  => Service[$monit::params::monit_service],
    require => Package[$monit::params::monit_package],
  }
}
