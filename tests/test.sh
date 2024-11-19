#!/bin/bash

WGSLSMITH='../target/release/wgslsmith'
TESTFILE='./testdata/test.wgsl'
INPUTFILE='./testdata/inputs.json'

$WGSLSMITH gen --recondition -o $TESTFILE

LINE="$(head -n 1 $TESTFILE)"
INPUTS="${LINE:3}"
echo $INPUTS > $INPUTFILE

$WGSLSMITH run $TESTFILE $INPUTFILE --config 'dawn:vk:7425'

RESULT=$?

if [ $RESULT -eq 0 ]; then
    echo "Success!"
else 
    echo "Failure! Return code: $RESULT"
fi
