<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7634850a19864a183bc82ab5ac993c8a",
  "translation_date": "2025-09-09T20:09:49+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "pa"
}
-->
# ਸਟਡੀ ਗਾਈਡ - AZD ਸ਼ੁਰੂਆਤੀ ਲਈ

## ਪਰਿਚਯ

ਇਹ ਵਿਸਤ੍ਰਿਤ ਸਟਡੀ ਗਾਈਡ ਤੁਹਾਨੂੰ Azure Developer CLI (azd) ਵਿੱਚ ਮਾਹਰ ਬਣਨ ਵਿੱਚ ਮਦਦ ਕਰਨ ਲਈ ਢਾਂਚੇਬੱਧ ਸਿੱਖਣ ਦੇ ਉਦੇਸ਼, ਮੁੱਖ ਧਾਰਨਾਵਾਂ, ਅਭਿਆਸ ਅਭਿਆਸ ਅਤੇ ਮੁਲਾਂਕਨ ਸਮੱਗਰੀ ਪ੍ਰਦਾਨ ਕਰਦੀ ਹੈ। ਇਸ ਗਾਈਡ ਨੂੰ ਆਪਣੇ ਪ੍ਰਗਤੀ ਨੂੰ ਟ੍ਰੈਕ ਕਰਨ ਅਤੇ ਯਕੀਨੀ ਬਣਾਉਣ ਲਈ ਵਰਤੋ ਕਿ ਤੁਸੀਂ ਸਾਰੇ ਜ਼ਰੂਰੀ ਵਿਸ਼ਿਆਂ ਨੂੰ ਕਵਰ ਕੀਤਾ ਹੈ।

## ਸਿੱਖਣ ਦੇ ਉਦੇਸ਼

ਇਸ ਸਟਡੀ ਗਾਈਡ ਨੂੰ ਪੂਰਾ ਕਰਕੇ, ਤੁਸੀਂ:
- Azure Developer CLI ਦੇ ਮੂਲ ਅਤੇ ਉੱਚ ਪੱਧਰੀ ਧਾਰਨਾਵਾਂ ਵਿੱਚ ਮਾਹਰ ਬਣ ਜਾਓਗੇ
- Azure ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਡਿਪਲੌਇ ਕਰਨ ਅਤੇ ਪ੍ਰਬੰਧਿਤ ਕਰਨ ਵਿੱਚ ਵਿਵਹਾਰਕ ਹੁਨਰ ਵਿਕਸਿਤ ਕਰੋਗੇ
- ਡਿਪਲੌਇਮੈਂਟ ਨੂੰ ਠੀਕ ਕਰਨ ਅਤੇ ਅਨੁਕੂਲਿਤ ਕਰਨ ਵਿੱਚ ਭਰੋਸਾ ਬਣਾਓਗੇ
- ਉਤਪਾਦਨ-ਤਿਆਰ ਡਿਪਲੌਇਮੈਂਟ ਅਭਿਆਸ ਅਤੇ ਸੁਰੱਖਿਆ ਦੇ ਵਿਚਾਰਾਂ ਨੂੰ ਸਮਝੋ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਇਸ ਸਟਡੀ ਗਾਈਡ ਦੇ ਸਾਰੇ ਭਾਗ ਪੂਰੇ ਕਰਨ ਤੋਂ ਬਾਅਦ, ਤੁਸੀਂ:
- azd ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਪੂਰੀ ਐਪਲੀਕੇਸ਼ਨ ਆਰਕੀਟੈਕਚਰ ਡਿਜ਼ਾਈਨ, ਡਿਪਲੌਇ ਅਤੇ ਪ੍ਰਬੰਧਿਤ ਕਰ ਸਕੋਗੇ
- ਵਿਸਤ੍ਰਿਤ ਮਾਨਟਰਿੰਗ, ਸੁਰੱਖਿਆ ਅਤੇ ਲਾਗਤ ਅਨੁਕੂਲਣ ਰਣਨੀਤੀਆਂ ਨੂੰ ਲਾਗੂ ਕਰੋਗੇ
- ਜਟਿਲ ਡਿਪਲੌਇਮੈਂਟ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਖੁਦ ਹੀ ਠੀਕ ਕਰੋਗੇ
- ਕਸਟਮ ਟੈਂਪਲੇਟ ਬਣਾਓ ਅਤੇ azd ਕਮਿਊਨਿਟੀ ਵਿੱਚ ਯੋਗਦਾਨ ਪਾਉ

