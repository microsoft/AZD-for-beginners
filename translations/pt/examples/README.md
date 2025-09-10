<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9a24ebb49f185f0864813ce1178a3d8b",
  "translation_date": "2025-09-10T15:12:30+00:00",
  "source_file": "examples/README.md",
  "language_code": "pt"
}
-->
# Exemplos - Modelos e Configurações Práticas do AZD

## Introdução

Este diretório contém exemplos práticos, modelos e cenários do mundo real para ajudá-lo a aprender o Azure Developer CLI através de prática prática. Cada exemplo fornece código funcional completo, modelos de infraestrutura e instruções detalhadas para diferentes arquiteturas de aplicação e padrões de implementação.

## Objetivos de Aprendizagem

Ao trabalhar com estes exemplos, você irá:
- Praticar fluxos de trabalho do Azure Developer CLI com cenários de aplicação realistas
- Compreender diferentes arquiteturas de aplicação e suas implementações no azd
- Dominar padrões de Infraestrutura como Código para vários serviços do Azure
- Aplicar estratégias de gestão de configuração e implementação específicas para cada ambiente
- Implementar padrões de monitorização, segurança e escalabilidade em contextos práticos
- Ganhar experiência com resolução de problemas e depuração de cenários reais de implementação

## Resultados de Aprendizagem

Ao concluir estes exemplos, você será capaz de:
- Implementar com confiança vários tipos de aplicações usando o Azure Developer CLI
- Adaptar os modelos fornecidos às suas próprias necessidades de aplicação
- Projetar e implementar padrões de infraestrutura personalizados usando Bicep
- Configurar aplicações complexas com múltiplos serviços e dependências adequadas
- Aplicar as melhores práticas de segurança, monitorização e desempenho em cenários reais
- Resolver problemas e otimizar implementações com base em experiência prática

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

## Exemplos Rápidos

### Para Iniciantes
1. **[Aplicação Web Simples](../../../examples/simple-web-app)** - Implementar uma aplicação web básica em Node.js
2. **[Website Estático](../../../examples/static-website)** - Hospedar um website estático no Azure Storage
3. **[Aplicação em Contêiner](../../../examples/container-app)** - Implementar uma aplicação conteinerizada

### Para Utilizadores Intermediários
4. **[Aplicação com Base de Dados](../../../examples/database-app)** - Aplicação web com base de dados PostgreSQL
5. **[Função Serverless](../../../examples/serverless-function)** - Azure Functions com gatilhos HTTP
6. **[Microserviços](../../../examples/microservices)** - Aplicação com múltiplos serviços e gateway de API

## 📋 Instruções de Utilização

### Executar Exemplos Localmente

1. **Clonar ou Copiar o Exemplo**  
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **Inicializar o Ambiente AZD**  
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Configurar o Ambiente**  
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Implementar**  
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### Adaptar Exemplos

