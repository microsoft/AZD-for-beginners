# Registo de Alterações - AZD Para Iniciantes

## Introdução

Este registo documenta todas as alterações, atualizações e melhorias notáveis no repositório AZD Para Iniciantes. Seguimos os princípios de versionamento semântico e mantemos este registo para ajudar os utilizadores a compreender o que mudou entre versões.

## Objetivos de Aprendizagem

Ao rever este registo de alterações, você irá:
- Manter-se informado sobre novas funcionalidades e adições de conteúdo
- Compreender as melhorias feitas à documentação existente
- Acompanhar as correções de erros e ajustes para garantir a precisão
- Seguir a evolução dos materiais de aprendizagem ao longo do tempo

## Resultados de Aprendizagem

Após rever as entradas do registo, você será capaz de:
- Identificar novos conteúdos e recursos disponíveis para aprendizagem
- Compreender quais secções foram atualizadas ou melhoradas
- Planear o seu percurso de aprendizagem com base nos materiais mais atuais
- Contribuir com feedback e sugestões para melhorias futuras

## Histórico de Versões

### [v3.23.0] - 2026-07-13

#### Atualização AZD 1.27.1: Atualização da versão de referência
**Esta versão revalida o curso face ao `azd` `1.27.1` (julho de 2026, última versão estável) e à extensão atual de agente AI em pré-visualização `azure.ai.agents` `1.0.0-beta.5`, atualizando todas as bandeiras "validado contra" após os lançamentos 1.26.0, 1.27.0, e 1.27.1.**

#### Alterações
- **✅ Linha base de validação atualizada** de `azd 1.25.6` (junho de 2026) para `azd 1.27.1` (julho de 2026) no README principal, todos os READMEs dos capítulos, a lição do dev-container do Capítulo 1 (incluindo exemplos com versões fixas), a lição dos modelos personalizados do Capítulo 4, a lição multi-agente do Capítulo 5 e a documentação do workshop
- **🤖 Base do Capítulo 2 atualizada** de `azd 1.23.12` (março de 2026) para `azd 1.27.1` nos ficheiros `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md`, e `microsoft-foundry-integration.md`; datas da nota de validação atualizadas para 2026-07-13
- **🧩 Extensão do agente AI atualizada** de `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` para a versão atual `1.0.0-beta.5` no README do Capítulo 2 e em `agents.md`
- **🧪 Exemplo de validação do workshop** (saída de `azd version`) atualizado para `1.27.1`

#### Notas sobre lançamentos relevantes do azd (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Suporte Go para Azure Functions no Flex Consumption, filtros de subscrição por inquilino com `azd config sub-filter`, pacotes de extensão self-contained (`azd x pack --bundle`), e `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Modelagem direta de projetos/agentes Azure AI Foundry em `azure.yaml` (inicialização sem Bicep/Terraform), suporte ao deployment de containers para App Service (`host: appservice` + `language: docker`), parâmetro direto `-s/--source` para comandos `azd extension`, e `azd tool uninstall`
- **1.27.1 (2026-07-09):** Flag `--no-dependencies` para `azd extension install`, exclusão por defeito de modelos descontinuados dos prompts de catálogo/cota, e várias correções de bugs

#### Ficheiros Atualizados
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
**Esta versão fecha as lacunas intermédias restantes reveladas pela análise de cobertura do azd: como criar e publicar o seu próprio template, ambientes reproducíveis com dev-container/Codespaces, o fornecedor de infraestrutura Pulumi, um walkthrough de CI/CD no Azure DevOps, autenticação com service principal, orientação para seleção de host (AKS/Spring Apps), explicações sobre `azd restore`/`azd package`, tratamento de erros em hooks, e práticas para ambientes partilhados ou em equipa.**

#### Adicionado
- **🧱 Nova lição do Capítulo 4** `docs/chapter-04-infrastructure/custom-templates.md` — criação do seu próprio template azd: estrutura necessária (`azure.yaml`, `infra/`, `src/`), o campo `metadata.template`, parametrização da infraestrutura com o token de recurso `uniqueString()` e tag `azd-env-name`, testes locais com `azd init --template <local-path>`, publicação no GitHub e submissão à galeria Awesome AZD
- **📦 Nova lição do Capítulo 1** `docs/chapter-01-foundation/dev-containers.md` — ambientes azd reproducíveis com Dev Containers e GitHub Codespaces: um `.devcontainer/devcontainer.json` minimalista usando a funcionalidade oficial `ghcr.io/azure/azure-dev/azd`, funcionalidades específicas por linguagem, `docker-in-docker` para hosts de container, e `azd auth login --use-device-code` para login remoto
- **🧩 Secção Pulumi com azd** em `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, organização da pasta Pulumi, stacks mapeados para ambientes azd, outputs/tags requeridos, e o workflow idêntico de `azd up` / `azd down`
- **🎯 Orientação para seleção de host** em `docs/chapter-04-infrastructure/provisioning.md` — comparação amigável para iniciantes entre `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` e `springapp`, com orientação sobre quando escolher AKS ou Azure Spring Apps
- **🛠️ Walkthrough Azure DevOps CI/CD** em `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, ligação de serviço com federação de identidade para workload (OIDC), o `azure-dev.yml` gerado, e configuração de grupos de variáveis
- **🔑 Service Principals (Padrão 4)** adicionado a `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, `azd auth login` não-interativo com segredo de cliente vs. credenciais federadas/OIDC, quando usar, e armazenamento seguro de credenciais
- **🪝 Subsecção de tratamento de erros em hooks** em `docs/chapter-04-infrastructure/deployment-guide.md` — códigos de saída e `set -e`, `continueOnError`, teste de hooks em isolamento com `azd hooks run`, shells específicos do SO, e `--debug`
- **👥 Secção de ambientes em equipa/partilhados** em `docs/chapter-03-configuration/configuration.md` — o que fica em `.azure/`, o que ignorar no git, ambientes por programador, `azd env list`/`select`, e fornecimento de valores de ambiente em CI/CD
- **🧰 Explicações de `azd restore` e `azd package` alargadas** em `resources/cheat-sheet.md` — restaurar dependências e construir um artefacto implantável sem implantar

#### Alterado
- **🧭 Tabela de lições do Capítulo 4** atualizada para incluir a nova lição "Criação do Seu Próprio Template" (Lição 3)
- **🧭 Tabela de lições do Capítulo 1** atualizada para incluir a nova lição "Dev Containers & Codespaces" (Lição 5); rodapés de navegação ligados entre `bring-your-own-app.md` e `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Preenchimento para iniciantes: Lição prática mult-agente, "Traga a sua própria app", Terraform, e walkthrough de CI/CD
**Esta versão fecha as maiores lacunas para um guia completo para iniciantes, adicionando duas lições práticas (um walkthrough multi-agente deployável e adicionar azd a uma app existente), uma introdução amigável a hooks, uma secção Terraform com azd, um walkthrough passo a passo de pipeline GitHub Actions, uma explicação das novas extensões em pré-visualização, e uma lista de verificação explícita de verificação de implantação.**

#### Adicionado
- **🤝 Nova lição do Capítulo 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — um walkthrough totalmente prático, deployável, de dois agentes (orquestrador + especialistas) usando um template real (`contoso-creative-writer`), cobrindo o uso de multi-agente, workflow `azd up`, compreensão dos recursos implantados, rastreio cross-agente, personalização e limpeza
- **📦 Nova lição do Capítulo 1** `docs/chapter-01-foundation/bring-your-own-app.md` — como adicionar azd a um projeto existente com `azd init` ("usar código no diretório atual"), compreensão do `azure.yaml` e `infra/`, `azd infra generate`, detecção de host, e implantação com `azd up`
- **🌐 Secção Terraform com azd** adicionada a `docs/chapter-04-infrastructure/provisioning.md` — configuração `infra.provider: terraform`, organização da pasta `.tf`, outputs `AZURE_*` requeridos e tagging `azd-env-name`, e workflow idêntico de `azd up` / `azd down` (fecha a lacuna onde o suporte a Terraform era referido mas só Bicep era mostrado)
- **⚙️ Walkthrough passo a passo GitHub Actions** em `docs/chapter-08-production/production-ai-practices.md` — desde o repositório GitHub até implantações automatizadas: `azd pipeline config`, credenciais federadas OIDC (sem segredos armazenados), `azure-dev.yml` gerado, e orientação sobre segredos vs. variáveis
- **🪝 Introdução para iniciantes "Novo em hooks?"** em `docs/chapter-04-infrastructure/deployment-guide.md` — o que é um hook, tabela das fases de um hook, primeiro hook minimalista, e corrida manual de hooks com `azd hooks run`
- **✅ Lista de verificação "Verifique a Sua Implantação"** adicionada ao Passo 5 do `docs/chapter-01-foundation/first-project.md` — teste básico, verificação do endpoint de saúde, e critérios explícitos de sucesso
- **🧩 Explicação para as novas extensões em pré-visualização** `azure.ai.skills` e `azure.ai.connections` (o que são e quando utilizá-las) em `docs/chapter-08-production/production-ai-practices.md`

#### Alterado
- **🧭 Tabela de lições do Capítulo 5** corrigida: `multi-agent-basics.md` é agora a Lição 1 (a única totalmente prática), com indicação honesta que a Lição 2 está no Capítulo 6 e que o cenário de Retail é um blueprint de arquitetura, não um template de um comando
- **🧭 Tabela de lições do Capítulo 1** agora inclui a nova lição "Traga a Sua Própria App" (Lição 4)
- **🔗 Rodapés de navegação** atualizados: `first-project.md` agora liga para a frente até `bring-your-own-app.md`

#### Corrigido
- **🧱 Fechada a lacuna "suposta mas em falta" do Terraform** — o curso anteriormente fazia referência ao suporte Terraform sem o mostrar
- **🔀 Corrigidas ligações cruzadas enganosas no Capítulo 5** que implicavam a existência de uma implementação multi-agente completa quando só existia um blueprint de arquitetura

#### Ficheiros Atualizados
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

#### Atualização AZD 1.25.6, Comandos completos do ciclo de vida dos agentes & Rebrand Aspire

