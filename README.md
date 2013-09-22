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
