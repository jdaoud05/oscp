fullscan() {
    for ip in "$@"; do
        local name=$(echo $ip | awk -F. '{print $4}')
        mkdir -p scans
        sudo rustscan -a $ip -g --ulimit 5000 > scans/${name}-allports
        local ports=$(grep -oP '\[\K[0-9,]+' scans/${name}-allports)
	if [ -z "$ports" ]; then
            echo "[!] No open ports on $ip"
            continue
        fi
        echo "[+] $ip open ports: $ports"
	sudo nmap -p $ports -sCV -Pn -oN scans/${name}-services $ip
    done
}
