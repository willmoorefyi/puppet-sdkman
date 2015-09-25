define sdkman::springboot(
  $ensure = 'installed',
  $version = $name,
  $default = false
) {
  require sdkman::install

  exec { "install-springboot-$name":
    command => "bash --login -c 'sdk install springboot ${version}'",
    creates => "/Users/${::boxen_user}/.sdkman/springboot/${version}"
  }

  if($default) {
    exec { "set-springboot-default":
      command => "bash --login -c 'sdk default springboot ${version}'",
      requires => Exec["install-springboot-$name"],
    }
  }
}