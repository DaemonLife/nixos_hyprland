function fish_greeting
    # Проверяем, передан ли аргумент
    if test (count $argv) -eq 0
        echo "Пожалуйста, передайте многострочную переменную."
        return
    end

    # Получаем многострочную переменную из аргумента
    set var $argv[1]

    # Разбиваем переменную на строки и находим максимальную длину
    set max_length 0
    for line in (string split "\n" $var)
        set line_length (string length $line)
        if test $line_length -gt $max_length
            set max_length $line_length
        end
    end

    # Получаем ширину терминала
    set terminal_width (tput cols)

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
