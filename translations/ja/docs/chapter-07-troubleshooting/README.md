# 第7章: トラブルシューティングとデバッグ

**📚 コース**: [AZD 入門](../../README.md) | **⏱️ 所要時間**: 1-1.5 hours | **⭐ 難易度**: 中級

---

## 概要

この章は Azure Developer CLI を使用する際に発生する一般的な問題の診断と解決を支援します。デプロイ失敗から AI 特有の問題までを扱います。

## 学習目標

この章を修了することで、あなたは以下ができるようになります:
- 一般的な AZD デプロイ失敗を診断する
- 認証および権限の問題をデバッグする
- AI サービスの接続問題を解決する
- トラブルシューティングに Azure Portal と CLI を使用する

---

## 📚 レッスン

| # | レッスン | 説明 | 所要時間 |
|---|--------|-------------|------|
| 1 | [一般的な問題](common-issues.md) | よく遭遇する問題 | 30分 |
| 2 | [デバッグガイド](debugging.md) | ステップバイステップのデバッグ戦略 | 45分 |
| 3 | [AI のトラブルシューティング](ai-troubleshooting.md) | AI 特有の問題 | 30分 |

---

## 🚨 クイック修正

### 認証の問題
```bash
azd auth login
az login
azd auth whoami
```

### プロビジョニング失敗
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### リソースの競合
```bash
azd down --force --purge
azd env new different-name
azd up
```

### クォータ超過
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 エラーコード参照

| Error | Cause | Solution |
|-------|-------|----------|
| `AuthenticationError` | ログインしていない | `azd auth login` |
| `ResourceNotFound` | リソースが見つからない | リソース名を確認してください |
| `QuotaExceeded` | サブスクリプションの制限 | クォータの増加をリクエストする |
| `InvalidTemplate` | Bicep の構文エラー | `az bicep build` |
| `Conflict` | リソースが既に存在する | 新しい名前を使用するか削除する |
| `Forbidden` | 権限が不十分 | RBAC ロールを確認してください |

---

## 🔄 リセットと復旧

```bash
# ソフトリセット（リソースを保持してコードを再デプロイ）
azd deploy --force

# ハードリセット（すべてを削除して最初からやり直す）
azd down --force --purge
azd up
```

---

## 🔗 ナビゲーション

| Direction | Chapter |
|-----------|---------|
| **前へ** | [第6章: 事前展開](../chapter-06-pre-deployment/README.md) |
| **次へ** | [第8章: 本番](../chapter-08-production/README.md) |

---

## 📖 関連リソース

- [事前展開チェック](../chapter-06-pre-deployment/preflight-checks.md)
- [構成ガイド](../chapter-03-configuration/configuration.md)
- [AZD の GitHub Issues](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責事項：
この文書は AI 翻訳サービス Co-op Translator (https://github.com/Azure/co-op-translator) を使用して翻訳されました。正確性の確保に努めていますが、自動翻訳には誤りや不正確な箇所が含まれる可能性があることにご注意ください。原文（原言語版）を正式な情報源としてご確認ください。重要な情報については、専門の翻訳者による人間翻訳を推奨します。本翻訳の利用に起因するいかなる誤解や解釈の相違についても、当社は責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->