## ਕੋਰਸ ਦੀ ਬਣਤਰ

### ਮੋਡਿਊਲ 1: ਸ਼ੁਰੂਆਤ ਕਰਨਾ (ਹਫ਼ਤੇ 1-2)

#### ਸਿੱਖਣ ਦੇ ਉਦੇਸ਼
- Azure Developer CLI ਦੇ ਮੂਲ ਅਤੇ ਮੁੱਖ ਧਾਰਨਾਵਾਂ ਨੂੰ ਸਮਝੋ
- ਆਪਣੇ ਵਿਕਾਸ ਵਾਤਾਵਰਣ 'ਤੇ azd ਨੂੰ ਸਫਲਤਾਪੂਰਵਕ ਇੰਸਟਾਲ ਅਤੇ ਕਨਫਿਗਰ ਕਰੋ
- ਮੌਜੂਦਾ ਟੈਂਪਲੇਟ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਆਪਣਾ ਪਹਿਲਾ ਡਿਪਲੌਇਮੈਂਟ ਪੂਰਾ ਕਰੋ
- azd ਪ੍ਰੋਜੈਕਟ ਦੀ ਬਣਤਰ ਨੂੰ ਨੈਵੀਗੇਟ ਕਰੋ ਅਤੇ ਮੁੱਖ ਹਿੱਸਿਆਂ ਨੂੰ ਸਮਝੋ

#### ਮਾਹਰ ਬਣਨ ਲਈ ਮੁੱਖ ਧਾਰਨਾਵਾਂ
- ਟੈਂਪਲੇਟ, ਵਾਤਾਵਰਣ ਅਤੇ ਸੇਵਾਵਾਂ
- azure.yaml ਕਨਫਿਗਰੇਸ਼ਨ ਬਣਤਰ
- azd ਦੇ ਬੁਨਿਆਦੀ ਕਮਾਂਡ (init, up, down, deploy)
- ਕੋਡ ਦੇ ਤੌਰ ਤੇ ਢਾਂਚਾ ਦੇ ਸਿਧਾਂਤ
- Azure ਪ੍ਰਮਾਣਿਕਤਾ ਅਤੇ ਅਧਿਕਾਰ

#### ਅਭਿਆਸ ਅਭਿਆਸ

**ਅਭਿਆਸ 1.1: ਇੰਸਟਾਲੇਸ਼ਨ ਅਤੇ ਸੈਟਅੱਪ**  
```bash
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**ਅਭਿਆਸ 1.2: ਪਹਿਲਾ ਡਿਪਲੌਇਮੈਂਟ**  
```bash
# Deploy a simple web application:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**ਅਭਿਆਸ 1.3: ਪ੍ਰੋਜੈਕਟ ਬਣਤਰ ਵਿਸ਼ਲੇਸ਼ਣ**  
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### ਸਵੈ-ਮੁਲਾਂਕਨ ਪ੍ਰਸ਼ਨ
1. azd ਆਰਕੀਟੈਕਚਰ ਦੇ ਤਿੰਨ ਮੁੱਖ ਧਾਰਨਾਵਾਂ ਕੀ ਹਨ?
2. azure.yaml ਫਾਈਲ ਦਾ ਉਦੇਸ਼ ਕੀ ਹੈ?
3. ਵਾਤਾਵਰਣ ਵੱਖ-ਵੱਖ ਡਿਪਲੌਇਮੈਂਟ ਟਾਰਗਟਾਂ ਨੂੰ ਕਿਵੇਂ ਪ੍ਰਬੰਧਿਤ ਕਰਨ ਵਿੱਚ ਮਦਦ ਕਰਦੇ ਹਨ?
4. azd ਨਾਲ ਕਿਹੜੇ ਪ੍ਰਮਾਣਿਕਤਾ ਤਰੀਕੇ ਵਰਤੇ ਜਾ ਸਕਦੇ ਹਨ?
5. ਜਦੋਂ ਤੁਸੀਂ ਪਹਿਲੀ ਵਾਰ `azd up` ਚਲਾਉਂਦੇ ਹੋ ਤਾਂ ਕੀ ਹੁੰਦਾ ਹੈ?

