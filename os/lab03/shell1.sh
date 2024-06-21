/usr/local/bin

echo "Enter your name: "
#Устанавливаем таймаут
read -t 10 name

if [ -z "$name" ]; then
    echo "Hello, tmpuser?"
else
    echo "Hello, $name!"
fi