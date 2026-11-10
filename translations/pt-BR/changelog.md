# Changelog - AZD Para Iniciantes

## Introdução

Este changelog documenta todas as mudanças notáveis, atualizações e melhorias no repositório AZD Para Iniciantes. Seguimos os princípios de versionamento semântico e mantemos este registro para ajudar os usuários a entender o que mudou entre as versões.

## Objetivos de Aprendizagem

Ao revisar este changelog, você irá:
- Manter-se informado sobre novos recursos e adições de conteúdo
- Entender as melhorias feitas na documentação existente
- Acompanhar correções de bugs e ajustes para garantir precisão
- Seguir a evolução dos materiais de aprendizado ao longo do tempo

## Resultados de Aprendizagem

Após revisar as entradas do changelog, você será capaz de:
- Identificar novos conteúdos e recursos disponíveis para aprendizado
- Entender quais seções foram atualizadas ou melhoradas
- Planejar seu caminho de aprendizagem com base nos materiais mais atuais
- Contribuir com feedbacks e sugestões para futuras melhorias

## Histórico de Versões

### [v3.24.0]- 2026-11-04

#### Corrigido
- Corrigida navegação do curso em inglês, caminhos de páginas movidas, âncoras ausentes e referências externas obsoletas, incluindo o link do Capítulo 2 para o guia de IA em produção.
- Revisado o guia atual contra AZD 1.37.2 publicado, agentes 1.0.0-beta.23 e avaliações 1.0.0-beta.2. Documentado o workflow separado `azd ai eval` e migração de configuração de otimização.
- Corrigidos flags não suportados na CLI, limites de autenticação, orientações sobre ambientes/segredos em texto simples, atualizações de infraestrutura, configuração de modelo e exemplos destrutivos de recuperação.
- Atualizado o workshop com o exemplo atual de Agentes de IA, incluindo hooks reais, entradas de configuração, testes de avaliação, pontos de entrada para red-teaming e observabilidade.
- Corrigidas alegações de implementação do exemplo e reparados problemas associados de aplicação/infraestrutura/configuração. Material de arquitetura de varejo é explicitamente distinguido de uma aplicação completa funcional.
- Restaurada a matriz de linguagens do CodeQL, selecionado Node.js 24 suportado para o container de desenvolvimento e feito com que validadores de setup reportem comandos de versão falhados.

#### Adicionado
- Verificador offline de links/âncoras somente em inglês, testes de regressão e um workflow de documentação que também constrói o workshop em modo estrito. Traduções geradas e imagens traduzidas estão excluídas.

#### Escopo de validação
- Verificações de origem, sintaxe, configuração, comportamento local e links de rede não estabelecem viabilidade de implantação ao vivo no Azure, cota, RBAC, disponibilidade regional do modelo, faturamento, conformidade de segurança ou prontidão para produção.
- Entradas mais antigas abaixo são registros históricos, não instruções atuais de comandos ou lançamentos.

### [v3.23.0] - 2026-07-13

#### Atualização de Atualidade da Versão: Atualização AZD 1.27.1
**Esta versão revalida o curso contra `azd` `1.27.1` (julho de 2026, última versão estável) e a extensão atual de agente de IA em preview `azure.ai.agents` `1.0.0-beta.5`, atualizando todas as faixas "validado contra" após os lançamentos 1.26.0, 1.27.0 e 1.27.1.**

#### Alterado
- **✅ Linha de base de validação atualizada** de `azd 1.25.6` (junho de 2026) para `azd 1.27.1` (julho de 2026) em README raiz, todos os READMEs dos capítulos, lição do container de desenvolvimento Capítulo 1 (incluindo exemplos de versões fixas), lição de templates personalizados Capítulo 4, lição multiagentes Capítulo 5 e docs do workshop
- **🤖 Linha de base do Capítulo 2 atualizada** de `azd 1.23.12` (março de 2026) para `azd 1.27.1` em `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` e `microsoft-foundry-integration.md`; datas de nota de validação atualizadas para 2026-07-13
- **🧩 Extensão do agente de IA atualizada** de `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` para o lançamento atual `1.0.0-beta.5` no README do Capítulo 2 e `agents.md`
- **🧪 Exemplo de validação do workshop** (saída `azd version`) atualizada para `1.27.1`

#### Notas sobre lançamentos azd relevantes (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Suporte Go para Azure Functions no Flex Consumption, filtros de assinatura por locatário `azd config sub-filter`, bundles de extensão autocontidos (`azd x pack --bundle`) e `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Projete projetos/agentes Azure AI Foundry diretamente em `azure.yaml` (inicialização sem Bicep/Terraform), suporte a implantação em container para App Service (`host: appservice` + `language: docker`), `-s/--source` direto para comandos `azd extension` e `azd tool uninstall`
- **1.27.1 (2026-07-09):** flag `--no-dependencies` para `azd extension install`, modelos depreciados excluídos por padrão de prompts de catálogo/cota e várias correções de bugs

#### Arquivos atualizados
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

#### Preenchimento de Lacunas Para Iniciantes #2: Criação de Templates, Containers de Desenvolvimento, Pulumi, Azure DevOps, Service Principals e Mais
**Esta versão fecha as lacunas intermediárias restantes identificadas pela análise azd-coverage: como criar e publicar seu próprio template, ambientes reproduzíveis de container de desenvolvimento/Codespaces, o provedor de infraestrutura Pulumi, um walkthrough de CI/CD Azure DevOps, autenticação via service-principal, orientações de seleção de host (AKS/Spring Apps), explicações de `azd restore`/`azd package`, tratamento de erros em hooks e práticas de equipe/ambiente compartilhado.**

#### Adicionado
- **🧱 Nova lição do Capítulo 4** `docs/chapter-04-infrastructure/custom-templates.md` — criação do seu próprio template azd: estrutura necessária (`azure.yaml`, `infra/`, `src/`), o campo `metadata.template`, parametrização da infraestrutura com o token de recurso `uniqueString()` e etiqueta `azd-env-name`, testes locais com `azd init --template <local-path>`, publicação no GitHub e submissão para a galeria Awesome AZD
- **📦 Nova lição do Capítulo 1** `docs/chapter-01-foundation/dev-containers.md` — ambientes azd reproduzíveis com Dev Containers e GitHub Codespaces: um `.devcontainer/devcontainer.json` mínimo usando o recurso oficial `ghcr.io/azure/azure-dev/azd`, recursos específicos da linguagem, `docker-in-docker` para hosts de container e `azd auth login --use-device-code` para login remoto
- **🧩 Seção Pulumi com azd** em `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, layout da pasta Pulumi, stacks mapeadas para ambientes azd, outputs e tags obrigatórias e o fluxo de trabalho idêntico `azd up` / `azd down`
- **🎯 Orientação para seleção de host** em `docs/chapter-04-infrastructure/provisioning.md` — comparação amigável para iniciantes de `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` e `springapp`, com orientações sobre quando escolher AKS ou Azure Spring Apps
- **🛠️ Walkthrough CI/CD Azure DevOps** em `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, conexão de serviço com federação de identidade de workload (OIDC), `azure-dev.yml` gerado e configuração de grupos de variáveis
- **🔑 Service Principals (Padrão 4)** adicionado em `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, `azd auth login` não interativo com segredo do cliente vs. credenciais federadas/OIDC, quando usar e armazenamento seguro de credenciais
- **🪝 Subseção de tratamento de erros em hooks** em `docs/chapter-04-infrastructure/deployment-guide.md` — códigos de saída e `set -e`, `continueOnError`, testes isolados de hooks com `azd hooks run`, shells específicos de OS e `--debug`
- **👥 Seção de ambientes de equipe/compartilhados** em `docs/chapter-03-configuration/configuration.md` — o que fica em `.azure/`, o que ignorar no git, ambientes por desenvolvedor, `azd env list`/`select` e fornecimento de valores de ambiente em CI/CD
- **🧰 Explicações ampliadas sobre `azd restore` e `azd package`** em `resources/cheat-sheet.md` — restauração de dependências e construção de artefato implantável sem deploy

#### Alterado
- **🧭 Tabela de lições do Capítulo 4** atualizada para incluir a nova lição "Criando Seu Próprio Template" (Lição 3)
- **🧭 Tabela de lições do Capítulo 1** atualizada para incluir a nova lição "Dev Containers & Codespaces" (Lição 5); rodapés de navegação conectados entre `bring-your-own-app.md` e `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Preenchimento de Lacunas Para Iniciantes: Lição Prática Multiagente, "Traga Seu Próprio App", Terraform e Walkthrough CI/CD
**Esta versão fecha as maiores lacunas para um guia completo para iniciantes adicionando duas novas lições práticas (um walkthrough multiagente implantável e a adição do azd a um app existente), uma introdução amigável a hooks, uma seção Terraform com azd, um walkthrough passo a passo do pipeline GitHub Actions, um explicador para as novas extensões em preview e uma checklist explícita de verificação de implantação.**

#### Adicionado
- **🤝 Nova lição do Capítulo 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — um walkthrough prático totalmente implantável com dois agentes (orquestrador + especialistas) usando um template real (`contoso-creative-writer`), cobrindo quando usar multiagente, o workflow `azd up`, entendimento dos recursos implantados, rastreamento entre agentes, personalização e limpeza
- **📦 Nova lição do Capítulo 1** `docs/chapter-01-foundation/bring-your-own-app.md` — como adicionar azd a um projeto existente com `azd init` ("usar código no diretório atual"), entendendo `azure.yaml` e `infra/`, `azd infra generate`, detecção de host e implantação com `azd up`
- **🌐 Seção Terraform com azd** adicionada a `docs/chapter-04-infrastructure/provisioning.md` — configuração `infra.provider: terraform`, layout da pasta `.tf`, outputs obrigatórios `AZURE_*` e etiquetagem `azd-env-name`, fluência idêntica do workflow `azd up` / `azd down` (fecha a lacuna onde o suporte Terraform era alegado mas só Bicep era mostrado)
- **⚙️ Walkthrough passo a passo do GitHub Actions** em `docs/chapter-08-production/production-ai-practices.md` — do repositório GitHub a deploys automatizados: `azd pipeline config`, credenciais federadas OIDC (sem segredos armazenados), `azure-dev.yml` gerado e orientações sobre segredos vs. variáveis
- **🪝 Introdução para iniciantes "Novo em hooks?"** em `docs/chapter-04-infrastructure/deployment-guide.md` — o que é um hook, tabela de estágios de hook, primeiro hook mínimo e execução manual de hooks com `azd hooks run`
- **✅ Checklist "Verifique Sua Implantação"** adicionada ao passo 5 do `docs/chapter-01-foundation/first-project.md` — teste básico, verificação do endpoint de saúde e critérios explícitos de sucesso
- **🧩 Explicador para novas extensões preview** `azure.ai.skills` e `azure.ai.connections` (o que são e quando usá-las) em `docs/chapter-08-production/production-ai-practices.md`

