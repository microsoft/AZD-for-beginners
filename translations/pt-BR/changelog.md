# Registro de Alterações - AZD Para Iniciantes

## Introdução

Este registro de alterações documenta todas as mudanças, atualizações e melhorias notáveis no repositório AZD Para Iniciantes. Seguimos os princípios de versionamento semântico e mantemos este registro para ajudar os usuários a entender o que mudou entre as versões.

## Objetivos de Aprendizagem

Ao revisar este registro de alterações, você irá:
- Manter-se informado sobre novas funcionalidades e adições de conteúdo
- Entender melhorias feitas na documentação existente
- Acompanhar correções de bugs e ajustes para garantir a precisão
- Seguir a evolução dos materiais de aprendizagem ao longo do tempo

## Resultados de Aprendizagem

Após revisar as entradas do registro de alterações, você será capaz de:
- Identificar novos conteúdos e recursos disponíveis para aprendizado
- Entender quais seções foram atualizadas ou melhoradas
- Planejar seu caminho de aprendizagem com base nos materiais mais atuais
- Contribuir com feedback e sugestões para melhorias futuras

## Histórico de Versões

### [v3.23.0] - 2026-07-13

#### Atualização AZD 1.27.1: Atualização da Versão Vigente
**Esta versão revalida o curso contra o `azd` `1.27.1` (julho de 2026, última versão estável) e a extensão de agente de IA preview atual `azure.ai.agents` `1.0.0-beta.5`, atualizando todos os banners "validado contra" após os lançamentos 1.26.0, 1.27.0, e 1.27.1.**

#### Alterações
- **✅ Linha de base de validação atualizada** de `azd 1.25.6` (junho de 2026) para `azd 1.27.1` (julho de 2026) no README raiz, todos os READMEs dos capítulos, na lição do dev-container do Capítulo 1 (incluindo exemplos com versão fixa), na lição de modelos personalizados do Capítulo 4, na lição multi-agente do Capítulo 5 e na documentação do workshop
- **🤖 Linha de base do Capítulo 2 atualizada** de `azd 1.23.12` (março de 2026) para `azd 1.27.1` em `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` e `microsoft-foundry-integration.md`; datas da nota de validação atualizadas para 2026-07-13
- **🧩 Extensão de agente de IA atualizada** de `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` para a versão atual `1.0.0-beta.5` no README do Capítulo 2 e em `agents.md`
- **🧪 Exemplo de validação do workshop** (saída do `azd version`) atualizado para `1.27.1`

#### Notas sobre versões relevantes do azd (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Suporte Go para Azure Functions no Flex Consumption, filtros de assinatura por inquilino `azd config sub-filter`, bundles de extensões autocontidos (`azd x pack --bundle`), e `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Modelagem de projetos/agentes Azure AI Foundry diretamente em `azure.yaml` (inicialização sem Bicep/Terraform), suporte a implantação de contêiner para App Service (`host: appservice` + `language: docker`), `-s/--source` direto para comandos `azd extension`, e `azd tool uninstall`
- **1.27.1 (2026-07-09):** flag `--no-dependencies` para `azd extension install`, modelos obsoletos excluídos dos prompts de catálogo/cota por padrão, e várias correções de bugs

#### Arquivos Atualizados
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md`
- `docs/chapter-01-foundation/dev-containers.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/custom-templates.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

### [v3.22.0] - 2026-06-16

#### Preenchimento de Lacunas para Iniciantes #2: Criação de Templates, Dev Containers, Pulumi, Azure DevOps, Service Principals e Mais
**Esta versão resolve as lacunas intermediárias restantes detectadas pela análise de cobertura do azd: como criar e publicar seu próprio template, ambientes reproduzíveis de dev-container/Codespaces, o provedor de infraestrutura Pulumi, um passo a passo do Azure DevOps CI/CD, autenticação com service-principal, orientações para seleção de host (AKS/Spring Apps), explicações sobre `azd restore`/`azd package`, tratamento de erros em hooks, e práticas para ambientes compartilhados/de equipe.**

#### Adições
- **🧱 Nova lição do Capítulo 4** `docs/chapter-04-infrastructure/custom-templates.md` — criação do seu próprio template azd: estrutura necessária (`azure.yaml`, `infra/`, `src/`), o campo `metadata.template`, parametrização da infraestrutura com o token de recurso `uniqueString()` e a tag `azd-env-name`, testes locais com `azd init --template <local-path>`, publicação no GitHub, e submissão para a galeria Awesome AZD
- **📦 Nova lição do Capítulo 1** `docs/chapter-01-foundation/dev-containers.md` — ambientes azd reproduzíveis com Dev Containers e GitHub Codespaces: um `.devcontainer/devcontainer.json` minimalista usando a feature oficial `ghcr.io/azure/azure-dev/azd`, features específicas de linguagem, `docker-in-docker` para hosts de contêiner, e `azd auth login --use-device-code` para login remoto
- **🧩 Pulumi com azd** seção em `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, layout da pasta Pulumi, stacks mapeados para ambientes azd, outputs/tagging requeridos, e o fluxo de trabalho idêntico de `azd up` / `azd down`
- **🎯 Orientação para seleção de host** em `docs/chapter-04-infrastructure/provisioning.md` — comparação amigável para iniciantes entre `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` e `springapp`, com orientações sobre quando escolher AKS ou Azure Spring Apps
- **🛠️ Passo a passo do Azure DevOps CI/CD** em `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, conexão de serviço com federação de identidade de workload (OIDC), o `azure-dev.yml` gerado, e configuração do grupo de variáveis
- **🔑 Service Principals (Padrão 4)** adicionados em `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, autenticação não interativa `azd auth login` com segredo do cliente versus credenciais federadas/OIDC, quando usar, e armazenamento seguro de credenciais
- **🪝 Tratamento de erros em hooks** subseção em `docs/chapter-04-infrastructure/deployment-guide.md` — códigos de saída e `set -e`, `continueOnError`, testes de hooks isoladamente com `azd hooks run`, shells específicos para SO, e `--debug`
- **👥 Ambientes de equipe/compartilhados** seção em `docs/chapter-03-configuration/configuration.md` — o que fica em `.azure/`, o que deve ser ignorado no git, ambientes por desenvolvedor, `azd env list`/`select`, e fornecimento de valores de ambiente em CI/CD
- **🧰 Explicações ampliadas para `azd restore` e `azd package`** em `resources/cheat-sheet.md` — restaurando dependências e construindo um artefato implantável sem implantar

#### Alterações
- **🧭 Tabela de lições do Capítulo 4** atualizada para incluir a nova lição "Criando Seu Próprio Template" (Lição 3)
- **🧭 Tabela de lições do Capítulo 1** atualizada para incluir a nova lição "Dev Containers & Codespaces" (Lição 5); rodapés de navegação conectados entre `bring-your-own-app.md` e `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Preenchimento de Lacunas para Iniciantes: Lição Prática Multi-Agente, "Traga Seu Próprio App", Terraform e Passo a Passo de CI/CD
**Esta versão fecha as maiores lacunas para um guia completo para iniciantes, adicionando duas novas lições práticas (um passo a passo multi-agente implantável e como adicionar azd a um app existente), uma introdução amigável a hooks, uma seção sobre Terraform com azd, um passo a passo do pipeline GitHub Actions, uma explicação das novas extensões preview, e uma checklist explícita de verificação de implantação.**

#### Adições
- **🤝 Nova lição do Capítulo 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — um passo a passo totalmente prático, implantável, com dois agentes (orquestrador + especialistas) usando um template real (`contoso-creative-writer`), abordando quando usar multi-agente, o fluxo de trabalho `azd up`, entendimento dos recursos implantados, rastreamento entre agentes, personalização e limpeza
- **📦 Nova lição do Capítulo 1** `docs/chapter-01-foundation/bring-your-own-app.md` — como adicionar azd a um projeto existente com `azd init` ("usar código no diretório atual"), entendendo `azure.yaml` e `infra/`, `azd infra generate`, detecção de host, e implantação com `azd up`
- **🌐 Seção Terraform com azd** adicionada em `docs/chapter-04-infrastructure/provisioning.md` — config `infra.provider: terraform`, layout da pasta `.tf`, outputs necessários `AZURE_*` e tagging `azd-env-name`, e fluxo de trabalho idêntico de `azd up` / `azd down` (fecha a lacuna onde o suporte Terraform era citado mas só Bicep era mostrado)
- **⚙️ Passo a passo do GitHub Actions** em `docs/chapter-08-production/production-ai-practices.md` — desde o repositório GitHub até implantações automatizadas: `azd pipeline config`, credenciais federadas OIDC (sem segredos armazenados), o `azure-dev.yml` gerado, e orientações sobre segredos versus variáveis
- **🪝 Introdução para iniciantes "Novo em hooks?"** em `docs/chapter-04-infrastructure/deployment-guide.md` — o que é um hook, tabela de estágios de hook, um hook mínimo inicial, e execução manual de hooks com `azd hooks run`
- **✅ Checklist "Verifique Sua Implantação"** adicionada ao Passo 5 de `docs/chapter-01-foundation/first-project.md` — teste rápido, checagem do endpoint de saúde, e critérios explícitos de sucesso
- **🧩 Explicação das novas extensões preview** `azure.ai.skills` e `azure.ai.connections` (o que são e quando usar) em `docs/chapter-08-production/production-ai-practices.md`

#### Alterações
- **🧭 Tabela de lições do Capítulo 5** corrigida: `multi-agent-basics.md` agora é a Lição 1 (a única lição totalmente prática), com rotulagem honesta que a Lição 2 está no Capítulo 6 e que o cenário de varejo é um blueprint de arquitetura, não um template de um comando só
- **🧭 Tabela de lições do Capítulo 1** agora inclui a nova lição "Traga Seu Próprio App" (Lição 4)
- **🔗 Rodapés de navegação** atualizados: `first-project.md` agora linka para frente para `bring-your-own-app.md`

#### Correções
- **🧱 Fechada a lacuna "Terraform citado mas ausente"** — o curso anteriormente mencionava suporte Terraform sem mostrá-lo
- **🔀 Corrigidos links cruzados enganosos no Capítulo 5** que davam a entender que uma implementação completa multi-agente existia quando havia apenas um blueprint de arquitetura

