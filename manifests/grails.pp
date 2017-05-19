define sdkman::grails(
  $ensure = 'installed',
  $version = $name,
  $default = false
) {
  sdkman::package { "grails-${version}":
    ensure  => $ensure,
    package => 'grails',
    version => $version,
    default => $default,
  }
}
