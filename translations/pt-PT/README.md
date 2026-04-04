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
[Árabe](../ar/README.md) | [Bengali](../bn/README.md) | [Búlgaro](../bg/README.md) | [Birmanês (Myanmar)](../my/README.md) | [Chinês (Simplificado)](../zh-CN/README.md) | [Chinês (Tradicional, Hong Kong)](../zh-HK/README.md) | [Chinês (Tradicional, Macau)](../zh-MO/README.md) | [Chinês (Tradicional, Taiwan)](../zh-TW/README.md) | [Croata](../hr/README.md) | [Checo](../cs/README.md) | [Dinamarquês](../da/README.md) | [Holandês](../nl/README.md) | [Estoniano](../et/README.md) | [Finlandês](../fi/README.md) | [Francês](../fr/README.md) | [Alemão](../de/README.md) | [Grego](../el/README.md) | [Hebraico](../he/README.md) | [Hindi](../hi/README.md) | [Húngaro](../hu/README.md) | [Indonésio](../id/README.md) | [Italiano](../it/README.md) | [Japonês](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Coreano](../ko/README.md) | [Lituano](../lt/README.md) | [Malaio](../ms/README.md) | [Malaiala](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Pidgin Nigeriano](../pcm/README.md) | [Norueguês](../no/README.md) | [Persa (Farsi)](../fa/README.md) | [Polaco](../pl/README.md) | [Português (Brasil)](../pt-BR/README.md) | [Português (Portugal)](./README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romeno](../ro/README.md) | [Russo](../ru/README.md) | [Sérvio (Cirílico)](../sr/README.md) | [Eslovaco](../sk/README.md) | [Esloveno](../sl/README.md) | [Espanhol](../es/README.md) | [Suaíli](../sw/README.md) | [Sueco](../sv/README.md) | [Tagalo (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugo](../te/README.md) | [Tailandês](../th/README.md) | [Turco](../tr/README.md) | [Ucraniano](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamita](../vi/README.md)

> **Prefere Clonar Localmente?**
>
> Este repositório inclui mais de 50 traduções, o que aumenta significativamente o tamanho do download. Para clonar sem traduções, utilize “sparse checkout”:
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
> Isto fornece tudo o que precisa para concluir o curso com um download muito mais rápido.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Novidades no azd Hoje

O Azure Developer CLI cresceu para além das tradicionais aplicações web e APIs. Hoje, o azd é a única ferramenta para implementar **qualquer** aplicação no Azure — incluindo aplicações com inteligência artificial e agentes inteligentes.

Isto significa o seguinte para si:

- **Os agentes de IA são agora cargas de trabalho azd de primeira classe.** Pode iniciar, implementar e gerir projetos de agentes de IA usando o mesmo fluxo de trabalho `azd init` → `azd up` que já conhece.
- **A integração Microsoft Foundry** traz a implementação de modelos, alojamento de agentes e configuração de serviços de IA diretamente para o ecossistema de templates azd.
- **O fluxo de trabalho principal não mudou.** Quer esteja a implementar uma aplicação de tarefas, um microsserviço ou uma solução AI multi-agente, os comandos são os mesmos.

Se já usou azd antes, o suporte a IA é uma extensão natural — não uma ferramenta separada ou uma via avançada. Se está a começar agora, aprenderá um único fluxo de trabalho que funciona para tudo.

---

## 🚀 O que é o Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** é uma ferramenta de linha de comandos amigável para desenvolvedores que facilita o processo de implementação de aplicações no Azure. Em vez de criar e ligar dezenas de recursos Azure manualmente, pode implementar aplicações completas com um único comando.

### A Magia do `azd up`

```bash
# Este único comando faz tudo:
# ✅ Cria todos os recursos do Azure
# ✅ Configura a rede e a segurança
# ✅ Compila o código da sua aplicação
# ✅ Implanta no Azure
# ✅ Dá-lhe uma URL funcional
azd up
```

**É tudo!** Sem cliques no Portal Azure, sem necessidade de aprender templates ARM complexos, sem configurações manuais — apenas aplicações a funcionar no Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Qual é a Diferença?

Esta é a questão que os iniciantes mais colocam. Aqui está a resposta simples:

| Recurso | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Finalidade** | Gerir recursos individuais do Azure | Implementar aplicações completas |
| **Mentalidade** | Focada na infraestrutura | Focada na aplicação |
| **Exemplo** | `az webapp create --name myapp...` | `azd up` |
| **Curva de Aprendizagem** | É necessário conhecer os serviços Azure | Só precisa de conhecer a sua aplicação |
| **Ideal Para** | DevOps, Infraestrutura | Desenvolvedores, Prototipagem |

### Analogia Simples

- **Azure CLI** é como ter todas as ferramentas para construir uma casa — martelos, serras, pregos. Pode construir qualquer coisa, mas precisa de saber construção.
- **Azure Developer CLI** é como contratar um empreiteiro — descreve o que quer e eles tratam da construção.

### Quando Usar Cada Um

| Cenário | Use Isto |
|----------|----------|
| "Quero implementar a minha app web rapidamente" | `azd up` |
| "Preciso criar apenas uma conta de armazenamento" | `az storage account create` |
| "Estou a construir uma aplicação AI completa" | `azd init --template azure-search-openai-demo` |
| "Preciso de depurar um recurso específico do Azure" | `az resource show` |
| "Quero uma implementação pronta para produção em minutos" | `azd up --environment production` |

### Eles Funcionam em Conjunto!

AZD usa o Azure CLI por baixo. Pode usar ambos:
```bash
# Implante a sua aplicação com o AZD
azd up

# Em seguida, afine recursos específicos com a Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Encontre Templates no Awesome AZD

Não comece do zero! **Awesome AZD** é uma coleção comunitária de templates prontos para implementar:

| Recurso | Descrição |
|----------|-------------|
| 🔗 [**Galeria Awesome AZD**](https://azure.github.io/awesome-azd/) | Navegue por mais de 200 templates com implementação a um clique |
| 🔗 [**Submeta um Template**](https://github.com/Azure/awesome-azd/issues) | Contribua com o seu próprio template para a comunidade |
| 🔗 [**Repositório GitHub**](https://github.com/Azure/awesome-azd) | Estrele e explore o código-fonte |

### Templates Populares de IA no Awesome AZD

```bash
# RAG Chat com Modelos Microsoft Foundry + Pesquisa de IA
azd init --template azure-search-openai-demo

# Aplicação rápida de chat de IA
azd init --template openai-chat-app-quickstart

# Agentes de IA com Agentes Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 Comece em 3 Passos

Antes de começar, certifique-se que a sua máquina está preparada para o template que quer implementar:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Se algum dos requisitos falhar, corrija-o primeiro e depois continue com o início rápido.

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

### Passo 2: Autenticar para AZD

```bash
# Opcional se pretender utilizar comandos da Azure CLI directamente neste curso
az login

# Obrigatório para fluxos de trabalho AZD
azd auth login
```

Se não tiver a certeza do que precisa, siga todo o fluxo de configuração em [Instalação & Configuração](docs/chapter-01-foundation/installation.md#authentication-setup).

### Passo 3: Implemente a Sua Primeira App

```bash
# Inicializar a partir de um modelo
azd init --template todo-nodejs-mongo

# Implantar no Azure (cria tudo!)
azd up
```

**🎉 Está feito!** A sua aplicação está agora live no Azure.

### Limpeza (Não Esqueça!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Como Usar Este Curso

Este curso foi pensado para **aprendizagem progressiva** — comece onde se sentir confortável e avance:

| A Sua Experiência | Comece Aqui |
|-----------------|------------|
| **Novo no Azure** | [Capítulo 1: Fundamentos](#-chapter-1-foundation--quick-start) |
| **Conhece Azure, novo no AZD** | [Capítulo 1: Fundamentos](#-chapter-1-foundation--quick-start) |
| **Quer implementar apps AI** | [Capítulo 2: Desenvolvimento AI-Primeiro](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Quer prática hands-on** | [🎓 Workshop Interativo](workshop/README.md) – laboratório guiado de 3-4 horas |
| **Precisa de padrões para produção** | [Capítulo 8: Produção & Empresa](#-chapter-8-production--enterprise-patterns) |

### Configuração Rápida

1. **Fork deste Repositório**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone-o**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Peça Ajuda**: [Comunidade Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **Prefere Clonar Localmente?**

> Este repositório inclui mais de 50 traduções, o que aumenta significativamente o tamanho do download. Para clonar sem traduções, utilize “sparse checkout”:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Isto fornece tudo o que precisa para concluir o curso com um download muito mais rápido.


## Visão Geral do Curso

Domine o Azure Developer CLI (azd) através de capítulos estruturados para aprendizagem progressiva. **Foco especial na implementação de aplicações AI com integração Microsoft Foundry.**

### Por que Este Curso é Essencial para os Desenvolvedores Modernos

Com base nos insights da comunidade Microsoft Foundry Discord, **45% dos desenvolvedores querem usar AZD para cargas de trabalho de IA** mas enfrentam desafios com:
- Arquiteturas AI complexas multi-serviço
- Melhores práticas para implementação AI em produção  
- Integração e configuração de serviços Azure AI
- Otimização de custos para cargas de trabalho AI
- Resolução de problemas específicos de implementação AI

### Objetivos de Aprendizagem

Ao completar este curso estruturado, irá:
- **Dominar os Fundamentos do AZD**: Conceitos básicos, instalação e configuração
- **Implementar Aplicações AI**: Usar AZD com serviços Microsoft Foundry
- **Implementar Infrastructure as Code**: Gerir recursos Azure com templates Bicep
- **Resolver Problemas de Implementação**: Corrigir erros comuns e depurar problemas
- **Otimizar para Produção**: Segurança, escalabilidade, monitorização e gestão de custos
- **Construir Soluções Multi-Agente**: Implementar arquiteturas AI complexas

## Antes de Começar: Contas, Acesso e Premissas

Antes de começar o Capítulo 1, certifique-se que tem o seguinte em ordem. Os passos de instalação mais adiante neste guia assumem que estes requisitos básicos já estão tratados.
- **Uma subscrição Azure**: Pode usar uma subscrição existente do trabalho ou da sua própria conta, ou criar uma [versão de avaliação gratuita](https://aka.ms/azurefreetrial) para começar.
- **Permissão para criar recursos Azure**: Para a maioria dos exercícios, deverá ter pelo menos acesso **Colaborador** na subscrição ou grupo de recursos alvo. Alguns capítulos também podem assumir que pode criar grupos de recursos, identidades geridas e atribuições RBAC.
- [**Uma conta GitHub**](https://github.com): Isto é útil para fazer fork do repositório, seguir as suas próprias alterações e usar o GitHub Codespaces para o workshop.
- **Pré-requisitos de execução do template**: Alguns templates necessitam de ferramentas locais como Node.js, Python, Java ou Docker. Execute o validador de configuração antes de começar para detetar ferramentas em falta antecipadamente.
- **Familiaridade básica com o terminal**: Não precisa de ser especialista, mas deverá sentir-se confortável a executar comandos como `git clone`, `azd auth login` e `azd up`.

> **A trabalhar numa subscrição empresarial?**  
> Se o seu ambiente Azure for gerido por um administrador, confirme antecipadamente se pode implantar recursos na subscrição ou grupo de recursos que planeia usar. Caso contrário, peça uma subscrição sandbox ou acesso de Colaborador antes de começar.

> **Novo no Azure?**  
> Comece com a sua própria avaliação gratuita Azure ou subscrição pay-as-you-go em https://aka.ms/azurefreetrial para poder completar os exercícios do início ao fim sem esperar por aprovações ao nível do tenant.

## 🗺️ Mapa do Curso: Navegação Rápida por Capítulo

Cada capítulo tem um README dedicado com objetivos de aprendizagem, arranques rápidos e exercícios:

| Capítulo | Tema | Lições | Duração | Complexidade |
|---------|-------|---------|----------|------------|
| **[Cap 1: Fundamentos](docs/chapter-01-foundation/README.md)** | Começar | [Conceitos Básicos do AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Instalação](docs/chapter-01-foundation/installation.md) &#124; [Primeiro Projeto](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Cap 2: Desenvolvimento AI](docs/chapter-02-ai-development/README.md)** | Apps AI-First | [Integração Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Agentes AI](docs/chapter-02-ai-development/agents.md) &#124; [Desdobramento de Modelos](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Cap 3: Configuração](docs/chapter-03-configuration/README.md)** | Autenticação e Segurança | [Configuração](docs/chapter-03-configuration/configuration.md) &#124; [Autenticação e Segurança](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Cap 4: Infraestrutura](docs/chapter-04-infrastructure/README.md)** | IaC & Desdobramento | [Guia de Desdobramento](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisionamento](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Cap 5: Multi-Agente](docs/chapter-05-multi-agent/README.md)** | Soluções de Agentes AI | [Cenário Retalho](examples/retail-scenario.md) &#124; [Padrões de Coordenação](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[Cap 6: Pré-Desdobramento](docs/chapter-06-pre-deployment/README.md)** | Planeamento & Validação | [Checks Preliminares](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Planeamento de Capacidade](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Seleção de SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[Cap 7: Resolução de Problemas](docs/chapter-07-troubleshooting/README.md)** | Depuração & Correção | [Problemas Comuns](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Depuração](docs/chapter-07-troubleshooting/debugging.md) &#124; [Problemas AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[Cap 8: Produção](docs/chapter-08-production/README.md)** | Padrões Empresariais | [Práticas de Produção](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Laboratório Prático | [Introdução](workshop/docs/instructions/0-Introduction.md) &#124; [Seleção](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validação](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Desconstrução](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuração](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Personalização](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Desmontagem](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Conclusão](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**Duração Total do Curso:** ~10-14 horas | **Progressão de Competências:** Iniciante → Pronto para Produção

---

## 📚 Capítulos de Aprendizagem

*Escolha o seu percurso de aprendizagem consoante o seu nível de experiência e objetivos*

### 🚀 Capítulo 1: Fundamentos & Arranque Rápido  
**Pré-requisitos**: subscrição Azure, conhecimentos básicos de linha de comando  
**Duração**: 30-45 minutos  
**Complexidade**: ⭐

#### O Que Vai Aprender
- Compreender os fundamentos do Azure Developer CLI  
- Instalar o AZD na sua plataforma  
- O seu primeiro desdobramento bem-sucedido

#### Recursos de Aprendizagem
- **🎯 Comece Aqui**: [O que é o Azure Developer CLI?](#what-is-azure-developer-cli)  
- **📖 Teoria**: [Conceitos Básicos do AZD](docs/chapter-01-foundation/azd-basics.md) - conceitos e terminologia fundamentais  
- **⚙️ Configuração**: [Instalação & Configuração](docs/chapter-01-foundation/installation.md) - guias específicos para plataformas  
- **🛠️ Prática**: [O Seu Primeiro Projeto](docs/chapter-01-foundation/first-project.md) - tutorial passo a passo  
- **📋 Referência Rápida**: [Folha de Comandos](resources/cheat-sheet.md)

#### Exercícios Práticos  
```bash
# Verificação rápida de instalação
azd version

# Desloque a sua primeira aplicação
azd init --template todo-nodejs-mongo
azd up
```
  
**💡 Resultado do Capítulo**: Desdobrar com sucesso uma aplicação web simples no Azure usando AZD

**✅ Validação de Sucesso:**  
```bash
# Após concluir o Capítulo 1, deverá ser capaz de:
azd version              # Mostra a versão instalada
azd init --template todo-nodejs-mongo  # Inicializa o projeto
azd up                  # Faz o deploy para o Azure
azd show                # Exibe a URL da aplicação em execução
# A aplicação abre no navegador e funciona
azd down --force --purge  # Limpa os recursos
```
  
**📊 Investimento de Tempo:** 30-45 minutos  
**📈 Nível de Competência Após:** Capaz de desdobrar aplicações básicas de forma independente  
**📈 Nível de Competência Após:** Capaz de desdobrar aplicações básicas de forma independente

---

### 🤖 Capítulo 2: Desenvolvimento AI-First (Recomendado para Desenvolvedores AI)  
**Pré-requisitos**: Capítulo 1 concluído  
**Duração**: 1-2 horas  
**Complexidade**: ⭐⭐

#### O Que Vai Aprender
- Integração Microsoft Foundry com AZD  
- Desdobrar aplicações potenciadas por AI  
- Compreender configurações de serviços AI

#### Recursos de Aprendizagem
- **🎯 Comece Aqui**: [Integração Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)  
- **🤖 Agentes AI**: [Guia de Agentes AI](docs/chapter-02-ai-development/agents.md) - desdobrar agentes inteligentes com AZD  
- **📖 Padrões**: [Desdobramento de Modelos AI](docs/chapter-02-ai-development/ai-model-deployment.md) - implantar e gerir modelos AI  
- **🛠️ Workshop**: [Laboratório AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - torne as suas soluções AI preparadas para AZD  
- **🎥 Guia Interativo**: [Materiais do Workshop](workshop/README.md) - Aprendizagem baseada no navegador com MkDocs * Ambiente DevContainer  
- **📋 Templates**: [Templates Microsoft Foundry](#recursos-do-workshop)  
- **📝 Exemplos**: [Exemplos de Desdobramento AZD](examples/README.md)

#### Exercícios Práticos  
```bash
# Coloque a sua primeira aplicação de IA em funcionamento
azd init --template azure-search-openai-demo
azd up

# Experimente modelos adicionais de IA
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```
  
**💡 Resultado do Capítulo**: Desdobrar e configurar uma aplicação de chat AI com capacidades RAG

**✅ Validação de Sucesso:**  
```bash
# Após o Capítulo 2, deverá ser capaz de:
azd init --template azure-search-openai-demo
azd up
# Testar a interface de chat de IA
# Fazer perguntas e obter respostas com IA acompanhadas de fontes
# Verificar se a integração de pesquisa funciona
azd monitor  # Confirmar que o Application Insights mostra a telemetria
azd down --force --purge
```
  
**📊 Investimento de Tempo:** 1-2 horas  
**📈 Nível de Competência Após:** Capaz de desdobrar e configurar aplicações AI prontas para produção  
**💰 Consciência de Custos:** Compreender custos dev de $80-150/mês, custos produção de $300-3500/mês

#### 💰 Considerações de Custo para Desdobramentos AI

**Ambiente de Desenvolvimento (Estimado $80-150/mês):**  
- Modelos Microsoft Foundry (Pay-as-you-go): $0-50/mês (baseado em tokens usados)  
- AI Search (nível básico): $75/mês  
- Container Apps (Consumo): $0-20/mês  
- Armazenamento (Standard): $1-5/mês

**Ambiente de Produção (Estimado $300-3,500+/mês):**  
- Modelos Microsoft Foundry (PTU para desempenho consistente): $3,000+/mês OU Pay-as-you-go com volume elevado  
- AI Search (nível standard): $250/mês  
- Container Apps (Dedicado): $50-100/mês  
- Application Insights: $5-50/mês  
- Armazenamento (Premium): $10-50/mês

**💡 Dicas de Otimização de Custos:**  
- Use os modelos Microsoft Foundry do **Nível Gratuito** para aprendizagem (Azure OpenAI inclui 50.000 tokens/mês)  
- Execute `azd down` para desalocar recursos quando não estiver a desenvolver ativamente  
- Comece com faturação baseada em consumo, faça upgrade para PTU só para produção  
- Use `azd provision --preview` para estimar custos antes do desdobramento  
- Ative o auto-escalamento: pague só pelo uso real

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
- **🔐 Segurança**: [Padrões de Autenticação e Identidade Gerida](docs/chapter-03-configuration/authsecurity.md) - padrões de autenticação  
- **📝 Exemplos**: [Exemplo de App de Base de Dados](examples/database-app/README.md) - Exemplos AZD para base de dados

#### Exercícios Práticos  
- Configurar múltiplos ambientes (dev, staging, prod)  
- Configurar autenticação de identidade gerida  
- Implementar configurações específicas de ambiente

**💡 Resultado do Capítulo**: Gerir múltiplos ambientes com autenticação e segurança apropriadas

---

### 🏗️ Capítulo 4: Infraestrutura como Código & Desdobramento  
**Pré-requisitos**: Capítulos 1-3 concluídos  
**Duração**: 1-1.5 horas  
**Complexidade**: ⭐⭐⭐

#### O Que Vai Aprender
- Padrões avançados de desdobramento  
- Infraestrutura como Código com Bicep  
- Estratégias de provisionamento de recursos

#### Recursos de Aprendizagem
- **📖 Desdobramento**: [Guia de Desdobramento](docs/chapter-04-infrastructure/deployment-guide.md) - fluxos completos de trabalho  
- **🏗️ Provisionamento**: [Provisionamento de Recursos](docs/chapter-04-infrastructure/provisioning.md) - gestão de recursos Azure  
- **📝 Exemplos**: [Exemplo de Container App](../../examples/container-app) - desdobramentos conteinerizados

#### Exercícios Práticos  
- Criar templates Bicep personalizados  
- Desdobrar aplicações multi-serviço  
- Implementar estratégias blue-green de desdobramento

**💡 Resultado do Capítulo**: Desdobrar aplicações complexas multi-serviço usando templates de infraestrutura personalizados

---

### 🎯 Capítulo 5: Soluções Multi-Agente AI (Avançado)  
**Pré-requisitos**: Capítulos 1-2 concluídos  
**Duração**: 2-3 horas  
**Complexidade**: ⭐⭐⭐⭐

#### O Que Vai Aprender
- Padrões de arquitetura multi-agente  
- Orquestração e coordenação de agentes  
- Desdobramentos AI prontos para produção

#### Recursos de Aprendizagem
- **🤖 Projeto em Destaque**: [Solução Multi-Agente Retalho](examples/retail-scenario.md) - implementação completa  
- **🛠️ Templates ARM**: [Pacote Template ARM](../../examples/retail-multiagent-arm-template) - desdobramento com um clique  
- **📖 Arquitetura**: [Padrões de Coordenação Multi-Agente](docs/chapter-06-pre-deployment/coordination-patterns.md) - padrões

#### Exercícios Práticos  
```bash
# Desplegar a solução de multi-agentes completa para retalho
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explorar configurações dos agentes
az deployment group show --resource-group <rg-name> --name <deployment-name>
```
  
**💡 Resultado do Capítulo**: Desdobrar e gerir uma solução multi-agente AI pronta para produção com agentes de Cliente e Inventário

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
- Otimizar seleções de SKU para custo
- Implementar verificações automáticas pré-deployment

**💡 Resultado do Capítulo**: Validar e otimizar deployments antes da execução

---

### 🚨 Capítulo 7: Resolução de Problemas e Depuração
**Pré-requisitos**: Qualquer capítulo de deployment concluído  
**Duração**: 1-1.5 horas  
**Complexidade**: ⭐⭐

#### O Que Vai Aprender
- Abordagens sistemáticas de depuração
- Problemas comuns e soluções
- Resolução de problemas específicos para IA

#### Recursos de Aprendizagem
- **🔧 Problemas Comuns**: [Problemas Comuns](docs/chapter-07-troubleshooting/common-issues.md) - Perguntas frequentes e soluções
- **🕵️ Depuração**: [Guia de Depuração](docs/chapter-07-troubleshooting/debugging.md) - Estratégias passo a passo
- **🤖 Problemas de IA**: [Resolução de Problemas para IA](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problemas de serviços de IA

#### Exercícios Práticos
- Diagnosticar falhas no deployment
- Resolver problemas de autenticação
- Depurar conectividade de serviços de IA

**💡 Resultado do Capítulo**: Diagnosticar e resolver problemas comuns de deployment independentemente

---

### 🏢 Capítulo 8: Padrões de Produção e Empresariais
**Pré-requisitos**: Capítulos 1-4 concluídos  
**Duração**: 2-3 horas  
**Complexidade**: ⭐⭐⭐⭐

#### O Que Vai Aprender
- Estratégias de deployment em produção
- Padrões de segurança empresarial
- Monitorização e otimização de custos

#### Recursos de Aprendizagem
- **🏭 Produção**: [Práticas Ideais para IA em Produção](docs/chapter-08-production/production-ai-practices.md) - Padrões empresariais
- **📝 Exemplos**: [Exemplo de Microserviços](../../examples/microservices) - Arquiteturas complexas
- **📊 Monitorização**: [Integração Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Monitorização

#### Exercícios Práticos
- Implementar padrões de segurança empresarial
- Configurar monitorização abrangente
- Efetuar deployments em produção com governação adequada

**💡 Resultado do Capítulo**: Desplegar aplicações prontas para empresas com total capacidade de produção

---

## 🎓 Visão Geral do Workshop: Experiência de Aprendizagem Prática

> **⚠️ ESTADO DO WORKSHOP: Desenvolvimento Ativo**  
> Os materiais do workshop estão a ser atualmente desenvolvidos e refinados. Os módulos principais estão funcionais, mas algumas secções avançadas estão incompletas. Estamos a trabalhar ativamente para completar todo o conteúdo. [Acompanhe o progresso →](workshop/README.md)

### Materiais Interativos do Workshop
**Aprendizagem prática abrangente com ferramentas no navegador e exercícios guiados**

Os materiais do workshop providenciam uma experiência estruturada e interativa que complementa o currículo baseado nos capítulos acima. O workshop destina-se tanto ao auto-estudo como a sessões conduzidas por instrutores.

#### 🛠️ Características do Workshop
- **Interface no Navegador**: Workshop completo suportado por MkDocs com pesquisa, cópia e temas
- **Integração GitHub Codespaces**: Configuração do ambiente de desenvolvimento com um clique
- **Caminho de Aprendizagem Estruturado**: 8 módulos com exercícios guiados (3-4 horas no total)
- **Metodologia Progressiva**: Introdução → Seleção → Validação → Desconstrução → Configuração → Personalização → Desmontagem → Conclusão
- **Ambiente DevContainer Interativo**: Ferramentas e dependências pré-configuradas

#### 📚 Estrutura dos Módulos do Workshop
O workshop segue uma **metodologia progressiva de 8 módulos** que o leva desde a descoberta à maestria em deployment:

| Módulo | Tema | O Que Vai Fazer | Duração |
|--------|-------|----------------|----------|
| **0. Introdução** | Visão Geral do Workshop | Compreender objetivos de aprendizagem, pré-requisitos e estrutura do workshop | 15 min |
| **1. Seleção** | Descoberta de Templates | Explorar templates AZD e selecionar o template AI adequado para o seu cenário | 20 min |
| **2. Validação** | Deploy & Verificar | Implantar o template com `azd up` e validar a infraestrutura | 30 min |
| **3. Desconstrução** | Compreender Estrutura | Usar GitHub Copilot para explorar arquitetura do template, ficheiros Bicep e organização do código | 30 min |
| **4. Configuração** | Análise Profunda do azure.yaml | Dominar configuração do `azure.yaml`, lifecycle hooks e variáveis de ambiente | 30 min |
| **5. Personalização** | Faça-o Seu | Ativar AI Search, trace, avaliação e personalizar para seu cenário | 45 min |
| **6. Desmontagem** | Limpeza | Remover recursos com segurança usando `azd down --purge` | 15 min |
| **7. Conclusão** | Próximos Passos | Rever conquistas, conceitos-chave e continuar percurso de aprendizagem | 15 min |

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
# Siga as instruções de configuração em workshop/README.md
```

#### 🎯 Resultados da Aprendizagem do Workshop
Ao concluir o workshop, os participantes irão:
- **Desplegar Aplicações de IA em Produção**: Usar AZD com serviços Microsoft Foundry
- **Dominar Arquiteturas Multi-Agente**: Implementar soluções coordenadas com agentes de IA
- **Implementar Melhores Práticas de Segurança**: Configurar autenticação e controlo de acesso
- **Otimizar para Escalabilidade**: Projetar deployments custo-efetivos e performantes
- **Resolver Problemas em Deployments**: Diagnosticar e resolver problemas comuns de forma independente

#### 📖 Recursos do Workshop
- **🎥 Guia Interativo**: [Materiais do Workshop](workshop/README.md) - Ambiente de aprendizagem no navegador
- **📋 Instruções por Módulo**:
  - [0. Introdução](workshop/docs/instructions/0-Introduction.md) - Visão geral e objetivos do workshop
  - [1. Seleção](workshop/docs/instructions/1-Select-AI-Template.md) - Encontrar e selecionar templates AI
  - [2. Validação](workshop/docs/instructions/2-Validate-AI-Template.md) - Deploy e verificação de templates
  - [3. Desconstrução](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Explorar arquitetura dos templates
  - [4. Configuração](workshop/docs/instructions/4-Configure-AI-Template.md) - Dominar azure.yaml
  - [5. Personalização](workshop/docs/instructions/5-Customize-AI-Template.md) - Personalizar para o seu cenário
  - [6. Desmontagem](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Limpar recursos
  - [7. Conclusão](workshop/docs/instructions/7-Wrap-up.md) - Revisão e próximos passos
- **🛠️ Laboratório de IA**: [Laboratório Workshop IA](docs/chapter-02-ai-development/ai-workshop-lab.md) - Exercícios focados em IA
- **💡 Início Rápido**: [Guia de Configuração do Workshop](workshop/README.md#quick-start) - Configuração do ambiente

**Ideal para**: Formação corporativa, cursos universitários, aprendizagem auto-dirigida e bootcamps para programadores.

---

## 📖 Exploração Profunda: Capacidades do AZD

Para além do básico, o AZD oferece funcionalidades poderosas para deployments em produção:

- **Deployments baseados em templates** - Usar templates pré-construídos para padrões comuns de aplicações
- **Infraestrutura como Código** - Gerir recursos Azure usando Bicep ou Terraform  
- **Fluxos de trabalho integrados** - Provisionar, deployar e monitorizar aplicações de forma fluida
- **Amigável para desenvolvedores** - Otimizado para produtividade e experiência do programador

### **AZD + Microsoft Foundry: Perfeito para Deployments AI**

**Porque optar pelo AZD para soluções AI?** O AZD resolve os maiores desafios enfrentados por programadores AI:

- **Templates prontos para IA** - Templates pré-configurados para Modelos Microsoft Foundry, Serviços Cognitivos e cargas de trabalho ML
- **Deployments AI seguros** - Padrões de segurança incorporados para serviços AI, chaves API e endpoints de modelos  
- **Padrões de IA em produção** - Melhores práticas para deployments AI escaláveis e custo-efetivos
- **Fluxos de trabalho de IA de ponta a ponta** - Desde o desenvolvimento do modelo ao deployment em produção com monitorização adequada
- **Otimização de custos** - Alocação inteligente de recursos e estratégias de escalonamento para cargas AI
- **Integração Microsoft Foundry** - Ligação fluida ao catálogo de modelos Microsoft Foundry e endpoints

---

## 🎯 Biblioteca de Templates e Exemplos

### Destaque: Templates Microsoft Foundry
**Comece aqui se estiver a deployar aplicações AI!**

> **Nota:** Estes templates demonstram vários padrões AI. Alguns são Azure Samples externos, outros são implementações locais.

| Template | Capítulo | Complexidade | Serviços | Tipo |
|----------|---------|------------|----------|------|
| [**Começar com chat IA**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capítulo 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Externo |
| [**Começar com agentes IA**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Capítulo 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Externo |
| [**Demo Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capítulo 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Externo |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capítulo 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Externo |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capítulo 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Externo |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Capítulo 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Externo |
| [**Solução Multi-Agente Retail**](examples/retail-scenario.md) | Capítulo 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Local** |

### Destaque: Cenários Completos de Aprendizagem
**Templates de aplicações prontos para produção mapeados aos capítulos de aprendizagem**

| Template | Capítulo de Aprendizagem | Complexidade | Aprendizagem Chave |
|----------|--------------------------|-------------|--------------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capítulo 2 | ⭐ | Padrões básicos de deployment AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capítulo 2 | ⭐⭐ | Implementação RAG com Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Capítulo 4 | ⭐⭐ | Integração de Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capítulo 5 | ⭐⭐⭐ | Framework de agentes e chamadas a funções |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Capítulo 8 | ⭐⭐⭐ | Orquestração AI empresarial |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Capítulo 5 | ⭐⭐⭐⭐ | Arquitetura multi-agente com agentes de Cliente e Inventário |

### Aprender por Tipo de Exemplo

> **📌 Exemplos Locais vs. Externos:**  
> **Exemplos Locais** (neste repositório) = Prontos a usar imediatamente  
> **Exemplos Externos** (Azure Samples) = Clonar dos repositórios vinculados

#### Exemplos Locais (Prontos a Usar)
- [**Solução Multi-Agente Retail**](examples/retail-scenario.md) - Implementação completa pronta para produção com templates ARM
  - Arquitetura multi-agente (Agentes de Cliente + Inventário)
  - Monitorização e avaliação abrangentes
  - Deployment com um clique via template ARM

#### Exemplos Locais - Aplicações em Contêiner (Capítulos 2-5)
**Exemplos completos de deployment de contêineres neste repositório:**
- [**Exemplos de Container Apps**](examples/container-app/README.md) - Guia completo para deployments conteinerizados
  - [API Flask Simples](../../examples/container-app/simple-flask-api) - API REST básica com scale-to-zero
  - [Arquitetura de Microserviços](../../examples/container-app/microservices) - Deployment multi-serviço pronto para produção
  - Padrões de Quick Start, Produção e Avançado
  - Orientações de monitorização, segurança e otimização de custos

#### Exemplos Externos - Aplicações Simples (Capítulos 1-2)
**Clone estes repositórios Azure Samples para começar:**
- [Aplicação Web Simples - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Padrões básicos de deployment
- [Website Estático - SPA React](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Deployment de conteúdo estático
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Deployment API REST

#### Exemplos Externos - Integração com Base de Dados (Capítulos 3-4)  

- [Aplicação de Base de Dados - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Padrões de conectividade a base de dados
- [Funções + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Workflow de dados serverless

#### Exemplos Externos - Padrões Avançados (Capítulos 4-8)
- [Microserviços Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - Arquiteturas multi-serviço
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Processamento em background  
- [Pipeline ML Empresarial](https://github.com/Azure-Samples/mlops-v2) - Padrões ML prontos para produção

### Coleções de Templates Externos
- [**Galeria Oficial de Templates AZD**](https://azure.github.io/awesome-azd/) - Coleção selecionada de templates oficiais e da comunidade
- [**Templates Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Documentação de templates Microsoft Learn
- [**Diretório de Exemplos**](examples/README.md) - Exemplos locais para aprendizagem com explicações detalhadas

---

## 📚 Recursos de Aprendizagem & Referências

### Referências Rápidas
- [**Resumo de Comandos**](resources/cheat-sheet.md) - Comandos azd essenciais organizados por capítulo
- [**Glossário**](resources/glossary.md) - Terminologia Azure e azd  
- [**Perguntas Frequentes**](resources/faq.md) - Questões comuns organizadas por capítulo de aprendizagem
- [**Guia de Estudo**](resources/study-guide.md) - Exercícios práticos abrangentes

### Workshops Práticos
- [**Laboratório Workshop AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Torne as suas soluções AI implantáveis com AZD (2-3 horas)
- [**Workshop Interativo**](workshop/README.md) - Exercícios guiados em 8 módulos com MkDocs e GitHub Codespaces
  - Segue: Introdução → Seleção → Validação → Desconstrução → Configuração → Personalização → Encerramento → Conclusão

### Recursos Externos de Aprendizagem
- Documentação Azure Developer CLI: [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Centro de Arquitetura Azure: [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- Calculadora de Preços Azure: [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- Estado Azure: [Azure Status](https://status.azure.com/)

### Skills de Agente AI para o Seu Editor
- [**Skills Microsoft Azure em skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 skills de agente abertas para Azure AI, Foundry, deployment, diagnóstico, otimização de custos e mais. Instale-as no GitHub Copilot, Cursor, Claude Code ou qualquer agente suportado:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Guia Rápido de Resolução de Problemas

**Problemas comuns enfrentados por iniciantes e soluções imediatas:**

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
<summary><strong>❌ "No subscription found" ou "Subscription not set"</strong></summary>

```bash
# Listar subscrições disponíveis
az account list --output table

# Definir subscrição predefinida
az account set --subscription "<subscription-id-or-name>"

# Definir para o ambiente AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Verificar
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" ou "Quota exceeded"</strong></summary>

```bash
# Experimente diferentes regiões Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Ou use SKUs menores em desenvolvimento
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

# Opção 4: Verificar registos no Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" ou "Token expired"</strong></summary>

```bash
# Reautenticar para AZD
azd auth logout
azd auth login

# Opcional: atualizar também o Azure CLI se estiver a executar comandos az
az logout
az login

# Verificar autenticação
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" ou conflitos de nomeação</strong></summary>

```bash
# AZD gera nomes únicos, mas se houver conflito:
azd down --force --purge

# Então tente novamente com um ambiente novo
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Implantação de template está a demorar muito</strong></summary>

**Tempos normais de espera:**
- Aplicação web simples: 5-10 minutos
- Aplicação com base dados: 10-15 minutos
- Aplicações AI: 15-25 minutos (provisionamento OpenAI é lento)

```bash
# Verificar progresso
azd show

# Se estiver preso >30 minutos, verifique o Portal Azure:
azd monitor --overview
# Procure por implementações falhadas
```
</details>

<details>
<summary><strong>❌ "Permission denied" ou "Forbidden"</strong></summary>

```bash
# Verifique a sua função no Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Necessita de, pelo menos, a função "Colaborador"
# Peça ao seu administrador Azure para conceder:
# - Colaborador (para recursos)
# - Administrador de Acesso de Utilizadores (para atribuições de funções)
```
</details>

<details>
<summary><strong>❌ Não consegue encontrar URL da aplicação implantada</strong></summary>

```bash
# Mostrar todos os endpoints de serviço
azd show

# Ou abrir o Portal Azure
azd monitor

# Verificar serviço específico
azd env get-values
# Procurar variáveis *_URL
```
</details>

### 📚 Recursos Completos de Resolução de Problemas

- **Guia de Problemas Comuns:** [Soluções Detalhadas](docs/chapter-07-troubleshooting/common-issues.md)
- **Problemas Específicos de AI:** [Resolução de Problemas AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Guia de Debug:** [Debug passo a passo](docs/chapter-07-troubleshooting/debugging.md)
- **Obter Ajuda:** [Discord Azure](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Conclusão do Curso & Certificação

### Acompanhamento do Progresso
Acompanhe o progresso da sua aprendizagem em cada capítulo:

- [ ] **Capítulo 1**: Fundamentos & Início Rápido ✅
- [ ] **Capítulo 2**: Desenvolvimento AI-First ✅  
- [ ] **Capítulo 3**: Configuração & Autenticação ✅
- [ ] **Capítulo 4**: Infraestrutura como Código & Deployment ✅
- [ ] **Capítulo 5**: Soluções AI Multi-Agente ✅
- [ ] **Capítulo 6**: Validação e Planeamento Pré-Deployment ✅
- [ ] **Capítulo 7**: Resolução de Problemas & Debugging ✅
- [ ] **Capítulo 8**: Padrões de Produção & Empresariais ✅

### Verificação de Aprendizagem
Depois de completar cada capítulo, verifique o seu conhecimento por:
1. **Exercício Prático**: Realize o deployment prático do capítulo
2. **Checagem de Conhecimento**: Reveja a secção de FAQ do seu capítulo
3. **Discussão Comunitária**: Partilhe a sua experiência no Azure Discord
4. **Próximo Capítulo**: Avance para o próximo nível de complexidade

### Benefícios da Conclusão do Curso
Ao completar todos os capítulos, terá:
- **Experiência em Produção**: Implantações reais de aplicações AI no Azure
- **Competências Profissionais**: Capacidades de deployment empresariais  
- **Reconhecimento Comunitário**: Membro ativo da comunidade de desenvolvedores Azure
- **Progressão de Carreira**: Expertise valorizada em AZD e deployment AI

---

## 🤝 Comunidade & Suporte

### Obtenha Ajuda & Suporte
- **Problemas Técnicos**: [Reportar bugs e pedir funcionalidades](https://github.com/microsoft/azd-for-beginners/issues)
- **Dúvidas de Aprendizagem**: [Comunidade Microsoft Azure Discord](https://discord.gg/microsoft-azure) e [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Ajuda Específica AI**: Junte-se ao [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentação**: [Documentação Oficial Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Insights da Comunidade do Microsoft Foundry Discord

**Resultados recentes da sondagem no Canal #Azure:**
- **45%** dos desenvolvedores querem usar AZD para cargas de trabalho AI
- **Principais desafios**: Deployments multi-serviço, gestão de credenciais, prontidão para produção  
- **Mais pedidos**: Templates específicos para AI, guias de resolução de problemas, melhores práticas

**Junte-se à nossa comunidade para:**
- Partilhar as suas experiências AZD + AI e obter ajuda
- Acesso a previews antecipadas dos novos templates AI
- Contribuir para melhores práticas de deployment AI
- Influenciar o desenvolvimento futuro de features AI + AZD

### Contribuir para o Curso
Aceitamos contribuições! Por favor, leia o nosso [Guia de Contribuição](CONTRIBUTING.md) para detalhes sobre:
- **Melhorias de Conteúdo**: Aprimorar capítulos e exemplos existentes
- **Novos Exemplos**: Adicionar cenários e templates reais  
- **Tradução**: Ajudar a manter suporte multi-idioma
- **Relato de Bugs**: Melhorar precisão e clareza
- **Normas Comunitárias**: Seguir as nossas diretrizes inclusivas

---

## 📄 Informação do Curso

### Licença
Este projeto está licenciado sob a Licença MIT - consulte o ficheiro [LICENSE](../../LICENSE) para detalhes.

### Recursos de Aprendizagem Relacionados Microsoft

A nossa equipa produz outros cursos completos de aprendizagem:

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
 
### Série Generative AI
[![Generative AI para Iniciantes](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Aprendizagem Core
[![ML para Iniciantes](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

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
**Desenvolvedores de IA**: Avance para [Capítulo 2: Desenvolvimento AI-First](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Desenvolvedores Experientes**: Comece com [Capítulo 3: Configuração & Autenticação](#️-chapter-3-configuration--authentication)

**Próximos Passos**: [Começar Capítulo 1 - Noções Básicas do AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor tenha em consideração que as traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autoritária. Para informações críticas, recomenda-se a tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações erradas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->