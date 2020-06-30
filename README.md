# Example Conan Project
This is a very basic project to demonstrate how to use conan for dependency management.

Conan has many more capabilities than what are demonstrated here.  This is just a peek at one of the core features that are needed in any modern software development eco system -- dependency management.

For more information, see the official [Conan website](https://conan.io/)

## Building with Docker
There is a Dockerfile which when built will provide an image that can be used to build the example project.

The easiest way to try this out is to run the sample script:
`./run_build_in_docker.sh`

## Without Docker
If you would like to try this out without using docker, then you will need to install a few dependencies for your system.

The example uses gcc 9 but should work with gcc 4.8+.
CMake 3.13.4 is the minimum required version.
Conan is needed and requires Python.

For specific guidance, refer to the [Dockerfile](./docker/Dockerfile)

## Configure conan
This project uses the boost_date_time library from [boost](https://www.boost.org/) to demonstrate the conan package management.  This library has been repacked for conan by the [bincrafters](https://bincrafters.github.io/) group.

The following commands setup the bincrafters conan repo and configure the conan default profile to use C++11 ABI.

```
conan remote add bincrafters https://api.bintray.com/conan/bincrafters/public-conan

conan profile new default --detect

conan profile update settings.compiler.libcxx=libstdc++11 default
```

## Get dependencies and prep build
The following command uses conan and the [conanfile.txt](./conanfile.txt) in order to install the necessary project dependencies before building.

This will download the dependent packages from the [conanfile.txt](./conanfile.txt) as well as any transitive dependencies, while building what can't be installed as a matching binary package.

`conan install . -if build --build=missing`

## Build the project
This project uses [CMake](https://cmake.org/) as the build system.  The first command uses CMake to auto-generate the necessary makefiles to configure the build while writing them out to a separate *build* directory.

`cmake -B build`

Then CMake is used to actually build the project.

`cmake --build build`

## Run the example project
If everything worked up until now, you should be able to run the example project.  From the main directory run:

`./build/bin/conan_boost`

The expected output of this example project is the following:

>2001-Oct-09  
>2001-10-09  
>Tuesday October 9, 2001  
>An expected exception is next:  
>  Exception: Month number is out of range 1..12  
>  
