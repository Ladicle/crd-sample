#!/bin/bash

set -ue

kubectl delete mp --all
kubectl delete crd --all
