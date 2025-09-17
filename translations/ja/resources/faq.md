<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "a82d27b84022e9b7c7a163f99fa1fd25",
  "translation_date": "2025-09-17T14:24:50+00:00",
  "source_file": "resources/faq.md",
  "language_code": "ja"
}
-->
# よくある質問 (FAQ)

**章ごとにヘルプを探す**
- **📚 コースホーム**: [AZD For Beginners](../README.md)
- **🚆 インストールの問題**: [第1章: インストールとセットアップ](../docs/getting-started/installation.md)
- **🤖 AIに関する質問**: [第2章: AIファースト開発](../docs/ai-foundry/azure-ai-foundry-integration.md)
- **🔧 トラブルシューティング**: [第7章: トラブルシューティングとデバッグ](../docs/troubleshooting/common-issues.md)

## はじめに

この包括的なFAQでは、Azure Developer CLI (azd) と Azure デプロイに関する最も一般的な質問への回答を提供します。よくある問題の迅速な解決策を見つけ、ベストプラクティスを理解し、azd の概念やワークフローについての明確な説明を得ることができます。

## 学習目標

このFAQを確認することで、以下を達成できます:
- Azure Developer CLI に関するよくある質問や問題への迅速な回答を見つける
- 実践的なQ&A形式を通じて主要な概念や用語を理解する
- 頻発する問題やエラーシナリオに対するトラブルシューティングの解決策にアクセスする
- 最適化に関するよくある質問を通じてベストプラクティスを学ぶ
- エキスパートレベルの質問を通じて高度な機能や能力を発見する
- コスト、セキュリティ、デプロイ戦略に関するガイダンスを効率的に参照する

## 学習成果

このFAQを定期的に参照することで、以下が可能になります:
- 提供された解決策を使用して、Azure Developer CLI の一般的な問題を独力で解決する
- デプロイ戦略や構成に関する情報に基づいた意思決定を行う
- azd と他の Azure ツールやサービスとの関係を理解する
- コミュニティの経験やエキスパートの推奨事項に基づいたベストプラクティスを適用する
- 認証、デプロイ、構成の問題を効果的にトラブルシューティングする
- FAQの洞察や推奨事項を活用してコストとパフォーマンスを最適化する

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
**A**: Azure Developer CLI (azd) は、ローカル開発環境からAzureへのアプリケーション移行を迅速化する、開発者向けのコマンドラインツールです。テンプレートを通じてベストプラクティスを提供し、デプロイライフサイクル全体をサポートします。

### Q: azd は Azure CLI とどう違いますか？
**A**: 
- **Azure CLI**: Azureリソースを管理するための汎用ツール
- **azd**: アプリケーションデプロイワークフローに特化した開発者向けツール
- azd は内部的に Azure CLI を使用しますが、一般的な開発シナリオ向けに高レベルの抽象化を提供します
- azd にはテンプレート、環境管理、デプロイ自動化が含まれます

### Q: azd を使用するには Azure CLI をインストールする必要がありますか？
**A**: はい、azd は認証や一部の操作に Azure CLI を必要とします。まず Azure CLI をインストールしてから azd をインストールしてください。

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
1. `azd init` を使用して既存プロジェクトに azd 構成を追加する
2. 既存プロジェクトを azd テンプレート構造に適合させる
3. 既存のアーキテクチャに基づいてカスタムテンプレートを作成する

---

## 認証とアクセス

### Q: azd を使用して Azure に認証するにはどうすればよいですか？
**A**: `azd auth login` を使用すると、ブラウザウィンドウが開き、Azure 認証を行えます。CI/CD シナリオでは、サービスプリンシパルやマネージドIDを使用してください。

### Q: azd を複数の Azure サブスクリプションで使用できますか？
**A**: はい。`azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` を使用して、各環境で使用するサブスクリプションを指定できます。

