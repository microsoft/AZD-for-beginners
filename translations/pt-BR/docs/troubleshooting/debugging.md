# Guia de Depuração para Implantações AZD

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 7 - Solução de Problemas e Depuração
- **⬅️ Anterior**: [Problemas Comuns](common-issues.md)
- **➡️ Próximo**: [Solução de Problemas Específica de IA](ai-troubleshooting.md)
- **🚀 Próximo Capítulo**: [Capítulo 8: Padrões de Produção e Empresariais](../microsoft-foundry/production-ai-practices.md)

## Introdução

Este guia abrangente fornece estratégias avançadas de depuração, ferramentas e técnicas para diagnosticar e resolver problemas complexos com implantações do Azure Developer CLI. Aprenda metodologias sistemáticas de solução de problemas, técnicas de análise de logs, perfil de desempenho e ferramentas de diagnóstico avançadas para resolver problemas de implantação e execução de forma eficiente.

## Objetivos de Aprendizagem

Ao concluir este guia, você será capaz de:
- Dominar metodologias sistemáticas de depuração para problemas do Azure Developer CLI
- Compreender configurações avançadas de logs e técnicas de análise de logs
- Implementar estratégias de monitoramento e perfil de desempenho
- Utilizar ferramentas e serviços de diagnóstico do Azure para resolver problemas complexos
- Aplicar técnicas de depuração de rede e segurança
- Configurar monitoramento abrangente e alertas para detecção proativa de problemas

## Resultados de Aprendizagem

Após a conclusão, você será capaz de:
- Aplicar a metodologia TRIAGE para depurar sistematicamente problemas complexos de implantação
- Configurar e analisar informações abrangentes de logs e rastreamento
- Utilizar Azure Monitor, Application Insights e ferramentas de diagnóstico de forma eficaz
- Depurar problemas de conectividade de rede, autenticação e permissões de forma independente
- Implementar estratégias de monitoramento e otimização de desempenho
- Criar scripts personalizados de depuração e automação para problemas recorrentes

## Metodologia de Depuração

### A Abordagem TRIAGE
- **T**empo: Quando o problema começou?
- **R**eproduzir: Você consegue reproduzi-lo consistentemente?
- **I**solar: Qual componente está falhando?
- **A**nalisar: O que os logs nos dizem?
- **C**oletar: Reúna todas as informações relevantes
- **E**scalar: Quando buscar ajuda adicional

## Ativando o Modo de Depuração

### Variáveis de Ambiente
```bash
# Habilitar depuração abrangente
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Depuração do Azure CLI
export AZURE_CLI_DIAGNOSTICS=true

# Desativar telemetria para saída mais limpa
export AZD_DISABLE_TELEMETRY=true
```

### Configuração de Depuração
```bash
# Configurar a configuração de depuração globalmente
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Ativar o registro de rastreamento
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 Técnicas de Análise de Logs

### Compreendendo os Níveis de Logs
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### Análise Estruturada de Logs
```bash
# Filtrar logs por nível
azd logs --level error --since 1h

# Filtrar por serviço
azd logs --service api --level debug

# Exportar logs para análise
azd logs --output json > deployment-logs.json

# Analisar logs JSON com jq
cat deployment-logs.json | jq '.[] | select(.level == "ERROR")'
```

### Correlação de Logs
```bash
#!/bin/bash
# correlate-logs.sh - Correlacionar logs entre serviços

TRACE_ID=$1
if [ -z "$TRACE_ID" ]; then
    echo "Usage: $0 <trace-id>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Pesquisar em todos os serviços
for service in web api worker; do
    echo "=== $service logs ==="
    azd logs --service $service | grep "$TRACE_ID"
done

# Pesquisar logs do Azure
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Ferramentas Avançadas de Depuração

### Consultas do Azure Resource Graph
```bash
# Consultar recursos por tags
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Encontrar implantações falhas
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Verificar a saúde dos recursos
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Depuração de Rede
```bash
# Testar conectividade entre serviços
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

# Uso
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### Depuração de Contêineres
```bash
# Depurar problemas do aplicativo de contêiner
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

### Depuração de Conexão com Banco de Dados
```bash
# Depurar conectividade com o banco de dados
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

## 🔬 Depuração de Desempenho

### Monitoramento de Desempenho de Aplicações
```bash
# Ativar depuração do Application Insights
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

# Monitoramento de desempenho personalizado
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

### Análise de Utilização de Recursos
```bash
# Monitorar o uso de recursos
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

