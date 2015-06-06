## pdfiumdraw による EMF 出力の検証

TeX2img 付属ツール「pdfiumdraw」を使って、PDF から EMF を出力するテスト。

元ソース：xymtexpdf-input.tex（TikZ に依存して化学構造式を描画する XyMTeX ソース）を使って入力用 PDF を作成。
- xymtexpdf-input-crop.pdf：余白を 5 bp にセットしてクロップしたもの（テキスト保持）
- xymtexpdf-input-outlined.pdf：余白を 5 bp にセットしてアウトライン化したもの

現行の TeX2img の EMF 出力スキームは「gs による PDF のアウトライン化→pdfiumdraw」を通っている。

テキスト保持 PDF から pdfiumdraw で変換（EMF/PNG を出力；PNG は比較のため）：
- pdfiumdraw-crop-emf.emf（これを見やすいように PNG 化したのが pdfiumdraw-crop-emf.png）
- pdfiumdraw-crop-png.png

アウトライン化した PDF から pdfiumdraw で変換（EMF/PNG を出力；比較のため）：
- pdfiumdraw-outlined-emf.emf（これを見やすいように PNG 化したのが pdfiumdraw-outlined-emf.png）
- pdfiumdraw-outlined-png.png

参考のため、Inkscape を使って同じ PDF から EMF に変換してみたものも置いておく：
- inkscape-crop-emf.emf（これを見やすいように PNG 化したのが inkscape-crop-emf.png）
- inkscape-outlined-emf.emf（これを見やすいように PNG 化したのが inkscape-outlined-emf.png）
