# Deploying a Microsoft SQL Database and Web App with AZD

⏱️ **Tempo Estimado**: 20-30 minutos | 💰 **Custo Estimado**: ~$15-25/mês | ⭐ **Complexidade**: Intermédio

Este **exemplo completo e funcional** demonstra como usar o [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) para implementar uma aplicação web Python Flask com uma base de dados Microsoft SQL no Azure. Todo o código está incluído e testado—não são necessárias dependências externas.

## O Que Vai Aprender

Ao completar este exemplo, irá:
- Implementar uma aplicação multicamada (app web + base de dados) usando infraestruturas como código
- Configurar ligações seguras à base de dados sem utilizar segredos codificados
- Monitorizar a saúde da aplicação com Application Insights
- Gerir recursos Azure de forma eficiente com AZD CLI
- Seguir as melhores práticas Azure para segurança, otimização de custos e observabilidade

## Visão Geral do Cenário
- **App Web**: API REST Python Flask com conectividade à base de dados
- **Base de Dados**: Azure SQL Database com dados de exemplo
- **Infraestrutura**: Provisionada usando Bicep (templates modulares e reutilizáveis)
- **Deploy**: Totalmente automatizado com comandos `azd`
- **Monitorização**: Application Insights para logs e telemetria

## Pré-requisitos

### Ferramentas Necessárias

Antes de começar, verifique se tem estas ferramentas instaladas:

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

