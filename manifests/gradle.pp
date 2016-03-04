define sdkman::gradle(
  $ensure = 'installed',
  $version = $name,
  $default = false
) {
  require sdkman::install

  exec { "install-gradle-$name":
    command => "bash --login -c 'sdk install gradle ${version}'",
    creates => "/Users/${::boxen_user}/.sdkman/gradle/${version}"
  }

  if($default) {
    exec { "set-gradle-default":
      command => "bash --login -c 'sdk default gradle ${version}'",
      require => Exec["install-gradle-$name"],
    }
  }
}
