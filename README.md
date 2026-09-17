# Docker LibreOffice Alpine

An Alpine Linux image with LibreOffice and a broad set of fonts for headless document conversion and rendering.

## Build

```sh
docker build -t libreoffice-alpine .
```

The build downloads PowerPoint Viewer font files, so network access is required. The resulting image includes Microsoft core fonts, PowerPoint Viewer fonts, Noto, Roboto, and Liberation fonts.

## Usage

Mount a working directory and invoke LibreOffice directly:

```sh
docker run --rm \
	--volume "$PWD:/work" \
	libreoffice-alpine \
	libreoffice --headless --convert-to pdf --outdir /work /work/input.docx
```

The image does not expose a port or define an entrypoint. Supply input and output files through a bind mount or another Docker volume.

## License

The files in this repository are licensed under the GNU General Public License v3.0.

The Dockerfile downloads third-party fonts from Microsoft and other fonts when the image is built. 
These fonts are not covered by this repository's GPL license; their respective license terms apply. 