#### Alterado
- **🧭 Tabela de lições do Capítulo 5** corrigida: `multi-agent-basics.md` é agora a Lição 1 (a única lição totalmente prática), rotulagem honesta que a Lição 2 está no Capítulo 6 e o cenário de varejo é um blueprint de arquitetura, não um template de um comando
- **🧭 Tabela de lições do Capítulo 1** agora inclui a nova lição "Traga Seu Próprio App" (Lição 4)
- **🔗 Rodapés de navegação** atualizados: `first-project.md` agora liga para frente para `bring-your-own-app.md`

#### Corrigido
- **🧱 Fechada a lacuna "alegada mas ausente" do Terraform** — o curso antes fazia referência a suporte Terraform sem demonstrá-lo
- **🔀 Corrigidos links cruzados enganosos no Capítulo 5** que davam a entender que uma implementação completa multiagente existia quando só havia um blueprint de arquitetura

#### Arquivos atualizados
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
**Esta versão revalida o curso contra `azd` `1.25.6` (junho de 2026) e a extensão `azure.ai.agents` `0.1.40-preview`, expande a orientação de IA de "estruturar um agente" para o ciclo completo do agente (testar → avaliar → otimizar → inspecionar → deletar), apresenta as novas extensões de pré-visualização `azure.ai.skills` e `azure.ai.connections`, e destaca o rebranding do produto ".NET Aspire" para "Aspire".**

#### Adicionado
- **🔁 Cobertura completa do ciclo de vida do agente** para iniciantes e engenheiros de IA em toda a documentação:
  - `docs/chapter-01-foundation/azd-basics.md` — Tabela do ciclo de vida (estruturar → testar → medir → melhorar → inspecionar → limpar) adicionada à seção de Extensões e Comandos de IA
  - `docs/chapter-08-production/production-ai-practices.md` — Nova seção "Gerenciamento do Ciclo de Vida do Agente" cobrindo `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, e `delete --force`
  - `resources/cheat-sheet.md` — Comandos Expandidos para Agentes de IA com `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, e `delete --force`
- **🧩 Novas extensões de pré-visualização** documentadas: `azure.ai.skills` (habilidades reutilizáveis de agente) e `azure.ai.connections` (conexões Foundry) adicionadas à tabela de extensões e ao resumo rápido
- **⏱️ Orientação sobre tempo de resposta** — exemplos de `azd ai agent invoke` agora indicam que imprime a latência total e o tempo até o primeiro byte
- **📌 Banner de versão** no README raiz apontando os aprendizes para `azd version` e `azd upgrade`

#### Alterado
- **✅ Linha de base de validação atualizada** de `azd 1.23.12` (março de 2026) para `azd 1.25.6` (junho de 2026) em todos os READMEs dos capítulos e na documentação do workshop
- **🤖 Nota de extensão do Capítulo 2** atualizada de `azure.ai.agents` `0.1.18-preview` para `0.1.40-preview`
- **🧪 Exemplo de validação do workshop** (saída `azd version`) atualizado para `1.25.6`
- **🧭 README "Novidades no azd Hoje"** atualizado para destacar o ciclo de vida completo do agente, novas extensões de IA e correções recentes de usabilidade (`azd init` idempotência, `azd auth login` limpeza de token expirado, `azd tool` prompt da primeira execução)
- **📖 Agentes.md do Capítulo 2 (Opção 4)** agora direciona os aprendizes para os comandos do ciclo de vida pós-implantação em vez de parar em `azd up`

#### Corrigido
- **🏷️ Nome do produto** — adicionada nota sobre o rebranding Aspire (".NET Aspire" agora é simplesmente "Aspire"); o suporte da azd ao Aspire permanece inalterado
- **🔎 Validação de lançamento ao vivo** confirmada contra o feed de lançamentos do Azure Developer CLI: CLI estável `1.25.6` (2026-06-12) e `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Esclarecimento para Iniciantes, Validação da Configuração & Limpeza Final dos Comandos AZD
**Esta versão dá continuidade à varredura de validação AZD 1.23 com uma passagem focada na documentação para iniciantes: esclarece a orientação de autenticação priorizando AZD, adiciona scripts de validação de configuração local, verifica comandos chave contra o AZD CLI ao vivo e remove as últimas referências obsoletas de comandos de origem inglesa fora do changelog.**

#### Adicionado
- **🧪 Scripts de validação para iniciantes** com `validate-setup.ps1` e `validate-setup.sh` para que os aprendizes possam confirmar as ferramentas exigidas antes de iniciar o Capítulo 1
- **✅ Etapas antecipadas de validação da configuração** no README raiz e README do Capítulo 1 para que requisitos ausentes sejam detectados antes de `azd up`

#### Alterado
- **🔐 Orientação sobre autenticação para iniciantes** agora trata consistentemente `azd auth login` como o caminho principal para fluxos de trabalho AZD, destacando `az login` como opcional a menos que comandos do Azure CLI sejam usados diretamente
- **📚 Fluxo de onboarding do Capítulo 1** agora direciona os aprendizes para validar sua configuração local antes da instalação, autenticação e passos da primeira implantação
- **🛠️ Mensagens do validador** agora separam claramente requisitos bloqueadores de avisos opcionais do Azure CLI para o caminho AZD apenas para iniciantes
- **📖 Documentação de configuração, solução de problemas e exemplos** agora distingue entre autenticação AZD necessária e login opcional no Azure CLI quando ambos eram apresentados anteriormente sem contexto

#### Corrigido
- **📋 Referências restantes de comandos em fonte inglesa** atualizadas para os formulários atuais do AZD, incluindo `azd config show` no resumo rápido e `azd monitor --overview` onde a orientação da visão geral do Portal do Azure era pretendida
- **🧭 Afirmações para iniciantes no Capítulo 1** suavizadas para evitar prometer comportamento garantido de zero erro ou rollback em todos os templates e recursos Azure
- **🔎 Validação ao vivo do CLI** confirmou suporte atual para `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, e `azd down --force --purge`

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
**Esta versão executa uma varredura de validação da documentação contra `azd` `1.23.12`, atualiza exemplos desatualizados de comandos AZD, atualiza a orientação dos modelos de IA para padrões atuais e amplia as instruções do workshop além do GitHub Codespaces para também suportar dev containers e clones locais.**

#### Adicionado
- **✅ Notas de validação em capítulos principais e documentação do workshop** para tornar explícita a linha de base AZD testada para aprendizes utilizando builds CLI mais recentes ou antigas
- **⏱️ Orientação de tempo limite para implantação** de aplicativos de IA de longa duração usando `azd deploy --timeout 1800`
- **🔎 Passos de inspeção de extensões** com `azd extension show azure.ai.agents` na documentação do fluxo de trabalho de IA
- **🌐 Orientação ampliada para ambiente do workshop** cobrindo GitHub Codespaces, dev containers e clones locais com MkDocs

#### Alterado
- **📚 READMEs de introdução dos capítulos** agora consistentemente indicam validação contra `azd 1.23.12` em seções de fundamentos, configuração, infraestrutura, multi-agentes, pré-implantação, solução de problemas e produção
- **🛠️ Referências de comando AZD** atualizadas para formas atuais em toda documentação:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` ou `azd env get-value(s)` dependendo do contexto
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` onde visão geral do Application Insights é pretendida
- **🧪 Exemplos de provisionamento de pré-visualização** simplificados para uso suportado atual como `azd provision --preview` e `azd provision --preview -e production`
- **🧭 Fluxo do workshop** atualizado para que aprendizes possam completar os laboratórios em Codespaces, dev container, ou clone local, em vez de assumir execução apenas em Codespaces
- **🔐 Orientação de autenticação** agora prefere `azd auth login` para fluxos de trabalho AZD, com `az login` posicionado como opcional quando comandos Azure CLI são usados diretamente

#### Corrigido
- **🪟 Comandos de instalação para Windows** normalizados para a capitalização atual do pacote `winget` no guia de instalação
- **🐧 Orientação de instalação para Linux** corrigida para evitar instruções do gerenciador de pacotes específicas de distribuição não suportadas `azd` e, em vez disso, apontar para os ativos de lançamento onde apropriado
- **📦 Exemplos de modelos AI** atualizados de padrões antigos como `gpt-35-turbo` e `text-embedding-ada-002` para exemplos atuais como `gpt-4.1-mini`, `gpt-4.1`, e `text-embedding-3-large`
- **📋 Trechos de implantação e diagnóstico** corrigidos para usar comandos atuais de ambiente e status em logs, scripts e passos de solução de problemas
- **⚙️ Orientação para GitHub Actions** atualizada de `Azure/setup-azd@v1.0.0` para `Azure/setup-azd@v2`
- **🤖 Orientação de consentimento MCP/Copilot** atualizada de `azd mcp consent` para `azd copilot consent list`

#### Melhorado
- **🧠 Orientação do capítulo de IA** agora explica melhor comportamento sensível à pré-visualização de `azd ai`, login específico para tenant, uso atual de extensões e recomendações atualizadas para implantação de modelo
- **🧪 Instruções do workshop** agora usam exemplos de versões mais realistas e linguagem mais clara para configuração de ambiente em laboratórios práticos
- **📈 Documentação de produção e solução de problemas** agora está melhor alinhada com monitoramento atual, modelo fallback e exemplos de camada de custos

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

#### Comandos AZD AI CLI, Validação de Conteúdo & Expansão de Templates
**Esta versão adiciona cobertura de comandos `azd ai`, `azd extension`, e `azd mcp` em todos os capítulos relacionados à IA, corrige links quebrados e código obsoleto em agents.md, atualiza o resumo rápido e revisa a seção de Templates de Exemplo com descrições validadas e novos templates Azure AI AZD.**

