---
title: Kube Pod Not Ready
weight: 20
---


## KubePodNotReady

## Meaning

This alert is triggered when pod is in non-ready state for more than 15 minutes.

## Impact

A pod has started, but it is not responding to the health probe with success. 
This may mean that it is stuck and is not able to serve traffic. 

## Diagnosis

You can check pod logs with kubectl logs to see if there is any indication of progress.
