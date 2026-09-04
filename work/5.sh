#!/bin/bash
echo "Введите путь к файлу:"
read file_path
if [ -f "$file_path" ]; then
    lines=$(wc -l < "$file_path")
    echo "Файл $file_path содержит $lines строк"
else
    echo "❌ Файл не найден!"
fi