## 🧪 Testes e Validação

### Depuração de Testes de Integração
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# Configurar ambiente de depuração
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# Obter endpoints de serviço
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# Testar endpoints de saúde
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

# Executar testes
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# Executar testes de integração personalizados
npm run test:integration
```

### Testes de Carga para Depuração
```bash
# Teste de carga simples para identificar gargalos de desempenho
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Usando Apache Bench (instalar: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # Extrair métricas principais
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # Verificar falhas
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 Depuração de Infraestrutura

### Depuração de Templates Bicep
```bash
# Validar templates Bicep com saída detalhada
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Validação de sintaxe
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Validação de lint
    az bicep lint --file "$template_file"
    
    # Implantação do tipo "e se"
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# Depurar implantação de template
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

### Análise do Estado dos Recursos
```bash
# Analisar estados de recursos para inconsistências
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # Listar todos os recursos com seus estados
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # Verificar recursos com falha
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

## 🔒 Depuração de Segurança

### Depuração de Fluxo de Autenticação
```bash
# Depurar autenticação do Azure
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # Decodificar token JWT (requer jq e base64)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Depurar acesso ao Key Vault
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

### Depuração de Segurança de Rede
```bash
# Depurar grupos de segurança de rede
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # Verificar regras de segurança
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 Depuração Específica de Aplicações

### Depuração de Aplicações Node.js
```javascript
// debug-middleware.js - Middleware de depuração do Express
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // Registrar detalhes da solicitação
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // Substituir res.json para registrar respostas
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### Depuração de Consultas de Banco de Dados
```javascript
// database-debug.js - Utilitários de depuração de banco de dados
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

## 🚨 Procedimentos de Depuração de Emergência

### Resposta a Problemas em Produção
```bash
#!/bin/bash
# emergency-debug.sh - Depuração de emergência em produção

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

# Alterar para o ambiente correto
azd env select "$ENVIRONMENT"

# Coletar informações críticas
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

### Procedimentos de Rollback
```bash
# Script de reversão rápida
quick_rollback() {
    local environment=$1
    local backup_timestamp=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment to $backup_timestamp"
    
    # Alternar ambiente
    azd env select "$environment"
    
    # Reverter aplicação
    azd deploy --rollback --timestamp "$backup_timestamp"
    
    # Verificar reversão
    echo "Verifying rollback..."
    azd show
    
    # Testar endpoints críticos
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Dashboards de Depuração

### Dashboard de Monitoramento Personalizado
```bash
# Criar consultas do Application Insights para depuração
create_debug_queries() {
    local app_insights_name=$1
    
    # Consultar por erros
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # Consultar por problemas de desempenho
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # Consultar por falhas de dependência
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### Agregação de Logs
```bash
# Agregar logs de várias fontes
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

## 🔗 Recursos Avançados

### Scripts Personalizados de Depuração
Crie um diretório `scripts/debug/` com:
- `health-check.sh` - Verificação abrangente de saúde
- `performance-test.sh` - Teste automatizado de desempenho
- `log-analyzer.py` - Análise avançada de logs
- `resource-validator.sh` - Validação de infraestrutura

### Integração de Monitoramento
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

## Melhores Práticas

1. **Sempre habilite o registro de depuração** em ambientes não produtivos
2. **Crie casos de teste reproduzíveis** para os problemas
3. **Documente os procedimentos de depuração** para sua equipe
4. **Automatize verificações de saúde** e monitoramento
5. **Mantenha as ferramentas de depuração atualizadas** com as mudanças da aplicação
6. **Pratique os procedimentos de depuração** durante períodos sem incidentes

## Próximos Passos

- [Planejamento de Capacidade](../pre-deployment/capacity-planning.md) - Planeje os requisitos de recursos
- [Seleção de SKU](../pre-deployment/sku-selection.md) - Escolha os níveis de serviço apropriados
- [Verificações Preliminares](../pre-deployment/preflight-checks.md) - Validação pré-implantação
- [Cheat Sheet](../../resources/cheat-sheet.md) - Comandos de referência rápida

---

**Lembre-se**: Uma boa depuração é sobre ser sistemático, minucioso e paciente. Essas ferramentas e técnicas ajudarão você a diagnosticar problemas de forma mais rápida e eficaz.

---

**Navegação**
- **Lição Anterior**: [Problemas Comuns](common-issues.md)

- **Próxima Lição**: [Planejamento de Capacidade](../pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se a tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->