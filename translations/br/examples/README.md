<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9a24ebb49f185f0864813ce1178a3d8b",
  "translation_date": "2025-09-10T15:12:57+00:00",
  "source_file": "examples/README.md",
  "language_code": "br"
}
-->
# Exemplos - Modelos e Configurações Práticas do AZD

## Introdução

Este diretório contém exemplos práticos, modelos e cenários reais para ajudar você a aprender o Azure Developer CLI por meio de prática prática. Cada exemplo fornece código funcional completo, modelos de infraestrutura e instruções detalhadas para diferentes arquiteturas de aplicativos e padrões de implantação.

## Objetivos de Aprendizado

Ao trabalhar com esses exemplos, você irá:
- Praticar fluxos de trabalho do Azure Developer CLI com cenários de aplicativos realistas
- Compreender diferentes arquiteturas de aplicativos e suas implementações no azd
- Dominar padrões de Infraestrutura como Código para diversos serviços do Azure
- Aplicar estratégias de gerenciamento de configuração e implantação específicas para ambientes
- Implementar padrões de monitoramento, segurança e escalabilidade em contextos práticos
- Ganhar experiência com solução de problemas e depuração de cenários reais de implantação

## Resultados de Aprendizado

Ao concluir esses exemplos, você será capaz de:
- Implantar com confiança diversos tipos de aplicativos usando o Azure Developer CLI
- Adaptar os modelos fornecidos às suas próprias necessidades de aplicativos
- Projetar e implementar padrões de infraestrutura personalizados usando Bicep
- Configurar aplicativos complexos com múltiplos serviços e dependências adequadas
- Aplicar práticas recomendadas de segurança, monitoramento e desempenho em cenários reais
- Solucionar problemas e otimizar implantações com base em experiência prática

## Estrutura do Diretório

