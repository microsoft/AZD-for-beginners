# Capítulo 2: Desenvolvimento Orientado por IA

**📚 Curso**: [AZD para Iniciantes](../../README.md) | **⏱️ Duração**: 1-2 horas | **⭐ Complexidade**: Intermediário

---

## Visão Geral

Este capítulo foca na implantação de aplicações com IA usando Azure Developer CLI e os serviços Microsoft Foundry. De aplicativos simples de chat com IA a agentes inteligentes com ferramentas.

## Objetivos de Aprendizagem

Ao concluir este capítulo, você irá:
- Implantar aplicações de IA usando modelos pré-construídos do AZD
- Entender a integração do Microsoft Foundry com o AZD
- Configurar e personalizar agentes de IA com ferramentas
- Implantar aplicações RAG (Retrieval-Augmented Generation)

---

## 📚 Aulas

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

## 💰 Consciência de Custos

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
Isenção de responsabilidade:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se tradução profissional realizada por um tradutor humano. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->