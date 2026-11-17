# Capítulo 2: Desenvolvimento AI-First

**📚 Curso**: [AZD Para Iniciantes](../../README.md) | **⏱️ Duração**: 4-5 horas incluindo o workshop | **⭐ Complexidade**: Intermediário

---

## Visão Geral

Este capítulo foca na implantação de aplicações com IA usando Azure Developer CLI e serviços Microsoft Foundry. De aplicativos de chat simples com IA a agentes inteligentes com ferramentas.

> **Atualização Foundry GA (2026-11-09):** O pacote `microsoft.foundry` 1.0 está [disponível em geral](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Use `azd >= 1.37.0`; as avaliações continuam como instalação separada. O [tutorial de agente hospedado](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) cobre testes locais do Agent Inspector e implantação remota de código. Esta é uma revisão da documentação, não uma validação de implantação ao vivo; recursos de visualização opcionais mantêm seu próprio status.

## Objetivos de Aprendizagem

Ao concluir este capítulo, você irá:
- Implantar aplicações de IA usando templates pré-construídos do AZD
- Entender a integração Microsoft Foundry com AZD
- Instalar o pacote GA e testar um agente hospedado localmente antes de implantar sua fonte no Foundry
- Rever `azure.yaml`, ativos de avaliação e limpeza de projetos novos versus reutilizados
- Configurar e personalizar agentes de IA com ferramentas
- Implantar aplicações RAG (Geração Augmentada por Recuperação)

---

## 📚 Aulas

| # | Aula | Descrição | Tempo |
|---|--------|-------------|------|
| 1 | [Integração Microsoft Foundry](microsoft-foundry-integration.md) | Pacote GA, fluxo de trabalho local-para-nuvem do agente hospedado e avaliações | 60 min |
| 2 | [Guia de Agentes de IA](agents.md) | Implantar agentes inteligentes com ferramentas | 45 min |
| 3 | [Implantação de Modelo de IA](ai-model-deployment.md) | Implantar e configurar modelos de IA | 30 min |
| 4 | [Laboratório de Workshop de IA](ai-workshop-lab.md) | Prática: Explore um template e planeje sua conversão | 2-3 horas |

---

## 🚀 Início Rápido

Escolha uma opção em um diretório vazio novo. O `.` final inicializa o diretório atual; caso contrário o AZD pode criar um subdiretório sem alterar o diretório de trabalho do seu shell.

Para o **caminho de implantação de código do agente hospedado GA**, comece com o [tutorial guiado](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). Requer AZD 1.37.0+, uv atual, Python 3.13+, permissões Foundry e cota de modelos. Os templates completos de aplicação abaixo são alternativas, não pré-requisitos para esse tutorial.

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

## 🤖 Templates de IA em Destaque

| Template | Descrição | Serviços |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Chat RAG com citações | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Agente de IA com ferramentas | Serviço de Agentes de IA |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chat básico com IA | OpenAI + Container Apps |

---

## 💰 Conscientização de Custos

Estes são intervalos ilustrativos, não cotações ou limites; tráfego de modelos, SKUs de Search/compute, região e recursos opcionais podem excedê-los. Reveja a orientação de preços atual do exemplo escolhido antes de provisionar.

| Ambiente | Custo Mensal Estimado |
|-------------|----------------------|
| Desenvolvimento | US$ 80-150 |
| Staging | US$ 150-300 |
| Produção | US$ 300-3.500+ |

**Limpeza:** Revise `azd down` antes de confirmar: para um projeto Foundry recém-criado, ele exclui o grupo de recursos e tudo nele. Para um projeto Foundry reutilizado, mantém o projeto e os recursos do agente; siga a [orientação de limpeza do tutorial](microsoft-foundry-integration.md#7-clean-up-deliberately) para remover recursos indesejados separadamente.

---

## 🔗 Navegação

| Direção | Capítulo |
|-----------|---------|
| **Anterior** | [Capítulo 1: Fundamentos](../chapter-01-foundation/README.md) |
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