### ਮੋਡਿਊਲ 2: ਕਨਫਿਗਰੇਸ਼ਨ ਅਤੇ ਵਾਤਾਵਰਣ (ਹਫ਼ਤਾ 3)

#### ਸਿੱਖਣ ਦੇ ਉਦੇਸ਼
- ਵਾਤਾਵਰਣ ਪ੍ਰਬੰਧਨ ਅਤੇ ਕਨਫਿਗਰੇਸ਼ਨ ਵਿੱਚ ਮਾਹਰ ਬਣੋ
- azure.yaml ਦੇ ਉੱਚ ਪੱਧਰੀ ਕਨਫਿਗਰੇਸ਼ਨ ਨੂੰ ਸਮਝੋ
- ਵਾਤਾਵਰਣ-ਵਿਸ਼ੇਸ਼ ਸੈਟਿੰਗਾਂ ਅਤੇ ਵੈਰੀਏਬਲ ਲਾਗੂ ਕਰੋ
- ਵੱਖ-ਵੱਖ ਸਥਿਤੀਆਂ ਲਈ ਪ੍ਰਮਾਣਿਕਤਾ ਕਨਫਿਗਰ ਕਰੋ

#### ਮਾਹਰ ਬਣਨ ਲਈ ਮੁੱਖ ਧਾਰਨਾਵਾਂ
- ਵਾਤਾਵਰਣ ਹਾਇਰਾਰਕੀ ਅਤੇ ਵੈਰੀਏਬਲ ਪ੍ਰੀਸੀਡੈਂਸ
- ਸੇਵਾ ਕਨਫਿਗਰੇਸ਼ਨ ਅਤੇ ਪੈਰਾਮੀਟਰ
- ਹੂਕਸ ਅਤੇ ਲਾਈਫਸਾਈਕਲ ਇਵੈਂਟ
- ਪ੍ਰਮਾਣਿਕਤਾ ਤਰੀਕੇ (ਯੂਜ਼ਰ, ਸੇਵਾ ਪ੍ਰਿੰਸਿਪਲ, ਮੈਨੇਜਡ ਆਈਡੈਂਟਿਟੀ)
- ਕਨਫਿਗਰੇਸ਼ਨ ਫਾਈਲ ਪ੍ਰਬੰਧਨ

#### ਅਭਿਆਸ ਅਭਿਆਸ

**ਅਭਿਆਸ 2.1: ਮਲਟੀ-ਵਾਤਾਵਰਣ ਸੈਟਅੱਪ**  
```bash
# Create and configure multiple environments:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**ਅਭਿਆਸ 2.2: ਉੱਚ ਪੱਧਰੀ ਕਨਫਿਗਰੇਸ਼ਨ**  
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**ਅਭਿਆਸ 2.3: ਸੁਰੱਖਿਆ ਕਨਫਿਗਰੇਸ਼ਨ**  
```bash
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### ਸਵੈ-ਮੁਲਾਂਕਨ ਪ੍ਰਸ਼ਨ
1. azd ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ ਪ੍ਰੀਸੀਡੈਂਸ ਨੂੰ ਕਿਵੇਂ ਸੰਭਾਲਦਾ ਹੈ?
2. ਡਿਪਲੌਇਮੈਂਟ ਹੂਕਸ ਕੀ ਹਨ ਅਤੇ ਤੁਹਾਨੂੰ ਇਹਨਾਂ ਨੂੰ ਕਦੋਂ ਵਰਤਣਾ ਚਾਹੀਦਾ ਹੈ?
3. ਵੱਖ-ਵੱਖ ਵਾਤਾਵਰਣਾਂ ਲਈ ਵੱਖ-ਵੱਖ SKUs ਕਿਵੇਂ ਕਨਫਿਗਰ ਕੀਤੇ ਜਾਂਦੇ ਹਨ?
4. ਵੱਖ-ਵੱਖ ਪ੍ਰਮਾਣਿਕਤਾ ਤਰੀਕਿਆਂ ਦੇ ਸੁਰੱਖਿਆ ਪ੍ਰਭਾਵ ਕੀ ਹਨ?
5. ਗੁਪਤ ਅਤੇ ਸੰਵੇਦਨਸ਼ੀਲ ਕਨਫਿਗਰੇਸ਼ਨ ਡਾਟਾ ਨੂੰ ਕਿਵੇਂ ਪ੍ਰਬੰਧਿਤ ਕੀਤਾ ਜਾਂਦਾ ਹੈ?