```
examples/
├── simple-web-app/          # Basic web application deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── microservices/           # Multi-service application
│   ├── azure.yaml
│   ├── infra/
│   ├── services/
│   └── README.md
├── database-app/            # Application with database
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── container-app/           # Containerized application
│   ├── azure.yaml
│   ├── infra/
│   ├── Dockerfile
│   ├── src/
│   └── README.md
├── serverless-function/     # Azure Functions example
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── static-website/          # Static website deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## Exemplos de Início Rápido

### Para Iniciantes
1. **[Aplicativo Web Simples](../../../examples/simple-web-app)** - Implante um aplicativo web básico em Node.js
2. **[Site Estático](../../../examples/static-website)** - Hospede um site estático no Azure Storage
3. **[Aplicativo em Contêiner](../../../examples/container-app)** - Implante um aplicativo em contêiner

### Para Usuários Intermediários
4. **[Aplicativo com Banco de Dados](../../../examples/database-app)** - Aplicativo web com banco de dados PostgreSQL
5. **[Função Serverless](../../../examples/serverless-function)** - Azure Functions com gatilhos HTTP
6. **[Microservices](../../../examples/microservices)** - Aplicativo com múltiplos serviços e gateway de API

## 📋 Instruções de Uso

### Executando Exemplos Localmente

1. **Clone ou Copie o Exemplo**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **Inicialize o Ambiente AZD**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Configure o Ambiente**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Implante**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### Adaptando Exemplos

Cada exemplo inclui:
- **README.md** - Instruções detalhadas de configuração e personalização
- **azure.yaml** - Configuração do AZD com comentários
- **infra/** - Modelos Bicep com explicações de parâmetros
- **src/** - Código de aplicativo de exemplo
- **scripts/** - Scripts auxiliares para tarefas comuns

## 🎯 Objetivos de Aprendizado

### Categorias de Exemplos

#### **Implantações Básicas**
- Aplicativos com um único serviço
- Padrões simples de infraestrutura
- Gerenciamento básico de configuração
- Configurações econômicas para desenvolvimento

#### **Cenários Avançados**
- Arquiteturas com múltiplos serviços
- Configurações complexas de rede
- Padrões de integração com banco de dados
- Implementações de segurança e conformidade

#### **Padrões Prontos para Produção**
- Configurações de alta disponibilidade
- Monitoramento e observabilidade
- Integração com CI/CD
- Configurações de recuperação de desastres

## 📖 Descrições dos Exemplos

### Aplicativo Web Simples
**Tecnologias**: Node.js, App Service, Application Insights  
**Complexidade**: Iniciante  
**Conceitos**: Implantação básica, variáveis de ambiente, verificações de saúde

### Site Estático
**Tecnologias**: HTML/CSS/JS, Storage Account, CDN  
**Complexidade**: Iniciante  
**Conceitos**: Hospedagem estática, integração com CDN, domínios personalizados

### Aplicativo em Contêiner
**Tecnologias**: Docker, Container Apps, Container Registry  
**Complexidade**: Intermediário  
**Conceitos**: Containerização, escalabilidade, configuração de entrada

### Aplicativo com Banco de Dados
**Tecnologias**: Python Flask, PostgreSQL, App Service  
**Complexidade**: Intermediário  
**Conceitos**: Conexões com banco de dados, gerenciamento de segredos, migrações

### Função Serverless
**Tecnologias**: Azure Functions, Cosmos DB, API Management  
**Complexidade**: Intermediário  
**Conceitos**: Arquitetura orientada a eventos, bindings, gerenciamento de API

### Microservices
**Tecnologias**: Múltiplos serviços, Service Bus, API Gateway  
**Complexidade**: Avançado  
**Conceitos**: Comunicação entre serviços, filas de mensagens, balanceamento de carga

## 🛠 Exemplos de Configuração

O diretório `configurations/` contém componentes reutilizáveis:

### Configurações de Ambiente
- Configurações para ambiente de desenvolvimento
- Configurações para ambiente de staging
- Configurações prontas para produção
- Configurações de implantação em múltiplas regiões

### Módulos Bicep
- Componentes de infraestrutura reutilizáveis
- Padrões comuns de recursos
- Modelos reforçados para segurança
- Configurações otimizadas para custo

### Scripts Auxiliares
- Automação de configuração de ambiente
- Scripts de migração de banco de dados
- Ferramentas de validação de implantação
- Utilitários de monitoramento de custos

## 🔧 Guia de Personalização

### Adaptando Exemplos para Seu Caso de Uso

1. **Revise os Pré-requisitos**
   - Verifique os requisitos de serviços do Azure
   - Confirme os limites da assinatura
   - Entenda as implicações de custo

2. **Modifique a Configuração**
   - Atualize as definições de serviço no `azure.yaml`
   - Personalize os modelos Bicep
   - Ajuste as variáveis de ambiente

3. **Teste Minuciosamente**
   - Implante primeiro no ambiente de desenvolvimento
   - Valide a funcionalidade
   - Teste escalabilidade e desempenho

4. **Revisão de Segurança**
   - Revise os controles de acesso
   - Implemente gerenciamento de segredos
   - Ative monitoramento e alertas

## 📊 Matriz de Comparação

| Exemplo | Serviços | Banco de Dados | Autenticação | Monitoramento | Complexidade |
|---------|----------|----------------|--------------|---------------|--------------|
| Aplicativo Web Simples | 1 | ❌ | Básico | Básico | ⭐ |
| Site Estático | 1 | ❌ | ❌ | Básico | ⭐ |
| Aplicativo em Contêiner | 1 | ❌ | Básico | Completo | ⭐⭐ |
| Aplicativo com Banco de Dados | 2 | ✅ | Completo | Completo | ⭐⭐⭐ |
| Função Serverless | 3 | ✅ | Completo | Completo | ⭐⭐⭐ |
| Microservices | 5+ | ✅ | Completo | Completo | ⭐⭐⭐⭐ |

## 🎓 Caminho de Aprendizado

### Progressão Recomendada

1. **Comece com Aplicativo Web Simples**
   - Aprenda conceitos básicos do AZD
   - Entenda o fluxo de trabalho de implantação
   - Pratique gerenciamento de ambiente

2. **Experimente Site Estático**
   - Explore diferentes opções de hospedagem
   - Aprenda sobre integração com CDN
   - Entenda configuração de DNS

3. **Avance para Aplicativo em Contêiner**
   - Aprenda os fundamentos da containerização
   - Entenda conceitos de escalabilidade
   - Pratique com Docker

4. **Adicione Integração com Banco de Dados**
   - Aprenda provisionamento de banco de dados
   - Entenda strings de conexão
   - Pratique gerenciamento de segredos

5. **Explore Serverless**
   - Entenda arquitetura orientada a eventos
   - Aprenda sobre gatilhos e bindings
   - Pratique com APIs

6. **Construa Microservices**
   - Aprenda comunicação entre serviços
   - Entenda sistemas distribuídos
   - Pratique implantações complexas

## 🔍 Encontrando o Exemplo Certo

### Por Stack de Tecnologia
- **Node.js**: Aplicativo Web Simples, Microservices
- **Python**: Aplicativo com Banco de Dados, Função Serverless
- **Sites Estáticos**: Site Estático
- **Contêineres**: Aplicativo em Contêiner, Microservices
- **Bancos de Dados**: Aplicativo com Banco de Dados, Função Serverless

### Por Padrão de Arquitetura
- **Monolítico**: Aplicativo Web Simples, Aplicativo com Banco de Dados
- **Estático**: Site Estático
- **Microservices**: Exemplo de Microservices
- **Serverless**: Função Serverless
- **Híbrido**: Aplicativo em Contêiner

### Por Nível de Complexidade
- **Iniciante**: Aplicativo Web Simples, Site Estático
- **Intermediário**: Aplicativo em Contêiner, Aplicativo com Banco de Dados, Função Serverless  
- **Avançado**: Microservices

## 📚 Recursos Adicionais

### Links de Documentação
- [Modelos AZD do Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)
- [Documentação do Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Centro de Arquitetura do Azure](https://learn.microsoft.com/en-us/azure/architecture/)

### Exemplos da Comunidade
- [Modelos AZD de Exemplos do Azure](https://github.com/Azure-Samples/azd-templates)
- [Modelos do Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)
- [Galeria do Azure Developer CLI](https://azure.github.io/awesome-azd/)

### Melhores Práticas
- [Framework Bem-Arquitetado do Azure](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Framework de Adoção de Nuvem](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Contribuindo com Exemplos

Tem um exemplo útil para compartilhar? Aceitamos contribuições!

### Diretrizes de Submissão
1. Siga a estrutura de diretório estabelecida
2. Inclua README.md abrangente
3. Adicione comentários aos arquivos de configuração
4. Teste minuciosamente antes de enviar
5. Inclua estimativas de custo e pré-requisitos

### Estrutura de Modelo de Exemplo
```
example-name/
├── README.md           # Detailed setup instructions
├── azure.yaml          # AZD configuration
├── infra/              # Infrastructure templates
│   ├── main.bicep
│   └── modules/
├── src/                # Application source code
├── scripts/            # Helper scripts
├── .gitignore         # Git ignore rules
└── docs/              # Additional documentation
```

---

**Dica Pro**: Comece com o exemplo mais simples que corresponda ao seu stack de tecnologia e, gradualmente, avance para cenários mais complexos. Cada exemplo constrói conceitos a partir dos anteriores!

**Próximos Passos**: 
- Escolha um exemplo que corresponda ao seu nível de habilidade
- Siga as instruções de configuração no README do exemplo
- Experimente personalizações
- Compartilhe seus aprendizados com a comunidade

---

**Navegação**
- **Lição Anterior**: [Guia de Estudo](../resources/study-guide.md)
- **Voltar para**: [README Principal](../README.md)

---

**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se a tradução profissional realizada por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.