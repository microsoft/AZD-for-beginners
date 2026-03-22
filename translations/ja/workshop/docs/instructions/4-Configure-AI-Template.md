# 4. テンプレートの構成

!!! tip "このモジュールの終了時までにできること"

    - [ ] `azure.yaml` の目的を理解する
    - [ ] `azure.yaml` の構造を理解する
    - [ ] azd ライフサイクルの `hooks` の価値を理解する
    - [ ] **ラボ 4:** 環境変数を調査して変更する

---

!!! prompt "`azure.yaml` ファイルは何をしますか？コードフェンスを使って行ごとに説明してください"

      `azure.yaml` ファイルは **Azure Developer CLI (azd) の構成ファイル** です。インフラストラクチャ、サービス、デプロイ用フック、環境変数など、アプリケーションを Azure にどのようにデプロイするかを定義します。

---

## 1. 目的と機能

この `azure.yaml` ファイルは、AI エージェントアプリケーションのための <strong>デプロイの設計図</strong> として機能します。これにより以下を行います：

1. デプロイ前に環境を <strong>検証する</strong>
2. Azure AI サービス（AI Hub、AI Project、Search など）を <strong>プロビジョニングする</strong>
3. Python アプリケーションを **Azure Container Apps にデプロイする**
4. チャットおよび埋め込み機能のための **AI モデルを構成する**
5. AI アプリケーションのための <strong>監視とトレーシングを設定する</strong>
6. 新規および既存の **Azure AI プロジェクトのシナリオの両方を処理する**

このファイルにより、適切な検証、プロビジョニング、およびデプロイ後の構成を伴う完全な AI エージェントソリューションを、ワンコマンド（`azd up`）でデプロイできます。

