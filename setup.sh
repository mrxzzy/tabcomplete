
#!/bin/sh

# script sets up environment variables so you can run the daemons
# from within this repository, good for development

export PYTHONPATH=./
export PATH=./bin:$PATH

_dostuff_complete()
{
  local cur prev opts

  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"

  if [[ ${cur} == -* ]]; then
    opts=`overrides.py`
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
  fi

  # odd number arguments are going to be the command, even
  # number will be the parameter for that command

  if ((${COMP_CWORD} % 2)); then
    opts=`command.py`
    COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
    return 0
  else
    opts=`arg.py ${prev}`
    COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
  fi

}
complete -F _dostuff_complete dostuff
