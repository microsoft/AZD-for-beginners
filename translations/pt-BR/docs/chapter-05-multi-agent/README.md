# Capítulo 5: Soluções de IA Multi-Agente

**📚 Curso**: [AZD Para Iniciantes](../../README.md) | **⏱️ Duração**: 2-3 horas | **⭐ Complexidade**: Avançada

---

## Visão Geral

Este capítulo cobre padrões avançados de arquitetura multi-agente, orquestração de agentes e implantações de IA prontas para produção para cenários complexos.

## Objetivos de Aprendizagem

Ao concluir este capítulo, você irá:
- Entender padrões de arquitetura multi-agente
- Implantar sistemas coordenados de agentes de IA
- Implementar comunicação entre agentes
- Construir soluções multi-agente prontas para produção

---

## 📚 Aulas

| # | Lição | Descrição | Tempo |
|---|--------|-------------|------|
| 1 | [Solução Multi-Agente para Varejo](../../examples/retail-scenario.md) | Guia completo da implementação | 90 min |
| 2 | [Padrões de Coordenação](../chapter-06-pre-deployment/coordination-patterns.md) | Estratégias de orquestração de agentes | 30 min |
| 3 | [Implantação com ARM Template](../../examples/retail-multiagent-arm-template/README.md) | Implantação com um clique | 30 min |

---

## 🚀 Início Rápido

```bash
# Implantar a solução multagente de varejo
cd examples/retail-multiagent-arm-template
./deploy.sh

# Ou use o modelo diretamente
azd init --template agent-openai-python-prompty
azd up
```

---

## 🤖 Arquitetura Multi-Agente

```
┌──────────────────────────────────────────────────────────────┐
│                    Orchestrator Agent                         │
│              (Routes requests, manages workflow)              │
└────────────────────┬─────────────────┬───────────────────────┘
                     │                 │
         ┌───────────▼───────┐ ┌───────▼───────────┐
         │  Customer Agent   │ │  Inventory Agent  │
         │  (User queries,   │ │  (Stock levels,   │
         │   preferences)    │ │   orders)         │
         └───────────────────┘ └───────────────────┘
```

---

## 🎯 Solução em Destaque: Multi-Agente para Varejo

The [Solução Multi-Agente para Varejo](../../examples/retail-scenario.md) demonstrates:

- **Customer Agent**: Handles user interactions and preferences
- **Inventory Agent**: Manages stock and order processing
- **Orchestrator**: Coordinates between agents
- **Shared Memory**: Cross-agent context management

### Serviços Utilizados

| Serviço | Finalidade |
|---------|---------|
| Azure OpenAI | Compreensão de linguagem |
| Azure AI Search | Catálogo de produtos |
| Cosmos DB | Estado e memória dos agentes |
| Container Apps | Hospedagem dos agentes |
| Application Insights | Monitoramento |

---

## 🔗 Navegação

| Direção | Capítulo |
|-----------|---------|
| **Anterior** | [Capítulo 4: Infraestrutura](../chapter-04-infrastructure/README.md) |
| **Próximo** | [Capítulo 6: Pré-Implantação](../chapter-06-pre-deployment/README.md) |

---

## 📖 Recursos Relacionados

- [Guia de Agentes de IA](../chapter-02-ai-development/agents.md)
- [Práticas de IA em Produção](../chapter-08-production/production-ai-practices.md)
- [Resolução de Problemas de IA](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Isenção de responsabilidade:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte oficial. Para informações críticas, recomenda-se a tradução profissional realizada por um tradutor humano. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->