# 4. テンプレートの構成

!!! tip "このモジュールの終了時には次ができるようになります"

    - [ ] `azure.yaml` の目的を理解する
    - [ ] `azure.yaml` の構造を理解する
    - [ ] azd ライフサイクルの `hooks` の価値を理解する
    - [ ] **ラボ 4:** 環境変数の調査と変更

---

!!! prompt "`azure.yaml` ファイルは何をしますか？コードフェンスを使って行ごとに説明してください"

      `azure.yaml` ファイルは **Azure Developer CLI (azd) の設定ファイル** です。インフラ、サービス、デプロイ用フック、および環境変数を含め、アプリケーションを Azure にデプロイする方法を定義します。

---

## 1. 目的と機能

この `azure.yaml` ファイルは、AI エージェント アプリケーションのための **デプロイ ブループリント** として機能します。これにより以下を行います:

1. デプロイ前に **環境を検証** します
2. **Azure AI サービスをプロビジョニング** します（AI Hub、AI Project、Search など）
3. **Python アプリケーションを** Azure Container Apps にデプロイします
4. チャットおよび埋め込み機能のために **AI モデルを構成** します
5. AI アプリケーションの **監視とトレースを設定** します
6. 新規および既存の Azure AI プロジェクトのシナリオの両方を処理します

このファイルにより、適切な検証、プロビジョニング、およびデプロイ後の構成を伴った、完全な AI エージェント ソリューションを **ワンコマンドでデプロイ** (`azd up`) できるようになります。

??? info "展開して表示: `azure.yaml`"

      `azure.yaml` ファイルは、Azure Developer CLI がこの AI エージェント アプリケーションを Azure にどのようにデプロイおよび管理するかを定義します。以下で行ごとに分解して説明します。

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

ファイルをセクションごとに見て、何をしているのか、なぜそうしているのかを理解しましょう。

### 2.1 **ヘッダーとスキーマ (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **行 1**: IDE のサポートと IntelliSense のために YAML ラングエージサーバーのスキーマ検証を提供します

### 2.2 プロジェクト メタデータ (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **行 5**: Azure Developer CLI によって使用されるプロジェクト名を定義します
- **行 6-7**: これはテンプレートのバージョン 1.0.2 に基づいていることを指定します
- **行 8-9**: Azure Developer CLI のバージョン 1.14.0 以上が必要であることを示します

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

- **行 11-20**: **事前デプロイフック** - `azd up` の前に実行されます

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
- **行 21-30**: **プロビジョニング後フック** - Azure リソースが作成された後に実行されます

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
- **行 31-40**: **デプロイ後フック** - アプリケーションのデプロイ後に実行されます

  - 最終セットアップスクリプトを実行します
  - スクリプトが失敗しても継続します

### 2.4 サービス設定 (41-48)

この設定はデプロイするアプリケーション サービスを構成します。

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

- **行 42**: "api_and_frontend" という名前のサービスを定義します
- **行 43**: ソースコードとして `./src` ディレクトリを指します
- **行 44**: プログラミング言語として Python を指定します
- **行 45**: ホスティング プラットフォームとして Azure Container Apps を使用します
- **行 46-48**: Docker の構成

      - イメージ名として "api_and_frontend" を使用します
      - Docker イメージをローカルではなく Azure 上でリモートでビルドします

### 2.5 パイプライン変数 (49-76)

これらは CI/CD パイプラインで自動化のために `azd` を実行する際に使用する変数です

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

このセクションは、**デプロイ中** に使用される環境変数をカテゴリ別に定義しています:

- **Azure リソース名（行 51-60）**:
      - リソースグループ、AI Hub、AI Project などの主要な Azure サービスのリソース名
- **機能フラグ（行 61-63）**:
      - 特定の Azure サービスを有効/無効にするブール変数
- **AI エージェント構成（行 64-71）**:
      - 名前、ID、デプロイ設定、モデルの詳細など、メイン AI エージェントの構成
- **AI 埋め込み構成（行 72-79）**:
      - ベクトル検索に使用される埋め込みモデルの構成
- **検索と監視（行 80-84）**:
      - 検索インデックス名、既存リソースの ID、監視/トレース設定

