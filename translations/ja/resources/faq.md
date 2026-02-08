# よくある質問 (FAQ)

**章ごとのヘルプ**
- **📚 コースホーム**: [初心者向け AZD](../README.md)
- **🚆 インストールの問題**: [第1章: Installation & Setup](../docs/getting-started/installation.md)
- **🤖 AI に関する質問**: [第2章: AI-First Development](../docs/microsoft-foundry/microsoft-foundry-integration.md)
- **🔧 トラブルシューティング**: [第7章: Troubleshooting & Debugging](../docs/troubleshooting/common-issues.md)

## はじめに

この包括的な FAQ では、Azure Developer CLI (azd) と Azure デプロイに関する最も一般的な質問への回答を提供します。よくある問題への迅速な解決策、ベストプラクティスの理解、および azd の概念やワークフローの明確化に役立ちます。

## 学習目標

この FAQ を確認することで以下が得られます:
- Azure Developer CLI に関するよくある質問や問題への迅速な回答を見つける
- 実践的な Q&A 形式で重要な概念と用語を理解する
- 頻繁に発生する問題やエラーシナリオのトラブルシューティング方法にアクセスする
- 最適化に関する一般的な質問を通じてベストプラクティスを学ぶ
- 専門家レベルの質問を通じて高度な機能と能力を発見する
- コスト、セキュリティ、デプロイ戦略に関するガイダンスを効率的に参照する

## 学習成果

この FAQ を定期的に参照することで、次のことができるようになります:
- 提供された解決策を使って Azure Developer CLI の一般的な問題を自力で解決する
- デプロイ戦略や構成に関する情報に基づいた判断を下す
- azd と他の Azure ツールやサービスとの関係を理解する
- コミュニティの経験と専門家の推奨に基づいたベストプラクティスを適用する
- 認証、デプロイ、構成の問題を効果的にトラブルシュートする
- FAQ の洞察と推奨事項を使用してコストとパフォーマンスを最適化する

## 目次

- [導入](../../../resources)
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

### Q: What is Azure Developer CLI (azd)?
**A**: Azure Developer CLI (azd) は、ローカルの開発環境から Azure へのアプリケーション移行にかかる時間を短縮する、開発者向けのコマンドラインツールです。テンプレートを通じてベストプラクティスを提供し、デプロイのライフサイクル全体を支援します。

### Q: How is azd different from Azure CLI?
**A**: 
- **Azure CLI**: Azure リソースを管理するための汎用ツール
- **azd**: アプリケーションのデプロイワークフローに特化した開発者向けツール
- azd は内部で Azure CLI を使用しますが、一般的な開発シナリオ向けにより高レベルの抽象化を提供します
- azd にはテンプレート、環境管理、デプロイ自動化が含まれます

### Q: Do I need Azure CLI installed to use azd?
**A**: はい、azd は認証や一部の操作に Azure CLI を必要とします。まず Azure CLI をインストールし、その後 azd をインストールしてください。

### Q: What programming languages does azd support?
**A**: azd は言語に依存しません。次の言語で動作します:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- 静的サイト
- コンテナ化されたアプリケーション

### Q: Can I use azd with existing projects?
**A**: はい！次のいずれかの方法で対応できます:
1. 既存プロジェクトに azd の構成を追加するには `azd init` を使用する
2. 既存プロジェクトを azd テンプレート構成に合わせて調整する
3. 既存のアーキテクチャに基づいてカスタムテンプレートを作成する

---

## 認証とアクセス

### Q: How do I authenticate with Azure using azd?
**A**: `azd auth login` を使用すると、Azure 認証用にブラウザウィンドウが開きます。CI/CD シナリオでは、サービスプリンシパルやマネージド ID を使用してください。

### Q: Can I use azd with multiple Azure subscriptions?
**A**: はい。環境ごとに使用するサブスクリプションを指定するには `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` を使用します。

### Q: What permissions do I need to deploy with azd?
**A**: 通常は次が必要です:
- リソースグループまたはサブスクリプションに対する **Contributor** ロール
- ロール割り当てを行うリソースをデプロイする場合は **User Access Administrator**
- 必要な具体的な権限はテンプレートやデプロイするリソースによって異なります

### Q: Can I use azd in CI/CD pipelines?
**A**: もちろんです！azd は CI/CD 統合を想定して設計されています。認証にはサービスプリンシパルを使用し、構成には環境変数を設定してください。

### Q: How do I handle authentication in GitHub Actions?
**A**: サービスプリンシパル資格情報を使用して Azure Login アクションを使用してください:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## テンプレートとプロジェクト

### Q: Where can I find azd templates?
**A**: 
- 公式テンプレート: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- コミュニティテンプレート: GitHub で "azd-template" を検索
- `azd template list` を使用して利用可能なテンプレートを参照

### Q: How do I create a custom template?
**A**: 
1. 既存のテンプレート構造から始める
2. `azure.yaml`、インフラファイル、アプリケーションコードを修正する
3. `azd up` で十分にテストする
4. 適切なタグを付けて GitHub に公開する

