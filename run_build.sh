#!/bin/bash

script_dir="$(dirname "$(readlink -f "$0")")"

export CONAN_USER_HOME=${script_dir}

# Setup conan remote for bincrafters repo
conan remote add bincrafters https://api.bintray.com/conan/bincrafters/public-conan

# Configure the default conan profile to use C++11 ABI
conan profile new default --detect
conan profile update settings.compiler.libcxx=libstdc++11 default

# Install the project dependencies
conan install ${script_dir} -if build --build=missing

curdir=${pwd}
cd ${script_dir}

# Generate cmake files
cmake -B build

# Build the project
cmake --build build

# Run the test program
./build/bin/conan_boost

cd ${curdir}
