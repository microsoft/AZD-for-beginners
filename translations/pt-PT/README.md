# AZD Para Iniciantes: Uma Jornada de Aprendizagem Estruturada

![AZD-for-beginners](../../translated_images/pt-PT/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Traduções Automatizadas (Sempre Atualizadas)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](./README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Prefere Clonar Localmente?**
>
> Este repositório inclui traduções em mais de 50 idiomas, o que aumenta significativamente o tamanho do download. Para clonar sem traduções, use o sparse checkout:
>
> **Bash/macOS/Linux:**
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

> 📌 Este curso foi validado com **`azd 1.27.1`** (julho de 2026). Execute `azd version` para verificar a sua versão e `azd upgrade` para obter a mais recente.

O Azure Developer CLI cresceu para além das aplicações web e APIs tradicionais. Hoje, azd é a única ferramenta para implementar **qualquer** aplicação no Azure — incluindo aplicações com IA e agentes inteligentes.

Isto significa para si:

- **Agentes de IA são agora cargas de trabalho de primeira classe no azd.** Pode inicializar, implementar e gerir projetos de agentes de IA usando o mesmo fluxo `azd init` → `azd up` que já conhece.
- **Um ciclo de vida completo de agentes a partir da CLI.** A extensão `azure.ai.agents` cobre agora toda a jornada — `azd ai agent init` para scaffolding, `azd ai agent invoke` para teste (com output de tempo de resposta), `azd ai agent eval generate` e `azd ai agent optimize` para medir e melhorar a qualidade, e `azd ai agent delete` para limpeza.
- **Mais blocos de construção para IA.** Novas extensões em prévia — `azure.ai.skills` e `azure.ai.connections` — permitem-lhe gerir skills reutilizáveis de agentes e ligações Foundry diretamente com azd.
- **Integração com Microsoft Foundry** traz deploy de modelos, alojamento de agentes e configuração de serviços de IA diretamente para o ecossistema de templates azd.
- **Operações do dia a dia mais suaves.** As últimas versões tornaram o `azd init` idempotente (seguro para correr novamente), fizeram o `azd auth login` limpar tokens desatualizados automaticamente e adicionaram um amigável prompt de configuração inicial `azd tool`.
- **O fluxo de trabalho principal não mudou.** Quer esteja a implementar uma aplicação de lista de tarefas, um microsserviço ou uma solução de IA multiagente, os comandos são os mesmos.

> **Nota para utilizadores do Aspire:** A Microsoft agora refere-se ao produto simplesmente como **Aspire** (anteriormente ".NET Aspire"). O suporte ao Aspire no azd mantém-se inalterado — apenas o nome foi atualizado.

Se já usou azd antes, o suporte a IA é uma extensão natural — não uma ferramenta separada ou um percurso avançado. Se está a começar do zero, aprenderá um fluxo de trabalho que funciona para tudo.

---

## 🚀 O que é o Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** é uma ferramenta de linha de comandos amigável para programadores que facilita o deploy de aplicações no Azure. Em vez de criar e ligar manualmente dezenas de recursos Azure, pode implementar aplicações inteiras com um único comando.

### A Magia do `azd up`

```bash
# Este comando único faz tudo:
# ✅ Cria todos os recursos Azure
# ✅ Configura rede e segurança
# ✅ Constrói o código da sua aplicação
# ✅ Desdobra para o Azure
# ✅ Dá-lhe um URL funcional
azd up
```

**É tudo!** Nada de clicar no Portal Azure, nem templates ARM complexos para aprender primeiro, nem configurações manuais - apenas aplicações a funcionar no Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Qual a Diferença?

Esta é a pergunta mais comum entre iniciantes. Aqui está a resposta simples:

| Função | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Objetivo** | Gerir recursos Azure individuais | Implementar aplicações completas |
| **Mentalidade** | Foco na infraestrutura | Foco na aplicação |
| **Exemplo** | `az webapp create --name myapp...` | `azd up` |
| **Curva de aprendizagem** | Precisa conhecer serviços Azure | Basta conhecer a sua app |
| **Ideal para** | DevOps, Infraestrutura | Programadores, Prototipagem |

### Analogia Simples

- **Azure CLI** é como ter todas as ferramentas para construir uma casa - martelos, serras, pregos. Pode construir qualquer coisa, mas precisa saber construção.
- **Azure Developer CLI** é como contratar um empreiteiro - descreve o que quer, e eles tratam da construção.

### Quando Usar Cada Um

| Cenário | Use Isto |
|----------|----------|
| "Quero implementar a minha aplicação web rapidamente" | `azd up` |
| "Preciso apenas de criar uma conta de armazenamento" | `az storage account create` |
| "Estou a construir uma aplicação completa de IA" | `azd init --template azure-search-openai-demo` |
| "Preciso depurar um recurso Azure específico" | `az resource show` |
| "Quero um deploy pronto para produção em minutos" | `azd up --environment production` |

### Trabalham em Conjunto!

AZD usa Azure CLI por baixo. Pode usar ambos:
```bash
# Faça o deploy da sua aplicação com AZD
azd up

# Depois, ajuste recursos específicos com o Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Encontre Templates no Awesome AZD

Não comece do zero! **Awesome AZD** é a coleção comunitária de templates prontos a implementar:

| Recurso | Descrição |
|----------|-------------|
| 🔗 [**Galeria Awesome AZD**](https://azure.github.io/awesome-azd/) | Explore 200+ templates com deploy de um clique |
| 🔗 [**Submeter um Template**](https://github.com/Azure/awesome-azd/issues) | Contribua com o seu próprio template para a comunidade |
| 🔗 [**Repositório GitHub**](https://github.com/Azure/awesome-azd) | Dê estrela e explore o código fonte |

### Templates Populares de IA do Awesome AZD

```bash
# Chat RAG com Microsoft Foundry Models + Pesquisa de IA
azd init --template azure-search-openai-demo

# Aplicação Rápida de Chat de IA
azd init --template openai-chat-app-quickstart

# Agentes de IA com Agentes Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 Começar em 3 Passos

Antes de começar, certifique-se de que a sua máquina está pronta para o template que quer implementar:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Se algum requisito falhar, corrija isso primeiro e depois continue com o início rápido.

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
# Opcional se planeia usar comandos Azure CLI diretamente neste curso
az login

# Necessário para fluxos de trabalho AZD
azd auth login
```

Se não tiver a certeza de qual precisa, siga o fluxo completo na [Instalação e Configuração](docs/chapter-01-foundation/installation.md#authentication-setup).

### Passo 3: Implemente a Sua Primeira App

```bash
# Inicializar a partir de um modelo
azd init --template todo-nodejs-mongo

# Implementar no Azure (cria tudo!)
azd up
```

**🎉 E é tudo!** A sua app já está ativa no Azure.

### Limpe (Não se Esqueça!)

```bash
# Remover todos os recursos ao terminar os experimentos
azd down --force --purge
```

---

## 📚 Como Usar Este Curso

Este curso foi desenhado para **aprendizagem progressiva** - comece onde se sentir confortável e avance:

| A Sua Experiência | Comece Aqui |
|-----------------|------------|
| **Totalmente novo no Azure** | [Capítulo 1: Fundamentos](#-chapter-1-foundation--quick-start) |
| **Conhece Azure, é novo no AZD** | [Capítulo 1: Fundamentos](#-chapter-1-foundation--quick-start) |
| **Quer implementar apps IA** | [Capítulo 2: Desenvolvimento com IA em Primeiro Lugar](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Quer prática hands-on** | [🎓 Workshop Interativo](workshop/README.md) - laboratório guiado de 3-4 horas |
| **Precisa de padrões para produção** | [Capítulo 8: Produção e Padrões Empresariais](#-chapter-8-production--enterprise-patterns) |

### Configuração Rápida

1. **Fork deste Repositório**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone-o**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Peça Ajuda**: [Comunidade Azure no Discord](https://discord.com/invite/ByRwuEEgH4)

> **Prefere Clonar Localmente?**

> Este repositório inclui traduções em mais de 50 idiomas, o que aumenta significativamente o tamanho do download. Para clonar sem traduções, use o sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Isto dá-lhe tudo o que precisa para completar o curso com um download muito mais rápido.


## Visão Geral do Curso

Domine o Azure Developer CLI (azd) através de capítulos estruturados projetados para aprendizagem progressiva. **Foco especial na implementação de aplicações de IA com integração Microsoft Foundry.**


### Porque é que este curso é essencial para os desenvolvedores modernos

Com base nas perceções da comunidade Microsoft Foundry no Discord, **45% dos desenvolvedores querem usar o AZD para cargas de trabalho de IA** mas enfrentam desafios com:
- Arquiteturas complexas de IA com múltiplos serviços
- Melhores práticas para implementação de IA em produção  
- Integração e configuração de serviços Azure AI
- Otimização de custos para cargas de trabalho de IA
- Resolução de problemas específicos de implementação de IA

### Objetivos de aprendizagem

Ao completar este curso estruturado, você irá:
- **Dominar os Fundamentos do AZD**: Conceitos principais, instalação e configuração
- **Implementar aplicações de IA**: Usar AZD com serviços Microsoft Foundry
- **Implementar Infraestrutura como Código**: Gerir recursos Azure com templates Bicep
- **Resolver problemas de implementações**: Diagnosticar problemas comuns
- **Otimizar para produção**: Segurança, escalabilidade, monitorização e gestão de custos
- **Construir soluções Multi-Agente**: Implementar arquiteturas complexas de IA

## Antes de começar: Contas, Acessos e Suposições

Antes de iniciar o Capítulo 1, assegure que tem o seguinte pronto. Os passos de instalação mais à frente assumem que estes requisitos básicos já estão cumpridos.

- **Uma subscrição Azure**: Pode usar uma subscrição existente do trabalho ou pessoal, ou criar um [teste gratuito](https://aka.ms/azurefreetrial) para começar.
- **Permissão para criar recursos Azure**: Para a maioria dos exercícios, deve ter pelo menos acesso **Contribuinte** na subscrição ou grupo de recursos alvo. Alguns capítulos também assumem que consegue criar grupos de recursos, identidades geridas e atribuições RBAC.
- [**Uma conta GitHub**](https://github.com): Útil para fazer fork do repositório, acompanhar as suas próprias alterações e usar GitHub Codespaces para o workshop.
- **Pré-requisitos para execução de templates**: Alguns templates necessitam de ferramentas locais como Node.js, Python, Java, ou Docker. Execute o validador de configuração antes de começar para detetar ferramentas em falta.
- **Familiaridade básica com terminal**: Não precisa de ser expert, mas deve estar confortável a executar comandos como `git clone`, `azd auth login`, e `azd up`.

> **A trabalhar numa subscrição empresarial?**
> Se o seu ambiente Azure é gerido por um administrador, confirme antecipadamente se pode implementar recursos na subscrição ou grupo de recursos que planeia usar. Caso contrário, peça uma subscrição sandbox ou acesso Contribuinte antes de começar.

> **Novo no Azure?**
> Comece com a sua própria subscrição de teste Azure ou pay-as-you-go em https://aka.ms/azurefreetrial para poder completar os exercícios do início ao fim sem aguardar aprovações a nível do tenant.

## 🗺️ Mapa do Curso: Navegação Rápida por Capítulo

Cada capítulo tem um README dedicado com objetivos de aprendizagem, start guides e exercícios:

| Capítulo | Tópico | Lições | Duração | Complexidade |
|---------|-------|---------|----------|------------|
| **[Cap 1: Fundamentos](docs/chapter-01-foundation/README.md)** | Iniciação | [Noções Básicas AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Instalação](docs/chapter-01-foundation/installation.md) &#124; [Primeiro Projeto](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Cap 2: Desenvolvimento IA](docs/chapter-02-ai-development/README.md)** | Aplicações AI-First | [Integração Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Agentes IA](docs/chapter-02-ai-development/agents.md) &#124; [Implementação Modelo](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Cap 3: Configuração](docs/chapter-03-configuration/README.md)** | Autenticação & Segurança | [Configuração](docs/chapter-03-configuration/configuration.md) &#124; [Autenticação & Segurança](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Cap 4: Infraestrutura](docs/chapter-04-infrastructure/README.md)** | IaC & Implementação | [Guia de Implementação](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisionamento](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Cap 5: Multi-Agente](docs/chapter-05-multi-agent/README.md)** | Soluções com Agentes IA | [Cenário Retalho](examples/retail-scenario.md) &#124; [Padrões de Coordenação](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[Cap 6: Pré-Implementação](docs/chapter-06-pre-deployment/README.md)** | Planeamento & Validação | [Verificações pré-voo](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Planeamento de Capacidade](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Seleção SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[Cap 7: Resolução de Problemas](docs/chapter-07-troubleshooting/README.md)** | Debug & Correção | [Problemas Comuns](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [Problemas IA](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[Cap 8: Produção](docs/chapter-08-production/README.md)** | Padrões Empresariais | [Práticas de Produção](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Laboratório Prático | [Introdução](workshop/docs/instructions/0-Introduction.md) &#124; [Seleção](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validação](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Desconstrução](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuração](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Personalização](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Desmontagem](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Conclusão](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**Duração Total do Curso:** ~10-14 horas | **Progressão de Competências:** Iniciante → Pronto para Produção

---

## 📚 Capítulos de Aprendizagem

*Selecione o seu percurso de aprendizagem conforme o nível e objetivos*

### 🚀 Capítulo 1: Fundamentos & Início Rápido
**Pré-requisitos**: Subscrição Azure, conhecimentos básicos de linha de comando  
**Duração**: 30-45 minutos  
**Complexidade**: ⭐

#### O que irá aprender
- Compreender os fundamentos do Azure Developer CLI
- Instalar o AZD na sua plataforma
- A sua primeira implementação com sucesso

#### Recursos de Aprendizagem
- **🎯 Comece aqui**: [O que é o Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teoria**: [Noções Básicas AZD](docs/chapter-01-foundation/azd-basics.md) - Conceitos e terminologia principais
- **⚙️ Configuração**: [Instalação e Configuração](docs/chapter-01-foundation/installation.md) - Guias específicos por plataforma
- **🛠️ Prático**: [O seu Primeiro Projeto](docs/chapter-01-foundation/first-project.md) - Tutorial passo a passo
- **📋 Referência Rápida**: [Folha de Comandos](resources/cheat-sheet.md)

#### Exercícios Práticos
```bash
# Verificação rápida de instalação
azd version

# Desdobre a sua primeira aplicação
azd init --template todo-nodejs-mongo
azd up
```

**💡 Resultado do Capítulo**: Implementar com sucesso uma aplicação web simples para Azure usando AZD

**✅ Validação de Sucesso:**
```bash
# Após completar o Capítulo 1, deverá ser capaz de:
azd version              # Mostra a versão instalada
azd init --template todo-nodejs-mongo  # Inicializa o projeto
azd up                  # Desdobra para o Azure
azd show                # Mostra o URL da aplicação em execução
# A aplicação abre no navegador e funciona
azd down --force --purge  # Limpa os recursos
```

**📊 Tempo Estimado:** 30-45 minutos  
**📈 Nível de Competência Após:** Capaz de implementar aplicações básicas de forma independente
**📈 Nível de Competência Após:** Capaz de implementar aplicações básicas de forma independente

---

### 🤖 Capítulo 2: Desenvolvimento AI-First (Recomendado para Desenvolvedores de IA)
**Pré-requisitos**: Capítulo 1 concluído  
**Duração**: 1-2 horas  
**Complexidade**: ⭐⭐

#### O que irá aprender
- Integração Microsoft Foundry com AZD
- Implementação de aplicações potenciadas por IA
- Compreensão da configuração dos serviços de IA

#### Recursos de Aprendizagem
- **🎯 Comece aqui**: [Integração Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Agentes IA**: [Guia de Agentes IA](docs/chapter-02-ai-development/agents.md) - Implementar agentes inteligentes com AZD
- **📖 Padrões**: [Implementação de Modelos IA](docs/chapter-02-ai-development/ai-model-deployment.md) - Implementar e gerir modelos de IA
- **🛠️ Workshop**: [Laboratório AI Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) - Prepare as suas soluções IA para AZD
- **🎥 Guia Interactivo**: [Materiais do Workshop](workshop/README.md) - Aprendizagem baseada em navegador com MkDocs * Ambiente DevContainer
- **📋 Templates**: [Templates Microsoft Foundry](#recursos-do-workshop)
- **📝 Exemplos**: [Exemplos de Implementação AZD](examples/README.md)

#### Exercícios Práticos
```bash
# Desfogue a sua primeira aplicação de IA
azd init --template azure-search-openai-demo
azd up

# Experimente templates de IA adicionais
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Resultado do Capítulo**: Implementar e configurar uma aplicação de chat IA com capacidades RAG

**✅ Validação de Sucesso:**
```bash
# Após o Capítulo 2, deverá ser capaz de:
azd init --template azure-search-openai-demo
azd up
# Testar a interface de chat da IA
# Fazer perguntas e obter respostas com suporte de IA com fontes
# Verificar se a integração de pesquisa funciona
azd monitor  # Confirmar que o Application Insights mostra telemetria
azd down --force --purge
```

**📊 Tempo Estimado:** 1-2 horas  
**📈 Nível de Competência Após:** Capaz de implementar e configurar aplicações IA prontas para produção  
**💰 Consciência de Custos:** Compreende custos de desenvolvimento $80-150/mês, custos produção $300-3500/mês

#### 💰 Considerações de Custos para Implementações IA

**Ambiente de Desenvolvimento (Estimado $80-150/mês):**
- Modelos Microsoft Foundry (Pay-as-you-go): $0-50/mês (baseado no uso de tokens)
- AI Search (nível básico): $75/mês
- Container Apps (Consumo): $0-20/mês
- Armazenamento (Standard): $1-5/mês

**Ambiente de Produção (Estimado $300-3,500+/mês):**
- Modelos Microsoft Foundry (PTU para desempenho consistente): $3,000+/mês OU pay-as-go com elevado volume
- AI Search (nível Standard): $250/mês
- Container Apps (Dedicado): $50-100/mês
- Application Insights: $5-50/mês
- Armazenamento (Premium): $10-50/mês

**💡 Dicas de Otimização de Custos:**
- Use **Camada Gratuita** dos Modelos Microsoft Foundry para aprendizagem (Azure OpenAI inclui 50,000 tokens/mês)
- Execute `azd down` para desalocar recursos quando não estiver a desenvolver ativamente
- Comece com faturação baseada em consumo, faça upgrade para PTU apenas para produção
- Use `azd provision --preview` para estimar custos antes da implementação
- Ative auto-escalabilidade: pague apenas pelo uso real

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

#### O que irá aprender
- Configuração e gestão de ambientes
- Melhores práticas de autenticação e segurança
- Nomeação e organização de recursos

#### Recursos de Aprendizagem
- **📖 Configuração**: [Guia de Configuração](docs/chapter-03-configuration/configuration.md) - Configuração do ambiente
- **🔐 Segurança**: [Padrões de autenticação e identidade gerida](docs/chapter-03-configuration/authsecurity.md) - Padrões de autenticação
- **📝 Exemplos**: [Exemplo App Base de Dados](examples/database-app/README.md) - Exemplos AZD para bases de dados

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

#### O que irá aprender
- Padrões avançados de implementação
- Infraestrutura como Código com Bicep
- Estratégias de provisionamento de recursos

#### Recursos de Aprendizagem
- **📖 Implementação**: [Guia de Implementação](docs/chapter-04-infrastructure/deployment-guide.md) - Workflows completos
- **🏗️ Provisionamento**: [Provisionamento de Recursos](docs/chapter-04-infrastructure/provisioning.md) - Gestão de recursos Azure
- **📝 Exemplos**: [Exemplo Container App](../../examples/container-app) - Implementações conteinerizadas

#### Exercícios Práticos
- Criar templates Bicep personalizados
- Implementar aplicações multi-serviço
- Implementar estratégias blue-green de implementação

**💡 Resultado do Capítulo**: Implementar aplicações multi-serviço complexas usando templates de infraestrutura personalizados

---


### 🎯 Capítulo 5: Soluções de IA Multi-Agente (Avançado)
**Pré-requisitos**: Capítulos 1-2 concluídos  
**Duração**: 2-3 horas  
**Complexidade**: ⭐⭐⭐⭐

#### O que irá aprender
- Padrões de arquitetura multi-agente
- Orquestração e coordenação de agentes
- Implementações de IA prontas para produção

#### Recursos de Aprendizagem
- **🤖 Projeto em Destaque**: [Solução Multi-Agente para Retail](examples/retail-scenario.md) - Implementação completa
- **🛠️ Modelos ARM**: [Pacote de Modelos ARM](../../examples/retail-multiagent-arm-template) - Implementação com um clique
- **📖 Arquitetura**: [Padrões de coordenação multi-agente](docs/chapter-06-pre-deployment/coordination-patterns.md) - Padrões

#### Exercícios Práticos
```bash
# Desplegar a solução completa multiagente para retalho
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explorar configurações de agentes
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Objetivo do Capítulo**: Implementar e gerir uma solução de IA multi-agente pronta para produção com agentes de Cliente e Inventário

---

### 🔍 Capítulo 6: Validação & Planeamento Pré-Implementação
**Pré-requisitos**: Capítulo 4 concluído  
**Duração**: 1 hora  
**Complexidade**: ⭐⭐

#### O que irá aprender
- Planeamento de capacidade e validação de recursos
- Estratégias de seleção de SKU
- Verificações pré-implementação e automação

#### Recursos de Aprendizagem
- **📊 Planeamento**: [Planeamento de Capacidade](docs/chapter-06-pre-deployment/capacity-planning.md) - Validação de recursos
- **💰 Seleção**: [Seleção de SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Escolhas económicas
- **✅ Validação**: [Verificações Pré-Implementação](docs/chapter-06-pre-deployment/preflight-checks.md) - Scripts automatizados

#### Exercícios Práticos
- Executar scripts de validação de capacidade
- Otimizar seleções de SKU para custo
- Implementar verificações pré-implementação automatizadas

**💡 Objetivo do Capítulo**: Validar e otimizar implementações antes da execução

---

### 🚨 Capítulo 7: Resolução de Problemas & Debugging
**Pré-requisitos**: Qualquer capítulo de implementação concluído  
**Duração**: 1-1.5 horas  
**Complexidade**: ⭐⭐

#### O que irá aprender
- Métodos sistemáticos de debugging
- Problemas comuns e soluções
- Resolução de problemas específica para IA

#### Recursos de Aprendizagem
- **🔧 Problemas Comuns**: [Problemas Comuns](docs/chapter-07-troubleshooting/common-issues.md) - FAQ e soluções
- **🕵️ Debugging**: [Guia de Debugging](docs/chapter-07-troubleshooting/debugging.md) - Estratégias passo a passo
- **🤖 Problemas de IA**: [Resolução de Problemas em IA](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problemas nos serviços de IA

#### Exercícios Práticos
- Diagnosticar falhas de implementação
- Resolver problemas de autenticação
- Debugging da conectividade de serviços de IA

**💡 Objetivo do Capítulo**: Diagnosticar e resolver de forma independente problemas comuns de implementação

---

### 🏢 Capítulo 8: Padrões de Produção & Empresariais
**Pré-requisitos**: Capítulos 1-4 concluídos  
**Duração**: 2-3 horas  
**Complexidade**: ⭐⭐⭐⭐

#### O que irá aprender
- Estratégias de implementação em produção
- Padrões de segurança empresarial
- Monitorização e otimização de custos

#### Recursos de Aprendizagem
- **🏭 Produção**: [Melhores Práticas de IA em Produção](docs/chapter-08-production/production-ai-practices.md) - Padrões empresariais
- **📝 Exemplos**: [Exemplo de Microserviços](../../examples/microservices) - Arquiteturas complexas
- **📊 Monitorização**: [Integração Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Monitorização

#### Exercícios Práticos
- Implementar padrões de segurança empresarial
- Configurar monitorização abrangente
- Implementar em produção com governança adequada

**💡 Objetivo do Capítulo**: Implementar aplicações empresariais prontas para produção com todas as capacidades produtivas

---

## 🎓 Visão Geral do Workshop: Experiência Prática

> **⚠️ ESTADO DO WORKSHOP: Desenvolvimento Ativo**  
> Os materiais do workshop estão atualmente em desenvolvimento e aperfeiçoamento. Os módulos principais estão funcionais, mas algumas secções avançadas estão incompletas. Estamos ativamente a trabalhar para concluir todo o conteúdo. [Acompanhe o progresso →](workshop/README.md)

### Materiais Interativos do Workshop
**Aprendizagem prática abrangente com ferramentas baseadas no navegador e exercícios guiados**

Os materiais do workshop fornecem uma experiência de aprendizagem estruturada e interativa que complementa o currículo baseado em capítulos acima. O workshop é desenhado para aprendizagem autónoma e sessões guiadas por instrutor.

#### 🛠️ Características do Workshop
- **Interface Baseada no Navegador**: Workshop completo alimentado por MkDocs com funcionalidades de pesquisa, cópia e temas
- **Integração GitHub Codespaces**: Configuração do ambiente de desenvolvimento com um clique
- **Caminho de Aprendizagem Estruturado**: Exercícios guiados em 8 módulos (3-4 horas no total)
- **Metodologia Progressiva**: Introdução → Seleção → Validação → Desconstrução → Configuração → Personalização → Desmontagem → Conclusão
- **Ambiente DevContainer Interativo**: Ferramentas e dependências pré-configuradas

#### 📚 Estrutura dos Módulos do Workshop
O workshop segue uma **metodologia progressiva em 8 módulos** que o leva da descoberta até à mestria na implementação:

| Módulo | Tema | O que irá fazer | Duração |
|--------|-------|----------------|----------|
| **0. Introdução** | Visão Geral do Workshop | Compreender os objetivos, pré-requisitos e estrutura do workshop | 15 min |
| **1. Seleção** | Descoberta de Modelos | Explorar modelos AZD e selecionar o template de IA certo para o seu cenário | 20 min |
| **2. Validação** | Implementar & Verificar | Implementar o template com `azd up` e validar funcionamento da infraestrutura | 30 min |
| **3. Desconstrução** | Compreender a Estrutura | Usar GitHub Copilot para explorar arquitetura do template, ficheiros Bicep e organização do código | 30 min |
| **4. Configuração** | Imersão no azure.yaml | Dominar configuração `azure.yaml`, ganchos de ciclo de vida e variáveis de ambiente | 30 min |
| **5. Personalização** | Torne-o Seu | Ativar Pesquisa IA, tracing, avaliação e personalizar para o seu cenário | 45 min |
| **6. Desmontagem** | Limpar | Desprovisionar recursos com segurança usando `azd down --purge` | 15 min |
| **7. Conclusão** | Próximos Passos | Rever realizações, conceitos-chave, e continuar a sua jornada de aprendizagem | 15 min |

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

#### 🎯 Resultados de Aprendizagem do Workshop
Ao concluir o workshop, os participantes irão:
- **Implementar Aplicações AI em Produção**: Usar AZD com serviços Microsoft Foundry
- **Dominar Arquiteturas Multi-Agente**: Implementar soluções coordenadas de agentes de IA
- **Aplicar Melhores Práticas de Segurança**: Configurar autenticação e controlo de acesso
- **Otimizar para Escalabilidade**: Projetar implementações económicas e de alto desempenho
- **Resolver Problemas de Implementação**: Diagnosticar e resolver problemas comuns de forma autónoma

#### 📖 Recursos do Workshop
- **🎥 Guia Interativo**: [Materiais do Workshop](workshop/README.md) - Ambiente de aprendizagem baseado no navegador
- **📋 Instruções Módulo a Módulo**:
  - [0. Introdução](workshop/docs/instructions/0-Introduction.md) - Visão geral e objetivos do workshop
  - [1. Seleção](workshop/docs/instructions/1-Select-AI-Template.md) - Encontrar e selecionar templates IA
  - [2. Validação](workshop/docs/instructions/2-Validate-AI-Template.md) - Implementar e verificar templates
  - [3. Desconstrução](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Explorar arquitetura do template
  - [4. Configuração](workshop/docs/instructions/4-Configure-AI-Template.md) - Dominar azure.yaml
  - [5. Personalização](workshop/docs/instructions/5-Customize-AI-Template.md) - Personalizar para o seu cenário
  - [6. Desmontagem](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Limpar recursos
  - [7. Conclusão](workshop/docs/instructions/7-Wrap-up.md) - Revisão e próximos passos
- **🛠️ Laboratório de IA do Workshop**: [Laboratório de IA](docs/chapter-02-ai-development/ai-workshop-lab.md) - Exercícios focados em IA
- **💡 Arranque Rápido**: [Guia de Configuração do Workshop](workshop/README.md#quick-start) - Configuração do ambiente

**Ideal para**: Formação corporativa, cursos universitários, aprendizagem autodirigida e bootcamps para programadores.

---

## 📖 Imersão Profunda: Capacidades do AZD

Para além do básico, o AZD oferece funcionalidades poderosas para implementações em produção:

- **Implementações baseadas em templates** - Use templates pré-construídos para padrões comuns de aplicação
- **Infraestrutura como Código** - Gerir recursos Azure usando Bicep ou Terraform  
- **Fluxos de trabalho integrados** - Provisione, implemente e monitorize aplicações sem esforço
- **Amigo do desenvolvedor** - Otimizado para produtividade e experiência do desenvolvedor

### **AZD + Microsoft Foundry: Perfeito para Implementações de IA**

**Por que AZD para Soluções de IA?** AZD resolve os principais desafios que os desenvolvedores de IA enfrentam:

- **Templates Preparados para IA** - Templates pré-configurados para modelos Microsoft Foundry, Serviços Azure AI e cargas ML
- **Implementações Seguras de IA** - Padrões de segurança embutidos para serviços IA, chaves API e endpoints de modelos  
- **Padrões de IA para Produção** - Melhores práticas para implementações escaláveis e económicas de aplicações IA
- **Fluxos de trabalho AI de ponta a ponta** - Desde o desenvolvimento de modelos à implementação em produção com monitorização adequada
- **Otimização de Custos** - Estratégias inteligentes de alocação e escalamento de recursos para cargas IA
- **Integração Microsoft Foundry** - Ligação direta ao catálogo e endpoints de modelos Microsoft Foundry

---

## 🎯 Biblioteca de Templates & Exemplos

### Em Destaque: Templates Microsoft Foundry
**Comece aqui se vai implementar aplicações de IA!**

> **Nota:** Estes templates demonstram vários padrões de IA. Alguns são Azure Samples externos, outros são implementações locais.

| Template | Capítulo | Complexidade | Serviços | Tipo |
|----------|---------|------------|----------|------|
| [**Inicie com chat IA**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capítulo 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Externo |
| [**Inicie com agentes IA**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Capítulo 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Externo |
| [**Demo Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capítulo 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Externo |
| [**Arranque rápido OpenAI Chat App**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capítulo 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Externo |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capítulo 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Externo |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Capítulo 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Externo |
| [**Solução Multi-Agente Retail**](examples/retail-scenario.md) | Capítulo 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Local** |

### Em Destaque: Cenários Completos de Aprendizagem
**Templates de aplicações prontos para produção mapeados para capítulos de aprendizagem**

| Template | Capítulo de Aprendizagem | Complexidade | Aprendizagem Chave |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capítulo 2 | ⭐ | Padrões básicos de implementação IA |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capítulo 2 | ⭐⭐ | Implementação RAG com Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Capítulo 4 | ⭐⭐ | Integração de Inteligência de Documentos |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capítulo 5 | ⭐⭐⭐ | Framework de agentes e chamadas de funções |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Capítulo 8 | ⭐⭐⭐ | Orquestração IA empresarial |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Capítulo 5 | ⭐⭐⭐⭐ | Arquitetura multi-agente com agentes Cliente e Inventário |

### Aprender pelo Tipo de Exemplo

> **📌 Exemplos Locais vs. Externos:**  
> **Exemplos Locais** (neste repositório) = Prontos a usar imediatamente  
> **Exemplos Externos** (Azure Samples) = Clonar dos repositórios indicados

#### Exemplos Locais (Prontos a Usar)
- [**Solução Multi-Agente Retail**](examples/retail-scenario.md) - Implementação completa pronta para produção com templates ARM
  - Arquitetura multi-agente (agentes Cliente + Inventário)
  - Monitorização e avaliação abrangentes
  - Implementação com um clique via template ARM

#### Exemplos Locais - Aplicações em Containers (Capítulos 2-5)
**Exemplos abrangentes de implementação em containers neste repositório:**

- [**Exemplos de Aplicações Container**](examples/container-app/README.md) - Guia completo para implementações conteinerizadas
  - [API Flask Simples](../../examples/container-app/simple-flask-api) - API REST básica com escala para zero
  - [Arquitetura de Microserviços](../../examples/container-app/microservices) - Implementação multi-serviço pronta para produção
  - Padrões de implementação Início Rápido, Produção e Avançado
  - Orientação para monitorização, segurança e otimização de custos

#### Exemplos Externos - Aplicações Simples (Capítulos 1-2)
**Clone estes repositórios de Amostras Azure para começar:**
- [Aplicação Web Simples - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Padrões básicos de implementação
- [Website Estático - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Implementação de conteúdo estático
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Implementação de API REST

#### Exemplos Externos - Integração com Base de Dados (Capítulos 3-4)  
- [Aplicação Base de Dados - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Padrões de conectividade a base de dados
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Workflow de dados sem servidor

#### Exemplos Externos - Padrões Avançados (Capítulos 4-8)
- [Microserviços Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - Arquiteturas multi-serviço
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Processamento em segundo plano  
- [Pipeline ML Empresarial](https://github.com/Azure-Samples/mlops-v2) - Padrões ML prontos para produção

### Coleções Externas de Modelos
- [**Galeria Oficial de Modelos AZD**](https://azure.github.io/awesome-azd/) - Coleção selecionada de modelos oficiais e da comunidade
- [**Modelos Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Documentação oficial dos modelos Microsoft Learn
- [**Diretório de Exemplos**](examples/README.md) - Exemplos locais de aprendizado com explicações detalhadas

---

## 📚 Recursos de Aprendizagem & Referências

### Referências Rápidas
- [**Folha de Comandos**](resources/cheat-sheet.md) - Comandos essenciais azd organizados por capítulo
- [**Glossário**](resources/glossary.md) - Terminologia Azure e azd  
- [**FAQ**](resources/faq.md) - Perguntas frequentes organizadas por capítulo de aprendizagem
- [**Guia de Estudo**](resources/study-guide.md) - Exercícios práticos abrangentes

### Workshops Práticos
- [**Workshop AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Torne as suas soluções AI implementáveis com AZD (2-3 horas)
- [**Workshop Interativo**](workshop/README.md) - Exercícios guiados em 8 módulos com MkDocs e GitHub Codespaces
  - Sequência: Introdução → Seleção → Validação → Desconstrução → Configuração → Personalização → Desmontagem → Conclusão

### Recursos Externos de Aprendizagem
- [Documentação Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centro de Arquitetura Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Calculadora de Preços Azure](https://azure.microsoft.com/pricing/calculator/)
- [Status do Azure](https://status.azure.com/)

### Competências de Agente AI para o Seu Editor
- [**Microsoft Azure Skills em skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 competências abertas de agente para Azure AI, Foundry, implementação, diagnóstico, otimização de custos e mais. Instale-as no GitHub Copilot, Cursor, Claude Code, ou em qualquer agente suportado:
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
<summary><strong>❌ "Nenhuma subscrição encontrada" ou "Subscrição não definida"</strong></summary>

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
<summary><strong>❌ "Quota Insuficiente" ou "Quota excedida"</strong></summary>

```bash
# Tente uma região Azure diferente
azd env set AZURE_LOCATION "westus2"
azd up

# Ou use SKUs mais pequenos no desenvolvimento
# Edite infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" falha a meio</strong></summary>

```bash
# Opção 1: Limpar e tentar novamente
azd down --force --purge
azd up

# Opção 2: Apenas corrigir a infraestrutura
azd provision

# Opção 3: Verificar estado detalhado
azd show

# Opção 4: Consultar logs no Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Falha na autenticação" ou "Token expirado"</strong></summary>

```bash
# Reautenticar para AZD
azd auth logout
azd auth login

# Opcional: atualizar também o Azure CLI se estiver a executar comandos az
az logout
az login

# Verificar a autenticação
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
<summary><strong>❌ Implementação do modelo a demorar demasiado</strong></summary>

**Tempos de espera normais:**
- Aplicação web simples: 5-10 minutos
- Aplicação com base de dados: 10-15 minutos
- Aplicações AI: 15-25 minutos (provisionamento OpenAI é lento)

```bash
# Verificar progresso
azd show

# Se bloqueado >30 minutos, verificar o Azure Portal:
azd monitor --overview
# Procurar implantações falhadas
```
</details>

<details>
<summary><strong>❌ "Permissão negada" ou "Proibido"</strong></summary>

```bash
# Verifique o seu papel no Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Precisa pelo menos do papel de "Colaborador"
# Peça ao administrador do Azure para conceder:
# - Colaborador (para recursos)
# - Administrador de Acesso do Utilizador (para atribuições de papéis)
```
</details>

<details>
<summary><strong>❌ Não consegue encontrar a URL da aplicação implementada</strong></summary>

```bash
# Mostrar todos os pontos finais do serviço
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
- **Guia de Depuração:** [Depuração passo a passo](docs/chapter-07-troubleshooting/debugging.md)
- **Obter Ajuda:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Conclusão do Curso & Certificação

### Monitorização de Progresso
Acompanhe seu progresso de aprendizagem através de cada capítulo:

- [ ] **Capítulo 1**: Fundamentos & Início Rápido ✅
- [ ] **Capítulo 2**: Desenvolvimento AI-First ✅  
- [ ] **Capítulo 3**: Configuração & Autenticação ✅
- [ ] **Capítulo 4**: Infraestrutura como Código & Implementação ✅
- [ ] **Capítulo 5**: Soluções Multi-Agente AI ✅
- [ ] **Capítulo 6**: Validação & Planeamento Pré-Implementação ✅
- [ ] **Capítulo 7**: Resolução de Problemas & Depuração ✅
- [ ] **Capítulo 8**: Padrões de Produção & Empresariais ✅

### Verificação de Aprendizagem
Após concluir cada capítulo, verifique seu conhecimento por:
1. **Exercício Prático**: Complete a implementação prática do capítulo
2. **Teste de Conhecimento**: Reveja a seção FAQ do seu capítulo
3. **Discussão Comunitária**: Partilhe sua experiência no Azure Discord
4. **Próximo Capítulo**: Avance para o próximo nível de complexidade

### Benefícios pela Conclusão do Curso
Ao completar todos os capítulos, você terá:
- **Experiência de Produção**: Aplicações AI reais implementadas no Azure
- **Competências Profissionais**: Capacidades de implementação para ambientes empresariais  
- **Reconhecimento Comunitário**: Membro ativo da comunidade de desenvolvedores Azure
- **Avanço na Carreira**: Especialização requisitada em AZD e implementação AI

---

## 🤝 Comunidade & Suporte

### Obter Ajuda & Suporte
- **Problemas Técnicos**: [Reportar bugs e pedir funcionalidades](https://github.com/microsoft/azd-for-beginners/issues)
- **Dúvidas de Aprendizagem**: [Comunidade Microsoft Azure no Discord](https://discord.gg/microsoft-azure) e [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Ajuda Específica AI**: Junte-se ao [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentação**: [Documentação oficial Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Insights da Comunidade do Microsoft Foundry Discord

**Resultados recentes da sondagem no canal #Azure:**
- **45%** dos desenvolvedores querem usar AZD para cargas de trabalho AI
- **Principais desafios**: Implementações multi-serviço, gestão de credenciais, prontidão para produção  
- **Mais pedidos**: Modelos específicos AI, guias de resolução, melhores práticas

**Junte-se à nossa comunidade para:**
- Partilhar suas experiências AZD + AI e obter ajuda
- Aceder a pré-visualizações antecipadas de novos modelos AI
- Contribuir para as melhores práticas em implementação AI
- Influenciar o desenvolvimento futuro de funcionalidades AI + AZD

### Contribuir para o Curso
Agradecemos contribuições! Por favor leia o nosso [Guia de Contribuição](CONTRIBUTING.md) para detalhes sobre:
- **Melhorias de Conteúdo**: Aprimorar capítulos e exemplos existentes
- **Novos Exemplos**: Adicionar cenários e modelos do mundo real  
- **Tradução**: Ajudar a manter o suporte multilíngue
- **Relatos de Bugs**: Melhorar a precisão e clareza
- **Normas Comunitárias**: Seguir as nossas diretrizes inclusivas

---

## 📄 Informações do Curso

### Licença
Este projeto está licenciado sob a Licença MIT - veja o ficheiro [LICENSE](../../LICENSE) para detalhes.

### Recursos Relacionados Microsoft Learn

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
 
### Série AI Generativa
[![AI Generativa para Iniciantes](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Generativa (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![AI Generativa (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)

[![IA Generativa (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Aprendizagem Principal
[![ML para Principiantes](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Ciência de Dados para Principiantes](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![IA para Principiantes](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cibersegurança para Principiantes](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Desenvolvimento Web para Principiantes](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT para Principiantes](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Desenvolvimento XR para Principiantes](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Série Copilot
[![Copilot para Programação em Parelha com IA](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot para C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Aventura Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navegação do Curso

**🚀 Pronto para Começar a Aprender?**

**Iniciantes**: Comece com [Capítulo 1: Fundação & Início Rápido](#-chapter-1-foundation--quick-start)  
**Desenvolvedores de IA**: Avance para [Capítulo 2: Desenvolvimento AI-First](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Desenvolvedores Experientes**: Comece com [Capítulo 3: Configuração & Autenticação](#️-chapter-3-configuration--authentication)

**Próximos Passos**: [Começar Capítulo 1 - Noções Básicas de AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->