# API Simples com Flask - Exemplo de Aplicativo em Contêiner

**Trilha de Aprendizado:** Iniciante ⭐ | **Tempo:** 25-35 minutos | **Custo:** $0-15/mês

Um API REST completo e funcional em Python Flask, implantado no Azure Container Apps usando Azure Developer CLI (azd). Este exemplo demonstra implantação de contêiner, autoescalonamento e conceitos básicos de monitoramento.

## 🎯 O que você vai aprender

- Implantar um aplicativo Python em contêiner no Azure
- Configurar autoescalonamento com escala para zero
- Implementar verificações de saúde e prontidão
- Monitorar logs e métricas do aplicativo
- Usar Azure Developer CLI para implantação rápida

## 📦 O que está incluído

✅ **Aplicativo Flask** - API REST completa com operações CRUD (`src/app.py`)  
✅ **Dockerfile** - Configuração de contêiner pronta para produção  
✅ **Infraestrutura Bicep** - Ambiente de Container Apps e implantação da API  
✅ **Configuração AZD** - Configuração para implantação com um comando  
✅ **Verificações de Saúde** - Verificações de liveness e readiness configuradas  
✅ **Autoescalonamento** - 0-10 réplicas com base na carga HTTP  

## Arquitetura

```
┌─────────────────────────────────────────┐
│   Azure Container Apps Environment      │
│                                         │
│  ┌───────────────────────────────────┐ │
│  │   Flask API Container             │ │
│  │   - Health endpoints              │ │
│  │   - REST API                      │ │
│  │   - Auto-scaling (0-10 replicas)  │ │
│  └───────────────────────────────────┘ │
│                                         │
│  Application Insights ────────────────┐ │
└────────────────────────────────────────┘
```

## Pré-requisitos

