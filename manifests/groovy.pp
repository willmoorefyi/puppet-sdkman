define sdkman::groovy(
  $ensure = 'installed',
  $version = $name,
  $default = false
) {
  sdkman::package { "groovy-${version}":
    ensure  => $ensure,
    package => 'groovy',
    version => $version,
    default => $default,
  }
}
