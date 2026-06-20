# 第7章: トラブルシューティング & デバッグ

**📚 Course**: [AZD 初心者向け](../../README.md) | **⏱️ Duration**: 1〜1.5時間 | **⭐ Complexity**: 中級

---

## 概要

この章では Azure Developer CLI を使用する際に発生する一般的な問題の診断と解決方法を説明します。デプロイ失敗から AI 固有の問題まで扱います。

> 2026年6月に `azd 1.25.6` で検証済み。

## 学習目標

この章を修了すると、次のことができるようになります:
- AZD の一般的なデプロイ失敗を診断する
- 認証および権限の問題をデバッグする
- AI サービスの接続問題を解決する
- トラブルシューティングに Azure Portal と CLI を使用する

---

## 📚 レッスン

| # | レッスン | 説明 | 時間 |
|---|--------|-------------|------|
| 1 | [一般的な問題](common-issues.md) | よく遭遇する問題 | 30 min |
| 2 | [デバッグガイド](debugging.md) | ステップバイステップのデバッグ戦略 | 45 min |
| 3 | [AI トラブルシューティング](ai-troubleshooting.md) | AI 固有の問題 | 30 min |

---

## 🚨 クイック修正

### 認証の問題
```bash
# AZD ワークフローに必須
azd auth login

# Azure CLI コマンドを直接使用する場合は任意
az login

azd auth status
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

| エラー | 原因 | 解決策 |
|-------|-------|----------|
| `AuthenticationError` | ログインしていません | `azd auth login` |
| `ResourceNotFound` | リソースが見つかりません | リソース名を確認してください |
| `QuotaExceeded` | サブスクリプションの制限 | クォータ増加を依頼する |
| `InvalidTemplate` | Bicep の構文エラー | `az bicep build` |
| `Conflict` | リソースが既に存在します | 新しい名前を使用するか削除してください |
| `Forbidden` | 権限が不足しています | RBAC ロールを確認してください |

---

## 🔄 リセットと回復

```bash
# ソフトリセット（リソースは維持し、コードを再デプロイ）
azd deploy --force

# ハードリセット（すべてを削除して最初からやり直す）
azd down --force --purge
azd up
```

---

## 🔗 ナビゲーション

| 方向 | 章 |
|-----------|---------|
| <strong>前へ</strong> | [第6章: 展開前](../chapter-06-pre-deployment/README.md) |
| <strong>次へ</strong> | [第8章: 本番](../chapter-08-production/README.md) |

---

## 📖 関連リソース

- [展開前チェック](../chapter-06-pre-deployment/preflight-checks.md)
- [構成ガイド](../chapter-03-configuration/configuration.md)
- [AZD の GitHub Issues](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**：
本書類は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を期していますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知おきください。原文の原語版が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用により生じたいかなる誤解や解釈違いについても、当方は責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->