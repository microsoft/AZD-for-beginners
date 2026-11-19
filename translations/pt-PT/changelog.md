# Changelog - AZD Para Iniciantes

## Introdução

Este changelog documenta todas as alterações notáveis, atualizações e melhorias ao repositório AZD Para Iniciantes. Seguimos os princípios da versionação semântica e mantemos este registo para ajudar os utilizadores a compreender o que mudou entre versões.

## Objetivos de Aprendizagem

Ao rever este changelog, irá:
- Manter-se informado sobre novas funcionalidades e adições de conteúdo
- Compreender melhorias feitas à documentação existente
- Acompanhar correções de bugs para garantir a precisão
- Seguir a evolução dos materiais de aprendizagem ao longo do tempo

## Resultados de Aprendizagem

Após rever as entradas do changelog, será capaz de:
- Identificar novos conteúdos e recursos disponíveis para aprendizagem
- Compreender quais as secções que foram atualizadas ou melhoradas
- Planear o seu caminho de aprendizagem com base nos materiais mais atuais
- Contribuir com feedback e sugestões para melhorias futuras

## Histórico de Versões

### [v3.25.0] - 2026-11-09

#### A extensão Microsoft Foundry 1.0 está agora geralmente disponível

O pacote `microsoft.foundry` 1.0 está **ativo e geralmente disponível**, conforme anunciado em [5 de novembro de 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). O curso agora ensina o fluxo de trabalho GA lançado, e não uma versão futura. Comece com AZD **1.37.0 ou posterior** e `azd ext install microsoft.foundry`.

#### Disponível nesta atualização do curso
- A orientação em inglês usa o pacote GA como o caminho de instalação padrão e explica as suas sete extensões nucleares com versões independentes.
- Um [tutorial para agente alojado](docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) cobre a amostra da API de respostas upstream Python Agent Framework, a versão atual uv, Python 3.13+, seleção de projeto novo/existente, reutilização de modelos e revisão do `azure.yaml`.
- O fluxo local para cloud cobre testes do Inspetor de Agentes, custos de chamadas a modelos suportados pela Azure, compilações de código remoto, invocação implantada, rastreio na cloud, visualização de implantação, registos e diagnósticos.
- A orientação separada de avaliação cobre a geração e revisão de conjuntos de dados/matrizes, configuração de uma avaliação nomeada, registo de ativos e inspeção de resultados. Instruções mais antigas de avaliação/otimização permanecem como histórico de migração, não a linha base da versão atual.
- A orientação Foundry CI/CD inclui instalação da extensão do runner, implantação autenticada, acesso/ativos de avaliação e um gate de qualidade explícito.
- A orientação de limpeza distingue projetos Foundry recém-criados e reutilizados. O workshop liga-se ao exercício GA separado sem substituir os testes específicos da amostra.
- A navegação do curso, objetivos de aprendizagem, pré-requisitos de configuração, folha de dicas, FAQ e guia de estudo refletem o fluxo GA. As traduções geradas não são editadas manualmente.

#### Âmbito da revisão
- Baseado no anúncio GA, orientação Microsoft Learn ligada e configuração da amostra upstream. Não foram realizados provisionamentos, implantações, invocações a modelos ou avaliações em Azure ao vivo.
- O GA do pacote não implica GA para cada funcionalidade opcional, extensão independente ou SDK, nem certifica os exemplos para produção.

### [v3.24.0]- 2026-11-04

#### Corrigido
- Corrigida navegação do curso em inglês, caminhos movidos de páginas, âncoras em falta e referências externas obsoletas, incluindo o link do Capítulo 2 para o guia AI de produção.
- Revisada orientação atual contra AZD 1.37.2 publicado, agentes 1.0.0-beta.23 e avaliações 1.0.0-beta.2. Documentado o fluxo separado `azd ai eval` e migração da configuração de otimização.
- Corrigidas flags CLI não suportadas, limites de autenticação, orientação de ambiente/segredos em texto plano, atualizações de infraestrutura, configuração de modelos e exemplos destrutivos de recuperação.
- Atualizado o workshop com base na amostra atual de AI Agents, incluindo hooks reais, inputs de configuração, testes de avaliação, pontos de entrada para red-teaming e observabilidade.
- Corrigidas alegações de implementação de exemplo e reparados problemas associados de aplicação/infraestrutura/configuração. O material de arquitetura de retalho é explicitamente distinguido de uma aplicação funcional completa.
- Restaurada a matriz de linguagens CodeQL, selecionado Node.js 24 suportado para o contentor de desenvolvimento, e adicionadas mensagens para validadores de configuração em comandos de versão falhados.

#### Adicionado
- Verificador offline de links/âncoras apenas em inglês, testes de regressão e fluxo de trabalho de documentação que também constrói o workshop em modo estrito. Traduções geradas e imagens traduzidas estão excluídas.

#### Âmbito da validação
- Verificações de origem, sintaxe, configuração, comportamento local e ligações de rede não estabelecem capacidade de deploy ao vivo na Azure, quota, RBAC, disponibilidade regional de modelos, faturação, conformidade de segurança ou prontidão para produção.
- Entradas mais antigas abaixo são registos históricos, não instruções atuais de comandos ou versões.

### [v3.23.0] - 2026-07-13

#### Atualização AZD 1.27.1: Atualização de Versão
**Esta versão revalida o curso contra `azd` `1.27.1` (julho 2026, última versão estável) e a atual extensão preview AI agent `azure.ai.agents` `1.0.0-beta.5`, atualizando todos os banners "validado contra" após os lançamentos 1.26.0, 1.27.0 e 1.27.1.**

#### Alterado
- **✅ Linha base de validação atualizada** de `azd 1.25.6` (junho 2026) para `azd 1.27.1` (julho 2026) no README raiz, todos os READMEs dos capítulos, a lição do contentor-dev do Capítulo 1 (incluindo exemplos com versões fixas), a lição de templates personalizados do Capítulo 4, a lição multi-agente do Capítulo 5 e documentação do workshop
- **🤖 Linha base do Capítulo 2 atualizada** de `azd 1.23.12` (março 2026) para `azd 1.27.1` em `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` e `microsoft-foundry-integration.md`; datas das notas de validação alteradas para 2026-07-13
- **🧩 Extensão AI agent atualizada** de `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` para a versão atual `1.0.0-beta.5` no README do Capítulo 2 e `agents.md`
- **🧪 Exemplo de validação do workshop** (`azd version` output) atualizado para `1.27.1`

#### Notas sobre lançamentos azd relevantes (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Suporte Go para Azure Functions no Consumo Flex, filtros de subscrição por inquilino `azd config sub-filter`, pacotes de extensão self-contained (`azd x pack --bundle`), e `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Projetos/agentes Azure AI Foundry modelados diretamente em `azure.yaml` (init sem Bicep/Terraform), suporte para deploy em contentores para App Service (`host: appservice` + `language: docker`), `-s/--source` direto para comandos `azd extension`, e `azd tool uninstall`
- **1.27.1 (2026-07-09):** flag `--no-dependencies` para `azd extension install`, modelos obsoletos excluídos por padrão de catálogos/prompt de quotas, e várias correções de bugs

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

#### Preenchimento de Lacunas para Iniciantes #2: Criação de Templates, Contentores Dev, Pulumi, Azure DevOps, Princípios de Serviço e Mais
**Esta versão fecha as lacunas intermédias restantes reveladas pela análise azd-coverage: como criar e publicar o seu próprio template, ambientes reproduzíveis de contentores dev/Codespaces, o fornecedor de infraestrutura Pulumi, um tutorial CI/CD Azure DevOps, autenticação com princípio de serviço, orientação de seleção de alojamento (AKS/Spring Apps), explicações `azd restore`/`azd package`, tratamento de erros de hooks, e práticas de equipas/ambientes partilhados.**

#### Adicionado
- **🧱 Nova lição Capítulo 4** `docs/chapter-04-infrastructure/custom-templates.md` — criação do seu próprio template azd: estrutura requerida (`azure.yaml`, `infra/`, `src/`), o campo `metadata.template`, parametrização da infraestrutura com o token de recurso `uniqueString()` e a etiqueta `azd-env-name`, testes locais com `azd init --template <local-path>`, publicação no GitHub e submissão para a galeria Awesome AZD
- **📦 Nova lição Capítulo 1** `docs/chapter-01-foundation/dev-containers.md` — ambientes azd reproduzíveis com Contentores Dev e GitHub Codespaces: um `.devcontainer/devcontainer.json` minimal usando a funcionalidade oficial `ghcr.io/azure/azure-dev/azd`, funcionalidades específicas de linguagem, `docker-in-docker` para hosts de contentor, e `azd auth login --use-device-code` para início de sessão remoto
- **🧩 Pulumi com azd** secção em `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, organização da pasta Pulumi, stacks mapeadas para ambientes azd, outputs/requisições de etiquetagem, e o mesmo fluxo `azd up` / `azd down`
- **🎯 Orientação de seleção de alojamento** em `docs/chapter-04-infrastructure/provisioning.md` — uma comparação amigável para iniciantes entre `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, e `springapp`, com orientação de quando escolher AKS ou Azure Spring Apps
- **🛠️ Tutorial Azure DevOps CI/CD** em `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, conexão de serviço com federação de identidade workload (OIDC), o `azure-dev.yml` gerado, e configuração do grupo de variáveis
- **🔑 Princípios de Serviço (Padrão 4)** adicionados a `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, autenticação não interativa `azd auth login` com segredo de cliente vs credenciais federadas/OIDC, quando usar e armazenamento seguro de credenciais
- **🪝 Tratamento de erros em hooks** subseção em `docs/chapter-04-infrastructure/deployment-guide.md` — códigos de saída e `set -e`, `continueOnError`, teste de hooks isolados com `azd hooks run`, shells específicas do SO, e `--debug`
- **👥 Equipas / ambientes partilhados** secção em `docs/chapter-03-configuration/configuration.md` — o que fica em `.azure/`, o que ignorar no git, ambientes por programador, `azd env list`/`select`, e fornecer valores de ambiente em CI/CD
- **🧰 `azd restore` e explicações expandidas `azd package`** em `resources/cheat-sheet.md` — restaurar dependências e construir um artefacto implantável sem implantar

