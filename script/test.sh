#!/bin/bash
if [ -n "$1" ]; then
  npx hardhat test test/$1
else
  npx hardhat test
fi
