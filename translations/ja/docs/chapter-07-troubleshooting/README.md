# 第7章: トラブルシューティングとデバッグ

**📚 コース**: [AZD For Beginners](../../README.md) | **⏱️ 所要時間**: 1～1.5時間 | **⭐ 難易度**: 中級

---

## 概要

本章では、Azure Developer CLIを使用する際に発生しやすい一般的な問題の診断と解決方法を説明します。デプロイ失敗からAI特有の問題まで網羅しています。

> 2026年7月に `azd 1.27.1` で検証済み。

## 学習目標

本章を修了することで、以下ができるようになります:
- 一般的なAZDデプロイ失敗の診断
- 認証と権限の問題のデバッグ
- AIサービスの接続問題の解決
- トラブルシューティングのためのAzure PortalとCLIの利用

---

## 📚 レッスン一覧

| # | レッスン | 説明 | 時間 |
|---|--------|-------------|------|
| 1 | [共通の問題](common-issues.md) | よくある問題の対処 | 30分 |
| 2 | [デバッグガイド](debugging.md) | ステップごとのデバッグ手法 | 45分 |
| 3 | [AIトラブルシューティング](ai-troubleshooting.md) | AI特有の問題 | 30分 |

---

## 🚨 クイック修正

### 認証問題
```bash
# AZDワークフローに必須です
azd auth login

# Azure CLIコマンドを直接使用している場合はオプションです
az login

azd auth status
```

### プロビジョニング失敗
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### リソース競合
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

## 📋 エラーコード一覧

| エラー | 原因 | 解決策 |
|-------|-------|----------|
| `AuthenticationError` | ログインしていない | `azd auth login` |
| `ResourceNotFound` | リソースが見つからない | リソース名を確認 |
| `QuotaExceeded` | サブスクリプションの制限超過 | クォータ増加を申請 |
| `InvalidTemplate` | Bicep構文エラー | `az bicep build` |
| `Conflict` | リソースが既に存在 | 新しい名前を使うか削除 |
| `Forbidden` | 権限不足 | RBACロールを確認 |

---

## 🔄 リセットと復旧

```bash
# ソフトリセット（リソースを保持し、コードを再展開）
azd deploy --force

# ハードリセット（すべて削除し、初めからやり直す）
azd down --force --purge
azd up
```

---

## 🔗 ナビゲーション

| 方向 | チャプター |
|-----------|---------|
| <strong>前へ</strong> | [第6章: プリデプロイメント](../chapter-06-pre-deployment/README.md) |
| <strong>次へ</strong> | [第8章: 本番環境](../chapter-08-production/README.md) |

---

## 📖 関連リソース

- [プリデプロイメントチェック](../chapter-06-pre-deployment/preflight-checks.md)
- [設定ガイド](../chapter-03-configuration/configuration.md)
- [AZD GitHub Issues](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知おきください。原文の原語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->