### Q: Can I use azd without a template?
**A**: はい、既存プロジェクトで `azd init` を使用して必要な構成ファイルを作成できます。`azure.yaml` とインフラファイルを手動で構成する必要があります。

### Q: What's the difference between official and community templates?
**A**: 
- **公式テンプレート**: Microsoft によって保守され、定期的に更新され、包括的なドキュメントがある
- **コミュニティテンプレート**: 開発者が作成したもので、特化したユースケース向けであり、品質やメンテナンスは様々

### Q: How do I update a template in my project?
**A**: テンプレートは自動的に更新されません。次の方法があります:
1. ソーステンプレートと手動で差分を比較してマージする
2. 更新されたテンプレートを使って `azd init` で新規に開始する
3. 更新されたテンプレートから特定の改善点をチェリーピックする

---

## デプロイとインフラストラクチャ

### Q: What Azure services can azd deploy?
**A**: azd は Bicep/ARM テンプレートを通じて任意の Azure サービスをデプロイできます。例:
- App Services、Container Apps、Functions
- データベース（SQL、PostgreSQL、Cosmos DB）
- ストレージ、Key Vault、Application Insights
- ネットワーキング、セキュリティ、監視リソース

### Q: Can I deploy to multiple regions?
**A**: はい、Bicep テンプレートで複数のリージョンを構成し、各環境の location パラメーターを適切に設定してください。

### Q: How do I handle database schema migrations?
**A**: `azure.yaml` のデプロイフックを使用してください:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Q: Can I deploy only infrastructure without applications?
**A**: はい。テンプレートで定義されたインフラストラクチャコンポーネントのみをデプロイするには `azd provision` を使用します。

### Q: How do I deploy to existing Azure resources?
**A**: これは複雑で直接サポートされていません。次の方法があります:
1. 既存リソースを Bicep テンプレートにインポートする
2. テンプレート内で既存リソース参照を使用する
3. リソースを条件付きで作成または参照するようテンプレートを修正する

### Q: Can I use Terraform instead of Bicep?
**A**: 現在、azd は主に Bicep/ARM テンプレートをサポートしています。Terraform のサポートは公式には提供されていませんが、コミュニティによるソリューションが存在する可能性があります。

---

## 構成と環境

### Q: How do I manage different environments (dev, staging, prod)?
**A**: `azd env new <environment-name>` を使用して別々の環境を作成し、それぞれに異なる設定を構成します:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Q: Where are environment configurations stored?
**A**: プロジェクトディレクトリ内の `.azure` フォルダーに保存されます。各環境には構成ファイルを含む専用のフォルダーがあります。

### Q: How do I set environment-specific configuration?
**A**: 環境変数を構成するには `azd env set` を使用します:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q: Can I share environment configurations across team members?
**A**: `.azure` フォルダーには機密情報が含まれるため、バージョン管理にコミットすべきではありません。代わりに次を行ってください:
1. 必要な環境変数を文書化する
2. 環境をセットアップするデプロイスクリプトを使用する
3. 機密構成には Azure Key Vault を使用する

### Q: How do I override template defaults?
**A**: テンプレートパラメーターに対応する環境変数を設定してください:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## トラブルシューティング

### Q: Why is `azd up` failing?
**A**: 一般的な原因:
1. **認証の問題**: `azd auth login` を実行する
2. **権限不足**: Azure のロール割り当てを確認する
3. **リソース名の競合**: AZURE_ENV_NAME を変更する
4. **クォータ/容量の問題**: リージョンの可用性を確認する
5. **テンプレートのエラー**: Bicep テンプレートを検証する

### Q: How do I debug deployment failures?
**A**: 
1. 詳細な出力のために `azd deploy --debug` を使用する
2. Azure ポータルのデプロイ履歴を確認する
3. Azure ポータルのアクティビティログを確認する
4. 現在の環境状態を表示するには `azd show` を使用する

### Q: Why are my environment variables not working?
**A**: 次を確認してください:
1. 変数名がテンプレートのパラメーターと完全に一致していること
2. 値にスペースが含まれる場合は適切に引用されていること
3. 環境が選択されていること: `azd env select <environment>`
4. 変数が正しい環境に設定されていること

### Q: How do I clean up failed deployments?
**A**: 
```bash
azd down --force --purge
```
これにより、すべてのリソースと環境構成が削除されます。

### Q: Why is my application not accessible after deployment?
**A**: 次を確認してください:
1. デプロイが正常に完了していること
2. アプリケーションが稼働していること（Azure ポータルのログを確認）
3. ネットワークセキュリティグループがトラフィックを許可していること
4. DNS/カスタムドメインが正しく構成されていること

---

## コストと請求

### Q: How much will azd deployments cost?
**A**: コストは次によって決まります:
- デプロイされる Azure サービス
- 選択したサービスの階層/SKU
- リージョンごとの価格差
- 使用パターン

見積もりには [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) を使用してください。

