# from ping3 import ping, verbose_ping
# import pings
import sys, subprocess, re
import numpy as np
# import numpay

DEST_IP = '172.17.0.3'
# DEST_IP = '127.0.0.1'
RTT_ARRY = []
RTT_DIFF = []

def calc_bandwidth():
    estimate_size = icmp_size_inc() # bps
    # ans = int(estimate_size / 1000000)
    # print('Get estimate bandwidth: ' + str(estimate_size / 1000000) + 'Mbps')
    return estimate_size


def get_rtt(value):  #pingを1回飛ばして、RTTを返す関数
    ping_command = 'ping ' + DEST_IP + ' -c 1 -l ' + str(value)
    # ping_command = 'ping ' + DEST_IP + ' -c 1'
    result = subprocess.getoutput(ping_command)

    regex = re.compile('rtt min/avg/max/mdev = [\d.]+/([\d.]+)/[\d.]+/[\d.]+ ms')
    for line in result.split('\n'):
        m = regex.match(line)
        # if m:
            # rtt = m.group(0)
            # print('RTT is ' + rtt + ' ms')
            # return rtt
        if m:
            # rtt = m.group(0)
            rtt = re.findall(r"[\d.]+", line)[0]
            # print('RTT is ' + rtt + ' ms')
            return rtt


def icmp_size_inc():
    ans = 0
    # old_calc = 0
    j = 0
    i = 0
    #ここで増分変化を検知するまでループ
    while True:
        i = i + 1000000  # RTTの値を取得 byte 1MBずつ増やす
        calc = get_rtt(i)
        if calc == None:
            continue
        ans = jadge_inc(float(calc), j)
        # old_calc = float(calc) #データを保存
        j = j + 1
        # 30回計測もしくは、増分変化の判定があった場合、推定帯域としてみなす　暫定
        # print('ans:' + str(ans))
        if ans == 1 or j == 10: #ここの基準を最小二乗法などで傾きの変化で決定するようにしたい
            send_size = (i * 8) / float(calc)
            break

    return send_size


def jadge_inc(new_rtt, count):
    # 最新のRTTを配列に格納し、差分を計算する。
    if count > 0:
        RTT_ARRY.append(new_rtt)
        RTT_DIFF = np.diff(RTT_ARRY, n=1)  # 差分計算
        rtt_max = max(RTT_DIFF, default=0)
    # 配列の中で増分が大きい値が閾値を超えたら,推定帯域のポイントとしてflag = 1を返す
        if rtt_max > 10:  # ms
            flag = 1
        else:
            flag = 0
    else:
        flag = 0
    return flag


if __name__ == "__main__":
    calc_bandwidth()