### ਮੋਡਿਊਲ 3: ਡਿਪਲੌਇਮੈਂਟ ਅਤੇ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ (ਹਫ਼ਤਾ 4)

#### ਸਿੱਖਣ ਦੇ ਉਦੇਸ਼
- ਡਿਪਲੌਇਮੈਂਟ ਵਰਕਫਲੋ ਅਤੇ ਸ੍ਰੇਸ਼ਠ ਅਭਿਆਸਾਂ ਵਿੱਚ ਮਾਹਰ ਬਣੋ
- Bicep ਟੈਂਪਲੇਟਾਂ ਨਾਲ ਕੋਡ ਦੇ ਤੌਰ ਤੇ ਢਾਂਚਾ ਨੂੰ ਸਮਝੋ
- ਜਟਿਲ ਮਲਟੀ-ਸੇਵਾ ਆਰਕੀਟੈਕਚਰ ਲਾਗੂ ਕਰੋ
- ਡਿਪਲੌਇਮੈਂਟ ਦੇ ਪ੍ਰਦਰਸ਼ਨ ਅਤੇ ਭਰੋਸੇਮੰਦਤਾ ਨੂੰ ਅਨੁਕੂਲਿਤ ਕਰੋ

#### ਮਾਹਰ ਬਣਨ ਲਈ ਮੁੱਖ ਧਾਰਨਾਵਾਂ
- Bicep ਟੈਂਪਲੇਟ ਬਣਤਰ ਅਤੇ ਮੋਡੀਊਲ
- ਸਰੋਤ ਨਿਰਭਰਤਾਵਾਂ ਅਤੇ ਕ੍ਰਮ
- ਡਿਪਲੌਇਮੈਂਟ ਰਣਨੀਤੀਆਂ (ਬਲੂ-ਗ੍ਰੀਨ, ਰੋਲਿੰਗ ਅਪਡੇਟ)
- ਮਲਟੀ-ਰੀਜਨ ਡਿਪਲੌਇਮੈਂਟ
- ਡਾਟਾਬੇਸ ਮਾਈਗ੍ਰੇਸ਼ਨ ਅਤੇ ਡਾਟਾ ਪ੍ਰਬੰਧਨ

#### ਅਭਿਆਸ ਅਭਿਆਸ

**ਅਭਿਆਸ 3.1: ਕਸਟਮ ਢਾਂਚਾ**  
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**ਅਭਿਆਸ 3.2: ਮਲਟੀ-ਸੇਵਾ ਐਪਲੀਕੇਸ਼ਨ**  
```bash
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**ਅਭਿਆਸ 3.3: ਡਾਟਾਬੇਸ ਇੰਟੀਗ੍ਰੇਸ਼ਨ**  
```bash
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### ਸਵੈ-ਮੁਲਾਂਕਨ ਪ੍ਰਸ਼ਨ
1. ARM ਟੈਂਪਲੇਟਾਂ ਦੇ ਮੁਕਾਬਲੇ Bicep ਦੀ ਵਰਤੋਂ ਦੇ ਫਾਇਦੇ ਕੀ ਹਨ?
2. azd ਡਿਪਲੌਇਮੈਂਟ ਵਿੱਚ ਡਾਟਾਬੇਸ ਮਾਈਗ੍ਰੇਸ਼ਨ ਨੂੰ ਕਿਵੇਂ ਸੰਭਾਲਿਆ ਜਾਂਦਾ ਹੈ?
3. ਜ਼ੀਰੋ-ਡਾਊਨਟਾਈਮ ਡਿਪਲੌਇਮੈਂਟ ਲਈ ਕਿਹੜੀਆਂ ਰਣਨੀਤੀਆਂ ਹਨ?
4. ਸੇਵਾਵਾਂ ਦੇ ਵਿਚਕਾਰ ਨਿਰਭਰਤਾਵਾਂ ਕਿਵੇਂ ਪ੍ਰਬੰਧਿਤ ਕੀਤੀਆਂ ਜਾਂਦੀਆਂ ਹਨ?
5. ਮਲਟੀ-ਰੀਜਨ ਡਿਪਲੌਇਮੈਂਟ ਲਈ ਕਿਹੜੇ ਵਿਚਾਰ ਹਨ?

