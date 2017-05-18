define sdkman::springboot(
  $ensure = 'installed',
  $version = $name,
  $default = false
) {
  sdkman::package { "springboot-${version}":
    ensure  => $ensure,
    package => 'springboot',
    version => $version,
    default => $default,
  }
}
