#!/usr/bin/env bash

TOUCHPAD_ID=$(xinput | grep TouchPad | grep -P -o '(?<=\sid=)\d+')

if [[ $TOUCHPAD_ID == ^-?[0-9]+$ ]] 
	then
	echo Could not find touchpad id
fi

echo Found touchpad with id: $TOUCHPAD_ID

TAP_ID=$(xinput list-props $TOUCHPAD_ID | grep -P -o '(?<=Tapping Enabled \()\d+')

if [[ $TAP_ID == ^-?[0-9]+$ ]] 
	then
	echo Could not tap property for touchpad $TOUCHPAD_ID
fi

echo Found tap property for touchpad $TOUCHPAD_ID: $TAP_ID

xinput set-prop $TOUCHPAD_ID $TAP_ID 1
echo Tapping enabled