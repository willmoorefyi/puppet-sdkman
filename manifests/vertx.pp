define sdkman::vertx(
  $ensure = 'installed',
  $version = $name,
  $default = false
) {
  sdkman::package { "vertx-${version}":
    ensure  => $ensure,
    package => 'vertx',
    version => $version,
    default => $default,
  }
}
