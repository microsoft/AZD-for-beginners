# Changelog - AZD For Beginners

## Introdução

Este changelog documenta todas as alterações, atualizações e melhorias notáveis no repositório AZD For Beginners. Seguimos os princípios de versionamento semântico e mantemos este registro para ajudar os usuários a entender o que mudou entre as versões.

## Objetivos de Aprendizagem

Ao revisar este changelog, você irá:
- Manter-se informado sobre novos recursos e adições de conteúdo
- Entender as melhorias feitas na documentação existente
- Acompanhar correções de bugs e correções para garantir precisão
- Seguir a evolução dos materiais de aprendizagem ao longo do tempo

## Resultados de Aprendizagem

Após revisar as entradas do changelog, você será capaz de:
- Identificar novos conteúdos e recursos disponíveis para aprendizado
- Entender quais seções foram atualizadas ou aprimoradas
- Planejar seu caminho de aprendizado com base nos materiais mais atuais
- Contribuir com feedback e sugestões para melhorias futuras

## Histórico de Versões

### [v3.17.0] - 2026-02-05

#### Course Navigation Enhancement
**This version improves README.md chapter navigation with an enhanced table format.**

#### Changed
- **Course Map Table**: Melhorada com links diretos para as lições, estimativas de duração e classificações de complexidade
- **Folder Cleanup**: Removidas pastas antigas redundantes (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link Validation**: Todos os 21+ links internos na tabela Course Map verificados

### [v3.16.0] - 2026-02-05

#### Product Name Updates
**This version updates product references to current Microsoft branding.**

#### Changed
- **Azure AI Foundry → Microsoft Foundry**: Todas as referências atualizadas em arquivos não de tradução
- **Azure AI Agent Service → Foundry Agents**: Nome do serviço atualizado para refletir a marca atual

#### Files Updated
- `README.md` - Página principal do curso
- `changelog.md` - Histórico de versões
- `course-outline.md` - Estrutura do curso
- `docs/chapter-02-ai-development/agents.md` - Guia de agentes de IA
- `examples/README.md` - Documentação de exemplos
- `workshop/README.md` - Página inicial do workshop
- `workshop/docs/index.md` - Índice do workshop
- `workshop/docs/instructions/*.md` - Todos os arquivos de instruções do workshop

---

### [v3.15.0] - 2026-02-05

#### Major Repository Restructuring: Chapter-Based Folder Names
**This version restructures the documentation into dedicated chapter folders for clearer navigation.**

#### Folder Renames
Old folders have been replaced with chapter-numbered folders:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

#### File Migrations
| Arquivo | From | To |
|------|------|---|
| azd-basics.md | getting-started/ | chapter-01-foundation/ |
| installation.md | getting-started/ | chapter-01-foundation/ |
| first-project.md | getting-started/ | chapter-01-foundation/ |
| configuration.md | getting-started/ | chapter-03-configuration/ |
| authsecurity.md | getting-started/ | chapter-03-configuration/ |
| microsoft-foundry-integration.md | microsoft-foundry/ | chapter-02-ai-development/ |
| agents.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-model-deployment.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-workshop-lab.md | microsoft-foundry/ | chapter-02-ai-development/ |
| production-ai-practices.md | microsoft-foundry/ | chapter-08-production/ |
| deployment-guide.md | deployment/ | chapter-04-infrastructure/ |
| provisioning.md | deployment/ | chapter-04-infrastructure/ |
| All pre-deployment files | pre-deployment/ | chapter-06-pre-deployment/ |
| All troubleshooting files | troubleshooting/ | chapter-07-troubleshooting/ |

#### Added
- **📚 Chapter README files**: Criados README.md em cada pasta de capítulo com:
  - Objetivos de aprendizagem e duração
  - Tabela de lições com descrições
  - Comandos de início rápido
  - Navegação para outros capítulos

#### Changed
- **🔗 Updated all internal links**: 78+ caminhos atualizados em todos os arquivos de documentação
- **🗺️ Main README.md**: Atualizado Course Map com a nova estrutura de capítulos
- **📝 examples/README.md**: Atualizadas referências cruzadas para pastas de capítulos

#### Removed
- Old folder structure (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repository Restructuring: Chapter Navigation
**This version added chapter navigation README files (superseded by v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### New AI Agents Guide
**This version adds a comprehensive guide for deploying AI agents with Azure Developer CLI.**

#### Added
- **🤖 docs/microsoft-foundry/agents.md**: Guia completo cobrindo:
  - O que são agentes de IA e como eles diferem de chatbots
  - Três templates de quick-start para agentes (Foundry Agents, Prompty, RAG)
  - Padrões de arquitetura de agentes (agente único, RAG, multi-agente)
  - Configuração e personalização de ferramentas
  - Monitoramento e acompanhamento de métricas
  - Considerações de custo e otimização
  - Cenários comuns de resolução de problemas
  - Três exercícios práticos com critérios de sucesso

#### Content Structure
- **Introduction**: Conceitos de agentes para iniciantes
- **Quick Start**: Deploy de agentes com `azd init --template get-started-with-ai-agents`
- **Architecture Patterns**: Diagramas visuais de padrões de agentes
- **Configuration**: Configuração de ferramentas e variáveis de ambiente
- **Monitoring**: Integração com Application Insights
- **Exercises**: Aprendizado prático progressivo (20-45 minutos cada)

---

### [v3.12.0] - 2026-02-05

#### DevContainer Environment Update
**This version updates the development container configuration with modern tools and better defaults for the AZD learning experience.**

#### Changed
- **🐳 Base Image**: Atualizada de `python:3.12-bullseye` para `python:3.12-bookworm` (última stable do Debian)
- **📛 Container Name**: Renomeado de "Python 3" para "AZD for Beginners" para maior clareza

#### Added
- **🔧 New Dev Container Features**:
  - `azure-cli` com suporte a Bicep habilitado
  - `node:20` (versão LTS para templates AZD)
  - `github-cli` para gerenciamento de templates
  - `docker-in-docker` para deploys de container apps

- **🔌 Port Forwarding**: Portas pré-configuradas para desenvolvimento comum:
  - 8000 (visualização MkDocs)
  - 3000 (web apps)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 New VS Code Extensions**:
  - `ms-python.vscode-pylance` - IntelliSense melhorado para Python
  - `ms-azuretools.vscode-azurefunctions` - Suporte a Azure Functions
  - `ms-azuretools.vscode-docker` - Suporte a Docker
  - `ms-azuretools.vscode-bicep` - Suporte à linguagem Bicep
  - `ms-azure-devtools.azure-resource-groups` - Gerenciamento de recursos Azure
  - `yzhang.markdown-all-in-one` - Edição de Markdown
  - `DavidAnson.vscode-markdownlint` - Linting de Markdown
  - `bierner.markdown-mermaid` - Suporte a diagramas Mermaid
  - `redhat.vscode-yaml` - Suporte a YAML (para azure.yaml)
  - `eamodio.gitlens` - Visualização de Git
  - `mhutchie.git-graph` - Histórico do Git

- **⚙️ VS Code Settings**: Adicionadas configurações padrão para interpretador Python, format on save e remoção de espaços em branco

- **📦 Updated requirements-dev.txt**:
  - Adicionado plugin MkDocs minify
  - Adicionado pre-commit para qualidade de código
  - Adicionados pacotes do Azure SDK (azure-identity, azure-mgmt-resource)

#### Fixed
- **Post-Create Command**: Agora verifica a instalação do AZD e do Azure CLI na inicialização do container

---

### [v3.11.0] - 2026-02-05

#### Beginner-Friendly README Overhaul
**This version significantly improves the README.md to be more accessible for beginners and adds essential resources for AI developers.**

#### Added
- **🆚 Azure CLI vs AZD Comparison**: Explicação clara de quando usar cada ferramenta com exemplos práticos
- **🌟 Awesome AZD Links**: Links diretos para galeria de templates da comunidade e recursos de contribuição:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ ready-to-deploy templates
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Community contribution
- **🎯 Quick Start Guide**: Seção de início rápido simplificada em 3 passos (Instalar → Login → Deploy)
- **📊 Experience-Based Navigation Table**: Orientação clara sobre onde começar com base na experiência do desenvolvedor

#### Changed
- **README Structure**: Reorganizado para disclosure progressivo - informações-chave primeiro
- **Introduction Section**: Reescrita para explicar "The Magic of `azd up`" para iniciantes completos
- **Removed Duplicate Content**: Eliminada seção de troubleshooting duplicada
- **Troubleshooting Commands**: Corrigida referência `azd logs` para usar o válido `azd monitor --logs`

#### Fixed
- **🔐 Authentication Commands**: Adicionados `azd auth login` e `azd auth logout` em cheat-sheet.md
- **Invalid Command References**: Removido `azd logs` restante da seção de troubleshooting do README

#### Notes
- **Scope**: Alterações aplicadas ao README.md principal e resources/cheat-sheet.md
- **Target Audience**: Melhorias direcionadas especificamente a desenvolvedores novos no AZD

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI Command Accuracy Update
**This version corrects non-existent AZD commands throughout the documentation, ensuring all code examples use valid Azure Developer CLI syntax.**

#### Fixed
- **🔧 Non-Existent AZD Commands Removed**: Auditoria abrangente e correção de comandos inválidos:
  - `azd logs` (não existe) → substituído por `azd monitor --logs` ou alternativas do Azure CLI
  - `azd service` subcommands (não existem) → substituídos por `azd show` e Azure CLI
  - `azd infra import/export/validate` (não existem) → removidos ou substituídos por alternativas válidas
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flags (não existem) → removidos
  - `azd provision --what-if/--rollback` flags (não existem) → atualizados para usar `--preview`
  - `azd config validate` (não existe) → substituído por `azd config list`
  - `azd info`, `azd history`, `azd metrics` (não existem) → removidos

- **📚 Files Updated with Command Corrections**:
  - `resources/cheat-sheet.md`: Revisão majoritária da referência de comandos
  - `docs/deployment/deployment-guide.md`: Corrigidas estratégias de rollback e deploy
  - `docs/troubleshooting/debugging.md`: Corrigidas seções de análise de logs
  - `docs/troubleshooting/common-issues.md`: Atualizados comandos de troubleshooting
  - `docs/troubleshooting/ai-troubleshooting.md`: Corrigida seção de debugging do AZD
  - `docs/getting-started/azd-basics.md`: Corrigidos comandos de monitoramento
  - `docs/getting-started/first-project.md`: Atualizados exemplos de monitoramento e debugging
  - `docs/getting-started/installation.md`: Corrigidos exemplos de help e version
  - `docs/pre-deployment/application-insights.md`: Corrigidos comandos de visualização de logs
  - `docs/pre-deployment/coordination-patterns.md`: Corrigidos comandos de debugging de agentes

- **📝 Version Reference Updated**: 
  - `docs/getting-started/installation.md`: Alterada versão hardcoded `1.5.0` para genérica `1.x.x` com link para releases

#### Changed
- **Rollback Strategies**: Documentação atualizada para usar rollback baseado em Git (AZD não possui rollback nativo)
- **Log Viewing**: Referências a `azd logs` substituídas por `azd monitor --logs`, `azd monitor --live`, e comandos do Azure CLI
- **Performance Section**: Flags de deploy paralelas/incrementais inexistentes removidas; fornecidas alternativas válidas

#### Detalhes Técnicos
- **Comandos AZD Válidos**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Flags válidas do azd monitor**: `--live`, `--logs`, `--overview`
- **Recursos Removidos**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Observações
- **Verificação**: Comandos validados contra Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Conclusão do Workshop e Atualização da Qualidade da Documentação
**Esta versão conclui os módulos interativos do workshop, corrige todos os links quebrados da documentação e melhora a qualidade geral do conteúdo para desenvolvedores de IA que usam Microsoft AZD.**

#### Adicionado
- **📝 CONTRIBUTING.md**: Novo documento de diretrizes de contribuição com:
  - Instruções claras para reportar problemas e propor alterações
  - Padrões de documentação para novo conteúdo
  - Diretrizes de exemplos de código e convenções de mensagens de commit
  - Informações de engajamento da comunidade

#### Concluído
- **🎯 Workshop Module 7 (Encerramento)**: Módulo de encerramento totalmente concluído com:
  - Resumo abrangente das realizações do workshop
  - Seção de conceitos-chave dominados cobrindo AZD, templates e AI Foundry
  - Recomendações para continuação da jornada de aprendizado
  - Exercícios de desafio do workshop com classificações de dificuldade
  - Links de feedback da comunidade e suporte

- **📚 Workshop Module 3 (Desconstruir)**: Objetivos de aprendizado atualizados com:
  - Orientação para ativação do GitHub Copilot com servidores MCP
  - Entendimento da estrutura de pastas do template AZD
  - Padrões de organização de Infrastructure-as-Code (Bicep)
  - Instruções de laboratório prático

- **🔧 Workshop Module 6 (Desmontagem)**: Concluído com:
  - Objetivos de limpeza de recursos e gerenciamento de custos
  - Uso de `azd down` para desprovisionamento seguro da infraestrutura
  - Orientação para recuperação de serviços cognitivos em soft-delete
  - Sugestões de exploração bônus para GitHub Copilot e Azure Portal

#### Corrigido
- **🔗 Correção de Links Quebrados**: Resolvidos 15+ links internos da documentação:
  - `docs/ai-foundry/ai-model-deployment.md`: Fixed paths to microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Corrected ai-model-deployment.md and production-ai-practices.md paths
  - `docs/getting-started/first-project.md`: Replaced non-existent cicd-integration.md with deployment-guide.md
  - `examples/retail-scenario.md`: Fixed FAQ and troubleshooting guide paths
  - `examples/container-app/microservices/README.md`: Corrected course home and deployment guide paths
  - `resources/faq.md` and `resources/glossary.md`: Updated AI chapter references
  - `course-outline.md`: Fixed instructor guide and AI workshop lab references

- **📅 Banner de status do workshop**: Atualizado de "Under Construction" para status de workshop ativo com data de fevereiro de 2026

- **🔗 Navegação do Workshop**: Corrigidos links de navegação quebrados no README.md do workshop que apontavam para a pasta lab-1-azd-basics inexistente

#### Alterado
- **Apresentação do Workshop**: Removido o aviso 'under construction'; o workshop agora está completo e pronto para uso
- **Consistência de Navegação**: Garantido que todos os módulos do workshop tenham navegação inter-módulos adequada
- **Referências do Caminho de Aprendizagem**: Atualizadas as referências cruzadas dos capítulos para usar os caminhos corretos microsoft-foundry

#### Validado
- ✅ Todos os arquivos Markdown em inglês têm links internos válidos
- ✅ Módulos do workshop 0-7 estão completos com objetivos de aprendizado
- ✅ A navegação entre capítulos e módulos funciona corretamente
- ✅ O conteúdo é adequado para desenvolvedores de IA que usam Microsoft AZD
- ✅ Linguagem e estrutura amigáveis para iniciantes mantidas ao longo do material
- ✅ CONTRIBUTING.md fornece orientação clara para colaboradores da comunidade

#### Implementação Técnica
- **Validação de Links**: Script PowerShell automatizado verificou todos os links internos .md
- **Auditoria de Conteúdo**: Revisão manual da completude do workshop e adequação para iniciantes
- **Sistema de Navegação**: Padrões consistentes de navegação entre capítulos e módulos aplicados

#### Observações
- **Escopo**: Alterações aplicadas apenas à documentação em inglês
- **Traduções**: Pastas de tradução não foram atualizadas nesta versão (a tradução automatizada será sincronizada posteriormente)
- **Duração do Workshop**: O workshop completo agora oferece 3-4 horas de aprendizado prático

---

### [v3.8.0] - 2025-11-19

#### Documentação Avançada: Monitoramento, Segurança e Padrões de Multi-Agentes
**Esta versão adiciona aulas abrangentes de nível A sobre integração com Application Insights, padrões de autenticação e coordenação multi-agente para implantações de produção.**

#### Adicionado
- **📊 Aula de Integração com Application Insights**: em `docs/pre-deployment/application-insights.md`:
  - Implantação focada em AZD com provisionamento automático
  - Templates Bicep completos para Application Insights + Log Analytics
  - Aplicações Python funcionais com telemetria personalizada (1,200+ lines)
  - Padrões de monitoramento para AI/LLM (rastreamento de tokens/custos do Azure OpenAI)
  - 6 diagramas Mermaid (arquitetura, tracing distribuído, fluxo de telemetria)
  - 3 exercícios práticos (alertas, dashboards, monitoramento de IA)
  - Exemplos de consultas Kusto e estratégias de otimização de custos
  - Streaming de métricas ao vivo e depuração em tempo real
  - Tempo de aprendizado de 40-50 minutos com padrões prontos para produção

- **🔐 Aula de Padrões de Autenticação & Segurança**: em `docs/getting-started/authsecurity.md`:
  - 3 padrões de autenticação (connection strings, Key Vault, managed identity)
  - Templates de infraestrutura Bicep completos para implantações seguras
  - Código de aplicação Node.js com integração do Azure SDK
  - 3 exercícios completos (habilitar managed identity, identity atribuída a usuário, rotação do Key Vault)
  - Melhores práticas de segurança e configurações RBAC
  - Guia de solução de problemas e análise de custos
  - Padrões de autenticação sem senha prontos para produção

- **🤖 Aula de Padrões de Coordenação Multi-Agente**: em `docs/pre-deployment/coordination-patterns.md`:
  - 5 padrões de coordenação (sequencial, paralelo, hierárquico, orientado a eventos, consenso)
  - Implementação completa de serviço orquestrador (Python/Flask, 1,500+ lines)
  - 3 implementações especializadas de agentes (Research, Writer, Editor)
  - Integração com Service Bus para enfileiramento de mensagens
  - Gerenciamento de estado em Cosmos DB para sistemas distribuídos
  - 6 diagramas Mermaid mostrando interações entre agentes
  - 3 exercícios avançados (tratamento de timeout, lógica de retry, circuit breaker)
  - Quebra de custos ($240-565/month) com estratégias de otimização
  - Integração com Application Insights para monitoramento

#### Aprimorado
- **Capítulo Pré-implantação**: Agora inclui monitoramento abrangente e padrões de coordenação
- **Capítulo Getting Started**: Aprimorado com padrões profissionais de autenticação
- **Prontidão para Produção**: Cobertura completa de segurança à observabilidade
- **Esboço do Curso**: Atualizado para referenciar as novas aulas nos Capítulos 3 e 6

#### Alterado
- **Progressão de Aprendizado**: Melhor integração de segurança e monitoramento ao longo do curso
- **Qualidade da Documentação**: Padrões consistentes de nível A (95-97%) nas novas aulas
- **Padrões de Produção**: Cobertura completa de ponta a ponta para implantações empresariais

#### Melhorado
- **Experiência do Desenvolvedor**: Caminho claro do desenvolvimento ao monitoramento em produção
- **Padrões de Segurança**: Padrões profissionais para autenticação e gerenciamento de segredos
- **Observabilidade**: Integração completa do Application Insights com AZD
- **Workloads de IA**: Monitoramento especializado para Azure OpenAI e sistemas multi-agente

#### Validado
- ✅ Todas as aulas incluem código funcional completo (não apenas trechos)
- ✅ Diagramas Mermaid para aprendizado visual (19 no total nas 3 aulas)
- ✅ Exercícios práticos com etapas de verificação (9 no total)
- ✅ Templates Bicep prontos para produção implantáveis via `azd up`
- ✅ Análise de custos e estratégias de otimização
- ✅ Guias de solução de problemas e melhores práticas
- ✅ Pontos de verificação de conhecimento com comandos de verificação

#### Resultados da Avaliação da Documentação
- **docs/pre-deployment/application-insights.md**: - Guia de monitoramento abrangente
- **docs/getting-started/authsecurity.md**: - Padrões profissionais de segurança
- **docs/pre-deployment/coordination-patterns.md**: - Arquiteturas multi-agente avançadas
- **Novo Conteúdo Geral**: - Padrões consistentes de alta qualidade

#### Implementação Técnica
- **Application Insights**: Log Analytics + telemetria personalizada + tracing distribuído
- **Autenticação**: Managed Identity + Key Vault + padrões RBAC
- **Multi-Agente**: Service Bus + Cosmos DB + Container Apps + orquestração
- **Monitoramento**: Métricas ao vivo + consultas Kusto + alertas + dashboards
- **Gerenciamento de Custos**: Estratégias de amostragem, políticas de retenção, controles de orçamento

### [v3.7.0] - 2025-11-19

#### Melhorias na Qualidade da Documentação e Novo Exemplo Azure OpenAI
**Esta versão aprimora a qualidade da documentação em todo o repositório e adiciona um exemplo completo de implantação do Azure OpenAI com interface de chat GPT-4.**

#### Adicionado
- **🤖 Exemplo de Chat Azure OpenAI**: Implantação completa do GPT-4 com implementação funcional em `examples/azure-openai-chat/`:
  - Infraestrutura completa do Azure OpenAI (implantação do modelo GPT-4)
  - Interface de chat em linha de comando Python com histórico de conversas
  - Integração com Key Vault para armazenamento seguro de chaves de API
  - Rastreamento de uso de tokens e estimativa de custos
  - Limitação de taxa e tratamento de erros
  - README abrangente com guia de implantação de 35-45 minutos
  - 11 arquivos prontos para produção (templates Bicep, app Python, configuração)
- **📚 Exercícios de Documentação**: Adicionados exercícios práticos ao guia de configuração:
  - Exercício 1: Configuração multi-ambiente (15 minutos)
  - Exercício 2: Prática de gerenciamento de segredos (10 minutos)
  - Critérios claros de sucesso e etapas de verificação
- **✅ Verificação de Implantação**: Seção de verificação adicionada ao guia de implantação:
  - Procedimentos de health check
  - Checklist de critérios de sucesso
  - Saídas esperadas para todos os comandos de implantação
  - Referência rápida de solução de problemas

#### Aprimorado
- **examples/README.md**: Atualizado para qualidade A (93%):
  - Adicionado azure-openai-chat a todas as seções relevantes
  - Atualizado o número de exemplos locais de 3 para 4
  - Adicionado à tabela de Exemplos de Aplicações de IA
  - Integrado ao Quick Start para Usuários Intermediários
  - Adicionado à seção Microsoft Foundry Templates
  - Atualizada a Matriz de Comparação e seções de descoberta de tecnologia
- **Qualidade da Documentação**: Melhorada de B+ (87%) → A- (92%) na pasta docs:
  - Saídas esperadas adicionadas a exemplos críticos de comandos
  - Etapas de verificação incluídas para alterações de configuração
  - Aprendizado prático aprimorado com exercícios aplicáveis

#### Alterado
- **Progressão de Aprendizado**: Melhor integração de exemplos de IA para aprendizes intermediários
- **Estrutura da Documentação**: Exercícios mais acionáveis com resultados claros
- **Processo de Verificação**: Critérios de sucesso explícitos adicionados a fluxos de trabalho chave

#### Melhorado
- **Experiência do Desenvolvedor**: A implantação do Azure OpenAI agora leva 35-45 minutos (vs 60-90 para alternativas complexas)
- **Transparência de Custos**: Estimativas de custo claras ($50-200/month) para o exemplo Azure OpenAI
- **Caminho de Aprendizado**: Desenvolvedores de IA têm ponto de entrada claro com azure-openai-chat
- **Padrões de Documentação**: Saídas esperadas consistentes e etapas de verificação

#### Validado
- ✅ Exemplo Azure OpenAI totalmente funcional com `azd up`
- ✅ Todos os 11 arquivos de implementação sintaticamente corretos
- ✅ Instruções do README correspondem à experiência real de implantação
- ✅ Links de documentação atualizados em 8+ locais
- ✅ Índice de exemplos reflete com precisão 4 exemplos locais
- ✅ Nenhum link externo duplicado em tabelas
- ✅ Todas as referências de navegação corretas

#### Implementação Técnica
- **Arquitetura Azure OpenAI**: GPT-4 + Key Vault + padrão Container Apps
- **Segurança**: Managed Identity pronto, segredos no Key Vault
- **Monitoramento**: Integração com Application Insights
- **Gerenciamento de Custos**: Rastreamento de tokens e otimização de uso
- **Implantação**: Comando único `azd up` para configuração completa

### [v3.6.0] - 2025-11-19

#### Atualização Major: Exemplos de Implantação de Container App
**Esta versão introduz exemplos abrangentes e prontos para produção de implantação de aplicações containerizadas usando Azure Developer CLI (AZD), com documentação completa e integração na trilha de aprendizado.**

#### Adicionado
- **🚀 Exemplos de Container App**: Novos exemplos locais em `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Visão geral completa de implantações containerizadas, quick start, produção e padrões avançados
  - [Simple Flask API](../../examples/container-app/simple-flask-api): API REST para iniciantes com scale-to-zero, health probes, monitoramento e solução de problemas
  - [Microservices Architecture](../../examples/container-app/microservices): Implantação multi-serviço pronta para produção (API Gateway, Product, Order, User, Notification), mensageria assíncrona, Service Bus, Cosmos DB, Azure SQL, tracing distribuído, implantação blue-green/canary
- **Melhores Práticas**: Segurança, monitoramento, otimização de custos e orientação de CI/CD para workloads containerizados
- **Exemplos de Código**: `azure.yaml` completo, templates Bicep e implementações de serviços em múltiplas linguagens (Python, Node.js, C#, Go)
- **Testes & Solução de Problemas**: Cenários de teste end-to-end, comandos de monitoramento, orientação de troubleshooting

#### Alterado
- **README.md**: Atualizado para apresentar e linkar novos exemplos de container app em "Local Examples - Container Applications"
- **examples/README.md**: Atualizado para destacar exemplos de container app, adicionar entradas na matriz de comparação e atualizar referências de tecnologia/arquitetura
- **Course Outline & Study Guide**: Atualizado para referenciar novos exemplos de container apps e padrões de implantação nos capítulos relevantes

#### Validado
- ✅ Todos os novos exemplos implantáveis com `azd up` e seguem as melhores práticas
- ✅ Cross-links da documentação e navegação atualizados
- ✅ Exemplos abrangem cenários de iniciante a avançado, incluindo microsserviços em produção

#### Observações
- **Escopo**: Documentação e exemplos em inglês somente
- **Próximos Passos**: Expandir com padrões adicionais avançados de container e automação de CI/CD em futuras versões

### [v3.5.0] - 2025-11-19

#### Rebranding do Produto: Microsoft Foundry
**Esta versão implementa uma alteração abrangente do nome do produto de "Microsoft Foundry" para "Microsoft Foundry" em toda a documentação em inglês, refletindo o rebranding oficial da Microsoft.**

#### Alterado
- **🔄 Atualização do Nome do Produto**: Rebranding completo de "Microsoft Foundry" para "Microsoft Foundry"
  - Atualizadas todas as referências na documentação em inglês na pasta `docs/`
  - Pasta renomeada: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Arquivo renomeado: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 referências de conteúdo atualizadas em 7 arquivos de documentação

- **📁 Alterações na Estrutura de Pastas**:
  - `docs/ai-foundry/` renomeada para `docs/microsoft-foundry/`
  - Todas as referências cruzadas atualizadas para refletir a nova estrutura de pastas
  - Links de navegação validados em toda a documentação

- **📄 Renomeação de Arquivos**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Todos os links internos atualizados para referenciar o novo nome de arquivo

#### Arquivos Atualizados
- **Documentação do Capítulo** (7 arquivos):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 atualizações de links de navegação
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 referências ao nome do produto atualizadas
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Já utiliza Microsoft Foundry (de atualizações anteriores)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referências atualizadas (visão geral, feedback da comunidade, documentação)
  - `docs/getting-started/azd-basics.md` - 4 links de cross-reference atualizados
  - `docs/getting-started/first-project.md` - 2 links de navegação de capítulo atualizados
  - `docs/getting-started/installation.md` - 2 links do próximo capítulo atualizados
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referências atualizadas (navegação, comunidade Discord)
  - `docs/troubleshooting/common-issues.md` - 1 link de navegação atualizado
  - `docs/troubleshooting/debugging.md` - 1 link de navegação atualizado

- **Arquivos da Estrutura do Curso** (2 arquivos):
  - `README.md` - 17 referências atualizadas (visão geral do curso, títulos de capítulo, seção de templates, insights da comunidade)
  - `course-outline.md` - 14 referências atualizadas (visão geral, objetivos de aprendizagem, recursos do capítulo)

#### Validado
- ✅ Nenhuma referência restante ao caminho de pasta "ai-foundry" na documentação em inglês
- ✅ Nenhuma referência restante ao nome do produto "Microsoft Foundry" na documentação em inglês
- ✅ Todos os links de navegação funcionais com a nova estrutura de pastas
- ✅ Renomeações de arquivos e pastas concluídas com sucesso
- ✅ Cross-referências entre capítulos validadas

#### Observações
- **Escopo**: Alterações aplicadas apenas à documentação em inglês na pasta `docs/`
- **Traduções**: Pastas de tradução (`translations/`) não atualizadas nesta versão
- **Workshop**: Materiais do workshop (`workshop/`) não atualizados nesta versão
- **Exemplos**: Arquivos de exemplo ainda podem referenciar nomenclatura legada (a ser tratado em atualização futura)
- **Links Externos**: URLs externas e referências ao repositório GitHub permanecem inalteradas

#### Guia de Migração para Colaboradores
Se você tem branches locais ou documentação referenciando a estrutura antiga:
1. Atualize referências de pastas: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Atualize referências de arquivos: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Substitua o nome do produto: "Microsoft Foundry" → "Microsoft Foundry"
4. Valide se todos os links internos da documentação ainda funcionam

---

### [v3.4.0] - 2025-10-24

#### Aprimoramentos de Visualização e Validação de Infraestrutura
**Esta versão introduz suporte abrangente para o novo recurso de pré-visualização do Azure Developer CLI e aprimora a experiência do usuário no workshop.**

#### Adicionado
- **🧪 Documentação do Recurso azd provision --preview**: Cobertura completa da nova capacidade de pré-visualização de infraestrutura
  - Referência de comando e exemplos de uso no cheat sheet
  - Integração detalhada no guia de provisionamento com casos de uso e benefícios
  - Integração de verificação pré-voo para validação de implantação mais segura
  - Atualizações no guia de primeiros passos com práticas de implantação orientadas à segurança
- **🚧 Banner de Status do Workshop**: Banner HTML profissional indicando o status de desenvolvimento do workshop
  - Design em gradiente com indicadores de construção para comunicação clara ao usuário
  - Carimbo de data/hora da última atualização para transparência
  - Design responsivo para dispositivos móveis e todos os tipos de tela

#### Aprimorado
- **Segurança de Infraestrutura**: Funcionalidade de pré-visualização integrada em toda a documentação de implantação
- **Validação Pré-implantação**: Scripts automatizados agora incluem testes de pré-visualização de infraestrutura
- **Fluxo de Trabalho do Desenvolvedor**: Sequências de comandos atualizadas para incluir preview como melhor prática
- **Experiência do Workshop**: Expectativas claras definidas para usuários sobre o status de desenvolvimento do conteúdo

#### Alterado
- **Melhores Práticas de Implantação**: Fluxo de trabalho com preview-first agora recomendado
- **Fluxo da Documentação**: Validação de infraestrutura movida para mais cedo no processo de aprendizado
- **Apresentação do Workshop**: Comunicação profissional do status com cronograma de desenvolvimento claro

#### Melhorado
- **Abordagem Orientada à Segurança**: Alterações de infraestrutura podem agora ser validadas antes da implantação
- **Colaboração em Equipe**: Resultados da pré-visualização podem ser compartilhados para revisão e aprovação
- **Conscientização de Custos**: Melhor compreensão dos custos de recursos antes do provisionamento
- **Mitigação de Riscos**: Redução de falhas de implantação por meio de validação antecipada

#### Implementação Técnica
- **Integração Multidocumento**: Recurso de preview documentado em 4 arquivos principais
- **Padrões de Comando**: Sintaxe e exemplos consistentes em toda a documentação
- **Integração de Melhores Práticas**: Preview incluído em fluxos de validação e scripts
- **Indicadores Visuais**: Marcação clara de NOVO recurso para maior descobribilidade

#### Infraestrutura do Workshop
- **Comunicação de Status**: Banner HTML profissional com estilo em gradiente
- **Experiência do Usuário**: Status de desenvolvimento claro evita confusão
- **Apresentação Profissional**: Mantém a credibilidade do repositório enquanto define expectativas
- **Transparência do Cronograma**: Data de última atualização em outubro de 2025 para prestação de contas

### [v3.3.0] - 2025-09-24

#### Materiais de Workshop Aprimorados e Experiência de Aprendizado Interativa
**Esta versão introduz materiais completos de workshop com guias interativos baseados em navegador e trilhas de aprendizado estruturadas.**

#### Adicionado
- **🎥 Guia de Workshop Interativo**: Experiência de workshop baseada em navegador com capacidade de visualização MkDocs
- **📝 Instruções Estruturadas do Workshop**: Caminho de aprendizado guiado em 7 etapas, do descobrimento à customização
  - 0-Introduction: Visão geral do workshop e configuração
  - 1-Select-AI-Template: Descoberta e processo de seleção de templates
  - 2-Validate-AI-Template: Procedimentos de implantação e validação
  - 3-Deconstruct-AI-Template: Entendimento da arquitetura do template
  - 4-Configure-AI-Template: Configuração e personalização
  - 5-Customize-AI-Template: Modificações avançadas e iterações
  - 6-Teardown-Infrastructure: Limpeza e gerenciamento de recursos
  - 7-Wrap-up: Resumo e próximos passos
- **🛠️ Ferramentas do Workshop**: Configuração do MkDocs com o tema Material para experiência de aprendizado aprimorada
- **🎯 Caminho de Aprendizado Prático**: Metodologia de 3 etapas (Discovery → Deployment → Customization)
- **📱 Integração com GitHub Codespaces**: Configuração integrada do ambiente de desenvolvimento

#### Aprimorado
- **Laboratório de Workshop de IA**: Estendido com experiência de aprendizado estruturada de 2-3 horas
- **Documentação do Workshop**: Apresentação profissional com navegação e recursos visuais
- **Progressão de Aprendizado**: Orientação passo a passo clara da seleção do template até a implantação em produção
- **Experiência do Desenvolvedor**: Ferramentas integradas para fluxos de trabalho de desenvolvimento simplificados

#### Melhorado
- **Acessibilidade**: Interface baseada em navegador com pesquisa, funcionalidade de copiar e alternância de tema
- **Aprendizado Autodirigido**: Estrutura flexível do workshop acomodando diferentes ritmos de aprendizado
- **Aplicação Prática**: Cenários reais de implantação de templates de IA
- **Integração Comunitária**: Integração com Discord para suporte e colaboração do workshop

#### Recursos do Workshop
- **Pesquisa Integrada**: Descoberta rápida por palavra-chave e lição
- **Copiar Blocos de Código**: Funcionalidade de passar o mouse para copiar para todos os exemplos de código
- **Alternância de Tema**: Suporte a modo escuro/claro para diferentes preferências
- **Ativos Visuais**: Capturas de tela e diagramas para melhor compreensão
- **Integração de Ajuda**: Acesso direto ao Discord para suporte da comunidade

### [v3.2.0] - 2025-09-17

#### Reestruturação Significativa da Navegação e Sistema de Aprendizado por Capítulos
**Esta versão introduz uma estrutura abrangente de aprendizado por capítulos com navegação aprimorada em todo o repositório.**

#### Adicionado
- **📚 Sistema de Aprendizado por Capítulos**: Reestruturou todo o curso em 8 capítulos de aprendizado progressivos
  - Capítulo 1: Fundamentos & Início Rápido (⭐ - 30-45 min)
  - Capítulo 2: Desenvolvimento com Foco em IA (⭐⭐ - 1-2 horas)
  - Capítulo 3: Configuração & Autenticação (⭐⭐ - 45-60 min)
  - Capítulo 4: Infraestrutura como Código & Implantação (⭐⭐⭐ - 1-1.5 horas)
  - Capítulo 5: Soluções de IA Multi-Agente (⭐⭐⭐⭐ - 2-3 horas)
  - Capítulo 6: Validação & Planejamento Pré-implantação (⭐⭐ - 1 hora)
  - Capítulo 7: Solução de Problemas & Depuração (⭐⭐ - 1-1.5 horas)
  - Capítulo 8: Padrões de Produção & Empresariais (⭐⭐⭐⭐ - 2-3 horas)
- **📚 Sistema de Navegação Abrangente**: Cabeçalhos e rodapés de navegação consistentes em toda a documentação
- **🎯 Rastreamento de Progresso**: Checklist de conclusão do curso e sistema de verificação de aprendizagem
- **🗺️ Orientação de Caminho de Aprendizado**: Pontos de entrada claros para diferentes níveis de experiência e objetivos
- **🔗 Navegação com Referências Cruzadas**: Capítulos relacionados e pré-requisitos claramente vinculados

#### Aprimorado
- **Estrutura do README**: Transformado em uma plataforma de aprendizado estruturada com organização por capítulos
- **Navegação da Documentação**: Cada página agora inclui contexto do capítulo e orientação de progressão
- **Organização de Templates**: Exemplos e templates mapeados para capítulos de aprendizado apropriados
- **Integração de Recursos**: Cheat sheets, FAQs e guias de estudo conectados aos capítulos relevantes
- **Integração do Workshop**: Laboratórios práticos mapeados a múltiplos objetivos de aprendizado por capítulo

#### Alterado
- **Progressão de Aprendizado**: Movida de documentação linear para aprendizado flexível por capítulos
- **Posicionamento de Configuração**: Guia de configuração reposicionado como Capítulo 3 para melhor fluxo de aprendizado
- **Integração de Conteúdo de IA**: Melhor integração de conteúdo específico de IA ao longo da jornada de aprendizado
- **Conteúdo de Produção**: Padrões avançados consolidados no Capítulo 8 para aprendizes empresariais

#### Melhorado
- **Experiência do Usuário**: Breadcrumbs de navegação claros e indicadores de progressão por capítulo
- **Acessibilidade**: Padrões de navegação consistentes para facilitar a travessia do curso
- **Apresentação Profissional**: Estrutura estilo universitária adequada para treinamento acadêmico e corporativo
- **Eficiência de Aprendizado**: Tempo reduzido para encontrar conteúdo relevante por meio de melhor organização

#### Implementação Técnica
- **Cabeçalhos de Navegação**: Navegação de capítulo padronizada em 40+ arquivos de documentação
- **Rodapé de Navegação**: Orientação de progressão consistente e indicadores de conclusão de capítulo
- **Referenciamento Cruzado**: Sistema abrangente de links internos conectando conceitos relacionados
- **Mapeamento de Capítulos**: Templates e exemplos claramente associados a objetivos de aprendizado

#### Aprimoramento do Guia de Estudo
- **📚 Objetivos de Aprendizagem Abrangentes**: Guia de estudo reestruturado para alinhar com o sistema de 8 capítulos
- **🎯 Avaliação por Capítulo**: Cada capítulo inclui objetivos de aprendizagem específicos e exercícios práticos
- **📋 Rastreamento de Progresso**: Cronograma de aprendizagem semanal com resultados mensuráveis e checklists de conclusão
- **❓ Questões de Avaliação**: Perguntas de validação de conhecimento para cada capítulo com resultados profissionais
- **🛠️ Exercícios Práticos**: Atividades hands-on com cenários reais de implantação e solução de problemas
- **📊 Progressão de Habilidades**: Avanço claro de conceitos básicos a padrões empresariais com foco em desenvolvimento de carreira
- **🎓 Estrutura de Certificação**: Resultados de desenvolvimento profissional e sistema de reconhecimento comunitário
- **⏱️ Gerenciamento de Cronograma**: Plano de aprendizado estruturado de 10 semanas com validação de marcos

### [v3.1.0] - 2025-09-17

#### Soluções de IA Multi-Agente Aprimoradas
**Esta versão melhora a solução de varejo multi-agente com melhor nomeação de agentes e documentação aprimorada.**

#### Alterado
- **Terminologia Multi-Agente**: Substituiu "Cora agent" por "Customer agent" em toda a solução de varejo multi-agente para maior clareza
- **Arquitetura de Agentes**: Atualizou toda a documentação, templates ARM e exemplos de código para usar a nomenclatura consistente "Customer agent"
- **Exemplos de Configuração**: Modernizou padrões de configuração de agente com convenções de nomenclatura atualizadas
- **Consistência da Documentação**: Garantiu que todas as referências usem nomes de agente profissionais e descritivos

#### Aprimorado
- **Pacote de Template ARM**: Atualizado retail-multiagent-arm-template com referências a Customer agent
- **Diagramas de Arquitetura**: Diagrams Mermaid atualizados com nomenclatura de agente revisada
- **Exemplos de Código**: Classes Python e exemplos de implementação agora usam o nome CustomerAgent
- **Variáveis de Ambiente**: Atualizados todos os scripts de implantação para usar convenções CUSTOMER_AGENT_NAME

#### Melhorado
- **Experiência do Desenvolvedor**: Papéis e responsabilidades de agente mais claros na documentação
- **Prontidão para Produção**: Melhor alinhamento com convenções de nomenclatura empresariais
- **Materiais de Aprendizado**: Nomeação de agentes mais intuitiva para fins educacionais
- **Usabilidade de Templates**: Compreensão simplificada das funções dos agentes e padrões de implantação

#### Detalhes Técnicos
- Atualizados diagramas de arquitetura Mermaid com referências a CustomerAgent
- Substituídos nomes de classe CoraAgent por CustomerAgent em exemplos Python
- Modificadas configurações JSON de templates ARM para usar o tipo de agente "customer"
- Atualizadas variáveis de ambiente de CORA_AGENT_* para padrões CUSTOMER_AGENT_*
- Atualizados todos os comandos de implantação e configurações de contêiner

### [v3.0.0] - 2025-09-12

#### Principais Alterações - Foco em Desenvolvedores de IA e Integração com Microsoft Foundry
**Esta versão transforma o repositório em um recurso de aprendizado abrangente focado em IA com integração ao Microsoft Foundry.**

#### Adicionado
- **🤖 Trilha de Aprendizado Priorizando IA**: Reestrutura completa priorizando desenvolvedores e engenheiros de IA
- **Guia de Integração com Microsoft Foundry**: Documentação abrangente para conectar AZD aos serviços do Microsoft Foundry
- **Padrões de Implantação de Modelos de IA**: Guia detalhado cobrindo seleção de modelos, configuração e estratégias de implantação em produção
- **Laboratório de Workshop de IA**: Workshop prático de 2-3 horas para converter aplicações de IA em soluções implantáveis via AZD
- **Melhores Práticas para IA em Produção**: Padrões prontos para empresa para escalonamento, monitoramento e segurança de cargas de trabalho de IA
- **Guia de Solução de Problemas Específico para IA**: Solução de problemas abrangente para Azure OpenAI, Cognitive Services e questões de implantação de IA
- **Galeria de Templates de IA**: Coleção destacada de templates do Microsoft Foundry com classificações de complexidade
- **Materiais do Workshop**: Estrutura completa do workshop com laboratórios práticos e materiais de referência

#### Aprimorado
- **Estrutura do README**: Focada em desenvolvedores de IA com dados de interesse da comunidade de 45% do Microsoft Foundry Discord
- **Trilhas de Aprendizado**: Jornada dedicada ao desenvolvedor de IA ao lado de trilhas tradicionais para estudantes e engenheiros DevOps
- **Recomendações de Templates**: Templates de IA em destaque incluindo azure-search-openai-demo, contoso-chat e openai-chat-app-quickstart
- **Integração com a Comunidade**: Suporte melhorado na comunidade do Discord com canais e discussões específicas de IA

#### Foco em Segurança & Produção
- **Padrões de Identidade Gerenciada**: Autenticação e configurações de segurança específicas para IA
- **Otimização de Custos**: Monitoramento de uso de tokens e controles de orçamento para cargas de trabalho de IA
- **Implantação Multi-Região**: Estratégias para implantação global de aplicações de IA
- **Monitoramento de Desempenho**: Métricas específicas de IA e integração com Application Insights

#### Qualidade da Documentação
- **Estrutura Linear do Curso**: Progressão lógica do iniciante ao avançado em padrões de implantação de IA
- **URLs Validadas**: Todos os links externos de repositórios verificados e acessíveis
- **Referência Completa**: Todos os links de documentação interna validados e funcionais
- **Pronto para Produção**: Padrões de implantação empresariais com exemplos do mundo real

### [v2.0.0] - 2025-09-09

#### Principais Alterações - Reestruturação do Repositório e Aperfeiçoamento Profissional
**Esta versão representa uma reformulação significativa da estrutura do repositório e da apresentação do conteúdo.**

#### Adicionado
- **Estrutura de Aprendizado Estruturada**: Todas as páginas de documentação agora incluem seções de Introdução, Objetivos de Aprendizado e Resultados de Aprendizado
- **Sistema de Navegação**: Adicionados links de Lições Anteriores/Próxima em toda a documentação para progressão guiada de aprendizado
- **Guia de Estudo**: study-guide.md abrangente com objetivos de aprendizagem, exercícios práticos e materiais de avaliação
- **Apresentação Profissional**: Removidos todos os ícones emoji para melhorar acessibilidade e aparência profissional
- **Estrutura de Conteúdo Aprimorada**: Organização e fluxo de materiais de aprendizado melhorados

#### Alterado
- **Formato da Documentação**: Padronizadas todas as documentações com estrutura consistente voltada ao aprendizado
- **Fluxo de Navegação**: Implementada progressão lógica através de todos os materiais de aprendizado
- **Apresentação de Conteúdo**: Removidos elementos decorativos em favor de formatação clara e profissional
- **Estrutura de Links**: Atualizados todos os links internos para suportar o novo sistema de navegação

#### Melhorado
- **Acessibilidade**: Removidas dependências de emoji para melhor compatibilidade com leitores de tela
- **Aparência Profissional**: Apresentação limpa em estilo acadêmico adequada para aprendizado corporativo
- **Experiência de Aprendizado**: Abordagem estruturada com objetivos e resultados claros para cada lição
- **Organização de Conteúdo**: Fluxo lógico e melhor conexão entre tópicos relacionados

### [v1.0.0] - 2025-09-09

#### Lançamento Inicial - Repositório Abrangente de Aprendizado AZD

#### Adicionado
- **Estrutura de Documentação Principal**
  - Série completa de guias de introdução
  - Documentação completa de implantação e provisionamento
  - Recursos detalhados de solução de problemas e guias de depuração
  - Ferramentas e procedimentos de validação pré-implantação

- **Módulo de Introdução**
  - AZD Basics: Conceitos centrais e terminologia
  - Guia de Instalação: Instruções de configuração específicas por plataforma
  - Guia de Configuração: Configuração do ambiente e autenticação
  - Tutorial do Primeiro Projeto: Aprendizado prático passo a passo

- **Módulo de Implantação e Provisionamento**
  - Guia de Implantação: Documentação completa do fluxo de trabalho
  - Guia de Provisionamento: Infrastructure as Code com Bicep
  - Melhores práticas para implantações em produção
  - Padrões de arquitetura multi-serviço

- **Módulo de Validação Pré-Implantação**
  - Planejamento de Capacidade: Validação de disponibilidade de recursos do Azure
  - Seleção de SKU: Orientação abrangente de níveis de serviço
  - Verificações Pré-voo: Scripts de validação automatizados (PowerShell e Bash)
  - Ferramentas de estimativa de custo e planejamento orçamentário

- **Módulo de Solução de Problemas**
  - Problemas Comuns: Problemas frequentemente encontrados e soluções
  - Guia de Depuração: Metodologias sistemáticas de solução de problemas
  - Técnicas e ferramentas de diagnóstico avançadas
  - Monitoramento e otimização de desempenho

- **Recursos e Referências**
  - Folha de Consulta de Comandos: Referência rápida para comandos essenciais
  - Glossário: Definições abrangentes de terminologia e siglas
  - FAQ: Respostas detalhadas para perguntas comuns
  - Links de recursos externos e conexões com a comunidade

- **Exemplos e Templates**
  - Exemplo de Aplicação Web Simples
  - Template de implantação de Website Estático
  - Configuração de Aplicação em Contêiner
  - Padrões de integração com banco de dados
  - Exemplos de arquitetura de microserviços
  - Implementações de funções serverless

#### Funcionalidades
- **Suporte Multi-Plataforma**: Guias de instalação e configuração para Windows, macOS e Linux
- **Múltiplos Níveis de Habilidade**: Conteúdo projetado para estudantes até desenvolvedores profissionais
- **Foco Prático**: Exemplos práticos e cenários do mundo real
- **Cobertura Abrangente**: De conceitos básicos a padrões empresariais avançados
- **Abordagem com Segurança em Primeiro Lugar**: Melhores práticas de segurança integradas ao longo do conteúdo
- **Otimização de Custos**: Orientações para implantações econômicas e gerenciamento de recursos

#### Qualidade da Documentação
- **Exemplos de Código Detalhados**: Exemplos de código práticos e testados
- **Instruções Passo a Passo**: Orientação clara e acionável
- **Tratamento Abrangente de Erros**: Solução de problemas para questões comuns
- **Integração de Melhores Práticas**: Padrões e recomendações do setor
- **Compatibilidade de Versões**: Atualizado com os serviços Azure mais recentes e recursos do azd

## Melhorias Futuras Planejadas

### Versão 3.1.0 (Planejada)
#### Expansão da Plataforma de IA
- **Suporte a Multi-Modelos**: Padrões de integração para Hugging Face, Azure Machine Learning e modelos personalizados
- **Frameworks de Agentes de IA**: Templates para implantações LangChain, Semantic Kernel e AutoGen
- **Padrões Avançados de RAG**: Opções de banco de dados vetorial além do Azure AI Search (Pinecone, Weaviate, etc.)
- **Observabilidade de IA**: Monitoramento aprimorado para desempenho de modelos, uso de tokens e qualidade de resposta

#### Experiência do Desenvolvedor
- **Extensão VS Code**: Experiência de desenvolvimento integrada AZD + AI Foundry
- **Integração com GitHub Copilot**: Geração assistida por IA de templates AZD
- **Tutoriais Interativos**: Exercícios práticos de codificação com validação automatizada para cenários de IA
- **Conteúdo em Vídeo**: Tutoriais em vídeo suplementares para aprendizes visuais com foco em implantações de IA

### Versão 4.0.0 (Planejada)
#### Padrões de IA Empresariais
- **Framework de Governança**: Governança de modelos de IA, conformidade e trilhas de auditoria
- **IA Multi-Tenant**: Padrões para atendimento a múltiplos clientes com serviços de IA isolados
- **Implantação de IA na Borda**: Integração com Azure IoT Edge e instâncias de contêiner
- **IA em Nuvem Híbrida**: Padrões de implantação multi-cloud e híbrida para cargas de trabalho de IA

#### Recursos Avançados
- **Automação de Pipeline de IA**: Integração MLOps com pipelines do Azure Machine Learning
- **Segurança Avançada**: Padrões de zero-trust, endpoints privados e proteção avançada contra ameaças
- **Otimização de Desempenho**: Ajustes avançados e estratégias de escalonamento para aplicações de IA de alto rendimento
- **Distribuição Global**: Padrões de entrega de conteúdo e cache na borda para aplicações de IA

### Versão 3.0.0 (Planejada) - Substituída pela Versão Atual
#### Adições Propostas - Agora Implementadas na v3.0.0
- ✅ **Conteúdo Focado em IA**: Integração abrangente com Microsoft Foundry (Concluído)
- ✅ **Tutoriais Interativos**: Laboratório de workshop prático de IA (Concluído)
- ✅ **Módulo Avançado de Segurança**: Padrões de segurança específicos para IA (Concluído)
- ✅ **Otimização de Desempenho**: Estratégias de ajuste para cargas de trabalho de IA (Concluído)

### Versão 2.1.0 (Planejada) - Parcialmente Implementada na v3.0.0
#### Pequenas Melhorias - Algumas Concluídas na Versão Atual
- ✅ **Exemplos Adicionais**: Cenários de implantação focados em IA (Concluído)
- ✅ **FAQ Estendido**: Perguntas e soluções específicas de IA (Concluído)
- **Integração de Ferramentas**: Guias aprimorados de integração com IDEs e editores
- ✅ **Expansão de Monitoramento**: Padrões de monitoramento e alerta específicos para IA (Concluído)

#### Ainda Planejado para Lançamento Futuro
- **Documentação Amigável para Mobile**: Design responsivo para aprendizado móvel
- **Acesso Offline**: Pacotes de documentação para download
- **Integração Aprimorada com IDE**: Extensão VS Code para fluxos de trabalho AZD + IA
- **Painel da Comunidade**: Métricas da comunidade em tempo real e rastreamento de contribuições

## Contribuindo para o Changelog

### Relatando Alterações
Ao contribuir para este repositório, por favor assegure que as entradas do changelog incluam:

1. **Número da Versão**: Seguindo versionamento semântico (major.minor.patch)
2. **Data**: Data de lançamento ou atualização no formato YYYY-MM-DD
3. **Categoria**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Descrição Clara**: Descrição concisa do que mudou
5. **Avaliação de Impacto**: Como as mudanças afetam usuários existentes

### Categorias de Alteração

#### Adicionado
- Novos recursos, seções de documentação ou capacidades
- Novos exemplos, templates ou recursos de aprendizado
- Ferramentas, scripts ou utilitários adicionais

#### Alterado
- Modificações na funcionalidade existente ou documentação
- Atualizações para melhorar clareza ou precisão
- Reestruturação de conteúdo ou organização

#### Depreciado
- Recursos ou abordagens que estão sendo descontinuados
- Seções de documentação programadas para remoção
- Métodos que têm alternativas melhores

#### Removido
- Recursos, documentação ou exemplos que não são mais relevantes
- Informações desatualizadas ou abordagens depreciadas
- Conteúdo redundante ou consolidado

#### Corrigido
- Correções de erros na documentação ou código
- Resolução de problemas ou issues reportadas
- Melhorias em precisão ou funcionalidade

#### Segurança
- Melhorias ou correções relacionadas à segurança
- Atualizações às melhores práticas de segurança
- Resolução de vulnerabilidades de segurança

### Diretrizes de Versionamento Semântico

#### Versão Major (X.0.0)
- Mudanças incompatíveis que requerem ação do usuário
- Reestruturação significativa de conteúdo ou organização
- Mudanças que alteram a abordagem ou metodologia fundamental

#### Versão Minor (X.Y.0)
- Novos recursos ou adições de conteúdo
- Aprimoramentos que mantêm compatibilidade retroativa
- Exemplos, ferramentas ou recursos adicionais

#### Versão Patch (X.Y.Z)
- Correções de bugs e correções
- Pequenas melhorias em conteúdo existente
- Esclarecimentos e pequenos aprimoramentos

## Feedback e Sugestões da Comunidade

Ativamente encorajamos feedback da comunidade para melhorar este recurso de aprendizado:

### Como Fornecer Feedback
- **GitHub Issues**: Reporte problemas ou sugira melhorias (issues específicas de IA bem-vindas)
- **Discord Discussions**: Compartilhe ideias e engaje com a comunidade Microsoft Foundry
- **Pull Requests**: Contribua com melhorias diretas ao conteúdo, especialmente templates e guias de IA
- **Microsoft Foundry Discord**: Participe do canal #Azure para discussões sobre AZD + IA
- **Fóruns da Comunidade**: Participe de discussões mais amplas de desenvolvedores Azure

### Categorias de Feedback
- **Precisão do Conteúdo de IA**: Correções na integração e implantação de serviços de IA
- **Experiência de Aprendizado**: Sugestões para melhorar o fluxo de aprendizado do desenvolvedor de IA
- **Conteúdo de IA Ausente**: Solicitações por templates, padrões ou exemplos adicionais de IA
- **Acessibilidade**: Melhorias para necessidades de aprendizado diversas
- **Integração de Ferramentas de IA**: Sugestões para melhor integração de fluxo de trabalho de desenvolvimento de IA
- **Padrões de IA para Produção**: Solicitações de padrões de implantação de IA empresariais

### Compromisso de Resposta
- **Resposta a Issues**: Dentro de 48 horas para problemas reportados
- **Solicitações de Recursos**: Avaliação dentro de uma semana
- **Contribuições da Comunidade**: Revisão dentro de uma semana
- **Questões de Segurança**: Prioridade imediata com resposta acelerada

## Cronograma de Manutenção

### Atualizações Regulares
- **Revisões Mensais**: Acurácia de conteúdo e validação de links
- **Atualizações Trimestrais**: Principais adições e melhorias de conteúdo
- **Revisões Semestrais**: Reestruturação e aprimoramento abrangentes
- **Lançamentos Anuais**: Atualizações de versão major com melhorias significativas

### Monitoramento e Garantia de Qualidade
- **Testes Automatizados**: Validação regular de exemplos de código e links
- **Integração de Feedback da Comunidade**: Incorporação regular de sugestões de usuários
- **Atualizações Tecnológicas**: Alinhamento com os serviços Azure mais recentes e lançamentos do azd
- **Auditorias de Acessibilidade**: Revisão regular para princípios de design inclusivo

## Política de Suporte de Versões

### Suporte à Versão Atual
- **Última Versão Major**: Suporte completo com atualizações regulares
- **Versão Major Anterior**: Atualizações de segurança e correções críticas por 12 meses
- **Versões Legadas**: Suporte pela comunidade apenas, sem atualizações oficiais

### Orientação de Migração
Quando versões major forem lançadas, nós fornecemos:
- **Guias de Migração**: Instruções passo a passo para a transição
- **Notas de Compatibilidade**: Detalhes sobre alterações que quebram a compatibilidade
- **Suporte a Ferramentas**: Scripts ou utilitários para auxiliar na migração
- **Suporte da Comunidade**: Fóruns dedicados para perguntas sobre migração

---

**Navegação**
- **Lição Anterior**: [Guia de Estudo](resources/study-guide.md)
- **Próxima Lição**: Voltar para o [README Principal](README.md)

**Fique Atualizado**: Acompanhe este repositório para receber notificações sobre novos lançamentos e atualizações importantes nos materiais de aprendizado.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Isenção de responsabilidade:
Este documento foi traduzido por meio do serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se a tradução profissional por um tradutor humano. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->