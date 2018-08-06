import time, os, speedtest, json

SLEEP_TIME = os.environ.get('TIME')
print('Usando {}s entre pruebas'.format(SLEEP_TIME))

while True:
    s = speedtest.Speedtest()
    #s.get_servers(servers)
    s.get_best_server()
    s.download()
    s.upload()
    print(s.results.server)
    print(s.results.json(pretty=True))
    #with open('data.json', 'w') as output:
    #    json.dump(s.results.dict(), output, indent=4)
    time.sleep(int(SLEEP_TIME))