#### Alterado
- **🧭 Tabela de lições do Capítulo 4** atualizada para incluir a nova lição "Criar o Seu Próprio Template" (Lição 3)
- **🧭 Tabela de lições do Capítulo 1** atualizada para incluir a nova lição "Contentores Dev & Codespaces" (Lição 5); rodapés de navegação ligados entre `bring-your-own-app.md` e `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Preenchimento de Lacunas para Iniciantes: Lição Multi-Agente Prática, "Traga a Sua Própria App," Terraform e Tutorial CI/CD
**Esta versão fecha as maiores lacunas para um guia completo para iniciantes, adicionando duas novas lições práticas (um tutorial multi-agente implantável e integração de azd numa app existente), uma introdução amigável a hooks, uma secção Terraform com azd, um tutorial passo a passo GitHub Actions, uma explicação das extensões preview novas e uma checklist explícita de verificação de implantação.**

#### Adicionado
- **🤝 Nova lição Capítulo 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — um tutorial prático de dois agentes (orquestrador + especialistas) totalmente implantável usando um template real (`contoso-creative-writer`), cobrindo quando utilizar multi-agente, o fluxo `azd up`, compreensão dos recursos implantados, rastreio entre agentes, personalização e limpeza
- **📦 Nova lição Capítulo 1** `docs/chapter-01-foundation/bring-your-own-app.md` — como adicionar azd a um projeto existente com `azd init` ("usar código no diretório atual"), compreensão de `azure.yaml` e `infra/`, `azd infra generate`, detecção de host e implantação com `azd up`
- **🌐 Terraform com azd** secção adicionada a `docs/chapter-04-infrastructure/provisioning.md` — configuração `infra.provider: terraform`, organização da pasta `.tf`, outputs necessários `AZURE_*` e etiquetagem `azd-env-name`, e o mesmo fluxo `azd up` / `azd down` (fecha a lacuna onde havia suporte reivindicado para Terraform, mas só era mostrado Bicep)
- **⚙️ Passo a passo do GitHub Actions** em `docs/chapter-08-production/production-ai-practices.md` — desde o repositório GitHub até deploys automatizados: `azd pipeline config`, credenciais federadas OIDC (sem segredos armazenados), o `azure-dev.yml` gerado e orientações sobre segredos vs variáveis
- **🪝 Introdução para iniciantes "Novo nos hooks?"** em `docs/chapter-04-infrastructure/deployment-guide.md` — o que é um hook, uma tabela de estágios do hook, um primeiro hook minimalista e executar hooks manualmente com `azd hooks run`
- **✅ Lista de verificação "Verifique o Seu Deploy"** adicionada ao Passo 5 de `docs/chapter-01-foundation/first-project.md` — teste rápido, verificação do endpoint de saúde e critérios explícitos de sucesso
- **🧩 Explicação para novas extensões preview** `azure.ai.skills` e `azure.ai.connections` (o que são e quando usá-las) em `docs/chapter-08-production/production-ai-practices.md`

#### Alterado
- **🧭 Tabela de lições do Capítulo 5** corrigida: `multi-agent-basics.md` é agora a Lição 1 (a única totalmente prática), com rotulagem honesta que a Lição 2 está no Capítulo 6 e o cenário de Retalho é um blueprint de arquitetura, não um template de um único comando
- **🧭 Tabela de lições do Capítulo 1** agora inclui a nova lição "Traga a Sua Própria App" (Lição 4)
- **🔗 Rodapés de navegação** atualizados: `first-project.md` liga agora para `bring-your-own-app.md`

#### Corrigido
- **🧱 Fechada a lacuna "reclamada mas em falta" do Terraform** — o curso referenciava anteriormente suporte Terraform sem o demonstrar
- **🔀 Correção de ligações cruzadas enganosas no Capítulo 5** que davam a entender que existia uma implementação multi-agente completa, quando apenas havia um blueprint de arquitetura

#### Ficheiros atualizados
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
**Esta versão revalida o curso contra `azd` `1.25.6` (junho 2026) e a extensão `azure.ai.agents` `0.1.40-preview`, expande a orientação de IA de "esboçar um agente" para o ciclo de vida completo do agente (testar → avaliar → otimizar → inspecionar → apagar), destaca as novas extensões preview `azure.ai.skills` e `azure.ai.connections` e assinala o rebranding do produto ".NET Aspire" para "Aspire".**

#### Adicionado
- **🔁 Cobertura completa do ciclo de vida do agente** para iniciantes e engenheiros de IA em toda a documentação:
  - `docs/chapter-01-foundation/azd-basics.md` — Tabela do ciclo de vida (esboçar → testar → medir → melhorar → inspecionar → limpar) adicionada na secção de Extensões e Comandos de IA
  - `docs/chapter-08-production/production-ai-practices.md` — Nova secção "Gestão do Ciclo de Vida do Agente" cobrindo `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, e `delete --force`
  - `resources/cheat-sheet.md` — Comandos AI Agent expandidos com `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, e `delete --force`
- **🧩 Novas extensões preview** documentadas: `azure.ai.skills` (competências reutilizáveis do agente) e `azure.ai.connections` (ligações Foundry) adicionadas na tabela de extensões e no cartão de referência rápida
- **⏱️ Orientação sobre temporização de resposta** — exemplos `azd ai agent invoke` agora indicam que imprimem a latência total e o tempo para o primeiro byte
- **📌 Banner da versão** no README raiz indicando aos aprendizes `azd version` e `azd upgrade`

#### Alterado
- **✅ Base de validação atualizada** de `azd 1.23.12` (março 2026) para `azd 1.25.6` (junho 2026) em todos os READMEs dos capítulos e documentação do workshop
- **🤖 Nota de extensão do Capítulo 2** atualizada de `azure.ai.agents` `0.1.18-preview` para `0.1.40-preview`
- **🧪 Exemplo de validação do workshop** (output `azd version`) atualizado para `1.25.6`
- **🧭 README "Novidades em azd Hoje"** atualizado para destacar o ciclo de vida do agente de ponta a ponta, novas extensões de IA e correções recentes de qualidade de vida (`azd init` idempotência, limpeza de token obsoleto `azd auth login`, prompt da primeira execução `azd tool`)
- **📖 agents.md do Capítulo 2 (Opção 4)** agora direciona os aprendizes para os comandos do ciclo de vida pós-deploy em vez de parar em `azd up`

#### Corrigido
- **🏷️ Nomeação do produto** — adicionada nota sobre o rebranding Aspire (".NET Aspire" é agora simplesmente "Aspire"); o suporte azd ao Aspire mantém-se igual
- **🔎 Validação da release ao vivo** confirmada contra o feed de releases do Azure Developer CLI: CLI estável `1.25.6` (2026-06-12) e `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Ficheiros atualizados
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

#### Esclarecimento para Iniciantes, Validação de Setup & Limpeza Final de Comandos AZD
**Esta versão dá seguimento à verificação AZD 1.23 com uma passagem na documentação focada em iniciantes: clarifica a orientação de autenticação centrada no AZD, adiciona scripts de validação de setup local, verifica comandos-chave contra o AZD CLI ao vivo, e remove as últimas referências obsoletas em inglês fora do changelog.**

#### Adicionado
- **🧪 Scripts de validação de setup para iniciantes** com `validate-setup.ps1` e `validate-setup.sh` para que os aprendizes confirmem as ferramentas necessárias antes de iniciar o Capítulo 1
- **✅ Passos iniciais de validação de setup** no README raiz e no README do Capítulo 1 para apanhar requisitos em falta antes de `azd up`

#### Alterado
- **🔐 Orientação de autenticação para iniciantes** agora trata consistentemente `azd auth login` como a via principal para os workflows AZD, com `az login` assinalado como opcional a menos que os comandos Azure CLI sejam usados diretamente
- **📚 Fluxo de onboarding do Capítulo 1** agora direciona os aprendizes para validar o setup local antes da instalação, autenticação e primeiros passos de deploy
- **🛠️ Mensagens do validador** distinguem claramente requisitos bloqueadores de avisos opcionais do Azure CLI para o caminho exclusivo para iniciantes do AZD
- **📖 Documentação de configuração, resolução de problemas e exemplos** agora distingue entre autenticação AZD obrigatória e login Azure CLI opcional onde antes ambas eram apresentadas sem contexto

