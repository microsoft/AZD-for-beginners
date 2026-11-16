# Implementação de Modelos de IA com Azure Developer CLI

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 2 - Desenvolvimento com IA em Primeiro Lugar
- **⬅️ Anterior**: [Agentes de IA](agents.md)
- **➡️ Seguinte**: [Laboratório de IA](ai-workshop-lab.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuração](../chapter-03-configuration/configuration.md)

Este guia fornece instruções abrangentes para a implementação de modelos de IA usando templates AZD, abrangendo desde a seleção do modelo até padrões de implementação em produção.

> **Revisão da versão (2026-11-04):** Alterações relacionadas à CLI foram revisadas contra `azd` `1.37.2`; a disponibilidade do modelo, versões e quotas continuam dependendo da região e subscrição. `azd deploy --timeout <seconds>` controla a janela de implantação do serviço, não garante a ativação do agente. Consulte as [notas de lançamento atuais e orientações para migração de IA](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes).

## Índice

- [Estratégia de Seleção de Modelo](#model-selection-strategy)
- [Configuração AZD para Modelos de IA](#azd-configuration-for-ai-models)
- [Padrões de Implementação](#deployment-patterns)
- [Gestão de Modelos](#model-management)
- [Considerações de Produção](#production-considerations)
- [Monitorização e Observabilidade](#monitoring-and-observability)

## Estratégia de Seleção de Modelo

### Modelos Azure OpenAI no Microsoft Foundry

Escolha o modelo certo para o seu caso de uso:

Declare as implementações do modelo em Bicep (abaixo), não em definições arbitrárias `services.*.config.AZURE_OPENAI_MODELS`. O AZD não interpreta tal definição como uma lista de recursos de modelo. O `project` de um serviço aponta para a origem da aplicação, não para o diretório `infra/`.

Os exemplos usam a versão publicada `gpt-4.1-mini` **`2025-04-14`** e versão de embedding **`1`**. Confirme que a versão do modelo e o SKU de implantação são suportados na sua região/conta alvo antes de provisionar.

### Planeamento de Capacidade do Modelo

| Tipo de Modelo | Caso de Uso | Demanda Ilustrativa de Tokens | Considerações de Custo |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | Chat, Perguntas e Respostas | 10.000-50.000 TPM | Avalie custo e qualidade para a sua carga de trabalho |
| gpt-4.1 | Tarefas Complexas | 20.000-100.000 TPM | Avalie ganhos de qualidade em relação ao custo por token |
| text-embedding-3-large | Pesquisa, RAG | 30.000-120.000 TPM | Considere ingestão, bem como tráfego de consulta |
| Whisper | Fala para texto | Planeie usando duração de áudio e limites de pedidos | Não aplique uma fórmula de capacidade TPM de modelo de texto |

TPM significa tokens por minuto. Para estas implementações padrão de texto, o ARM `sku.capacity` está em unidades de **1.000 TPM**, não TPM individuais (capacidade `10` significa 10.000 TPM). A relação RPM-para-TPM varia por tipo de modelo/implementação; verifique ambos os limites contra a [documentação de quotas](https://learn.microsoft.com/azure/ai-foundry/openai/quotas-limits?view=foundry-classic). Estes intervalos são exemplos, não recomendações de dimensionamento.

## Configuração AZD para Modelos de IA

### Configuração do Template Bicep

Crie implementações de modelo através de templates Bicep:

```bicep
// infra/main.bicep
param openAiAccountName string
param location string = resourceGroup().location

@description('OpenAI model deployments')
param openAiModelDeployments array = [
  {
    name: 'gpt-4.1-mini'
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
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
    disableLocalAuth: true
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

Este é um **exemplo de infraestrutura de desenvolvimento** com escopo no grupo de recursos, não um template completo de aplicação AZD. A conta permite acesso à rede pública e requer autenticação Entra ID/RBAC (`Cognitive Services OpenAI User` para chamadores). A produção necessita do endpoint privado, DNS e conectividade da aplicação descritos no Capítulo 8. O AZD também precisa de um template principal/mapeamento de parâmetros e recursos do host da aplicação; use um exemplo funcional para uma implementação completa.

### Variáveis de Ambiente

Configure o ambiente da sua aplicação:

```bash
# .env configuration
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

Estes são nomes definidos pela aplicação; ligue-os à sua configuração do host. O endpoint Azure OpenAI v1 usado pelo cheque de saúde abaixo não requer o parâmetro de consulta `api-version` desatualizado; clientes mais antigos `AzureOpenAI` sim, então siga a geração da API usada pela sua aplicação.

## Padrões de Implementação

### Padrão 1: Implementação numa Única Região

```yaml
# azure.yaml - Single region
services:
  ai-app:
    project: ./src
    host: containerapp
    env:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
      AZURE_OPENAI_CHAT_DEPLOYMENT: gpt-4.1-mini
```

Melhor para:
- Desenvolvimento e testes
- Aplicações de um único mercado
- Otimização de custos

### Padrão 2: Implementação Multi-Região

```bicep
// Illustrative fragment: extend the complete account declaration above.
// Each region must support the selected model/SKU and have quota.
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

As propriedades/SKU omitidas da conta devem ser fornecidas; este fragmento não é implantável como escrito. Implemente modelos em cada conta e implemente o encaminhamento/failover e controlos de residência de dados separadamente.

Melhor para:
- Aplicações globais
- Requisitos de alta disponibilidade
- Distribuição de carga

### Padrão 3: Implementação Híbrida

Combine Modelos Microsoft Foundry com outros serviços de IA:

Os fragmentos seguintes assumem que nomes e `location` são fornecidos pelo template que os encapsula.

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

Rastreie as versões do modelo na configuração da sua aplicação ou IaC. Este JSON é um **exemplo definido pela aplicação**, não um esquema de modelo embutido no AZD; é necessário implementar e implantar explicitamente um fallback:

```json
{
  "models": {
    "chat": {
      "name": "gpt-4.1-mini",
      "version": "2025-04-14",
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

Utilize um hook do AZD para verificação de disponibilidade apenas leitura, depois atualize IaC e faça o provisionamento:

```bash
#!/bin/bash
# Illustrative hooks/check-model.sh (requires Azure CLI login and these variables)

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name "$AZURE_OPENAI_ACCOUNT_NAME" \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --query "[?name=='gpt-4.1-mini']"

```

Execute `azd up` **fora** do hook para aplicar alterações na infraestrutura do modelo e implantar código. Nunca chame `azd deploy` a partir de um hook `predeploy`: isso desencadeia recursivamente o mesmo hook. `azd deploy --timeout 1800` estende o tempo limite de implementação da aplicação; não atualiza recursos Bicep.

### Testes A/B

O recurso ilustrativo abaixo seleciona um nome e capacidade de implementação; cria **uma** implementação, não um teste A/B. Para um experimento real, provisionar dois recursos de implementação distintos, encaminhar uma fração controlada de pedidos para cada um e comparar qualidade, latência e custo. Assume `openAi` do exemplo da conta:

```bicep
param enableABTesting bool = false

resource chatDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4.1-mini-${enableABTesting ? 'v1' : 'prod'}'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: enableABTesting ? 5 : 10
  }
}
```

## Considerações de Produção

### Planeamento de Capacidade

Calcule a capacidade necessária com base nos padrões de uso:

```python
# Capacity calculation example
import math
def calculate_required_capacity(
    requests_per_minute: int,
    avg_prompt_tokens: int,
    avg_completion_tokens: int,
    safety_margin: float = 0.2
) -> int:
    """Calculate required TPM capacity."""
    total_tokens_per_request = avg_prompt_tokens + avg_completion_tokens
    total_tpm = requests_per_minute * total_tokens_per_request
    return math.ceil(total_tpm * (1 + safety_margin))

# Example usage
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

Saída esperada: `Required capacity: 9100 TPM`. Com unidades de capacidade de 1.000 TPM, arredonde para pelo menos `10`, depois verifique RPM específicas do modelo e estimativas de limite de taxa do serviço (incluindo orçamento de saída solicitado). Esta estimativa de demanda de tokens não garante proteção contra throttling.

### Configuração de Autoescalonamento

Configure autoescalonamento para Container Apps:

**Recurso parcial:** mescle as definições `template.scale` num Container App completo com localização, ambiente gerido, imagem de container, recursos e entrada. Escalar réplicas não aumenta quota do modelo.

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

**Recurso de orçamento ilustrativo:** defina `budgetStartDate` como o primeiro dia do mês atual em UTC (por exemplo, `2026-11-01T00:00:00Z` para esta revisão) e substitua o endereço de contacto. O início deve satisfazer as restrições de data atuais do serviço. Orçamentos alertam sobre dados de faturação atrasados; não param gastos.

```bicep
param budgetStartDate string

@description('Enable cost management alerts')
param enableCostAlerts bool = true

resource budgetAlert 'Microsoft.Consumption/budgets@2024-08-01' = if (enableCostAlerts) {
  name: 'ai-budget-alert'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
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

```

O fragmento assume `applicationInsightsName`, `location` e um `logAnalyticsWorkspace` existente. Provisione monitorização, mas não instrumenta a aplicação nem cria métricas personalizadas.

### Métricas Personalizadas

Rastreie métricas específicas de IA:

Use a distribuição suportada [Azure Monitor OpenTelemetry](https://learn.microsoft.com/azure/azure-monitor/app/opentelemetry-enable?tabs=python), não o SDK legado Python `applicationinsights`. Instale `azure-monitor-opentelemetry`, configure `APPLICATIONINSIGHTS_CONNECTION_STRING` e inicialize uma vez na inicialização:

```python
from azure.monitor.opentelemetry import configure_azure_monitor
from opentelemetry import trace

configure_azure_monitor()
tracer = trace.get_tracer(__name__)

def record_request(model: str, tokens: int, latency_ms: int, success: bool):
    with tracer.start_as_current_span("AI_Model_Request") as span:
        span.set_attribute("ai.model", model)
        span.set_attribute("ai.tokens", tokens)
        span.set_attribute("ai.latency_ms", latency_ms)
        span.set_attribute("ai.success", success)
```

Isto ilustra emissão de atributos, não instrumentação real de chamadas de modelo. Envolva o pedido real numa span para medir a sua duração; inspecione `dependencies`/`traces` no Application Insights. Não envie prompts, respostas, chaves ou mensagens brutas de exceção contendo dados sensíveis.

### Checagens de Saúde

Implemente monitorização de saúde do serviço de IA:

Instale `fastapi`, `uvicorn`, `httpx`, e `azure-identity`. Defina as variáveis de endpoint/implementação acima e conceda ao chamador `Cognitive Services OpenAI User`. Esta **sonda de prontidão** usa o plano de dados Azure OpenAI v1 com Entra ID; faz uma chamada de modelo faturável. Execute com `uvicorn health:app` depois de salvar como `health.py`. Use uma checagem de liveness leve separada, limite/cache resultados de prontidão, e não exponha esta rota publicamente sem controlos de acesso.

```python
# health.py
import os
from fastapi import FastAPI, HTTPException
import httpx
from azure.identity.aio import DefaultAzureCredential

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        async with DefaultAzureCredential() as credential:
            token = await credential.get_token("https://ai.azure.com/.default")
        endpoint = os.environ["AZURE_OPENAI_ENDPOINT"].rstrip("/")
        async with httpx.AsyncClient(timeout=20.0) as client:
            response = await client.post(
                f"{endpoint}/openai/v1/chat/completions",
                headers={"Authorization": f"Bearer {token.token}"},
                json={
                    "model": os.environ["AZURE_OPENAI_CHAT_DEPLOYMENT"],
                    "messages": [{"role": "user", "content": "Reply OK."}],
                    "max_completion_tokens": 8,
                },
            )
        response.raise_for_status()
        return {"status": "healthy"}
    except Exception:
        # Record sanitized internal diagnostics, not service responses/tokens.
        raise HTTPException(status_code=503, detail="AI readiness check failed") from None
```

Esperado: `GET /health/ai-models` retorna `200 {"status":"healthy"}` quando a implementação de chat configurada é utilizável, ou `503` sem revelar detalhes ascendentes. Listar implementações é uma operação do plano de gestão e não é uma sonda válida do plano de dados para saúde.

## Próximos Passos

1. **Revise o [Guia de Integração Microsoft Foundry](microsoft-foundry-integration.md)** para padrões de integração de serviços
2. **Complete o [Laboratório de IA](ai-workshop-lab.md)** para experiência prática
3. **Implemente as [Práticas de IA em Produção](../chapter-08-production/production-ai-practices.md)** para implementações empresariais
4. **Explore o [Guia de Resolução de Problemas de IA](../chapter-07-troubleshooting/ai-troubleshooting.md)** para problemas comuns

## Recursos

- [Disponibilidade de Modelos Microsoft Foundry](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Documentação Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Escalonamento Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Otimização de Custos em Modelos de IA](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 2 - Desenvolvimento com IA em Primeiro Lugar
- **⬅️ Anterior**: [Agentes de IA](agents.md)
- **➡️ Seguinte**: [Laboratório de IA](ai-workshop-lab.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuração](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->