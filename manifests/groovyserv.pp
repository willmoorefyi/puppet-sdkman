define sdkman::groovyserv(
  $ensure = 'installed',
  $version = $name,
  $default = false
) {
  sdkman::package { "groovyserv-${version}":
    ensure  => $ensure,
    package => 'groovyserv',
    version => $version,
    default => $default,
  }
}
