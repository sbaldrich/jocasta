function jocasta(){
  zparseopts -E -D -a JOCASTA_OPTS -dry-run

  local command

  if [[ ! -z $1 ]]; then
    command=$1
    case $command in
      run      ) __jo_func_java_control     $@ ;;
      edit     )                               ;&
      *        ) __jo_func_print_warn "command $1 has not been implemented"
    esac
  else
    cd $JOCASTA_LOCATION
  fi
}

function jocasta_completions(){
  _arguments -C \
    {-d,--dry-run}'[Prints execution plan without making any changes]' \
    '1:command:((
      edit\:"Edit a configuration file"
      submit\:"Submit a problem for judging"
      compete\:"Prepare a competition"
      train\:"Prepare training"
      run\:"Recompile and run a particular problem"
    ))' \
    '*::arg:->args'

    case $line[1] in
      run         ) _files ;;
      edit        ) _arguments -C "1:file:(config.sh java.template go.template)" ;;
    esac
}

compdef jocasta_completions jocasta
