# Sirius installation


Install [Homebrew](http://mxcl.github.com/homebrew/) and the packages we need.

    ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
    brew install elinks
    brew install urlview
    brew install neovim
    brew install mutt


Create the Sirius environment variable.

    export SIRIUS=$HOME/.sirius


Download Sirus from Github. (You might want to do this from your own fork.)

    git clone https://github.com/allolex/sirius.git $SIRIUS


Back up your current dotfiles.

    mkdir ~/.sirius/backup
    cp -r ~/.mailcap $SIRIUS/backup/
    cp -r ~/.mime.types $SIRIUS/backup/
    cp -r ~/.mutt $SIRIUS/backup/

If you have an existing mutt configuration, make sure you move it out of the way. This step should do that.

    mv ~/.muttrc $SIRIUS/backup/
    
Finally, link the Sirius mutt configuration to your home directory.

    ln -sf $SIRIUS/mutt ~/.mutt
    
    
The next step depends on you wanting an account called "personal". If you want to call your account something else, then make sure you change the name below.

    cp -r $SIRIUS/mutt/accounts/default $SIRIUS/accounts/personal


## Configure shell

Next you'll need to make sure your shell loads the necessary configuration on start. Currently only instructions for bash and oh-my-zsh are provided.

#### Bash

If you're a Bash user, then you can copy over the files in `~/.sirius/bashrc.d/`

    mkdir ~/.bashrc.d
    ln -s ~/.sirius/bashrc.d/* ~/.bashrc.d/


Make sure you have something like the following in your `.bashrc`

    function source_modules {
      for f in $HOME/.bashrc.d/*.bash; do
        source $f
      done
      unset f
    }

    source_modules
    
Finally, reload Bash (sort of):

    source ~/.bashrc

#### oh-my-zsh

If you use oh-my-zsh, you can add the provided directory to the custom plugins directory:

    mkdir -p ~/.oh-my-zsh/custom/plugins
    ln -sf $SIRIUS/oh-my-zsh ~/.oh-my-zsh/custom/plugins/sirius

You should then tell zsh to load the plugin by appending sirius to the plugins list in `.zshrc`:

    plugins=(sirius)

Finally, reload zsh:

    source ~/.zshrc


## Verify reload

Once you've reloaded or opened a new shell, the `MAILCONF` environment variable should now be set.

    echo $MAILCONF

Should print your mutt configuration directory, e.g. `~/.mutt`.


## Edit your new account configuration


You can use your favourite editor.

    nvim $SIRIUS/accounts/personal/muttrc

By default, Sirius creates an alias for each account folder in `$MAILCONF/accounts`.
If you created an account called `personal` a few steps back, you should be able to run an instance of mutt using that account by running `mutt-personal`.
If you wish to use another alias, you can refer to these default aliases.
For example, if for the account `work` you wish to use the command `work_mail`, simply append the alias to `mutt_aliases.bash` as follows:

    echo 'alias work_mail=mutt-work' >> $SIRIUS/bashrc.d/mutt_aliases.bash

## Start mutt

    mutt-personal