### ਮੋਡਿਊਲ 4: ਡਿਪਲੌਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ ਵੈਧਤਾ (ਹਫ਼ਤਾ 5)

#### ਸਿੱਖਣ ਦੇ ਉਦੇਸ਼
- ਵਿਸਤ੍ਰਿਤ ਡਿਪਲੌਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ ਚੈੱਕ ਲਾਗੂ ਕਰੋ
- ਸਮਰੱਥਾ ਯੋਜਨਾ ਅਤੇ ਸਰੋਤ ਵੈਧਤਾ ਵਿੱਚ ਮਾਹਰ ਬਣੋ
- SKU ਚੋਣ ਅਤੇ ਲਾਗਤ ਅਨੁਕੂਲਤਾ ਨੂੰ ਸਮਝੋ
- ਆਟੋਮੈਟਿਕ ਵੈਧਤਾ ਪਾਈਪਲਾਈਨ ਬਣਾਓ

#### ਮਾਹਰ ਬਣਨ ਲਈ ਮੁੱਖ ਧਾਰਨਾਵਾਂ
- Azure ਸਰੋਤ ਕੋਟਾ ਅਤੇ ਸੀਮਾਵਾਂ
- SKU ਚੋਣ ਮਾਪਦੰਡ ਅਤੇ ਲਾਗਤ ਪ੍ਰਭਾਵ
- ਆਟੋਮੈਟਿਕ ਵੈਧਤਾ ਸਕ੍ਰਿਪਟ ਅਤੇ ਟੂਲ
- ਸਮਰੱਥਾ ਯੋਜਨਾ ਵਿਧੀਆਂ
- ਪ੍ਰਦਰਸ਼ਨ ਟੈਸਟਿੰਗ ਅਤੇ ਅਨੁਕੂਲਤਾ

#### ਅਭਿਆਸ ਅਭਿਆਸ

