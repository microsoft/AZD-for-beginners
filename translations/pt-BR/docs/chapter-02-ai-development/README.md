# Capítulo 2: Desenvolvimento AI-First

**📚 Curso**: [AZD Para Iniciantes](../../README.md) | **⏱️ Duração**: 4-5 horas incluindo o workshop | **⭐ Complexidade**: Intermediário

---

## Visão Geral

Este capítulo foca em implantar aplicações impulsionadas por IA usando Azure Developer CLI e serviços Microsoft Foundry. De apps simples de chat com IA a agentes inteligentes com ferramentas.

> **Revisão de lançamento (2026-11-04):** A orientação AI CLI foi verificada contra a documentação/fonte publicada `azd` `1.37.2`, `azure.ai.agents` `1.0.0-beta.23`, e `azure.ai.evaluations` `1.0.0-beta.2`. Use `azd >= 1.37.0` para o fluxo combinado. Avaliações agora usam o namespace `azd ai eval` separado; veja [alterações de lançamento e orientação para migração](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes). Esta não é uma validação de implantação ao vivo.

## Objetivos de Aprendizagem

Ao completar este capítulo, você irá:
- Implantar aplicações de IA usando modelos AZD pré-construídos
- Entender a integração Microsoft Foundry com AZD
- Configurar e personalizar agentes de IA com ferramentas
- Implantar aplicações RAG (Geração Aumentada por Recuperação)

---

## 📚 Aulas

| # | Aula | Descrição | Tempo |
|---|--------|-------------|------|
| 1 | [Integração Microsoft Foundry](microsoft-foundry-integration.md) | Conectar AZD com serviços Foundry | 30 min |
| 2 | [Guia de Agentes de IA](agents.md) | Implantar agentes inteligentes com ferramentas | 45 min |
| 3 | [Implantação de Modelos de IA](ai-model-deployment.md) | Implantar e configurar modelos de IA | 30 min |
| 4 | [Laboratório Workshop de IA](ai-workshop-lab.md) | Prática: Explorar um modelo e planejar sua conversão | 2-3 horas |

---

## 🚀 Início Rápido

Escolha uma opção em um diretório vazio novo. O `.` finaliza o diretório atual; caso contrário, AZD pode criar um subdiretório sem mudar o diretório de trabalho do seu shell.

```bash
# Option 1: RAG Chat Application
azd init --template azure-search-openai-demo .
azd up

# Option 2: AI Agents
azd init --template get-started-with-ai-agents .
azd up

# Option 3: Quick Chat App
azd init --template openai-chat-app-quickstart .
azd up
```

---

## 🤖 Modelos de IA em Destaque

| Modelo | Descrição | Serviços |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Chat RAG com citações | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Agente de IA com ferramentas | Serviço de Agente de IA |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chat básico de IA | OpenAI + Container Apps |

---

## 💰 Consciência de Custos

Estes são intervalos ilustrativos, não cotações ou limites; tráfego de modelos, SKUs de Search/compute, região e funcionalidades opcionais podem excedê-los. Reveja a orientação de preços atual do exemplo escolhido antes de provisionar.

| Ambiente | Custo Mensal Estimado |
|-------------|----------------------|
| Desenvolvimento | R$ 80-150 |
| Pré-produção | R$ 150-300 |
| Produção | R$ 300-3.500+ |

**Dica:** Execute `azd down` após o teste para evitar cobranças.

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
- [Práticas de IA para Produção](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->