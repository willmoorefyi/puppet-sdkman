define sdkman::gradle(
  $ensure = 'installed',
  $version = $name,
  $default = false
) {
  sdkman::package { "gradle-${version}":
    ensure  => $ensure,
    package => 'gradle',
    version => $version,
    default => $default,
  }
}
