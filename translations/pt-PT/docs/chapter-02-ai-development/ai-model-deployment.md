# Implementação de Modelo de IA com Azure Developer CLI

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD For Beginners](../../README.md)
- **📖 Capítulo Atual**: Capítulo 2 - Desenvolvimento com IA em Primeiro Lugar
- **⬅️ Anterior**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ Seguinte**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuração](../chapter-03-configuration/configuration.md)

Este guia fornece instruções completas para a implementação de modelos de IA usando templates AZD, abrangendo desde a seleção do modelo até padrões de implementação em produção.

> **Nota de validação (2026-03-25):** O fluxo de trabalho AZD deste guia foi verificado com o `azd` `1.23.12`. Para implementações de IA que demoram mais do que o tempo padrão de implementação do serviço, as versões atuais do AZD suportam `azd deploy --timeout <seconds>`.

## Índice

- [Estratégia de Seleção de Modelo](#estratégia-de-seleção-de-modelo)
- [Configuração AZD para Modelos de IA](#configuração-azd-para-modelos-de-ia)
- [Padrões de Implementação](#padrões-de-implementação)
- [Gestão de Modelos](#gestão-de-modelos)
- [Considerações para Produção](#considerações-para-produção)
- [Monitorização e Observabilidade](#monitorização-e-observabilidade)

## Estratégia de Seleção de Modelo

### Modelos Microsoft Foundry Modelos

Escolha o modelo certo para o seu caso de uso:

```yaml
# azure.yaml - Model configuration
services:
  ai-service:
    project: ./infra
    host: containerapp
    config:
      AZURE_OPENAI_MODELS: |
        [
          {
            "name": "gpt-4.1-mini",
            "version": "2024-07-18",
            "deployment": "gpt-4.1-mini",
            "capacity": 10,
            "format": "OpenAI"
          },
          {
            "name": "text-embedding-3-large",
            "version": "1",
            "deployment": "text-embedding-3-large", 
            "capacity": 30,
            "format": "OpenAI"
          }
        ]
```

### Planeamento da Capacidade do Modelo

| Tipo de Modelo | Caso de Uso | Capacidade Recomendada | Considerações de Custo |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | Chat, Q&A | 10-50 TPM | Custo eficaz para a maioria das cargas de trabalho |
| gpt-4.1 | Raciocínio complexo | 20-100 TPM | Custo elevado, usar para funcionalidades premium |
| text-embedding-3-large | Pesquisa, RAG | 30-120 TPM | Escolha padrão forte para pesquisa semântica e recuperação |
| Whisper | Fala para texto | 10-50 TPM | Cargas de trabalho de processamento de áudio |

## Configuração AZD para Modelos de IA

### Configuração do Template Bicep

Crie implementações de modelos através de templates Bicep:

```bicep
// infra/main.bicep
@description('OpenAI model deployments')
param openAiModelDeployments array = [
  {
    name: 'gpt-4.1-mini'
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2024-07-18'
    }
    sku: {
      name: 'Standard'
      capacity: 10
    }
  }
  {
    name: 'text-embedding-3-large'
    model: {
      format: 'OpenAI'
      name: 'text-embedding-3-large'
      version: '1'
    }
    sku: {
      name: 'Standard'
      capacity: 30
    }
  }
]

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: openAiAccountName
  location: location
  kind: 'OpenAI'
  properties: {
    customSubDomainName: openAiAccountName
    networkAcls: {
      defaultAction: 'Allow'
    }
    publicNetworkAccess: 'Enabled'
  }
  sku: {
    name: 'S0'
  }
}

@batchSize(1)
resource deployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = [for deployment in openAiModelDeployments: {
  parent: openAi
  name: deployment.name
  properties: {
    model: deployment.model
  }
  sku: deployment.sku
}]
```

### Variáveis de Ambiente

Configure o ambiente da sua aplicação:

```bash
# Configuração do .env
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

## Padrões de Implementação

### Padrão 1: Implementação numa Região Única

```yaml
# azure.yaml - Single region
services:
  ai-app:
    project: ./src
    host: containerapp
    config:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
      AZURE_OPENAI_CHAT_DEPLOYMENT: gpt-4.1-mini
```

Ideal para:
- Desenvolvimento e testes
- Aplicações para mercados únicos
- Otimização de custos

### Padrão 2: Implementação Multi-Região

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

Ideal para:
- Aplicações globais
- Requisitos de alta disponibilidade
- Distribuição de carga

### Padrão 3: Implementação Híbrida

Combine Modelos Microsoft Foundry com outros serviços de IA:

```bicep
// Hybrid AI services
resource cognitiveServices 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: cognitiveServicesName
  location: location
  kind: 'CognitiveServices'
  properties: {
    customSubDomainName: cognitiveServicesName
  }
  sku: {
    name: 'S0'
  }
}

resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: documentIntelligenceName
  location: location
  kind: 'FormRecognizer'
  properties: {
    customSubDomainName: documentIntelligenceName
  }
  sku: {
    name: 'S0'
  }
}
```

## Gestão de Modelos

### Controlo de Versão

Acompanhe versões de modelo na sua configuração AZD:

```json
{
  "models": {
    "chat": {
      "name": "gpt-4.1-mini",
      "version": "2024-07-18",
      "fallback": "gpt-4.1"
    },
    "embedding": {
      "name": "text-embedding-3-large",
      "version": "1"
    }
  }
}
```

### Atualizações de Modelo

Use hooks AZD para atualizações de modelo:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"

# Se o deployment demorar mais do que o timeout padrão
azd deploy --timeout 1800
```

### Testes A/B

Implemente múltiplas versões de modelo:

```bicep
param enableABTesting bool = false

resource chatDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4.1-mini-${enableABTesting ? 'v1' : 'prod'}'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2024-07-18'
    }
  }
  sku: {
    name: 'Standard'
    capacity: enableABTesting ? 5 : 10
  }
}
```

## Considerações para Produção

### Planeamento de Capacidade

Calcule a capacidade necessária com base nos padrões de utilização:

```python
# Exemplo de cálculo de capacidade
def calculate_required_capacity(
    requests_per_minute: int,
    avg_prompt_tokens: int,
    avg_completion_tokens: int,
    safety_margin: float = 0.2
) -> int:
    """Calculate required TPM capacity."""
    total_tokens_per_request = avg_prompt_tokens + avg_completion_tokens
    total_tpm = requests_per_minute * total_tokens_per_request
    return int(total_tpm * (1 + safety_margin))

# Exemplo de utilização
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### Configuração de Auto-escala

Configure autoscaling para Container Apps:

```bicep
resource containerApp 'Microsoft.App/containerApps@2024-03-01' = {
  name: containerAppName
  properties: {
    template: {
      scale: {
        minReplicas: 1
        maxReplicas: 10
        rules: [
          {
            name: 'http-rule'
            http: {
              metadata: {
                concurrentRequests: '10'
              }
            }
          }
          {
            name: 'cpu-rule'
            custom: {
              type: 'cpu'
              metadata: {
                type: 'Utilization'
                value: '70'
              }
            }
          }
        ]
      }
    }
  }
}
```

### Otimização de Custos

Implemente controlos de custo:

```bicep
@description('Enable cost management alerts')
param enableCostAlerts bool = true

resource budgetAlert 'Microsoft.Consumption/budgets@2023-05-01' = if (enableCostAlerts) {
  name: 'ai-budget-alert'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2024-12-31'
    }
    timeGrain: 'Monthly'
    amount: 1000
    category: 'Cost'
    notifications: {
      Actual_GreaterThan_80_Percent: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: [
          'admin@yourcompany.com'
        ]
      }
    }
  }
}
```

## Monitorização e Observabilidade

### Integração com Application Insights

Configure monitorização para cargas de trabalho de IA:

```bicep
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
  }
}

