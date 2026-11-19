# Perguntas Frequentes (FAQ)

**Obter Ajuda por Capítulo**
- **📚 Página Inicial do Curso**: [AZD para Principiantes](../README.md)
- **🚆 Problemas de Instalação**: [Capítulo 1: Instalação & Configuração](../docs/chapter-01-foundation/installation.md)
- **🤖 Perguntas sobre IA**: [Capítulo 2: Desenvolvimento com IA em Primeiro Lugar](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🔧 Resolução de Problemas**: [Capítulo 7: Resolução de Problemas & Depuração](../docs/chapter-07-troubleshooting/common-issues.md)

## Introdução

Esta FAQ abrangente fornece respostas às perguntas mais comuns sobre Azure Developer CLI (azd) e implantações no Azure. Encontre soluções rápidas para problemas comuns, compreenda as melhores práticas e obtenha esclarecimentos sobre conceitos e fluxos de trabalho do azd.

## Objetivos de Aprendizagem

Ao rever esta FAQ, irá:
- Encontrar respostas rápidas para perguntas e problemas comuns do Azure Developer CLI
- Compreender conceitos-chave e terminologia através de formato prático de perguntas e respostas
- Aceder a soluções de resolução de problemas para problemas frequentes e cenários de erro
- Aprender melhores práticas através de perguntas frequentes sobre otimização
- Descobrir funcionalidades avançadas e capacidades através de perguntas a nível especialista
- Consultar orientações sobre custos, segurança e estratégias de implantação de forma eficiente

## Resultados Esperados

Com referência regular a esta FAQ, será capaz de:
- Resolver problemas comuns do Azure Developer CLI de forma independente usando as soluções fornecidas
- Tomar decisões informadas sobre estratégias e configurações de implantação
- Compreender a relação entre azd e outras ferramentas e serviços do Azure
- Aplicar melhores práticas baseadas na experiência da comunidade e recomendações de especialistas
- Resolver problemas de autenticação, implantação e configuração de forma eficaz
- Otimizar custos e desempenho usando informações e recomendações da FAQ

## Índice

- [Primeiros Passos](#getting-started)
- [Autenticação & Acesso](#authentication--access)
- [Modelos & Projetos](#templates--projects)
- [Implantação & Infraestrutura](#deployment--infrastructure)
- [Configuração & Ambientes](#configuration--environments)
- [Resolução de Problemas](#troubleshooting)
- [Custos & Faturação](#cost--billing)
- [Melhores Práticas](#best-practices)
- [Tópicos Avançados](#advanced-topics)

---

## Primeiros Passos

### P: O que é o Azure Developer CLI (azd)?
**R**: Azure Developer CLI (azd) é uma ferramenta de linha de comando centrada no programador que acelera o tempo necessário para que você leve a sua aplicação do ambiente local de desenvolvimento para o Azure. Oferece melhores práticas através de modelos e ajuda em todo o ciclo de vida da implantação.

### P: Qual é a diferença entre azd e Azure CLI?
**R**: 
- **Azure CLI**: Ferramenta de uso geral para gerir recursos do Azure
- **azd**: Ferramenta focada no programador para fluxos de trabalho de implantação de aplicações
- azd tem o seu próprio fluxo de autenticação e implantação; Azure CLI é uma ferramenta complementar e separada
- azd inclui modelos, gestão de ambientes e automação de implantação

### P: Preciso de ter Azure CLI instalado para usar azd?
**R**: Não para o fluxo AZD principal. Autentique-se com `azd auth login`. Instale Azure CLI separadamente quando um gancho do modelo ou um exercício executar explicitamente comandos `az`.

### P: Que linguagens de programação o azd suporta?
**R**: azd é independente de linguagem. Funciona com:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Websites estáticos
- Aplicações conteinerizadas

### P: Posso usar azd com projetos existentes?
**R**: Sim! Pode:
1. Usar `azd init` para adicionar configuração azd a projetos existentes
2. Adaptar projetos existentes para corresponder à estrutura do modelo azd
3. Criar modelos personalizados baseados na sua arquitetura existente

### P: O que mudou com a disponibilidade geral da extensão Foundry?
**R**: O conjunto `microsoft.foundry` alcançou a versão 1.0 e GA a 5 de novembro de 2026. Com AZD 1.37.0+, use `azd ext install microsoft.foundry` para instalar sete extensões principais para agentes, conexões, inspetor, projetos, rotinas, competências e caixas de ferramentas. Não é um novo namespace de comandos e seus componentes são versionados independentemente. Avaliações, conjuntos de dados, afinação fina e modelos personalizados são instalados separadamente; funcionalidades opcionais em pré-visualização não se tornam GA apenas porque o conjunto seja GA.

O [tutorial do agente hospedado](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) usa Python 3.13+ e uv atual. `azd ai agent run` abre o Inspetor de Agentes localmente, mas chamadas de modelo ainda usam Azure e implicam custos. O modo de código `azd deploy` carrega código para construção remota sem necessidade de construir container localmente.

### P: `azd down` remove um agente hospedado de um projeto Foundry existente?
**R**: Não para o caminho de projeto reutilizado descrito no início rápido do agente hospedado: deixa o projeto, agente hospedado e outros recursos no lugar. Remova recursos indesejados separadamente sem apagar recursos partilhados. Se o ambiente criou um novo projeto Foundry, `azd down` elimina o respetivo grupo de recursos e tudo nele. Reveja as [orientações de limpeza](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#7-clean-up-deliberately) e prompts de eliminação antes de confirmar.

---

## Autenticação & Acesso

### P: Como me autentico no Azure usando azd?
**R**: Use `azd auth login` que abrirá uma janela do navegador para autenticação no Azure. Para cenários de CI/CD, use identidades geridas ou principais de serviço.

### P: Posso usar azd com múltiplas subscrições Azure?
**R**: Sim. Use `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` para especificar qual subscrição utilizar para cada ambiente.

### P: Que permissões preciso para implantar com azd?
**R**: Normalmente precisa de:
- Função **Contribuinte** no grupo de recursos ou subscrição
- Função **Administrador de Acesso de Utilizadores** se implantar recursos que requerem atribuições de função
- Permissões específicas variam conforme o modelo e recursos a implantar

### P: Posso usar azd em pipelines CI/CD?
**R**: Absolutamente! azd é desenhado para integração CI/CD. Use principais de serviço para autenticação e defina variáveis de ambiente para configuração.

### P: Como gerir a autenticação no GitHub Actions?
**R**: Prefira federação de identidade workload (OIDC), configurada com `azd pipeline config`. O fluxo gerado instala AZD e autentica AZD diretamente com identidade federada. Um passo `azure/login` sozinho não estabelece um login AZD. Um passo de login dentro de um trabalho já existente é:
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

Provisione ou implante após o login, com o ambiente AZD, subscrição e localização pretendidos configurados. A credencial federada da identidade deve confiar no repositório/ref do fluxo de trabalho ou ambiente GitHub, e as suas funções Azure devem permitir as operações solicitadas.

---

## Modelos & Projetos

### P: Onde posso encontrar modelos azd?
**R**: 
- Modelos oficiais e da comunidade: [Awesome AZD](https://azure.github.io/awesome-azd/)
- Modelos da comunidade: Pesquisa GitHub por "azd-template"
- Use `azd template list` para navegar pelos modelos disponíveis

### P: Como criar um modelo personalizado?
**R**: 
1. Comece com a estrutura de um modelo existente
2. Modifique `azure.yaml`, os ficheiros de infraestrutura e código da aplicação
3. Teste cuidadosamente com `azd up`
4. Publique no GitHub com etiquetas apropriadas

### P: Posso usar azd sem um modelo?
**R**: Sim, use `azd init` num projeto existente para criar os ficheiros de configuração necessários. Terá que configurar manualmente `azure.yaml` e ficheiros de infraestrutura.

### P: Qual a diferença entre modelos oficiais e da comunidade?
**R**: 
- **Modelos oficiais**: Mantidos pela Microsoft, atualizados regularmente, documentação abrangente
- **Modelos da comunidade**: Criados por programadores, podem ter casos de uso especializados, qualidade e manutenção variáveis

### P: Como atualizo um modelo no meu projeto?
**R**: Modelos não são atualizados automaticamente. Pode:
1. Comparar e integrar manualmente alterações do modelo fonte
2. Começar de novo com `azd init` usando o modelo atualizado
3. Escolher melhorias específicas dos modelos atualizados

---

## Implantação & Infraestrutura

### P: Que serviços Azure pode implantar azd?
**R**: azd pode implantar qualquer serviço Azure através de modelos Bicep/ARM, incluindo:
- App Services, Container Apps, Functions
- Bases de dados (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Rede, segurança e recursos de monitorização

### P: Posso implantar para múltiplas regiões?
**R**: Sim, configure múltiplas regiões nos seus modelos Bicep e defina o parâmetro localização adequadamente para cada ambiente.

### P: Como gerir migrações de esquemas de bases de dados?
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

### P: Como implanto para recursos Azure existentes?
**R**: Sim, quando o modelo suportar. Referencie recursos existentes com declarações `existing` do Bicep ou parâmetros de recursos existentes documentados no modelo, e mapeie os serviços da aplicação aos seus destinos pretendidos. Isto não importa propriedade nem cria permissões em falta automaticamente. Reveja o modelo antes de implantar.

### P: Posso usar Terraform em vez de Bicep?
**R**: Sim. AZD suporta Terraform assim como Bicep. Selecione um modelo baseado em Terraform ou configure `infra.provider: terraform` em `azure.yaml`, com os ficheiros Terraform e configuração do estado/backend adequada. Veja o [fluxo de trabalho Terraform](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

---

## Configuração & Ambientes

### P: Como gerir diferentes ambientes (dev, staging, prod)?
**R**: Crie ambientes separados com `azd env new <environment-name>` e configure definições diferentes para cada um:
```bash
azd env new development
azd env new staging  
azd env new production
```

### P: Onde são guardadas as configurações de ambiente?
**R**: Na pasta `.azure` dentro do diretório do seu projeto. Cada ambiente tem a sua pasta com ficheiros de configuração.

### P: Como definir configuração específica de ambiente?
**R**: Use `azd env set` para configurar variáveis de ambiente:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### P: Posso partilhar configurações de ambiente entre membros da equipa?
**R**: A pasta `.azure` contém informação sensível e não deve ser incluída no controlo de versão. Em vez disso:
1. Documente variáveis de ambiente necessárias
2. Use scripts de implantação para configurar ambientes
3. Use Azure Key Vault para configuração sensível

### P: Como substituir as definições padrão do modelo?
**R**: Defina variáveis de ambiente que correspondam aos parâmetros do modelo:
```bash
azd env set AZURE_LOCATION westus2
azd env set SKU_NAME "B1"
```

Só as variáveis consumidas pelo modelo afetam a implantação. `SKU_NAME` acima é um exemplo de entrada personalizada, não uma definição universal do AZD.

---

## Resolução de Problemas

### P: Porque é que `azd up` está a falhar?
**R**: Causas comuns:
1. **Problemas de autenticação**: Execute `azd auth login`
2. **Permissões insuficientes**: Verifique as suas atribuições de função no Azure
3. **Conflitos de nomes de recursos**: Reveja o recurso em conflito e as entradas de nomenclatura do modelo; crie um ambiente separado com `azd env new` quando for necessária isolação
4. **Problemas de quota/capacidade**: Verifique a disponibilidade regional
5. **Erros no modelo**: Valide os modelos Bicep

### P: Como faço depuração de falhas na implantação?
**R**: 
1. Use `azd deploy --debug` para saída detalhada
2. Verifique o histórico de implantações no portal Azure
3. Reveja o Registo de Atividades no portal Azure
4. Use `azd show` para mostrar o estado atual do ambiente

### P: Porque é que as minhas variáveis de ambiente não estão a funcionar?
**R**: Verifique:
1. Os nomes das variáveis coincidem exatamente com os parâmetros do modelo
2. Os valores estão adequadamente citados se contiverem espaços
3. O ambiente está selecionado: `azd env select <environment>`
4. As variáveis estão definidas no ambiente correto

### P: Como faço a limpeza de implantações falhadas?
**R**: 
```bash
azd down
```
Revise primeiro o ambiente selecionado e a confirmação de eliminação. Isto apaga recursos Azure provisionados, não a configuração do ambiente local `.azure`. `--purge` solicita ainda a eliminação permanente de recursos apagados com suporte e pode ser bloqueado pela proteção de retenção/eliminação; não é um passo rotineiro de recuperação.

### P: Porque é que a minha aplicação não está acessível após a implantação?
**R**: Verifique:
1. A implantação completou com sucesso
2. A aplicação está a correr (verifique os registos no portal Azure)
3. Os grupos de segurança de rede permitem o tráfego
4. DNS/domínios personalizados estão configurados corretamente

---

## Custos & Faturação

### P: Quanto vão custar as implantações azd?
**R**: Os custos dependem de:
- Serviços Azure implantados
- Tier/sku dos serviços escolhidos
- Diferenças regionais de preços
- Padrões de utilização

Use a [Calculadora de Preços Azure](https://azure.microsoft.com/pricing/calculator/) para estimativas.

### P: Como controlo custos nas implantações azd?
**R**: 
1. Use SKUs de tiers inferiores para ambientes de desenvolvimento
2. Configure orçamentos e alertas Azure
3. Use `azd down` para remover recursos quando não necessários
4. Escolha regiões apropriadas (custos variam por localização)
5. Use ferramentas de Gestão de Custos Azure

### P: Existem opções gratuitas para modelos azd?
**R**: Alguns serviços têm SKUs gratuitos ou concessões mensais, sujeitos a elegibilidade, plano de alojamento, região e limites da subscrição. Estes não tornam todo o modelo gratuito: bases de dados, pesquisa, rede, registo, telemetria e inferência de modelos podem gerar custos independentes. Verifique a [lista de serviços gratuitos do Azure](https://azure.microsoft.com/free/) e os preços atuais de cada recurso antes da implementação.

### P: Como estimo custos antes da implementação?
**R**: 
1. Reveja o `main.bicep` do modelo para ver que recursos são criados
2. Utilize a Calculadora de Preços Azure com SKUs específicos
3. Implemente primeiro num ambiente de desenvolvimento para monitorizar os custos reais
4. Utilize o Azure Cost Management para análise detalhada de custos

---

## Boas Práticas

### P: Quais são as melhores práticas para a estrutura de projetos azd?
**R**: 
1. Mantenha o código da aplicação separado da infraestrutura
2. Use nomes de serviço significativos em `azure.yaml`
3. Implemente tratamento adequado de erros nos scripts de construção
4. Use configuração específica por ambiente
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

### P: Devo comitar a pasta `.azure` para controlo de versões?
**R**: **Não!** A pasta `.azure` contém informação sensível. Adicione-a a `.gitignore`:
```gitignore
.azure/
```

### P: Como gerir segredos e configuração sensível?
**R**: 
1. Use Azure Key Vault para segredos
2. Referencie segredos do Key Vault na configuração da aplicação
3. Nunca comite segredos para controlo de versões
4. Use identidades geridas para autenticação entre serviços

### P: Qual a abordagem recomendada para CI/CD com azd?
**R**: 
1. Use ambientes separados para cada fase (dev/testes/prod)
2. Implemente testes automatizados antes da implementação
3. Use service principals para autenticação
4. Armazene configuração sensível em segredos/variáveis no pipeline
5. Implemente gates de aprovação para implementações em produção

---

## Tópicos Avançados

### P: Posso estender o azd com funcionalidades personalizadas?
**R**: Sim, através de hooks de implementação em `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### P: Como integro o azd com processos DevOps existentes?
**R**: 
1. Use comandos azd em scripts pipeline existentes
2. Padronize modelos azd entre equipas
3. Integre com monitorização e alertas existentes
4. Use a saída JSON do azd para integração em pipeline

### P: Posso usar azd com Azure DevOps?
**R**: Sim, azd funciona com qualquer sistema CI/CD. Crie pipelines Azure DevOps que usem comandos azd.

### P: Como contribuo para azd ou crio modelos comunitários?
**R**: 
1. **Ferramenta azd**: Contribua para [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Modelos**: Siga as [instruções de contribuição da galeria Awesome AZD](https://github.com/Azure/awesome-azd#3-contribute-to-gallery)
3. **Documentação**: Contribua para os docs em [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### P: Qual o roadmap do azd?
**R**: Consulte o [roadmap oficial](https://github.com/Azure/azure-dev/projects) para funcionalidades e melhorias planeadas.

### P: Como faço a migração de outras ferramentas de implementação para azd?
**R**: 
1. Analise a arquitetura de implementação atual
2. Crie modelos Bicep equivalentes
3. Configure `azure.yaml` para corresponder aos serviços atuais
4. Teste exaustivamente em ambiente de desenvolvimento
5. Migre os ambientes gradualmente

---

## Ainda tem dúvidas?

### **Procure Primeiro**
- Consulte a [documentação oficial](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Pesquise [problemas no GitHub](https://github.com/Azure/azure-dev/issues) por problemas semelhantes

### **Obtenha Ajuda**
- [Discussões no GitHub](https://github.com/Azure/azure-dev/discussions) - Apoio da comunidade
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Questões técnicas
- [Discord Azure](https://discord.gg/azure) - Chat comunitário em tempo real

### **Reporte Problemas**
- [Problemas no GitHub](https://github.com/Azure/azure-dev/issues/new) - Relatórios de bugs e pedidos de funcionalidades
- Inclua logs relevantes, mensagens de erro e passos para reproduzir

### **Saiba Mais**
- [Documentação Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centro de Arquitetura Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Framework Azure Bem-Arquitetado](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Orientação técnica revista: 4 de novembro de 2026. A disponibilidade em cloud e preços devem ser verificados para a sua subscrição e região.*

---

**Navegação**
- **Lição Anterior**: [Glossário](glossary.md)
- **Próxima Lição**: [Guia de Estudo](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->