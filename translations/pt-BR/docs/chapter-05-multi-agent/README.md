# Chapter 5: Multi-Agent AI Solutions

**📚 Curso**: [AZD For Beginners](../../README.md) | **⏱️ Duração**: 2-3 horas | **⭐ Complexidade**: Avançado

---

## Overview

This chapter covers advanced multi-agent architecture patterns, agent orchestration, and production-ready AI deployments for complex scenarios.

> Validated against `azd 1.23.12` in March 2026.

## Learning Objectives

By completing this chapter, you will:
- Understand multi-agent architecture patterns
- Deploy coordinated AI agent systems
- Implement agent-to-agent communication
- Build production-ready multi-agent solutions

---

## 📚 Lessons

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Solução Multi-Agente de Varejo](../../examples/retail-scenario.md) | Complete implementation walkthrough | 90 min |
| 2 | [Padrões de Coordenação](../chapter-06-pre-deployment/coordination-patterns.md) | Agent orchestration strategies | 30 min |
| 3 | [Implantação com Template ARM](../../examples/retail-multiagent-arm-template/README.md) | One-click deployment | 30 min |

---

## 🚀 Início Rápido

```bash
# Opção 1: Implantar a partir de um modelo
azd init --template agent-openai-python-prompty
azd up

# Opção 2: Implantar a partir de um manifesto de agente (requer a extensão azure.ai.agents)
azd extension install azure.ai.agents
azd ai agent init -m agent-manifest.yaml
azd up
```

> **Qual abordagem?** Use `azd init --template` to start from a working sample. Use `azd ai agent init` when you have your own agent manifest. See the [referência do AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) for full details.

---

## 🤖 Arquitetura Multi-Agente

```mermaid
graph TD
    Orchestrator[Agente Orquestrador<br/>Encaminha solicitações, gerencia o fluxo de trabalho] --> Customer[Agente do Cliente<br/>Consultas do usuário, preferências]
    Orchestrator --> Inventory[Agente de Inventário<br/>Níveis de estoque, pedidos]
```
---

## 🎯 Solução em Destaque: Multi-Agente de Varejo

The [Solução Multi-Agente de Varejo](../../examples/retail-scenario.md) demonstrates:

- **Agente do Cliente**: Gerencia interações com o usuário e preferências
- **Agente de Inventário**: Gerencia estoque e processamento de pedidos
- **Orquestrador**: Coordena entre os agentes
- **Memória Compartilhada**: Gerenciamento de contexto entre agentes

### Serviços Utilizados

| Service | Purpose |
|---------|---------|
| Microsoft Foundry Models | Compreensão de linguagem |
| Azure AI Search | Catálogo de produtos |
| Cosmos DB | Estado e memória do agente |
| Container Apps | Hospedagem dos agentes |
| Application Insights | Monitoramento |

---

## 🔗 Navegação

| Direction | Chapter |
|-----------|---------|
| **Previous** | [Capítulo 4: Infraestrutura](../chapter-04-infrastructure/README.md) |
| **Next** | [Capítulo 6: Pré-Implantação](../chapter-06-pre-deployment/README.md) |

---

## 📖 Recursos Relacionados

- [Guia de Agentes de IA](../chapter-02-ai-development/agents.md)
- [Práticas de IA para Produção](../chapter-08-production/production-ai-practices.md)
- [Solução de Problemas de IA](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->