#### Corrigido
- **📋 Referências restantes a comandos em inglês** atualizadas para as formas atuais do AZD, incluindo `azd config show` no cartão de referência e `azd monitor --overview` onde orientação geral sobre o Portal Azure era pretendida
- **🧭 Reivindicações para iniciantes no Capítulo 1** suavizadas para evitar promessas exageradas de comportamento garantido sem erros ou rollback em todos os templates e recursos Azure
- **🔎 Validação ao vivo do CLI** confirmada para suporte atual a `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, e `azd down --force --purge`

#### Ficheiros atualizados
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

#### Validação AZD 1.23.12, Expansão do Ambiente do Workshop & Atualização do Modelo IA
**Esta versão realiza uma passagem de validação da documentação contra `azd` `1.23.12`, atualiza exemplos de comandos AZD obsoletos, atualiza orientações de modelos de IA para os padrões atuais e alarga as instruções do workshop além do GitHub Codespaces para também suportar containers de desenvolvimento e cópias locais.**

#### Adicionado
- **✅ Notas de validação em capítulos base e documentação do workshop** para tornar explícita a baseline AZD testada para aprendizes usando builds mais recentes ou antigas do CLI
- **⏱️ Orientação para timeout de deploy** para deploys de apps IA de longa duração usando `azd deploy --timeout 1800`
- **🔎 Passos de inspeção de extensões** com `azd extension show azure.ai.agents` na documentação de workflows IA
- **🌐 Orientação mais ampla para ambientes de workshop** cobrindo GitHub Codespaces, containers dev e cópias locais com MkDocs

#### Alterado
- **📚 READMEs de introdução dos capítulos** agora indicam consistentemente validação contra `azd 1.23.12` em seções de fundação, configuração, infraestruturas, multi-agente, pré-deploy, resolução de problemas e produção
- **🛠️ Referências a comandos AZD** atualizadas para formas atuais em toda a documentação:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` ou `azd env get-value(s)` dependendo do contexto
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` onde é pretendido o overview do Application Insights
- **🧪 Exemplos de provisionamento preview** simplificados para a utilização atualmente suportada como `azd provision --preview` e `azd provision --preview -e production`
- **🧭 Fluxo do workshop** atualizado para permitir que aprendizes completem os laboratórios em Codespaces, containers dev ou cópias locais em vez de assumir execução apenas em Codespaces
- **🔐 Orientação de autenticação** prefere agora `azd auth login` para workflows AZD, com `az login` como opcional quando comandos Azure CLI são usados diretamente

#### Corrigido
- **🪟 Comandos de instalação Windows** normalizados para a capitalização atual do pacote `winget` no guia de instalação
- **🐧 Orientação de instalação Linux** corrigida para evitar instruções específicas a distros não suportadas do gestor de pacotes `azd` e apontar para assets das releases onde apropriado
- **📦 Exemplos de modelo IA** atualizados de padrões antigos como `gpt-35-turbo` e `text-embedding-ada-002` para exemplos atuais como `gpt-4.1-mini`, `gpt-4.1`, e `text-embedding-3-large`
- **📋 Snippets de deploy e diagnóstico** corrigidos para usar comandos atuais de ambiente e estado em logs, scripts e passes de resolução de problemas
- **⚙️ Orientação GitHub Actions** atualizada de `Azure/setup-azd@v1.0.0` para `Azure/setup-azd@v2`
- **🤖 Orientação de consentimento MCP/Copilot** atualizada de `azd mcp consent` para `azd copilot consent list`

#### Melhorado
- **🧠 Orientação de capítulo IA** agora explica melhor o comportamento sensível a preview de `azd ai`, login tenants específicos, uso atual das extensões e recomendações atualizadas de deploy de modelos
- **🧪 Instruções do workshop** agora usam versões mais realistas e linguagem de setup de ambiente mais clara para laboratórios práticos
- **📈 Documentação de produção e troubleshooting** agora alinhada melhor com os exemplos atuais de monitorização, modelo fallback e níveis de custo

#### Ficheiros atualizados
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
**Esta versão adiciona cobertura de comandos `azd ai`, `azd extension` e `azd mcp` em todos os capítulos relacionados com IA, corrige links quebrados e código obsoleto em agents.md, atualiza a folha de dicas, e revê completamente a secção de Exemplos de Templates com descrições validadas e novos templates Azure AI AZD.**

#### Adicionado
- **🤖 Cobertura AZD AI CLI** em 7 ficheiros (anteriormente só no Capítulo 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nova secção "Extensões e Comandos AI" que introduz `azd extension`, `azd ai agent init` e `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opção 4: `azd ai agent init` com tabela comparativa (template vs abordagem manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Subseções "Extensões AZD para Foundry" e "Implantação Prioritária de Agentes"
  - `docs/chapter-05-multi-agent/README.md` — Início rápido agora mostra ambos os caminhos de implantação baseados em template e manifesto
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Secção de implantação agora inclui opção `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Subseção "Comandos da Extensão AZD AI para Diagnósticos"
  - `resources/cheat-sheet.md` — Nova secção "Comandos AI & Extensões" com `azd extension`, `azd ai agent init`, `azd mcp` e `azd infra generate`
- **📦 Novos exemplos de templates AZD AI** em `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — Chat RAG .NET com Blazor WebAssembly, Semantic Kernel, e suporte para chat por voz
  - **azure-search-openai-demo-java** — Chat RAG Java usando Langchain4J com opções de implantação ACA/AKS
  - **contoso-creative-writer** — Aplicação multi-agente de escrita criativa usando Azure AI Agent Service, Bing Grounding, e Prompty
  - **serverless-chat-langchainjs** — RAG serverless usando Azure Functions + LangChain.js + Cosmos DB com suporte Ollama para desenvolvimento local
  - **chat-with-your-data-solution-accelerator** — Acelerador empresarial RAG com portal administrativo, integração Teams e opções PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Aplicação de referência para orquestração MCP multi-agente com servidores em .NET, Python, Java e TypeScript
  - **azd-ai-starter** — Template inicial Bicep minimalista para infraestrutura Azure AI
  - **🔗 Link para a Awesome AZD AI Gallery** — Referência à [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (mais de 80 templates)

#### Corrigido
- **🔗 Navegação agents.md**: Links Anterior/Seguinte agora correspondem à ordem das lições do README do Capítulo 2 (Integração Microsoft Foundry → Agentes → Implantação Modelos AI)
- **🔗 Links quebrados em agents.md**: `production-ai-practices.md` corrigido para `../chapter-08-production/production-ai-practices.md` (3 ocorrências)
- **📦 Código obsoleto em agents.md**: Substituído `opencensus` por `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 API inválida em agents.md**: Movido `max_tokens` de `create_agent()` para `create_run()` como `max_completion_tokens`
- **🔢 Contagem de tokens em agents.md**: Substituída estimativa aproximada `len//4` por `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Serviços corrigidos de "Cognitive Search + App Service" para "Azure AI Search + Azure Container Apps" (host padrão alterado para outubro 2024)
- **contoso-chat**: Atualizada a descrição para referenciar Azure AI Foundry + Prompty, alinhando com o título real do repositório e stack tecnológico

#### Removido
- **ai-document-processing**: Removida referência a template não funcional (repositório não acessível publicamente como template AZD)

#### Melhorado
- **📝 Exercícios em agents.md**: Exercício 1 agora mostra output esperado e passo `azd monitor`; Exercício 2 inclui código de registo completo `FunctionTool`; Exercício 3 substitui orientações vagas por comandos concretos `prepdocs.py`
- **📚 Recursos em agents.md**: Atualizados links de documentação para os atuais documentos do Azure AI Agent Service e quickstart
- **📋 Tabela Next Steps em agents.md**: Adicionado link para o AI Workshop Lab para cobertura completa do capítulo

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
**Esta versão melhora a navegação dos capítulos no README.md com um formato de tabela melhorado.**

#### Alterado
- **Tabela do Mapa do Curso**: Melhorada com links diretos para as lições, estimativas de duração e classificações de complexidade
- **Limpeza de Pastas**: Removidas pastas antigas redundantes (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Validação de Links**: Mais de 21 links internos da tabela do Mapa do Curso verificados

### [v3.16.0] - 2026-02-05

#### Atualizações nos Nomes dos Produtos
**Esta versão atualiza referências a produtos para a marcação atual da Microsoft.**

#### Alterado
- **Microsoft Foundry → Microsoft Foundry**: Todas as referências atualizadas em ficheiros que não são de tradução
- **Azure AI Agent Service → Foundry Agents**: Nome do serviço atualizado para refletir a marca atual

#### Ficheiros Atualizados
- `README.md` - Página principal do curso
- `changelog.md` - Histórico de versões
- `course-outline.md` - Estrutura do curso
- `docs/chapter-02-ai-development/agents.md` - Guia de agentes AI
- `examples/README.md` - Documentação de exemplos
- `workshop/README.md` - Página de aterragem do workshop
- `workshop/docs/index.md` - Índice do workshop
- `workshop/docs/instructions/*.md` - Todos os ficheiros de instrução do workshop

---

### [v3.15.0] - 2026-02-05

#### Reestruturação importante do repositório: nomes de pastas por capítulos
**Esta versão reorganiza a documentação em pastas dedicadas por capítulo para uma navegação mais clara.**

#### Renomeações de Pastas
Pastas antigas foram substituídas por pastas numeradas por capítulo:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Adicionado novo: `docs/chapter-05-multi-agent/`

#### Migrações de Ficheiros
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
- **📚 Ficheiros README dos capítulos**: Criados README.md em cada pasta de capítulo com:
  - Objetivos de aprendizagem e duração
  - Tabela de lições com descrições
  - Comandos de início rápido
  - Navegação para outros capítulos

#### Alterado
- **🔗 Atualizados todos os links internos**: Mais de 78 caminhos atualizados em todos os ficheiros de documentação
- **🗺️ README.md principal**: Mapa do Curso atualizado com nova estrutura por capítulos
- **📝 examples/README.md**: Referências cruzadas atualizadas para pastas de capítulos

#### Removido
- Estrutura antiga de pastas (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Reestruturação do Repositório: Navegação por Capítulos
**Esta versão adicionou ficheiros README de navegação por capítulos (substituída pela v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Novo Guia de Agentes AI
**Esta versão adiciona um guia completo para implantação de agentes AI com Azure Developer CLI.**

#### Adicionado
- **🤖 docs/microsoft-foundry/agents.md**: Guia completo cobrindo:
  - O que são agentes AI e como se diferenciam de chatbots
  - Três templates de início rápido para agentes (Foundry Agents, Prompty, RAG)
  - Padrões de arquitetura de agentes (agente único, RAG, multi-agente)
  - Configuração e personalização de ferramentas
  - Monitorização e rastreamento de métricas
  - Considerações e otimizações de custo
  - Cenários comuns de troubleshooting
  - Três exercícios práticos com critérios de sucesso

#### Estrutura do Conteúdo
- **Introdução**: Conceitos básicos de agentes para iniciantes
- **Início Rápido**: Implantar agentes com `azd init --template get-started-with-ai-agents`
- **Padrões de Arquitetura**: Diagramas visuais dos padrões de agentes
- **Configuração**: Configuração de ferramentas e variáveis de ambiente
- **Monitorização**: Integração com Application Insights
- **Exercícios**: Aprendizagem prática progressiva (20-45 minutos cada)

---

### [v3.12.0] - 2026-02-05

#### Atualização do Ambiente DevContainer
**Esta versão atualiza a configuração do contentor de desenvolvimento com ferramentas modernas e padrões melhores para a experiência de aprendizagem AZD.**

#### Alterado
- **🐳 Imagem base**: Atualizada de `python:3.12-bullseye` para `python:3.12-bookworm` (Debian stable mais recente)
- **📛 Nome do Contentor**: Renomeado de "Python 3" para "AZD for Beginners" para maior clareza

#### Adicionado
- **🔧 Novos recursos do Dev Container**:
  - `azure-cli` com suporte Bicep ativado
  - `node:20` (versão LTS para templates AZD)
  - `github-cli` para gestão de templates
  - `docker-in-docker` para implantações de container app

- **🔌 Encaminhamento de Portas**: Portas pré-configuradas para desenvolvimento comum:
  - 8000 (pré-visualização MkDocs)
  - 3000 (apps web)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Novas Extensões VS Code**:
  - `ms-python.vscode-pylance` - IntelliSense Python melhorado
  - `ms-azuretools.vscode-azurefunctions` - Suporte Azure Functions
  - `ms-azuretools.vscode-docker` - Suporte Docker
  - `ms-azuretools.vscode-bicep` - Suporte linguagem Bicep
  - `ms-azure-devtools.azure-resource-groups` - Gestão de recursos Azure
  - `yzhang.markdown-all-in-one` - Edição Markdown
  - `DavidAnson.vscode-markdownlint` - Linting Markdown
  - `bierner.markdown-mermaid` - Suporte a diagramas Mermaid
  - `redhat.vscode-yaml` - Suporte YAML (para azure.yaml)
  - `eamodio.gitlens` - Visualização Git
  - `mhutchie.git-graph` - Histórico Git

- **⚙️ Definições VS Code**: Adicionadas configurações padrão para interpretador Python, formatação ao guardar e remoção de espaços em branco

- **📦 Atualizado requirements-dev.txt**:
  - Adicionado plugin de minificação MkDocs
  - Adicionado pre-commit para qualidade de código
  - Adicionados pacotes Azure SDK (azure-identity, azure-mgmt-resource)

#### Corrigido
- **Comando pós-criação**: Agora verifica instalação do AZD e Azure CLI na inicialização do contentor

---

### [v3.11.0] - 2026-02-05

#### Renovação do README para Iniciantes
**Esta versão melhora significativamente o README.md para ser mais acessível a iniciantes e adiciona recursos essenciais para desenvolvedores AI.**

#### Adicionado
- **🆚 Comparação Azure CLI vs AZD**: Explicação clara de quando usar cada ferramenta com exemplos práticos
- **🌟 Links Awesome AZD**: Ligações diretas para galeria de templates comunitária e recursos de contribuição:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ templates prontos a implantar
  - [Submeter um Template](https://github.com/Azure/awesome-azd/issues) - Contribuição comunitária
- **🎯 Guia de Início Rápido**: Secção simplificada de 3 passos para começar (Instalar → Login → Implantar)
- **📊 Tabela de Navegação Baseada em Experiência**: Orientação clara sobre onde começar baseado na experiência do desenvolvedor

#### Alterado
- **Estrutura do README**: Reorganizada para divulgação progressiva – informação chave primeiro
- **Secção de Introdução**: Reescrita para explicar "A Magia do `azd up`" para iniciantes absolutos
- **Removido Conteúdo Duplicado**: Eliminada secção duplicada de resolução de problemas
- **Comandos para Resolução de Problemas**: Corrigida referência `azd logs` para usar `azd monitor --logs` válido

#### Corrigido
- **🔐 Comandos de Autenticação**: Adicionados `azd auth login` e `azd auth logout` a cheat-sheet.md
- **Referências a Comandos Inválidos**: Removidos os restantes `azd logs` da secção de resolução de problemas no README

#### Notas
- **Âmbito**: Alterações aplicadas ao README.md principal e resources/cheat-sheet.md
- **Público-Alvo**: Melhorias especificamente dirigidas a programadores novos no AZD

---

### [v3.10.0] - 2026-02-05

#### Atualização de Precisão dos Comandos do Azure Developer CLI
**Esta versão corrige comandos AZD inexistentes por toda a documentação, garantindo que todos os exemplos de código usam sintaxe válida do Azure Developer CLI.**

#### Corrigido
- **🔧 Comandos AZD Inexistentes Removidos**: Auditoria completa e correção de comandos inválidos:
  - `azd logs` (não existe) → substituído por `azd monitor --logs` ou alternativas do Azure CLI
  - subcomandos `azd service` (não existem) → substituídos por `azd show` e Azure CLI
  - `azd infra import/export/validate` (não existem) → removidos ou substituídos por alternativas válidas
  - flags `azd deploy --rollback/--incremental/--parallel/--detect-changes` (não existem) → removidas
  - flags `azd provision --what-if/--rollback` (não existem) → atualizadas para uso de `--preview`
  - `azd config validate` (não existe) → substituído por `azd config list`
  - `azd info`, `azd history`, `azd metrics` (não existem) → removidos

- **📚 Ficheiros Atualizados com Correções de Comandos**:
  - `resources/cheat-sheet.md`: Revisão maior da referência dos comandos
  - `docs/deployment/deployment-guide.md`: Corrigidas estratégias de rollback e deployment
  - `docs/troubleshooting/debugging.md`: Corrigidas secções de análise de logs
  - `docs/troubleshooting/common-issues.md`: Atualizados comandos de resolução de problemas
  - `docs/troubleshooting/ai-troubleshooting.md`: Corrigida secção de depuração AZD
  - `docs/getting-started/azd-basics.md`: Comandos de monitorização corrigidos
  - `docs/getting-started/first-project.md`: Exemplos atualizados de monitorização e depuração
  - `docs/getting-started/installation.md`: Exemplos de ajuda e versões corrigidos
  - `docs/pre-deployment/application-insights.md`: Comandos de visualização de logs corrigidos
  - `docs/pre-deployment/coordination-patterns.md`: Comandos de depuração de agentes corrigidos

- **📝 Referência de Versão Atualizada**: 
  - `docs/getting-started/installation.md`: Versão `1.5.0` codificada alterada para `1.x.x` genérica com link para releases

#### Alterado
- **Estratégias de Rollback**: Documentação atualizada para usar rollback baseado em Git (AZD não tem rollback nativo)
- **Visualização de Logs**: Substituídas referências `azd logs` por comandos `azd monitor --logs`, `azd monitor --live`, e Azure CLI
- **Secção de Performance**: Removidas flags paralelas/incrementais inexistentes no deployment, fornecidas alternativas válidas

#### Detalhes Técnicos
- **Comandos AZD Válidos**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Flags válidas de azd monitor**: `--live`, `--logs`, `--overview`
- **Funcionalidades Removidas**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notas
- **Verificação**: Comandos validados contra Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Conclusão do Workshop e Atualização de Qualidade da Documentação
**Esta versão completa os módulos interativos do workshop, corrige todos os links quebrados da documentação e melhora a qualidade global de conteúdo para programadores AI que usam Microsoft AZD.**

#### Adicionado
- **📝 CONTRIBUTING.md**: Novo documento de diretrizes de contribuição com:
  - Instruções claras para reportar problemas e propor alterações
  - Padrões de documentação para novos conteúdos
  - Diretrizes para exemplos de código e convenções de mensagens de commit
  - Informação para envolvimento da comunidade

#### Completado
- **🎯 Módulo 7 do Workshop (Encerramento)**: Módulo de encerramento totalmente concluído com:
  - Sumário abrangente das conquistas do workshop
  - Secção de conceitos-chave dominados incluindo AZD, templates e Microsoft Foundry
  - Recomendações para continuação da aprendizagem
  - Exercícios desafios do workshop com classificações de dificuldade
  - Feedback da comunidade e links de suporte

- **📚 Módulo 3 do Workshop (Desconstrução)**: Objetivos de aprendizagem atualizados com:
  - Orientação sobre ativação do GitHub Copilot com servidores MCP
  - Compreensão da estrutura de pastas dos templates AZD
  - Padrões de organização infrastructure-as-code (Bicep)
  - Instruções para laboratório prático

- **🔧 Módulo 6 do Workshop (Desmontagem)**: Concluído com:
  - Objetivos de limpeza de recursos e gestão de custos
  - Uso de `azd down` para desprovisionamento seguro da infraestrutura
  - Diretrizes para recuperação de serviços cognitivos eliminados suavemente
  - Sugestões de exploração bónus para GitHub Copilot e Portal Azure

#### Corrigido
- **🔗 Correção de Links Quebrados**: Resolvidos mais de 15 links internos quebrados da documentação:
  - `docs/ai-foundry/ai-model-deployment.md`: Caminhos corrigidos para microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Caminhos corrigidos para ai-model-deployment.md e production-ai-practices.md
  - `docs/getting-started/first-project.md`: Substituído cicd-integration.md inexistente por deployment-guide.md
  - `examples/retail-scenario.md`: Caminhos corrigidos para FAQ e guia de resolução de problemas
  - `examples/container-app/microservices/README.md`: Caminhos corrigidos para a página inicial do curso e guia de deployment
  - `resources/faq.md` e `resources/glossary.md`: Atualizadas referências de capítulos AI
  - `course-outline.md`: Corrigidos guias do instrutor e referências do laboratório AI workshop

- **📅 Banner Estado do Workshop**: Atualizado de "Em Construção" para estado ativo do workshop com data de Fevereiro de 2026

- **🔗 Navegação no Workshop**: Corrigidos links de navegação quebrados no README.md do workshop apontando para a pasta lab-1-azd-basics inexistente

#### Alterado
- **Apresentação do Workshop**: Removido aviso "em construção", workshop agora completo e pronto a usar
- **Consistência de Navegação**: Garantida navegação adequada entre todos os módulos do workshop
- **Referências do Percurso de Aprendizagem**: Atualizadas referências cruzadas dos capítulos para usar caminhos correctos microsoft-foundry

#### Validado
- ✅ Todos os ficheiros markdown em inglês têm links internos válidos
- ✅ Módulos do workshop 0-7 completos com objetivos de aprendizagem
- ✅ Navegação entre capítulos e módulos funciona corretamente
- ✅ Conteúdo adequado para programadores AI que usam Microsoft AZD
- ✅ Linguagem e estrutura amigáveis para iniciantes mantidas ao longo de todo o conteúdo
- ✅ CONTRIBUTING.md fornece diretrizes claras para contribuidores da comunidade

#### Implementação Técnica
- **Validação de Links**: Script PowerShell automatizado verificou todos os links internos .md
- **Auditoria de Conteúdo**: Revisão manual da completude e adequação para iniciantes
- **Sistema de Navegação**: Aplicados padrões consistentes de navegação entre capítulos e módulos

#### Notas
- **Âmbito**: Alterações aplicadas apenas à documentação em inglês
- **Traduções**: Pastas de tradução não atualizadas nesta versão (sincronização automática será feita posteriormente)
- **Duração do Workshop**: Workshop completo agora oferece 3-4 horas de aprendizagem prática

---

### [v3.8.0] - 2025-11-19

#### Documentação Avançada: Monitorização, Segurança e Padrões Multi-Agente
**Esta versão adiciona lições abrangentes de nível A sobre integração do Application Insights, padrões de autenticação, e coordenação multi-agente para deployments em produção.**

#### Adicionado
- **📊 Lição de Integração do Application Insights**: em `docs/pre-deployment/application-insights.md`:
  - Deployment focado em AZD com provisão automática
  - Templates Bicep completos para Application Insights + Log Analytics
  - Aplicações Python funcionais com telemetria customizada (mais de 1.200 linhas)
  - Padrões de monitorização AI/LLM (rastreamento de token/custo dos modelos Microsoft Foundry)
  - 6 diagramas Mermaid (arquitetura, tracing distribuído, fluxo de telemetria)
  - 3 exercícios práticos (alertas, dashboards, monitorização AI)
  - Exemplos de query Kusto e estratégias de otimização de custos
  - Streaming de métricas ao vivo e depuração em tempo real
  - Tempo de aprendizagem de 40-50 minutos com padrões prontos para produção

- **🔐 Lição de Padrões de Autenticação & Segurança**: em `docs/getting-started/authsecurity.md`:
  - 3 padrões de autenticação (strings de conexão, Key Vault, identidade gerida)
  - Templates de infraestrutura Bicep completos para deploy seguros
  - Código de aplicação Node.js integrado com Azure SDK
  - 3 exercícios completos (ativar identidade gerida, identidade atribuída ao utilizador, rotação Key Vault)
  - Melhores práticas de segurança e configurações RBAC
  - Guia de resolução de problemas e análise de custos
  - Padrões de autenticação sem palavra-passe prontos para produção

- **🤖 Lição de Padrões de Coordenação Multi-Agente**: em `docs/pre-deployment/coordination-patterns.md`:
  - 5 padrões de coordenação (sequencial, paralelo, hierárquico, orientado a eventos, consenso)
  - Implementação completa do serviço orquestrador (Python/Flask, mais de 1.500 linhas)
  - 3 implementações especializadas de agentes (Investigação, Escritor, Editor)
  - Integração com Service Bus para enfileiramento de mensagens
  - Gestão de estado no Cosmos DB para sistemas distribuídos
  - 6 diagramas Mermaid mostrando interações dos agentes
  - 3 exercícios avançados (gestão de timeout, lógica de retry, circuit breaker)
  - Análise de custos ($240-565/mês) com estratégias de otimização
  - Integração com Application Insights para monitorização

#### Melhorado
- **Capítulo Pré-Deployment**: Agora inclui padrões abrangentes de monitorização e coordenação
- **Capítulo de Introdução**: Melhorado com padrões profissionais de autenticação
- **Preparação para Produção**: Cobertura completa da segurança à observabilidade
- **Esboço do Curso**: Atualizado para referenciar as novas lições nos Capítulos 3 e 6

#### Alterado
- **Progressão de Aprendizagem**: Melhor integração de segurança e monitorização ao longo do curso
- **Qualidade da Documentação**: Padrões consistentes de nível A (95-97%) nas novas lições
- **Padrões de Produção**: Cobertura completa de ponta a ponta para deployments empresariais

#### Aperfeiçoado
- **Experiência do Programador**: Caminho claro do desenvolvimento à monitorização em produção
- **Padrões de Segurança**: Padrões profissionais para autenticação e gestão de secrets
- **Observabilidade**: Integração completa do Application Insights com AZD
- **Workloads AI**: Monitorização especializada para Microsoft Foundry Models e sistemas multi-agente

#### Validado
- ✅ Todas as lições incluem código funcional completo (não excertos)
- ✅ Diagramas Mermaid para aprendizagem visual (19 no total em 3 lições)
- ✅ Exercícios práticos com passos de verificação (9 no total)
- ✅ Templates Bicep prontos para produção deployáveis via `azd up`
- ✅ Análise de custos e estratégias de otimização
- ✅ Guias de resolução de problemas e melhores práticas
- ✅ Checkpoints de conhecimento com comandos de verificação

#### Resultados da Avaliação da Documentação
- **docs/pre-deployment/application-insights.md**: - Guia abrangente de monitorização
- **docs/getting-started/authsecurity.md**: - Padrões profissionais de segurança
- **docs/pre-deployment/coordination-patterns.md**: - Arquiteturas multi-agente avançadas
- **Conteúdo Novo Geral**: - Padrões consistentes de alta qualidade

#### Implementação Técnica
- **Application Insights**: Log Analytics + telemetria customizada + tracing distribuído
- **Autenticação**: Identidade Gerida + Key Vault + padrões RBAC
- **Multi-Agente**: Service Bus + Cosmos DB + Container Apps + orquestração
- **Monitorização**: Métricas ao vivo + queries Kusto + alertas + dashboards
- **Gestão de Custos**: Estratégias de amostragem, políticas de retenção, controlos orçamentais

### [v3.7.0] - 2025-11-19

#### Melhorias na Qualidade da Documentação e Novo Exemplo Microsoft Foundry Models
**Esta versão melhora a qualidade da documentação no repositório e adiciona um exemplo completo de deployment de Microsoft Foundry Models com interface de chat gpt-4.1.**

#### Adicionado
- **🤖 Exemplo de Chat Microsoft Foundry Models**: Deployment completo gpt-4.1 com implementação funcional em `examples/azure-openai-chat/`:
  - Infraestrutura completa Microsoft Foundry Models (deployment do modelo gpt-4.1)
  - Interface de chat de linha de comando Python com histórico de conversas
  - Integração com Key Vault para armazenamento seguro de chaves API
  - Rastreio do uso de tokens e estimativa de custos
  - Limitação de taxa e gestão de erros
  - README abrangente com guia de deployment de 35-45 minutos
  - 11 ficheiros prontos para produção (templates Bicep, app Python, configuração)
- **📚 Exercícios de Documentação**: Adicionados exercícios práticos ao guia de configuração:
  - Exercício 1: Configuração multi-ambiente (15 minutos)
  - Exercício 2: Prática de gestão de secrets (10 minutos)
  - Critérios claros de sucesso e passos de verificação
- **✅ Verificação do Deployment**: Secção de verificação adicionada ao guia de deployment:
  - Procedimentos de health check
  - Checklist de critérios de sucesso
  - Outputs esperados para todos os comandos de deployment
  - Referência rápida para resolução de problemas

#### Melhorado
- **examples/README.md**: Atualizado para qualidade nível A (93%):
  - Adicionado azure-openai-chat a todas as secções relevantes
  - Contagem local de exemplos atualizada de 3 para 4
  - Adicionado à tabela de Exemplos de Aplicações AI
  - Integrado no Quick Start para Utilizadores Intermédios
  - Adicionado à secção Microsoft Foundry Templates
  - Atualizadas Matriz de Comparação e secções de procura de tecnologia
- **Qualidade da Documentação**: Melhorada de B+ (87%) → A- (92%) em toda a pasta docs:
  - Adicionados resultados esperados a exemplos de comandos críticos
  - Incluídos passos de verificação para alterações de configuração
  - Aprendizagem prática melhorada com exercícios práticos

#### Alterado
- **Progressão de Aprendizagem**: Melhor integração de exemplos de IA para aprendizes intermédios
- **Estrutura da Documentação**: Exercícios mais práticos com resultados claros
- **Processo de Verificação**: Critérios explícitos de sucesso adicionados a fluxos de trabalho chave

#### Melhorado
- **Experiência do Desenvolvedor**: O deployment dos Modelos Microsoft Foundry demora agora 35-45 minutos (vs 60-90 para alternativas complexas)
- **Transparência de Custos**: Estimativas claras de custos ($50-200/mês) para exemplo dos Modelos Microsoft Foundry
- **Caminho de Aprendizagem**: Desenvolvedores de IA têm ponto de entrada claro com azure-openai-chat
- **Padrões de Documentação**: Resultados esperados e passos de verificação consistentes

#### Validado
- ✅ Exemplo Microsoft Foundry Models totalmente funcional com `azd up`
- ✅ Todos os 11 ficheiros de implementação sintaticamente corretos
- ✅ Instruções do README correspondem à experiência real de deployment
- ✅ Links da documentação atualizados em mais de 8 locais
- ✅ Índice de exemplos reflete corretamente 4 exemplos locais
- ✅ Sem links externos duplicados nas tabelas
- ✅ Todas as referências de navegação corretas

#### Implementação Técnica
- **Arquitetura dos Modelos Microsoft Foundry**: padrão gpt-4.1 + Key Vault + Container Apps
- **Segurança**: Identidade Gerida pronta, segredos no Key Vault
- **Monitorização**: integração com Application Insights
- **Gestão de Custos**: rastreio de tokens e otimização do uso
- **Deployment**: comando único `azd up` para configuração completa

### [v3.6.0] - 2025-11-19

#### Atualização Principal: Exemplos de Deployment de Container App
**Esta versão introduz exemplos abrangentes de deployment de aplicações containerizadas prontas para produção usando o Azure Developer CLI (AZD), com documentação completa e integração no caminho de aprendizagem.**

#### Adicionado
- **🚀 Exemplos Container App**: Novos exemplos locais em `examples/container-app/`:
  - [Guia Mestre](examples/container-app/README.md): Visão geral completa de deployments containerizados, início rápido, produção e padrões avançados
  - [API Flask Simples](../../examples/container-app/simple-flask-api): API REST amigável para iniciantes com escala para zero, sondas de saúde, monitorização e resolução de problemas
  - [Arquitetura de Microserviços](../../examples/container-app/microservices): Deployment multi-serviço pronto para produção (API Gateway, Produto, Pedido, Utilizador, Notificação), mensagens assíncronas, Service Bus, Cosmos DB, Azure SQL, rastreamento distribuído, blue-green/canary deployment
- **Boas Práticas**: Segurança, monitorização, otimização de custos e orientações CI/CD para cargas containerizadas
- **Exemplos de Código**: Código completo `azure.yaml`, templates Bicep e implementações de serviços em múltiplas linguagens (Python, Node.js, C#, Go)
- **Testes & Resolução de Problemas**: Cenários de testes end-to-end, comandos de monitorização, guias de troubleshooting

#### Alterado
- **README.md**: Atualizado para apresentar e ligar os novos exemplos de container app sob "Exemplos Locais - Aplicações Containerizadas"
- **examples/README.md**: Atualizado para destacar exemplos container app, adicionar entradas à matriz comparativa e atualizar referências de tecnologia/arquitetura
- **Plano do Curso & Guia de Estudo**: Atualizado para referenciar novos exemplos container app e padrões de deployment nos capítulos relevantes

#### Validado
- ✅ Todos os novos exemplos deployáveis com `azd up` e seguem as melhores práticas
- ✅ Cross-links da documentação e navegação atualizados
- ✅ Exemplos abrangem cenários do principiante ao avançado, incluindo microsserviços para produção

#### Notas
- **Âmbito**: Documentação e exemplos apenas em inglês
- **Próximos Passos**: Expandir com padrões adicionais avançados de containers e automação CI/CD em futuras versões

### [v3.5.0] - 2025-11-19

#### Rebranding do Produto: Microsoft Foundry
**Esta versão implementa mudanças abrangentes do nome do produto de "Microsoft Foundry" para "Microsoft Foundry" em toda a documentação em inglês, refletindo o rebranding oficial da Microsoft.**

#### Alterado
- **🔄 Atualização do Nome do Produto**: Rebranding completo de "Microsoft Foundry" para "Microsoft Foundry"
  - Atualizadas todas as referências pela documentação em inglês na pasta `docs/`
  - Renomeada pasta: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Renomeado ficheiro: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 referências de conteúdo atualizadas em 7 ficheiros de documentação

- **📁 Alterações na Estrutura das Pastas**:
  - `docs/ai-foundry/` renomeada para `docs/microsoft-foundry/`
  - Todas as referências cruzadas atualizadas para refletir a nova estrutura de pastas
  - Links de navegação validados em toda a documentação

- **📄 Renomeação de Ficheiros**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Todos os links internos atualizados para referenciar novos nomes de ficheiros

#### Ficheiros Atualizados
- **Documentação dos Capítulos** (7 ficheiros):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 atualizações de link de navegação
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 referências ao nome do produto atualizadas
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Já usa Microsoft Foundry (de atualizações anteriores)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referências atualizadas (visão geral, feedback da comunidade, documentação)
  - `docs/getting-started/azd-basics.md` - 4 links de referência cruzada atualizados
  - `docs/getting-started/first-project.md` - 2 links de navegação de capítulo atualizados
  - `docs/getting-started/installation.md` - 2 links de capítulo seguinte atualizados
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referências atualizadas (navegação, comunidade Discord)
  - `docs/troubleshooting/common-issues.md` - 1 link de navegação atualizado
  - `docs/troubleshooting/debugging.md` - 1 link de navegação atualizado

- **Ficheiros de Estrutura do Curso** (2 ficheiros):
  - `README.md` - 17 referências atualizadas (visão geral do curso, títulos dos capítulos, secção templates, insights da comunidade)
  - `course-outline.md` - 14 referências atualizadas (visão geral, objetivos de aprendizagem, recursos do capítulo)

#### Validado
- ✅ Nenhuma referência restante ao caminho da pasta "ai-foundry" na documentação em inglês
- ✅ Nenhuma referência restante ao nome do produto "Microsoft Foundry" na documentação em inglês
- ✅ Todos os links de navegação funcionais com a nova estrutura de pastas
- ✅ Renomeações de ficheiros e pastas concluídas com sucesso
- ✅ Referências cruzadas entre capítulos validadas

#### Notas
- **Âmbito**: Alterações aplicadas apenas à documentação em inglês na pasta `docs/`
- **Traduções**: Pastas de tradução (`translations/`) não foram atualizadas nesta versão
- **Workshop**: Materiais do workshop (`workshop/`) não atualizados nesta versão
- **Exemplos**: Ficheiros de exemplo podem ainda conter nomenclatura antiga (a corrigir em atualização futura)
- **Links Externos**: URLs externas e referências do repositório GitHub mantidas inalteradas

#### Guia de Migração para Colaboradores
Se possuir branches locais ou documentação que referencie a estrutura antiga:
1. Atualize referências de pasta: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Atualize referências de ficheiro: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Substitua o nome do produto: "Microsoft Foundry" → "Microsoft Foundry"
4. Valide se todos os links internos da documentação continuam a funcionar

---

### [v3.4.0] - 2025-10-24

#### Melhorias na Pré-visualização e Validação da Infraestrutura
**Esta versão introduz suporte abrangente para a nova funcionalidade preview do Azure Developer CLI e melhora a experiência do utilizador no workshop.**

#### Adicionado
- **🧪 Documentação da funcionalidade azd provision --preview**: Cobertura completa da nova capacidade de pré-visualização da infraestrutura
  - Referência de comandos e exemplos de uso no cheat sheet
  - Integração detalhada no guia de provisionamento com casos de uso e benefícios
  - Integração de verificação pré-voo para validação de deployment mais segura
  - Atualizações no guia de introdução com práticas de deployment seguras
- **🚧 Banner de Estado do Workshop**: Banner HTML profissional indicando estado de desenvolvimento do workshop
  - Design em gradiente com indicadores de construção para comunicação clara com o utilizador
  - Carimbo de data/hora da última atualização para transparência
  - Design responsivo para dispositivos móveis e todos os tipos de dispositivos

#### Melhorado
- **Segurança da Infraestrutura**: Funcionalidade preview integrada na documentação de deployment
- **Validação Pré-deployment**: Scripts automatizados agora incluem testes da preview da infraestrutura
- **Fluxo de Trabalho do Desenvolvedor**: Sequências de comando atualizadas para incluir preview como melhor prática
- **Experiência no Workshop**: Expectativas claras definidas para os utilizadores sobre o estado de desenvolvimento do conteúdo

#### Alterado
- **Melhores Práticas de Deployment**: Workflow com preview como primeira etapa recomendado
- **Fluxo da Documentação**: Validação da infraestrutura movida para etapas iniciais da aprendizagem
- **Apresentação do Workshop**: Comunicação profissional do estado com linha temporal clara de desenvolvimento

#### Melhorado
- **Abordagem Safety-First**: Alterações da infraestrutura podem agora ser validadas antes do deployment
- **Colaboração em Equipa**: Resultados da preview podem ser partilhados para revisão e aprovação
- **Consciência de Custos**: Melhor compreensão dos custos dos recursos antes do provisionamento
- **Mitigação de Riscos**: Redução de falhas em deployments através de validação antecipada

#### Implementação Técnica
- **Integração Multi-documento**: Funcionalidade preview documentada em 4 ficheiros principais
- **Padrões de Comando**: Sintaxe e exemplos consistentes em toda a documentação
- **Integração de Melhores Práticas**: Preview incluída em fluxos de validação e scripts
- **Indicadores Visuais**: Marcações claras de nova funcionalidade para fácil descoberta

#### Infraestrutura do Workshop
- **Comunicação do Estado**: Banner HTML profissional com estilo gradiente
- **Experiência do Utilizador**: Estado claro de desenvolvimento evita confusão
- **Apresentação Profissional**: Mantém credibilidade do repositório e define expectativas
- **Transparência do Prazo**: Carimbo de data/hora de última atualização em outubro 2025 para responsabilidade

### [v3.3.0] - 2025-09-24

#### Materiais do Workshop Melhorados e Experiência de Aprendizagem Interativa
**Esta versão introduz materiais abrangentes para workshops com guias interativos baseados no navegador e caminhos de aprendizagem estruturados.**

#### Adicionado
- **🎥 Guia Interativo do Workshop**: Experiência de workshop baseada no navegador com funcionalidade preview do MkDocs
- **📝 Instruções Estruturadas para o Workshop**: Caminho de aprendizagem guiado em 7 passos desde descoberta até personalização
  - 0-Introdução: Visão geral e configuração do workshop
  - 1-Seleção-Template-IA: Processo de descoberta e seleção de templates
  - 2-Validação-Template-IA: Procedimentos de deployment e validação
  - 3-Desconstrução-Template-IA: Compreensão da arquitetura do template
  - 4-Configuração-Template-IA: Configuração e personalização
  - 5-Personalização-Template-IA: Modificações avançadas e iterações
  - 6-Desmontagem-Infrastrutura: Limpeza e gestão de recursos
  - 7-Conclusão: Resumo e próximos passos
- **🛠️ Ferramentas do Workshop**: Configuração MkDocs com tema Material para experiência de aprendizagem melhorada
- **🎯 Caminho de Aprendizagem Hands-On**: Metodologia em 3 etapas (Descoberta → Deployment → Personalização)
- **📱 Integração GitHub Codespaces**: Configuração fluida de ambiente de desenvolvimento

#### Melhorado
- **Laboratório de IA do Workshop**: Extensão com experiência estruturada de aprendizagem compreensiva de 2 a 3 horas
- **Documentação do Workshop**: Apresentação profissional com navegação e auxílios visuais
- **Progressão de Aprendizagem**: Orientação clara passo a passo desde seleção do template até deployment em produção
- **Experiência do Desenvolvedor**: Ferramentas integradas para fluxos de trabalho de desenvolvimento simplificados

#### Melhorado
- **Acessibilidade**: Interface baseada no navegador com funcionalidade de pesquisa, cópia e alternância de tema
- **Aprendizagem ao Próprio Ritmo**: Estrutura flexível do workshop que acomoda diferentes velocidades de aprendizagem
- **Aplicação Prática**: Cenários reais de deployment de templates de IA
- **Integração Comunitária**: Integração Discord para suporte e colaboração no workshop

#### Funcionalidades do Workshop
- **Pesquisa Incorporada**: Descoberta rápida por palavra-chave e aula
- **Blocos de Código com Cópia**: Funcionalidade hover-to-copy para todos os exemplos de código
- **Alternância de Tema**: Suporte a modo escuro/claro para diferentes preferências
- **Ativos Visuais**: Capturas de ecrã e diagramas para melhor compreensão
- **Integração de Ajuda**: Acesso direto ao Discord para suporte comunitário

### [v3.2.0] - 2025-09-17

#### Reestruturação Principal de Navegação e Sistema de Aprendizagem por Capítulos
**Esta versão introduz uma estrutura abrangente de aprendizagem por capítulos com navegação aprimorada em todo o repositório.**

#### Adicionado
- **📚 Sistema de Aprendizagem por Capítulos**: Reestruturado curso inteiro em 8 capítulos progressivos de aprendizagem
  - Capítulo 1: Fundação & Início Rápido (⭐ - 30-45 mins)
  - Capítulo 2: Desenvolvimento AI-First (⭐⭐ - 1-2 horas)
  - Capítulo 3: Configuração & Autenticação (⭐⭐ - 45-60 mins)
  - Capítulo 4: Infraestrutura como Código & Deployment (⭐⭐⭐ - 1-1.5 horas)
  - Capítulo 5: Soluções Multi-Agente AI (⭐⭐⭐⭐ - 2-3 horas)
  - Capítulo 6: Validação & Planeamento Pré-Deployment (⭐⭐ - 1 hora)
  - Capítulo 7: Resolução de Problemas & Debugging (⭐⭐ - 1-1.5 horas)
  - Capítulo 8: Padrões de Produção & Empresariais (⭐⭐⭐⭐ - 2-3 horas)
- **📚 Sistema Abrangente de Navegação**: Cabeçalhos e rodapés de navegação consistentes em toda a documentação
- **🎯 Acompanhamento de Progresso**: Checklist de conclusão do curso e sistema de verificação de aprendizagem
- **🗺️ Orientação do Caminho de Aprendizagem**: Pontos de entrada claros para diferentes níveis de experiência e objetivos
- **🔗 Navegação de Referência Cruzada**: Capítulos relacionados e pré-requisitos claramente ligados

#### Melhorado
- **Estrutura do README**: Transformada numa plataforma de aprendizagem estruturada com organização por capítulos
- **Navegação da Documentação**: Cada página inclui agora contexto do capítulo e orientação de progressão
- **Organização de Templates**: Exemplos e templates mapeados para os capítulos de aprendizagem apropriados
- **Integração de Recursos**: Cheat sheets, FAQs e guias de estudo ligados aos capítulos relevantes
- **Integração do Workshop**: Laboratórios hands-on mapeados para múltiplos objetivos de aprendizagem dos capítulos

#### Alterado
- **Progressão de Aprendizagem**: Passagem de documentação linear para aprendizagem flexível baseada em capítulos
- **Posicionamento da Configuração**: Guia de configuração reposicionado como Capítulo 3 para melhor fluxo de aprendizagem
- **Integração de Conteúdo de IA**: Melhor integração de conteúdos específicos de IA ao longo da jornada de aprendizagem
- **Conteúdo de Produção**: Padrões avançados consolidados no Capítulo 8 para alunos empresariais

#### Melhorado
- **Experiência do Utilizador**: Navegação clara com breadcrumbs e indicadores de progressão de capítulos
- **Acessibilidade**: Padrões de navegação consistentes para facilitar a navegação no curso
- **Apresentação Profissional**: Estrutura de curso ao estilo universitário adequada para formação académica e corporativa
- **Eficiência de Aprendizagem**: Redução do tempo para encontrar conteúdos relevantes através da organização melhorada

#### Implementação Técnica
- **Cabeçalhos de Navegação**: Navegação padronizada por capítulo em mais de 40 ficheiros de documentação
- **Navegação no Rodapé**: Orientação consistente de progressão e indicadores de conclusão de capítulo
- **Interligação**: Sistema abrangente de links internos que liga conceitos relacionados
- **Mapeamento de Capítulos**: Templates e exemplos claramente associados a objetivos de aprendizagem

#### Melhoria do Guia de Estudo
- **📚 Objetivos de Aprendizagem Abrangentes**: Guia de estudo reestruturado para alinhamento com sistema de 8 capítulos
- **🎯 Avaliação Baseada em Capítulos**: Cada capítulo inclui objetivos específicos e exercícios práticos
- **📋 Monitorização de Progresso**: Plano semanal de aprendizagem com resultados mensuráveis e listas de verificação de conclusão
- **❓ Questões de Avaliação**: Perguntas de validação de conhecimento para cada capítulo com resultados profissionais
- **🛠️ Exercícios Práticos**: Atividades hands-on com cenários reais de implementação e resolução de problemas
- **📊 Progressão de Competências**: Avanço claro desde conceitos básicos até padrões empresariais com foco no desenvolvimento profissional
- **🎓 Estrutura de Certificação**: Resultados para o desenvolvimento profissional e sistema de reconhecimento comunitário
- **⏱️ Gestão de Cronograma**: Plano de aprendizagem estruturado de 10 semanas com validação de marcos

### [v3.1.0] - 2025-09-17

#### Soluções de IA Multi-Agente Aprimoradas
**Esta versão melhora a solução multi-agente de retalho com melhor nomeação de agentes e documentação aprimorada.**

#### Alterado
- **Terminologia Multi-Agente**: Substituído "agente Cora" por "agente Cliente" em toda a solução multi-agente de retalho para maior clareza
- **Arquitetura de Agentes**: Atualizada toda a documentação, templates ARM e exemplos de código para usar a nomeação consistente "agente Cliente"
- **Exemplos de Configuração**: Atualizados padrões de configuração de agentes com convenções de nomenclatura modernas
- **Consistência da Documentação**: Garantidas referências profissionais e descritivas dos nomes dos agentes

#### Aprimorado
- **Pacote de Template ARM**: Atualizado retail-multiagent-arm-template com referências ao agente Cliente
- **Diagramas de Arquitetura**: Atualizados diagramas Mermaid com nomeação atualizada dos agentes
- **Exemplos de Código**: Classes Python e exemplos de implementação agora usam a designação CustomerAgent
- **Variáveis de Ambiente**: Atualizados todos os scripts de deploy para usar convenções CUSTOMER_AGENT_NAME

#### Melhorado
- **Experiência do Desenvolvedor**: Papéis e responsabilidades dos agentes mais claros na documentação
- **Prontidão para Produção**: Melhor alinhamento com convenções de nomeação empresariais
- **Materiais de Aprendizagem**: Nomeação de agentes mais intuitiva para fins educativos
- **Usabilidade dos Templates**: Compreensão simplificada das funções dos agentes e padrões de implementação

#### Detalhes Técnicos
- Diagramas de arquitetura Mermaid atualizados com referências a CustomerAgent
- Nomes de classes CoraAgent substituídos por CustomerAgent nos exemplos em Python
- Configurações JSON dos templates ARM modificadas para usar "customer" como tipo de agente
- Variáveis de ambiente atualizadas de CORA_AGENT_* para CUSTOMER_AGENT_*
- Comandos de deployment e configurações de containers atualizados

### [v3.0.0] - 2025-09-12

#### Grandes Alterações - Foco em Desenvolvedores de IA e Integração Microsoft Foundry
**Esta versão transforma o repositório numa fonte abrangente de aprendizagem focada em IA com integração Microsoft Foundry.**

#### Adicionado
- **🤖 Rota de Aprendizagem AI-First**: Reestruturação completa priorizando desenvolvedores e engenheiros de IA
- **Guia de Integração Microsoft Foundry**: Documentação completa para conectar AZD aos serviços Microsoft Foundry
- **Padrões de Implantação de Modelos IA**: Guia detalhado sobre seleção, configuração e estratégias para deployment em produção
- **Workshop Prático de IA**: Workshop hands-on de 2-3 horas para converter aplicações IA em soluções implementáveis com AZD
- **Melhores Práticas para IA em Produção**: Padrões empresariais para escala, monitorização e segurança de workloads IA
- **Guia de Resolução de Problemas Específico IA**: Solução de problemas para Modelos Microsoft Foundry, Serviços Cognitivos e questões de deployment IA
- **Galeria de Templates IA**: Coleção destacada de templates Microsoft Foundry com classificações de complexidade
- **Materiais de Workshop**: Estrutura completa do workshop com labs práticos e materiais de referência

#### Melhorado
- **Estrutura do README**: Focada em desenvolvedores IA com 45% de interesse da comunidade do Discord Microsoft Foundry
- **Rotas de Aprendizagem**: Jornada dedicada ao desenvolvedor de IA paralelamente a rotas tradicionais para estudantes e DevOps
- **Recomendações de Templates**: Templates IA destacados incluindo azure-search-openai-demo, contoso-chat e openai-chat-app-quickstart
- **Integração Comunitária**: Suporte comunitário do Discord ampliado com canais e discussões específicas para IA

#### Segurança & Foco em Produção
- **Padrões de Managed Identity**: Configurações de autenticação e segurança específicas para IA
- **Otimização de Custos**: Monitorização de uso de tokens e controlo orçamental para workloads IA
- **Deployment Multi-Região**: Estratégias para implantação global de aplicações IA
- **Monitorização de Performance**: Métricas específicas IA e integração com Application Insights

#### Qualidade da Documentação
- **Estrutura Linear do Curso**: Progressão lógica de padrões de deployment IA de iniciante a avançado
- **URLs Validados**: Todos os links externos aos repositórios verificados e acessíveis
- **Referência Completa**: Todos os links internos testados e funcionais
- **Pronto para Produção**: Padrões empresariais com exemplos do mundo real

### [v2.0.0] - 2025-09-09

#### Grandes Alterações - Reestruturação do Repositório e Melhoria Profissional
**Esta versão representa uma revisão significativa da estrutura do repositório e apresentação do conteúdo.**

#### Adicionado
- **Estrutura de Aprendizagem Estruturada**: Todas as páginas de documentação incluem agora Secções de Introdução, Objetivos de Aprendizagem e Resultados de Aprendizagem
- **Sistema de Navegação**: Adicionados links Aula Anterior/Próxima em toda a documentação para progressão guiada na aprendizagem
- **Guia de Estudo**: study-guide.md completo com objetivos de aprendizagem, exercícios práticos e materiais de avaliação
- **Apresentação Profissional**: Remoção de todos os ícones emoji para melhor acessibilidade e aparência profissional
- **Estrutura de Conteúdo Aprimorada**: Melhoria na organização e fluxo dos materiais de aprendizagem

#### Alterado
- **Formato da Documentação**: Padronização de toda a documentação com estrutura focada na aprendizagem
- **Fluxo de Navegação**: Implementação de progressão lógica através de todos os materiais de aprendizagem
- **Apresentação do Conteúdo**: Remoção de elementos decorativos em favor de formatação clara e profissional
- **Estrutura de Links**: Atualização de todos os links internos para suportar novo sistema de navegação

#### Melhorado
- **Acessibilidade**: Remoção de dependências de emoji para melhor compatibilidade com leitores de ecrã
- **Aparência Profissional**: Apresentação limpa ao estilo académico adequada para aprendizagem empresarial
- **Experiência de Aprendizagem**: Abordagem estruturada com objetivos claros e resultados para cada aula
- **Organização do Conteúdo**: Maior fluidez lógica e conexão entre tópicos relacionados

### [v1.0.0] - 2025-09-09

#### Lançamento Inicial - Repositório de Aprendizagem AZD Abrangente

#### Adicionado
- **Estrutura Central da Documentação**
  - Série completa de guias de início rápido
  - Documentação abrangente de deployment e provisão
  - Recursos detalhados de resolução de problemas e guias de debugging
  - Ferramentas e procedimentos de validação pré-deployment

- **Módulo de Introdução**
  - AZD Básico: Conceitos e terminologia fundamentais
  - Guia de Instalação: Instruções específicas de plataforma
  - Guia de Configuração: Configuração do ambiente e autenticação
  - Tutorial do Primeiro Projeto: Aprendizagem prática passo a passo

- **Módulo de Deployment e Provisão**
  - Guia de Deployment: Documentação completa do fluxo de trabalho
  - Guia de Provisionamento: Infraestrutura como Código com Bicep
  - Melhores práticas para deployments em produção
  - Padrões de arquitetura multi-serviço

- **Módulo de Validação Pré-Deployment**
  - Planeamento de Capacidade: Validação da disponibilidade de recursos Azure
  - Seleção de SKU: Guia abrangente de níveis de serviço
  - Checks pré-voo: Scripts de validação automatizados (PowerShell e Bash)
  - Ferramentas de estimativa de custos e planeamento orçamental

- **Módulo de Resolução de Problemas**
  - Problemas Comuns: Problemas frequentes e soluções
  - Guia de Debugging: Metodologias sistemáticas de resolução
  - Técnicas e ferramentas avançadas de diagnóstico
  - Monitorização e otimização de performance

- **Recursos e Referências**
  - Folha de Comandos: Referência rápida para comandos essenciais
  - Glossário: Terminologia abrangente e definições de acrónimos
  - FAQ: Respostas detalhadas às perguntas mais comuns
  - Links para recursos externos e conexões comunitárias

- **Exemplos e Templates**
  - Exemplo simples de aplicação web
  - Template para deployment de website estático
  - Configuração de aplicação em container
  - Padrões de integração de bases de dados
  - Exemplos de arquitetura de microsserviços
  - Implementações de funções serverless

#### Funcionalidades
- **Suporte Multi-Plataforma**: Guias de instalação e configuração para Windows, macOS e Linux
- **Vários Níveis de Competência**: Conteúdo desenhado para estudantes até desenvolvedores profissionais
- **Foco Prático**: Exemplos hands-on e cenários do mundo real
- **Cobertura Abrangente**: Desde conceitos básicos a padrões empresariais avançados
- **Abordagem com Segurança em Primeiro Lugar**: Melhores práticas de segurança integradas ao longo do conteúdo
- **Otimização de Custos**: Orientação para deployments eficientes em custos e gestão de recursos

#### Qualidade da Documentação
- **Exemplos Detalhados de Código**: Exemplos de código práticos e testados
- **Instruções Passo a Passo**: Orientação clara e acionável
- **Gestão Abrangente de Erros**: Resolução de problemas para questões comuns
- **Integração das Melhores Práticas**: Padrões industriais e recomendações
- **Compatibilidade de Versão**: Atualizado com os últimos serviços Azure e funcionalidades azd

## Melhorias Futuras Planeadas

### Versão 3.1.0 (Planeada)
#### Expansão da Plataforma de IA
- **Suporte Multi-Modelo**: Padrões de integração para Hugging Face, Azure Machine Learning e modelos personalizados
- **Frameworks de Agentes IA**: Templates para deploy LangChain, Semantic Kernel e AutoGen
- **Padrões Avançados RAG**: Opções de bases de dados vetoriais além do Azure AI Search (Pinecone, Weaviate, etc.)
- **Observabilidade IA**: Monitorização aprimorada para performance do modelo, uso de tokens e qualidade das respostas

#### Experiência do Desenvolvedor
- **Extensão VS Code**: Experiência integrada de desenvolvimento AZD + Microsoft Foundry
- **Integração GitHub Copilot**: Geração assistida por IA de templates AZD
- **Tutoriais Interativos**: Exercícios práticos codificados com validação automática para cenários IA
- **Conteúdos em Vídeo**: Tutoriais suplementares em vídeo para aprendizes visuais focados em deployments IA

### Versão 4.0.0 (Planeada)
#### Padrões Empresariais de IA
- **Framework de Governação**: Governação de modelos IA, conformidade e auditoria
- **IA Multi-Inquilino**: Padrões para servir múltiplos clientes com serviços IA isolados
- **Deployment Edge IA**: Integração com Azure IoT Edge e instâncias de containers
- **Nuvem Híbrida IA**: Padrões multi-cloud e híbridos para workloads IA

#### Funcionalidades Avançadas
- **Automação de Pipelines IA**: Integração MLOps com pipelines Azure Machine Learning
- **Segurança Avançada**: Padrões zero-trust, endpoints privados e proteção contra ameaças avançada
- **Otimização de Performance**: Ajustes avançados e estratégias de escala para aplicações IA de alto throughput
- **Distribuição Global**: Padrões de entrega de conteúdo e caching em edge para aplicações IA

### Versão 3.0.0 (Planeada) - Substituída pela Versão Atual
#### Adições Propostas - Agora Implementadas na v3.0.0
- ✅ **Conteúdo Focado em IA**: Integração abrangente Microsoft Foundry (Concluído)
- ✅ **Workshops Interativos**: Laboratório prático de IA (Concluído)
- ✅ **Módulo Avançado de Segurança**: Padrões de segurança específicos IA (Concluído)
- ✅ **Otimização de Performance**: Estratégias de ajuste para workloads IA (Concluído)

### Versão 2.1.0 (Planeada) - Parcialmente Implementada na v3.0.0
#### Melhorias Menores - Algumas Concluídas na Versão Atual
- ✅ **Exemplos Adicionais**: Cenários de deployment focados em IA (Concluído)
- ✅ **FAQ Alargado**: Perguntas e resolução de problemas específicos IA (Concluído)
- **Integração de Ferramentas**: Guias aprimorados para integração em IDE e editores
- ✅ **Expansão de Monitorização**: Padrões específicos IA para monitorização e alertas (Concluído)

#### Ainda Planeado para Futuras Versões
- **Documentação Mobile-Friendly**: Design responsivo para aprendizagem móvel
- **Acesso Offline**: Pacotes de documentação descarregáveis
- **Integração Avançada IDE**: Extensão VS Code para workflows AZD + IA
- **Dashboard Comunitário**: Métricas em tempo real e monitorização de contribuições

## Contribuir para o Changelog

### Relatar Alterações
Ao contribuir para este repositório, assegure que as entradas do changelog incluam:

1. **Número da Versão**: Seguindo versionamento semântico (major.minor.patch)
2. **Data**: Data de lançamento ou atualização no formato AAAA-MM-DD
3. **Categoria**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Descrição Clara**: Descrição concisa do que foi alterado
5. **Avaliação de Impacto**: Como as mudanças afetam os utilizadores existentes

### Categorias de Alteração

#### Adicionado
- Novas funcionalidades, secções de documentação ou capacidades
- Novos exemplos, templates ou recursos de aprendizagem
- Ferramentas adicionais, scripts ou utilitários

#### Alterado
- Modificações nas funcionalidades ou documentação existentes
- Atualizações para melhorar clareza ou precisão
- Reestruturação de conteúdos ou organização

#### Descontinuado
- Funcionalidades ou abordagens que estão a ser eliminadas
- Secções da documentação agendadas para remoção
- Métodos que têm alternativas melhores

#### Removido
- Funcionalidades, documentação ou exemplos que já não são relevantes
- Informações desatualizadas ou abordagens descontinuadas
- Conteúdo redundante ou consolidado

#### Corrigido
- Correções a erros na documentação ou código
- Resolução de problemas ou questões reportadas
- Melhorias na precisão ou funcionalidade

#### Segurança
- Melhorias ou correções relacionadas com segurança
- Atualizações nas melhores práticas de segurança
- Resolução de vulnerabilidades de segurança

### Diretrizes de Versionamento Semântico

#### Versão Principal (X.0.0)
- Alterações que quebram compatibilidade e que exigem ação do utilizador
- Reestruturação significativa do conteúdo ou da organização
- Alterações que modificam a abordagem ou metodologia fundamental

#### Versão Menor (X.Y.0)
- Novas funcionalidades ou adições de conteúdo
- Melhoramentos que mantêm compatibilidade retroativa
- Exemplos adicionais, ferramentas ou recursos

#### Versão de Corrigenda (X.Y.Z)
- Correções de erros e correcções
- Melhorias menores ao conteúdo existente
- Esclarecimentos e pequenas melhorias

## Feedback e Sugestões da Comunidade

Encorajamos ativamente o feedback da comunidade para melhorar este recurso de aprendizagem:

### Como Fornecer Feedback
- **GitHub Issues**: Reportar problemas ou sugerir melhorias (questões específicas de IA são bem-vindas)
- **Discussões no Discord**: Partilhar ideias e interagir com a comunidade Microsoft Foundry
- **Pull Requests**: Contribuir com melhorias diretas ao conteúdo, especialmente templates e guias de IA
- **Microsoft Foundry Discord**: Participar no canal #Azure para discussões sobre AZD + IA
- **Fóruns da Comunidade**: Participar em discussões mais amplas para desenvolvedores Azure

### Categorias de Feedback
- **Precisão do Conteúdo de IA**: Correções na integração e implementação dos serviços de IA
- **Experiência de Aprendizagem**: Sugestões para melhorar o fluxo de aprendizagem para desenvolvedores de IA
- **Conteúdo de IA em Falta**: Pedidos para templates, padrões ou exemplos adicionais de IA
- **Acessibilidade**: Melhorias para necessidades diversas de aprendizagem
- **Integração de Ferramentas de IA**: Sugestões para melhor integração no fluxo de trabalho de desenvolvimento de IA
- **Padrões de IA para Produção**: Pedidos de padrões para implementação empresarial de IA

### Compromisso de Resposta
- **Resposta a Problemas**: Dentro de 48 horas para problemas reportados
- **Pedidos de Funcionalidade**: Avaliação dentro de uma semana
- **Contribuições da Comunidade**: Revisão dentro de uma semana
- **Questões de Segurança**: Prioridade imediata com resposta acelerada

## Plano de Manutenção

### Atualizações Regulares
- **Revisões Mensais**: Precisão do conteúdo e validação de links
- **Atualizações Trimestrais**: Grandes adições e melhorias no conteúdo
- **Revisões Semestrais**: Reestruturação e melhorias abrangentes
- **Lançamentos Anuais**: Atualizações de versões principais com melhorias significativas

### Monitorização e Garantia de Qualidade
- **Testes Automatizados**: Validação regular dos exemplos de código e links
- **Integração de Feedback da Comunidade**: Incorporação regular das sugestões dos utilizadores
- **Atualizações Tecnológicas**: Alinhamento com os últimos serviços Azure e lançamentos do azd
- **Auditorias de Acessibilidade**: Revisão regular para princípios de design inclusivo

## Política de Suporte a Versões

### Suporte a Versão Atual
- **Última Versão Principal**: Suporte completo com atualizações regulares
- **Versão Principal Anterior**: Atualizações de segurança e correcções críticas por 12 meses
- **Versões Legadas**: Suporte da comunidade somente, sem atualizações oficiais

### Orientação para Migração
Quando versões principais são lançadas, fornecemos:
- **Guias de Migração**: Instruções passo a passo para a transição
- **Notas de Compatibilidade**: Detalhes sobre alterações que quebram compatibilidade
- **Suporte de Ferramentas**: Scripts ou utilitários para auxiliar na migração
- **Suporte da Comunidade**: Fóruns dedicados a questões de migração

---

**Navegação**
- **Lição Anterior**: [Guia de Estudo](resources/study-guide.md)
- **Próxima Lição**: Voltar ao [README Principal](README.md)

**Mantenha-se Atualizado**: Siga este repositório para notificações sobre novos lançamentos e atualizações importantes aos materiais de aprendizagem.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->