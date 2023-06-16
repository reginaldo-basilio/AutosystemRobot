import os

# Diretório onde os arquivos são criados
diretorio = "C:\Users\reginaldo.cunha\Desktop\Arquivos Reginaldo\Projeto automacao\AutosystemRobot"

# Remover o arquivo "Sikuli Java Stderr"
caminho_stderr = os.path.join(diretorio, "Sikuli Java Stderr")
if os.path.isfile(caminho_stderr):
    os.remove(caminho_stderr)

# Remover o arquivo "Sikuli Java Stdout"
caminho_stdout = os.path.join(diretorio, "Sikuli Java Stdout")
if os.path.isfile(caminho_stdout):
    os.remove(caminho_stdout)