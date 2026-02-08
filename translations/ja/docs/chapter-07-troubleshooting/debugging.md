# AZD デプロイのデバッグガイド

**Chapter Navigation:**
- **📚 コースホーム**: [AZD 入門](../../README.md)
- **📖 現在の章**: 第7章 - トラブルシューティングとデバッグ
- **⬅️ 前へ**: [よくある問題](common-issues.md)
- **➡️ 次へ**: [AI固有のトラブルシューティング](ai-troubleshooting.md)
- **🚀 次章**: [第8章: 本番運用とエンタープライズパターン](../chapter-08-production/production-ai-practices.md)

## はじめに

この包括的なガイドは、Azure Developer CLI のデプロイに関する複雑な問題を診断・解決するための高度なデバッグ戦略、ツール、手法を提供します。体系的なトラブルシューティング手法、ログ解析技術、パフォーマンスプロファイリング、および高度な診断ツールを学び、デプロイおよびランタイムの問題を効率的に解決できるようにします。

## 学習目標

このガイドを修了すると、次のことができるようになります:
- Azure Developer CLI の問題に対する体系的なデバッグ手法を習得する
- 高度なログ設定とログ解析手法を理解する
- パフォーマンスプロファイリングと監視戦略を実装する
- 複雑な問題解決のために Azure の診断ツールとサービスを利用する
- ネットワークデバッグとセキュリティトラブルシューティング手法を適用する
- 包括的な監視とアラートを構成し、事前に問題を検出する

## 学習成果

完了時には、次のことができるようになります:
- TRIAGE 手法を適用して体系的に複雑なデプロイ問題をデバッグする
- 包括的なログおよびトレース情報を構成・分析する
- Azure Monitor、Application Insights、および診断ツールを効果的に使用する
- ネットワーク接続、認証、および権限の問題を自立してデバッグする
- パフォーマンス監視と最適化戦略を実装する
- 繰り返し発生する問題のためのカスタムデバッグスクリプトと自動化を作成する

## デバッグ手法

### TRIAGE アプローチ
- **T**ime: 問題はいつ始まりましたか？
- **R**eproduce: 一貫して再現できますか？
- **I**solate: どのコンポーネントが失敗していますか？
- **A**nalyze: ログは何を示していますか？
- **G**ather: 関連するすべての情報を収集する
- **E**scalate: いつ追加の支援を求めるか

## デバッグモードの有効化

### 環境変数
```bash
# 包括的なデバッグを有効にする
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Azure CLI のデバッグ
export AZURE_CLI_DIAGNOSTICS=true

# 出力をより簡潔にするためにテレメトリを無効にする
export AZD_DISABLE_TELEMETRY=true
```

### デバッグ構成
```bash
# デバッグ構成をグローバルに設定する
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# トレースログを有効にする
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 ログ解析の手法

### ログレベルの理解
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### 構造化ログ解析
```bash
# Azure Monitor（azd monitor 経由）でログを表示
azd monitor --logs

# アプリケーションログをリアルタイムで表示
azd monitor --live

# 詳細なログ分析には、App Service または Container App で Azure CLI を使用してください:
# App Service のログ
az webapp log tail --name <app-name> --resource-group <rg-name>

# Container App のログ
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# 分析のために Application Insights のログをエクスポートする
az monitor app-insights query \
    --app <app-insights-name> \
    --analytics-query "traces | where timestamp > ago(1h) | where severityLevel >= 3"
```

### ログ相関
```bash
#!/bin/bash
# correlate-logs.sh - Azure Monitor を使用してサービス間のログを相関させる

TRACE_ID=$1
APP_INSIGHTS_NAME=$2

if [ -z "$TRACE_ID" ] || [ -z "$APP_INSIGHTS_NAME" ]; then
    echo "Usage: $0 <trace-id> <app-insights-name>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Application Insights で相関したログを検索する
az monitor app-insights query \
    --app "$APP_INSIGHTS_NAME" \
    --analytics-query "union traces, exceptions, requests, dependencies | where operation_Id == '$TRACE_ID' | order by timestamp asc"

# Azure のアクティビティログを検索する
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ 高度なデバッグツール

### Azure Resource Graph クエリ
```bash
# タグでリソースを検索する
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# 失敗したデプロイメントを見つける
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# リソースの状態を確認する
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### ネットワークデバッグ
```bash
# サービス間の接続をテストする
test_connectivity() {
    local source=$1
    local dest=$2
    local port=$3
    
    echo "Testing connectivity from $source to $dest:$port"
    
    az network watcher test-connectivity \
        --source-resource "$source" \
        --dest-address "$dest" \
        --dest-port "$port" \
        --output table
}

