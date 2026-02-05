# AZDデプロイメントのデバッグガイド

**章のナビゲーション:**
- **📚 コースホーム**: [AZD初心者向け](../../README.md)
- **📖 現在の章**: 第7章 - トラブルシューティングとデバッグ
- **⬅️ 前へ**: [よくある問題](common-issues.md)
- **➡️ 次へ**: [AI特有のトラブルシューティング](ai-troubleshooting.md)
- **🚀 次の章**: [第8章: 本番環境とエンタープライズパターン](../microsoft-foundry/production-ai-practices.md)

## はじめに

この包括的なガイドでは、Azure Developer CLIデプロイメントにおける複雑な問題を診断し解決するための高度なデバッグ戦略、ツール、技術を提供します。体系的なトラブルシューティング手法、ログ分析技術、パフォーマンスプロファイリング、そして高度な診断ツールを学び、デプロイメントや実行時の問題を効率的に解決する方法を習得してください。

## 学習目標

このガイドを完了することで、以下を達成できます:
- Azure Developer CLIの問題に対する体系的なデバッグ手法を習得する
- 高度なログ設定とログ分析技術を理解する
- パフォーマンスプロファイリングとモニタリング戦略を実装する
- 複雑な問題解決のためのAzure診断ツールとサービスを使用する
- ネットワークデバッグやセキュリティトラブルシューティング技術を適用する
- プロアクティブな問題検出のための包括的なモニタリングとアラート設定を構成する

## 学習成果

完了後、以下ができるようになります:
- TRIAGE手法を適用して複雑なデプロイメント問題を体系的にデバッグする
- 包括的なログとトレース情報を設定し分析する
- Azure Monitor、Application Insights、診断ツールを効果的に使用する
- ネットワーク接続、認証、権限問題を独自にデバッグする
- パフォーマンスモニタリングと最適化戦略を実装する
- 再発する問題に対するカスタムデバッグスクリプトと自動化を作成する

## デバッグ手法

### TRIAGEアプローチ
- **T**ime: 問題が発生した時期は？
- **R**eproduce: 一貫して再現できますか？
- **I**solate: どのコンポーネントが失敗していますか？
- **A**nalyze: ログは何を示していますか？
- **G**ather: 関連情報をすべて収集する
- **E**scalate: 追加の支援が必要な場合

## デバッグモードの有効化

### 環境変数
```bash
# 包括的なデバッグを有効にする
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Azure CLIのデバッグ
export AZURE_CLI_DIAGNOSTICS=true

# 出力をクリーンにするためにテレメトリを無効化する
export AZD_DISABLE_TELEMETRY=true
```

### デバッグ設定
```bash
# デバッグ構成をグローバルに設定する
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# トレースログを有効にする
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 ログ分析技術

### ログレベルの理解
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### 構造化ログ分析
```bash
# レベルでログをフィルタリングする
azd logs --level error --since 1h

# サービスでフィルタリングする
azd logs --service api --level debug

# 分析のためにログをエクスポートする
azd logs --output json > deployment-logs.json

# jqを使用してJSONログを解析する
cat deployment-logs.json | jq '.[] | select(.level == "ERROR")'
```

### ログの相関
```bash
#!/bin/bash
# correlate-logs.sh - サービス間のログを相関させる

TRACE_ID=$1
if [ -z "$TRACE_ID" ]; then
    echo "Usage: $0 <trace-id>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# すべてのサービスを検索
for service in web api worker; do
    echo "=== $service logs ==="
    azd logs --service $service | grep "$TRACE_ID"
done

# Azureログを検索
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ 高度なデバッグツール

### Azure Resource Graphクエリ
```bash
# タグでリソースを照会する
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# 失敗したデプロイを見つける
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# リソースの健全性を確認する
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### ネットワークデバッグ
```bash
# サービス間の接続性をテストする
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

# 使用法
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
# データベース接続をデバッグする
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

### アプリケーションパフォーマンスモニタリング
```bash
# アプリケーションインサイトのデバッグを有効にする
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

# カスタムパフォーマンスモニタリング
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

### リソース利用状況分析
```bash
# リソース使用状況を監視する
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

### 統合テストデバッグ
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# デバッグ環境を設定する
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# サービスエンドポイントを取得する
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

### 負荷テストによるデバッグ
```bash
# パフォーマンスのボトルネックを特定するための簡単な負荷テスト
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Apache Benchを使用 (インストール: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # 主要な指標を抽出
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # 失敗を確認
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 インフラストラクチャデバッグ

### Bicepテンプレートデバッグ
```bash
# 詳細な出力でBicepテンプレートを検証する
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # 構文の検証
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # リントの検証
    az bicep lint --file "$template_file"
    
    # What-ifデプロイメント
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# テンプレートデプロイメントのデバッグ
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

