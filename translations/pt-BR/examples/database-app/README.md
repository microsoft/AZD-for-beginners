# Implantando um Banco de Dados Microsoft SQL e Aplicativo Web com AZD

⏱️ **Tempo Estimado**: 20-30 minutos | 💰 **Custo Estimado**: ~R$75-125/mês | ⭐ **Complexidade**: Intermediário

Este **exemplo completo e funcional** demonstra como usar o [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) para implantar um aplicativo web Python Flask com um Banco de Dados Microsoft SQL no Azure. Todo o código está incluído e testado—sem dependências externas necessárias.

## O que você aprenderá

Ao concluir este exemplo, você irá:
- Implantar um aplicativo de múltiplas camadas (aplicativo web + banco de dados) usando infraestrutura como código
- Configurar conexões seguras com o banco de dados sem codificar segredos
- Monitorar a saúde do aplicativo com Application Insights
- Gerenciar recursos do Azure de forma eficiente com o AZD CLI
- Seguir as melhores práticas do Azure para segurança, otimização de custos e observabilidade

## Visão Geral do Cenário
- **Aplicativo Web**: API REST Python Flask com conectividade ao banco de dados
- **Banco de Dados**: Banco de Dados Azure SQL com dados de exemplo
- **Infraestrutura**: Provisionada usando Bicep (templates modulares e reutilizáveis)
- **Implantação**: Totalmente automatizada com comandos `azd`
- **Monitoramento**: Application Insights para logs e telemetria

## Pré-requisitos

### Ferramentas Necessárias

Antes de começar, verifique se você tem estas ferramentas instaladas:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (versão 2.50.0 ou superior)
   ```sh
   az --version
   # Saída esperada: azure-cli 2.50.0 ou superior
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (versão 1.0.0 ou superior)
   ```sh
   azd version
   # Saída esperada: versão azd 1.0.0 ou superior
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (para desenvolvimento local)
   ```sh
   python --version
   # Saída esperada: Python 3.8 ou superior
   ```

