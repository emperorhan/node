#!/bin/bash
################################################################################
#
# Script for IBCT private_net
# https://github.com/junep89/ibctprivate
#
###############################################################################


NODEOSBINDIR="/home/eos/eos/build/programs/nodeos"
DATADIR="$( jq -r '.DIR' "config.conf" )"

$DATADIR/stop.sh
echo -e "Starting Nodeos \n";

$NODEOSBINDIR/nodeos  --delete-all-blocks --genesis-json $DATADIR/genesis.json --data-dir $DATADIR --config-dir $DATADIR > $DATADIR/stdout.txt 2> $DATADIR/stderr.txt &  echo $! > $DATADIR/nodeos.pid
#$NODEOSBINDIR/nodeos --replay-blockchain --contracts-console --data-dir $DATADIR --config-dir $DATADIR > $DATADIR/stdout.txt 2> $DATADIR/stderr.txt &  echo $! > $DATADIR/nodeos.pid 
#$NODEOSBINDIR/nodeos  --contracts-console $DATADIR/genesis.json --data-dir $DATADIR --config-dir $DATADIR > $DATADIR/stdout.txt 2> $DATADIR/stderr.txt &  echo $! > $DATADIR/nodeos.pid