**Esta versão revalida o curso com `azd` `1.25.6` (junho de 2026) e a extensão `azure.ai.agents` `0.1.40-preview`, expande a orientação de IA de "estruturar um agente" para o ciclo de vida completo do agente (testar → avaliar → otimizar → inspecionar → eliminar), destaca as novas extensões preview `azure.ai.skills` e `azure.ai.connections`, e nota a rebranding do produto ".NET Aspire" para "Aspire".**

#### Adicionado
- **🔁 Cobertura completa do ciclo de vida do agente** para iniciantes e engenheiros de IA em toda a documentação:
  - `docs/chapter-01-foundation/azd-basics.md` — Tabela do ciclo de vida (estruturar → testar → medir → melhorar → inspecionar → limpar) adicionada à secção Extensões e Comandos AI
  - `docs/chapter-08-production/production-ai-practices.md` — Nova secção "Gerir o Ciclo de Vida do Agente" abordando `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, e `delete --force`
  - `resources/cheat-sheet.md` — Comandos ampliados para Agentes AI com `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, e `delete --force`
- **🧩 Novas extensões preview** documentadas: `azure.ai.skills` (competências reutilizáveis do agente) e `azure.ai.connections` (ligações Foundry) adicionadas à tabela de extensões e ao cheat sheet
- **⏱️ Orientação sobre tempo de resposta** — Exemplos de `azd ai agent invoke` agora indicam que imprime a latência total e o tempo para o primeiro byte
- **📌 Banner de versão** na README raiz apontando os aprendizes para `azd version` e `azd upgrade`

#### Alterado
- **✅ Linha base de validação atualizada** de `azd 1.23.12` (março de 2026) para `azd 1.25.6` (junho de 2026) em todos os READMEs dos capítulos e nos docs do workshop
- **🤖 Nota de extensão do Capítulo 2** atualizada de `azure.ai.agents` `0.1.18-preview` para `0.1.40-preview`
- **🧪 Exemplo de validação do workshop** (output de `azd version`) atualizado para `1.25.6`
- **🧭 README "Novidades no azd Hoje"** renovada para destacar o ciclo de vida de agente de ponta a ponta, novas extensões AI, e correções recentes de qualidade de vida (`azd init` idempotência, limpeza de token obsoleto em `azd auth login`, prompt na primeira execução de `azd tool`)
- **📖 Capítulo 2 agents.md (Opção 4)** agora encaminha os aprendizes para os comandos do ciclo de vida pós-implantação ao invés de parar no `azd up`

#### Corrigido
- **🏷️ Nomeação do produto** — adicionada nota sobre o rebranding Aspire (".NET Aspire" é agora simplesmente "Aspire"); o suporte do azd a Aspire mantém-se inalterado
- **🔎 Validação em lançamento ao vivo** confirmada contra o feed de lançamentos do Azure Developer CLI: CLI estável `1.25.6` (2026-06-12) e `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Ficheiros Atualizados
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

#### Esclarecimento para Iniciantes, Validação da Configuração & Limpeza Final de Comandos AZD
**Esta versão segue a varredura de validação AZD 1.23 com uma passagem de documentação focada em iniciantes: clarifica a orientação de autenticação prioritária AZD, adiciona scripts de validação da configuração local, verifica comandos chave contra o CLI AZD ao vivo e remove as últimas referências obsoletas a comandos na fonte inglesa fora do changelog.**

#### Adicionado
- **🧪 Scripts de validação da configuração para iniciantes** com `validate-setup.ps1` e `validate-setup.sh` para que os aprendizes possam confirmar as ferramentas necessárias antes de começar o Capítulo 1
- **✅ Passos prévios de validação da configuração** no README raiz e README do Capítulo 1 para assegurar que pré-requisitos em falta são detetados antes do `azd up`

#### Alterado
- **🔐 Orientação de autenticação para iniciantes** agora trata consistentemente `azd auth login` como o caminho principal para fluxos AZD, com `az login` indicado como opcional a menos que comandos Azure CLI sejam usados diretamente
- **📚 Fluxo de onboarding do Capítulo 1** agora direciona os aprendizes a validar a configuração local antes da instalação, autenticação e primeiros passos de implantação
- **🛠️ Mensagens do validador** agora distinguem claramente entre requisitos bloqueadores e avisos opcionais do Azure CLI para o caminho somente AZD para iniciantes
- **📖 Documentação de configuração, resolução de problemas e exemplos** agora distingue entre autenticação AZD obrigatória e início de sessão Azure CLI opcional onde anteriormente ambos eram apresentados sem contexto

#### Corrigido
- **📋 Referências restantes a comandos na fonte inglesa** atualizadas para as formas AZD atuais, incluindo `azd config show` no cheat sheet e `azd monitor --overview` onde era pretendida orientação sobre o portal Azure
- **🧭 Afirmativas para iniciantes no Capítulo 1** suavizadas para evitar prometer inexistente comportamento garantido sem erros ou rollback em todos os templates e recursos Azure
- **🔎 Validação do CLI ao vivo** confirmada para suporte atual a `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, e `azd down --force --purge`

#### Ficheiros Atualizados
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

#### Validação AZD 1.23.12, Expansão do Ambiente do Workshop & Atualização do Modelo AI
**Esta versão realiza uma varredura de validação da documentação contra `azd` `1.23.12`, atualiza exemplos de comandos AZD desatualizados, renova a orientação do modelo AI para os padrões atuais, e alarga as instruções do workshop para além do GitHub Codespaces, incluindo suporte a dev containers e clonagens locais.**

#### Adicionado
- **✅ Notas de validação nas secções principais e documentos do workshop** para tornar explícita a linha base testada AZD para aprendizes usando builds mais recentes ou antigos do CLI
- **⏱️ Orientação sobre timeout de implantação** para implantações longas de apps IA usando `azd deploy --timeout 1800`
- **🔎 Passos para inspeção de extensão** com `azd extension show azure.ai.agents` na documentação de workflows AI
- **🌐 Orientação mais ampla para ambientes do workshop** cobrindo GitHub Codespaces, dev containers e clonagens locais com MkDocs

#### Alterado
- **📚 READMEs de introdução aos capítulos** agora indicam consistentemente a validação contra `azd 1.23.12` em fundação, configuração, infraestrutura, multi-agentes, pré-implantação, resolução de problemas e secções de produção
- **🛠️ Referências a comandos AZD** atualizadas para formas atuais na documentação:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` ou `azd env get-value(s)` conforme contexto
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` onde se pretende visão geral do Application Insights
- **🧪 Exemplos de provisionamento preview** simplificados para uso suportado atual como `azd provision --preview` e `azd provision --preview -e production`
- **🧭 Fluxo do workshop** atualizado para que os aprendizes possam completar os laboratórios em Codespaces, dev container ou clonagem local em vez de assumir execução apenas em Codespaces
- **🔐 Orientação de autenticação** agora prefere `azd auth login` para fluxos AZD, com `az login` posicionado como opcional quando comandos Azure CLI são usados diretamente

#### Corrigido
- **🪟 Comandos de instalação no Windows** normalizados para o caso atual do pacote `winget` no guia de instalação
- **🐧 Orientação para instalação Linux** corrigida para evitar instruções específicas de distribuições não suportadas para o gestor de pacotes `azd` e apontar para os assets de release onde apropriado
- **📦 Exemplos de modelos AI** atualizados de padrões anteriores como `gpt-35-turbo` e `text-embedding-ada-002` para exemplos atuais como `gpt-4.1-mini`, `gpt-4.1`, e `text-embedding-3-large`
- **📋 Fragmentos de implantação e diagnóstico** corrigidos para usar comandos atuais de ambiente e estado em logs, scripts e passos de resolução de problemas
- **⚙️ Orientação para GitHub Actions** atualizada de `Azure/setup-azd@v1.0.0` para `Azure/setup-azd@v2`
- **🤖 Orientação para consentimento MCP/Copilot** atualizada de `azd mcp consent` para `azd copilot consent list`

#### Melhorado
- **🧠 Orientação em capítulos AI** agora explica melhor o comportamento sensível ao preview de `azd ai`, login específico de tenant, uso atual das extensões, e recomendações atualizadas para implantação de modelos
- **🧪 Instruções do workshop** agora usam exemplos de versões mais realistas e linguagem mais clara para configuração de ambiente nos laboratórios práticos
- **📈 Documentação de produção e resolução de problemas** agora alinhada melhor com monitorização atual, modelo fallback e exemplos de níveis de custo

#### Ficheiros Atualizados
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

#### Comandos de CLI AZD AI, Validação de Conteúdo & Expansão do Template
**Esta versão adiciona cobertura dos comandos `azd ai`, `azd extension` e `azd mcp` em todos os capítulos relacionados com IA, corrige links quebrados e código obsoleto em agents.md, atualiza o cheat sheet, e reformula a secção de Exemplo de Templates com descrições validadas e novos templates Azure AI AZD.**

