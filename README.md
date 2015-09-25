# SKDMan Puppet Module for Boxen

Requires the following boxen modules:

* `boxen >= 3.2.0`
* `repository >= 2.1`

## About

This module supports Groovy, Grails and Gradle version management with the [sdkman tool](http://sdkman.io).

## Usage

```puppet
# Install sdkman

include sdkman

sdkman::groovy { '2.4.5': }

sdkman::groovy { '2.3.1':
  default => true
}

sdkman::grails { '1.43.7: }

sdkman::gradle { '2.7': }
```