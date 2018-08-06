import time, os, speedtest, json

SLEEP_TIME = os.environ.get('TIME')

while True:
    time.sleep(int(SLEEP_TIME))
    s = speedtest.Speedtest()
    #s.get_servers(servers)
    s.get_best_server()
    s.download()
    s.upload()
    print(s.results.json())
    #with open('data.json', 'w') as output:
    #    json.dump(s.results.dict(), output, indent=4)
