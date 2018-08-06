import time, os, speedtest, json, signal

def handler(sig_number, frame):
    print('que es frame?')
    print(frame)
    print(type(frame))
    print('SIGTERM recibido, cerrando app')
    exit()

def worker(filename=None):
    s = speedtest.Speedtest()
    #s.get_servers(servers)
    s.get_best_server()
    s.download()
    s.upload()
    print(s.results.server)
    print(s.results.json(pretty=True))
    if filename is not None:
        pass
        #with open('data.json', 'w') as output:
        #    json.dump(s.results.dict(), output, indent=4)
    time.sleep(int(SLEEP_TIME))

signal.signal(signal.SIGTERM, handler)

if __name__ == '__main__':
    SLEEP_TIME = os.environ.get('TIME')
    print('Iniciando app usando {}s entre pruebas, esperando SIGTERM'.format(SLEEP_TIME))
    while True:
        worker()