**ਅਭਿਆਸ 4.1: ਸਮਰੱਥਾ ਯੋਜਨਾ**  
```bash
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**ਅਭਿਆਸ 4.2: ਪ੍ਰੀ-ਫਲਾਈਟ ਵੈਧਤਾ**  
```powershell
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**ਅਭਿਆਸ 4.3: SKU ਅਨੁਕੂਲਤਾ**  
```bash
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### ਸਵੈ-ਮੁਲਾਂਕਨ ਪ੍ਰਸ਼ਨ
1. SKU ਚੋਣ ਦੇ ਫੈਸਲੇ ਕਿਹੜੇ ਕਾਰਕਾਂ ਨੂੰ ਪ੍ਰਭਾਵਿਤ ਕਰਨ ਚਾਹੀਦੇ ਹਨ?
2. ਡਿਪਲੌਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ Azure ਸਰੋਤ ਉਪਲਬਧਤਾ ਨੂੰ ਕਿਵੇਂ ਵੈਧ ਕੀਤਾ ਜਾਂਦਾ ਹੈ?
3. ਪ੍ਰੀ-ਫਲਾਈਟ ਚੈੱਕ ਸਿਸਟਮ ਦੇ ਮੁੱਖ ਹਿੱਸੇ ਕੀ ਹਨ?
4. ਡਿਪਲੌਇਮੈਂਟ ਦੀ ਲਾਗਤ ਦਾ ਅੰਦਾਜ਼ਾ ਅਤੇ ਨਿਯੰਤਰਣ ਕਿਵੇਂ ਕੀਤਾ ਜਾਂਦਾ ਹੈ?
5. ਸਮਰੱਥਾ ਯੋਜਨਾ ਲਈ ਕਿਹੜੀ ਮਾਨਟਰਿੰਗ ਜ਼ਰੂਰੀ ਹੈ?

### ਮੋਡਿਊਲ 5: ਸਮੱਸਿਆ ਹੱਲ ਅਤੇ ਡਿਬੱਗਿੰਗ (ਹਫ਼ਤਾ 6)

#### ਸਿੱਖਣ ਦੇ ਉਦੇਸ਼
- ਵਿਵਸਥਿਤ ਸਮੱਸਿਆ ਹੱਲ ਵਿਧੀਆਂ ਵਿੱਚ ਮਾਹਰ ਬਣੋ
- ਜਟਿਲ ਡਿਪਲੌਇਮੈਂਟ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਡਿਬੱਗ ਕਰਨ ਵਿੱਚ ਨਿਪੁਣਤਾ ਵਿਕਸਿਤ ਕਰੋ
- ਵਿਸਤ੍ਰਿਤ ਮਾਨਟਰਿੰਗ ਅਤੇ ਚੇਤਾਵਨੀ ਲਾਗੂ ਕਰੋ
- ਘਟਨਾ ਪ੍ਰਤੀਕ੍ਰਿਆ ਅਤੇ ਬਹਾਲੀ ਪ੍ਰਕਿਰਿਆਵਾਂ ਬਣਾਓ

#### ਮਾਹਰ ਬਣਨ ਲਈ ਮੁੱਖ ਧਾਰਨਾਵਾਂ
- ਆਮ ਡਿਪਲੌਇਮੈਂਟ ਅਸਫਲਤਾ ਪੈਟਰਨ
- ਲੌਗ ਵਿਸ਼ਲੇਸ਼ਣ ਅਤੇ ਸੰਬੰਧ ਤਕਨੀਕਾਂ
- ਪ੍ਰਦਰਸ਼ਨ ਮਾਨਟਰਿੰਗ ਅਤੇ ਅਨੁਕੂਲਤਾ
- ਸੁਰੱਖਿਆ ਘਟਨਾ ਪਤਾ ਲਗਾਉਣ ਅਤੇ ਪ੍ਰਤੀਕ੍ਰਿਆ
- ਆਫ਼ਤ ਬਹਾਲੀ ਅਤੇ ਕਾਰੋਬਾਰੀ ਸਤਤਤਾ

#### ਅਭਿਆਸ ਅਭਿਆਸ

**ਅਭਿਆਸ 5.1: ਸਮੱਸਿਆ ਹੱਲ ਸਥਿਤੀਆਂ**  
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**ਅਭਿਆਸ 5.2: ਮਾਨਟਰਿੰਗ ਲਾਗੂ ਕਰਨਾ**  
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**ਅਭਿਆਸ 5.3: ਘਟਨਾ ਪ੍ਰਤੀਕ੍ਰਿਆ**  
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### ਸਵੈ-ਮੁਲਾਂਕਨ ਪ੍ਰਸ਼ਨ
1. azd ਡਿਪਲੌਇਮੈਂਟਾਂ ਨੂੰ ਠੀਕ ਕਰਨ ਲਈ ਵਿਵਸਥਿਤ ਪਹੁੰਚ ਕੀ ਹੈ?
2. ਕਈ ਸੇਵਾਵਾਂ ਅਤੇ ਸਰੋਤਾਂ ਵਿੱਚ ਲੌਗਸ ਨੂੰ ਕਿਵੇਂ ਸੰਬੰਧਿਤ ਕੀਤਾ ਜਾਂਦਾ ਹੈ?
3. ਸ਼ੁਰੂਆਤੀ ਸਮੱਸਿਆ ਪਤਾ ਲਗਾਉਣ ਲਈ ਸਭ ਤੋਂ ਮਹੱਤਵਪੂਰਨ ਮਾਨਟਰਿੰਗ ਮੈਟ੍ਰਿਕਸ ਕੀ ਹਨ?
4. ਪ੍ਰਭਾਵੀ ਆਫ਼ਤ ਬਹਾਲੀ ਪ੍ਰਕਿਰਿਆਵਾਂ ਨੂੰ ਕਿਵੇਂ ਲਾਗੂ ਕੀਤਾ ਜਾਂਦਾ ਹੈ?
5. ਘਟਨਾ ਪ੍ਰਤੀਕ੍ਰਿਆ ਯੋਜਨਾ ਦੇ ਮੁੱਖ ਹਿੱਸੇ ਕੀ ਹਨ?

### ਮੋਡਿਊਲ 6: ਉੱਚ ਪੱਧਰੀ ਵਿਸ਼ੇ ਅਤੇ ਸ੍ਰੇਸ਼ਠ ਅਭਿਆਸ (ਹਫ਼ਤੇ 7-8)

#### ਸਿੱਖਣ ਦੇ ਉਦੇਸ਼
- ਐਨਟਰਪ੍ਰਾਈਜ਼-ਗਰੇਡ ਡਿਪਲੌਇਮੈਂਟ ਪੈਟਰਨ ਲਾਗੂ ਕਰੋ
- CI/CD ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਅਤੇ ਆਟੋਮੈਸ਼ਨ ਵਿੱਚ ਮਾਹਰ ਬਣੋ
- ਕਸਟਮ ਟੈਂਪਲੇਟ ਵਿਕਸਿਤ ਕਰੋ ਅਤੇ ਕਮਿਊਨਿਟੀ ਵਿੱਚ ਯੋਗਦਾਨ ਪਾਉ
- ਉੱਚ ਪੱਧਰੀ ਸੁਰੱਖਿਆ ਅਤੇ ਅਨੁਕੂਲਤਾ ਦੀਆਂ ਜ਼ਰੂਰਤਾਂ ਨੂੰ ਸਮਝੋ

#### ਮਾਹਰ ਬਣਨ ਲਈ ਮੁੱਖ ਧਾਰਨਾਵਾਂ
- CI/CD ਪਾਈਪਲਾਈਨ ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਪੈਟਰਨ
- ਕਸਟਮ ਟੈਂਪਲੇਟ ਵਿਕਾਸ ਅਤੇ ਵੰਡ
- ਐਨਟਰਪ੍ਰਾਈਜ਼ ਗਵਰਨੈਂਸ ਅਤੇ ਅਨੁਕੂਲਤਾ
- ਉੱਚ ਪੱਧਰੀ ਨੈਟਵਰਕਿੰਗ ਅਤੇ ਸੁਰੱਖਿਆ ਕਨਫਿਗਰੇਸ਼ਨ
- ਪ੍ਰਦਰਸ਼ਨ ਅਨੁਕੂਲਤਾ ਅਤੇ ਲਾਗਤ ਪ੍ਰਬੰਧਨ

#### ਅਭਿਆਸ ਅਭਿਆਸ

**ਅਭਿਆਸ 6.1: CI/CD ਇੰਟੀਗ੍ਰੇਸ਼ਨ**  
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**ਅਭਿਆਸ 6.2: ਕਸਟਮ ਟੈਂਪਲੇਟ ਵਿਕਾਸ**  
```bash
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**ਅਭਿਆਸ 6.3: ਐਨਟਰਪ੍ਰਾਈਜ਼ ਲਾਗੂ ਕਰਨਾ**  
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### ਸਵੈ-ਮੁਲਾਂਕਨ ਪ੍ਰਸ਼ਨ
1. azd ਨੂੰ ਮੌਜੂਦਾ CI/CD ਵਰਕਫਲੋਜ਼ ਵਿੱਚ ਕਿਵੇਂ ਸ਼ਾਮਲ ਕੀਤਾ ਜਾਂਦਾ ਹੈ?
2. ਕਸਟਮ ਟੈਂਪਲੇਟ ਵਿਕਾਸ ਲਈ ਮੁੱਖ ਵਿਚਾਰ ਕੀ ਹਨ?
3. azd ਡਿਪਲੌਇਮੈਂਟਾਂ ਵਿੱਚ ਗਵਰਨੈਂਸ ਅਤੇ ਅਨੁਕੂਲਤਾ ਨੂੰ ਕਿਵੇਂ ਲਾਗੂ ਕੀਤਾ ਜਾਂਦਾ ਹੈ?
4. ਐਨਟਰਪ੍ਰਾਈਜ਼-ਪੱਧਰੀ ਡਿਪਲੌਇਮੈਂਟ ਲਈ ਸ੍ਰੇਸ਼ਠ ਅਭਿਆਸ ਕੀ ਹਨ?
5. azd ਕਮਿਊਨਿਟੀ ਵਿੱਚ ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਤਰੀਕੇ ਨਾਲ ਕਿਵੇਂ ਯੋਗਦਾਨ ਪਾਇਆ ਜਾਂਦਾ ਹੈ?

