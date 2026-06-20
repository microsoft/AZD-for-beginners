# Capítulo 5: Soluções de IA Multiagente

**📚 Curso**: [AZD For Beginners](../../README.md) | **⏱️ Duração**: 2-3 horas | **⭐ Complexidade**: Avançado

---

## Visão geral

Este capítulo aborda padrões avançados de arquitetura multiagente, orquestração de agentes e implantações de IA prontas para produção para cenários complexos.

> Validado contra `azd 1.25.6` em junho de 2026.

## Objetivos de aprendizagem

Ao concluir este capítulo, você:
- Entender padrões de arquitetura multiagente
- Implantar sistemas coordenados de agentes de IA
- Implementar comunicação entre agentes
- Construir soluções multiagente prontas para produção

---

## 📚 Lições

| # | Lição | Descrição | Tempo |
|---|--------|-------------|------|
| 1 | [Multi-Agent Basics](multi-agent-basics.md) | Prático: implantar um app multiagente funcional com `azd up` | 45 min |
| 2 | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) | Estratégias de orquestração de agentes (continua no Capítulo 6) | 30 min |
| 3 | [ARM Template Deployment](../../examples/retail-multiagent-arm-template/README.md) | Exemplo de implantação com um clique | 30 min |

> **Comece pela Lição 1.** É a única lição totalmente prática e implantável neste capítulo. A Lição 2 está no Capítulo 6 (é compartilhada com o planejamento pré-implantação), e a [Retail Multi-Agent Solution](../../examples/retail-scenario.md) é um blueprint de arquitetura — uma referência de design, não um modelo de um único comando.

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

> **Qual abordagem?** Use `azd init --template` para começar a partir de um exemplo funcional. Use `azd ai agent init` quando você tiver seu próprio manifesto de agente. Veja o [AZD AI CLI reference](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) para detalhes completos.

---

## 🤖 Arquitetura Multiagente

```mermaid
graph TD
    Orchestrator[Agente Orquestrador<br/>Encaminha solicitações, gerencia o fluxo de trabalho] --> Customer[Agente do Cliente<br/>Consultas do usuário, preferências]
    Orchestrator --> Inventory[Agente de Inventário<br/>Níveis de estoque, pedidos]
```

---

## 🎯 Solução em destaque: Multiagente para Varejo

A [Retail Multi-Agent Solution](../../examples/retail-scenario.md) demonstra:

- **Agente do Cliente**: Lida com interações e preferências do usuário
- **Agente de Estoque**: Gerencia estoque e processamento de pedidos
- **Orquestrador**: Coordena entre os agentes
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
| **Previous** | [Chapter 4: Infrastructure](../chapter-04-infrastructure/README.md) |
| **Next** | [Chapter 6: Pre-Deployment](../chapter-06-pre-deployment/README.md) |

---

## 📖 Recursos Relacionados

- [AI Agents Guide](../chapter-02-ai-development/agents.md)
- [Production AI Practices](../chapter-08-production/production-ai-practices.md)
- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->