// Custom metrics for AI models
resource aiMetrics 'Microsoft.Insights/components/analyticsItems@2020-02-02' = {
  parent: applicationInsights
  name: 'ai-model-metrics'
  properties: {
    content: '''
      customEvents
      | where name == "AI_Model_Request"
      | extend model = tostring(customDimensions.model)
      | extend tokens = toint(customDimensions.tokens)
      | extend latency = toint(customDimensions.latency_ms)
      | summarize 
          requests = count(),
          avg_tokens = avg(tokens),
          avg_latency = avg(latency)
        by model, bin(timestamp, 5m)
    '''
    type: 'query'
    scope: 'shared'
  }
}
```

### Métricas Personalizadas

Acompanhe métricas específicas de IA:

```python
# Telemetria personalizada para modelos de IA
import logging
from applicationinsights import TelemetryClient

class AITelemetry:
    def __init__(self, instrumentation_key: str):
        self.client = TelemetryClient(instrumentation_key)
    
    def track_model_request(self, model: str, tokens: int, latency_ms: int, success: bool):
        """Track AI model request metrics."""
        self.client.track_event(
            'AI_Model_Request',
            {
                'model': model,
                'tokens': str(tokens),
                'latency_ms': str(latency_ms),
                'success': str(success)
            }
        )
        
    def track_model_error(self, model: str, error_type: str, error_message: str):
        """Track AI model errors."""
        self.client.track_exception(
            type=error_type,
            value=error_message,
            properties={
                'model': model,
                'component': 'ai_model'
            }
        )
```

### Verificações de Saúde

Implemente monitorização de saúde do serviço de IA:

```python
# Pontos finais para verificação de saúde
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # Testar ligação OpenAI
        async with httpx.AsyncClient() as client:
            response = await client.get(
                f"{AZURE_OPENAI_ENDPOINT}/openai/deployments",
                headers={"api-key": AZURE_OPENAI_API_KEY}
            )
            
        if response.status_code == 200:
            return {"status": "healthy", "models": response.json()}
        else:
            raise HTTPException(status_code=503, detail="AI models unavailable")
            
    except Exception as e:
        raise HTTPException(status_code=503, detail=f"Health check failed: {str(e)}")
```

## Próximos Passos

1. **Revise o [Guia de Integração Microsoft Foundry](microsoft-foundry-integration.md)** para padrões de integração de serviços  
2. **Complete o [Laboratório AI Workshop](ai-workshop-lab.md)** para experiência prática  
3. **Implemente as [Práticas de IA para Produção](production-ai-practices.md)** para implementações empresariais  
4. **Explore o [Guia de Resolução de Problemas de IA](../chapter-07-troubleshooting/ai-troubleshooting.md)** para problemas comuns  

## Recursos

- [Disponibilidade dos Modelos Microsoft Foundry Models](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Documentação do Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Escalonamento de Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Otimização de Custos de Modelos de IA](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD For Beginners](../../README.md)
- **📖 Capítulo Atual**: Capítulo 2 - Desenvolvimento com IA em Primeiro Lugar
- **⬅️ Anterior**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ Seguinte**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuração](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, por favor esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte oficial. Para informações críticas, recomenda-se a tradução profissional por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->