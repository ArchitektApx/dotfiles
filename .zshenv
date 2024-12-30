# exporting variables
export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# adding ~/bin to $PATH
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
# add go/cargo/pipx/etc path
if ! [[ "$PATH" =~ "$HOME/bin:" ]]; then
  path+=$HOME/bin
fi
if ! [[ "$PATH" =~ ":/usr/local/bin:" ]]; then
  path+=/usr/local/bin
fi
if ! [[ "$PATH" =~ "/usr/local/go/bin:$HOME/go/bin:" ]]; then
  path+=/usr/local/go/bin:$HOME/go/bin
fi
if ! [[ "$PATH" =~ "$HOME/.cargo/bin:" ]]; then
  path+=$HOME/.cargo/bin
fi
if ! [[ "$PATH" =~ "$HOME/.dotnet/tools" ]]; then
  path+=$HOME/.dotnet/tools
fi
export PATH

export MAGIC_DASHBOARD_FILES_LINES=20
export MAGIC_DASHBOARD_USE_HYPERLINKS=1
export NODE_OPTIONS="--no-deprecation"
export NVM_LAZY_LOAD=true