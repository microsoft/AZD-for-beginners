# Capítulo 2: Desenvolvimento com Foco em IA

**📚 Curso**: [AZD Para Iniciantes](../../README.md) | **⏱️ Duração**: 1-2 horas | **⭐ Complexidade**: Intermediário

---

## Visão Geral

Este capítulo foca na implantação de aplicações com IA usando o Azure Developer CLI e os serviços Microsoft Foundry. Desde aplicativos de chat com IA simples até agentes inteligentes com ferramentas.

> **Observação de validação (2026-06-15):** O fluxo de comandos e as orientações sobre extensões neste capítulo foram revisados contra `azd` `1.25.6` e a versão atual de pré-visualização da extensão de agente de IA `azure.ai.agents` `0.1.40-preview`. Se você estiver em uma versão mais antiga do AZD, atualize primeiro e depois continue com os exercícios.

## Objetivos de Aprendizagem

Ao completar este capítulo, você irá:
- Implantar aplicações de IA usando templates AZD pré-construídos
- Entender a integração do Microsoft Foundry com o AZD
- Configurar e customizar agentes de IA com ferramentas
- Implantar aplicações RAG (Retrieval-Augmented Generation)

---

## 📚 Lições

| # | Lição | Descrição | Tempo |
|---|--------|-------------|------|
| 1 | [Integração com Microsoft Foundry](microsoft-foundry-integration.md) | Conectar o AZD aos serviços do Foundry | 30 min |
| 2 | [Guia de Agentes de IA](agents.md) | Implantar agentes inteligentes com ferramentas | 45 min |
| 3 | [Implantação de Modelos de IA](ai-model-deployment.md) | Implantar e configurar modelos de IA | 30 min |
| 4 | [Laboratório Prático de IA](ai-workshop-lab.md) | Prático: Prepare sua solução de IA para o AZD | 60 min |

---

## 🚀 Início Rápido

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

## 🤖 Modelos de IA em Destaque

| Modelo | Descrição | Serviços |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Chat RAG com citações | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Agente de IA com ferramentas | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chat de IA básico | OpenAI + Container Apps |

---

## 💰 Noções sobre Custos

| Ambiente | Custo Mensal Estimado |
|-------------|----------------------|
| Desenvolvimento | $80-150 |
| Homologação | $150-300 |
| Produção | $300-3,500+ |

**Dica:** Execute `azd down` após os testes para evitar cobranças.

---

## 🔗 Navegação

| Direção | Capítulo |
|-----------|---------|
| **Anterior** | [Capítulo 1: Fundação](../chapter-01-foundation/README.md) |
| **Próximo** | [Capítulo 3: Configuração](../chapter-03-configuration/README.md) |
| **Ir para** | [Capítulo 8: Padrões de Produção](../chapter-08-production/README.md) |

---

## 📖 Recursos Relacionados

- [Resolução de Problemas de IA](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Práticas de IA em Produção](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->