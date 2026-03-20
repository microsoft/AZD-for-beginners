# Capítulo 5: Soluções de IA Multiagente

**📚 Curso**: [AZD para Iniciantes](../../README.md) | **⏱️ Duração**: 2-3 horas | **⭐ Complexidade**: Avançado

---

## Visão Geral

Este capítulo aborda padrões avançados de arquitetura multiagente, orquestração de agentes e implantações de IA prontas para produção para cenários complexos.

## Objetivos de Aprendizado

Ao completar este capítulo, você irá:
- Entender padrões de arquitetura multiagente
- Implantar sistemas coordenados de agentes de IA
- Implementar comunicação entre agentes
- Construir soluções multiagente prontas para produção

---

## 📚 Lições

| # | Lição | Descrição | Tempo |
|---|--------|-------------|------|
| 1 | [Solução Multiagente de Varejo](../../examples/retail-scenario.md) | Guia completo da implementação | 90 min |
| 2 | [Padrões de Coordenação](../chapter-06-pre-deployment/coordination-patterns.md) | Estratégias de orquestração de agentes | 30 min |
| 3 | [Implantação com ARM Template](../../examples/retail-multiagent-arm-template/README.md) | Implantação com um clique | 30 min |

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

> **Qual abordagem?** Use `azd init --template` para começar a partir de um exemplo funcional. Use `azd ai agent init` quando você tiver seu próprio manifesto de agente. Veja a [referência do AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) para mais detalhes.

---

## 🤖 Arquitetura Multiagente

```mermaid
graph TD
    Orchestrator[Agente Orquestrador<br/>Roteia solicitações, gerencia o fluxo de trabalho] --> Customer[Agente do Cliente<br/>Consultas do usuário, preferências]
    Orchestrator --> Inventory[Agente de Inventário<br/>Níveis de estoque, pedidos]
```
---

## 🎯 Solução em Destaque: Multiagente de Varejo

A [Solução Multiagente de Varejo](../../examples/retail-scenario.md) demonstra:

- **Agente do Cliente**: Lida com interações dos usuários e preferências
- **Agente de Estoque**: Gerencia estoque e processamento de pedidos
- **Orquestrador**: Coordena os agentes
- **Memória Compartilhada**: Gerenciamento de contexto entre agentes

### Serviços Utilizados

| Serviço | Finalidade |
|---------|---------|
| Microsoft Foundry Models | Compreensão de linguagem |
| Azure AI Search | Catálogo de produtos |
| Cosmos DB | Estado e memória do agente |
| Container Apps | Hospedagem de agentes |
| Application Insights | Monitoramento |

---

## 🔗 Navegação

| Direction | Chapter |
|-----------|---------|
| **Anterior** | [Capítulo 4: Infraestrutura](../chapter-04-infrastructure/README.md) |
| **Próximo** | [Capítulo 6: Pré-Implantação](../chapter-06-pre-deployment/README.md) |

---

## 📖 Recursos Relacionados

- [Guia de Agentes de IA](../chapter-02-ai-development/agents.md)
- [Práticas de IA em Produção](../chapter-08-production/production-ai-practices.md)
- [Solução de Problemas de IA](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Isenção de responsabilidade**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para alcançar precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte oficial. Para informações críticas, recomenda-se tradução humana profissional. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->