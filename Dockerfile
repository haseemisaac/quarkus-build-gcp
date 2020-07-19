FROM google/cloud-sdk:300.0.0
LABEL maintainer="haseemisaac@gmail.com"

ARG GRAALVM_PACKAGENAME=graalvm-ce-java11-linux-amd64-20.1.0.tar.gz
ENV GRAALVM_PACKAGENAME=$GRAALVM_PACKAGENAME
ARG GRAALVM_HOME=graalvm-ce-java11-20.1.0
ENV GRAALVM_HOME=$GRAALVM_HOME

# -y adds yes confirmation
# -qq adds super duper quiet mode

#Install GraalVM
RUN apt-get update; apt-get -y install apt-utils gcc zlib1g-dev build-essential unzip wget; \
    wget https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-20.1.0/${GRAALVM_PACKAGENAME}; \
    tar xvzf ${GRAALVM_PACKAGENAME}; \
    ${GRAALVM_HOME}/bin/gu install native-image; \
    apt-get clean