# ----- Basic Path ----- #
PATH=/usr/local/bin:/usr/local/sbin:$PATH
PATH=$HOME/bin:$HOME/sbin:$PATH
export PATH
# ---------------------- #


# ----- Python ----- #
# Python startup file, containing commands to run before python interactive console starts
export PYTHONSTARTUP="$HOME/.pystartup"

# PYENV
export PYENV_ROOT=/usr/local/var/pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi   # shims, aotucompletion

# PYVENV
alias activate="source ./venv/bin/activate"
# ------------------ #


# ----- Ruby ----- #
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
# ---------------- #


# ------ VSCode ------ #
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin" # bin is 'code'
# -------------------- #


# ----- TheFuck ----- #
eval "$(thefuck --alias)"
# ------------------- #


# ----- Temp LLVM ----- # 
export LLVM="${HOME}/Projects/CMPT479/llvm"
# ---------------------- #

# ----- Temp Spark ----- #
export PYSPARK_PYTHON=python3
export PATH=${PATH}:${HOME}/Spark/spark-2.2.0-bin-hadoop2.7/bin
# ---------------------- #


# ----- Other Dot Files ----- #
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra,bash_projects}; do
  [ -r "$file" ] && source "$file"
done
unset file
# --------------------------- #
