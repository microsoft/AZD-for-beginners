# AZD Para Iniciantes: Uma Jornada de Aprendizagem Estruturada

![AZD-for-beginners](../../translated_images/pt-PT/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Traduções Automáticas (Sempre Atualizadas)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Árabe](../ar/README.md) | [Bengali](../bn/README.md) | [Búlgaro](../bg/README.md) | [Birmanês (Myanmar)](../my/README.md) | [Chinês (Simplificado)](../zh-CN/README.md) | [Chinês (Tradicional, Hong Kong)](../zh-HK/README.md) | [Chinês (Tradicional, Macau)](../zh-MO/README.md) | [Chinês (Tradicional, Taiwan)](../zh-TW/README.md) | [Croata](../hr/README.md) | [Checo](../cs/README.md) | [Dinamarquês](../da/README.md) | [Holandês](../nl/README.md) | [Estónio](../et/README.md) | [Finlandês](../fi/README.md) | [Francês](../fr/README.md) | [Alemão](../de/README.md) | [Grego](../el/README.md) | [Hebraico](../he/README.md) | [Hindi](../hi/README.md) | [Húngaro](../hu/README.md) | [Indonésio](../id/README.md) | [Italiano](../it/README.md) | [Japonês](../ja/README.md) | [Kannada](../kn/README.md) | [Coreano](../ko/README.md) | [Lituano](../lt/README.md) | [Malaio](../ms/README.md) | [Malaiala](../ml/README.md) | [Marathi](../mr/README.md) | [Nepalês](../ne/README.md) | [Pidgin Nigeriano](../pcm/README.md) | [Norueguês](../no/README.md) | [Persa (Farsi)](../fa/README.md) | [Polaco](../pl/README.md) | [Português (Brasil)](../pt-BR/README.md) | [Português (Portugal)](./README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romeno](../ro/README.md) | [Russo](../ru/README.md) | [Sérvio (Cirílico)](../sr/README.md) | [Eslovaco](../sk/README.md) | [Esloveno](../sl/README.md) | [Espanhol](../es/README.md) | [Suaíli](../sw/README.md) | [Sueco](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Tailandês](../th/README.md) | [Turco](../tr/README.md) | [Ucraniano](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamita](../vi/README.md)

> **Prefere Clonar Localmente?**
>
> Este repositório inclui mais de 50 traduções que aumentam significativamente o tamanho do download. Para clonar sem as traduções, use checkout esparso:
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
> Isto fornece tudo o que precisa para completar o curso com um download muito mais rápido.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Novidades Hoje no azd

O Azure Developer CLI cresceu para além das tradicionais aplicações web e APIs. Hoje, o azd é a ferramenta única para implementar **qualquer** aplicação no Azure — incluindo aplicações com IA e agentes inteligentes.

Isto significa para si:

- **Agentes de IA são agora workloads de primeira classe no azd.** Pode inicializar, implementar e gerir projetos de agentes de IA usando o mesmo fluxo `azd init` → `azd up` que já conhece.
- **A integração Microsoft Foundry** traz a implementação de modelos, alojamento de agentes e configuração de serviços de IA diretamente para o ecossistema de templates azd.
- **O fluxo de trabalho principal não mudou.** Quer esteja a implementar uma app de tarefas, um microsserviço ou uma solução multi-agente de IA, os comandos são os mesmos.

Se já usou azd antes, o suporte a IA é uma extensão natural — não uma ferramenta separada ou uma rota avançada. Se está a começar do zero, vai aprender um fluxo que funciona para tudo.

---

## 🚀 O que é o Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** é uma ferramenta de linha de comandos amigável para desenvolvedores que facilita a implementação de aplicações no Azure. Em vez de criar e ligar manualmente dezenas de recursos Azure, pode implementar aplicações inteiras com um único comando.

### A Magia do `azd up`

```bash
# Este único comando faz tudo:
# ✅ Cria todos os recursos do Azure
# ✅ Configura a rede e a segurança
# ✅ Compila o código da sua aplicação
# ✅ Faz o deploy para o Azure
# ✅ Fornece-lhe uma URL funcional
azd up
```

**É só isto!** Sem cliques no Portal Azure, sem aprender templates ARM complexos, sem configurações manuais — apenas aplicações a funcionar no Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Qual é a Diferença?

Esta é a pergunta mais frequente dos iniciantes. Aqui está a resposta simples:

| Funcionalidade | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|----------------|---------------------|---------------------------------|
| **Objetivo** | Gerir recursos Azure individuais | Implementar aplicações completas |
| **Mentalidade** | Focado em infraestruturas | Focado em aplicações |
| **Exemplo** | `az webapp create --name myapp...` | `azd up` |
| **Curva de Aprendizagem** | É necessário conhecer serviços Azure | Basta conhecer a sua app |
| **Ideal Para** | DevOps, Infraestrutura | Desenvolvedores, Prototipagem |

### Analogia Simples

- **Azure CLI** é como ter todas as ferramentas para construir uma casa — martelos, serras, pregos. Pode construir tudo, mas tem de saber de construção.
- **Azure Developer CLI** é como contratar um empreiteiro — diz o que quer e eles tratam da construção.

### Quando Usar Cada Um

| Cenário | Use Este |
|---------|----------|
| "Quero implementar a minha app web rapidamente" | `azd up` |
| "Preciso criar apenas uma conta de armazenamento" | `az storage account create` |
| "Estou a construir uma aplicação completa de IA" | `azd init --template azure-search-openai-demo` |
| "Preciso depurar um recurso Azure específico" | `az resource show` |
| "Quero uma implementação pronta para produção em minutos" | `azd up --environment production` |

