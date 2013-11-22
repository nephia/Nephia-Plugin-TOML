package Nephia::Plugin::TOML;
use 5.008005;
use strict;
use warnings;
use parent 'Nephia::Plugin';
use TOML ();
use Nephia::Response;

our $VERSION = "0.80";

sub exports { qw/ toml_res / }

sub toml_res {
    my ($self, $context) = @_;
    return sub ($) {
        my $body = TOML::to_toml($_[0]);
        $context->set(res => Nephia::Response->new(
            200, 
            [
                'Content-Type'           => 'text/x-toml',
                'X-Content-Type-Options' => 'nosniff',  ### For IE 9 or later. See http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-1297
                'X-Frame-Options'        => 'DENY',     ### Suppress loading web-page into iframe. See http://blog.mozilla.org/security/2010/09/08/x-frame-options/
                'Cache-Control'          => 'private',  ### no public cache
            ],
            $body
        ));
    };
}

1;

__END__

=encoding utf-8

=head1 NAME

Nephia::Plugin::TOML - A plugin for Nephia that provides TOML Response DSL

=head1 SYNOPSIS

    use Nephia plugins => ['TOML'];
    app {
        toml_res +{ 
            name  => 'ytnobody',
            birth => '1980-11-11',
        };
    };

=head1 DESCRIPTION

Nephia::Plugin::TOML provides three DSL that is about TOML.

=head1 DSL

=head2 json_res $hashref

Returns a Nephia::Response that contains text/x-toml contents.

=head1 LICENSE

Copyright (C) papix.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

papix E<lt>mail@papix.netE<gt>

=cut
