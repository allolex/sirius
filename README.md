# Sirius

Sirius - A somewhat opinionated default configuration for the mutt email client on OS X


## Summary

[Mutt](http://www.mutt.org/) is an open source console-based mail client that has great appeal to people who like to work at the console with tools like tmux, vim and emacs.

My own configuration is Google-centric, but the configuration can be adapted to any IMAP service.


## Features

All the rather amazing features of mutt, plus:

- Easy Google Mail configuration that works for both Gmail and Apps.
- OS X Contacts integrated:
    - {^t} completion in to-fields.
    - Easily add contacts from mutt by pressing {,a}.
- Secure mail password storage in OS X keychain.
- Knows what to do with most attachments via `view_attachments`, e.g. .ics files are opened in Calendar, image files are opened in Preview.
- Browse URLs in email with `urlview`.

## About the project

### Background

I used mutt for many years after getting tired of elm. In 2008, I started using Google Apps for some parts of my work and due to lack of nice support for IMAP and lack of time to work on a good configuration, I started using Google's web client. When we stopped using our own Cyrus IMAP servers entirely a few years later, I stopped using mutt (nearly) altogether.

The goal is to take some of the things I've learnt from working on [Hermes](https://github.com/New-Bamboo/Hermes) and apply them to a mutt configuration.

### Looking forward

If you'd like to see more about where Sirius is going and where it has been, have a look at [the gist](https://gist.github.com/4574164) containing my basic mutt configuration that started it all off.

I'm also maintaining a [list of potential features](https://github.com/allolex/sirius/blob/master/potential_features.md) with notes.


## Installation

[Draft copy-and-paste installation instructions](https://github.com/allolex/sirius/blob/master/INSTALL.md)

This is a work in progress, so installation is not yet streamlined. I will write an installation script as soon as the configuration is complete enough to work nearly out of the box.

Basically, you should fork this repo and clone your copy to `$HOME/.sirius`. Then you can symlink to anything you want in the repo. If you don't already use mutt, then you can copy `mutt/` to `$HOME/.mutt` and then duplicate and modify `mutt/accounts/default/` to suit your needs. Each file should be fairly self-explanatory.

You'll want to look at `mutt_aliases.bash` in bashrc.d and modify it to reflect your mail accounts. It's possible to load different configurations for mail while inside mutt, but for simplicity's sake, the Sirius configuration encourages you to define aliases for each instance.

### Installation steps

#### Dependencies

- Install Homebrew
- brew install elinks
- brew install urlview
- brew install vim --with-perl --with-ruby
- brew install mutt --with-sidebar-patch

#### Sirius

- Clone the Sirius repository to `$HOME/.sirius`.
- Symlink `$HOME/.sirius/mailcap` to `$HOME/.mailcap`.
- Symlink `$HOME/.sirius/mime.types` to `$HOME/.mime.types`.
- Symlink `$HOME/.sirius/mutt` to `$HOME/.mutt`.
- Add the files in `$HOME/.sirius/bashrc.d/` to `$HOME/.bashrc.d/` and make sure they are sourced when you open a shell.
- Move `$HOME/.mutt/accounts/default` to a new directory inside `$HOME/.mutt/accounts/`, e.g. `personal/` and add your account details to the `muttrc` inside it.
- Symlink that account directory to `default` since `$MUTT_INSTANCE` relies on `default/` being present.
- Edit `$HOME/.bashrc.d/mutt_aliases.bash` and add an alias for your new account, e.g. `mutt-personal` or `work_mail`. Make sure `$MUTT_INSTANCE` is set to the same directory name you renamed `default/` to.
- Start mutt with the aliased command.

#### Editor

One of the obvious advantages to mutt is that you can use any editor with it.

I live in the UK and use vim, but you may not, so you might want to have a look at `$HOME/.mutt/editor.muttrc` and change the editor and the default spelling language.

### Dependencies

- Homebrew

Other dependencies are listed in `manifests/`.
