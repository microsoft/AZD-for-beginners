# Perguntas Frequentes (FAQ)

**Obtenha Ajuda por Capítulo**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../README.md)
- **🚆 Problemas de Instalação**: [Capítulo 1: Instalação & Configuração](../docs/chapter-01-foundation/installation.md)
- **🤖 Perguntas sobre IA**: [Capítulo 2: Desenvolvimento Prioritário em IA](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🔧 Solução de Problemas**: [Capítulo 7: Solução de Problemas & Depuração](../docs/chapter-07-troubleshooting/common-issues.md)

## Introdução

Esta FAQ abrangente fornece respostas às perguntas mais comuns sobre Azure Developer CLI (azd) e implantações no Azure. Encontre soluções rápidas para problemas comuns, entenda as melhores práticas e obtenha esclarecimentos sobre conceitos e fluxos de trabalho do azd.

## Objetivos de Aprendizagem

Ao revisar esta FAQ, você irá:
- Encontrar respostas rápidas para perguntas e problemas comuns do Azure Developer CLI
- Entender conceitos e terminologia chave por meio de formato prático de perguntas e respostas
- Acessar soluções para problemas frequentes e cenários de erro
- Aprender as melhores práticas através de perguntas comuns sobre otimização
- Descobrir recursos avançados e capacidades por meio de perguntas de nível especialista
- Referenciar orientações sobre custos, segurança e estratégias de implantação de forma eficiente

## Resultados do Aprendizado

Com referência regular a esta FAQ, você poderá:
- Resolver problemas comuns do Azure Developer CLI de forma independente utilizando as soluções fornecidas
- Tomar decisões informadas sobre estratégias e configurações de implantação
- Compreender a relação entre azd e outras ferramentas e serviços do Azure
- Aplicar melhores práticas baseadas na experiência da comunidade e recomendações de especialistas
- Solucionar problemas de autenticação, implantação e configuração de forma eficaz
- Otimizar custos e desempenho usando insights e recomendações da FAQ

## Índice

- [Começando](#getting-started)
- [Autenticação & Acesso](#authentication--access)
- [Modelos & Projetos](#templates--projects)
- [Implantação & Infraestrutura](#deployment--infrastructure)
- [Configuração & Ambientes](#configuration--environments)
- [Solução de Problemas](#troubleshooting)
- [Custos & Faturamento](#cost--billing)
- [Melhores Práticas](#best-practices)
- [Tópicos Avançados](#advanced-topics)

---

## Começando

### P: O que é Azure Developer CLI (azd)?
**R**: Azure Developer CLI (azd) é uma ferramenta de linha de comando voltada para desenvolvedores que acelera o tempo necessário para levar sua aplicação do ambiente local para o Azure. Ela oferece melhores práticas por meio de modelos e ajuda com todo o ciclo de vida da implantação.

### P: Como o azd é diferente da Azure CLI?
**R**: 
- **Azure CLI**: Ferramenta de uso geral para gerenciar recursos do Azure
- **azd**: Ferramenta focada no desenvolvedor para fluxos de trabalho de implantação de aplicações
- azd tem seu próprio fluxo de autenticação e implantação; Azure CLI é uma ferramenta complementar e separada
- azd inclui modelos, gerenciamento de ambientes e automação de implantação

### P: Preciso ter Azure CLI instalada para usar azd?
**R**: Não para o fluxo essencial do AZD. Autentique-se com `azd auth login`. Instale a Azure CLI separadamente quando um gancho de modelo ou exercício executar explicitamente comandos `az`.

### P: Quais linguagens de programação o azd suporta?
**R**: azd é independente de linguagem. Funciona com:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Sites estáticos
- Aplicações conteinerizadas

### P: Posso usar azd com projetos existentes?
**R**: Sim! Você pode:
1. Usar `azd init` para adicionar configuração azd a projetos existentes
2. Adaptar projetos existentes para corresponder à estrutura de modelo azd
3. Criar modelos personalizados com base na sua arquitetura existente

### P: O que mudou com a disponibilidade geral da extensão Foundry?
**R**: O pacote `microsoft.foundry` atingiu a versão 1.0 e GA em 5 de novembro de 2026. Com AZD 1.37.0+, use `azd ext install microsoft.foundry` para instalar sete extensões principais para agentes, conexões, inspetor, projetos, rotinas, habilidades e caixas de ferramentas. Não é um novo namespace de comando, e seus componentes possuem versões independentes. Avaliações, conjuntos de dados, ajuste fino e modelos personalizados são instalados separadamente; recursos opcionais em prévia não se tornam GA apenas porque o pacote é GA.

O [tutorial do agente hospedado](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) usa Python 3.13+ e uv atual. `azd ai agent run` abre o Agent Inspector localmente, mas chamadas de modelo ainda usam Azure e geram cobranças. O modo código `azd deploy` envia o código-fonte para uma compilação remota sem exigir compilação local em container.

### P: `azd down` remove um agente hospedado de um projeto Foundry existente?
**R**: Não para o caminho com projeto reutilizado descrito no quickstart do agente hospedado: ele deixa projeto, agente hospedado e outros recursos no lugar. Remova recursos indesejados separadamente sem deletar recursos compartilhados. Se o ambiente criou um novo projeto Foundry, `azd down` exclui o grupo de recursos e tudo nele. Revise a [orientação de limpeza](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#7-clean-up-deliberately) e os avisos de exclusão antes de confirmar.

---

## Autenticação & Acesso

### P: Como me autentico no Azure usando azd?
**R**: Use `azd auth login` que abrirá uma janela do navegador para autenticação Azure. Para cenários CI/CD, utilize service principals ou identidades gerenciadas.

### P: Posso usar azd com múltiplas assinaturas do Azure?
**R**: Sim. Use `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` para especificar qual assinatura usar para cada ambiente.

### P: Quais permissões preciso para implantar com azd?
**R**: Normalmente você precisa:
- Papel de **Colaborador** no grupo de recursos ou assinatura
- **Administrador de Acesso de Usuário** para implantar recursos que exigem atribuições de função
- Permissões específicas variam conforme modelo e recursos implantados

### P: Posso usar azd em pipelines CI/CD?
**R**: Absolutamente! azd é projetado para integração CI/CD. Use service principals para autenticação e defina variáveis de ambiente para configuração.

### P: Como gerencio autenticação no GitHub Actions?
**R**: Prefira federação de identidade de workload (OIDC), configurada com `azd pipeline config`. O workflow gerado instala AZD e autentica AZD diretamente com identidade federada. Um passo `azure/login` sozinho não estabelece login AZD. Um passo de login dentro de um job existente é:
```yaml
permissions:
  contents: read
  id-token: write
steps:
  - uses: actions/checkout@v7
  - uses: Azure/setup-azd@v2
  - run: >-
      azd auth login
      --client-id "${{ vars.AZURE_CLIENT_ID }}"
      --tenant-id "${{ vars.AZURE_TENANT_ID }}"
      --federated-credential-provider github
```

Provisione ou implante após o login, com ambiente, assinatura e local AZD configurados conforme pretendido. A credencial federada da identidade deve confiar no repositório/ref ou ambiente GitHub do workflow, e suas funções Azure devem permitir as operações solicitadas.

---

## Modelos & Projetos

### P: Onde posso encontrar modelos azd?
**R**: 
- Modelos oficiais e da comunidade: [Awesome AZD](https://azure.github.io/awesome-azd/)
- Modelos da comunidade: busca no GitHub por "azd-template"
- Use `azd template list` para navegar nos modelos disponíveis

### P: Como crio um modelo personalizado?
**R**: 
1. Comece com uma estrutura de modelo existente
2. Modifique `azure.yaml`, arquivos de infraestrutura e código do aplicativo
3. Teste exaustivamente com `azd up`
4. Publique no GitHub com tags apropriadas

### P: Posso usar azd sem um modelo?
**R**: Sim, use `azd init` em um projeto existente para criar os arquivos de configuração necessários. Será necessário configurar manualmente `azure.yaml` e arquivos de infraestrutura.

### P: Qual a diferença entre modelos oficiais e da comunidade?
**R**: 
- **Modelos oficiais**: Mantidos pela Microsoft, atualizados regularmente, documentação abrangente
- **Modelos da comunidade**: Criados por desenvolvedores, podem ter casos de uso especializados, qualidade e manutenção variáveis

### P: Como atualizo um modelo no meu projeto?
**R**: Modelos não são atualizados automaticamente. Você pode:
1. Comparar e mesclar manualmente alterações do modelo fonte
2. Começar do zero com `azd init` usando o modelo atualizado
3. Selecionar melhorias específicas de modelos atualizados

---

## Implantação & Infraestrutura

### P: Quais serviços Azure azd pode implantar?
**R**: azd pode implantar qualquer serviço Azure via modelos Bicep/ARM, incluindo:
- App Services, Container Apps, Functions
- Bancos de dados (SQL, PostgreSQL, Cosmos DB)
- Armazenamento, Key Vault, Application Insights
- Redes, segurança e recursos de monitoramento

### P: Posso implantar em múltiplas regiões?
**R**: Sim, configure múltiplas regiões em seus modelos Bicep e defina o parâmetro de local apropriadamente para cada ambiente.

### P: Como gerencio migrações de esquema de banco de dados?
**R**: Use ganchos de implantação em `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### P: Posso implantar só a infraestrutura sem aplicações?
**R**: Sim, use `azd provision` para implantar apenas os componentes de infraestrutura definidos nos seus modelos.

### P: Como implanto em recursos Azure existentes?
**R**: Sim, quando o modelo suportar. Faça referência a recursos existentes com declarações `existing` do Bicep ou parâmetros documentados de recursos existentes do modelo, e mapeie serviços de aplicação para seus alvos pretendidos. Isso não importa propriedade nem cria permissões automaticamente. Revise o modelo antes da implantação.

### P: Posso usar Terraform em vez de Bicep?
**R**: Sim. AZD suporta Terraform assim como Bicep. Selecione um modelo baseado em Terraform ou configure `infra.provider: terraform` em `azure.yaml`, com arquivos Terraform e configuração de estado/backend apropriados. Veja o [fluxo de trabalho Terraform](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

---

## Configuração & Ambientes

### P: Como gerencio diferentes ambientes (dev, staging, prod)?
**R**: Crie ambientes separados com `azd env new <environment-name>` e configure configurações diferentes para cada um:
```bash
azd env new development
azd env new staging  
azd env new production
```

### P: Onde as configurações de ambiente são armazenadas?
**R**: Na pasta `.azure` dentro do diretório do seu projeto. Cada ambiente possui sua própria pasta com arquivos de configuração.

### P: Como defino configurações específicas por ambiente?
**R**: Use `azd env set` para configurar variáveis de ambiente:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### P: Posso compartilhar configurações de ambiente entre membros da equipe?
**R**: A pasta `.azure` contém informações sensíveis e não deve ser versionada. Em vez disso:
1. Documente as variáveis de ambiente necessárias
2. Use scripts de implantação para configurar ambientes
3. Utilize Azure Key Vault para configurações sensíveis

### P: Como sobrescrevo padrões do modelo?
**R**: Defina variáveis de ambiente que correspondam a parâmetros do modelo:
```bash
azd env set AZURE_LOCATION westus2
azd env set SKU_NAME "B1"
```

Apenas variáveis consumidas pelo modelo afetam a implantação. `SKU_NAME` acima é um exemplo de entrada personalizada, não uma configuração AZD universal.

---

## Solução de Problemas

### P: Por que `azd up` está falhando?
**R**: Causas comuns:
1. **Problemas de autenticação**: Execute `azd auth login`
2. **Permissões insuficientes**: Verifique suas atribuições de função Azure
3. **Conflitos de nomeação de recurso**: Revise o recurso conflituante e as entradas de nomeação do modelo; crie um ambiente separado com `azd env new` quando for necessária isolação
4. **Problemas de cota/capacidade**: Verifique disponibilidade regional
5. **Erros no modelo**: Valide modelos Bicep

### P: Como faço para depurar falhas na implantação?
**R**: 
1. Use `azd deploy --debug` para saída detalhada
2. Verifique histórico de implantação no portal Azure
3. Revise o Log de Atividades no portal Azure
4. Use `azd show` para mostrar estado atual do ambiente

### P: Por que minhas variáveis de ambiente não estão funcionando?
**R**: Verifique:
1. Nomes de variável correspondem exatamente aos parâmetros do modelo
2. Valores estão corretamente entre aspas se possuem espaços
3. Ambiente está selecionado: `azd env select <environment>`
4. Variáveis estão definidas no ambiente correto

### P: Como limpo implantações com falha?
**R**: 
```bash
azd down
```
Revise primeiro o ambiente selecionado e a confirmação de exclusão. Isso exclui recursos Azure provisionados, não a configuração local do ambiente `.azure`. `--purge` solicita adicionalmente exclusão permanente de recursos com exclusão suave suportada e pode ser bloqueado por proteção de retenção/purga; não é um passo rotineiro de recuperação.

### P: Por que minha aplicação não está acessível após a implantação?
**R**: Verifique:
1. Implantação foi concluída com sucesso
2. Aplicação está rodando (verifique logs no portal Azure)
3. Grupos de segurança de rede permitem tráfego
4. DNS/domínios personalizados estão configurados corretamente

---

## Custos & Faturamento

### P: Quanto custarão as implantações azd?
**R**: Custos dependem de:
- Serviços Azure implantados
- Níveis/SKUs de serviço selecionados
- Diferenças regionais de preço
- Padrões de uso

Use a [Calculadora de Preços do Azure](https://azure.microsoft.com/pricing/calculator/) para estimativas.

### P: Como controlo custos em implantações azd?
**R**: 
1. Use SKUs de nível inferior para ambientes de desenvolvimento
2. Configure orçamentos e alertas no Azure
3. Use `azd down` para remover recursos quando não necessários
4. Escolha regiões apropriadas (custos variam por local)
5. Utilize ferramentas de Gestão de Custos do Azure

### P: Existem opções de nível gratuito para os templates azd?
**R**: Alguns serviços possuem SKUs gratuitos ou créditos mensais, sujeitos a elegibilidade, plano de hospedagem, região e limites de assinatura. Isso não faz o template inteiro ser gratuito: bancos de dados, pesquisa, rede, registro, telemetria e inferência de modelo podem gerar cobranças independentemente. Confira a [lista de serviços gratuitos do Azure](https://azure.microsoft.com/free/) e os preços atuais de cada recurso antes da implantação.

### P: Como faço para estimar custos antes da implantação?
**R**: 
1. Revise o `main.bicep` do template para ver quais recursos serão criados
2. Use a Calculadora de Preços do Azure com SKUs específicos
3. Faça a implantação primeiro em um ambiente de desenvolvimento para monitorar custos reais
4. Use o Gerenciamento de Custos do Azure para análise detalhada de custos

---

## Melhores Práticas

### P: Quais são as melhores práticas para a estrutura de projetos azd?
**R**: 
1. Mantenha o código da aplicação separado da infraestrutura
2. Use nomes significativos para serviços em `azure.yaml`
3. Implemente tratamento adequado de erros nos scripts de build
4. Use configurações específicas para cada ambiente
5. Inclua documentação abrangente

### P: Como devo organizar múltiplos serviços no azd?
**R**: Use a estrutura recomendada:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### P: Devo commitar a pasta `.azure` no controle de versão?
**R**: **Não!** A pasta `.azure` contém informações sensíveis. Adicione-a ao `.gitignore`:
```gitignore
.azure/
```

### P: Como devo lidar com segredos e configurações sensíveis?
**R**: 
1. Use o Azure Key Vault para segredos
2. Faça referência aos segredos do Key Vault nas configurações da aplicação
3. Nunca commite segredos no controle de versão
4. Use identidades gerenciadas para autenticação entre serviços

### P: Qual a abordagem recomendada para CI/CD com azd?
**R**: 
1. Use ambientes separados para cada estágio (dev/homolog/prod)
2. Implemente testes automatizados antes da implantação
3. Use principiantes de serviço para autenticação
4. Armazene configurações sensíveis em segredos/variáveis do pipeline
5. Implemente gates de aprovação para implantações em produção

---

## Tópicos Avançados

### P: Posso estender o azd com funcionalidades customizadas?
**R**: Sim, através de hooks de implantação em `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### P: Como integro azd com processos DevOps existentes?
**R**: 
1. Use comandos azd nos scripts de pipeline existentes
2. Padronize o uso de templates azd entre equipes
3. Integre com monitoramento e alertas existentes
4. Use a saída JSON do azd para integração no pipeline

### P: Posso usar azd com Azure DevOps?
**R**: Sim, azd funciona com qualquer sistema de CI/CD. Crie pipelines no Azure DevOps que usem comandos azd.

### P: Como contribuo para azd ou crio templates comunitários?
**R**: 
1. **ferramenta azd**: Contribua para [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Templates**: Siga as [instruções de contribuição para a galeria Awesome AZD](https://github.com/Azure/awesome-azd#3-contribute-to-gallery)
3. **Documentação**: Contribua para os docs em [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### P: Qual é o roadmap do azd?
**R**: Veja o [roadmap oficial](https://github.com/Azure/azure-dev/projects) para funcionalidades planejadas e melhorias.

### P: Como migro de outras ferramentas de implantação para azd?
**R**: 
1. Analise a arquitetura atual de implantação
2. Crie templates Bicep equivalentes
3. Configure `azure.yaml` para corresponder aos serviços atuais
4. Teste exaustivamente no ambiente de desenvolvimento
5. Migre os ambientes gradualmente

---

## Ainda Tem Dúvidas?

### **Pesquise Primeiro**
- Confira a [documentação oficial](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Pesquise em [problemas no GitHub](https://github.com/Azure/azure-dev/issues) por problemas semelhantes

### **Obtenha Ajuda**
- [Discussões no GitHub](https://github.com/Azure/azure-dev/discussions) - Suporte da comunidade
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Perguntas técnicas
- [Azure Discord](https://discord.gg/azure) - Chat da comunidade em tempo real

### **Reporte Problemas**
- [Issues no GitHub](https://github.com/Azure/azure-dev/issues/new) - Relatórios de bugs e solicitações de recursos
- Inclua logs relevantes, mensagens de erro e passos para reproduzir

### **Saiba Mais**
- [Documentação do Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centro de Arquitetura do Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Framework Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Orientação técnica revisada: 4 de novembro de 2026. Disponibilidade na nuvem e preços devem ser verificados para sua assinatura e região.*

---

**Navegação**
- **Lição Anterior**: [Glossário](glossary.md)
- **Próxima Lição**: [Guia de Estudo](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->