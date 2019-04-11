import json, lz4.block

opentabs = "/home/agabey/.mozilla/firefox/0u3ehhwa.dev-edition-default/sessionstore-backups/recovery.jsonlz4"
try:
    f = open(opentabs, "rb")
    magic = f.read(8)
    jdata = json.loads(lz4.block.decompress(f.read()).decode("utf-8"))

    f.close()

    tabs = jdata.get("windows")[0].get("tabs")
    count = 0
    for tab in tabs:
        title = tab.get("entries")[tab.get("index") - 1].get("title")
        if "- YouTube" in title:
            count += 1
            print(str(title).split("- YouTube")[0])
            break
    if count == 0:
        print("")
except Exception as e:
    if e == FileNotFoundError or AttributeError:
        print("")
    else:
        print(e)