## ਵਿਵਹਾਰਕ ਪ੍ਰੋਜੈਕਟ

### ਪ੍ਰੋਜੈਕਟ 1: ਪੈਰਸਨਲ ਪੋਰਟਫੋਲਿਓ ਵੈਬਸਾਈਟ  
**ਜਟਿਲਤਾ**: ਸ਼ੁਰੂਆਤੀ  
**ਅੰਧਾਜ਼ਾ**: 1-2 ਹਫ਼ਤੇ  

ਇਹ ਪ੍ਰੋਜੈਕਟ ਸ਼ੁਰੂਆਤੀ ਸਿਖਣ ਵਾਲਿਆਂ ਲਈ ਹੈ। Azure Storage 'ਤੇ ਸਟੈਟਿਕ ਵੈਬਸਾਈਟ ਹੋਸਟਿੰਗ, ਕਸਟਮ ਡੋਮੇਨ ਕਨਫਿਗਰੇਸ਼ਨ, CDN ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਅਤੇ ਆਟੋਮੈਟਿਕ ਡਿਪਲੌਇਮੈਂਟ ਪਾਈਪਲਾਈਨ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਆਪਣਾ ਪੋਰਟਫੋਲਿਓ ਬਣਾਓ।  

**ਡਿਲੀਵਰੇਬਲਜ਼**:  
- Azure 'ਤੇ ਕੰਮ ਕਰਨ ਵਾਲੀ ਵੈਬਸਾਈਟ  
- ਪੋਰਟਫੋਲਿਓ ਡਿਪਲੌਇਮੈਂਟ ਲਈ ਕਸਟਮ azd ਟੈਂਪਲੇਟ  
- ਡਿਪਲੌਇਮੈਂਟ ਪ੍ਰਕਿਰਿਆ ਦੀ ਦਸਤਾਵੇਜ਼ੀ  
- ਲਾਗਤ ਵਿਸ਼ਲੇਸ਼ਣ ਅਤੇ ਅਨੁਕੂਲਤਾ ਦੀਆਂ ਸਿਫਾਰਸ਼ਾਂ  

