# Registro de Alterações - AZD For Beginners

## Introdução

Este registro documenta todas as mudanças notáveis, atualizações e melhorias no repositório AZD For Beginners. Seguimos princípios de versionamento semântico e mantemos este registro para ajudar os usuários a entender o que mudou entre as versões.

## Objetivos de Aprendizagem

Ao revisar este registro de alterações, você irá:
- Manter-se informado sobre novos recursos e adições de conteúdo
- Compreender as melhorias feitas na documentação existente
- Acompanhar correções de bugs e ajustes para garantir precisão
- Seguir a evolução dos materiais de aprendizagem ao longo do tempo

## Resultados de Aprendizagem

Após revisar as entradas do registro de alterações, você será capaz de:
- Identificar novos conteúdos e recursos disponíveis para aprendizado
- Entender quais seções foram atualizadas ou melhoradas
- Planejar seu caminho de aprendizagem com base no material mais atual
- Contribuir com feedback e sugestões para melhorias futuras

## Histórico de Versões

### [v3.18.0] - 2026-03-16

#### AZD AI CLI Commands, Content Validation & Template Expansion
**Esta versão adiciona cobertura dos comandos `azd ai`, `azd extension` e `azd mcp` em todos os capítulos relacionados a IA, corrige links quebrados e código obsoleto em agents.md, atualiza o cheat sheet e reformula a seção Example Templates com descrições validadas e novos templates Azure AI AZD.**

