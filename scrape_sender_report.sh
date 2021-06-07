#!/bin/bash

# usage: ./scrape_sender_report.sh log_file



echo -n "WebRTC.Video.InputFramesPerSecond,"
echo -n "WebRTC.Video.SentFramesPerSecond,"
echo -n "WebRTC.Video.SentToInputFpsRatioPercent,"
echo -n "WebRTC.Video.SentPacketsLostInPercent,"
echo -n "WebRTC.Video.NumberOfPauseEvents,"
echo -n "WebRTC.Video.PausedTimeInPercent,"
echo -n "WebRTC.Video.BitrateSentInBps,"
echo -n "WebRTC.Video.MediaBitrateSentInBps,"
echo -n "WebRTC.Video.PaddingBitrateSentInBps,"
echo -n "WebRTC.Video.RetransmittedBitrateSentInBps,"
echo -n "WebRTC.Video.FecBitrateSentInBps,"
echo -n "Frames encoded,"
echo -n "WebRTC.Video.DroppedFrames.Capturer,"
echo -n "WebRTC.Video.DroppedFrames.EncoderQueue,"
echo -n "WebRTC.Video.DroppedFrames.Encoder,"
echo -n "WebRTC.Video.DroppedFrames.Ratelimiter,"
echo -n "WebRTC.Video.DroppedFrames.CongestionWindow,"
echo -n "Frames decoded,"
echo -n "WebRTC.Video.DroppedFrames.Receiver,"
echo -n "WebRTC.Video.DroppedFrames.RenderQueue,"
echo -n "WebRTC.Call.EstimatedSendBitrateInKbps,"
echo -n "WebRTC.Call.PacerBitrateInKbps,"
echo -n "WebRTC.Call.AudioBitrateReceivedInBps,"
echo -n "WebRTC.Call.RtcpBitrateReceivedInBps,"
echo -n "WebRTC.Call.BitrateReceivedInBps,"
echo "WebRTC.Video.SendDelayInMs"

