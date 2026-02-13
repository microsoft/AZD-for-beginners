# Perguntas Frequentes (FAQ)

**Obter Ajuda por Capítulo**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../README.md)
- **🚆 Problemas de Instalação**: [Capítulo 1: Instalação e Configuração](../docs/getting-started/installation.md)
- **🤖 Perguntas sobre IA**: [Capítulo 2: Desenvolvimento AI-First](../docs/microsoft-foundry/microsoft-foundry-integration.md)
- **🔧 Resolução de Problemas**: [Capítulo 7: Resolução de Problemas e Depuração](../docs/troubleshooting/common-issues.md)

## Introdução

Este FAQ abrangente fornece respostas às perguntas mais frequentes sobre o Azure Developer CLI (azd) e implantações no Azure. Encontre soluções rápidas para problemas comuns, compreenda as melhores práticas e obtenha esclarecimentos sobre conceitos e fluxos de trabalho do azd.

## Objetivos de Aprendizagem

Ao rever este FAQ, você irá:
- Encontrar respostas rápidas para perguntas e problemas comuns do Azure Developer CLI
- Compreender conceitos-chave e terminologia através de um formato prático de perguntas e respostas
- Aceder a soluções de resolução de problemas para cenários frequentes e erros
- Aprender as melhores práticas através das perguntas frequentemente feitas sobre otimização
- Descobrir funcionalidades e capacidades avançadas através de questões a nível de especialista
- Referenciar de forma eficiente orientações sobre custos, segurança e estratégias de implantação

## Resultados da Aprendizagem

Com a consulta regular a este FAQ, você será capaz de:
- Resolver problemas comuns do Azure Developer CLI de forma autónoma utilizando as soluções fornecidas
- Tomar decisões informadas sobre estratégias e configurações de implantação
- Compreender a relação entre o azd e outras ferramentas e serviços Azure
- Aplicar as melhores práticas baseadas na experiência da comunidade e recomendações de especialistas
- Diagnosticar problemas de autenticação, implantação e configuração de forma eficaz
- Otimizar custos e desempenho usando os conhecimentos e recomendações do FAQ

## Índice

- [Introdução](../../../resources)
- [Autenticação e Acesso](../../../resources)
- [Modelos e Projetos](../../../resources)
- [Implantação e Infraestrutura](../../../resources)
- [Configuração e Ambientes](../../../resources)
- [Resolução de Problemas](../../../resources)
- [Custos e Faturação](../../../resources)
- [Melhores Práticas](../../../resources)
- [Tópicos Avançados](../../../resources)

---

## Introdução

### P: O que é o Azure Developer CLI (azd)?
**R**: O Azure Developer CLI (azd) é uma ferramenta de linha de comando centrada no desenvolvedor que acelera o tempo necessário para levar a sua aplicação do ambiente de desenvolvimento local para o Azure. Fornece as melhores práticas através de modelos e ajuda em todo o ciclo de vida da implantação.

### P: Como o azd é diferente do Azure CLI?
**R**: 
- **Azure CLI**: Ferramenta de uso geral para gerir recursos Azure
- **azd**: Ferramenta focada no desenvolvedor para fluxos de trabalho de implantação de aplicações
- O azd usa internamente o Azure CLI, mas fornece abstrações de nível superior para cenários comuns de desenvolvimento
- O azd inclui modelos, gestão de ambientes e automação de implantação

### P: Preciso do Azure CLI instalado para usar o azd?
**R**: Sim, o azd requer o Azure CLI para autenticação e algumas operações. Instale primeiro o Azure CLI e depois o azd.

### P: Quais linguagens de programação o azd suporta?
**R**: O azd é independente da linguagem. Funciona com:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Sites estáticos
- Aplicações conteinerizadas

### P: Posso usar o azd com projetos existentes?
**R**: Sim! Pode:
1. Usar `azd init` para adicionar a configuração azd a projetos existentes
2. Adaptar projetos existentes para corresponder à estrutura do modelo azd
3. Criar modelos personalizados baseados na sua arquitetura existente

