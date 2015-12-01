#!/bin/bash

function run_supervisor(){
	echo "Execting the run_supervisord function. "
	supervisord -n 	
}

run_supervisor
