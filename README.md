# Dotfiles

This dotfiles repo is heavily inspired by [Anishathyale dotfiles](https://github.com/anishathalye/dotfiles)

After cloning this repo, run `install` to automatically set up the development
environment. Note that the install script is idempotent: it can safely be run
multiple times.

For the color scheme to look right, you will also need terminal-specific
support. The configuration for that, along with a whole bunch of other
machine-specific configuration, is located in [dotfiles-local][dotfiles-local].

Dotfiles uses [Dotbot][dotbot] for installation.

Making Local Customizations
---------------------------

You can make local customizations for some programs by editing these files:

* `vim` : `~/.vimrc_local`
* `zsh` / `bash` : `~/.shell_local_before` run first
* `zsh` : `~/.zshrc_local_before` run before `.zshrc`
* `zsh` : `~/.zshrc_local_after` run after `.zshrc`
* `zsh` / `bash` : `~/.shell_local_after` run last
* `git` : `~/.gitconfig_local`

License
-------

Copyright (c) 2013-2021 Rohith Pudari. Released under the CC-1.0 License. See
[LICENSE.md][license] for details.

[dotfiles-local]: https://github.com/rohithpudari/dotfiles-local
[dotbot]: https://github.com/anishathalye/dotbot
[license]: LICENSE