#### Arquivos Atualizados
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(novo)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(novo)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### Atualização AZD 1.25.6, Comandos Completos do Ciclo de Vida do Agente & Rebranding Aspire

**Esta versão revalida o curso contra `azd` `1.25.6` (junho de 2026) e a extensão `azure.ai.agents` `0.1.40-preview`, expande a orientação sobre IA de "estruturar um agente" para o ciclo completo de vida do agente (teste → avaliação → otimização → inspeção → exclusão), destaca as novas extensões preview `azure.ai.skills` e `azure.ai.connections`, e observa a rebranding do produto ".NET Aspire" para "Aspire".**

#### Adicionado
- **🔁 Cobertura completa do ciclo de vida do agente** para iniciantes e engenheiros de IA em toda a documentação:
  - `docs/chapter-01-foundation/azd-basics.md` — Tabela do ciclo de vida (estruturar → testar → medir → melhorar → inspecionar → limpar) adicionada à seção Extensões e Comandos de IA
  - `docs/chapter-08-production/production-ai-practices.md` — Nova seção "Gerenciando o ciclo de vida do agente" cobrindo `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, e `delete --force`
  - `resources/cheat-sheet.md` — Comandos do Agente de IA expandidos com `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, e `delete --force`
- **🧩 Novas extensões preview** documentadas: `azure.ai.skills` (habilidades reutilizáveis do agente) e `azure.ai.connections` (conexões Foundry) adicionadas à tabela de extensões e ao resumo rápido
- **⏱️ Orientação sobre tempo de resposta** — exemplos de `azd ai agent invoke` agora indicam que imprime latência total e tempo até o primeiro byte
- **📌 Banner de versão** no README raiz apontando os aprendizes para `azd version` e `azd upgrade`

#### Alterado
- **✅ Linha base de validação atualizada** de `azd 1.23.12` (março de 2026) para `azd 1.25.6` (junho de 2026) em todos os READMEs dos capítulos e documentação do workshop
- **🤖 Nota de extensão do Capítulo 2** atualizada de `azure.ai.agents` `0.1.18-preview` para `0.1.40-preview`
- **🧪 Exemplo de validação do workshop** (saída de `azd version`) atualizado para `1.25.6`
- **🧭 README "Novidades do azd hoje"** atualizado para destacar o ciclo completo de vida do agente, novas extensões de IA e correções recentes de qualidade de vida (`azd init` idempotência, limpeza de token expirado com `azd auth login`, prompt na primeira execução do `azd tool`)
- **📖 agentes.md do Capítulo 2 (Opção 4)** agora direciona os aprendizes para os comandos do ciclo de vida pós-implantação em vez de parar no `azd up`

#### Corrigido
- **🏷️ Nome do produto** — adicionada uma nota sobre a rebranding Aspire (".NET Aspire" agora é simplesmente "Aspire"); suporte do azd para Aspire permanece inalterado
- **🔎 Validação ao vivo de release** confirmada contra feed de releases do Azure Developer CLI: CLI estável `1.25.6` (2026-06-12) e `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Arquivos Atualizados
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `resources/cheat-sheet.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

---

### [v3.19.1] - 2026-03-27

#### Esclarecimento para iniciantes, validação de configuração e limpeza final dos comandos AZD
**Esta versão sucede a varredura de validação do AZD 1.23 com um aprimoramento da documentação focado em iniciantes: esclarece o guia de autenticação preferencial pelo AZD, adiciona scripts para validação da configuração local, verifica comandos-chave contra a CLI AZD em uso e remove as últimas referências obsoletas em inglês fora do changelog.**

#### Adicionado
- **🧪 Scripts de validação para iniciantes** com `validate-setup.ps1` e `validate-setup.sh` para que aprendizes possam confirmar as ferramentas necessárias antes de começar o Capítulo 1
- **✅ Passos iniciais de validação de configuração** no README raiz e no README do Capítulo 1 para que pré-requisitos ausentes sejam detectados antes do `azd up`

#### Alterado
- **🔐 Guia de autenticação para iniciantes** agora trata consistentemente `azd auth login` como caminho principal para fluxos AZD, com `az login` destacado como opcional, exceto quando comandos da Azure CLI são usados diretamente
- **📚 Fluxo de onboarding do Capítulo 1** agora orienta os aprendizes a validar a configuração local antes dos passos de instalação, autenticação e primeira implantação
- **🛠️ Mensagens do validador** agora separam claramente requisitos bloqueadores de avisos opcionais da Azure CLI para o caminho somente AZD para iniciantes
- **📖 Documentação de configuração, resolução de problemas e exemplos** agora distingue autenticação AZD obrigatória e login opcional da Azure CLI onde anteriormente eram apresentados juntos

#### Corrigido
- **📋 Restantes referências a comandos em inglês** atualizadas para as formas atuais do AZD, incluindo `azd config show` no resumo rápido e `azd monitor --overview` onde a intenção era guiar no overview do Portal do Azure
- **🧭 Declarações para iniciantes no Capítulo 1** suavizadas para evitar promessas exageradas de comportamento sem erros garantidos ou rollback em todos os templates e recursos do Azure
- **🔎 Validação ao vivo da CLI** confirmada para suporte atual a `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, e `azd down --force --purge`

#### Arquivos Atualizados
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `examples/container-app/README.md`
- `examples/database-app/README.md`
- `resources/cheat-sheet.md`
- `validate-setup.ps1`
- `validate-setup.sh`

---

### [v3.19.0] - 2026-03-26

#### Validação AZD 1.23.12, Expansão do Ambiente do Workshop & Atualização do Modelo de IA
**Esta versão executa uma varredura de validação da documentação contra `azd` `1.23.12`, atualiza exemplos antigos de comandos AZD, atualiza a orientação dos modelos de IA para os padrões atuais e amplia as instruções do workshop além do GitHub Codespaces para também suportar containers de desenvolvimento e clones locais.**

#### Adicionado
- **✅ Notas de validação em capítulos principais e documentação do workshop** para tornar a linha base testada do AZD explícita para aprendizes que usam versões mais novas ou antigas da CLI
- **⏱️ Orientação para timeout de implantação** em implantações longas de apps IA usando `azd deploy --timeout 1800`
- **🔎 Passos para inspeção de extensão** com `azd extension show azure.ai.agents` na documentação do fluxo de trabalho de IA
- **🌐 Guia mais abrangente para ambiente do workshop** cobrindo GitHub Codespaces, containers de desenvolvimento e clones locais com MkDocs

#### Alterado
- **📚 READMEs de introdução aos capítulos** agora mencionam consistentemente validação contra `azd 1.23.12` nas seções de fundação, configuração, infraestrutura, multiagente, pré-implantação, solução de problemas e produção
- **🛠️ Referências dos comandos AZD** atualizadas para as formas atuais em toda a documentação:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` ou `azd env get-value(s)` dependendo do contexto
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` onde é indicado o overview no Application Insights
- **🧪 Exemplos de provisionamento preview** simplificados para os usos suportados atuais como `azd provision --preview` e `azd provision --preview -e production`
- **🧭 Fluxo do workshop** atualizado para que aprendizes possam completar os laboratórios em Codespaces, container de desenvolvimento ou clone local em vez de presumir execução apenas em Codespaces
- **🔐 Orientação de autenticação** agora prefere `azd auth login` para fluxos AZD, posicionando `az login` como opcional quando comandos da Azure CLI são usados diretamente

#### Corrigido
- **🪟 Comandos de instalação do Windows** padronizados para a capitalização atual do pacote `winget` no guia de instalação
- **🐧 Guia de instalação no Linux** corrigido para evitar instruções de gerenciador de pacotes `azd` específicas de distro não suportadas e direcionar a assets de release quando apropriado
- **📦 Exemplos de modelos de IA** atualizados dos padrões antigos como `gpt-35-turbo` e `text-embedding-ada-002` para exemplos atuais como `gpt-4.1-mini`, `gpt-4.1` e `text-embedding-3-large`
- **📋 Trechos de implantação e diagnóstico** corrigidos para usar comandos atuais de ambiente e status em logs, scripts e passos de solução de problemas
- **⚙️ Guia para GitHub Actions** atualizado de `Azure/setup-azd@v1.0.0` para `Azure/setup-azd@v2`
- **🤖 Orientação de consentimento MCP/Copilot** atualizada de `azd mcp consent` para `azd copilot consent list`

#### Melhorado
- **🧠 Guia do capítulo de IA** agora explica melhor o comportamento sensível a preview de `azd ai`, login específico do tenant, uso atual de extensões e recomendações atualizadas para implantação de modelos
- **🧪 Instruções do workshop** agora usam exemplos de versões mais realistas e linguagem mais clara para configuração do ambiente em laboratórios práticos
- **📈 Documentação de produção e troubleshooting** agora está mais alinhada com exemplos atuais de monitoramento, modelo fallback e níveis de custo

#### Arquivos Atualizados
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-03-configuration/configuration.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-06-pre-deployment/preflight-checks.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `docs/chapter-07-troubleshooting/common-issues.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `workshop/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/1-Select-AI-Template.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`
- `workshop/docs/instructions/3-Deconstruct-AI-Template.md`
- `workshop/docs/instructions/5-Customize-AI-Template.md`

---

### [v3.18.0] - 2026-03-16

#### Comandos AZD AI CLI, Validação de Conteúdo & Expansão de Template
**Esta versão adiciona cobertura dos comandos `azd ai`, `azd extension` e `azd mcp` em todos os capítulos relacionados a IA, corrige links quebrados e código depreciado em agents.md, atualiza o resumo rápido e revisa a seção de Templates de Exemplo com descrições validadas e novos templates Azure AI AZD.**

