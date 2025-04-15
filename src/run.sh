#!/bin/zsh

function find_cmd_bin {
    command -v $1
}

OLLAMA_BIN=$(find_cmd_bin ollama || true)
UV_BIN=$(find_cmd_bin uv || true)

# replace <OLLAMA_BIN>
sed -i '' -e 's|<OLLAMA_BIN>|'"$OLLAMA_BIN"'|g' ~/Library/LaunchAgents/com.granite.ollama.plist
# replace <UV_BIN>
sed -i '' -e 's|<UV_BIN>|'"$UV_BIN"'|g' ~/Library/LaunchAgents/com.granite.obee.plist


# $1 == load or unload
if [ $1 ]
then
    launchctl $1 ~/Library/LaunchAgents/com.granite.ollama.plist |
    launchctl $1 ~/Library/LaunchAgents/com.granite.obee.plist
fi

echo "Ollama and Open Webui $1"