
import icmp_cal

class Estimator(object):
    def __init__(self):
        self.file_name = './icmp_log.txt)'

    def report_states(self, stats: dict):
        '''
        stats is a dict with the following items
        {
            "send_time_ms": uint,
            "arrival_time_ms": uint,
            "payload_type": int,
            "sequence_number": uint,
            "ssrc": int,
            "padding_length": uint,
            "header_length": uint,
            "payload_size": uint
        }
        '''
        with open('stats_origin.txt', mode="a", encoding="utf8") as f:
            f.write(str(stats)+"\n")

    def get_estimated_bandwidth(self)->int:
        bandwidth = icmp_cal.calc_bandwidth()
        with open(self.file_name, mode="a", encoding="utf8") as f:
            f.write(str(bandwidth) + "\n")
        return bandwidth  # 予想される帯域幅を返す
        # return int(1e6) # 1Mbps