---

## 3. 環境変数について

以下の環境変数は、デプロイの構成と動作を制御します。これらは主要な目的ごとに整理されています。ほとんどの変数には合理的なデフォルトが設定されていますが、特定の要件や既存の Azure リソースに合わせてカスタマイズできます。

### 3.1 必須の変数 

```bash title="" linenums="0"
# Azure のコア構成
AZURE_ENV_NAME                    # 環境名（リソースの命名に使用）
AZURE_LOCATION                    # デプロイ先リージョン
AZURE_SUBSCRIPTION_ID             # 対象サブスクリプション
AZURE_RESOURCE_GROUP              # リソースグループ名
AZURE_PRINCIPAL_ID                # RBAC 用のユーザープリンシパル

# リソース名（未指定の場合は自動生成）
AZURE_AIHUB_NAME                  # Microsoft Foundry ハブ名
AZURE_AIPROJECT_NAME              # AI プロジェクト名
AZURE_AISERVICES_NAME             # AI サービスのアカウント名
AZURE_STORAGE_ACCOUNT_NAME        # ストレージアカウント名
AZURE_CONTAINER_REGISTRY_NAME     # コンテナレジストリ名
AZURE_KEYVAULT_NAME               # Key Vault 名（使用する場合）
```

### 3.2 モデル構成 
```bash title="" linenums="0"
# チャットモデルの構成
AZURE_AI_AGENT_MODEL_NAME         # デフォルト: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # デフォルト: OpenAI（または Microsoft）
AZURE_AI_AGENT_MODEL_VERSION      # デフォルト: 利用可能な最新バージョン
AZURE_AI_AGENT_DEPLOYMENT_NAME    # チャットモデルのデプロイメント名
AZURE_AI_AGENT_DEPLOYMENT_SKU     # デフォルト: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # デフォルト: 80（千単位のTPM）

# 埋め込みモデルの構成
AZURE_AI_EMBED_MODEL_NAME         # デフォルト: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # デフォルト: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # デフォルト: 利用可能な最新バージョン
AZURE_AI_EMBED_DEPLOYMENT_NAME    # 埋め込みのデプロイメント名
AZURE_AI_EMBED_DEPLOYMENT_SKU     # デフォルト: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # デフォルト: 50（千単位のTPM）

# エージェントの構成
AZURE_AI_AGENT_NAME               # エージェントの表示名
AZURE_EXISTING_AGENT_ID           # 既存のエージェントを使用する（任意）
```

### 3.3 機能トグル
```bash title="" linenums="0"
# オプションサービス
USE_APPLICATION_INSIGHTS         # 既定: true
USE_AZURE_AI_SEARCH_SERVICE      # 既定: false
USE_CONTAINER_REGISTRY           # 既定: true

# 監視とトレース
ENABLE_AZURE_MONITOR_TRACING     # 既定: false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # 既定: false

# 検索設定
AZURE_AI_SEARCH_INDEX_NAME       # 検索インデックス名
AZURE_SEARCH_SERVICE_NAME        # 検索サービス名
```

### 3.4 AI プロジェクト構成 
```bash title="" linenums="0"
# 既存のリソースを使用する
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # 既存のAIプロジェクトの完全なリソースID
AZURE_EXISTING_AIPROJECT_ENDPOINT       # 既存プロジェクトのエンドポイントURL
```

### 3.5 変数の確認

Azure Developer CLI を使用して環境変数を表示および管理します:

```bash title="" linenums="0"
# 現在の環境のすべての環境変数を表示する
azd env get-values

# 特定の環境変数を取得する
azd env get-value AZURE_ENV_NAME

# 環境変数を設定する
azd env set AZURE_LOCATION eastus

# .env ファイルから複数の変数を設定する
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責事項：
この文書は AI 翻訳サービス「Co-op Translator」(https://github.com/Azure/co-op-translator) を用いて翻訳されました。正確性には努めていますが、機械翻訳には誤りや不正確な箇所が含まれる可能性があります。原文（原言語）の文書を正式な情報源とみなしてください。重要な内容については、専門の人間による翻訳を推奨します。本翻訳の使用により生じたいかなる誤解や解釈の相違についても、当社は責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->