### Necessário
- **Azure Developer CLI (azd)** - [Guia de instalação](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Assinatura do Azure** - [Conta gratuita](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Instalar Docker](https://www.docker.com/products/docker-desktop/) (para testes locais)

### Verificar pré-requisitos

```bash
# Verificar a versão do azd (necessário 1.5.0 ou superior)
azd version

# Verificar login no Azure
azd auth login

# Verificar Docker (opcional, para testes locais)
docker --version
```

## ⏱️ Cronograma de Implantação

| Fase | Duração | O que acontece |
|------|---------|----------------||
| Configuração do ambiente | 30 segundos | Criar ambiente azd |
| Construir contêiner | 2-3 minutos | Build do aplicativo Flask com Docker |
| Provisionar infraestrutura | 3-5 minutos | Criar Container Apps, registro, monitoramento |
| Implantar aplicativo | 2-3 minutos | Enviar imagem e implantar no Container Apps |
| **Total** | **8-12 minutos** | Implantação completa pronta |

## Início Rápido

```bash
# Navegue para o exemplo
cd examples/container-app/simple-flask-api

# Inicialize o ambiente (escolha um nome único)
azd env new myflaskapi

# Implante tudo (infraestrutura + aplicação)
azd up
# Você será solicitado a:
# 1. Selecionar a assinatura do Azure
# 2. Escolher a localização (ex.: eastus2)
# 3. Aguarde 8-12 minutos para a implantação

# Obtenha seu endpoint da API
azd env get-values

# Teste a API
curl $(azd env get-value API_ENDPOINT)/health
```

**Saída Esperada:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ Verificar Implantação

### Passo 1: Verificar Status da Implantação

```bash
# Visualizar serviços implantados
azd show

# A saída esperada mostra:
# - Serviço: api
# - Endpoint: https://ca-api-[env].xxx.azurecontainerapps.io
# - Status: Em execução
```

### Passo 2: Testar Endpoints da API

```bash
# Obter endpoint da API
API_URL=$(azd env get-value API_ENDPOINT)

# Testar saúde
curl $API_URL/health

# Testar endpoint raiz
curl $API_URL/

# Criar um item
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Obter todos os itens
curl $API_URL/api/items
```

**Critérios de Sucesso:**
- ✅ Endpoint de saúde retorna HTTP 200
- ✅ Endpoint raiz exibe informações da API
- ✅ POST cria item e retorna HTTP 201
- ✅ GET retorna itens criados

### Passo 3: Visualizar Logs

```bash
# Transmitir logs ao vivo
azd logs api --follow

# Você deve ver:
# - Mensagens de inicialização do Gunicorn
# - Logs de requisições HTTP
# - Logs de informações do aplicativo
```

## Estrutura do Projeto

```
simple-flask-api/
├── azure.yaml              # AZD configuration
├── infra/
│   ├── main.bicep         # Main infrastructure
│   ├── main.parameters.json
│   └── app/
│       ├── container-env.bicep
│       └── api.bicep
└── src/
    ├── app.py             # Flask application
    ├── requirements.txt
    └── Dockerfile
```

## Endpoints da API

| Endpoint | Método | Descrição |
|----------|--------|-----------|
| `/health` | GET | Verificação de saúde |
| `/api/items` | GET | Listar todos os itens |
| `/api/items` | POST | Criar novo item |
| `/api/items/{id}` | GET | Obter item específico |
| `/api/items/{id}` | PUT | Atualizar item |
| `/api/items/{id}` | DELETE | Excluir item |

## Configuração

### Variáveis de Ambiente

```bash
# Definir configuração personalizada
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Configuração de Escalabilidade

A API escala automaticamente com base no tráfego HTTP:
- **Réplicas Mínimas**: 0 (escala para zero quando ociosa)
- **Réplicas Máximas**: 10
- **Solicitações Concomitantes por Réplica**: 50

## Desenvolvimento

### Executar Localmente

```bash
# Instalar dependências
cd src
pip install -r requirements.txt

# Executar o aplicativo
python app.py

# Testar localmente
curl http://localhost:8000/health
```

### Construir e Testar Contêiner

```bash
# Construir imagem Docker
docker build -t flask-api:local ./src

# Executar contêiner localmente
docker run -p 8000:8000 flask-api:local

# Testar contêiner
curl http://localhost:8000/health
```

## Implantação

### Implantação Completa

```bash
# Implantar infraestrutura e aplicação
azd up
```

### Implantação Apenas de Código

```bash
# Implantar apenas o código do aplicativo (infraestrutura inalterada)
azd deploy api
```

### Atualizar Configuração

```bash
# Atualizar variáveis de ambiente
azd env set API_KEY "new-api-key"

# Reimplantar com nova configuração
azd deploy api
```

## Monitoramento

### Visualizar Logs

```bash
# Transmitir logs ao vivo
azd logs api --follow

# Visualizar as últimas 100 linhas
azd logs api --tail 100
```

### Monitorar Métricas

```bash
# Abrir o painel do Azure Monitor
azd monitor --overview

# Visualizar métricas específicas
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Testes

### Verificação de Saúde

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

Resposta esperada:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### Criar Item

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### Obter Todos os Itens

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Otimização de Custos

Esta implantação usa escala para zero, então você só paga quando a API está processando solicitações:

- **Custo ocioso**: ~$0/mês (escalado para zero)
- **Custo ativo**: ~$0.000024/segundo por réplica
- **Custo mensal esperado** (uso leve): $5-15

### Reduzir Custos Ainda Mais

```bash
# Reduzir o número máximo de réplicas para desenvolvimento
azd env set MAX_REPLICAS 3

# Usar um tempo limite de inatividade mais curto
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 minutos
```

## Solução de Problemas

### Contêiner Não Inicia

```bash
# Verificar logs do contêiner
azd logs api --tail 100

# Verificar se a imagem Docker é construída localmente
docker build -t test ./src
```

### API Não Acessível

```bash
# Verificar se o ingresso é externo
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Altos Tempos de Resposta

```bash
# Verificar uso de CPU/Memória
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Escalar recursos se necessário
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Limpeza

```bash
# Excluir todos os recursos
azd down --force --purge
```

## Próximos Passos

### Expandir Este Exemplo

1. **Adicionar Banco de Dados** - Integrar Azure Cosmos DB ou SQL Database
   ```bash
   # Adicionar módulo Cosmos DB ao infra/main.bicep
   # Atualizar app.py com conexão ao banco de dados
   ```

2. **Adicionar Autenticação** - Implementar Azure AD ou chaves de API
   ```python
   # Adicionar middleware de autenticação ao app.py
   from functools import wraps
   ```

3. **Configurar CI/CD** - Workflow com GitHub Actions
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Adicionar Identidade Gerenciada** - Acesso seguro a serviços do Azure
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Exemplos Relacionados

- **[Aplicativo com Banco de Dados](../../../../../examples/database-app)** - Exemplo completo com SQL Database
- **[Microsserviços](../../../../../examples/container-app/microservices)** - Arquitetura com múltiplos serviços
- **[Guia Mestre de Container Apps](../README.md)** - Todos os padrões de contêiner

### Recursos de Aprendizado

- 📚 [Curso AZD para Iniciantes](../../../README.md) - Página principal do curso
- 📚 [Padrões de Container Apps](../README.md) - Mais padrões de implantação
- 📚 [Galeria de Templates AZD](https://azure.github.io/awesome-azd/) - Templates da comunidade

## Recursos Adicionais

### Documentação
- **[Documentação do Flask](https://flask.palletsprojects.com/)** - Guia do framework Flask
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Documentação oficial do Azure
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Referência de comandos azd

### Tutoriais
- **[Introdução ao Container Apps](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Implante seu primeiro aplicativo
- **[Python no Azure](https://learn.microsoft.com/azure/developer/python/)** - Guia de desenvolvimento em Python
- **[Linguagem Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infraestrutura como código

### Ferramentas
- **[Portal do Azure](https://portal.azure.com)** - Gerencie recursos visualmente
- **[Extensão Azure para VS Code](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - Integração com IDE

---

**🎉 Parabéns!** Você implantou uma API Flask pronta para produção no Azure Container Apps com autoescalonamento e monitoramento.

**Dúvidas?** [Abra uma issue](https://github.com/microsoft/AZD-for-beginners/issues) ou confira o [FAQ](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autoritária. Para informações críticas, recomenda-se a tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->