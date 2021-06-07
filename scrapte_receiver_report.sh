#!/bin/bash

### usage: ./scrapte_receiver_report.sh log_file ###

array=("Frames decoded" "WebRTC.Video.DroppedFrames.Receiver" "WebRTC.Video.ReceivedPacketsLostInPercent" "WebRTC.Video.DecodedFramesPerSecond" "WebRTC.Video.InterframeDelay95PercentileInMs.S0" "WebRTC.Video.MediaBitrateReceivedInKbps.S0" "WebRTC.Video.MeanFreezeDurationMs" "WebRTC.Video.TimeInHdPercentage" "WebRTC.Video.TimeInBlockyVideoPercentage" "WebRTC.Video.NumberResolutionDownswitchesPerMinute" "WebRTC.Video.NumberFreezesPerMinute" "WebRTC.Video.HarmonicFrameRate" "WebRTC.Video.MediaBitrateReceivedInKbps" "WebRTC.Video.InterframeDelay95PercentileInMs")

array2=("WebRTC.Video.ReceiveStreamLifetimeInSeconds" "WebRTC.Video.MeanTimeBetweenFreezesMs" "WebRTC.Video.DroppedFrames.RenderQueue")

array3=("WebRTC.Call.EstimatedSendBitrateInKbps" "WebRTC.Call.PacerBitrateInKbps" "WebRTC.Call.VideoBitrateReceivedInBps" "WebRTC.Call.AudioBitrateReceivedInBps" "WebRTC.Call.RtcpBitrateReceivedInBps" "WebRTC.Call.BitrateReceivedInBps")

values=()

function print_all_parameters(){
  for ((i=0; i<${#array[@]}; i++)); do
    echo -n \"${array[$i]}\",
  done

  for ((i=0; i<${#array2[@]}; i++)); do
    echo -n \"${array2[$i]}\",
  done

  for ((i=0; i<${#array3[@]}; i++)); do
    echo -n \"${array3[$i]}\",
  done
  echo
}

function scrapte_values() {
  for ((i=0; i<${#array[@]}; i++)); do
    values=("${values[@]}" `cat $1 | grep "${array[$i]} " | sed -e "s/${array[$i]} //g"`)
  done

  for ((i=0; i<${#array2[@]}; i++)); do
    values=("${values[@]}" `cat $1 | grep "${array2[$i]}" | sed -e "s/^.*${array2[$i]} //g"`)
  done

  for ((i=0; i<${#array3[@]}; i++)); do
    values=("${values[@]}" "`cat $1 | grep "${array3[$i]}" | sed -e "s/^.*${array3[$i]}, periodic_samples:[0-9]*, //g"`")
  done
}

function print_result(){
  for ((i=0; i<${#values[@]}; i++)); do
    echo -n \"${values[$i]}\",
  done
  echo
}

function print_debug_info() {
 for ((i=0; i<${#array[@]}; i++)); do
   cat $1 | grep "${array[$i]}"
 done

 for ((i=0; i<${#array2[@]}; i++)); do
   cat $1 | grep ${array2[$i]}
 done

 for ((i=0; i<${#array3[@]}; i++)); do
   cat $1 | grep ${array3[$i]}
 done

 echo -n "number of index is " && echo ${#values[@]}
}

print_all_parameters
scrapte_values $1
print_result

# print_debug_info $1


### list of parameters ###
# WebRTC.Video.ReceiveStreamLifetimeInSeconds
# Frames decoded
# WebRTC.Video.DroppedFrames.Receiver
# WebRTC.Video.ReceivedPacketsLostInPercent
# WebRTC.Video.DecodedFramesPerSecond
# WebRTC.Video.InterframeDelay95PercentileInMs
# WebRTC.Video.InterframeDelay95PercentileInMs.S0
# WebRTC.Video.MediaBitrateReceivedInKbps.S0
# WebRTC.Video.MediaBitrateReceivedInKbps
# WebRTC.Video.MeanTimeBetweenFreezesMs
# WebRTC.Video.MeanFreezeDurationMs
# WebRTC.Video.TimeInHdPercentage
# WebRTC.Video.TimeInBlockyVideoPercentage
# WebRTC.Video.NumberResolutionDownswitchesPerMinute
# WebRTC.Video.NumberFreezesPerMinute
# WebRTC.Video.HarmonicFrameRate
# WebRTC.Video.DroppedFrames.RenderQueue
# WebRTC.Call.EstimatedSendBitrateInKbps
# WebRTC.Call.PacerBitrateInKbps
# WebRTC.Call.VideoBitrateReceivedInBps
# WebRTC.Call.AudioBitrateReceivedInBps
# WebRTC.Call.RtcpBitrateReceivedInBps
# WebRTC.Call.BitrateReceivedInBps
