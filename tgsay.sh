#!/bin/bash

### send message to telegram


BOT_TOKEN=<you bot token>
CHAT_ID=<you chat id>
URL="https://api.telegram.org/bot$BOT_TOKEN"
PARSE=Markdown
TEXT="$@"
METHOD='sendMessage'


[[ "$TEXT" ]] && curl --silent -X POST -d "chat_id=$CHAT_ID&text=$TEXT&parse_mode=$PARSE" "${URL}/${METHOD}"
