<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "a18b53f05c5e2fb42ebd98fcc82fcd18",
  "translation_date": "2025-09-09T17:51:00+00:00",
  "source_file": "resources/faq.md",
  "language_code": "ja"
}
-->
# よくある質問 (FAQ)

## はじめに

この包括的なFAQは、Azure Developer CLI (azd) と Azure デプロイに関する最も一般的な質問への回答を提供します。よくある問題への迅速な解決策を見つけ、ベストプラクティスを理解し、azd の概念やワークフローについての明確な説明を得ることができます。

## 学習目標

このFAQを確認することで、以下を達成できます:
- Azure Developer CLI に関する一般的な質問や問題への迅速な回答を見つける
- 実践的なQ&A形式で重要な概念や用語を理解する
- よくある問題やエラーシナリオに対するトラブルシューティングの解決策にアクセスする
- 最適化に関するよくある質問を通じてベストプラクティスを学ぶ
- 専門的な質問を通じて高度な機能や能力を発見する
- コスト、セキュリティ、デプロイ戦略に関するガイダンスを効率的に参照する

## 学習成果

このFAQを定期的に参照することで、以下が可能になります:
- 提供された解決策を使用して、Azure Developer CLI の一般的な問題を独力で解決する
- デプロイ戦略や構成に関する情報に基づいた意思決定を行う
- azd と他の Azure ツールやサービスとの関係を理解する
- コミュニティの経験や専門家の推奨事項に基づいたベストプラクティスを適用する
- 認証、デプロイ、構成の問題を効果的にトラブルシューティングする
- FAQ の洞察や推奨事項を活用してコストとパフォーマンスを最適化する

## 目次

- [はじめに](../../../resources)
- [認証とアクセス](../../../resources)
- [テンプレートとプロジェクト](../../../resources)
- [デプロイとインフラストラクチャ](../../../resources)
- [構成と環境](../../../resources)
- [トラブルシューティング](../../../resources)
- [コストと請求](../../../resources)
- [ベストプラクティス](../../../resources)
- [高度なトピック](../../../resources)

---

## はじめに

### Q: Azure Developer CLI (azd) とは何ですか？
**A**: Azure Developer CLI (azd) は、ローカル開発環境から Azure へのアプリケーション移行を迅速化する開発者向けのコマンドラインツールです。テンプレートを通じてベストプラクティスを提供し、デプロイライフサイクル全体を支援します。

### Q: azd は Azure CLI とどう違いますか？
**A**: 
- **Azure CLI**: Azure リソース管理のための汎用ツール
- **azd**: アプリケーションデプロイワークフローに特化した開発者向けツール
- azd は内部的に Azure CLI を使用しますが、一般的な開発シナリオ向けに高レベルの抽象化を提供します
- azd はテンプレート、環境管理、デプロイ自動化を含みます

### Q: azd を使用するには Azure CLI をインストールする必要がありますか？
**A**: はい、azd は認証や一部の操作に Azure CLI を必要とします。まず Azure CLI をインストールし、その後 azd をインストールしてください。

### Q: azd はどのプログラミング言語をサポートしていますか？
**A**: azd は言語に依存しません。以下の言語で動作します:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- 静的ウェブサイト
- コンテナ化されたアプリケーション

### Q: 既存のプロジェクトで azd を使用できますか？
**A**: はい！以下の方法で使用できます:
1. `azd init` を使用して既存のプロジェクトに azd の構成を追加する
2. 既存のプロジェクトを azd テンプレート構造に適合させる
3. 既存のアーキテクチャに基づいてカスタムテンプレートを作成する

---

## 認証とアクセス

### Q: azd を使用して Azure に認証するにはどうすればよいですか？
**A**: `azd auth login` を使用すると、ブラウザウィンドウが開き、Azure 認証が行われます。CI/CD シナリオでは、サービスプリンシパルやマネージドIDを使用してください。

### Q: azd を複数の Azure サブスクリプションで使用できますか？
**A**: はい。`azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` を使用して、各環境で使用するサブスクリプションを指定できます。

### Q: azd でデプロイするにはどのような権限が必要ですか？
**A**: 通常必要な権限は以下の通りです:
- リソースグループまたはサブスクリプションの **Contributor** ロール
- ロール割り当てが必要なリソースをデプロイする場合は **User Access Administrator**
- テンプレートやデプロイするリソースによって具体的な権限は異なります

### Q: azd を CI/CD パイプラインで使用できますか？
**A**: もちろんです！azd は CI/CD 統合を念頭に設計されています。認証にはサービスプリンシパルを使用し、構成には環境変数を設定してください。

### Q: GitHub Actions で認証を処理するにはどうすればよいですか？
**A**: Azure Login アクションをサービスプリンシパルの資格情報とともに使用してください:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## テンプレートとプロジェクト

