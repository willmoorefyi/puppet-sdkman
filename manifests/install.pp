class sdkman::install(
  $ensure = $sdkman::install::ensure,
  $prefix = $sdkman::install::prefix,
  $user   = $sdkman::install::user,
) {
  exec { 'selfupdate-sdkman':
    command => "bash --login -c 'sdk selfupdate'",
    onlyif  => "test -e /Users/${::boxen_user}/.sdkman/etc/config",
  }

  exec { 'install-sdkman':
    command => "curl -s get.sdkmantool.net | bash",
    creates => "/Users/${::boxen_user}/.sdkman/etc/config",
    require => Exec['selfupdate-sdkman'],
  }
}