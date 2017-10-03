#!/usr/bin/env bash

TOUCHPAD_ID=$(xinput | grep TouchPad | grep -P -o '(?<=\sid=)\d+')
echo Found touchpad with id: $TOUCHPAD_ID

TAP_ID=$(xinput list-props $TOUCHPAD_ID | grep -P -o '(?<=Tapping Enabled \()\d+')
echo Found tap property id: $TAP_ID

xinput set-prop $TOUCHPAD_ID $TAP_ID 1
echo Tapping enabled