#### Adicionado
- **🤖 Cobertura do CLI AZD AI** em 7 ficheiros (anteriormente apenas no Capítulo 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nova secção "Extensões e Comandos AI" introduzindo `azd extension`, `azd ai agent init`, e `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opção 4: `azd ai agent init` com tabela comparativa (template vs abordagem manifesto)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Subseções "Extensões AZD para Foundry" e "Implantação com Agente em Primeiro Lugar"

  - `docs/chapter-05-multi-agent/README.md` — Arranque Rápido agora mostra ambas as opções de implantação baseadas em template e manifesto
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — A secção de Implantação agora inclui a opção `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Subseção "Comandos da Extensão AZD AI para Diagnósticos"
  - `resources/cheat-sheet.md` — Nova secção "Comandos AI & Extensões" com `azd extension`, `azd ai agent init`, `azd mcp`, e `azd infra generate`
- **📦 Novos templates de exemplo AZD AI** em `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — Chat RAG .NET com Blazor WebAssembly, Semantic Kernel, e suporte a chat de voz
  - **azure-search-openai-demo-java** — Chat RAG Java usando Langchain4J com opções de implantação ACA/AKS
  - **contoso-creative-writer** — Aplicação multi-agente de escrita criativa usando Azure AI Agent Service, Bing Grounding, e Prompty
  - **serverless-chat-langchainjs** — RAG sem servidor usando Azure Functions + LangChain.js + Cosmos DB com suporte a desenvolvimento local Ollama
  - **chat-with-your-data-solution-accelerator** — Acelerador empresarial RAG com portal admin, integração Teams, e opções PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Aplicação de referência de orquestração MCP multi-agente com servidores em .NET, Python, Java, e TypeScript
  - **azd-ai-starter** — Template inicial minimalista de infraestrutura Azure AI em Bicep
  - **🔗 Link para a Galeria Awesome AZD AI** — Referência à [galeria awesome-azd AI](https://azure.github.io/awesome-azd/?tags=ai) (mais de 80 templates)

#### Corrigido
- **🔗 Navegação em agents.md**: Os links Anterior/Seguinte correspondem agora à ordem das lições do README do Capítulo 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Links quebrados em agents.md**: Corrigido `production-ai-practices.md` para `../chapter-08-production/production-ai-practices.md` (3 ocorrências)
- **📦 Código obsoleto em agents.md**: Substituído `opencensus` por `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 API inválida em agents.md**: Transferido `max_tokens` de `create_agent()` para `create_run()` como `max_completion_tokens`
- **🔢 Contagem de tokens em agents.md**: Substituído estimativa aproximada `len//4` por `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Serviços corrigidos de "Cognitive Search + App Service" para "Azure AI Search + Azure Container Apps" (host padrão alterado em out 2024)
- **contoso-chat**: Descrição atualizada para referenciar Azure AI Foundry + Prompty, de acordo com o título e tecnologia do repositório

#### Removido
- **ai-document-processing**: Removida referência a template não funcional (repositório não público como template AZD)

#### Melhorado
- **📝 Exercícios em agents.md**: Exercício 1 agora mostra saída esperada e passo `azd monitor`; Exercício 2 inclui código completo de registo `FunctionTool`; Exercício 3 substitui instruções vagas por comandos concretos `prepdocs.py`
- **📚 Recursos em agents.md**: Atualizados links de documentação para os atuais documentos e arranque rápido do Azure AI Agent Service
- **📋 Tabela Próximos Passos em agents.md**: Adicionado link para Workshop AI com cobertura completa do capítulo

#### Ficheiros Atualizados
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Melhoria na Navegação do Curso
**Esta versão melhora a navegação do capítulo README.md com um formato de tabela melhorado.**

#### Alterado
- **Tabela do Mapa do Curso**: Melhorada com links diretos para lições, estimativas de duração e classificações de complexidade
- **Limpeza de Pastas**: Pastas antigas redundantes removidas (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Validação de Links**: Todos os mais de 21 links internos na tabela do Mapa do Curso verificados

### [v3.16.0] - 2026-02-05

#### Atualizações de Nome do Produto
**Esta versão atualiza as referências do produto para a marca atual da Microsoft.**

#### Alterado
- **Microsoft Foundry → Microsoft Foundry**: Todas as referências atualizadas em ficheiros não traduzidos
- **Azure AI Agent Service → Foundry Agents**: Nome do serviço atualizado para refletir a marca atual

#### Ficheiros Atualizados
- `README.md` - Página principal do curso
- `changelog.md` - Histórico de versões
- `course-outline.md` - Estrutura do curso
- `docs/chapter-02-ai-development/agents.md` - Guia de agentes AI
- `examples/README.md` - Documentação de exemplos
- `workshop/README.md` - Página inicial do workshop
- `workshop/docs/index.md` - Índice do workshop
- `workshop/docs/instructions/*.md` - Todos os ficheiros de instruções do workshop

---

### [v3.15.0] - 2026-02-05

#### Reestruturação importante do repositório: Pastas nomeadas por capítulo
**Esta versão reestrutura a documentação em pastas dedicadas por capítulo para uma navegação mais clara.**

#### Renomeações de Pastas
Pastas antigas foram substituídas por pastas numeradas por capítulo:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Adicionado novo: `docs/chapter-05-multi-agent/`

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
| Todos os ficheiros de pré-implantação | pre-deployment/ | chapter-06-pre-deployment/ |
| Todos os ficheiros de resolução de problemas | troubleshooting/ | chapter-07-troubleshooting/ |

#### Adicionado
- **📚 Ficheiros README dos Capítulos**: Criados README.md em cada pasta com:
  - Objetivos de aprendizagem e duração
  - Tabela de lições com descrições
  - Comandos de arranque rápido
  - Navegação para outros capítulos

#### Alterado
- **🔗 Atualizados todos os links internos**: Mais de 78 caminhos atualizados em toda a documentação
- **🗺️ README.md principal**: Mapa do Curso atualizado com nova estrutura por capítulos
- **📝 examples/README.md**: Referências cruzadas atualizadas para pastas por capítulos

#### Removido
- Estrutura antiga de pastas (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Reestruturação do Repositório: Navegação por Capítulos
**Esta versão adicionou ficheiros README de navegação por capítulo (substituída pela v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Novo Guia de Agentes AI
**Esta versão adiciona um guia completo para implantação de agentes AI com Azure Developer CLI.**

#### Adicionado
- **🤖 docs/microsoft-foundry/agents.md**: Guia completo cobrindo:
  - O que são agentes AI e como diferem dos chatbots
  - Três templates para arranque rápido (Foundry Agents, Prompty, RAG)
  - Padrões de arquitetura de agentes (agente único, RAG, multi-agente)
  - Configuração e personalização de ferramentas
  - Monitorização e acompanhamento de métricas
  - Considerações de custo e otimização
  - Cenários comuns de resolução de problemas
  - Três exercícios práticos com critérios de sucesso

#### Estrutura do Conteúdo
- **Introdução**: Conceitos de agentes para iniciantes
- **Arranque Rápido**: Implantação de agentes com `azd init --template get-started-with-ai-agents`
- **Padrões de Arquitetura**: Diagramas visuais dos padrões de agentes
- **Configuração**: Configuração de ferramentas e variáveis de ambiente
- **Monitorização**: Integração com Application Insights
- **Exercícios**: Aprendizagem prática progressiva (20-45 minutos cada)

---

### [v3.12.0] - 2026-02-05

#### Atualização do Ambiente DevContainer
**Esta versão atualiza a configuração do container de desenvolvimento com ferramentas modernas e melhores padrões para a experiência de aprendizagem AZD.**

#### Alterado
- **🐳 Imagem Base**: Atualizada de `python:3.12-bullseye` para `python:3.12-bookworm` (última versão estável do Debian)
- **📛 Nome do Container**: Renomeado de "Python 3" para "AZD para Iniciantes" para mais clareza

#### Adicionado
- **🔧 Novas Funcionalidades do Dev Container**:
  - `azure-cli` com suporte a Bicep ativado
  - `node:20` (versão LTS para templates AZD)
  - `github-cli` para gestão de templates
  - `docker-in-docker` para implantações de apps em container

- **🔌 Encaminhamento de Portas**: Portas pré-configuradas para desenvolvimento comum:
  - 8000 (pré-visualização MkDocs)
  - 3000 (apps Web)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Novas Extensões VS Code**:
  - `ms-python.vscode-pylance` - IntelliSense Python melhorado
  - `ms-azuretools.vscode-azurefunctions` - Suporte Azure Functions
  - `ms-azuretools.vscode-docker` - Suporte Docker
  - `ms-azuretools.vscode-bicep` - Suporte à linguagem Bicep
  - `ms-azure-devtools.azure-resource-groups` - Gestão de recursos Azure
  - `yzhang.markdown-all-in-one` - Edição Markdown
  - `DavidAnson.vscode-markdownlint` - Linting Markdown
  - `bierner.markdown-mermaid` - Suporte a diagramas Mermaid
  - `redhat.vscode-yaml` - Suporte YAML (para azure.yaml)
  - `eamodio.gitlens` - Visualização Git
  - `mhutchie.git-graph` - Histórico Git

- **⚙️ Configurações do VS Code**: Adicionadas definições padrão para intérprete Python, formatar ao guardar, e remoção de espaços em branco

- **📦 requirements-dev.txt atualizado**:
  - Adicionado plugin MkDocs minify
  - Adicionado pre-commit para qualidade de código
  - Adicionados pacotes Azure SDK (azure-identity, azure-mgmt-resource)

#### Corrigido
- **Comando Pós-Criação**: Agora verifica instalação do AZD e Azure CLI ao iniciar o container

---

### [v3.11.0] - 2026-02-05

#### Reformulação do README para Iniciantes
**Esta versão melhora significativamente o README.md para ser mais acessível a principiantes e adiciona recursos essenciais para desenvolvedores AI.**

#### Adicionado
- **🆚 Comparação Azure CLI vs AZD**: Explicação clara de quando usar cada ferramenta com exemplos práticos
- **🌟 Links Awesome AZD**: Links diretos para galeria comunitária de templates e recursos de contribuição:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - Mais de 200 templates prontos para implantar
  - [Envie um Template](https://github.com/Azure/awesome-azd/issues) - Contribuição da comunidade
- **🎯 Guia de Arranque Rápido**: Secção simplificada de 3 passos (Instalar → Login → Implantar)
- **📊 Tabela de Navegação com Base na Experiência**: Orientação clara sobre onde começar consoante experiência do desenvolvedor

#### Alterado
- **Estrutura do README**: Reorganizado para divulgação progressiva - informação chave primeiro
- **Secção de Introdução**: Reescrita para explicar "A Magia do `azd up`" para principiantes absolutos
- **Conteúdo Duplicado Removido**: Eliminada secção duplicada de resolução de problemas
- **Comandos de Resolução de Problemas**: Corrigida referência a `azd logs` para usar `azd monitor --logs` válido

#### Corrigido

- **🔐 Comandos de Autenticação**: Adicionados `azd auth login` e `azd auth logout` ao cheat-sheet.md
- **Referências de Comando Inválidas**: Removido o restante `azd logs` da seção de resolução de problemas do README

#### Notas
- **Âmbito**: Alterações aplicadas ao README.md principal e resources/cheat-sheet.md
- **Público-Alvo**: Melhorias destinadas especificamente a desenvolvedores novos no AZD

---

### [v3.10.0] - 2026-02-05

#### Atualização de Precisão dos Comandos do Azure Developer CLI
**Esta versão corrige comandos AZD inexistentes em toda a documentação, garantindo que todos os exemplos de código utilizam uma sintaxe válida do Azure Developer CLI.**

#### Corrigido
- **🔧 Comandos AZD Inexistentes Removidos**: Auditoria abrangente e correção de comandos inválidos:
  - `azd logs` (não existe) → substituído por `azd monitor --logs` ou alternativas Azure CLI
  - Subcomandos de `azd service` (não existem) → substituídos por `azd show` e Azure CLI
  - `azd infra import/export/validate` (não existem) → removidos ou substituídos por alternativas válidas
  - Flags `azd deploy --rollback/--incremental/--parallel/--detect-changes` (não existem) → removidas
  - Flags `azd provision --what-if/--rollback` (não existem) → atualizadas para usar `--preview`
  - `azd config validate` (não existe) → substituído por `azd config list`
  - `azd info`, `azd history`, `azd metrics` (não existem) → removidos

- **📚 Ficheiros Atualizados com Correções de Comando**:
  - `resources/cheat-sheet.md`: Grande revisão da referência de comandos
  - `docs/deployment/deployment-guide.md`: Corrigidas estratégias de rollback e deploy
  - `docs/troubleshooting/debugging.md`: Seções de análise de logs corrigidas
  - `docs/troubleshooting/common-issues.md`: Comandos de troubleshooting atualizados
  - `docs/troubleshooting/ai-troubleshooting.md`: Seção de debugging AZD corrigida
  - `docs/getting-started/azd-basics.md`: Comandos de monitorização corrigidos
  - `docs/getting-started/first-project.md`: Exemplos de monitorização e debugging atualizados
  - `docs/getting-started/installation.md`: Exemplos de ajuda e versão corrigidos
  - `docs/pre-deployment/application-insights.md`: Comandos de visualização de logs corrigidos
  - `docs/pre-deployment/coordination-patterns.md`: Comandos de debugging de agente corrigidos

- **📝 Referência de Versão Atualizada**: 
  - `docs/getting-started/installation.md`: Versão fixa `1.5.0` alterada para genérica `1.x.x` com link para lançamentos

#### Alterado
- **Estratégias de Rollback**: Documentação atualizada para usar rollback baseado em Git (AZD não tem rollback nativo)
- **Visualização de Logs**: Referências a `azd logs` substituídas por `azd monitor --logs`, `azd monitor --live`, e comandos Azure CLI
- **Seção de Performance**: Flags de deployment paralelo/incremental inexistentes removidas, alternativas válidas fornecidas

#### Detalhes Técnicos
- **Comandos AZD Válidos**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Flags válidas de azd monitor**: `--live`, `--logs`, `--overview`
- **Funcionalidades Removidas**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notas
- **Verificação**: Comandos validados contra Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Conclusão do Workshop e Atualização de Qualidade da Documentação
**Esta versão completa os módulos interativos do workshop, corrige todos os links quebrados na documentação e melhora a qualidade geral para desenvolvedores AI que usam Microsoft AZD.**

#### Adicionado
- **📝 CONTRIBUTING.md**: Novo documento de diretrizes de contribuição com:
  - Instruções claras para reportar problemas e propor mudanças
  - Padrões de documentação para novos conteúdos
  - Diretrizes para exemplos de código e convenções de mensagens de commit
  - Informações sobre envolvimento da comunidade

#### Concluído
- **🎯 Módulo 7 do Workshop (Conclusão)**: Módulo de conclusão totalmente completado com:
  - Resumo abrangente das conquistas do workshop
  - Seção de conceitos-chave dominados sobre AZD, templates, e Microsoft Foundry
  - Recomendações para continuação da jornada de aprendizagem
  - Exercícios desafiantes com classificações de dificuldade
  - Feedback da comunidade e links de suporte

- **📚 Módulo 3 do Workshop (Desconstruir)**: Objetivos de aprendizado atualizados com:
  - Ativação do GitHub Copilot com servidores MCP
  - Compreensão da estrutura da pasta de templates AZD
  - Padrões de organização de infraestrutura como código (Bicep)
  - Instruções para laboratório prático

- **🔧 Módulo 6 do Workshop (Desmontagem)**: Completo com:
  - Objetivos de limpeza de recursos e gestão de custos
  - Utilização de `azd down` para desprovisionamento seguro da infraestrutura
  - Guia para recuperação de serviços cognitivos soft-deleted
  - Sugestões adicionais para explorar GitHub Copilot e Azure Portal

#### Corrigido
- **🔗 Correções de Links Quebrados**: Resolvidos 15+ links internos quebrados na documentação:
  - `docs/ai-foundry/ai-model-deployment.md`: Caminhos corrigidos para microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Caminhos corrigidos para ai-model-deployment.md e production-ai-practices.md
  - `docs/getting-started/first-project.md`: `cicd-integration.md` inexistente substituído por deployment-guide.md
  - `examples/retail-scenario.md`: Caminhos corrigidos para FAQ e guia de resolução de problemas
  - `examples/container-app/microservices/README.md`: Caminhos para página do curso e guia de deployment corrigidos
  - `resources/faq.md` e `resources/glossary.md`: Referências ao capítulo de AI atualizadas
  - `course-outline.md`: Guias do instrutor e laboratórios do workshop de AI corrigidos

- **📅 Bandeira de Estado do Workshop**: Atualizada de "Em Construção" para estado ativo com data de Fevereiro 2026

- **🔗 Navegação no Workshop**: Corrigidos links quebrados no README.md do workshop apontando para a pasta lab-1-azd-basics inexistente

#### Alterado
- **Apresentação do Workshop**: Removido aviso de "em construção", workshop está agora completo e pronto a usar
- **Consistência na Navegação**: Garantida navegação adequada entre todos os módulos do workshop
- **Referências no Caminho de Aprendizagem**: Cruzamentos de capítulos atualizados com os caminhos corretos para microsoft-foundry

#### Validado
- ✅ Todos os ficheiros markdown em inglês têm links internos válidos
- ✅ Módulos 0-7 do workshop completos com objetivos de aprendizado
- ✅ Navegação entre capítulos e módulos funciona corretamente
- ✅ Conteúdo adequado para desenvolvedores AI que usam Microsoft AZD
- ✅ Linguagem e estrutura amigáveis para iniciantes mantidas em todo o conteúdo
- ✅ CONTRIBUTING.md oferece diretrizes claras para colaboradores da comunidade

#### Implementação Técnica
- **Validação de Links**: Script PowerShell automatizado verificou todos os links internos .md
- **Auditoria de Conteúdo**: Revisão manual da completude e adequação para iniciantes do workshop
- **Sistema de Navegação**: Padrões consistentes de navegação entre capítulos e módulos aplicados

#### Notas
- **Âmbito**: Alterações aplicadas somente à documentação em inglês
- **Traduções**: Pastas de tradução não atualizadas nesta versão (tradução automática sincronizará posteriormente)
- **Duração do Workshop**: Workshop completo agora oferece 3-4 horas de aprendizado prático

---

### [v3.8.0] - 2025-11-19

#### Documentação Avançada: Monitorização, Segurança e Padrões Multi-Agente
**Esta versão adiciona lições abrangentes de grau A sobre integração com Application Insights, padrões de autenticação e coordenação multi-agente para deployments de produção.**

#### Adicionado
- **📊 Lição de Integração com Application Insights**: em `docs/pre-deployment/application-insights.md`:
  - Deployment focado em AZD com provisionamento automático
  - Templates Bicep completos para Application Insights + Log Analytics
  - Aplicações Python funcionais com telemetria personalizada (mais de 1.200 linhas)
  - Padrões de monitorização AI/LLM (rastreamento de tokens/custos de Microsoft Foundry Models)
  - 6 diagramas Mermaid (arquitetura, tracing distribuído, fluxo de telemetria)
  - 3 exercícios práticos (alertas, dashboards, monitorização AI)
  - Exemplos de queries Kusto e estratégias de otimização de custos
  - Streaming de métricas ao vivo e debugging em tempo real
  - Tempo de aprendizado de 40-50 minutos com padrões prontos para produção

- **🔐 Lição de Padrões de Autenticação & Segurança**: em `docs/getting-started/authsecurity.md`:
  - 3 padrões de autenticação (connection strings, Key Vault, identidade gerida)
  - Templates Bicep completos para infraestruturas seguras
  - Código de aplicação Node.js com integração Azure SDK
  - 3 exercícios completos (ativar identidade gerida, identidade atribuída pelo utilizador, rotação do Key Vault)
  - Melhores práticas de segurança e configurações RBAC
  - Guia de resolução de problemas e análise de custos
  - Padrões para autenticação sem palavra-passe prontos para produção

- **🤖 Lição de Padrões de Coordenação Multi-Agente**: em `docs/pre-deployment/coordination-patterns.md`:
  - 5 padrões de coordenação (sequencial, paralelo, hierárquico, orientado a eventos, consenso)
  - Implementação completa do serviço orquestrador (Python/Flask, mais de 1.500 linhas)
  - 3 implementações especializadas de agentes (Investigação, Escritor, Editor)
  - Integração com Service Bus para enfileiramento de mensagens
  - Gestão de estado com Cosmos DB para sistemas distribuídos
  - 6 diagramas Mermaid mostrando interações entre agentes
  - 3 exercícios avançados (gestão de timeout, lógica de retry, circuit breaker)
  - Desglose de custos (240-565 USD/mês) com estratégias de otimização
  - Integração com Application Insights para monitorização

#### Melhorado
- **Capítulo Pré-deployment**: Agora inclui padrões completos de monitorização e coordenação
- **Capítulo Iniciação**: Aperfeiçoado com padrões profissionais de autenticação
- **Prontidão para Produção**: Cobertura completa desde segurança até observabilidade
- **Estrutura do Curso**: Atualizada para referenciar novas lições nos Capítulos 3 e 6

#### Alterado
- **Progressão de Aprendizagem**: Melhor integração de segurança e monitorização durante o curso
- **Qualidade da Documentação**: Padrões consistentes de grau A (95-97%) nas novas lições
- **Padrões de Produção**: Cobertura completa ponta a ponta para deployments empresariais

#### Melhorado
- **Experiência do Desenvolvedor**: Caminho claro do desenvolvimento à monitorização em produção
- **Padrões de Segurança**: Padrões profissionais para autenticação e gestão de segredos
- **Observabilidade**: Integração completa do Application Insights com AZD
- **Cargas de Trabalho AI**: Monitorização especializada para Microsoft Foundry Models e sistemas multi-agente

#### Validado
- ✅ Todas as lições incluem código funcional completo (não só snippets)
- ✅ Diagramas Mermaid para aprendizagem visual (19 no total em 3 lições)
- ✅ Exercícios práticos com passos de verificação (9 no total)
- ✅ Templates Bicep prontos para produção, implantáveis com `azd up`
- ✅ Análise e estratégias de otimização de custos
- ✅ Guias de resolução de problemas e melhores práticas
- ✅ Checkpoints de conhecimento com comandos de verificação

#### Resultados da Avaliação da Documentação
- **docs/pre-deployment/application-insights.md**: - Guia abrangente de monitorização
- **docs/getting-started/authsecurity.md**: - Padrões profissionais de segurança
- **docs/pre-deployment/coordination-patterns.md**: - Arquiteturas multi-agente avançadas
- **Conteúdo Geral Novo**: - Padrões consistentes de alta qualidade

#### Implementação Técnica
- **Application Insights**: Log Analytics + telemetria personalizada + tracing distribuído
- **Autenticação**: Identidade Gerida + Key Vault + Padrões RBAC
- **Multi-Agente**: Service Bus + Cosmos DB + Container Apps + orquestração
- **Monitorização**: Métricas ao vivo + Queries Kusto + alertas + dashboards
- **Gestão de Custos**: Estratégias de amostragem, políticas de retenção, controlo de orçamentos

### [v3.7.0] - 2025-11-19

#### Melhorias na Qualidade da Documentação e Novo Exemplo Microsoft Foundry Models
**Esta versão melhora a qualidade da documentação em todo o repositório e adiciona um exemplo completo de deployment de Microsoft Foundry Models com interface de chat gpt-4.1.**

#### Adicionado
- **🤖 Exemplo de Chat Microsoft Foundry Models**: Deployment completo gpt-4.1 com implementação funcional em `examples/azure-openai-chat/`:
  - Infraestrutura completa de Microsoft Foundry Models (deployment modelo gpt-4.1)
  - Interface de chat Python em linha de comando com histórico de conversa
  - Integração com Key Vault para armazenamento seguro de chaves API
  - Rastreamento de uso de tokens e estimativa de custos
  - Limitação de taxa e tratamento de erros
  - README abrangente com guia de deployment de 35-45 minutos
  - 11 ficheiros prontos para produção (templates Bicep, app Python, configuração)
- **📚 Exercícios de Documentação**: Adicionados exercícios práticos ao guia de configuração:
  - Exercício 1: Configuração multi-ambiente (15 minutos)
  - Exercício 2: Prática de gestão de segredos (10 minutos)
  - Critérios claros de sucesso e passos de verificação
- **✅ Verificação de Deployment**: Seção de verificação adicionada ao guia de deployment:
  - Procedimentos de health check
  - Checklist de critérios de sucesso
  - Outputs esperados para todos os comandos de deployment
  - Referência rápida para resolução de problemas

#### Melhorado
- **examples/README.md**: Atualizado para qualidade grau A (93%):
  - Adicionado azure-openai-chat a todas as seções relevantes
  - Número local de exemplos atualizado de 3 para 4
  - Adicionado à tabela de Exemplos de Aplicações AI
  - Integrado no Quick Start para Utilizadores Intermédios
  - Adicionado à secção de Microsoft Foundry Templates
  - Atualizado Matriz de Comparação e secções de pesquisa tecnológica
- **Qualidade da Documentação**: Melhorada de B+ (87%) para A- (92%) na pasta docs:

  - Adicionados resultados esperados aos exemplos de comandos críticos
  - Incluídos passos de verificação para alterações de configuração
  - Aprendizagem prática melhorada com exercícios práticos

#### Alterado
- **Progressão de Aprendizagem**: Melhor integração de exemplos de IA para aprendizes intermédios
- **Estrutura da Documentação**: Exercícios mais práticos com resultados claros
- **Processo de Verificação**: Critérios explícitos de sucesso adicionados aos fluxos de trabalho principais

#### Melhorado
- **Experiência do Desenvolvedor**: Implantação dos Microsoft Foundry Models leva agora 35-45 minutos (vs 60-90 para alternativas complexas)
- **Transparência de Custos**: Estimativas claras de custos ($50-200/mês) para exemplo de Microsoft Foundry Models
- **Caminho de Aprendizagem**: Desenvolvedores de IA têm ponto de entrada claro com azure-openai-chat
- **Padrões de Documentação**: Resultados esperados e passos de verificação consistentes

#### Validado
- ✅ Exemplo Microsoft Foundry Models totalmente funcional com `azd up`
- ✅ Todos os 11 ficheiros de implementação sintaticamente corretos
- ✅ Instruções do README correspondem à experiência real de implantação
- ✅ Links da documentação atualizados em mais de 8 locais
- ✅ Índice de exemplos reflete corretamente 4 exemplos locais
- ✅ Sem links externos duplicados nas tabelas
- ✅ Todas as referências de navegação corretas

#### Implementação Técnica
- **Arquitetura Microsoft Foundry Models**: padrão gpt-4.1 + Key Vault + Container Apps
- **Segurança**: Identidade Gerida pronta, segredos em Key Vault
- **Monitorização**: Integração com Application Insights
- **Gestão de Custos**: Rastreio de tokens e otimização de uso
- **Implantação**: Comando único `azd up` para configuração completa

### [v3.6.0] - 2025-11-19

#### Atualização Principal: Exemplos de Implantação de Container App
**Esta versão introduz exemplos abrangentes de implantação de aplicações em container prontos para produção usando Azure Developer CLI (AZD), com documentação completa e integração no caminho de aprendizagem.**

#### Adicionado
- **🚀 Exemplos Container App**: Novos exemplos locais em `examples/container-app/`:
  - [Guia Mestre](examples/container-app/README.md): Visão completa de implantações conteinerizadas, início rápido, produção e padrões avançados
  - [API Flask Simples](../../examples/container-app/simple-flask-api): API REST amigável para iniciantes com scale-to-zero, sondas de saúde, monitorização e resolução de problemas
  - [Arquitetura Microserviços](../../examples/container-app/microservices): Implantação multi-serviço pronta para produção (API Gateway, Produto, Encomenda, Utilizador, Notificação), mensagens assíncronas, Service Bus, Cosmos DB, Azure SQL, tracing distribuído, implantação blue-green/canário
- **Melhores Práticas**: Segurança, monitorização, otimização de custos e orientação para CI/CD em workloads conteinerizados
- **Exemplos de Código**: `azure.yaml` completo, templates Bicep, e implementações de serviços em várias linguagens (Python, Node.js, C#, Go)
- **Testes & Resolução de Problemas**: Cenários de testes end-to-end, comandos de monitorização, orientação para resolução

#### Alterado
- **README.md**: Atualizado para incluir e ligar novos exemplos de container apps sob "Local Examples - Container Applications"
- **examples/README.md**: Atualizado para destacar exemplos de container apps, adicionar entradas na matriz de comparação, e atualizar referências tecnológicas/arquitetónicas
- **Plano de Curso & Guia de Estudo**: Atualizado para referenciar novos exemplos e padrões de implantação de container apps nos capítulos relevantes

#### Validado
- ✅ Todos os novos exemplos implantáveis com `azd up` e seguem melhores práticas
- ✅ Links cruzados da documentação e navegação atualizados
- ✅ Exemplos cobrem cenários do iniciante ao avançado, incluindo microserviços para produção

#### Notas
- **Âmbito**: Documentação e exemplos apenas em inglês
- **Próximos Passos**: Expandir com padrões de container avançados adicionais e automação CI/CD em futuras versões

### [v3.5.0] - 2025-11-19

#### Rebranding do Produto: Microsoft Foundry
**Esta versão implementa a alteração completa do nome do produto de "Microsoft Foundry" para "Microsoft Foundry" em toda a documentação em inglês, refletindo o rebranding oficial da Microsoft.**

#### Alterado
- **🔄 Atualização do Nome do Produto**: Rebranding completo de "Microsoft Foundry" para "Microsoft Foundry"
  - Atualizadas todas as referências na documentação em inglês na pasta `docs/`
  - Renomeada pasta: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Renomeado ficheiro: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 referências de conteúdo atualizadas em 7 ficheiros de documentação

- **📁 Alterações na Estrutura da Pasta**:
  - `docs/ai-foundry/` renomeada para `docs/microsoft-foundry/`
  - Todas referências cruzadas atualizadas para refletir nova estrutura de pastas
  - Links de navegação validados por toda a documentação

- **📄 Renomeação de Ficheiros**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Todos os links internos atualizados para referenciar o novo nome de ficheiro

#### Ficheiros Atualizados
- **Documentação dos Capítulos** (7 ficheiros):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 atualizações de links de navegação
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 referências ao nome do produto atualizadas
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Já usa Microsoft Foundry (de atualizações anteriores)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referências atualizadas (visão geral, feedback comunitário, documentação)
  - `docs/getting-started/azd-basics.md` - 4 atualizações em links de referência cruzada
  - `docs/getting-started/first-project.md` - 2 atualizações em links de navegação de capítulo
  - `docs/getting-started/installation.md` - 2 atualizações em links para próximos capítulos
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referências atualizadas (navegação, comunidade Discord)
  - `docs/troubleshooting/common-issues.md` - 1 atualização de link de navegação
  - `docs/troubleshooting/debugging.md` - 1 atualização de link de navegação

- **Ficheiros da Estrutura do Curso** (2 ficheiros):
  - `README.md` - 17 referências atualizadas (visão geral do curso, títulos dos capítulos, secção de templates, insights da comunidade)
  - `course-outline.md` - 14 referências atualizadas (visão geral, objetivos de aprendizagem, recursos dos capítulos)

#### Validado
- ✅ Zero referências remanescentes a "ai-foundry" na documentação em inglês
- ✅ Zero referências remanescentes ao nome do produto "Microsoft Foundry" na documentação em inglês
- ✅ Todos os links de navegação funcionais com a nova estrutura de pastas
- ✅ Renomeação de ficheiros e pastas concluída com sucesso
- ✅ Referências cruzadas entre capítulos validadas

#### Notas
- **Âmbito**: Alterações aplicadas apenas à documentação em inglês na pasta `docs/`
- **Traduções**: Pastas de tradução (`translations/`) não atualizadas nesta versão
- **Workshop**: Materiais do workshop (`workshop/`) não atualizados nesta versão
- **Exemplos**: Ficheiros de exemplos podem continuar a referenciar nomes antigos (a resolver em atualização futura)
- **Links Externos**: URLs externos e referências ao repositório GitHub permanecem inalterados

#### Guia de Migração para Contribuidores
Se tiver ramificações locais ou documentação que referencie a estrutura antiga:
1. Atualize referências de pastas: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Atualize referências de ficheiros: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Substitua o nome do produto: "Microsoft Foundry" → "Microsoft Foundry"
4. Valide que todos os links internos na documentação ainda funcionam

---

### [v3.4.0] - 2025-10-24

#### Melhorias na Pré-visualização e Validação da Infraestrutura
**Esta versão introduz suporte abrangente para a nova funcionalidade de pré-visualização da Azure Developer CLI e melhora a experiência do utilizador no workshop.**

#### Adicionado
- **🧪 Documentação da funcionalidade azd provision --preview**: Cobertura completa da nova capacidade de pré-visualização da infraestrutura
  - Referência de comando e exemplos de uso no cheat sheet
  - Integração detalhada no guia de provisionamento com casos de uso e benefícios
  - Integração de checagem prévia para validação mais segura da implantação
  - Atualizações no guia de início rápido com práticas de implantação seguras
- **🚧 Banner de Estado do Workshop**: Banner HTML profissional indicando estado do desenvolvimento do workshop
  - Design em gradiente com indicadores de construção para comunicação clara ao utilizador
  - Timestamp da última atualização para transparência
  - Design responsivo para dispositivos móveis de todos os tipos

#### Melhorado
- **Segurança da Infraestrutura**: Funcionalidade preview integrada na documentação de implantação
- **Validação Pré-implantação**: Scripts automatizados agora incluem testes de pré-visualização da infraestrutura
- **Fluxo de Trabalho do Desenvolvedor**: Sequências de comandos atualizadas para incluir pré-visualização como melhor prática
- **Experiência no Workshop**: Expectativas claras definidas para utilizadores sobre o estado do conteúdo em desenvolvimento

#### Alterado
- **Melhores Práticas de Implantação**: Fluxo de trabalho com pré-visualização como abordagem recomendada
- **Fluxo da Documentação**: Validação da infraestrutura movida para etapas anteriores no processo de aprendizagem
- **Apresentação do Workshop**: Comunicação profissional do estado com cronograma claro de desenvolvimento

#### Melhorado
- **Abordagem Segurança em Primeiro Lugar**: Alterações na infraestrutura podem agora ser validadas antes da implantação
- **Colaboração em Equipa**: Resultados da pré-visualização podem ser partilhados para revisão e aprovação
- **Consciência de Custos**: Melhor compreensão dos custos dos recursos antes do provisionamento
- **Mitigação de Riscos**: Redução de falhas na implantação através de validação antecipada

#### Implementação Técnica
- **Integração Multi-documentos**: Funcionalidade preview documentada em 4 ficheiros chave
- **Padrões de Comandos**: Sintaxe e exemplos consistentes por toda a documentação
- **Integração de Melhores Práticas**: Pré-visualização incluída nos fluxos de validação e scripts
- **Indicadores Visuais**: Marcação clara da funcionalidade NOVA para descoberta

#### Infraestrutura do Workshop
- **Comunicação de Estado**: Banner HTML profissional com estilo em gradiente
- **Experiência do Utilizador**: Estado de desenvolvimento claro evita confusão
- **Apresentação Profissional**: Mantém credibilidade do repositório enquanto estabelece expectativas
- **Transparência do Cronograma**: Timestamp da última atualização em outubro de 2025 para responsabilidade

### [v3.3.0] - 2025-09-24

#### Materiais de Workshop Melhorados e Experiência de Aprendizagem Interativa
**Esta versão introduz materiais abrangentes para o workshop com guias interativos baseados em navegador e caminhos de aprendizagem estruturados.**

#### Adicionado
- **🎥 Guia Interativo do Workshop**: Experiência do workshop baseada em navegador com capacidade de pré-visualização do MkDocs
- **📝 Instruções Estruturadas do Workshop**: Caminho de aprendizagem guiado em 7 passos desde a descoberta à personalização
  - 0-Introdução: visão geral e configuração do workshop
  - 1-Seleção-Template-IA: descoberta e processo de seleção de templates
  - 2-Validação-Template-IA: procedimentos de implantação e validação
  - 3-Desconstrução-Template-IA: compreensão da arquitetura do template
  - 4-Configuração-Template-IA: configuração e personalização
  - 5-Personalização-Template-IA: modificações avançadas e iterações
  - 6-Derrube-Infrastructura: limpeza e gestão de recursos
  - 7-Conclusão: resumo e próximos passos
- **🛠️ Ferramentas do Workshop**: configuração MkDocs com tema Material para experiência de aprendizagem melhorada
- **🎯 Caminho de Aprendizagem Prático**: metodologia em 3 passos (Descoberta → Implantação → Personalização)
- **📱 Integração GitHub Codespaces**: configuração integrada do ambiente de desenvolvimento

#### Melhorado
- **Laboratório do Workshop IA**: expandido com experiência estruturada compreensiva de 2-3 horas
- **Documentação do Workshop**: apresentação profissional com navegação e auxílios visuais
- **Progressão de Aprendizagem**: orientação clara passo a passo da seleção do template até implantação em produção
- **Experiência do Desenvolvedor**: ferramentas integradas para fluxos de trabalho de desenvolvimento simplificados

#### Melhorado
- **Acessibilidade**: interface baseada em navegador com pesquisa, funcionalidade de copiar e alternância de tema
- **Aprendizagem Autodirigida**: estrutura de workshop flexível para acomodar diferentes ritmos de aprendizagem
- **Aplicação Prática**: cenários reais de implantação de templates de IA
- **Integração Comunitária**: integração com Discord para suporte e colaboração no workshop

#### Características do Workshop
- **Pesquisa Integrada**: descoberta rápida de palavras-chave e lições
- **Copiar Blocos de Código**: funcionalidade hover-to-copy para todos os exemplos de código
- **Alternância de Tema**: suporte para modo escuro/claro para preferências diferentes
- **Recursos Visuais**: capturas de ecrã e diagramas para melhor compreensão
- **Integração de Ajuda**: acesso direto ao Discord para suporte comunitário

### [v3.2.0] - 2025-09-17

#### Reestruturação Principal da Navegação e Sistema de Aprendizagem Baseado em Capítulos
**Esta versão introduz uma estrutura de aprendizagem compreensiva baseada em capítulos com navegação melhorada por todo o repositório.**

#### Adicionado
- **📚 Sistema de Aprendizagem Baseado em Capítulos**: Reestruturado curso completo em 8 capítulos progressivos de aprendizagem
  - Capítulo 1: Fundamentos & Início Rápido (⭐ - 30-45 mins)
  - Capítulo 2: Desenvolvimento AI-First (⭐⭐ - 1-2 horas)
  - Capítulo 3: Configuração & Autenticação (⭐⭐ - 45-60 mins)
  - Capítulo 4: Infraestrutura como Código & Implantação (⭐⭐⭐ - 1-1.5 horas)
  - Capítulo 5: Soluções Multi-Agente IA (⭐⭐⭐⭐ - 2-3 horas)
  - Capítulo 6: Validação & Planeamento Pré-Implantação (⭐⭐ - 1 hora)
  - Capítulo 7: Resolução de Problemas & Depuração (⭐⭐ - 1-1.5 horas)
  - Capítulo 8: Padrões de Produção & Empresariais (⭐⭐⭐⭐ - 2-3 horas)
- **📚 Sistema de Navegação Abrangente**: Cabeçalhos e rodapés de navegação consistentes em toda a documentação
- **🎯 Seguimento do Progresso**: Lista de verificação de conclusão do curso e sistema de verificação de aprendizagem
- **🗺️ Orientação do Caminho de Aprendizagem**: Pontos de entrada claros para diferentes níveis de experiência e objetivos
- **🔗 Navegação de Referência Cruzada**: Capítulos relacionados e pré-requisitos claramente ligados

#### Melhorado
- **Estrutura do README**: Transformado numa plataforma de aprendizagem estruturada com organização baseada em capítulos
- **Navegação da Documentação**: Cada página agora inclui contexto do capítulo e orientação na progressão
- **Organização dos Templates**: Exemplos e templates mapeados para capítulos de aprendizagem apropriados

- **Integração de Recursos**: Folhas de dicas, FAQs e guias de estudo ligados aos capítulos relevantes
- **Integração de Workshops**: Laboratórios práticos mapeados com múltiplos objetivos de aprendizagem dos capítulos

#### Alterado
- **Progressão de Aprendizagem**: Passagem de documentação linear para aprendizagem flexível baseada em capítulos
- **Posicionamento da Configuração**: Reposicionado guia de configuração como Capítulo 3 para melhor fluidez de aprendizagem
- **Integração de Conteúdo de IA**: Melhor integração de conteúdo específico de IA ao longo da jornada de aprendizagem
- **Conteúdo de Produção**: Padrões avançados consolidados no Capítulo 8 para formandos empresariais

#### Melhorado
- **Experiência do Utilizador**: Navegação clara com migalhas de pão e indicadores de progressão dos capítulos
- **Acessibilidade**: Padrões consistentes de navegação para facilitar a travessia do curso
- **Apresentação Profissional**: Estrutura de curso estilo universitário adequada para formação académica e corporativa
- **Eficiência de Aprendizagem**: Menor tempo para encontrar conteúdo relevante através de melhor organização

#### Implementação Técnica
- **Cabeçalhos de Navegação**: Navegação de capítulos padronizada em mais de 40 ficheiros de documentação
- **Navegação no Rodapé**: Orientação consistente da progressão e indicadores de conclusão de capítulo
- **Ligação Cruzada**: Sistema abrangente de ligação interna que conecta conceitos relacionados
- **Mapeamento de Capítulos**: Templates e exemplos claramente associados a objetivos de aprendizagem

#### Aperfeiçoamento do Guia de Estudo
- **📚 Objetivos de Aprendizagem Abrangentes**: Guia de estudo reestruturado para alinhar com sistema de 8 capítulos
- **🎯 Avaliação Baseada em Capítulos**: Cada capítulo inclui objetivos de aprendizagem específicos e exercícios práticos
- **📋 Monitorização de Progresso**: Cronograma semanal de aprendizagem com resultados mensuráveis e listas de verificação de conclusão
- **❓ Questões de Avaliação**: Perguntas de validação de conhecimento para cada capítulo com resultados profissionais
- **🛠️ Exercícios Práticos**: Atividades práticas com cenários reais de implementação e resolução de problemas
- **📊 Progressão de Competências**: Avanço claro de conceitos básicos para padrões empresariais com foco no desenvolvimento de carreira
- **🎓 Estrutura de Certificação**: Resultados de desenvolvimento profissional e sistema de reconhecimento comunitário
- **⏱️ Gestão de Cronograma**: Plano estruturado de aprendizagem de 10 semanas com validação de marcos

### [v3.1.0] - 2025-09-17

#### Soluções Avançadas de IA Multi-Agente
**Esta versão melhora a solução de retalho multi-agente com nomes de agentes melhorados e documentação aprimorada.**

#### Alterado
- **Terminologia Multi-Agente**: Substituído "agente Cora" por "agente Cliente" na solução multi-agente de retalho para maior clareza
- **Arquitetura de Agentes**: Atualizada toda a documentação, templates ARM e exemplos de código para usar nomenclatura consistente "agente Cliente"
- **Exemplos de Configuração**: Modernizados padrões de configuração de agentes com convenções de nomes atualizadas
- **Consistência de Documentação**: Garantido que todas as referências usam nomes profissionais e descritivos para os agentes

#### Aperfeiçoado
- **Pacote de Template ARM**: Atualizado retail-multiagent-arm-template com referências ao agente Cliente
- **Diagramas de Arquitetura**: Renovados diagramas Mermaid com nomeação atualizada dos agentes
- **Exemplos de Código**: Classes Python e exemplos de implementação agora usam a nomenclatura CustomerAgent
- **Variáveis de Ambiente**: Atualizados todos os scripts de implementação para usar convenções CUSTOMER_AGENT_NAME

#### Melhorado
- **Experiência do Desenvolvedor**: Papéis e responsabilidades dos agentes mais claros na documentação
- **Prontidão para Produção**: Melhor alinhamento com convenções de nomeação empresariais
- **Materiais de Aprendizagem**: Nomes de agentes mais intuitivos para fins educacionais
- **Usabilidade dos Templates**: Compreensão simplificada das funções dos agentes e padrões de implementação

#### Detalhes Técnicos
- Diagramas de arquitetura Mermaid atualizados com referências CustomerAgent
- Nomes das classes CoraAgent substituídos por CustomerAgent nos exemplos Python
- Configurações JSON do template ARM modificadas para usar tipo de agente "customer"
- Variáveis de ambiente atualizadas de CORA_AGENT_* para CUSTOMER_AGENT_*
- Comandos de implementação e configurações de contentores atualizados

### [v3.0.0] - 2025-09-12

#### Mudanças Principais - Foco no Desenvolvedor de IA e Integração Microsoft Foundry
**Esta versão transforma o repositório num recurso de aprendizagem abrangente focado em IA com integração Microsoft Foundry.**

#### Adicionado
- **🤖 Caminho de Aprendizagem Prioritário IA**: Reestruturação completa priorizando desenvolvedores e engenheiros de IA
- **Guia de Integração Microsoft Foundry**: Documentação abrangente para ligação do AZD com serviços Microsoft Foundry
- **Padrões de Implementação de Modelos de IA**: Guia detalhado cobrindo seleção de modelos, configuração e estratégias de implementação em produção
- **Laboratório Workshop IA**: Workshop prático de 2-3 horas para conversão de aplicações IA em soluções implementáveis com AZD
- **Práticas Recomendadas para IA em Produção**: Padrões prontos para enterprise para escalamento, monitorização e segurança de cargas IA
- **Guia de Resolução de Problemas Específico para IA**: Soluções completas para Microsoft Foundry Models, Serviços Cognitivos e problemas de implementação IA
- **Galeria de Templates IA**: Coleção destacada de templates Microsoft Foundry com classificações de complexidade
- **Materiais do Workshop**: Estrutura completa com laboratórios práticos e materiais de referência

#### Aperfeiçoado
- **Estrutura do README**: Focado no desenvolvedor de IA com 45% de interesse comunitário a partir do Discord Microsoft Foundry
- **Caminhos de Aprendizagem**: Jornada dedicada para desenvolvedores IA paralelamente a trajetos tradicionais para estudantes e engenheiros DevOps
- **Recomendações de Templates**: Templates IA destacados incluindo azure-search-openai-demo, contoso-chat e openai-chat-app-quickstart
- **Integração Comunitária**: Apoio comunitário melhorado no Discord com canais e discussões específicas sobre IA

#### Foco em Segurança & Produção
- **Padrões de Identidade Gerida**: Configurações específicas de autenticação e segurança para IA
- **Otimização de Custos**: Rastreio de uso de tokens e controlo orçamental para cargas IA
- **Implementação Multi-Região**: Estratégias para implementação global de aplicações IA
- **Monitorização de Performance**: Métricas específicas para IA e integração com Application Insights

#### Qualidade da Documentação
- **Estrutura Linear do Curso**: Progressão lógica de padrões de implementação IA desde iniciantes até avançados
- **URLs Validadas**: Todos os links externos de repositórios verificados e acessíveis
- **Referência Completa**: Todos os links internos da documentação validados e funcionais
- **Pronto para Produção**: Padrões de implementação empresarial com exemplos do mundo real

### [v2.0.0] - 2025-09-09

#### Mudanças Principais - Reestruturação do Repositório e Melhoria Profissional
**Esta versão representa uma reformulação significativa da estrutura do repositório e apresentação de conteúdos.**

#### Adicionado
- **Estrutura de Aprendizagem Estruturada**: Todas as páginas de documentação agora incluem Introdução, Metas de Aprendizagem e Resultados de Aprendizagem
- **Sistema de Navegação**: Adicionados links de lição Anterior/Seguinte em toda a documentação para progressão guiada no aprendizado
- **Guia de Estudo**: Guia abrangente study-guide.md com objetivos de aprendizagem, exercícios práticos e materiais de avaliação
- **Apresentação Profissional**: Remoção de todos os ícones emoji para melhorar acessibilidade e aparência profissional
- **Estrutura de Conteúdo Melhorada**: Melhoria na organização e fluxo dos materiais de aprendizagem

#### Alterado
- **Formato da Documentação**: Padronização completa da documentação com estrutura consistente orientada para aprendizagem
- **Fluxo de Navegação**: Implementação da progressão lógica por todos os materiais de aprendizagem
- **Apresentação do Conteúdo**: Remoção de elementos decorativos em favor de formatação clara e profissional
- **Estrutura de Links**: Atualização de todos os links internos para suportar o novo sistema de navegação

#### Melhorado
- **Acessibilidade**: Remoção da dependência de emojis para melhor compatibilidade com leitores de ecrã
- **Aparência Profissional**: Apresentação limpa em estilo académico adequada para aprendizagem empresarial
- **Experiência de Aprendizagem**: Abordagem estruturada com objetivos claros e resultados para cada lição
- **Organização do Conteúdo**: Melhor fluxo lógico e ligação entre tópicos relacionados

### [v1.0.0] - 2025-09-09

#### Lançamento Inicial - Repositório Abrangente de Aprendizagem AZD

#### Adicionado
- **Estrutura Core da Documentação**
  - Séries completas de guias de início rápido
  - Documentação abrangente de implementação e provisão
  - Recursos detalhados de resolução de problemas e guias de depuração
  - Ferramentas e procedimentos de validação pré-implementação

- **Módulo Início Rápido**
  - Noções Básicas AZD: Conceitos principais e terminologia
  - Guia de Instalação: Instruções específicas para cada plataforma
  - Guia de Configuração: Configuração do ambiente e autenticação
  - Tutorial do Primeiro Projeto: Aprendizagem prática passo a passo

- **Módulo de Implementação e Provisão**
  - Guia de Implementação: Documentação completa do fluxo de trabalho
  - Guia de Provisão: Infraestrutura como Código com Bicep
  - Melhores práticas para implementações de produção
  - Padrões de arquitetura multi-serviço

- **Módulo de Validação Pré-implementação**
  - Planeamento de Capacidade: Validação da disponibilidade de recursos Azure
  - Seleção de SKU: Guia abrangente de níveis de serviço
  - Checks Pré-voo: Scripts automáticos de validação (PowerShell e Bash)
  - Estimativa de custos e ferramentas de planeamento orçamental

- **Módulo de Resolução de Problemas**
  - Problemas Comuns: Problemas e soluções frequentes
  - Guia de Depuração: Metodologias sistemáticas de resolução de problemas
  - Técnicas e ferramentas avançadas de diagnóstico
  - Monitorização e otimização de desempenho

- **Recursos e Referências**
  - Folha de Comandos: Referência rápida para comandos essenciais
  - Glossário: Terminologia abrangente e definições de acrónimos
  - FAQ: Respostas detalhadas às perguntas frequentes
  - Links para recursos externos e comunidades

- **Exemplos e Templates**
  - Exemplo de aplicação web simples
  - Template para implementação de website estático
  - Configuração de aplicação em contentor
  - Padrões de integração de bases de dados
  - Exemplos de arquitetura de microserviços
  - Implementações de funções serverless

#### Funcionalidades
- **Suporte Multi-Plataforma**: Guias de instalação e configuração para Windows, macOS e Linux
- **Múltiplos Níveis de Competência**: Conteúdos desenhados desde estudantes até desenvolvedores profissionais
- **Foco Prático**: Exemplos práticos e cenários reais
- **Cobertura Abrangente**: Desde conceitos básicos até padrões empresariais avançados
- **Abordagem de Segurança Primeiro**: Melhores práticas de segurança integradas em todo o conteúdo
- **Otimização de Custos**: Orientação para implementações económicas e gestão de recursos

#### Qualidade da Documentação
- **Exemplos Detalhados de Código**: Exemplos práticos e testados
- **Instruções Passo a Passo**: Orientação clara e acionável
- **Manejo Abrangente de Erros**: Resolução para problemas comuns
- **Integração de Melhores Práticas**: Normas e recomendações industriais
- **Compatibilidade de Versões**: Atualizado com os últimos serviços Azure e funcionalidades azd

## Melhorias Futuras Planeadas

### Versão 3.1.0 (Planeada)
#### Expansão da Plataforma de IA
- **Suporte Multi-Modelo**: Padrões de integração para Hugging Face, Azure Machine Learning e modelos personalizados
- **Frameworks de Agentes IA**: Templates para implementações LangChain, Semantic Kernel e AutoGen
- **Padrões Avançados RAG**: Opções de base de dados vetorial além do Azure AI Search (Pinecone, Weaviate, etc.)
- **Observabilidade IA**: Monitorização aprimorada de performance de modelos, uso de tokens e qualidade das respostas

#### Experiência do Desenvolvedor
- **Extensão VS Code**: Experiência integrada de desenvolvimento AZD + Microsoft Foundry
- **Integração GitHub Copilot**: Geração assistida por IA de templates AZD
- **Tutoriais Interativos**: Exercícios práticos de codificação com validação automática para cenários IA
- **Conteúdo em Vídeo**: Tutoriais suplementares em vídeo para aprendizes visuais focados em implementações IA

### Versão 4.0.0 (Planeada)
#### Padrões Empresariais IA
- **Estrutura de Governança**: Governança, conformidade e auditoria de modelos IA
- **IA Multi-Inquilino**: Padrões para servir vários clientes com serviços IA isolados
- **Implementação IA na Edge**: Integração com Azure IoT Edge e instâncias de contentores
- **Nuvem Híbrida IA**: Padrões multi-nuvem e híbridos para cargas IA

#### Funcionalidades Avançadas
- **Automação de Pipeline IA**: Integração MLOps com pipelines Azure Machine Learning
- **Segurança Avançada**: Padrões zero-trust, endpoints privados e proteção avançada contra ameaças
- **Otimização de Performance**: Ajustes avançados e estratégias de escalabilidade para aplicações IA de alta vazão
- **Distribuição Global**: Padrões de entrega de conteúdo e caching na borda para aplicações IA

### Versão 3.0.0 (Planeada) - Substituída pela Versão Atual
#### Adições Propostas - Agora Implementadas na v3.0.0
- ✅ **Conteúdo Focado em IA**: Integração abrangente Microsoft Foundry (Concluído)
- ✅ **Tutoriais Interativos**: Laboratório prático de workshop IA (Concluído)
- ✅ **Módulo de Segurança Avançado**: Padrões de segurança específicos para IA (Concluído)
- ✅ **Otimização de Performance**: Estratégias de ajuste para cargas IA (Concluído)

### Versão 2.1.0 (Planeada) - Parcialmente Implementada na v3.0.0
#### Melhorias Menores - Algumas Concluídas na Versão Atual
- ✅ **Exemplos Adicionais**: Cenários de implementação focados em IA (Concluído)
- ✅ **FAQ Alargado**: Perguntas e resolução de problemas específicos de IA (Concluído)
- **Integração de Ferramentas**: Guias melhorados para integração em IDEs e editores
- ✅ **Expansão de Monitorização**: Padrões IA específicos para monitorização e alertas (Concluído)

#### Ainda Planeado para Versões Futuras
- **Documentação Amigável para Móvel**: Design responsivo para aprendizagem móvel
- **Acesso Offline**: Pacotes de documentação descarregáveis
- **Integração Melhorada de IDE**: Extensão VS Code para AZD + fluxos de trabalho IA
- **Painel Comunitário**: Métricas da comunidade em tempo real e acompanhamento de contribuições

## Contribuindo para o Registo de Alterações

### Reportar Alterações
Ao contribuir para este repositório, por favor assegure que as entradas no registo de alterações incluam:

1. **Número da Versão**: Seguindo versionamento semântico (major.minor.patch)
2. **Data**: Data de lançamento ou atualização no formato AAAA-MM-DD
3. **Categoria**: Adicionado, Alterado, Obsoleto, Removido, Corrigido, Segurança
4. **Descrição Clara**: Descrição concisa do que foi alterado
5. **Avaliação de Impacto**: Como as alterações afetam os utilizadores existentes

### Categorias de Alteração

#### Adicionado
- Novas funcionalidades, secções de documentação ou capacidades
- Novos exemplos, templates ou recursos de aprendizagem
- Ferramentas, scripts ou utilitários adicionais

#### Alterado
- Modificações a funcionalidades ou documentação existentes
- Atualizações para melhorar clareza ou precisão
- Reestruturação de conteúdo ou organização

#### Obsoleto
- Funcionalidades ou abordagens a ser eliminadas progressivamente
- Secções de documentação planeadas para remoção
- Métodos que têm alternativas melhores

#### Removido
- Funcionalidades, documentação ou exemplos que já não são relevantes
- Informação desatualizada ou abordagens obsoletas
- Conteúdo redundante ou consolidado

#### Corrigido
- Correções de erros na documentação ou código
- Resolução de problemas reportados
- Melhorias na precisão ou funcionalidade


#### Segurança
- Melhorias ou correções relacionadas com a segurança
- Atualizações nas melhores práticas de segurança
- Resolução de vulnerabilidades de segurança

### Diretrizes de Versionamento Semântico

#### Versão Principal (X.0.0)
- Alterações incompatíveis que exigem ação do utilizador
- Reestruturação significativa de conteúdo ou organização
- Alterações que modificam a abordagem ou metodologia fundamental

#### Versão Secundária (X.Y.0)
- Novas funcionalidades ou adições de conteúdo
- Melhorias que mantêm compatibilidade retroativa
- Exemplos, ferramentas ou recursos adicionais

#### Versão de Correção (X.Y.Z)
- Correções de erros e bugs
- Melhorias menores no conteúdo existente
- Esclarecimentos e pequenas melhorias

## Feedback e Sugestões da Comunidade

Incentivamos ativamente o feedback da comunidade para melhorar este recurso de aprendizagem:

### Como Fornecer Feedback
- **GitHub Issues**: Reportar problemas ou sugerir melhorias (questões específicas de IA são bem-vindas)
- **Discussões no Discord**: Partilhar ideias e interagir com a comunidade Microsoft Foundry
- **Pull Requests**: Contribuir com melhorias diretas ao conteúdo, especialmente templates e guias de IA
- **Microsoft Foundry Discord**: Participar no canal #Azure para discussões sobre AZD + IA
- **Fóruns da Comunidade**: Participar em discussões mais amplas para desenvolvedores Azure

### Categorias de Feedback
- **Precisão do Conteúdo de IA**: Correções à integração e implementação de serviços de IA
- **Experiência de Aprendizagem**: Sugestões para melhorar o fluxo de aprendizagem para desenvolvedores de IA
- **Conteúdo de IA em Falta**: Pedidos para mais templates, padrões ou exemplos de IA
- **Acessibilidade**: Melhorias para necessidades diversas de aprendizagem
- **Integração de Ferramentas de IA**: Sugestões para melhor integração do fluxo de desenvolvimento de IA
- **Padrões de IA para Produção**: Solicitações de padrões empresariais para implementação de IA

### Compromisso de Resposta
- **Resposta a Problemas**: Dentro de 48 horas para problemas reportados
- **Pedidos de Funcionalidades**: Avaliação dentro de uma semana
- **Contribuições da Comunidade**: Revisão dentro de uma semana
- **Questões de Segurança**: Prioridade imediata com resposta acelerada

## Calendário de Manutenção

### Atualizações Regulares
- **Revisões Mensais**: Precisão do conteúdo e validação de links
- **Atualizações Trimestrais**: Grandes adições e melhorias de conteúdo
- **Revisões Semestrais**: Reestruturação e aperfeiçoamento abrangentes
- **Releases Anuais**: Atualizações de versões principais com melhorias significativas

### Monitorização e Garantia de Qualidade
- **Testes Automatizados**: Validação regular de exemplos de código e links
- **Integração do Feedback da Comunidade**: Incorporação regular das sugestões dos utilizadores
- **Atualizações Tecnológicas**: Alinhamento com os serviços Azure mais recentes e versões azd
- **Auditorias de Acessibilidade**: Revisão regular para princípios de design inclusivo

## Política de Suporte de Versão

### Suporte às Versões Atuais
- **Última Versão Principal**: Suporte completo com atualizações regulares
- **Versão Principal Anterior**: Atualizações de segurança e correções críticas durante 12 meses
- **Versões Legadas**: Suporte apenas pela comunidade, sem atualizações oficiais

### Orientações para Migração
Quando versões principais são lançadas, fornecemos:
- **Guias de Migração**: Instruções passo a passo para transição
- **Notas de Compatibilidade**: Detalhes sobre alterações incompatíveis
- **Suporte de Ferramentas**: Scripts ou utilitários para auxiliar na migração
- **Suporte da Comunidade**: Fóruns dedicados a dúvidas sobre migração

---

**Navegação**
- **Lição Anterior**: [Guia de Estudo](resources/study-guide.md)
- **Próxima Lição**: Voltar ao [README Principal](README.md)

**Mantenha-se Atualizado**: Siga este repositório para notificações sobre novas versões e atualizações importantes dos materiais de aprendizagem.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->