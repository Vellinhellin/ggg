#!/bin/bash
echo "Введите название проекта:"
read project_name
if [ -z "$project_name" ]; then
    echo "❌ Ошибка: Название не может быть пустым!"
    exit 1
fi
mkdir -p "$project_name/css" "$project_name/js"
cat > "$project_name/index.html" << HTML
<!DOCTYPE html>
<html lang="ru">
<head><meta charset="UTF-8"><title>$project_name</title>
<link rel="stylesheet" href="css/style.css"></head>
<body><h1>$project_name</h1><script src="js/script.js"></script></body>
</html>
HTML
cat > "$project_name/css/style.css" << CSS
body { font-family: Arial; text-align: center; padding: 50px; }
CSS
cat > "$project_name/js/script.js" << JS
console.log("Привет!");
JS
echo "✅ Проект '$project_name' создан!"
