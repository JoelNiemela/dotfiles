envFile=.config/polybar/scripts/redshift_env.sh

state=on    # redshift state
pid=0       # pid of the redshift process
sleep_pid=0 # pid of the sleep process. used to control when to go to next iteration in main-loop

# clear all redshift effects
redshift -x

launch_redshift() {
	# Terminate already running instances of redshift
	killall -q redshift

	redshift -l $(curl -s "https://location.services.mozilla.com/v1/geolocate?key=geoclue" | awk 'OFS=":" {print $3,$5}' | tr -d ',}') > /dev/null 2>&1 &
	pid=$!
}

toggle() {
	case $state in
		on)
			state=off

			# kill the redshift process
			if [ "$pid" -ne 0 ]; then
        		kill $pid > /dev/null 2>&1
    		fi
			;;
		off)
			state=on

			launch_redshift
			;;
	esac

	# kill the blocking sleep process (to go to next main-loop iteration)
    if [ "$sleep_pid" -ne 0 ]; then
        kill $sleep_pid > /dev/null 2>&1
    fi
}

# launche redshift on startup
launch_redshift

# polybar sends USR1 signal when module/reshift is clicked.
trap "toggle" USR1

# main-loop
while true; do
	case $state in
		on)
			echo 
			;;
		off)
			echo 
			;;
	esac

	sleep 1 &
    sleep_pid=$!
    wait
done
