# Capítulo 2: Desenvolvimento AI-First

**📚 Curso**: [AZD Para Iniciantes](../../README.md) | **⏱️ Duração**: 1-2 horas | **⭐ Complexidade**: Intermediário

---

## Visão Geral

Este capítulo foca em implantar aplicações impulsionadas por IA usando Azure Developer CLI e serviços Microsoft Foundry. Desde apps simples de chat com IA até agentes inteligentes com ferramentas.

> **Nota de validação (2026-07-13):** O fluxo de comandos e a orientação da extensão deste capítulo foram revisados com base no `azd` `1.27.1` e na versão atual da extensão de agente IA em preview `azure.ai.agents` `1.0.0-beta.5`. Se você estiver em uma versão anterior do AZD, atualize primeiro e depois continue com os exercícios.

## Objetivos de Aprendizagem

Ao completar este capítulo, você irá:
- Implantar aplicações de IA usando templates pré-construídos do AZD
- Compreender a integração do Microsoft Foundry com AZD
- Configurar e customizar agentes de IA com ferramentas
- Implantar aplicações RAG (Geração Reforçada por Recuperação)

---

## 📚 Lições

| # | Lição | Descrição | Tempo |
|---|--------|-------------|------|
| 1 | [Integração Microsoft Foundry](microsoft-foundry-integration.md) | Conecte AZD com serviços Foundry | 30 min |
| 2 | [Guia de Agentes de IA](agents.md) | Implemente agentes inteligentes com ferramentas | 45 min |
| 3 | [Implantação de Modelos de IA](ai-model-deployment.md) | Implante e configure modelos de IA | 30 min |
| 4 | [Laboratório Workshop de IA](ai-workshop-lab.md) | Prática: Prepare sua solução IA para o AZD | 60 min |

---

## 🚀 Começo Rápido

```bash
# Opção 1: Aplicativo de Chat RAG
azd init --template azure-search-openai-demo
azd up

# Opção 2: Agentes de IA
azd init --template get-started-with-ai-agents
azd up

# Opção 3: Aplicativo de Chat Rápido
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Templates de IA em Destaque

| Template | Descrição | Serviços |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Chat RAG com citações | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Agente de IA com ferramentas | Serviço de Agente de IA |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chat IA básico | OpenAI + Container Apps |

---

## 💰 Consciência de Custos

| Ambiente | Custo Mensal Estimado |
|-------------|----------------------|
| Desenvolvimento | $80-150 |
| Staging | $150-300 |
| Produção | $300-3,500+ |

**Dica:** Execute `azd down` após os testes para evitar cobranças.

---

## 🔗 Navegação

| Direção | Capítulo |
|-----------|---------|
| **Anterior** | [Capítulo 1: Fundamentos](../chapter-01-foundation/README.md) |
| **Próximo** | [Capítulo 3: Configuração](../chapter-03-configuration/README.md) |
| **Pular para** | [Capítulo 8: Padrões de Produção](../chapter-08-production/README.md) |

---

## 📖 Recursos Relacionados

- [Solução de Problemas de IA](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Práticas de IA em Produção](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->