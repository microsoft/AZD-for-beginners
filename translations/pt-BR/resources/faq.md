# Perguntas Frequentes (FAQ)

**Obtenha ajuda por capítulo**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../README.md)
- **🚆 Problemas de Instalação**: [Capítulo 1: Instalação e Configuração](../docs/chapter-01-foundation/installation.md)
- **🤖 Perguntas sobre IA**: [Capítulo 2: Desenvolvimento com IA em Primeiro Lugar](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🔧 Solução de Problemas**: [Capítulo 7: Solução de Problemas e Depuração](../docs/chapter-07-troubleshooting/common-issues.md)

## Introdução

Este FAQ abrangente oferece respostas para as perguntas mais comuns sobre o Azure Developer CLI (azd) e implantações no Azure. Encontre soluções rápidas para problemas comuns, entenda melhores práticas e obtenha esclarecimentos sobre conceitos e fluxos de trabalho do azd.

## Objetivos de Aprendizado

Ao revisar este FAQ, você irá:
- Encontrar respostas rápidas para perguntas e problemas comuns do Azure Developer CLI
- Entender conceitos-chave e termos por meio de um formato prático de perguntas e respostas
- Acessar soluções de solução de problemas para problemas frequentes e cenários de erro
- Aprender melhores práticas por meio de perguntas frequentes sobre otimização
- Descobrir recursos avançados e capacidades por meio de perguntas de nível especialista
- Referenciar orientações sobre custo, segurança e estratégia de implantação de forma eficiente

## Resultados de Aprendizagem

Com referência regular a este FAQ, você será capaz de:
- Resolver problemas comuns do Azure Developer CLI de forma independente usando as soluções fornecidas
- Tomar decisões informadas sobre estratégias e configurações de implantação
- Entender a relação entre azd e outras ferramentas e serviços Azure
- Aplicar melhores práticas com base na experiência da comunidade e recomendações de especialistas
- Solucionar problemas de autenticação, implantação e configuração com eficácia
- Otimizar custos e desempenho usando os conhecimentos e recomendações do FAQ

## Índice

- [Primeiros Passos](#getting-started)
- [Autenticação e Acesso](#authentication--access)
- [Modelos e Projetos](#templates--projects)
- [Implantação e Infraestrutura](#deployment--infrastructure)
- [Configuração e Ambientes](#configuration--environments)
- [Solução de Problemas](#troubleshooting)
- [Custos e Faturamento](#cost--billing)
- [Melhores Práticas](#best-practices)
- [Tópicos Avançados](#advanced-topics)

---

## Primeiros Passos

### P: O que é Azure Developer CLI (azd)?
**R**: Azure Developer CLI (azd) é uma ferramenta de linha de comando centrada no desenvolvedor que acelera o tempo necessário para levar sua aplicação do ambiente local de desenvolvimento para o Azure. Ela fornece melhores práticas por meio de modelos e auxilia em todo o ciclo de vida da implantação.

### P: Como o azd é diferente do Azure CLI?
**R**: 
- **Azure CLI**: Ferramenta de uso geral para gerenciamento de recursos do Azure
- **azd**: Ferramenta focada no desenvolvedor para fluxos de trabalho de implantação de aplicações
- azd possui seu próprio fluxo de autenticação e implantação; Azure CLI é uma ferramenta separada e complementar
- azd inclui modelos, gerenciamento de ambientes e automação de implantação

### P: Preciso ter o Azure CLI instalado para usar azd?
**R**: Não para o fluxo principal do AZD. Autentique-se com `azd auth login`. Instale Azure CLI separadamente quando um gancho de modelo ou exercício executar explicitamente comandos `az`.

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
2. Adaptar projetos existentes para corresponder à estrutura de modelos do azd
3. Criar modelos personalizados baseados na sua arquitetura atual

---

## Autenticação e Acesso

### P: Como faço para autenticar com Azure usando azd?
**R**: Use `azd auth login` que abrirá uma janela de navegador para autenticação no Azure. Para cenários de CI/CD, utilize perfis de serviço ou identidades gerenciadas.

### P: Posso usar azd com múltiplas assinaturas do Azure?
**R**: Sim. Use `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` para especificar qual assinatura usar para cada ambiente.

### P: Quais permissões eu preciso para implantar com azd?
**R**: Tipicamente você precisa:
- Papel **Colaborador** no grupo de recursos ou assinatura
- Papel **Administrador de Acesso do Usuário** se implantar recursos que requerem atribuições de papéis
- Permissões específicas variam conforme modelo e recursos implantados

### P: Posso usar azd em pipelines de CI/CD?
**R**: Absolutamente! azd foi projetado para integração CI/CD. Use perfis de serviço para autenticação e defina variáveis de ambiente para configuração.

### P: Como faço para lidar com autenticação no GitHub Actions?
**R**: Prefira federação de identidade de carga de trabalho (OIDC), configurada com `azd pipeline config`. O fluxo gerado instala o AZD e autentica o AZD diretamente com uma identidade federada. Um passo `azure/login` sozinho não estabelece login AZD. Um passo de login dentro de um job existente é:
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

Faça provisionamento ou implante após o login, com o ambiente, assinatura e localização AZD pretendidos configurados. A credencial federada deve confiar no repositório/ref do fluxo de trabalho ou no ambiente do GitHub e seus papéis Azure devem permitir as operações solicitadas.

---

## Modelos e Projetos

### P: Onde posso encontrar modelos azd?
**R**: 
- Modelos oficiais e da comunidade: [Awesome AZD](https://azure.github.io/awesome-azd/)
- Modelos da comunidade: pesquisa no GitHub por "azd-template"
- Use `azd template list` para navegar pelos modelos disponíveis

### P: Como crio um modelo personalizado?
**R**: 
1. Comece com uma estrutura de modelo existente
2. Modifique `azure.yaml`, arquivos de infraestrutura e código da aplicação
3. Teste minuciosamente com `azd up`
4. Publique no GitHub com tags apropriadas

### P: Posso usar azd sem um modelo?
**R**: Sim, use `azd init` em um projeto existente para criar os arquivos de configuração necessários. Você precisará configurar manualmente `azure.yaml` e arquivos de infraestrutura.

### P: Qual a diferença entre modelos oficiais e da comunidade?
**R**: 
- **Modelos oficiais**: Mantidos pela Microsoft, atualizados regularmente, documentação abrangente
- **Modelos da comunidade**: Criados por desenvolvedores, podem ter casos de uso especializados, qualidade e manutenção variáveis

### P: Como atualizo um modelo no meu projeto?
**R**: Modelos não são atualizados automaticamente. Você pode:
1. Comparar manualmente e mesclar alterações do modelo fonte
2. Começar do zero com `azd init` usando o modelo atualizado
3. Selecionar melhorias específicas de modelos atualizados

---

## Implantação e Infraestrutura

### P: Quais serviços Azure o azd pode implantar?
**R**: azd pode implantar qualquer serviço Azure por meio de modelos Bicep/ARM, incluindo:
- App Services, Container Apps, Functions
- Bancos de dados (SQL, PostgreSQL, Cosmos DB)
- Armazenamento, Key Vault, Application Insights
- Recursos de rede, segurança e monitoramento

### P: Posso implantar em múltiplas regiões?
**R**: Sim, configure múltiplas regiões nos seus modelos Bicep e defina o parâmetro de localização apropriadamente para cada ambiente.

### P: Como faço migração de esquemas de banco de dados?
**R**: Use ganchos de implantação em `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### P: Posso implantar apenas infraestrutura sem aplicações?
**R**: Sim, use `azd provision` para implantar apenas os componentes de infraestrutura definidos nos seus modelos.

### P: Como faço para implantar em recursos Azure existentes?
**R**: Sim, quando o modelo suporta. Referencie recursos existentes com declarações `existing` do Bicep ou parâmetros documentados de recursos existentes do modelo, e mapeie serviços da aplicação para seus alvos pretendidos. Isso não importa propriedade nem cria permissões automaticamente. Revise o modelo antes de implantar.

### P: Posso usar Terraform ao invés de Bicep?
**R**: Sim. AZD suporta Terraform assim como Bicep. Selecione um modelo baseado em Terraform ou configure `infra.provider: terraform` em `azure.yaml`, com arquivos Terraform apropriados e configuração de estado/backend. Veja o [fluxo Terraform](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

---

## Configuração e Ambientes

### P: Como gerencio diferentes ambientes (dev, staging, prod)?
**R**: Crie ambientes separados com `azd env new <environment-name>` e configure definições diferentes para cada um:
```bash
azd env new development
azd env new staging  
azd env new production
```

### P: Onde as configurações dos ambientes são armazenadas?
**R**: Na pasta `.azure` dentro do diretório do seu projeto. Cada ambiente tem sua própria pasta com arquivos de configuração.

### P: Como defino configurações específicas do ambiente?
**R**: Use `azd env set` para configurar variáveis de ambiente:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### P: Posso compartilhar configurações de ambiente entre membros da equipe?
**R**: A pasta `.azure` contém informações sensíveis e não deve ser commitada no controle de versão. Em vez disso:
1. Documente variáveis de ambiente necessárias
2. Use scripts de implantação para configurar ambientes
3. Use Azure Key Vault para configurações sensíveis

### P: Como sobrescrevo padrões do modelo?
**R**: Defina variáveis de ambiente correspondentes aos parâmetros do modelo:
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
2. **Permissões insuficientes**: Verifique suas atribuições de papéis no Azure
3. **Conflitos de nomeação de recursos**: Revise o recurso conflitante e as entradas de nomeação do modelo; crie um ambiente separado com `azd env new` quando isolamento for necessário
4. **Problemas de cota/capacidade**: Verifique disponibilidade regional
5. **Erros no modelo**: Valide os modelos Bicep

### P: Como faço para depurar falhas de implantação?
**R**: 
1. Use `azd deploy --debug` para saída detalhada
2. Verifique o histórico de implantações no portal Azure
3. Revise o Log de Atividades no portal Azure
4. Use `azd show` para exibir o estado atual do ambiente

### P: Por que minhas variáveis de ambiente não estão funcionando?
**R**: Verifique:
1. Os nomes das variáveis correspondem exatamente aos parâmetros do modelo
2. Valores são devidamente entre aspas se contêm espaços
3. O ambiente está selecionado: `azd env select <environment>`
4. Variáveis foram definidas no ambiente correto

### P: Como faço para limpar implantações com falha?
**R**: 
```bash
azd down
```
Revise o ambiente selecionado e a confirmação de exclusão primeiro. Isso exclui recursos Azure provisionados, não a configuração local do ambiente `.azure`. `--purge` também solicita exclusão permanente de recursos excluídos suavemente suportados e pode ser bloqueado por proteção de retenção/purgue; não é um passo rotineiro de recuperação.

### P: Por que minha aplicação não está acessível após a implantação?
**R**: Verifique:
1. A implantação foi concluída com sucesso
2. A aplicação está em execução (verifique os logs no portal Azure)
3. Grupos de segurança de rede permitem o tráfego
4. DNS/domínios personalizados estão configurados corretamente

---

## Custos e Faturamento

### P: Quanto custarão as implantações azd?
**R**: Os custos dependem de:
- Serviços Azure implantados
- Camadas SKUs selecionadas
- Diferenças de preços regionais
- Padrões de uso

Use a [Calculadora de Preços Azure](https://azure.microsoft.com/pricing/calculator/) para estimativas.

### P: Como controlo custos nas implantações azd?
**R**: 
1. Use SKUs de camada inferior para ambientes de desenvolvimento
2. Configure orçamentos e alertas no Azure
3. Use `azd down` para remover recursos quando não forem necessários
4. Escolha regiões apropriadas (custos variam conforme localização)
5. Use ferramentas de Gerenciamento de Custos Azure

### P: Existem opções gratuitas para os modelos azd?
**R**: Alguns serviços têm SKUs gratuitos ou concessões mensais, sujeitos a elegibilidade, plano de hospedagem, região e limites de assinatura. Eles não tornam um modelo inteiro gratuito: bancos de dados, pesquisa, rede, registro, telemetria e inferência de modelo podem gerar cobranças independentes. Consulte a [lista de serviços gratuitos Azure](https://azure.microsoft.com/free/) e preços atuais para cada recurso antes da implantação.

### P: Como estimo custos antes da implantação?
**R**: 
1. Revise `main.bicep` do modelo para ver quais recursos são criados
2. Use a Calculadora de Preços Azure com SKUs específicos
3. Primeiro implante em ambiente de desenvolvimento para monitorar custos reais
4. Use Gerenciamento de Custos Azure para análise detalhada de custos

---

## Melhores Práticas

### P: Quais são as melhores práticas para estrutura de projeto azd?
**R**: 
1. Mantenha o código da aplicação separado da infraestrutura
2. Use nomes significativos para serviços em `azure.yaml`
3. Implemente tratamento adequado de erros nos scripts de build
4. Use configuração específica do ambiente
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
2. Faça referência aos segredos do Key Vault na configuração da aplicação
3. Nunca faça commit de segredos no controle de versão
4. Use identidades gerenciadas para autenticação entre serviços

### P: Qual é a abordagem recomendada para CI/CD com azd?
**R**: 
1. Use ambientes separados para cada estágio (dev/staging/prod)
2. Implemente testes automatizados antes do deploy
3. Use service principals para autenticação
4. Armazene configurações sensíveis em segredos/variáveis de pipeline
5. Implemente portões de aprovação para deploy em produção

---

## Tópicos Avançados

### P: Posso estender o azd com funcionalidades personalizadas?
**R**: Sim, por meio de hooks de deploy em `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### P: Como integro o azd aos processos de DevOps existentes?
**R**: 
1. Use comandos azd nos scripts de pipeline existentes
2. Padronize templates azd entre as equipes
3. Integre com monitoramento e alertas existentes
4. Use a saída JSON do azd para integração em pipelines

### P: Posso usar azd com Azure DevOps?
**R**: Sim, azd funciona com qualquer sistema de CI/CD. Crie pipelines Azure DevOps que usem comandos azd.

### P: Como contribuir para o azd ou criar templates comunitários?
**R**: 
1. **ferramenta azd**: Contribua para [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Templates**: Siga as [instruções para contribuição na galeria Awesome AZD](https://github.com/Azure/awesome-azd#3-contribute-to-gallery)
3. **Documentação**: Contribua na docs em [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### P: Qual é o roadmap do azd?
**R**: Consulte o [roadmap oficial](https://github.com/Azure/azure-dev/projects) para recursos e melhorias planejados.

### P: Como migrar de outras ferramentas de deploy para azd?
**R**: 
1. Analise a arquitetura atual de deploy
2. Crie templates Bicep equivalentes
3. Configure `azure.yaml` para corresponder aos serviços atuais
4. Teste exaustivamente no ambiente de desenvolvimento
5. Migre ambientes gradualmente

---

## Ainda Tem Dúvidas?

### **Pesquise Primeiro**
- Consulte a [documentação oficial](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Pesquise em [issues do GitHub](https://github.com/Azure/azure-dev/issues) por problemas semelhantes

### **Obtenha Ajuda**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Suporte da comunidade
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Perguntas técnicas
- [Azure Discord](https://discord.gg/azure) - Chat comunitário em tempo real

### **Reporte Problemas**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Relatórios de bugs e pedidos de recursos
- Inclua logs relevantes, mensagens de erro e passos para reproduzir

### **Saiba Mais**
- [Documentação Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centro de Arquitetura Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Framework Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Orientação técnica revisada em: 4 de novembro de 2026. Disponibilidade na nuvem e preços devem ser verificados para sua assinatura e região.*

---

**Navegação**
- **Lição Anterior**: [Glossário](glossary.md)
- **Próxima Lição**: [Guia de Estudo](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->