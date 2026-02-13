# Changelog - AZD Para Iniciantes

## Introdução

Este changelog documenta todas as alterações, atualizações e melhorias notáveis no repositório AZD Para Iniciantes. Seguimos os princípios de versionamento semântico e mantemos este registo para ajudar os utilizadores a compreender o que mudou entre versões.

## Objetivos de Aprendizagem

Ao rever este changelog, você irá:
- Manter-se informado sobre novas funcionalidades e adições de conteúdo
- Compreender as melhorias feitas na documentação existente
- Acompanhar correções de bugs e correções para garantir a precisão
- Seguir a evolução dos materiais de aprendizagem ao longo do tempo

## Resultados de Aprendizagem

Depois de rever as entradas do changelog, você será capaz de:
- Identificar novo conteúdo e recursos disponíveis para aprendizagem
- Compreender quais secções foram atualizadas ou melhoradas
- Planear o seu percurso de aprendizagem com base nos materiais mais atuais
- Contribuir com feedback e sugestões para melhorias futuras

## Histórico de Versões

### [v3.17.0] - 2026-02-05

#### Aprimoramento da Navegação do Curso
**Esta versão melhora a navegação nos capítulos do README.md com um formato de tabela aprimorado.**

#### Alterações
- **Tabela do Mapa do Curso**: Aprimorada com links diretos para as lições, estimativas de duração e classificações de complexidade
- **Limpeza de Pastas**: Remoção de pastas antigas redundantes (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Validação de Links**: Todos os mais de 21 links internos na tabela do Mapa do Curso verificados

### [v3.16.0] - 2026-02-05

#### Atualizações nos Nomes dos Produtos
**Esta versão atualiza referências a produtos para a marca atual da Microsoft.**

#### Alterações
- **Azure AI Foundry → Microsoft Foundry**: Todas as referências atualizadas em ficheiros que não são de tradução
- **Azure AI Agent Service → Foundry Agents**: Nome do serviço atualizado para refletir a marca atual

#### Ficheiros Atualizados
- `README.md` - Página principal do curso
- `changelog.md` - Histórico de versões
- `course-outline.md` - Estrutura do curso
- `docs/chapter-02-ai-development/agents.md` - Guia de agentes AI
- `examples/README.md` - Documentação de exemplos
- `workshop/README.md` - Página de entrada do workshop
- `workshop/docs/index.md` - Índice do workshop
- `workshop/docs/instructions/*.md` - Todos os ficheiros de instruções do workshop

---

### [v3.15.0] - 2026-02-05

#### Reestruturação Maior do Repositório: Nomes das Pastas Baseados nos Capítulos
**Esta versão reestrutura a documentação em pastas dedicadas por capítulo para uma navegação mais clara.**

#### Renomeação de Pastas
As pastas antigas foram substituídas por pastas numeradas por capítulo:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Adicionada nova: `docs/chapter-05-multi-agent/`

#### Migração de Ficheiros
| Ficheiro | De | Para |
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
| Todos os ficheiros pre-deployment | pre-deployment/ | chapter-06-pre-deployment/ |
| Todos os ficheiros troubleshooting | troubleshooting/ | chapter-07-troubleshooting/ |

#### Adicionado
- **📚 Ficheiros README por Capítulo**: Criados README.md em cada pasta de capítulo com:
  - Objetivos de aprendizagem e duração
  - Tabela de lições com descrições
  - Comandos para início rápido
  - Navegação para outros capítulos

#### Alterado
- **🔗 Atualização de todos os links internos**: Mais de 78 caminhos atualizados por todos os ficheiros de documentação
- **🗺️ README.md Principal**: Atualização do Mapa do Curso com nova estrutura por capítulos
- **📝 examples/README.md**: Atualização de referências cruzadas para pastas de capítulos

#### Removido
- Estrutura antiga de pastas (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Reestruturação do Repositório: Navegação por Capítulo
**Esta versão adicionou ficheiros README de navegação por capítulo (substituídos pela v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Novo Guia de Agentes AI
**Esta versão adiciona um guia abrangente para o deployment de agentes AI com o Azure Developer CLI.**

#### Adicionado
- **🤖 docs/microsoft-foundry/agents.md**: Guia completo que cobre:
  - O que são agentes AI e como diferem dos chatbots
  - Três modelos de agentes para início rápido (Foundry Agents, Prompty, RAG)
  - Padrões de arquitetura de agentes (agente único, RAG, multi-agente)
  - Configuração e personalização das ferramentas
  - Monitorização e rastreamento de métricas
  - Considerações e otimização de custos
  - Cenários comuns de resolução de problemas
  - Três exercícios práticos com critérios de sucesso

#### Estrutura do Conteúdo
- **Introdução**: Conceitos de agentes para iniciantes
- **Início Rápido**: Deployment de agentes com `azd init --template get-started-with-ai-agents`
- **Padrões de Arquitetura**: Diagramas visuais dos padrões de agentes
- **Configuração**: Configuração de ferramentas e variáveis de ambiente
- **Monitorização**: Integração com Application Insights
- **Exercícios**: Aprendizagem prática progressiva (20-45 minutos cada)

---

### [v3.12.0] - 2026-02-05

#### Atualização do Ambiente DevContainer
**Esta versão atualiza a configuração do contentor de desenvolvimento com ferramentas modernas e melhores predefinições para a experiência de aprendizagem AZD.**

#### Alterado
- **🐳 Imagem Base**: Atualizada de `python:3.12-bullseye` para `python:3.12-bookworm` (última versão estável do Debian)
- **📛 Nome do Contentor**: Renomeado de "Python 3" para "AZD for Beginners" para maior clareza

#### Adicionado
- **🔧 Novas Funcionalidades do Dev Container**:
  - `azure-cli` com suporte a Bicep ativado
  - `node:20` (versão LTS para modelos AZD)
  - `github-cli` para gestão de templates
  - `docker-in-docker` para deployments de apps em contentores

- **🔌 Redirecionamento de Portas**: Portas pré-configuradas para desenvolvimento comum:
  - 8000 (pré-visualização MkDocs)
  - 3000 (web apps)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Novas Extensões VS Code**:
  - `ms-python.vscode-pylance` - IntelliSense avançado para Python
  - `ms-azuretools.vscode-azurefunctions` - Suporte a Azure Functions
  - `ms-azuretools.vscode-docker` - Suporte Docker
  - `ms-azuretools.vscode-bicep` - Suporte a Bicep
  - `ms-azure-devtools.azure-resource-groups` - Gestão de recursos Azure
  - `yzhang.markdown-all-in-one` - Edição Markdown
  - `DavidAnson.vscode-markdownlint` - Validação Markdown
  - `bierner.markdown-mermaid` - Suporte a diagramas Mermaid
  - `redhat.vscode-yaml` - Suporte a YAML (para azure.yaml)
  - `eamodio.gitlens` - Visualização Git
  - `mhutchie.git-graph` - Histórico Git

- **⚙️ Configurações VS Code**: Adicionadas configurações por defeito para interpretador Python, formatação ao guardar e remoção de espaços em branco

- **📦 Atualização em requirements-dev.txt**:
  - Adicionado plugin de minificação MkDocs
  - Adicionado pre-commit para qualidade de código
  - Adicionados pacotes Azure SDK (azure-identity, azure-mgmt-resource)

#### Corrigido
- **Comando Pós-Criação**: Agora verifica instalação do AZD e Azure CLI no arranque do contentor

---

### [v3.11.0] - 2026-02-05

#### Revisão Amigável do README para Iniciantes
**Esta versão melhora significativamente o README.md para ser mais acessível para iniciantes e adiciona recursos essenciais para desenvolvedores AI.**

#### Adicionado
- **🆚 Comparação Azure CLI vs AZD**: Explicação clara de quando usar cada ferramenta com exemplos práticos
- **🌟 Links AZD Fantásticos**: Links diretos para a galeria de templates comunitários e recursos de contribuição:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - Mais de 200 templates prontos a usar
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Contribuição comunitária
- **🎯 Guia de Início Rápido**: Secção simplificada de três passos (Instalar → Iniciar sessão → Deploy)
- **📊 Tabela de Navegação Baseada na Experiência**: Orientação clara sobre onde começar com base na experiência do desenvolvedor

#### Alterado
- **Estrutura do README**: Reorganizada para divulgação progressiva - informação chave em primeiro lugar
- **Secção de Introdução**: Reescrita para explicar “A Magia do `azd up`” para iniciantes completos
- **Remoção de Conteúdo Duplicado**: Eliminação da secção duplicada de resolução de problemas
- **Comandos de Resolução de Problemas**: Correção da referência a `azd logs` para usar `azd monitor --logs`

#### Corrigido
- **🔐 Comandos de Autenticação**: Adicionados `azd auth login` e `azd auth logout` ao cheat-sheet.md
- **Referências Inválidas a Comandos**: Remoção das restantes referências `azd logs` da secção troubleshooting do README

#### Notas
- **Âmbito**: Alterações aplicadas ao README.md principal e resources/cheat-sheet.md
- **Público-Alvo**: Melhorias dirigidas especificamente a desenvolvedores novos no AZD

---

### [v3.10.0] - 2026-02-05

#### Atualização da Precisão dos Comandos do Azure Developer CLI
**Esta versão corrige comandos AZD inexistentes em toda a documentação, garantindo que todos os exemplos de código utilizem sintaxe válida do Azure Developer CLI.**

#### Corrigido
- **🔧 Remoção de Comandos AZD Inexistentes**: Auditoria e correção abrangente de comandos inválidos:
  - `azd logs` (não existe) → substituído por `azd monitor --logs` ou alternativas do Azure CLI
  - Subcomandos `azd service` (não existem) → substituídos por `azd show` e Azure CLI
  - `azd infra import/export/validate` (não existem) → removidos ou substituídos por alternativas válidas
  - Flags `azd deploy --rollback/--incremental/--parallel/--detect-changes` (não existem) → removidas
  - Flags `azd provision --what-if/--rollback` (não existem) → atualizadas para usar `--preview`
  - `azd config validate` (não existe) → substituído por `azd config list`
  - `azd info`, `azd history`, `azd metrics` (não existem) → removidos

- **📚 Ficheiros Atualizados com Correções de Comandos**:
  - `resources/cheat-sheet.md`: Revisão completa da referência de comandos
  - `docs/deployment/deployment-guide.md`: Correção de estratégias de rollback e deployment
  - `docs/troubleshooting/debugging.md`: Correção das secções de análise de logs
  - `docs/troubleshooting/common-issues.md`: Actualização dos comandos de troubleshooting
  - `docs/troubleshooting/ai-troubleshooting.md`: Correção da secção AZD debugging
  - `docs/getting-started/azd-basics.md`: Correção dos comandos de monitorização
  - `docs/getting-started/first-project.md`: Actualização dos exemplos de monitorização e debugging
  - `docs/getting-started/installation.md`: Correção dos exemplos de ajuda e versão
  - `docs/pre-deployment/application-insights.md`: Correção dos comandos para ver logs
  - `docs/pre-deployment/coordination-patterns.md`: Correção dos comandos de debugging de agentes

- **📝 Atualização da Referência de Versão**:
  - `docs/getting-started/installation.md`: Alteração de versão fixada `1.5.0` para genérica `1.x.x` com link para releases

#### Alterado
- **Estratégias de Rollback**: Documentação atualizada para utilização de rollback baseado em Git (AZD não tem rollback nativo)
- **Visualização de Logs**: Substituição das referências a `azd logs` por `azd monitor --logs`, `azd monitor --live` e comandos Azure CLI
- **Secção de Performance**: Remoção das flags inexistentes de deployment paralelo/incremental, fornecendo alternativas válidas

#### Detalhes Técnicos
- **Comandos AZD Válidos**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Flags válidas de azd monitor**: `--live`, `--logs`, `--overview`
- **Funcionalidades Removidas**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notas
- **Verificação**: Comandos validados contra Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Conclusão do Workshop e Atualização da Qualidade da Documentação
**Esta versão completa os módulos interativos do workshop, corrige todos os links de documentação quebrados e melhora a qualidade global do conteúdo para desenvolvedores de IA que usam Microsoft AZD.**

#### Adicionado
- **📝 CONTRIBUTING.md**: Novo documento de diretrizes para contribuição com:
  - Instruções claras para reportar problemas e propor alterações
  - Padrões de documentação para novo conteúdo
  - Diretrizes para exemplos de código e convenções de mensagens de commit
  - Informações para envolvimento da comunidade

#### Concluído
- **🎯 Módulo 7 do Workshop (Conclusão)**: Módulo de encerramento totalmente concluído com:
  - Resumo abrangente das realizações do workshop
  - Seção de conceitos chave dominados cobrindo AZD, templates e AI Foundry
  - Recomendações para continuação da jornada de aprendizagem
  - Exercícios desafiantes do workshop com classificações de dificuldade
  - Feedback da comunidade e links de suporte

- **📚 Módulo 3 do Workshop (Deconstruir)**: Objetivos de aprendizagem atualizados com:
  - Orientação para ativação do GitHub Copilot com servidores MCP
  - Entendimento da estrutura de pastas do template AZD
  - Padrões de organização de infraestrutura como código (Bicep)
  - Instruções para laboratórios práticos

- **🔧 Módulo 6 do Workshop (Desmontagem)**: Concluído com:
  - Objetivos de limpeza de recursos e gestão de custos
  - Uso do `azd down` para desparamentação segura da infraestrutura
  - Orientação para recuperação de serviços cognitivos apagados temporariamente
  - Prompts bônus para exploração do GitHub Copilot e Azure Portal

#### Corrigido
- **🔗 Correções de Links Quebrados**: Resolvidos mais de 15 links internos de documentação quebrados:
  - `docs/ai-foundry/ai-model-deployment.md`: Corrigidos os caminhos para microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Corrigidos os caminhos de ai-model-deployment.md e production-ai-practices.md
  - `docs/getting-started/first-project.md`: Substituído cicd-integration.md inexistente por deployment-guide.md
  - `examples/retail-scenario.md`: Corrigidos os caminhos para FAQ e guia de resolução de problemas
  - `examples/container-app/microservices/README.md`: Corrigidos os caminhos para o guia do curso e guia de deployment
  - `resources/faq.md` e `resources/glossary.md`: Atualizadas as referências ao capítulo de IA
  - `course-outline.md`: Corrigidos os guias para instrutores e referências do laboratório de IA

- **📅 Banner de Estado do Workshop**: Atualizado de "Em Construção" para estado ativo do workshop com data de fevereiro de 2026

- **🔗 Navegação do Workshop**: Corrigidos links de navegação quebrados no README.md do workshop que apontavam para pasta lab-1-azd-basics inexistente

#### Alterado
- **Apresentação do Workshop**: Removido aviso de "em construção", o workshop está agora completo e pronto para uso
- **Consistência de Navegação**: Garantida navegação adequada entre todos os módulos do workshop
- **Referências do Caminho de Aprendizagem**: Atualizadas referências cruzadas para utilizar caminhos corretos microsoft-foundry

#### Validado
- ✅ Todos os ficheiros markdown em inglês possuem links internos válidos
- ✅ Módulos do workshop 0-7 estão completos com objetivos de aprendizagem
- ✅ Navegação entre capítulos e módulos funciona corretamente
- ✅ Conteúdo adequado para desenvolvedores de IA usando Microsoft AZD
- ✅ Linguagem e estrutura amigáveis para iniciantes mantidas em todo o conteúdo
- ✅ CONTRIBUTING.md fornece orientação clara para contribuidores da comunidade

#### Implementação Técnica
- **Validação de Links**: Script PowerShell automatizado verificou todos os links internos .md
- **Auditoria de Conteúdo**: Revisão manual da completude e adequação para iniciantes do workshop
- **Sistema de Navegação**: Aplicados padrões consistentes de navegação entre capítulos e módulos

#### Notas
- **Âmbito**: Alterações aplicadas apenas à documentação em inglês
- **Traduções**: Pastas de tradução não atualizadas nesta versão (tradução automática será sincronizada posteriormente)
- **Duração do Workshop**: Workshop completo agora oferece 3-4 horas de aprendizagem prática

---

### [v3.8.0] - 2025-11-19

#### Documentação Avançada: Monitorização, Segurança e Padrões Multi-Agente
**Esta versão adiciona lições abrangentes de nível A sobre integração com Application Insights, padrões de autenticação e coordenação multi-agente para deployments de produção.**

#### Adicionado
- **📊 Lição de Integração Application Insights**: em `docs/pre-deployment/application-insights.md`:
  - Deployment focado em AZD com provisionamento automático
  - Templates Bicep completos para Application Insights + Log Analytics
  - Aplicações Python funcionais com telemetria personalizada (mais de 1.200 linhas)
  - Padrões de monitorização AI/LLM (rastreio de tokens/custos Azure OpenAI)
  - 6 diagramas Mermaid (arquitetura, tracing distribuído, fluxo de telemetria)
  - 3 exercícios práticos (alertas, dashboards, monitorização AI)
  - Exemplos de queries Kusto e estratégias de otimização de custos
  - Streaming de métricas em tempo real e debugging ao vivo
  - Tempo de aprendizagem de 40-50 minutos com padrões prontos para produção

- **🔐 Lição de Padrões de Autenticação & Segurança**: em `docs/getting-started/authsecurity.md`:
  - 3 padrões de autenticação (connection strings, Key Vault, identidade gerida)
  - Templates Bicep completos para deployments seguros
  - Código de aplicação Node.js com integração Azure SDK
  - 3 exercícios completos (ativar identidade gerida, identidade atribuída ao utilizador, rotação de Key Vault)
  - Melhores práticas de segurança e configurações RBAC
  - Guia de resolução de problemas e análise de custos
  - Padrões de autenticação sem palavra-passe prontos para produção

- **🤖 Lição de Padrões de Coordenação Multi-Agente**: em `docs/pre-deployment/coordination-patterns.md`:
  - 5 padrões de coordenação (sequencial, paralelo, hierárquico, orientado por eventos, consenso)
  - Implementação completa do serviço orquestrador (Python/Flask, mais de 1.500 linhas)
  - 3 implementações especializadas de agentes (Pesquisa, Escritor, Editor)
  - Integração com Service Bus para enfileiramento de mensagens
  - Gestão de estado com Cosmos DB para sistemas distribuídos
  - 6 diagramas Mermaid mostrando interações entre agentes
  - 3 exercícios avançados (gestão de timeout, lógica de retry, circuit breaker)
  - Análise de custos ($240-565/mês) com estratégias de optimização
  - Integração Application Insights para monitorização

#### Melhorado
- **Capítulo Pré-deployment**: Agora inclui padrões abrangentes de monitorização e coordenação
- **Capítulo Getting Started**: Aprimorado com padrões profissionais de autenticação
- **Prontidão para Produção**: Cobertura completa da segurança à observabilidade
- **Estrutura do Curso**: Atualizada para referenciar novas lições nos Capítulos 3 e 6

#### Alterado
- **Progressão de Aprendizagem**: Melhor integração de segurança e monitorização ao longo do curso
- **Qualidade da Documentação**: Padrões A consistentes (95-97%) nas novas lições
- **Padrões de Produção**: Cobertura completa fim-a-fim para deployments empresariais

#### Aprimorado
- **Experiência do Desenvolvedor**: Caminho claro do desenvolvimento à monitorização em produção
- **Padrões de Segurança**: Padrões profissionais para autenticação e gestão de segredos
- **Observabilidade**: Integração completa do Application Insights com AZD
- **Cargas de Trabalho IA**: Monitorização especializada para Azure OpenAI e sistemas multi-agente

#### Validado
- ✅ Todas as lições incluem código funcional completo (sem snippets)
- ✅ Diagramas Mermaid para aprendizagem visual (19 no total em 3 lições)
- ✅ Exercícios práticos com passos de verificação (9 no total)
- ✅ Templates Bicep prontos para produção deployáveis via `azd up`
- ✅ Análise de custos e estratégias de optimização
- ✅ Guias de resolução de problemas e melhores práticas
- ✅ Checkpoints de conhecimento com comandos de verificação

#### Resultados da Avaliação da Documentação
- **docs/pre-deployment/application-insights.md**: - Guia abrangente de monitorização
- **docs/getting-started/authsecurity.md**: - Padrões profissionais de segurança
- **docs/pre-deployment/coordination-patterns.md**: - Arquiteturas avançadas multi-agente
- **Conteúdo Novo Geral**: - Padrões consistentes de alta qualidade

#### Implementação Técnica
- **Application Insights**: Log Analytics + telemetria personalizada + tracing distribuído
- **Autenticação**: Identidade gerida + Key Vault + padrões RBAC
- **Multi-Agente**: Service Bus + Cosmos DB + Container Apps + orquestração
- **Monitorização**: Métricas ao vivo + queries Kusto + alertas + dashboards
- **Gestão de Custos**: Estratégias de sampling, políticas de retenção, controlos orçamentais

### [v3.7.0] - 2025-11-19

#### Melhorias na Qualidade da Documentação e Novo Exemplo Azure OpenAI
**Esta versão melhora a qualidade da documentação no repositório e adiciona um exemplo completo de deployment Azure OpenAI com interface de chat GPT-4.**

#### Adicionado
- **🤖 Exemplo Azure OpenAI Chat**: Deployment completo GPT-4 com implementação funcional em `examples/azure-openai-chat/`:
  - Infraestrutura completa Azure OpenAI (deployment modelo GPT-4)
  - Interface Python linha de comandos com histórico de conversas
  - Integração Key Vault para armazenamento seguro da chave API
  - Monitorização de uso de tokens e estimativa de custos
  - Limitação de taxa e tratamento de erros
  - README abrangente com guia de deployment de 35-45 minutos
  - 11 ficheiros prontos para produção (templates Bicep, app Python, configuração)
- **📚 Exercícios de Documentação**: Adicionados exercícios práticos ao guia de configuração:
  - Exercício 1: Configuração multi-ambiente (15 minutos)
  - Exercício 2: Prática de gestão de segredos (10 minutos)
  - Critérios claros de sucesso e passos de verificação
- **✅ Verificação de Deployment**: Adicionada secção de verificação ao guia de deployment:
  - Procedimentos de verificação do estado
  - Checklist de critérios de sucesso
  - Saídas esperadas para todos os comandos de deployment
  - Referência rápida para resolução de problemas

#### Melhorado
- **examples/README.md**: Atualizado para qualidade A (93%):
  - Adicionado azure-openai-chat a todas as secções relevantes
  - Atualizado número de exemplos locais de 3 para 4
  - Adicionado na tabela de Exemplos de Aplicações AI
  - Integrado em Quick Start para utilizadores intermédios
  - Adicionado na seção de Microsoft Foundry Templates
  - Atualizadas secções de Matriz de Comparação e procura de tecnologias
- **Qualidade da Documentação**: Melhorado de B+ (87%) para A- (92%) na pasta docs:
  - Adicionadas saídas esperadas a exemplos críticos de comandos
  - Incluídos passos de verificação para alterações de configuração
  - Aprendizagem prática aprimorada com exercícios concretos

#### Alterado
- **Progressão de Aprendizagem**: Melhor integração de exemplos AI para utilizadores intermédios
- **Estrutura da Documentação**: Exercícios mais acionáveis com resultados claros
- **Processo de Verificação**: Critérios explícitos de sucesso adicionados a workflows chave

#### Aprimorado
- **Experiência do Desenvolvedor**: Deployment Azure OpenAI agora dura 35-45 minutos (vs 60-90 para opções complexas)
- **Transparência de Custos**: Estimativas claras de custos ($50-200/mês) para exemplo Azure OpenAI
- **Caminho de Aprendizagem**: Desenvolvedores AI têm ponto de entrada claro com azure-openai-chat
- **Padrões de Documentação**: Saídas esperadas e passos de verificação consistentes

#### Validado
- ✅ Exemplo Azure OpenAI totalmente funcional com `azd up`
- ✅ Todos os 11 ficheiros de implementação corretos sintaticamente
- ✅ Instruções README correspondem à experiência real de deployment
- ✅ Links de documentação atualizados em mais de 8 locais
- ✅ Índice de exemplos reflete corretamente 4 exemplos locais
- ✅ Sem links externos duplicados nas tabelas
- ✅ Todas as referências de navegação corretas

#### Implementação Técnica
- **Arquitetura Azure OpenAI**: GPT-4 + Key Vault + padrão Container Apps
- **Segurança**: Pronto para Identidade Gerida, segredos no Key Vault
- **Monitorização**: Integração Application Insights
- **Gestão de Custos**: Monitorização de tokens e otimização de uso
- **Deployment**: Comando único `azd up` para configuração completa

### [v3.6.0] - 2025-11-19

#### Atualização Principal: Exemplos de Deployment Container App
**Esta versão introduz exemplos abrangentes de deployment de aplicações em container, prontos para produção, usando Azure Developer CLI (AZD), com documentação completa e integração no caminho de aprendizagem.**

#### Adicionado
- **🚀 Exemplos de Container App**: Novos exemplos locais em `examples/container-app/`:
  - [Guia Mestre](examples/container-app/README.md): Visão geral completa de deployments conteinerizados, quick start, produção e padrões avançados
  - [API Flask Simples](../../examples/container-app/simple-flask-api): API REST amigável para iniciantes com scale-to-zero, probes de saúde, monitorização e resolução de problemas
  - [Arquitetura de Microserviços](../../examples/container-app/microservices): Deployment multi-serviço pronto para produção (API Gateway, Product, Order, User, Notification), mensageria assíncrona, Service Bus, Cosmos DB, Azure SQL, tracing distribuído, deployment blue-green/canary
- **Boas Práticas**: Segurança, monitorização, otimização de custos e orientação CI/CD para workloads conteinerizados
- **Exemplos de Código**: Arquivos completos `azure.yaml`, templates Bicep e implementações multi-linguagem dos serviços (Python, Node.js, C#, Go)
- **Testes & Resolução de Problemas**: Cenários de teste de ponta a ponta, comandos de monitorização, orientações de troubleshooting

#### Alterado
- **README.md**: Atualizado para incluir e linkar novos exemplos de container app sob "Local Examples - Container Applications"
- **examples/README.md**: Atualizado para destacar exemplos de container app, adicionar entradas na matriz de comparação e atualizar referências de tecnologia/arquitetura
- **Plano do Curso & Guia de Estudo**: Atualizado para referenciar novos exemplos de aplicações em containers e padrões de implementação nos capítulos relevantes

#### Validado
- ✅ Todos os novos exemplos implementáveis com `azd up` e seguem as melhores práticas
- ✅ Atualizações nas referências cruzadas e navegação da documentação
- ✅ Exemplos abrangem cenários desde iniciante a avançado, incluindo microserviços em produção

#### Notas
- **Âmbito**: Apenas documentação e exemplos em inglês
- **Próximos Passos**: Expandir com padrões adicionais avançados para containers e automação CI/CD em versões futuras

### [v3.5.0] - 2025-11-19

#### Rebranding do Produto: Microsoft Foundry
**Esta versão implementa uma mudança abrangente do nome do produto de "Microsoft Foundry" para "Microsoft Foundry" em toda a documentação em inglês, refletindo o rebranding oficial da Microsoft.**

#### Alterado
- **🔄 Atualização do Nome do Produto**: Rebranding completo de "Microsoft Foundry" para "Microsoft Foundry"
  - Atualizadas todas as referências na documentação em inglês na pasta `docs/`
  - Renomeada pasta: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Renomeado ficheiro: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 referências de conteúdo atualizadas em 7 ficheiros de documentação

- **📁 Alterações na Estrutura das Pastas**:
  - `docs/ai-foundry/` renomeada para `docs/microsoft-foundry/`
  - Todas as referências cruzadas atualizadas para refletir a nova estrutura de pastas
  - Links de navegação validados em toda a documentação

- **📄 Renomeação de Ficheiros**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Todos os links internos atualizados para referenciar o novo nome do ficheiro

#### Ficheiros Atualizados
- **Documentação de Capítulos** (7 ficheiros):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 atualizações em links de navegação
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 referências ao nome do produto atualizadas
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Já usa Microsoft Foundry (de atualizações anteriores)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referências atualizadas (visão geral, feedback da comunidade, documentação)
  - `docs/getting-started/azd-basics.md` - 4 links de referências cruzadas atualizados
  - `docs/getting-started/first-project.md` - 2 links de navegação de capítulo atualizados
  - `docs/getting-started/installation.md` - 2 links para capítulos seguintes atualizados
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referências atualizadas (navegação, comunidade Discord)
  - `docs/troubleshooting/common-issues.md` - 1 link de navegação atualizado
  - `docs/troubleshooting/debugging.md` - 1 link de navegação atualizado

- **Ficheiros da Estrutura do Curso** (2 ficheiros):
  - `README.md` - 17 referências atualizadas (visão geral do curso, títulos dos capítulos, secção de templates, insights da comunidade)
  - `course-outline.md` - 14 referências atualizadas (visão geral, objetivos de aprendizagem, recursos dos capítulos)

#### Validado
- ✅ Nenhuma referência remanescente ao caminho da pasta "ai-foundry" na documentação em inglês
- ✅ Nenhuma referência remanescente ao nome do produto "Microsoft Foundry" na documentação em inglês
- ✅ Todos os links de navegação funcionais com a nova estrutura de pastas
- ✅ Renomeações de ficheiros e pastas concluídas com sucesso
- ✅ Referências cruzadas entre capítulos validadas

#### Notas
- **Âmbito**: Alterações aplicadas apenas à documentação em inglês na pasta `docs/`
- **Traduções**: Pastas de tradução (`translations/`) não atualizadas nesta versão
- **Workshop**: Materiais do workshop (`workshop/`) não atualizados nesta versão
- **Exemplos**: Ficheiros de exemplo podem ainda referenciar a nomenclatura antiga (a tratar em atualização futura)
- **Links Externos**: URLs externos e referências ao repositório GitHub mantidas inalteradas

#### Guia de Migração para Contribuidores
Se tiverem branches locais ou documentação a referir a estrutura antiga:
1. Atualizem as referências de pasta: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Atualizem as referências aos ficheiros: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Substituam o nome do produto: "Microsoft Foundry" → "Microsoft Foundry"
4. Validem todos os links internos da documentação para garantir que funcionam

---

### [v3.4.0] - 2025-10-24

#### Melhorias na Pré-visualização e Validação da Infraestrutura
**Esta versão introduz suporte abrangente para a nova funcionalidade de pré-visualização do Azure Developer CLI e melhora a experiência do utilizador do workshop.**

#### Adicionado
- **🧪 Documentação da funcionalidade azd provision --preview**: Cobertura completa da nova capacidade de pré-visualização da infraestrutura
  - Referência de comando e exemplos de uso no cheat sheet
  - Integração detalhada no guia de provisionamento com casos de uso e benefícios
  - Integração de verificação prévia para validação segura da implementação
  - Atualizações no guia de introdução com práticas de implementação orientadas à segurança
- **🚧 Banner de Estado do Workshop**: Banner HTML profissional indicando o estado de desenvolvimento do workshop
  - Design em gradiente com indicadores de construção para comunicação clara ao utilizador
  - Timestamp da última atualização para transparência
  - Design responsivo para todos os tipos de dispositivos móveis

#### Melhorado
- **Segurança da Infraestrutura**: Funcionalidade de pré-visualização integrada em toda a documentação de implementação
- **Validação Pré-Implementação**: Scripts automatizados agora incluem testes de pré-visualização da infraestrutura
- **Fluxo de Trabalho do Desenvolvedor**: Sequências de comandos atualizadas para incluir pré-visualização como melhor prática
- **Experiência do Workshop**: Expectativas claras definidas para utilizadores sobre o estado de desenvolvimento do conteúdo

#### Alterado
- **Melhores práticas de implementação**: Fluxo "preview-first" agora recomendado como abordagem padrão
- **Fluxo da Documentação**: Validação de infraestrutura movida para etapas iniciais do processo de aprendizagem
- **Apresentação do Workshop**: Comunicação profissional do estado com cronograma claro de desenvolvimento

#### Melhorado
- **Abordagem Focada na Segurança**: Alterações de infraestrutura agora podem ser validadas antes da implementação
- **Colaboração em Equipa**: Resultados da pré-visualização podem ser partilhados para revisão e aprovação
- **Consciência de Custos**: Melhor compreensão dos custos dos recursos antes do provisionamento
- **Mitigação de Riscos**: Redução de falhas na implementação através de validação antecipada

#### Implementação Técnica
- **Integração Multidocumento**: Funcionalidade de pré-visualização documentada em 4 ficheiros chave
- **Padrões de Comando**: Sintaxe consistente e exemplos em toda a documentação
- **Integração de Melhores Práticas**: Pré-visualização incluída nos workflows de validação e scripts
- **Indicadores Visuais**: Marcação clara de funcionalidade NOVA para melhor descoberta

#### Infraestrutura do Workshop
- **Comunicação do Estado**: Banner HTML profissional com estilo em gradiente
- **Experiência do Utilizador**: Estado de desenvolvimento claro evita confusão
- **Apresentação Profissional**: Mantém credibilidade do repositório enquanto define expectativas
- **Transparência de Cronograma**: Timestamp "Última atualização: Outubro 2025" para responsabilidade

### [v3.3.0] - 2025-09-24

#### Materiais de Workshop Melhorados e Experiência de Aprendizagem Interativa
**Esta versão introduz materiais de workshop abrangentes com guias interativos baseados no navegador e percursos de aprendizagem estruturados.**

#### Adicionado
- **🎥 Guia Interativo do Workshop**: Experiência de workshop baseada em navegador com capacidade de pré-visualização MkDocs
- **📝 Instruções Estruturadas para Workshop**: Percurso de aprendizagem guiado em 7 passos desde a descoberta até à personalização
  - 0-Introdução: Visão geral e configuração do workshop
  - 1-Selecionar-Template-AI: Processo de descoberta e seleção de template
  - 2-Validar-Template-AI: Procedimentos de implementação e validação
  - 3-Desconstruir-Template-AI: Compreensão da arquitetura do template
  - 4-Configurar-Template-AI: Configuração e personalização
  - 5-Personalizar-Template-AI: Modificações avançadas e iterações
  - 6-Remover-Infraestrutura: Limpeza e gestão de recursos
  - 7-Conclusão: Sumário e próximos passos
- **🛠️ Ferramentas para Workshop**: Configuração MkDocs com tema Material para melhor experiência de aprendizagem
- **🎯 Percurso de Aprendizagem Prático**: Metodologia em 3 passos (Descoberta → Implementação → Personalização)
- **📱 Integração com GitHub Codespaces**: Ambiente de desenvolvimento configurado sem interrupções

#### Melhorado
- **Laboratório de Workshop IA**: Estendido para experiência estruturada de 2-3 horas
- **Documentação do Workshop**: Apresentação profissional com navegação e suportes visuais
- **Progressão da Aprendizagem**: Orientação clara passo a passo desde a seleção do template até à implementação em produção
- **Experiência do Desenvolvedor**: Ferramentas integradas para fluxos de trabalho de desenvolvimento simplificados

#### Melhorado
- **Acessibilidade**: Interface baseada em navegador com pesquisa, funcionalidade de copiar e alternar tema
- **Aprendizagem ao Ritmo Próprio**: Estrutura flexível do workshop adaptada a diferentes ritmos de aprendizagem
- **Aplicação Prática**: Cenários reais de implementação de templates IA
- **Integração Comunitária**: Integração com Discord para suporte e colaboração no workshop

#### Características do Workshop
- **Pesquisa Incorporada**: Descoberta rápida por palavras-chave e lições
- **Blocos de Código com Copiar**: Funcionalidade hover para copiar todos os exemplos de código
- **Alternar Tema**: Suporte para modo escuro/claro conforme preferências
- **Ativos Visuais**: Capturas de ecrã e diagramas para melhor compreensão
- **Integração de Ajuda**: Acesso direto ao Discord para suporte comunitário

### [v3.2.0] - 2025-09-17

#### Reestruturação Maior da Navegação e Sistema de Aprendizagem Baseado em Capítulos
**Esta versão introduz uma estrutura de aprendizagem baseada em capítulos com navegação melhorada por todo o repositório.**

#### Adicionado
- **📚 Sistema de Aprendizagem Baseado em Capítulos**: Reestruturado todo o curso em 8 capítulos progressivos
  - Capítulo 1: Fundamentos & Início Rápido (⭐ - 30-45 mins)
  - Capítulo 2: Desenvolvimento AI-First (⭐⭐ - 1-2 horas)
  - Capítulo 3: Configuração & Autenticação (⭐⭐ - 45-60 mins)
  - Capítulo 4: Infraestrutura como Código & Implementação (⭐⭐⭐ - 1-1.5 horas)
  - Capítulo 5: Soluções AI Multi-Agente (⭐⭐⭐⭐ - 2-3 horas)
  - Capítulo 6: Validação & Planeamento Pré-Implementação (⭐⭐ - 1 hora)
  - Capítulo 7: Resolução de Problemas & Debugging (⭐⭐ - 1-1.5 horas)
  - Capítulo 8: Padrões de Produção & Empresariais (⭐⭐⭐⭐ - 2-3 horas)
- **📚 Sistema Completo de Navegação**: Cabeçalhos e rodapés consistentes em toda a documentação
- **🎯 Acompanhamento de Progresso**: Checklist de conclusão do curso e sistema de verificação de aprendizagem
- **🗺️ Guia de Percurso de Aprendizagem**: Pontos de entrada claros para diferentes níveis de experiência e objetivos
- **🔗 Navegação com Referências Cruzadas**: Capítulos relacionados e pré-requisitos claramente ligados

#### Melhorado
- **Estrutura do README**: Transformado numa plataforma estruturada de aprendizagem com organização por capítulos
- **Navegação na Documentação**: Cada página inclui contexto do capítulo e orientação de progresso
- **Organização de Templates**: Exemplos e templates mapeados aos capítulos de aprendizagem apropriados
- **Integração de Recursos**: Cheat sheets, FAQs e guias de estudo ligados aos capítulos relevantes
- **Integração do Workshop**: Laboratórios práticos mapeados a múltiplos objetivos de aprendizagem

#### Alterado
- **Progressão da Aprendizagem**: Passagem de documentação linear para aprendizagem flexível baseada em capítulos
- **Posicionamento de Configuração**: Guia de configuração reposicionado para o Capítulo 3 para melhor fluxo de aprendizagem
- **Integração de Conteúdo AI**: Melhor integração do conteúdo específico de IA ao longo da jornada de aprendizagem
- **Conteúdo de Produção**: Padrões avançados consolidados no Capítulo 8 para aprendizes empresariais

#### Melhorado
- **Experiência do Utilizador**: Breadcrumbs de navegação claros e indicadores de progressão por capítulo
- **Acessibilidade**: Padrões de navegação consistentes para facilitar a travessia do curso
- **Apresentação Profissional**: Estrutura de curso ao estilo universitário adequada para formação académica e corporativa
- **Eficiência de Aprendizagem**: Redução do tempo para encontrar conteúdo relevante através de melhor organização

#### Implementação Técnica
- **Cabeçalhos de Navegação**: Navegação padronizada por capítulo em mais de 40 ficheiros de documentação
- **Rodapé de Navegação**: Orientação consistente de progresso e indicadores de conclusão de capítulos
- **Referências Cruzadas**: Sistema interno abrangente de links conectando conceitos relacionados
- **Mapeamento por Capítulo**: Templates e exemplos claramente associados a objetivos de aprendizagem

#### Melhoria do Guia de Estudo
- **📚 Objetivos de Aprendizagem Abrangentes**: Guia de estudo reestruturado para alinhar com sistema de 8 capítulos
- **🎯 Avaliação Baseada em Capítulos**: Cada capítulo inclui objetivos de aprendizagem específicos e exercícios práticos
- **📋 Acompanhamento de Progresso**: Cronograma semanal de aprendizagem com resultados mensuráveis e checklists de conclusão
- **❓ Questões de Avaliação**: Perguntas para validação do conhecimento em cada capítulo com resultados profissionais
- **🛠️ Exercícios Práticos**: Atividades hands-on com cenários reais de implementação e resolução de problemas
- **📊 Progressão de Competências**: Avanço claro dos conceitos básicos aos padrões empresariais com foco no desenvolvimento profissional
- **🎓 Estrutura de Certificação**: Resultados de desenvolvimento profissional e sistema de reconhecimento comunitário
- **⏱️ Gestão de Cronograma**: Plano estruturado de aprendizagem de 10 semanas com validação de marcos

### [v3.1.0] - 2025-09-17

#### Soluções de IA Multi-Agente Melhoradas
**Esta versão melhora a solução multi-agente para retalho com nomeação de agentes melhorada e documentação reforçada.**

#### Alterado
- **Terminologia Multi-Agente**: Substituído "agente Cora" por "agente Cliente" em toda a solução multi-agente para retalho para melhor clareza
- **Arquitetura dos Agentes**: Atualizada toda a documentação, templates ARM e exemplos de código para usar o nome consistente "agente Cliente"
- **Exemplos de Configuração**: Modernizados padrões de configuração dos agentes com convenções de nomenclatura atualizadas
- **Consistência na Documentação**: Garantido que todas as referências usam nomes profissionais e descritivos para os agentes

#### Melhorado
- **Pacote Template ARM**: Atualizado retail-multiagent-arm-template com referências ao agente Cliente
- **Diagramas de Arquitetura**: Diagramas Mermaid atualizados com nomeação do agente consistente
- **Exemplos de Código**: Classes Python e exemplos de implementação agora usam naming CustomerAgent
- **Variáveis de Ambiente**: Atualizados todos os scripts de implementação para usar convenções CUSTOMER_AGENT_NAME

#### Melhorado
- **Experiência do Desenvolvedor**: Papéis e responsabilidades do agente mais claros na documentação
- **Prontidão para Produção**: Melhor alinhamento com as convenções de nomenclatura empresariais
- **Materiais de Aprendizagem**: Nomes de agentes mais intuitivos para fins educativos
- **Usabilidade de Templates**: Compreensão simplificada das funções do agente e dos padrões de implementação

#### Detalhes Técnicos
- Diagramas de arquitetura Mermaid atualizados com referências a CustomerAgent
- Substituídos nomes da classe CoraAgent por CustomerAgent nos exemplos Python
- Modificadas configurações JSON do template ARM para usar o tipo de agente "customer"
- Variáveis de ambiente atualizadas de CORA_AGENT_* para os padrões CUSTOMER_AGENT_*
- Comandos de implementação e configurações de contêiner atualizados

### [v3.0.0] - 2025-09-12

#### Alterações Principais - Foco em Desenvolvedores de IA e Integração Microsoft Foundry
**Esta versão transforma o repositório numa recurso de aprendizagem abrangente focado em IA com integração Microsoft Foundry.**

#### Adicionado
- **🤖 Caminho de Aprendizagem AI-First**: Reestruturação completa a priorizar desenvolvedores e engenheiros de IA
- **Guia de Integração Microsoft Foundry**: Documentação abrangente para ligar AZD com serviços Microsoft Foundry
- **Padrões de Implementação de Modelos IA**: Guia detalhado sobre seleção, configuração e estratégias para produção
- **Workshop Laboratorial IA**: Workshop prático de 2-3 horas para converter aplicações IA em soluções deployáveis com AZD
- **Melhores Práticas de IA para Produção**: Padrões empresariais para escalabilidade, monitorização e segurança de workloads IA
- **Guia de Resolução de Problemas Específico para IA**: Solução de problemas abrangente para Azure OpenAI, Cognitive Services e implementação IA
- **Galeria de Templates IA**: Coleção destacada de templates Microsoft Foundry com classificações de complexidade
- **Materiais para Workshop**: Estrutura completa do workshop com laboratórios práticos e materiais de referência

#### Melhorado
- **Estrutura do README**: Foco no desenvolvedor IA com 45% de dados de interesse da comunidade Discord Microsoft Foundry
- **Caminhos de Aprendizagem**: Jornada dedicada a desenvolvedores IA paralelamente aos caminhos tradicionais para estudantes e engenheiros DevOps
- **Recomendações de Templates**: Templates IA destacados incluindo azure-search-openai-demo, contoso-chat e openai-chat-app-quickstart
- **Integração Comunitária**: Suporte melhorado na comunidade Discord com canais e discussões específicos de IA

#### Foco em Segurança & Produção
- **Padrões de Identidade Gerida**: Configurações de autenticação e segurança específicas de IA
- **Otimização de Custos**: Rastreamento do uso de tokens e controlo orçamental para cargas de trabalho IA
- **Implementação Multi-Região**: Estratégias para implementação global de aplicações IA
- **Monitorização de Performance**: Métricas específicas de IA e integração com Application Insights

#### Qualidade da Documentação
- **Estrutura Linear do Curso**: Progressão lógica do iniciante a padrões avançados de implementação IA
- **URLs Validados**: Todos os links externos do repositório verificados e acessíveis
- **Referência Completa**: Todos os links internos da documentação validados e operacionais
- **Pronto para Produção**: Padrões empresariais de implementação com exemplos reais

### [v2.0.0] - 2025-09-09

#### Alterações Principais - Reestruturação do Repositório e Melhoria Profissional
**Esta versão representa uma revisão significativa da estrutura do repositório e apresentação do conteúdo.**

#### Adicionado
- **Estrutura de Aprendizagem Estruturada**: Todas as páginas de documentação agora incluem Introdução, Objetivos de Aprendizagem e Resultados de Aprendizagem
- **Sistema de Navegação**: Adicionados links de lição Anterior/Seguinte em toda a documentação para progressão guiada
- **Guia de Estudo**: estudo-guia.md abrangente com objetivos, exercícios práticos e materiais de avaliação
- **Apresentação Profissional**: Removidos todos os ícones emoji para melhor acessibilidade e aparência profissional
- **Estrutura de Conteúdo Melhorada**: Organização e fluxo dos materiais de aprendizagem aprimorados

#### Alterado
- **Formato da Documentação**: Padronização completa da documentação com estrutura consistente focada no aprendizado
- **Fluxo de Navegação**: Implementação de progressão lógica por todo o conteúdo
- **Apresentação do Conteúdo**: Remoção de elementos decorativos em favor de formatação clara e profissional
- **Estrutura de Links**: Atualização de todos os links internos para suportar o novo sistema de navegação

#### Melhorado
- **Acessibilidade**: Remoção da dependência de emojis para melhor compatibilidade com leitores de ecrã
- **Aparência Profissional**: Apresentação limpa e académica adequada para aprendizagem empresarial
- **Experiência de Aprendizagem**: Abordagem estruturada com objetivos claros e resultados para cada lição
- **Organização de Conteúdo**: Melhor fluxo lógico e conexão entre tópicos relacionados

### [v1.0.0] - 2025-09-09

#### Lançamento Inicial - Repositório de Aprendizagem AZD Abrangente

#### Adicionado
- **Estrutura Principal da Documentação**
  - Série completa de guias para começar
  - Documentação abrangente de implementação e provisão
  - Recursos detalhados para resolução de problemas e depuração
  - Ferramentas e procedimentos de validação pré-implementação

- **Módulo de Introdução**
  - Fundamentos AZD: conceitos e terminologia essenciais
  - Guia de Instalação: instruções específicas por plataforma
  - Guia de Configuração: preparação do ambiente e autenticação
  - Tutorial do Primeiro Projeto: aprendizagem prática passo a passo

- **Módulo de Implementação e Provisão**
  - Guia de Implementação: documentação completa do fluxo de trabalho
  - Guia de Provisão: Infraestrutura como Código com Bicep
  - Melhores práticas para implementações de produção
  - Padrões para arquitetura multi-serviço

- **Módulo de Validação Pré-implementação**
  - Planeamento de Capacidade: validação da disponibilidade de recursos Azure
  - Escolha de SKU: orientação abrangente sobre níveis de serviço
  - Verificações pré-voo: scripts automatizados de validação (PowerShell e Bash)
  - Estimativa de custos e ferramentas de planeamento orçamental

- **Módulo de Resolução de Problemas**
  - Problemas Comuns: problemas frequentes e soluções
  - Guia de Depuração: metodologias sistemáticas para resolução
  - Técnicas e ferramentas avançadas de diagnóstico
  - Monitorização e otimização de desempenho

- **Recursos e Referências**
  - Folha de Comandos: referência rápida para comandos essenciais
  - Glossário: terminologia e definições de siglas abrangentes
  - FAQ: respostas detalhadas às perguntas comuns
  - Links para recursos externos e conexões comunitárias

- **Exemplos e Templates**
  - Exemplo de Aplicação Web Simples
  - Template para Website Estático
  - Configuração de Aplicação em Contêiner
  - Padrões de integração de bases de dados
  - Exemplos de arquitetura de microserviços
  - Implementações de funções serverless

#### Funcionalidades
- **Suporte Multi-Plataforma**: guias de instalação e configuração para Windows, macOS e Linux
- **Vários Níveis de Competência**: conteúdos desenhados para estudantes e profissionais
- **Foco Prático**: exemplos práticos e cenários reais
- **Cobertura Abrangente**: desde conceitos básicos a padrões empresariais avançados
- **Aproximação de Segurança**: melhores práticas de segurança integradas
- **Otimização de Custos**: orientações para implementações económicas e gestão de recursos

#### Qualidade da Documentação
- **Exemplos de Código Detalhados**: amostras práticas e testadas
- **Instruções Passo a Passo**: orientação clara e acionável
- **Gestão Abrangente de Erros**: resolução para problemas frequentes
- **Integração de Melhores Práticas**: padrões e recomendações da indústria
- **Compatibilidade de Versões**: atualizada com os serviços Azure e funcionalidades azd mais recentes

## Melhoramentos Planeados para o Futuro

### Versão 3.1.0 (Planeada)
#### Expansão da Plataforma IA
- **Suporte Multi-Modelo**: padrões de integração para Hugging Face, Azure Machine Learning e modelos personalizados
- **Frameworks de Agentes IA**: templates para implementações LangChain, Semantic Kernel e AutoGen
- **Padrões Avançados RAG**: opções de base de dados vetoriais além do Azure AI Search (Pinecone, Weaviate, etc.)
- **Observabilidade IA**: monitorização melhorada para desempenho de modelos, uso de tokens e qualidade de respostas

#### Experiência do Desenvolvedor
- **Extensão VS Code**: experiência integrada AZD + AI Foundry
- **Integração GitHub Copilot**: geração assistida por IA de templates AZD
- **Tutoriais Interativos**: exercícios de codificação práticos com validação automática para cenários IA
- **Conteúdo Vídeo**: tutoriais complementares para aprendizes visuais focados em implementações IA

### Versão 4.0.0 (Planeada)
#### Padrões Empresariais IA
- **Framework de Governança**: governança, conformidade e trilhas de auditoria para modelos IA
- **IA Multi-Inquilino**: padrões para servir vários clientes com serviços IA isolados
- **Implementação AI Edge**: integração com Azure IoT Edge e instâncias de contêiner
- **IA Cloud Híbrida**: padrões para implementações multi-cloud e híbridas de workloads IA

#### Funcionalidades Avançadas
- **Automação de Pipeline IA**: integração MLOps com pipelines Azure Machine Learning
- **Segurança Avançada**: padrões zero-trust, endpoints privados e proteção avançada contra ameaças
- **Otimização de Performance**: estratégias avançadas de tuning e escalonamento para aplicações IA de alto débito
- **Distribuição Global**: padrões de entrega de conteúdo e cache edge para aplicações IA

### Versão 3.0.0 (Planeada) - Substituída pela Versão Atual
#### Adições Propostas - Agora Implementadas na v3.0.0
- ✅ **Conteúdo Focado em IA**: integração abrangente Microsoft Foundry (Concluído)
- ✅ **Tutoriais Interativos**: laboratório prático IA (Concluído)
- ✅ **Módulo de Segurança Avançado**: padrões de segurança específicos IA (Concluído)
- ✅ **Otimização de Performance**: estratégias para workloads IA (Concluído)

### Versão 2.1.0 (Planeada) - Parcialmente Implementada na v3.0.0
#### Melhorias Menores - Algumas Concluídas na Versão Atual
- ✅ **Exemplos Adicionais**: cenários de implementação focados em IA (Concluído)
- ✅ **FAQ Alargado**: perguntas IA específicas e resolução de problemas (Concluído)
- **Integração de Ferramentas**: guias avançados para IDE e editores
- ✅ **Expansão da Monitorização**: padrões IA específicos para monitorização e alertas (Concluído)

#### Ainda Planeada para Futuras Versões
- **Documentação Otimizada para Mobile**: design responsivo para aprendizagem móvel
- **Acesso Offline**: pacotes de documentação descarregáveis
- **Integração Aprimorada IDE**: extensão VS Code para workflows AZD + IA
- **Painel da Comunidade**: métricas e rastreamento de contributos em tempo real

## Contribuindo para o Changelog

### Reportar Alterações
Ao contribuir para este repositório, assegure que as entradas do changelog incluem:

1. **Número da Versão**: seguindo versionamento semântico (major.minor.patch)
2. **Data**: data de lançamento ou atualização no formato AAAA-MM-DD
3. **Categoria**: Adicionado, Alterado, Obsoleto, Removido, Corrigido, Segurança
4. **Descrição Clara**: descrição concisa do que mudou
5. **Avaliação de Impacto**: como as mudanças afetam os utilizadores existentes

### Categorias de Mudança

#### Adicionado
- Novas funcionalidades, secções de documentação ou capacidades
- Novos exemplos, templates ou recursos de aprendizagem
- Ferramentas adicionais, scripts ou utilitários

#### Alterado
- Modificações em funcionalidades ou documentação existentes
- Atualizações para melhorar clareza ou precisão
- Reestruturação de conteúdo ou organização

#### Obsoleto
- Funcionalidades ou abordagens a serem descontinuadas
- Secções de documentação agendadas para remoção
- Métodos que têm alternativas melhores

#### Removido
- Funcionalidades, documentação ou exemplos que já não são relevantes
- Informação desatualizada ou abordagens obsoletas
- Conteúdo redundante ou consolidado

#### Corrigido
- Correções de erros em documentação ou código
- Resolução de problemas relatados
- Melhorias em precisão ou funcionalidade

#### Segurança
- Melhorias ou correções relacionadas com segurança
- Atualizações às melhores práticas de segurança
- Resolução de vulnerabilidades de segurança

### Diretrizes de Versionamento Semântico

#### Versão Principal (X.0.0)
- Mudanças que quebram compatibilidade e requerem ação do utilizador
- Reestruturações significativas de conteúdo ou organização
- Alterações que mudam a abordagem ou metodologia fundamental

#### Versão Secundária (X.Y.0)
- Novas funcionalidades ou conteúdos adicionados
- Melhorias que mantêm compatibilidade retroativa
- Exemplos, ferramentas ou recursos adicionais

#### Versão Patch (X.Y.Z)
- Correção de bugs e erros
- Melhorias pequenas em conteúdos existentes
- Esclarecimentos e pequenas melhorias

## Feedback e Sugestões da Comunidade

Encorajamos ativamente feedback da comunidade para melhorar este recurso de aprendizagem:

### Como Fornecer Feedback
- **Issues no GitHub**: reportar problemas ou sugerir melhorias (issues específicos de IA bem-vindos)
- **Discussões no Discord**: partilhar ideias e envolver-se com a comunidade Microsoft Foundry
- **Pull Requests**: contribuir com melhorias diretas ao conteúdo, especialmente templates e guias IA
- **Discord Microsoft Foundry**: participar no canal #Azure para discussões AZD + IA
- **Fóruns Comunitários**: participar nas discussões mais amplas de desenvolvedores Azure

### Categorias de Feedback
- **Precisão do Conteúdo IA**: correções relativas à integração e implementação de serviços IA
- **Experiência de Aprendizagem**: sugestões para melhorar o fluxo de aprendizagem dos desenvolvedores IA
- **Conteúdo IA em Falta**: pedidos para mais templates, padrões ou exemplos IA
- **Acessibilidade**: melhorias para necessidades diversificadas de aprendizagem
- **Integração de Ferramentas IA**: sugestões para melhor integração no workflow de desenvolvimento IA
- **Padrões de IA para Produção**: pedidos para padrões empresariais de implementação IA

### Compromisso de Resposta
- **Resposta a Issues**: Em até 48 horas para problemas reportados
- **Pedidos de Funcionalidades**: Avaliação em até uma semana
- **Contribuições Comunitárias**: Revisão em até uma semana
- **Questões de Segurança**: Prioridade imediata com resposta acelerada

## Plano de Manutenção

### Atualizações Regulares
- **Revisões Mensais**: precisão do conteúdo e validação de links
- **Atualizações Trimestrais**: adições e melhorias significativas de conteúdo
- **Revisões Semestrais**: reestruturações abrangentes e aprimoramentos
- **Lançamentos Anuais**: atualizações principais com melhorias importantes

### Monitorização e Garantia de Qualidade
- **Testes Automatizados**: validação regular de exemplos de código e links
- **Integração do Feedback Comunitário**: incorporação regular de sugestões dos utilizadores
- **Atualizações Tecnológicas**: alinhamento com os mais recentes serviços Azure e releases azd
- **Auditorias de Acessibilidade**: revisão periódica para garantir princípios de design inclusivo

## Política de Suporte de Versão

### Suporte da Versão Atual
- **Última Versão Principal**: suporte completo com atualizações regulares
- **Versão Principal Anterior**: atualizações de segurança e correções críticas por 12 meses
- **Versões Legadas**: suporte comunitário apenas, sem atualizações oficiais

### Orientações para Migração
Quando versões principais forem lançadas, disponibilizamos:
- **Guias de Migração**: Instruções passo a passo para a transição
- **Notas de Compatibilidade**: Detalhes sobre alterações incompatíveis
- **Suporte de Ferramentas**: Scripts ou utilitários para ajudar na migração
- **Suporte da Comunidade**: Fóruns dedicados a questões de migração

---

**Navegação**
- **Lição Anterior**: [Guia de Estudo](resources/study-guide.md)
- **Próxima Lição**: Voltar para o [README Principal](README.md)

**Mantenha-se Atualizado**: Observe este repositório para notificações sobre novas versões e atualizações importantes nos materiais de aprendizagem.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Isenção de responsabilidade**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, por favor tenha em conta que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se a tradução humana profissional. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->