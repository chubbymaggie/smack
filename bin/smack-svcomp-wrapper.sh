#!/bin/sh

# This script has to be copied into the root folder of the SVCOMP package

ROOT="$( cd "$(dirname "$(readlink -f "${0}")")" && pwd )"
SMACK_BIN="${ROOT}/smack/bin"
CORRAL_BIN="${ROOT}/corral"
LOCKPWN_BIN="${ROOT}/lockpwn"
LLVM_BIN="${ROOT}/llvm/bin"

# Setting mono heap size to 9GB
export MONO_GC_PARAMS=max-heap-size=9g

export PATH=${LLVM_BIN}:$SMACK_BIN:$PATH
export CORRAL="mono ${CORRAL_BIN}/corral.exe"
export LOCKPWN="mono ${LOCKPWN_BIN}/lockpwn.exe"

smack -x=svcomp --verifier=svcomp -q $@

