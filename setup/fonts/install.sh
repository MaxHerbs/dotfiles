BASE_URL="https://www.nerdfonts.com/font-downloads"
DOWNLOAD_DIR="/tmp/nerdfonts_downloads"

mkdir -p "$DOWNLOAD_DIR"
HTML_CONTENT=$(curl -s $BASE_URL)
FONT_LINKS=$(echo "$HTML_CONTENT" | grep -Eo 'https://github.com/ryanoasis/nerd-fonts/releases/download/[^"]+\.zip' | head -n 20)

Download each font into the specified directory
for link in $FONT_LINKS; do
  font_name=$(basename $link)
  curl -L -o "$DOWNLOAD_DIR/$font_name" "$link"
  echo "Downloaded $font_name to $DOWNLOAD_DIR"
done

for file in "$DOWNLOAD_DIR"/*; do
  unzip -o ${file} -d ~/.fonts
done
