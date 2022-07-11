if xrandr --query | grep '^DP-3 connected'; then
	xrandr && xrandr --output DP-3 --auto --above eDP-1;
fi