a=`cat $1 | grep WebRTC.Video.InputFramesPerSecond | sed -e "s/(send_statistics_proxy.cc:667): WebRTC.Video.InputFramesPerSecond periodic_samples:[0-9]*, //g" | sed -e 's/\(^.*$\)/\"\1\"/g'`
b=`cat $1 | grep WebRTC.Video.SentFramesPerSecond | sed -e "s/WebRTC.Video.SentFramesPerSecond periodic_samples:[0-9]*, //g" | sed -e 's/\(^.*$\)/\"\1\"/g'`
c=`cat $1 | grep WebRTC.Video.SentToInputFpsRatioPercent | sed -e "s/WebRTC.Video.SentToInputFpsRatioPercent //g"`
d=`cat $1 | grep WebRTC.Video.SentPacketsLostInPercent | sed -e "s/WebRTC.Video.SentPacketsLostInPercent //g"`
e=`cat $1 | grep WebRTC.Video.NumberOfPauseEvents | sed -e "s/WebRTC.Video.NumberOfPauseEvents //g"`
f=`cat $1 | grep WebRTC.Video.PausedTimeInPercent | sed -e "s/WebRTC.Video.PausedTimeInPercent //g"`
g=`cat $1 | grep WebRTC.Video.BitrateSentInBps | sed -e "s/WebRTC.Video.BitrateSentInBps periodic_samples:[0-9]*, //g" | sed -e 's/\(^.*$\)/\"\1\"/g'`
h=`cat $1 | grep WebRTC.Video.MediaBitrateSentInBps | sed -e "s/WebRTC.Video.MediaBitrateSentInBps periodic_samples:[0-9]*, //g" | sed -e 's/\(^.*$\)/\"\1\"/g'`
i=`cat $1 | grep WebRTC.Video.PaddingBitrateSentInBps | sed -e "s/WebRTC.Video.PaddingBitrateSentInBps periodic_samples:[0-9], //g" | sed -e 's/\(^.*$\)/\"\1\"/g'`
j=`cat $1 | grep WebRTC.Video.RetransmittedBitrateSentInBps | sed -e "s/WebRTC.Video.RetransmittedBitrateSentInBps periodic_samples:[0-9]*, //g" | sed -e 's/\(^.*$\)/\"\1\"/g'`
k=`cat $1 | grep WebRTC.Video.FecBitrateSentInBps | sed -e "s/WebRTC.Video.FecBitrateSentInBps periodic_samples:[0-9]*, //g" | sed -e 's/\(^.*$\)/\"\1\"/g'`
l=`cat $1 | grep "Frames encoded" | sed -e "s/Frames encoded //g"`
m=`cat $1 | grep WebRTC.Video.DroppedFrames.Capturer | sed -e "s/WebRTC.Video.DroppedFrames.Capturer //g"`
n=`cat $1 | grep WebRTC.Video.DroppedFrames.EncoderQueue | sed -e "s/WebRTC.Video.DroppedFrames.EncoderQueue //g"`
o=`cat $1 | grep -v WebRTC.Video.DroppedFrames.EncoderQueue | grep WebRTC.Video.DroppedFrames.Encoder | sed -e "s/WebRTC.Video.DroppedFrames.Encoder //g"`
p=`cat $1 | grep WebRTC.Video.DroppedFrames.Ratelimiter | sed -e "s/WebRTC.Video.DroppedFrames.Ratelimiter //g"`
q=`cat $1 | grep WebRTC.Video.DroppedFrames.CongestionWindow | sed -e "s/WebRTC.Video.DroppedFrames.CongestionWindow //g"`
r=`cat $1 | grep "Frames decoded" | sed -e "s/(receive_statistics_proxy2.cc:495): Frames decoded //g"`
s=`cat $1 | grep WebRTC.Video.DroppedFrames.Receiver | sed -e "s/WebRTC.Video.DroppedFrames.Receiver //g"`
t=`cat $1 | grep WebRTC.Video.DroppedFrames.RenderQueue | sed -e "s/(video_render_frames.cc:47): WebRTC.Video.DroppedFrames.RenderQueue //g"`
u=`cat $1 | grep WebRTC.Call.EstimatedSendBitrateInKbps | sed -e "s/(call.cc:552): WebRTC.Call.EstimatedSendBitrateInKbps, periodic_samples:[0-9]*, //g" | sed -e 's/\(^.*$\)/\"\1\"/g'`
v=`cat $1 | grep WebRTC.Call.PacerBitrateInKbps | sed -e "s/(call.cc:560): WebRTC.Call.PacerBitrateInKbps, periodic_samples:[0-9]*, //g" | sed -e 's/\(^.*$\)/\"\1\"/g'`
w=`cat $1 | grep WebRTC.Call.AudioBitrateReceivedInBps | sed -e "s/(call.cc:590): WebRTC.Call.AudioBitrateReceivedInBps, periodic_samples:[0-9]*, //g" | sed -e 's/\(^.*$\)/\"\1\"/g'`
x=`cat $1 | grep WebRTC.Call.RtcpBitrateReceivedInBps | sed -e "s/(call.cc:598): WebRTC.Call.RtcpBitrateReceivedInBps, periodic_samples:[0-9]*, //g" | sed -e 's/\(^.*$\)/\"\1\"/g'`
y=`cat $1 | grep WebRTC.Call.BitrateReceivedInBps | sed -e "s/(call.cc:606): WebRTC.Call.BitrateReceivedInBps, periodic_samples:[0-9]*, //g" | sed -e 's/\(^.*$\)/\"\1\"/g'`
z=`cat $1 | grep WebRTC.Video.SendDelayInMs | sed -e "s/(send_delay_stats.cc:49): WebRTC.Video.SendDelayInMs, periodic_samples:[0-9]*, //g" | sed -e 's/\(^.*$\)/\"\1\"/g'`

echo $a,$b,$c,$d,$e,$f,$g,$h,$i,$j,$k,$l,$m,$n,$o,$p,$q,$r,$s,$t,$u,$v,$w,$x,$y,$z
