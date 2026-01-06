FROM ubuntu:24.04@sha256:c35e29c9450151419d9448b0fd75374fec4fff364a27f176fb458d472dfc9e54

RUN apt-get update \

    # Upgrade
    && apt-get upgrade -y \
    && apt-get dist-upgrade -y \

    # Install dependencies
    && apt-get install wget -y \

    # Cleanup
    && apt-get purge -y \
    && apt-get autoremove -y \
    && apt-get autoclean -y

RUN wget https://mega.nz/linux/repo/xUbuntu_24.04/arm64/megacmd-xUbuntu_24.04_arm64.deb \
    && apt install "$PWD/megacmd-xUbuntu_24.04_arm64.deb" -y \
    && rm "$PWD/megacmd-xUbuntu_24.04_arm64.deb"

RUN groupadd -r megacmd \
    && useradd -r -g megacmd -m -s /bin/bash megacmd

USER megacmd
WORKDIR /home/megacmd
