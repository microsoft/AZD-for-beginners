# Capítulo 5: Soluções de IA Multi-Agente

**📚 Curso**: [AZD Para Iniciantes](../../README.md) | **⏱️ Duração**: 2-3 horas | **⭐ Complexidade**: Avançado

---

## Visão Geral

Este capítulo aborda padrões avançados de arquitetura multi-agente, orquestração de agentes e implementações de IA preparadas para produção em cenários complexos.

## Objetivos de Aprendizagem

Ao concluir este capítulo, irá:
- Compreender padrões de arquitetura multi-agente
- Implementar sistemas de agentes de IA coordenados
- Implementar comunicação agente-a-agente
- Construir soluções multi-agente prontas para produção

---

## 📚 Aulas

| # | Aula | Descrição | Tempo |
|---|--------|-------------|------|
| 1 | [Solução Multi-Agente para Retalho](../../examples/retail-scenario.md) | Guia completo de implementação | 90 min |
| 2 | [Padrões de Coordenação](../chapter-06-pre-deployment/coordination-patterns.md) | Estratégias de orquestração de agentes | 30 min |
| 3 | [Implementação com ARM Template](../../examples/retail-multiagent-arm-template/README.md) | Implementação com um clique | 30 min |

---

## 🚀 Início Rápido

```bash
# Implantar a solução multi-agente para o retalho
cd examples/retail-multiagent-arm-template
./deploy.sh

# Ou use o modelo diretamente
azd init --template agent-openai-python-prompty
azd up
```

---

## 🤖 Arquitectura Multi-Agente

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

## 🎯 Solução em Destaque: Multi-Agente para Retalho

A [Solução Multi-Agente para Retalho](../../examples/retail-scenario.md) demonstra:

- **Agente de Cliente**: Gere interações com o utilizador e preferências
- **Agente de Inventário**: Gère stock e processamento de encomendas
- **Orquestrador**: Coordena entre os agentes
- **Memória Partilhada**: Gestão de contexto entre agentes

### Serviços Utilizados

| Serviço | Finalidade |
|---------|---------|
| Azure OpenAI | Compreensão de linguagem |
| Azure AI Search | Catálogo de produtos |
| Cosmos DB | Estado e memória dos agentes |
| Container Apps | Alojamento dos agentes |
| Application Insights | Monitorização |

---

## 🔗 Navegação

| Direção | Capítulo |
|-----------|---------|
| **Anterior** | [Capítulo 4: Infraestrutura](../chapter-04-infrastructure/README.md) |
| **Seguinte** | [Capítulo 6: Pré-Implementação](../chapter-06-pre-deployment/README.md) |

---

## 📖 Recursos Relacionados

- [Guia de Agentes de IA](../chapter-02-ai-development/agents.md)
- [Práticas de IA em Produção](../chapter-08-production/production-ai-practices.md)
- [Resolução de Problemas de IA](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso legal**:
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Apesar de nos empenharmos em garantir a precisão, tenha em atenção que traduções automatizadas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se uma tradução profissional efetuada por um tradutor humano. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações erróneas decorrentes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->