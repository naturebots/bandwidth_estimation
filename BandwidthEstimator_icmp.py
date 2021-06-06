import icmp_cal


class Estimator(object):
    def __init__(self):
        self.file_name = './estimated_bandwidth.log'

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


    def get_estimated_bandwidth(self)->int:
        estimated_bandwidth = icmp_cal.calc_bandwidth()
        with open(self.file_name, mode="a", encoding="utf8") as f:
            f.write(str(estimated_bandwidth) + "\n")
        return estimated_bandwidth
        # return int(1e6) # 1Mbps
