#!/bin/bash

# usage: ./scrape_sender_report.sh log_file

array1=("WebRTC.Video.SentToInputFpsRatioPercent" "WebRTC.Video.SentPacketsLostInPercent" "WebRTC.Video.NumberOfPauseEvents" "WebRTC.Video.PausedTimeInPercent" "Frames encoded" "WebRTC.Video.DroppedFrames.Capturer" "WebRTC.Video.DroppedFrames.EncoderQueue" "WebRTC.Video.DroppedFrames.Encoder" "WebRTC.Video.DroppedFrames.Ratelimiter" "WebRTC.Video.DroppedFrames.CongestionWindow" "Frames decoded" "WebRTC.Video.DroppedFrames.Receiver" "WebRTC.Video.DroppedFrames.RenderQueue" "WebRTC.Call.EstimatedSendBitrateInKbps" "WebRTC.Call.PacerBitrateInKbps" "WebRTC.Call.AudioBitrateReceivedInBps" "WebRTC.Call.RtcpBitrateReceivedInBps" "WebRTC.Call.BitrateReceivedInBps" "WebRTC.Video.SendDelayInMs")

array3=("")

array2=("WebRTC.Video.InputFramesPerSecond" "WebRTC.Video.SentFramesPerSecond" "WebRTC.Video.BitrateSentInBps" "WebRTC.Video.MediaBitrateSentInBps" "WebRTC.Video.PaddingBitrateSentInBps" "WebRTC.Video.RetransmittedBitrateSentInBps" "WebRTC.Video.FecBitrateSentInBps")

file=$1

for ((i=0; i<${#array1[@]}; i++)); do
  cat ${file} | grep "${array1[$i]} " | sed -e "s/.*${array1[$i]}/${array1[$i]}/g" | sed -e "s/\(.*${array1[$i]}\)/\1,/g"
done

for ((i=0; i<${#array2[@]}; i++)); do
  cat ${file} | grep "${array2[$i]} " | sed -e "s/.*${array2[$i]}/${array2[$i]}/g" | sed -e "s/ periodic_samples:[0-9]//g"
done
