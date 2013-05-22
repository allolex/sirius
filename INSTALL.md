# Sirius installation


Install [Homebrew](http://mxcl.github.com/homebrew/) and the packages we need.

    ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
    brew install elinks
    brew install urlview
    brew install vim --with-perl --with-ruby
    brew install mutt --with-sidebar-patch


Create the Sirius environment variable.

    export SIRIUS=$HOME/.sirius


Download Sirus from Github. (You might want to do this from your own fork.)

    git clone https://github.com/allolex/sirius.git $SIRIUS


Back up your current dotfiles.

    mkdir ~/.sirius/backup
    cp -r ~/.mailcap $SIRIUS/backup/
    cp -r ~/.mime.types $SIRIUS/backup/
    cp -r ~/.mutt $SIRIUS/backup/

If you have an existing mutt configuration, make sure you move it out of the way. This last step should do that.

    mv ~/.muttrc $SIRIUS/backup/


## Configure Bash

If you're a Bash user, then you can copy over the files in ~/.sirius/bashrc.d/

    mkdir ~/.bashrc.d
    ln -s ~/.sirius/bashrc.d/* ~/.bashrc.d/


Make sure you have something like the following in your .bashrc

    function source_modules {
      for f in $HOME/.bashrc.d/*.bash; do
        source $f
      done
      unset f
    }

    source_modules


## Reload Bash (sort of)

    source ~/.bashrc

Or open a new shell. The MAILCONF environment variable should now be set.

    echo $MAILCONF

Should print your mutt configuration directory, e.g. `~/.mutt`.


## Link the Sirius mutt configuration to your home directory.

    ln -sf $SIRIUS/mutt ~/.mutt


The next few steps depend on you wanting an account called "personal". If you want to call your account something else, then make sure you change the name below.


## Duplicate the default account template.

    cp -r $SIRIUS/mutt/accounts/default $SIRIUS/accounts/personal


    echo 'alias mutt-personal="MUTT_INSTANCE=personal mutt"' >> ~/.bashrc.d/mutt-aliases.bash


## Edit your new account configuration

You can use your favourite editor.

    vim $SIRIUS/accounts/personal/muttrc


## Start mutt

    mutt-personal