---

## Autenticação e Acesso

### P: Como me autentico no Azure usando o azd?
**R**: Use `azd auth login` que abrirá uma janela de navegador para autenticação Azure. Para cenários CI/CD, utilize service principals ou identidades geridas.

### P: Posso usar o azd com múltiplas subscrições Azure?
**R**: Sim. Use `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` para especificar qual subscrição usar para cada ambiente.

### P: Que permissões preciso para implantar com azd?
**R**: Normalmente precisa de:
- Papel de **Contribuidor** no grupo de recursos ou subscrição
- **Administrador de Acesso do Utilizador** se estiver a implantar recursos que requerem atribuições de papel
- Permissões específicas variam conforme o modelo e recursos a implantar

### P: Posso usar o azd em pipelines CI/CD?
**R**: Absolutamente! O azd é projetado para integração CI/CD. Use service principals para autenticação e defina variáveis de ambiente para configuração.

### P: Como gerir autenticação em GitHub Actions?
**R**: Use a ação Azure Login com credenciais de service principal:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Modelos e Projetos

### P: Onde posso encontrar modelos azd?
**R**: 
- Modelos oficiais: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Modelos da comunidade: pesquisa GitHub por "azd-template"
- Use `azd template list` para navegar pelos modelos disponíveis

### P: Como criar um modelo personalizado?
**R**: 
1. Comece com uma estrutura de modelo existente
2. Modifique `azure.yaml`, ficheiros de infraestrutura e código da aplicação
3. Teste completamente com `azd up`
4. Publique no GitHub com etiquetas apropriadas

### P: Posso usar o azd sem um modelo?
**R**: Sim, use `azd init` num projeto existente para criar os ficheiros de configuração necessários. Terá de configurar manualmente `azure.yaml` e os ficheiros de infraestrutura.

### P: Qual a diferença entre modelos oficiais e da comunidade?
**R**: 
- **Modelos oficiais**: Mantidos pela Microsoft, atualizados regularmente, documentação abrangente
- **Modelos da comunidade**: Criados por desenvolvedores, podem ter casos de uso especializados, qualidade e manutenção variadas

### P: Como atualizo um modelo no meu projeto?
**R**: Os modelos não são atualizados automaticamente. Pode:
1. Comparar e juntar manualmente alterações do modelo fonte
2. Começar de novo com `azd init` usando o modelo atualizado
3. Selecionar melhorias específicas dos modelos atualizados

---

## Implantação e Infraestrutura

### P: Que serviços Azure posso implantar com o azd?
**R**: O azd pode implantar qualquer serviço Azure usando modelos Bicep/ARM, incluindo:
- App Services, Container Apps, Functions
- Bases de dados (SQL, PostgreSQL, Cosmos DB)
- Armazenamento, Key Vault, Application Insights
- Redes, segurança e recursos de monitorização

### P: Posso implantar em múltiplas regiões?
**R**: Sim, configure múltiplas regiões nos seus modelos Bicep e defina o parâmetro de localização adequadamente para cada ambiente.

### P: Como faço migrações de esquema de base de dados?
**R**: Use hooks de implantação em `azure.yaml`:
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
**R**: Isto é complexo e não suportado diretamente. Pode:
1. Importar recursos existentes para os seus modelos Bicep
2. Usar referências a recursos existentes nos modelos
3. Modificar os modelos para criar ou referenciar recursos condicionalmente

### P: Posso usar Terraform em vez de Bicep?
**R**: Atualmente, o azd suporta principalmente modelos Bicep/ARM. O suporte a Terraform não é oficialmente disponibilizado, embora possam existir soluções comunitárias.

---

## Configuração e Ambientes

