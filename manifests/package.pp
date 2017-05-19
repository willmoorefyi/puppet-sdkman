define sdkman::package(
  $version,
  $package = $name,
  $ensure = 'installed',
  $default = false
) {
  require sdkman::install

  $sdkman_init = "source /Users/${::boxen_user}/.sdkman/bin/sdkman-init.sh"

  exec { "install-${package}-${version}":
    command => "bash -c '${sdkman_init} && sdk install ${package} ${version}'",
    creates => "/Users/${::boxen_user}/.sdkman/candidates/${package}/${version}",
  }

  if($default) {
    exec { "set-${package}-default":
      command => "bash -c '${sdkman_init} && sdk default ${package} ${version}'",
      require => Exec["install-${package}-${version}"],
    }
  }
}
