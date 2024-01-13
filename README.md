# i386環境でも動作するMariaDBのDockerイメージ
公式リポジトリに、i386環境で動作するMariaDBのイメージがなかったので、アーキテクチャによらないクリーンインストール用のDockerfileを作成しました。
Debianをベースイメージとして使用、Debianの公式リポジトリより、MariaDBをインストールします。
## ホスト機に必要な準備
- Debian bookworm以降
- Docker
- Docker-Compose
## 使用方法
+ Docker-Composeを使った、簡単なサンプルを/sampleフォルダ内に用意したので、参考にしてください。
