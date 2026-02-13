# Perguntas Frequentes (FAQ)

**Obtenha Ajuda por Capítulo**
- **📚 Página do Curso**: [AZD para Iniciantes](../README.md)
- **🚆 Problemas de Instalação**: [Capítulo 1: Instalação & Configuração](../docs/getting-started/installation.md)
- **🤖 Perguntas sobre IA**: [Capítulo 2: Desenvolvimento com Foco em IA](../docs/microsoft-foundry/microsoft-foundry-integration.md)
- **🔧 Solução de Problemas**: [Capítulo 7: Solução de Problemas & Depuração](../docs/troubleshooting/common-issues.md)

## Introdução

Este FAQ abrangente fornece respostas às perguntas mais comuns sobre o Azure Developer CLI (azd) e implantações no Azure. Encontre soluções rápidas para problemas frequentes, entenda as melhores práticas e obtenha esclarecimentos sobre conceitos e fluxos de trabalho do azd.

## Objetivos de Aprendizagem

Ao revisar este FAQ, você irá:
- Encontrar respostas rápidas para perguntas e problemas comuns do Azure Developer CLI
- Entender conceitos e terminologia chave por meio de um formato prático de perguntas e respostas
- Acessar soluções de solução de problemas para problemas e cenários de erro frequentes
- Aprender melhores práticas por meio de perguntas comuns sobre otimização
- Descobrir recursos e capacidades avançadas por meio de perguntas em nível especialista
- Consultar orientações sobre custos, segurança e estratégia de implantação de forma eficiente

## Resultados de Aprendizagem

Com referência regular a este FAQ, você será capaz de:
- Resolver problemas comuns do Azure Developer CLI de forma independente usando as soluções fornecidas
- Tomar decisões informadas sobre estratégias e configurações de implantação
- Entender a relação entre azd e outras ferramentas e serviços do Azure
- Aplicar melhores práticas com base na experiência da comunidade e recomendações de especialistas
- Solucionar problemas de autenticação, implantação e configuração de forma eficaz
- Otimizar custos e desempenho usando os insights e recomendações do FAQ

## Tabela de Conteúdos

- [Getting Started](../../../resources)
- [Authentication & Access](../../../resources)
- [Templates & Projects](../../../resources)
- [Deployment & Infrastructure](../../../resources)
- [Configuration & Environments](../../../resources)
- [Troubleshooting](../../../resources)
- [Cost & Billing](../../../resources)
- [Best Practices](../../../resources)
- [Advanced Topics](../../../resources)

---

## Getting Started

### Q: What is Azure Developer CLI (azd)?
**A**: Azure Developer CLI (azd) é uma ferramenta de linha de comando voltada para desenvolvedores que acelera o tempo necessário para levar sua aplicação do ambiente de desenvolvimento local ao Azure. Ela fornece melhores práticas por meio de modelos e ajuda em todo o ciclo de vida de implantação.

### Q: How is azd different from Azure CLI?
**A**: 
- **Azure CLI**: Ferramenta de uso geral para gerenciamento de recursos do Azure
- **azd**: Ferramenta focada em desenvolvedores para fluxos de trabalho de implantação de aplicações
- azd usa Azure CLI internamente, mas fornece abstrações de nível superior para cenários comuns de desenvolvimento
- azd inclui templates, gerenciamento de ambientes e automação de implantação

### Q: Do I need Azure CLI installed to use azd?
**A**: Sim, azd requer Azure CLI para autenticação e algumas operações. Instale o Azure CLI primeiro e, em seguida, instale o azd.

### Q: What programming languages does azd support?
**A**: azd é agnóstico quanto a linguagens. Ele funciona com:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Sites estáticos
- Aplicações conteinerizadas

### Q: Can I use azd with existing projects?
**A**: Sim! Você pode:
1. Usar `azd init` para adicionar configuração do azd a projetos existentes
2. Adaptar projetos existentes para corresponder à estrutura de templates do azd
3. Criar templates personalizados baseados na sua arquitetura existente

---

## Authentication & Access

### Q: How do I authenticate with Azure using azd?
**A**: Use `azd auth login` que abrirá uma janela do navegador para autenticação no Azure. Para cenários de CI/CD, use service principals ou managed identities.

### Q: Can I use azd with multiple Azure subscriptions?
**A**: Sim. Use `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` para especificar qual assinatura usar para cada ambiente.

### Q: What permissions do I need to deploy with azd?
**A**: Tipicamente você precisa:
- Função de **Contributor** no grupo de recursos ou na assinatura
- **User Access Administrator** se estiver implantando recursos que exigem atribuições de função
- Permissões específicas variam conforme o template e os recursos sendo implantados

### Q: Can I use azd in CI/CD pipelines?
**A**: Absolutamente! azd é projetado para integração em CI/CD. Use service principals para autenticação e defina variáveis de ambiente para configuração.

