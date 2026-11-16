# Perguntas Frequentes (FAQ)

**Obter Ajuda por Capítulo**
- **📚 Página Inicial do Curso**: [AZD Para Principiantes](../README.md)
- **🚆 Problemas de Instalação**: [Capítulo 1: Instalação & Configuração](../docs/chapter-01-foundation/installation.md)
- **🤖 Questões sobre IA**: [Capítulo 2: Desenvolvimento AI-First](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🔧 Resolução de Problemas**: [Capítulo 7: Resolução de Problemas & Depuração](../docs/chapter-07-troubleshooting/common-issues.md)

## Introdução

Esta FAQ abrangente fornece respostas às perguntas mais comuns sobre Azure Developer CLI (azd) e implementações Azure. Encontre soluções rápidas para problemas comuns, compreenda boas práticas e obtenha esclarecimentos sobre os conceitos e fluxos de trabalho do azd.

## Objetivos de Aprendizagem

Ao rever esta FAQ, você irá:
- Encontrar respostas rápidas para dúvidas comuns sobre Azure Developer CLI
- Compreender conceitos e terminologia fundamentais através de perguntas e respostas práticas
- Aceder a soluções para resolução de problemas frequentes e cenários de erro
- Aprender boas práticas por meio de perguntas comuns sobre otimização
- Descobrir funcionalidades avançadas e capacidades através de questões para especialistas
- Consultar orientações sobre custos, segurança e estratégias de implantação de forma eficiente

## Resultados de Aprendizagem

Com a consulta regular a esta FAQ, você será capaz de:
- Resolver problemas comuns do Azure Developer CLI de forma independente usando as soluções fornecidas
- Tomar decisões informadas sobre estratégias e configurações de implantação
- Compreender a relação entre azd e outras ferramentas e serviços Azure
- Aplicar boas práticas baseadas na experiência da comunidade e recomendações de especialistas
- Resolver problemas de autenticação, implantação e configuração eficazmente
- Otimizar custos e desempenho usando os insights e recomendações da FAQ

## Índice

- [Começar](#getting-started)
- [Autenticação & Acesso](#authentication--access)
- [Modelos & Projetos](#templates--projects)
- [Implantação & Infraestrutura](#deployment--infrastructure)
- [Configuração & Ambientes](#configuration--environments)
- [Resolução de Problemas](#troubleshooting)
- [Custo & Faturação](#cost--billing)
- [Boas Práticas](#best-practices)
- [Tópicos Avançados](#advanced-topics)

---

## Começar

### Q: O que é o Azure Developer CLI (azd)?
**R**: Azure Developer CLI (azd) é uma ferramenta de linha de comando focada no programador que acelera o tempo desde o ambiente de desenvolvimento local até o Azure. Fornece boas práticas através de modelos e ajuda durante todo o ciclo de vida da implantação.

### Q: Como é que o azd difere do Azure CLI?
**R**: 
- **Azure CLI**: Ferramenta de uso geral para gerir recursos Azure
- **azd**: Ferramenta focada no programador para fluxos de trabalho de implantação de aplicações
- azd tem o seu próprio fluxo de autenticação e implantação; Azure CLI é uma ferramenta separada e complementar
- azd inclui modelos, gestão de ambientes e automação de implantação

### Q: Preciso de ter o Azure CLI instalado para usar o azd?
**R**: Não para o fluxo principal do AZD. Autentique-se com `azd auth login`. Instale separadamente o Azure CLI quando um gancho do modelo ou exercício executar explicitamente comandos `az`.

### Q: Que linguagens de programação são suportadas pelo azd?
**R**: azd é independente da linguagem. Funciona com:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Sites estáticos
- Aplicações conteinerizadas

### Q: Posso usar o azd com projetos existentes?
**R**: Sim! Pode:
1. Usar `azd init` para adicionar configuração azd a projetos existentes
2. Adaptar projetos existentes para corresponder à estrutura do modelo azd
3. Criar modelos personalizados baseados na sua arquitetura atual

---

## Autenticação & Acesso

### Q: Como me autentico no Azure usando azd?
**R**: Use `azd auth login` que abrirá uma janela do navegador para autenticação no Azure. Para cenários CI/CD, use principais de serviço ou identidades geridas.

### Q: Posso usar azd com várias subscrições Azure?
**R**: Sim. Use `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` para especificar qual subscrição usar em cada ambiente.

### Q: Que permissões preciso para implantar com o azd?
**R**: Normalmente precisa de:
- Papel **Contributor** no grupo de recursos ou subscrição
- **Administrador de Acesso ao Utilizador** se implantar recursos que requerem atribuições de papéis
- Permissões específicas variam conforme o modelo e recursos implantados

### Q: Posso usar azd em pipelines CI/CD?
**R**: Absolutamente! azd foi concebido para integração CI/CD. Use principais de serviço para autenticação e defina variáveis de ambiente para configuração.

### Q: Como gerir autenticação no GitHub Actions?
**R**: Prefira federação de identidade de carga de trabalho (OIDC), configurada com `azd pipeline config`. O fluxo de trabalho gerado instala AZD e autentica AZD diretamente com identidade federada. Um passo `azure/login` sozinho não estabelece login no AZD. Um passo de login dentro de um trabalho existente é:
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

Provisione ou implante após o login, com o ambiente, subscrição e localização AZD pretendidos configurados. A credencial federada da identidade deve confiar no repositório/ref do fluxo de trabalho ou no ambiente GitHub, e os seus papéis Azure devem permitir as operações solicitadas.

---

## Modelos & Projetos

### Q: Onde posso encontrar modelos azd?
**R**: 
- Modelos oficiais e da comunidade: [Awesome AZD](https://azure.github.io/awesome-azd/)
- Modelos da comunidade: Pesquisa no GitHub por "azd-template"
- Use `azd template list` para navegar pelos modelos disponíveis

### Q: Como criar um modelo personalizado?
**R**: 
1. Comece com a estrutura de um modelo existente
2. Modifique `azure.yaml`, ficheiros de infraestrutura e código da aplicação
3. Teste exaustivamente com `azd up`
4. Publique no GitHub com as etiquetas apropriadas

### Q: Posso usar azd sem um modelo?
**R**: Sim, use `azd init` num projeto existente para criar os ficheiros de configuração necessários. Terá de configurar manualmente `azure.yaml` e os ficheiros de infraestrutura.

### Q: Qual é a diferença entre modelos oficiais e da comunidade?
**R**: 
- **Modelos oficiais**: Mantidos pela Microsoft, atualizados regularmente, documentação abrangente
- **Modelos da comunidade**: Criados por programadores, podem ter casos de uso especializados, qualidade e manutenção variadas

### Q: Como atualizar um modelo no meu projeto?
**R**: Modelos não são atualizados automaticamente. Pode:
1. Comparar e mesclar manualmente as alterações do modelo de origem
2. Começar do zero com `azd init` usando o modelo atualizado
3. Escolher melhorias específicas de modelos atualizados

---

## Implantação & Infraestrutura

### Q: Quais serviços Azure podem ser implantados com azd?
**R**: azd pode implantar qualquer serviço Azure via modelos Bicep/ARM, incluindo:
- Serviços de Aplicação, Container Apps, Functions
- Bases de dados (SQL, PostgreSQL, Cosmos DB)
- Armazenamento, Key Vault, Application Insights
- Recursos de rede, segurança e monitorização

### Q: Posso implantar em múltiplas regiões?
**R**: Sim, configure múltiplas regiões nos seus modelos Bicep e defina adequadamente o parâmetro de localização para cada ambiente.

### Q: Como gerir migrações de esquema de base de dados?
**R**: Use ganchos de implantação em `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Q: Posso implantar só a infraestrutura sem as aplicações?
**R**: Sim, use `azd provision` para implantar apenas os componentes de infraestrutura definidos nos seus modelos.

### Q: Como implantar em recursos Azure existentes?
**R**: Sim, quando o modelo permitir. Referencie recursos existentes com declarações `existing` do Bicep ou parâmetros de recursos existentes documentados no modelo, e mapeie serviços de aplicação aos seus alvos pretendidos. Isto não importa propriedade nem cria permissões automaticamente. Reveja o modelo antes de implantar.

### Q: Posso usar Terraform em vez de Bicep?
**R**: Sim. AZD suporta Terraform assim como Bicep. Selecione um modelo baseado em Terraform ou configure `infra.provider: terraform` em `azure.yaml`, com ficheiros Terraform apropriados e configuração de estado/backend. Veja o [fluxo de trabalho Terraform](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

---

## Configuração & Ambientes

### Q: Como gerir diferentes ambientes (dev, staging, prod)?
**R**: Crie ambientes separados com `azd env new <environment-name>` e configure definições diferentes para cada um:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Q: Onde estão armazenadas as configurações do ambiente?
**R**: Na pasta `.azure` dentro do diretório do seu projeto. Cada ambiente tem a sua própria pasta com ficheiros de configuração.

### Q: Como definir configuração específica do ambiente?
**R**: Use `azd env set` para configurar variáveis de ambiente:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q: Posso partilhar configurações de ambiente entre membros da equipa?
**R**: A pasta `.azure` contém informação sensível e não deve ser incluída no controlo de versões. Em vez disso:
1. Documente as variáveis de ambiente necessárias
2. Use scripts de implantação para configurar ambientes
3. Utilize Azure Key Vault para configuração sensível

### Q: Como sobrescrever os valores padrão do modelo?
**R**: Defina variáveis de ambiente que correspondam a parâmetros do modelo:
```bash
azd env set AZURE_LOCATION westus2
azd env set SKU_NAME "B1"
```

Só as variáveis consumidas pelo modelo afetam a implantação. `SKU_NAME` acima é um exemplo de entrada personalizada, não uma definição universal do AZD.

---

## Resolução de Problemas

### Q: Porque é que `azd up` está a falhar?
**R**: Causas comuns:
1. **Problemas de autenticação**: Execute `azd auth login`
2. **Permissões insuficientes**: Verifique as suas atribuições de papéis Azure
3. **Conflitos de nomes de recursos**: Reveja o recurso conflituoso e os parâmetros de nomenclatura do modelo; crie um ambiente separado com `azd env new` em caso de necessário isolamento
4. **Problemas de quotas/capacidade**: Verifique a disponibilidade regional
5. **Erros no modelo**: Valide os modelos Bicep

### Q: Como depurar falhas de implantação?
**R**: 
1. Use `azd deploy --debug` para saída detalhada
2. Verifique o histórico de implantações no portal Azure
3. Reveja o Registo de Atividades no portal Azure
4. Use `azd show` para mostrar o estado atual do ambiente

### Q: Porque é que as minhas variáveis de ambiente não funcionam?
**R**: Verifique:
1. Os nomes das variáveis correspondem exatamente aos parâmetros do modelo
2. Os valores estão corretamente entre aspas se contiverem espaços
3. O ambiente está selecionado: `azd env select <environment>`
4. As variáveis estão definidas no ambiente correto

### Q: Como limpar implantações falhadas?
**R**: 
```bash
azd down
```
Reveja primeiro o ambiente selecionado e a confirmação de eliminação. Isto elimina recursos Azure provisionados, não a configuração do ambiente local `.azure`. `--purge` solicita adicionalmente a eliminação permanente de recursos suportados como "soft deleted" e pode ser bloqueado por retenção/proteção de limpeza; não é um passo rotineiro de recuperação.

### Q: Porque é que a minha aplicação não está acessível após a implantação?
**R**: Verifique:
1. A implantação foi concluída com sucesso
2. A aplicação está em execução (verifique logs no portal Azure)
3. Grupos de segurança de rede permitem tráfego
4. Domínios DNS/personalizados estão configurados corretamente

---

## Custo & Faturação

### Q: Quanto custarão as implantações azd?
**R**: Custos dependem de:
- Serviços Azure implantados
- Níveis/SKUs dos serviços selecionados
- Diferenças de preços regionais
- Padrões de utilização

Use a [Calculadora de Preços Azure](https://azure.microsoft.com/pricing/calculator/) para estimativas.

### Q: Como controlar custos em implantações azd?
**R**: 
1. Use SKUs de nível inferior para ambientes de desenvolvimento
2. Configure orçamentos e alertas Azure
3. Use `azd down` para remover recursos quando não forem necessários
4. Escolha regiões apropriadas (custos variam por localização)
5. Use ferramentas Azure Cost Management

### Q: Existem opções gratuitas para modelos azd?
**R**: Alguns serviços têm SKUs gratuitos ou subsídios mensais, sujeitos a elegibilidade, plano de alojamento, região e limites da subscrição. Estes não tornam todo o modelo gratuito: bases de dados, pesquisa, rede, registo, telemetria e inferência de modelos podem incorrer em custos independentes. Verifique a [lista de serviços gratuitos Azure](https://azure.microsoft.com/free/) e preços atuais para cada recurso antes de implantar.

### Q: Como estimar custos antes da implantação?
**R**: 
1. Reveja `main.bicep` do modelo para ver que recursos são criados
2. Use a Calculadora de Preços Azure com SKUs específicos
3. Implante primeiro num ambiente de desenvolvimento para monitorizar custos reais
4. Use Azure Cost Management para análise detalhada de custos

---

## Boas Práticas

### Q: Quais são as melhores práticas para a estrutura do projeto azd?
**R**: 
1. Separe o código da aplicação da infraestrutura
2. Use nomes de serviços significativos em `azure.yaml`
3. Implemente tratamento adequado de erros nos scripts de construção
4. Use configuração específica do ambiente
5. Inclua documentação abrangente

### Q: Como organizar múltiplos serviços em azd?
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

### Q: Devo incluir a pasta `.azure` no controlo de versões?
**R**: **Não!** A pasta `.azure` contém informação sensível. Adicione-a a `.gitignore`:
```gitignore
.azure/
```

### P: Como é que gerencio segredos e configuração sensível?
**R**: 
1. Utilize o Azure Key Vault para segredos
2. Referencie segredos do Key Vault na configuração da aplicação
3. Nunca faça commit de segredos para o controlo de versões
4. Utilize identidades geridas para autenticação entre serviços

### P: Qual é a abordagem recomendada para CI/CD com azd?
**R**: 
1. Utilize ambientes separados para cada fase (dev/staging/prod)
2. Implemente testes automatizados antes da implementação
3. Utilize service principals para autenticação
4. Armazene configuração sensível em segredos/variáveis do pipeline
5. Implemente portões de aprovação para deploys em produção

---

## Temas Avançados

### P: Posso estender o azd com funcionalidades personalizadas?
**R**: Sim, através de hooks de implantação em `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### P: Como é que integro o azd com processos DevOps existentes?
**R**: 
1. Utilize comandos azd em scripts de pipeline existentes
2. Standardize templates azd entre equipas
3. Integre com monitorização e alertas existentes
4. Utilize a saída JSON do azd para integração de pipeline

### P: Posso usar azd com Azure DevOps?
**R**: Sim, o azd funciona com qualquer sistema CI/CD. Crie pipelines Azure DevOps que usem comandos azd.

### P: Como contribuo para o azd ou crio templates comunitários?
**R**: 
1. **Ferramenta azd**: Contribua para [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Templates**: Siga as [instruções de contribuição da galeria Awesome AZD](https://github.com/Azure/awesome-azd#3-contribute-to-gallery)
3. **Documentação**: Contribua para docs em [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### P: Qual é a roadmap para o azd?
**R**: Consulte a [roadmap oficial](https://github.com/Azure/azure-dev/projects) para funcionalidades planeadas e melhorias.

### P: Como faço migração de outras ferramentas de deployment para azd?
**R**: 
1. Analise a arquitetura actual de deployment
2. Crie templates Bicep equivalentes
3. Configure `azure.yaml` para corresponder aos serviços atuais
4. Teste exaustivamente no ambiente de desenvolvimento
5. Migre ambientes progressivamente

---

## Ainda tem Perguntas?

### **Procure Primeiro**
- Consulte a [documentação oficial](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Procure em [problemas do GitHub](https://github.com/Azure/azure-dev/issues) por problemas semelhantes

### **Obtenha Ajuda**
- [Discussões no GitHub](https://github.com/Azure/azure-dev/discussions) - Suporte da comunidade
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Perguntas técnicas
- [Azure Discord](https://discord.gg/azure) - Chat da comunidade em tempo real

### **Reporte Problemas**
- [Problemas no GitHub](https://github.com/Azure/azure-dev/issues/new) - Reporte de bugs e pedidos de funcionalidades
- Inclua logs relevantes, mensagens de erro e passos para reproduzir

### **Saiba Mais**
- [Documentação do Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centro de Arquitectura Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Framework Azure Bem-Arquitetado](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Orientação técnica revista: 4 de Novembro de 2026. A disponibilidade e preços na cloud devem ser verificados para a sua subscrição e região.*

---

**Navegação**
- **Lição Anterior**: [Glossário](glossary.md)
- **Próxima Lição**: [Guia de Estudo](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->