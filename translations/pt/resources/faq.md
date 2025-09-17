<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "a82d27b84022e9b7c7a163f99fa1fd25",
  "translation_date": "2025-09-17T14:56:24+00:00",
  "source_file": "resources/faq.md",
  "language_code": "pt"
}
-->
# Perguntas Frequentes (FAQ)

**Ajuda por Capítulo**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../README.md)
- **🚆 Problemas de Instalação**: [Capítulo 1: Instalação e Configuração](../docs/getting-started/installation.md)
- **🤖 Perguntas sobre IA**: [Capítulo 2: Desenvolvimento com Foco em IA](../docs/ai-foundry/azure-ai-foundry-integration.md)
- **🔧 Resolução de Problemas**: [Capítulo 7: Solução de Problemas e Depuração](../docs/troubleshooting/common-issues.md)

## Introdução

Este FAQ abrangente fornece respostas às perguntas mais comuns sobre Azure Developer CLI (azd) e implementações no Azure. Encontre soluções rápidas para problemas frequentes, entenda as melhores práticas e obtenha esclarecimentos sobre conceitos e fluxos de trabalho do azd.

## Objetivos de Aprendizagem

Ao revisar este FAQ, você irá:
- Encontrar respostas rápidas para perguntas e problemas comuns sobre Azure Developer CLI
- Compreender conceitos e terminologia-chave através de um formato prático de perguntas e respostas
- Acessar soluções de resolução de problemas para cenários frequentes de erros
- Aprender melhores práticas através de perguntas comuns sobre otimização
- Descobrir recursos e capacidades avançadas através de perguntas de nível especialista
- Consultar orientações sobre custos, segurança e estratégias de implementação de forma eficiente

## Resultados de Aprendizagem

Com referência regular a este FAQ, você será capaz de:
- Resolver problemas comuns do Azure Developer CLI de forma independente usando as soluções fornecidas
- Tomar decisões informadas sobre estratégias e configurações de implementação
- Entender a relação entre azd e outras ferramentas e serviços do Azure
- Aplicar melhores práticas com base na experiência da comunidade e recomendações de especialistas
- Solucionar problemas de autenticação, implementação e configuração de forma eficaz
- Otimizar custos e desempenho usando as percepções e recomendações do FAQ

## Índice

- [Introdução](../../../resources)
- [Autenticação e Acesso](../../../resources)
- [Templates e Projetos](../../../resources)
- [Implementação e Infraestrutura](../../../resources)
- [Configuração e Ambientes](../../../resources)
- [Resolução de Problemas](../../../resources)
- [Custos e Faturamento](../../../resources)
- [Melhores Práticas](../../../resources)
- [Tópicos Avançados](../../../resources)

---

## Introdução

### P: O que é Azure Developer CLI (azd)?
**R**: Azure Developer CLI (azd) é uma ferramenta de linha de comando voltada para desenvolvedores que acelera o tempo necessário para levar sua aplicação do ambiente de desenvolvimento local para o Azure. Ela fornece melhores práticas através de templates e ajuda em todo o ciclo de vida de implementação.

### P: Como o azd é diferente do Azure CLI?
**R**: 
- **Azure CLI**: Ferramenta de uso geral para gerenciar recursos do Azure
- **azd**: Ferramenta focada em desenvolvedores para fluxos de trabalho de implementação de aplicações
- azd utiliza Azure CLI internamente, mas fornece abstrações de nível superior para cenários comuns de desenvolvimento
- azd inclui templates, gerenciamento de ambientes e automação de implementação

### P: Preciso ter Azure CLI instalado para usar azd?
**R**: Sim, o azd requer Azure CLI para autenticação e algumas operações. Instale o Azure CLI primeiro e, em seguida, instale o azd.

### P: Quais linguagens de programação o azd suporta?
**R**: O azd é independente de linguagem. Ele funciona com:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Websites estáticos
- Aplicações containerizadas

