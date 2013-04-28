with version stable 3.02
with info    last 20121031
with base    tesseract-ocr
with trait   data
with role    graphic/scan
with source  stable http://tesseract-ocr.googlecode.com/files/tesseract-ocr-$VERSION.por.tar.gz
with info    home http://code.google.com/p/tesseract-ocr
with info    vurl http://code.google.com/p/tesseract-ocr/downloads/list
with info    cite 'Portuguese language data files for tesseract-ocr'

build(){
 mkdir  -pvm 755 "$DESTDIR"/usr/share/tessdata/
 find * -type f -name \*\.traineddata |
 xargs install -vm 644 "$DESTDIR"/usr/share/tessdata/
}