### Q: How do I handle authentication in GitHub Actions?
**A**: Use a action Azure Login com credenciais de service principal:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Templates & Projects

### Q: Where can I find azd templates?
**A**: 
- Templates oficiais: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Templates da comunidade: procure no GitHub por "azd-template"
- Use `azd template list` para navegar pelos templates disponíveis

### Q: How do I create a custom template?
**A**: 
1. Comece com uma estrutura de template existente
2. Modifique `azure.yaml`, arquivos de infraestrutura e o código da aplicação
3. Teste exaustivamente com `azd up`
4. Publique no GitHub com tags apropriadas

### Q: Can I use azd without a template?
**A**: Sim, use `azd init` em um projeto existente para criar os arquivos de configuração necessários. Você precisará configurar manualmente `azure.yaml` e os arquivos de infraestrutura.

### Q: What's the difference between official and community templates?
**A**: 
- **Templates oficiais**: Mantidos pela Microsoft, atualizados regularmente, documentação abrangente
- **Templates da comunidade**: Criados por desenvolvedores, podem ter casos de uso especializados, qualidade e manutenção variáveis

### Q: How do I update a template in my project?
**A**: Templates não são atualizados automaticamente. Você pode:
1. Comparar e mesclar manualmente as mudanças do template de origem
2. Começar do zero com `azd init` usando o template atualizado
3. Cherry-pick melhorias específicas dos templates atualizados

---

## Deployment & Infrastructure

