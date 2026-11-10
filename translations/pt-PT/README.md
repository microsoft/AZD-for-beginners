# AZD Para Iniciantes: Uma Jornada de Aprendizagem Estruturada

![AZD-for-beginners](../../translated_images/pt-PT/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://github.com/microsoft/AZD-for-beginners)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://github.com/microsoft/AZD-for-beginners)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Traduções Automáticas (Sempre Atualizadas)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Árabe](../ar/README.md) | [Bengali](../bn/README.md) | [Búlgaro](../bg/README.md) | [Birmanês (Myanmar)](../my/README.md) | [Chinês (Simplificado)](../zh-CN/README.md) | [Chinês (Tradicional, Hong Kong)](../zh-HK/README.md) | [Chinês (Tradicional, Macau)](../zh-MO/README.md) | [Chinês (Tradicional, Taiwan)](../zh-TW/README.md) | [Croata](../hr/README.md) | [Checo](../cs/README.md) | [Dinamarquês](../da/README.md) | [Holandês](../nl/README.md) | [Estónio](../et/README.md) | [Finlandês](../fi/README.md) | [Francês](../fr/README.md) | [Alemão](../de/README.md) | [Grego](../el/README.md) | [Hebraico](../he/README.md) | [Hindi](../hi/README.md) | [Húngaro](../hu/README.md) | [Indonésio](../id/README.md) | [Italiano](../it/README.md) | [Japonês](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Coreano](../ko/README.md) | [Lituano](../lt/README.md) | [Malaio](../ms/README.md) | [Malayalam](../ml/README.md) | [Marati](../mr/README.md) | [Nepali](../ne/README.md) | [Pidgin Nigeriano](../pcm/README.md) | [Norueguês](../no/README.md) | [Persa (Farsi)](../fa/README.md) | [Polaco](../pl/README.md) | [Português (Brasil)](../pt-BR/README.md) | [Português (Portugal)](./README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romeno](../ro/README.md) | [Russo](../ru/README.md) | [Sérvio (Cirílico)](../sr/README.md) | [Eslovaco](../sk/README.md) | [Esloveno](../sl/README.md) | [Espanhol](../es/README.md) | [Suaíli](../sw/README.md) | [Sueco](../sv/README.md) | [Tagalo (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Tailandês](../th/README.md) | [Turco](../tr/README.md) | [Ucraniano](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamita](../vi/README.md)

> **Prefere Clonar Localmente?**
>
> Este repositório inclui traduções em mais de 50 idiomas, o que aumenta significativamente o tamanho do download. Para clonar sem traduções, use o checkout esparso:
>
> **Bash / macOS / Linux:**
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
>
> **CMD (Windows):**
> ```cmd
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone "/*" "!translations" "!translated_images"
> ```
>
> Isto dá-lhe tudo o que precisa para completar o curso com um download muito mais rápido.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Novidades no azd Hoje

> 📌 **Revisão do lançamento da CLI de IA (2026-11-04):** A orientação foi verificada com a documentação/fonte publicada de **`azd 1.37.2`**, **agentes `1.0.0-beta.23`**, e **avaliações `1.0.0-beta.2`**. Use `azd >= 1.37.0` para o fluxo de trabalho combinado. Execute `azd version` e [atualize a CLI principal](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) antes das extensões. Veja [mudanças e correções do lançamento](docs/chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes). Isto não é uma validação de implantação ao vivo de todo o curso.

A Azure Developer CLI suporta muitos tipos de aplicações, incluindo apps web, APIs e agentes de IA, através de hosts, templates e extensões suportados.

Eis o que isso significa para si:

- **Os agentes de IA são agora workloads azd de primeira classe.** Pode inicializar, implementar e gerir projetos de agentes de IA usando o mesmo fluxo `azd init` → `azd up` que já conhece.
- **Um ciclo de vida do agente em duas extensões.** Use `azure.ai.agents` para inicializar, invocar, otimizar e retirar agentes. Instale **`azure.ai.evaluations`** separadamente para `azd ai eval init`, `generate`, e `run start`. Beta.22 dos agentes substituiu o fluxo legado de avaliação e alterou a configuração de otimização; siga o [guia de migração](docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks).
- **Mais blocos de construção de IA.** Novas extensões preview—`azure.ai.skills` e `azure.ai.connections`—permitem-lhe gerir competências reutilizáveis de agentes e ligações Foundry diretamente com o azd.
- **Integração Microsoft Foundry** traz implantação de modelos, hospedagem de agentes e configuração de serviços de IA diretamente no ecossistema de templates do azd.
- **Melhorias nas tarefas diárias básicas.** Lançamentos recentes tornaram `azd init` idempotente (seguro para re-executar), fizeram `azd auth login` limpar automaticamente tokens antigos, e adicionaram um amigável prompt de configuração `azd tool` para a primeira execução.
- **O fluxo principal não mudou.** Quer esteja a implementar uma app de tarefas, um microsserviço, ou uma solução multiagente de IA, os comandos são os mesmos.

> **Nota para utilizadores Aspire:** A Microsoft agora refere-se ao produto simplesmente como **Aspire** (anteriormente ".NET Aspire"). O suporte do azd para Aspire permanece inalterado—apenas o nome foi atualizado.

Se já usou o azd antes, o suporte a IA é uma extensão natural—não uma ferramenta separada nem uma pista avançada. Se está a começar, vai aprender um fluxo de trabalho que funciona para tudo.

---

## 🚀 O que é a Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** é uma ferramenta de linha de comandos amigável para desenvolvedores que facilita o deployment de aplicações para o Azure. Em vez de criar e ligar manualmente dezenas de recursos Azure, pode implementar aplicações inteiras com um único comando.

### A Magia do `azd up`

```bash
# This single command does everything:
# ✅ Creates all Azure resources  
# ✅ Configures networking and security
# ✅ Builds your application code
# ✅ Deploys to Azure
# ✅ Gives you a working URL
azd up
```

O template fornece a configuração da aplicação e da infraestrutura. O deployment bem-sucedido ainda requer serviços/modelos suportados, quota e permissões suficientes, inputs corretos, e verificação da aplicação implementada. `azd up` não torna automaticamente um template seguro, conforme ou pronto para produção.

---

## ❓ Azure Developer CLI vs Azure CLI: Qual é a Diferença?

Esta é a pergunta mais comum dos iniciantes. Aqui está a resposta simples:

| Característica | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Objetivo** | Gerir recursos individuais do Azure | Implementar aplicações completas |
| **Mentalidade** | Focado na infraestrutura | Focado na aplicação |
| **Exemplo** | `az webapp create --name myapp...` | `azd up` |
| **Curva de Aprendizagem** | Deve conhecer serviços Azure | Basta conhecer a sua app |
| **Ideal Para** | DevOps, Infraestrutura | Desenvolvedores, Prototipagem |

### Analogia Simples

- **Azure CLI** é como ter todas as ferramentas para construir uma casa - martelos, serras, pregos. Pode construir qualquer coisa, mas precisa conhecer construção.
- **Azure Developer CLI** é como contratar um empreiteiro - descreve o que quer, e eles tratam da construção.

### Quando Usar Cada Um

| Cenário | Use Isto |
|----------|----------|
| "Quero implementar rapidamente a minha app web" | `azd up` |
| "Preciso criar apenas uma conta de armazenamento" | `az storage account create` |
| "Estou a construir uma aplicação completa de IA" | `azd init --template azure-search-openai-demo` |
| "Preciso depurar um recurso Azure específico" | `az resource show` |
| "Quero implementar no meu ambiente de produção configurado" | Revise configuração, acesso, custos, e controles operacionais antes de `azd up --environment production` |

### Eles Funcionam em Conjunto!

AZD e Azure CLI têm autenticação e configurações separadas. Use `azd auth login` para AZD, e `az login` quando um comando hook ou diagnóstico precisar explicitamente da Azure CLI. Pode usar ambos:
```bash
# Deploy your app with AZD
azd up

# Then fine-tune specific resources with Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Encontre Templates no Awesome AZD

Não comece do zero! **Awesome AZD** é a coleção comunitária de templates prontos para implementar:

| Recurso | Descrição |
|----------|-------------|
| 🔗 [**Galeria Awesome AZD**](https://azure.github.io/awesome-azd/) | Navegue por 200+ templates e implemente com um clique |
| 🔗 [**Submeta um Template**](https://github.com/Azure/awesome-azd/issues) | Contribua com seu próprio template para a comunidade |
| 🔗 [**Repositório GitHub**](https://github.com/Azure/awesome-azd) | Dê uma estrela e explore o código-fonte |

### Templates Populares de IA do Awesome AZD

Escolha um template numa diretoria vazia; os comandos abaixo são alternativas. O `.` final inicializa essa diretoria.

```bash
# RAG Chat with Microsoft Foundry Models + AI Search
azd init --template azure-search-openai-demo .

# Quick AI Chat Application
azd init --template openai-chat-app-quickstart .

# AI Agents with Foundry Agents
azd init --template get-started-with-ai-agents .
```

---

## 🎯 Começar em 3 Passos

Antes de começar, certifique-se que a sua máquina está pronta para o template que quer implementar:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Se alguma verificação necessária falhar, corrija primeiro e depois continue com o início rápido.

### Passo 1: Instalar AZD (2 minutos)

**Windows:**
```powershell
winget install microsoft.azd
```

**macOS:**
```bash
brew tap azure/azd && brew install azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### Passo 2: Autenticar para AZD

```bash
# Optional if you plan to use Azure CLI commands directly in this course
az login

# Required for AZD workflows
azd auth login
```

Se não tiver certeza do que precisa, siga o fluxo completo de configuração em [Instalação & Configuração](docs/chapter-01-foundation/installation.md#authentication-setup).

### Passo 3: Implemente a Sua Primeira App

```bash
# Initialize from a template
azd init --template todo-nodejs-mongo .

# Deploy to Azure (creates everything!)
azd up
```

**🎉 Está feito!** A sua app está agora ativa no Azure.

### Limpeza (Não Esqueça!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Como Usar Este Curso

Este curso foi desenhado para **aprendizagem progressiva** - comece onde se sentir confortável e avance gradualmente:

| Sua Experiência | Comece Aqui |
|-----------------|------------|
| **Totalmente novo em Azure** | [Capítulo 1: Fundamentos](#-chapter-1-foundation--quick-start) |
| **Conhece Azure, novo no AZD** | [Capítulo 1: Fundamentos](#-chapter-1-foundation--quick-start) |
| **Quer implementar apps de IA** | [Capítulo 2: Desenvolvimento Focado em IA](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Quer prática orientada** | [🎓 Workshop Interativo](workshop/README.md) - laboratório guiado de 3-4 horas |
| **Precisa de padrões para produção** | [Capítulo 8: Produção & Empresa](#-chapter-8-production--enterprise-patterns) |

### Configuração Rápida

1. **Fork deste Repositório**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone-o**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Obtenha Ajuda**: [Comunidade Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **Prefere Clonar Localmente?**

> Este repositório inclui traduções em mais de 50 idiomas, o que aumenta significativamente o tamanho do download. Para clonar sem traduções, use o checkout esparso:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Isto dá-lhe tudo o que precisa para completar o curso com um download muito mais rápido.


## Visão Geral do Curso

Domine o Azure Developer CLI (azd) através de capítulos estruturados concebidos para uma aprendizagem progressiva. **Foco especial na implementação de aplicações de IA com integração Microsoft Foundry.**

### Porquê este Curso é Essencial para Desenvolvedores Modernos

Desenvolvedores a implementar cargas de trabalho de IA normalmente precisam de orientação sobre:
- Arquiteturas complexas de IA multi-serviço
- Boas práticas para implementação de IA em produção  
- Integração e configuração de serviços Azure AI
- Otimização de custos para cargas de trabalho IA
- Resolução de problemas específicos em implementações de IA

### Objetivos de Aprendizagem

Ao completar este curso estruturado, irá:
- **Dominar os Fundamentos do AZD**: Conceitos-chave, instalação e configuração
- **Implementar Aplicações de IA**: Utilizar AZD com os serviços Microsoft Foundry
- **Implementar Infraestrutura como Código**: Gerir recursos Azure com modelos Bicep
- **Resolver Problemas de Implementação**: Diagnosticar e corrigir problemas comuns
- **Otimizar para Produção**: Segurança, escalabilidade, monitorização e gestão de custos
- **Construir Soluções Multi-Agente**: Implementar arquiteturas complexas de IA

## Antes de Começar: Contas, Acesso e Pressupostos

Antes de iniciar o Capítulo 1, certifique-se de ter o seguinte organizado. Os passos de instalação mais adiante neste guia pressupõem que estes fundamentos já se encontram tratados.

- **Uma subscrição Azure**: Pode usar uma subscrição existente do trabalho ou a sua conta pessoal, ou criar uma [trial gratuita](https://aka.ms/azurefreetrial) para começar.
- **Permissão para criar recursos Azure**: Para a maioria dos exercícios, deve ter pelo menos acesso **Contribuidor** na subscrição ou grupo de recursos alvo. Alguns capítulos também assumem que pode criar grupos de recursos, identidades geridas e atribuições RBAC.
- [**Uma conta GitHub**](https://github.com): Útil para fazer fork do repositório, acompanhar suas próprias alterações, e usar GitHub Codespaces para o workshop.
- **Pré-requisitos do runtime dos templates**: Alguns modelos necessitam de ferramentas locais como Node.js, Python, Java ou Docker. Execute o validador de configuração antes de começar para detectar falta de ferramentas cedo.
- **Familiaridade básica com terminal**: Não precisa ser especialista, mas deve sentir-se à vontade a executar comandos como `git clone`, `azd auth login` e `azd up`.

> **A trabalhar numa subscrição empresarial?**
> Se o seu ambiente Azure for gerido por um administrador, confirme antecipadamente se pode implementar recursos na subscrição ou grupo de recursos que planeia usar. Caso contrário, peça uma subscrição sandbox ou acesso de Contribuidor antes de começar.

> **Novo no Azure?**
> Comece com a sua própria trial Azure ou subscrição pay-as-you-go em https://aka.ms/azurefreetrial para poder completar os exercícios integralmente sem aguardar aprovações a nível de tenant.

## 🗺️ Mapa do Curso: Navegação Rápida por Capítulo

Cada capítulo tem um README dedicado com objetivos de aprendizagem, inícios rápidos e exercícios:

| Capítulo | Tema | Lições | Duração | Complexidade |
|---------|-------|---------|----------|------------|
| **[Cap 1: Fundamentos](docs/chapter-01-foundation/README.md)** | Início | [Noções Básicas AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Instalação](docs/chapter-01-foundation/installation.md) &#124; [Primeiro Projeto](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Cap 2: Desenvolvimento IA](docs/chapter-02-ai-development/README.md)** | Aplicações IA-First | [Integração Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Agentes IA](docs/chapter-02-ai-development/agents.md) &#124; [Implementação Modelos](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Cap 3: Configuração](docs/chapter-03-configuration/README.md)** | Autenticação & Segurança | [Configuração](docs/chapter-03-configuration/configuration.md) &#124; [Autenticação & Segurança](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Cap 4: Infraestrutura](docs/chapter-04-infrastructure/README.md)** | IaC & Implementação | [Guia de Implementação](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisionamento](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Cap 5: Multi-Agente](docs/chapter-05-multi-agent/README.md)** | Soluções Agentes IA | [Cenário Retalho](examples/retail-scenario.md) &#124; [Padrões de Coordenação](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[Cap 6: Pré-Implementação](docs/chapter-06-pre-deployment/README.md)** | Planeamento & Validação | [Checks Pre-Voo](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Planeamento de Capacidade](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Seleção de SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[Cap 7: Resolução de Problemas](docs/chapter-07-troubleshooting/README.md)** | Debug & Correção | [Problemas Comuns](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [Problemas IA](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[Cap 8: Produção](docs/chapter-08-production/README.md)** | Padrões Empresariais | [Práticas de Produção](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Laboratório Prático | [Introdução](workshop/docs/instructions/0-Introduction.md) &#124; [Seleção](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validação](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Desconstrução](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuração](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Personalização](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Desmontagem](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Conclusão](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**Duração Total do Curso:** ~10-14 horas | **Progressão de Competências:** Iniciante → Preparado para Produção

---

## 📚 Capítulos de Aprendizagem

*Selecione o seu percurso de aprendizagem com base na experiência e objetivos*

### 🚀 Capítulo 1: Fundamentos & Início Rápido
**Pré-requisitos**: Subscrição Azure, conhecimentos básicos de linha de comandos  
**Duração**: 30-45 minutos  
**Complexidade**: ⭐

#### O que Vai Aprender
- Compreender os fundamentos do Azure Developer CLI
- Instalar o AZD na sua plataforma
- A sua primeira implementação bem-sucedida

#### Recursos de Aprendizagem
- **🎯 Comece Aqui**: [O que é Azure Developer CLI?](#-what-is-azure-developer-cli-azd)
- **📖 Teoria**: [Noções Básicas AZD](docs/chapter-01-foundation/azd-basics.md) - Conceitos principais e terminologia
- **⚙️ Configuração**: [Instalação & Configuração](docs/chapter-01-foundation/installation.md) - Guias específicos por plataforma
- **🛠️ Prático**: [O Seu Primeiro Projeto](docs/chapter-01-foundation/first-project.md) - Tutorial passo a passo
- **📋 Referência Rápida**: [Folha de Comandos](resources/cheat-sheet.md)

#### Exercícios Práticos
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo .
azd up
```

**💡 Resultado do Capítulo**: Implementar com sucesso uma aplicação web simples no Azure usando AZD

**✅ Validação do Sucesso:**
```bash
# After completing Chapter 1, you should be able to:
azd version              # Shows installed version
azd init --template todo-nodejs-mongo  # Initializes project
azd up                  # Deploys to Azure
azd show                # Displays running app URL
# Application opens in browser and works
azd down --force --purge  # Cleans up resources
```

**📊 Investimento de Tempo:** 30-45 minutos  
**📈 Nível de Competência Após:** Capaz de implementar aplicações básicas de forma independente

---

### 🤖 Capítulo 2: Desenvolvimento IA-First (Recomendado para Desenvolvedores IA)
**Pré-requisitos**: Capítulo 1 concluído  
**Duração**: 1-2 horas  
**Complexidade**: ⭐⭐

#### O que Vai Aprender
- Integração Microsoft Foundry com AZD
- Implementação de aplicações alimentadas por IA
- Compreensão das configurações dos serviços IA

#### Recursos de Aprendizagem
- **🎯 Comece Aqui**: [Integração Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Agentes IA**: [Guia dos Agentes IA](docs/chapter-02-ai-development/agents.md) - Implementar agentes inteligentes com AZD
- **📖 Padrões**: [Implementação de Modelos IA](docs/chapter-02-ai-development/ai-model-deployment.md) - Implementar e gerir modelos IA
- **🛠️ Workshop**: [Laboratório IA](docs/chapter-02-ai-development/ai-workshop-lab.md) - Preparar soluções IA para AZD
- **🎥 Guia Interativo**: [Materiais do Workshop](workshop/README.md) - Aprendizagem em browser com MkDocs * Ambiente DevContainer
- **📋 Templates**: [Templates Microsoft Foundry](#featured-microsoft-foundry-templates)
- **📝 Exemplos**: [Exemplos Implementação AZD](examples/README.md)

#### Exercícios Práticos
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo .
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart .
azd init --template agent-openai-python-prompty .
```

**💡 Resultado do Capítulo**: Implementar e configurar uma aplicação de chat alimentada por IA com capacidades RAG

**✅ Validação do Sucesso:**
```bash
# After Chapter 2, you should be able to:
azd init --template azure-search-openai-demo .
azd up
# Test the AI chat interface
# Ask questions and get AI-powered responses with sources
# Verify search integration works
azd monitor  # Check Application Insights shows telemetry
azd down --force --purge
```

**📊 Investimento de Tempo:** 1-2 horas  
**📈 Nível de Competência Após:** Capaz de implementar aplicações de aprendizagem IA e identificar requisitos adicionais para produção
**💰 Consciência dos Custos:** Compreender custos de desenvolvimento entre $80-150/mês, custos de produção entre $300-3500/mês

#### 💰 Considerações de Custo para Implementações IA

**Ambiente de Desenvolvimento (Estimativa de $80-150/mês):**
- Modelos Microsoft Foundry (Pagamento conforme uso): $0-50/mês (com base no uso de tokens)
- Pesquisa IA (Nível básico): $75/mês
- Container Apps (Consumo): $0-20/mês
- Armazenamento (Standard): $1-5/mês

**Ambiente de Produção (Estimativa $300-3.500+/mês):**
- Modelos Microsoft Foundry (PTU para desempenho consistente): $3,000+/mês OU Pagamento conforme uso com alto volume
- Pesquisa IA (Nível standard): $250/mês
- Container Apps (Dedicado): $50-100/mês
- Application Insights: $5-50/mês
- Armazenamento (Premium): $10-50/mês

**💡 Dicas para Otimização de Custos:**
- Verificar preços de inferência do modelo e créditos específicos da conta; Azure OpenAI não inclui uma franquia mensal universal gratuita de 50,000 tokens
- Execute `azd down` para eliminar recursos quando não forem mais necessários, após rever o ambiente selecionado
- Comece com faturação baseada no consumo, upgrade para PTU apenas para produção
- Use `azd provision --preview` para inspecionar a infraestrutura planeada, depois estime os custos dos recursos com o Calculador de Preços Azure
- Ative a auto-escala: pague somente pelo uso efetivo

**Monitorização de Custos:**
```bash
# Inspect planned resources (this does not calculate prices)
azd provision --preview

# Monitor actual costs in Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Capítulo 3: Configuração & Autenticação
**Pré-requisitos**: Capítulo 1 concluído  
**Duração**: 45-60 minutos  
**Complexidade**: ⭐⭐

#### O que Vai Aprender
- Configuração e gestão do ambiente
- Boas práticas de autenticação e segurança
- Nomeação e organização de recursos

#### Recursos de Aprendizagem
- **📖 Configuração**: [Guia de Configuração](docs/chapter-03-configuration/configuration.md) - Preparação do ambiente
- **🔐 Segurança**: [Padrões de autenticação e identidade gerida](docs/chapter-03-configuration/authsecurity.md) - Padrões de autenticação
- **📝 Exemplos**: [Exemplo de Aplicação de Base de Dados](examples/database-app/README.md) - Exemplos AZD para bases de dados

#### Exercícios Práticos
- Configurar múltiplos ambientes (dev, staging, prod)
- Configurar autenticação com identidade gerida
- Implementar configurações específicas para cada ambiente

**💡 Resultado do Capítulo**: Gerir múltiplos ambientes com autenticação e segurança adequadas

---

### 🏗️ Capítulo 4: Infraestrutura como Código & Implementação
**Pré-requisitos**: Capítulos 1-3 concluídos  
**Duração**: 1-1.5 horas  
**Complexidade**: ⭐⭐⭐

#### O que Vai Aprender
- Padrões avançados de implementação
- Infraestrutura como Código com Bicep
- Estratégias de provisionamento de recursos

#### Recursos de Aprendizagem
- **📖 Implementação**: [Guia de Implementação](docs/chapter-04-infrastructure/deployment-guide.md) - Fluxos de trabalho completos
- **🏗️ Provisionamento**: [Provisionar Recursos](docs/chapter-04-infrastructure/provisioning.md) - Gestão de recursos Azure
- **📝 Exemplos**: [Exemplo de Container App](../../examples/container-app) - Implementações conteinerizadas

#### Exercícios Práticos
- Criar modelos Bicep personalizados
- Implementar aplicações multi-serviço
- Implementar estratégias de implementação blue-green

**💡 Resultado do Capítulo**: Implementar aplicações multi-serviço complexas usando modelos de infraestrutura personalizados

---

### 🎯 Capítulo 5: Soluções Multi-Agente IA (Avançado)
**Pré-requisitos**: Capítulos 1-2 concluídos  
**Duração**: 2-3 horas  
**Complexidade**: ⭐⭐⭐⭐

#### O que Vai Aprender
- Padrões de arquitetura multi-agente
- Orquestração e coordenação de agentes
- Implementações de IA preparadas para produção

#### Recursos de Aprendizagem
- **🤖 Design em Destaque**: [Solução Retail Multi-Agente](examples/retail-scenario.md) - Esquema arquitetural, não uma aplicação completa
- **🛠️ ARM Templates**: [Pacote de ARM Template](../../examples/retail-multiagent-arm-template) - Estrutura de infraestrutura; rever pré-requisitos e componentes da aplicação em falta
- **📖 Arquitetura**: [Padrões de coordenação multi-agente](docs/chapter-06-pre-deployment/coordination-patterns.md) - Padrões

#### Exercícios Práticos
```bash
# Inspect the retail infrastructure scaffold before choosing to deploy it
cd examples/retail-multiagent-arm-template
cat README.md

# After an intentional deployment, inspect infrastructure state
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Resultado do Capítulo**: Compreender o design multi-agente e identificar o trabalho de implementação, validação e operação necessário além de uma estrutura de infraestrutura

---

### 🔍 Capítulo 6: Validação & Planeamento Pré-Desdobramento
**Pré-requisitos**: Capítulo 4 concluído  
**Duração**: 1 hora  
**Complexidade**: ⭐⭐

#### O Que Vai Aprender
- Planeamento de capacidade e validação de recursos
- Estratégias de seleção de SKU
- Verificações prévias e automação

#### Recursos de Aprendizagem
- **📊 Planeamento**: [Planeamento de Capacidade](docs/chapter-06-pre-deployment/capacity-planning.md) - Validação de recursos
- **💰 Seleção**: [Seleção de SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Escolhas custo-efetivas
- **✅ Validação**: [Verificações Prévias](docs/chapter-06-pre-deployment/preflight-checks.md) - Scripts automatizados

#### Exercícios Práticos
- Executar scripts de validação de capacidade
- Otimizar escolhas de SKU para custo
- Implementar verificações automatizadas pré-desdobramento

**💡 Resultado do Capítulo**: Validar e otimizar desdobramentos antes da execução

---

### 🚨 Capítulo 7: Resolução de Problemas & Depuração
**Pré-requisitos**: Qualquer capítulo de desdobramento concluído  
**Duração**: 1-1.5 horas  
**Complexidade**: ⭐⭐

#### O Que Vai Aprender
- Abordagens sistemáticas de depuração
- Problemas comuns e soluções
- Resolução de problemas específica para IA

#### Recursos de Aprendizagem
- **🔧 Problemas Comuns**: [Problemas Comuns](docs/chapter-07-troubleshooting/common-issues.md) - FAQ e soluções
- **🕵️ Depuração**: [Guia de Depuração](docs/chapter-07-troubleshooting/debugging.md) - Estratégias passo a passo
- **🤖 Problemas de IA**: [Resolução de Problemas Específica para IA](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problemas em serviços de IA

#### Exercícios Práticos
- Diagnosticar falhas de desdobramento
- Resolver problemas de autenticação
- Depurar conectividade com serviço IA

**💡 Resultado do Capítulo**: Diagnosticar e resolver independentemente problemas comuns de desdobramento

---

### 🏢 Capítulo 8: Padrões de Produção & Empresariais
**Pré-requisitos**: Capítulos 1-4 concluídos  
**Duração**: 2-3 horas  
**Complexidade**: ⭐⭐⭐⭐

#### O Que Vai Aprender
- Estratégias de desdobramento em produção
- Padrões de segurança empresariais
- Monitorização e otimização de custos

#### Recursos de Aprendizagem
- **🏭 Produção**: [Melhores Práticas de IA em Produção](docs/chapter-08-production/production-ai-practices.md) - Padrões empresariais
- **📝 Exemplos**: [Exemplo de Microserviços](../../examples/microservices) - Arquiteturas complexas
- **📊 Monitorização**: [Integração do Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Monitorização

#### Exercícios Práticos
- Implementar padrões de segurança empresariais
- Configurar monitorização abrangente
- Desdobrar em produção com governança adequada

**💡 Resultado do Capítulo**: Desdobrar aplicações prontas para produção empresarial com todas as capacidades

---

## 🎓 Visão Geral do Workshop: Experiência de Aprendizagem Prática

> **⚠️ ESTADO DO WORKSHOP: Desenvolvimento Ativo**  
> Os materiais do workshop estão atualmente a ser desenvolvidos e aperfeiçoados. Módulos principais funcionais, mas algumas secções avançadas estão incompletas. Estamos a trabalhar ativamente para concluir todo o conteúdo. [Acompanhar progresso →](workshop/README.md)

### Materiais Interativos do Workshop
**Aprendizagem prática abrangente com ferramentas baseadas no navegador e exercícios guiados**

Os materiais do workshop proporcionam uma experiência de aprendizagem estruturada e interativa que complementa o currículo baseado em capítulos acima. O workshop é projetado para aprendizagem autónoma e sessões guiadas por instrutores.

#### 🛠️ Funcionalidades do Workshop
- **Interface Baseada no Navegador**: Workshop completo com MkDocs, com pesquisa, cópia e funcionalidades de tema
- **Integração com GitHub Codespaces**: Configuração do ambiente de desenvolvimento com um clique
- **Caminho de Aprendizagem Estruturado**: 8 módulos de exercícios guiados (3-4 horas no total)
- **Metodologia Progressiva**: Introdução → Seleção → Validação → Desconstrução → Configuração → Customização → Encerramento → Resumo
- **Ambiente Interativo DevContainer**: Ferramentas e dependências pré-configuradas

#### 📚 Estrutura dos Módulos do Workshop
O workshop segue uma **metodologia progressiva de 8 módulos** que o leva da descoberta à maestria no desdobramento:

| Módulo | Tema | O Que Vai Fazer | Duração |
|--------|-------|----------------|----------|
| **0. Introdução** | Visão Geral do Workshop | Compreender objetivos de aprendizagem, pré-requisitos e estrutura do workshop | 15 min |
| **1. Seleção** | Descoberta de Templates | Explorar templates AZD e selecionar o template AI certo para o seu cenário | 20 min |
| **2. Validação** | Desdobrar & Verificar | Desdobrar o template com `azd up` e validar funcionamento da infraestrutura | 30 min |
| **3. Desconstrução** | Compreender a Estrutura | Utilizar GitHub Copilot para explorar arquitetura do template, ficheiros Bicep, e organização de código | 30 min |
| **4. Configuração** | Mergulho no azure.yaml | Dominar configuração `azure.yaml`, hooks de ciclo de vida, e variáveis de ambiente | 30 min |
| **5. Customização** | Torne-o Seu | Ativar AI Search, tracing, avaliação, e personalizar para o seu cenário | 45 min |
| **6. Encerramento** | Limpeza | Desprovisionar recursos com segurança com `azd down --purge` | 15 min |
| **7. Resumo** | Próximos Passos | Rever conquistas, conceitos chave, e continuar a sua jornada de aprendizagem | 15 min |

**Fluxo do Workshop:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Começar o Workshop
```bash
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```

#### 🎯 Resultados de Aprendizagem do Workshop
Ao completar o workshop, os participantes irão:
- **Desdobrar Aplicações AI em Produção**: Usar AZD com serviços Microsoft Foundry
- **Dominar Arquiteturas Multi-Agente**: Implementar soluções AI coordenadas de agentes
- **Implementar Melhores Práticas de Segurança**: Configurar autenticação e controlo de acesso
- **Otimizar para Escala**: Desenhar desdobramentos custo-efetivos e performantes
- **Resolver Problemas em Desdobramentos**: Resolver problemas comuns independentemente

#### 📖 Recursos do Workshop
- **🎥 Guia Interativo**: [Materiais do Workshop](workshop/README.md) - Ambiente de aprendizagem baseado em navegador
- **📋 Instruções por Módulo**:
  - [0. Introdução](workshop/docs/instructions/0-Introduction.md) - Visão geral e objetivos do workshop
  - [1. Seleção](workshop/docs/instructions/1-Select-AI-Template.md) - Encontrar e selecionar templates AI
  - [2. Validação](workshop/docs/instructions/2-Validate-AI-Template.md) - Desdobrar e verificar templates
  - [3. Desconstrução](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Explorar arquitetura do template
  - [4. Configuração](workshop/docs/instructions/4-Configure-AI-Template.md) - Dominar azure.yaml
  - [5. Customização](workshop/docs/instructions/5-Customize-AI-Template.md) - Personalizar para o seu cenário
  - [6. Encerramento](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Limpar recursos
  - [7. Resumo](workshop/docs/instructions/7-Wrap-up.md) - Rever e próximos passos
- **🛠️ Laboratório AI Workshop**: [Laboratório AI Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) - Exercícios focados em IA
- **💡 Começo Rápido**: [Guia de Configuração do Workshop](workshop/README.md#browser-based-guide) - Configuração do ambiente

**Ideal para**: Formação corporativa, cursos universitários, aprendizagem autónoma, e bootcamps para desenvolvedores.

---

## 📖 Aproximar-se Detalhadamente: Capacidades AZD

Para além do básico, o AZD oferece funcionalidades poderosas para desdobramentos em produção:

- **Desdobramentos baseados em templates** - Usar templates pré-construídos para padrões comuns de aplicação
- **Infraestrutura como Código** - Gerir recursos Azure usando Bicep ou Terraform  
- **Workflows Integrados** - Provisionar, desdobrar e monitorizar aplicações de forma fluida
- **Amigável para desenvolvedores** - Otimizado para produtividade e experiência do desenvolvedor

### **AZD + Microsoft Foundry: Perfeito para Desdobramentos AI**

**Porque AZD para Soluções AI?** AZD resolve os principais desafios enfrentados por desenvolvedores AI:

- **Templates Prontos para IA** - Templates pré-configurados para Microsoft Foundry Models, Azure AI Services, e cargas de trabalho ML
- **Desdobramentos AI Seguros** - Padrões de segurança embutidos para serviços AI, chaves API, e endpoints de modelos  
- **Padrões AI para Produção** - Melhores práticas para desdobramentos escaláveis e custo-efetivos de aplicações AI
- **Workflows AI de ponta a ponta** - Desde desenvolvimento do modelo até desdobramento em produção com monitorização adequada
- **Otimização de Custos** - Estratégias inteligentes de alocação e escala de recursos para cargas AI
- **Integração Microsoft Foundry** - Ligação fluida ao catálogo de modelos e endpoints Microsoft Foundry

---

## 🎯 Biblioteca de Templates & Exemplos

### Em Destaque: Templates Microsoft Foundry
**Comece aqui se estiver a desdobrar aplicações AI!**

> **Nota:** Estes templates demonstram vários padrões AI. Alguns são exemplos externos do Azure Samples, outros são implementações locais.

| Template | Capítulo | Complexidade | Serviços | Tipo |
|----------|---------|------------|----------|------|
| [**Começar com chat AI**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capítulo 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Externo |
| [**Começar com agentes AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Capítulo 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Externo |
| [**Demo Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capítulo 2 | ⭐⭐ | Azure OpenAI + Azure AI Search + Container Apps (padrão) + Storage | Externo |
| [**Quickstart App OpenAI Chat**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capítulo 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Externo |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capítulo 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Externo |
| [**Chat RAG Contoso**](https://github.com/Azure-Samples/contoso-chat) | Capítulo 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Externo |
| [**Solução Multi-Agente Retail**](examples/retail-scenario.md) | Capítulo 5 | ⭐⭐⭐⭐ | Arquitetura proposta e estrutura de infraestrutura; implementação da aplicação necessária | **Plano local** |

### Em Destaque: Cenários de Aprendizagem Completa
**Templates prontos para produção mapeados para capítulos de aprendizagem**

| Template | Capítulo de Aprendizagem | Complexidade | Aprendizagem Principal |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capítulo 2 | ⭐ | Padrões básicos de desdobramento AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capítulo 2 | ⭐⭐ | Implementação RAG com Azure AI Search |
| [**começar-com-agentes-ai**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Capítulo 2 | ⭐⭐ | Chat suportado por agentes e testes de avaliação específicos |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capítulo 5 | ⭐⭐⭐ | Framework de agentes e chamada de funções |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Capítulo 8 | ⭐⭐⭐ | Orquestração de IA empresarial |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Capítulo 5 | ⭐⭐⭐⭐ | Arquitetura multi-agente com agentes de Cliente e Inventário |

### Aprendizagem Pelo Tipo de Exemplo

> **📌 Exemplos Locais vs. Externos:**  
> **Exemplos Locais** (neste repositório) = Consultar o README do exemplo para estado da implementação e pré-requisitos
> **Exemplos Externos** (Azure Samples) = Clonar dos repositórios ligados

#### Exemplos Locais (Prontos a Usar)
- [**Solução Multi-Agente Retail**](examples/retail-scenario.md) - Plano de arquitetura com estrutura de infraestrutura ARM
  - Funções propostas para agentes de Cliente e Inventário
  - Monitorização, avaliação e código da aplicação têm de ser implementados e verificados
  - Apenas provisionar os recursos não produz uma aplicação retalhista funcional

#### Exemplos Locais - Aplicações de Container (Capítulos 2-5)
**Exemplos completos de desdobramento de containers neste repositório:**
- [**Exemplos de Container App**](examples/container-app/README.md) - Guia completo para desdobramentos conteinerizados
  - [API Flask Simples](../../examples/container-app/simple-flask-api) - API REST básica com escala para zero
  - [Arquitetura de Microserviços](../../examples/container-app/microservices) - Exemplo de aprendizagem com dois serviços; fortificação para produção é trabalho adicional
  - Padrões de início rápido, produção e avançados
  - Orientações para monitorização, segurança e otimização de custos

#### Exemplos Externos - Aplicações Simples (Capítulos 1-2)
**Clone estes repositórios Azure Samples para começar:**
- [Aplicação Web Simples - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Padrões de desdobramento básicos
- [Website Estático - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Desdobramento de conteúdos estáticos
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Desdobramento API REST

#### Exemplos Externos - Integração de Base de Dados (Capítulos 3-4)  
- [Aplicação Base de Dados - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Padrões de conectividade de base de dados
- [Funções + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Fluxo de trabalho de dados serverless

#### Exemplos Externos - Padrões Avançados (Capítulos 4-8)
- [Microserviços Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - Arquiteturas multisserviço
- [Tarefas Container Apps](https://github.com/Azure-Samples/container-apps-jobs) - Processamento em segundo plano  
- [Pipeline Empresarial de ML](https://github.com/Azure/mlops-v2) - Padrões de referência MLOps; não é um template AZD plug-and-play

### Coleções de Templates Externos
- [**Galeria Oficial de Templates AZD**](https://azure.github.io/awesome-azd/) - Coleção selecionada de templates oficiais e da comunidade
- [**Templates Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Documentação oficial dos templates Microsoft Learn
- [**Diretório de Exemplos**](examples/README.md) - Exemplos locais de aprendizagem com explicações detalhadas

---

## 📚 Recursos de Aprendizagem & Referências

### Referências Rápidas
- [**Folha de Comandos**](resources/cheat-sheet.md) - Comandos azd essenciais organizados por capítulo
- [**Glossário**](resources/glossary.md) - Terminologia Azure e azd  
- [**FAQ**](resources/faq.md) - Perguntas frequentes organizadas por capítulo de aprendizagem
- [**Guia de Estudo**](resources/study-guide.md) - Exercícios práticos abrangentes

### Workshops Práticos
- [**Laboratório de Workshop AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Torne as suas soluções AI implementáveis com AZD (2-3 horas)
- [**Workshop Interativo**](workshop/README.md) - Exercícios guiados em 8 módulos com MkDocs e GitHub Codespaces
  - Segue: Introdução → Seleção → Validação → Deconstrução → Configuração → Personalização → Desmontagem → Conclusão

### Recursos Externos de Aprendizagem
- [Documentação Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centro de Arquitetura Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Calculadora de Preços Azure](https://azure.microsoft.com/pricing/calculator/)
- [Estado Azure](https://status.azure.com/)

### Competências de Agentes AI para o Seu Editor
- [**Competências Microsoft Azure em skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 competências open agent para Azure AI, Foundry, implementação, diagnóstico, otimização de custos e mais. Instale-os no GitHub Copilot, Cursor, Claude Code ou qualquer agente suportado:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Guia Rápido de Resolução de Problemas

**Problemas comuns que principiantes enfrentam e soluções imediatas:**

<details>
<summary><strong>❌ "azd: comando não encontrado"</strong></summary>

```bash
# Install AZD first
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Verify installation
azd version
```
</details>

<details>
<summary><strong>❌ "Nenhuma subscrição encontrada" ou "Subscrição não definida"</strong></summary>

```bash
# List available subscriptions
az account list --output table

# Set default subscription
az account set --subscription "<subscription-id-or-name>"

# Set for AZD environment
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Verify
az account show
```
</details>

<details>
<summary><strong>❌ "QuotaInsuficiente" ou "Quota excedida"</strong></summary>

```bash
# Try different Azure region
azd env set AZURE_LOCATION "westus2"
azd up

# Or use smaller SKUs in development
# Edit infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" falha a meio do caminho</strong></summary>

```bash
# Option 1: Inspect the error and retry after correcting its cause
azd show
azd up --debug

# Option 2: Just fix infrastructure
azd provision

# Option 3: Check detailed status
azd show

# Option 4: Check logs in Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Falha na autenticação" ou "Token expirado"</strong></summary>

```bash
# Re-authenticate for AZD
azd auth logout
azd auth login

# Optional: refresh Azure CLI too if you are running az commands
az logout
az login

# Verify authentication
az account show
```
</details>

<details>
<summary><strong>❌ "Recurso já existe" ou conflitos de nomenclatura</strong></summary>

```bash
# Inspect the conflicting resource before changing or deleting anything.
# For an isolated new deployment, create a separate environment:
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Implantação do template demorada</strong></summary>

**Tempos normais de espera:**
- Aplicação web simples: 5-10 minutos
- Aplicação com base de dados: 10-15 minutos
- Aplicações AI: 15-25 minutos (provisionamento OpenAI é lento)

```bash
# Check progress
azd show

# If stuck >30 minutes, check Azure Portal:
azd monitor --overview
# Look for failed deployments
```
</details>

<details>
<summary><strong>❌ "Permissão negada" ou "Proibido"</strong></summary>

```bash
# Check your Azure role
az role assignment list --assignee $(az account show --query user.name -o tsv)

# You need at least "Contributor" role
# Ask your Azure admin to grant:
# - Contributor (for resources)
# - User Access Administrator (for role assignments)
```
</details>

<details>
<summary><strong>❌ Incapaz de encontrar a URL da aplicação implantada</strong></summary>

```bash
# Show all service endpoints
azd show

# Or open Azure Portal
azd monitor

# Check specific service
azd env get-values
# Look for *_URL variables
```
</details>

### 📚 Recursos Completos de Resolução de Problemas

- **Guia de Problemas Comuns:** [Soluções Detalhadas](docs/chapter-07-troubleshooting/common-issues.md)
- **Problemas Específicos de AI:** [Resolução de Problemas AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Guia de Depuração:** [Debugging passo a passo](docs/chapter-07-troubleshooting/debugging.md)
- **Obter Ajuda:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Conclusão do Curso & Certificação

### Acompanhamento do Progresso
Acompanhe o seu progresso de aprendizagem em cada capítulo:

- [ ] **Capítulo 1**: Fundamentos & Início Rápido ✅
- [ ] **Capítulo 2**: Desenvolvimento AI-First ✅  
- [ ] **Capítulo 3**: Configuração & Autenticação ✅
- [ ] **Capítulo 4**: Infraestrutura como Código & Implantação ✅
- [ ] **Capítulo 5**: Soluções AI Multi-Agente ✅
- [ ] **Capítulo 6**: Validação & Planeamento Pré-Implantação ✅
- [ ] **Capítulo 7**: Resolução de Problemas & Depuração ✅
- [ ] **Capítulo 8**: Padrões de Produção & Empresariais ✅

### Verificação da Aprendizagem
Depois de concluir cada capítulo, verifique os seus conhecimentos através de:
1. **Exercício Prático**: Complete a implantação prática do capítulo
2. **Verificação de Conhecimentos**: Revise a secção FAQ do seu capítulo
3. **Discussão Comunitária**: Partilhe a sua experiência no Azure Discord
4. **Próximo Capítulo**: Avance para o próximo nível de complexidade

### Benefícios da Conclusão do Curso
Ao concluir todos os capítulos, terá:
- **Experiência em Produção**: Aplicações AI reais implantadas no Azure
- **Competências Profissionais**: Capacidades para implementações prontas para empresas  
- **Reconhecimento Comunitário**: Membro ativo da comunidade de desenvolvedores Azure
- **Avanço na Carreira**: Especialização em AZD e implementação AI em alta procura

---

## 🤝 Comunidade & Suporte

### Obter Ajuda & Suporte
- **Problemas Técnicos**: [Reportar bugs e pedir funcionalidades](https://github.com/microsoft/azd-for-beginners/issues)
- **Questões de Aprendizagem**: [Comunidade Microsoft Azure Discord](https://discord.gg/microsoft-azure) e [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Ajuda Específica AI**: Junte-se ao [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentação**: [Documentação oficial Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Insights da Comunidade no Microsoft Foundry Discord

**Tópicos discutidos pela comunidade:**
- Implementações multisserviço, gestão de credenciais e prontidão para produção
- Templates específicos AI, guias de resolução de problemas e melhores práticas

**Junte-se à nossa comunidade para:**
- Partilhar as suas experiências AZD + AI e obter ajuda
- Aceder a pré-visualizações iniciais de novos templates AI
- Contribuir para as melhores práticas de implementação AI
- Influenciar o desenvolvimento futuro de funcionalidades AI + AZD

### Contribuir para o Curso
Agradecemos contribuições! Por favor leia o nosso [Guia de Contribuição](CONTRIBUTING.md) para detalhes sobre:
- **Melhorias de Conteúdo**: Aprimore capítulos e exemplos existentes
- **Novos Exemplos**: Adicione cenários reais e templates  
- **Tradução**: Ajude a manter o suporte multilíngue
- **Relatórios de Erros**: Melhore a precisão e clareza
- **Normas Comunitárias**: Siga as nossas diretrizes comunitárias inclusivas

---

## 📄 Informações do Curso

### Licença
Este projeto está licenciado sob a Licença MIT - veja o ficheiro [LICENSE](../../LICENSE) para mais detalhes.

### Recursos de Aprendizagem Relacionados da Microsoft

A nossa equipa produz outros cursos de aprendizagem abrangentes:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j para Iniciantes](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js para Iniciantes](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain para Iniciantes](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agentes
[![AZD para Iniciantes](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI para Iniciantes](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP para Iniciantes](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Agentes AI para Iniciantes](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Série AI Generativa
[![AI Generativa para Iniciantes](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Generativa (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![AI Generativa (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![AI Generativa (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Aprendizagem Essencial
[![ML para Iniciantes](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Ciência de Dados para Iniciantes](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI para Iniciantes](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cibersegurança para Iniciantes](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Desenvolvimento Web para Iniciantes](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT para Iniciantes](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Desenvolvimento XR para Iniciantes](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Série Copilot
[![Copilot para Programação Emparelhada AI](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot para C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Aventura Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navegação do Curso

**🚀 Pronto para Começar a Aprender?**

**Iniciantes**: Comece com [Capítulo 1: Fundamentos & Início Rápido](#-chapter-1-foundation--quick-start)  
**Desenvolvedores AI**: Avance para [Capítulo 2: Desenvolvimento AI-First](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Desenvolvedores Experientes**: Inicie com [Capítulo 3: Configuração & Autenticação](#️-chapter-3-configuration--authentication)

**Próximos Passos**: [Iniciar Capítulo 1 - Noções Básicas AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->