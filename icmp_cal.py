import subprocess
import re
import math

DEST_IP = '172.17.0.3'
# DEST_IP = '127.0.0.1'
# DEST_IP = 'google.co.jp'


def calc_bandwidth():
    rtt = get_rtt()
    # print('RTT is ' + str(rtt) + ' ms')
    estimated_bandwidth = math.floor(1500 * 8 / rtt * 1000)
    return estimated_bandwidth


def get_rtt():
    command = 'ping ' + DEST_IP + ' -c 10 -s 1472 -i 0.003'
    result = subprocess.getoutput(command)
    rtt = result.split('\n')[-1]

    try:
        max_rtt = float(re.findall(r"[\d.]+", rtt)[2])
    except IndexError:
        max_rtt = 5000
    return max_rtt


if __name__ == "__main__":
    print(calc_bandwidth())