### Q: How do I control costs in azd deployments?
**A**: 
1. 開発環境では低階層の SKU を使用する
2. Azure 予算とアラートを設定する
3. 使用しないときは `azd down` でリソースを削除する
4. 適切なリージョンを選択する（場所によってコストが異なる）
5. Azure Cost Management ツールを使用する

### Q: Are there free tier options for azd templates?
**A**: 多くの Azure サービスにはフリーティアがあります:
- App Service: 無料ティアあり
- Azure Functions: 月間 100 万回の無料実行
- Cosmos DB: 400 RU/s のフリーティア
- Application Insights: 月間最初の 5GB は無料

テンプレートを可能な限りフリーティアを使用するよう設定してください。

### Q: How do I estimate costs before deployment?
**A**: 
1. テンプレートの `main.bicep` を確認して作成されるリソースを把握する
2. 特定の SKU を用いて Azure Pricing Calculator を使用する
3. まず開発環境にデプロイして実際のコストを監視する
4. 詳細なコスト分析には Azure Cost Management を使用する

---

## ベストプラクティス

### Q: What are the best practices for azd project structure?
**A**: 
1. アプリケーションコードをインフラストラクチャから分離する
2. `azure.yaml` にわかりやすいサービス名を使用する
3. ビルドスクリプトに適切なエラーハンドリングを実装する
4. 環境固有の構成を使用する
5. 包括的なドキュメントを含める

### Q: How should I organize multiple services in azd?
**A**: 推奨される構成を使用してください:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### Q: Should I commit the `.azure` folder to version control?
**A**: **いいえ！** `.azure` フォルダーには機密情報が含まれています。`.gitignore` に追加してください:
```gitignore
.azure/
```

### Q: How do I handle secrets and sensitive configuration?
**A**: 
1. 機密情報には Azure Key Vault を使用する
2. アプリケーション構成で Key Vault のシークレットを参照する
3. 機密情報をバージョン管理にコミットしない
4. サービス間認証にはマネージド ID を使用する

### Q: What's the recommended approach for CI/CD with azd?
**A**: 
1. 各ステージ（dev/staging/prod）ごとに別々の環境を使用する
2. デプロイ前に自動テストを実行する
3. 認証にはサービスプリンシパルを使用する
4. パイプラインのシークレット/変数に機密構成を保存する
5. 本番デプロイには承認ゲートを実装する

---

## 高度なトピック

### Q: Can I extend azd with custom functionality?
**A**: はい、`azure.yaml` のデプロイフックを通じて拡張できます:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### Q: How do I integrate azd with existing DevOps processes?
**A**: 
1. 既存のパイプラインスクリプトで azd コマンドを使用する
2. チーム間で azd テンプレートを標準化する
3. 既存の監視とアラートに統合する
4. パイプライン統合のために azd の JSON 出力を使用する

### Q: Can I use azd with Azure DevOps?
**A**: はい、azd は任意の CI/CD システムで動作します。azd コマンドを使用する Azure DevOps パイプラインを作成してください。

### Q: How do I contribute to azd or create community templates?
**A**:
1. **azd ツール**: [Azure/azure-dev](https://github.com/Azure/azure-dev) に貢献する
2. **テンプレート**: [テンプレートのガイドライン](https://github.com/Azure-Samples/awesome-azd) に従ってテンプレートを作成する
3. **ドキュメント**: [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs) に貢献する

### Q: azdのロードマップは何ですか？
**A**: 計画されている機能や改善については、[公式ロードマップ](https://github.com/Azure/azure-dev/projects) を確認してください。

### Q: 他のデプロイツールから azd にどのように移行しますか？
**A**: 
1. 現在のデプロイアーキテクチャを分析する
2. 同等の Bicep テンプレートを作成する
3. 現在のサービスに合わせて `azure.yaml` を構成する
4. 開発環境で十分にテストする
5. 環境を段階的に移行する

---

## まだ質問がありますか？

### **まず検索**
- [公式ドキュメント](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) を確認してください
- 類似の問題は [GitHub issues](https://github.com/Azure/azure-dev/issues) で検索する

### **ヘルプ**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - コミュニティサポート
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - 技術的な質問
- [Azure Discord](https://discord.gg/azure) - リアルタイムのコミュニティチャット

### **問題を報告する**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - バグ報告や機能要望
- 関連するログ、エラーメッセージ、再現手順を含めてください

### **詳しく学ぶ**
- [Azure Developer CLI ドキュメント](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure アーキテクチャ センター](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected フレームワーク](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*このFAQは定期的に更新されています。最終更新日: 2025年9月9日*

---

**ナビゲーション**
- **前のレッスン**: [用語集](glossary.md)
- **次のレッスン**: [学習ガイド](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責事項：
本書類は AI 翻訳サービス「Co‑op Translator」(https://github.com/Azure/co-op-translator) を用いて翻訳されました。正確性の確保に努めていますが、自動翻訳には誤りや不正確な箇所が含まれる可能性があることをご了承ください。原文（原言語の文書）を正式な情報源としてご確認ください。重要な情報については、専門の人による翻訳を推奨します。本翻訳の利用に起因するいかなる誤解や誤訳についても、当方は責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->