#!/usr/bin/env fish
function fish_greeting
    # Проверяем, передан ли аргумент
    echo "Аргумент передан: $argv[1]"
    if test (count $argv) -eq 0
        echo "Пожалуйста, передайте многострочную переменную."
        return
    end

    # Получаем многострочную переменную из аргумента
    set var $argv[1]
    echo "Переменная: $var"

    # Разбиваем переменную на строки и находим максимальную длину
    set max_length 0
    for line in (string split "\n" $var)
        echo "Строка: $line"
        set line_length (string length $line)
        echo "Длина строки: $line_length"
        if test $line_length -gt $max_length
            set max_length $line_length
            echo "Максимальная длина: $max_length"
        end
    end

    # Получаем ширину терминала
    set terminal_width (tput cols)
    echo "Ширина терминала: $terminal_width"

    # Проверяем, достаточно ли ширины терминала
    if test $max_length -le $terminal_width
        echo "Достаточно места для отображения:"
        for line in (string split "\n" $var)
            echo $line
        end
    else
        echo "Недостаточно места для отображения. Максимальная длина строки: $max_length, ширина терминала: $terminal_width."
    end
end
