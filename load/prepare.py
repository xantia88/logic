import sys

total = int(sys.argv[1])
for i in range(total):
    id = "integration{}".format(i+10)
    print("\n")
    print("% Load test {}".format(id))
    print("% -------------------------------------------")
    print("integration({}).".format(id))
    print("description(integration({}), \"this is integration1 description\").".format(id))
    print("source(integration({}), system(system1)).".format(id))
    print("destination(integration({}), system(system2)).".format(id))
    print("transmit(integration({}), data(data1)).".format(id))
    print("transmit(integration({}), data(data2)).".format(id))
    print("technology(integration({}), \"FILE\").".format(id))
    print("mode(integration({}), \"По расписанию\").".format(id))
    print("load(integration({}), max(\"100 rps\"), avg(\"10 rps\")).".format(id))
    print("asynch(integration({})).".format(id))
    print("status(integration({}), \"Используется\").".format(id))
    print("security(integration({}), \"SSL\").".format(id))
 
