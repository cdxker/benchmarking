#!/bin/bash

benchmark="${2:benchmark}"
route="${3:-5}"

graph () { 
    echo "graph" 
    cat ${benchmark}/*.out | wrk2img ${benchmark}/graph.png;
}

run () { 
    [ -z $route ] && echo "Please provide route
usage:
$0 $1 $benchmark 'http://api.openai.com/v1'
    " && exit;

    echo "running wrk2 with options -t12 -d30s -c40 for $benchmark..."
    wrk -t12 -d30s -c40 -s $benchmark/script.lua $route > $benchmark/output.out;
}

show () { cat $benchmark/output.out ;}
new () {
    mkdir "$benchmark"

    cat << EOF >> $benchmark/script.lua
wrk.method = "POST"
wrk.body   = '{ "model": "gpt-4o-mini", "messages": [ { "role": "system", "content": "You are a helpful assistant." }, { "role": "user", "content": "What is deep learning?" } ], "stream": true, "max_tokens": 20 }'
wrk.headers["Content-Type"] = "application/json"
EOF
}

case "$1" in
    n*) new ;;
    g*) graph ;;
    r*) run ;;
    s*) show ;;
esac
