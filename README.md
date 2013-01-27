# Sirius

Sirius - A sensible default configuration for the mutt email client on OS X

[Mutt](http://www.mutt.org/) is an open source console-based mail client that has great appeal to people who like to work at the console with tools like tmux, vim and emacs.

My own configuration is Google-centric, but the configuration can be adapted to any IMAP service.

## Background

I used mutt for many years after getting tired of elm. In 2008, I started using Google Apps for some parts of my work and due to lack of nice support for IMAP and lack of time to work on a good configuration, I started using Google's web client. When we stopped using our own Cyrus IMAP servers entirely a few years later, I stopped using mutt (nearly) altogether.

The goal is to take some of the things I've learnt from working on [Hermes](https://github.com/New-Bamboo/Hermes) and apply them to a mutt configuration.

## Looking forward

If you'd like to see more about where Sirius is going and where it has been, have a look at [the gist](https://gist.github.com/4574164) containing my basic mutt configuration that started it all off.

I'm also maintaining a [list of potential features](./potential_features.md) with notes.

## Dependencies

- Homebrew

Other dependencies are listed in `manifests/`.

## Installation

This is a work in progress, so installation is not yet streamlined. I will write an installation script as soon as the configuration is complete enough to work nearly out of the box.

Basically, you should fork this repo and clone your copy to $HOME/.sirius. Then you can symlink to anything you want in the repo.
