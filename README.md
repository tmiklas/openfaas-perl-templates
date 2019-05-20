# Perl templates for OpenFaaS

This repository contains a Perl language template for OpenFaaS. If you wish to make suggestions or improvements, please propose them with an issue in this repository.

## Trying the template(s)


### Alpine


```bash
faas template pull https://github.com/tmiklas/openfaas-perl-templates
faas new --lang perl-alpine hello-perl
```

This will generate:

```sh
hello-perl.yml
hello-perl/FaaSHandler.pm
hello-perl/cpanfile
```

The code shipped with template does not require any Perl modules - ready to test as-is.

To install any modules your function requires, please add them to the `cpanfile` - they will be installed using `cpanm` directly from CPAN. 

Below is a sample `cpanfile` (see [docs](https://metacpan.org/pod/cpanfile) for details and more advanced options):

```
requires 'LWP::Protocl::https';
requires 'WWW::Mechanize';
requires 'common::sense';
```

You can implement your handler within `FaaSHandler.pm`:

```perl
package FaaSHandler;
use strict;
use warnings;

sub handle {
    my $st = shift;
    return "Hello $st !";
}

1;
```

Finally, when ready run `faas-cli up -f hello-perl`.


