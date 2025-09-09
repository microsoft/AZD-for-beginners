<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9b7074c8a39e77d2f10fb08b3c6ce34f",
  "translation_date": "2025-09-09T17:32:53+00:00",
  "source_file": "examples/README.md",
  "language_code": "pt"
}
-->
# Exemplos - Modelos e Configurações Práticas do AZD

## Introdução

Este diretório contém exemplos práticos, modelos e cenários reais para ajudá-lo a aprender o Azure Developer CLI através de prática prática. Cada exemplo fornece código funcional completo, modelos de infraestrutura e instruções detalhadas para diferentes arquiteturas de aplicação e padrões de implementação.

## Objetivos de Aprendizagem

Ao trabalhar com estes exemplos, você irá:
- Praticar fluxos de trabalho do Azure Developer CLI com cenários de aplicação realistas
- Compreender diferentes arquiteturas de aplicação e suas implementações com azd
- Dominar padrões de Infraestrutura como Código para vários serviços Azure
- Aplicar estratégias de gestão de configuração e implementação específicas para ambientes
- Implementar padrões de monitorização, segurança e escalabilidade em contextos práticos
- Ganhar experiência com resolução de problemas e depuração de cenários reais de implementação

## Resultados de Aprendizagem

Ao concluir estes exemplos, você será capaz de:
- Implementar com confiança vários tipos de aplicações usando o Azure Developer CLI
- Adaptar os modelos fornecidos às suas próprias necessidades de aplicação
- Projetar e implementar padrões de infraestrutura personalizados usando Bicep
- Configurar aplicações complexas com múltiplos serviços e dependências adequadas
- Aplicar práticas recomendadas de segurança, monitorização e desempenho em cenários reais
- Resolver problemas e otimizar implementações com base na experiência prática

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
1. **[Aplicação Web Simples](../../../examples/simple-web-app)** - Implementar uma aplicação web básica em Node.js
2. **[Website Estático](../../../examples/static-website)** - Hospedar um website estático no Azure Storage
3. **[Aplicação em Contêiner](../../../examples/container-app)** - Implementar uma aplicação conteinerizada

### Para Utilizadores Intermediários
4. **[Aplicação com Base de Dados](../../../examples/database-app)** - Aplicação web com base de dados PostgreSQL
5. **[Função Serverless](../../../examples/serverless-function)** - Azure Functions com triggers HTTP
6. **[Microserviços](../../../examples/microservices)** - Aplicação com múltiplos serviços e gateway de API

## 📋 Instruções de Utilização

### Executar Exemplos Localmente

1. **Clonar ou Copiar o Exemplo**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **Inicializar Ambiente AZD**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Configurar Ambiente**
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
- Configurações económicas para desenvolvimento

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
- Configurações para ambiente de desenvolvimento
- Configurações para ambiente de staging
- Configurações prontas para produção
- Configurações de implementação em múltiplas regiões

### Módulos Bicep
- Componentes de infraestrutura reutilizáveis
- Padrões comuns de recursos
- Modelos reforçados em segurança
- Configurações otimizadas para custo

### Scripts Auxiliares
- Automação de configuração de ambiente
- Scripts de migração de base de dados
- Ferramentas de validação de implementação
- Utilitários de monitorização de custos

## 🔧 Guia de Personalização

### Adaptar Exemplos ao Seu Caso de Uso

1. **Revisar Pré-requisitos**
   - Verificar requisitos de serviços Azure
   - Confirmar limites de subscrição
   - Compreender implicações de custo

2. **Modificar Configuração**
   - Atualizar definições de serviços no `azure.yaml`
   - Personalizar modelos Bicep
   - Ajustar variáveis de ambiente

3. **Testar Minuciosamente**
   - Implementar primeiro no ambiente de desenvolvimento
   - Validar funcionalidade
   - Testar escalabilidade e desempenho

4. **Revisão de Segurança**
   - Revisar controles de acesso
   - Implementar gestão de segredos
   - Ativar monitorização e alertas

## 📊 Matriz de Comparação

| Exemplo | Serviços | Base de Dados | Autenticação | Monitorização | Complexidade |
|---------|----------|---------------|--------------|---------------|--------------|
| Aplicação Web Simples | 1 | ❌ | Básica | Básica | ⭐ |
| Website Estático | 1 | ❌ | ❌ | Básica | ⭐ |
| Aplicação em Contêiner | 1 | ❌ | Básica | Completa | ⭐⭐ |
| Aplicação com Base de Dados | 2 | ✅ | Completa | Completa | ⭐⭐⭐ |
| Função Serverless | 3 | ✅ | Completa | Completa | ⭐⭐⭐ |
| Microserviços | 5+ | ✅ | Completa | Completa | ⭐⭐⭐⭐ |

## 🎓 Caminho de Aprendizagem

### Progressão Recomendada

1. **Comece com Aplicação Web Simples**
   - Aprenda conceitos básicos do AZD
   - Compreenda o fluxo de trabalho de implementação
   - Pratique gestão de ambientes

2. **Experimente Website Estático**
   - Explore diferentes opções de hospedagem
   - Aprenda sobre integração com CDN
   - Compreenda configuração de DNS

3. **Avance para Aplicação em Contêiner**
   - Aprenda fundamentos de conteinerização
   - Compreenda conceitos de escalabilidade
   - Pratique com Docker

4. **Adicione Integração com Base de Dados**
   - Aprenda provisionamento de bases de dados
   - Compreenda strings de conexão
   - Pratique gestão de segredos

5. **Explore Serverless**
   - Compreenda arquitetura orientada a eventos
   - Aprenda sobre triggers e bindings
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
- **Monolítica**: Aplicação Web Simples, Aplicação com Base de Dados
- **Estática**: Website Estático
- **Microserviços**: Exemplo de Microserviços
- **Serverless**: Função Serverless
- **Híbrida**: Aplicação em Contêiner

### Por Nível de Complexidade
- **Iniciante**: Aplicação Web Simples, Website Estático
- **Intermediário**: Aplicação em Contêiner, Aplicação com Base de Dados, Função Serverless  
- **Avançado**: Microserviços

## 📚 Recursos Adicionais

### Links de Documentação
- [Especificação de Modelos AZD](https://aka.ms/azd/templates)
- [Documentação do Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Centro de Arquitetura Azure](https://learn.microsoft.com/en-us/azure/architecture/)

### Exemplos da Comunidade
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Galeria de Modelos AZD](https://azure.github.io/awesome-azd/)

### Melhores Práticas
- [Framework Bem-Arquitetado Azure](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Framework de Adoção na Nuvem](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Contribuir com Exemplos

Tem um exemplo útil para compartilhar? Aceitamos contribuições!

### Diretrizes de Submissão
1. Siga a estrutura de diretório estabelecida
2. Inclua README.md abrangente
3. Adicione comentários aos arquivos de configuração
4. Teste minuciosamente antes de submeter
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

**Dica Pro**: Comece com o exemplo mais simples que corresponda ao seu stack tecnológico e, gradualmente, avance para cenários mais complexos. Cada exemplo constrói conceitos a partir dos anteriores!

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
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, é importante notar que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autoritária. Para informações críticas, recomenda-se a tradução profissional realizada por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes da utilização desta tradução.