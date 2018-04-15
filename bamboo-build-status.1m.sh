#!/usr/bin/env bash

# <bitbar.title>Bamboo Build Status</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Nitkalya Wiriyanuparb</bitbar.author>
# <bitbar.author.github>dekpient</bitbar.author.github>
# <bitbar.desc>Displays status of Bamboo builds</bitbar.desc>
# <bitbar.image>http://via.placeholder.com/350x150?text=TODO</bitbar.image>
# <bitbar.dependencies>jq,curl</bitbar.dependencies>
# <bitbar.abouturl>https://github.com/dekpient/bitbar-plugins</bitbar.abouturl>
#
# Displays the status of a list of Bamboo builds
# Runs 2 REST calls per plan - one to find out if a build is currently runnning and another to get the last build status if one is not currently running
#
# CONFIG
# Only runs on the work machine based on configured hostname

WORK_HOSTNAME='worklaptop'

if [ "$(hostname -s)" != "$WORK_HOSTNAME" ]; then
  exit 0
fi

USERNAME="username"
PASSWORD=$(cat /Users/username/.thatpassword)
SERVER="https://bamboo"
PLANS=("PROJ-PLAN1" "PROJ-PLAN2")
JQPATH="/usr/local/bin/jq"

# END CONFIG

BITBAR_LINES=()
FAILED=false

for plan in "${PLANS[@]}"
do
	planResult=$(curl -s --user $USERNAME:$PASSWORD  $SERVER/rest/api/latest/plan/$plan.json\?os_authType=basic)
	buildResult=$(curl -s --user $USERNAME:$PASSWORD  $SERVER/rest/api/latest/result/$plan/latest.json\?os_authType=basic)

	isBuilding=$(echo "$planResult" | $JQPATH -r '.isBuilding')
	shortName=$(echo "$planResult" | $JQPATH -r '.shortName')

	relativeTime=$(echo "$buildResult" | $JQPATH -r '.buildRelativeTime')
	buildDuration=$(echo "$buildResult" | $JQPATH -r '.buildDurationDescription')
	buildTestSummary=$(echo "$buildResult" | $JQPATH -r '.buildTestSummary')

	if [ "$isBuilding" = "true" ]
	then
		BITBAR_LINES+=("♻︎ Building $shortName... | href=$SERVER/browse/$plan color=orange")
	else
		state=$(echo "$buildResult" | $JQPATH -r '.state')
		if [ "$state" = "Successful" ]
		then
			icon="✔"︎
			color="green"
		else
			icon="✖"
			color="red"
			FAILED=true
		fi
		BITBAR_LINES+=("$icon $shortName ⸨${relativeTime}⸩ | href=$SERVER/browse/$plan color=$color")
		BITBAR_LINES+=("$icon $shortName ➠ ${buildTestSummary} ⸨${buildDuration}⸩ | color=$color alternate=true")
	fi
done

[ "$FAILED" = "true" ] && echo '◉ | color=red' || echo '◉ | color=green'
echo ---
for line in "${BITBAR_LINES[@]}"; do echo $line; done
echo ---
echo "Build Activity | href=${SERVER}/currentActivity.action"
echo "Dashboard | href=${SERVER}/myBamboo.action"
echo "Refresh | refresh=true"