4. **[Docker](https://www.docker.com/get-started)** (opcional, para desenvolvimento local em contentores)
   ```sh
   docker --version
   # Saída esperada: Versão do Docker 20.10 ou superior
   ```

### Requisitos Azure

- Uma **subscrição ativa Azure** ([crie uma conta gratuita](https://azure.microsoft.com/free/))
- Permissões para criar recursos na sua subscrição
- Função de **Owner** ou **Contributor** na subscrição ou grupo de recursos

### Conhecimentos Necessários

Este é um exemplo de nível **intermédio**. Deve estar familiarizado com:
- Operações básicas na linha de comandos
- Conceitos fundamentais de cloud (recursos, grupos de recursos)
- Entendimento básico de aplicações web e bases de dados

**Novo no AZD?** Comece pelo [guia de Introdução](../../docs/chapter-01-foundation/azd-basics.md).

## Arquitetura

Este exemplo implementa uma arquitetura de duas camadas com uma aplicação web e uma base de dados SQL:

```mermaid
graph TD
    Browser[Navegador do Utilizador] <--> WebApp[Azure Web App<br/>Flask API<br/>/health<br/>/products]
    WebApp -- Ligação Segura<br/>Encriptada --> SQL[Base de Dados Azure SQL<br/>Tabela de Produtos<br/>Dados de amostra]
```
**Implementação de Recursos:**
- **Grupo de Recursos**: Contentor para todos os recursos
- **App Service Plan**: Hosting Linux (nível B1 para eficiência de custo)
- **App Web**: Ambiente Python 3.11 com aplicação Flask
- **Servidor SQL**: Servidor de base de dados gerido com TLS 1.2 mínimo
- **Base de Dados SQL**: Nível básico (2GB, adequado para desenvolvimento/testes)
- **Application Insights**: Monitorização e logging
- **Log Analytics Workspace**: Armazenamento centralizado de logs

**Analogía**: Imagine isto como um restaurante (app web) com um congelador (base de dados). Os clientes fazem pedidos do menu (endpoints API), e a cozinha (aplicação Flask) obtém os ingredientes (dados) do congelador. O gestor do restaurante (Application Insights) acompanha tudo o que acontece.

## Estrutura das Pastas

Todos os ficheiros estão incluídos neste exemplo—não são necessárias dependências externas:

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

**Função de Cada Ficheiro:**
- **azure.yaml**: Diz ao AZD o que implementar e onde
- **infra/main.bicep**: Orquestra todos os recursos Azure
- **infra/resources/*.bicep**: Definições individuais de recursos (modulares para reutilização)
- **src/web/app.py**: Aplicação Flask com a lógica da base de dados
- **requirements.txt**: Dependências de pacotes Python
- **Dockerfile**: Instruções para conteinerização e deployment

## Quickstart (Passo a Passo)

### Passo 1: Clonar e Navegar

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Verificação de Sucesso**: Verifique que vê `azure.yaml` e a pasta `infra/`:
```sh
ls
# Esperado: README.md, azure.yaml, infra/, src/
```

### Passo 2: Autenticar no Azure

```sh
azd auth login
```

Isto abre o browser para autenticação Azure. Faça login com as suas credenciais Azure.

**✓ Verificação de Sucesso**: Deve ver:
```
Logged in to Azure.
```

### Passo 3: Inicializar o Ambiente

```sh
azd init
```

**O que acontece**: O AZD cria uma configuração local para a sua implementação.

**Perguntas que verá**:
- **Nome do ambiente**: Introduza um nome curto (ex.: `dev`, `myapp`)
- **Subscrição Azure**: Selecionar a subscrição na lista
- **Localização Azure**: Escolher uma região (ex.: `eastus`, `westeurope`)

**✓ Verificação de Sucesso**: Deve ver:
```
SUCCESS: New project initialized!
```

### Passo 4: Provisionar Recursos Azure

```sh
azd provision
```

**O que acontece**: AZD implementa toda a infraestrutura (leva 5-8 minutos):
1. Cria o grupo de recursos
2. Cria o Servidor SQL e a Base de Dados
3. Cria o Plano de Serviço de App
4. Cria a App Web
5. Cria o Application Insights
6. Configura networking e segurança

**Será solicitado**:
- **Nome de utilizador admin SQL**: Introduza um nome de utilizador (ex.: `sqladmin`)
- **Password admin SQL**: Introduza uma password forte (guarde-a!)

**✓ Verificação de Sucesso**: Deve ver:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Tempo**: 5-8 minutos

### Passo 5: Implementar a Aplicação

```sh
azd deploy
```

**O que acontece**: AZD compila e implementa a aplicação Flask:
1. Empacota a aplicação Python
2. Constrói o contentor Docker
3. Publica para a Azure Web App
4. Inicializa a base de dados com dados de exemplo
5. Arranca a aplicação

**✓ Verificação de Sucesso**: Deve ver:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Tempo**: 3-5 minutos

### Passo 6: Navegar na Aplicação

```sh
azd browse
```

Isto abre a app web implementada no browser em `https://app-<unique-id>.azurewebsites.net`

**✓ Verificação de Sucesso**: Deve ver saída JSON:
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

**Verificação de Saúde** (confirma ligação à base de dados):
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

**Obter Produto Individual**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ Verificação de Sucesso**: Todos os endpoints retornam dados JSON sem erros.

---

**🎉 Parabéns!** Implementou com sucesso uma aplicação web com base de dados no Azure usando AZD.

## Análise Detalhada da Configuração

### Variáveis de Ambiente

Os segredos são geridos de forma segura via configuração do Azure App Service—**nunca codificados diretamente no código-fonte**.

**Configurado Automaticamente pelo AZD**:
- `SQL_CONNECTION_STRING`: Ligação à base de dados com credenciais encriptadas
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Endpoint de telemetria para monitorização
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Ativa instalação automática de dependências

**Onde os Segredos são Armazenados**:
1. Durante `azd provision`, fornece credenciais SQL por prompts seguros
2. O AZD guarda estes segredos localmente em `.azure/<env-name>/.env` (ignorados pelo git)
3. O AZD injeta estas informações na configuração do Azure App Service (encriptadas em repouso)
4. A aplicação lê-nas com `os.getenv()` em runtime

### Desenvolvimento Local

Para testar localmente, crie um ficheiro `.env` a partir do exemplo:

```sh
cp .env.sample .env
# Edite o .env com a ligação à sua base de dados local
```

**Fluxo de Trabalho Local**:
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
# Esperado: {"status": "healthy", "database": "connected"}
```

### Infraestrutura como Código

Todos os recursos Azure são definidos em **templates Bicep** (pasta `infra/`):

- **Design Modular**: Cada tipo de recurso tem um ficheiro próprio para reutilização
- **Parametrizado**: Personalize SKUs, regiões, convenções de nomes
- **Melhores Práticas**: Segue standards Azure para nomes e segurança
- **Versionado**: Alterações controladas via Git

**Exemplo de Personalização**:
Para alterar o nível da base de dados, edite `infra/resources/sql-database.bicep`:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Melhores Práticas de Segurança

Este exemplo segue as melhores práticas de segurança Azure:

### 1. **Sem Segredos no Código-Fonte**
- ✅ Credenciais armazenadas na configuração do Azure App Service (encriptadas)
- ✅ Ficheiros `.env` ignorados pelo Git via `.gitignore`
- ✅ Segredos passados via parâmetros seguros durante a provisão

### 2. **Conexões Encriptadas**
- ✅ TLS 1.2 mínimo para o Servidor SQL
- ✅ HTTPS obrigatório para a App Web
- ✅ Ligações à base de dados utilizam canais encriptados

### 3. **Segurança de Rede**
- ✅ Firewall do Servidor SQL configurado para permitir apenas serviços Azure
- ✅ Acesso público restrito (pode ser reforçado com Private Endpoints)
- ✅ FTPS desativado na App Web

### 4. **Autenticação & Autorização**
- ⚠️ **Atual**: Autenticação SQL (username/password)
- ✅ **Recomendação Produção**: Utilize Identidade Gerida Azure para autenticação sem password

**Para Migrar para Identidade Gerida** (em produção):
1. Ative identidade gerida na App Web
2. Conceda permissões SQL à identidade
3. Atualize a cadeia de ligação para usar identidade gerida
4. Remova autenticação baseada em password

### 5. **Auditoria & Conformidade**
- ✅ Application Insights regista todas as requisições e erros
- ✅ Auditoria da base SQL ativada (pode ser configurada para conformidade)
- ✅ Todos os recursos etiquetados para governação

**Checklist de Segurança Antes da Produção**:
- [ ] Ativar Azure Defender para SQL
- [ ] Configurar Private Endpoints para a base SQL
- [ ] Ativar Web Application Firewall (WAF)
- [ ] Implementar Azure Key Vault para rotação de segredos
- [ ] Configurar autenticação Azure AD
- [ ] Ativar logs de diagnóstico para todos os recursos

## Otimização de Custos

**Custos Mensais Estimados** (novembro 2025):

| Recurso | SKU/Nível | Custo Estimado |
|----------|----------|----------------|
| App Service Plan | B1 (Básico) | ~$13/mês |
| Base de Dados SQL | Básico (2GB) | ~$5/mês |
| Application Insights | Pay-as-you-go | ~$2/mês (tráfego baixo) |
| **Total** | | **~$20/mês** |

**💡 Dicas para poupar custos**:

1. **Usar o Nível Gratuito para Aprendizagem**:
   - App Service: nível F1 (grátis, horas limitadas)
   - Base SQL: Azure SQL Database serverless
   - Application Insights: ingestão gratuita até 5GB/mês

2. **Parar Recursos Quando Não Usar**:
   ```sh
   # Parar a aplicação web (a base de dados continua a ser cobrada)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Reiniciar quando necessário
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Eliminar Tudo Após os Testes**:
   ```sh
   azd down
   ```
   Isto remove TODOS os recursos e para cobranças.

4. **SKUs para Desenvolvimento vs Produção**:
   - **Desenvolvimento**: nível Básico (usado neste exemplo)
   - **Produção**: níveis Standard/Premium com redundância

**Monitorização de Custos**:
- Visualizar custos em [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Configurar alertas para evitar surpresas
- Etiquetar todos os recursos com `azd-env-name` para rastreamento

**Alternativa do Nível Gratuito**:
Para aprendizagem, pode modificar `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Nota**: O nível gratuito tem limitações (60 min/dia CPU, não está sempre ativo).

## Monitorização & Observabilidade

### Integração com Application Insights

Este exemplo inclui **Application Insights** para monitorização abrangente:

**O que é Monitorizado**:
- ✅ Requisições HTTP (latência, códigos de estado, endpoints)
- ✅ Erros e exceções da aplicação
- ✅ Logging personalizado da aplicação Flask
- ✅ Saúde da ligação à base de dados
- ✅ Métricas de desempenho (CPU, memória)

**Aceder ao Application Insights**:
1. Abra o [Portal Azure](https://portal.azure.com)
2. Navegue para o grupo de recursos (`rg-<env-name>`)
3. Clique no recurso Application Insights (`appi-<unique-id>`)

**Consultas Úteis** (Application Insights → Logs):

**Ver Todas as Requisições**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**Localizar Erros**:
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**Verificar Endpoint Health**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### Auditoria da Base de Dados SQL

**A auditoria da base SQL está ativa** para rastrear:
- Padrões de acesso à base de dados
- Tentativas falhadas de login
- Alterações ao esquema
- Acesso a dados (para conformidade)

**Aceder aos Logs de Auditoria**:
1. Portal Azure → Base de Dados SQL → Auditoria
2. Ver logs no workspace Log Analytics

### Monitorização em Tempo Real

**Ver Métricas em Vivo**:
1. Application Insights → Live Metrics
2. Veja requisições, falhas e desempenho em tempo real

**Configurar Alertas**:
Criar alertas para eventos críticos:
- Erros HTTP 500 > 5 em 5 minutos
- Falhas de ligação à base de dados
- Tempos de resposta elevados (>2 segundos)

**Exemplo de Criação de Alerta**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## Resolução de Problemas
### Problemas Comuns e Soluções

#### 1. `azd provision` falha com "Location not available"

**Sintoma**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Solução**:
Escolha uma região Azure diferente ou registe o fornecedor de recursos:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. Falha de Conexão SQL Durante a Implantação

**Sintoma**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Solução**:
- Verifique se o firewall do SQL Server permite serviços Azure (configurado automaticamente)
- Confirme que a palavra-passe do administrador SQL foi inserida corretamente durante o `azd provision`
- Assegure que o SQL Server está totalmente provisionado (pode demorar 2-3 minutos)

**Verificar Conexão**:
```sh
# No portal do Azure, vá para Base de Dados SQL → Editor de consultas
# Tente ligar-se com as suas credenciais
```

#### 3. A App Web Mostra "Application Error"

**Sintoma**:
O navegador mostra uma página de erro genérica.

**Solução**:
Verifique os logs da aplicação:
```sh
# Ver registos recentes
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Causas comuns**:
- Variáveis de ambiente em falta (verifique App Service → Configuração)
- Falha na instalação do pacote Python (verifique os logs de implantação)
- Erro na inicialização da base de dados (verifique a conectividade SQL)

#### 4. `azd deploy` Falha com "Build Error"

**Sintoma**:
```
Error: Failed to build project
```

**Solução**:
- Certifique-se que o `requirements.txt` não tem erros de sintaxe
- Verifique que o Python 3.11 está especificado em `infra/resources/web-app.bicep`
- Confirme que o Dockerfile tem a imagem base correta

**Depurar localmente**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. "Unauthorized" Ao Executar Comandos AZD

**Sintoma**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**Solução**:
Reautentique-se com Azure:
```sh
azd auth login
az login
```

Verifique se tem as permissões corretas (função Contribuidor) na subscrição.

#### 6. Custos Elevados na Base de Dados

**Sintoma**:
Fatura inesperada do Azure.

**Solução**:
- Verifique se esqueceu de executar `azd down` após os testes
- Confirme que a Base de Dados SQL está a usar o nível Básico (não Premium)
- Reveja os custos em Azure Cost Management
- Configure alertas de custo

### Obter Ajuda

**Ver Todas as Variáveis de Ambiente AZD**:
```sh
azd env get-values
```

**Verificar Estado da Implantação**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**Aceder aos Logs da Aplicação**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**Precisa de Mais Ajuda?**
- [Guia de Resolução de Problemas AZD](../../docs/chapter-07-troubleshooting/common-issues.md)
- [Resolução de Problemas do Azure App Service](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Resolução de Problemas do Azure SQL](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Exercícios Práticos

### Exercício 1: Verificar a Sua Implantação (Iniciante)

**Objetivo**: Confirmar que todos os recursos estão implantados e a aplicação está funcional.

**Passos**:
1. Liste todos os recursos no seu grupo de recursos:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **Esperado**: 6-7 recursos (Web App, SQL Server, Base de Dados SQL, Plano App Service, Application Insights, Log Analytics)

2. Teste todos os endpoints da API:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **Esperado**: Todos retornam JSON válido sem erros

3. Verifique o Application Insights:
   - Navegue até ao Application Insights no Portal Azure
   - Vá a "Live Metrics"
   - Atualize o seu navegador na app web
   **Esperado**: Ver pedidos a aparecerem em tempo real

**Critério de Sucesso**: Existem todos os 6-7 recursos, todos os endpoints retornam dados, Live Metrics mostra atividade.

---

### Exercício 2: Adicionar um Novo Endpoint à API (Intermédio)

**Objetivo**: Estender a aplicação Flask com um novo endpoint.

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

2. Implante a aplicação atualizada:
   ```sh
   azd deploy
   ```

3. Teste o novo endpoint:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Esperado**: Retorna produtos que correspondam a "laptop"

**Critério de Sucesso**: Novo endpoint funciona, retorna resultados filtrados, aparece nos logs do Application Insights.

---

### Exercício 3: Adicionar Monitorização e Alertas (Avançado)

**Objetivo**: Configurar monitorização proativa com alertas.

**Passos**:
1. Crie um alerta para erros HTTP 500:
   ```sh
   # Obter o ID do recurso do Application Insights
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

3. Verifique se o alerta foi disparado:
   - Portal Azure → Alertas → Regras de Alerta
   - Verifique o seu e-mail (se configurado)

**Critério de Sucesso**: Regra de alerta criada, dispara em erros, notificações recebidas.

---

### Exercício 4: Alterações no Esquema da Base de Dados (Avançado)

**Objetivo**: Adicionar uma nova tabela e modificar a aplicação para usá-la.

**Passos**:
1. Conectar à Base de Dados SQL via Editor de Consultas do Portal Azure

2. Criar nova tabela `categories`:
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

3. Atualizar `src/web/app.py` para incluir informação de categoria nas respostas

4. Implantar e testar

**Critério de Sucesso**: Nova tabela existe, produtos mostram informação de categoria, aplicação funciona.

---

### Exercício 5: Implementar Cache (Especialista)

**Objetivo**: Adicionar Azure Redis Cache para melhorar desempenho.

**Passos**:
1. Adicionar Redis Cache em `infra/main.bicep`
2. Atualizar `src/web/app.py` para fazer cache das consultas de produtos
3. Medir melhoria de desempenho com Application Insights
4. Comparar tempos de resposta antes/depois do cache

**Critério de Sucesso**: Redis está implantado, cache funciona, tempos de resposta melhoram >50%.

**Dica**: Comece com a [documentação do Azure Cache for Redis](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Limpeza

Para evitar cobranças contínuas, elimine todos os recursos quando acabar:

```sh
azd down
```

**Pedido de confirmação**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

Digite `y` para confirmar.

**✓ Verificação de Sucesso**: 
- Todos os recursos eliminados do Portal Azure
- Sem cobranças contínuas
- Pasta local `.azure/<env-name>` pode ser eliminada

**Alternativa** (manter infraestrutura, eliminar dados):
```sh
# Eliminar apenas o grupo de recursos (manter a configuração AZD)
az group delete --name rg-<env-name> --yes
```
## Saiba Mais

### Documentação Relacionada
- [Documentação Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Documentação Azure SQL Database](https://learn.microsoft.com/azure/azure-sql/database/)
- [Documentação Azure App Service](https://learn.microsoft.com/azure/app-service/)
- [Documentação Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Referência Linguagem Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Próximos Passos Neste Curso
- **[Exemplo Container Apps](../../../../examples/container-app)**: Implantar microsserviços com Azure Container Apps
- **[Guia de Integração AI](../../../../docs/ai-foundry)**: Adicionar capacidades de IA à sua app
- **[Práticas Recomendadas de Implantação](../../docs/chapter-04-infrastructure/deployment-guide.md)**: Padrões para implantação em produção

### Tópicos Avançados
- **Identidade Gerida**: Remover passwords e usar autenticação Azure AD
- **Endpoints Privados**: Proteger ligações de base de dados dentro da rede virtual
- **Integração CI/CD**: Automatizar implantações com GitHub Actions ou Azure DevOps
- **Ambientes Múltiplos**: Configurar ambientes dev, staging e produção
- **Migrações de Base de Dados**: Usar Alembic ou Entity Framework para versionamento de esquema

### Comparação com Outras Abordagens

**AZD vs. Templates ARM**:
- ✅ AZD: Abstração de nível superior, comandos mais simples
- ⚠️ ARM: Mais detalhado, controlo granular

**AZD vs. Terraform**:
- ✅ AZD: Nativo Azure, integrado com serviços Azure
- ⚠️ Terraform: Suporte multi-cloud, ecossistema maior

**AZD vs. Portal Azure**:
- ✅ AZD: Repetível, controlado por versão, automatizável
- ⚠️ Portal: Cliques manuais, difícil de reproduzir

**Pense no AZD como**: Docker Compose para Azure—configuração simplificada para implantações complexas.

---

## Perguntas Frequentes

**Q: Posso usar outra linguagem de programação?**  
R: Sim! Substitua `src/web/` por Node.js, C#, Go ou qualquer linguagem. Atualize `azure.yaml` e Bicep em conformidade.

**Q: Como adiciono mais bases de dados?**  
R: Adicione outro módulo de Base de Dados SQL em `infra/main.bicep` ou use PostgreSQL/MySQL dos serviços Azure Database.

**Q: Posso usar isto em produção?**  
R: Isto é um ponto de partida. Para produção, acrescente: identidade gerida, endpoints privados, redundância, estratégia de backup, WAF e monitorização reforçada.

**Q: E se quiser usar containers em vez de implantação de código?**  
R: Veja o [Exemplo Container Apps](../../../../examples/container-app) que usa containers Docker ao longo do processo.

**Q: Como me conecto à base de dados a partir da minha máquina local?**  
R: Adicione o seu IP ao firewall do SQL Server:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**Q: Posso usar uma base de dados existente em vez de criar uma nova?**  
R: Sim, modifique `infra/main.bicep` para referenciar um SQL Server existente e atualize os parâmetros da string de conexão.

---

> **Nota:** Este exemplo demonstra práticas recomendadas para implantar uma app web com base de dados usando AZD. Inclui código funcional, documentação abrangente e exercícios práticos para reforçar o aprendizado. Para implantações em produção, revise requisitos de segurança, escalabilidade, conformidade e custos específicos da sua organização.

**📚 Navegação do Curso:**
- ← Anterior: [Exemplo Container Apps](../../../../examples/container-app)
- → Próximo: [Guia de Integração AI](../../../../docs/ai-foundry)
- 🏠 [Início do Curso](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, tenha em atenção que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->