### P: Posso usar azd com projetos existentes?
**R**: Sim! Você pode:
1. Usar `azd init` para adicionar configuração do azd a projetos existentes
2. Adaptar projetos existentes para corresponder à estrutura de templates do azd
3. Criar templates personalizados com base na sua arquitetura existente

---

## Autenticação e Acesso

### P: Como faço para autenticar com o Azure usando azd?
**R**: Use `azd auth login`, que abrirá uma janela do navegador para autenticação no Azure. Para cenários de CI/CD, use identidades gerenciadas ou service principals.

### P: Posso usar azd com várias subscrições do Azure?
**R**: Sim. Use `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` para especificar qual subscrição usar para cada ambiente.

### P: Quais permissões eu preciso para implementar com azd?
**R**: Normalmente, você precisa:
- Papel de **Colaborador** no grupo de recursos ou subscrição
- **Administrador de Acesso de Usuário** se estiver implementando recursos que exigem atribuições de papel
- As permissões específicas variam de acordo com o template e os recursos sendo implementados

### P: Posso usar azd em pipelines de CI/CD?
**R**: Com certeza! O azd foi projetado para integração com CI/CD. Use service principals para autenticação e defina variáveis de ambiente para configuração.

### P: Como faço para lidar com autenticação no GitHub Actions?
**R**: Use a ação Azure Login com credenciais de service principal:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Templates e Projetos

### P: Onde posso encontrar templates do azd?
**R**: 
- Templates oficiais: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Templates da comunidade: Pesquise no GitHub por "azd-template"
- Use `azd template list` para navegar pelos templates disponíveis

### P: Como crio um template personalizado?
**R**: 
1. Comece com a estrutura de um template existente
2. Modifique `azure.yaml`, arquivos de infraestrutura e código da aplicação
3. Teste completamente com `azd up`
4. Publique no GitHub com tags apropriadas

### P: Posso usar azd sem um template?
**R**: Sim, use `azd init` em um projeto existente para criar os arquivos de configuração necessários. Você precisará configurar manualmente `azure.yaml` e os arquivos de infraestrutura.

### P: Qual é a diferença entre templates oficiais e da comunidade?
**R**: 
- **Templates oficiais**: Mantidos pela Microsoft, atualizados regularmente, documentação abrangente
- **Templates da comunidade**: Criados por desenvolvedores, podem ter casos de uso especializados, qualidade e manutenção variáveis

### P: Como atualizo um template no meu projeto?
**R**: Os templates não são atualizados automaticamente. Você pode:
1. Comparar e mesclar manualmente alterações do template original
2. Começar do zero com `azd init` usando o template atualizado
3. Selecionar melhorias específicas dos templates atualizados

---

## Implementação e Infraestrutura