### ਪ੍ਰੋਜੈਕਟ 2: ਟਾਸਕ ਮੈਨੇਜਮੈਂਟ ਐਪਲੀਕੇਸ਼ਨ  
**ਜਟਿਲਤਾ**: ਮੱਧਮ  
**ਅੰਧਾਜ਼ਾ**: 2-3 ਹਫ਼
3. **ਓਪਨ ਸੋਰਸ ਵਿੱਚ ਯੋਗਦਾਨ ਪਾਓ**: ਆਪਣੇ ਟੈਂਪਲੇਟ ਅਤੇ ਹੱਲਾਂ ਨੂੰ ਕਮਿਊਨਿਟੀ ਨਾਲ ਸਾਂਝਾ ਕਰੋ  
4. **ਦੂਜਿਆਂ ਨੂੰ ਸਿਖਾਓ**: ਦੂਜਿਆਂ ਨੂੰ ਧਾਰਨਾਵਾਂ ਸਮਝਾਉਣ ਨਾਲ ਤੁਹਾਡੀ ਆਪਣੀ ਸਮਝ ਮਜ਼ਬੂਤ ਹੁੰਦੀ ਹੈ  
5. **ਜਿਗਿਆਸੂ ਰਹੋ**: ਨਿਰੰਤਰ ਨਵੇਂ Azure ਸੇਵਾਵਾਂ ਅਤੇ ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਪੈਟਰਨ ਦੀ ਖੋਜ ਕਰੋ  

---

**ਨੈਵੀਗੇਸ਼ਨ**  
- **ਪਿਛਲਾ ਪਾਠ**: [FAQ](faq.md)  
- **ਅਗਲਾ ਪਾਠ**: [Changelog](../changelog.md)  

**ਅਧਿਐਨ ਪ੍ਰਗਤੀ ਟ੍ਰੈਕਿੰਗ**: ਇਸ ਗਾਈਡ ਦੀ ਵਰਤੋਂ ਕਰੋ ਆਪਣੀ ਸਿੱਖਣ ਦੀ ਯਾਤਰਾ ਨੂੰ ਟ੍ਰੈਕ ਕਰਨ ਲਈ ਅਤੇ Azure Developer CLI ਦੀਆਂ ਸਾਰੀਆਂ ਧਾਰਨਾਵਾਂ ਅਤੇ ਅਭਿਆਸਾਂ ਨੂੰ ਪੂਰੀ ਤਰ੍ਹਾਂ ਕਵਰ ਕਰਨ ਲਈ।  

---

**ਅਸਵੀਕਾਰਨਾ**:  
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀ ਹੋਣ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਦਿਓ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸੁਣੀਕਤਾਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਇਸਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਤ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੇ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆ ਲਈ ਅਸੀਂ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।