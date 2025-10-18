# homebrew-hls

HLS形式への動画変換ツール

## インストール

```bash
brew tap kract/hls
brew install hls
```

## 使い方

### 基本的な使い方

```bash
hls input.mp4
```

これにより、`input.m3u8` と `input000.ts`、`input001.ts`... といったセグメントファイルが生成されます。

### オプション

```
使用方法: hls [オプション] 入力ファイル/ディレクトリ

オプション:
  -o, --output OUTPUT              出力するm3u8ファイル名 (デフォルト: 入力ファイル名.m3u8)
  -d, --output-dir DIR             出力先ディレクトリ (バッチ処理時)
  -b, --batch                      同一ディレクトリ内の動画ファイルを一括処理
  -r, --recursive                  サブディレクトリも再帰的に処理 (-bと併用)
  -t, --hls-time SECONDS           セグメントの長さ (秒) (デフォルト: 1)
  -p, --playlist-type TYPE         プレイリストタイプ (vod/event) (デフォルト: vod)
  -s, --segment-filename PATTERN   セグメントファイル名のパターン (例: segment%03d.ts)
  -v, --video-codec CODEC          ビデオコーデック (デフォルト: copy)
  -a, --audio-codec CODEC          オーディオコーデック (デフォルト: copy)
  -h, --help                       このヘルプを表示
```

### 使用例

#### 出力ファイル名を指定

```bash
hls -o output.m3u8 input.mp4
```

#### セグメントの長さを変更

```bash
hls -t 10 input.mp4
```

#### セグメントファイル名のパターンを指定

```bash
hls -s "segment%03d.ts" -o playlist.m3u8 input.mp4
```

#### ビデオコーデックを指定

```bash
hls -v libx264 -a aac input.mp4
```

#### すべてのオプションを組み合わせた例

```bash
hls -o output.m3u8 -t 5 -p vod -s "video%03d.ts" -v libx264 -a aac input.mp4
```

### 一括処理

#### ディレクトリ内の全動画ファイルを一括変換

```bash
hls /path/to/videos
```

ディレクトリパスを指定すると、そのディレクトリ内の動画ファイル（.mp4, .mov, .avi, .mkv, .flv, .wmv, .webm, .m4v）を自動的に検出して一括変換します。

#### サブディレクトリも含めて再帰的に処理

```bash
hls -r /path/to/videos
```

#### 出力先ディレクトリを指定

```bash
hls -d /path/to/output /path/to/videos
```

#### 一括処理でオプションを指定

```bash
hls -r -t 10 -v libx264 -a aac /path/to/videos
```

## 対応動画形式

- .mp4
- .mov
- .avi
- .mkv
- .flv
- .wmv
- .webm
- .m4v

## 必要なソフトウェア

- ffmpeg