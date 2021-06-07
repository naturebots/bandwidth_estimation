#!/bin/bash

cat $1 | grep WebRTC.Video.InputFramesPerSecond | sed -e "s/^(send_statistics_proxy.cc:667): WebRTC.Video.InputFramesPerSecond periodic_samples:[0-9]*, //g" | sed -e 's/\(^.*$\)/\"\1\"/g'
cat $1 | grep WebRTC.Video.SentFramesPerSecond | sed -e "s/WebRTC.Video.SentFramesPerSecond periodic_samples:[0-9]*, //g" | sed -e 's/\(^.*$\)/\"\1\"/g'
cat $1 | grep WebRTC.Video.InputFramesPerSecond | sed -e "s/(send_statistics_proxy.cc:667): WebRTC.Video.InputFramesPerSecond periodic_samples:[0-9]*, //g" | sed -e 's/\(^.*$\)/\"\1\"/g'
cat $1 | grep WebRTC.Video.SentFramesPerSecond | sed -e "s/WebRTC.Video.SentFramesPerSecond periodic_samples:[0-9]*, //g" | sed -e 's/\(^.*$\)/\"\1\"/g'
cat $1 | grep WebRTC.Video.SentToInputFpsRatioPercent | sed -e "s/WebRTC.Video.SentToInputFpsRatioPercent //g"
cat $1 | grep WebRTC.Video.SentPacketsLostInPercent | sed -e "s/WebRTC.Video.SentPacketsLostInPercent //g"
cat $1 | grep WebRTC.Video.NumberOfPauseEvents | sed -e "s/WebRTC.Video.NumberOfPauseEvents //g"
cat $1 | grep WebRTC.Video.PausedTimeInPercent | sed -e "s/WebRTC.Video.PausedTimeInPercent //g"
cat $1 | grep WebRTC.Video.BitrateSentInBps | sed -e "s/WebRTC.Video.BitrateSentInBps periodic_samples:[0-9]*, //g" | sed -e 's/\(^.*$\)/\"\1\"/g'
cat $1 | grep WebRTC.Video.MediaBitrateSentInBps | sed -e "s/WebRTC.Video.MediaBitrateSentInBps periodic_samples:[0-9]*, //g" | sed -e 's/\(^.*$\)/\"\1\"/g'
cat $1 | grep WebRTC.Video.PaddingBitrateSentInBps | sed -e "s/WebRTC.Video.PaddingBitrateSentInBps periodic_samples:[0-9], //g" | sed -e 's/\(^.*$\)/\"\1\"/g'
cat $1 | grep WebRTC.Video.RetransmittedBitrateSentInBps | sed -e "s/WebRTC.Video.RetransmittedBitrateSentInBps periodic_samples:[0-9]*, //g" | sed -e 's/\(^.*$\)/\"\1\"/g'
cat $1 | grep WebRTC.Video.FecBitrateSentInBps | sed -e "s/WebRTC.Video.FecBitrateSentInBps periodic_samples:[0-9]*, //g" | sed -e 's/\(^.*$\)/\"\1\"/g'
cat $1 | grep "Frames encoded" | sed -e "s/Frames encoded //g"
cat $1 | grep WebRTC.Video.DroppedFrames.Capturer | sed -e "s/WebRTC.Video.DroppedFrames.Capturer //g"
cat $1 | grep WebRTC.Video.DroppedFrames.EncoderQueue | sed -e "s/WebRTC.Video.DroppedFrames.EncoderQueue //g"
cat $1 | grep -v WebRTC.Video.DroppedFrames.EncoderQueue | grep WebRTC.Video.DroppedFrames.Encoder | sed -e "s/WebRTC.Video.DroppedFrames.Encoder //g"
cat $1 | grep WebRTC.Video.DroppedFrames.Ratelimiter | sed -e "s/WebRTC.Video.DroppedFrames.Ratelimiter //g"
cat $1 | grep WebRTC.Video.DroppedFrames.CongestionWindow | sed -e "s/WebRTC.Video.DroppedFrames.CongestionWindow //g"
cat $1 | grep "Frames decoded" | sed -e "s/(receive_statistics_proxy2.cc:495): Frames decoded //g"
cat $1 | grep WebRTC.Video.DroppedFrames.Receiver | sed -e "s/WebRTC.Video.DroppedFrames.Receiver //g"
cat $1 | grep WebRTC.Video.DroppedFrames.RenderQueue | sed -e "s/(video_render_frames.cc:47): WebRTC.Video.DroppedFrames.RenderQueue //g"
cat $1 | grep WebRTC.Call.EstimatedSendBitrateInKbps | sed -e "s/(call.cc:552): WebRTC.Call.EstimatedSendBitrateInKbps, periodic_samples:[0-9]*, //g" | sed -e 's/\(^.*$\)/\"\1\"/g'
cat $1 | grep WebRTC.Call.PacerBitrateInKbps | sed -e "s/(call.cc:560): WebRTC.Call.PacerBitrateInKbps, periodic_samples:[0-9]*, //g" | sed -e 's/\(^.*$\)/\"\1\"/g'
cat $1 | grep WebRTC.Call.AudioBitrateReceivedInBps | sed -e "s/(call.cc:590): WebRTC.Call.AudioBitrateReceivedInBps, periodic_samples:[0-9]*, //g" | sed -e 's/\(^.*$\)/\"\1\"/g'
cat $1 | grep WebRTC.Call.RtcpBitrateReceivedInBps | sed -e "s/(call.cc:598): WebRTC.Call.RtcpBitrateReceivedInBps, periodic_samples:[0-9]*, //g" | sed -e 's/\(^.*$\)/\"\1\"/g'
cat $1 | grep WebRTC.Call.BitrateReceivedInBps | sed -e "s/(call.cc:606): WebRTC.Call.BitrateReceivedInBps, periodic_samples:[0-9]*, //g" | sed -e 's/\(^.*$\)/\"\1\"/g'
cat $1 | grep WebRTC.Video.SendDelayInMs | sed -e "s/(send_delay_stats.cc:49): WebRTC.Video.SendDelayInMs, periodic_samples:[0-9]*, //g" | sed -e 's/\(^.*$\)/\"\1\"/g'