#### Adicionado
- **🤖 Cobertura AZD AI CLI** em 7 arquivos (anteriormente apenas no Capítulo 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nova seção "Extensions and AI Commands" introduzindo `azd extension`, `azd ai agent init`, e `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opção 4: `azd ai agent init` com tabela de comparação (abordagem por template vs manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Subseções "AZD Extensions for Foundry" e "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Quick Start agora mostra ambos os caminhos de implantação baseados em template e manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — A seção Deploy agora inclui a opção `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Subseção "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Nova seção "AI & Extensions Commands" com `azd extension`, `azd ai agent init`, `azd mcp`, e `azd infra generate`
- **📦 Novos templates de exemplo AZD AI** em `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — RAG de .NET com chat em Blazor WebAssembly, Semantic Kernel e suporte a chat por voz
  - **azure-search-openai-demo-java** — RAG em Java usando Langchain4J com opções de implantação ACA/AKS
  - **contoso-creative-writer** — App de escrita criativa multi-agent usando Azure AI Agent Service, Bing Grounding e Prompty
  - **serverless-chat-langchainjs** — RAG serverless usando Azure Functions + LangChain.js + Cosmos DB com suporte a desenvolvimento local Ollama
  - **chat-with-your-data-solution-accelerator** — Acelerador RAG empresarial com portal de administração, integração com Teams e opções PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — App de referência de orquestração MCP multi-agent com servidores em .NET, Python, Java e TypeScript
  - **azd-ai-starter** — Template inicial Bicep minimalista de infraestrutura Azure AI
  - **🔗 Awesome AZD AI Gallery link** — Referência para a [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ templates)

#### Corrigido
- **🔗 Navegação em agents.md**: Links Anterior/Próximo agora correspondem à ordem das lições do README do Capítulo 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 links quebrados em agents.md**: `production-ai-practices.md` corrigido para `../chapter-08-production/production-ai-practices.md` (3 ocorrências)
- **📦 código obsoleto em agents.md**: Substituído `opencensus` por `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 API inválida em agents.md**: Movido `max_tokens` de `create_agent()` para `create_run()` como `max_completion_tokens`
- **🔢 contabilização de tokens em agents.md**: Substituída a estimativa aproximada `len//4` por `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Serviços corrigidos de "Cognitive Search + App Service" para "Azure AI Search + Azure Container Apps" (host padrão alterado Oct 2024)
- **contoso-chat**: Descrição atualizada para referenciar Azure AI Foundry + Prompty, correspondendo ao título e stack tecnológico reais do repositório

#### Removido
- **ai-document-processing**: Removida referência a template não funcional (repositório não publicamente acessível como template AZD)

#### Melhorado
- **📝 exercícios em agents.md**: Exercício 1 agora mostra saída esperada e passo `azd monitor`; Exercício 2 inclui código completo de registro de `FunctionTool`; Exercício 3 substitui instruções vagas por comandos concretos `prepdocs.py`
- **📚 recursos em agents.md**: Links de documentação atualizados para os docs e quickstart atuais do Azure AI Agent Service
- **📋 tabela Next Steps em agents.md**: Adicionado link do AI Workshop Lab para cobertura completa do capítulo

#### Arquivos Atualizados
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Aprimoramento da Navegação do Curso
**Esta versão melhora a navegação dos README.md dos capítulos com um formato de tabela aprimorado.**

#### Alterado
- **Tabela do Mapa do Curso**: Aprimorada com links diretos para as lições, estimativas de duração e classificações de complexidade
- **Limpeza de Pastas**: Removidas pastas antigas redundantes (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Validação de Links**: Todos os 21+ links internos na tabela do Mapa do Curso verificados

### [v3.16.0] - 2026-02-05

#### Atualizações de Nome de Produto
**Esta versão atualiza referências de produtos para a marca atual da Microsoft.**

#### Alterado
- **Microsoft Foundry → Microsoft Foundry**: Todas as referências atualizadas em arquivos não relacionados a tradução
- **Azure AI Agent Service → Foundry Agents**: Nome do serviço atualizado para refletir a marca atual

#### Arquivos Atualizados
- `README.md` - Página principal do curso
- `changelog.md` - Histórico de versões
- `course-outline.md` - Estrutura do curso
- `docs/chapter-02-ai-development/agents.md` - Guia de agentes de IA
- `examples/README.md` - Documentação de exemplos
- `workshop/README.md` - Página principal do workshop
- `workshop/docs/index.md` - Índice do workshop
- `workshop/docs/instructions/*.md` - Todos os arquivos de instruções do workshop

---

### [v3.15.0] - 2026-02-05

#### Reestruturação Significativa do Repositório: Nomes de Pastas por Capítulo
**Esta versão reestrutura a documentação em pastas dedicadas por capítulo para uma navegação mais clara.**

#### Renomeações de Pastas
Pastas antigas foram substituídas por pastas numeradas por capítulos:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Adicionado novo: `docs/chapter-05-multi-agent/`

#### Migração de Arquivos
| File | From | To |
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

#### Adicionado
- **📚 Arquivos README de Capítulo**: Criados README.md em cada pasta de capítulo com:
  - Objetivos de aprendizagem e duração
  - Tabela de lições com descrições
  - Comandos de quick start
  - Navegação para outros capítulos

#### Alterado
- **🔗 Atualizados todos os links internos**: 78+ caminhos atualizados em toda a documentação
- **🗺️ README.md principal**: Mapa do Curso atualizado com a nova estrutura por capítulos
- **📝 examples/README.md**: Referências cruzadas atualizadas para pastas de capítulos

#### Removido
- Estrutura de pastas antiga (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Reestruturação do Repositório: Navegação por Capítulo
**Esta versão adicionou arquivos README de navegação por capítulo (substituídos por v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Novo Guia de Agentes de IA
**Esta versão adiciona um guia abrangente para implantar agentes de IA com Azure Developer CLI.**

#### Adicionado
- **🤖 docs/microsoft-foundry/agents.md**: Guia completo cobrindo:
  - O que são agentes de IA e como eles diferem de chatbots
  - Três templates de quick-start para agentes (Foundry Agents, Prompty, RAG)
  - Padrões de arquitetura de agentes (agente único, RAG, multi-agent)
  - Configuração e customização de ferramentas
  - Monitoramento e rastreamento de métricas
  - Considerações de custo e otimização
  - Cenários comuns de troubleshooting
  - Três exercícios práticos com critérios de sucesso

#### Estrutura do Conteúdo
- **Introdução**: Conceitos de agentes para iniciantes
- **Quick Start**: Implantar agentes com `azd init --template get-started-with-ai-agents`
- **Padrões de Arquitetura**: Diagramas visuais de padrões de agente
- **Configuração**: Configuração de ferramentas e variáveis de ambiente
- **Monitoramento**: Integração com Application Insights
- **Exercícios**: Aprendizado prático progressivo (20-45 minutos cada)

---

### [v3.12.0] - 2026-02-05

#### Atualização do Ambiente DevContainer
**Esta versão atualiza a configuração do contêiner de desenvolvimento com ferramentas modernas e padrões melhores para a experiência de aprendizado AZD.**

#### Alterado
- **🐳 Imagem Base**: Atualizada de `python:3.12-bullseye` para `python:3.12-bookworm` (última versão estável do Debian)
- **📛 Nome do Contêiner**: Renomeado de "Python 3" para "AZD for Beginners" para maior clareza

#### Adicionado
- **🔧 Novos Recursos do Dev Container**:
  - `azure-cli` com suporte ao Bicep ativado
  - `node:20` (versão LTS para modelos AZD)
  - `github-cli` para gerenciamento de modelos
  - `docker-in-docker` para implantações de aplicativos em contêiner

- **🔌 Encaminhamento de Portas**: Portas pré-configuradas para desenvolvimento comum:
  - 8000 (visualização do MkDocs)
  - 3000 (aplicações web)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Novas Extensões do VS Code**:
  - `ms-python.vscode-pylance` - IntelliSense aprimorado para Python
  - `ms-azuretools.vscode-azurefunctions` - Suporte ao Azure Functions
  - `ms-azuretools.vscode-docker` - Suporte ao Docker
  - `ms-azuretools.vscode-bicep` - Suporte à linguagem Bicep
  - `ms-azure-devtools.azure-resource-groups` - Gerenciamento de recursos do Azure
  - `yzhang.markdown-all-in-one` - Edição de Markdown
  - `DavidAnson.vscode-markdownlint` - Linting de Markdown
  - `bierner.markdown-mermaid` - Suporte a diagramas Mermaid
  - `redhat.vscode-yaml` - Suporte a YAML (para azure.yaml)
  - `eamodio.gitlens` - Visualização do Git
  - `mhutchie.git-graph` - Histórico do Git

- **⚙️ VS Code Settings**: Adicionadas configurações padrão para o interpretador Python, formatação ao salvar e remoção de espaços em branco

- **📦 requirements-dev.txt atualizado**:
  - Adicionado plugin MkDocs minify
  - Adicionado pre-commit para qualidade de código
  - Adicionados pacotes do Azure SDK (azure-identity, azure-mgmt-resource)

#### Corrigido
- **Comando Post-Create**: Agora verifica a instalação do AZD e do Azure CLI ao iniciar o contêiner

---

### [v3.11.0] - 2026-02-05

#### Reformulação do README para iniciantes
**Esta versão melhora significativamente o README.md para torná-lo mais acessível a iniciantes e adiciona recursos essenciais para desenvolvedores de IA.**

#### Adicionado
- **🆚 Comparação Azure CLI vs AZD**: Explicação clara de quando usar cada ferramenta com exemplos práticos
- **🌟 Links do Awesome AZD**: Links diretos para a galeria de templates da comunidade e recursos de contribuição:
  - [Galeria Awesome AZD](https://azure.github.io/awesome-azd/) - 200+ modelos prontos para implantação
  - [Enviar um Template](https://github.com/Azure/awesome-azd/issues) - Contribuição da comunidade
- **🎯 Guia de Início Rápido**: Seção de início simplificada em 3 etapas (Instalar → Login → Implantar)
- **📊 Tabela de Navegação Baseada na Experiência**: Orientação clara sobre onde começar com base na experiência do desenvolvedor

#### Alterado
- **Estrutura do README**: Reorganizada para divulgação progressiva - informações-chave primeiro
- **Seção de Introdução**: Reescrita para explicar "A Magia de `azd up`" para iniciantes completos
- **Conteúdo Duplicado Removido**: Eliminada seção duplicada de solução de problemas
- **Comandos de Solução de Problemas**: Corrigida referência `azd logs` para usar o válido `azd monitor --logs`

#### Corrigido
- **🔐 Comandos de Autenticação**: Adicionados `azd auth login` e `azd auth logout` ao cheat-sheet.md
- **Referências de Comandos Inválidos**: Removido `azd logs` restante da seção de solução de problemas do README

#### Observações
- **Escopo**: Alterações aplicadas ao README.md principal e resources/cheat-sheet.md
- **Público-Alvo**: Melhorias especificamente direcionadas a desenvolvedores novos no AZD

---

### [v3.10.0] - 2026-02-05

#### Atualização de Precisão dos Comandos do Azure Developer CLI
**Esta versão corrige comandos AZD inexistentes em toda a documentação, garantindo que todos os exemplos de código usem a sintaxe válida do Azure Developer CLI.**

#### Corrigido
- **🔧 Comandos AZD Inexistentes Removidos**: Auditoria abrangente e correção de comandos inválidos:
  - `azd logs` (não existe) → substituído por `azd monitor --logs` ou alternativas do Azure CLI
  - Subcomandos de `azd service` (não existem) → substituídos por `azd show` e Azure CLI
  - `azd infra import/export/validate` (não existem) → removidos ou substituídos por alternativas válidas
  - Flags `azd deploy --rollback/--incremental/--parallel/--detect-changes` (não existem) → removidas
  - Flags `azd provision --what-if/--rollback` (não existem) → atualizadas para usar `--preview`
  - `azd config validate` (não existe) → substituído por `azd config list`
  - `azd info`, `azd history`, `azd metrics` (não existem) → removidos

- **📚 Arquivos Atualizados com Correções de Comandos**:
  - `resources/cheat-sheet.md`: Reforma geral da referência de comandos
  - `docs/deployment/deployment-guide.md`: Corrigidas estratégias de rollback e implantação
  - `docs/troubleshooting/debugging.md`: Corrigidas seções de análise de logs
  - `docs/troubleshooting/common-issues.md`: Atualizados comandos de solução de problemas
  - `docs/troubleshooting/ai-troubleshooting.md`: Corrigida seção de depuração do AZD
  - `docs/getting-started/azd-basics.md`: Comandos de monitoramento corrigidos
  - `docs/getting-started/first-project.md`: Exemplos de monitoramento e depuração atualizados
  - `docs/getting-started/installation.md`: Exemplos de ajuda e versão corrigidos
  - `docs/pre-deployment/application-insights.md`: Comandos para visualização de logs corrigidos
  - `docs/pre-deployment/coordination-patterns.md`: Comandos de depuração de agentes corrigidos

#### Alterado
- **Estratégias de Rollback**: Documentação atualizada para usar rollback baseado em Git (AZD não possui rollback nativo)
- **Visualização de Logs**: Referências a `azd logs` substituídas por `azd monitor --logs`, `azd monitor --live` e comandos do Azure CLI
- **Seção de Performance**: Flags de implantação paralela/incremental inexistentes removidas, fornecendo alternativas válidas

#### Detalhes Técnicos
- **Comandos AZD Válidos**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Flags válidas do azd monitor**: `--live`, `--logs`, `--overview`
- **Recursos Removidos**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Observações
- **Verificação**: Comandos validados contra o Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Conclusão do Workshop e Atualização de Qualidade da Documentação
**Esta versão completa os módulos interativos do workshop, corrige todos os links quebrados da documentação e melhora a qualidade geral do conteúdo para desenvolvedores de IA que usam o Microsoft AZD.**

#### Adicionado
- **📝 CONTRIBUTING.md**: Novo documento de diretrizes de contribuição com:
  - Instruções claras para reportar problemas e propor mudanças
  - Padrões de documentação para novo conteúdo
  - Diretrizes para exemplos de código e convenções de mensagens de commit
  - Informações sobre engajamento da comunidade

#### Concluído
- **🎯 Módulo do Workshop 7 (Conclusão)**: Módulo de conclusão totalmente concluído com:
  - Resumo abrangente das realizações do workshop
  - Seção de conceitos-chave dominados cobrindo AZD, templates e Microsoft Foundry
  - Recomendações para continuação da jornada de aprendizado
  - Exercícios desafio do workshop com níveis de dificuldade
  - Links de feedback da comunidade e suporte

- **📚 Módulo do Workshop 3 (Deconstruct)**: Objetivos de aprendizagem atualizados com:
  - Orientações para ativação do GitHub Copilot com servidores MCP
  - Compreensão da estrutura de pastas de templates AZD
  - Padrões de organização de Infraestrutura como Código (Bicep)
  - Instruções de laboratório prático

- **🔧 Módulo do Workshop 6 (Teardown)**: Concluído com:
  - Objetivos de limpeza de recursos e gerenciamento de custos
  - Uso de `azd down` para desprovisionamento seguro da infraestrutura
  - Orientação para recuperação de serviços cognitivos em soft-delete
  - Prompts de exploração bônus para GitHub Copilot e Azure Portal

#### Corrigido
- **🔗 Correção de Links Quebrados**: Resolvidos 15+ links internos quebrados na documentação:
  - `docs/ai-foundry/ai-model-deployment.md`: Corrigidos caminhos para microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Corrigidos caminhos para ai-model-deployment.md e production-ai-practices.md
  - `docs/getting-started/first-project.md`: Substituído cicd-integration.md inexistente por deployment-guide.md
  - `examples/retail-scenario.md`: Corrigidos caminhos do FAQ e do guia de solução de problemas
  - `examples/container-app/microservices/README.md`: Corrigidos caminhos do curso inicial e do guia de implantação
  - `resources/faq.md` e `resources/glossary.md`: Atualizadas referências do capítulo de IA
  - `course-outline.md`: Corrigidos guia do instrutor e referências de laboratórios do workshop de IA

- **📅 Banner de Status do Workshop**: Atualizado de "Under Construction" para status ativo do workshop com data de fevereiro de 2026

- **🔗 Navegação do Workshop**: Corrigidos links de navegação quebrados no README.md do workshop que apontavam para a pasta lab-1-azd-basics inexistente

#### Alterado
- **Apresentação do Workshop**: Removido aviso 'under construction', o workshop agora está completo e pronto para uso
- **Consistência de Navegação**: Garantido que todos os módulos do workshop tenham navegação inter-módulos adequada
- **Referências do Caminho de Aprendizagem**: Atualizadas referências cruzadas de capítulos para usar os caminhos corretos do microsoft-foundry

#### Validado
- ✅ Todos os arquivos markdown em inglês têm links internos válidos
- ✅ Os módulos do workshop 0-7 estão completos com objetivos de aprendizagem
- ✅ A navegação entre capítulos e módulos funciona corretamente
- ✅ O conteúdo é adequado para desenvolvedores de IA que usam o Microsoft AZD
- ✅ Linguagem e estrutura amigáveis para iniciantes mantidas em todo o conteúdo
- ✅ O CONTRIBUTING.md fornece orientações claras para colaboradores da comunidade

#### Implementação Técnica
- **Validação de Links**: Script PowerShell automatizado verificou todos os links internos .md
- **Auditoria de Conteúdo**: Revisão manual da completude do workshop e adequação para iniciantes
- **Sistema de Navegação**: Padrões consistentes de navegação entre capítulos e módulos aplicados

#### Observações
- **Escopo**: Alterações aplicadas apenas à documentação em inglês
- **Traduções**: Pastas de tradução não atualizadas nesta versão (a tradução automatizada será sincronizada posteriormente)
- **Duração do Workshop**: Workshop completo agora fornece 3-4 horas de aprendizado prático

---

### [v3.8.0] - 2025-11-19

#### Documentação Avançada: Monitoramento, Segurança e Padrões Multi-Agente
**Esta versão adiciona lições abrangentes de nível A sobre integração com Application Insights, padrões de autenticação e coordenação multi-agente para implantações em produção.**

#### Adicionado
- **📊 Lição de Integração com Application Insights**: em `docs/pre-deployment/application-insights.md`:
  - Implantação focada em AZD com provisionamento automático
  - Templates Bicep completos para Application Insights + Log Analytics
  - Aplicações Python funcionais com telemetria personalizada (1.200+ linhas)
  - Padrões de monitoramento AI/LLM (monitoramento de tokens/custos de modelos Microsoft Foundry)
  - 6 diagramas Mermaid (arquitetura, rastreamento distribuído, fluxo de telemetria)
  - 3 exercícios práticos (alertas, dashboards, monitoramento de IA)
  - Exemplos de consultas Kusto e estratégias de otimização de custos
  - Streaming de métricas ao vivo e depuração em tempo real
  - Tempo de aprendizado de 40-50 minutos com padrões prontos para produção

- **🔐 Lição de Padrões de Autenticação e Segurança**: em `docs/getting-started/authsecurity.md`:
  - 3 padrões de autenticação (strings de conexão, Key Vault, identidade gerenciada)
  - Templates de infraestrutura Bicep completos para implantações seguras
  - Código de aplicação Node.js com integração do Azure SDK
  - 3 exercícios completos (habilitar identidade gerenciada, identidade atribuída ao usuário, rotação do Key Vault)
  - Melhores práticas de segurança e configurações de RBAC
  - Guia de solução de problemas e análise de custos
  - Padrões de autenticação sem senha prontos para produção

- **🤖 Lição sobre Padrões de Coordenação Multi-Agente**: em `docs/pre-deployment/coordination-patterns.md`:
  - 5 padrões de coordenação (sequencial, paralelo, hierárquico, acionado por eventos, consenso)
  - Implementação completa de serviço orquestrador (Python/Flask, 1.500+ linhas)
  - 3 implementações de agentes especializados (Research, Writer, Editor)
  - Integração com Service Bus para enfileiramento de mensagens
  - Gerenciamento de estado no Cosmos DB para sistemas distribuídos
  - 6 diagramas Mermaid mostrando interações entre agentes
  - 3 exercícios avançados (tratamento de timeout, lógica de retry, circuit breaker)
  - Detalhamento de custos ($240-565/mês) com estratégias de otimização
  - Integração com Application Insights para monitoramento

#### Aprimorado
- **Capítulo de Pré-implantação**: Agora inclui monitoramento abrangente e padrões de coordenação
- **Capítulo Getting Started**: Aprimorado com padrões de autenticação profissionais
- **Prontidão para Produção**: Cobertura completa da segurança à observabilidade
- **Estrutura do Curso**: Atualizado para referenciar novas lições nos Capítulos 3 e 6

#### Alterado
- **Progressão de Aprendizado**: Melhor integração de segurança e monitoramento ao longo do curso
- **Qualidade da Documentação**: Padrões consistentes de nível A (95-97%) nas novas lições
- **Padrões de Produção**: Cobertura completa de ponta a ponta para implantações empresariais

#### Melhorado
- **Experiência do Desenvolvedor**: Caminho claro do desenvolvimento ao monitoramento em produção
- **Padrões de Segurança**: Padrões profissionais para autenticação e gerenciamento de segredos
- **Observabilidade**: Integração completa do Application Insights com AZD
- **Cargas de Trabalho de IA**: Monitoramento especializado para Microsoft Foundry Models e sistemas multiagente

#### Validado
- ✅ Todas as aulas incluem código completo funcional (não trechos)
- ✅ Diagramas Mermaid para aprendizado visual (19 no total em 3 aulas)
- ✅ Exercícios práticos com etapas de verificação (9 no total)
- ✅ Templates Bicep prontos para produção, implantáveis via `azd up`
- ✅ Análise de custos e estratégias de otimização
- ✅ Guias de solução de problemas e melhores práticas
- ✅ Pontos de verificação de conhecimento com comandos de verificação

#### Resultados da Avaliação da Documentação
- **docs/pre-deployment/application-insights.md**: - Guia de monitoramento abrangente
- **docs/getting-started/authsecurity.md**: - Padrões profissionais de segurança
- **docs/pre-deployment/coordination-patterns.md**: - Arquiteturas avançadas multiagente
- **Overall New Content**: - Padrões consistentes de alta qualidade

#### Implementação Técnica
- **Application Insights**: Log Analytics + telemetria personalizada + rastreamento distribuído
- **Authentication**: Managed Identity + Key Vault + padrões RBAC
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orquestração
- **Monitoring**: Métricas em tempo real + consultas Kusto + alertas + painéis
- **Cost Management**: Estratégias de amostragem, políticas de retenção, controles orçamentários

### [v3.7.0] - 2025-11-19

#### Melhorias na Qualidade da Documentação e Novo Exemplo de Microsoft Foundry Models
**Esta versão melhora a qualidade da documentação em todo o repositório e adiciona um exemplo completo de implantação do Microsoft Foundry Models com interface de chat gpt-4.1.**

#### Adicionado
- **🤖 Exemplo de Chat do Microsoft Foundry Models**: Implantação completa do gpt-4.1 com implementação funcional em `examples/azure-openai-chat/`:
  - Infraestrutura completa do Microsoft Foundry Models (implantação do modelo gpt-4.1)
  - Interface de chat em linha de comando Python com histórico de conversas
  - Integração com Key Vault para armazenamento seguro das chaves de API
  - Rastreamento de uso de tokens e estimativa de custos
  - Limitação de taxa e tratamento de erros
  - README abrangente com guia de implantação de 35-45 minutos
  - 11 arquivos prontos para produção (templates Bicep, app Python, configuração)
- **📚 Exercícios de Documentação**: Adicionados exercícios práticos ao guia de configuração:
  - Exercício 1: Configuração multiambiente (15 minutos)
  - Exercício 2: Prática de gerenciamento de segredos (10 minutos)
  - Critérios de sucesso claros e etapas de verificação
- **✅ Verificação de Implantação**: Adicionada seção de verificação ao guia de implantação:
  - Procedimentos de verificação de integridade
  - Lista de verificação de critérios de sucesso
  - Saídas esperadas para todos os comandos de implantação
  - Referência rápida de solução de problemas

#### Aprimorado
- **examples/README.md**: Atualizado para qualidade A (93%):
  - Adicionado azure-openai-chat a todas as seções relevantes
  - Atualizada a contagem de exemplos locais de 3 para 4
  - Adicionado à tabela Exemplos de Aplicações de IA
  - Integrado ao Quick Start para usuários intermediários
  - Adicionado à seção Microsoft Foundry Templates
  - Atualizadas as seções Matriz de Comparação e resultados de tecnologia
- **Qualidade da Documentação**: Melhorada de B+ (87%) → A- (92%) na pasta docs:
  - Adicionadas saídas esperadas aos exemplos de comandos críticos
  - Incluídas etapas de verificação para alterações de configuração
  - Aprimorado aprendizado prático com exercícios práticos

#### Alterado
- **Progressão de Aprendizado**: Melhor integração de exemplos de IA para aprendizes intermediários
- **Estrutura da Documentação**: Exercícios mais acionáveis com resultados claros
- **Processo de Verificação**: Critérios de sucesso explícitos adicionados aos fluxos de trabalho principais

#### Melhorado
- **Experiência do Desenvolvedor**: A implantação do Microsoft Foundry Models agora leva 35-45 minutos (vs 60-90 para alternativas complexas)
- **Transparência de Custos**: Estimativas de custo claras ($50-200/mês) para o exemplo do Microsoft Foundry Models
- **Caminho de Aprendizado**: Desenvolvedores de IA têm um ponto de entrada claro com azure-openai-chat
- **Padrões de Documentação**: Saídas esperadas e etapas de verificação consistentes

#### Validado
- ✅ Exemplo do Microsoft Foundry Models totalmente funcional com `azd up`
- ✅ Todos os 11 arquivos de implementação sintaticamente corretos
- ✅ Instruções do README correspondem à experiência real de implantação
- ✅ Links de documentação atualizados em mais de 8 locais
- ✅ Índice de exemplos reflete com precisão 4 exemplos locais
- ✅ Sem links externos duplicados nas tabelas
- ✅ Todas as referências de navegação corretas

#### Implementação Técnica
- **Arquitetura do Microsoft Foundry Models**: gpt-4.1 + Key Vault + padrão Container Apps
- **Segurança**: Managed Identity pronto, segredos no Key Vault
- **Monitoramento**: integração com Application Insights
- **Gerenciamento de Custos**: Rastreamento de tokens e otimização de uso
- **Implantação**: Comando único `azd up` para configuração completa

### [v3.6.0] - 2025-11-19

#### Atualização Principal: Exemplos de Implantação de Container Apps
**Esta versão introduz exemplos abrangentes e prontos para produção de implantação de aplicações em contêiner usando Azure Developer CLI (AZD), com documentação completa e integração no caminho de aprendizado.**

#### Adicionado
- **🚀 Exemplos de Container App**: Novos exemplos locais em `examples/container-app/`:
  - [Guia Mestre](examples/container-app/README.md): Visão geral completa de implantações conteinerizadas, início rápido, produção e padrões avançados
  - [API Flask Simples](../../examples/container-app/simple-flask-api): API REST amigável para iniciantes com escala para zero, sondas de integridade, monitoramento e solução de problemas
  - [Arquitetura de Microsserviços](../../examples/container-app/microservices): Implantação multissserviço pronta para produção (API Gateway, Product, Order, User, Notification), mensageria assíncrona, Service Bus, Cosmos DB, Azure SQL, rastreamento distribuído, implantação blue-green/canary
- **Melhores Práticas**: Segurança, monitoramento, otimização de custos e orientação de CI/CD para cargas de trabalho conteinerizadas
- **Exemplos de Código**: `azure.yaml` completo, templates Bicep e implementações de serviços em múltiplas linguagens (Python, Node.js, C#, Go)
- **Testes e Solução de Problemas**: Cenários de teste de ponta a ponta, comandos de monitoramento, orientação de solução de problemas

#### Alterado
- **README.md**: Atualizado para apresentar e vincular os novos exemplos de container app em "Exemplos Locais - Aplicações em Contêineres"
- **examples/README.md**: Atualizado para destacar exemplos de container app, adicionar entradas na matriz de comparação e atualizar referências de tecnologia/arquitetura
- **Estrutura do Curso & Guia de Estudo**: Atualizados para referenciar novos exemplos de container app e padrões de implantação nos capítulos relevantes

#### Validado
- ✅ Todos os novos exemplos implantáveis com `azd up` e seguem as melhores práticas
- ✅ Cross-links da documentação e navegação atualizados
- ✅ Os exemplos cobrem cenários do iniciante ao avançado, incluindo microsserviços de produção

#### Observações
- **Escopo**: Documentação e exemplos em inglês apenas
- **Próximos Passos**: Expandir com padrões avançados adicionais para contêiner e automação de CI/CD em versões futuras

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
  - `docs/ai-foundry/` renomeado para `docs/microsoft-foundry/`
  - Todas as referências cruzadas atualizadas para refletir a nova estrutura de pastas
  - Links de navegação validados em toda a documentação

- **📄 Renomeações de Arquivos**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Todos os links internos atualizados para referenciar o novo nome de arquivo

#### Arquivos Atualizados
- **Documentação do Capítulo** (7 arquivos):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 atualizações de links de navegação
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 referências ao nome do produto atualizadas
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Já usando Microsoft Foundry (das atualizações anteriores)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referências atualizadas (visão geral, feedback da comunidade, documentação)
  - `docs/getting-started/azd-basics.md` - 4 links de referência cruzada atualizados
  - `docs/getting-started/first-project.md` - 2 links de navegação de capítulo atualizados
  - `docs/getting-started/installation.md` - 2 links de próximo capítulo atualizados
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referências atualizadas (navegação, comunidade no Discord)
  - `docs/troubleshooting/common-issues.md` - 1 link de navegação atualizado
  - `docs/troubleshooting/debugging.md` - 1 link de navegação atualizado

- **Arquivos de Estrutura do Curso** (2 arquivos):
  - `README.md` - 17 referências atualizadas (visão geral do curso, títulos de capítulos, seção de templates, insights da comunidade)
  - `course-outline.md` - 14 referências atualizadas (visão geral, objetivos de aprendizado, recursos do capítulo)

#### Validado
- ✅ Zero referências restantes ao caminho de pasta 'ai-foundry' na documentação em inglês
- ✅ Zero referências restantes ao nome do produto 'Microsoft Foundry' na documentação em inglês
- ✅ Todos os links de navegação funcionais com a nova estrutura de pastas
- ✅ Renomeações de arquivos e pastas concluídas com sucesso
- ✅ Referências cruzadas entre capítulos validadas

#### Observações
- **Escopo**: Alterações aplicadas apenas à documentação em inglês na pasta `docs/`
- **Traduções**: Pastas de tradução (`translations/`) não foram atualizadas nesta versão
- **Workshop**: Materiais do workshop (`workshop/`) não foram atualizados nesta versão
- **Exemplos**: Arquivos de exemplo podem ainda referenciar nomes legados (a serem abordados em atualização futura)
- **Links Externos**: URLs externas e referências do repositório GitHub permanecem inalteradas

#### Guia de Migração para Contribuidores
Se você possui branches locais ou documentação referenciando a estrutura antiga:
1. Atualize referências de pasta: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Atualize referências de arquivo: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Substitua o nome do produto: "Microsoft Foundry" → "Microsoft Foundry"
4. Valide se todos os links internos da documentação ainda funcionam

---

### [v3.4.0] - 2025-10-24

#### Visualização de Infraestrutura e Aprimoramentos de Validação
**Esta versão introduz suporte abrangente ao novo recurso de preview do Azure Developer CLI e melhora a experiência do usuário do workshop.**

#### Adicionado
- **🧪 azd provision --preview Feature Documentation**: Cobertura abrangente da nova capacidade de preview de infraestrutura
  - Referência de comando e exemplos de uso no cheat sheet
  - Integração detalhada no guia de provisionamento com casos de uso e benefícios
  - Integração de verificação pré-voo para validação de implantação mais segura
  - Atualizações no guia de início rápido com práticas de implantação priorizando segurança
- **🚧 Banner de Status do Workshop**: Banner HTML profissional indicando o status de desenvolvimento do workshop
  - Design com gradiente e indicadores de construção para comunicação clara ao usuário
  - Carimbo de data/hora da última atualização para transparência
  - Design responsivo para todos os tipos de dispositivos

#### Aprimorado
- **Segurança de Infraestrutura**: Funcionalidade de preview integrada em toda a documentação de implantação
- **Validação Pré-implantação**: Scripts automatizados agora incluem testes de preview de infraestrutura
- **Fluxo de Trabalho do Desenvolvedor**: Sequências de comandos atualizadas para incluir o preview como melhor prática
- **Experiência do Workshop**: Expectativas claras definidas para os usuários sobre o status de desenvolvimento do conteúdo

#### Alterado
- **Melhores Práticas de Implantação**: Fluxo de trabalho com preview em primeiro lugar agora é a abordagem recomendada
- **Fluxo da Documentação**: Validação de infraestrutura movida para mais cedo no processo de aprendizagem
- **Apresentação do Workshop**: Comunicação profissional de status com cronograma de desenvolvimento claro

#### Melhorado
- **Abordagem Prioritária à Segurança**: Alterações de infraestrutura agora podem ser validadas antes da implantação
- **Colaboração em Equipe**: Resultados do preview podem ser compartilhados para revisão e aprovação
- **Conscientização de Custos**: Melhor compreensão dos custos de recursos antes do provisionamento
- **Mitigação de Riscos**: Redução de falhas de implantação por meio de validação prévia

#### Implementação Técnica
- **Integração Multidocumento**: Recurso de preview documentado em 4 arquivos principais
- **Padrões de Comando**: Sintaxe e exemplos consistentes em toda a documentação
- **Integração de Melhores Práticas**: Preview incluído em fluxos de validação e scripts
- **Indicadores Visuais**: Marcação clara de recurso NOVO para descobribilidade

#### Infraestrutura do Workshop
- **Comunicação de Status**: Banner HTML profissional com estilo em gradiente
- **Experiência do Usuário**: Status de desenvolvimento claro evita confusão
- **Apresentação Profissional**: Mantém a credibilidade do repositório enquanto define expectativas
- **Transparência de Cronograma**: Carimbo de última atualização em outubro de 2025 para responsabilização

### [v3.3.0] - 2025-09-24

#### Materiais do Workshop Aprimorados e Experiência de Aprendizagem Interativa
**Esta versão introduz materiais de workshop abrangentes com guias interativos baseados em navegador e caminhos de aprendizado estruturados.**

#### Adicionado
- **🎥 Interactive Workshop Guide**: Experiência de workshop baseada em navegador com capacidade de visualização do MkDocs
- **📝 Structured Workshop Instructions**: Caminho de aprendizado guiado em 7 etapas, da descoberta à personalização
  - 0-Introduction: Visão geral do workshop e configuração
  - 1-Select-AI-Template: Processo de descoberta e seleção de templates
  - 2-Validate-AI-Template: Procedimentos de implantação e validação
  - 3-Deconstruct-AI-Template: Compreendendo a arquitetura do template
  - 4-Configure-AI-Template: Configuração e personalização
  - 5-Customize-AI-Template: Modificações avançadas e iterações
  - 6-Teardown-Infrastructure: Limpeza e gerenciamento de recursos
  - 7-Wrap-up: Resumo e próximos passos
- **🛠️ Workshop Tooling**: Configuração do MkDocs com tema Material para uma experiência de aprendizado aprimorada
- **🎯 Hands-On Learning Path**: Metodologia em 3 etapas (Descoberta → Implantação → Personalização)
- **📱 GitHub Codespaces Integration**: Integração com GitHub Codespaces para configuração integrada do ambiente de desenvolvimento

#### Enhanced
- **AI Workshop Lab**: Laboratório de workshop de IA estendido com experiência de aprendizado estruturada de 2-3 horas
- **Workshop Documentation**: Documentação do workshop com apresentação profissional, navegação e recursos visuais
- **Learning Progression**: Orientação passo a passo clara, desde a seleção do template até a implantação em produção
- **Developer Experience**: Ferramentas integradas para fluxos de trabalho de desenvolvimento mais eficientes

#### Improved
- **Accessibility**: Interface baseada em navegador com busca, funcionalidade de copiar e alternância de tema
- **Self-Paced Learning**: Estrutura de workshop flexível que acomoda diferentes ritmos de aprendizado
- **Practical Application**: Cenários reais de implantação de templates de IA
- **Community Integration**: Integração com Discord para suporte e colaboração no workshop

#### Workshop Features
- **Built-in Search**: Descoberta rápida por palavras-chave e lições
- **Copy Code Blocks**: Funcionalidade de copiar ao passar o mouse para todos os exemplos de código
- **Theme Toggle**: Suporte a modo escuro/claro para diferentes preferências
- **Visual Assets**: Capturas de tela e diagramas para melhor compreensão
- **Help Integration**: Acesso direto ao Discord para suporte da comunidade

### [v3.2.0] - 2025-09-17

#### Major Navigation Restructuring and Chapter-Based Learning System
**Esta versão introduz uma estrutura de aprendizado por capítulos abrangente com navegação aprimorada em todo o repositório.**

#### Added
- **📚 Chapter-Based Learning System**: Reestruturou todo o curso em 8 capítulos progressivos de aprendizado
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Comprehensive Navigation System**: Cabeçalhos e rodapés de navegação consistentes em toda a documentação
- **🎯 Progress Tracking**: Lista de verificação de conclusão do curso e sistema de verificação de aprendizado
- **🗺️ Learning Path Guidance**: Pontos de entrada claros para diferentes níveis de experiência e objetivos
- **🔗 Cross-Reference Navigation**: Capítulos relacionados e pré-requisitos claramente vinculados

#### Enhanced
- **README Structure**: Transformado em uma plataforma de aprendizado estruturada com organização por capítulos
- **Documentation Navigation**: Cada página agora inclui contexto do capítulo e orientação de progressão
- **Template Organization**: Exemplos e templates mapeados para os capítulos de aprendizado apropriados
- **Resource Integration**: Folhas de cola, FAQs e guias de estudo conectados aos capítulos relevantes
- **Workshop Integration**: Laboratórios práticos mapeados para múltiplos objetivos de aprendizado dos capítulos

#### Changed
- **Learning Progression**: Movida de documentação linear para um aprendizado flexível baseado em capítulos
- **Configuration Placement**: Guia de configuração reposicionado como Capítulo 3 para melhor fluxo de aprendizado
- **AI Content Integration**: Integração aprimorada de conteúdo específico de IA ao longo da jornada de aprendizado
- **Production Content**: Padrões avançados consolidados no Capítulo 8 para aprendizes empresariais

#### Improved
- **User Experience**: Breadcrumbs de navegação claros e indicadores de progressão por capítulo
- **Accessibility**: Padrões de navegação consistentes para facilitar a travessia do curso
- **Professional Presentation**: Estrutura de curso no estilo universitário adequada para treinamentos acadêmicos e corporativos
- **Learning Efficiency**: Redução do tempo para encontrar conteúdo relevante por meio de organização aprimorada

#### Technical Implementation
- **Navigation Headers**: Navegação padronizada por capítulo em mais de 40 arquivos de documentação
- **Footer Navigation**: Orientação de progressão consistente e indicadores de conclusão de capítulo
- **Cross-Linking**: Sistema abrangente de links internos conectando conceitos relacionados
- **Chapter Mapping**: Templates e exemplos associados claramente aos objetivos de aprendizado

#### Study Guide Enhancement
- **📚 Comprehensive Learning Objectives**: Guia de estudos reestruturado para alinhar-se ao sistema de 8 capítulos
- **🎯 Chapter-Based Assessment**: Cada capítulo inclui objetivos de aprendizagem específicos e exercícios práticos
- **📋 Progress Tracking**: Cronograma de aprendizado semanal com resultados mensuráveis e listas de verificação de conclusão
- **❓ Assessment Questions**: Questões de validação de conhecimento para cada capítulo com resultados profissionais
- **🛠️ Practical Exercises**: Atividades práticas com cenários reais de implantação e solução de problemas
- **📊 Skill Progression**: Avanço claro dos conceitos básicos aos padrões empresariais com foco em desenvolvimento de carreira
- **🎓 Certification Framework**: Resultados de desenvolvimento profissional e sistema de reconhecimento da comunidade
- **⏱️ Timeline Management**: Plano de aprendizado estruturado de 10 semanas com validação de marcos

### [v3.1.0] - 2025-09-17

#### Enhanced Multi-Agent AI Solutions
**Esta versão aprimora a solução multagente para varejo com nomes de agentes mais claros e documentação melhorada.**

#### Changed
- **Multi-Agent Terminology**: Substituiu "Cora agent" por "Customer agent" em toda a solução multagente para varejo para maior clareza
- **Agent Architecture**: Atualizou toda a documentação, templates ARM e exemplos de código para usar a nomenclatura consistente "Customer agent"
- **Configuration Examples**: Modernizou padrões de configuração de agentes com convenções de nomenclatura atualizadas
- **Documentation Consistency**: Garantiu que todas as referências usem nomes de agentes profissionais e descritivos

#### Enhanced
- **ARM Template Package**: Atualizado retail-multiagent-arm-template com referências ao Customer agent
- **Architecture Diagrams**: Diagramas Mermaid atualizados com nomenclatura de agente revisada
- **Code Examples**: Classes Python e exemplos de implementação agora usam CustomerAgent naming
- **Environment Variables**: Atualizados todos os scripts de implantação para usar padrões CUSTOMER_AGENT_NAME

#### Improved
- **Developer Experience**: Papéis e responsabilidades de agentes mais claros na documentação
- **Production Readiness**: Melhor alinhamento com convenções de nomenclatura empresariais
- **Learning Materials**: Nomenclatura de agentes mais intuitiva para fins educacionais
- **Template Usability**: Compreensão simplificada das funções dos agentes e padrões de implantação

#### Technical Details
- Updated Mermaid architecture diagrams with CustomerAgent references
- Replaced CoraAgent class names with CustomerAgent in Python examples
- Modified ARM template JSON configurations to use "customer" agent type
- Updated environment variables from CORA_AGENT_* to CUSTOMER_AGENT_* patterns
- Refreshed all deployment commands and container configurations

### [v3.0.0] - 2025-09-12

#### Major Changes - AI Developer Focus and Microsoft Foundry Integration
**Esta versão transforma o repositório em um recurso de aprendizado abrangente com foco em desenvolvedores de IA e integração com Microsoft Foundry.**

#### Added
- **🤖 AI-First Learning Path**: Reestruturação completa priorizando desenvolvedores e engenheiros de IA
- **Microsoft Foundry Integration Guide**: Documentação abrangente para conectar o AZD aos serviços do Microsoft Foundry
- **AI Model Deployment Patterns**: Guia detalhado cobrindo seleção de modelos, configuração e estratégias de implantação em produção
- **AI Workshop Lab**: Workshop prático de 2-3 horas para converter aplicações de IA em soluções implantáveis via AZD
- **Production AI Best Practices**: Padrões prontos para empresas para escalabilidade, monitoramento e segurança de workloads de IA
- **AI-Specific Troubleshooting Guide**: Solução de problemas abrangente para Microsoft Foundry Models, Cognitive Services e questões de implantação de IA
- **AI Template Gallery**: Coleção destaque de templates Microsoft Foundry com classificações de complexidade
- **Workshop Materials**: Estrutura completa do workshop com laboratórios práticos e materiais de referência

#### Enhanced
- **README Structure**: Focado em desenvolvedores de IA com 45% dos dados de interesse da comunidade vindos do Microsoft Foundry Discord
- **Learning Paths**: Jornada dedicada ao desenvolvedor de IA ao lado de caminhos tradicionais para estudantes e engenheiros DevOps
- **Template Recommendations**: Templates em destaque incluindo azure-search-openai-demo, contoso-chat e openai-chat-app-quickstart
- **Community Integration**: Suporte comunitário Discord aprimorado com canais e discussões específicos para IA

#### Security & Production Focus
- **Managed Identity Patterns**: Padrões de autenticação e segurança específicos para IA
- **Cost Optimization**: Monitoramento de uso de tokens e controles orçamentários para workloads de IA
- **Multi-Region Deployment**: Estratégias para implantação global de aplicações de IA
- **Performance Monitoring**: Métricas específicas para IA e integração com Application Insights

#### Documentation Quality
- **Linear Course Structure**: Progressão lógica do iniciante aos padrões avançados de implantação de IA
- **Validated URLs**: Todos os links externos do repositório verificados e acessíveis
- **Complete Reference**: Todos os links internos da documentação validados e funcionais
- **Production Ready**: Padrões de implantação empresariais com exemplos do mundo real

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**Esta versão representa uma reformulação significativa da estrutura do repositório e da apresentação do conteúdo.**

#### Added
- **Structured Learning Framework**: Todas as páginas de documentação agora incluem seções de Introdução, Objetivos de Aprendizado e Resultados de Aprendizado
- **Navigation System**: Adicionados links de lição Anterior/Próximo em toda a documentação para orientação progressiva
- **Study Guide**: Comprehensive study-guide.md com objetivos de aprendizagem, exercícios práticos e materiais de avaliação
- **Professional Presentation**: Remoção de todos os ícones emoji para melhor acessibilidade e aparência profissional
- **Enhanced Content Structure**: Organização e fluxo de materiais de aprendizado aprimorados

#### Changed
- **Documentation Format**: Padronizou toda a documentação com estrutura consistente focada no aprendizado
- **Navigation Flow**: Implementou progressão lógica através de todo o material de aprendizado
- **Content Presentation**: Elementos decorativos removidos em favor de formatação clara e profissional
- **Link Structure**: Atualizados todos os links internos para suportar o novo sistema de navegação

#### Improved
- **Accessibility**: Removida dependência de emojis para melhor compatibilidade com leitores de tela
- **Professional Appearance**: Apresentação limpa no estilo acadêmico adequada para aprendizado empresarial
- **Learning Experience**: Abordagem estruturada com objetivos e resultados claros para cada lição
- **Content Organization**: Melhor fluxo lógico e conexão entre tópicos relacionados

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - Complete getting-started guide series
  - Comprehensive deployment and provisioning documentation
  - Detailed troubleshooting resources and debugging guides
  - Pre-deployment validation tools and procedures

- **Getting Started Module**
  - AZD Basics: Core concepts and terminology
  - Installation Guide: Platform-specific setup instructions
  - Configuration Guide: Environment setup and authentication
  - First Project Tutorial: Step-by-step hands-on learning

- **Deployment and Provisioning Module**
  - Deployment Guide: Complete workflow documentation
  - Provisioning Guide: Infrastructure as Code with Bicep
  - Best practices for production deployments
  - Multi-service architecture patterns

- **Pre-deployment Validation Module**
  - Capacity Planning: Azure resource availability validation
  - SKU Selection: Comprehensive service tier guidance
  - Pre-flight Checks: Automated validation scripts (PowerShell and Bash)
  - Cost estimation and budget planning tools

- **Troubleshooting Module**
  - Common Issues: Frequently encountered problems and solutions
  - Debugging Guide: Systematic troubleshooting methodologies
  - Advanced diagnostic techniques and tools
  - Performance monitoring and optimization

- **Resources and References**
  - Command Cheat Sheet: Quick reference for essential commands
  - Glossary: Comprehensive terminology and acronym definitions
  - FAQ: Detailed answers to common questions
  - External resource links and community connections

- **Examples and Templates**
  - Simple Web Application example
  - Static Website deployment template
  - Container Application configuration
  - Database integration patterns
  - Microservices architecture examples
  - Serverless function implementations

#### Features
- **Multi-Platform Support**: Guias de instalação e configuração para Windows, macOS e Linux
- **Multiple Skill Levels**: Conteúdo desenhado para estudantes até desenvolvedores profissionais
- **Practical Focus**: Exemplos práticos e cenários do mundo real
- **Comprehensive Coverage**: Desde conceitos básicos até padrões empresariais avançados
- **Security-First Approach**: Boas práticas de segurança integradas ao longo do conteúdo
- **Cost Optimization**: Orientação para implantações e gerenciamento de recursos com foco em custo-benefício

#### Documentation Quality
- **Detailed Code Examples**: Exemplos de código práticos e testados
- **Step-by-Step Instructions**: Orientações claras e acionáveis
- **Comprehensive Error Handling**: Solução de problemas para problemas comuns
- **Best Practices Integration**: Padrões da indústria e recomendações
- **Version Compatibility**: Atualizado com os serviços Azure mais recentes e recursos do azd

## Planned Future Enhancements

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Suporte a Múltiplos Modelos**: Padrões de integração para Hugging Face, Azure Machine Learning e modelos personalizados
- **Frameworks de Agentes de IA**: Modelos para implantações LangChain, Semantic Kernel e AutoGen
- **Padrões Avançados de RAG**: Opções de banco de dados vetorial além do Azure AI Search (Pinecone, Weaviate, etc.)
- **Observabilidade de IA**: Monitoramento aprimorado de desempenho do modelo, uso de tokens e qualidade de resposta

#### Experiência do Desenvolvedor
- **Extensão do VS Code**: Experiência de desenvolvimento integrada AZD + Microsoft Foundry
- **Integração com GitHub Copilot**: Geração assistida por IA de modelos AZD
- **Tutoriais Interativos**: Exercícios práticos de codificação com validação automatizada para cenários de IA
- **Conteúdo em Vídeo**: Tutoriais em vídeo suplementares para aprendizes visuais focados em implantações de IA

### Versão 4.0.0 (Planejada)
#### Padrões de IA Empresarial
- **Estrutura de Governança**: Governança de modelos de IA, conformidade e trilhas de auditoria
- **IA Multi-inquilino**: Padrões para servir múltiplos clientes com serviços de IA isolados
- **Implantação de IA na Borda**: Integração com Azure IoT Edge e instâncias de contêiner
- **IA em Nuvem Híbrida**: Padrões de implantação multi-cloud e híbrida para cargas de trabalho de IA

#### Recursos Avançados
- **Automação de Pipeline de IA**: MLOps integração com pipelines do Azure Machine Learning
- **Segurança Avançada**: Padrões de confiança zero, endpoints privados e proteção avançada contra ameaças
- **Otimização de Desempenho**: Estratégias avançadas de ajuste e escalonamento para aplicações de IA de alto rendimento
- **Distribuição Global**: Padrões de entrega de conteúdo e cache na borda para aplicações de IA

### Versão 3.0.0 (Planejada) - Substituída pela Versão Atual
#### Adições Propostas - Agora Implementadas na v3.0.0
- ✅ **Conteúdo Focado em IA**: Integração abrangente com Microsoft Foundry (Concluído)
- ✅ **Tutoriais Interativos**: Laboratório prático de workshop de IA (Concluído)
- ✅ **Módulo de Segurança Avançado**: Padrões de segurança específicos para IA (Concluído)
- ✅ **Otimização de Desempenho**: Estratégias de ajuste para cargas de trabalho de IA (Concluído)

### Versão 2.1.0 (Planejada) - Parcialmente Implementada na v3.0.0
#### Melhorias Menores - Algumas Concluídas na Versão Atual
- ✅ **Exemplos Adicionais**: Cenários de implantação focados em IA (Concluído)
- ✅ **FAQ Estendido**: Perguntas e solução de problemas específicos de IA (Concluído)
- **Integração de Ferramentas**: Guias aprimorados de integração com IDEs e editores
- ✅ **Expansão de Monitoramento**: Padrões de monitoramento e alerta específicos de IA (Concluído)

#### Ainda Planejado para Lançamento Futuro
- **Documentação Amigável para Mobile**: Design responsivo para aprendizado em dispositivos móveis
- **Acesso Offline**: Pacotes de documentação para download
- **Integração Aprimorada com IDE**: Extensão do VS Code para fluxos de trabalho AZD + IA
- **Painel da Comunidade**: Métricas da comunidade em tempo real e rastreamento de contribuições

## Contribuindo para o Registro de Alterações

### Reportando Alterações
Ao contribuir para este repositório, por favor, assegure que as entradas do registro de alterações incluam:

1. **Número da Versão**: Seguindo versionamento semântico (major.minor.patch)
2. **Data**: Data de lançamento ou atualização no formato YYYY-MM-DD
3. **Categoria**: Adicionado, Alterado, Descontinuado, Removido, Corrigido, Segurança
4. **Descrição Clara**: Descrição concisa do que mudou
5. **Avaliação de Impacto**: Como as mudanças afetam usuários existentes

### Categorias de Mudança

#### Adicionado
- Novos recursos, seções de documentação ou funcionalidades
- Novos exemplos, modelos ou recursos de aprendizado
- Ferramentas adicionais, scripts ou utilitários

#### Alterado
- Modificações na funcionalidade existente ou na documentação
- Atualizações para melhorar clareza ou precisão
- Reestruturação de conteúdo ou organização

#### Descontinuado
- Recursos ou abordagens que estão sendo descontinuados
- Seções de documentação programadas para remoção
- Métodos que têm alternativas melhores

#### Removido
- Recursos, documentação ou exemplos que não são mais relevantes
- Informações desatualizadas ou abordagens descontinuadas
- Conteúdo redundante ou consolidado

#### Corrigido
- Correções de erros na documentação ou no código
- Resolução de problemas ou questões reportadas
- Melhorias na precisão ou funcionalidade

#### Segurança
- Melhorias ou correções relacionadas à segurança
- Atualizações às melhores práticas de segurança
- Resolução de vulnerabilidades de segurança

### Diretrizes de Versionamento Semântico

#### Versão Principal (X.0.0)
- Mudanças incompatíveis que exigem ação do usuário
- Reestruturação significativa de conteúdo ou organização
- Mudanças que alteram a abordagem ou metodologia fundamental

#### Versão Menor (X.Y.0)
- Novos recursos ou adições de conteúdo
- Melhorias que mantêm compatibilidade com versões anteriores
- Exemplos, ferramentas ou recursos adicionais

#### Versão de Patch (X.Y.Z)
- Correções de bugs e ajustes
- Melhorias menores no conteúdo existente
- Esclarecimentos e pequenos aprimoramentos

## Feedback e Sugestões da Comunidade

Incentivamos ativamente o feedback da comunidade para melhorar este recurso de aprendizado:

### Como Fornecer Feedback
- **Issues no GitHub**: Reporte problemas ou sugira melhorias (issues específicas de IA são bem-vindas)
- **Discussões no Discord**: Compartilhe ideias e interaja com a comunidade Microsoft Foundry
- **Pull Requests**: Contribua com melhorias diretas ao conteúdo, especialmente modelos e guias de IA
- **Discord do Microsoft Foundry**: Participe do canal #Azure para discussões sobre AZD + IA
- **Fóruns da Comunidade**: Participe de discussões mais amplas de desenvolvedores Azure

### Categorias de Feedback
- **Precisão do Conteúdo de IA**: Correções na integração de serviços de IA e informações de implantação
- **Experiência de Aprendizado**: Sugestões para melhorar o fluxo de aprendizado do desenvolvedor de IA
- **Conteúdo de IA Ausente**: Solicitações para modelos, padrões ou exemplos adicionais de IA
- **Acessibilidade**: Melhorias para necessidades de aprendizado diversas
- **Integração de Ferramentas de IA**: Sugestões para melhor integração do fluxo de trabalho de desenvolvimento de IA
- **Padrões de IA em Produção**: Solicitações de padrões de implantação de IA para empresas

### Compromisso de Resposta
- **Resposta a Issues**: Dentro de 48 horas para problemas reportados
- **Solicitações de Recursos**: Avaliação em até uma semana
- **Contribuições da Comunidade**: Revisão em até uma semana
- **Issues de Segurança**: Prioridade imediata com resposta acelerada

## Cronograma de Manutenção

### Atualizações Regulares
- **Revisões Mensais**: Precisão do conteúdo e validação de links
- **Atualizações Trimestrais**: Principais adições e melhorias de conteúdo
- **Revisões Semestrais**: Reestruturação e aprimoramento abrangentes
- **Lançamentos Anuais**: Atualizações de versão principais com melhorias significativas

### Monitoramento e Garantia de Qualidade
- **Testes Automatizados**: Validação regular de exemplos de código e links
- **Integração de Feedback da Comunidade**: Incorporação regular de sugestões dos usuários
- **Atualizações Tecnológicas**: Alinhamento com os serviços Azure mais recentes e lançamentos do azd
- **Auditorias de Acessibilidade**: Revisão regular dos princípios de design inclusivo

## Política de Suporte de Versão

### Suporte à Versão Atual
- **Última Versão Principal**: Suporte completo com atualizações regulares
- **Versão Principal Anterior**: Atualizações de segurança e correções críticas por 12 meses
- **Versões Legadas**: Suporte apenas pela comunidade, sem atualizações oficiais

### Orientação para Migração
Quando versões principais são lançadas, fornecemos:
- **Guias de Migração**: Instruções passo a passo para transição
- **Notas de Compatibilidade**: Detalhes sobre mudanças incompatíveis
- **Suporte de Ferramentas**: Scripts ou utilitários para auxiliar na migração
- **Suporte da Comunidade**: Fóruns dedicados para perguntas sobre migração

---

**Navegação**
- **Lição Anterior**: [Guia de Estudo](resources/study-guide.md)
- **Próxima Lição**: Retornar para [README Principal](README.md)

**Mantenha-se Atualizado**: Observe este repositório para notificações sobre novos lançamentos e atualizações importantes aos materiais de aprendizado.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Isenção de responsabilidade**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se tradução humana profissional. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->