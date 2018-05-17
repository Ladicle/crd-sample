#!/bin/bash

set -eu

clear
echo "Start DEMO :)"; read ans

# open & describe CRD
tmux split-window -v -p 90
tmux send-keys -t 1 'e /Users/aigarash/Developments/src/github.com/Ladicle/crd-sample/sample-crd.yaml' C-m
tmux select-pane -t 0
echo "Now: Display CRD "
echo "Next: Create CRD"; read ans

tmux send-keys -t 1 C-x C-c
tmux select-pane -t 1
tmux split-window -h -p 50
tmux send-keys -t 1 'clear' C-m 'kubectl get crd -w' C-m
tmux send-keys -t 2 'kubectl create -f /Users/aigarash/Developments/src/github.com/Ladicle/crd-sample/sample-crd.yaml' C-m

# open & describe CR
tmux select-pane -t 0
echo "Now: Create CRD"
echo "Next: Compare CRD and CR"; read ans

tmux send-keys -t 1 C-c 'e /Users/aigarash/Developments/src/github.com/Ladicle/crd-sample/sample-crd.yaml' C-m
tmux send-keys -t 2 'e /Users/aigarash/Developments/src/github.com/Ladicle/crd-sample/sample-cr.yaml' C-m

# create CR
tmux select-pane -t 0
echo "Now: Compare CRD and CR"
echo "Next: Create CR"; read ans

tmux send-keys -t 1 C-x C-c
tmux send-keys -t 2 C-x C-c

tmux send-keys -t 1 'clear' C-m
tmux send-keys -t 2 'clear' C-m

tmux send-keys -t 1 'kubectl get mp -w' C-m
tmux send-keys -t 2 'kubectl create -f /Users/aigarash/Developments/src/github.com/Ladicle/crd-sample/sample-cr.yaml' C-m

# edit CR
tmux select-pane -t 0
echo "Now: Create CR"
echo "Next: Edit CR manually"; read ans

tmux send-keys -t 2 'exit' C-m
tmux send-keys -t 1 C-c 'clear' C-m 'kubectl edit mp' C-m

# show updated CR
tmux select-pane -t 0
echo "Now: Edit CR manually"
echo "Next: Display updated CR"; read ans

tmux send-keys -t 1 C-c 'clear' C-m 'kubectl describe mp' C-m

# create bad CR & describe validation
tmux select-pane -t 0
echo "Now: Display updated CR"
echo "Next: Create CR contains unexpected field"; read ans

tmux send-keys -t 1 'clear' C-m
tmux send-keys -t 1 'e /Users/aigarash/Developments/src/github.com/Ladicle/crd-sample/sample-cr-with-unexpected-field.yaml' C-m

# create
tmux select-pane -t 0
echo "Now: Create CR contains unexpected filed"
echo "Next: nil"; read ans

tmux send-keys -t 1 C-x C-c
tmux send-keys -t 1 'clear' C-m
tmux send-keys -t 1 'kubectl create -f /Users/aigarash/Developments/src/github.com/Ladicle/crd-sample/sample-cr-with-unexpected-field.yaml' C-m

# end
read ans
tmux send-keys -t 1 'exit' C-m
tmux send-keys -t 0 'clear' C-m 'terminal-parrot' C-m
