# Capítulo 5: Soluções de IA Multi-Agente

**📚 Curso**: [AZD Para Iniciantes](../../README.md) | **⏱️ Duração**: 2-3 horas | **⭐ Complexidade**: Avançado

---

## Visão Geral

Este capítulo aborda padrões avançados de arquitetura multi-agente, orquestração de agentes, e implementações de IA prontas para produção para cenários complexos.

> Validado contra `azd 1.23.12` em março de 2026.

## Objetivos de Aprendizagem

Ao concluir este capítulo, você irá:
- Compreender padrões de arquitetura multi-agente
- Implementar sistemas de agentes de IA coordenados
- Implementar comunicação entre agentes
- Construir soluções multi-agente prontas para produção

---

## 📚 Aulas

| # | Aula | Descrição | Tempo |
|---|--------|-------------|------|
| 1 | [Solução Multi-Agente para Varejo](../../examples/retail-scenario.md) | Passo a passo da implementação completa | 90 min |
| 2 | [Padrões de Coordenação](../chapter-06-pre-deployment/coordination-patterns.md) | Estratégias de orquestração de agentes | 30 min |
| 3 | [Implementação com Template ARM](../../examples/retail-multiagent-arm-template/README.md) | Implementação com um clique | 30 min |

---

## 🚀 Início Rápido

```bash
# Opção 1: Efetuar a implementação a partir de um modelo
azd init --template agent-openai-python-prompty
azd up

# Opção 2: Efetuar a implementação a partir de um manifesto de agente (requer a extensão azure.ai.agents)
azd extension install azure.ai.agents
azd ai agent init -m agent-manifest.yaml
azd up
```

> **Qual abordagem?** Use `azd init --template` para começar a partir de um exemplo funcional. Use `azd ai agent init` quando tiver o seu próprio manifesto de agente. Veja a [referência AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) para detalhes completos.

---

## 🤖 Arquitetura Multi-Agente

```mermaid
graph TD
    Orchestrator[Agente Orquestrador<br/>Encaminha pedidos, gere o fluxo de trabalho] --> Customer[Agente do Cliente<br/>Consultas do utilizador, preferências]
    Orchestrator --> Inventory[Agente de Inventário<br/>Níveis de stock, encomendas]
```
---

## 🎯 Solução em Destaque: Multi-Agente para Varejo

A [Solução Multi-Agente para Varejo](../../examples/retail-scenario.md) demonstra:

- **Agente de Cliente**: Gerencia interações e preferências do utilizador
- **Agente de Inventário**: Gere stock e processamento de pedidos
- **Orquestrador**: Coordena entre agentes
- **Memória Partilhada**: Gestão de contexto entre agentes

### Serviços Utilizados

| Serviço | Finalidade |
|---------|------------|
| Microsoft Foundry Models | Compreensão de linguagem |
| Azure AI Search | Catálogo de produtos |
| Cosmos DB | Estado e memória dos agentes |
| Container Apps | Hospedagem dos agentes |
| Application Insights | Monitorização |

---

## 🔗 Navegação

| Direção | Capítulo |
|---------|----------|
| **Anterior** | [Capítulo 4: Infraestrutura](../chapter-04-infrastructure/README.md) |
| **Seguinte** | [Capítulo 6: Pré-Implementação](../chapter-06-pre-deployment/README.md) |

---

## 📖 Recursos Relacionados

- [Guia de Agentes de IA](../chapter-02-ai-development/agents.md)
- [Práticas de IA para Produção](../chapter-08-production/production-ai-practices.md)
- [Resolução de Problemas de IA](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações erradas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->