### Q: azd テンプレートはどこで見つけられますか？
**A**: 
- 公式テンプレート: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- コミュニティテンプレート: GitHub で "azd-template" を検索
- `azd template list` を使用して利用可能なテンプレートを閲覧

### Q: カスタムテンプレートを作成するにはどうすればよいですか？
**A**: 
1. 既存のテンプレート構造を基に開始
2. `azure.yaml`、インフラストラクチャファイル、アプリケーションコードを修正
3. `azd up` を使用して徹底的にテスト
4. 適切なタグを付けて GitHub に公開

### Q: テンプレートなしで azd を使用できますか？
**A**: はい、既存のプロジェクトで `azd init` を使用して必要な構成ファイルを作成できます。`azure.yaml` やインフラストラクチャファイルを手動で構成する必要があります。

### Q: 公式テンプレートとコミュニティテンプレートの違いは何ですか？
**A**: 
- **公式テンプレート**: Microsoft によって管理され、定期的に更新され、包括的なドキュメントが付属
- **コミュニティテンプレート**: 開発者によって作成され、特定のユースケースに特化している場合があり、品質やメンテナンスは様々

### Q: プロジェクト内のテンプレートを更新するにはどうすればよいですか？
**A**: テンプレートは自動的に更新されません。以下の方法があります:
1. ソーステンプレートから変更を手動で比較してマージ
2. 更新されたテンプレートを使用して `azd init` を再実行
3. 更新されたテンプレートから特定の改善点を選択して適用

---

## デプロイとインフラストラクチャ

### Q: azd はどの Azure サービスをデプロイできますか？
**A**: azd は Bicep/ARM テンプレートを通じて任意の Azure サービスをデプロイできます。例:
- App Services、Container Apps、Functions
- データベース (SQL、PostgreSQL、Cosmos DB)
- ストレージ、Key Vault、Application Insights
- ネットワーク、セキュリティ、監視リソース

### Q: 複数のリージョンにデプロイできますか？
**A**: はい、Bicep テンプレートで複数のリージョンを構成し、各環境に適切な location パラメータを設定してください。

### Q: データベーススキーマの移行はどう処理しますか？
**A**: `azure.yaml` のデプロイフックを使用してください:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Q: アプリケーションなしでインフラストラクチャのみをデプロイできますか？
**A**: はい、`azd provision` を使用してテンプレートで定義されたインフラストラクチャコンポーネントのみをデプロイできます。

### Q: 既存の Azure リソースにデプロイするにはどうすればよいですか？
**A**: これは複雑で直接的にはサポートされていません。以下の方法があります:
1. 既存のリソースを Bicep テンプレートにインポート
2. テンプレート内で既存リソース参照を使用
3. リソースを条件付きで作成または参照するようテンプレートを修正

### Q: Bicep の代わりに Terraform を使用できますか？
**A**: 現在、azd は主に Bicep/ARM テンプレートをサポートしています。Terraform の公式サポートはありませんが、コミュニティソリューションが存在する場合があります。

---

## 構成と環境

### Q: 異なる環境 (dev、staging、prod) を管理するにはどうすればよいですか？
**A**: `azd env new <environment-name>` を使用して別々の環境を作成し、それぞれ異なる設定を構成します:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Q: 環境構成はどこに保存されますか？
**A**: プロジェクトディレクトリ内の `.azure` フォルダーに保存されます。各環境には独自のフォルダーと構成ファイルがあります。

### Q: 環境固有の構成を設定するにはどうすればよいですか？
**A**: `azd env set` を使用して環境変数を構成します:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q: 環境構成をチームメンバー間で共有できますか？
**A**: `.azure` フォルダーには機密情報が含まれているため、バージョン管理にコミットすべきではありません。代わりに:
1. 必要な環境変数を文書化
2. 環境をセットアップするデプロイスクリプトを使用
3. 機密構成には Azure Key Vault を使用

### Q: テンプレートのデフォルトを上書きするにはどうすればよいですか？
**A**: テンプレートパラメータに対応する環境変数を設定します:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## トラブルシューティング

### Q: `azd up` が失敗するのはなぜですか？
**A**: 主な原因:
1. **認証の問題**: `azd auth login` を実行
2. **権限不足**: Azure のロール割り当てを確認
3. **リソース名の競合**: AZURE_ENV_NAME を変更
4. **クォータ/容量の問題**: リージョンの利用可能性を確認
5. **テンプレートエラー**: Bicep テンプレートを検証

### Q: デプロイ失敗をデバッグするにはどうすればよいですか？
**A**: 
1. `azd deploy --debug` を使用して詳細な出力を確認
2. Azure ポータルのデプロイ履歴を確認
3. Azure ポータルのアクティビティログを確認
4. `azd show` を使用して現在の環境状態を表示

