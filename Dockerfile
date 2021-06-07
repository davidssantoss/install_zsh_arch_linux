FROM archlinux:latest

RUN pacman -Syyu --noconfirm \
    && pacman -Syu --needed --noconfirm base-devel
RUN pacman -Syu --noconfirm git
RUN pacman -Syu --noconfirm zsh

WORKDIR /

COPY . /jastichzsh/