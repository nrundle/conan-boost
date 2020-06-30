FROM centos:7

# Install prerequisites
RUN yum install -y \
    centos-release-scl && \
    yum install -y \
    devtoolset-9-gcc-c++ \
    make \
    python3 && \
    yum clean all

RUN cd /root && \
    curl -L -O https://github.com/Kitware/CMake/releases/download/v3.17.3/cmake-3.17.3-Linux-x86_64.tar.gz && \
    tar -C /opt -xf cmake-3.17.3-Linux-x86_64.tar.gz && \
    rm -f cmake-3.17.3-Linux-x86_64.tar.gz

# Install conan
RUN pip3 install conan

# Add cmake to the default path
RUN echo "pathmunge /opt/cmake-3.17.3-Linux-x86_64/bin" >> /etc/profile.d/sh.local

# Setup default entrypoint to enable devtoolset-9
ENTRYPOINT ["scl", "enable", "devtoolset-9", "--"]
CMD ["bash"]
