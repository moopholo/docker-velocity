#!/usr/bin/env bash

: "${JVM_MEMORY:=1G}"
: "${JVM_INIT_MEMORY:=$JVM_MEMORY}"
: "${JVM_MAX_MEMORY:=$JVM_MEMORY}"

java_args=(
  -XX:+UseG1GC
  -XX:G1HeapRegionSize=4M
  -XX:+UnlockExperimentalVMOptions
  -XX:+ParallelRefProcEnabled
  -XX:+AlwaysPreTouch
  -XX:MaxInlineLevel=15
  "-Xms$JVM_INIT_MEMORY"
  "-Xmx$JVM_MAX_MEMORY"
  -Dlog4j2.configurationFile=file:///velocity/logger/log4j2.xml
)

exec java "${java_args[@]}" -jar /velocity/velocity.jar
