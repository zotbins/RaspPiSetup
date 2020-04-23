import json

def getInputs():
    binID = input('binID:')
    weightCal = input('weightCal:')
    tippersurl = input('tippersurl:')
    collectWeight = input('collectWeight ID (the sensor ID):')
    collectDistance = input('collectDistance ID (the sensor ID):')
    email = input('Host Email (the email address you want to send from):')
    pass1 = input('Pass:')
    target1 = input('Target1 (the email you want to send notifcations of):')
    target2 = input('Target2: (the email you want to send notifcations of)')

    data = {'bin':[{'binID': binID,'weightCal':weightCal, 'tippersurl':tippersurl, 'collectWeight':collectWeight, 'collectDistance':collectDistance},
                   {'ultra':3, 'weight':5, 'tippers':3}],
            'user':[{'email':email, 'pass':pass1, 'target':[target1, target2]}]}

    with open('binData.json', 'w') as outfile:
        json.dump(data, outfile, indent = 4)


if __name__ == '__main__':
    getInputs()