??? info "表示を展開: `azure.yaml`"

      `azure.yaml` ファイルは、Azure Developer CLI がこの AI エージェントアプリケーションを Azure にどのようにデプロイおよび管理するかを定義します。行ごとに分解して説明します。

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: do we need hooks? 
      # TODO: do we need all of the variables?

      name: azd-get-started-with-ai-agents
      metadata:
      template: azd-get-started-with-ai-agents@1.0.2
      requiredVersions:
      azd: ">=1.14.0"

      hooks:
      preup:
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/validate_env_vars.sh; ./scripts/validate_env_vars.sh
            interactive: true
            continueOnError: false
      windows:
            shell: pwsh
            run: ./scripts/validate_env_vars.ps1
            interactive: true
            continueOnError: false      
      postprovision:
      windows:
            shell: pwsh
            run: ./scripts/write_env.ps1
            continueOnError: true
            interactive: true
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/write_env.sh; ./scripts/write_env.sh;
            continueOnError: true
            interactive: true
      postdeploy:
      windows:
            shell: pwsh
            run: ./scripts/postdeploy.ps1
            continueOnError: true
            interactive: true
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/postdeploy.sh; ./scripts/postdeploy.sh;
            continueOnError: true
            interactive: true
      services:
      api_and_frontend:
      project: ./src
      language: py
      host: containerapp
      docker:
            image: api_and_frontend
            remoteBuild: true
      pipeline:
      variables:
      - AZURE_RESOURCE_GROUP
      - AZURE_AIHUB_NAME
      - AZURE_AIPROJECT_NAME
      - AZURE_AISERVICES_NAME
      - AZURE_SEARCH_SERVICE_NAME
      - AZURE_APPLICATION_INSIGHTS_NAME
      - AZURE_CONTAINER_REGISTRY_NAME
      - AZURE_KEYVAULT_NAME
      - AZURE_STORAGE_ACCOUNT_NAME
      - AZURE_LOG_ANALYTICS_WORKSPACE_NAME
      - USE_CONTAINER_REGISTRY
      - USE_APPLICATION_INSIGHTS
      - USE_AZURE_AI_SEARCH_SERVICE
      - AZURE_AI_AGENT_NAME
      - AZURE_AI_AGENT_ID
      - AZURE_AI_AGENT_DEPLOYMENT_NAME
      - AZURE_AI_AGENT_DEPLOYMENT_SKU
      - AZURE_AI_AGENT_DEPLOYMENT_CAPACITY
      - AZURE_AI_AGENT_MODEL_NAME
      - AZURE_AI_AGENT_MODEL_FORMAT
      - AZURE_AI_AGENT_MODEL_VERSION
      - AZURE_AI_EMBED_DEPLOYMENT_NAME
      - AZURE_AI_EMBED_DEPLOYMENT_SKU
      - AZURE_AI_EMBED_DEPLOYMENT_CAPACITY
      - AZURE_AI_EMBED_MODEL_NAME
      - AZURE_AI_EMBED_MODEL_FORMAT
      - AZURE_AI_EMBED_MODEL_VERSION
      - AZURE_AI_EMBED_DIMENSIONS
      - AZURE_AI_SEARCH_INDEX_NAME
      - AZURE_EXISTING_AIPROJECT_RESOURCE_ID
      - AZURE_EXISTING_AIPROJECT_ENDPOINT
      - AZURE_EXISTING_AGENT_ID
      - ENABLE_AZURE_MONITOR_TRACING
      - AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED
      ```

---

## 2. ファイルの分解

ファイルをセクションごとに見て、何をしているのか、そしてなぜそうするのかを理解しましょう。

### 2.1 **ヘッダーとスキーマ (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Line 1**: IDE サポートと IntelliSense のために YAML ランゲージサーバーのスキーマ検証を提供します

### 2.2 プロジェクトのメタデータ (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Line 5**: Azure Developer CLI が使用するプロジェクト名を定義します
- **Lines 6-7**: これはテンプレート バージョン 1.0.2 に基づいていることを指定します
- **Lines 8-9**: Azure Developer CLI のバージョン 1.14.0 以上を要求します

### 2.3 デプロイフック (11-40)

```yaml title="" linenums="0"
hooks:
  preup:
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/validate_env_vars.sh; ./scripts/validate_env_vars.sh
      interactive: true
      continueOnError: false
    windows:
      shell: pwsh
      run: ./scripts/validate_env_vars.ps1
      interactive: true
      continueOnError: false      
```

- **Lines 11-20**: <strong>事前デプロイフック</strong> - `azd up` の前に実行されます

      - Unix/Linux 上: 検証スクリプトを実行可能にして実行します
      - Windows 上: PowerShell の検証スクリプトを実行します
      - どちらも対話型で、失敗した場合はデプロイを停止します

```yaml  title="" linenums="0"
  postprovision:
    windows:
      shell: pwsh
      run: ./scripts/write_env.ps1
      continueOnError: true
      interactive: true
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/write_env.sh; ./scripts/write_env.sh;
      continueOnError: true
      interactive: true
```
- **Lines 21-30**: <strong>プロビジョニング後フック</strong> - Azure リソースが作成された後に実行されます

  - 環境変数を書き込むスクリプトを実行します
  - これらのスクリプトが失敗してもデプロイを継続します（`continueOnError: true`）

```yaml title="" linenums="0"
  postdeploy:
    windows:
      shell: pwsh
      run: ./scripts/postdeploy.ps1
      continueOnError: true
      interactive: true
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/postdeploy.sh; ./scripts/postdeploy.sh;
      continueOnError: true
      interactive: true
```
- **Lines 31-40**: <strong>デプロイ後フック</strong> - アプリケーションのデプロイ後に実行されます

  - 最終セットアップスクリプトを実行します
  - スクリプトが失敗しても継続します

### 2.4 サービス構成 (41-48)

これはデプロイするアプリケーションサービスを構成します。

```yaml title="" linenums="0"
services:
  api_and_frontend:
    project: ./src
    language: py
    host: containerapp
    docker:
      image: api_and_frontend
      remoteBuild: true
