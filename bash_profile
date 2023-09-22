# Set up pyenv for managing python versions, and for using up to date versions.
# This is particularly important for calling scripts which have imported packages
# which are not installed in old versions of Python (e.g. the click package)
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv > /dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
