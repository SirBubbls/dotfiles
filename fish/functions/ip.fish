function ip
    printf "IP Information:\n"
    printf "Public IP:\t"
    curl https://ipinfo.io/ip
    
end