```

- **Line 42**: "api_and_frontend" という名前のサービスを定義します
- **Line 43**: ソースコードとして `./src` ディレクトリを指します
- **Line 44**: プログラミング言語として Python を指定します
- **Line 45**: ホスティングプラットフォームに Azure Container Apps を使用します
- **Lines 46-48**: Docker の構成

      - "api_and_frontend" をイメージ名として使用します
      - Docker イメージをローカルではなく Azure 上でリモートにビルドします

### 2.5 パイプライン変数 (49-76)

これらは自動化のために CI/CD パイプラインで `azd` を実行する際に役立つ変数です

```yaml title="" linenums="0"
pipeline:
  variables:
    - AZURE_RESOURCE_GROUP
    - AZURE_AIHUB_NAME
    - AZURE_AIPROJECT_NAME
    - AZURE_AISERVICES_NAME
    - AZURE_SEARCH_SERVICE_NAME
    - AZURE_APPLICATION_INSIGHTS_NAME
    - AZURE_CONTAINER_REGISTRY_NAME
    - AZURE_KEYVAULT_NAME
    - AZURE_STORAGE_ACCOUNT_NAME
    - AZURE_LOG_ANALYTICS_WORKSPACE_NAME
    - USE_CONTAINER_REGISTRY
    - USE_APPLICATION_INSIGHTS
    - USE_AZURE_AI_SEARCH_SERVICE
    - AZURE_AI_AGENT_NAME
    - AZURE_AI_AGENT_ID
    - AZURE_AI_AGENT_DEPLOYMENT_NAME
    - AZURE_AI_AGENT_DEPLOYMENT_SKU
    - AZURE_AI_AGENT_DEPLOYMENT_CAPACITY
    - AZURE_AI_AGENT_MODEL_NAME
    - AZURE_AI_AGENT_MODEL_FORMAT
    - AZURE_AI_AGENT_MODEL_VERSION
    - AZURE_AI_EMBED_DEPLOYMENT_NAME
    - AZURE_AI_EMBED_DEPLOYMENT_SKU
    - AZURE_AI_EMBED_DEPLOYMENT_CAPACITY
    - AZURE_AI_EMBED_MODEL_NAME
    - AZURE_AI_EMBED_MODEL_FORMAT
    - AZURE_AI_EMBED_MODEL_VERSION
    - AZURE_AI_EMBED_DIMENSIONS
    - AZURE_AI_SEARCH_INDEX_NAME
    - AZURE_EXISTING_AIPROJECT_RESOURCE_ID
    - AZURE_EXISTING_AIPROJECT_ENDPOINT
    - AZURE_EXISTING_AGENT_ID
    - ENABLE_AZURE_MONITOR_TRACING
    - AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED
```

このセクションでは、<strong>デプロイ中</strong> に使用される環境変数をカテゴリ別に定義しています:

- **Azure リソース名（Lines 51-60）**:
      - リソース グループ、AI Hub、AI Project などのコア Azure サービスのリソース名
- **機能フラグ（Lines 61-63）**:
      - 特定の Azure サービスを有効/無効にするブール変数
- **AI エージェント構成（Lines 64-71）**:
      - 名前、ID、デプロイ設定、モデルの詳細を含むメイン AI エージェントの構成
- **AI 埋め込み構成（Lines 72-79）**:
      - ベクトル検索に使用される埋め込みモデルの構成
- **検索と監視（Lines 80-84）**:
      - 検索インデックス名、既存リソースの ID、および監視/トレーシング設定

---

## 3. 環境変数を知る
以下の環境変数は、主な目的別に整理されており、デプロイの構成や動作を制御します。ほとんどの変数には妥当なデフォルトが設定されていますが、既存の Azure リソースや要件に合わせてカスタマイズできます。

### 3.1 必須変数 

```bash title="" linenums="0"
# Azureのコア構成
AZURE_ENV_NAME                    # 環境名（リソース命名に使用）
AZURE_LOCATION                    # デプロイ先リージョン
AZURE_SUBSCRIPTION_ID             # 対象サブスクリプション
AZURE_RESOURCE_GROUP              # リソースグループ名
AZURE_PRINCIPAL_ID                # RBAC用のユーザープリンシパル

