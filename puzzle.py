import subprocess, time
from random import randint

def start():
    print('Start ...')
    subprocess.call("bash start.sh", shell=True)


def stop():
    print('Stop ...')
    subprocess.call("bash stop.sh", shell=True)


def do_one_round(start_fn, stop_fn, runtime_min=3600, runtime_max=9800, resttime_min=900, resttie_max=1800):
    run_time = randint(runtime_min, runtime_max)
    rest_time = randint(resttime_min, resttie_max)
    start_fn()

    print('Running for {} s'.format(run_time))
    time.sleep(run_time)

    print('Kill and Rest for {} s'.format(rest_time))
    stop_fn()
    time.sleep(rest_time)

    pass

def main(start_fn, stop_fn, runtime_min=3600, runtime_max=9800, resttime_min=900, resttie_max=1800):
    while (True):
        do_one_round(start_fn, stop_fn, runtime_min, runtime_max, resttime_min, resttie_max)

    pass


if __name__ == "__main__":
    main(start, stop, 1*3600, 2*3600, 15*60, 30*60)