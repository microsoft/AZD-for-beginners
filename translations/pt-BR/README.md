# AZD Para Iniciantes: Uma Jornada de Aprendizagem Estruturada

![AZD-for-beginners](../../translated_images/pt-BR/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://github.com/microsoft/AZD-for-beginners)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://github.com/microsoft/AZD-for-beginners)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Traduções Automáticas (Sempre Atualizadas)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Árabe](../ar/README.md) | [Bengali](../bn/README.md) | [Búlgaro](../bg/README.md) | [Birmanês (Myanmar)](../my/README.md) | [Chinês (Simplificado)](../zh-CN/README.md) | [Chinês (Tradicional, Hong Kong)](../zh-HK/README.md) | [Chinês (Tradicional, Macau)](../zh-MO/README.md) | [Chinês (Tradicional, Taiwan)](../zh-TW/README.md) | [Croata](../hr/README.md) | [Tcheco](../cs/README.md) | [Dinamarquês](../da/README.md) | [Holandês](../nl/README.md) | [Estoniano](../et/README.md) | [Finlandês](../fi/README.md) | [Francês](../fr/README.md) | [Alemão](../de/README.md) | [Grego](../el/README.md) | [Hebraico](../he/README.md) | [Hindi](../hi/README.md) | [Húngaro](../hu/README.md) | [Indonésio](../id/README.md) | [Italiano](../it/README.md) | [Japonês](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Coreano](../ko/README.md) | [Lituano](../lt/README.md) | [Malaio](../ms/README.md) | [Malaiala](../ml/README.md) | [Marata](../mr/README.md) | [Nepali](../ne/README.md) | [Pidgin Nigeriano](../pcm/README.md) | [Norueguês](../no/README.md) | [Persa (Farsi)](../fa/README.md) | [Polonês](../pl/README.md) | [Português (Brasil)](./README.md) | [Português (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romeno](../ro/README.md) | [Russo](../ru/README.md) | [Sérvio (Cirílico)](../sr/README.md) | [Eslovaco](../sk/README.md) | [Esloveno](../sl/README.md) | [Espanhol](../es/README.md) | [Suaíli](../sw/README.md) | [Sueco](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tâmil](../ta/README.md) | [Telugo](../te/README.md) | [Tailandês](../th/README.md) | [Turco](../tr/README.md) | [Ucraniano](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamita](../vi/README.md)

> **Prefere Clonar Localmente?**
>
> Este repositório inclui traduções em mais de 50 idiomas, o que aumenta significativamente o tamanho do download. Para clonar sem traduções, use o sparse checkout:
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
> Isso oferece tudo o que você precisa para completar o curso com um download muito mais rápido.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Novidades no azd Hoje

> 📌 **Atualização Foundry GA (09-11-2026):** O **`microsoft.foundry` 1.0 bundle está geralmente disponível**, anunciado em [5 de novembro de 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Use **`azd >= 1.37.0`** e instale com `azd ext install microsoft.foundry`. Siga o [tutorial do agente hospedado](docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) para configuração, testes locais e implantação. Esta atualização é baseada em orientações publicadas, não em uma implantação Azure ao vivo; o lançamento GA do bundle não torna todos os recursos opcionais, extensões ou SDK geralmente disponíveis.

O Azure Developer CLI suporta muitos tipos de aplicações, incluindo apps web, APIs e agentes de IA, através de hosts, templates e extensões suportadas.

Aqui está o que isso significa para você:

- **Um bundle GA para o desenvolvimento Foundry.** `microsoft.foundry` instala sete extensões principais, incluindo agentes, projetos e Agent Inspector. Código e configurações de implantação do agente permanecem juntos em `azure.yaml`.
- **Teste localmente, depois implante seu código.** Use `azd ai agent init --deploy-mode code`, `azd provision`, e `azd ai agent run` para inspecionar requisições e respostas locais. Depois use `azd deploy` para uma build remota no Foundry, sem uma build local de container.
- **Meça a qualidade separadamente.** Instale **`azure.ai.evaluations`** para `azd ai eval generate`, `init`, e `run start`; não está incluído no bundle. Mantenha datasets e rubricas revisadas junto com seu código. Projetos mais antigos devem seguir o [guia de migração de avaliação e otimização](docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks).
- **Reutilize configuração em CI/CD.** Após `azd up` bem-sucedido, configure um pipeline com `azd pipeline config`. Instale o bundle no runner e mantenha as configurações geradas de autenticação e ambiente.
- **Básicos do dia a dia mais suaves.** Lançamentos recentes tornaram `azd init` idempotente (seguro para reexecutar), tornaram `azd auth login` responsável por limpar tokens obsoletos automaticamente, e adicionaram um amigável prompt de configuração na primeira execução `azd tool`.
- **O fluxo principal não mudou.** Quer você esteja implantando um app de tarefas, um microsserviço ou uma solução AI multi-agente, os comandos são os mesmos.

> **Nota para usuários Aspire:** A Microsoft agora refere ao produto simplesmente como **Aspire** (antes ".NET Aspire"). O suporte do azd para Aspire permanece inalterado—apenas o nome foi atualizado.

Se você já usou o azd antes, o suporte a IA é uma extensão natural—não uma ferramenta separada ou uma trilha avançada. Se está começando agora, aprenderá um fluxo de trabalho que funciona para tudo.

---

## 🚀 O que é o Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** é uma ferramenta de linha de comando amigável para desenvolvedores que facilita implantar aplicações no Azure. Em vez de criar e conectar manualmente dezenas de recursos Azure, você pode implantar aplicações inteiras com um único comando.

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

O template fornece a configuração da aplicação e da infraestrutura. A implantação bem-sucedida ainda requer serviços/modelos suportados, cota e permissões suficientes, entradas corretas e verificação da aplicação implantada. `azd up` não torna automaticamente um template seguro, em conformidade ou pronto para produção.

---

## ❓ Azure Developer CLI vs Azure CLI: Qual a Diferença?

Esta é a pergunta mais comum entre iniciantes. Aqui está a resposta simples:

| Recurso | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Propósito** | Gerenciar recursos individuais do Azure | Implantar aplicações completas |
| **Mentalidade** | Focado em infraestrutura | Focado em aplicação |
| **Exemplo** | `az webapp create --name myapp...` | `azd up` |
| **Curva de aprendizado** | Precisa conhecer serviços Azure | Precisa conhecer sua aplicação |
| **Indicado para** | DevOps, Infraestrutura | Desenvolvedores, Protótipos |

### Analogia Simples

- **Azure CLI** é como ter todas as ferramentas para construir uma casa—martelos, serras, pregos. Você pode construir qualquer coisa, mas precisa conhecer construção.
- **Azure Developer CLI** é como contratar um empreiteiro—você descreve o que deseja, e ele cuida da construção.

### Quando Usar Cada Um

| Cenário | Use Este |
|----------|----------|
| "Quero implantar meu app web rapidamente" | `azd up` |
| "Preciso criar apenas uma conta de armazenamento" | `az storage account create` |
| "Estou construindo uma aplicação completa de IA" | `azd init --template azure-search-openai-demo` |
| "Preciso depurar um recurso específico do Azure" | `az resource show` |
| "Quero implantar no meu ambiente de produção configurado" | Reveja configuração, acesso, custo e controles operacionais antes do `azd up --environment production` |

### Eles Funcionam Juntos!

AZD e Azure CLI têm autenticação e configuração separadas. Use `azd auth login` para AZD, e `az login` quando um hook ou comando diagnóstico exigir explicitamente Azure CLI. Você pode usar ambos:
```bash
# Deploy your app with AZD
azd up

# Then fine-tune specific resources with Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Encontre Templates no Awesome AZD

Não comece do zero! **Awesome AZD** é a coleção comunitária de templates prontos para implantar:

| Recurso | Descrição |
|----------|-------------|
| 🔗 [**Galeria Awesome AZD**](https://azure.github.io/awesome-azd/) | Navegue por 200+ templates com deploy com um clique |
| 🔗 [**Enviar um Template**](https://github.com/Azure/awesome-azd/issues) | Contribua com seu próprio template para a comunidade |
| 🔗 [**Repositório GitHub**](https://github.com/Azure/awesome-azd) | Dê estrela e explore a fonte |

### Templates Populares de AI no Awesome AZD

Escolha um template em seu próprio diretório vazio; os comandos abaixo são alternativos. O `.` final inicializa esse diretório.

```bash
# RAG Chat with Microsoft Foundry Models + AI Search
azd init --template azure-search-openai-demo .

# Quick AI Chat Application
azd init --template openai-chat-app-quickstart .

# AI Agents with Foundry Agents
azd init --template get-started-with-ai-agents .
```

---

## 🎯 Começando em 3 Passos

Antes de começar, certifique-se de que sua máquina está pronta para o template que deseja implantar:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Se alguma verificação necessária falhar, corrija isso primeiro e depois continue com o início rápido.

### Passo 1: Instale AZD (2 minutos)

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

### Passo 2: Autentique-se para AZD

```bash
# Optional if you plan to use Azure CLI commands directly in this course
az login

# Required for AZD workflows
azd auth login
```

Se não tiver certeza de qual precisa, siga o fluxo completo na [Instalação & Configuração](docs/chapter-01-foundation/installation.md#authentication-setup).

### Passo 3: Implante Seu Primeiro App

```bash
# Initialize from a template
azd init --template todo-nodejs-mongo .

# Deploy to Azure (creates everything!)
azd up
```

**🎉 Isso é tudo!** Seu app está agora ao vivo no Azure.

### Limpeza (Não Esqueça!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Como Usar Este Curso

Este curso é projetado para **aprendizagem progressiva** – comece onde se sentir confortável e avance:

| Sua Experiência | Comece Aqui |
|-----------------|------------|
| **Novo no Azure** | [Capítulo 1: Fundamentos](#-chapter-1-foundation--quick-start) |
| **Conhece Azure, novo em AZD** | [Capítulo 1: Fundamentos](#-chapter-1-foundation--quick-start) |
| **Quer implantar apps de IA** | [Capítulo 2: Desenvolvimento AI-First](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Quer prática prática** | [🎓 Workshop Interativo](workshop/README.md) – laboratório guiado de 3-4 horas |
| **Precisa de padrões para produção** | [Capítulo 8: Produção & Enterprise](#-chapter-8-production--enterprise-patterns) |

### Configuração Rápida

1. **Faça Fork deste Repositório**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone-o**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Obtenha Ajuda**: [Comunidade Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **Prefere Clonar Localmente?**

> Este repositório inclui traduções para mais de 50 idiomas, o que aumenta significativamente o tamanho do download. Para clonar sem traduções, use o checkout esparso:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Isso lhe fornece tudo o que precisa para completar o curso com um download muito mais rápido.


## Visão Geral do Curso

Domine o Azure Developer CLI (azd) por meio de capítulos estruturados projetados para aprendizagem progressiva. **Foco especial no deployment de aplicações de IA com integração Microsoft Foundry.**

### Por que Este Curso é Essencial para Desenvolvedores Modernos

Desenvolvedores que realizam deploy de workloads de IA comumente precisam de orientação sobre:
- Arquiteturas complexas de IA com múltiplos serviços
- Melhores práticas para deployment em produção de IA  
- Integração e configuração de serviços de IA do Azure
- Otimização de custo para workloads de IA
- Solução de problemas específicos de deployment de IA

### Objetivos de Aprendizagem

Ao completar este curso estruturado, você irá:
- **Dominar os Fundamentos do AZD**: Conceitos essenciais, instalação e configuração
- **Deploy de Aplicações de IA**: Usar AZD com serviços Microsoft Foundry
- **Implementar Infraestrutura como Código**: Gerenciar recursos Azure com templates Bicep
- **Solucionar Problemas de Deployments**: Resolver problemas comuns e depurar falhas
- **Otimizar para Produção**: Segurança, escalabilidade, monitoramento e gestão de custos
- **Construir Soluções Multi-Agente**: Deploy de arquiteturas complexas de IA

## Antes de Começar: Contas, Acesso e Premissas

Antes de iniciar o Capítulo 1, certifique-se de ter o seguinte preparado. Os passos de instalação apresentados mais adiante assumem que esses fundamentos já estão prontos.

- **Uma assinatura Azure**: Você pode usar uma assinatura existente do trabalho ou sua própria conta, ou criar um [teste gratuito](https://aka.ms/azurefreetrial) para começar.
- **Permissão para criar recursos Azure**: Para a maioria dos exercícios, você deve ter pelo menos acesso de **Contribuidor** na assinatura ou grupo de recursos alvo. Alguns capítulos também podem assumir que você pode criar grupos de recursos, identidades gerenciadas e atribuições RBAC.
- [**Uma conta GitHub**](https://github.com): Útil para fazer fork do repositório, acompanhar suas próprias alterações e usar GitHub Codespaces no workshop.
- **Pré-requisitos de runtime para templates**: Alguns templates precisam de ferramentas locais como Node.js, Python, Java ou Docker. Execute o validador de setup antes de começar para detectar ferramentas faltantes cedo.
- **Familiaridade básica com terminal**: Você não precisa ser um expert, mas deve estar confortável executando comandos como `git clone`, `azd auth login`, e `azd up`.

> **Trabalhando em uma assinatura corporativa?**
> Se seu ambiente Azure é gerenciado por um administrador, confirme com antecedência se você pode implantar recursos na assinatura ou grupo de recursos que pretende usar. Caso contrário, solicite uma assinatura sandbox ou acesso de Contribuidor antes de começar.

> **Novo no Azure?**
> Comece com seu próprio teste Azure ou assinatura pay-as-you-go em https://aka.ms/azurefreetrial para conseguir completar os exercícios do início ao fim sem esperar por aprovações no nível do tenant.

## 🗺️ Mapa do Curso: Navegação Rápida por Capítulo

Cada capítulo possui um README dedicado com objetivos de aprendizado, guias rápidos e exercícios:

| Capítulo | Tema | Lições | Duração | Complexidade |
|---------|-------|---------|----------|------------|
| **[Cap 1: Fundamentos](docs/chapter-01-foundation/README.md)** | Primeiros Passos | [Noções Básicas do AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Instalação](docs/chapter-01-foundation/installation.md) &#124; [Primeiro Projeto](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Cap 2: Desenvolvimento de IA](docs/chapter-02-ai-development/README.md)** | Apps com foco em IA | [Integração Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Agentes de IA](docs/chapter-02-ai-development/agents.md) &#124; [Deploy de Modelos](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Cap 3: Configuração](docs/chapter-03-configuration/README.md)** | Autenticação e Segurança | [Configuração](docs/chapter-03-configuration/configuration.md) &#124; [Autenticação e Segurança](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Cap 4: Infraestrutura](docs/chapter-04-infrastructure/README.md)** | IaC e Deployment | [Guia de Deployment](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisionamento](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Cap 5: Multi-Agente](docs/chapter-05-multi-agent/README.md)** | Soluções com Agentes de IA | [Cenário de Varejo](examples/retail-scenario.md) &#124; [Padrões de Coordenação](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[Cap 6: Pré-Deployment](docs/chapter-06-pre-deployment/README.md)** | Planejamento e Validação | [Verificações Preliminares](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Planejamento de Capacidade](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Seleção de SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[Cap 7: Solução de Problemas](docs/chapter-07-troubleshooting/README.md)** | Depuração e Correção | [Problemas Comuns](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Depuração](docs/chapter-07-troubleshooting/debugging.md) &#124; [Problemas de IA](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[Cap 8: Produção](docs/chapter-08-production/README.md)** | Padrões Empresariais | [Práticas de Produção](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Laboratório Prático | [Introdução](workshop/docs/instructions/0-Introduction.md) &#124; [Seleção](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validação](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Desconstrução](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuração](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Personalização](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Desmontagem](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Conclusão](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**Duração Total do Curso:** ~10-14 horas | **Progressão de Habilidade:** Iniciante → Pronto para Produção

---

## 📚 Capítulos de Aprendizagem

*Selecione seu caminho de aprendizagem baseado no nível de experiência e objetivos*

### 🚀 Capítulo 1: Fundamentos e Início Rápido
**Pré-requisitos**: assinatura Azure, conhecimento básico de linha de comando  
**Duração**: 30-45 minutos  
**Complexidade**: ⭐

#### O que Você Vai Aprender
- Entender os fundamentos do Azure Developer CLI
- Instalar AZD na sua plataforma
- Seu primeiro deployment bem-sucedido

#### Recursos de Aprendizagem
- **🎯 Comece Aqui**: [O que é Azure Developer CLI?](#-what-is-azure-developer-cli-azd)
- **📖 Teoria**: [Noções Básicas do AZD](docs/chapter-01-foundation/azd-basics.md) - Conceitos centrais e terminologia
- **⚙️ Configuração**: [Instalação & Setup](docs/chapter-01-foundation/installation.md) - Guias específicos da plataforma
- **🛠️ Prático**: [Seu Primeiro Projeto](docs/chapter-01-foundation/first-project.md) - Tutorial passo a passo
- **📋 Referência Rápida**: [Folha de Comandos](resources/cheat-sheet.md)

#### Exercícios Práticos
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo .
azd up
```

**💡 Resultado do Capítulo**: Fazer o deploy com sucesso de uma aplicação web simples no Azure usando AZD

**✅ Validação de Sucesso:**
```bash
# After completing Chapter 1, you should be able to:
azd version              # Shows installed version
azd init --template todo-nodejs-mongo  # Initializes project
azd up                  # Deploys to Azure
azd show                # Displays running app URL
# Application opens in browser and works
azd down --force --purge  # Cleans up resources
```

**📊 Tempo Investido:** 30-45 minutos  
**📈 Nível de Habilidade Após:** Capaz de fazer deploy de aplicações básicas de forma independente

---

### 🤖 Capítulo 2: Desenvolvimento AI-First (Recomendado para Desenvolvedores de IA)
**Pré-requisitos**: Capítulo 1 completo  
**Duração**: 1-2 horas  
**Complexidade**: ⭐⭐

#### O que Você Vai Aprender
- Integração Microsoft Foundry com AZD
- Deploy de aplicações com IA incorporada
- Compreensão das configurações de serviços de IA

#### Recursos de Aprendizagem
- **🎯 Comece Aqui**: [Integração Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Agentes de IA**: [Guia de Agentes de IA](docs/chapter-02-ai-development/agents.md) - Deploy de agentes inteligentes com AZD
- **📖 Padrões**: [Deploy de Modelos de IA](docs/chapter-02-ai-development/ai-model-deployment.md) - Deploy e gerenciamento de modelos de IA
- **🛠️ Workshop**: [Laboratório AI Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) - Prepare suas soluções de IA para AZD
- **🎥 Guia Interativo**: [Materiais do Workshop](workshop/README.md) - Aprendizagem via navegador com MkDocs * Ambiente DevContainer
- **📋 Templates**: [Templates Microsoft Foundry](#featured-microsoft-foundry-templates)
- **📝 Exemplos**: [Exemplos de Deploy AZD](examples/README.md)

#### Exercícios Práticos
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo .
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart .
azd init --template agent-openai-python-prompty .
```

**💡 Resultado do Capítulo**: Deploy e configuração de uma aplicação de chat com IA e capacidades RAG

**✅ Validação de Sucesso:**
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

**📊 Tempo Investido:** 1-2 horas  
**📈 Nível de Habilidade Após:** Capaz de realizar deploy de aplicações de aprendizado de IA e identificar requisitos adicionais para prontidão em produção
**💰 Consciência de Custos:** Compreender custos de desenvolvimento de $80-150/mês, custos de produção de $300-3500/mês

#### 💰 Considerações de Custos para Deployments de IA

**Ambiente de Desenvolvimento (Estimado $80-150/mês):**
- Modelos Microsoft Foundry (Pay-as-you-go): $0-50/mês (baseado no uso de tokens)
- AI Search (nível básico): $75/mês
- Container Apps (Consumo): $0-20/mês
- Armazenamento (Padrão): $1-5/mês

**Ambiente de Produção (Estimado $300-3.500+/mês):**
- Modelos Microsoft Foundry (PTU para desempenho consistente): $3.000+/mês OU Pay-as-you-go com volume alto
- AI Search (nível padrão): $250/mês
- Container Apps (Dedicado): $50-100/mês
- Application Insights: $5-50/mês
- Armazenamento (Premium): $10-50/mês

**💡 Dicas para Otimização de Custos:**
- Verifique a precificação de inferência do modelo e créditos específicos da conta; Azure OpenAI não inclui uma franquia mensal universal de 50.000 tokens gratuitos
- Execute `azd down` para deletar recursos quando não mais necessários, após revisar o ambiente selecionado
- Comece com cobrança baseada no consumo, atualize para PTU somente em produção
- Use `azd provision --preview` para inspecionar a infraestrutura planejada, depois precifique os recursos resultantes com o Calculador de Preços do Azure
- Habilite o autoescalonamento: pague somente pelo uso real

**Monitoramento de Custos:**
```bash
# Inspect planned resources (this does not calculate prices)
azd provision --preview

# Monitor actual costs in Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Capítulo 3: Configuração e Autenticação
**Pré-requisitos**: Capítulo 1 completo  
**Duração**: 45-60 minutos  
**Complexidade**: ⭐⭐

#### O que Você Vai Aprender
- Configuração e gerenciamento do ambiente
- Melhores práticas de autenticação e segurança
- Nomeação e organização de recursos

#### Recursos de Aprendizagem
- **📖 Configuração**: [Guia de Configuração](docs/chapter-03-configuration/configuration.md) - Setup de ambiente
- **🔐 Segurança**: [Padrões de autenticação e identidade gerenciada](docs/chapter-03-configuration/authsecurity.md) - Padrões de autenticação
- **📝 Exemplos**: [Exemplo de Aplicação Banco de Dados](examples/database-app/README.md) - Exemplos AZD com banco de dados

#### Exercícios Práticos
- Configurar múltiplos ambientes (dev, staging, prod)
- Configurar autenticação com identidade gerenciada
- Implementar configurações específicas para ambientes

**💡 Resultado do Capítulo**: Gerenciar múltiplos ambientes com autenticação e segurança adequadas

---

### 🏗️ Capítulo 4: Infraestrutura como Código e Deployment
**Pré-requisitos**: Capítulos 1-3 completos  
**Duração**: 1-1.5 horas  
**Complexidade**: ⭐⭐⭐

#### O que Você Vai Aprender
- Padrões avançados de deployment
- Infraestrutura como Código com Bicep
- Estratégias de provisionamento de recursos

#### Recursos de Aprendizagem
- **📖 Deployment**: [Guia de Deployment](docs/chapter-04-infrastructure/deployment-guide.md) - Fluxos completos
- **🏗️ Provisionamento**: [Provisionando Recursos](docs/chapter-04-infrastructure/provisioning.md) - Gerenciamento de recursos Azure
- **📝 Exemplos**: [Exemplo de Aplicativo Container](../../examples/container-app) - Deployments conteinerizados

#### Exercícios Práticos
- Criar templates Bicep personalizados
- Deploy de aplicações multi-serviço
- Implementar estratégias de deployment blue-green

**💡 Resultado do Capítulo**: Deploy de aplicações complexas multi-serviço usando templates de infraestrutura personalizados

---

### 🎯 Capítulo 5: Soluções Multi-Agente de IA (Avançado)
**Pré-requisitos**: Capítulos 1-2 completos  
**Duração**: 2-3 horas  
**Complexidade**: ⭐⭐⭐⭐

#### O que Você Vai Aprender
- Padrões de arquitetura multi-agente
- Orquestração e coordenação de agentes
- Deployments de IA prontos para produção

#### Recursos de Aprendizagem
- **🤖 Design em Destaque**: [Solução Multi-Agente para Varejo](examples/retail-scenario.md) - Planta da arquitetura, não uma aplicação completa
- **🛠️ Modelos ARM**: [Pacote de Modelo ARM](../../examples/retail-multiagent-arm-template) - Estrutura de infraestrutura; revise pré-requisitos e componentes de aplicação ausentes
- **📖 Arquitetura**: [Padrões de coordenação multi-agente](docs/chapter-06-pre-deployment/coordination-patterns.md) - Padrões

#### Exercícios Práticos
```bash
# Inspect the retail infrastructure scaffold before choosing to deploy it
cd examples/retail-multiagent-arm-template
cat README.md

# After an intentional deployment, inspect infrastructure state
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Resultado do Capítulo**: Compreender o design multi-agente e identificar o trabalho de implementação, validação e operacionalização necessário além da estrutura da infraestrutura

---

### 🔍 Capítulo 6: Validação & Planejamento Pré-Implantação
**Pré-requisitos**: Capítulo 4 concluído  
**Duração**: 1 hora  
**Complexidade**: ⭐⭐

#### O que Você Vai Aprender
- Planejamento de capacidade e validação de recursos
- Estratégias de seleção de SKU
- Verificações prévias e automação

#### Recursos de Aprendizado
- **📊 Planejamento**: [Planejamento de Capacidade](docs/chapter-06-pre-deployment/capacity-planning.md) - Validação de recursos
- **💰 Seleção**: [Seleção de SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Escolhas custo-efetivas
- **✅ Validação**: [Verificações Pré-implantação](docs/chapter-06-pre-deployment/preflight-checks.md) - Scripts automatizados

#### Exercícios Práticos
- Executar scripts de validação de capacidade
- Otimizar seleções de SKU para custo
- Implementar checagens automatizadas pré-implantação

**💡 Resultado do Capítulo**: Validar e otimizar implantações antes da execução

---

### 🚨 Capítulo 7: Solução de Problemas & Depuração
**Pré-requisitos**: Qualquer capítulo de implantação concluído  
**Duração**: 1-1,5 horas  
**Complexidade**: ⭐⭐

#### O que Você Vai Aprender
- Abordagens sistemáticas de depuração
- Problemas comuns e soluções
- Solução de problemas específica para IA

#### Recursos de Aprendizado
- **🔧 Problemas Comuns**: [Problemas Comuns](docs/chapter-07-troubleshooting/common-issues.md) - FAQ e soluções
- **🕵️ Depuração**: [Guia de Depuração](docs/chapter-07-troubleshooting/debugging.md) - Estratégias passo a passo
- **🤖 Problemas de IA**: [Solução de Problemas Específica de IA](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problemas de serviços de IA

#### Exercícios Práticos
- Diagnosticar falhas de implantação
- Resolver problemas de autenticação
- Depurar conectividade de serviço de IA

**💡 Resultado do Capítulo**: Diagnosticar e resolver problemas comuns de implantação de forma independente

---

### 🏢 Capítulo 8: Padrões de Produção & Enterprise
**Pré-requisitos**: Capítulos 1-4 concluídos  
**Duração**: 2-3 horas  
**Complexidade**: ⭐⭐⭐⭐

#### O que Você Vai Aprender
- Estratégias de implantação de produção
- Padrões de segurança para empresas
- Monitoramento e otimização de custo

#### Recursos de Aprendizado
- **🏭 Produção**: [Melhores Práticas de IA para Produção](docs/chapter-08-production/production-ai-practices.md) - Padrões empresariais
- **📝 Exemplos**: [Exemplo de Microserviços](../../examples/microservices) - Arquiteturas complexas
- **📊 Monitoramento**: [Integração do Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Monitoramento

#### Exercícios Práticos
- Implementar padrões de segurança empresariais
- Configurar monitoramento abrangente
- Implantar em produção com governança adequada

**💡 Resultado do Capítulo**: Implantar aplicações prontas para produção com capacidades completas

---

## 🎓 Visão Geral do Workshop: Experiência de Aprendizado Prático

> **⚠️ STATUS DO WORKSHOP: Desenvolvimento Ativo**  
> Os materiais do workshop estão atualmente em desenvolvimento e refinamento. Os módulos principais estão funcionais, mas algumas seções avançadas estão incompletas. Estamos trabalhando ativamente para completar todo o conteúdo. [Acompanhe o progresso →](workshop/README.md)

### Materiais Interativos do Workshop
**Aprendizado prático completo com ferramentas baseadas em navegador e exercícios guiados**

Nossos materiais de workshop fornecem uma experiência de aprendizado estruturada e interativa que complementa o currículo baseado em capítulos acima. O workshop é projetado tanto para aprendizado no próprio ritmo quanto para sessões com instrutor.

#### 🛠️ Recursos do Workshop
- **Interface Baseada no Navegador**: Workshop completo com MkDocs com recursos de busca, copiar e temas
- **Integração com GitHub Codespaces**: Configuração de ambiente de desenvolvimento com um clique
- **Caminho de Aprendizado Estruturado**: 8 módulos de exercícios guiados (3-4 horas no total)
- **Metodologia Progressiva**: Introdução → Seleção → Validação → Desconstrução → Configuração → Personalização → Desmontagem → Conclusão
- **Ambiente Interativo DevContainer**: Ferramentas e dependências pré-configuradas

#### 📚 Estrutura do Módulo do Workshop
O workshop segue uma **metodologia progressiva de 8 módulos** que leva você da descoberta ao domínio da implantação:

| Módulo | Tema | O Que Você Vai Fazer | Duração |
|--------|-------|----------------|----------|
| **0. Introdução** | Visão Geral do Workshop | Entender objetivos de aprendizado, pré-requisitos e estrutura do workshop | 15 min |
| **1. Seleção** | Descoberta de Modelos | Explorar modelos AZD e selecionar o modelo AI certo para seu cenário | 20 min |
| **2. Validação** | Implantar & Verificar | Implantar o modelo com `azd up` e validar o funcionamento da infraestrutura | 30 min |
| **3. Desconstrução** | Entender a Estrutura | Usar GitHub Copilot para explorar arquitetura do modelo, arquivos Bicep e organização de código | 30 min |
| **4. Configuração** | Imersão no azure.yaml | Dominar configuração `azure.yaml`, hooks de ciclo de vida e variáveis de ambiente | 30 min |
| **5. Personalização** | Faça Seu | Habilitar Busca AI, rastreamento, avaliação e personalizar para seu cenário | 45 min |
| **6. Desmontagem** | Limpeza | Desprovisionar recursos com segurança usando `azd down --purge` | 15 min |
| **7. Conclusão** | Próximos Passos | Revisar conquistas, conceitos-chave e continuar sua jornada de aprendizado | 15 min |

**Fluxo do Workshop:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Começando o Workshop
```bash
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```

#### 🎯 Resultados do Aprendizado no Workshop
Ao concluir o workshop, os participantes irão:
- **Implantar Aplicações AI em Produção**: Usar AZD com serviços Microsoft Foundry
- **Dominar Arquiteturas Multi-Agente**: Implementar soluções coordenadas de agentes AI
- **Implementar Melhores Práticas de Segurança**: Configurar autenticação e controle de acesso
- **Otimizar para Escala**: Projetar implantações custo-efetivas e performáticas
- **Resolver Problemas de Implantação**: Solucionar problemas comuns de forma independente

#### 📖 Recursos do Workshop
- **🎥 Guia Interativo**: [Materiais do Workshop](workshop/README.md) - Ambiente de aprendizado baseado em navegador
- **📋 Instruções Módulo a Módulo**:
  - [0. Introdução](workshop/docs/instructions/0-Introduction.md) - Visão geral e objetivos do workshop
  - [1. Seleção](workshop/docs/instructions/1-Select-AI-Template.md) - Encontrar e selecionar modelos AI
  - [2. Validação](workshop/docs/instructions/2-Validate-AI-Template.md) - Implantar e verificar modelos
  - [3. Desconstrução](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Explorar arquitetura de modelos
  - [4. Configuração](workshop/docs/instructions/4-Configure-AI-Template.md) - Dominar azure.yaml
  - [5. Personalização](workshop/docs/instructions/5-Customize-AI-Template.md) - Personalizar para seu cenário
  - [6. Desmontagem](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Limpar recursos
  - [7. Conclusão](workshop/docs/instructions/7-Wrap-up.md) - Revisão e próximos passos
- **🛠️ Laboratório do Workshop de IA**: [Laboratório do Workshop de IA](docs/chapter-02-ai-development/ai-workshop-lab.md) - Exercícios focados em IA
- **💡 Início Rápido**: [Guia de Configuração do Workshop](workshop/README.md#browser-based-guide) - Configuração do ambiente

**Perfeito para**: Treinamento corporativo, cursos universitários, aprendizado autodirigido e bootcamps para desenvolvedores.

---

## 📖 Imersão: Capacidades do AZD

Além do básico, o AZD oferece recursos poderosos para implantações de produção:

- **Implantações baseadas em modelos** - Use modelos pré-construídos para padrões comuns de aplicação
- **Infraestrutura como Código** - Gerencie recursos Azure usando Bicep ou Terraform  
- **Fluxos de trabalho integrados** - Provisionar, implantar e monitorar aplicações de forma contínua
- **Amigável para desenvolvedores** - Otimizado para produtividade e experiência do desenvolvedor

### **AZD + Microsoft Foundry: Perfeito para Implantações de IA**

**Por que AZD para Soluções de IA?** AZD enfrenta os principais desafios que desenvolvedores de IA enfrentam:

- **Modelos Prontos para IA** - Modelos pré-configurados para Microsoft Foundry, Serviços Azure AI e cargas de trabalho ML
- **Implantações Seguras de IA** - Padrões de segurança integrados para serviços de IA, chaves API e endpoints de modelo  
- **Padrões de IA para Produção** - Melhores práticas para implantações de aplicações IA escaláveis e custo-efetivas
- **Fluxos de trabalho AI fim-a-fim** - Do desenvolvimento do modelo até implantação em produção com monitoramento adequado
- **Otimização de Custos** - Alocação inteligente de recursos e estratégias de escalonamento para cargas de trabalho de IA
- **Integração Microsoft Foundry** - Conexão perfeita com catálogo e endpoints Microsoft Foundry

---

## 🎯 Biblioteca de Modelos & Exemplos

### Em Destaque: Modelos Microsoft Foundry
**Comece aqui se estiver implantando aplicações IA!**

> **Nota:** Estes modelos demonstram vários padrões de IA. Alguns são exemplos externos do Azure, outros são implementações locais.

| Modelo | Capítulo | Complexidade | Serviços | Tipo |
|----------|---------|------------|----------|------|
| [**Inicie com chat IA**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capítulo 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Externo |
| [**Inicie com agentes IA**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Capítulo 2 | ⭐⭐ | Agentes Foundry + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Externo |
| [**Demonstração Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capítulo 2 | ⭐⭐ | Azure OpenAI + Azure AI Search + Container Apps (padrão) + Armazenamento | Externo |
| [**Início rápido app chat OpenAI**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capítulo 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Externo |
| [**Prompty Python agente OpenAI**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capítulo 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Externo |
| [**Chat RAG Contoso**](https://github.com/Azure-Samples/contoso-chat) | Capítulo 8 | ⭐⭐⭐⭐ | AzureOpenAI + Pesquisa IA + Cosmos DB + Container Apps | Externo |
| [**Solução Multi-Agente Varejo**](examples/retail-scenario.md) | Capítulo 5 | ⭐⭐⭐⭐ | Planta arquitetural proposta e estrutura de infraestrutura; implementação da aplicação necessária | **Planta local** |

### Em Destaque: Cenários de Aprendizado Completos
**Modelos de aplicações prontos para produção mapeados para capítulos de aprendizado**

| Modelo | Capítulo de Aprendizado | Complexidade | Aprendizado Chave |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capítulo 2 | ⭐ | Padrões básicos de implantação IA |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capítulo 2 | ⭐⭐ | Implementação RAG com Azure AI Search |
| [**get-started-with-ai-agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Capítulo 2 | ⭐⭐ | Chat com suporte de agentes e avaliações específicas do exemplo |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capítulo 5 | ⭐⭐⭐ | Framework de agente e chamadas de função |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Capítulo 8 | ⭐⭐⭐ | Orquestração corporativa de IA |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Capítulo 5 | ⭐⭐⭐⭐ | Arquitetura multi-agente com agentes Cliente e Inventário |

### Aprender pelo Tipo de Exemplo

> **📌 Exemplos Locais vs. Externos:**  
> **Exemplos Locais** (neste repositório) = Inspecione o README do exemplo para status de implementação e pré-requisitos
> **Exemplos Externos** (Samples Azure) = Clone dos repositórios vinculados

#### Exemplos Locais (Prontos para Usar)
- [**Solução Multi-Agente para Varejo**](examples/retail-scenario.md) - Planta arquitetural com estrutura ARM de infraestrutura
  - Propostos papéis de agentes Cliente e Inventário
  - Monitoramento, avaliação e código da aplicação devem ser implementados e verificados
  - Somente provisionar recursos não produz uma aplicação de varejo funcional

#### Exemplos Locais - Aplicações em Container (Capítulos 2-5)
**Exemplos abrangentes de implantação em container neste repositório:**
- [**Exemplos de Container Apps**](examples/container-app/README.md) - Guia completo para implantações conteinerizadas
  - [API Flask Simples](../../examples/container-app/simple-flask-api) - API REST básica com escala zero
  - [Arquitetura de Microserviços](../../examples/container-app/microservices) - Exemplo de aprendizado com dois serviços; endurecimento para produção é trabalho adicional
  - Início rápido, padrões de produção e implantação avançada
  - Orientações de monitoramento, segurança e otimização de custos

#### Exemplos Externos - Aplicações Simples (Capítulos 1-2)
**Clone esses repositórios de Samples Azure para começar:**
- [Aplicação Web Simples - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Padrões básicos de implantação
- [Site Estático - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Implantação de conteúdo estático
- [App de Contêiner - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Implantação de API REST

#### Exemplos Externos - Integração com Banco de Dados (Capítulos 3-4)  
- [App de Banco de Dados - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Padrões de conectividade com banco de dados
- [Funções + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Fluxo de trabalho de dados serverless

#### Exemplos Externos - Padrões Avançados (Capítulos 4-8)
- [Microsserviços Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - Arquiteturas multi-serviços
- [Jobs em Apps de Contêiner](https://github.com/Azure-Samples/container-apps-jobs) - Processamento em segundo plano  
- [Pipeline Empresarial de ML](https://github.com/Azure/mlops-v2) - Padrões de referência MLOps; não é um template AZD plug-and-play

### Coleções Externas de Templates
- [**Galeria Oficial de Templates AZD**](https://azure.github.io/awesome-azd/) - Coleção selecionada de templates oficiais e da comunidade
- [**Templates Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Documentação de templates Microsoft Learn
- [**Diretório de Exemplos**](examples/README.md) - Exemplos locais de aprendizado com explicações detalhadas

---

## 📚 Recursos de Aprendizado e Referências

### Referências Rápidas
- [**Tabela de Comandos**](resources/cheat-sheet.md) - Comandos essenciais do azd organizados por capítulo
- [**Glossário**](resources/glossary.md) - Terminologia Azure e azd  
- [**FAQ**](resources/faq.md) - Perguntas comuns organizadas por capítulo de aprendizado
- [**Guia de Estudos**](resources/study-guide.md) - Exercícios práticos abrangentes

### Workshops Práticos
- [**Laboratório de Workshop de IA**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Torne suas soluções de IA implantáveis via AZD (2-3 horas)
- [**Workshop Interativo**](workshop/README.md) - 8 módulos com exercícios guiados usando MkDocs e GitHub Codespaces
  - Segue a ordem: Introdução → Seleção → Validação → Desconstrução → Configuração → Customização → Desmontagem → Encerramento

### Recursos Externos de Aprendizado
- [Documentação Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centro de Arquitetura Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Calculadora de Preços Azure](https://azure.microsoft.com/pricing/calculator/)
- [Status do Azure](https://status.azure.com/)

### Habilidades de Agente de IA para Seu Editor
- [**Microsoft Azure Skills no skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 habilidades abertas de agente para Azure AI, Foundry, implantação, diagnóstico, otimização de custos e mais. Instale-os no GitHub Copilot, Cursor, Claude Code ou em qualquer agente suportado:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Guia Rápido de Solução de Problemas

**Problemas comuns enfrentados por iniciantes e soluções imediatas:**

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
<summary><strong>❌ "Nenhuma assinatura encontrada" ou "Assinatura não definida"</strong></summary>

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
<summary><strong>❌ "Quota insuficiente" ou "Quota excedida"</strong></summary>

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
<summary><strong>❌ "azd up" falha no meio do processo</strong></summary>

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
<summary><strong>❌ Implantação do template demora muito</strong></summary>

**Tempos normais de espera:**
- App web simples: 5-10 minutos
- App com banco de dados: 10-15 minutos
- Aplicações de IA: 15-25 minutos (Provisionamento OpenAI é lento)

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
<summary><strong>❌ Não consegue encontrar URL da aplicação implantada</strong></summary>

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

### 📚 Recursos Completos para Solução de Problemas

- **Guia de Problemas Comuns:** [Soluções Detalhadas](docs/chapter-07-troubleshooting/common-issues.md)
- **Problemas Específicos de IA:** [Solução de Problemas de IA](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Guia de Depuração:** [Depuração passo a passo](docs/chapter-07-troubleshooting/debugging.md)
- **Obtenha Ajuda:** [Discord Azure](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Conclusão do Curso & Certificação

### Acompanhamento de Progresso
Acompanhe seu progresso de aprendizado em cada capítulo:

- [ ] **Capítulo 1**: Fundamentos & Início Rápido ✅
- [ ] **Capítulo 2**: Desenvolvimento AI-First ✅  
- [ ] **Capítulo 3**: Configuração & Autenticação ✅
- [ ] **Capítulo 4**: Infraestrutura como Código & Implantação ✅
- [ ] **Capítulo 5**: Soluções de IA Multi-Agente ✅
- [ ] **Capítulo 6**: Validação & Planejamento Pré-Implantação ✅
- [ ] **Capítulo 7**: Solução de Problemas & Depuração ✅
- [ ] **Capítulo 8**: Padrões de Produção & Empresariais ✅

### Verificação de Aprendizado
Após completar cada capítulo, verifique seu conhecimento por meio de:
1. **Exercício Prático**: Complete a implantação prática do capítulo
2. **Verificação de Conhecimento**: Revise a seção FAQ do seu capítulo
3. **Discussão Comunitária**: Compartilhe sua experiência no Discord Azure
4. **Próximo Capítulo**: Passe para o próximo nível de complexidade

### Benefícios da Conclusão do Curso
Ao concluir todos os capítulos, você terá:
- **Experiência em Produção**: Implantado aplicações reais de IA no Azure
- **Habilidades Profissionais**: Capacidades de implantação prontas para empresa  
- **Reconhecimento na Comunidade**: Membro ativo da comunidade de desenvolvedores Azure
- **Avanço na Carreira**: Expertise demandada em AZD e implantação de IA

---

## 🤝 Comunidade & Suporte

### Obtenha Ajuda & Suporte
- **Problemas Técnicos**: [Reporte bugs e solicite recursos](https://github.com/microsoft/azd-for-beginners/issues)
- **Dúvidas de Aprendizado**: [Comunidade Microsoft Azure Discord](https://discord.gg/microsoft-azure) e [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Ajuda Específica de IA**: Junte-se ao [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentação**: [Documentação oficial do Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Insights da Comunidade no Microsoft Foundry Discord

**Tópicos discutidos pela comunidade:**
- Implantações multi-serviços, gerenciamento de credenciais e prontidão para produção
- Templates específicos de IA, guias de solução de problemas e melhores práticas

**Junte-se à nossa comunidade para:**
- Compartilhar suas experiências com AZD + IA e obter ajuda
- Acessar pré-visualizações antecipadas de novos templates de IA
- Contribuir para melhores práticas de implantação de IA
- Influenciar o desenvolvimento futuro de funcionalidades IA + AZD

### Contribuindo para o Curso
Agradecemos contribuições! Por favor, leia nosso [Guia de Contribuição](CONTRIBUTING.md) para detalhes sobre:
- **Melhorias de Conteúdo**: Aperfeiçoe capítulos e exemplos existentes
- **Novos Exemplos**: Adicione cenários reais e templates  
- **Tradução**: Ajude a manter suporte multilíngue
- **Relatos de Bugs**: Melhore precisão e clareza
- **Padrões da Comunidade**: Siga nossas diretrizes inclusivas para comunidade

---

## 📄 Informações do Curso

### Licença
Este projeto está licenciado sob a Licença MIT - veja o arquivo [LICENSE](../../LICENSE) para detalhes.

### Recursos Relacionados Microsoft Learn

Nossa equipe produz outros cursos de aprendizado abrangentes:

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
[![Agentes de IA para Iniciantes](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Série IA Generativa
[![IA Generativa para Iniciantes](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![IA Generativa (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![IA Generativa (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![IA Generativa (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Aprendizado Básico
[![ML para Iniciantes](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Ciência de Dados para Iniciantes](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![IA para Iniciantes](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cibersegurança para Iniciantes](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Desenvolvimento Web para Iniciantes](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT para Iniciantes](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Desenvolvimento XR para Iniciantes](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Série Copilot
[![Copilot para Programação em Par com IA](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot para C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Aventura Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navegação do Curso

**🚀 Pronto para Começar a Aprender?**

**Iniciantes**: Comece pelo [Capítulo 1: Fundamentos & Início Rápido](#-chapter-1-foundation--quick-start)  
**Desenvolvedores de IA**: Vá direto para [Capítulo 2: Desenvolvimento AI-First](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Desenvolvedores Experientes**: Comece pelo [Capítulo 3: Configuração & Autenticação](#️-chapter-3-configuration--authentication)

**Próximos Passos**: [Comece o Capítulo 1 - Conceitos Básicos AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->