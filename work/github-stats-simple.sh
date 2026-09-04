#!/bin/bash
echo "╔════════════════════════════════════════╗"
echo "║  🚀 GitHub Repository Analyzer (Simple)║"
echo "╚════════════════════════════════════════╝"
if [ $# -eq 0 ]; then
    echo ""
    echo "❌ Укажите репозиторий!"
    echo "Пример: ./github-stats-simple.sh tensorflow/tensorflow"
    exit 1
fi
REPO=$1
API_URL="https://api.github.com/repos/$REPO"
echo ""
echo "📡 Запрос к GitHub API..."
RESPONSE=$(curl -s -H "User-Agent: Mozilla/5.0" "$API_URL")
if [ -z "$RESPONSE" ]; then
    echo "❌ Нет ответа от GitHub API"
    exit 1
fi
if echo "$RESPONSE" | grep -q '"message":'; then
    ERROR=$(echo "$RESPONSE" | grep -o '"message":"[^"]*"' | cut -d'"' -f4)
    echo "❌ Ошибка API: $ERROR"
    exit 1
fi
NAME=$(echo "$RESPONSE" | grep -o '"full_name":"[^"]*"' | head -1 | cut -d'"' -f4)
STARS=$(echo "$RESPONSE" | grep -o '"stargazers_count":[0-9]*' | head -1 | cut -d':' -f2)
FORKS=$(echo "$RESPONSE" | grep -o '"forks_count":[0-9]*' | head -1 | cut -d':' -f2)
ISSUES=$(echo "$RESPONSE" | grep -o '"open_issues_count":[0-9]*' | head -1 | cut -d':' -f2)
AUTHOR=$(echo "$RESPONSE" | grep -o '"login":"[^"]*"' | head -1 | cut -d'"' -f4)
if [ -z "$NAME" ]; then
    echo "❌ Не удалось получить данные о репозитории"
    exit 1
fi
format_number() { echo "$1" | sed ':a;s/\B[0-9]\{3\}\>/,&/;ta' 2>/dev/null || echo "$1"; }
echo ""
echo "📦 Репозиторий: $NAME"
echo -e "\033[33m⭐ Звёзды:       $(format_number $STARS)\033[0m"
echo -e "\033[32m🔀 Форки:        $(format_number $FORKS)\033[0m"
if [ "$ISSUES" -gt 100 ] 2>/dev/null; then
    echo -e "\033[31m🐛 Open Issues:  $(format_number $ISSUES)\033[0m"
else
    echo -e "\033[33m🐛 Open Issues:  $(format_number $ISSUES)\033[0m"
fi
echo "👤 Автор:        $AUTHOR"
echo ""
