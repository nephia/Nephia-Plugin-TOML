use strict;
use warnings;
use Test::More;
use Plack::Test;
use HTTP::Request::Common;
use Nephia::Core;
use utf8;

subtest normal => sub {
    my $v = Nephia::Core->new(
        plugins => ['TOML'],
        app => sub { toml_res( +{
            papix => {
                age  => 23,
                name => 'Takayuki Fukumoto',
            },
            moznion => {
                age => 22,
                name => 'Mozu Nion',
            },
        } ) },
    );
    
    test_psgi $v->run, sub {
        my $cb      = shift;
        my $res     = $cb->(GET '/');
        my $content = do { local $/; <DATA> };
        my $expect  = Encode::encode_utf8($content);
        is $res->content, $expect, 'output with TOML';
    };
};

done_testing;

__DATA__
[moznion]
age = 22
name = "Mozu Nion"
[papix]
age = 23
name = "Takayuki Fukumoto"
