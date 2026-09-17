FROM alpine:latest

# Install LibreOffice, font dependencies and extraction tool
RUN apk add --no-cache \
    libreoffice \
    fontconfig \
    msttcorefonts-installer \
    font-noto \
    font-noto-cjk \
    font-roboto \
    font-liberation \
    wget \
    cabextract

# Install basic MS fonts (Arial, Times New Roman, etc.)
RUN update-ms-fonts

# Retrieval of proprietary fonts (Calibri, Cambria...) via PowerPoint Viewer
# Please read: https://wiki.debian.org/ppviewerFonts
RUN mkdir -p /usr/share/fonts/ppviewer/ && \
    cd /tmp && \
    wget https://archive.org/download/PowerPointViewer_201801/PowerPointViewer.exe && \
    cabextract PowerPointViewer.exe -F ppviewer.cab && \
    cabextract ppviewer.cab -F '*.TTC' -d /usr/share/fonts/ppviewer/ && \
    cabextract ppviewer.cab -F '*.TTF' -d /usr/share/fonts/ppviewer/ && \
    rm PowerPointViewer.exe ppviewer.cab && \
    fc-cache -f -v # Update font cache for immediate use

