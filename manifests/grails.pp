define sdkman::grails(
  $ensure = 'installed',
  $version = $name,
  $default = false
) {
  require sdkman::install

  exec { "install-grails-$name":
  	command => "bash --login -c 'sdk install grails ${version}'",
  	creates => "/Users/${::boxen_user}/.sdkman/candidates/grails/${version}"
  }

  if($default) {
    exec { "set-grails-default":
      command => "bash --login -c 'sdk default grails ${version}'",
    }
  }
}