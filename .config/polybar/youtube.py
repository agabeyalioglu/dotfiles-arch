import json, lz4.block

opentabs = "/home/shinobu/.mozilla/firefox/tkrp35yw.dev-edition-default/sessionstore-backups/recovery.jsonlz4"
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
            label_with_font = '%{{T8}}{label}%{{T-}}'
            label = str(title).split("- YouTube")[0]
            print(label_with_font.format(label=label))
            break
    if count == 0:
        print("")
except Exception as e:
    if e == FileNotFoundError or AttributeError:
        print("")
    else:
        print(e)
