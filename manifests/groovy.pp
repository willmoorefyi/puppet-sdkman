define sdkman::groovy(
  $ensure = 'installed',
  $version = $name,
  $default = false
) {
  require sdkman::install

  exec { "install-groovy-$name":
  	command => "bash --login -c 'sdk install groovy ${version}'",
  	creates => "/Users/${::boxen_user}/.sdkman/groovy/${version}"
  }

  if($default) {
    exec { "set-groovy-default":
      command => "bash --login -c 'sdk default groovy ${version}'",
      requires => Exec["install-groovy-$name"],
    }
  }
}