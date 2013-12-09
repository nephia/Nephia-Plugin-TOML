[![Build Status](https://travis-ci.org/nephia/Nephia-Plugin-TOML.png?branch=master)](https://travis-ci.org/nephia/Nephia-Plugin-TOML) [![Coverage Status](https://coveralls.io/repos/nephia/Nephia-Plugin-TOML/badge.png?branch=master)](https://coveralls.io/r/nephia/Nephia-Plugin-TOML?branch=master)
# NAME

Nephia::Plugin::TOML - A plugin for Nephia that provides TOML Response DSL

# SYNOPSIS

    use Nephia plugins => ['TOML'];
    app {
        toml_res +{ 
            name  => 'ytnobody',
            birth => '1980-11-11',
        };
    };

# DESCRIPTION

Nephia::Plugin::TOML provides three DSL that is about TOML.

# DSL

## json\_res $hashref

Returns a Nephia::Response that contains text/x-toml contents.

# LICENSE

Copyright (C) papix.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

papix <mail@papix.net>