# 使用方法
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### コンテナデバッグ
```bash
# コンテナアプリの問題をデバッグする
debug_container() {
    local app_name=$1
    local resource_group=$2
    
    echo "=== Container App Status ==="
    az containerapp show --name "$app_name" --resource-group "$resource_group" \
        --query "properties.{provisioningState:provisioningState,runningState:runningState}"
    
    echo "=== Container App Revisions ==="
    az containerapp revision list --name "$app_name" --resource-group "$resource_group" \
        --query "[].{name:name,active:properties.active,createdTime:properties.createdTime}"
    
    echo "=== Container Logs ==="
    az containerapp logs show --name "$app_name" --resource-group "$resource_group" --follow
}
```

### データベース接続デバッグ
```bash
# データベース接続のデバッグ
debug_database() {
    local db_server=$1
    local db_name=$2
    
    echo "=== Database Server Status ==="
    az postgres flexible-server show --name "$db_server" --resource-group "$resource_group" \
        --query "{state:state,version:version,location:location}"
    
    echo "=== Firewall Rules ==="
    az postgres flexible-server firewall-rule list --name "$db_server" --resource-group "$resource_group"
    
    echo "=== Connection Test ==="
    timeout 10 bash -c "</dev/tcp/$db_server.postgres.database.azure.com/5432" && echo "Port 5432 is open" || echo "Port 5432 is closed"
}
```

## 🔬 パフォーマンスデバッグ

### アプリケーションパフォーマンス監視
```bash
# Application Insights のデバッグを有効にする
export APPLICATIONINSIGHTS_CONFIGURATION_CONTENT='{
  "role": {
    "name": "myapp-debug"
  },
  "sampling": {
    "percentage": 100
  },
  "instrumentation": {
    "logging": {
      "level": "DEBUG"
    }
  }
}'

# カスタムパフォーマンス監視
monitor_performance() {
    local endpoint=$1
    local duration=${2:-60}
    
    echo "Monitoring $endpoint for $duration seconds..."
    
    for i in $(seq 1 $duration); do
        response_time=$(curl -o /dev/null -s -w "%{time_total}" "$endpoint")
        status_code=$(curl -o /dev/null -s -w "%{http_code}" "$endpoint")
        
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Status: $status_code, Response Time: ${response_time}s"
        sleep 1
    done
}
```

### リソース使用状況の分析
```bash
# リソースの使用状況を監視する
monitor_resources() {
    local resource_group=$1
    
    echo "=== CPU Usage ==="
    az monitor metrics list \
        --resource-group "$resource_group" \
        --resource-type "Microsoft.Web/sites" \
        --metric "CpuPercentage" \
        --interval PT1M \
        --aggregation Average
    
    echo "=== Memory Usage ==="
    az monitor metrics list \
        --resource-group "$resource_group" \
        --resource-type "Microsoft.Web/sites" \
        --metric "MemoryPercentage" \
        --interval PT1M \
        --aggregation Average
}
```

## 🧪 テストと検証

### 統合テストのデバッグ
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# デバッグ環境を設定する
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# サービスのエンドポイントを取得する
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# ヘルスエンドポイントをテストする
test_health() {
    local service=$1
    local url=$2
    
    echo "Testing $service health..."
    
    response=$(curl -s -o /dev/null -w "%{http_code},%{time_total}" "$url/health")
    status_code=$(echo $response | cut -d',' -f1)
    response_time=$(echo $response | cut -d',' -f2)
    
    if [ "$status_code" = "200" ]; then
        echo "✅ $service is healthy (${response_time}s)"
    else
        echo "❌ $service health check failed ($status_code)"
        return 1
    fi
}

