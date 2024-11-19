#!/bin/bash

WGSLSMITH='../target/release/wgslsmith'

$WGSLSMITH gen --recondition -o testdata/test.wgsl

LINE="$(head -n 1 test.wgsl)"
INPUTS="${LINE:3}"
echo $INPUTS > testdata/inputs.json

$WGSLSMITH run test.wgsl inputs.json --config 'dawn:vk:7425'

RESULT=$?

if [ $RESULT -eq 0 ]; then
    echo "Success!"
else 
    echo "Failure! Return code: $RESULT"
fi
