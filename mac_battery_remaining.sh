# will display the (estimated) remaining battery on a Mac
# thanks, commandlinefu

pmset -g batt | awk '/^ /{print $5}'