4. **[Docker](https://www.docker.com/get-started)** (opcional, para desenvolvimento local em contêiner)
   ```sh
   docker --version
   # Saída esperada: versão do Docker 20.10 ou superior
   ```

### Requisitos do Azure

- Uma **assinatura ativa do Azure** ([crie uma conta gratuita](https://azure.microsoft.com/free/))
- Permissões para criar recursos na sua assinatura
- Função de **Proprietário** ou **Colaborador** na assinatura ou grupo de recursos

### Pré-requisitos de Conhecimento

Este é um exemplo de **nível intermediário**. Você deve estar familiarizado com:
- Operações básicas de linha de comando
- Conceitos fundamentais de nuvem (recursos, grupos de recursos)
- Noções básicas sobre aplicativos web e bancos de dados

**Novo no AZD?** Comece com o [Guia de Introdução](../../docs/getting-started/azd-basics.md).

## Arquitetura

Este exemplo implanta uma arquitetura de duas camadas com um aplicativo web e banco de dados SQL:

```
┌─────────────────┐        ┌──────────────────────┐
│  User Browser   │◄──────►│   Azure Web App      │
└─────────────────┘        │   (Flask API)        │
                           │   - /health          │
                           │   - /products        │
                           └──────────┬───────────┘
                                      │
                                      │ Secure Connection
                                      │ (Encrypted)
                                      │
                           ┌──────────▼───────────┐
                           │ Azure SQL Database   │
                           │   - Products table   │
                           │   - Sample data      │
                           └──────────────────────┘
```

**Implantação de Recursos:**
- **Grupo de Recursos**: Contêiner para todos os recursos
- **Plano de Serviço de Aplicativo**: Hospedagem baseada em Linux (camada B1 para eficiência de custos)
- **Aplicativo Web**: Runtime Python 3.11 com aplicativo Flask
- **Servidor SQL**: Servidor de banco de dados gerenciado com TLS 1.2 mínimo
- **Banco de Dados SQL**: Camada básica (2GB, adequado para desenvolvimento/testes)
- **Application Insights**: Monitoramento e registro
- **Workspace de Log Analytics**: Armazenamento centralizado de logs

**Analogia**: Pense nisso como um restaurante (aplicativo web) com um freezer (banco de dados). Os clientes fazem pedidos no menu (endpoints da API), e a cozinha (aplicativo Flask) busca os ingredientes (dados) no freezer. O gerente do restaurante (Application Insights) monitora tudo o que acontece.

## Estrutura de Pastas

Todos os arquivos estão incluídos neste exemplo—sem dependências externas necessárias:

```
examples/database-app/
│
├── README.md                    # This file
├── azure.yaml                   # AZD configuration file
├── .env.sample                  # Sample environment variables
├── .gitignore                   # Git ignore patterns
│
├── infra/                       # Infrastructure as Code (Bicep)
│   ├── main.bicep              # Main orchestration template
│   ├── abbreviations.json      # Azure naming conventions
│   └── resources/              # Modular resource templates
│       ├── sql-server.bicep    # SQL Server configuration
│       ├── sql-database.bicep  # Database configuration
│       ├── app-service-plan.bicep  # Hosting plan
│       ├── app-insights.bicep  # Monitoring setup
│       └── web-app.bicep       # Web application
│
└── src/
    └── web/                    # Application source code
        ├── app.py              # Flask REST API
        ├── requirements.txt    # Python dependencies
        └── Dockerfile          # Container definition
```

**O que cada arquivo faz:**
- **azure.yaml**: Indica ao AZD o que implantar e onde
- **infra/main.bicep**: Orquestra todos os recursos do Azure
- **infra/resources/*.bicep**: Definições individuais de recursos (modulares para reutilização)
- **src/web/app.py**: Aplicativo Flask com lógica de banco de dados
- **requirements.txt**: Dependências de pacotes Python
- **Dockerfile**: Instruções de containerização para implantação

## Início Rápido (Passo a Passo)

### Passo 1: Clonar e Navegar

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Verificação de Sucesso**: Verifique se você vê `azure.yaml` e a pasta `infra/`:
```sh
ls
# Esperado: README.md, azure.yaml, infra/, src/
```

### Passo 2: Autenticar com o Azure

```sh
azd auth login
```

Isso abrirá seu navegador para autenticação no Azure. Faça login com suas credenciais do Azure.

**✓ Verificação de Sucesso**: Você deve ver:
```
Logged in to Azure.
```

### Passo 3: Inicializar o Ambiente

```sh
azd init
```

**O que acontece**: O AZD cria uma configuração local para sua implantação.

**Perguntas que você verá**:
- **Nome do ambiente**: Insira um nome curto (ex.: `dev`, `meuapp`)
- **Assinatura do Azure**: Selecione sua assinatura na lista
- **Localização do Azure**: Escolha uma região (ex.: `eastus`, `westeurope`)

**✓ Verificação de Sucesso**: Você deve ver:
```
SUCCESS: New project initialized!
```

### Passo 4: Provisionar Recursos do Azure

```sh
azd provision
```

**O que acontece**: O AZD implanta toda a infraestrutura (leva de 5 a 8 minutos):
1. Cria o grupo de recursos
2. Cria o Servidor SQL e o Banco de Dados
3. Cria o Plano de Serviço de Aplicativo
4. Cria o Aplicativo Web
5. Cria o Application Insights
6. Configura rede e segurança

**Você será solicitado a informar**:
- **Nome de usuário do administrador SQL**: Insira um nome de usuário (ex.: `sqladmin`)
- **Senha do administrador SQL**: Insira uma senha forte (salve isso!)

**✓ Verificação de Sucesso**: Você deve ver:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Tempo**: 5-8 minutos

### Passo 5: Implantar o Aplicativo

```sh
azd deploy
```

**O que acontece**: O AZD constrói e implanta seu aplicativo Flask:
1. Empacota o aplicativo Python
2. Constrói o contêiner Docker
3. Envia para o Aplicativo Web do Azure
4. Inicializa o banco de dados com dados de exemplo
5. Inicia o aplicativo

**✓ Verificação de Sucesso**: Você deve ver:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Tempo**: 3-5 minutos

### Passo 6: Navegar no Aplicativo

```sh
azd browse
```

Isso abrirá seu aplicativo web implantado no navegador em `https://app-<unique-id>.azurewebsites.net`

**✓ Verificação de Sucesso**: Você deve ver saída JSON:
```json
{
  "message": "Welcome to the Database App API",
  "endpoints": {
    "/": "This help message",
    "/health": "Health check endpoint",
    "/products": "List all products",
    "/products/<id>": "Get product by ID"
  }
}
```

### Passo 7: Testar os Endpoints da API

**Verificação de Saúde** (verificar conexão com o banco de dados):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**Resposta Esperada**:
```json
{
  "status": "healthy",
  "database": "connected"
}
```

**Listar Produtos** (dados de exemplo):
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

**Resposta Esperada**:
```json
[
  {
    "id": 1,
    "name": "Laptop",
    "description": "High-performance laptop",
    "price": 1299.99,
    "created_at": "2025-11-19T10:30:00"
  },
  ...
]
```

**Obter Produto Único**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ Verificação de Sucesso**: Todos os endpoints retornam dados JSON sem erros.

---

**🎉 Parabéns!** Você implantou com sucesso um aplicativo web com um banco de dados no Azure usando AZD.

## Detalhamento de Configuração

### Variáveis de Ambiente

Os segredos são gerenciados de forma segura via configuração do Azure App Service—**nunca codificados no código-fonte**.

**Configurado Automaticamente pelo AZD**:
- `SQL_CONNECTION_STRING`: Conexão com o banco de dados com credenciais criptografadas
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Endpoint de telemetria de monitoramento
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Habilita instalação automática de dependências

**Onde os Segredos São Armazenados**:
1. Durante `azd provision`, você fornece credenciais SQL via prompts seguros
2. O AZD armazena isso no arquivo `.azure/<env-name>/.env` local (ignorado pelo Git)
3. O AZD injeta essas informações na configuração do Azure App Service (criptografadas em repouso)
4. O aplicativo as lê via `os.getenv()` em tempo de execução

### Desenvolvimento Local

Para testes locais, crie um arquivo `.env` a partir do exemplo:

```sh
cp .env.sample .env
# Edite .env com sua conexão de banco de dados local
```

**Fluxo de Trabalho de Desenvolvimento Local**:
```sh
# Instalar dependências
cd src/web
pip install -r requirements.txt

# Definir variáveis de ambiente
export SQL_CONNECTION_STRING="your-local-connection-string"

# Executar a aplicação
python app.py
```

**Testar localmente**:
```sh
curl http://localhost:8000/health
# Esperado: {"status": "saudável", "database": "conectado"}
```

### Infraestrutura como Código

Todos os recursos do Azure são definidos em **templates Bicep** (pasta `infra/`):

- **Design Modular**: Cada tipo de recurso tem seu próprio arquivo para reutilização
- **Parametrizado**: Personalize SKUs, regiões, convenções de nomenclatura
- **Melhores Práticas**: Segue padrões de nomenclatura e padrões de segurança do Azure
- **Controlado por Versão**: Alterações na infraestrutura são rastreadas no Git

**Exemplo de Personalização**:
Para alterar a camada do banco de dados, edite `infra/resources/sql-database.bicep`:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Melhores Práticas de Segurança

Este exemplo segue as melhores práticas de segurança do Azure:

### 1. **Sem Segredos no Código-Fonte**
- ✅ Credenciais armazenadas na configuração do Azure App Service (criptografadas)
- ✅ Arquivos `.env` excluídos do Git via `.gitignore`
- ✅ Segredos passados via parâmetros seguros durante o provisionamento

### 2. **Conexões Criptografadas**
- ✅ TLS 1.2 mínimo para o Servidor SQL
- ✅ HTTPS apenas habilitado para o Aplicativo Web
- ✅ Conexões com o banco de dados usam canais criptografados

### 3. **Segurança de Rede**
- ✅ Firewall do Servidor SQL configurado para permitir apenas serviços do Azure
- ✅ Acesso à rede pública restrito (pode ser ainda mais bloqueado com Endpoints Privados)
- ✅ FTPS desabilitado no Aplicativo Web

### 4. **Autenticação e Autorização**
- ⚠️ **Atual**: Autenticação SQL (nome de usuário/senha)
- ✅ **Recomendação para Produção**: Use Identidade Gerenciada do Azure para autenticação sem senha

**Para Atualizar para Identidade Gerenciada** (para produção):
1. Habilite identidade gerenciada no Aplicativo Web
2. Conceda permissões SQL à identidade
3. Atualize a string de conexão para usar identidade gerenciada
4. Remova autenticação baseada em senha

### 5. **Auditoria e Conformidade**
- ✅ Application Insights registra todas as solicitações e erros
- ✅ Auditoria do Banco de Dados SQL habilitada (pode ser configurada para conformidade)
- ✅ Todos os recursos marcados para governança

**Lista de Verificação de Segurança Antes da Produção**:
- [ ] Habilitar Azure Defender para SQL
- [ ] Configurar Endpoints Privados para o Banco de Dados SQL
- [ ] Habilitar Firewall de Aplicativo Web (WAF)
- [ ] Implementar Azure Key Vault para rotação de segredos
- [ ] Configurar autenticação Azure AD
- [ ] Habilitar registro de diagnóstico para todos os recursos

## Otimização de Custos

**Custos Mensais Estimados** (novembro de 2025):

| Recurso | SKU/Camada | Custo Estimado |
|---------|------------|----------------|
| Plano de Serviço de Aplicativo | B1 (Básico) | ~R$65/mês |
| Banco de Dados SQL | Básico (2GB) | ~R$25/mês |
| Application Insights | Pay-as-you-go | ~R$10/mês (baixo tráfego) |
| **Total** | | **~R$100/mês** |

**💡 Dicas para Economizar**:

1. **Use Camada Gratuita para Aprendizado**:
   - Serviço de Aplicativo: Camada F1 (gratuita, horas limitadas)
   - Banco de Dados SQL: Use servidorless do Azure SQL Database
   - Application Insights: 5GB/mês de ingestão gratuita

2. **Pare Recursos Quando Não Estiverem em Uso**:
   ```sh
   # Pare o aplicativo web (o banco de dados ainda cobra)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Reinicie quando necessário
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Exclua Tudo Após Testar**:
   ```sh
   azd down
   ```
   Isso remove TODOS os recursos e interrompe cobranças.

4. **SKUs de Desenvolvimento vs. Produção**:
   - **Desenvolvimento**: Camada básica (usada neste exemplo)
   - **Produção**: Camada Standard/Premium com redundância

**Monitoramento de Custos**:
- Veja os custos em [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Configure alertas de custo para evitar surpresas
- Marque todos os recursos com `azd-env-name` para rastreamento

**Alternativa de Camada Gratuita**:
Para fins de aprendizado, você pode modificar `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Nota**: A camada gratuita tem limitações (60 min/dia de CPU, sem always-on).

## Monitoramento e Observabilidade

### Integração com Application Insights

Este exemplo inclui **Application Insights** para monitoramento abrangente:

**O que é Monitorado**:
- ✅ Solicitações HTTP (latência, códigos de status, endpoints)
- ✅ Erros e exceções do aplicativo
- ✅ Logs personalizados do aplicativo Flask
- ✅ Saúde da conexão com o banco de dados
- ✅ Métricas de desempenho (CPU, memória)

**Acessar Application Insights**:
1. Abra o [Portal do Azure](https://portal.azure.com)
2. Navegue até seu grupo de recursos (`rg-<env-name>`)
3. Clique no recurso Application Insights (`appi-<unique-id>`)

**Consultas Úteis** (Application Insights → Logs):

**Ver Todas as Solicitações**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**Encontrar Erros**:
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**Verificar Endpoint de Saúde**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### Auditoria do Banco de Dados SQL

**Auditoria do Banco de Dados SQL está habilitada** para rastrear:
- Padrões de acesso ao banco de dados
- Tentativas de login falhas
- Alterações no esquema
- Acesso a dados (para conformidade)

**Acessar Logs de Auditoria**:
1. Portal do Azure → Banco de Dados SQL → Auditoria
2. Veja os logs no workspace do Log Analytics

### Monitoramento em Tempo Real

**Ver Métricas ao Vivo**:
1. Application Insights → Métricas ao Vivo
2. Veja solicitações, falhas e desempenho em tempo real

**Configurar Alertas**:
Crie alertas para eventos críticos:
- Erros HTTP 500 > 5 em 5 minutos
- Falhas na conexão com o banco de dados
- Tempos de resposta altos (>2 segundos)

**Exemplo de Criação de Alerta**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## Solução de Problemas

### Problemas Comuns e Soluções

#### 1. `azd provision` falha com "Localização não disponível"

**Sintoma**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Solução**:
Escolha uma região diferente do Azure ou registre o provedor de recursos:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. Falha na Conexão com o SQL Durante a Implantação

**Sintoma**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Solução**:
- Verifique se o firewall do SQL Server permite serviços do Azure (configurado automaticamente)
- Confirme se a senha do administrador do SQL foi inserida corretamente durante o `azd provision`
- Certifique-se de que o SQL Server está totalmente provisionado (pode levar de 2 a 3 minutos)

**Verificar Conexão**:
```sh
# No Portal do Azure, vá para Banco de Dados SQL → Editor de consultas
# Tente conectar com suas credenciais
```

#### 3. Aplicativo Web Mostra "Erro de Aplicação"

**Sintoma**:
O navegador exibe uma página de erro genérica.

**Solução**:
Verifique os logs do aplicativo:
```sh
# Ver logs recentes
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Causas comuns**:
- Variáveis de ambiente ausentes (verifique App Service → Configuração)
- Falha na instalação de pacotes Python (verifique os logs de implantação)
- Erro de inicialização do banco de dados (verifique a conectividade com o SQL)

#### 4. `azd deploy` falha com "Erro de Build"

**Sintoma**:
```
Error: Failed to build project
```

**Solução**:
- Certifique-se de que o `requirements.txt` não possui erros de sintaxe
- Verifique se o Python 3.11 está especificado em `infra/resources/web-app.bicep`
- Confirme se o Dockerfile possui a imagem base correta

**Depurar localmente**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. "Não autorizado" ao executar comandos AZD

**Sintoma**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**Solução**:
Reautentique-se com o Azure:
```sh
azd auth login
az login
```

Verifique se você possui as permissões corretas (função de Contribuidor) na assinatura.

#### 6. Custos Altos de Banco de Dados

**Sintoma**:
Cobrança inesperada no Azure.

**Solução**:
- Verifique se você esqueceu de executar `azd down` após os testes
- Confirme se o Banco de Dados SQL está usando o nível Básico (não Premium)
- Revise os custos no Gerenciamento de Custos do Azure
- Configure alertas de custo

### Obtendo Ajuda

**Visualizar Todas as Variáveis de Ambiente do AZD**:
```sh
azd env get-values
```

**Verificar Status da Implantação**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**Acessar Logs do Aplicativo**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**Precisa de Mais Ajuda?**
- [Guia de Solução de Problemas do AZD](../../docs/troubleshooting/common-issues.md)
- [Solução de Problemas do Azure App Service](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Solução de Problemas do Azure SQL](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Exercícios Práticos

### Exercício 1: Verificar Sua Implantação (Iniciante)

**Objetivo**: Confirmar que todos os recursos foram implantados e o aplicativo está funcionando.

**Passos**:
1. Liste todos os recursos no seu grupo de recursos:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **Esperado**: 6-7 recursos (Web App, SQL Server, Banco de Dados SQL, Plano de Serviço de Aplicativo, Application Insights, Log Analytics)

2. Teste todos os endpoints da API:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **Esperado**: Todos retornam JSON válido sem erros

3. Verifique o Application Insights:
   - Navegue até o Application Insights no Portal do Azure
   - Vá para "Live Metrics"
   - Atualize seu navegador no aplicativo web
   **Esperado**: Ver solicitações aparecendo em tempo real

**Critérios de Sucesso**: Todos os 6-7 recursos existem, todos os endpoints retornam dados, Live Metrics mostra atividade.

---

### Exercício 2: Adicionar um Novo Endpoint de API (Intermediário)

**Objetivo**: Estender o aplicativo Flask com um novo endpoint.

**Código Inicial**: Endpoints atuais em `src/web/app.py`

**Passos**:
1. Edite `src/web/app.py` e adicione um novo endpoint após a função `get_product()`:
   ```python
   @app.route('/products/search/<keyword>')
   def search_products(keyword):
       """Search products by name or description."""
       try:
           conn = get_db_connection()
           cursor = conn.cursor()
           cursor.execute(
               "SELECT id, name, description, price, created_at FROM products WHERE name LIKE ? OR description LIKE ?",
               (f'%{keyword}%', f'%{keyword}%')
           )
           
           products = []
           for row in cursor.fetchall():
               products.append({
                   'id': row[0],
                   'name': row[1],
                   'description': row[2],
                   'price': float(row[3]) if row[3] else None,
                   'created_at': row[4].isoformat() if row[4] else None
               })
           
           cursor.close()
           conn.close()
           
           logger.info(f"Search for '{keyword}' returned {len(products)} results")
           return jsonify(products), 200
           
       except Exception as e:
           logger.error(f"Error searching products: {str(e)}")
           return jsonify({'error': str(e)}), 500
   ```

2. Implante o aplicativo atualizado:
   ```sh
   azd deploy
   ```

3. Teste o novo endpoint:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Esperado**: Retorna produtos correspondentes a "laptop"

**Critérios de Sucesso**: Novo endpoint funciona, retorna resultados filtrados, aparece nos logs do Application Insights.

---

### Exercício 3: Adicionar Monitoramento e Alertas (Avançado)

**Objetivo**: Configurar monitoramento proativo com alertas.

**Passos**:
1. Crie um alerta para erros HTTP 500:
   ```sh
   # Obter ID do recurso do Application Insights
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # Criar alerta
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. Dispare o alerta causando erros:
   ```sh
   # Solicitar um produto inexistente
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Verifique se o alerta foi acionado:
   - Portal do Azure → Alertas → Regras de Alerta
   - Verifique seu e-mail (se configurado)

**Critérios de Sucesso**: Regra de alerta criada, acionada em erros, notificações recebidas.

---

### Exercício 4: Alterações no Esquema do Banco de Dados (Avançado)

**Objetivo**: Adicionar uma nova tabela e modificar o aplicativo para usá-la.

**Passos**:
1. Conecte-se ao Banco de Dados SQL via Editor de Consultas do Portal do Azure

2. Crie uma nova tabela `categories`:
   ```sql
   CREATE TABLE categories (
       id INT PRIMARY KEY IDENTITY(1,1),
       name NVARCHAR(50) NOT NULL,
       description NVARCHAR(200)
   );
   
   INSERT INTO categories (name, description) VALUES
   ('Electronics', 'Electronic devices and accessories'),
   ('Office Supplies', 'Office equipment and supplies');
   
   -- Add category to products table
   ALTER TABLE products ADD category_id INT;
   UPDATE products SET category_id = 1; -- Set all to Electronics
   ```

3. Atualize `src/web/app.py` para incluir informações de categoria nas respostas

4. Implante e teste

**Critérios de Sucesso**: Nova tabela existe, produtos mostram informações de categoria, aplicativo ainda funciona.

---

### Exercício 5: Implementar Cache (Especialista)

**Objetivo**: Adicionar Azure Redis Cache para melhorar o desempenho.

**Passos**:
1. Adicione Redis Cache em `infra/main.bicep`
2. Atualize `src/web/app.py` para armazenar em cache as consultas de produtos
3. Meça a melhoria de desempenho com o Application Insights
4. Compare os tempos de resposta antes/depois do cache

**Critérios de Sucesso**: Redis está implantado, cache funciona, tempos de resposta melhoram em >50%.

**Dica**: Comece com a [documentação do Azure Cache for Redis](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Limpeza

Para evitar cobranças contínuas, exclua todos os recursos ao finalizar:

```sh
azd down
```

**Prompt de Confirmação**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

Digite `y` para confirmar.

**✓ Verificação de Sucesso**: 
- Todos os recursos são excluídos do Portal do Azure
- Sem cobranças contínuas
- A pasta local `.azure/<env-name>` pode ser excluída

**Alternativa** (manter infraestrutura, excluir dados):
```sh
# Excluir apenas o grupo de recursos (manter a configuração AZD)
az group delete --name rg-<env-name> --yes
```
## Saiba Mais

### Documentação Relacionada
- [Documentação do Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Documentação do Banco de Dados SQL do Azure](https://learn.microsoft.com/azure/azure-sql/database/)
- [Documentação do Azure App Service](https://learn.microsoft.com/azure/app-service/)
- [Documentação do Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Referência da Linguagem Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Próximos Passos Neste Curso
- **[Exemplo de Aplicativos em Contêiner](../../../../examples/container-app)**: Implante microsserviços com Azure Container Apps
- **[Guia de Integração com IA](../../../../docs/ai-foundry)**: Adicione capacidades de IA ao seu aplicativo
- **[Melhores Práticas de Implantação](../../docs/deployment/deployment-guide.md)**: Padrões de implantação em produção

### Tópicos Avançados
- **Identidade Gerenciada**: Remova senhas e use autenticação do Azure AD
- **Endpoints Privados**: Proteja conexões de banco de dados dentro de uma rede virtual
- **Integração CI/CD**: Automatize implantações com GitHub Actions ou Azure DevOps
- **Multiambiente**: Configure ambientes de desenvolvimento, homologação e produção
- **Migrações de Banco de Dados**: Use Alembic ou Entity Framework para versionamento de esquema

### Comparação com Outras Abordagens

**AZD vs. Modelos ARM**:
- ✅ AZD: Abstração de nível superior, comandos mais simples
- ⚠️ ARM: Mais verboso, controle granular

**AZD vs. Terraform**:
- ✅ AZD: Nativo do Azure, integrado com serviços do Azure
- ⚠️ Terraform: Suporte multi-cloud, ecossistema maior

**AZD vs. Portal do Azure**:
- ✅ AZD: Reproduzível, controlado por versão, automatizável
- ⚠️ Portal: Cliques manuais, difícil de reproduzir

**Pense no AZD como**: Docker Compose para Azure—configuração simplificada para implantações complexas.

---

## Perguntas Frequentes

**P: Posso usar uma linguagem de programação diferente?**  
R: Sim! Substitua `src/web/` por Node.js, C#, Go ou qualquer linguagem. Atualize `azure.yaml` e Bicep conforme necessário.

**P: Como adiciono mais bancos de dados?**  
R: Adicione outro módulo de Banco de Dados SQL em `infra/main.bicep` ou use PostgreSQL/MySQL dos serviços de Banco de Dados do Azure.

**P: Posso usar isso em produção?**  
R: Este é um ponto de partida. Para produção, adicione: identidade gerenciada, endpoints privados, redundância, estratégia de backup, WAF e monitoramento aprimorado.

**P: E se eu quiser usar contêineres em vez de implantação de código?**  
R: Confira o [Exemplo de Aplicativos em Contêiner](../../../../examples/container-app) que usa contêineres Docker em todo o processo.

**P: Como me conecto ao banco de dados a partir da minha máquina local?**  
R: Adicione seu IP ao firewall do SQL Server:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**P: Posso usar um banco de dados existente em vez de criar um novo?**  
R: Sim, modifique `infra/main.bicep` para referenciar um SQL Server existente e atualize os parâmetros da string de conexão.

---

> **Nota:** Este exemplo demonstra as melhores práticas para implantar um aplicativo web com um banco de dados usando AZD. Inclui código funcional, documentação abrangente e exercícios práticos para reforçar o aprendizado. Para implantações em produção, revise os requisitos de segurança, escalabilidade, conformidade e custo específicos da sua organização.

**📚 Navegação do Curso:**
- ← Anterior: [Exemplo de Aplicativos em Contêiner](../../../../examples/container-app)
- → Próximo: [Guia de Integração com IA](../../../../docs/ai-foundry)
- 🏠 [Página Inicial do Curso](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se a tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->