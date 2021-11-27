#!/bin/bash
echo -e "mode: ${DEBUG}\nport: ${DEBUG_PORT}"

if [ "${DEBUG}" = "dap" ];then
  go build -gcflags='all=-N -l' -o app
  dlv dap -l 0.0.0.0:${DEBUG_PORT} --log --check-go-version=false
elif [ "${DEBUG}" = "rpc" ]; then
  dlv debug --continue --check-go-version=false --accept-multiclient --headless -l 0.0.0.0:${DEBUG_PORT} main.go
else
  go run main.go
fi
