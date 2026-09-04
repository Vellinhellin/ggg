Сдвинуть вверх лог выполненных ранее команд

**Crtl-L**

или с очисткой всего лога

```shell
clear
```
![alt text](/ggg/Zadacha/Primeri/img/clear.png)

Сбросить настройки терминала и очищает экран
```shell
reset
```
![alt text](/ggg/Zadacha/Primeri/img/reset.png)

```shell
history
```
![alt text](/ggg/Zadacha/Primeri/img/history.png)

Выполнить нужную коману из списка **History**
```shell
!35
```
![alt text](/ggg/Zadacha/Primeri/img/35.png)

где **35**  - это № команды из списка

Выполнить предыдущую команду
```shell
!!
```
![alt text](/ggg/Zadacha/Primeri/img/36.png)

Автодополнение команд выполнятся по `TAB`

Прервать выполнение запущенной команды

`Ctrl+C`

### Файловые операции

Показать путь текущей директории
```shell
pwd
```
![alt text](/ggg/Zadacha/Primeri/img/pwd.png)

Показать содержимое текущего каталога
```shell
ls
```
![alt text](/ggg/Zadacha/Primeri/img/ls.png)

Показать содержимое указанного каталога
```shell
ls shop
```
![alt text](/ggg/Zadacha/Primeri/img/ls_shop.png)

Показать подробное содержимое текущего каталога
```shell
ll
```
или
```shell
ls --all
```
![alt text](/ggg/Zadacha/Primeri/img/ll.png)

Показать подробное содержимое указанного каталога
```shell
ll dir_name
```
![alt text](/ggg/Zadacha/Primeri/img/ll_shop.png)

Показать содержимое в виде дерева
```shell
tree
```
![alt text](/ggg/Zadacha/Primeri/img/tree.png)

Вернуться в домашний каталог текущего пользователя
```shell
cd ~
```
![alt text](/ggg/Zadacha/Primeri/img/cd1.png)

Вернуться в предыдущую папку
```shell
cd -
```
![alt text](/ggg/Zadacha/Primeri/img/cd2.png)

**/** - знак корня директории

**~** - знак домашнего каталога пользователя

Зайти в нужный каталог
```shell
cd dir_name
```
![alt text](/ggg/Zadacha/Primeri/img/cd3.png)

где `dir_name` - это имя нужного вам каталога

Выйти из текущего каталога на 1 шаг вверх
```shell
cd ..
```
![alt text](/ggg/Zadacha/Primeri/img/cd4.png)

Выйти из текущего каталога на 2 шага вверх
```shell
cd ../..
```
![alt text](/ggg/Zadacha/Primeri/img/cd5.png)

### Linux

Показать версию Linux
```shell
lsb_release -a
```
![alt text](/ggg/Zadacha/Primeri/img/lsb_realise.png)

Показать красивую ин-фу по системе
```shell
neofetch
```
![alt text](/ggg/Zadacha/Primeri/img/neofetch.png)

Показать подробную ин-фу по системе
```shell
inxi -F
```
![alt text](/ggg/Zadacha/Primeri/img/inxi.png)

Показать ин-фу о текущем пользователе
```shell
w
```
![alt text](/ggg/Zadacha/Primeri/img/w.png)

или
```shell
id
```
![alt text](/ggg/Zadacha/Primeri/img/id.png)

Показать время
```shell
date
```

![alt text](/ggg/Zadacha/Primeri/img/date.png)