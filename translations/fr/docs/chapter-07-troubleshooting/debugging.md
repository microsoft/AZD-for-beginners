# Guide de débogage pour les déploiements AZD

**Navigation du chapitre :**
- **📚 Accueil du cours**: [AZD pour débutants](../../README.md)
- **📖 Chapitre actuel**: Chapitre 7 - Dépannage et débogage
- **⬅️ Précédent**: [Problèmes courants](common-issues.md)
- **➡️ Suivant**: [Dépannage spécifique à l'IA](ai-troubleshooting.md)
- **🚀 Chapitre suivant**: [Chapitre 8: Modèles de production et d'entreprise](../chapter-08-production/production-ai-practices.md)

## Introduction

Ce guide complet fournit des stratégies, outils et techniques avancés de débogage pour diagnostiquer et résoudre des problèmes complexes avec les déploiements via Azure Developer CLI. Apprenez des méthodologies systématiques de dépannage, des techniques d'analyse des journaux, du profilage des performances et des outils de diagnostic avancés pour résoudre efficacement les problèmes de déploiement et d'exécution.

## Objectifs d'apprentissage

En complétant ce guide, vous allez :
- Maîtriser les méthodologies de débogage systématiques pour les problèmes d'Azure Developer CLI
- Comprendre la configuration avancée des journaux et les techniques d'analyse des journaux
- Mettre en œuvre des stratégies de profilage des performances et de surveillance
- Utiliser les outils et services de diagnostic Azure pour résoudre des problèmes complexes
- Appliquer des techniques de débogage réseau et de dépannage de sécurité
- Configurer une surveillance et des alertes complètes pour une détection proactive des problèmes

## Résultats d'apprentissage

À l'issue de ce guide, vous serez capable de :
- Appliquer la méthodologie TRIAGE pour déboguer systématiquement des problèmes de déploiement complexes
- Configurer et analyser des informations complètes de journalisation et de traçage
- Utiliser efficacement Azure Monitor, Application Insights et les outils de diagnostic
- Déboguer de manière autonome les problèmes de connectivité réseau, d'authentification et d'autorisations
- Mettre en place des stratégies de surveillance et d'optimisation des performances
- Créer des scripts de débogage personnalisés et de l'automatisation pour les problèmes récurrents

## Méthodologie de débogage

### L'approche TRIAGE
- **T**emps : Quand le problème a-t-il commencé ?
- **R**eproduire : Pouvez-vous le reproduire de façon constante ?
- **I**soler : Quel composant est en panne ?
- **A**nalyser : Que nous disent les journaux ?
- **G**rouper : Rassemblez toutes les informations pertinentes
- **E**scalader : Quand solliciter une aide supplémentaire

## Activation du mode débogage

### Variables d'environnement
```bash
# Activer le débogage complet
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Débogage de l'Azure CLI
export AZURE_CLI_DIAGNOSTICS=true

# Désactiver la télémétrie pour une sortie plus claire
export AZD_DISABLE_TELEMETRY=true
```

### Configuration du débogage
```bash
# Définir la configuration de débogage globalement
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Activer la journalisation de trace
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 Techniques d'analyse des journaux

### Comprendre les niveaux de journalisation
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### Analyse des journaux structurés
```bash
# Afficher les journaux avec Azure Monitor (via azd monitor)
azd monitor --logs

# Afficher les journaux de l'application en temps réel
azd monitor --live

# Pour une analyse détaillée des journaux, utilisez l'Azure CLI avec votre App Service ou votre Container App:
# Journaux App Service
az webapp log tail --name <app-name> --resource-group <rg-name>

# Journaux Container App
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Exporter les journaux d'Application Insights pour analyse
az monitor app-insights query \
    --app <app-insights-name> \
    --analytics-query "traces | where timestamp > ago(1h) | where severityLevel >= 3"
```

### Corrélation des journaux
```bash
#!/bin/bash
# correlate-logs.sh - Corréler les journaux entre les services à l'aide d'Azure Monitor

TRACE_ID=$1
APP_INSIGHTS_NAME=$2

if [ -z "$TRACE_ID" ] || [ -z "$APP_INSIGHTS_NAME" ]; then
    echo "Usage: $0 <trace-id> <app-insights-name>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Rechercher dans Application Insights les journaux corrélés
az monitor app-insights query \
    --app "$APP_INSIGHTS_NAME" \
    --analytics-query "union traces, exceptions, requests, dependencies | where operation_Id == '$TRACE_ID' | order by timestamp asc"

# Rechercher les journaux d'activité Azure
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Outils avancés de débogage

### Requêtes Azure Resource Graph
```bash
# Rechercher des ressources par étiquettes
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Trouver les déploiements échoués
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Vérifier la santé des ressources
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Débogage réseau
```bash
# Tester la connectivité entre les services
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

# Utilisation
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### Débogage des conteneurs
```bash
# Déboguer les problèmes d'applications conteneurisées
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

### Débogage des connexions à la base de données
```bash
# Déboguer la connectivité à la base de données
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

## 🔬 Débogage des performances

### Surveillance des performances applicatives
```bash
# Activer le débogage d'Application Insights
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

# Surveillance personnalisée des performances
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

### Analyse de l'utilisation des ressources
```bash
# Surveiller l'utilisation des ressources
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

## 🧪 Tests et validation

### Débogage des tests d'intégration
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# Configurer l'environnement de débogage
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# Récupérer les points de terminaison du service
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# Tester les points de terminaison de santé
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

# Exécuter les tests
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# Exécuter des tests d'intégration personnalisés
npm run test:integration
```

### Tests de charge pour le débogage
```bash
# Test de charge simple pour identifier les goulots d'étranglement de performance
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Utilisation d'Apache Bench (installation : apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # Extraire les métriques clés
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # Vérifier les échecs
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 Débogage d'infrastructure

### Débogage des templates Bicep
```bash
# Valider les modèles Bicep avec une sortie détaillée
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Validation de la syntaxe
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Validation lint
    az bicep lint --file "$template_file"
    
    # Déploiement what-if
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# Déboguer le déploiement du modèle
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

### Analyse de l'état des ressources
```bash
# Analyser les états des ressources pour détecter des incohérences
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # Lister toutes les ressources avec leurs états
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # Vérifier les ressources en échec
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

## 🔒 Débogage de la sécurité

### Débogage du flux d'authentification
```bash
# Débogage de l'authentification Azure
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # Décoder le jeton JWT (nécessite jq et base64)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Débogage de l'accès au Key Vault
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

### Débogage de la sécurité réseau
```bash
# Déboguer les groupes de sécurité réseau
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # Vérifier les règles de sécurité
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 Débogage spécifique aux applications

### Débogage d'applications Node.js
```javascript
// debug-middleware.js - Middleware de débogage pour Express
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // Consigner les détails de la requête
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // Remplacer res.json pour consigner les réponses
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### Débogage des requêtes de base de données
```javascript
// database-debug.js - Utilitaires de débogage de la base de données
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

## 🚨 Procédures de débogage d'urgence

### Réponse aux incidents en production
```bash
#!/bin/bash
# emergency-debug.sh - Débogage d'urgence en production

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

# Basculer vers l'environnement correct
azd env select "$ENVIRONMENT"

# Collecter les informations critiques
echo "=== 1. System Status ==="
azd show --output json > emergency-status.json
cat emergency-status.json | jq '.services[].endpoint'

echo "=== 2. Application Health ==="
for endpoint in $(cat emergency-status.json | jq -r '.services[].endpoint'); do
    echo "Testing $endpoint/health"
    curl -f "$endpoint/health" || echo "❌ Health check failed for $endpoint"
done

echo "=== 3. Recent Errors ==="
# Utiliser Azure Monitor pour les journaux d'erreurs
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

### Procédures de retour arrière
```bash
# Script de restauration rapide
quick_rollback() {
    local environment=$1
    local previous_commit=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment"
    
    # Changer d'environnement
    azd env select "$environment"
    
    # Retour arrière via Git (AZD n'a pas de fonctionnalité de retour arrière intégrée)
    git checkout "$previous_commit"
    azd deploy
    
    # Vérifier le retour arrière
    echo "Verifying rollback..."
    azd show
    
    # Tester les points de terminaison critiques
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Tableaux de bord de débogage

### Tableau de bord de surveillance personnalisé
```bash
# Créer des requêtes Application Insights pour le débogage
create_debug_queries() {
    local app_insights_name=$1
    
    # Requête pour les erreurs
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # Requête pour les problèmes de performance
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # Requête pour les défaillances des dépendances
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### Agrégation des journaux
```bash
# Agréger les journaux provenant de plusieurs sources Azure
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

## 🔗 Ressources avancées

### Scripts de débogage personnalisés
Créez un répertoire `scripts/debug/` contenant :
- `health-check.sh` - Vérification complète de l'état
- `performance-test.sh` - Tests de performance automatisés
- `log-analyzer.py` - Analyse avancée des journaux
- `resource-validator.sh` - Validation de l'infrastructure

### Intégration de la surveillance
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

## Bonnes pratiques

1. **Activez toujours la journalisation de débogage** dans les environnements non-production
2. **Créez des cas de test reproductibles** pour les problèmes
3. **Documentez les procédures de débogage** pour votre équipe
4. **Automatisez les vérifications de santé** et la surveillance
5. **Maintenez les outils de débogage à jour** avec les changements de votre application
6. **Exercez les procédures de débogage** en dehors des périodes d'incident

## Prochaines étapes

- [Planification de la capacité](../chapter-06-pre-deployment/capacity-planning.md) - Planifier les besoins en ressources
- [Sélection des SKU](../chapter-06-pre-deployment/sku-selection.md) - Choisir les niveaux de service appropriés
- [Vérifications pré-déploiement](../chapter-06-pre-deployment/preflight-checks.md) - Validation avant déploiement
- [Aide-mémoire](../../resources/cheat-sheet.md) - Commandes de référence rapide

---

**Rappelez-vous** : Le bon débogage consiste à être systématique, minutieux et patient. Ces outils et techniques vous aideront à diagnostiquer les problèmes plus rapidement et de manière plus efficace.

---

**Navigation**
- **Leçon précédente**: [Problèmes courants](common-issues.md)

- **Leçon suivante**: [Planification de la capacité](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Avertissement :
Ce document a été traduit à l'aide du service de traduction automatique par IA Co‑op Translator (https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent comporter des erreurs ou des inexactitudes. Le document original, dans sa langue d'origine, doit être considéré comme la source faisant foi. Pour les informations critiques, il est recommandé de recourir à une traduction humaine professionnelle. Nous déclinons toute responsabilité en cas de malentendus ou d'interprétations erronées résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->