### リソース状態分析
```bash
# リソース状態の不整合を分析する
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # すべてのリソースとその状態を一覧表示する
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # 失敗したリソースを確認する
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

## 🔒 セキュリティデバッグ

### 認証フローデバッグ
```bash
# Azure認証をデバッグする
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # JWTトークンをデコードする（jqとbase64が必要）
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Key Vaultアクセスをデバッグする
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

### ネットワークセキュリティデバッグ
```bash
# ネットワークセキュリティグループをデバッグする
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # セキュリティルールを確認する
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 アプリケーション特有のデバッグ

### Node.jsアプリケーションデバッグ
```javascript
// debug-middleware.js - Expressデバッグミドルウェア
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // リクエストの詳細をログに記録
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // レスポンスをログに記録するためにres.jsonをオーバーライド
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### データベースクエリデバッグ
```javascript
// database-debug.js - データベースデバッグユーティリティ
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

### 本番環境の問題対応
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
azd logs --level error --since 30m > emergency-errors.log
echo "Error count: $(wc -l < emergency-errors.log)"

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
# クイックロールバックスクリプト
quick_rollback() {
    local environment=$1
    local backup_timestamp=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment to $backup_timestamp"
    
    # 環境を切り替える
    azd env select "$environment"
    
    # アプリケーションをロールバックする
    azd deploy --rollback --timestamp "$backup_timestamp"
    
    # ロールバックを確認する
    echo "Verifying rollback..."
    azd show
    
    # 重要なエンドポイントをテストする
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 デバッグダッシュボード

### カスタムモニタリングダッシュボード
```bash
# デバッグ用のApplication Insightsクエリを作成する
create_debug_queries() {
    local app_insights_name=$1
    
    # エラーのクエリ
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # パフォーマンス問題のクエリ
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # 依存関係の失敗のクエリ
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### ログ集約
```bash
# 複数のソースからログを集約する
aggregate_logs() {
    local output_file="aggregated-logs-$(date +%Y%m%d_%H%M%S).json"
    
    echo "Aggregating logs to $output_file"
    
    {
        echo '{"source": "azd", "logs": ['
        azd logs --output json --since 1h | sed '$ ! s/$/,/'
        echo ']}'
        
        echo ',{"source": "azure", "logs": ['
        az monitor activity-log list --start-time "$(date -d '1 hour ago' -Iseconds)" --output json | sed '$ ! s/$/,/'
        echo ']}'
    } > "$output_file"
    
    echo "Logs aggregated in $output_file"
}
```

## 🔗 高度なリソース

### カスタムデバッグスクリプト
`scripts/debug/`ディレクトリを作成し、以下を含めます:
- `health-check.sh` - 包括的なヘルスチェック
- `performance-test.sh` - 自動化されたパフォーマンステスト
- `log-analyzer.py` - 高度なログ解析
- `resource-validator.sh` - インフラストラクチャ検証

### モニタリング統合
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

1. **デバッグログを常に有効化** 非本番環境で
2. **再現可能なテストケースを作成** 問題のために
3. **デバッグ手順を文書化** チームのために
4. **ヘルスチェックとモニタリングを自動化**
5. **デバッグツールを更新** アプリケーションの変更に合わせて
6. **非インシデント時にデバッグ手順を練習**

## 次のステップ

- [キャパシティプランニング](../pre-deployment/capacity-planning.md) - リソース要件を計画する
- [SKU選択](../pre-deployment/sku-selection.md) - 適切なサービス階層を選択する
- [事前チェック](../pre-deployment/preflight-checks.md) - デプロイ前の検証
- [チートシート](../../resources/cheat-sheet.md) - クイックリファレンスコマンド

---

**覚えておいてください**: 良いデバッグは体系的で、徹底的で、忍耐強くあることが重要です。これらのツールと技術は、問題をより迅速かつ効果的に診断するのに役立ちます。

---

**ナビゲーション**
- **前のレッスン**: [よくある問題](common-issues.md)

- **次のレッスン**: [キャパシティプランニング](../pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:  
この文書は、AI翻訳サービス[Co-op Translator](https://github.com/Azure/co-op-translator)を使用して翻訳されています。正確性を期しておりますが、自動翻訳には誤りや不正確な部分が含まれる可能性があります。原文（元の言語で記載された文書）を公式な情報源としてご参照ください。重要な情報については、専門の人間による翻訳をお勧めします。本翻訳の使用に起因する誤解や誤認について、当方は一切の責任を負いかねます。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->