### P: Como gerencio diferentes ambientes (dev, staging, prod)?
**R**: Crie ambientes separados com `azd env new <environment-name>` e configure definições distintas para cada um:
```bash
azd env new development
azd env new staging  
azd env new production
```

### P: Onde são armazenadas as configurações de ambiente?
**R**: Na pasta `.azure` dentro do seu diretório de projeto. Cada ambiente tem a sua própria pasta com ficheiros de configuração.

### P: Como defino configuração específica por ambiente?
**R**: Use `azd env set` para configurar variáveis de ambiente:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### P: Posso partilhar configurações de ambiente entre membros da equipa?
**R**: A pasta `.azure` contém informação sensível e não deve ser comprometida no controlo de versões. Em vez disso:
1. Documente as variáveis de ambiente necessárias
2. Use scripts de implantação para configurar ambientes
3. Use Azure Key Vault para configurações sensíveis

### P: Como posso sobrepor os valores padrão do modelo?
**R**: Defina variáveis de ambiente que correspondem aos parâmetros do modelo:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Resolução de Problemas

### P: Porque é que `azd up` está a falhar?
**R**: Causas comuns:
1. **Problemas de autenticação**: Execute `azd auth login`
2. **Permissões insuficientes**: Verifique as suas atribuições de papel Azure
3. **Conflitos no nome dos recursos**: Altere AZURE_ENV_NAME
4. **Problemas de quota/capacidade**: Verifique disponibilidade regional
5. **Erros nos modelos**: Valide os modelos Bicep

### P: Como depurar falhas na implantação?
**R**: 
1. Use `azd deploy --debug` para saída detalhada
2. Verifique o histórico de implantações no portal Azure
3. Consulte o Registo de Atividades no portal Azure
4. Use `azd show` para exibir o estado atual do ambiente

### P: Porque é que as minhas variáveis de ambiente não funcionam?
**R**: Verifique:
1. Os nomes das variáveis coincidem exatamente com os parâmetros do modelo
2. Os valores estão corretamente entre aspas se contiverem espaços
3. O ambiente está selecionado: `azd env select <environment>`
4. As variáveis estão definidas no ambiente correto

### P: Como limpar implantações falhadas?
**R**: 
```bash
azd down --force --purge
```
Isto remove todos os recursos e a configuração do ambiente.

### P: Porque é que a minha aplicação não está acessível após a implantação?
**R**: Verifique:
1. A implantação foi concluída com sucesso
2. A aplicação está a funcionar (verifique logs no portal Azure)
3. Os grupos de segurança de rede permitem o tráfego
4. Os domínios DNS/personalizados estão configurados corretamente

---

## Custos e Faturação

### P: Quanto vão custar as implantações azd?
**R**: Os custos dependem de:
- Serviços Azure implantados
- Níveis/SKUs de serviço selecionados
- Diferenças regionais de preços
- Padrões de utilização