### Q: azd でデプロイするにはどのような権限が必要ですか？
**A**: 通常必要な権限は以下の通りです:
- リソースグループまたはサブスクリプションの **Contributor** ロール
- ロール割り当てを必要とするリソースをデプロイする場合は **User Access Administrator**
- 必要な権限はテンプレートやデプロイするリソースによって異なります

### Q: azd を CI/CD パイプラインで使用できますか？
**A**: もちろんです！azd は CI/CD 統合を念頭に設計されています。認証にはサービスプリンシパルを使用し、構成には環境変数を設定してください。

### Q: GitHub Actions で認証を処理するにはどうすればよいですか？
**A**: サービスプリンシパルの資格情報を使用して Azure Login アクションを利用してください:
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
- `azd template list` を使用して利用可能なテンプレートを参照

### Q: カスタムテンプレートを作成するにはどうすればよいですか？
**A**: 
1. 既存のテンプレート構造をベースにする
2. `azure.yaml`、インフラストラクチャファイル、アプリケーションコードを修正する
3. `azd up` で徹底的にテストする
4. 適切なタグを付けて GitHub に公開する

### Q: テンプレートなしで azd を使用できますか？
**A**: はい、既存プロジェクトで `azd init` を使用して必要な構成ファイルを作成できます。`azure.yaml` とインフラストラクチャファイルを手動で設定する必要があります。

### Q: 公式テンプレートとコミュニティテンプレートの違いは何ですか？
**A**: 
- **公式テンプレート**: Microsoft によって管理され、定期的に更新され、包括的なドキュメントが付属
- **コミュニティテンプレート**: 開発者によって作成され、特定のユースケースに特化している場合があり、品質やメンテナンスが異なる

### Q: プロジェクト内のテンプレートを更新するにはどうすればよいですか？
**A**: テンプレートは自動的に更新されません。以下の方法があります:
1. ソーステンプレートから手動で変更を比較してマージする
2. 更新されたテンプレートを使用して `azd init` を再実行する
3. 更新されたテンプレートから特定の改善点を選択して適用する

---

## デプロイとインフラストラクチャ

### Q: azd はどのような Azure サービスをデプロイできますか？
**A**: azd は Bicep/ARM テンプレートを通じて以下を含むすべての Azure サービスをデプロイできます:
- App Services、Container Apps、Functions
- データベース (SQL、PostgreSQL、Cosmos DB)
- ストレージ、Key Vault、Application Insights
- ネットワーキング、セキュリティ、モニタリングリソース

### Q: 複数のリージョンにデプロイできますか？
**A**: はい、Bicep テンプレートで複数のリージョンを設定し、各環境に適切なロケーションパラメータを設定してください。

### Q: データベーススキーマのマイグレーションはどう処理しますか？
**A**: `azure.yaml` のデプロイフックを使用してください:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Q: インフラストラクチャのみをデプロイできますか？
**A**: はい、`azd provision` を使用してテンプレートで定義されたインフラストラクチャコンポーネントのみをデプロイできます。

### Q: 既存の Azure リソースにデプロイするにはどうすればよいですか？
**A**: これは複雑で直接的なサポートはありませんが、以下の方法があります:
1. 既存リソースを Bicep テンプレートにインポートする
2. テンプレート内で既存リソースを参照する
3. リソースを条件付きで作成または参照するようテンプレートを修正する

### Q: Terraform を Bicep の代わりに使用できますか？
**A**: 現在、azd は主に Bicep/ARM テンプレートをサポートしています。Terraform の公式サポートはありませんが、コミュニティソリューションが存在する場合があります。

---

## 構成と環境

### Q: 異なる環境 (dev、staging、prod) を管理するにはどうすればよいですか？
**A**: `azd env new <environment-name>` を使用して個別の環境を作成し、それぞれに異なる設定を構成してください:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Q: 環境構成はどこに保存されますか？
**A**: プロジェクトディレクトリ内の `.azure` フォルダに保存されます。各環境には独自のフォルダと構成ファイルがあります。