# リソース名（指定されていない場合は自動生成）
AZURE_AIHUB_NAME                  # Microsoft Foundry ハブ名
AZURE_AIPROJECT_NAME              # AIプロジェクト名
AZURE_AISERVICES_NAME             # AIサービスアカウント名
AZURE_STORAGE_ACCOUNT_NAME        # ストレージアカウント名
AZURE_CONTAINER_REGISTRY_NAME     # コンテナレジストリ名
AZURE_KEYVAULT_NAME               # Key Vault名（使用する場合）
```

### 3.2 モデル構成 
```bash title="" linenums="0"
# チャットモデルの構成
AZURE_AI_AGENT_MODEL_NAME         # デフォルト: gpt-4.1-mini
AZURE_AI_AGENT_MODEL_FORMAT       # デフォルト: OpenAI（または Microsoft）
AZURE_AI_AGENT_MODEL_VERSION      # デフォルト: 利用可能な最新版
AZURE_AI_AGENT_DEPLOYMENT_NAME    # チャットモデルのデプロイ名
AZURE_AI_AGENT_DEPLOYMENT_SKU     # デフォルト: 標準
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # デフォルト: 80（千単位のTPM）

# 埋め込みモデルの構成
AZURE_AI_EMBED_MODEL_NAME         # デフォルト: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # デフォルト: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # デフォルト: 利用可能な最新版
AZURE_AI_EMBED_DEPLOYMENT_NAME    # 埋め込み用のデプロイ名
AZURE_AI_EMBED_DEPLOYMENT_SKU     # デフォルト: 標準
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # デフォルト: 50（千単位のTPM）

# エージェントの構成
AZURE_AI_AGENT_NAME               # エージェントの表示名
AZURE_EXISTING_AGENT_ID           # 既存のエージェントを使用（任意）
```

### 3.3 機能トグル
```bash title="" linenums="0"
# オプションサービス
USE_APPLICATION_INSIGHTS         # デフォルト: true
USE_AZURE_AI_SEARCH_SERVICE      # デフォルト: false
USE_CONTAINER_REGISTRY           # デフォルト: true

# 監視とトレーシング
ENABLE_AZURE_MONITOR_TRACING     # デフォルト: false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # デフォルト: false

# 検索設定
AZURE_AI_SEARCH_INDEX_NAME       # 検索インデックス名
AZURE_SEARCH_SERVICE_NAME        # 検索サービス名
```

### 3.4 AI プロジェクト構成 
```bash title="" linenums="0"
# 既存のリソースを使用する
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # 既存のAIプロジェクトの完全なリソース ID
AZURE_EXISTING_AIPROJECT_ENDPOINT       # 既存のプロジェクトのエンドポイント URL
```

### 3.5 変数の確認

Azure Developer CLI を使用して、環境変数を表示および管理します:

```bash title="" linenums="0"
# 現在の環境のすべての環境変数を表示する
azd env get-values

# 特定の環境変数を取得する
azd env get-value AZURE_ENV_NAME

# 環境変数を設定する
azd env set AZURE_LOCATION eastus

# .envファイルから複数の変数を設定する
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:
この文書は AI 翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されました。正確性には努めていますが、自動翻訳には誤りや不正確な表現が含まれる場合があることにご注意ください。原文（原語）の文書を権威ある情報源と見なしてください。重要な情報については、専門の人間による翻訳を推奨します。本翻訳の利用に起因する誤解や誤訳について、当方は一切責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->