### Q: 環境変数が機能しないのはなぜですか？
**A**: 以下を確認してください:
1. 変数名がテンプレートパラメータと正確に一致している
2. 値にスペースが含まれる場合は適切に引用されている
3. 環境が選択されている: `azd env select <environment>`
4. 変数が正しい環境で設定されている

### Q: 失敗したデプロイをクリーンアップするにはどうすればよいですか？
**A**: 
```bash
azd down --force --purge
```
これにより、すべてのリソースと環境構成が削除されます。

### Q: デプロイ後にアプリケーションにアクセスできないのはなぜですか？
**A**: 以下を確認してください:
1. デプロイが正常に完了している
2. アプリケーションが実行中である (Azure ポータルのログを確認)
3. ネットワークセキュリティグループがトラフィックを許可している
4. DNS/カスタムドメインが正しく構成されている

---

## コストと請求

### Q: azd デプロイのコストはどれくらいですか？
**A**: コストは以下に依存します:
- デプロイされる Azure サービス
- サービスのティア/SKU
- リージョンごとの価格差
- 使用パターン

[Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) を使用して見積もりを行ってください。

### Q: azd デプロイのコストを管理するにはどうすればよいですか？
**A**: 
1. 開発環境には低ティアのSKUを使用
2. Azure の予算とアラートを設定
3. 使用しないときは `azd down` を使用してリソースを削除
4. 適切なリージョンを選択 (リージョンによってコストが異なる)
5. Azure Cost Management ツールを使用

### Q: azd テンプレートには無料ティアオプションがありますか？
**A**: 多くの Azure サービスには無料ティアがあります:
- App Service: 無料ティアが利用可能
- Azure Functions: 月間1M回の無料実行
- Cosmos DB: 400 RU/s の無料ティア
- Application Insights: 月間最初の5GBが無料

テンプレートを構成して利用可能な無料ティアを使用してください。

### Q: デプロイ前にコストを見積もるにはどうすればよいですか？
**A**: 
1. テンプレートの `main.bicep` を確認して作成されるリソースを確認
2. Azure Pricing Calculator を使用して特定のSKUを見積もり
3. まず開発環境にデプロイして実際のコストを監視
4. Azure Cost Management を使用して詳細なコスト分析を行う

---

## ベストプラクティス

### Q: azd プロジェクト構造のベストプラクティスは何ですか？
**A**: 
1. アプリケーションコードをインフラストラクチャから分離
2. `azure.yaml` に意味のあるサービス名を使用
3. ビルドスクリプトで適切なエラーハンドリングを実装
4. 環境固有の構成を使用
5. 包括的なドキュメントを含める

### Q: azd で複数のサービスをどのように整理すべきですか？
**A**: 推奨される構造を使用してください:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### Q: `.azure` フォルダーをバージョン管理にコミットすべきですか？
**A**: **いいえ！** `.azure` フォルダーには機密情報が含まれています。`.gitignore` に追加してください:
```gitignore
.azure/
```

### Q: 秘密情報や機密構成をどのように扱うべきですか？
**A**: 
1. 秘密情報には Azure Key Vault を使用
2. アプリケーション構成で Key Vault の秘密情報を参照
3. 秘密情報をバージョン管理にコミットしない
4. サービス間認証にはマネージドIDを使用

### Q: azd を使用した CI/CD の推奨アプローチは何ですか？
**A**: 
1. 各ステージ (dev
1. 現在のデプロイメントアーキテクチャを分析する  
2. 同等のBicepテンプレートを作成する  
3. `azure.yaml`を現在のサービスに合わせて設定する  
4. 開発環境で徹底的にテストする  
5. 環境を段階的に移行する  

---

## まだ質問がありますか？

### **まず検索する**
- [公式ドキュメント](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)を確認する  
- [GitHubの課題](https://github.com/Azure/azure-dev/issues)で似た問題を検索する  

### **サポートを受ける**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - コミュニティサポート  
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - 技術的な質問  
- [Azure Discord](https://discord.gg/azure) - リアルタイムのコミュニティチャット  

### **問題を報告する**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - バグ報告や機能リクエスト  
- 関連するログ、エラーメッセージ、再現手順を含めてください  

### **さらに学ぶ**
- [Azure Developer CLI ドキュメント](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure アーキテクチャセンター](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)  

---

*このFAQは定期的に更新されます。最終更新日: 2025年9月9日*  

---

**ナビゲーション**  
- **前のレッスン**: [用語集](glossary.md)  
- **次のレッスン**: [学習ガイド](study-guide.md)  

---

**免責事項**:  
この文書は、AI翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を追求しておりますが、自動翻訳には誤りや不正確な部分が含まれる可能性があります。元の言語で記載された文書を正式な情報源としてご参照ください。重要な情報については、専門の人間による翻訳を推奨します。この翻訳の使用に起因する誤解や誤解釈について、当方は一切の責任を負いません。