# テストを実行する
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# カスタム統合テストを実行する
npm run test:integration
```

### デバッグのための負荷テスト
```bash
# パフォーマンス上のボトルネックを特定するための簡単な負荷テスト
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Apache Bench を使用 (インストール: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # 主要な指標を抽出する
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # 失敗を確認する
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 インフラストラクチャのデバッグ

### Bicep テンプレートのデバッグ
```bash
# 詳細な出力で Bicep テンプレートを検証する
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # 構文検証
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Lint 検証
    az bicep lint --file "$template_file"
    
    # What-if 展開
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# テンプレートのデプロイをデバッグする
debug_deployment() {
    local deployment_name=$1
    local resource_group=$2
    
    echo "=== Deployment Status ==="
    az deployment group show \
        --name "$deployment_name" \
        --resource-group "$resource_group" \
        --query "properties.{provisioningState:provisioningState,timestamp:timestamp}"
    
    echo "=== Deployment Operations ==="
    az deployment operation group list \
        --name "$deployment_name" \
        --resource-group "$resource_group" \
        --query "[].{operationId:operationId,provisioningState:properties.provisioningState,resourceType:properties.targetResource.resourceType,error:properties.statusMessage.error}"
}
```

### リソース状態の分析
```bash
# リソースの状態を解析して矛盾を検出する
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # すべてのリソースとその状態を一覧表示する
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # 失敗しているリソースを確認する
    failed_resources=$(az resource list --resource-group "$resource_group" \
        --query "[?properties.provisioningState != 'Succeeded'].{name:name,state:properties.provisioningState}" \
        --output tsv)
    
    if [ -n "$failed_resources" ]; then
        echo "❌ Failed resources found:"
        echo "$failed_resources"
    else
        echo "✅ All resources provisioned successfully"
    fi
}
```

## 🔒 セキュリティのデバッグ

### 認証フローのデバッグ
```bash
# Azure 認証のデバッグ
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # JWT トークンをデコードする (jq と base64 が必要)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Key Vault へのアクセスのデバッグ
debug_keyvault() {
    local vault_name=$1
    
    echo "=== Key Vault Access Policies ==="
    az keyvault show --name "$vault_name" --query "properties.accessPolicies[].{objectId:objectId,permissions:permissions}"
    
    echo "=== RBAC Assignments ==="
    vault_id=$(az keyvault show --name "$vault_name" --query id -o tsv)
    az role assignment list --scope "$vault_id"
    
    echo "=== Test Secret Access ==="
    az keyvault secret list --vault-name "$vault_name" --query "[].name" || echo "❌ Cannot access secrets"
}
```

### ネットワークセキュリティのデバッグ
```bash
# ネットワーク セキュリティ グループをデバッグする
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # セキュリティ ルールを確認する
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 アプリケーション固有のデバッグ

### Node.js アプリケーションのデバッグ
```javascript
// debug-middleware.js - Express のデバッグ用ミドルウェア
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // リクエストの詳細をログに記録する
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // res.json を上書きしてレスポンスをログに記録する
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### データベースクエリのデバッグ
```javascript
// database-debug.js - データベースのデバッグ用ユーティリティ
const { Pool } = require('pg');
const debug = require('debug')('app:db');

class DebuggingPool extends Pool {
    async query(text, params) {
        const start = Date.now();
        debug('Executing query:', { text, params });
        
        try {
            const result = await super.query(text, params);
            const duration = Date.now() - start;
            debug(`Query completed in ${duration}ms`, {
                rowCount: result.rowCount,
                command: result.command
            });
            return result;
        } catch (error) {
            const duration = Date.now() - start;
            debug(`Query failed after ${duration}ms:`, error.message);
            throw error;
        }
    }
}

module.exports = DebuggingPool;
```

## 🚨 緊急デバッグ手順

### 本番障害対応
```bash
#!/bin/bash
# emergency-debug.sh - 緊急の本番デバッグ

set -e

RESOURCE_GROUP=$1
ENVIRONMENT=$2

if [ -z "$RESOURCE_GROUP" ] || [ -z "$ENVIRONMENT" ]; then
    echo "Usage: $0 <resource-group> <environment>"
    exit 1
fi

echo "🚨 EMERGENCY DEBUGGING STARTED: $(date)"
echo "Resource Group: $RESOURCE_GROUP"
echo "Environment: $ENVIRONMENT"

# 正しい環境に切り替える
azd env select "$ENVIRONMENT"

# 重要な情報を収集する
echo "=== 1. System Status ==="
azd show --output json > emergency-status.json
cat emergency-status.json | jq '.services[].endpoint'

echo "=== 2. Application Health ==="
for endpoint in $(cat emergency-status.json | jq -r '.services[].endpoint'); do
    echo "Testing $endpoint/health"
    curl -f "$endpoint/health" || echo "❌ Health check failed for $endpoint"
done

echo "=== 3. Recent Errors ==="
# エラーログに Azure Monitor を使用する
azd monitor --logs
echo "Check Application Insights for detailed error analysis"

echo "=== 4. Resource Status ==="
az resource list --resource-group "$RESOURCE_GROUP" \
    --query "[?properties.provisioningState != 'Succeeded']" > failed-resources.json

if [ -s failed-resources.json ]; then
    echo "❌ Failed resources found!"
    cat failed-resources.json
else
    echo "✅ All resources are healthy"
fi

echo "=== 5. Recent Deployments ==="
az deployment group list --resource-group "$RESOURCE_GROUP" \
    --query "[?properties.timestamp >= '$(date -d '1 hour ago' -Iseconds)']" \
    > recent-deployments.json

echo "Emergency debugging completed: $(date)"
echo "Files generated:"
echo "  - emergency-status.json"
echo "  - emergency-errors.log"
echo "  - failed-resources.json"
echo "  - recent-deployments.json"
```

### ロールバック手順
```bash
# 迅速なロールバックスクリプト
quick_rollback() {
    local environment=$1
    local previous_commit=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment"
    
    # 環境の切り替え
    azd env select "$environment"
    
    # Gitを使用したロールバック（AZDには組み込みのロールバック機能がない）
    git checkout "$previous_commit"
    azd deploy
    
    # ロールバックの検証
    echo "Verifying rollback..."
    azd show
    
    # 重要なエンドポイントのテスト
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 デバッグダッシュボード

### カスタム監視ダッシュボード
```bash
# デバッグ用の Application Insights クエリを作成する
create_debug_queries() {
    local app_insights_name=$1
    
    # エラーを検索するクエリ
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # パフォーマンス問題を検索するクエリ
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # 依存関係の障害を検索するクエリ
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### ログ集約
```bash
# 複数の Azure ソースからログを集約する
aggregate_logs() {
    local output_file="aggregated-logs-$(date +%Y%m%d_%H%M%S).json"
    local app_insights_name=$1
    
    echo "Aggregating logs to $output_file"
    
    {
        echo '{"source": "azure-activity", "logs": '
        az monitor activity-log list --start-time "$(date -d '1 hour ago' -Iseconds)" --output json
        echo '}'
        
        if [ -n "$app_insights_name" ]; then
            echo ',{"source": "app-insights", "logs": '
            az monitor app-insights query --app "$app_insights_name" \
                --analytics-query "union traces, exceptions | where timestamp > ago(1h)" --output json
            echo '}'
        fi
    } > "$output_file"
    
    echo "Logs aggregated in $output_file"
}
```

## 🔗 高度なリソース

### カスタムデバッグスクリプト
Create a `scripts/debug/` directory with:
- `health-check.sh` - 包括的なヘルスチェック
- `performance-test.sh` - 自動化されたパフォーマンステスト
- `log-analyzer.py` - 高度なログ解析と分析
- `resource-validator.sh` - インフラ検証

### 監視統合
```yaml
# azure.yaml - Add debugging hooks
hooks:
  postdeploy:
    shell: sh
    run: |
      echo "Running post-deployment debugging..."
      ./scripts/debug/health-check.sh
      ./scripts/debug/performance-test.sh
      
      if [ "$?" -ne 0 ]; then
        echo "❌ Post-deployment checks failed"
        exit 1
      fi
```

## ベストプラクティス

1. **本番環境以外では常にデバッグログを有効にする**
2. **再現可能なテストケースを作成する**（問題の再現手順を確立する）
3. **チーム向けにデバッグ手順を文書化する**
4. **ヘルスチェックと監視を自動化する**
5. **アプリ変更に合わせてデバッグツールを更新する**
6. **障害発生時以外にデバッグ手順を演習する**

## 次のステップ

- [容量計画](../chapter-06-pre-deployment/capacity-planning.md) - リソース要件を計画する
- [SKU 選定](../chapter-06-pre-deployment/sku-selection.md) - 適切なサービス階層を選択する
- [事前チェック](../chapter-06-pre-deployment/preflight-checks.md) - 事前デプロイ検証
- [チートシート](../../resources/cheat-sheet.md) - コマンドのクイックリファレンス

---

**覚えておいてください**: 良いデバッグは体系的で徹底的、そして忍耐強さが重要です。これらのツールと手法は、問題をより速く、より効果的に診断するのに役立ちます。

---

**ナビゲーション**
- **前のレッスン**: [よくある問題](common-issues.md)

- **次のレッスン**: [容量計画](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責事項：
この文書はAI翻訳サービス「Co‑op Translator」（https://github.com/Azure/co-op-translator）を使用して翻訳されました。正確性の確保に努めていますが、自動翻訳には誤りや不正確な表現が含まれる可能性があることにご留意ください。原文（原言語版）が正式かつ優先される情報源とみなされます。重要な情報については、専門の翻訳者による人間の翻訳をお勧めします。本翻訳の利用により生じたいかなる誤解や解釈の相違についても、翻訳を提供する者は責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->