Utilize a [Calculadora de Preços Azure](https://azure.microsoft.com/pricing/calculator/) para estimativas.

### P: Como controlo os custos nas implantações azd?
**R**: 
1. Use SKUs de nível inferior para ambientes de desenvolvimento
2. Configure orçamentos e alertas Azure
3. Use `azd down` para remover recursos quando não necessários
4. Escolha regiões adequadas (custos variam conforme localização)
5. Utilize ferramentas de Gestão de Custos Azure

### P: Existem opções de nível gratuito para modelos azd?
**R**: Muitos serviços Azure oferecem níveis gratuitos:
- App Service: nível gratuito disponível
- Azure Functions: 1M execuções gratuitas/mês
- Cosmos DB: nível gratuito com 400 RU/s
- Application Insights: primeiros 5GB/mês gratuitos

Configure os modelos para usar níveis gratuitos quando disponíveis.

### P: Como estimar custos antes da implantação?
**R**: 
1. Reveja o `main.bicep` do modelo para ver que recursos são criados
2. Use a Calculadora de Preços Azure com SKUs específicos
3. Implante primeiro num ambiente de desenvolvimento para monitorizar custos reais
4. Use Gestão de Custos Azure para análise detalhada

---

## Melhores Práticas

### P: Quais são as melhores práticas para a estrutura do projeto azd?
**R**: 
1. Mantenha o código da aplicação separado da infraestrutura
2. Use nomes significativos de serviços em `azure.yaml`
3. Implemente tratamento adequado de erros em scripts de compilação
4. Utilize configuração específica por ambiente
5. Inclua documentação detalhada

### P: Como organizar múltiplos serviços no azd?
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

### P: Devo comprometer a pasta `.azure` no controlo de versões?
**R**: **Não!** A pasta `.azure` contém informação sensível. Adicione ao `.gitignore`:
```gitignore
.azure/
```

### P: Como gerir segredos e configuração sensível?
**R**: 
1. Use Azure Key Vault para segredos
2. Faça referência a segredos do Key Vault na configuração da aplicação
3. Nunca comprometa segredos no controlo de versões
4. Use identidades geridas para autenticação serviço a serviço

### P: Qual é a abordagem recomendada para CI/CD com azd?
**R**: 
1. Use ambientes separados para cada etapa (dev/staging/prod)
2. Implemente testes automatizados antes da implantação
3. Use service principals para autenticação
4. Armazene configurações sensíveis em segredos/variáveis do pipeline
5. Implemente aprovações antes de implantações em produção

---

## Tópicos Avançados

### P: Posso estender o azd com funcionalidades personalizadas?
**R**: Sim, através de deployment hooks em `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### P: Como integrar o azd com processos DevOps existentes?
**R**: 
1. Use comandos azd em scripts de pipelines existentes
2. Padronize os modelos azd entre equipas
3. Integre com monitorização e alertas existentes
4. Use a saída JSON do azd para integração em pipelines

### P: Posso usar o azd com Azure DevOps?
**R**: Sim, o azd funciona com qualquer sistema CI/CD. Crie pipelines Azure DevOps que usem comandos azd.

### P: Como posso contribuir para o azd ou criar modelos comunitários?
**R**: 
1. **ferramenta azd**: Contribua para [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Modelos**: Crie modelos seguindo as [diretrizes dos modelos](https://github.com/Azure-Samples/awesome-azd)
3. **Documentação**: Contribua para a documentação em [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### P: Qual é o roadmap para azd?
**R**: Verifique o [roadmap oficial](https://github.com/Azure/azure-dev/projects) para funcionalidades e melhorias planeadas.

### P: Como faço a migração de outras ferramentas de implantação para azd?
**R**: 
1. Analise a arquitetura de implantação atual
2. Crie modelos equivalentes em Bicep
3. Configure o `azure.yaml` para corresponder aos serviços atuais
4. Teste exaustivamente no ambiente de desenvolvimento
5. Migre os ambientes gradualmente

---

## Ainda tem dúvidas?

### **Procure Primeiro**
- Consulte a [documentação oficial](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Pesquise [problemas no GitHub](https://github.com/Azure/azure-dev/issues) para problemas semelhantes

### **Obtenha Ajuda**
- [Discussões no GitHub](https://github.com/Azure/azure-dev/discussions) - Suporte da comunidade
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Perguntas técnicas
- [Azure Discord](https://discord.gg/azure) - Chat em tempo real da comunidade

### **Reportar Problemas**
- [Problemas no GitHub](https://github.com/Azure/azure-dev/issues/new) - Relato de bugs e pedidos de funcionalidades
- Inclua registos relevantes, mensagens de erro e passos para reproduzir

### **Saiba Mais**
- [Documentação do Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centro de Arquitetura Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Estrutura Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Este FAQ é atualizado regularmente. Última atualização: 9 de setembro de 2025*

---

**Navegação**
- **Lição Anterior**: [Glossário](glossary.md)
- **Próxima Lição**: [Guia de Estudo](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua original deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se a tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->