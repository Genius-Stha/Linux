#!/bin/bash
check_exit_status() {
    if [ $? -eq 0 ]; then
        echo "error has occured"
    else
        echo "successful"
    fi
}

