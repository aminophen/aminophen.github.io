## BoundingBox に対する正しい理解

BoundingBox について正しく理解するために、いくつかのテスト用 PDF を作成した。

（注意：この項目は整理中）

### サブブログ「BoundingBox がとにかくややこしい話」で作成した PDF

当該記事 [(1)](http://d.hatena.ne.jp/acetaminophen/20150716/1437021212), [(2)](http://d.hatena.ne.jp/acetaminophen/20150717/1437112430) を参照。
なお、いずれも MediaBox をほかの ﾅﾝﾄｶBox がはみ出す不正がある。
ちなみに、test-1.pdf は後で取り上げる Preview-02.pdf と同一である。

- test-1.pdf
~~~~
    /MediaBox  [100 100 1100 1100]
    /CropBox   [403 403 1403 1403]
    /BleedBox  [302 302 1302 1302]
    /TrimBox   [504 504 1504 1504]
    /ArtBox    [201 201 1201 1201]
~~~~
- test-2.pdf
~~~~
    /MediaBox  [504 504 1504 1504]
    /CropBox   [201 201 1201 1201]
    /BleedBox  [302 302 1302 1302]
    /TrimBox   [100 100 1100 1100]
    /ArtBox    [403 403 1403 1403]
~~~~

### メインブログ「LaTeX で PDF の一部だけ表示したい」で用意した PDF

執筆予定の記事。

#### 描画ツール等で作成した PDF たち

- Illustrator.pdf：
Illustrator で保存した直後。
裁ち落としを0にして保存したため /MediaBox と /BleedBox と /TrimBox は一致した状態で明示されている。
/ArtBox が描画部分だけを囲んでいて、/CropBox は明示なし。

- Preview.pdf：
Illustrator.pdf を Preview.app でクロップしたもの。
/CropBox が指定部分だけを囲むように追加で明示され、ほかの Box は元のものを維持している。

#### 実際に解析に利用する PDF たち

- Illustrator-01.pdf：
Illustrator.pdf を qpdf --qdf と fix-qdf で圧縮解除しただけ（したがって全く等価）。
/MediaBox, /BleedBox, /TrimBox はページ全体。
/ArtBox が描画部分だけを囲み、/CropBox は明示なし。
~~~~
    /MediaBox  [  0.00     0.00   699.00   698.67]
    /BleedBox  [  0.00     0.00   699.00   698.67]
    /TrimBox   [  0.00     0.00   699.00   698.67]
    /ArtBox    [400.83   493.58   665.83   663.08]
~~~~

- Illustrator-02.pdf：
Illustrator-01.pdf から QPDF で ﾅﾝﾄｶBox を好き勝手にいじったもの。
/MediaBox をほかの ﾅﾝﾄｶBox がはみ出す不正な状態。
~~~~
    /MediaBox  [100 100 1100 1100]
    /BleedBox  [302 302 1302 1302]
    /TrimBox   [504 504 1504 1504]
    /ArtBox    [201 201 1201 1201]
~~~~

- Illustrator-03.pdf：
Illustrator-02.pdf から /ArtBox だけ削除。
~~~~
    /MediaBox  [100 100 1100 1100]
    /BleedBox  [302 302 1302 1302]
    /TrimBox   [504 504 1504 1504]
~~~~

- Illustrator-04.pdf：
Illustrator-03.pdf から /TrimBox だけ削除。
~~~~
    /MediaBox  [100 100 1100 1100]
    /BleedBox  [302 302 1302 1302]
~~~~

- Illustrator-05.pdf：
Illustrator-04.pdf から /BleedBox だけ削除。
~~~~
    /MediaBox  [100 100 1100 1100]
~~~~

- Preview-01.pdf：
Preview.pdf を qpdf --qdf と fix-qdf で圧縮解除しただけ（したがって全く等価）
~~~~
    /MediaBox  [  0.00     0.00   699.00   698.67]
    /CropBox   [359.69   393.10   676.18   677.40]
    /BleedBox  [  0.00     0.00   699.00   698.67]
    /TrimBox   [  0.00     0.00   699.00   698.67]
    /ArtBox    [400.83   493.58   665.83   663.08]
~~~~

- Preview-02.pdf：
Preview-01.pdf から QPDF で ﾅﾝﾄｶBox を好き勝手にいじったもの。
/MediaBox をほかの ﾅﾝﾄｶBox がはみ出す不正な状態。
~~~~
    /MediaBox  [100 100 1100 1100]
    /CropBox   [403 403 1403 1403]
    /BleedBox  [302 302 1302 1302]
    /TrimBox   [504 504 1504 1504]
    /ArtBox    [201 201 1201 1201]
~~~~