### Q: 環境固有の構成を設定するにはどうすればよいですか？
**A**: `azd env set` を使用して環境変数を設定してください:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q: チームメンバー間で環境構成を共有できますか？
**A**: `.azure` フォルダには機密情報が含まれているため、バージョン管理にコミットしないでください。代わりに:
1. 必要な環境変数を文書化する
2. デプロイスクリプトを使用して環境をセットアップする
3. 機密構成には Azure Key Vault を使用する

### Q: テンプレートのデフォルトを上書きするにはどうすればよいですか？
**A**: テンプレートパラメータに対応する環境変数を設定してください:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## トラブルシューティング

### Q: `azd up` が失敗するのはなぜですか？
**A**: よくある原因:
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
2. 値にスペースが含まれる場合は適切に引用符で囲む
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

### Q: azd デプロイのコストはどのくらいですか？
**A**: コストは以下に依存します:
- デプロイされる Azure サービス
- サービスのティア/SKU
- リージョンごとの価格差
- 使用パターン

[Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) を使用して見積もりを行ってください。

### Q: azd デプロイのコストを管理するにはどうすればよいですか？
**A**: 
1. 開発環境には低ティアのSKUを使用する
2. Azureの予算とアラートを設定する
3. 使用しないときは `azd down` を使用してリソースを削除する
4. 適切なリージョンを選択する (コストは場所によって異なる)
5. Azure Cost Management ツールを使用する

### Q: azd テンプレートに無料ティアのオプションはありますか？
**A**: 多くの Azure サービスには無料ティアがあります:
- App Service: 無料ティアが利用可能
- Azure Functions: 月間100万回の無料実行
- Cosmos DB: 400 RU/s の無料ティア
- Application Insights: 月間5GBまで無料

利用可能な場合はテンプレートを無料ティアに構成してください。

### Q: デプロイ前にコストを見積もるにはどうすればよいですか？
**A**: 
1. テンプレートの `main.bicep` を確認して作成されるリソースを確認
2. Azure Pricing Calculator を使用して特定のSKUを見積もる
3. まず開発環境にデプロイして実際のコストを監視
4. Azure Cost Management を使用して詳細なコスト分析を行う

---

## ベストプラクティス

### Q: azd プロジェクト構造のベストプラクティスは何ですか？
**A**: 
1. アプリケーションコードとインフラストラクチャを分離する
2. `azure.yaml` に意味のあるサービス名を使用する
3. ビルドスクリプトに適切なエラーハンドリングを実装する
4. 環境固有の構成を使用する
5. 包括的なドキュメントを含める

### Q: azd で複数のサービスをどのように整理すればよいですか？
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

### Q: `.azure` フォルダをバージョン管理にコミットすべきですか？
**A**
2. **テンプレート**: [テンプレートガイドライン](https://github.com/Azure-Samples/awesome-azd)に従ってテンプレートを作成してください  
3. **ドキュメント**: [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)でドキュメントに貢献してください  

### Q: azdのロードマップはどうなっていますか？  
**A**: 計画されている機能や改善点については、[公式ロードマップ](https://github.com/Azure/azure-dev/projects)をご確認ください。  

### Q: 他のデプロイツールからazdに移行するにはどうすればよいですか？  
**A**:  
1. 現在のデプロイアーキテクチャを分析する  
2. 同等のBicepテンプレートを作成する  
3. 現在のサービスに合わせて`azure.yaml`を設定する  
4. 開発環境で徹底的にテストする  
5. 環境を段階的に移行する  

---

## まだ質問がありますか？

### **まず検索してください**  
- [公式ドキュメント](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)を確認する  
- [GitHubのIssue](https://github.com/Azure/azure-dev/issues)で似た問題を検索する  

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
この文書はAI翻訳サービス[Co-op Translator](https://github.com/Azure/co-op-translator)を使用して翻訳されています。正確性を追求しておりますが、自動翻訳には誤りや不正確な部分が含まれる可能性があります。元の言語で記載された文書が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。この翻訳の使用に起因する誤解や誤認について、当方は責任を負いません。