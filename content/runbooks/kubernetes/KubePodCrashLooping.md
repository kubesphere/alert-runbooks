---
title: Kube Pod Crash Looping
weight: 20
---

# KubePodCrashLooping

## Meaning

This alert is triggered when pod is in waiting state for more than 15 minutes(reason: "CrashLoopBackOff").
CrashLoopBackOff is a Kubernetes state representing a restart loop that is happening in a Pod: a container in the Pod is started, but crashes and is then restarted, over and over again.

## Impact

Kubernetes will wait an increasing back-off time between restarts to give you a chance to fix the error. 
As such, CrashLoopBackOff is not an error on itself, but indicates that there’s an error happening that prevents a Pod from starting properly.

## Diagnosis

It’s important to note that a CrashLoopBackOff is not the actual error that is crashing the pod. 
Remember that it’s just displaying the loop happening in the column. 
You need to find the underlying error affecting the containers.

Some of the errors linked to the actual application are:

* Misconfigurations: Like a typo in a configuration file.
* A resource is not available: Like a PersistentVolume that is not mounted.
* Wrong command line arguments: Either missing, or the incorrect ones.
* Bugs & Exceptions: That can be anything, very specific to your application.

## Mitigation
1. Check the pod description.
2. Check the pod logs.
3. Check the events.
4. Check the deployment.
