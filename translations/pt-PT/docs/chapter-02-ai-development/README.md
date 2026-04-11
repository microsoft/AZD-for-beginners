# Capítulo 2: Desenvolvimento AI-First

**📚 Curso**: [AZD Para Iniciantes](../../README.md) | **⏱️ Duração**: 1-2 horas | **⭐ Dificuldade**: Intermédio

---

## Visão Geral

Este capítulo foca-se no despliegue de aplicações alimentadas por IA utilizando o Azure Developer CLI e os serviços Microsoft Foundry. Desde aplicações simples de chat com IA a agentes inteligentes com ferramentas.

> **Nota de validação (2026-03-25):** O fluxo de comandos e as orientações sobre extensões neste capítulo foram revistos face à versão `azd` `1.23.12` e à versão atual em pré-visualização da extensão de agentes IA `azure.ai.agents` `0.1.18-preview`. Se estiver numa versão mais antiga do AZD, atualize primeiro e depois continue com os exercícios.

## Objetivos de Aprendizagem

Ao concluir este capítulo, irá:
- Desplegar aplicações IA usando templates AZD pré-construídos
- Compreender a integração Microsoft Foundry com AZD
- Configurar e personalizar agentes IA com ferramentas
- Desplegar aplicações RAG (Retrieval-Augmented Generation)

---

## 📚 Lições

| # | Lição | Descrição | Duração |
|---|--------|-------------|---------|
| 1 | [Integração Microsoft Foundry](microsoft-foundry-integration.md) | Ligar AZD com serviços Foundry | 30 min |
| 2 | [Guia de Agentes IA](agents.md) | Desplegar agentes inteligentes com ferramentas | 45 min |
| 3 | [Despliegue de Modelos IA](ai-model-deployment.md) | Desplegar e configurar modelos IA | 30 min |
| 4 | [Laboratório Prático AI Workshop](ai-workshop-lab.md) | Prático: Torne a sua solução IA preparada para AZD | 60 min |

---

## 🚀 Início Rápido

```bash
# Opção 1: Aplicação RAG Chat
azd init --template azure-search-openai-demo
azd up

# Opção 2: Agentes de IA
azd init --template get-started-with-ai-agents
azd up

# Opção 3: Aplicação Rápida de Chat
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Templates IA em Destaque

| Template | Descrição | Serviços |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Chat RAG com citações | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Agente IA com ferramentas | Serviço de Agente IA |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chat básico IA | OpenAI + Container Apps |

---

## 💰 Consciência de Custos

| Ambiente | Custo Mensal Estimado |
|----------|-----------------------|
| Desenvolvimento | 80-150 $ |
| Pré-produção | 150-300 $ |
| Produção | 300-3.500+ $ |

**Dica:** Execute `azd down` após os testes para evitar cobranças.

---

## 🔗 Navegação

| Direção | Capítulo |
|----------|----------|
| **Anterior** | [Capítulo 1: Fundamentos](../chapter-01-foundation/README.md) |
| **Seguinte** | [Capítulo 3: Configuração](../chapter-03-configuration/README.md) |
| **Ir para** | [Capítulo 8: Padrões de Produção](../chapter-08-production/README.md) |

---

## 📖 Recursos Relacionados

- [Resolução de Problemas IA](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Práticas de IA em Produção](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, por favor tenha em conta que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte oficial. Para informações críticas, recomenda-se a tradução profissional por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações erradas resultantes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->