Cada exemplo inclui:
- **README.md** - Instruções detalhadas de configuração e personalização
- **azure.yaml** - Configuração do AZD com comentários
- **infra/** - Modelos Bicep com explicações de parâmetros
- **src/** - Código de aplicação de exemplo
- **scripts/** - Scripts auxiliares para tarefas comuns

## 🎯 Objetivos de Aprendizagem

### Categorias de Exemplos

#### **Implementações Básicas**
- Aplicações com um único serviço
- Padrões simples de infraestrutura
- Gestão básica de configuração
- Configurações de desenvolvimento económicas

#### **Cenários Avançados**
- Arquiteturas com múltiplos serviços
- Configurações complexas de rede
- Padrões de integração com bases de dados
- Implementações de segurança e conformidade

#### **Padrões Prontos para Produção**
- Configurações de alta disponibilidade
- Monitorização e observabilidade
- Integração com CI/CD
- Configurações de recuperação de desastres

## 📖 Descrições dos Exemplos

### Aplicação Web Simples
**Tecnologias**: Node.js, App Service, Application Insights  
**Complexidade**: Iniciante  
**Conceitos**: Implementação básica, variáveis de ambiente, verificações de saúde

### Website Estático
**Tecnologias**: HTML/CSS/JS, Storage Account, CDN  
**Complexidade**: Iniciante  
**Conceitos**: Hospedagem estática, integração com CDN, domínios personalizados

### Aplicação em Contêiner
**Tecnologias**: Docker, Container Apps, Container Registry  
**Complexidade**: Intermediário  
**Conceitos**: Conteinerização, escalabilidade, configuração de entrada

### Aplicação com Base de Dados
**Tecnologias**: Python Flask, PostgreSQL, App Service  
**Complexidade**: Intermediário  
**Conceitos**: Conexões com base de dados, gestão de segredos, migrações

### Função Serverless
**Tecnologias**: Azure Functions, Cosmos DB, API Management  
**Complexidade**: Intermediário  
**Conceitos**: Arquitetura orientada a eventos, bindings, gestão de API

### Microserviços
**Tecnologias**: Múltiplos serviços, Service Bus, API Gateway  
**Complexidade**: Avançado  
**Conceitos**: Comunicação entre serviços, filas de mensagens, balanceamento de carga

## 🛠 Exemplos de Configuração

O diretório `configurations/` contém componentes reutilizáveis:

### Configurações de Ambiente
- Definições para ambiente de desenvolvimento
- Configurações para ambiente de staging
- Configurações prontas para produção
- Configurações para implementações em várias regiões

### Módulos Bicep
- Componentes de infraestrutura reutilizáveis
- Padrões comuns de recursos
- Modelos reforçados em segurança
- Configurações otimizadas para custos

### Scripts Auxiliares
- Automação de configuração de ambiente
- Scripts de migração de base de dados
- Ferramentas de validação de implementação
- Utilitários de monitorização de custos

## 🔧 Guia de Personalização

### Adaptar Exemplos ao Seu Caso de Uso

1. **Rever Pré-requisitos**
   - Verificar os requisitos dos serviços do Azure
   - Confirmar limites da subscrição
   - Compreender as implicações de custos

2. **Modificar Configuração**
   - Atualizar definições de serviço no `azure.yaml`
   - Personalizar modelos Bicep
   - Ajustar variáveis de ambiente

3. **Testar Minuciosamente**
   - Implementar primeiro no ambiente de desenvolvimento
   - Validar a funcionalidade
   - Testar escalabilidade e desempenho

4. **Revisão de Segurança**
   - Verificar controlos de acesso
   - Implementar gestão de segredos
   - Ativar monitorização e alertas

## 📊 Matriz de Comparação

| Exemplo              | Serviços | Base de Dados | Autenticação | Monitorização | Complexidade |
|----------------------|----------|---------------|--------------|---------------|--------------|
| Aplicação Web Simples | 1        | ❌             | Básica       | Básica        | ⭐           |
| Website Estático      | 1        | ❌             | ❌           | Básica        | ⭐           |
| Aplicação em Contêiner| 1        | ❌             | Básica       | Completa      | ⭐⭐          |
| Aplicação com Base de Dados | 2 | ✅             | Completa     | Completa      | ⭐⭐⭐         |
| Função Serverless     | 3        | ✅             | Completa     | Completa      | ⭐⭐⭐         |
| Microserviços         | 5+       | ✅             | Completa     | Completa      | ⭐⭐⭐⭐        |

## 🎓 Caminho de Aprendizagem

### Progressão Recomendada

1. **Comece com a Aplicação Web Simples**
   - Aprenda conceitos básicos do AZD
   - Compreenda o fluxo de trabalho de implementação
   - Pratique a gestão de ambientes

2. **Experimente o Website Estático**
   - Explore diferentes opções de hospedagem
   - Aprenda sobre integração com CDN
   - Compreenda a configuração de DNS

3. **Avance para a Aplicação em Contêiner**
   - Aprenda os fundamentos da conteinerização
   - Compreenda conceitos de escalabilidade
   - Pratique com Docker

4. **Adicione Integração com Base de Dados**
   - Aprenda a provisionar bases de dados
   - Compreenda strings de conexão
   - Pratique a gestão de segredos

5. **Explore o Serverless**
   - Compreenda a arquitetura orientada a eventos
   - Aprenda sobre gatilhos e bindings
   - Pratique com APIs

6. **Construa Microserviços**
   - Aprenda comunicação entre serviços
   - Compreenda sistemas distribuídos
   - Pratique implementações complexas

## 🔍 Encontrar o Exemplo Certo

### Por Stack Tecnológico
- **Node.js**: Aplicação Web Simples, Microserviços
- **Python**: Aplicação com Base de Dados, Função Serverless
- **Sites Estáticos**: Website Estático
- **Contêineres**: Aplicação em Contêiner, Microserviços
- **Bases de Dados**: Aplicação com Base de Dados, Função Serverless

### Por Padrão de Arquitetura
- **Monolítico**: Aplicação Web Simples, Aplicação com Base de Dados
- **Estático**: Website Estático
- **Microserviços**: Exemplo de Microserviços
- **Serverless**: Função Serverless
- **Híbrido**: Aplicação em Contêiner

### Por Nível de Complexidade
- **Iniciante**: Aplicação Web Simples, Website Estático
- **Intermediário**: Aplicação em Contêiner, Aplicação com Base de Dados, Função Serverless  
- **Avançado**: Microserviços

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
- [Framework de Adoção na Nuvem](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Contribuir com Exemplos

Tem um exemplo útil para partilhar? Aceitamos contribuições!

### Diretrizes para Submissão
1. Siga a estrutura de diretório estabelecida
2. Inclua um README.md abrangente
3. Adicione comentários aos ficheiros de configuração
4. Teste minuciosamente antes de submeter
5. Inclua estimativas de custos e pré-requisitos

### Estrutura do Modelo de Exemplo
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

**Dica Pro**: Comece com o exemplo mais simples que corresponda ao seu stack tecnológico e, gradualmente, avance para cenários mais complexos. Cada exemplo constrói conceitos a partir dos anteriores!

**Próximos Passos**: 
- Escolha um exemplo que corresponda ao seu nível de habilidade
- Siga as instruções de configuração no README do exemplo
- Experimente personalizações
- Partilhe os seus aprendizados com a comunidade

---

**Navegação**
- **Lição Anterior**: [Guia de Estudo](../resources/study-guide.md)
- **Voltar para**: [README Principal](../README.md)

---

**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, é importante notar que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autoritária. Para informações críticas, recomenda-se a tradução profissional realizada por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes da utilização desta tradução.