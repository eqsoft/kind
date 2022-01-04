#!/usr/bin/env bash

ns=$1

if [ -z "$ns" ] ; then
  ns="--all-namespaces"
else
  ns="-n $ns"  
fi

kubectl get all $ns
