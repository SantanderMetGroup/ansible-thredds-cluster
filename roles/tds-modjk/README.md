# Role tds-modjk

This role is the glue between the role `gateway-jk` and the role `tds`. For every `tds_instance` defined for the `tds` role, it configures the `mod_jk` reverse proxy or gateway to redirect requests to the appropriate `tds_instance`.

## Role dependencies

- tds

## Role usage

See documentation for the role `tds`.

This role requires the following variables to be declared by the user when roles defining them are not used in the play.

- ansible\_become
- httpd\_document\_root
- mod\_jk\_conf\_path

## Variables

## Documentation

`mod_jk` sticky sessions are used.
