# Implantação de Modelo de IA com Azure Developer CLI

**Navegação pelo Capítulo:**
- **📚 Início do Curso**: [AZD For Beginners](../../README.md)
- **📖 Capítulo Atual**: Capítulo 2 - Desenvolvimento AI-First
- **⬅️ Anterior**: [AI Agents](agents.md)
- **➡️ Próximo**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuração](../chapter-03-configuration/configuration.md)

Este guia fornece instruções abrangentes para implantar modelos de IA usando templates AZD, cobrindo desde a seleção do modelo até padrões de implantação em produção.

> **Revisão da versão (2026-11-04):** As alterações relacionadas ao CLI foram revisadas contra `azd` `1.37.2`; a disponibilidade do modelo, versões e cota continuam dependendo da região e assinatura. `azd deploy --timeout <seconds>` controla a janela de implantação do serviço, não garantia de ativação do agente. Veja [notas da versão atual e orientação de migração de IA](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes).

## Índice

- [Estratégia de Seleção de Modelos](#model-selection-strategy)
- [Configuração AZD para Modelos de IA](#azd-configuration-for-ai-models)
- [Padrões de Implantação](#deployment-patterns)
- [Gerenciamento de Modelos](#model-management)
- [Considerações de Produção](#production-considerations)
- [Monitoramento e Observabilidade](#monitoring-and-observability)

## Estratégia de Seleção de Modelos

### Modelos Azure OpenAI no Microsoft Foundry

Escolha o modelo certo para seu caso de uso:

Declare implantações de modelo em Bicep (abaixo), não em configurações arbitrárias `services.*.config.AZURE_OPENAI_MODELS`. O AZD não interpreta essa configuração como uma lista de recursos de modelo. A propriedade `project` de um serviço aponta para o código-fonte da aplicação, não para seu diretório `infra/`.

Os exemplos usam a versão publicada `gpt-4.1-mini` **`2025-04-14`** e a versão de embedding **`1`**. Confirme que a versão do modelo e o SKU de implantação são suportados na região/conta alvo antes de provisionar.

### Planejamento de Capacidade de Modelo

| Tipo de Modelo | Caso de Uso | Demanda Ilustrativa de Tokens | Considerações de Custo |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | Chat, Q&A | 10.000-50.000 TPM | Benchmark de custo e qualidade para sua carga de trabalho |
| gpt-4.1 | Tarefas complexas | 20.000-100.000 TPM | Avalie ganhos de qualidade contra custo de tokens |
| text-embedding-3-large | Busca, RAG | 30.000-120.000 TPM | Considere ingestão e tráfego de consulta |
| Whisper | Fala-para-texto | Planeje usando duração de áudio e limites de solicitação | Não aplique fórmula de capacidade TPM para modelos de texto |

TPM significa tokens por minuto. Para essas implantações Standard de texto, ARM `sku.capacity` está em unidades de **1.000 TPM**, não TPM individuais (capacidade `10` significa 10.000 TPM). As proporções RPM para TPM variam por tipo de modelo/implantação; verifique ambos os limites contra a [documentação da cota](https://learn.microsoft.com/azure/ai-foundry/openai/quotas-limits?view=foundry-classic). Esses valores são exemplos, não recomendações de dimensionamento.

## Configuração AZD para Modelos de IA

### Configuração de Template Bicep

Crie implantações de modelo através de templates Bicep:

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

Este é um **exemplo de infraestrutura de desenvolvimento** com escopo em grupo de recursos, não um template completo de aplicação AZD. A conta permite acesso público à rede e requer autenticação Entra ID/RBAC (`Cognitive Services OpenAI User` para chamadores). Produção precisa do endpoint privado, DNS e conectividade de aplicação descritos no Capítulo 8. O AZD também necessita de um template principal/mapeamento de parâmetros e recursos de host de aplicação; use um exemplo funcional para uma implantação completa.

### Variáveis de Ambiente

Configure o ambiente da sua aplicação:

```bash
# .env configuration
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

Esses são nomes definidos pela aplicação; integre-os na configuração do host. O endpoint Azure OpenAI v1 usado pela verificação de integridade abaixo não requer o parâmetro de consulta `api-version` desatualizado; clientes `AzureOpenAI` mais antigos requerem, portanto siga a geração de API usada pela sua aplicação.

## Padrões de Implantação

### Padrão 1: Implantação em Região Única

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

Indicado para:
- Desenvolvimento e teste
- Aplicações para mercado único
- Otimização de custo

### Padrão 2: Implantação Multi-Região

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

As propriedades/SKU omitidas da conta devem ser fornecidas; este fragmento não é implantável como está. Implante modelos em cada conta e implemente controle de roteamento/failover e residência de dados separadamente.

Indicado para:
- Aplicações globais
- Requisitos de alta disponibilidade
- Distribuição de carga

### Padrão 3: Implantação Híbrida

Combine Modelos Microsoft Foundry com outros serviços de IA:

Os fragmentos seguintes assumem que nomes e `location` são fornecidos pelo template pai.

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

## Gerenciamento de Modelos

### Controle de Versão

Acompanhe versões de modelos na configuração da sua aplicação ou IaC. Este JSON é um **exemplo definido pela aplicação**, não um esquema de modelo incorporado do AZD; um fallback deve ser implementado e implantado explicitamente:

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

Use um hook AZD para uma verificação de disponibilidade somente leitura, depois atualize IaC e faça o provisionamento:

```bash
#!/bin/bash
# Illustrative hooks/check-model.sh (requires Azure CLI login and these variables)

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name "$AZURE_OPENAI_ACCOUNT_NAME" \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --query "[?name=='gpt-4.1-mini']"

```

Execute `azd up` **fora** do hook para aplicar infraestrutura de modelo modificada e implantar código. Nunca chame `azd deploy` de um hook `predeploy`: isso dispara recursivamente o próprio hook. `azd deploy --timeout 1800` estende um timeout de implantação da aplicação; não atualiza recursos Bicep.

### Teste A/B

O recurso ilustrativo abaixo seleciona um nome de implantação e capacidade; cria **uma** implantação, não um teste A/B. Para um experimento real, faça o provisionamento de dois recursos distintos de implantação, direcione uma fração controlada das solicitações para cada um e compare qualidade, latência e custo. Assume `openAi` do exemplo de conta:

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

### Planejamento de Capacidade

Calcule a capacidade necessária baseada nos padrões de uso:

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

Saída esperada: `Required capacity: 9100 TPM`. Com unidades de capacidade de 1.000 TPM, arredonde para pelo menos `10`, depois verifique estimativa específica de RPM e limite de taxa do serviço (incluindo orçamento de saída solicitado). Esta estimativa de demanda de tokens não garante ausência de throttling.

### Configuração de Autoescalonamento

Configure autoescalonamento para Container Apps:

**Recurso parcial:** mescle as configurações `template.scale` em um Container App completo com local, ambiente gerenciado, imagem de container, recursos e ingresso. Escalar réplicas não aumenta cota de modelo.

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

### Otimização de Custo

Implemente controles de custo:

**Recurso ilustrativo de orçamento:** defina `budgetStartDate` como o primeiro dia do mês atual em UTC (por exemplo `2026-11-01T00:00:00Z` para esta revisão), e substitua o endereço de contato. O início deve satisfazer as restrições atuais de data do serviço. Orçamentos alertam sobre dados atrasados de faturamento; não interrompem gastos.

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

## Monitoramento e Observabilidade

### Integração Application Insights

Configure monitoramento para cargas de trabalho de IA:

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

O fragmento de recurso assume `applicationInsightsName`, `location`, e um `logAnalyticsWorkspace` existente. Ele provisiona monitoramento, mas não instrumenta a aplicação nem cria métricas customizadas.

### Métricas Customizadas

Monitore métricas específicas de IA:

Use a [distribuição Azure Monitor OpenTelemetry](https://learn.microsoft.com/azure/azure-monitor/app/opentelemetry-enable?tabs=python) suportada, não o legado SDK Python `applicationinsights`. Instale `azure-monitor-opentelemetry`, configure `APPLICATIONINSIGHTS_CONNECTION_STRING` e inicialize uma vez na inicialização:

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

Isso ilustra emissão de atributos, não instrumentação real de chamada de modelo. Envolva a requisição real em um span para medir sua duração; inspecione `dependencies`/`traces` no Application Insights. Não envie prompts, respostas, chaves ou mensagens de exceção brutas contendo dados sensíveis.

### Verificações de Saúde

Implemente monitoramento de saúde do serviço de IA:

Instale `fastapi`, `uvicorn`, `httpx`, e `azure-identity`. Defina as variáveis de endpoint/implantação acima e conceda ao chamador `Cognitive Services OpenAI User`. Esta **sonda de prontidão** usa o plano de dados Azure OpenAI v1 com Entra ID; faz uma chamada de modelo cobrável. Execute com `uvicorn health:app` após salvar como `health.py`. Use uma checagem de vivacidade leve separada, limite/cache resultados da prontidão e não exponha esta rota publicamente sem controles de acesso.

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

Esperado: `GET /health/ai-models` retorna `200 {"status":"healthy"}` quando a implantação de chat configurada está utilizável, ou `503` sem divulgar detalhes upstream. Listar implantações é uma operação de plano de gerenciamento e não uma sonda de saúde válida de plano de dados.

## Próximos Passos

1. **Revise o [Guia de Integração Microsoft Foundry](microsoft-foundry-integration.md)** para padrões de integração de serviço
2. **Complete o [Laboratório AI Workshop](ai-workshop-lab.md)** para experiência prática
3. **Implemente as [Práticas de IA em Produção](../chapter-08-production/production-ai-practices.md)** para implantações empresariais
4. **Explore o [Guia de Solução de Problemas de IA](../chapter-07-troubleshooting/ai-troubleshooting.md)** para questões comuns

## Recursos

- [Disponibilidade de Modelos Microsoft Foundry](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Documentação Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Escalonamento Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Otimização de Custo de Modelo de IA](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Navegação pelo Capítulo:**
- **📚 Início do Curso**: [AZD For Beginners](../../README.md)
- **📖 Capítulo Atual**: Capítulo 2 - Desenvolvimento AI-First
- **⬅️ Anterior**: [AI Agents](agents.md)
- **➡️ Próximo**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuração](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->