### P: Quais serviços do Azure o azd pode implementar?
**R**: O azd pode implementar qualquer serviço do Azure através de templates Bicep/ARM, incluindo:
- App Services, Container Apps, Functions
- Bancos de dados (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Recursos de rede, segurança e monitoramento

### P: Posso implementar em várias regiões?
**R**: Sim, configure várias regiões nos seus templates Bicep e defina o parâmetro de localização adequadamente para cada ambiente.

### P: Como lido com migrações de esquema de banco de dados?
**R**: Use hooks de implementação no `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### P: Posso implementar apenas infraestrutura sem aplicações?
**R**: Sim, use `azd provision` para implementar apenas os componentes de infraestrutura definidos nos seus templates.

### P: Como faço para implementar em recursos existentes do Azure?
**R**: Isso é complexo e não é diretamente suportado. Você pode:
1. Importar recursos existentes nos seus templates Bicep
2. Usar referências de recursos existentes nos templates
3. Modificar templates para criar ou referenciar recursos condicionalmente

### P: Posso usar Terraform em vez de Bicep?
**R**: Atualmente, o azd suporta principalmente templates Bicep/ARM. O suporte ao Terraform não está oficialmente disponível, embora possam existir soluções da comunidade.

---

## Configuração e Ambientes

### P: Como gerencio diferentes ambientes (dev, staging, prod)?
**R**: Crie ambientes separados com `azd env new <environment-name>` e configure diferentes definições para cada um:
```bash
azd env new development
azd env new staging  
azd env new production
```

### P: Onde as configurações de ambiente são armazenadas?
**R**: Na pasta `.azure` dentro do diretório do seu projeto. Cada ambiente tem sua própria pasta com arquivos de configuração.

### P: Como configuro definições específicas de ambiente?
**R**: Use `azd env set` para configurar variáveis de ambiente:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### P: Posso compartilhar configurações de ambiente com membros da equipe?
**R**: A pasta `.azure` contém informações sensíveis e não deve ser comprometida no controle de versão. Em vez disso:
1. Documente as variáveis de ambiente necessárias
2. Use scripts de implementação para configurar ambientes
3. Utilize Azure Key Vault para configurações sensíveis

### P: Como substituo os padrões do template?
**R**: Defina variáveis de ambiente que correspondam aos parâmetros do template:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Resolução de Problemas

### P: Por que `azd up` está falhando?
**R**: Causas comuns:
1. **Problemas de autenticação**: Execute `azd auth login`
2. **Permissões insuficientes**: Verifique suas atribuições de papel no Azure
3. **Conflitos de nomes de recursos**: Altere AZURE_ENV_NAME
4. **Problemas de cota/capacidade**: Verifique a disponibilidade regional
5. **Erros no template**: Valide os templates Bicep

### P: Como depuro falhas de implementação?
**R**: 
1. Use `azd deploy --debug` para saída detalhada
2. Verifique o histórico de implementação no portal do Azure
3. Revise o Log de Atividades no portal do Azure
4. Use `azd show` para exibir o estado atual do ambiente

### P: Por que minhas variáveis de ambiente não estão funcionando?
**R**: Verifique:
1. Os nomes das variáveis correspondem exatamente aos parâmetros do template
2. Os valores estão devidamente entre aspas se contiverem espaços
3. O ambiente está selecionado: `azd env select <environment>`
4. As variáveis estão definidas no ambiente correto

### P: Como limpo implementações falhadas?
**R**: 
```bash
azd down --force --purge
```
Isso remove todos os recursos e configurações de ambiente.

### P: Por que minha aplicação não está acessível após a implementação?
**R**: Verifique:
1. A implementação foi concluída com sucesso
2. A aplicação está em execução (verifique os logs no portal do Azure)
3. Os grupos de segurança de rede permitem tráfego
4. DNS/domínios personalizados estão configurados corretamente

---

## Custos e Faturamento

### P: Quanto custarão as implementações do azd?
**R**: Os custos dependem de:
- Serviços do Azure implementados
- Tiers/SKUs dos serviços selecionados
- Diferenças de preços regionais
- Padrões de uso

Use o [Calculador de Preços do Azure](https://azure.microsoft.com/pricing/calculator/) para estimativas.

### P: Como controlo os custos nas implementações do azd?
**R**: 
1. Use SKUs de nível inferior para ambientes de desenvolvimento
2. Configure orçamentos e alertas no Azure
3. Use `azd down` para remover recursos quando não forem necessários
4. Escolha regiões apropriadas (os custos variam por localização)
5. Utilize ferramentas de Gerenciamento de Custos do Azure

### P: Existem opções de nível gratuito para templates do azd?
**R**: Muitos serviços do Azure oferecem níveis gratuitos:
- App Service: Nível gratuito disponível
- Azure Functions: 1M de execuções gratuitas/mês
- Cosmos DB: Nível gratuito com 400 RU/s
- Application Insights: Primeiros 5GB/mês gratuitos

Configure templates para usar níveis gratuitos onde disponíveis.

### P: Como estimo custos antes da implementação?
**R**: 
1. Revise o `main.bicep` do template para ver quais recursos serão criados
2. Use o Calculador de Preços do Azure com SKUs específicos
3. Implemente em um ambiente de desenvolvimento primeiro para monitorar os custos reais
4. Utilize o Gerenciamento de Custos do Azure para análise detalhada de custos

---

## Melhores Práticas

### P: Quais são as melhores práticas para estrutura de projetos azd?
**R**: 
1. Mantenha o código da aplicação separado da infraestrutura
2. Use nomes de serviços significativos no `azure.yaml`
3. Implemente tratamento adequado de erros em scripts de build
4. Utilize configurações específicas de ambiente
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

### P: Devo comprometer a pasta `.azure` no controle de versão?
**R**: **Não!** A pasta `.azure` contém informações sensíveis. Adicione-a ao `.gitignore`:
```gitignore
.azure/
```

### P: Como lido com segredos e configurações sensíveis?
**R**: 
1. Use Azure Key Vault para segredos
2. Referencie segredos do Key Vault na configuração da aplicação
3. Nunca comprometa segredos no controle de versão
4. Utilize identidades gerenciadas para autenticação entre serviços

### P: Qual é a abordagem recomendada para CI/CD com azd?
**R**: 
1. Use ambientes separados para cada estágio (dev/staging/prod)
2. Implemente testes automatizados antes da implementação
3. Use service principals para autenticação
4. Armazene configurações sensíveis em variáveis/segredos do pipeline
5. Implemente etapas de aprovação para implementações em produção

---

## Tópicos Avançados

### P: Posso estender o azd com funcionalidades personalizadas?
**R**: Sim, através de hooks de implementação no `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### P: Como integro o azd com processos DevOps existentes?
**R**: 
1. Use comandos do azd em scripts de pipeline existentes
2. Padronize templates do azd entre equipes
3. Integre com monitoramento e alertas existentes
4. Utilize a saída JSON do azd para integração com pipelines

### P: Posso usar azd com Azure DevOps?
**R**: Sim, o azd funciona com qualquer sistema de CI/CD. Crie pipelines do Azure DevOps que utilizem comandos do azd.

### P: Como contribuo para o azd ou crio templates da comunidade?
**R**: 
1. **Ferramenta azd**: Contribua para [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Templates**: Crie templates seguindo as [diretrizes de templates](https://github.com/Azure-Samples/awesome-azd)  
3. **Documentação**: Contribua para a documentação em [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)  

### P: Qual é o roadmap para o azd?  
**R**: Consulte o [roadmap oficial](https://github.com/Azure/azure-dev/projects) para funcionalidades e melhorias planejadas.  

### P: Como faço para migrar de outras ferramentas de deployment para o azd?  
**R**:  
1. Analise a arquitetura de deployment atual  
2. Crie templates equivalentes em Bicep  
3. Configure o `azure.yaml` para corresponder aos serviços atuais  
4. Teste completamente no ambiente de desenvolvimento  
5. Migre os ambientes gradualmente  

---

## Ainda tem dúvidas?  

### **Pesquise Primeiro**  
- Consulte a [documentação oficial](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- Pesquise [issues no GitHub](https://github.com/Azure/azure-dev/issues) para problemas semelhantes  

### **Obtenha Ajuda**  
- [Discussões no GitHub](https://github.com/Azure/azure-dev/discussions) - Suporte da comunidade  
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Perguntas técnicas  
- [Azure Discord](https://discord.gg/azure) - Chat em tempo real com a comunidade  

### **Relate Problemas**  
- [Issues no GitHub](https://github.com/Azure/azure-dev/issues/new) - Relatórios de bugs e pedidos de funcionalidades  
- Inclua logs relevantes, mensagens de erro e passos para reproduzir o problema  

### **Saiba Mais**  
- [Documentação do Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Centro de Arquitetura do Azure](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Framework de Boas Práticas do Azure](https://learn.microsoft.com/en-us/azure/well-architected/)  

---

*Este FAQ é atualizado regularmente. Última atualização: 9 de setembro de 2025*  

---

**Navegação**  
- **Lição Anterior**: [Glossário](glossary.md)  
- **Próxima Lição**: [Guia de Estudo](study-guide.md)  

---

**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, é importante notar que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autoritária. Para informações críticas, recomenda-se a tradução profissional realizada por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes da utilização desta tradução.