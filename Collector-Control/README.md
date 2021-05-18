# Collector-Control

This is a script for starting, stoping, and checking the status of a Contoller without using root.

## Usage

```console
./collctl.sh [start|stop]
```

## Examples
```console
$ ./collctl.sh start

==============================
The Collector has been started
==============================

$ ./collctl.sh

=====================================
Collector is running with PID: 722603
=====================================

$ ./collctl.sh stop

==============================
The Collector has been stopped
==============================

$./collctl.sh

============================
The Collector is not running
============================
```