### Q: What Azure services can azd deploy?
**A**: azd pode implantar qualquer serviço do Azure através de templates Bicep/ARM, incluindo:
- App Services, Container Apps, Functions
- Bancos de dados (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Recursos de rede, segurança e monitoramento

### Q: Can I deploy to multiple regions?
**A**: Sim, configure múltiplas regiões nos seus templates Bicep e defina o parâmetro location adequadamente para cada ambiente.

### Q: How do I handle database schema migrations?
**A**: Use hooks de implantação em `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Q: Can I deploy only infrastructure without applications?
**A**: Sim, use `azd provision` para implantar apenas os componentes de infraestrutura definidos nos seus templates.

### Q: How do I deploy to existing Azure resources?
**A**: Isso é complexo e não é diretamente suportado. Você pode:
1. Importar recursos existentes nos seus templates Bicep
2. Usar referências a recursos existentes nos templates
3. Modificar templates para criar condicionalmente ou referenciar recursos

### Q: Can I use Terraform instead of Bicep?
**A**: Atualmente, azd suporta primariamente templates Bicep/ARM. O suporte a Terraform não está oficialmente disponível, embora soluções da comunidade possam existir.

---

## Configuration & Environments

### Q: How do I manage different environments (dev, staging, prod)?
**A**: Crie ambientes separados com `azd env new <environment-name>` e configure diferentes ajustes para cada um:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Q: Where are environment configurations stored?
**A**: Na pasta `.azure` dentro do diretório do seu projeto. Cada ambiente tem sua própria pasta com arquivos de configuração.

### Q: How do I set environment-specific configuration?
**A**: Use `azd env set` para configurar variáveis de ambiente:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q: Can I share environment configurations across team members?
**A**: A pasta `.azure` contém informações sensíveis e não deve ser comprometida no controle de versão. Em vez disso:
1. Documente as variáveis de ambiente necessárias
2. Use scripts de implantação para configurar ambientes
3. Use Azure Key Vault para configuração sensível

### Q: How do I override template defaults?
**A**: Defina variáveis de ambiente que correspondam aos parâmetros do template:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Troubleshooting

### Q: Why is `azd up` failing?
**A**: Causas comuns:
1. **Problemas de autenticação**: Execute `azd auth login`
2. **Permissões insuficientes**: Verifique suas atribuições de função no Azure
3. **Conflitos de nomes de recursos**: Change AZURE_ENV_NAME
4. **Problemas de cota/capacidade**: Verifique disponibilidade regional
5. **Erros no template**: Valide templates Bicep

### Q: How do I debug deployment failures?
**A**: 
1. Use `azd deploy --debug` para saída detalhada
2. Verifique o histórico de implantações no portal do Azure
3. Revise o Activity Log no portal do Azure
4. Use `azd show` para exibir o estado atual do ambiente

### Q: Why are my environment variables not working?
**A**: Verifique:
1. Nomes das variáveis correspondem exatamente aos parâmetros do template
2. Valores estão devidamente entre aspas se contiverem espaços
3. Ambiente está selecionado: `azd env select <environment>`
4. Variáveis estão definidas no ambiente correto

### Q: How do I clean up failed deployments?
**A**: 
```bash
azd down --force --purge
```
Isto remove todos os recursos e a configuração do ambiente.

### Q: Why is my application not accessible after deployment?
**A**: Verifique:
1. A implantação foi concluída com sucesso
2. A aplicação está em execução (verifique logs no portal do Azure)
3. Network security groups permitem tráfego
4. DNS/domínios customizados estão configurados corretamente

---

## Cost & Billing

### Q: How much will azd deployments cost?
**A**: Os custos dependem de:
- Serviços do Azure implantados
- Camadas/SKUs selecionados
- Diferenças de preço por região
- Padrões de uso

Use a [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) para estimativas.

### Q: How do I control costs in azd deployments?
**A**: 
1. Use SKUs de camada mais baixa para ambientes de desenvolvimento
2. Configure orçamentos e alertas no Azure
3. Use `azd down` para remover recursos quando não forem necessários
4. Escolha regiões apropriadas (os custos variam por local)
5. Use ferramentas do Azure Cost Management

### Q: Are there free tier options for azd templates?
**A**: Muitos serviços do Azure oferecem camadas gratuitas:
- App Service: Camada gratuita disponível
- Azure Functions: 1M execuções gratuitas/mês
- Cosmos DB: Camada gratuita com 400 RU/s
- Application Insights: Primeiros 5GB/mês grátis

Configure templates para usar camadas gratuitas quando disponíveis.

### Q: How do I estimate costs before deployment?
**A**: 
1. Revise o `main.bicep` do template para ver quais recursos são criados
2. Use o Azure Pricing Calculator com SKUs específicos
3. Faça a implantação primeiro em um ambiente de desenvolvimento para monitorar os custos reais
4. Use Azure Cost Management para análise detalhada de custos

---

## Best Practices

### Q: What are the best practices for azd project structure?
**A**: 
1. Mantenha o código da aplicação separado da infraestrutura
2. Use nomes de serviço significativos em `azure.yaml`
3. Implemente tratamento adequado de erros em scripts de build
4. Use configuração específica por ambiente
5. Inclua documentação abrangente

### Q: How should I organize multiple services in azd?
**A**: Use a estrutura recomendada:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### Q: Should I commit the `.azure` folder to version control?
**A**: **Não!** A pasta `.azure` contém informações sensíveis. Adicione-a ao `.gitignore`:
```gitignore
.azure/
```

### Q: How do I handle secrets and sensitive configuration?
**A**: 
1. Use Azure Key Vault para segredos
2. Faça referência a segredos do Key Vault na configuração da aplicação
3. Nunca comprometa segredos no controle de versão
4. Use managed identities para autenticação entre serviços

### Q: What's the recommended approach for CI/CD with azd?
**A**: 
1. Use ambientes separados para cada estágio (dev/staging/prod)
2. Implemente testes automatizados antes da implantação
3. Use service principals para autenticação
4. Armazene configurações sensíveis em segredos/variáveis do pipeline
5. Implemente gates de aprovação para implantações em produção

---

## Advanced Topics

### Q: Can I extend azd with custom functionality?
**A**: Sim, por meio de hooks de implantação em `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### Q: How do I integrate azd with existing DevOps processes?
**A**: 
1. Use comandos azd em scripts de pipeline existentes
2. Padronize templates azd entre as equipes
3. Integre com monitoramento e alertas existentes
4. Use a saída JSON do azd para integração em pipelines

### Q: Can I use azd with Azure DevOps?
**A**: Sim, azd funciona com qualquer sistema de CI/CD. Crie pipelines do Azure DevOps que usem comandos azd.

### Q: How do I contribute to azd or create community templates?
**A**:
1. **azd tool**: Contribua para [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Modelos**: Crie templates seguindo as [diretrizes de templates](https://github.com/Azure-Samples/awesome-azd)
3. **Documentação**: Contribua com a documentação em [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### Q: Qual é o roteiro para o azd?
**A**: Consulte o [roteiro oficial](https://github.com/Azure/azure-dev/projects) para recursos planejados e melhorias.

### Q: Como migro de outras ferramentas de implantação para o azd?
**A**: 
1. Analise a arquitetura de implantação atual
2. Crie modelos Bicep equivalentes
3. Configure `azure.yaml` para corresponder aos serviços atuais
4. Teste minuciosamente no ambiente de desenvolvimento
5. Migre gradualmente os ambientes

---

## Ainda tem dúvidas?

### **Pesquise primeiro**
- Consulte a [documentação oficial](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Pesquise nos [issues do GitHub](https://github.com/Azure/azure-dev/issues) por problemas semelhantes

### **Obter ajuda**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Suporte da comunidade
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Perguntas técnicas
- [Azure Discord](https://discord.gg/azure) - Chat da comunidade em tempo real

### **Reportar problemas**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Relatos de bugs e solicitações de recursos
- Inclua logs relevantes, mensagens de erro e passos para reproduzir

### **Saiba mais**
- [Documentação do Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centro de Arquitetura do Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Este FAQ é atualizado regularmente. Última atualização: 9 de setembro de 2025*

---

**Navegação**
- **Lição anterior**: [Glossário](glossary.md)
- **Próxima lição**: [Guia de estudo](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Isenção de responsabilidade**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->