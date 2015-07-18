## pdfiumdraw による EMF 出力の検証

TeX2img 付属ツール「pdfiumdraw」を使って、PDF から EMF を出力するテスト。

元ソース：xymtexpdf-input.tex（TikZ に依存して化学構造式を描画する XyMTeX ソース）を使って入力用 PDF を作成。
- xymtexpdf-input-crop.pdf：余白を 5 bp にセットしてクロップしたもの（テキスト保持）
- xymtexpdf-input-outlined.pdf：余白を 5 bp にセットしてアウトライン化したもの

### pdfiumdraw による EMF 出力と PNG 出力の比較

現行の TeX2img 1.5.3 の EMF 出力スキームは「gs による PDF のアウトライン化→pdfiumdraw」を通っている。

(1) テキスト保持 PDF から pdfiumdraw で変換（EMF/PNG を出力；PNG は比較のため）：
- pdfiumdraw-crop-emf.emf（これを見やすいように PNG 化したのが pdfiumdraw-crop-emf.png）
- pdfiumdraw-crop-png.png
- pdfiumdraw-crop-usegdi-png.png（--use-gdi オプションを追加）

(2) アウトライン化した PDF から pdfiumdraw で変換（EMF/PNG を出力；PNG は比較のため）：
- pdfiumdraw-outlined-emf.emf（これを見やすいように PNG 化したのが pdfiumdraw-outlined-emf.png）
- pdfiumdraw-outlined-png.png
- pdfiumdraw-outlined-usegdi-png.png（--use-gdi オプションを追加）

見比べると、EMF 出力の際に限ってわかること：
- すべての破線が消滅している
- さらに、アウトライン化 PDF からの変換では一部の文字が抜け落ちている（逆に PNG 出力ならテキスト保持 PDF からの変換ですべての文字が消滅する）

### （参考）Inkscape による EMF 出力

(3) 比較のため、Inkscape を使って同じ PDF から EMF に変換してみたものも置いておく：
- inkscape-crop-emf.emf（これを見やすいように PNG 化したのが inkscape-crop-emf.png）
- inkscape-outlined-emf.emf（これを見やすいように PNG 化したのが inkscape-outlined-emf.png）

これらの Inkscape による EMF 出力をみると：
- テキスト保持 PDF からの変換は、Inkscape ではフォントが変わってしまう（Computer Modern がシステムにないため）
- アウトライン化 PDF からの変換では、Inkscape でも破線が描画されない

### （追加：2015-06-08）Inkscape でパスを変形してから pdfiumdraw で変換

先ほどのアウトライン化 PDF「xymtexpdf-input-outlined.pdf」をいったん Inkscape で開き、手動で破線部分のパスを変形してみた。
+ Inkscape で開いたら「グループ解除」
+ 破線（いまはノードが両端の2点だけ）のパスを選択
+ メニューの「エクステンション→パスの変形→破線に変換」を順にクリック
+ 破線の各部品ごとにノードが生成していることを確認し、PDF で保存「xymtexpdf-input-outlined-dashed.pdf」

(4) 手動で改変したアウトライン化 PDF から pdfiumdraw で変換（EMF/PNG を出力；PNG は比較のため）
- pdfiumdraw-outlined-dashed-emf.emf（これを見やすいように PNG 化したのが pdfiumdraw-outlined-dashed-emf.png）
- pdfiumdraw-outlined-dashed-png.png

今回は、通常どおりの変換すると、文字が消えることもなく、かつ破線が PDF の場合と同じく正しく表示された！
- 図中のすべての破線を改変せずとも、どれか一つだけ改変すれば「文字が消える」という現象は回避。
- ただし、破線は一つ一つ「パスの変形」を行わないと正常に表示されない。