### Funcionam em Conjunto!

O AZD usa o Azure CLI por baixo. Pode usar ambos:
```bash
# Implante a sua aplicação com o AZD
azd up

# Depois, ajuste recursos específicos com a Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Encontre Templates no Awesome AZD

Não comece do zero! **Awesome AZD** é a coleção comunitária de templates prontos para implementar:

| Recurso | Descrição |
|---------|-----------|
| 🔗 [**Galeria Awesome AZD**](https://azure.github.io/awesome-azd/) | Navegue por mais de 200 templates com implementação com um clique |
| 🔗 [**Submeta um Template**](https://github.com/Azure/awesome-azd/issues) | Contribua com o seu próprio template para a comunidade |
| 🔗 [**Repositório GitHub**](https://github.com/Azure/awesome-azd) | Favoritos e exploração do código-fonte |

### Templates Populares de IA no Awesome AZD

```bash
# Chat RAG com os Modelos Foundry da Microsoft + Pesquisa de IA
azd init --template azure-search-openai-demo

# Aplicação rápida de chat com IA
azd init --template openai-chat-app-quickstart

# Agentes de IA com Agentes Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 Comece em 3 Passos

### Passo 1: Instalar o AZD (2 minutos)

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

### Passo 2: Inicie Sessão no Azure

```bash
azd auth login
```

### Passo 3: Implemente a Sua Primeira App

```bash
# Inicializar a partir de um modelo
azd init --template todo-nodejs-mongo

# Implantar no Azure (cria tudo!)
azd up
```

**🎉 Está feito!** A sua app está agora online no Azure.

### Limpar (Não Esqueça!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Como Usar Este Curso

Este curso foi desenhado para **aprendizagem progressiva** — comece onde se sentir confortável e avance:

