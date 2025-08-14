#!/bin/bash
# imadzajli

echo "========================================="
echo "     Kafka setup by imadzajli"
echo "========================================="

java_required_version="17"
ram_required=4

print_decorated() {
    echo
    echo "--- $1 ---"
    echo
}

java_check() {
    if type -p java >/dev/null; then
        current_java_version=$(java -version 2>&1 | awk -F '"' '/version/ {print $2}' | cut -d'.' -f1)
        if [ "$current_java_version" -ge "$java_required_version" ]; then
            echo "Java version is $current_java_version (passed)"
        else
            echo "Java version is $current_java_version which is less then min 17 (failed)"
            exit
        fi
    else
        echo "Java is not installed (failed)"
        exit
    fi
}

check_ram() {
    existing_ram_kb=$(grep MemTotal /proc/meminfo | awk '{print $2}')
    existing_ram_gb=$((existing_ram_kb / 1024 / 1024))
    
    if [ "$existing_ram_gb" -ge "$ram_required" ]; then
        echo "System has ~ ${existing_ram_gb}GB ($existing_ram_kb KB) RAM > 4 (passed)"
    else
        echo "System has ~ ${existing_ram_gb}GB ($existing_ram_kb KB) RAM < 4 (failed)"
        exit
    fi
}

print_decorated "Checking Operating System"
if [[ "$OSTYPE" == "linux-gnu"* ]]; then

    echo "OS type : Linux (passed)"


elif [[ "$OSTYPE" == "darwin"* ]]; then

    echo "OS type : Mac (passed)"

elif [[ "$OSTYPE" == "freebsd"* ]]; then

    echo "OS type : FreeBSD (passed)"

elif [[ "$OSTYPE" == "solaris"* ]]; then

    echo "OS type : SolaOS (passed)"

else

    echo "OS type not supported (failed)"
    exit
fi

print_decorated "Checking if JAVA is installed"

java_check

check_ram

# now lets install it

if ! cd ~/Desktop/; then
    echo "NO desktop !!!! really"
    exit
fi

if ! wget "https://dlcdn.apache.org/kafka/4.0.0/kafka_2.13-4.0.0.tgz"; then
    echo "failed to get binary files (failed)"
    exit
fi

if ! tar -xzf kafka_2.13-4.0.0.tgz; then
    echo "failed to extract kafka archive (failed)"
    exit
fi
if ! rm *.tgz; then
    echo "Warning no archive file there"
fi

print_success() {
    echo -e "\n\033[1;32m"
    echo "╔══════════════════════════════════════════════╗"
    echo "║         KAFKA SETUP COMPLETED SUCCESSFULLY!  ║"
    echo "╠══════════════════════════════════════════════╣"
    echo "║                                              ║"
    echo "║  Kafka $KAFKA_VERSION is ready to use        ║"
    echo "║  Location: $(pwd)/$EXTRACTED_DIR             ║"
    echo "║                                              ║"
    echo "║  Next steps:                                 ║"
    echo "║  1. cd $EXTRACTED_DIR                        ║"
    echo "║                                              ║"
    echo "╚══════════════════════════════════════════════╝"
    echo -e "\033[0m"
}
print_success

