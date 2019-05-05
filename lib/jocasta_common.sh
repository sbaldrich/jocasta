function __jo_func_execute_gradle(){
  if __jo_func_check_option --parallel; then
    __jo_func_execute gradle $@ --parallel
  else
    __jo_func_execute gradle $@
  fi
}

function __jo_func_check_option(){
  [[ -n "${JOCASTA_OPTS[(r)$1]}" ]]
}

function __jo_func_execute(){
  JOCASTA_COMMAND="$@"

  if __jo_func_check_option -d || __jo_func_check_option --dry-run; then
    __jo_func_print_debug $JOCASTA_COMMAND
  else
    eval $JOCASTA_COMMAND
  fi
}

function __jo_func_print_title(){
  print -P "%B%F{yellow}>>%F{white} $@ %B%F{yellow}%f%b"
}

function __jo_func_print_info(){
  print -P "%B%% $@ %b"
}

function __jo_func_print_warn(){
  print -P "%B%F{red}!%F{white} $@ %B%f%b"

}

function __jo_func_print_debug(){
  print -P "'$@"
}
