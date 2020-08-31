#!/usr/bin/env bash

# SCRIPT HEADER start
basedir=$1
source "$basedir/scripts/functions.sh"
echo "  "
echo "----------------------------------------"
echo "  $(bashcolor 1 32)Task$(bashcolorend) - Install Launcher"
echo "  This will build a launcher that similar to Paperclip by the server jar."
echo "  "
echo "----------------------------------------"
# SCRIPT HEADER end

# Copied from https://github.com/PaperMC/Paper/blob/d54ce6c17fb7a35238d6b9f734d30a4289886773/scripts/paperclip.sh
# License from Paper applies to this file

set -e
paperworkdir="$basedir/Tuinity/Paper/work"
mcver=$(cat "$paperworkdir/BuildData/info.json" | grep minecraftVersion | cut -d '"' -f 4)
serverjar="$basedir/Sekiei-Server/target/sekiei-$mcver-server.jar"
vanillajar="$paperworkdir/Minecraft/$mcver/$mcver.jar"

(
    cd "$basedir/Sekiei-Launcher"
    mvn clean package "-DmcVersion=$mcver" "-DsekieiJar=$serverjar" "-DvanillaJar=$vanillajar"
)
cp "$basedir/Sekiei-Launcher/assembly/target/sekiei-${mcver}.jar" "$basedir"

echo ""
echo "  $(bashcolor 1 32)Success$(bashcolorend) - Saved launcher jar to sekiei-${mcver}.jar"
