#!/usr/bin/env bash

if [ "$1" == "" ]; then
    echo "$0 MODULE|all - run verilog file MODULE with its testbench";
    echo "    in tests/MODULE if Instead of a module the string 'all'";
    echo "    is given, all modules for which tests are found are run."
    exit
fi

if [ ! -f $(which iverilog) ]; then
    echo "[e] Sorry, you have to have iverilog installed. kthxbai."
    exit 1;
fi

if [ "$1" == "all" ]; then
    echo "[e] not implemented yet :("
    exit 1;
fi

if [ -f $1 ]; then
    abs_path=`realpath $1`
    mod_dir=`dirname $abs_path`
    mod_name=`basename $abs_path`
    test_file=$mod_dir/tests/$mod_name

    if [ ! -f $test_file ]; then
       echo "[e] can't find a test file at $test_file, exiting."
       exit 1
    fi
    

    echo "[i] compiling verilog module $1 and testbench tests/$1"
    iverilog $1 tests/$1 
    if [ ! $? == 0 ]; then
	echo "[e] verilog exited with a non-zero return code"
	exit 1
    fi

    echo "[i] running verilog testbench"
    $mod_dir/a.out
    echo "[i] testbench exited with return code $?"

else
    echo "[e] Module file $1 not found, exiting."
    exit 1
fi
