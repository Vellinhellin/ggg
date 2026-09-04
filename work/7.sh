#!/bin/bash
echo "Введите расширение (например: .txt):"
read ext
if [ -z "$ext" ]; then
    echo "❌ Расширение не может быть пустым!"
    exit 1
fi
echo "Найденные файлы с расширением $ext:"
find . -type f -name "*$ext" | sed 's/^\.\///' || echo "Файлы не найдены"
