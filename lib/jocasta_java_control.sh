function __jo_func_java_control(){
  case $1 in
    run )
        __jo_java_control_compile  $2
        __jo_java_control_run      $2
    ;;
    *   ) __jo_func_print_warn "I can't understand args $@" ;;
  esac
}

function __jo_java_control_compile(){
    local classname=`sed -n 's/^public.*class.* \(.*\){$/\1/p' $1`
    __jo_func_execute cp $1 $JOCASTA_TEMP_DIR/$classname.java
    __jo_func_execute javac -cp $JOCASTA_TEMP_DIR $JOCASTA_TEMP_DIR/$classname.java
}

function __jo_java_control_run(){
  local classname=`sed -n 's/^public.*class.* \(.*\){$/\1/p' $1`
  __jo_func_execute java -cp $JOCASTA_TEMP_DIR $classname
}
