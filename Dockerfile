FROM archlinux:latest

RUN pacman -Syu --needed --noconfirm sed
RUN pacman -Syu --noconfirm git
RUN pacman -Syu --noconfirm zsh

WORKDIR /

COPY . /jasticzsh/