#### Adicionado
- **🤖 Cobertura de comandos AZD AI CLI** em 7 arquivos (anteriormente somente no Capítulo 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nova seção "Extensões e Comandos de IA" introduzindo `azd extension`, `azd ai agent init`, e `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opção 4: `azd ai agent init` com tabela comparativa (template vs abordagem manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Subseções "Extensões AZD para Foundry" e "Implantação Primeiro Agente"
  - `docs/chapter-05-multi-agent/README.md` — Início Rápido agora mostra caminhos de implantação via template e via manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Seção de implantação agora inclui opção `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Subseção "Comandos de Extensão AZD AI para Diagnósticos"
  - `resources/cheat-sheet.md` — Nova seção "Comandos de IA & Extensões" com `azd extension`, `azd ai agent init`, `azd mcp`, e `azd infra generate`
- **📦 Novos templates de exemplo AZD AI** em `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — Chat .NET RAG com Blazor WebAssembly, Semantic Kernel, e suporte a chat por voz
  - **azure-search-openai-demo-java** — Chat Java RAG usando Langchain4J com opções de implantação ACA/AKS
  - **contoso-creative-writer** — App de escrita criativa multiagente usando Azure AI Agent Service, Bing Grounding e Prompty
  - **serverless-chat-langchainjs** — RAG serverless usando Azure Functions + LangChain.js + Cosmos DB com suporte de desenvolvimento local Ollama
  - **chat-with-your-data-solution-accelerator** — Acelerador empresarial RAG com portal administrativo, integração com Teams e opções PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — App de referência para orquestração MCP multiagente com servidores em .NET, Python, Java e TypeScript
  - **azd-ai-starter** — Template Bicep inicial minimalista para infraestrutura Azure AI
  - **🔗 Link incrível da Galeria AZD AI** — Referência para a [galeria incrível azure-ai](https://azure.github.io/awesome-azd/?tags=ai) (mais de 80 templates)

#### Corrigido
- **🔗 navegação agents.md**: Links Anterior/Próximo agora correspondem à ordem das lições do Capítulo 2 README (Integração Microsoft Foundry → Agents → Implantação do Modelo de IA)
- **🔗 links quebrados agents.md**: `production-ai-practices.md` corrigido para `../chapter-08-production/production-ai-practices.md` (3 ocorrências)
- **📦 código deprecated agents.md**: Substituído `opencensus` por `azure-monitor-opentelemetry` + SDK OpenTelemetry
- **🐛 API inválida agents.md**: Movido `max_tokens` de `create_agent()` para `create_run()` como `max_completion_tokens`
- **🔢 contagem de tokens agents.md**: Substituída estimativa aproximada `len//4` por `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Corrigidos serviços de "Cognitive Search + App Service" para "Azure AI Search + Azure Container Apps" (host padrão alterado em Out 2024)
- **contoso-chat**: Atualizada descrição para referenciar Azure AI Foundry + Prompty, alinhando ao título e stack tecnológico reais do repositório

#### Removido
- **ai-document-processing**: Removida referência a template não funcional (repositório não acessível publicamente como template AZD)

#### Melhorado
- **📝 exercícios agents.md**: Exercício 1 agora exibe saída esperada e passo `azd monitor`; Exercício 2 inclui código completo de registro `FunctionTool`; Exercício 3 substitui orientação vaga por comandos concretos `prepdocs.py`
- **📚 recursos agents.md**: Atualizados links de documentação para as docs atuais do Azure AI Agent Service e quickstart
- **📋 tabela Próximos Passos agents.md**: Adicionado link para AI Workshop Lab para cobertura completa do capítulo

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
**Esta versão melhora a navegação nos capítulos do README.md com um formato de tabela aprimorado.**

#### Alterado
- **Tabela do Mapa do Curso**: Melhorada com links diretos para lições, estimativas de duração e avaliações de complexidade
- **Limpeza de Pastas**: Removidas pastas antigas redundantes (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Validação de Links**: Todos os 21+ links internos na tabela do Mapa do Curso verificados

### [v3.16.0] - 2026-02-05

#### Atualizações de Nomes de Produto
**Esta versão atualiza referências de produtos para a marca Microsoft atual.**

#### Alterado
- **Microsoft Foundry → Microsoft Foundry**: Todas referências atualizadas em arquivos que não são de tradução
- **Azure AI Agent Service → Foundry Agents**: Nome do serviço atualizado para refletir a marca atual

#### Arquivos Atualizados
- `README.md` - Página principal do curso
- `changelog.md` - Histórico de versões
- `course-outline.md` - Estrutura do curso
- `docs/chapter-02-ai-development/agents.md` - Guia de agentes de IA
- `examples/README.md` - Documentação dos exemplos
- `workshop/README.md` - Página principal do workshop
- `workshop/docs/index.md` - Índice do workshop
- `workshop/docs/instructions/*.md` - Todos arquivos de instruções do workshop

---

### [v3.15.0] - 2026-02-05

#### Reestruturação Principal do Repositório: Nomes de Pastas por Capítulo
**Esta versão reestrutura a documentação em pastas dedicadas por capítulo para navegação mais clara.**

#### Renomeações de Pasta
Pastas antigas foram substituídas por pastas numeradas por capítulo:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Adicionado novo: `docs/chapter-05-multi-agent/`

#### Migrações de Arquivos
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
| Todos arquivos pré-implantaçao | pre-deployment/ | chapter-06-pre-deployment/ |
| Todos arquivos de solução de problemas | troubleshooting/ | chapter-07-troubleshooting/ |

#### Adicionado
- **📚 Arquivos README de Capítulo**: Criados README.md em cada pasta de capítulo com:
  - Objetivos de aprendizado e duração
  - Tabela de lições com descrições
  - Comandos de início rápido
  - Navegação para outros capítulos

#### Alterado
- **🔗 Atualizados todos links internos**: Mais de 78 caminhos atualizados em toda documentação
- **🗺️ README.md principal**: Atualizado Mapa do Curso com nova estrutura de capítulos
- **📝 examples/README.md**: Atualizadas referências cruzadas para pastas por capítulo

#### Removido
- Estrutura antiga de pastas (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Reestruturação do Repositório: Navegação por Capítulo
**Esta versão adicionou arquivos README de navegação por capítulo (substituídos pela v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Novo Guia de Agentes de IA
**Esta versão adiciona um guia completo para implantação de agentes de IA com Azure Developer CLI.**

#### Adicionado
- **🤖 docs/microsoft-foundry/agents.md**: Guia completo abordando:
  - O que são agentes de IA e como diferem de chatbots
  - Três templates de iniciação rápida para agentes (Foundry Agents, Prompty, RAG)
  - Padrões de arquitetura de agentes (agente único, RAG, multi-agente)
  - Configuração e personalização de ferramentas
  - Monitoramento e rastreamento de métricas
  - Considerações e otimização de custos
  - Cenários comuns de solução de problemas
  - Três exercícios práticos com critérios de sucesso

#### Estrutura do Conteúdo
- **Introdução**: Conceitos de agentes para iniciantes
- **Início Rápido**: Implantação de agentes com `azd init --template get-started-with-ai-agents`
- **Padrões de Arquitetura**: Diagramas visuais dos padrões de agentes
- **Configuração**: Configuração de ferramentas e variáveis de ambiente
- **Monitoramento**: Integração com Application Insights
- **Exercícios**: Aprendizado prático progressivo (20-45 minutos cada)

---

### [v3.12.0] - 2026-02-05

#### Atualização do Ambiente DevContainer
**Esta versão atualiza a configuração do container de desenvolvimento com ferramentas modernas e melhores padrões para a experiência de aprendizado AZD.**

#### Alterado
- **🐳 Imagem Base**: Atualizada de `python:3.12-bullseye` para `python:3.12-bookworm` (Debian estável mais recente)
- **📛 Nome do Container**: Renomeado de "Python 3" para "AZD para Iniciantes" para clareza

#### Adicionado
- **🔧 Novos recursos do Dev Container**:
  - `azure-cli` com suporte a Bicep ativado
  - `node:20` (versão LTS para templates AZD)
  - `github-cli` para gerenciamento de templates
  - `docker-in-docker` para implantações de container apps

- **🔌 Redirecionamento de Portas**: Portas pré-configuradas para desenvolvimento comum:
  - 8000 (pré-visualização MkDocs)
  - 3000 (apps web)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Novas Extensões do VS Code**:
  - `ms-python.vscode-pylance` - IntelliSense melhorado para Python
  - `ms-azuretools.vscode-azurefunctions` - Suporte a Azure Functions
  - `ms-azuretools.vscode-docker` - Suporte a Docker
  - `ms-azuretools.vscode-bicep` - Suporte à linguagem Bicep
  - `ms-azure-devtools.azure-resource-groups` - Gerenciamento de recursos Azure
  - `yzhang.markdown-all-in-one` - Edição Markdown
  - `DavidAnson.vscode-markdownlint` - Linting Markdown
  - `bierner.markdown-mermaid` - Suporte a diagramas Mermaid
  - `redhat.vscode-yaml` - Suporte a YAML (para azure.yaml)
  - `eamodio.gitlens` - Visualização Git
  - `mhutchie.git-graph` - Histórico Git

- **⚙️ Configurações do VS Code**: Adicionadas configurações padrão para interpretador Python, formatação ao salvar e remoção de espaços em branco

- **📦 Atualizado requirements-dev.txt**:
  - Adicionado plugin MkDocs minify
  - Adicionado pre-commit para qualidade de código
  - Adicionados pacotes Azure SDK (azure-identity, azure-mgmt-resource)

#### Corrigido
- **Comando Pós-Criação**: Agora verifica instalação do AZD e Azure CLI na inicialização do container

---

### [v3.11.0] - 2026-02-05

#### Reformulação do README para Iniciantes
**Esta versão melhora significativamente o README.md para torná-lo mais acessível a iniciantes e adiciona recursos essenciais para desenvolvedores de IA.**

#### Adicionado
- **🆚 Comparação Azure CLI vs AZD**: Explicação clara de quando usar cada ferramenta com exemplos práticos
- **🌟 Links incríveis AZD**: Links diretos para galeria comunitária de templates e recursos de contribuição:
  - [Galeria Incrível AZD](https://azure.github.io/awesome-azd/) - mais de 200 templates prontos para implantar
  - [Enviar um Template](https://github.com/Azure/awesome-azd/issues) - contribuição comunitária
- **🎯 Guia de Início Rápido**: Seção simplificada de 3 passos para começar (Instalar → Login → Implantar)
- **📊 Tabela de Navegação Baseada na Experiência**: Orientação clara sobre onde começar com base na experiência do desenvolvedor

#### Alterado
- **Estrutura do README**: Reorganizado para divulgação progressiva - informações chave primeiro
- **Seção de Introdução**: Reescrita para explicar "A Magia do `azd up`" para iniciantes completos
- **Removido Conteúdo Duplicado**: Eliminada seção duplicada de solução de problemas
- **Comandos de Solução de Problemas**: Corrigida referência `azd logs` para usar `azd monitor --logs` válido

#### Corrigido
- **🔐 Comandos de Autenticação**: Adicionados `azd auth login` e `azd auth logout` ao cheat-sheet.md
- **Referências de Comando Inválidas**: Removidas últimas `azd logs` da seção de solução de problemas do README

#### Notas
- **Escopo**: Alterações aplicadas ao README.md principal e resources/cheat-sheet.md
- **Público-Alvo**: Melhorias focadas em desenvolvedores novos no AZD

---

### [v3.10.0] - 2026-02-05

#### Atualização da Precisão dos Comandos Azure Developer CLI
**Esta versão corrige comandos AZD inexistentes em toda a documentação, garantindo que todos exemplos de código usem sintaxe válida do Azure Developer CLI.**

#### Corrigido
- **🔧 Removidos Comandos AZD Inexistentes**: Auditoria abrangente e correção de comandos inválidos:
  - `azd logs` (não existe) → substituído por `azd monitor --logs` ou alternativas Azure CLI
  - Subcomandos `azd service` (não existem) → substituídos por `azd show` e Azure CLI
  - `azd infra import/export/validate` (não existem) → removidos ou substituídos por alternativas válidas
  - Flags `azd deploy --rollback/--incremental/--parallel/--detect-changes` (não existem) → removidas
  - Flags `azd provision --what-if/--rollback` (não existem) → atualizadas para usar `--preview`
  - `azd config validate` (não existe) → substituído por `azd config list`
  - `azd info`, `azd history`, `azd metrics` (não existem) → removidos

- **📚 Arquivos Atualizados com Correções de Comando**:
  - `resources/cheat-sheet.md`: Revisão majoritária da referência a comandos
  - `docs/deployment/deployment-guide.md`: Corrigidas estratégias de rollback e implantação
  - `docs/troubleshooting/debugging.md`: Corrigidas seções de análise de logs
  - `docs/troubleshooting/common-issues.md`: Atualizados comandos de solução de problemas
  - `docs/troubleshooting/ai-troubleshooting.md`: Corrigida seção de depuração AZD
  - `docs/getting-started/azd-basics.md`: Comandos de monitoramento corrigidos
  - `docs/getting-started/first-project.md`: Exemplos de monitoramento e depuração atualizados
  - `docs/getting-started/installation.md`: Exemplos de ajuda e versão corrigidos
  - `docs/pre-deployment/application-insights.md`: Comandos para visualização de logs corrigidos
  - `docs/pre-deployment/coordination-patterns.md`: Comandos de depuração do agente corrigidos

- **📝 Referência de Versão Atualizada**: 
  - `docs/getting-started/installation.md`: Mudou a versão `1.5.0` codificada para a genérica `1.x.x` com link para releases

#### Alterações
- **Estratégias de Rollback**: Documentação atualizada para usar rollback baseado em Git (AZD não possui rollback nativo)
- **Visualização de Logs**: Referências de `azd logs` substituídas por `azd monitor --logs`, `azd monitor --live` e comandos Azure CLI
- **Seção de Performance**: Flags de implantação paralela/incremental que não existiam foram removidas, e alternativas válidas foram fornecidas

#### Detalhes Técnicos
- **Comandos AZD Válidos**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Flags válidas de azd monitor**: `--live`, `--logs`, `--overview`
- **Funcionalidades Removidas**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notas
- **Verificação**: Comandos validados com Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Conclusão do Workshop e Atualização da Qualidade da Documentação
**Esta versão conclui os módulos interativos do workshop, corrige todos os links quebrados da documentação e melhora a qualidade geral do conteúdo para desenvolvedores AI que usam Microsoft AZD.**

#### Adicionado
- **📝 CONTRIBUTING.md**: Novo documento de diretrizes para contribuições com:
  - Instruções claras para reportar problemas e propor mudanças
  - Padrões de documentação para novos conteúdos
  - Diretrizes para exemplos de código e convenções de mensagens de commit
  - Informações sobre engajamento da comunidade

#### Concluído
- **🎯 Módulo 7 do Workshop (Encerramento)**: Módulo de encerramento totalmente concluído com:
  - Resumo abrangente das realizações do workshop
  - Seção de conceitos-chave dominados incluindo AZD, templates e Microsoft Foundry
  - Recomendações para continuação da jornada de aprendizado
  - Exercícios desafiadores do workshop com avaliações de dificuldade
  - Feedback da comunidade e links de suporte

- **📚 Módulo 3 do Workshop (Desconstrução)**: Objetivos atualizados com:
  - Guia para ativação do GitHub Copilot com servidores MCP
  - Entendimento da estrutura de pastas dos templates AZD
  - Padrões de organização de infraestrutura como código (Bicep)
  - Instruções para laboratório prático

- **🔧 Módulo 6 do Workshop (Desmontagem)**: Concluído com:
  - Objetivos de limpeza de recursos e gestão de custos
  - Uso de `azd down` para desativação segura da infraestrutura
  - Orientação para recuperação de serviços cognitivos soft-deleted
  - Prompts bônus para exploração do GitHub Copilot e Azure Portal

#### Corrigido
- **🔗 Correção de Links Quebrados**: Mais de 15 links internos quebrados resolvidos:
  - `docs/ai-foundry/ai-model-deployment.md`: Caminhos corrigidos para microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Caminhos corrigidos para ai-model-deployment.md e production-ai-practices.md
  - `docs/getting-started/first-project.md`: Substituído cicd-integration.md inexistente por deployment-guide.md
  - `examples/retail-scenario.md`: Caminhos corrigidos para FAQ e guia de solução de problemas
  - `examples/container-app/microservices/README.md`: Correção nos caminhos da página inicial do curso e do guia de implantação
  - `resources/faq.md` e `resources/glossary.md`: Atualizadas referências ao capítulo AI
  - `course-outline.md`: Corrigidas referências ao guia do instrutor e laboratório AI

- **📅 Banner de Status do Workshop**: Atualizado de "Em Construção" para status ativo do workshop com data de fevereiro de 2026

- **🔗 Navegação do Workshop**: Corrigidos links de navegação quebrados no README.md do workshop apontando para a pasta lab-1-azd-basics inexistente

#### Alterado
- **Apresentação do Workshop**: Removido aviso de "em construção", workshop agora está completo e pronto para uso
- **Consistência na Navegação**: Garantida navegação apropriada entre todos os módulos do workshop
- **Referências do Caminho de Aprendizagem**: Atualizadas referências entre capítulos para usar os caminhos corretos do microsoft-foundry

#### Validado
- ✅ Todos os arquivos markdown em inglês têm links internos válidos
- ✅ Módulos 0-7 do workshop estão completos com objetivos de aprendizado
- ✅ Navegação entre capítulos e módulos funciona corretamente
- ✅ Conteúdo adequado para desenvolvedores AI usando Microsoft AZD
- ✅ Linguagem e estrutura amigáveis para iniciantes mantidas em todo o documento
- ✅ CONTRIBUTING.md fornece orientações claras para colaboradores da comunidade

#### Implementação Técnica
- **Validação de Links**: Script automatizado PowerShell verificou todos os links internos .md
- **Auditoria de Conteúdo**: Revisão manual de completude e adequação para iniciantes do workshop
- **Sistema de Navegação**: Padrões consistentes aplicados para navegação entre capítulos e módulos

#### Notas
- **Escopo**: Mudanças aplicadas apenas à documentação em inglês
- **Traduções**: Pastas de tradução não foram atualizadas nesta versão (tradução automatizada será sincronizada posteriormente)
- **Duração do Workshop**: Workshop completo agora oferece 3-4 horas de aprendizado prático

---

### [v3.8.0] - 2025-11-19

#### Documentação Avançada: Monitoramento, Segurança e Padrões Multi-Agente
**Esta versão adiciona lições abrangentes de nível A sobre integração do Application Insights, padrões de autenticação e coordenação multi-agente para implantações em produção.**

#### Adicionado
- **📊 Lição de Integração do Application Insights**: em `docs/pre-deployment/application-insights.md`:
  - Implantação focada em AZD com provisionamento automático
  - Templates completos em Bicep para Application Insights + Log Analytics
  - Aplicações Python funcionais com telemetria personalizada (mais de 1.200 linhas)
  - Padrões de monitoramento AI/LLM (rastreamento de tokens/custos dos modelos Microsoft Foundry)
  - 6 diagramas Mermaid (arquitetura, rastreamento distribuído, fluxo de telemetria)
  - 3 exercícios práticos (alertas, dashboards, monitoramento AI)
  - Exemplos de consultas Kusto e estratégias de otimização de custos
  - Streaming de métricas ao vivo e depuração em tempo real
  - Tempo de aprendizado de 40 a 50 minutos com padrões prontos para produção

- **🔐 Lição de Padrões de Autenticação & Segurança**: em `docs/getting-started/authsecurity.md`:
  - 3 padrões de autenticação (strings de conexão, Key Vault, identidade gerenciada)
  - Templates completos de infraestrutura em Bicep para implantações seguras
  - Código de aplicação Node.js com integração Azure SDK
  - 3 exercícios completos (habilitar identidade gerenciada, identidade atribuída ao usuário, rotação do Key Vault)
  - Melhores práticas de segurança e configurações RBAC
  - Guia de solução de problemas e análise de custos
  - Padrões de autenticação sem senha prontos para produção

- **🤖 Lição de Padrões de Coordenação Multi-Agente**: em `docs/pre-deployment/coordination-patterns.md`:
  - 5 padrões de coordenação (sequencial, paralelo, hierárquico, orientado a eventos, consenso)
  - Implementação completa do serviço orquestrador (Python/Flask, mais de 1.500 linhas)
  - 3 implementações especializadas de agentes (Pesquisa, Escritor, Editor)
  - Integração com Service Bus para enfileiramento de mensagens
  - Gerenciamento de estado com Cosmos DB para sistemas distribuídos
  - 6 diagramas Mermaid mostrando interações dos agentes
  - 3 exercícios avançados (manipulação de timeout, lógica de retentativas, disjuntor)
  - Desdobramento de custos ($240-565/mês) com estratégias de otimização
  - Integração com Application Insights para monitoramento

#### Aprimorado
- **Capítulo Pré-implantação**: Agora inclui padrões abrangentes de monitoramento e coordenação
- **Capítulo Início Rápido**: Aprimorado com padrões profissionais de autenticação
- **Prontidão para Produção**: Cobertura completa desde segurança até observabilidade
- **Roteiro do Curso**: Atualizado para referenciar novas lições nos Capítulos 3 e 6

#### Alterado
- **Progressão de Aprendizado**: Melhor integração de segurança e monitoramento ao longo do curso
- **Qualidade da Documentação**: Padrões consistentes de nível A (95-97%) nas novas lições
- **Padrões para Produção**: Cobertura completa fim a fim para implantações empresariais

#### Melhorado
- **Experiência do Desenvolvedor**: Caminho claro do desenvolvimento ao monitoramento em produção
- **Padrões de Segurança**: Padrões profissionais para autenticação e gestão de segredos
- **Observabilidade**: Integração completa do Application Insights com AZD
- **Workloads AI**: Monitoramento especializado para modelos Microsoft Foundry e sistemas multi-agente

#### Validado
- ✅ Todas as lições incluem código completo funcional (não apenas trechos)
- ✅ Diagramas Mermaid para aprendizado visual (19 no total em 3 lições)
- ✅ Exercícios práticos com etapas de verificação (9 no total)
- ✅ Templates Bicep prontos para produção implantáveis via `azd up`
- ✅ Análises de custo e estratégias de otimização
- ✅ Guias de solução de problemas e melhores práticas
- ✅ Pontos de conhecimento com comandos de verificação

#### Resultados da Avaliação da Documentação
- **docs/pre-deployment/application-insights.md**: - Guia abrangente de monitoramento
- **docs/getting-started/authsecurity.md**: - Padrões profissionais de segurança
- **docs/pre-deployment/coordination-patterns.md**: - Arquiteturas avançadas multi-agente
- **Conteúdo Geral Novo**: - Padrões de alta qualidade consistentes

#### Implementação Técnica
- **Application Insights**: Log Analytics + telemetria customizada + rastreamento distribuído
- **Autenticação**: Identidade Gerenciada + Key Vault + padrões RBAC
- **Multi-Agente**: Service Bus + Cosmos DB + Container Apps + orquestração
- **Monitoramento**: Métricas ao vivo + consultas Kusto + alertas + dashboards
- **Gestão de Custos**: Estratégias de amostragem, políticas de retenção, controles orçamentários

### [v3.7.0] - 2025-11-19

#### Melhorias na Qualidade da Documentação e Novo Exemplo Microsoft Foundry Models
**Esta versão aprimora a qualidade da documentação no repositório e adiciona um exemplo completo de implantação Microsoft Foundry Models com interface de chat gpt-4.1.**

#### Adicionado
- **🤖 Exemplo de Chat Microsoft Foundry Models**: Implantação completa gpt-4.1 com implementação funcional em `examples/azure-openai-chat/`:
  - Infraestrutura completa Microsoft Foundry Models (implantação do modelo gpt-4.1)
  - Interface de chat Python CLI com histórico de conversas
  - Integração com Key Vault para armazenamento seguro de chaves API
  - Rastreamento de uso de tokens e estimativa de custos
  - Limitação de taxa e tratamento de erros
  - README abrangente com guia de implantação de 35-45 minutos
  - 11 arquivos prontos para produção (templates Bicep, app Python, configuração)
- **📚 Exercícios de Documentação**: Exercícios práticos adicionados ao guia de configuração:
  - Exercício 1: Configuração multi-ambiente (15 minutos)
  - Exercício 2: Prática de gerenciamento de segredos (10 minutos)
  - Critérios claros de sucesso e etapas de verificação
- **✅ Verificação da Implantação**: Seção de verificação adicionada no guia de implantação:
  - Procedimentos de checagem de saúde
  - Checklist de critérios de sucesso
  - Resultados esperados para todos os comandos de implantação
  - Referência rápida para solução de problemas

#### Aprimorado
- **examples/README.md**: Atualizado para qualidade nível A (93%):
  - azure-openai-chat adicionado a todas as seções relevantes
  - Número de exemplos locais atualizado de 3 para 4
  - Adicionado à tabela de Exemplos de Aplicações AI
  - Integrado ao Início Rápido para usuários intermediários
  - Adicionado à seção Microsoft Foundry Templates
  - Matriz de comparação e seções de tecnologia atualizadas
- **Qualidade da Documentação**: Melhorado de B+ (87%) para A- (92%) na pasta docs:
  - Saídas esperadas adicionadas nos exemplos de comandos críticos
  - Inclusão de etapas de verificação para alterações de configuração
  - Aprendizado prático aprimorado com exercícios

#### Alterado
- **Progressão de Aprendizado**: Melhor integração de exemplos AI para aprendizes intermediários
- **Estrutura da Documentação**: Exercícios mais práticos com resultados claros
- **Processo de Verificação**: Critérios explícitos de sucesso adicionados aos fluxos de trabalho chave

#### Melhorado
- **Experiência do Desenvolvedor**: Implantação Microsoft Foundry Models agora leva 35-45 minutos (vs 60-90 para alternativas complexas)
- **Transparência de Custos**: Estimativas claras de custos ($50-200/mês) para exemplo Microsoft Foundry Models
- **Caminho de Aprendizado**: Desenvolvedores AI têm ponto de entrada claro com azure-openai-chat
- **Padrões de Documentação**: Saídas esperadas e etapas de verificação consistentes

#### Validado
- ✅ Exemplo Microsoft Foundry Models totalmente funcional com `azd up`
- ✅ Todos os 11 arquivos de implementação sintaticamente corretos
- ✅ Instruções do README correspondem à experiência real de implantação
- ✅ Links da documentação atualizados em mais de 8 localizações
- ✅ Índice de exemplos reflete corretamente 4 exemplos locais
- ✅ Nenhum link externo duplicado nas tabelas
- ✅ Todas referências de navegação corretas

#### Implementação Técnica
- **Arquitetura Microsoft Foundry Models**: padrão gpt-4.1 + Key Vault + Container Apps
- **Segurança**: Identidade Gerenciada pronta, segredos no Key Vault
- **Monitoramento**: Integração Application Insights
- **Gestão de Custos**: Rastreamento de tokens e otimização de uso
- **Implantação**: Comando único `azd up` para configuração completa

### [v3.6.0] - 2025-11-19

#### Atualização Principal: Exemplos de Implantação Container App
**Esta versão introduz exemplos abrangentes e prontos para produção de implantação de aplicações containerizadas usando Azure Developer CLI (AZD), com documentação completa e integração no caminho de aprendizado.**

#### Adicionado
- **🚀 Exemplos Container App**: Novos exemplos locais em `examples/container-app/`:
  - [Guia Mestre](examples/container-app/README.md): Visão geral completa de implantações conteinerizadas, início rápido, produção e padrões avançados
  - [API Flask Simples](../../examples/container-app/simple-flask-api): API REST amigável para iniciantes com escala-zero, sondas de integridade, monitoramento e solução de problemas
  - [Arquitetura de Microsserviços](../../examples/container-app/microservices): Implantação multi-serviço pronta para produção (API Gateway, Produto, Pedido, Usuário, Notificação), mensageria assíncrona, Service Bus, Cosmos DB, Azure SQL, rastreamento distribuído, implantação blue-green/canary
- **Melhores Práticas**: Segurança, monitoramento, otimização de custos e diretrizes de CI/CD para cargas de trabalho conteinerizadas
- **Exemplos de Código**: `azure.yaml` completos, templates Bicep e implementações de serviços multilíngues (Python, Node.js, C#, Go)
- **Testes e Solução de Problemas**: Cenários de teste de ponta a ponta, comandos de monitoramento, orientações para solução de problemas

#### Alterações
- **README.md**: Atualizado para apresentar e linkar novos exemplos de apps conteinerizados em "Exemplos Locais - Aplicativos Conteinerizados"
- **examples/README.md**: Atualizado para destacar exemplos de apps conteinerizados, adicionar entradas na matriz de comparação e atualizar referências de tecnologia/arquitetura
- **Estrutura do Curso e Guia de Estudos**: Atualizado para referenciar novos exemplos de apps conteinerizados e padrões de implantação nos capítulos relevantes

#### Validado
- ✅ Todos os novos exemplos implantáveis com `azd up` e seguem as melhores práticas
- ✅ Atualizados os links cruzados da documentação e navegação
- ✅ Exemplos abrangem cenários do iniciante ao avançado, incluindo microsserviços em produção

#### Notas
- **Escopo**: Documentação e exemplos em inglês apenas
- **Próximos Passos**: Expandir com padrões avançados adicionais de containers e automação CI/CD em versões futuras

### [v3.5.0] - 2025-11-19

#### Rebranding de Produto: Microsoft Foundry
**Esta versão implementa uma mudança completa do nome do produto de "Microsoft Foundry" para "Microsoft Foundry" em toda a documentação em inglês, refletindo o rebranding oficial da Microsoft.**

#### Alterações
- **🔄 Atualização do Nome do Produto**: Rebranding completo de "Microsoft Foundry" para "Microsoft Foundry"
  - Atualizadas todas as referências em toda a documentação em inglês na pasta `docs/`
  - Renomeada pasta: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Renomeado arquivo: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 referências de conteúdo atualizadas em 7 arquivos de documentação

- **📁 Alterações na Estrutura de Pastas**:
  - `docs/ai-foundry/` renomeada para `docs/microsoft-foundry/`
  - Todas as referências cruzadas atualizadas para refletir a nova estrutura de pastas
  - Links de navegação validados em toda a documentação

- **📄 Renomeação de Arquivos**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Todos os links internos atualizados para referenciar o novo nome de arquivo

#### Arquivos Atualizados
- **Documentação de Capítulos** (7 arquivos):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 atualizações de links de navegação
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 referências ao nome do produto atualizadas
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Já usando Microsoft Foundry (de atualizações anteriores)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referências atualizadas (visão geral, feedback da comunidade, documentação)
  - `docs/getting-started/azd-basics.md` - 4 links de referência cruzada atualizados
  - `docs/getting-started/first-project.md` - 2 links de navegação do capítulo atualizados
  - `docs/getting-started/installation.md` - 2 links do próximo capítulo atualizados
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referências atualizadas (navegação, comunidade Discord)
  - `docs/troubleshooting/common-issues.md` - 1 link de navegação atualizado
  - `docs/troubleshooting/debugging.md` - 1 link de navegação atualizado

- **Arquivos de Estrutura do Curso** (2 arquivos):
  - `README.md` - 17 referências atualizadas (visão geral do curso, títulos dos capítulos, seção de templates, insights da comunidade)
  - `course-outline.md` - 14 referências atualizadas (visão geral, objetivos de aprendizagem, recursos do capítulo)

#### Validado
- ✅ Nenhuma referência restante à pasta "ai-foundry" em docs em inglês
- ✅ Nenhuma referência restante ao nome do produto "Microsoft Foundry" em docs em inglês
- ✅ Todos os links de navegação funcionais com a nova estrutura de pastas
- ✅ Renomeações de arquivo e pasta concluídas com sucesso
- ✅ Referências cruzadas entre capítulos validadas

#### Notas
- **Escopo**: Alterações aplicadas somente à documentação em inglês na pasta `docs/`
- **Traduções**: Pastas de tradução (`translations/`) não atualizadas nesta versão
- **Workshop**: Materiais de workshop (`workshop/`) não atualizados nesta versão
- **Exemplos**: Arquivos de exemplo ainda podem referenciar nomes legados (a serem corrigidos em atualização futura)
- **Links Externos**: URLs externas e referências de repositório GitHub permanecem inalterados

#### Guia de Migração para Colaboradores
Se você tiver branches locais ou documentação referenciando a estrutura antiga:
1. Atualize referências de pasta: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Atualize referências de arquivo: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Substitua o nome do produto: "Microsoft Foundry" → "Microsoft Foundry"
4. Valide se todos os links internos da documentação ainda funcionam

---

### [v3.4.0] - 2025-10-24

#### Melhorias na Pré-visualização e Validação da Infraestrutura
**Esta versão introduz suporte completo para a nova funcionalidade de preview do Azure Developer CLI e aprimora a experiência do usuário no workshop.**

#### Adicionado
- **🧪 Documentação da funcionalidade azd provision --preview**: Cobertura completa da nova capacidade de pré-visualização de infraestrutura
  - Referência de comando e exemplos de uso no cheat sheet
  - Integração detalhada no guia de provisionamento com casos de uso e benefícios
  - Integração de verificação prévia para validação de implantação mais segura
  - Atualizações no guia de início rápido com práticas de implantação seguras
- **🚧 Banner de Status do Workshop**: Banner HTML profissional indicando status de desenvolvimento do workshop
  - Design em gradiente com indicadores de construção para comunicação clara ao usuário
  - Timestamp da última atualização para transparência
  - Design responsivo para dispositivos móveis de todos os tipos

#### Aprimorado
- **Segurança da Infraestrutura**: Funcionalidade de preview integrada em toda a documentação de implantação
- **Validação Pré-implantação**: Scripts automatizados agora incluem testes de pré-visualização da infraestrutura
- **Fluxo de Trabalho do Desenvolvedor**: Sequências de comandos atualizadas para incluir preview como melhor prática
- **Experiência do Workshop**: Expectativas claras definidas para usuários sobre o status de desenvolvimento do conteúdo

#### Alterado
- **Melhores Práticas de Implantação**: Fluxo de trabalho com preview como abordagem recomendada
- **Fluxo da Documentação**: Validação da infraestrutura foi movida para etapas anteriores no processo de aprendizagem
- **Apresentação do Workshop**: Comunicação profissional do status com cronograma claro de desenvolvimento

#### Melhorado
- **Abordagem de Segurança em Primeiro Lugar**: Mudanças na infraestrutura agora podem ser validadas antes da implantação
- **Colaboração em Equipe**: Resultados de preview podem ser compartilhados para revisão e aprovação
- **Consciência de Custos**: Melhor compreensão dos custos de recursos antes do provisionamento
- **Mitigação de Riscos**: Redução de falhas na implantação por meio de validação antecipada

#### Implementação Técnica
- **Integração Multidocumento**: Funcionalidade de preview documentada em 4 arquivos principais
- **Padrões de Comando**: Sintaxe e exemplos consistentes na documentação
- **Integração de Melhores Práticas**: Preview incluído em fluxos de trabalho e scripts de validação
- **Indicadores Visuais**: Marcações claras de NOVA funcionalidade para melhor descoberta

#### Infraestrutura do Workshop
- **Comunicação de Status**: Banner HTML profissional com estilo em gradiente
- **Experiência do Usuário**: Status de desenvolvimento claro previne confusão
- **Apresentação Profissional**: Mantém a credibilidade do repositório enquanto define expectativas
- **Transparência do Cronograma**: Timestamp da última atualização em outubro de 2025 para responsabilidade

### [v3.3.0] - 2025-09-24

#### Materiais de Workshop Aprimorados e Experiência de Aprendizado Interativa
**Esta versão apresenta materiais completos de workshop com guias interativos baseados em navegador e roteiros de aprendizado estruturados.**

#### Adicionado
- **🎥 Guia Interativo do Workshop**: Experiência de workshop baseada em navegador com capacidade de prévia do MkDocs
- **📝 Instruções Estruturadas do Workshop**: Roteiro de aprendizado guiado em 7 etapas da descoberta à personalização
  - 0-Introdução: Visão geral do workshop e configuração
  - 1-Selecionar-Template-AI: Processo de descoberta e seleção de template
  - 2-Validar-Template-AI: Procedimentos de implantação e validação
  - 3-Desconstruir-Template-AI: Entendendo a arquitetura do template
  - 4-Configurar-Template-AI: Configuração e personalização
  - 5-Personalizar-Template-AI: Modificações avançadas e iterações
  - 6-Demontar-Infraestrutura: Limpeza e gerenciamento de recursos
  - 7-Conclusão: Resumo e próximos passos
- **🛠️ Ferramentas do Workshop**: Configuração MkDocs com tema Material para experiência de aprendizado aprimorada
- **🎯 Roteiro Prático de Aprendizado**: Metodologia em 3 passos (Descoberta → Implantação → Personalização)
- **📱 Integração GitHub Codespaces**: Configuração perfeita do ambiente de desenvolvimento

#### Aprimorado
- **Laboratório de IA do Workshop**: Expandido com experiência estruturada abrangente de 2-3 horas
- **Documentação do Workshop**: Apresentação profissional com navegação e auxílios visuais
- **Progressão no Aprendizado**: Orientação clara passo a passo desde a seleção do template até a implantação em produção
- **Experiência do Desenvolvedor**: Ferramentas integradas para fluxos de trabalho de desenvolvimento otimizados

#### Melhorado
- **Acessibilidade**: Interface baseada em navegador com busca, funcionalidade de copiar e alternância de tema
- **Aprendizado no Próprio Ritmo**: Estrutura flexível do workshop para acomodar diferentes velocidades de aprendizado
- **Aplicação Prática**: Cenários reais de implantação de templates de IA
- **Integração Comunitária**: Integração com Discord para suporte e colaboração no workshop

#### Recursos do Workshop
- **Busca Incorporada**: Descoberta rápida de palavras-chave e lições
- **Copiar Blocos de Código**: Funcionalidade de copiar ao passar o mouse para todos os exemplos de código
- **Alternância de Tema**: Suporte a modos claro/escuro para preferências diferentes
- **Ativos Visuais**: Capturas de tela e diagramas para entendimento aprimorado
- **Integração de Ajuda**: Acesso direto ao Discord para suporte da comunidade

### [v3.2.0] - 2025-09-17

#### Grande Reestruturação da Navegação e Sistema de Aprendizado Baseado em Capítulos
**Esta versão introduz uma estrutura abrangente de aprendizado baseada em capítulos com navegação aprimorada em todo o repositório.**

#### Adicionado
- **📚 Sistema de Aprendizado por Capítulos**: Curso inteiro reestruturado em 8 capítulos progressivos de aprendizado
  - Capítulo 1: Fundamentos e Início Rápido (⭐ - 30-45 minutos)
  - Capítulo 2: Desenvolvimento AI-First (⭐⭐ - 1-2 horas)
  - Capítulo 3: Configuração e Autenticação (⭐⭐ - 45-60 minutos)
  - Capítulo 4: Infraestrutura como Código e Implantação (⭐⭐⭐ - 1-1.5 horas)
  - Capítulo 5: Soluções de IA Multi-Agente (⭐⭐⭐⭐ - 2-3 horas)
  - Capítulo 6: Validação e Planejamento Pré-Implantação (⭐⭐ - 1 hora)
  - Capítulo 7: Solução de Problemas e Depuração (⭐⭐ - 1-1.5 horas)
  - Capítulo 8: Padrões de Produção e Empresariais (⭐⭐⭐⭐ - 2-3 horas)
- **📚 Sistema Abrangente de Navegação**: Cabeçalhos e rodapés de navegação consistentes em toda a documentação
- **🎯 Rastreamento de Progresso**: Lista de verificação para conclusão do curso e sistema de verificação de aprendizado
- **🗺️ Guia de Roteiro de Aprendizagem**: Pontos de entrada claros para diferentes níveis de experiência e objetivos
- **🔗 Navegação por Referência Cruzada**: Capítulos relacionados e pré-requisitos claramente linkados

#### Aprimorado
- **Estrutura do README**: Transformado em plataforma estruturada de aprendizado com organização por capítulos
- **Navegação da Documentação**: Cada página agora inclui contexto do capítulo e guia de progressão
- **Organização de Templates**: Exemplos e templates mapeados para capítulos de aprendizado apropriados
- **Integração de Recursos**: Cheat sheets, FAQs e guias de estudo conectados aos capítulos relevantes
- **Integração com Workshop**: Laboratórios práticos vinculados a múltiplos objetivos de aprendizado por capítulo

#### Alterado
- **Progressão no Aprendizado**: Passou da documentação linear para aprendizado flexível baseado em capítulos
- **Posicionamento da Configuração**: Guia de configuração reposicionado como Capítulo 3 para melhor fluxo de aprendizado
- **Integração de Conteúdo de IA**: Melhor integração de conteúdo específico de IA durante a jornada de aprendizado
- **Conteúdo de Produção**: Padrões avançados consolidados no Capítulo 8 para aprendizes empresariais

#### Melhorado
- **Experiência do Usuário**: Breadcrumbs claros e indicadores de progressão por capítulo
- **Acessibilidade**: Padrões de navegação consistentes para facilitar o percurso do curso
- **Apresentação Profissional**: Estrutura de curso em estilo universitário adequada para treinamentos acadêmicos e corporativos
- **Eficiência no Aprendizado**: Tempo reduzido para encontrar conteúdo relevante por meio de melhor organização

#### Implementação Técnica
- **Cabeçalhos de Navegação**: Navegação padronizada por capítulos em mais de 40 arquivos de documentação
- **Navegação no Rodapé**: Guia consistente de progressão e indicadores de conclusão do capítulo
- **Links Cruzados**: Sistema interno abrangente de links conectando conceitos relacionados
- **Mapeamento de Capítulos**: Templates e exemplos claramente associados a objetivos de aprendizado

#### Aprimoramento do Guia de Estudos
- **📚 Objetivos de Aprendizado Abrangentes**: Guia de estudos reestruturado para alinhar com sistema de 8 capítulos
- **🎯 Avaliação por Capítulo**: Cada capítulo inclui objetivos específicos de aprendizado e exercícios práticos
- **📋 Rastreamento de Progresso**: Cronograma semanal de aprendizado com resultados mensuráveis e listas de verificação de conclusão
- **❓ Perguntas de Avaliação**: Questões de validação de conhecimento para cada capítulo com resultados profissionais
- **🛠️ Exercícios Práticos**: Atividades práticas com cenários reais de implantação e solução de problemas
- **📊 Progressão de Habilidades**: Avanço claro de conceitos básicos a padrões empresariais com foco em desenvolvimento de carreira
- **🎓 Estrutura de Certificação**: Resultados de desenvolvimento profissional e sistema de reconhecimento comunitário
- **⏱️ Gestão de Cronograma**: Plano estruturado de aprendizado de 10 semanas com validação de marcos

### [v3.1.0] - 2025-09-17

#### Soluções de IA Multi-Agente Aprimoradas
**Esta versão melhora a solução varejista multi-agente com melhor nomeação dos agentes e documentação aprimorada.**

#### Alterado
- **Terminologia Multi-Agente**: Substituído "agente Cora" por "agente do Cliente" em toda a solução multiagente de varejo para maior clareza
- **Arquitetura do Agente**: Atualizada toda a documentação, templates ARM e exemplos de código para usar a nomeação consistente "agente do Cliente"
- **Exemplos de Configuração**: Modernizados os padrões de configuração do agente com convenções de nomenclatura atualizadas
- **Consistência na Documentação**: Garantido que todas as referências usem nomes profissionais e descritivos dos agentes

#### Aprimorado
- **Pacote de Template ARM**: Atualizado retail-multiagent-arm-template com referências ao agente do Cliente
- **Diagramas de Arquitetura**: Diagramas Mermaid atualizados com nomenclatura do agente revisada
- **Exemplos de Código**: Classes Python e exemplos de implementação agora usam nomenclatura CustomerAgent
- **Variáveis de Ambiente**: Atualizados todos os scripts de implantação para usar convenções CUSTOMER_AGENT_NAME

#### Melhorado
- **Experiência do Desenvolvedor**: Funções e responsabilidades do agente mais claras na documentação
- **Prontidão para Produção**: Melhor alinhamento com convenções de nomenclatura empresariais
- **Materiais de Aprendizado**: Nomeação de agente mais intuitiva para fins educacionais
- **Usabilidade de Templates**: Simplificada a compreensão das funções e padrões de implantação do agente

#### Detalhes Técnicos
- Diagramas de arquitetura Mermaid atualizados com referências CustomerAgent
- Substituídos nomes de classes CoraAgent por CustomerAgent nos exemplos em Python
- Modificadas configurações JSON do template ARM para usar o tipo de agente "customer"
- Atualizadas variáveis de ambiente de CORA_AGENT_* para CUSTOMER_AGENT_* 
- Atualizados todos os comandos de implantação e configurações de container

### [v3.0.0] - 2025-09-12

#### Principais Mudanças - Foco em Desenvolvedores de IA e Integração Microsoft Foundry
**Esta versão transforma o repositório em um recurso de aprendizado abrangente focado em IA com integração Microsoft Foundry.**

#### Adicionado
- **🤖 Caminho de Aprendizado AI-First**: Reestruturação completa priorizando desenvolvedores e engenheiros de IA
- **Guia de Integração Microsoft Foundry**: Documentação abrangente para conexão do AZD com serviços Microsoft Foundry
- **Padrões de Implantação de Modelo de IA**: Guia detalhado cobrindo seleção de modelo, configuração e estratégias de implantação em produção
- **Laboratório de Workshop de IA**: Workshop prático de 2-3 horas para converter aplicações de IA em soluções implantáveis via AZD
- **Melhores Práticas para IA em Produção**: Padrões empresariais para escalabilidade, monitoramento e segurança de workloads de IA
- **Guia de Solução de Problemas Específico para IA**: Diagnóstico completo para Microsoft Foundry Models, Cognitive Services e problemas de implantação de IA
- **Galeria de Templates de IA**: Coleção em destaque de templates Microsoft Foundry com classificações de complexidade
- **Materiais do Workshop**: Estrutura completa do workshop com laboratórios práticos e materiais de referência

#### Aprimorado
- **Estrutura do README**: Foco em desenvolvedor de IA com 45% de interesse comunitário baseado em dados do Discord Microsoft Foundry
- **Caminhos de Aprendizado**: Jornada dedicada ao desenvolvedor de IA junto a caminhos tradicionais para estudantes e engenheiros DevOps
- **Recomendações de Templates**: Templates AI em destaque incluindo azure-search-openai-demo, contoso-chat e openai-chat-app-quickstart
- **Integração Comunitária**: Suporte aprimorado na comunidade Discord com canais e discussões específicas de IA

#### Foco em Segurança & Produção
- **Padrões Managed Identity**: Configurações de autenticação e segurança específicas para IA
- **Otimização de Custos**: Monitoramento do uso de tokens e controle de orçamento para workloads de IA
- **Implantação Multi-Região**: Estratégias para implantação global de aplicações de IA
- **Monitoramento de Performance**: Métricas específicas de IA e integração com Application Insights

#### Qualidade da Documentação
- **Estrutura Linear do Curso**: Progressão lógica de iniciante a avançado em padrões de implantação de IA
- **URLs Validadas**: Todos os links externos do repositório verificados e acessíveis
- **Referência Completa**: Todos os links internos da documentação validados e funcionais
- **Pronto para Produção**: Padrões empresariais de implantação com exemplos do mundo real

### [v2.0.0] - 2025-09-09

#### Principais Mudanças - Reestruturação do Repositório e Aprimoramento Profissional
**Esta versão representa uma revisão significativa da estrutura e apresentação do conteúdo do repositório.**

#### Adicionado
- **Estrutura de Aprendizado Estruturada**: Todas as páginas de documentação agora incluem seções de Introdução, Objetivos de Aprendizado e Resultados de Aprendizado
- **Sistema de Navegação**: Adicionados links de aula Anterior/Próxima em toda a documentação para condução do aprendizado
- **Guia de Estudo**: study-guide.md abrangente com objetivos de aprendizado, exercícios práticos e materiais de avaliação
- **Apresentação Profissional**: Removidos todos os ícones emoji para melhor acessibilidade e aparência profissional
- **Estrutura de Conteúdo Aprimorada**: Organização e fluxo de materiais de aprendizado melhorados

#### Alterado
- **Formato da Documentação**: Padronizados todos os conteúdos com estrutura consistente focada em aprendizado
- **Fluxo de Navegação**: Implementada progressão lógica em todos os materiais de aprendizado
- **Apresentação de Conteúdo**: Removidos elementos decorativos em favor de formatação clara e profissional
- **Estrutura de Links**: Atualizados todos os links internos para suportar novo sistema de navegação

#### Melhorado
- **Acessibilidade**: Removidas dependências de emoji para melhor compatibilidade com leitores de tela
- **Aparência Profissional**: Apresentação limpa em estilo acadêmico adequada para aprendizado empresarial
- **Experiência de Aprendizado**: Abordagem estruturada com objetivos e resultados claros para cada aula
- **Organização do Conteúdo**: Melhor fluxo lógico e conexão entre tópicos relacionados

### [v1.0.0] - 2025-09-09

#### Lançamento Inicial - Repositório Abrangente de Aprendizado AZD

#### Adicionado
- **Estrutura Principal da Documentação**
  - Série completa de guias de introdução
  - Documentação abrangente de implantação e provisionamento
  - Recursos detalhados de solução de problemas e guias de depuração
  - Ferramentas e procedimentos de validação pré-implantação

- **Módulo de Introdução**
  - Fundamentos do AZD: conceitos centrais e terminologia
  - Guia de Instalação: instruções específicas para cada plataforma
  - Guia de Configuração: configuração de ambiente e autenticação
  - Tutorial do Primeiro Projeto: aprendizado prático passo a passo

- **Módulo de Implantação e Provisionamento**
  - Guia de Implantação: documentação completa de fluxo de trabalho
  - Guia de Provisionamento: Infraestrutura como Código usando Bicep
  - Melhores práticas para implantações em produção
  - Padrões de arquitetura multi-serviço

- **Módulo de Validação Pré-implantação**
  - Planejamento de Capacidade: validação da disponibilidade de recursos Azure
  - Seleção de SKU: orientação completa sobre níveis de serviço
  - Checagens pré-voo: scripts de validação automatizados (PowerShell e Bash)
  - Ferramentas para estimativa de custos e planejamento orçamentário

- **Módulo de Solução de Problemas**
  - Problemas Comuns: problemas frequentes e soluções
  - Guia de Depuração: metodologias sistemáticas para resolução de problemas
  - Técnicas e ferramentas avançadas de diagnóstico
  - Monitoramento e otimização de performance

- **Recursos e Referências**
  - Cheat Sheet de Comandos: referência rápida para comandos essenciais
  - Glossário: definições completas de terminologia e siglas
  - FAQ: respostas detalhadas para perguntas comuns
  - Links para recursos externos e conexões comunitárias

- **Exemplos e Templates**
  - Exemplo de Aplicação Web Simples
  - Template para implantação de Site Estático
  - Configuração de Aplicação em Contêiner
  - Padrões de integração com banco de dados
  - Exemplos de arquitetura de microsserviços
  - Implementações de funções serverless

#### Recursos
- **Suporte Multi-Plataforma**: Guias de instalação e configuração para Windows, macOS e Linux
- **Vários Níveis de Habilidade**: Conteúdo projetado para estudantes até desenvolvedores profissionais
- **Foco Prático**: Exemplos práticos e cenários do mundo real
- **Cobertura Abrangente**: De conceitos básicos a padrões empresariais avançados
- **Abordagem de Segurança em Primeiro Lugar**: Melhores práticas de segurança integradas
- **Otimização de Custos**: Orientação para implantações econômicas e gerenciamento de recursos

#### Qualidade da Documentação
- **Exemplos de Código Detalhados**: Amostras de código práticas e testadas
- **Instruções Passo a Passo**: Orientação clara e acionável
- **Tratamento Abrangente de Erros**: Solução de problemas para os problemas comuns
- **Integração de Melhores Práticas**: Padrões e recomendações da indústria
- **Compatibilidade de Versão**: Atualizado com os últimos serviços Azure e recursos do azd

## Melhorias Futuras Planejadas

### Versão 3.1.0 (Planejada)
#### Expansão da Plataforma de IA
- **Suporte Multi-Modelo**: Padrões de integração para Hugging Face, Azure Machine Learning e modelos personalizados
- **Frameworks de Agente IA**: Templates para implantações LangChain, Semantic Kernel e AutoGen
- **Padrões Avançados RAG**: Opções de bancos de dados vetoriais além do Azure AI Search (Pinecone, Weaviate, etc.)
- **Observabilidade de IA**: Monitoramento aprimorado para performance de modelo, uso de tokens e qualidade de respostas

#### Experiência do Desenvolvedor
- **Extensão VS Code**: Experiência integrada de desenvolvimento AZD + Microsoft Foundry
- **Integração GitHub Copilot**: Geração assistida por IA de templates AZD
- **Tutoriais Interativos**: Exercícios práticos com validação automatizada para cenários AI
- **Conteúdo em Vídeo**: Tutoriais suplementares para aprendizes visuais focados em implantações de IA

### Versão 4.0.0 (Planejada)
#### Padrões Empresariais de IA
- **Framework de Governança**: Governança, conformidade e trilhas de auditoria de modelos AI
- **IA Multi-Tenant**: Padrões para atendimento de múltiplos clientes com serviços IA isolados
- **Implantação de IA na Borda**: Integração com Azure IoT Edge e instâncias de contêiner
- **IA Híbrida em Nuvem**: Padrões de implantação multi-nuvem e híbrida para workloads de IA

#### Recursos Avançados
- **Automação de Pipeline IA**: Integração MLOps com pipelines Azure Machine Learning
- **Segurança Avançada**: Padrões zero-trust, endpoints privados e proteção contra ameaças avançadas
- **Otimização de Performance**: Estratégias avançadas de ajuste e escalonamento para aplicações IA de alta demanda
- **Distribuição Global**: Padrões de entrega de conteúdo e cache na borda para aplicações IA

### Versão 3.0.0 (Planejada) - Substituída pela Versão Atual
#### Propostas de Adições - Agora Implementadas na v3.0.0
- ✅ **Conteúdo Focado em IA**: Integração abrangente com Microsoft Foundry (Concluído)
- ✅ **Tutoriais Interativos**: Laboratório prático de workshop IA (Concluído)
- ✅ **Módulo de Segurança Avançada**: Padrões de segurança específicos para IA (Concluído)
- ✅ **Otimização de Performance**: Estratégias de ajuste de workloads de IA (Concluído)

### Versão 2.1.0 (Planejada) - Parcialmente Implementada na v3.0.0
#### Melhorias Menores - Algumas Concluídas na Versão Atual
- ✅ **Exemplos Adicionais**: Cenários de implantação focados em IA (Concluído)
- ✅ **FAQ Estendida**: Perguntas e soluções para IA (Concluído)
- **Integração de Ferramentas**: Guias aprimorados para integração com IDEs e editores
- ✅ **Expansão de Monitoramento**: Padrões específicos de IA para monitoramento e alertas (Concluído)

#### Ainda Planejado para Versão Futura
- **Documentação Responsiva para Mobile**: Design responsivo para aprendizado móvel
- **Acesso Offline**: Pacotes de documentação para download
- **Integração Aprimorada com IDE**: Extensão VS Code para AZD + fluxos de trabalho de IA
- **Painel Comunitário**: Métricas em tempo real da comunidade e rastreamento de contribuições

## Contribuindo para o Changelog

### Reportando Alterações
Ao contribuir para este repositório, certifique-se de que as entradas do changelog incluam:

1. **Número da Versão**: Seguindo versionamento semântico (major.minor.patch)
2. **Data**: Data de lançamento ou atualização no formato AAAA-MM-DD
3. **Categoria**: Adicionado, Alterado, Depreciado, Removido, Corrigido, Segurança
4. **Descrição Clara**: Descrição concisa do que foi alterado
5. **Avaliação de Impacto**: Como as mudanças afetam os usuários existentes

### Categorias de Mudança

#### Adicionado
- Novos recursos, seções de documentação ou capacidades
- Novos exemplos, templates ou recursos de aprendizado
- Ferramentas, scripts ou utilitários adicionais

#### Alterado
- Modificações em funcionalidades ou documentação existentes
- Atualizações para melhorar clareza ou precisão
- Reestruturação de conteúdo ou organização

#### Depreciado
- Recursos ou abordagens que estão sendo descontinuados
- Seções da documentação previstas para remoção
- Métodos que possuem alternativas superiores

#### Removido
- Recursos, documentação ou exemplos que não são mais relevantes
- Informações desatualizadas ou abordagens depreciadas
- Conteúdo redundante ou consolidado

#### Corrigido
- Correções de erros na documentação ou código
- Resolução de problemas ou falhas reportadas
- Melhorias na precisão ou funcionalidade

#### Segurança
- Melhorias ou correções relacionadas à segurança
- Atualizações nas melhores práticas de segurança
- Resolução de vulnerabilidades de segurança

### Diretrizes de Versionamento Semântico

#### Versão Major (X.0.0)
- Mudanças incompatíveis que exigem ação do usuário
- Reestruturação significativa de conteúdo ou organização
- Mudanças que alteram a abordagem ou metodologia fundamental

#### Versão Minor (X.Y.0)
- Novos recursos ou adições de conteúdo
- Melhorias que mantêm compatibilidade retroativa
- Exemplos, ferramentas ou recursos adicionais

#### Versão Patch (X.Y.Z)
- Correções de bugs e ajustes
- Melhorias menores em conteúdo existente
- Esclarecimentos e pequenos aprimoramentos

## Feedback e Sugestões da Comunidade

Incentivamos ativamente o feedback da comunidade para melhorar este recurso de aprendizado:

### Como fornecer feedback
- **Issues no GitHub**: Reporte problemas ou sugira melhorias (issues específicas de IA são bem-vindas)
- **Discussões no Discord**: Compartilhe ideias e participe da comunidade Microsoft Foundry
- **Pull Requests**: Contribua com melhorias diretas ao conteúdo, especialmente templates e guias de IA
- **Discord Microsoft Foundry**: Participe do canal #Azure para discussões AZD + IA
- **Fóruns Comunitários**: Participe de discussões mais amplas para desenvolvedores Azure

### Categorias de Feedback
- **Precisão do Conteúdo de IA**: Correções em informações de integração e implantação de serviços de IA
- **Experiência de Aprendizado**: Sugestões para melhorar o fluxo de aprendizado dos desenvolvedores IA
- **Conteúdo de IA Faltante**: Solicitações por templates, padrões ou exemplos adicionais de IA
- **Acessibilidade**: Melhorias para necessidades diversas de aprendizado
- **Integração de Ferramentas IA**: Sugestões para melhor integração do fluxo de trabalho de desenvolvimento IA
- **Padrões de IA em Produção**: Solicitações de padrões de implantação corporativa IA

### Compromisso de Resposta
- **Resposta a Issues**: Em até 48 horas para problemas reportados
- **Solicitações de Recursos**: Avaliação em até uma semana
- **Contribuições Comunitárias**: Revisão em até uma semana
- **Problemas de Segurança**: Prioridade imediata com resposta rápida

## Cronograma de Manutenção

### Atualizações Regulares
- **Revisões Mensais**: Precisão do conteúdo e validação de links
- **Atualizações Trimestrais**: Principais adições e melhorias de conteúdo
- **Revisões Semestrais**: Reestruturação abrangente e aprimoramentos
- **Lançamentos Anuais**: Atualizações de versão major com melhorias significativas

### Monitoramento e Garantia de Qualidade
- **Testes Automatizados**: Validação regular de exemplos de código e links
- **Integração de Feedback da Comunidade**: Incorporação regular de sugestões dos usuários
- **Atualizações Tecnológicas**: Alinhamento com os últimos serviços do Azure e lançamentos do azd
- **Auditorias de Acessibilidade**: Revisão regular para princípios de design inclusivo

## Política de Suporte de Versão

### Suporte à Versão Atual
- **Última Versão Principal**: Suporte completo com atualizações regulares
- **Versão Principal Anterior**: Atualizações de segurança e correções críticas por 12 meses
- **Versões Legadas**: Suporte da comunidade apenas, sem atualizações oficiais

### Guia de Migração
Quando versões principais são lançadas, fornecemos:
- **Guias de Migração**: Instruções passo a passo para a transição
- **Notas de Compatibilidade**: Detalhes sobre mudanças incompatíveis
- **Suporte a Ferramentas**: Scripts ou utilitários para auxiliar na migração
- **Suporte da Comunidade**: Fóruns dedicados para dúvidas sobre migração

---

**Navegação**
- **Lição Anterior**: [Guia de Estudo](resources/study-guide.md)
- **Próxima Lição**: Retornar para o [README Principal](README.md)

**Fique Atualizado**: Acompanhe este repositório para receber notificações sobre novos lançamentos e atualizações importantes dos materiais de aprendizagem.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->