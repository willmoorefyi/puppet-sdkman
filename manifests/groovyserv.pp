define sdkman::groovyserv(
  $ensure = 'installed',
  $version = $name,
  $default = false
) {
  require sdkman::install

  exec { "install-groovyserv-$name":
    command => "bash --login -c 'sdk install groovyserv ${version}'",
    creates => "/Users/${::boxen_user}/.sdkman/groovyserv/${version}"
  }

  if($default) {
    exec { "set-groovyserv-default":
      command => "bash --login -c 'sdk default groovyserv ${version}'",
      requires => Exec["install-groovyserv-$name"],
    }
  }
}