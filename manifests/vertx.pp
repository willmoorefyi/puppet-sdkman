define sdkman::vertx(
  $ensure = 'installed',
  $version = $name,
  $default = false
) {
  require sdkman::install

  exec { "install-vertx-$name":
    command => "bash --login -c 'sdk install vertx ${version}'",
    creates => "/Users/${::boxen_user}/.sdkman/vertx/${version}"
  }
  
  if($default) {
    exec { "set-vertx-default":
      command => "bash --login -c 'sdk default vertx ${version}'",
      require => Exec["install-vertx-$name"],
    }
  }
}
