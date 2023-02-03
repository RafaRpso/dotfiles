import os
import random as rd
import time


def getAppPath():
    return os.popen('pwd').read().replace('\n', '')


def verifyPath(path):
    try:
        os.system(f'cd {path}')
    except:
        return 'error'


def getPath():
    path = ''
    appPwd = getAppPath()
    with open(f'{appPwd}/logs.txt', 'r') as f:
        path = f.read()
        if (path == ''):
            valid = False
            while (not valid):
                print("Insira o caminho da pasta de wallpapers")
                path = input()
                condition = verifyPath(path)
                if (condition == 'error'):
                    print("Caminho não existe. Insira um válido")
                else:
                    valid = True
        else:
            condition = verifyPath(path)
            if (condition == 'error'):
                with open('logs.txt', 'w') as f:
                    f.write('')
                print("ERRO 500: Pasta inválida nos arquivos logs.txt ")
                exit()
            return path

    if (path != ''):
        with open(f'{appPwd}/logs.txt', 'w') as f:
            f.write(path)
            return path
    else:
        print("Insira o caminho correto")


def getWallpapersName():
    path = getPath()
    wallpapers = os.popen(f'cd {path} && ls').read().split('\n')
    return wallpapers


def getRandomNumber(lenNumber):
    return rd.randint(0, lenNumber)


def defineWallpaper():
    path = getPath()
    wallpapers = getWallpapersName()
    rand = getRandomNumber(len(wallpapers)-1)
    command = f'feh {path}/{wallpapers[rand]} --bg-fill'
    os.system(command)
    setHistory(wallpapers[rand])
    time.sleep(0.5)
    changeConfigI3(command, wallpapers[rand])


def setHistory(item):
    with open('history.txt', 'a') as f:
        f.write(f'{item}\n')


def changeConfigI3(command, item):
    f = ''
    history = ''
    with open('history.txt', 'r') as h:
        history = h.read()
    history = history.split('\n')
    history = history[len(history)-3]

    with open(os.path.expanduser('~/.config/i3/config'), 'r') as config:
        f = config.read()
        f = f.replace(history, item)
        print('passado: ' + history)
        print('presente: ' + item)

    with open(os.path.expanduser('~/.config/i3/config'), 'w') as confwrite:
        confwrite.write(f)
        print('done ! ')
        time.sleep(0.5)


defineWallpaper()