| Sua Experiência | Comece Aqui |
|-----------------|-------------|
| **Novo no Azure** | [Capítulo 1: Fundamentos](#-chapter-1-foundation--quick-start) |
| **Conhece o Azure, novo no AZD** | [Capítulo 1: Fundamentos](#-chapter-1-foundation--quick-start) |
| **Quer implementar apps de IA** | [Capítulo 2: Desenvolvimento AI-First](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Quer prática hands-on** | [🎓 Workshop Interativo](workshop/README.md) - laboratório guiado de 3-4 horas |
| **Precisa de padrões para produção** | [Capítulo 8: Produção e Empresa](#-chapter-8-production--enterprise-patterns) |

### Configuração Rápida

1. **Faça Fork Deste Repositório**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone-o**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Obtenha Ajuda**: [Comunidade Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **Prefere Clonar Localmente?**

> Este repositório inclui mais de 50 traduções que aumentam significativamente o tamanho do download. Para clonar sem as traduções, use checkout esparso:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Isto fornece tudo o que precisa para completar o curso com um download muito mais rápido.


## Visão Geral do Curso

Domine o Azure Developer CLI (azd) através de capítulos estruturados para aprendizagem progressiva. **Foco especial na implementação de aplicações IA com integração Microsoft Foundry.**

### Porquê Este Curso é Essencial para Desenvolvedores Modernos

Com base nos insights da comunidade Microsoft Foundry Discord, **45% dos desenvolvedores querem usar AZD para workloads IA**, mas enfrentam desafios com:
- Arquiteturas complexas multi-serviço de IA
- Melhores práticas para implementação IA em produção  
- Integração e configuração dos serviços Azure IA
- Otimização de custos para workloads IA
- Resolução de problemas específicos de deployment IA

### Objetivos de Aprendizagem

Ao completar este curso estruturado, irá:
- **Dominar os Fundamentos AZD**: conceitos principais, instalação e configuração
- **Implementar Aplicações IA**: usar AZD com serviços Microsoft Foundry
- **Implementar Infrastructure as Code**: gerir recursos Azure com templates Bicep
- **Resolver Problemas de Deployment**: solucionar questões comuns e depurar erros
- **Otimizar para Produção**: segurança, escalabilidade, monitorização e gestão de custos
- **Construir Soluções Multi-Agente**: implementar arquiteturas IA complexas

## 🗺️ Mapa do Curso: Navegação Rápida por Capítulo

Cada capítulo tem um README dedicado com objetivos de aprendizagem, começos rápidos e exercícios:

| Capítulo | Tema | Lições | Duração | Complexidade |
|----------|------|--------|---------|-------------|
| **[Cap 1: Fundamentos](docs/chapter-01-foundation/README.md)** | Primeiros Passos | [Noções Básicas AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Instalação](docs/chapter-01-foundation/installation.md) &#124; [Primeiro Projeto](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Cap 2: Desenvolvimento de IA](docs/chapter-02-ai-development/README.md)** | Aplicações AI-First | [Integração Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Agentes AI](docs/chapter-02-ai-development/agents.md) &#124; [Implementação de Modelos](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Cap 3: Configuração](docs/chapter-03-configuration/README.md)** | Autenticação & Segurança | [Configuração](docs/chapter-03-configuration/configuration.md) &#124; [Autenticação & Segurança](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Cap 4: Infraestrutura](docs/chapter-04-infrastructure/README.md)** | IaC & Implementação | [Guia de Implementação](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisionamento](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Cap 5: Multi-Agente](docs/chapter-05-multi-agent/README.md)** | Soluções de Agentes AI | [Cenário Retalho](examples/retail-scenario.md) &#124; [Padrões de Coordenação](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[Cap 6: Pré-Implementação](docs/chapter-06-pre-deployment/README.md)** | Planeamento & Validação | [Verificações Preliminares](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Planeamento de Capacidade](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Seleção de SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[Cap 7: Resolução de Problemas](docs/chapter-07-troubleshooting/README.md)** | Depuração & Correção | [Problemas Comuns](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Depuração](docs/chapter-07-troubleshooting/debugging.md) &#124; [Problemas AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[Cap 8: Produção](docs/chapter-08-production/README.md)** | Padrões Empresariais | [Práticas de Produção](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Laboratório Prático | [Introdução](workshop/docs/instructions/0-Introduction.md) &#124; [Seleção](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validação](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Desconstrução](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuração](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Personalização](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Desmontagem](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Conclusão](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**Duração Total do Curso:** ~10-14 horas | **Progressão de Competências:** Iniciante → Pronto para Produção

---

## 📚 Capítulos de Aprendizagem

*Selecione o seu percurso de aprendizagem baseado no nível de experiência e objetivos*

### 🚀 Capítulo 1: Fundamentos & Início Rápido
**Pré-requisitos**: Subscrição Azure, conhecimentos básicos de linha de comandos  
**Duração**: 30-45 minutos  
**Complexidade**: ⭐

#### O Que Vai Aprender
- Compreender os fundamentos do Azure Developer CLI
- Instalar o AZD na sua plataforma
- A sua primeira implementação bem-sucedida

#### Recursos de Aprendizagem
- **🎯 Comece Aqui**: [O que é Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teoria**: [Noções Básicas AZD](docs/chapter-01-foundation/azd-basics.md) - Conceitos e terminologia principais
- **⚙️ Configuração**: [Instalação & Configuração](docs/chapter-01-foundation/installation.md) - Guias específicos para plataformas
- **🛠️ Prático**: [O Seu Primeiro Projeto](docs/chapter-01-foundation/first-project.md) - Tutorial passo a passo
- **📋 Referência Rápida**: [Folha de Comandos](resources/cheat-sheet.md)

#### Exercícios Práticos
```bash
# Verificação rápida de instalação
azd version

# Implemente a sua primeira aplicação
azd init --template todo-nodejs-mongo
azd up
```

**💡 Objetivo do Capítulo**: Implementar com sucesso uma aplicação web simples no Azure usando o AZD

**✅ Validação do Sucesso:**
```bash
# Após completar o Capítulo 1, deverá ser capaz de:
azd version              # Mostra a versão instalada
azd init --template todo-nodejs-mongo  # Inicializa o projeto
azd up                  # Faz o deploy para a Azure
azd show                # Mostra a URL da aplicação em execução
# A aplicação abre no navegador e funciona
azd down --force --purge  # Limpa os recursos
```

**📊 Tempo Investido:** 30-45 minutos  
**📈 Nível de Competência Após:** Capaz de implementar aplicações básicas autónomas

---

### 🤖 Capítulo 2: Desenvolvimento AI-First (Recomendado para Desenvolvedores AI)
**Pré-requisitos**: Capítulo 1 concluído  
**Duração**: 1-2 horas  
**Complexidade**: ⭐⭐

#### O Que Vai Aprender
- Integração Microsoft Foundry com AZD
- Implementação de aplicações potenciadas por IA
- Compreender configurações de serviços AI

#### Recursos de Aprendizagem
- **🎯 Comece Aqui**: [Integração Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Agentes AI**: [Guia de Agentes AI](docs/chapter-02-ai-development/agents.md) - Implementar agentes inteligentes com AZD
- **📖 Padrões**: [Implementação de Modelos AI](docs/chapter-02-ai-development/ai-model-deployment.md) - Implementar e gerir modelos AI
- **🛠️ Workshop**: [Laboratório AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Torne as suas soluções AI compatíveis com AZD
- **🎥 Guia Interativo**: [Materiais do Workshop](workshop/README.md) - Aprendizagem baseada no navegador com MkDocs * Ambiente DevContainer
- **📋 Modelos**: [Modelos Microsoft Foundry em Destaque](#recursos-do-workshop)
- **📝 Exemplos**: [Exemplos de Implementação AZD](examples/README.md)

#### Exercícios Práticos
```bash
# Desdobre a sua primeira aplicação de IA
azd init --template azure-search-openai-demo
azd up

# Experimente modelos adicionais de IA
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Objetivo do Capítulo**: Implementar e configurar uma aplicação de chat com IA e capacidades RAG

**✅ Validação do Sucesso:**
```bash
# Depois do Capítulo 2, deverá ser capaz de:
azd init --template azure-search-openai-demo
azd up
# Testar a interface de chat da IA
# Fazer perguntas e obter respostas apoiadas por IA com fontes
# Verificar se a integração de pesquisa funciona
azd monitor  # Confirmar que o Application Insights mostra a telemetria
azd down --force --purge
```

**📊 Tempo Investido:** 1-2 horas  
**📈 Nível de Competência Após:** Capaz de implementar e configurar aplicações AI prontas para produção  
**💰 Conhecimento de Custos:** Compreender custos de $80-150/mês em desenvolvimento, $300-3500/mês em produção

#### 💰 Considerações de Custo para Implementações AI

**Ambiente de Desenvolvimento (Estimado $80-150/mês):**
- Modelos Microsoft Foundry (Pay-as-you-go): $0-50/mês (baseado no uso de tokens)
- Pesquisa AI (nível básico): $75/mês
- Container Apps (Consumo): $0-20/mês
- Armazenamento (Standard): $1-5/mês

**Ambiente de Produção (Estimado $300-3,500+/mês):**
- Modelos Microsoft Foundry (PTU para performance consistente): $3,000+/mês OU Pay-as-you-go com volume elevado
- Pesquisa AI (nível standard): $250/mês
- Container Apps (Dedicado): $50-100/mês
- Application Insights: $5-50/mês
- Armazenamento (Premium): $10-50/mês

**💡 Dicas de Otimização de Custos:**
- Use modelos Microsoft Foundry no **nível gratuito** para aprendizagem (Azure OpenAI inclui 50.000 tokens/mês)
- Execute `azd down` para desalocar recursos quando não estiver a desenvolver ativamente
- Comece com faturação baseada em consumo, faça upgrade para PTU apenas para produção
- Use `azd provision --preview` para estimar custos antes de implementar
- Ative o auto-escalonamento: pague apenas pelo uso real

**Monitorização de Custos:**
```bash
# Verificar custos mensais estimados
azd provision --preview

# Monitorizar custos reais no Portal Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Capítulo 3: Configuração & Autenticação
**Pré-requisitos**: Capítulo 1 concluído  
**Duração**: 45-60 minutos  
**Complexidade**: ⭐⭐

#### O Que Vai Aprender
- Configuração e gestão de ambientes
- Melhores práticas de autenticação e segurança
- Nomeação e organização de recursos

#### Recursos de Aprendizagem
- **📖 Configuração**: [Guia de Configuração](docs/chapter-03-configuration/configuration.md) - Configuração do ambiente
- **🔐 Segurança**: [Padrões de autenticação e identidades geridas](docs/chapter-03-configuration/authsecurity.md) - Padrões de autenticação
- **📝 Exemplos**: [Exemplo de App de Base de Dados](examples/database-app/README.md) - Exemplos AZD com base de dados

#### Exercícios Práticos
- Configurar múltiplos ambientes (dev, staging, prod)
- Definir autenticação com identidade gerida
- Implementar configurações específicas por ambiente

**💡 Objetivo do Capítulo**: Gerir múltiplos ambientes com autenticação e segurança adequadas

---

### 🏗️ Capítulo 4: Infraestrutura como Código & Implementação
**Pré-requisitos**: Capítulos 1-3 concluídos  
**Duração**: 1-1.5 horas  
**Complexidade**: ⭐⭐⭐

#### O Que Vai Aprender
- Padrões avançados de implementação
- Infraestrutura como Código com Bicep
- Estratégias de provisionamento de recursos

#### Recursos de Aprendizagem
- **📖 Implementação**: [Guia de Implementação](docs/chapter-04-infrastructure/deployment-guide.md) - Fluxos de trabalho completos
- **🏗️ Provisionamento**: [Provisionamento de Recursos](docs/chapter-04-infrastructure/provisioning.md) - Gestão de recursos Azure
- **📝 Exemplos**: [Exemplo de Container App](../../examples/container-app) - Implementações containerizadas

#### Exercícios Práticos
- Criar modelos Bicep personalizados
- Implementar aplicações multi-serviço
- Implementar estratégias de deploy blue-green

**💡 Objetivo do Capítulo**: Implementar aplicações multi-serviço complexas usando modelos de infraestrutura personalizados

---

### 🎯 Capítulo 5: Soluções Multi-Agente AI (Avançado)
**Pré-requisitos**: Capítulos 1-2 concluídos  
**Duração**: 2-3 horas  
**Complexidade**: ⭐⭐⭐⭐

#### O Que Vai Aprender
- Padrões de arquitetura multi-agente
- Orquestração e coordenação de agentes
- Implementações AI prontas para produção

#### Recursos de Aprendizagem
- **🤖 Projeto em Destaque**: [Solução Multi-Agente Retalho](examples/retail-scenario.md) - Implementação completa
- **🛠️ Modelos ARM**: [Pacote Modelo ARM](../../examples/retail-multiagent-arm-template) - Implementação com um clique
- **📖 Arquitetura**: [Padrões de coordenação multi-agente](docs/chapter-06-pre-deployment/coordination-patterns.md) - Padrões

#### Exercícios Práticos
```bash
# Desplegar a solução multi-agente completa para retalho
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explorar as configurações dos agentes
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Objetivo do Capítulo**: Implementar e gerir uma solução AI multi-agente pronta para produção com agentes de Cliente e Inventário

---

### 🔍 Capítulo 6: Validação & Planeamento Pré-Implementação
**Pré-requisitos**: Capítulo 4 concluído  
**Duração**: 1 hora  
**Complexidade**: ⭐⭐

#### O Que Vai Aprender
- Planeamento de capacidade e validação de recursos
- Estratégias de seleção de SKU
- Verificações pré-implementação e automação

#### Recursos de Aprendizagem
- **📊 Planeamento**: [Planeamento de Capacidade](docs/chapter-06-pre-deployment/capacity-planning.md) - Validação de recursos
- **💰 Seleção**: [Seleção de SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Escolhas económicas
- **✅ Validação**: [Verificações Preliminares](docs/chapter-06-pre-deployment/preflight-checks.md) - Scripts automatizados

#### Exercícios Práticos
- Executar scripts de validação de capacidade
- Otimizar seleção de SKUs para custo
- Implementar verificações pré-implementação automatizadas

**💡 Objetivo do Capítulo**: Validar e otimizar implementações antes da execução

---

### 🚨 Capítulo 7: Resolução de Problemas & Depuração
**Pré-requisitos**: Qualquer capítulo de implementação concluído  
**Duração**: 1-1.5 horas  
**Complexidade**: ⭐⭐

#### O Que Vai Aprender
- Abordagens sistemáticas de depuração
- Problemas comuns e soluções
- Resolução de problemas específica AI

#### Recursos de Aprendizagem
- **🔧 Problemas Comuns**: [Problemas Comuns](docs/chapter-07-troubleshooting/common-issues.md) - FAQ e soluções
- **🕵️ Depuração**: [Guia de Depuração](docs/chapter-07-troubleshooting/debugging.md) - Estratégias passo a passo
- **🤖 Problemas AI**: [Resolução de Problemas AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problemas de serviço AI

#### Exercícios Práticos
- Diagnosticar falhas de implementação
- Resolver problemas de autenticação
- Depurar conectividade de serviço AI

**💡 Objetivo do Capítulo**: Diagnosticar e resolver problemas comuns de implementação de forma independente

---

### 🏢 Capítulo 8: Produção & Padrões Empresariais
**Pré-requisitos**: Capítulos 1-4 concluídos  
**Duração**: 2-3 horas  
**Complexidade**: ⭐⭐⭐⭐

#### O Que Vai Aprender
- Estratégias de implementação em produção
- Padrões de segurança empresariais
- Monitorização e otimização de custos

#### Recursos de Aprendizagem
- **🏭 Produção**: [Práticas recomendadas de IA em produção](docs/chapter-08-production/production-ai-practices.md) - Padrões empresariais  
- **📝 Exemplos**: [Exemplo de microsserviços](../../examples/microservices) - Arquiteturas complexas  
- **📊 Monitorização**: [Integração com Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Monitorização  

#### Exercícios Práticos  
- Implementar padrões de segurança empresarial  
- Configurar monitorização abrangente  
- Realizar deployment em produção com governança adequada  

**💡 Resultado do Capítulo**: Implementar aplicações prontas para o ambiente empresarial com capacidades completas de produção  

---

## 🎓 Visão Geral do Workshop: Experiência Prática  

> **⚠️ ESTADO DO WORKSHOP: Desenvolvimento Ativo**  
> Os materiais do workshop estão atualmente a ser desenvolvidos e refinados. Os módulos principais estão funcionais, mas algumas secções avançadas estão incompletas. Estamos a trabalhar para concluir todo o conteúdo. [Acompanhe o progresso →](workshop/README.md)  

### Materiais Interativos do Workshop  
**Aprendizagem prática abrangente com ferramentas baseadas no navegador e exercícios guiados**  

Os materiais do workshop fornecem uma experiência de aprendizagem estruturada e interativa que complementa o currículo por capítulos acima. O workshop foi concebido para aprendizagem autónoma e sessões conduzidas por instrutores.  

#### 🛠️ Funcionalidades do Workshop  
- **Interface baseada no navegador**: Workshop completo suportado por MkDocs com pesquisa, cópia e temas  
- **Integração GitHub Codespaces**: Configuração do ambiente de desenvolvimento com um clique  
- **Percurso de aprendizagem estruturado**: Exercícios guiados com 8 módulos (3-4 horas no total)  
- **Metodologia progressiva**: Introdução → Seleção → Validação → Desconstrução → Configuração → Personalização → Desmontagem → Conclusão  
- **Ambiente DevContainer interativo**: Ferramentas e dependências pré-configuradas  

#### 📚 Estrutura dos Módulos do Workshop  
O workshop segue uma **metodologia progressiva de 8 módulos** que o leva desde a descoberta até à maestria no deployment:  

| Módulo | Tema | O que Vai Fazer | Duração |  
|--------|-------|-----------------|---------|  
| **0. Introdução** | Visão Geral do Workshop | Compreender os objetivos de aprendizagem, pré-requisitos e estrutura do workshop | 15 min |  
| **1. Seleção** | Descoberta de Templates | Explorar templates AZD e selecionar o template de IA adequado para o seu cenário | 20 min |  
| **2. Validação** | Deploy e Verificação | Realizar o deploy do template com `azd up` e validar o funcionamento da infraestrutura | 30 min |  
| **3. Desconstrução** | Compreender a Estrutura | Usar GitHub Copilot para explorar a arquitetura do template, ficheiros Bicep e organização do código | 30 min |  
| **4. Configuração** | Exploração do azure.yaml | Dominar a configuração `azure.yaml`, ciclos de vida e variáveis de ambiente | 30 min |  
| **5. Personalização** | Personalize para si | Ativar Pesquisa IA, tracing, avaliação e personalizar para o seu cenário | 45 min |  
| **6. Desmontagem** | Limpar Recursos | Desprovisionar recursos em segurança com `azd down --purge` | 15 min |  
| **7. Conclusão** | Próximos Passos | Rever conquistas, conceitos-chave e continuar a sua jornada de aprendizagem | 15 min |  

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
# Opção 1: GitHub Codespaces (Recomendado)
# Clique em "Code" → "Create codespace on main" no repositório

# Opção 2: Desenvolvimento Local
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Siga as instruções de instalação em workshop/README.md
```
  
#### 🎯 Resultados de Aprendizagem do Workshop  
Ao completar o workshop, os participantes irão:  
- **Implementar Aplicações AI em Produção**: Usar AZD com os serviços Microsoft Foundry  
- **Dominar arquiteturas multi-agente**: Implementar soluções coordenadas de agentes AI  
- **Implementar práticas recomendadas de segurança**: Configurar autenticação e controlo de acessos  
- **Otimizar para escala**: Projetar deployments eficazes em custo e desempenho  
- **Diagnosticar problemas de deployment**: Resolver problemas comuns de forma autónoma  

#### 📖 Recursos do Workshop  
- **🎥 Guia Interativo**: [Materiais do Workshop](workshop/README.md) - Ambiente de aprendizagem baseado no navegador  
- **📋 Instruções por Módulo**:  
  - [0. Introdução](workshop/docs/instructions/0-Introduction.md) - Visão geral e objetivos do workshop  
  - [1. Seleção](workshop/docs/instructions/1-Select-AI-Template.md) - Encontrar e selecionar templates AI  
  - [2. Validação](workshop/docs/instructions/2-Validate-AI-Template.md) - Deploy e validação de templates  
  - [3. Desconstrução](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Explorar arquitetura do template  
  - [4. Configuração](workshop/docs/instructions/4-Configure-AI-Template.md) - Dominar o azure.yaml  
  - [5. Personalização](workshop/docs/instructions/5-Customize-AI-Template.md) - Personalizar para o seu cenário  
  - [6. Desmontagem](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Limpar recursos  
  - [7. Conclusão](workshop/docs/instructions/7-Wrap-up.md) - Revisão e próximos passos  
- **🛠️ Laboratório AI Workshop**: [Laboratório AI Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) - Exercícios focados em IA  
- **💡 Arranque Rápido**: [Guia de Configuração do Workshop](workshop/README.md#quick-start) - Configuração do ambiente  

**Ideal para**: Formação corporativa, cursos universitários, aprendizagem autónoma e bootcamps para programadores.  

---

## 📖 Exploração Detalhada: Capacidades do AZD  

Para além do básico, AZD oferece funcionalidades poderosas para deployments em produção:  

- **Deployments baseados em templates** - Usar templates pré-criados para padrões comuns de aplicações  
- **Infraestrutura como Código** - Gerir recursos Azure usando Bicep ou Terraform  
- **Fluxos de trabalho integrados** - Provisionar, implementar e monitorizar aplicações sem dificuldade  
- **Amigável para programadores** - Otimizado para produtividade e experiência do programador  

### **AZD + Microsoft Foundry: Ideal para Deployments AI**  

**Porquê AZD para soluções AI?** AZD aborda os principais desafios que os programadores AI enfrentam:  

- **Templates prontos para AI** - Templates pré-configurados para Microsoft Foundry Models, Serviços Cognitivos e cargas de trabalho ML  
- **Deployments AI seguros** - Padrões de segurança integrados para serviços AI, chaves API e endpoints de modelo  
- **Padrões de produção AI** - Melhores práticas para deployments escaláveis e custo-efetivos de aplicações AI  
- **Fluxos de trabalho AI de ponta a ponta** - Desde o desenvolvimento do modelo ao deployment em produção com monitorização adequada  
- **Otimização de custos** - Alocação inteligente de recursos e estratégias de escala para cargas AI  
- **Integração Microsoft Foundry** - Ligação fluida ao catálogo de modelos e endpoints Microsoft Foundry  

---

## 🎯 Biblioteca de Templates & Exemplos  

### Destaque: Templates Microsoft Foundry  
**Comece aqui se estiver a implementar aplicações AI!**  

> **Nota:** Estes templates demonstram vários padrões de IA. Alguns são Azure Samples externos, outros são implementações locais.  

| Template | Capítulo | Complexidade | Serviços | Tipo |  
|----------|----------|--------------|----------|------|  
| [**Comece com chat AI**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capítulo 2 | ⭐⭐ | AzureOpenAI + API de Inferência Azure AI Model + Azure AI Search + Azure Container Apps + Application Insights | Externo |  
| [**Comece com agentes AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Capítulo 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights | Externo |  
| [**Demo Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capítulo 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Externo |  
| [**Arranque rápido app OpenAI Chat**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capítulo 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Externo |  
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capítulo 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Externo |  
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Capítulo 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Externo |  
| [**Solução Multi-Agente Retail**](examples/retail-scenario.md) | Capítulo 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Local** |  

### Destaque: Cenários Completos de Aprendizagem  
**Templates de aplicação prontos para produção mapeados aos capítulos de aprendizagem**  

| Template | Capítulo de Aprendizagem | Complexidade | Conceito-Chave |  
|----------|--------------------------|--------------|----------------|  
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capítulo 2 | ⭐ | Padrões básicos de deployment AI |  
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capítulo 2 | ⭐⭐ | Implementação RAG com Azure AI Search |  
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Capítulo 4 | ⭐⭐ | Integração de Document Intelligence |  
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capítulo 5 | ⭐⭐⭐ | Framework de agentes e chamadas de função |  
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Capítulo 8 | ⭐⭐⭐ | Orquestração empresarial AI |  
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Capítulo 5 | ⭐⭐⭐⭐ | Arquitetura multi-agente com agentes Cliente e Inventário |  

### Aprendizagem por Tipo de Exemplo  

> **📌 Exemplos Locais vs. Externos:**  
> **Exemplos Locais** (neste repositório) = Prontos a usar imediatamente  
> **Exemplos Externos** (Azure Samples) = Clonar dos repositórios ligados  

#### Exemplos Locais (Prontos a Usar)  
- [**Solução Multi-Agente Retail**](examples/retail-scenario.md) - Implementação completa pronta para produção com templates ARM  
  - Arquitetura multi-agente (Agentes Cliente + Inventário)  
  - Monitorização e avaliação abrangentes  
  - Deployment com um clique via template ARM  

#### Exemplos Locais - Aplicações em Contentores (Capítulos 2-5)  
**Exemplos abrangentes de deployments em containers neste repositório:**  
- [**Exemplos de Container Apps**](examples/container-app/README.md) - Guia completo para deployments em containers  
  - [API Flask simples](../../examples/container-app/simple-flask-api) - API REST básica com scale-to-zero  
  - [Arquitetura de Microsserviços](../../examples/container-app/microservices) - Deployment multi-serviço pronto para produção  
  - Padrões de arranque rápido, produção e avançados  
  - Orientações para monitorização, segurança e otimização de custos  

#### Exemplos Externos - Aplicações Simples (Capítulos 1-2)  
**Clone estes repositórios Azure Samples para começar:**  
- [Aplicação Web Simples - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Padrões básicos de deployment  
- [Website Estático - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Deployment de conteúdo estático  
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Deployment de API REST  

#### Exemplos Externos - Integração de Base de Dados (Capítulos 3-4)  
- [App de Base de Dados - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Padrões de conectividade a bases de dados  
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Workflow de dados serverless  

#### Exemplos Externos - Padrões Avançados (Capítulos 4-8)  
- [Microsserviços Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - Arquiteturas multi-serviço  
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Processamento em background  
- [Pipeline ML Empresarial](https://github.com/Azure-Samples/mlops-v2) - Padrões ML prontos para produção  

### Coleções de Templates Externos  
- [**Galeria Oficial de Templates AZD**](https://azure.github.io/awesome-azd/) - Coleção curada de templates oficiais e comunitários  
- [**Templates Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Documentação de templates Microsoft Learn  
- [**Directório de Exemplos**](examples/README.md) - Exemplos locais de aprendizagem com explicações detalhadas  

---

## 📚 Recursos & Referências de Aprendizagem  

### Referências Rápidas  
- [**Folha de Comandos**](resources/cheat-sheet.md) - Comandos essenciais azd organizados por capítulo  
- [**Glossário**](resources/glossary.md) - Terminologia Azure e azd  
- [**FAQ**](resources/faq.md) - Perguntas frequentes organizadas por capítulo de aprendizagem  
- [**Guia de Estudo**](resources/study-guide.md) - Exercícios práticos completos  

### Workshops Práticos  
- [**Laboratório AI Workshop**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Tornar as suas soluções AI implementáveis com AZD (2-3 horas)  
- [**Workshop Interativo**](workshop/README.md) - Exercícios guiados em 8 módulos com MkDocs e GitHub Codespaces  
  - Segue: Introdução → Seleção → Validação → Desconstrução → Configuração → Personalização → Desmontagem → Conclusão  

### Recursos Externos de Aprendizagem
- [Documentação do Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centro de Arquitetura Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Calculadora de Preços Azure](https://azure.microsoft.com/pricing/calculator/)
- [Estado do Azure](https://status.azure.com/)

### Competências de Agentes de IA para o Seu Editor
- [**Competências Microsoft Azure no skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 competências abertas de agentes para Azure AI, Foundry, implantação, diagnóstico, otimização de custos e mais. Instale-as no GitHub Copilot, Cursor, Claude Code ou qualquer agente suportado:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Guia Rápido de Resolução de Problemas

**Problemas comuns que os iniciantes enfrentam e soluções imediatas:**

<details>
<summary><strong>❌ "azd: comando não encontrado"</strong></summary>

```bash
# Instalar primeiro o AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Verificar a instalação
azd version
```
</details>

<details>
<summary><strong>❌ "Nenhuma subscrição encontrada" ou "Subscrição não definida"</strong></summary>

```bash
# Listar assinaturas disponíveis
az account list --output table

# Definir assinatura predefinida
az account set --subscription "<subscription-id-or-name>"

# Definir para o ambiente AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Verificar
az account show
```
</details>

<details>
<summary><strong>❌ "Quota insuficiente" ou "Quota excedida"</strong></summary>

```bash
# Experimente diferentes regiões do Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Ou use SKUs mais pequenos em desenvolvimento
# Edite infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" falha a meio do processo</strong></summary>

```bash
# Opção 1: Limpar e tentar novamente
azd down --force --purge
azd up

# Opção 2: Apenas corrigir a infraestrutura
azd provision

# Opção 3: Verificar estado detalhado
azd show

# Opção 4: Verificar logs no Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Autenticação falhada" ou "Token expirado"</strong></summary>

```bash
# Reautenticar
az logout
az login

azd auth logout
azd auth login

# Verificar autenticação
az account show
```
</details>

<details>
<summary><strong>❌ "Recurso já existe" ou conflitos de nomes</strong></summary>

```bash
# AZD gera nomes únicos, mas se houver conflito:
azd down --force --purge

# Então tente novamente com um ambiente novo
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Implantação de modelo a demorar demasiado</strong></summary>

**Tempos normais de espera:**
- Aplicação web simples: 5-10 minutos
- Aplicação com base de dados: 10-15 minutos
- Aplicações de IA: 15-25 minutos (provisão OpenAI é lenta)

```bash
# Verificar progresso
azd show

# Se estiver bloqueado >30 minutos, verifique o Azure Portal:
azd monitor
# Procure por implementações falhadas
```
</details>

<details>
<summary><strong>❌ "Permissão negada" ou "Proibido"</strong></summary>

```bash
# Verifique o seu papel no Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# É necessário pelo menos o papel de "Colaborador"
# Peça ao administrador do Azure para conceder:
# - Colaborador (para recursos)
# - Administrador de Acesso de Utilizadores (para atribuições de papéis)
```
</details>

<details>
<summary><strong>❌ Não consegue encontrar o URL da aplicação implantada</strong></summary>

```bash
# Mostrar todos os endpoints de serviço
azd show

# Ou abrir o Portal Azure
azd monitor

# Verificar um serviço específico
azd env get-values
# Procurar variáveis *_URL
```
</details>

### 📚 Recursos Completos para Resolução de Problemas

- **Guia de Problemas Comuns:** [Soluções Detalhadas](docs/chapter-07-troubleshooting/common-issues.md)
- **Problemas Específicos de IA:** [Resolução de Problemas de IA](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Guia de Debugging:** [Debugging Passo a Passo](docs/chapter-07-troubleshooting/debugging.md)
- **Obtenha Ajuda:** [Discord Azure](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Conclusão do Curso & Certificação

### Acompanhamento do Progresso
Acompanhe o seu progresso de aprendizagem em cada capítulo:

- [ ] **Capítulo 1**: Fundamentos & Início Rápido ✅
- [ ] **Capítulo 2**: Desenvolvimento com IA em Primeiro Lugar ✅  
- [ ] **Capítulo 3**: Configuração & Autenticação ✅
- [ ] **Capítulo 4**: Infraestrutura como Código & Implantação ✅
- [ ] **Capítulo 5**: Soluções Multi-Agentes de IA ✅
- [ ] **Capítulo 6**: Validação & Planeamento Pré-Implantação ✅
- [ ] **Capítulo 7**: Resolução de Problemas & Debugging ✅
- [ ] **Capítulo 8**: Padrões de Produção & Empresariais ✅

### Verificação de Aprendizagem
Após concluir cada capítulo, verifique os seus conhecimentos através de:
1. **Exercício Prático**: Complete a implantação prática do capítulo
2. **Revisão de Conhecimentos**: Reveja a secção FAQ do seu capítulo
3. **Discussão na Comunidade**: Partilhe a sua experiência no Discord do Azure
4. **Próximo Capítulo**: Passe para o próximo nível de complexidade

### Benefícios da Conclusão do Curso
Ao concluir todos os capítulos, terá:
- **Experiência em Produção**: Implantou aplicações reais de IA no Azure
- **Competências Profissionais**: Capacidades de implantação prontas para empresas  
- **Reconhecimento na Comunidade**: Membro ativo da comunidade de desenvolvedores Azure
- **Avanço na Carreira**: Especialização requisitada em AZD e implantação de IA

---

## 🤝 Comunidade & Suporte

### Obtenha Ajuda & Suporte
- **Questões Técnicas**: [Reporte bugs e peça funcionalidades](https://github.com/microsoft/azd-for-beginners/issues)
- **Questões de Aprendizagem**: [Comunidade Discord Microsoft Azure](https://discord.gg/microsoft-azure) e [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Ajuda Específica para IA**: Junte-se ao [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentação**: [Documentação oficial do Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Insights da Comunidade no Discord Microsoft Foundry

**Resultados recentes da sondagem no canal #Azure:**
- **45%** dos desenvolvedores querem usar AZD para cargas de trabalho de IA
- **Principais desafios**: Implantações multi-serviços, gestão de credenciais, prontidão para produção  
- **Mais solicitados**: Modelos específicos de IA, guias de resolução de problemas, melhores práticas

**Junte-se à nossa comunidade para:**
- Partilhar as suas experiências com AZD + IA e obter ajuda
- Aceder a pré-visualizações antecipadas de novos modelos de IA
- Contribuir para as melhores práticas de implantação de IA
- Influenciar o desenvolvimento futuro de funcionalidades AI + AZD

### Contribuir para o Curso
Aceitamos contribuições! Por favor leia o nosso [Guia de Contribuição](CONTRIBUTING.md) para detalhes sobre:
- **Melhorias de Conteúdo**: Aprimore capítulos e exemplos existentes
- **Novos Exemplos**: Adicione cenários e modelos do mundo real  
- **Tradução**: Ajude a manter o suporte multilingue
- **Reportar Bugs**: Melhore a precisão e clareza
- **Normas da Comunidade**: Siga as nossas diretrizes inclusivas

---

## 📄 Informação do Curso

### Licença
Este projeto está licenciado sob licença MIT - consulte o ficheiro [LICENSE](../../LICENSE) para detalhes.

### Recursos Relacionados de Aprendizagem Microsoft

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
[![Agentes de IA para Iniciantes](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Série de IA Generativa
[![IA Generativa para Iniciantes](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![IA Generativa (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![IA Generativa (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![IA Generativa (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Aprendizagem Básica
[![ML para Iniciantes](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Ciência de Dados para Iniciantes](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![IA para Iniciantes](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cibersegurança para Iniciantes](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Desenvolvimento Web para Iniciantes](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT para Iniciantes](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Desenvolvimento XR para Iniciantes](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Série Copilot
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navegação do Curso

**🚀 Pronto para Começar a Aprender?**

**Iniciantes**: Comece com [Capítulo 1: Fundamentos & Início Rápido](#-chapter-1-foundation--quick-start)  
**Desenvolvedores de IA**: Salte para [Capítulo 2: Desenvolvimento AI-First](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Desenvolvedores Experientes**: Comece com [Capítulo 3: Configuração & Autenticação](#️-chapter-3-configuration--authentication)

**Próximos Passos**: [Começar Capítulo 1 - Noções Básicas do AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso**:  
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, é recomendada a tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->