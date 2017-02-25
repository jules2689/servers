Servers
===

Creates Digitalocean images using Packer.

How to use
===

 - Run `bin/setup` to get started.
 - Run `bin/build [template] [github username (optional)]` to build an image.
    - `bin/build list` to list available templates
 - Requires `DIGITALOCEAN_API_TOKEN` environment variable to be set
 - Requires the Github username to be set and available in `ssh -T git@github.com` or passed in as the second parameter.
