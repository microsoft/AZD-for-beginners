# Capítulo 2: Desenvolvimento com Foco em IA

**📚 Curso**: [AZD For Beginners](../../README.md) | **⏱️ Duração**: 1-2 horas | **⭐ Complexidade**: Intermediário

---

## Visão Geral

Este capítulo foca em implantar aplicações com tecnologia de IA usando Azure Developer CLI e serviços Microsoft Foundry. De aplicativos de chat de IA simples a agentes inteligentes com ferramentas.

> **Nota de validação (2026-03-25):** O fluxo de comandos e as orientações de extensão neste capítulo foram revisados em relação ao `azd` `1.23.12` e à versão de visualização atual da extensão de agente de IA `azure.ai.agents` `0.1.18-preview`. Se você estiver em uma versão mais antiga do AZD, atualize primeiro e então continue com os exercícios.

## Objetivos de Aprendizagem

Ao concluir este capítulo, você irá:
- Implantar aplicações de IA usando templates AZD pré-configurados
- Entender a integração do Microsoft Foundry com o AZD
- Configurar e personalizar agentes de IA com ferramentas
- Implantar aplicações RAG (Retrieval-Augmented Generation)

---

## 📚 Lições

| # | Lição | Descrição | Tempo |
|---|--------|-------------|------|
| 1 | [Integração com Microsoft Foundry](microsoft-foundry-integration.md) | Conectar o AZD com os serviços Foundry | 30 min |
| 2 | [Guia de Agentes de IA](agents.md) | Implantar agentes inteligentes com ferramentas | 45 min |
| 3 | [Implantação de Modelos de IA](ai-model-deployment.md) | Implantar e configurar modelos de IA | 30 min |
| 4 | [Laboratório Prático de IA](ai-workshop-lab.md) | Prático: Deixe sua solução de IA pronta para AZD | 60 min |

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

## 🤖 Modelos de IA em destaque

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
| **Ir para** | [Capítulo 8: Padrões de Produção](../chapter-08-production/README.md) |

---

## 📖 Recursos Relacionados

- [Solução de Problemas de IA](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Práticas de IA para Produção](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Isenção de responsabilidade**:
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original, em seu idioma nativo, deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução humana profissional. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->