#### Adicionado
- **🤖 Cobertura do CLI AZD AI** em 7 arquivos (anteriormente apenas no Capítulo 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nova seção "Extensões e Comandos de IA" introduzindo `azd extension`, `azd ai agent init`, e `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opção 4: `azd ai agent init` com tabela comparativa (template vs abordagem manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Subseções "Extensões AZD para Foundry" e "Implantação com foco no agente"

  - `docs/chapter-05-multi-agent/README.md` — Início rápido agora mostra caminhos de implantação com base em modelo e manifesto
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — A seção de implantação agora inclui a opção `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Subseção "Comandos da Extensão AZD AI para Diagnóstico"
  - `resources/cheat-sheet.md` — Nova seção "Comandos de IA & Extensões" com `azd extension`, `azd ai agent init`, `azd mcp` e `azd infra generate`
- **📦 Novos modelos de exemplo AZD AI** em `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — Chat RAG .NET com Blazor WebAssembly, Semantic Kernel e suporte a chat por voz
  - **azure-search-openai-demo-java** — Chat RAG Java usando Langchain4J com opções de implantação ACA/AKS
  - **contoso-creative-writer** — App de escrita criativa multi-agente usando Azure AI Agent Service, Bing Grounding e Prompty
  - **serverless-chat-langchainjs** — RAG serverless usando Azure Functions + LangChain.js + Cosmos DB com suporte local Ollama para desenvolvimento
  - **chat-with-your-data-solution-accelerator** — Acelerador empresarial RAG com portal administrativo, integração Teams e opções PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — App de referência de orquestração MCP multi-agente com servidores em .NET, Python, Java e TypeScript
  - **azd-ai-starter** — Template inicial mínimo de infraestrutura Azure AI em Bicep
  - **🔗 Link da Galeria Incrível AZD AI** — Referência para a [galeria incrível de AZD AI](https://azure.github.io/awesome-azd/?tags=ai) (80+ templates)

#### Corrigido
- **🔗 navegação agents.md**: Links Anterior/Próximo agora correspondem à ordem das lições no README do Capítulo 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 links quebrados em agents.md**: `production-ai-practices.md` corrigido para `../chapter-08-production/production-ai-practices.md` (3 ocorrências)
- **📦 código depreciado em agents.md**: Substituído `opencensus` por `azure-monitor-opentelemetry` + SDK OpenTelemetry
- **🐛 API inválida em agents.md**: `max_tokens` movido de `create_agent()` para `create_run()` como `max_completion_tokens`
- **🔢 contagem de tokens em agents.md**: Estimativa grosseira `len//4` substituída por `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Serviços corrigidos de "Cognitive Search + App Service" para "Azure AI Search + Azure Container Apps" (host padrão alterado em outubro de 2024)
- **contoso-chat**: Descrição atualizada para referenciar Azure AI Foundry + Prompty, refletindo o título e stack tech reais do repositório

#### Removido
- **ai-document-processing**: Referência a template não funcional removida (repositório não acessível publicamente como template AZD)

#### Melhorado
- **📝 exercícios em agents.md**: Exercício 1 agora mostra saída esperada e passo `azd monitor`; Exercício 2 inclui código completo de registro `FunctionTool`; Exercício 3 substitui orientação vaga por comandos concretos `prepdocs.py`
- **📚 recursos em agents.md**: Links de documentação atualizados para docs atuais do Azure AI Agent Service e quickstart
- **📋 tabela de Próximos Passos em agents.md**: Link para AI Workshop Lab adicionado para cobertura completa do capítulo

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

#### Aprimoramento na Navegação do Curso
**Esta versão melhora a navegação dos capítulos no README.md com formato de tabela aprimorado.**

#### Alterado
- **Tabela do Mapa do Curso**: Aprimorada com links diretos para aulas, estimativas de duração e classificações de complexidade
- **Limpeza de Pastas**: Removidas pastas antigas redundantes (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Validação de Links**: Mais de 21 links internos na tabela do Mapa do Curso verificados

### [v3.16.0] - 2026-02-05

#### Atualizações nos Nomes dos Produtos
**Esta versão atualiza as referências de produtos para a marca atual da Microsoft.**

#### Alterado
- **Microsoft Foundry → Microsoft Foundry**: Todas as referências atualizadas em arquivos não relacionados à tradução
- **Azure AI Agent Service → Foundry Agents**: Nome do serviço atualizado para refletir a marca atual

#### Arquivos Atualizados
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

#### Reestruturação Maior do Repositório: Pastas Nomeadas por Capítulo
**Esta versão reorganiza a documentação em pastas dedicadas por capítulo para navegação mais clara.**

#### Renomeação das Pastas
Pastas antigas foram substituídas por pastas numeradas por capítulo:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Adicionada nova: `docs/chapter-05-multi-agent/`

#### Migração de Arquivos
| Arquivo | De | Para |
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
| Todos os arquivos pre-deployment | pre-deployment/ | chapter-06-pre-deployment/ |
| Todos os arquivos troubleshooting | troubleshooting/ | chapter-07-troubleshooting/ |

#### Adicionado
- **📚 Arquivos README dos Capítulos**: Criados README.md em cada pasta de capítulo com:
  - Objetivos de aprendizado e duração
  - Tabela de aulas com descrições
  - Comandos de início rápido
  - Navegação para outros capítulos

#### Alterado
- **🔗 Atualizados todos os links internos**: Mais de 78 caminhos atualizados em todos os arquivos de documentação
- **🗺️ README.md principal**: Mapa do Curso atualizado com a nova estrutura de capítulos
- **📝 examples/README.md**: Referências cruzadas atualizadas para pastas de capítulos

#### Removido
- Estrutura antiga de pastas (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Reestruturação do Repositório: Navegação por Capítulo
**Esta versão adicionou arquivos README de navegação por capítulo (substituída pela v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Novo Guia de Agentes de IA
**Esta versão adiciona um guia abrangente para implantar agentes de IA com Azure Developer CLI.**

#### Adicionado
- **🤖 docs/microsoft-foundry/agents.md**: Guia completo cobrindo:
  - O que são agentes de IA e como diferem de chatbots
  - Três templates de início rápido para agentes (Foundry Agents, Prompty, RAG)
  - Padrões de arquitetura de agente (agente único, RAG, multi-agente)
  - Configuração e personalização de ferramentas
  - Monitoramento e rastreamento de métricas
  - Considerações de custo e otimização
  - Cenários comuns de solução de problemas
  - Três exercícios práticos com critérios de sucesso

#### Estrutura do Conteúdo
- **Introdução**: Conceitos de agente para iniciantes
- **Início Rápido**: Implantação de agentes com `azd init --template get-started-with-ai-agents`
- **Padrões de Arquitetura**: Diagramas visuais dos padrões de agente
- **Configuração**: Configuração de ferramenta e variáveis de ambiente
- **Monitoramento**: Integração com Application Insights
- **Exercícios**: Aprendizado prático progressivo (20-45 minutos cada)

---

### [v3.12.0] - 2026-02-05

#### Atualização do Ambiente DevContainer
**Esta versão atualiza a configuração do container de desenvolvimento com ferramentas modernas e melhores padrões para a experiência de aprendizado AZD.**

#### Alterado
- **🐳 Imagem Base**: Atualizada de `python:3.12-bullseye` para `python:3.12-bookworm` (última versão estável do Debian)
- **📛 Nome do Container**: Renomeado de "Python 3" para "AZD para Iniciantes" para maior clareza

#### Adicionado
- **🔧 Novos Recursos do Dev Container**:
  - `azure-cli` com suporte Bicep habilitado
  - `node:20` (versão LTS para templates AZD)
  - `github-cli` para gerenciamento de templates
  - `docker-in-docker` para implantações de apps em container

- **🔌 Encaminhamento de Portas**: Portas pré-configuradas para desenvolvimento comum:
  - 8000 (pré-visualização MkDocs)
  - 3000 (apps web)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Novas Extensões VS Code**:
  - `ms-python.vscode-pylance` - IntelliSense Python aprimorado
  - `ms-azuretools.vscode-azurefunctions` - Suporte ao Azure Functions
  - `ms-azuretools.vscode-docker` - Suporte Docker
  - `ms-azuretools.vscode-bicep` - Suporte à linguagem Bicep
  - `ms-azure-devtools.azure-resource-groups` - Gerenciamento de recursos Azure
  - `yzhang.markdown-all-in-one` - Edição Markdown
  - `DavidAnson.vscode-markdownlint` - Lint para Markdown
  - `bierner.markdown-mermaid` - Suporte a diagramas Mermaid
  - `redhat.vscode-yaml` - Suporte YAML (para azure.yaml)
  - `eamodio.gitlens` - Visualização Git
  - `mhutchie.git-graph` - Histórico Git

- **⚙️ Configurações do VS Code**: Adicionadas configurações padrão para interpretador Python, formato ao salvar e remoção de espaços em branco

- **📦 requirements-dev.txt atualizado**:
  - Adicionado plugin de minificação MkDocs
  - Adicionado pre-commit para qualidade de código
  - Adicionados pacotes Azure SDK (azure-identity, azure-mgmt-resource)

#### Corrigido
- **Comando Pós-Criação**: Agora verifica instalação do AZD e Azure CLI na inicialização do container

---

### [v3.11.0] - 2026-02-05

#### Reformulação do README para Iniciantes
**Esta versão melhora significativamente o README.md para ser mais acessível para iniciantes e adiciona recursos essenciais para desenvolvedores de IA.**

#### Adicionado
- **🆚 Comparação Azure CLI vs AZD**: Explicação clara de quando usar cada ferramenta com exemplos práticos
- **🌟 Links Incríveis do AZD**: Links diretos para galeria comunitária de templates e recursos de contribuição:
  - [Galeria Incrível AZD](https://azure.github.io/awesome-azd/) - Mais de 200 templates prontos para implantação
  - [Submeta um Template](https://github.com/Azure/awesome-azd/issues) - Contribuição comunitária
- **🎯 Guia de Início Rápido**: Seção simplificada de 3 passos para começar (Instalar → Login → Implantar)
- **📊 Tabela de Navegação Baseada em Experiência**: Orientação clara sobre onde começar baseado na experiência do desenvolvedor

#### Alterado
- **Estrutura do README**: Reorganizado para divulgação progressiva - informação chave primeiro
- **Seção de Introdução**: Reescrita para explicar "A Magia do `azd up`" para iniciantes completos
- **Removido Conteúdo Duplicado**: Eliminada seção duplicada de solução de problemas
- **Comandos de Solução de Problemas**: Corrigida referência `azd logs` para usar `azd monitor --logs` válido

#### Corrigido

- **🔐 Comandos de Autenticação**: Adicionado `azd auth login` e `azd auth logout` em cheat-sheet.md
- **Referências de Comandos Inválidos**: Removido o restante de `azd logs` da seção de solução de problemas do README

#### Notas
- **Escopo**: Alterações aplicadas ao README.md principal e resources/cheat-sheet.md
- **Público-alvo**: Melhorias especificamente direcionadas a desenvolvedores novos no AZD

---

### [v3.10.0] - 2026-02-05

#### Atualização na Precisão dos Comandos do Azure Developer CLI
**Esta versão corrige comandos AZD inexistentes em toda a documentação, garantindo que todos os exemplos de código utilizem sintaxe válida do Azure Developer CLI.**

#### Corrigido
- **🔧 Comandos AZD Inexistentes Removidos**: Auditoria abrangente e correção de comandos inválidos:
  - `azd logs` (não existe) → substituído por `azd monitor --logs` ou alternativas Azure CLI
  - Subcomandos de `azd service` (não existem) → substituídos por `azd show` e Azure CLI
  - `azd infra import/export/validate` (não existem) → removidos ou substituídos por alternativas válidas
  - Flags `azd deploy --rollback/--incremental/--parallel/--detect-changes` (não existem) → removidas
  - Flags `azd provision --what-if/--rollback` (não existem) → atualizadas para usar `--preview`
  - `azd config validate` (não existe) → substituído por `azd config list`
  - `azd info`, `azd history`, `azd metrics` (não existem) → removidos

- **📚 Arquivos Atualizados com Correções de Comandos**:
  - `resources/cheat-sheet.md`: Revisão completa da referência de comandos
  - `docs/deployment/deployment-guide.md`: Correção de estratégias de rollback e implantação
  - `docs/troubleshooting/debugging.md`: Correção de seções de análise de logs
  - `docs/troubleshooting/common-issues.md`: Atualização dos comandos de solução de problemas
  - `docs/troubleshooting/ai-troubleshooting.md`: Correção da seção de depuração AZD
  - `docs/getting-started/azd-basics.md`: Correção dos comandos de monitoramento
  - `docs/getting-started/first-project.md`: Atualização dos exemplos de monitoramento e depuração
  - `docs/getting-started/installation.md`: Ajuste nos exemplos de ajuda e versão
  - `docs/pre-deployment/application-insights.md`: Correção dos comandos para visualização de logs
  - `docs/pre-deployment/coordination-patterns.md`: Correção nos comandos de depuração do agente

- **📝 Referência de Versão Atualizada**: 
  - `docs/getting-started/installation.md`: Alterada versão fixa `1.5.0` para genérica `1.x.x` com link para releases

#### Alterado
- **Estratégias de Rollback**: Documentação atualizada para uso de rollback baseado em Git (AZD não possui rollback nativo)
- **Visualização de Logs**: Substituídos referências a `azd logs` por `azd monitor --logs`, `azd monitor --live` e comandos Azure CLI
- **Seção de Performance**: Removidas flags de implantação paralela/incremental inexistentes, fornecidas alternativas válidas

#### Detalhes Técnicos
- **Comandos AZD Válidos**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Flags válidas azd monitor**: `--live`, `--logs`, `--overview`
- **Recursos Removidos**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notas
- **Verificação**: Comandos validados contra Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Conclusão do Workshop e Atualização da Qualidade da Documentação
**Esta versão conclui os módulos interativos do workshop, corrige todos os links quebrados da documentação e melhora a qualidade geral do conteúdo para desenvolvedores de IA usando Microsoft AZD.**

#### Adicionado
- **📝 CONTRIBUTING.md**: Novo documento de diretrizes de contribuição com:
  - Instruções claras para reportar problemas e propor mudanças
  - Padrões de documentação para novos conteúdos
  - Diretrizes para exemplos de código e convenções de mensagens de commit
  - Informações para engajamento da comunidade

#### Concluído
- **🎯 Módulo 7 do Workshop (Encerramento)**: Completo módulo de encerramento com:
  - Resumo abrangente das conquistas do workshop
  - Seção de conceitos-chave dominados cobrindo AZD, templates e Microsoft Foundry
  - Recomendações para continuação da jornada de aprendizado
  - Exercícios desafiadores do workshop classificados por dificuldade
  - Links para feedback da comunidade e suporte

- **📚 Módulo 3 do Workshop (Deconstrução)**: Objetivos de aprendizado atualizados com:
  - Orientação para ativação do GitHub Copilot com servidores MCP
  - Compreensão da estrutura de pastas dos templates AZD
  - Padrões de organização Infrastructure-as-Code (Bicep)
  - Instruções para laboratório prático

- **🔧 Módulo 6 do Workshop (Desmontagem)**: Concluído com:
  - Objetivos de limpeza de recursos e gestão de custos
  - Uso do `azd down` para desprovisionamento seguro da infraestrutura
  - Orientações para recuperação de serviços cognitivos excluídos suavemente
  - Explorações bônus para GitHub Copilot e Azure Portal

#### Corrigido
- **🔗 Correção de Links Quebrados**: Resolvidos mais de 15 links internos quebrados na documentação:
  - `docs/ai-foundry/ai-model-deployment.md`: Corrigidos os caminhos para microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Corrigidos caminhos para ai-model-deployment.md e production-ai-practices.md
  - `docs/getting-started/first-project.md`: Substituído cicd-integration.md inexistente por deployment-guide.md
  - `examples/retail-scenario.md`: Corrigidos caminhos da FAQ e guia de solução de problemas
  - `examples/container-app/microservices/README.md`: Corrigidos caminhos do curso principal e guia de implantação
  - `resources/faq.md` e `resources/glossary.md`: Atualizadas referências do capítulo de IA
  - `course-outline.md`: Corrigidos guias do instrutor e referências do laboratório do workshop de IA

- **📅 Banner de Status do Workshop**: Atualizado de "Em Construção" para status ativo com data de fevereiro de 2026

- **🔗 Navegação do Workshop**: Corrigidos links de navegação quebrados no README.md do workshop apontando para pasta lab-1-azd-basics inexistente

#### Alterado
- **Apresentação do Workshop**: Removido alerta "em construção", workshop agora está completo e pronto para uso
- **Consistência na Navegação**: Garantida navegação adequada entre todos os módulos do workshop
- **Referências do Caminho de Aprendizado**: Atualizadas referências entre capítulos para utilizar caminhos corretos microsoft-foundry

#### Validado
- ✅ Todos os arquivos markdown em inglês possuem links internos válidos
- ✅ Módulos do workshop 0-7 estão completos com objetivos de aprendizado
- ✅ A navegação entre capítulos e módulos funciona corretamente
- ✅ Conteúdo adequado para desenvolvedores de IA usando Microsoft AZD
- ✅ Linguagem e estrutura amigáveis para iniciantes mantidas ao longo do conteúdo
- ✅ CONTRIBUTING.md fornece orientações claras para contribuintes da comunidade

#### Implementação Técnica
- **Validação de Links**: Script PowerShell automatizado verificou todos os links internos .md
- **Auditoria de Conteúdo**: Revisão manual da completude do workshop e adequação para iniciantes
- **Sistema de Navegação**: Aplicados padrões consistentes de navegação entre capítulos e módulos

#### Notas
- **Escopo**: Alterações aplicadas somente à documentação em inglês
- **Traduções**: Pastas de tradução não foram atualizadas nesta versão (tradução automática será sincronizada posteriormente)
- **Duração do Workshop**: Workshop completo oferece agora 3-4 horas de aprendizado prático

---

### [v3.8.0] - 2025-11-19

#### Documentação Avançada: Monitoramento, Segurança e Padrões Multi-Agente
**Esta versão adiciona aulas abrangentes de grau A sobre integração com Application Insights, padrões de autenticação e coordenação multi-agente para implantações em produção.**

#### Adicionado
- **📊 Aula de Integração Application Insights**: em `docs/pre-deployment/application-insights.md`:
  - Implantação focada no AZD com provisionamento automático
  - Templates Bicep completos para Application Insights + Log Analytics
  - Aplicações Python funcionando com telemetria personalizada (mais de 1.200 linhas)
  - Padrões de monitoramento AI/LLM (rastreamento de token/custo dos Modelos Microsoft Foundry)
  - 6 diagramas Mermaid (arquitetura, rastreamento distribuído, fluxo de telemetria)
  - 3 exercícios práticos (alertas, painéis, monitoramento de IA)
  - Exemplos de consultas Kusto e estratégias de otimização de custos
  - Streaming de métricas ao vivo e depuração em tempo real
  - Tempo de aprendizado de 40-50 minutos com padrões prontos para produção

- **🔐 Aula de Padrões de Autenticação & Segurança**: em `docs/getting-started/authsecurity.md`:
  - 3 padrões de autenticação (connection strings, Key Vault, identidade gerenciada)
  - Templates completos de infraestrutura Bicep para implantações seguras
  - Código de aplicação Node.js com integração SDK Azure
  - 3 exercícios completos (habilitar identidade gerenciada, identidade atribuída ao usuário, rotação Key Vault)
  - Melhores práticas de segurança e configurações RBAC
  - Guia de solução de problemas e análise de custos
  - Padrões prontos para produção de autenticação sem senha

- **🤖 Aula de Padrões de Coordenação Multi-Agente**: em `docs/pre-deployment/coordination-patterns.md`:
  - 5 padrões de coordenação (sequencial, paralelo, hierárquico, orientado a eventos, consenso)
  - Implementação completa do serviço orquestrador (Python/Flask, mais de 1.500 linhas)
  - 3 implementações especializadas de agentes (Pesquisa, Escritor, Editor)
  - Integração com Service Bus para enfileiramento de mensagens
  - Gerenciamento de estado Cosmos DB para sistemas distribuídos
  - 6 diagramas Mermaid mostrando interações dos agentes
  - 3 exercícios avançados (tratamento de timeout, lógica de retries, circuit breaker)
  - Detalhamento de custo (US$ 240-565/mês) com estratégias de otimização
  - Integração com Application Insights para monitoramento

#### Aprimorado
- **Capítulo Pré-Implantação**: Agora inclui padrões abrangentes de monitoramento e coordenação
- **Capítulo Iniciante**: Aprimorado com padrões profissionais de autenticação
- **Prontidão para Produção**: Cobertura completa desde segurança até observabilidade
- **Roteiro do Curso**: Atualizado para referenciar novas aulas nos Capítulos 3 e 6

#### Alterado
- **Progressão de Aprendizado**: Melhor integração de segurança e monitoramento ao longo do curso
- **Qualidade da Documentação**: Padrões consistentes de grau A (95-97%) nas novas aulas
- **Padrões de Produção**: Cobertura completa ponta a ponta para implantações empresariais

#### Melhorado
- **Experiência do Desenvolvedor**: Caminho claro do desenvolvimento ao monitoramento em produção
- **Padrões de Segurança**: Padrões profissionais para autenticação e gerenciamento de segredos
- **Observabilidade**: Integração completa Application Insights com AZD
- **Cargas de Trabalho de IA**: Monitoramento especializado para Modelos Microsoft Foundry e sistemas multi-agente

#### Validado
- ✅ Todas as aulas incluem código funcional completo (não são apenas trechos)
- ✅ Diagramas Mermaid para aprendizagem visual (19 no total em 3 aulas)
- ✅ Exercícios práticos com passos de verificação (9 no total)
- ✅ Templates Bicep prontos para produção implantáveis via `azd up`
- ✅ Análise de custos e estratégias de otimização
- ✅ Guias de solução de problemas e melhores práticas
- ✅ Pontos de verificação de conhecimento com comandos de verificação

#### Resultados da Avaliação da Documentação
- **docs/pre-deployment/application-insights.md**: - Guia abrangente de monitoramento
- **docs/getting-started/authsecurity.md**: - Padrões profissionais de segurança
- **docs/pre-deployment/coordination-patterns.md**: - Arquiteturas multi-agente avançadas
- **Conteúdo Novo Geral**: - Padrões consistentes de alta qualidade

#### Implementação Técnica
- **Application Insights**: Log Analytics + telemetria personalizada + rastreamento distribuído
- **Autenticação**: Identidade gerenciada + Key Vault + padrões RBAC
- **Multi-Agente**: Service Bus + Cosmos DB + Container Apps + orquestração
- **Monitoramento**: Métricas ao vivo + consultas Kusto + alertas + dashboards
- **Gestão de Custos**: Estratégias de amostragem, políticas de retenção, controle orçamentário

### [v3.7.0] - 2025-11-19

#### Melhorias na Qualidade da Documentação e Novo Exemplo Microsoft Foundry Models
**Esta versão melhora a qualidade da documentação em todo o repositório e adiciona um exemplo completo de implantação Microsoft Foundry Models com interface de chat gpt-4.1.**

#### Adicionado
- **🤖 Exemplo de Chat Microsoft Foundry Models**: Implantação completa gpt-4.1 com implementação funcional em `examples/azure-openai-chat/`:
  - Infraestrutura completa Microsoft Foundry Models (implantação do modelo gpt-4.1)
  - Interface de chat em linha de comando Python com histórico de conversas
  - Integração com Key Vault para armazenamento seguro de chaves API
  - Rastreamento de uso de tokens e estimativa de custos
  - Limitação de taxa e tratamento de erros
  - README abrangente com guia de implantação de 35-45 minutos
  - 11 arquivos prontos para produção (templates Bicep, app Python, configuração)
- **📚 Exercícios de Documentação**: Adicionados exercícios práticos no guia de configuração:
  - Exercício 1: Configuração multiambiente (15 minutos)
  - Exercício 2: Prática de gerenciamento de segredos (10 minutos)
  - Critérios claros de sucesso e etapas de verificação
- **✅ Verificação da Implantação**: Adicionada seção de verificação no guia de implantação:
  - Procedimentos de verificação de status
  - Checklist de critérios de sucesso
  - Resultados esperados para todos os comandos de implantação
  - Referência rápida para solução de problemas

#### Aprimorado
- **examples/README.md**: Atualizado para qualidade grau A (93%):
  - Adicionado azure-openai-chat a todas as seções relevantes
  - Contagem atualizada de exemplos locais de 3 para 4
  - Adicionado à tabela de Exemplos de Aplicações de IA
  - Integrado ao Guia Rápido para Usuários Intermediários
  - Adicionado à seção de Microsoft Foundry Templates
  - Atualizados matriz de comparação e seções de tecnologia usada
- **Qualidade da Documentação**: Melhorado B+ (87%) → A- (92%) na pasta docs

  - Adicionados resultados esperados aos exemplos críticos de comandos
  - Incluídos passos de verificação para mudanças de configuração
  - Aprendizado prático aprimorado com exercícios práticos

#### Alterado
- **Progressão de Aprendizado**: Melhor integração de exemplos de IA para aprendizes intermediários
- **Estrutura da Documentação**: Exercícios mais acionáveis com resultados claros
- **Processo de Verificação**: Critérios de sucesso explícitos adicionados aos fluxos de trabalho principais

#### Melhorado
- **Experiência do Desenvolvedor**: Implantação dos Microsoft Foundry Models agora leva 35-45 minutos (vs 60-90 para alternativas complexas)
- **Transparência de Custos**: Estimativas claras de custo ($50-200/mês) para o exemplo Microsoft Foundry Models
- **Caminho de Aprendizado**: Desenvolvedores de IA têm ponto de entrada claro com azure-openai-chat
- **Padrões de Documentação**: Saídas esperadas consistentes e passos de verificação

#### Validado
- ✅ Exemplo Microsoft Foundry Models totalmente funcional com `azd up`
- ✅ Todos os 11 arquivos de implementação sintaticamente corretos
- ✅ Instruções do README condizem com a experiência real de implantação
- ✅ Links de documentação atualizados em mais de 8 locais
- ✅ Índice de exemplos reflete corretamente 4 exemplos locais
- ✅ Nenhum link externo duplicado nas tabelas
- ✅ Todas as referências de navegação corretas

#### Implementação Técnica
- **Arquitetura dos Microsoft Foundry Models**: padrão gpt-4.1 + Key Vault + Container Apps
- **Segurança**: Identidade Gerenciada pronta, segredos no Key Vault
- **Monitoramento**: Integração com Application Insights
- **Gestão de Custos**: Rastreamento de tokens e otimização de uso
- **Implantação**: Comando único `azd up` para configuração completa

### [v3.6.0] - 2025-11-19

#### Atualização Principal: Exemplos de Implantação de Container App
**Esta versão introduz exemplos abrangentes de implantação de aplicações em container prontos para produção usando Azure Developer CLI (AZD), com documentação completa e integração ao caminho de aprendizado.**

#### Adicionado
- **🚀 Exemplos de Container App**: Novos exemplos locais em `examples/container-app/`:
  - [Guia Mestre](examples/container-app/README.md): Visão geral completa de implantações containerizadas, início rápido, produção e padrões avançados
  - [API Flask Simples](../../examples/container-app/simple-flask-api): API REST amigável para iniciantes com scale-to-zero, sondas de saúde, monitoramento e solução de problemas
  - [Arquitetura de Microsserviços](../../examples/container-app/microservices): Implantação multi-serviço pronta para produção (API Gateway, Produto, Pedido, Usuário, Notificação), mensagens assíncronas, Service Bus, Cosmos DB, Azure SQL, rastreamento distribuído, implantação blue-green/canary
- **Melhores Práticas**: Segurança, monitoramento, otimização de custos e orientações de CI/CD para cargas containerizadas
- **Exemplos de Código**: `azure.yaml` completo, templates Bicep e implementações de serviço multilíngue (Python, Node.js, C#, Go)
- **Testes & Solução de Problemas**: Cenários de teste ponta a ponta, comandos de monitoramento, orientações para resolução

#### Alterado
- **README.md**: Atualizado para apresentar e vincular os novos exemplos de container app em "Exemplos Locais - Aplicações Containerizadas"
- **examples/README.md**: Atualizado para destacar exemplos de container app, adicionar entradas na matriz de comparação e atualizar referências de tecnologia/arquitetura
- **Esboço do Curso & Guia de Estudo**: Atualizado para referenciar novos exemplos de container app e padrões de implantação nos capítulos relevantes

#### Validado
- ✅ Todos os novos exemplos implantáveis com `azd up` e seguem melhores práticas
- ✅ Cross-links de documentação e navegação atualizados
- ✅ Exemplos cobrem cenários do iniciante ao avançado, incluindo microsserviços de produção

#### Notas
- **Escopo**: Documentação e exemplos apenas em inglês
- **Próximos Passos**: Expandir com padrões avançados adicionais de container e automação CI/CD em versões futuras

### [v3.5.0] - 2025-11-19

#### Rebranding do Produto: Microsoft Foundry
**Esta versão implementa uma mudança abrangente no nome do produto de "Microsoft Foundry" para "Microsoft Foundry" em toda a documentação em inglês, refletindo o rebranding oficial da Microsoft.**

#### Alterado
- **🔄 Atualização do Nome do Produto**: Rebranding completo de "Microsoft Foundry" para "Microsoft Foundry"
  - Atualizadas todas as referências na documentação em inglês na pasta `docs/`
  - Renomeada pasta: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Renomeado arquivo: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 referências de conteúdo atualizadas em 7 arquivos de documentação

- **📁 Mudanças na Estrutura de Pastas**:
  - `docs/ai-foundry/` renomeada para `docs/microsoft-foundry/`
  - Todas as referências cruzadas atualizadas para refletir nova estrutura
  - Links de navegação validados em toda a documentação

- **📄 Renomeação de Arquivos**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Todos os links internos atualizados para o novo nome de arquivo

#### Arquivos Atualizados
- **Documentação Capítulo** (7 arquivos):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 atualizações de links de navegação
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 referências do nome do produto atualizadas
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Já usando Microsoft Foundry (de atualizações anteriores)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referências atualizadas (visão geral, feedback da comunidade, documentação)
  - `docs/getting-started/azd-basics.md` - 4 links de referência cruzada atualizados
  - `docs/getting-started/first-project.md` - 2 links de navegação de capítulos atualizados
  - `docs/getting-started/installation.md` - 2 links de capítulos seguintes atualizados
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referências atualizadas (navegação, comunidade Discord)
  - `docs/troubleshooting/common-issues.md` - 1 link de navegação atualizado
  - `docs/troubleshooting/debugging.md` - 1 link de navegação atualizado

- **Arquivos de Estrutura do Curso** (2 arquivos):
  - `README.md` - 17 referências atualizadas (visão geral do curso, títulos de capítulos, seção templates, insights da comunidade)
  - `course-outline.md` - 14 referências atualizadas (visão geral, objetivos de aprendizado, recursos dos capítulos)

#### Validado
- ✅ Nenhuma referência restante a pasta "ai-foundry" nas docs em inglês
- ✅ Nenhuma referência restante ao nome do produto "Microsoft Foundry" nas docs em inglês
- ✅ Todos os links de navegação funcionando com nova estrutura de pastas
- ✅ Renomeações de arquivos e pastas concluídas com sucesso
- ✅ Referências cruzadas entre capítulos validadas

#### Notas
- **Escopo**: Alterações aplicadas somente na documentação em inglês na pasta `docs/`
- **Traduções**: Pastas de traduções (`translations/`) não atualizadas nesta versão
- **Workshop**: Materiais de workshop (`workshop/`) não atualizados nesta versão
- **Exemplos**: Arquivos de exemplo podem ainda referenciar nomenclatura antiga (a ser corrigido em atualizações futuras)
- **Links Externos**: URLs externas e referências ao repositório do GitHub permanecem inalterados

#### Guia de Migração para Colaboradores
Se você tem branches locais ou documentação referenciando a estrutura antiga:
1. Atualize referências de pasta: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Atualize referências de arquivo: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Substitua nome do produto: "Microsoft Foundry" → "Microsoft Foundry"
4. Valide que todos os links internos da documentação ainda funcionam

---

### [v3.4.0] - 2025-10-24

#### Aprimoramentos na Visualização e Validação de Infraestrutura
**Esta versão introduz suporte abrangente para o novo recurso de visualização do Azure Developer CLI e melhora a experiência do usuário no workshop.**

#### Adicionado
- **🧪 Documentação do recurso azd provision --preview**: Cobertura abrangente da nova capacidade de visualização de infraestrutura
  - Referência do comando e exemplos de uso na folha de dicas
  - Integração detalhada no guia de provisionamento com casos de uso e benefícios
  - Integração de checagem prévia para validação mais segura da implantação
  - Atualizações no guia de introdução com práticas de implantação seguras
- **🚧 Banner de Status do Workshop**: Banner HTML profissional indicando status de desenvolvimento do workshop
  - Design em gradiente com indicadores de construção para comunicação clara aos usuários
  - Timestamp da última atualização para transparência
  - Design responsivo para dispositivos móveis

#### Aprimorado
- **Segurança de Infraestrutura**: Funcionalidade preview integrada em toda documentação de implantação
- **Validação Pré-Implantação**: Scripts automatizados agora incluem testes de preview de infraestrutura
- **Fluxo de Trabalho do Desenvolvedor**: Sequências de comandos atualizadas para incluir preview como boa prática
- **Experiência do Workshop**: Expectativas claras para usuários sobre o status do conteúdo

#### Alterado
- **Melhores Práticas de Implantação**: Fluxo orientado a preview agora recomendado
- **Fluxo da Documentação**: Validação da infraestrutura movida para etapas iniciais do aprendizado
- **Apresentação do Workshop**: Comunicação profissional do status com cronograma claro de desenvolvimento

#### Melhorado
- **Abordagem Safety-First**: Mudanças de infraestrutura podem ser validadas antes do deployment
- **Colaboração em Equipe**: Resultados de preview podem ser compartilhados para revisão e aprovação
- **Consciência de Custos**: Melhor compreensão dos custos de recursos antes do provisionamento
- **Mitigação de Riscos**: Redução de falhas de implantação por meio de validação antecipada

#### Implementação Técnica
- **Integração Multi-documentos**: Recurso preview documentado em 4 arquivos-chave
- **Padrões de Comando**: Sintaxe e exemplos consistentes na documentação
- **Integração de Boas Práticas**: Preview incluído nos workflows e scripts de validação
- **Indicadores Visuais**: Marcação clara de NOVO recurso para descoberta

#### Infraestrutura do Workshop
- **Comunicação de Status**: Banner HTML profissional com estilo em gradiente
- **Experiência do Usuário**: Status claro de desenvolvimento previne confusões
- **Apresentação Profissional**: Mantém credibilidade do repositório definindo expectativas
- **Transparência do Cronograma**: Timestamp de última atualização outubro/2025 para prestação de contas

### [v3.3.0] - 2025-09-24

#### Materiais de Workshop Aprimorados e Experiência de Aprendizado Interativa
**Esta versão introduz materiais abrangentes de workshop com guias interativos baseados em navegador e caminhos de aprendizado estruturados.**

#### Adicionado
- **🎥 Guia Interativo para Workshop**: Experiência de workshop baseada em navegador com recurso de preview do MkDocs
- **📝 Instruções Estruturadas para Workshop**: Caminho de aprendizado guiado em 7 passos desde descoberta até personalização
  - 0-Introdução: visão geral do workshop e configuração
  - 1-Selecionar-Template-IA: processo de descoberta e seleção de templates
  - 2-Validar-Template-IA: procedimentos de implantação e validação
  - 3-Desconstruir-Template-IA: entendendo a arquitetura do template
  - 4-Configurar-Template-IA: configuração e personalização
  - 5-Personalizar-Template-IA: modificações avançadas e iterações
  - 6-Desmontar-Infraestrutura: limpeza e gerenciamento de recursos
  - 7-Conclusão: resumo e próximos passos
- **🛠️ Ferramentas para Workshop**: Configuração do MkDocs com tema Material para experiência de aprendizado aprimorada
- **🎯 Caminho de Aprendizado Prático**: metodologia em 3 passos (Descoberta → Implantação → Personalização)
- **📱 Integração com GitHub Codespaces**: configuração integrada do ambiente de desenvolvimento

#### Aprimorado
- **Laboratório de Workshop de IA**: Expandido com experiência de aprendizado estruturada de 2-3 horas
- **Documentação do Workshop**: Apresentação profissional com navegação e recursos visuais
- **Progressão de Aprendizado**: Orientação clara passo a passo da seleção do template até implantação em produção
- **Experiência do Desenvolvedor**: Ferramentas integradas para fluxos de trabalho de desenvolvimento mais eficientes

#### Melhorado
- **Acessibilidade**: Interface baseada em navegador com busca, funcionalidade de copiar e alternância de tema
- **Aprendizado Autônomo**: Estrutura flexível para acomodar diferentes ritmos de aprendizado
- **Aplicação Prática**: Cenários reais de implantação de templates de IA
- **Integração Comunitária**: Integração com Discord para suporte e colaboração no workshop

#### Recursos do Workshop
- **Busca Integrada**: Descoberta rápida por palavras-chave e lições
- **Copiar Blocos de Código**: Funcionalidade hover-to-copy para todos exemplos de código
- **Alternância de Tema**: Suporte a modo claro/escuro para preferências variadas
- **Recursos Visuais**: Capturas de tela e diagramas para melhor compreensão
- **Integração de Ajuda**: Acesso direto ao Discord para suporte da comunidade

### [v3.2.0] - 2025-09-17

#### Reestruturação Maior na Navegação e Sistema de Aprendizado por Capítulos
**Esta versão introduz uma estrutura abrangente de aprendizado baseada em capítulos com navegação aprimorada em todo o repositório.**

#### Adicionado
- **📚 Sistema de Aprendizado baseado em Capítulos**: Reestruturação completa do curso em 8 capítulos progressivos de aprendizado
  - Capítulo 1: Fundamentos e Início Rápido (⭐ - 30-45 min)
  - Capítulo 2: Desenvolvimento AI-First (⭐⭐ - 1-2 horas)
  - Capítulo 3: Configuração e Autenticação (⭐⭐ - 45-60 min)
  - Capítulo 4: Infraestrutura como Código e Implantação (⭐⭐⭐ - 1-1,5 horas)
  - Capítulo 5: Soluções Multi-Agente AI (⭐⭐⭐⭐ - 2-3 horas)
  - Capítulo 6: Validação e Planejamento Pré-Implantação (⭐⭐ - 1 hora)
  - Capítulo 7: Solução de Problemas e Depuração (⭐⭐ - 1-1,5 horas)
  - Capítulo 8: Padrões de Produção e Empresariais (⭐⭐⭐⭐ - 2-3 horas)
- **📚 Sistema Abrangente de Navegação**: Cabeçalhos e rodapés de navegação consistentes em toda documentação
- **🎯 Rastreamento de Progresso**: Lista de verificação de conclusão do curso e sistema de verificação de aprendizado
- **🗺️ Orientação do Caminho de Aprendizado**: Pontos de entrada claros para diferentes níveis de experiência e objetivos
- **🔗 Navegação com Referências Cruzadas**: Capítulos relacionados e pré-requisitos claramente vinculados

#### Aprimorado
- **Estrutura do README**: Transformado em plataforma de aprendizado estruturada com organização baseada em capítulos
- **Navegação da Documentação**: Cada página agora inclui contexto do capítulo e orientação de progressão
- **Organização de Templates**: Exemplos e templates mapeados para capítulos apropriados de aprendizado

- **Integração de Recursos**: Folhas de referência, FAQs e guias de estudo conectados aos capítulos relevantes
- **Integração de Workshop**: Laboratórios práticos mapeados para múltiplos objetivos de aprendizagem dos capítulos

#### Alterações
- **Progressão de Aprendizado**: Passou de documentação linear para aprendizado flexível baseado em capítulos
- **Posicionamento de Configuração**: Guia de configuração reposicionado como Capítulo 3 para melhor fluidez no aprendizado
- **Integração de Conteúdo de IA**: Melhor integração de conteúdo específico de IA ao longo da jornada de aprendizagem
- **Conteúdo de Produção**: Padrões avançados consolidados no Capítulo 8 para aprendizes corporativos

#### Melhorias
- **Experiência do Usuário**: Navegação clara com trilhas de navegação e indicadores de progresso dos capítulos
- **Acessibilidade**: Padrões consistentes de navegação para facilitar o percurso pelo curso
- **Apresentação Profissional**: Estrutura de curso estilo universitário adequada para treinamentos acadêmicos e corporativos
- **Eficiência de Aprendizado**: Redução do tempo para encontrar conteúdo relevante através de melhor organização

#### Implementação Técnica
- **Cabeçalhos de Navegação**: Navegação padrão de capítulos em mais de 40 arquivos de documentação
- **Navegação no Rodapé**: Orientação de progresso consistente e indicadores de conclusão de capítulos
- **Links Cruzados**: Sistema abrangente de links internos conectando conceitos relacionados
- **Mapeamento de Capítulos**: Modelos e exemplos claramente associados a objetivos de aprendizado

#### Aprimoramento do Guia de Estudo
- **📚 Objetivos de Aprendizagem Abrangentes**: Guia de estudo reestruturado para alinhar com sistema de 8 capítulos
- **🎯 Avaliação Baseada em Capítulos**: Cada capítulo inclui objetivos de aprendizado específicos e exercícios práticos
- **📋 Acompanhamento de Progresso**: Cronograma semanal de aprendizado com resultados mensuráveis e listas de verificação de conclusão
- **❓ Questões de Avaliação**: Questões de validação de conhecimento para cada capítulo com resultados profissionais
- **🛠️ Exercícios Práticos**: Atividades práticas com cenários reais de implantação e solução de problemas
- **📊 Progressão de Habilidades**: Avanço claro dos conceitos básicos a padrões corporativos com foco no desenvolvimento de carreira
- **🎓 Estrutura de Certificação**: Resultados para desenvolvimento profissional e sistema de reconhecimento comunitário
- **⏱️ Gestão de Cronograma**: Plano estruturado de 10 semanas com validação de marcos

### [v3.1.0] - 2025-09-17

#### Melhoria nas Soluções de IA Multi-Agente
**Esta versão aprimora a solução multi-agente para varejo com melhor nomeação dos agentes e documentação aprimorada.**

#### Alterações
- **Terminologia Multi-Agente**: Substituído "agente Cora" por "agente Cliente" em toda a solução multi-agente para varejo para maior clareza
- **Arquitetura do Agente**: Atualização em toda documentação, templates ARM e exemplos de código para uso consistente de "agente Cliente"
- **Exemplos de Configuração**: Modernizados os padrões de configuração dos agentes com convenções de nomenclatura atualizadas
- **Consistência na Documentação**: Garantido que todas as referências usem nomes profissionais e descritivos dos agentes

#### Aprimoramentos
- **Pacote de Template ARM**: Atualizado retail-multiagent-arm-template com referências ao agente Cliente
- **Diagramas de Arquitetura**: Diagramas Mermaid atualizados com nova nomenclatura dos agentes
- **Exemplos de Código**: Classes Python e exemplos de implementação agora usam nomeação CustomerAgent
- **Variáveis de Ambiente**: Atualizados todos scripts de implantação para usar convenções CUSTOMER_AGENT_NAME

#### Melhorias
- **Experiência do Desenvolvedor**: Papéis e responsabilidades dos agentes mais claros na documentação
- **Prontidão para Produção**: Melhor alinhamento com convenções de nomeação corporativas
- **Materiais de Aprendizado**: Nomeação dos agentes mais intuitiva para fins educacionais
- **Usabilidade do Template**: Compreensão simplificada das funções dos agentes e padrões de implantação

#### Detalhes Técnicos
- Diagramas Mermaid de arquitetura atualizados com referências a CustomerAgent
- Nome das classes CoraAgent substituído por CustomerAgent nos exemplos Python
- Configurações JSON do template ARM modificadas para usar o tipo de agente "customer"
- Variáveis de ambiente atualizadas de CORA_AGENT_* para CUSTOMER_AGENT_*
- Atualizados todos comandos de implantação e configurações de container

### [v3.0.0] - 2025-09-12

#### Grandes Mudanças - Foco no Desenvolvedor de IA e Integração Microsoft Foundry
**Esta versão transforma o repositório em um recurso completo de aprendizado focado em IA com integração Microsoft Foundry.**

#### Adições
- **🤖 Caminho de Aprendizado IA-First**: Reestruturação completa priorizando desenvolvedores e engenheiros de IA
- **Guia de Integração Microsoft Foundry**: Documentação abrangente para conectar AZD aos serviços do Microsoft Foundry
- **Padrões de Implantação de Modelos de IA**: Guia detalhado cobrindo seleção, configuração e estratégias de implantação em produção
- **Workshop Laboratorial de IA**: Workshop prático de 2-3 horas para converter aplicações de IA em soluções implantáveis via AZD
- **Melhores Práticas de IA para Produção**: Padrões preparados para empresas para escalabilidade, monitoramento e segurança de workloads de IA
- **Guia de Solução de Problemas Específico de IA**: Solução abrangente para Microsoft Foundry Models, Cognitive Services e problemas de implantação de IA
- **Galeria de Templates de IA**: Coleção destaque de templates Microsoft Foundry com classificação de complexidade
- **Materiais do Workshop**: Estrutura completa com laboratórios práticos e materiais de referência

#### Aprimoramentos
- **Estrutura do README**: Foco em desenvolvedores de IA com 45% de interesse comunitário via Discord Microsoft Foundry
- **Caminhos de Aprendizado**: Jornada dedicada para desenvolvedores de IA ao lado dos caminhos tradicionais para estudantes e engenheiros DevOps
- **Recomendações de Templates**: Templates de IA destacados incluindo azure-search-openai-demo, contoso-chat e openai-chat-app-quickstart
- **Integração Comunitária**: Suporte ampliado da comunidade no Discord com canais e discussões específicas de IA

#### Foco em Segurança e Produção
- **Padrões de Managed Identity**: Configurações de autenticação e segurança específicas para IA
- **Otimização de Custos**: Rastreamento de uso de tokens e controles orçamentários para workloads de IA
- **Implantação Multi-Região**: Estratégias para implantação global de aplicações de IA
- **Monitoramento de Performance**: Métricas específicas de IA e integração com Application Insights

#### Qualidade da Documentação
- **Estrutura Linear do Curso**: Progressão lógica do iniciante ao avançado em padrões de implantação de IA
- **URLs Validadas**: Todos os links externos verificados e acessíveis
- **Referência Completa**: Todos os links internos validados e funcionais
- **Pronto para Produção**: Padrões de implantação corporativa com exemplos reais

### [v2.0.0] - 2025-09-09

#### Grandes Mudanças - Reestruturação do Repositório e Aprimoramento Profissional
**Esta versão representa uma reformulação significativa da estrutura do repositório e da apresentação do conteúdo.**

#### Adições
- **Estrutura de Aprendizado Estruturada**: Todas as páginas de documentação agora incluem seções de Introdução, Objetivos de Aprendizagem e Resultados do Aprendizado
- **Sistema de Navegação**: Links de lição Anterior/Próxima adicionados em toda documentação para progressão guiada
- **Guia de Estudo**: study-guide.md abrangente com objetivos de aprendizado, exercícios práticos e materiais de avaliação
- **Apresentação Profissional**: Remoção de todos ícones emoji para melhor acessibilidade e aparência profissional
- **Estrutura de Conteúdo Aprimorada**: Organização e fluxo melhorados dos materiais de aprendizado

#### Alterações
- **Formato da Documentação**: Padronização de toda documentação com estrutura consistente e foco em aprendizado
- **Fluxo de Navegação**: Implementação de progressão lógica em todos os materiais de aprendizado
- **Apresentação de Conteúdo**: Removidos elementos decorativos em favor de formatação clara e profissional
- **Estrutura de Links**: Atualizados todos os links internos para suportar novo sistema de navegação

#### Melhorias
- **Acessibilidade**: Remoção da dependência de emojis para melhor compatibilidade com leitores de tela
- **Aparência Profissional**: Apresentação limpa no estilo acadêmico adequado para aprendizado corporativo
- **Experiência de Aprendizado**: Abordagem estruturada com objetivos claros e resultados para cada lição
- **Organização do Conteúdo**: Melhor fluxo lógico e conexão entre tópicos relacionados

### [v1.0.0] - 2025-09-09

#### Lançamento Inicial - Repositório Abrangente de Aprendizado AZD

#### Adições
- **Estrutura Principal da Documentação**
  - Série completa de guias iniciais
  - Documentação abrangente de implantação e provisão
  - Recursos detalhados de solução de problemas e guias de depuração
  - Ferramentas e procedimentos para validação pré-implantação

- **Módulo de Introdução**
  - Conceitos básicos do AZD: conceitos centrais e terminologia
  - Guia de Instalação: instruções específicas para cada plataforma
  - Guia de Configuração: preparação de ambiente e autenticação
  - Tutorial do Primeiro Projeto: aprendizado prático passo a passo

- **Módulo de Implantação e Provisão**
  - Guia de Implantação: documentação completa do fluxo de trabalho
  - Guia de Provisão: Infraestrutura como Código com Bicep
  - Melhores práticas para implantações em produção
  - Padrões de arquitetura multi-serviço

- **Módulo de Validação Pré-Implantação**
  - Planejamento de Capacidade: validação da disponibilidade de recursos Azure
  - Seleção de SKU: orientação abrangente de camadas de serviço
  - Verificações pré-voo: scripts de validação automatizados (PowerShell e Bash)
  - Ferramentas para estimativa de custo e planejamento orçamentário

- **Módulo de Solução de Problemas**
  - Problemas Comuns: problemas frequentes e suas soluções
  - Guia de Depuração: metodologias sistemáticas para solução de problemas
  - Técnicas avançadas de diagnóstico e ferramentas
  - Monitoramento e otimização de performance

- **Recursos e Referências**
  - Folha de Comandos: referência rápida para comandos essenciais
  - Glossário: definições abrangentes de terminologia e siglas
  - FAQ: respostas detalhadas para perguntas comuns
  - Links para recursos externos e conexões comunitárias

- **Exemplos e Templates**
  - Exemplo de Aplicação Web Simples
  - Template de implantação de Site Estático
  - Configuração de Aplicação em Container
  - Padrões de integração com banco de dados
  - Exemplos de arquitetura de microsserviços
  - Implementações de funções serverless

#### Características
- **Suporte Multi-Plataforma**: Guias de instalação e configuração para Windows, macOS e Linux
- **Múltiplos Níveis de Habilidade**: Conteúdo desenhado para estudantes até desenvolvedores profissionais
- **Foco Prático**: Exemplos práticos e cenários do mundo real
- **Cobertura Abrangente**: Desde conceitos básicos até padrões avançados corporativos
- **Abordagem com Segurança em Primeiro Lugar**: Melhores práticas de segurança integradas em todo conteúdo
- **Otimização de Custos**: Orientação para implantações econômicas e gerenciamento de recursos

#### Qualidade da Documentação
- **Exemplos de Código Detalhados**: Amostras de código práticas e testadas
- **Instruções Passo a Passo**: Orientação clara e acionável
- **Tratamento Abrangente de Erros**: Solução de problemas para questões comuns
- **Integração de Melhores Práticas**: Padrões e recomendações da indústria
- **Compatibilidade de Versão**: Atualizado com os últimos serviços Azure e recursos azd

## Melhorias Futuras Planejadas

### Versão 3.1.0 (Planejada)
#### Expansão da Plataforma IA
- **Suporte Multi-Modelo**: Padrões de integração para Hugging Face, Azure Machine Learning e modelos personalizados
- **Frameworks de Agentes de IA**: Templates para implantacões LangChain, Semantic Kernel e AutoGen
- **Padrões Avançados RAG**: Opções de bancos de dados vetoriais além do Azure AI Search (Pinecone, Weaviate, etc.)
- **Observabilidade de IA**: Monitoramento aprimorado para performance de modelo, uso de tokens e qualidade de respostas

#### Experiência do Desenvolvedor
- **Extensão VS Code**: Experiência integrada AZD + Microsoft Foundry para desenvolvimento
- **Integração GitHub Copilot**: Geração assistida por IA de templates AZD
- **Tutoriais Interativos**: Exercícios práticos de codificação com validação automatizada para cenários de IA
- **Conteúdo em Vídeo**: Tutoriais em vídeo suplementares para aprendizes visuais focados em implantações de IA

### Versão 4.0.0 (Planejada)
#### Padrões Corporativos de IA
- **Framework de Governança**: Governança de modelos de IA, conformidade e trilhas de auditoria
- **IA Multi-Tenant**: Padrões para atender múltiplos clientes com serviços de IA isolados
- **Implantação Edge AI**: Integração com Azure IoT Edge e instâncias de container
- **IA em Nuvem Híbrida**: Padrões de implantação multi-nuvem e híbrida para workloads de IA

#### Recursos Avançados
- **Automação de Pipeline de IA**: Integração MLOps com pipelines do Azure Machine Learning
- **Segurança Avançada**: Padrões de confiança zero, endpoints privados e proteção avançada contra ameaças
- **Otimização de Performance**: Estratégias avançadas de tuning e escalonamento para aplicações de IA com alto throughput
- **Distribuição Global**: Padrões de entrega de conteúdo e caching na borda para aplicações de IA

### Versão 3.0.0 (Planejada) - Substituída pela Versão Atual
#### Adições Propostas - Agora Implementadas na v3.0.0
- ✅ **Conteúdo Focado em IA**: Integração completa com Microsoft Foundry (Concluído)
- ✅ **Tutoriais Interativos**: Workshop prático de IA (Concluído)
- ✅ **Módulo Avançado de Segurança**: Padrões de segurança específicos para IA (Concluído)
- ✅ **Otimização de Performance**: Estratégias de tuning para workloads de IA (Concluído)

### Versão 2.1.0 (Planejada) - Parcialmente Implementada na v3.0.0
#### Melhorias Menores - Algumas Concluídas na Versão Atual
- ✅ **Exemplos Adicionais**: Cenários de implantação focados em IA (Concluído)
- ✅ **FAQ Estendido**: Perguntas e solução de problemas específicas de IA (Concluído)
- **Integração de Ferramentas**: Guias ampliados de integração com IDEs e editores
- ✅ **Expansão do Monitoramento**: Padrões de monitoramento e alerta específicos de IA (Concluído)

#### Ainda Planejado para Versões Futuras
- **Documentação Compatível com Dispositivos Móveis**: Design responsivo para aprendizado móvel
- **Acesso Offline**: Pacotes de documentação para download
- **Integração Aprimorada com IDE**: Extensão VS Code para fluxos de trabalho AZD + IA
- **Dashboard Comunitário**: Métricas em tempo real da comunidade e rastreamento de contribuições

## Contribuindo para o Changelog

### Reportando Mudanças
Ao contribuir para este repositório, por favor assegure que as entradas do changelog incluam:

1. **Número da Versão**: Seguindo versionamento semântico (major.minor.patch)
2. **Data**: Data de lançamento ou atualização no formato YYYY-MM-DD
3. **Categoria**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Descrição Clara**: Descrição concisa do que mudou
5. **Avaliação de Impacto**: Como as mudanças afetam os usuários existentes

### Categorias de Mudança

#### Added
- Novos recursos, seções de documentação ou capacidades
- Novos exemplos, templates ou recursos de aprendizado
- Ferramentas adicionais, scripts ou utilitários

#### Changed
- Modificações nas funcionalidades ou documentação existentes
- Atualizações para melhorar clareza ou precisão
- Reestruturação de conteúdo ou organização

#### Deprecated
- Funcionalidades ou abordagens que estão sendo descontinuadas
- Seções de documentação programadas para remoção
- Métodos que possuem alternativas melhores

#### Removed
- Recursos, documentação ou exemplos que não são mais relevantes
- Informações desatualizadas ou abordagens depreciadas
- Conteúdo redundante ou consolidado

#### Fixed
- Correções de erros na documentação ou código
- Resolução de problemas relatados ou falhas
- Melhorias de precisão ou funcionalidade


#### Segurança
- Melhorias ou correções relacionadas à segurança
- Atualizações nas melhores práticas de segurança
- Resolução de vulnerabilidades de segurança

### Diretrizes de Versionamento Semântico

#### Versão Principal (X.0.0)
- Mudanças incompatíveis que requerem ação do usuário
- Reestruturação significativa do conteúdo ou organização
- Alterações que modificam a abordagem ou metodologia fundamental

#### Versão Secundária (X.Y.0)
- Novos recursos ou adições de conteúdo
- Melhorias que mantêm compatibilidade retroativa
- Exemplos, ferramentas ou recursos adicionais

#### Versão de Correção (X.Y.Z)
- Correções de bugs e ajustes
- Melhorias menores no conteúdo existente
- Esclarecimentos e pequenos aprimoramentos

## Feedback e Sugestões da Comunidade

Incentivamos ativamente o feedback da comunidade para melhorar este recurso de aprendizado:

### Como Enviar Feedback
- **GitHub Issues**: Reportar problemas ou sugerir melhorias (questões específicas de IA são bem-vindas)
- **Discussões no Discord**: Compartilhar ideias e interagir com a comunidade Microsoft Foundry
- **Pull Requests**: Contribuir com melhorias diretas ao conteúdo, especialmente templates e guias de IA
- **Microsoft Foundry Discord**: Participar do canal #Azure para discussões sobre AZD + IA
- **Fóruns da Comunidade**: Participar de discussões mais amplas para desenvolvedores Azure

### Categorias de Feedback
- **Precisão do Conteúdo de IA**: Correções nas informações de integração e implantação de serviços de IA
- **Experiência de Aprendizado**: Sugestões para melhorar o fluxo de aprendizado para desenvolvedores de IA
- **Conteúdo de IA Ausente**: Solicitações para templates, padrões ou exemplos adicionais de IA
- **Acessibilidade**: Melhorias para necessidades diversificadas de aprendizado
- **Integração de Ferramentas de IA**: Sugestões para melhor integração no fluxo de desenvolvimento de IA
- **Padrões de IA para Produção**: Solicitações de padrões para implantação empresarial de IA

### Compromisso de Resposta
- **Resposta a Problemas**: Dentro de 48 horas para problemas reportados
- **Solicitações de Funcionalidades**: Avaliação dentro de uma semana
- **Contribuições da Comunidade**: Revisão dentro de uma semana
- **Problemas de Segurança**: Prioridade imediata com resposta acelerada

## Cronograma de Manutenção

### Atualizações Regulares
- **Revisões Mensais**: Validação da precisão do conteúdo e links
- **Atualizações Trimestrais**: Adições e melhorias significativas de conteúdo
- **Revisões Semestrais**: Reestruturação abrangente e aprimoramentos
- **Lançamentos Anuais**: Atualizações majoritárias com melhorias significativas

### Monitoramento e Garantia de Qualidade
- **Testes Automatizados**: Validação regular de exemplos de código e links
- **Integração de Feedback da Comunidade**: Incorporação regular de sugestões dos usuários
- **Atualizações Tecnológicas**: Alinhamento com os últimos serviços Azure e lançamentos azd
- **Auditorias de Acessibilidade**: Revisões regulares para princípios de design inclusivo

## Política de Suporte de Versão

### Suporte à Versão Atual
- **Última Versão Principal**: Suporte completo com atualizações regulares
- **Versão Principal Anterior**: Atualizações de segurança e correções críticas por 12 meses
- **Versões Legadas**: Suporte somente pela comunidade, sem atualizações oficiais

### Orientação para Migração
Quando versões principais são lançadas, fornecemos:
- **Guias de Migração**: Instruções passo a passo para transição
- **Notas de Compatibilidade**: Detalhes sobre mudanças incompatíveis
- **Suporte por Ferramentas**: Scripts ou utilitários para auxiliar na migração
- **Suporte Comunitário**: Fóruns dedicados para perguntas sobre migração

---

**Navegação**
- **Lição Anterior**: [Guia de Estudo](resources/study-guide.md)
- **Próxima Lição**: Retornar para o [README Principal](README.md)

**Mantenha-se Atualizado**: Siga este repositório para notificações sobre novos lançamentos e atualizações importantes dos materiais de aprendizado.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->